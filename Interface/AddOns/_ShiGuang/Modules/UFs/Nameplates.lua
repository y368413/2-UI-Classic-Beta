local _, ns = ...
local M, R, U, I = unpack(ns)
------------------------------- Nameplate, by paopao001-- NDui MOD-----------------------------
local LCD = I.LibClassicDurations
-- Auras
local function CreateAuraIcon(parent)
	local button = CreateFrame("Frame", nil, parent)
	button:SetSize(MaoRUIPerDB["Nameplate"]["AuraSize"], MaoRUIPerDB["Nameplate"]["AuraSize"])
	M.CreateSD(button, 3, 3)

	button.icon = button:CreateTexture(nil, "OVERLAY", nil, 3)
	button.icon:SetAllPoints()
	button.icon:SetTexCoord(unpack(I.TexCoord))

	button.cd = CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
	button.cd:SetAllPoints(button)
	button.cd:SetReverse(true)
	button.count = M.CreateFS(button, 12, "", false, "BOTTOMRIGHT", 2, -2)

	return button
end

local function UpdateAuraIcon(button, unit, index, filter, customIcon)
	local name, icon, count, debuffType, _, _, caster, _, _, spellID = LCD:UnitAura(unit, index, filter)
	duration, expirationTime = LCD:GetAuraDurationByUnit(unit, spellID, caster, name)

	button.expirationTime = expirationTime
	button.duration = duration
	button.spellID = spellID

	local color = DebuffTypeColor[debuffType] or DebuffTypeColor.none
	if MaoRUIPerDB["Nameplate"]["ColorBorder"] then
		button.Shadow:SetBackdropBorderColor(color.r, color.g, color.b)
	else
		button.Shadow:SetBackdropBorderColor(0, 0, 0)
	end

	if duration and duration > 0 then
		button.cd:SetCooldown(expirationTime - duration, duration)
	else
		button.cd:SetCooldown(0, 0)
	end

	if count and count > 1 then
		button.count:SetText(count)
	else
		button.count:SetText("")
	end

	if customIcon then
		button.icon:SetTexture(R.CustomIcons[customIcon]) 
	else
		button.icon:SetTexture(icon)
	end

	button:Show()
end

local function AuraFilter(caster, spellID, unit)
	if caster == "player" then
		--1:none, 2:all, 3:white, 4:black, 5:aurawatch
		if MaoRUIPerDB["Nameplate"]["AuraFilter"] == 1 then
			return false
		elseif MaoRUIPerDB["Nameplate"]["AuraFilter"] == 2 then
			return true
		elseif MaoRUIPerDB["Nameplate"]["AuraFilter"] == 3 and R.WhiteList[spellID] then
			return true
		elseif MaoRUIPerDB["Nameplate"]["AuraFilter"] == 4 and not R.BlackList[spellID] then
			return true
		elseif MaoRUIPerDB["Nameplate"]["AuraFilter"] == 5 then
			local auraList = R.AuraWatchList[I.MyClass]
			if auraList then
				for _, value in pairs(auraList) do
					if value.Name == "Target Aura" then
						for _, v in pairs(value.List) do
							if v.AuraID == spellID then
								return true
							end
						end
					end
				end
			end
		end
	else
		--1:none, 2:white
		if MaoRUIPerDB["Nameplate"]["OtherFilter"] == 1 then
			return false
		elseif MaoRUIPerDB["Nameplate"]["OtherFilter"] == 2 and R.WhiteList[spellID] then
			return true
		end
	end
end

