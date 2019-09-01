﻿local _, ns = ...
local M, R, U, I = unpack(ns)
local A = M:GetModule("Auras")

-- Stagger Master
local IconSize = R.Auras.IconSize
local bu, bar = {}
local function StaggerGo()
	if bar then bar:Show() return end

	bar = CreateFrame("StatusBar", "NDui_Stagger", UIParent)
	bar:SetSize(IconSize*4 + 15, 5)
	bar:SetPoint("CENTER", 0, -200)
	bar:SetFrameStrata("HIGH")
	M.CreateSB(bar, true)
	bar:SetMinMaxValues(0, 100)
	bar:SetValue(0)
	bar.Count = M.CreateFS(bar, 16, "", false, "TOPRIGHT", 0, -7)

	local spells = {115069, 115072, 115308, 124275}
	for i = 1, 4 do
		bu[i] = CreateFrame("Frame", nil, UIParent)
		bu[i]:SetSize(IconSize, IconSize)
		bu[i]:SetFrameStrata("HIGH")
		M.AuraIcon(bu[i])
		bu[i].Icon:SetTexture(GetSpellTexture(spells[i]))
		bu[i].Count = M.CreateFS(bu[i], 16, "")
		bu[i].Count:SetPoint("BOTTOMRIGHT", 4, -2)
		if i == 1 then
			bu[i]:SetPoint("BOTTOMLEFT", bar, "TOPLEFT", 0, 5)
		else
			bu[i]:SetPoint("LEFT", bu[i-1], "RIGHT", 5, 0)
		end
	end
	bu[1].Count:SetAllPoints()

	M.Mover(bar, "坦僧助手", "Stagger", R.Auras.StaggerPos, bar:GetWidth(), 20)
end

local function updateVisibility()
	if InCombatLockdown() then return end
	if bar then bar:SetAlpha(.1) end
	for i = 1, 4 do
		if bu[i] then bu[i]:SetAlpha(.1) end
	end
end

local function lookingForAura(spell, filter)
	for index = 1, 32 do
		local name, texture, _, _, dur, exp, _, _, _, spellID = UnitAura("player", index, filter)
		if name and spellID == spell then
			return name, dur, exp, texture
		end
	end
end

local function updateSpells()
	-- Stagger percentage
	local stagger, staggerAgainstTarget = C_PaperDollInfo.GetStaggerPercentage("player")
	local amount = staggerAgainstTarget or stagger
	if amount > 0 then
		bu[1].Count:SetText(floor(amount))
		bu[1]:SetAlpha(1)
	else
		bu[1].Count:SetText("")
		bu[1]:SetAlpha(.5)
	end

	-- Expel Harm
	do
		local count = GetSpellCount(115072)
		bu[2].Count:SetText(count)
		if count > 0 then
			bu[2]:SetAlpha(1)
		else
			bu[2]:SetAlpha(.5)
		end
	end

	-- Ironskin Brew
	do
		local name, dur, exp = lookingForAura(215479, "HELPFUL")
		local charges, maxCharges, chargeStart, chargeDuration = GetSpellCharges(115308)
		local start, duration = GetSpellCooldown(115308)
		bu[3].Count:SetText(charges)
		if name then
			bu[3].Count:ClearAllPoints()
			bu[3].Count:SetPoint("TOP", 0, 18)
			bu[3]:SetAlpha(1)
			ClearChargeCooldown(bu[3])
			bu[3].CD:SetReverse(true)
			bu[3].CD:SetCooldown(exp - dur, dur)
			bu[3].CD:Show()
			ActionButton_ShowOverlayGlow(bu[3])
		else
			bu[3].Count:ClearAllPoints()
			bu[3].Count:SetPoint("BOTTOMRIGHT", 4, -2)
			bu[3].CD:SetReverse(false)
			if charges < maxCharges and charges > 0 then
				StartChargeCooldown(bu[3], chargeStart, chargeDuration)
				bu[3].CD:Hide()
			elseif start and duration > 1.5 then
				ClearChargeCooldown(bu[3])
				bu[3].CD:SetCooldown(start, duration)
				bu[3].CD:Show()
			elseif charges == maxCharges then
				bu[3]:SetAlpha(.5)
				ClearChargeCooldown(bu[3])
				bu[3].CD:Hide()
			end
			ActionButton_HideOverlayGlow(bu[3])
		end
	end

	-- Stagger
	do
		local cur = UnitStagger("player") or 0
		local max = UnitHealthMax("player")
		local perc = cur / max
		local name, dur, exp, texture = lookingForAura(124275, "HARMFUL")
		if not name then name, dur, exp, texture = lookingForAura(124274, "HARMFUL") end
		if not name then name, dur, exp, texture = lookingForAura(124273, "HARMFUL") end

		if name and cur > 0 and dur > 0 then
			bar:SetAlpha(1)
			bu[4]:SetAlpha(1)
			bu[4].CD:SetCooldown(exp - dur, dur)
			bu[4].CD:Show()
		else
			bar:SetAlpha(.5)
			bu[4]:SetAlpha(.5)
			bu[4].CD:Hide()
		end
		bar:SetValue(perc * 100)
		bar.Count:SetText(I.InfoColor..M.Numb(cur).." "..I.MyColor..M.Numb(perc * 100).."%")
		bu[4].Icon:SetTexture(texture or 463281)

		if bu[4].Icon:GetTexture() == GetSpellTexture(124273) then
			ActionButton_ShowOverlayGlow(bu[4])
		else
			ActionButton_HideOverlayGlow(bu[4])
		end
	end

	updateVisibility()
end

local function checkSpec(event)
	if GetSpecializationInfo(GetSpecialization()) == 268 then
		StaggerGo()
		bar:SetAlpha(.5)
		for i = 1, 4 do
			bu[i]:Show()
			bu[i]:SetAlpha(.5)
		end

		M:RegisterEvent("UNIT_AURA", updateSpells, "player")
		M:RegisterEvent("UNIT_MAXHEALTH", updateSpells)
		M:RegisterEvent("SPELL_UPDATE_COOLDOWN", updateSpells)
		M:RegisterEvent("SPELL_UPDATE_CHARGES", updateSpells)
	else
		if bar then bar:Hide() end
		for i = 1, 4 do
			if bu[i] then bu[i]:Hide() end
		end

		M:UnregisterEvent("UNIT_AURA", updateSpells)
		M:UnregisterEvent("UNIT_MAXHEALTH", updateSpells)
		M:UnregisterEvent("SPELL_UPDATE_COOLDOWN", updateSpells)
		M:UnregisterEvent("SPELL_UPDATE_CHARGES", updateSpells)
	end

	if event == "PLAYER_ENTERING_WORLD" then
		M:UnregisterEvent(event, checkSpec)
	end

	updateVisibility()
end

function A:Stagger()
	if not MaoRUISettingDB["Auras"]["Stagger"] then return end

	M:RegisterEvent("PLAYER_ENTERING_WORLD", checkSpec)
	M:RegisterEvent("PLAYER_TALENT_UPDATE", checkSpec)
end