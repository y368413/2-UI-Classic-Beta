local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:GetModule("Misc")

local format, gsub, strsplit = string.format, string.gsub, string.split
local pairs, tonumber, wipe, select = pairs, tonumber, wipe, select
local GetInstanceInfo, GetAtlasInfo, PlaySound = GetInstanceInfo, GetAtlasInfo, PlaySound
local IsInRaid, IsInGroup, IsInInstance, IsInGuild = IsInRaid, IsInGroup, IsInInstance, IsInGuild
local UnitInRaid, UnitInParty, SendChatMessage = UnitInRaid, UnitInParty, SendChatMessage
local UnitName, Ambiguate, GetTime = UnitName, Ambiguate, GetTime
local GetSpellLink, GetSpellInfo = GetSpellLink, GetSpellInfo
local C_ChatInfo_SendAddonMessage = C_ChatInfo.SendAddonMessage
local C_ChatInfo_RegisterAddonMessagePrefix = C_ChatInfo.RegisterAddonMessagePrefix

function MISC:AddAlerts()
	self:InterruptAlert()
	--self:VersionCheck()
	self:PlacedItemAlert()
end

--[[
	闭上你的嘴！
	打断、偷取及驱散法术时的警报
]]
local function msgChannel()
	return IsInRaid() and "RAID" or "PARTY"
end

local infoType = {
	["SPELL_INTERRUPT"] = U["Interrupt"],
	["SPELL_STOLEN"] = U["Steal"],
	["SPELL_DISPEL"] = U["Dispel"],
	["SPELL_AURA_BROKEN_SPELL"] = U["BrokenSpell"],
}

local spellBlackList = {
	[122] = true,		-- 冰霜新星
	[1776] = true,		-- 凿击
	[1784] = true,		-- 潜行
	[5246] = true,		-- 破胆怒吼
	[8122] = true,		-- 心灵尖啸
}

local blackList = {}
for spellID in pairs(spellBlackList) do
	local name = GetSpellInfo(spellID)
	if name then
		blackList[name] = true
	end
end

function MISC:IsAllyPet(sourceFlags)
	if sourceFlags == I.MyPetFlags or (not MaoRUIPerDB["Misc"]["OwnInterrupt"] and (sourceFlags == I.PartyPetFlags or sourceFlags == I.RaidPetFlags)) then
		return true
	end
end

function MISC:InterruptAlert_Update(...)
	if MaoRUIPerDB["Misc"]["AlertInInstance"] and (not IsInInstance()) then return end

	local _, eventType, _, sourceGUID, sourceName, sourceFlags, _, _, destName, _, _, _, spellName, _, _, extraskillName, _, auraType = ...
	if not sourceGUID or sourceName == destName then return end

	if UnitInRaid(sourceName) or UnitInParty(sourceName) or MISC:IsAllyPet(sourceFlags) then
		local infoText = infoType[eventType]
		if infoText then
			if infoText == U["BrokenSpell"] then
				if not MaoRUIPerDB["Misc"]["BrokenSpell"] then return end
				if auraType and auraType == AURA_TYPE_BUFF or blackList[spellName] then return end
				SendChatMessage(format(infoText, sourceName, extraskillName, destName, spellName), msgChannel())
			else
				if MaoRUIPerDB["Misc"]["OwnInterrupt"] and sourceName ~= I.MyName and not MISC:IsAllyPet(sourceFlags) then return end
				   if MaoRUIPerDB["Misc"]["InterruptSound"] then
				      PlaySoundFile("Interface\\Addons\\_ShiGuang\\Media\\Sounds\\ShutupFool.ogg", "Master")
				   end
				SendChatMessage(format(infoText, sourceName, spellName, destName, extraskillName), msgChannel())
			end
		end
	end
end

function MISC:InterruptAlert_CheckGroup()
	if IsInGroup() then
		M:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.InterruptAlert_Update)
	else
		M:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.InterruptAlert_Update)
	end
end

function MISC:InterruptAlert()
	if MaoRUIPerDB["Misc"]["Interrupt"] then
		self:InterruptAlert_CheckGroup()
		M:RegisterEvent("GROUP_LEFT", self.InterruptAlert_CheckGroup)
		M:RegisterEvent("GROUP_JOINED", self.InterruptAlert_CheckGroup)
	else
		M:UnregisterEvent("GROUP_LEFT", self.InterruptAlert_CheckGroup)
		M:UnregisterEvent("GROUP_JOINED", self.InterruptAlert_CheckGroup)
		M:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.InterruptAlert_Update)
	end
end

--[[
	放大餐时叫一叫
]]
local lastTime = 0
local itemList = {
	[226241] = true,	-- 宁神圣典
	[256230] = true,	-- 静心圣典
	[185709] = true,	-- 焦糖鱼宴
	[259409] = true,	-- 海帆盛宴
	[259410] = true,	-- 船长盛宴
	[276972] = true,	-- 秘法药锅
	[286050] = true,	-- 鲜血大餐
	[265116] = true,	-- 工程战复
}

function MISC:ItemAlert_Update(unit, _, spellID)
	if not MaoRUIPerDB["Misc"]["PlacedItemAlert"] then return end

	if (UnitInRaid(unit) or UnitInParty(unit)) and spellID and itemList[spellID] and lastTime ~= GetTime() then
		local who = UnitName(unit)
		local link = GetSpellLink(spellID)
		local name = GetSpellInfo(spellID)
		SendChatMessage(format(U["Place item"], who, link or name), msgChannel())

		lastTime = GetTime()
	end
end

function MISC:ItemAlert_CheckGroup()
	if IsInGroup() then
		M:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", MISC.ItemAlert_Update)
	else
		M:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED", MISC.ItemAlert_Update)
	end
end

function MISC:PlacedItemAlert()
	self:ItemAlert_CheckGroup()
	M:RegisterEvent("GROUP_LEFT", self.ItemAlert_CheckGroup)
	M:RegisterEvent("GROUP_JOINED", self.ItemAlert_CheckGroup)
end