local function UpdateBuffs(unitFrame)
	local unit = unitFrame.displayedUnit
	local iconsFrame = unitFrame.iconsFrame

	if not iconsFrame or not unit then return end
	if UnitIsUnit(unit, "player") and not MaoRUIPerDB["Nameplate"]["PlayerAura"] then
		iconsFrame:Hide()
		return
	else
		iconsFrame:Show()
	end

	local i = 1
	for index = 1, 15 do
		if i <= MaoRUIPerDB["Nameplate"]["maxAuras"] then
			local name, _, _, _, _, _, caster, _, _, spellID = LCD:UnitAura(unit, index, "HELPFUL")
			local matchbuff, customIcon = AuraFilter(caster, spellID, unit)
			if name and matchbuff then
				if not unitFrame.icons[i] then
					unitFrame.icons[i] = CreateAuraIcon(iconsFrame)
				end
				UpdateAuraIcon(unitFrame.icons[i], unit, index, "HELPFUL", customIcon)
				if i ~= 1 then
					if i == 6 then
						unitFrame.icons[6]:SetPoint("BOTTOM", unitFrame.icons[1], "TOP", 0, 4)
					else
						unitFrame.icons[i]:SetPoint("LEFT", unitFrame.icons[i-1], "RIGHT", 4, 0)
					end
				end
				i = i + 1
			end
		end
	end

	for index = 1, 20 do
		if i <= MaoRUIPerDB["Nameplate"]["maxAuras"] then
			local name, _, _, _, _, _, caster, _, _, spellID = LCD:UnitAura(unit, index, "HARMFUL")
			local matchdebuff, customIcon = AuraFilter(caster, spellID, unit)
			if name and matchdebuff then
				if not unitFrame.icons[i] then
					unitFrame.icons[i] = CreateAuraIcon(iconsFrame)
				end
				UpdateAuraIcon(unitFrame.icons[i], unit, index, "HARMFUL", customIcon)
				if i ~= 1 then
					if i == 6 then
						unitFrame.icons[6]:SetPoint("BOTTOM", unitFrame.icons[1], "TOP", 0, 4)
					else
						unitFrame.icons[i]:SetPoint("LEFT", unitFrame.icons[i-1], "RIGHT", 4, 0)
					end
				end
				i = i + 1
			end
		end
	end
	unitFrame.iconnumber = i - 1

	if i > 1 then
		local count = i > 5 and 5 or unitFrame.iconnumber
		unitFrame.icons[1]:SetPoint("LEFT", iconsFrame, "LEFT", 0, -3)
	end
	for index = i, #unitFrame.icons do unitFrame.icons[index]:Hide() end
end

-- Unitframe
local classtex = {
	rare = {"Interface\\MINIMAP\\ObjectIcons", .391, .487, .644, .74},
	--elite = {"Interface\\MINIMAP\\Minimap_skull_elite", 0, 1, 0, 1},
	rareelite = {"Interface\\MINIMAP\\ObjectIcons", .754, .875, .624, .749},
	worldboss = {"Interface\\MINIMAP\\ObjectIcons", .879, 1, .754, .879},
}

local function UpdateName(unitFrame)
	local unit = unitFrame.displayedUnit
	local level = UnitLevel(unit)
	local name = GetUnitName(unit, false) or UNKNOWN
	local class = UnitClassification(unit)

	if level and level ~= UnitLevel("player") then
		if level == -1 then
			level = "|cffff0000+|r "
		else 
			level = M.HexRGB(GetCreatureDifficultyColor(level))..level.."|r "
		end
	else
		level = ""
	end

	if name then
		if UnitIsUnit(unit, "player") then
			unitFrame.name:SetText("")
		else
			unitFrame.name:SetText(level..name)
		end
	end
  
	if name and name == R.CustomUnits[UnitName(unit)] then
		unitFrame.creatureBoomIcon:SetTexture("Interface\\MINIMAP\\Minimap_skull_elite")
		unitFrame.creatureBoomIcon:SetTexCoord(0, 1, 0, 1)
	else
		unitFrame.creatureBoomIcon:SetTexture(nil)
	end
	
	if class and classtex[class] then
		local tex, a, b, c, d = unpack(classtex[class])
		unitFrame.creatureIcon:SetTexture(tex)
		unitFrame.creatureIcon:SetTexCoord(a, b, c, d)
	else
		unitFrame.creatureIcon:SetTexture(nil)
	end
end

