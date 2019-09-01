﻿local _, ns = ...
local M, R, U, I = unpack(ns)
local CDS = M:GetModule("Cooldowns")
----------------------------------------------------------------------------------------
--	Based on Doom Cooldown Pulse(by Woffle of Dark Iron, editor Affli)
----------------------------------------------------------------------------------------
local fadeInTime, fadeOutTime, maxAlpha, elapsed, runtimer, animScale, iconSize, holdTime, threshold, framemult= 0.3, 0.8, 1, 0, 0, 2.1, 36, 0, 3, 1
local GetTime, cooldowns, animating, watching = GetTime, {}, {}, {}

function CDS:PulseCD()
  if not MaoRUISettingDB["Misc"]["PulseCD"] then return end

    local PulseCDAnchor = CreateFrame("Frame", "PulseCDAnchor", UIParent)
    PulseCDAnchor:SetSize(43, 43)
    M.Mover(PulseCDAnchor, U["Pulse CD"], "PulseCD", {"CENTER", UIParent, "CENTER", 0, -120})

local frame = CreateFrame("Frame", "PulseCDFrame", PulseCDAnchor)
frame:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
frame:SetBackdrop({
	bgFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeSize = framemult,
	insets = {left = -framemult, right = -framemult, top = -framemult, bottom = -framemult}
})
frame:SetBackdropBorderColor(0.37, 0.3, 0.3, 1)
frame:SetBackdropColor(0, 0, 0, 1)
frame:SetPoint("CENTER", PulseCDAnchor, "CENTER")

local icon = frame:CreateTexture(nil, "ARTWORK")
icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
icon:SetPoint("TOPLEFT", frame, "TOPLEFT", framemult * 2, -framemult * 2)
icon:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -framemult * 2, framemult * 2)

-- Utility Functions
local function tcount(tab)
	local n = 0
	for _ in pairs(tab) do
		n = n + 1
	end
	return n
end

local function GetPetActionIndexByName(name)
	for i = 1, NUM_PET_ACTION_SLOTS, 1 do
		if GetPetActionInfo(i) == name then
			return i
		end
	end
	return nil
end

-- Cooldown/Animation
local function OnUpdate(_, update)
	elapsed = elapsed + update
	if elapsed > 0.05 then
		for i, v in pairs(watching) do
			if GetTime() >= v[1] + 0.5 + threshold then
				local start, duration, enabled, texture, isPet
				if v[2] == "spell" then
					name = GetSpellInfo(v[3])
					texture = GetSpellTexture(v[3])
					start, duration, enabled = GetSpellCooldown(v[3])
				elseif v[2] == "item" then
					name = GetItemInfo(i)
					texture = v[3]
					start, duration, enabled = GetItemCooldown(i)
				elseif v[2] == "pet" then
					name, _, texture = GetPetActionInfo(v[3])
					start, duration, enabled = GetPetActionCooldown(v[3])
					isPet = true
				end
				if R.pulse_ignored_spells[name] then
					watching[i] = nil
				else
					if enabled ~= 0 then
						if duration and duration > threshold and texture then
							cooldowns[i] = {start, duration, texture, isPet}
						end
					end
					if not (enabled == 0 and v[2] == "spell") then
						watching[i] = nil
					end
				end
			end
		end
		for i, v in pairs(cooldowns) do
			local remaining = v[2] - (GetTime() - v[1])
			if remaining <= 0 then
				tinsert(animating, {v[3], v[4]})
				cooldowns[i] = nil
			end
		end

		elapsed = 0
		if #animating == 0 and tcount(watching) == 0 and tcount(cooldowns) == 0 then
			frame:SetScript("OnUpdate", nil)
			return
		end
	end

	if #animating > 0 then
		runtimer = runtimer + update
		if runtimer > (fadeInTime + holdTime + fadeOutTime) then
			tremove(animating, 1)
			runtimer = 0
			icon:SetTexture(nil)
			frame:SetBackdropBorderColor(0, 0, 0, 0)
			frame:SetBackdropColor(0, 0, 0, 0)
		else
			if not icon:GetTexture() then
				icon:SetTexture(animating[1][1])
				--PlaySoundFile([[Interface\AddOns\ShestakUI\Media\Sounds\Proc.ogg]], "Master")
			end
			local alpha = maxAlpha
			if runtimer < fadeInTime then
				alpha = maxAlpha * (runtimer / fadeInTime)
			elseif runtimer >= fadeInTime + holdTime then
				alpha = maxAlpha - (maxAlpha * ((runtimer - holdTime - fadeInTime) / fadeOutTime))
			end
			frame:SetAlpha(alpha)
			local scale = iconSize + (iconSize * ((animScale - 1) * (runtimer / (fadeInTime + holdTime + fadeOutTime))))
			frame:SetWidth(scale)
			frame:SetHeight(scale)
			frame:SetBackdropBorderColor(0.37, 0.3, 0.3, 1)
			frame:SetBackdropColor(0, 0, 0, 1)
		end
	end
end

-- Event Handlers
function frame:ADDON_LOADED()
	for _, v in pairs(R.pulse_ignored_spells) do
		R.pulse_ignored_spells[v] = true
	end
	self:UnregisterEvent("ADDON_LOADED")
end
frame:RegisterEvent("ADDON_LOADED")

function frame:UNIT_SPELLCAST_SUCCEEDED(unit, _, spellID)
	if unit == "player" then
		watching[spellID] = {GetTime(), "spell", spellID}
		self:SetScript("OnUpdate", OnUpdate)
	end
end
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

function frame:COMBAT_LOG_EVENT_UNFILTERED()
	local _, eventType, _, _, _, sourceFlags, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
	if eventType == "SPELL_CAST_SUCCESS" then
		if (bit.band(sourceFlags, COMBATLOG_OBJECT_TYPE_PET) == COMBATLOG_OBJECT_TYPE_PET and bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE) then
			local name = GetSpellInfo(spellID)
			local index = GetPetActionIndexByName(name)
			if index and not select(7, GetPetActionInfo(index)) then
				watching[spellID] = {GetTime(), "pet", index}
			elseif not index and spellID then
				watching[spellID] = {GetTime(), "spell", spellID}
			else
				return
			end
			self:SetScript("OnUpdate", OnUpdate)
		end
	end
end
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

function frame:PLAYER_ENTERING_WORLD()
	local _, instanceType = IsInInstance()
	if instanceType == "arena" then
		self:SetScript("OnUpdate", nil)
		wipe(cooldowns)
		wipe(watching)
	end
end
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

hooksecurefunc("UseAction", function(slot)
	local actionType, itemID = GetActionInfo(slot)
	if actionType == "item" then
		local texture = GetActionTexture(slot)
		watching[itemID] = {GetTime(), "item", texture}
	end
end)

hooksecurefunc("UseInventoryItem", function(slot)
	local itemID = GetInventoryItemID("player", slot)
	if itemID then
		local texture = GetInventoryItemTexture("player", slot)
		watching[itemID] = {GetTime(), "item", texture}
	end
end)

hooksecurefunc("UseContainerItem", function(bag, slot)
	local itemID = GetContainerItemID(bag, slot)
	if itemID then
		local texture = select(10, GetItemInfo(itemID))
		watching[itemID] = {GetTime(), "item", texture}
	end
end)

SlashCmdList.PulseCD = function()
	tinsert(animating, {GetSpellTexture(87214)})
	--PlaySoundFile([[Interface\AddOns\ShestakUI\Media\Sounds\Proc.ogg]], "Master")
	frame:SetScript("OnUpdate", OnUpdate)
end
SLASH_PulseCD1 = "/pulsecd"
end