﻿local _, ns = ...
local M, R, U, I = unpack(ns)
local A = M:GetModule("Auras")

-- Libs
I.LibClassicDurations = LibStub("LibClassicDurations")
I.LibClassicDurations:RegisterFrame("_ShiGuang")
local LCD = I.LibClassicDurations

local maxFrames = 12 -- Max Tracked Auras
local updater = CreateFrame("Frame")
local AuraList, FrameList, UnitIDTable, IntTable, IntCD, myTable, cooldownTable = {}, {}, {}, {}, {}, {}, {}
local pairs, select, tinsert, tremove, wipe = pairs, select, table.insert, table.remove, table.wipe
local InCombatLockdown, UnitBuff, UnitDebuff, GetPlayerInfoByGUID, UnitInRaid, UnitInParty = InCombatLockdown, UnitBuff, UnitDebuff, GetPlayerInfoByGUID, UnitInRaid, UnitInParty
local GetTime, GetSpellInfo, GetSpellCooldown, GetSpellCharges, GetTotemInfo = GetTime, GetSpellInfo, GetSpellCooldown, GetSpellCharges, GetTotemInfo
local GetItemCooldown, GetItemInfo, GetInventoryItemLink, GetInventoryItemCooldown = GetItemCooldown, GetItemInfo, GetInventoryItemLink, GetInventoryItemCooldown

-- DataConvert
local function DataAnalyze(v)
	local newTable = {}
	if type(v[1]) == "number" then
		newTable.IntID = v[1]
		newTable.Duration = v[2]
		if v[3] == "OnCastSuccess" then newTable.OnSuccess = true end
		newTable.UnitID = v[4]
		newTable.ItemID = v[5]
	else
		newTable[v[1]] = v[2]
		newTable.UnitID = v[3]
		newTable.Caster = v[4]
		newTable.Stack = v[5]
		newTable.Value = v[6]
		newTable.Timeless = v[7]
		newTable.Combat = v[8]
		newTable.Text = v[9]
		newTable.Flash = v[10]
	end

	return newTable
end

local function InsertData(index, target)
	if MaoRUIPerDB["AuraWatchList"]["Switcher"][index] then
		wipe(target)
	end

	for spellID, v in pairs(myTable[index]) do
		local value = target[spellID]
		if value and value.AuraID == v.AuraID then
			value = nil
		end
		target[spellID] = v
	end
end

local function ConvertTable()
	for i = 1, 10 do
		myTable[i] = {}
		if i < 10 then
			local value = MaoRUIPerDB["AuraWatchList"][i]
			if value and next(value) then
				for spellID, v in pairs(value) do
					myTable[i][spellID] = DataAnalyze(v)
				end
			end
		else
			if next(MaoRUIPerDB["InternalCD"]) then
				for spellID, v in pairs(MaoRUIPerDB["InternalCD"]) do
					myTable[i][spellID] = DataAnalyze(v)
				end
			end
		end
	end

	for _, v in pairs(R.AuraWatchList[I.MyClass]) do
		if v.Name == "Player Aura" then
			InsertData(1, v.List)
		elseif v.Name == "Target Aura" then
			InsertData(3, v.List)
		elseif v.Name == "Special Aura" then
			InsertData(2, v.List)
		elseif v.Name == "Focus Aura" then
			InsertData(5, v.List)
		elseif v.Name == "Spell Cooldown" then
			InsertData(6, v.List)
		end
	end

	for i, v in pairs(R.AuraWatchList["ALL"]) do
		if v.Name == "Enchant Aura" then
			InsertData(7, v.List)
		elseif v.Name == "Raid Buff" then
			InsertData(8, v.List)
		elseif v.Name == "Raid Debuff" then
			InsertData(9, v.List)
		elseif v.Name == "Warning" then
			InsertData(4, v.List)
		elseif v.Name == "InternalCD" then
			InsertData(10, v.List)
			IntCD = v
			tremove(R.AuraWatchList["ALL"], i)
		end
	end
end