local function UpdateHealth(unitFrame)
	local unit = unitFrame.displayedUnit
	local minHealth, maxHealth = UnitHealth(unit), UnitHealthMax(unit)
	local p = minHealth/maxHealth * 100
	unitFrame.healthBar:SetValue(p/100)

	if MaoRUIPerDB["Nameplate"]["FullHealth"] and RealMobHealth and RealMobHealth.UnitHasHealthData(unit) then
		local value, max = RealMobHealth.GetUnitHealth(unit)
		unitFrame.healthBar.value:SetText(M.Numb(value))  --.." | "..M.Numb(max)
	else
		if minHealth == maxHealth or UnitIsUnit(unit, "player") then
		  unitFrame.healthBar.value:SetText("")
	  else
			unitFrame.healthBar.value:SetText(string.format("%d", p))
		end
	end
	if p <= 50 and p >= 35 then
		unitFrame.healthBar.value:SetTextColor(253/255, 238/255, 80/255)
	elseif p < 35 and p >= 20 then
		unitFrame.healthBar.value:SetTextColor(250/255, 130/255, 0/255)
	elseif p < 20 then
		unitFrame.healthBar.value:SetTextColor(200/255, 20/255, 40/255)
	else
		unitFrame.healthBar.value:SetTextColor(1, 1, 1)
	end
end

local function IsTapDenied(unitFrame)
	return UnitIsTapDenied(unitFrame.unit) and not UnitPlayerControlled(unitFrame.unit)
end

local function UpdateHealthColor(unitFrame)
	local hp = unitFrame.healthBar
	local unit = unitFrame.displayedUnit or false
	local r, g, b

	if not UnitIsConnected(unit) then
		r, g, b = .7, .7, .7
	else
		if UnitIsPlayer(unit) and UnitReaction(unit, "player") >= 5 then
			if MaoRUIPerDB["Nameplate"]["FriendlyCC"] then
				r, g, b = M.UnitColor(unit)
			else
				r, g, b = .3, .3, 1
			end
		elseif UnitIsPlayer(unit) and UnitReaction(unit, "player") <= 4 and MaoRUIPerDB["Nameplate"]["HostileCC"] then
			r, g, b = M.UnitColor(unit)
		elseif IsTapDenied(unitFrame) then
			r, g, b = .6, .6, .6
		else
			r, g, b = UnitSelectionColor(unit, true)
		end
	end

	if r ~= unitFrame.r or g ~= unitFrame.g or b ~= unitFrame.b then
		hp:SetStatusBarColor(r, g, b)
		unitFrame.r, unitFrame.g, unitFrame.b = r, g, b
	end

	if not MaoRUIPerDB["Nameplate"]["TankMode"] and I.Role ~= "Tank" then
			hp.Shadow:SetBackdropBorderColor(0, 0, 0)
	else
		hp.Shadow:SetBackdropBorderColor(0, 0, 0)
	end
end

local function UpdateSelectionHighlight(unitFrame)
	local unit = unitFrame.displayedUnit
	local redarrowleft, redarrowright, glow, line = unitFrame.redarrowleft, unitFrame.redarrowright, unitFrame.glowBorder, unitFrame.underLine

	if UnitIsUnit(unit, "target") and not UnitIsUnit(unit, "player") and MaoRUIPerDB["Nameplate"]["Arrow"] then
		unitFrame.redarrowleft:Show()
		unitFrame.redarrowright:Show()
		if glow then glow:Show() end
	else
		unitFrame.redarrowleft:Hide()
		unitFrame.redarrowright:Hide()
		if glow then glow:Hide() end
	end

	--if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then	
			unitFrame.redarrowleft:SetRotation(math.rad(90))
			unitFrame.redarrowleft:SetPoint("RIGHT", unitFrame.healthBar, "LEFT", 1, 0)
			unitFrame.redarrowright:SetRotation(math.rad(-90))
			unitFrame.redarrowright:SetPoint("LEFT", unitFrame.healthBar, "RIGHT", -1, 0)
	--else
			--unitFrame.redarrowleft:SetPoint("BOTTOM", unitFrame.name, "TOP", 0, 0)
	--end
end

local function UpdateRaidTarget(unitFrame)
	local rtf = unitFrame.RaidTargetFrame
	local icon = rtf.RaidTargetIcon
	local unit = unitFrame.displayedUnit

	local index = GetRaidTargetIndex(unit)
	if index and not UnitIsUnit(unit, "player") then
		SetRaidTargetIconTexture(icon, index)
		icon:Show()
	else
		icon:Hide()
	end
		rtf:SetPoint("TOP", unitFrame.name, "LEFT", -15, 15)
