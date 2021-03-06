local _, ns = ...
local M, R, U, I = unpack(ns)

local oUF = ns.oUF or oUF
local UF = M:RegisterModule("UnitFrames")

local format, floor = string.format, math.floor
local pairs, next = pairs, next

-- Custom colors
oUF.colors.smooth = {1, 0, 0, .85, .8, .45, .1, .1, .1}
oUF.colors.power.MANA = {0, .4, 1}
oUF.colors.power.SOUL_SHARDS = {.58, .51, .79}
oUF.colors.power.HOLY_POWER = {.88, .88, .06}
oUF.colors.power.CHI = {0, 1, .59}
oUF.colors.power.ARCANE_CHARGES = {.41, .8, .94}

-- Various values
local function retVal(self, val1, val2, val3, val4, val5)
	local mystyle = self.mystyle
	if mystyle == "player" or mystyle == "target" then
		return val1
	elseif mystyle == "focus" then
		return val2
	elseif mystyle == "boss" or mystyle == "arena" then
		return val3
	else
		if mystyle == "nameplate" and val5 then
			return val5
		else
			return val4
		end
	end
end

-- Elements
function UF:CreateHeader(self)
	local hl = self:CreateTexture(nil, "OVERLAY")
	hl:SetAllPoints()
	hl:SetTexture("Interface\\PETBATTLES\\PetBattle-SelectedPetGlow")
	hl:SetTexCoord(0, 1, .5, 1)
	hl:SetVertexColor(.6, .6, .6)
	hl:SetBlendMode("ADD")
	hl:Hide()
	self.Highlight = hl

	self:RegisterForClicks("AnyUp")
	self:HookScript("OnEnter", function()
		UnitFrame_OnEnter(self)
		self.Highlight:Show()
	end)
	self:HookScript("OnLeave", function()
		UnitFrame_OnLeave(self)
		self.Highlight:Hide()
	end)
end

function UF:CreateHealthBar(self)
	local mystyle = self.mystyle
	local health = CreateFrame("StatusBar", nil, self)
	health:SetPoint("TOPLEFT", self)
	health:SetPoint("TOPRIGHT", self)
	local healthHeight
	if mystyle == "PlayerPlate" then
		healthHeight = MaoRUIPerDB["Nameplate"]["PPHealthHeight"]
	elseif mystyle == "raid" then
		if self.isPartyFrame then
			healthHeight = MaoRUIPerDB["UFs"]["PartyHeight"]
		elseif self.isPartyPet then
			healthHeight = MaoRUIPerDB["UFs"]["PartyPetHeight"]
		elseif MaoRUIPerDB["UFs"]["SimpleMode"] then
			local scale = MaoRUIPerDB["UFs"]["SimpleRaidScale"]/10
			healthHeight = 20*scale - 2*scale - R.mult
		else
			healthHeight = MaoRUIPerDB["UFs"]["RaidHeight"]
		end
	else
		healthHeight = retVal(self, MaoRUIPerDB["UFs"]["PlayerHeight"], MaoRUIPerDB["UFs"]["FocusHeight"], MaoRUIPerDB["UFs"]["BossHeight"], MaoRUIPerDB["UFs"]["PetHeight"])
	end
	health:SetHeight(healthHeight)
	health:SetStatusBarTexture(I.normTex)
	health:SetStatusBarColor(.1, .1, .1)
	health:SetFrameLevel(self:GetFrameLevel() - 2)
	health.backdrop = M.CreateBDFrame(health, 0, true) -- don't mess up with libs
	health.shadow = health.backdrop.Shadow
	M:SmoothBar(health)

	local bg = health:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetTexture(I.bdTex)
	bg:SetVertexColor(.6, .6, .6)
	bg.multiplier = .25

	if mystyle == "PlayerPlate" then
		health.colorHealth = true
	elseif (mystyle == "raid" and MaoRUIPerDB["UFs"]["RaidHealthColor"] == 2) or (mystyle ~= "raid" and MaoRUIPerDB["UFs"]["HealthColor"] == 2) then
		health.colorClass = true
		health.colorTapping = true
		health.colorReaction = true
		health.colorDisconnected = true
		health.colorHappiness = I.MyClass == "HUNTER"
	elseif (mystyle == "raid" and MaoRUIPerDB["UFs"]["RaidHealthColor"] == 3) or (mystyle ~= "raid" and MaoRUIPerDB["UFs"]["HealthColor"] == 3) then
		health.colorSmooth = true
	end
	health.frequentUpdates = true

	self.Health = health
	self.Health.bg = bg
end

function UF:UpdateRaidHealthMethod()
	for _, frame in pairs(oUF.objects) do
		if frame.mystyle == "raid" then
			frame:SetHealthUpdateMethod(MaoRUIPerDB["UFs"]["FrequentHealth"])
			frame:SetHealthUpdateSpeed(MaoRUIPerDB["UFs"]["HealthFrequency"])
			frame.Health:ForceUpdate()
		end
	end