local function BuildAuraList()
	AuraList = R.AuraWatchList["ALL"] or {}
	for class in pairs(R.AuraWatchList) do
		if class == I.MyClass then
			for _, value in pairs(R.AuraWatchList[class]) do
				tinsert(AuraList, value)
			end
		end
	end
	wipe(R.AuraWatchList)
end

local auraListByName = {}
local function BuildNamesForSpellRank()
	if not MaoRUIPerDB["AuraWatch"]["WatchSpellRank"] then return end

	for KEY, VALUE in pairs(AuraList) do
		for spellID, value in pairs(VALUE.List) do
			local name = GetSpellInfo(spellID)
			if value.AuraID and name then
				if not auraListByName[KEY] then auraListByName[KEY] = {} end
				if not auraListByName[KEY][name] then
					auraListByName[KEY][name] = value
				end
			end
		end
	end
end

local function ConvertIntCDToNameTable()
	local newTable = {}
	for spellID, value in pairs(IntCD.List) do
		local name = GetSpellInfo(spellID)
		if name then
			newTable[name] = value
		end
	end

	wipe(IntCD.List)
	IntCD.List = newTable
end

local function BuildUnitIDTable()
	for _, VALUE in pairs(AuraList) do
		for _, value in pairs(VALUE.List) do
			local flag = true
			for _, v in pairs(UnitIDTable) do
				if value.UnitID == v then flag = false end
			end
			if flag then tinsert(UnitIDTable, value.UnitID) end
		end
	end
end

local function BuildCooldownTable()
	for KEY, VALUE in pairs(AuraList) do
		for spellID, value in pairs(VALUE.List) do
			if value.SpellID or value.ItemID or value.SlotID or value.TotemID then
				if not cooldownTable[KEY] then cooldownTable[KEY] = {} end
				cooldownTable[KEY][spellID] = true
			end
		end
	end
end

local function MakeMoveHandle(frame, text, value, anchor)
	local mover = M.Mover(frame, I.InfoColor..text, value, anchor, nil, nil, true)
	frame:ClearAllPoints()
	frame:SetPoint("CENTER", mover)

	return mover
end

-- Aurawatch style
local PetBattleFrameHider = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
PetBattleFrameHider:SetAllPoints()
PetBattleFrameHider:SetFrameStrata("LOW")
RegisterStateDriver(PetBattleFrameHider, "visibility", "[petbattle] hide; show")

-- BuildICON
local function tooltipOnEnter(self)
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 3)
	if self.type == 1 then
		GameTooltip:SetSpellByID(self.spellID)
	elseif self.type == 2 then
		GameTooltip:SetHyperlink(select(2, GetItemInfo(self.spellID)))
	elseif self.type == 3 then
		GameTooltip:SetInventoryItem("player", self.spellID)
	elseif self.type == 4 then
		GameTooltip:SetUnitAura(self.unitID, self.id, self.filter)
	end
	GameTooltip:Show()
end

local function enableTooltip(self)
	self:EnableMouse(true)
	self.HL = self:CreateTexture(nil, "HIGHLIGHT")
	self.HL:SetColorTexture(1, 1, 1, .25)
	self.HL:SetAllPoints(self.Icon)
	self:SetScript("OnEnter", tooltipOnEnter)
	self:SetScript("OnLeave", M.HideTooltip)
end

-- Icon mode
local function BuildICON(iconSize)
	iconSize = iconSize * MaoRUIPerDB["AuraWatch"]["IconScale"]

	local frame = CreateFrame("Frame", nil, PetBattleFrameHider)
	frame:SetSize(iconSize, iconSize)
	M.CreateSD(frame, 3, 3)

	frame.Icon = frame:CreateTexture(nil, "ARTWORK")
	frame.Icon:SetAllPoints()
	frame.Icon:SetTexCoord(unpack(I.TexCoord))

	frame.Cooldown = CreateFrame("Cooldown", nil, frame, "CooldownFrameTemplate")
	frame.Cooldown:SetAllPoints()
	frame.Cooldown:SetReverse(true)

	local parentFrame = CreateFrame("Frame", nil, frame)
	parentFrame:SetAllPoints()
	parentFrame:SetFrameLevel(frame:GetFrameLevel() + 5)

	frame.Spellname = M.CreateFS(parentFrame, 12, "", false, "BOTTOM", 0, -3)
	frame.Count = M.CreateFS(parentFrame, iconSize*.55, "", false, "BOTTOMRIGHT", 6, -3)
	frame.glowFrame = M.CreateBG(frame, 4)
	frame.glowFrame:SetSize(iconSize+8, iconSize+8)

	if not MaoRUIPerDB["AuraWatch"]["ClickThrough"] then enableTooltip(frame) end

	frame:Hide()
	return frame
