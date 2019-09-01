﻿local _, ns = ...
local M, R, U, I = unpack(ns)
local A = M:GetModule("Auras")

-- Monk Statue
local IconSize = R.Auras.IconSize - 2
local bu
local function StatueGo()
	if bu then bu:Show() return end

	bu = CreateFrame("Button", nil, UIParent, "SecureActionButtonTemplate")
	bu:SetSize(IconSize, IconSize)
	M.AuraIcon(bu, true)
	bu:RegisterForClicks("AnyUp")
	bu:SetAttribute("type1", "macro")
	bu:SetAttribute("type2", "macro")
	bu:SetAttribute("macrotext2", "/click TotemFrameTotem1 RightButton")
	bu:SetScript("OnEnter", function(self)
		if self:GetAlpha() < 1 then return end
		GameTooltip:SetOwner(self, "ANCHOR_LEFT")
		GameTooltip:ClearLines()
		GameTooltip:SetTotem(1)
		GameTooltip:Show()
	end)
	bu:SetScript("OnLeave", M.HideTooltip)

	M.Mover(bu, U["Statue"], "Statue", R.Auras.StatuePos, IconSize, IconSize)
end

-- localizaed
local serpentStatue = GetSpellInfo(115313)
local serpentStatueTex = GetSpellTexture(115313)
local oxStatue = GetSpellInfo(115315)
local oxStatueTex = GetSpellTexture(115315)

function A:UpdateStatue()
	local haveTotem, _, start, dur = GetTotemInfo(1)
	if haveTotem then
		bu.CD:SetCooldown(start, dur)
		bu.CD:Show()
		bu:SetAlpha(1)
	else
		bu.CD:Hide()
		bu:SetAlpha(.3)
	end
end

local function checkSpec(event)
	if (GetSpecialization() == 2 and IsPlayerSpell(115313)) or (GetSpecialization() == 1 and IsPlayerSpell(115315)) then
		StatueGo()
		bu:SetAlpha(.3)
		bu.CD:Hide()
		local statue
		if IsPlayerSpell(115313) then
			bu.Icon:SetTexture(serpentStatueTex)
			statue = serpentStatue
		else
			bu.Icon:SetTexture(oxStatueTex)
			statue = oxStatue
		end
		bu:SetAttribute("macrotext1", "/tar "..statue)
		M:RegisterEvent("PLAYER_TOTEM_UPDATE", A.UpdateStatue)
	else
		if bu then bu:Hide() end
		M:UnregisterEvent("PLAYER_TOTEM_UPDATE", A.UpdateStatue)
	end

	if event == "PLAYER_ENTERING_WORLD" then
		M:UnregisterEvent(event, checkSpec)
	end
end

function A:MonkStatue()
	if not MaoRUISettingDB["Auras"]["Statue"] then return end

	M:RegisterEvent("PLAYER_ENTERING_WORLD", checkSpec)
	M:RegisterEvent("PLAYER_TALENT_UPDATE", checkSpec)
end