end

function UF:CreateHealthText(self)
	local mystyle = self.mystyle
	local textFrame = CreateFrame("Frame", nil, self)
	textFrame:SetAllPoints(self.Health)

	local name = M.CreateFS(textFrame, retVal(self, 13, 12, 12, 12, MaoRUIPerDB["Nameplate"]["NameTextSize"]), "", false, "LEFT", 3, 0)
	name:SetJustifyH("LEFT")
	if mystyle == "raid" then
		name:SetWidth(self:GetWidth()*.95)
		name:ClearAllPoints()
		if self.isPartyPet then
			name:SetWidth(self:GetWidth()*.55)
			name:SetPoint("LEFT", 3, -1)
		elseif MaoRUIPerDB["UFs"]["SimpleMode"] and not self.isPartyFrame then
			name:SetPoint("LEFT", 4, 0)
		elseif MaoRUIPerDB["UFs"]["RaidBuffIndicator"] then
			name:SetJustifyH("CENTER")
			if MaoRUIPerDB["UFs"]["RaidHPMode"] ~= 1 then
				name:SetPoint("TOP", 0, -3)
			else
				name:SetPoint("CENTER")
			end
		else
			name:SetPoint("TOPLEFT", 2, -2)
		end
		name:SetScale(MaoRUIPerDB["UFs"]["RaidTextScale"])
	elseif mystyle == "nameplate" then
		name:SetWidth(self:GetWidth()*.85)
		name:ClearAllPoints()
		name:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 3, 6)
	else
		name:SetWidth(self:GetWidth()*.55)
	end

	if mystyle == "focus" then
		self:Tag(name, "[color][name][afkdnd]")
	elseif mystyle == "nameplate" then
		self:Tag(name, "[nplevel][name]")
	elseif mystyle == "arena" then
		self:Tag(name, "[arenaspec] [color][name]")
	elseif mystyle == "raid" and MaoRUIPerDB["UFs"]["SimpleMode"] and MaoRUIPerDB["UFs"]["ShowTeamIndex"] and not self.isPartyPet and not self.isPartyFrame then
		self:Tag(name, "[group].[nplevel][color][name]")
	else
		self:Tag(name, "[nplevel][color][name]")
	end

	local hpval = M.CreateFS(textFrame, retVal(self, 14, 13, 13, 13, MaoRUIPerDB["Nameplate"]["HealthTextSize"]), "", false, "RIGHT", -3, 0)
	if mystyle == "raid" then
		self:Tag(hpval, "[raidhp]")
		if self.isPartyPet then
			hpval:SetPoint("RIGHT", -3, -1)
			self:Tag(hpval, "[hp]")
		elseif MaoRUIPerDB["UFs"]["SimpleMode"] and not self.isPartyFrame then
			hpval:SetPoint("RIGHT", -4, 0)
		elseif MaoRUIPerDB["UFs"]["RaidBuffIndicator"] then
			hpval:ClearAllPoints()
			hpval:SetPoint("BOTTOM", 0, 1)
			hpval:SetJustifyH("CENTER")
		else
			hpval:SetPoint("RIGHT", -3, -7)
		end
		hpval:SetScale(MaoRUIPerDB["UFs"]["RaidTextScale"])
	elseif mystyle == "nameplate" then
		hpval:SetPoint("RIGHT", self, 0, 8)
		self:Tag(hpval, "[nphp]")
	else
		self:Tag(hpval, "[hp]")
	end

	self.nameText = name
	self.healthValue = hpval
end

function UF:UpdateRaidNameText()
	for _, frame in pairs(oUF.objects) do
		if frame.mystyle == "raid" and not frame.isPartyPet then
			local name = frame.nameText
			name:ClearAllPoints()
			if MaoRUIPerDB["UFs"]["SimpleMode"] and not frame.isPartyFrame then
				name:SetPoint("LEFT", 4, 0)
			elseif MaoRUIPerDB["UFs"]["RaidBuffIndicator"] then
				name:SetJustifyH("CENTER")
				if MaoRUIPerDB["UFs"]["RaidHPMode"] ~= 1 then
					name:SetPoint("TOP", 0, -3)
				else
					name:SetPoint("CENTER")
				end
			else
				name:SetPoint("TOPLEFT", 2, -2)
			end
			frame.healthValue:UpdateTag()
		end
	end
end