end
-- BuildTEXT
local function BuildTEXT(iconSize)
	local frame = CreateFrame("Frame", nil, PetBattleFrameHider)
	frame:SetSize(iconSize, iconSize)
	--M.CreateSD(Frame, 3, 3)

	frame.Icon = frame:CreateTexture(nil, "ARTWORK")
	frame.Icon:SetAllPoints()
	frame.Icon:SetTexCoord(unpack(I.TexCoord))

	frame.Count = M.CreateFS(frame, iconSize*.55, "", false, "BOTTOMRIGHT", 6, -3)
	frame.Spellname = M.CreateFS(frame, 12, "", false, "LEFT", iconSize, -3)

	if not MaoRUIPerDB["AuraWatch"]["ClickThrough"] then enableTooltip(frame) end

	frame:Hide()
	return frame
end
-- Bar mode
local function BuildBAR(barWidth, iconSize)
	local frame = CreateFrame("Frame", nil, PetBattleFrameHider)
	frame:SetSize(iconSize, iconSize)
	M.CreateSD(frame, 2, 2)

	frame.Icon = frame:CreateTexture(nil, "ARTWORK")
	frame.Icon:SetAllPoints()
	frame.Icon:SetTexCoord(unpack(I.TexCoord))

	frame.Statusbar = CreateFrame("StatusBar", nil, frame)
	frame.Statusbar:SetSize(barWidth, iconSize/2.5)
	frame.Statusbar:SetPoint("BOTTOMLEFT", frame, "BOTTOMRIGHT", 1, 0)
	frame.Statusbar:SetMinMaxValues(0, 1)
	frame.Statusbar:SetValue(0)
	M.CreateSB(frame.Statusbar, true)

	frame.Count = M.CreateFS(frame, 14, "", false, "BOTTOMRIGHT", 3, -1)
	frame.Time = M.CreateFS(frame.Statusbar, 12, "", false, "RIGHT", 0, 8)
	frame.Spellname = M.CreateFS(frame.Statusbar, 11, "", false, "LEFT", 1, 8)
	frame.Spellname:SetWidth(frame.Statusbar:GetWidth()*.65)
	frame.Spellname:SetJustifyH("LEFT")
	if not MaoRUIPerDB["AuraWatch"]["ClickThrough"] then enableTooltip(frame) end

	frame:Hide()
	return frame
end
-- BuildBAR2
local function BuildBAR2(barWidth, iconSize)
	local frame = CreateFrame("Frame", nil, PetBattleFrameHider)
	frame:SetSize(iconSize, iconSize)
	M.CreateSD(frame, 2, 2)

	frame.Icon = frame:CreateTexture(nil, "ARTWORK")
	frame.Icon:SetAllPoints()
	frame.Icon:SetTexCoord(unpack(I.TexCoord))

	frame.Statusbar = CreateFrame("StatusBar", nil, frame)
	frame.Statusbar:SetSize(barWidth, iconSize/2.5)
	frame.Statusbar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMLEFT", -1, 0)
	frame.Statusbar:SetMinMaxValues(0, 1)
	frame.Statusbar:SetValue(0)
	M.CreateSB(frame.Statusbar, true)

	frame.Count = M.CreateFS(frame, 14, "", false, "BOTTOMRIGHT", 3, -1)
	frame.Time = M.CreateFS(frame.Statusbar, 12, "", false, "RIGHT", 0, 8)
	frame.Spellname = M.CreateFS(frame.Statusbar, 11, "", false, "LEFT", 1, 8)
	frame.Spellname:SetWidth(frame.Statusbar:GetWidth()*.65)
	frame.Spellname:SetJustifyH("LEFT")

	if not MaoRUIPerDB["AuraWatch"]["ClickThrough"] then enableTooltip(frame) end

	frame:Hide()
	return frame
