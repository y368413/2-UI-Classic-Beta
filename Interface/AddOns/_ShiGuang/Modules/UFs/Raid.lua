local _, ns = ...
local M, R, U, I = unpack(ns)
local oUF = ns.oUF or oUF
local UF = M:GetModule("UnitFrames")

local LCD = I.LibClassicDurations

local strmatch, format, wipe, tinsert = string.match, string.format, table.wipe, table.insert
local pairs, ipairs, next, tonumber, unpack, gsub = pairs, ipairs, next, tonumber, unpack, gsub
local UnitAura, GetSpellInfo = UnitAura, GetSpellInfo
local InCombatLockdown = InCombatLockdown

-- RaidFrame Elements
function UF:CreateRaidIcons(self)
	local parent = CreateFrame("Frame", nil, self)
	parent:SetAllPoints()
	parent:SetFrameLevel(self:GetFrameLevel() + 2)

	local check = parent:CreateTexture(nil, "OVERLAY")
	check:SetSize(16, 16)
	check:SetPoint("BOTTOM", 0, 1)
	self.ReadyCheckIndicator = check

	local resurrect = parent:CreateTexture(nil, "OVERLAY")
	resurrect:SetSize(20, 20)
	resurrect:SetPoint("CENTER", self, 1, 0)
	self.ResurrectIndicator = resurrect

	local role = parent:CreateTexture(nil, "OVERLAY")
	role:SetSize(12, 12)
	role:SetPoint("TOPLEFT", 12, 8)
	self.RaidRoleIndicator = role
end

function UF:UpdateTargetBorder()
	if UnitIsUnit("target", self.unit) then
		self.TargetBorder:Show()
	else
		self.TargetBorder:Hide()
	end
end

function UF:CreateTargetBorder(self)
	local border = M.CreateSD(self, 3, true)
	border:SetOutside(self.Health.backdrop, R.mult+3, R.mult+3, self.Power.backdrop)
	border:SetBackdropBorderColor(.8, .8, .8)
	border:Hide()
	self.Shadow = nil

	self.TargetBorder = border
	self:RegisterEvent("PLAYER_TARGET_CHANGED", UF.UpdateTargetBorder, true)
	self:RegisterEvent("GROUP_ROSTER_UPDATE", UF.UpdateTargetBorder, true)
end

local function postUpdateThreat(element, _, status)
	if status then
		element:SetBackdropBorderColor(1, 0, 0)
	else
		element:SetBackdropBorderColor(0, 0, 0)
	end
end

function UF:CreateThreatBorder(self)
	local threatIndicator = M.CreateSD(self, 3, true)
	threatIndicator:SetOutside(self.Health.backdrop, R.mult+3, R.mult+3, self.Power.backdrop)
	threatIndicator:SetBackdropBorderColor(.7, .7, .7)
	threatIndicator:SetFrameLevel(0)
	self.Shadow = nil
	self.ThreatIndicator = threatIndicator
	self.ThreatIndicator.PostUpdate = postUpdateThreat
end

local debuffList = {}
function UF:UpdateRaidDebuffs()
	wipe(debuffList)
	for instType, value in pairs(R.RaidDebuffs) do
		for spellID, priority in pairs(value) do
			if not (MaoRUIDB["RaidDebuffs"][instType] and MaoRUIDB["RaidDebuffs"][instType][spellID]) then
				if not debuffList[instType] then debuffList[instType] = {} end
				debuffList[instType][spellID] = priority
			end
		end
	end
	for instType, value in pairs(MaoRUIDB["RaidDebuffs"]) do
		for spellID, priority in pairs(value) do
			if priority > 0 then
				if not debuffList[instType] then debuffList[instType] = {} end
				debuffList[instType][spellID] = priority
			end
		end
	end
end

local function buttonOnEnter(self)
	if not self.index then return end
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:ClearLines()
	GameTooltip:SetUnitAura(self.__owner.unit, self.index, self.filter)
	GameTooltip:Show()
end