end

local function UpdateNamePlateEvents(unitFrame)
	-- These are events affected if unit is in a vehicle
	local unit = unitFrame.unit
	local displayedUnit
	if unit ~= unitFrame.displayedUnit then
		displayedUnit = unitFrame.displayedUnit
	end
	unitFrame:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", unit, displayedUnit)
	unitFrame:RegisterUnitEvent("UNIT_AURA", unit, displayedUnit)
	--unitFrame:RegisterUnitEvent("UNIT_THREAT_LIST_UPDATE", unit, displayedUnit)
	if R.ShowPowerList[UnitName(unitFrame.displayedUnit)] then
		unitFrame:RegisterUnitEvent("UNIT_POWER_FREQUENT", unit, displayedUnit)
		unitFrame.power:Show()
	else
		unitFrame:UnregisterEvent("UNIT_POWER_FREQUENT")
		unitFrame.power:Hide()
	end
end

local function BlockAddons()
	if DBM and DBM.Nameplate then
		function DBM.Nameplate:SupportedNPMod()
			return true
		end
	end
end

local function UpdateAll(unitFrame)
	local unit = unitFrame.displayedUnit

	if UnitExists(unit) then
		UpdateSelectionHighlight(unitFrame)
		UpdateName(unitFrame)
		UpdateHealthColor(unitFrame)
		UpdateHealth(unitFrame)
		UpdateBuffs(unitFrame)
		UpdateRaidTarget(unitFrame)
	end
end

local function NamePlate_OnEvent(self, event, ...)
	if not MaoRUIPerDB["Nameplate"]["Enable"] then
		self:UnregisterAllEvents()
		return
	end

	local arg1 = ...
	if event == "PLAYER_TARGET_CHANGED" then
		UpdateName(self)
		UpdateSelectionHighlight(self)
	elseif event == "PLAYER_ENTERING_WORLD" then
		UpdateAll(self)
	elseif arg1 == self.unit or arg1 == self.displayedUnit then
		if event == "UNIT_HEALTH_FREQUENT" then
			UpdateHealth(self)
			UpdateSelectionHighlight(self)
		elseif event == "UNIT_AURA" then
			UpdateBuffs(self)
			UpdateSelectionHighlight(self)
		--elseif event == "UNIT_THREAT_LIST_UPDATE" then
			--UpdateHealthColor(self)
		elseif event == "UNIT_NAME_UPDATE" then
			UpdateName(self)
		elseif event == "UNIT_PET" then
			UpdateAll(self)
		end
	end
end

local function RegisterNamePlateEvents(unitFrame)
	unitFrame:RegisterEvent("UNIT_NAME_UPDATE")
	unitFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	unitFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
	unitFrame:RegisterEvent("UNIT_PET")
	--unitFrame:RegisterEvent("UNIT_ENTERED_VEHICLE")
	--unitFrame:RegisterEvent("UNIT_EXITED_VEHICLE")
	UpdateNamePlateEvents(unitFrame)
	unitFrame:SetScript("OnEvent", NamePlate_OnEvent)
end

local function UnregisterNamePlateEvents(unitFrame)
	unitFrame:UnregisterAllEvents()
	unitFrame:SetScript("OnEvent", nil)
end

local function SetUnit(unitFrame, unit)
	unitFrame.unit = unit
	unitFrame.displayedUnit = unit	 -- For vehicles
	unitFrame.inVehicle = false
	if unit then
		RegisterNamePlateEvents(unitFrame)
	else
		UnregisterNamePlateEvents(unitFrame)
	end
end

-- Driver frame
local function NamePlates_UpdateNamePlateOptions()
	-- Called at VARIABLES_LOADED and by "Larger Nameplates" interface options checkbox
	local baseNamePlateWidth = MaoRUIPerDB["Nameplate"]["Width"]
	local baseNamePlateHeight = 40
	local horizontalScale = tonumber(GetCVar("NamePlateHorizontalScale"))
	C_NamePlate.SetNamePlateEnemySize(baseNamePlateWidth * horizontalScale, baseNamePlateHeight)
	C_NamePlate.SetNamePlateFriendlySize(baseNamePlateWidth * horizontalScale, baseNamePlateHeight)
	C_NamePlate.SetNamePlateSelfSize(baseNamePlateWidth, baseNamePlateHeight)

	for i, namePlate in ipairs(C_NamePlate.GetNamePlates()) do
		local unitFrame = namePlate.UnitFrame
		UpdateAll(unitFrame)
	end