end
-----> STYLED CODE END

-- List and anchor
local function BuildAura()
	for key, value in pairs(AuraList) do
		local frameTable = {}
		for i = 1, maxFrames do
			if value.Mode:lower() == "icon" then
				local frame = BuildICON(value.IconSize)
				if i == 1 then frame.MoveHandle = MakeMoveHandle(frame, U[value.Name], key, value.Pos) end
				tinsert(frameTable, frame)
			elseif value.Mode:lower() == "text" then
				local frame = BuildTEXT(value.IconSize)
				if i == 1 then frame.MoveHandle = MakeMoveHandle(frame, U[value.Name], key, value.Pos) end
				tinsert(frameTable, frame)
			elseif value.Mode:lower() == "bar" then
				local frame = BuildBAR(value.BarWidth, value.IconSize)
				if i == 1 then frame.MoveHandle = MakeMoveHandle(frame, U[value.Name], key, value.Pos) end
				tinsert(frameTable, frame)
			elseif value.Mode:lower() == "bar2" then
				local frame = BuildBAR2(value.BarWidth, value.IconSize)
				if i == 1 then frame.MoveHandle = MakeMoveHandle(frame, U[value.Name], key, value.Pos) end
				tinsert(frameTable, frame)
			end
		end
		frameTable.Index = 1
		tinsert(FrameList, frameTable)
	end
end

local function SetupAnchor()
	for key, VALUE in pairs(FrameList) do
		local value = AuraList[key]
		local previous
		for i = 1, #VALUE do
			local frame = VALUE[i]
			if i == 1 then
				frame:SetPoint("CENTER", frame.MoveHandle)
			elseif (value.Name == "Target Aura" or value.Name == "Enchant Aura") and i == 7 then
				frame:SetPoint("BOTTOM", VALUE[1], "TOP", 0, value.Interval)
			else
				if value.Direction:lower() == "right" then
					frame:SetPoint("LEFT", previous, "RIGHT", value.Interval, 0)
				elseif value.Direction:lower() == "left" then
					frame:SetPoint("RIGHT", previous, "LEFT", -value.Interval, 0)
				elseif value.Direction:lower() == "up" then
					frame:SetPoint("BOTTOM", previous, "TOP", 0, value.Interval)
				elseif value.Direction:lower() == "down" then
					frame:SetPoint("TOP", previous, "BOTTOM", 0, -value.Interval)
				end
			end
			previous = frame
		end
	end
end

local function InitSetup()
	ConvertTable()
	BuildAuraList()
	BuildNamesForSpellRank()
	ConvertIntCDToNameTable()
	BuildUnitIDTable()
	BuildCooldownTable()
	BuildAura()
	SetupAnchor()
end

-- Update timer
function A:AuraWatch_UpdateTimer()
	if self.expires then
		self.elapsed = self.expires - GetTime()
	else
		self.elapsed = self.start + self.duration - GetTime()
	end

	local timer = self.elapsed
	if timer < 0 then
		if self.Time then self.Time:SetText("^-^") end
		self.Statusbar:SetMinMaxValues(0, 1)
		self.Statusbar:SetValue(0)
		self.Statusbar.Spark:Hide()
	elseif timer < 60 then
		if self.Time then self.Time:SetFormattedText("%.1f", timer) end
		self.Statusbar:SetMinMaxValues(0, self.duration)
		self.Statusbar:SetValue(timer)
		self.Statusbar.Spark:Show()
	else
		if self.Time then self.Time:SetFormattedText("%d:%.2d", timer/60, timer%60) end
		self.Statusbar:SetMinMaxValues(0, self.duration)
		self.Statusbar:SetValue(timer)
		self.Statusbar.Spark:Show()
	end
end

