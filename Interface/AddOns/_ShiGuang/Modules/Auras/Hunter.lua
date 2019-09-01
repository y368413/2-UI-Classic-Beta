local _, ns = ...
local M, R, U, I = unpack(ns)
local A = M:GetModule("Auras")

local IconSize = R.Auras.IconSize + 2
local bu, bar, boom = {}

local function CreateElements()
	if bar then bar:Show() return end

	bar = CreateFrame("StatusBar", nil, UIParent)
	bar:SetSize(IconSize*5+20, 6)
	M.CreateSB(bar, true)
	M.SmoothBar(bar)
	bar:SetAlpha(.5)
	bar.Count = M.CreateFS(bar, 18, "", false, "CENTER", 0, -5)

	local spells = {259491, 131894, 259495, 259387, 266779}

	for i = 1, 5 do
		bu[i] = CreateFrame("Frame", nil, UIParent)
		bu[i]:SetSize(IconSize, IconSize)
		M.AuraIcon(bu[i])
		bu[i]:SetAlpha(.5)
		bu[i].Icon:SetTexture(GetSpellTexture(spells[i]))
		bu[i].Count = M.CreateFS(bu[i], 16, "")
		bu[i].Count:SetPoint("TOP", 0, 15)
		if i == 1 then
			bu[i]:SetPoint("BOTTOMLEFT", bar, "TOPLEFT", 0, 5)
		else
			bu[i]:SetPoint("LEFT", bu[i-1], "RIGHT", 5, 0)
		end
	end

	boom = CreateFrame("Frame", nil, UIParent)
	boom:SetSize(IconSize, IconSize)
	boom:SetPoint("BOTTOM", bu[3], "TOP", 0, 5)
	M.AuraIcon(boom)
	boom:Hide()

	M.Mover(bar, "HunterTool", "HunterTool", R.Auras.HunterToolPos, bar:GetWidth(), 30)
end

local function UpdatePowerBar()
	local cur, max = UnitPower("player"), UnitPowerMax("player")
	bar:SetMinMaxValues(0, max)
	bar:SetValue(cur)
	bar.Count:SetText(cur)
	bar:SetAlpha(1)
	if cur > 80 then
		bar.Count:SetTextColor(1, 0, 0)
	elseif cur > 30 then
		bar.Count:SetTextColor(0, 1, 0)
	else
		bar.Count:SetTextColor(1, 1, 1)
	end
end

local function GetUnitAura(unit, spell, filter)
	for index = 1, 32 do
		local name, _, count, _, dur, exp, caster, _, _, spellID = UnitAura(unit, index, filter)
		if name and spellID == spell then
			return name, count, dur, exp, caster, spellID
		end
	end
end

local function UpdateCooldown(button, spellID, updateTexture)
	local charges, maxCharges, chargeStart, chargeDuration = GetSpellCharges(spellID)
	local start, duration = GetSpellCooldown(spellID)
	if charges and maxCharges > 1 then button.Count:SetText(charges) end
	if charges and charges > 0 and charges < maxCharges then
		button.CD:SetCooldown(chargeStart, chargeDuration)
		button.CD:Show()
		button:SetAlpha(1)
		button.Count:SetTextColor(0, 1, 0)
	elseif start and duration > 1.5 then
		button.CD:SetCooldown(start, duration)
		button.CD:Show()
		button:SetAlpha(.5)
		button.Count:SetTextColor(1, 1, 1)
	else
		button.CD:Hide()
		button:SetAlpha(1)
		if charges == maxCharges then button.Count:SetTextColor(1, 0, 0) end
	end
	if updateTexture then
		button.Icon:SetTexture(GetSpellTexture(spellID))
	end
end

local function UpdateBuff(button, spellID, auraID, cooldown, isPet)
	button.Icon:SetTexture(GetSpellTexture(spellID))
	local name, count, duration, expire = GetUnitAura(isPet and "pet" or "player", auraID, "HELPFUL")
	if name then
		if count == 0 then count = "" end
		button.Count:SetText(count)
		button.CD:SetCooldown(expire-duration, duration)
		button.CD:Show()
		button:SetAlpha(1)
	else
		if cooldown then
			UpdateCooldown(button, spellID)
		else
			button.Count:SetText("")
			button.CD:Hide()
			button:SetAlpha(.5)
		end
	end
end

local function UpdateDebuff(button, spellID, auraID, cooldown)
	button.Icon:SetTexture(GetSpellTexture(spellID))
	local name, _, duration, expire, caster = GetUnitAura("target", auraID, "HARMFUL")
	if name and caster == "player" then
		button:SetAlpha(1)
		button.CD:SetCooldown(expire-duration, duration)
		button.CD:Show()
	else
		if cooldown then
			UpdateCooldown(button, spellID)
		else
			button:SetAlpha(.5)
			button.CD:Hide()
		end
	end
end