function UF:CreateRaidDebuffs(self)
	local scale = MaoRUIPerDB["UFs"]["RaidDebuffScale"]
	local size = 18

	local bu = CreateFrame("Frame", nil, self)
	bu:SetSize(size, size)
	bu:SetPoint("RIGHT", -15, 0)
	bu:SetFrameLevel(self:GetFrameLevel() + 3)
	M.CreateSD(bu, 3, true)
	bu.Shadow:SetFrameLevel(self:GetFrameLevel() + 2)
	bu:SetScale(scale)
	bu:Hide()

	bu.icon = bu:CreateTexture(nil, "ARTWORK")
	bu.icon:SetAllPoints()
	bu.icon:SetTexCoord(unpack(I.TexCoord))

	local parentFrame = CreateFrame("Frame", nil, bu)
	parentFrame:SetAllPoints()
	parentFrame:SetFrameLevel(bu:GetFrameLevel() + 6)
	bu.count = M.CreateFS(parentFrame, 12, "", false, "BOTTOMRIGHT", 6, -3)
	bu.timer = M.CreateFS(bu, 12, "", false, "CENTER", 1, 0)
	bu.glowFrame = M.CreateGlowFrame(bu, size)

	if not MaoRUIPerDB["UFs"]["AurasClickThrough"] then
		bu:SetScript("OnEnter", buttonOnEnter)
		bu:SetScript("OnLeave", M.HideTooltip)
	end

	bu.ShowDispellableDebuff = true
	bu.ShowDebuffBorder = true
	bu.FilterDispellableDebuff = true
	if MaoRUIPerDB["UFs"]["InstanceAuras"] then
		if not next(debuffList) then UF:UpdateRaidDebuffs() end
		bu.Debuffs = debuffList
	end
	self.RaidDebuffs = bu
end

local keyList = {
	[1] = {KEY_BUTTON1, "", "%s1"},					-- 左键
	[2] = {KEY_BUTTON1, "ALT", "ALT-%s1"},			-- ALT+左键
	[3] = {KEY_BUTTON1, "CTRL", "CTRL-%s1"},		-- CTRL+左键
	[4] = {KEY_BUTTON1, "SHIFT", "SHIFT-%s1"},		-- SHIFT+左键

	[5] = {KEY_BUTTON2, "", "%s2"},					-- 右键
	[6] = {KEY_BUTTON2, "ALT", "ALT-%s2"},			-- ALT+右键
	[7] = {KEY_BUTTON2, "CTRL", "CTRL-%s2"},		-- CTRL+右键
	[8] = {KEY_BUTTON2, "SHIFT", "SHIFT-%s2"},		-- SHIFT+右键

	[9] = {KEY_BUTTON3, "", "%s3"},					-- 中键
	[10] = {KEY_BUTTON3, "ALT", "ALT-%s3"},			-- ALT+中键
	[11] = {KEY_BUTTON3, "CTRL", "CTRL-%s3"},		-- CTRL+中键
	[12] = {KEY_BUTTON3, "SHIFT", "SHIFT-%s3"},		-- SHIFT+中键

	[13] = {KEY_BUTTON4, "", "%s4"},				-- 鼠标键4
	[14] = {KEY_BUTTON4, "ALT", "ALT-%s4"},			-- ALT+鼠标键4
	[15] = {KEY_BUTTON4, "CTRL", "CTRL-%s4"},		-- CTRL+鼠标键4
	[16] = {KEY_BUTTON4, "SHIFT", "SHIFT-%s4"},		-- SHIFT+鼠标键4

	[17] = {KEY_BUTTON5, "", "%s5"},				-- 鼠标键5
	[18] = {KEY_BUTTON5, "ALT", "ALT-%s5"},			-- ALT+鼠标键5
	[19] = {KEY_BUTTON5, "CTRL", "CTRL-%s5"},		-- CTRL+鼠标键5
	[20] = {KEY_BUTTON5, "SHIFT", "SHIFT-%s5"},		-- SHIFT+鼠标键5

	[21] = {U["WheelUp"], "", "%s6"},				-- 滚轮上
	[22] = {U["WheelUp"], "ALT", "%s7"},			-- ALT+滚轮上
	[23] = {U["WheelUp"], "CTRL", "%s8"},			-- CTRL+滚轮上
	[24] = {U["WheelUp"], "SHIFT", "%s9"},			-- SHIFT+滚轮上

	[25] = {U["WheelDown"], "", "%s10"},			-- 滚轮下
	[26] = {U["WheelDown"], "ALT", "%s11"},			-- ALT+滚轮下
	[27] = {U["WheelDown"], "CTRL", "%s12"},		-- CTRL+滚轮下
	[28] = {U["WheelDown"], "SHIFT", "%s13"},		-- SHIFT+滚轮下
}