local frequentUpdateCheck = {
	["player"] = true,
	["target"] = true,
	["focus"] = true,
	["PlayerPlate"] = true,
}
function UF:CreatePowerBar(self)
	local mystyle = self.mystyle
	local power = CreateFrame("StatusBar", nil, self)
	power:SetStatusBarTexture(I.normTex)
	power:SetPoint("BOTTOMLEFT", self)
	power:SetPoint("BOTTOMRIGHT", self)
	local powerHeight
	if mystyle == "PlayerPlate" then
		powerHeight = MaoRUIPerDB["Nameplate"]["PPPowerHeight"]
	elseif mystyle == "raid" then
		if self.isPartyFrame then
			powerHeight = MaoRUIPerDB["UFs"]["PartyPowerHeight"]
		elseif self.isPartyPet then
			powerHeight = MaoRUIPerDB["UFs"]["PartyPetPowerHeight"]
		elseif MaoRUIPerDB["UFs"]["SimpleMode"] then
			powerHeight = 2*MaoRUIPerDB["UFs"]["SimpleRaidScale"]/10
		else
			powerHeight = MaoRUIPerDB["UFs"]["RaidPowerHeight"]
		end
	else
		powerHeight = retVal(self, MaoRUIPerDB["UFs"]["PlayerPowerHeight"], MaoRUIPerDB["UFs"]["FocusPowerHeight"], MaoRUIPerDB["UFs"]["BossPowerHeight"], MaoRUIPerDB["UFs"]["PetPowerHeight"])
	end
	power:SetHeight(powerHeight)
	power:SetFrameLevel(self:GetFrameLevel() - 2)
	power.backdrop = M.CreateBDFrame(power, 0)
	M:SmoothBar(power)

	if self.Health.shadow then
		self.Health.shadow:SetPoint("BOTTOMRIGHT", power.backdrop, R.mult+3, -R.mult-3)
	end

	local bg = power:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetTexture(I.normTex)
	bg.multiplier = .25

	if (mystyle == "raid" and MaoRUIPerDB["UFs"]["RaidHealthColor"] == 2) or (mystyle ~= "raid" and MaoRUIPerDB["UFs"]["HealthColor"] == 2) or mystyle == "PlayerPlate" then
		power.colorPower = true
	else
		power.colorClass = true
		power.colorTapping = true
		power.colorDisconnected = true
		power.colorReaction = true
		power.colorHappiness = I.MyClass == "HUNTER"
	end
	power.frequentUpdates = frequentUpdateCheck[mystyle]

	self.Power = power
	self.Power.bg = bg
end

function UF:CreatePowerText(self)
	local textFrame = CreateFrame("Frame", nil, self)
	textFrame:SetAllPoints(self.Power)

	local ppval = M.CreateFS(textFrame, retVal(self, 13, 12, 12, 12), "", false, "RIGHT", -3, 2)
	if self.mystyle == "raid" then
		ppval:SetScale(MaoRUIPerDB["UFs"]["RaidTextScale"])
	end
	self:Tag(ppval, "[color][power]")
	self.powerText = ppval
end

local textScaleFrames = {
	["player"] = true,
	["target"] = true,
	["pet"] = true,
}
function UF:UpdateTextScale()
	local scale = MaoRUIPerDB["UFs"]["UFTextScale"]
	for _, frame in pairs(oUF.objects) do
		local style = frame.mystyle
		if style and textScaleFrames[style] then
			--frame.nameText:SetScale(scale)
			--frame.healthValue:SetScale(scale)
			if frame.powerText then frame.powerText:SetScale(scale) end
		end
	end
end

function UF:UpdateRaidTextScale()
	local scale = MaoRUIPerDB["UFs"]["RaidTextScale"]
	for _, frame in pairs(oUF.objects) do
		if frame.mystyle == "raid" then
			frame.nameText:SetScale(scale)
			frame.healthValue:SetScale(scale)
			if frame.powerText then frame.powerText:SetScale(scale) end
		end
	end
end