-- Update cooldown
function A:AuraWatch_SetupCD(index, name, icon, start, duration, _, type, id, charges)
	local frames = FrameList[index]
	local frame = frames[frames.Index]
	if frame then frame:Show() end
	if frame.Icon then frame.Icon:SetTexture(icon) end
	if frame.Cooldown then
		frame.Cooldown:SetReverse(false)
		frame.Cooldown:SetCooldown(start, duration)
		frame.Cooldown:Show()
	end
	if frame.Count then frame.Count:SetText(charges) end
	if frame.Spellname then frame.Spellname:SetText(name) end
	if frame.Statusbar then
		frame.duration = duration
		frame.start = start
		frame.elapsed = 0
		frame:SetScript("OnUpdate", A.AuraWatch_UpdateTimer)
	end
	frame.type = type
	frame.spellID = id

	frames.Index = (frames.Index + 1 > maxFrames) and maxFrames or frames.Index + 1
end

function A:AuraWatch_UpdateCD()
	for KEY, VALUE in pairs(cooldownTable) do
		for spellID in pairs(VALUE) do
			local group = AuraList[KEY]
			local value = group.List[spellID]
			if value then
				if value.SpellID then
					local name, _, icon = GetSpellInfo(value.SpellID)
					local start, duration = GetSpellCooldown(value.SpellID)
					local charges, maxCharges, chargeStart, chargeDuration = GetSpellCharges(value.SpellID)
					if group.Mode:lower() == "icon" then name = nil end
					if charges and maxCharges and maxCharges > 1 and charges < maxCharges then
						A:AuraWatch_SetupCD(KEY, name, icon, chargeStart, chargeDuration, true, 1, value.SpellID, charges)
					--elseif start and duration > 1.5 then
					elseif start and duration > 3 then -- FOR CLASSIC WOW
						A:AuraWatch_SetupCD(KEY, name, icon, start, duration, true, 1, value.SpellID)
					end
				elseif value.ItemID then
					local start, duration = GetItemCooldown(value.ItemID)
					if start and duration > 1.5 then
						local name, _, _, _, _, _, _, _, _, icon = GetItemInfo(value.ItemID)
						if group.Mode:lower() == "icon" then name = nil end
						A:AuraWatch_SetupCD(KEY, name, icon, start, duration, false, 2, value.ItemID)
					end
				elseif value.SlotID then
					local link = GetInventoryItemLink("player", value.SlotID)
					if link then
						local name, _, _, _, _, _, _, _, _, icon = GetItemInfo(link)
						local start, duration = GetInventoryItemCooldown("player", value.SlotID)
						if duration > 1.5 then
							if group.Mode:lower() == "icon" then name = nil end
							A:AuraWatch_SetupCD(KEY, name, icon, start, duration, false, 3, value.SlotID)
						end
					end
				elseif value.TotemID then
					local haveTotem, name, start, duration, icon, id = GetTotemInfo(value.TotemID)
					if haveTotem and start > 0 and duration > 0 then
						if group.Mode:lower() == "icon" then name = nil end
						A:AuraWatch_SetupCD(KEY, name, icon, start, duration, false, 1, id)
					end
				end
			end
		end
	end
end

-- UpdateAura
function A:AuraWatch_SetupAura(index, UnitID, name, icon, count, duration, expires, id, filter, flash)
	if not index then return end

	local frames = FrameList[index]
	local frame = frames[frames.Index]
	if frame then frame:Show() end
	if frame.Icon then frame.Icon:SetTexture(icon) end
	if frame.Count then frame.Count:SetText(count > 1 and count or nil) end
	if frame.Cooldown then
		frame.Cooldown:SetReverse(true)
		frame.Cooldown:SetCooldown(expires-duration, duration)
	end
	if frame.Spellname then frame.Spellname:SetText(name) end
	if frame.Statusbar then
		frame.duration = duration
		frame.expires = expires
		frame.elapsed = 0
		frame:SetScript("OnUpdate", A.AuraWatch_UpdateTimer)
	end
	if frame.glowFrame then
		if flash then
			M.ShowOverlayGlow(frame.glowFrame)
		else
			M.HideOverlayGlow(frame.glowFrame)
		end
	end
	frame.type = 4
	frame.unitID = UnitID
	frame.id = id
	frame.filter = filter

	frames.Index = (frames.Index + 1 > maxFrames) and maxFrames or frames.Index + 1