end

local function HideBlizzard()
	NamePlateDriverFrame:UnregisterAllEvents()
	NamePlateDriverFrame.SetupClassNameplateBars = M.Dummy
	NamePlateDriverFrame.UpdateNamePlateOptions = M.Dummy
	--hooksecurefunc(NamePlateDriverFrame, "SetupClassNameplateBar", function()
		--NamePlateTargetResourceFrame:Hide()
		--NamePlatePlayerResourceFrame:Hide()
	--end)

	-- CVars (Default: .08, .1, 60, .8, 1.1, .5)
	if MaoRUIPerDB["Nameplate"]["InsideView"] then
		SetCVar("nameplateOtherTopInset", .05)
		SetCVar("nameplateOtherBottomInset", .08)
	else
		SetCVar("nameplateOtherTopInset", -1)
		SetCVar("nameplateOtherBottomInset", -1)
	end
	--fix fps drop(距離縮放與描邊功能會引起掉幀)
	SetCVar("namePlateMinScale", 1)  --default is 0.8
	SetCVar("namePlateMaxScale", 1)
	
	SetCVar("nameplateMaxDistance", "6e1")
	SetCVar("nameplateOverlapH", .5)
	SetCVar("nameplateOverlapV", .7)
	SetCVar("nameplateMinAlpha", MaoRUIPerDB["Nameplate"]["MinAlpha"])

	C_NamePlate.SetNamePlateFriendlyClickThrough(false)
	SetCVar("nameplateSelectedScale", 1.43)
end

local function OnUnitFactionChanged(unit)
	-- This would make more sense as a unitFrame:RegisterUnitEvent
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	if namePlate then
		UpdateName(namePlate.UnitFrame)
		UpdateHealthColor(namePlate.UnitFrame)
	end
end

local function OnRaidTargetUpdate()
	for _, namePlate in pairs(C_NamePlate.GetNamePlates()) do
		UpdateRaidTarget(namePlate.UnitFrame)
	end
end