function UF:CreatePortrait(self)
	if not MaoRUIPerDB["UFs"]["Portrait"] then return end

	local portrait = CreateFrame("PlayerModel", nil, self.Health)
	portrait:SetAllPoints()
	portrait:SetAlpha(.2)
	self.Portrait = portrait

	self.Health.bg:ClearAllPoints()
	self.Health.bg:SetPoint("BOTTOMLEFT", self.Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
	self.Health.bg:SetPoint("TOPRIGHT", self.Health)
	self.Health.bg:SetParent(self)
end

function UF:CreateIcons(self)
	local mystyle = self.mystyle

	local parentFrame = CreateFrame("Frame", nil, self)
	parentFrame:SetAllPoints()
	parentFrame:SetFrameLevel(5)
	local phase = parentFrame:CreateTexture(nil, "OVERLAY")
	phase:SetPoint("CENTER", self.Health)
	phase:SetSize(24, 24)
	self.PhaseIndicator = phase

	local li = self:CreateTexture(nil, "OVERLAY")
	li:SetPoint("TOPLEFT", self, 0, 8)
	li:SetSize(12, 12)
	self.LeaderIndicator = li

	local ai = self:CreateTexture(nil, "OVERLAY")
	ai:SetPoint("TOPLEFT", self, 0, 8)
	ai:SetSize(12, 12)
	self.AssistantIndicator = ai

	local ml = self:CreateTexture(nil, "OVERLAY")
	ml:SetPoint("LEFT", li, "RIGHT")
	ml:SetSize(12, 12)
	self.MasterLooterIndicator = ml
end

function UF:CreateRaidMark(self)
	local mystyle = self.mystyle
	local ri = self:CreateTexture(nil, "OVERLAY")
	if mystyle == "raid" then
		ri:SetPoint("TOP", self, 0, 10)
	elseif mystyle == "nameplate" then
		ri:SetPoint("RIGHT", self, "LEFT", -3, 3)
		ri:SetParent(self.Health)
	else
		ri:SetPoint("TOPRIGHT", self, "TOPRIGHT", -30, 10)
	end
	local size = retVal(self, 14, 13, 12, 12, 32)
	ri:SetSize(size, size)
	self.RaidTargetIndicator = ri
end

local function createBarMover(bar, text, value, anchor)
	local mover = M.Mover(bar, text, value, anchor, bar:GetHeight()+bar:GetWidth()+5, bar:GetHeight()+5)
	bar:ClearAllPoints()
	bar:SetPoint("RIGHT", mover)
	bar.mover = mover
end

function UF:CreateCastBar(self)
	local mystyle = self.mystyle
	if mystyle ~= "nameplate" and not MaoRUIPerDB["UFs"]["Castbars"] then return end

	local cb = CreateFrame("StatusBar", "oUF_Castbar"..mystyle, self)
	cb:SetHeight(21)
	cb:SetWidth(self:GetWidth() - 21)
	M.CreateSB(cb, true, .2, .8, 1)

	if mystyle == "player" then
		cb:SetFrameLevel(10)
		cb:SetSize(MaoRUIPerDB["UFs"]["PlayerCBWidth"], MaoRUIPerDB["UFs"]["PlayerCBHeight"])
		createBarMover(cb, U["Player Castbar"], "PlayerCB", R.UFs.Playercb)
	elseif mystyle == "target" then
		cb:SetFrameLevel(10)
		cb:SetSize(MaoRUIPerDB["UFs"]["TargetCBWidth"], MaoRUIPerDB["UFs"]["TargetCBHeight"])
		createBarMover(cb, U["Target Castbar"], "TargetCB", R.UFs.Targetcb)
	elseif mystyle == "nameplate" then
		cb:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -2)
		cb:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, -2)
		cb:SetHeight(self:GetHeight())
	end

	local timer = M.CreateFS(cb, retVal(self, 12, 12, 12, 12, MaoRUIPerDB["Nameplate"]["NameTextSize"]-2), "", false, "RIGHT", -2, 0)
	local name = M.CreateFS(cb, retVal(self, 12, 12, 12, 12, MaoRUIPerDB["Nameplate"]["NameTextSize"]-1), "", false, "LEFT", 2, 0)
	name:SetPoint("RIGHT", timer, "LEFT", -6, 0)
	name:SetJustifyH("LEFT")

	cb.Icon = cb:CreateTexture(nil, "ARTWORK")
	cb.Icon:SetSize(cb:GetHeight(), cb:GetHeight())
	cb.Icon:SetPoint("BOTTOMRIGHT", cb, "BOTTOMLEFT", -3, 0)
	cb.Icon:SetTexCoord(unpack(I.TexCoord))
	M.SetBD(cb.Icon)

	if mystyle == "player" then
		local safe = cb:CreateTexture(nil,"OVERLAY")
		safe:SetTexture(I.normTex)
		safe:SetVertexColor(1, 0, 0, .6)
		safe:SetPoint("TOPRIGHT")
		safe:SetPoint("BOTTOMRIGHT")
		cb:SetFrameLevel(10)
		cb.SafeZone = safe

		if MaoRUIPerDB["UFs"]["LagString"] then
			local lag = M.CreateFS(cb, 10, "", false, "CENTER", -6, 17)
			cb.Lag = lag
			self:RegisterEvent("CURRENT_SPELL_CAST_CHANGED", M.OnCastSent, true)
		end
	elseif mystyle == "nameplate" then
		name:SetPoint("LEFT", cb, 6, -3)
		timer:SetPoint("RIGHT", cb, 0, -3)

		local shield = cb:CreateTexture(nil, "OVERLAY")
		shield:SetAtlas("nameplates-InterruptShield")
		shield:SetSize(21, 21)
		shield:SetPoint("CENTER", cb, 21, -3)  --"CENTER", 0, -5
		cb.Shield = shield

		local iconSize = self:GetHeight()*2 + 3
		cb.Icon:SetSize(iconSize, iconSize)
		cb.Icon:SetPoint("BOTTOMRIGHT", cb, "BOTTOMLEFT", -5, 0)
		cb.timeToHold = .5
	end

	--if mystyle == "nameplate" then
		cb.decimal = "%.1f"
	--else
		--cb.decimal = "%.2f"
	--end

	cb.Time = timer
	cb.Text = name
	cb.OnUpdate = M.OnCastbarUpdate
	cb.PostCastStart = M.PostCastStart
	cb.PostChannelStart = M.PostCastStart
	cb.PostCastStop = M.PostCastStop
	cb.PostChannelStop = M.PostChannelStop
	cb.PostCastFailed = M.PostCastFailed
	cb.PostCastInterrupted = M.PostCastFailed
	cb.PostCastInterruptible = M.PostUpdateInterruptible
	cb.PostCastNotInterruptible = M.PostUpdateInterruptible

	self.Castbar = cb