end

function A:AuraWatch_UpdateAura(spellName, spellID, UnitID, index, bool)
	for KEY, VALUE in pairs(AuraList) do
		local value = VALUE.List[spellID]
		if not value then
			value = auraListByName[KEY] and auraListByName[KEY][spellName]
		end
		if value and value.AuraID and value.UnitID == UnitID then
			local filter = bool and "HELPFUL" or "HARMFUL"
			local name, icon, count, _, duration, expires, caster, _, _, spellID, _, _, _, _, _, number = UnitAura(value.UnitID, index, filter)

			if duration == 0 then
				local newduration, newexpires = LCD:GetAuraDurationByUnit(UnitID, spellID, caster, name)
				if newduration then
					duration, expires = newduration, newexpires
				end
			end

			if value.Combat and not InCombatLockdown() then return false end
			if value.Caster and value.Caster:lower() ~= caster then return false end
			if value.Stack and count and value.Stack > count then return false end
			if value.Value and number then
				if VALUE.Mode:lower() == "icon" then
					name = M.Numb(number)
						elseif VALUE.Mode:lower() == "text" then
							name = M.Numb(number)
				elseif VALUE.Mode:lower() == "bar" then
					name = name..":"..M.Numb(number)
				end
			else
				if VALUE.Mode:lower() == "icon" then
							name = value.Text or nil
						elseif VALUE.Mode:lower() == "text" then
					name = value.Text or nil
				elseif VALUE.Mode:lower() == "bar" then
					name = name
				end
			end
			if value.Timeless then duration, expires = 0, 0 end
			return KEY, value.UnitID, name, icon, count, duration, expires, index, filter, value.Flash
		end
	end
	return false
end

function A:UpdateAuraWatch(UnitID)
	local index = 1
    while true do
		local name, _, _, _, _, _, _, _, _, spellID = UnitBuff(UnitID, index)
		if not name then break end
		A:AuraWatch_SetupAura(A:AuraWatch_UpdateAura(name, spellID, UnitID, index, true))
		index = index + 1
	end

	local index = 1
    while true do
		local name, _, _, _, _, _, _, _, _, spellID = UnitDebuff(UnitID, index)
		if not name then break end
		A:AuraWatch_SetupAura(A:AuraWatch_UpdateAura(name, spellID, UnitID, index, false))
		index = index + 1
	end
end

-- Update InternalCD
function A:AuraWatch_SortBars()
	if not IntCD.MoveHandle then
		IntCD.MoveHandle = MakeMoveHandle(IntTable[1], U[IntCD.Name], "InternalCD", IntCD.Pos)
	end

	for i = 1, #IntTable do
		IntTable[i]:ClearAllPoints()
		if i == 1 then
			IntTable[i]:SetPoint("CENTER", IntCD.MoveHandle)
		elseif IntCD.Direction:lower() == "right" then
			IntTable[i]:SetPoint("LEFT", IntTable[i-1], "RIGHT", IntCD.Interval, 0)
		elseif IntCD.Direction:lower() == "left" then
			IntTable[i]:SetPoint("RIGHT", IntTable[i-1], "LEFT", -IntCD.Interval, 0)
		elseif IntCD.Direction:lower() == "up" then
			IntTable[i]:SetPoint("BOTTOM", IntTable[i-1], "TOP", 0, IntCD.Interval)
		elseif IntCD.Direction:lower() == "down" then
			IntTable[i]:SetPoint("TOP", IntTable[i-1], "BOTTOM", 0, -IntCD.Interval)
		end
		IntTable[i].ID = i
	end
end

function A:AuraWatch_IntTimer(elapsed)
	self.elapsed = self.elapsed + elapsed
	local timer = self.duration - self.elapsed
	if timer < 0 then
		self:SetScript("OnUpdate", nil)
		self:Hide()
		tremove(IntTable, self.ID)
		A:AuraWatch_SortBars()
	elseif timer < 60 then
		if self.Time then self.Time:SetFormattedText("%.1f", timer) end
		self.Statusbar:SetValue(timer)
		self.Statusbar.Spark:Show()
	else
		if self.Time then self.Time:SetFormattedText("%d:%.2d", timer/60, timer%60) end
		self.Statusbar:SetValue(timer)
		self.Statusbar.Spark:Show()
	end