local boomGroups = {
	[270339] = 186270,
	[270332] = 259489,
	[271049] = 259491,
}
local function UpdateIcons()
	if GetSpecialization() == 1 then
		UpdateCooldown(bu[1], 34026, true)
		UpdateCooldown(bu[2], 217200, true)
		UpdateBuff(bu[3], 106785, 272790, false, true)
		UpdateBuff(bu[4], 19574, 19574, true)
		UpdateBuff(bu[5], 193530, 193530, true)

	elseif GetSpecialization() == 2 then
		UpdateCooldown(bu[1], 19434, true)

		do
			local button = bu[2]
			if IsPlayerSpell(271788) then
				UpdateDebuff(button, 271788, 271788)
			elseif IsPlayerSpell(131894) then
				UpdateDebuff(button, 131894, 131894, true)
			else
				UpdateBuff(button, 260309, 269576)
			end
		end

		do
			local button = bu[3]
			if IsPlayerSpell(193533) then
				UpdateBuff(button, 193534, 193534)
			elseif IsPlayerSpell(257284) then
				UpdateDebuff(button, 257284, 257284)
			else
				UpdateCooldown(button, 257044, true)
			end
		end

		do
			local button = bu[4]
			if IsPlayerSpell(260402) then
				UpdateCooldown(button, 260402, true)
			elseif IsPlayerSpell(120360) then
				UpdateCooldown(button, 120360, true)
			else
				UpdateBuff(button, 260395, 260395)
			end
		end

		UpdateBuff(bu[5], 193526, 193526, true)

	elseif GetSpecialization() == 3 then
		UpdateDebuff(bu[1], 259491, 259491)

		do
			local button = bu[2]
			if IsPlayerSpell(260248) then
				UpdateBuff(button, 260248, 260249)
			elseif IsPlayerSpell(162488) then
				UpdateDebuff(button, 162488, 162487, true)
			else
				UpdateDebuff(button, 131894, 131894, true)
			end
		end

		do
			local button = bu[4]
			if IsPlayerSpell(260285) then
				UpdateBuff(button, 260285, 260286)
			elseif IsPlayerSpell(269751) then
				UpdateCooldown(button, 269751, true)
			else
				UpdateBuff(button, 259387, 259388)
			end
		end

		do
			local button = bu[3]
			if IsPlayerSpell(271014) then
				boom:Show()

				local name, _, duration, expire, caster, spellID = GetUnitAura("target", 270339, "HARMFUL")
				if not name then name, _, duration, expire, caster, spellID = GetUnitAura("target", 270332, "HARMFUL") end
				if not name then name, _, duration, expire, caster, spellID = GetUnitAura("target", 271049, "HARMFUL") end
				if name and caster == "player" then
					boom.Icon:SetTexture(GetSpellTexture(boomGroups[spellID]))
					boom.CD:SetCooldown(expire-duration, duration)
					boom.CD:Show()
					boom:SetAlpha(1)
				else
					local texture = GetSpellTexture(259495)
					if texture == GetSpellTexture(270323) then
						boom.Icon:SetTexture(GetSpellTexture(259489))
						boom:SetAlpha(.5)
					elseif texture == GetSpellTexture(270335) then
						boom.Icon:SetTexture(GetSpellTexture(186270))
						boom:SetAlpha(.5)
					elseif texture == GetSpellTexture(271045) then
						boom.Icon:SetTexture(GetSpellTexture(259491))
						boom:SetAlpha(.5)
					end
					boom:SetAlpha(.5)
				end

				UpdateCooldown(button, 259495, true)
			else
				boom:Hide()
				UpdateDebuff(button, 259495, 269747, true)
			end
		end

		UpdateBuff(bu[5], 266779, 266779, true)
	end
end

local function UpdateVisibility()
	if InCombatLockdown() then return end
	if not bar then return end
	bar:SetAlpha(.1)
	bar.Count:SetText("")
	for i = 1, 5 do
		bu[i]:SetAlpha(.1)
		bu[i].Count:SetTextColor(1, 1, 1)
		bu[i].Count:SetText("")
	end
	if boom:IsShown() then boom:SetAlpha(.1) end
end

local function TurnOn()
	M:RegisterEvent("UNIT_POWER_FREQUENT", UpdatePowerBar, "player")
	M:RegisterEvent("UNIT_AURA", UpdateIcons, "player", "target")
	M:RegisterEvent("PLAYER_TARGET_CHANGED", UpdateIcons)
	M:RegisterEvent("SPELL_UPDATE_COOLDOWN", UpdateIcons)
	M:RegisterEvent("SPELL_UPDATE_CHARGES", UpdateIcons)
end

local function TurnOff()
	M:UnregisterEvent("UNIT_POWER_FREQUENT", UpdatePowerBar)
	M:UnregisterEvent("UNIT_AURA", UpdateIcons)
	M:UnregisterEvent("PLAYER_TARGET_CHANGED", UpdateIcons)
	M:UnregisterEvent("SPELL_UPDATE_COOLDOWN", UpdateIcons)
	M:UnregisterEvent("SPELL_UPDATE_CHARGES", UpdateIcons)

	UpdateVisibility()
end