local defaultSpellList = {
	["DRUID"] = {
		[5] = 774,			-- 回春术
		[6] = 8936,			-- 愈合
		[9] = 20484,		-- 复生
	},
	["SHAMAN"] = {
		[2] = 526,			-- 消毒术
		[9] = 2008,			-- 先祖之魂
	},
	["PALADIN"] = {
		[2] = 4987,			-- 清洁术
		[5] = 20473,		-- 神圣震击
		[6] = 1022,			-- 保护祝福
		[9] = 10322,		-- 救赎
	},
	["PRIEST"] = {
		[2] = 527,			-- 驱散魔法
		[5] = 17,			-- 真言术盾
		[6] = 139,			-- 恢复
		[9] = 2006,			-- 复活术
	},
	["MAGE"] = {
		[2] = 475,			-- 解除诅咒
		[6] = 1460,			-- 奥术智慧
	},
	["ROGUE"] = {},
	["HUNTER"] = {},
	["WARRIOR"] = {},
	["WARLOCK"] = {},
}

function UF:DefaultClickSets()
	if not next(MaoRUIPerDB["RaidClickSets"]) then
		for k, v in pairs(defaultSpellList[I.MyClass]) do
			local clickSet = keyList[k][2]..keyList[k][1]
			MaoRUIPerDB["RaidClickSets"][clickSet] = {keyList[k][1], keyList[k][2], v}
		end
	end
end

local wheelBindingIndex = {
	["MOUSEWHEELUP"] = 6,
	["ALT-MOUSEWHEELUP"] = 7,
	["CTRL-MOUSEWHEELUP"] = 8,
	["SHIFT-MOUSEWHEELUP"] = 9,
	["MOUSEWHEELDOWN"] = 10,
	["ALT-MOUSEWHEELDOWN"] = 11,
	["CTRL-MOUSEWHEELDOWN"] = 12,
	["SHIFT-MOUSEWHEELDOWN"] = 13,
}

local onEnterString = "self:ClearBindings();"
local onLeaveString = onEnterString
for keyString, keyIndex in pairs(wheelBindingIndex) do
	onEnterString = format("%sself:SetBindingClick(0, \"%s\", self:GetName(), \"Button%d\");", onEnterString, keyString, keyIndex)
end
local onMouseString = "if not self:IsUnderMouse(false) then self:ClearBindings(); end"

local function setupMouseWheelCast(self)
	local found
	for _, data in pairs(MaoRUIPerDB["RaidClickSets"]) do
		if strmatch(data[1], U["Wheel"]) then
			found = true
			break
		end
	end

	if found then
		self:SetAttribute("_onenter", onEnterString)
		self:SetAttribute("_onleave", onLeaveString)
		self:SetAttribute("_onshow", onLeaveString)
		self:SetAttribute("_onhide", onLeaveString)
		self:SetAttribute("_onmousedown", onMouseString)
	end
end