end

local function reskinTimerBar(bar)
	bar:SetSize(280, 15)
	M.StripTextures(bar, true)

	local statusbar = _G[bar:GetName().."StatusBar"]
	if statusbar then
		statusbar:SetAllPoints()
		statusbar:SetStatusBarTexture(I.normTex)
	else
		bar:SetStatusBarTexture(I.normTex)
	end

	M.SetBD(bar)
end

function UF:ReskinMirrorBars()
	local previous
	for i = 1, 3 do
		local bar = _G["MirrorTimer"..i]
		reskinTimerBar(bar)

		if previous then
			bar:SetPoint("TOP", previous, "BOTTOM", 0, -5)
		end
		previous = bar
	end
end

function UF:ReskinTimerTrakcer(self)
	local function updateTimerTracker()
		for _, timer in pairs(TimerTracker.timerList) do
			if timer.bar and not timer.bar.styled then
				reskinTimerBar(timer.bar)

				timer.bar.styled = true
			end
		end
	end
	self:RegisterEvent("START_TIMER", updateTimerTracker, true)
end

-- Auras Relevant
function UF.PostCreateIcon(element, button)
	local fontSize = element.fontSize or element.size*.6
	local parentFrame = CreateFrame("Frame", nil, button)
	parentFrame:SetAllPoints()
	parentFrame:SetFrameLevel(button:GetFrameLevel() + 3)
	button.count = M.CreateFS(parentFrame, fontSize, "", false, "BOTTOMRIGHT", 6, -3)
	button.cd:SetReverse(true)
	local needShadow = true
	if element.__owner.mystyle == "raid" and not MaoRUIPerDB["UFs"]["RaidBuffIndicator"] then
		needShadow = false
	end
	button.iconbg = M.ReskinIcon(button.icon, needShadow)

	button.HL = button:CreateTexture(nil, "HIGHLIGHT")
	button.HL:SetColorTexture(1, 1, 1, .25)
	button.HL:SetAllPoints()

	button.overlay:SetTexture(nil)
	button.stealable:SetAtlas("bags-newitem")

	if element.disableCooldown then button.timer = M.CreateFS(button, 12, "") end
end

local filteredStyle = {
	["target"] = true,
	["nameplate"] = true,
}

function UF.PostUpdateIcon(element, _, button, _, _, duration, expiration, debuffType)
	if duration then button.iconbg:Show() end

	local style = element.__owner.mystyle
	if style == "nameplate" then
		button:SetSize(element.size, element.size)  --element.size - 4
	else
		button:SetSize(element.size, element.size)
	end

	if button.isDebuff and filteredStyle[style] and not button.isPlayer then
		button.icon:SetDesaturated(true)
	else
		button.icon:SetDesaturated(false)
	end

	if style == "raid" and MaoRUIPerDB["UFs"]["RaidBuffIndicator"] then
		button.iconbg:SetBackdropBorderColor(1, 0, 0)
	elseif element.showDebuffType and button.isDebuff then
		local color = oUF.colors.debuff[debuffType] or oUF.colors.debuff.none
		button.iconbg:SetBackdropBorderColor(color[1], color[2], color[3])
	else
		button.iconbg:SetBackdropBorderColor(0, 0, 0)
	end

	if element.disableCooldown then
		if duration and duration > 0 then
			button.expiration = expiration
			button:SetScript("OnUpdate", M.CooldownOnUpdate)
			button.timer:Show()
		else
			button:SetScript("OnUpdate", nil)
			button.timer:Hide()
		end
	end
end

local function bolsterPreUpdate(element)
	element.bolster = 0
	element.bolsterIndex = nil
end

local function bolsterPostUpdate(element)
	if not element.bolsterIndex then return end
	for _, button in pairs(element) do
		if button == element.bolsterIndex then
			button.count:SetText(element.bolster)
			return
		end
	end
end

function UF.PostUpdateGapIcon(_, _, icon)
	if icon.iconbg and icon.iconbg:IsShown() then
		icon.iconbg:Hide()
	end
end