local function OnNamePlateCreated(namePlate)
	local unitFrame = CreateFrame("Button", "$parentUnitFrame", namePlate)
	unitFrame:SetAllPoints(namePlate)
	unitFrame:SetFrameLevel(namePlate:GetFrameLevel())
	unitFrame.name = M.CreateFS(unitFrame, 11, "", false, "TOPLEFT", 5, -5)
	unitFrame.name:SetPoint("BOTTOMRIGHT", unitFrame, "TOPRIGHT", -5, -15)
	namePlate.UnitFrame = unitFrame

	local hp = CreateFrame("StatusBar", nil, unitFrame)
	hp:SetHeight(MaoRUIPerDB["Nameplate"]["Height"])
	hp:SetPoint("TOPLEFT", 0, -20)
	hp:SetPoint("TOPRIGHT", 0, -20)
	hp:SetMinMaxValues(0, 1)
	M.CreateSB(hp)
	M.SmoothBar(hp)
	if MaoRUIPerDB["Nameplate"]["FullHealth"] then
	  hp.value = M.CreateFS(hp, 9, "", false, "TOPRIGHT", 2, 6)
	else
	  hp.value = M.CreateFS(hp, 12, "", false, "TOPRIGHT", 0, 8)
	end
	unitFrame.healthBar = hp

	unitFrame.power = M.CreateFS(hp, 15, "", false, "LEFT", 0, 0)
	unitFrame.power:SetPoint("LEFT", hp, "RIGHT", 2, 0)

	local cicon = hp:CreateTexture(nil, "OVERLAY")
	cicon:SetPoint("LEFT", hp, "TOPLEFT", 0, 3)
	cicon:SetSize(21, 21)
	cicon:SetAlpha(.8)
	unitFrame.creatureIcon = cicon
	
	local Boomicon = hp:CreateTexture(nil, "OVERLAY")
	Boomicon:SetPoint("BOTTOM", hp, "TOP", 0, 3)
	Boomicon:SetSize(66, 66)
	unitFrame.creatureBoomIcon = Boomicon

	local rtf = CreateFrame("Frame", nil, unitFrame)
	rtf:SetSize(30, 30)
	rtf:SetPoint("TOP", unitFrame.name, "LEFT", -15, 15)
	unitFrame.RaidTargetFrame = rtf

	local ricon = rtf:CreateTexture(nil, "OVERLAY")
	ricon:SetTexture([[Interface\TargetingFrame\UI-RaidTargetingIcons]])
	ricon:SetAllPoints()
	ricon:Hide()
	rtf.RaidTargetIcon = ricon

	if MaoRUIPerDB["Nameplate"]["Arrow"] then
		local redarrowleft = unitFrame:CreateTexture(nil, "OVERLAY")
		redarrowleft:SetSize(21, 21)
		redarrowleft:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\Raid\\textureArrowAbove")
		redarrowleft:SetPoint("RIGHT", namePlate.UnitFrame.healthBar, "LEFT", 1, 0)
		redarrowleft:Hide()
		unitFrame.redarrowleft = redarrowleft
		local redarrowright = unitFrame:CreateTexture(nil, "OVERLAY")
		redarrowright:SetSize(21, 21)
		redarrowright:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\Raid\\textureArrowAbove")
		redarrowright:SetPoint("LEFT", namePlate.UnitFrame.healthBar, "RIGHT", -1, 0)
		redarrowright:Hide()
		unitFrame.redarrowright = redarrowright
	else
		local glow = CreateFrame("Frame", nil, hp)
		glow:SetPoint("TOPLEFT", hp, -5, 5)
		glow:SetPoint("BOTTOMRIGHT", hp, 5, -5)
		glow:SetBackdrop({edgeFile = I.glowTex, edgeSize = 4})
		glow:SetBackdropBorderColor(1, 1, 1)
		glow:SetFrameLevel(0)
		unitFrame.glowBorder = glow
	end

	local icons = CreateFrame("Frame", nil, unitFrame)
	icons:SetPoint("BOTTOM", unitFrame, "TOP", 3, 0)
	icons:SetSize(126, 25)
	icons:SetFrameLevel(unitFrame:GetFrameLevel() + 2)
	unitFrame.iconsFrame = icons
	unitFrame.icons = {}

	unitFrame:EnableMouse(false)
end

local function OnNamePlateAdded(unit)
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	local unitFrame = namePlate.UnitFrame
	SetUnit(unitFrame, unit)
	UpdateAll(unitFrame)
end

local function OnNamePlateRemoved(unit)
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	local unitFrame = namePlate.UnitFrame
	SetUnit(unitFrame, nil)
end

local function NamePlates_OnEvent(self, event, ...)
	if not MaoRUIPerDB["Nameplate"]["Enable"] then
		self:UnregisterAllEvents()
		return
	end

	local arg1 = ...
	if event == "VARIABLES_LOADED" then
		HideBlizzard()
		BlockAddons()
		NamePlates_UpdateNamePlateOptions()
	elseif event == "NAME_PLATE_CREATED" then
		OnNamePlateCreated(arg1)
	elseif event == "NAME_PLATE_UNIT_ADDED" then
		OnNamePlateAdded(arg1)
	elseif event == "NAME_PLATE_UNIT_REMOVED" then
		OnNamePlateRemoved(arg1)
	elseif event == "RAID_TARGET_UPDATE" then
		OnRaidTargetUpdate()
	elseif event == "DISPLAY_SIZE_CHANGED" then
		NamePlates_UpdateNamePlateOptions()
	elseif event == "UNIT_FACTION" then
		OnUnitFactionChanged(arg1)
	end
end

local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("VARIABLES_LOADED")
EventFrame:RegisterEvent("NAME_PLATE_CREATED")
EventFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
EventFrame:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
EventFrame:RegisterEvent("RAID_TARGET_UPDATE")
EventFrame:RegisterEvent("DISPLAY_SIZE_CHANGED")
EventFrame:RegisterEvent("UNIT_FACTION")
EventFrame:SetScript("OnEvent", NamePlates_OnEvent)