local function setupClickSets(self)
	if self.clickCastRegistered then return end

	for _, data in pairs(MaoRUIPerDB["RaidClickSets"]) do
		local key, modKey, value = unpack(data)
		for _, v in ipairs(keyList) do
			if v[1] == key and v[2] == modKey then
				if tonumber(value) then
					local name = GetSpellInfo(value)
					self:SetAttribute(format(v[3], "type"), "spell")
					self:SetAttribute(format(v[3], "spell"), name)
				elseif value == "target" then
					self:SetAttribute(format(v[3], "type"), "target")
				elseif value == "follow" then
					self:SetAttribute(format(v[3], "type"), "macro")
					self:SetAttribute(format(v[3], "macrotext"), "/follow mouseover")
				elseif strmatch(value, "/") then
					self:SetAttribute(format(v[3], "type"), "macro")
					value = gsub(value, "~", "\n")
					self:SetAttribute(format(v[3], "macrotext"), value)
				end
				break
			end
		end
	end

	setupMouseWheelCast(self)
	self:RegisterForClicks("AnyDown")

	self.clickCastRegistered = true
end

local pendingFrames = {}
function UF:CreateClickSets(self)
	if not MaoRUIPerDB["UFs"]["RaidClickSets"] then return end

	if InCombatLockdown() then
		pendingFrames[self] = true
	else
		setupClickSets(self)
		pendingFrames[self] = nil
	end
end

function UF:DelayClickSets()
	if not next(pendingFrames) then return end

	for frame in next, pendingFrames do
		UF:CreateClickSets(frame)
	end
end

function UF:AddClickSetsListener()
	if not MaoRUIPerDB["UFs"]["RaidClickSets"] then return end

	M:RegisterEvent("PLAYER_REGEN_ENABLED", UF.DelayClickSets)
end

local counterOffsets = {
	["TOPLEFT"] = {{6, 1}, {"LEFT", "RIGHT", -2, 0}},
	["TOPRIGHT"] = {{-6, 1}, {"RIGHT", "LEFT", 2, 0}},
	["BOTTOMLEFT"] = {{6, 1},{"LEFT", "RIGHT", -2, 0}},
	["BOTTOMRIGHT"] = {{-6, 1}, {"RIGHT", "LEFT", 2, 0}},
	["LEFT"] = {{6, 1}, {"LEFT", "RIGHT", -2, 0}},
	["RIGHT"] = {{-6, 1}, {"RIGHT", "LEFT", 2, 0}},
	["TOP"] = {{0, 0}, {"RIGHT", "LEFT", 2, 0}},
	["BOTTOM"] = {{0, 0}, {"RIGHT", "LEFT", 2, 0}},
}

function UF:BuffIndicatorOnUpdate(elapsed)
	M.CooldownOnUpdate(self, elapsed, true)
end

local found = {}
local auraFilter = {"HELPFUL", "HARMFUL"}

function UF:UpdateBuffIndicator(event, unit)
	if event == "UNIT_AURA" and self.unit ~= unit then return end

	local spellList = MaoRUIDB["CornerBuffs"][I.MyClass]
	local buttons = self.BuffIndicator
	unit = self.unit

	wipe(found)
	for _, filter in next, auraFilter do
		for i = 1, 32 do
			local name, texture, count, _, duration, expiration, caster, _, _, spellID = UnitAura(unit, i, filter)
			if not name then break end
			local value = spellList[spellID] or R.CornerBuffsByName[name]
			if value and (value[3] or caster == "player" or caster == "pet") then
				if duration == 0 then
					local newduration, newexpires = LCD:GetAuraDurationByUnit(unit, spellID, caster, name)
					if newduration then
						duration, expiration = newduration, newexpires
					end
				end

				for _, bu in pairs(buttons) do
					if bu.anchor == value[1] then
						if MaoRUIPerDB["UFs"]["BuffIndicatorType"] == 3 then
							if duration and duration > 0 then
								bu.expiration = expiration
								bu:SetScript("OnUpdate", UF.BuffIndicatorOnUpdate)
							else
								bu:SetScript("OnUpdate", nil)
							end
							bu.timer:SetTextColor(unpack(value[2]))
						else
							if duration and duration > 0 then
								bu.cd:SetCooldown(expiration - duration, duration)
								bu.cd:Show()
							else
								bu.cd:Hide()
							end
							if MaoRUIPerDB["UFs"]["BuffIndicatorType"] == 1 then
								bu.icon:SetVertexColor(unpack(value[2]))
							else
								bu.icon:SetTexture(texture)
							end
						end
						if count > 1 then bu.count:SetText(count) end
						bu:Show()
						found[bu.anchor] = true
						break
					end
				end
			end
		end
	end

	for _, bu in pairs(buttons) do
		if not found[bu.anchor] then
			bu:Hide()
		end
	end