function UF.CustomFilter(element, unit, button, name, _, _, _, _, _, caster, isStealable, _, spellID, _, _, _, nameplateShowAll)
	local style = element.__owner.mystyle
	if name and spellID == 209859 then
		element.bolster = element.bolster + 1
		if not element.bolsterIndex then
			element.bolsterIndex = button
			return true
		end
	elseif style == "raid" then
		if MaoRUIPerDB["UFs"]["RaidBuffIndicator"] then
			return R.RaidBuffs["ALL"][name] or MaoRUIDB["RaidAuraWatch"][spellID]
		else
			return (button.isPlayer or caster == "pet") and R.CornerBuffsByName[name] or R.RaidBuffs["ALL"][name]
		end
	elseif style == "nameplate" then
		if element.__owner.isNameOnly then
			return MaoRUIDB["NameplateFilter"][1][spellID] or R.WhiteList[spellID]
		elseif MaoRUIDB["NameplateFilter"][2][spellID] or R.BlackList[spellID] then
			return false
		elseif element.showStealableBuffs and isStealable and not UnitIsPlayer(unit) then
			return true
		elseif MaoRUIDB["NameplateFilter"][1][spellID] or R.WhiteList[spellID] then
			return true
		else
			local auraFilter = MaoRUIPerDB["Nameplate"]["AuraFilter"]
			return (auraFilter == 3 and nameplateShowAll) or (auraFilter ~= 1 and (caster == "player" or caster == "pet" or caster == "vehicle"))
		end
	elseif (element.onlyShowPlayer and button.isPlayer) or (not element.onlyShowPlayer and name) then
		return true
	end
end

local function auraIconSize(w, n, s)
	return (w-(n-1)*s)/n
end

function UF:CreateAuras(self)
	local mystyle = self.mystyle
	local bu = CreateFrame("Frame", nil, self)
	bu:SetFrameLevel(self:GetFrameLevel() + 2)
	bu.gap = true
	bu.initialAnchor = "TOPLEFT"
	bu["growth-y"] = "DOWN"
	bu.spacing = 3
	if mystyle == "raid" then
		if MaoRUIPerDB["UFs"]["RaidBuffIndicator"] then
			bu.initialAnchor = "LEFT"
			bu:SetPoint("LEFT", self, 15, 0)
			bu.size = 18*MaoRUIPerDB["UFs"]["SimpleRaidScale"]/10
			bu.numTotal = 1
			bu.disableCooldown = true
		else
			bu:SetPoint("BOTTOMLEFT", self.Health)
			bu.numTotal = MaoRUIPerDB["UFs"]["SimpleMode"] and not self.isPartyFrame and 0 or 6
			bu.iconsPerRow = 6
			bu.spacing = 2
		end
		bu.gap = false
		bu.disableMouse = MaoRUIPerDB["UFs"]["AurasClickThrough"]
	elseif mystyle == "nameplate" then
		bu.initialAnchor = "BOTTOMLEFT"
		bu["growth-y"] = "UP"
		if MaoRUIPerDB["Nameplate"]["ShowPlayerPlate"] and MaoRUIPerDB["Nameplate"]["NameplateClassPower"] then
			bu:SetPoint("BOTTOMLEFT", self.nameText, "TOPLEFT", 0, 6 + _G.oUF_ClassPowerBar:GetHeight())
		else
			bu:SetPoint("BOTTOMLEFT", self.nameText, "TOPLEFT", 0, 6)
		end
		bu.numTotal = MaoRUIPerDB["Nameplate"]["maxAuras"]
		bu.size = MaoRUIPerDB["Nameplate"]["AuraSize"]
		bu.showDebuffType = MaoRUIPerDB["Nameplate"]["ColorBorder"]
		bu.gap = false
		bu.disableMouse = true
	end

	local width = self:GetWidth()
	local maxAuras = bu.numTotal or bu.numBuffs + bu.numDebuffs
	local maxLines = bu.iconsPerRow and floor(maxAuras/bu.iconsPerRow + .5) or 2
	bu.size = bu.iconsPerRow and auraIconSize(width, bu.iconsPerRow, bu.spacing) or bu.size
	bu:SetWidth(width)
	bu:SetHeight((bu.size + bu.spacing) * maxLines)

	bu.showStealableBuffs = true
	bu.CustomFilter = UF.CustomFilter
	bu.PostCreateIcon = UF.PostCreateIcon
	bu.PostUpdateIcon = UF.PostUpdateIcon
	bu.PostUpdateGapIcon = UF.PostUpdateGapIcon
	bu.PreUpdate = bolsterPreUpdate
	bu.PostUpdate = bolsterPostUpdate

	self.Auras = bu
end

function UF:CreateBuffs(self)
	local bu = CreateFrame("Frame", nil, self)
	bu:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
	bu.initialAnchor = "BOTTOMLEFT"
	bu["growth-x"] = "RIGHT"
	bu["growth-y"] = "UP"
	bu.num = 6
	bu.spacing = 3
	bu.iconsPerRow = 6
	bu.onlyShowPlayer = false

	local width = self:GetWidth()
	bu.size = auraIconSize(width, bu.iconsPerRow, bu.spacing)
	bu:SetWidth(self:GetWidth())
	bu:SetHeight((bu.size + bu.spacing) * floor(bu.num/bu.iconsPerRow + .5))

	bu.showStealableBuffs = true
	bu.PostCreateIcon = UF.PostCreateIcon
	bu.PostUpdateIcon = UF.PostUpdateIcon

	self.Buffs = bu