end

function A:AuraWatch_SetupInt(intID, itemID, duration, unitID, guid, sourceName)
	if not PetBattleFrameHider:IsShown() then return end

	local frame = BuildBAR(IntCD.BarWidth, IntCD.IconSize)
	if frame then
		frame:Show()
		tinsert(IntTable, frame)
		A:AuraWatch_SortBars()
	end
	local name, icon, _, class
	if itemID then
		name, _, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)
		frame.type = 2
		frame.spellID = itemID
	else
		name, _, icon = GetSpellInfo(intID)
		frame.type = 1
		frame.spellID = intID
	end
	if unitID:lower() == "all" then
		class = select(2, GetPlayerInfoByGUID(guid))
		name = "*"..sourceName
	else
		class = I.MyClass
	end
	if frame.Icon then frame.Icon:SetTexture(icon) end
	if frame.Count then frame.Count:SetText(nil) end
	if frame.Cooldown then
		frame.Cooldown:SetReverse(true)
		frame.Cooldown:SetCooldown(GetTime(), duration)
	end
	if frame.Spellname then frame.Spellname:SetText(name) end
	if frame.Statusbar then
		frame.Statusbar:SetStatusBarColor(M.ClassColor(class))
		frame.Statusbar:SetMinMaxValues(0, duration)
		frame.elapsed = 0
		frame.duration = duration
		frame:SetScript("OnUpdate", A.AuraWatch_IntTimer)
	end
end

local eventList = {
	["SPELL_AURA_APPLIED"] = true,
	["SPELL_AURA_REFRESH"] = true,
}

local function checkPetFlags(sourceFlags, all)
	if sourceFlags == I.MyPetFlags or (all and (sourceFlags == I.PartyPetFlags or sourceFlags == I.RaidPetFlags)) then
		return true
	end
end

function A:IsUnitWeNeed(value, name, flags)
	if not value.UnitID then value.UnitID = "Player" end
	if value.UnitID:lower() == "all" then
		if name and (UnitInRaid(name) or UnitInParty(name) or checkPetFlags(flags, true)) then
			return true
		end
	elseif value.UnitID:lower() == "player" then
		if name and name == I.MyName or checkPetFlags(flags) then
			return true
		end
	end
end

function A:IsAuraTracking(value, eventType, sourceName, sourceFlags, destName, destFlags)
	if value.OnSuccess and eventType == "SPELL_CAST_SUCCESS" and A:IsUnitWeNeed(value, sourceName, sourceFlags) then
		return true
	elseif not value.OnSuccess and eventList[eventType] and A:IsUnitWeNeed(value, destName, destFlags) then
		return true
	end
end

local cache = {}
function A:AuraWatch_UpdateInt(_, ...)
	if not IntCD.List then return end

	local timestamp, eventType, _, sourceGUID, sourceName, sourceFlags, _, destGUID, destName, destFlags, _, _, spellName = ...
	local value = IntCD.List[spellName]
	if value and cache[timestamp] ~= spellName and A:IsAuraTracking(value, eventType, sourceName, sourceFlags, destName, destFlags) then
		local guid, name = destGUID, destName
		if value.OnSuccess then guid, name = sourceGUID, sourceName end

		A:AuraWatch_SetupInt(value.IntID, value.ItemID, value.Duration, value.UnitID, guid, name)
		cache[timestamp] = spellName
	end

	if #cache > 666 then wipe(cache) end
end

-- CleanUp
function A:AuraWatch_Cleanup()	-- FIXME: there should be a better way to do this
	for _, value in pairs(FrameList) do
		for i = 1, maxFrames do
			local frame = value[i]
			if not frame:IsShown() then break end
			if frame then
				frame:Hide()
				frame:SetScript("OnUpdate", nil)
			end
			if frame.Icon then frame.Icon:SetTexture(nil) end
			if frame.Count then frame.Count:SetText(nil) end
			if frame.Spellname then frame.Spellname:SetText(nil) end
		end
		value.Index = 1
	end