end

function UF:RefreshBuffIndicator(bu)
	if MaoRUIPerDB["UFs"]["BuffIndicatorType"] == 3 then
		local point, anchorPoint, x, y = unpack(counterOffsets[bu.anchor][2])
		bu.timer:Show()
		bu.count:ClearAllPoints()
		bu.count:SetPoint(point, bu.timer, anchorPoint, x, y)
		bu.icon:Hide()
		bu.cd:Hide()
		bu.bg:Hide()
	else
		bu:SetScript("OnUpdate", nil)
		bu.timer:Hide()
		bu.count:ClearAllPoints()
		bu.count:SetPoint("CENTER", unpack(counterOffsets[bu.anchor][1]))
		if MaoRUIPerDB["UFs"]["BuffIndicatorType"] == 1 then
			bu.icon:SetTexture(I.bdTex)
		else
			bu.icon:SetVertexColor(1, 1, 1)
		end
		bu.icon:Show()
		bu.cd:Show()
		bu.bg:Show()
	end
end

function UF:CreateBuffIndicator(self)
	if not MaoRUIPerDB["UFs"]["RaidBuffIndicator"] then return end
	if MaoRUIPerDB["UFs"]["SimpleMode"] and not self.isPartyFrame then return end

	local anchors = {"TOPLEFT", "TOP", "TOPRIGHT", "LEFT", "RIGHT", "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT"}
	local buttons = {}
	for _, anchor in pairs(anchors) do
		local bu = CreateFrame("Frame", nil, self.Health)
		bu:SetFrameLevel(self:GetFrameLevel()+10)
		bu:SetSize(10, 10)
		bu:SetScale(MaoRUIPerDB["UFs"]["BuffIndicatorScale"])
		bu:SetPoint(anchor)
		bu:Hide()

		bu.bg = M.CreateBDFrame(bu)
		bu.icon = bu:CreateTexture(nil, "BORDER")
		bu.icon:SetInside(bu.bg)
		bu.icon:SetTexCoord(unpack(I.TexCoord))
		bu.cd = CreateFrame("Cooldown", nil, bu, "CooldownFrameTemplate")
		bu.cd:SetInside(bu.bg)
		bu.cd:SetReverse(true)
		bu.cd:SetHideCountdownNumbers(true)
		bu.timer = M.CreateFS(bu, 12, "", false, "CENTER", -counterOffsets[anchor][2][3], 0)
		bu.count = M.CreateFS(bu, 12, "")

		bu.anchor = anchor
		tinsert(buttons, bu)

		UF:RefreshBuffIndicator(bu)
	end

	self.BuffIndicator = buttons
	self:RegisterEvent("UNIT_AURA", UF.UpdateBuffIndicator)
	self:RegisterEvent("GROUP_ROSTER_UPDATE", UF.UpdateBuffIndicator, true)
end

function UF:RefreshRaidFrameIcons()
	for _, frame in pairs(oUF.objects) do
		if frame.mystyle == "raid" then
			if frame.RaidDebuffs then
				frame.RaidDebuffs:SetScale(MaoRUIPerDB["UFs"]["RaidDebuffScale"])
			end
			if frame.BuffIndicator then
				for _, bu in pairs(frame.BuffIndicator) do
					bu:SetScale(MaoRUIPerDB["UFs"]["BuffIndicatorScale"])
					UF:RefreshBuffIndicator(bu)
				end
			end
		end
	end
end