end

function UF:CreateDebuffs(self)
	local mystyle = self.mystyle
	local bu = CreateFrame("Frame", nil, self)
	bu.spacing = 3
	bu.initialAnchor = "TOPRIGHT"
	bu["growth-x"] = "LEFT"
	bu["growth-y"] = "DOWN"

	local width = self:GetWidth()
	bu.size = auraIconSize(width, bu.iconsPerRow, bu.spacing)
	bu:SetWidth(self:GetWidth())
	bu:SetHeight((bu.size + bu.spacing) * floor(bu.num/bu.iconsPerRow + .5))

	bu.PostCreateIcon = UF.PostCreateIcon
	bu.PostUpdateIcon = UF.PostUpdateIcon

	self.Debuffs = bu
end

-- Class Powers
local barWidth, barHeight = unpack(R.UFs.BarSize)

function UF.PostUpdateClassPower(element, cur, max, diff, powerType)
	if not cur or cur == 0 then
		for i = 1, 6 do
			element[i].bg:Hide()
		end
	else
		for i = 1, max do
			element[i].bg:Show()
		end
	end

	if diff then
		for i = 1, max do
			element[i]:SetWidth((barWidth - (max-1)*R.margin)/max)
		end
		for i = max + 1, 6 do
			element[i].bg:Hide()
		end
	end

	element.thisColor = cur == max and 1 or 2
	if not element.prevColor or element.prevColor ~= element.thisColor then
		local r, g, b = 1, 0, 0
		if element.thisColor == 2 then
			local color = element.__owner.colors.power[powerType]
			r, g, b = color[1], color[2], color[3]
		end
		for i = 1, #element do
			element[i]:SetStatusBarColor(r, g, b)
		end
		element.prevColor = element.thisColor
	end
end

function UF:CreateClassPower(self)
	if self.mystyle == "PlayerPlate" then
		barWidth = MaoRUIPerDB["Nameplate"]["NameplateClassPower"] and MaoRUIPerDB["Nameplate"]["PlateWidth"] or MaoRUIPerDB["Nameplate"]["PPWidth"]
		barHeight = MaoRUIPerDB["Nameplate"]["PPBarHeight"]
		R.UFs.BarPoint = {"BOTTOMLEFT", self, "TOPLEFT", 0, 3}
	end

	local bar = CreateFrame("Frame", "oUF_ClassPowerBar", self.Health)
	bar:SetSize(barWidth, barHeight)
	bar:SetPoint(unpack(R.UFs.BarPoint))

	local bars = {}
	for i = 1, 6 do
		bars[i] = CreateFrame("StatusBar", nil, bar)
		bars[i]:SetHeight(barHeight)
		bars[i]:SetWidth((barWidth - 5*R.margin) / 6)
		bars[i]:SetStatusBarTexture(I.normTex)
		bars[i]:SetFrameLevel(self:GetFrameLevel() + 5)
		M.CreateBDFrame(bars[i], 0, true)
		if i == 1 then
			bars[i]:SetPoint("BOTTOMLEFT")
		else
			bars[i]:SetPoint("LEFT", bars[i-1], "RIGHT", R.margin, 0)
		end

		bars[i].bg = bar:CreateTexture(nil, "BACKGROUND")
		bars[i].bg:SetAllPoints(bars[i])
		bars[i].bg:SetTexture(I.normTex)
		bars[i].bg.multiplier = .25
	end

	bars.PostUpdate = UF.PostUpdateClassPower
	self.ClassPower = bars
end

function UF.PostUpdateAltPower(element, _, cur, _, max)
	if cur and max then
		local perc = floor((cur/max)*100)
		if perc < 35 then
			element:SetStatusBarColor(0, 1, 0)
		elseif perc < 70 then
			element:SetStatusBarColor(1, 1, 0)
		else
			element:SetStatusBarColor(1, 0, 0)
		end
	end
end

function UF:CreateExpRepBar(self)
	local bar = CreateFrame("StatusBar", nil, self)
	bar:SetPoint("TOPLEFT", self, "TOPRIGHT", 5, 0)
	bar:SetPoint("BOTTOMRIGHT", self.Power, "BOTTOMRIGHT", 10, 0)
	bar:SetOrientation("VERTICAL")
	M.CreateSB(bar)

	local rest = CreateFrame("StatusBar", nil, bar)
	rest:SetAllPoints(bar)
	rest:SetStatusBarTexture(I.normTex)
	rest:SetStatusBarColor(0, .4, 1, .6)
	rest:SetFrameLevel(bar:GetFrameLevel() - 1)
	rest:SetOrientation("VERTICAL")
	bar.restBar = rest

	M:GetModule("Misc"):SetupScript(bar)
end