end

-- Event
function A.AuraWatch_OnEvent(event, ...)
	if not MaoRUIPerDB["AuraWatch"]["Enable"] then
		M:UnregisterEvent("PLAYER_ENTERING_WORLD", A.AuraWatch_OnEvent)
		M:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", A.AuraWatch_OnEvent)
		return
	end

	if event == "PLAYER_ENTERING_WORLD" then
		InitSetup()
		if not IntCD.MoveHandle then A:AuraWatch_SetupInt(2825, nil, 0, "player") end
		M:UnregisterEvent(event, A.AuraWatch_OnEvent)
	else
		A:AuraWatch_UpdateInt(event, ...)
	end
end
M:RegisterEvent("PLAYER_ENTERING_WORLD", A.AuraWatch_OnEvent)
M:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", A.AuraWatch_OnEvent)

function A:AuraWatch_OnUpdate(elapsed)
	self.elapsed = (self.elapsed or 0) + elapsed
	if self.elapsed > .1 then
		self.elapsed = 0

		A:AuraWatch_Cleanup()
		A:AuraWatch_UpdateCD()

		for _, value in pairs(UnitIDTable) do
			A:UpdateAuraWatch(value)
		end
	end
end
updater:SetScript("OnUpdate", A.AuraWatch_OnUpdate)

-- Mover
StaticPopupDialogs["RESET_AURAWATCH_MOVER"] = {
	text = U["Reset AuraWatch Mover Confirm"],
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = function()
		wipe(MaoRUIPerDB["AuraWatchMover"])
		ReloadUI()
	end,
}

SlashCmdList.AuraWatch = function(msg)
	if msg:lower() == "move" then
		updater:SetScript("OnUpdate", nil)
		for _, value in pairs(FrameList) do
			for i = 1, 6 do
				if value[i] then
					value[i]:SetScript("OnUpdate", nil)
					value[i]:Show()
				end
				if value[i].Icon then value[i].Icon:SetColorTexture(0, 0, 0, .25) end
				if value[i].Count then value[i].Count:SetText("") end
				if value[i].Time then value[i].Time:SetText("8.21") end
				if value[i].Statusbar then value[i].Statusbar:SetValue(1) end
				if value[i].Spellname then value[i].Spellname:SetText("^-^") end
				if value[i].glowFrame then M.HideOverlayGlow(value[i].glowFrame) end
			end
			value[1].MoveHandle:Show()
		end
		if IntCD.MoveHandle then
			IntCD.MoveHandle:Show()
			for i = 1, #IntTable do
				if IntTable[i] then IntTable[i]:Hide() end
			end
			wipe(IntTable)

			A:AuraWatch_SetupInt(2825, nil, 0, "player")
			A:AuraWatch_SetupInt(2825, nil, 0, "player")
			A:AuraWatch_SetupInt(2825, nil, 0, "player")
			A:AuraWatch_SetupInt(2825, nil, 0, "player")
			A:AuraWatch_SetupInt(2825, nil, 0, "player")
			A:AuraWatch_SetupInt(2825, nil, 0, "player")

			for i = 1, #IntTable do
				IntTable[i]:SetScript("OnUpdate", nil)
				IntTable[i]:Show()
				IntTable[i].Spellname:SetText("")
				IntTable[i].Time:SetText("21")
				IntTable[i].Statusbar:SetMinMaxValues(0, 1)
				IntTable[i].Statusbar:SetValue(1)
				IntTable[i].Icon:SetColorTexture(0, 0, 0, .25)
			end
		end
	elseif msg:lower() == "lock" then
		A:AuraWatch_Cleanup()
		for _, value in pairs(FrameList) do
			value[1].MoveHandle:Hide()
		end
		updater:SetScript("OnUpdate", A.AuraWatch_OnUpdate)

		if IntCD.MoveHandle then
			IntCD.MoveHandle:Hide()
			for i = 1, #IntTable do
				if IntTable[i] then IntTable[i]:Hide() end
			end
			wipe(IntTable)
		end
	end
end