local function CheckSpec(event)
	if UnitLevel("player") < 100 then return end

	if GetSpecialization() then
		CreateElements()
		for i = 1, 5 do bu[i]:Show() end
		if boom then boom:Hide() end

		UpdateIcons()
		UpdateVisibility()
		M:RegisterEvent("PLAYER_REGEN_DISABLED", TurnOn)
		M:RegisterEvent("PLAYER_REGEN_ENABLED", TurnOff)
	else
		for i = 1, 5 do
			if bu[i] then bu[i]:Hide() end
		end
		if boom then boom:Hide() end
		if bar then bar:Hide() end

		M:UnregisterEvent("PLAYER_REGEN_DISABLED", TurnOn)
		M:UnregisterEvent("PLAYER_REGEN_ENABLED", TurnOff)
	end

	if event == "PLAYER_ENTERING_WORLD" then
		M:UnregisterEvent(event, checkSpec)
	end
end

function A:HunterTool()
	if not MaoRUISettingDB["Auras"]["HunterTool"] then return end
	M:RegisterEvent("PLAYER_ENTERING_WORLD", CheckSpec)
	M:RegisterEvent("PLAYER_TALENT_UPDATE", CheckSpec)
end

--PetHealthWarning------------------
local PetHealthAlert= {}
local Frame=CreateFrame("ScrollingMessageFrame","!PHA",UIParent)	
Frame.Threshold=35
Frame.Warned=false
-- Initialize
function PetHealthAlert:Initialize()	
	Frame:SetWidth(450)
	Frame:SetHeight(200)
	Frame:SetPoint("CENTER",UIParent,"CENTER",0,360)	
	Frame:SetFont("Interface\\addons\\Ace3\\ShiGuang\\Media\\Fonts\\RedCircl.TTF",36,"THICKOUTLINE")
	Frame:SetShadowColor(0.00,0.00,0.00,0.75)
	Frame:SetShadowOffset(3.00,-3.00)
	Frame:SetJustifyH("CENTER")		
	Frame:SetMaxLines(2)
	--Frame:SetInsertMode("BOTTOM")
	Frame:SetTimeVisible(2)
	Frame:SetFadeDuration(1)		
	--HealthWatch:Update()
end
-- Update health warning
function PetHealthAlert:Update()	
	if(floor((UnitHealth("pet")/UnitHealthMax("pet"))*100)<=Frame.Threshold and Frame.Warned==false)then
		PlaySoundFile("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\Beep.ogg", "Master")	
		Frame:AddMessage("- CRITICAL PET HEALTH -", 1, 0, 0, nil, 3)
		Frame.Warned=true
		return
	end
	if(floor((UnitHealth("pet")/UnitHealthMax("pet"))*100)>Frame.Threshold)then
		Frame.Warned=false
		return
	end	
end
-- Handle events
function PetHealthAlert:OnEvent(Event,Arg1,...)
	if(Event=="PLAYER_LOGIN")then
		PetHealthAlert:Initialize()
		return
	end	
	if(Event=="UNIT_HEALTH" and Arg1=="pet")then
		PetHealthAlert:Update()
		return
	end	
end
Frame:SetScript("OnEvent",PetHealthAlert.OnEvent)
Frame:RegisterEvent("PLAYER_LOGIN")
Frame:RegisterEvent("UNIT_HEALTH")

--ImprovedStableFrame------------------
local maxSlots = NUM_PET_STABLE_PAGES * NUM_PET_STABLE_SLOTS
local NUM_PER_ROW, heightChange = 10, 65

for i = NUM_PET_STABLE_SLOTS + 1, maxSlots do 
	if not _G["PetStableStabledPet"..i] then
		CreateFrame("Button", "PetStableStabledPet"..i, PetStableFrame, "PetStableSlotTemplate", i)
	end
end

for i = 1, maxSlots do
	local frame = _G["PetStableStabledPet"..i]
	if i > 1 then
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", _G["PetStableStabledPet"..i-1], "RIGHT", 7.3, 0)
	end
	frame:SetFrameLevel(PetStableFrame:GetFrameLevel() + 1)
	frame:SetScale(7/NUM_PER_ROW)
end

PetStableStabledPet1:ClearAllPoints()
PetStableStabledPet1:SetPoint("TOPLEFT", PetStableBottomInset, 9, -9)

for i = NUM_PER_ROW+1, maxSlots, NUM_PER_ROW do
	_G["PetStableStabledPet"..i]:ClearAllPoints()
	_G["PetStableStabledPet"..i]:SetPoint("TOPLEFT", _G["PetStableStabledPet"..i-NUM_PER_ROW], "BOTTOMLEFT", 0, -5)
end

PetStableNextPageButton:Hide()
PetStablePrevPageButton:Hide()

PetStableFrameModelBg:SetHeight(281 - heightChange)
PetStableFrameModelBg:SetTexCoord(0.16406250, 0.77734375, 0.00195313, 0.55078125 - heightChange/512)

PetStableFrameInset:SetPoint("BOTTOMRIGHT", PetStableFrame, "BOTTOMRIGHT", -6, 126 + heightChange)
PetStableFrameStableBg:SetHeight(116 + heightChange)

NUM_PET_STABLE_SLOTS = maxSlots
NUM_PET_STABLE_PAGES = 1
PetStableFrame.page = 1