function UF:CreatePrediction(self)
	local myBar = CreateFrame("StatusBar", nil, self)
	myBar:SetWidth(self:GetWidth())
	myBar:SetPoint("TOP", self.Health, "TOP")
	myBar:SetPoint("BOTTOM", self.Health, "BOTTOM")
	myBar:SetPoint("LEFT", self.Health:GetStatusBarTexture(), "RIGHT")
	myBar:SetStatusBarTexture(I.normTex)
	myBar:SetStatusBarColor(0, 1, 0, .5)
	myBar:Hide()

	local otherBar = CreateFrame("StatusBar", nil, self)
	otherBar:SetWidth(self:GetWidth())
	otherBar:SetPoint("TOP", self.Health, "TOP")
	otherBar:SetPoint("BOTTOM", self.Health, "BOTTOM")
	otherBar:SetPoint("LEFT", myBar:GetStatusBarTexture(), "RIGHT")
	otherBar:SetStatusBarTexture(I.normTex)
	otherBar:SetStatusBarColor(0, 1, 1, .5)
	otherBar:Hide()

	self.HealthPrediction = {
		myBar = myBar,
		otherBar = otherBar,
		maxOverflow = 1,
	}
end

function UF.PostUpdateAddPower(element, _, cur, max)
	if element.Text and max > 0 then
		local perc = cur/max * 100
		if perc == 100 then
			perc = ""
			element:SetAlpha(0)
		else
			perc = format("%d%%", perc)
			element:SetAlpha(1)
		end
		element.Text:SetText(perc)
	end
end

function UF:CreateAddPower(self)
	if I.MyClass ~= "DRUID" then return end

	local bar = CreateFrame("StatusBar", nil, self)
	bar:SetPoint("TOPLEFT", self.Power, "BOTTOMLEFT", 0, -3)
	bar:SetPoint("TOPRIGHT", self.Power, "BOTTOMRIGHT", 0, -3)
	bar:SetHeight(4)
	bar:SetStatusBarTexture(I.normTex)
	M.CreateBDFrame(bar, 0, true)
	bar.colorPower = true

	local bg = bar:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetTexture(I.normTex)
	bg.multiplier = .25
	local text = M.CreateFS(bar, 12, "", false, "CENTER", 1, -3)

	self.AdditionalPower = bar
	self.AdditionalPower.bg = bg
	self.AdditionalPower.Text = text
	self.AdditionalPower.PostUpdate = UF.PostUpdateAddPower
	self.AdditionalPower.frequentUpdates = true
end

function UF:CreateSwing(self)
	--if not MaoRUIPerDB["UFs"]["Castbars"] then return end

	local bar = CreateFrame("Frame", nil, self)
	local width = MaoRUIPerDB["UFs"]["PlayerCBWidth"] - MaoRUIPerDB["UFs"]["PlayerCBHeight"] - 5
	bar:SetSize(width, 3)
	bar:SetPoint("TOP", self.Castbar.mover, "BOTTOM", 0, -5)

	local two = CreateFrame("StatusBar", nil, bar)
	two:Hide()
	two:SetAllPoints()
	M.CreateSB(two, true, .8, .8, .8)

	local bg = two:CreateTexture(nil, "BACKGROUND", nil, 1)
	bg:Hide()
	bg:SetPoint("TOPRIGHT")
	bg:SetPoint("BOTTOMRIGHT")
	bg:SetColorTexture(.9, 0, 0)

	local main = CreateFrame("StatusBar", nil, bar)
	main:Hide()
	main:SetAllPoints()
	M.CreateSB(main, true, .8, .8, .8)

	local off = CreateFrame("StatusBar", nil, bar)
	off:Hide()
	off:SetPoint("TOPLEFT", bar, "BOTTOMLEFT", 0, -3)
	off:SetPoint("BOTTOMRIGHT", bar, "BOTTOMRIGHT", 0, -6)
	M.CreateSB(off, true, .8, .8, .8)

	if MaoRUIPerDB["UFs"]["SwingTimer"] then
		bar.Text = M.CreateFS(bar, 11, "")
		bar.TextMH = M.CreateFS(main, 11, "")
		bar.TextOH = M.CreateFS(off, 11, "", false, "CENTER", 1, -5)
	end

	self.Swing = bar
	self.Swing.Twohand = two
	self.Swing.Mainhand = main
	self.Swing.Offhand = off
	self.Swing.bg = bg
	self.Swing.hideOoc = true
end

function UF:CreateEneryTicker(self)
	if not MaoRUIPerDB["UFs"]["EnergyTicker"] then return end
	if I.MyClass == "WARRIOR" then return end

	local ticker = CreateFrame("StatusBar", nil, self.Power)
	ticker:SetFrameLevel(self.Power:GetFrameLevel() + 3)
	ticker:SetAllPoints()
	ticker.Spark = ticker:CreateTexture(nil, "OVERLAY")

	self.EnergyManaRegen = ticker
end