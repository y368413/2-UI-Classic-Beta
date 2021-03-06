﻿--## Author: Peter Getov  ## Version: 3.6.2
-- Class ids
CSC_WARRIOR_CLASS_ID 		= 1;
CSC_PALADIN_CLASS_ID 		= 2;
CSC_HUNTER_CLASS_ID 		= 3;
CSC_ROGUE_CLASS_ID 			= 4;
CSC_PRIEST_CLASS_ID 		= 5;
CSC_DEATHKNIGHT_CLASS_ID 	= 6;
CSC_SHAMAN_CLASS_ID 		= 7;
CSC_MAGE_CLASS_ID 			= 8;
CSC_WARLOCK_CLASS_ID 		= 9;
CSC_MONK_CLASS_ID 			= 10;
CSC_DRUID_CLASS_ID 			= 11;
CSC_DEMONHUNTER_CLASS_ID 	= 12;

g_WeaponStringByWeaponId = {
	[LE_ITEM_WEAPON_AXE1H] 		= CSC_WEAPON_AXE1H_TXT,
	[LE_ITEM_WEAPON_AXE2H] 		= CSC_WEAPON_AXE2H_TXT,
	[LE_ITEM_WEAPON_MACE1H] 	= CSC_WEAPON_MACE1H_TXT,
	[LE_ITEM_WEAPON_MACE2H] 	= CSC_WEAPON_MACE2H_TXT,
	[LE_ITEM_WEAPON_POLEARM] 	= CSC_WEAPON_POLEARM_TXT,
	[LE_ITEM_WEAPON_SWORD1H] 	= CSC_WEAPON_SWORD1H_TXT,
	[LE_ITEM_WEAPON_SWORD2H] 	= CSC_WEAPON_SWORD2H_TXT,
	[LE_ITEM_WEAPON_STAFF] 		= CSC_WEAPON_STAFF_TXT,
	[LE_ITEM_WEAPON_UNARMED] 	= CSC_WEAPON_UNARMED_TXT,
    [LE_ITEM_WEAPON_DAGGER] 	= CSC_WEAPON_DAGGER_TXT,
    [LE_ITEM_WEAPON_BOWS]       = CSC_WEAPON_BOW_TXT,
    [LE_ITEM_WEAPON_CROSSBOW]   = CSC_WEAPON_CROSSBOW_TXT,
    [LE_ITEM_WEAPON_GUNS]       = CSC_WEAPON_GUN_TXT
};

-- Class set items IDs
g_BattlegearOfMightIds = { 
    [16861] = 16861, 
    [16862] = 16862, 
    [16863] = 16863, 
    [16864] = 16864, 
    [16865] = 16865, 
    [16866] = 16866, 
    [16867] = 16867, 
    [16868] = 16868
};

g_VestmentsOfTranscendenceIds = {
    [16925] = 16925, 
    [16926] = 16926, 
    [16919] = 16919, 
    [16921] = 16921, 
    [16920] = 16920, 
    [16922] = 16922, 
    [16924] = 16924, 
    [16923] = 16923,
};

g_StormrageRaimentIds = {
    [16897] = 16897, 
    [16898] = 16898, 
    [16899] = 16899, 
    [16900] = 16900, 
    [16901] = 16901, 
    [16902] = 16902, 
    [16903] = 16903, 
    [16904] = 16904,
};

g_TheTenStormsIds = {
    [16943] = 16943, 
    [16944] = 16944, 
    [16945] = 16945, 
    [16946] = 16946, 
    [16947] = 16947, 
    [16948] = 16948, 
    [16949] = 16949, 
    [16950] = 16950
};

g_AuraIdToMp5 = {
	-- BOW
	[19742] = 10,
	[19850] = 15,
	[19852] = 20,
	[19853] = 25,
	[19854] = 30,
	[25290] = 33,
	-- GBOW
	[25894] = 30,
	[25918] = 33,
	-- Mana Spring Totem
	[5675] = 10,
	[10495] = 15,
	[10496] = 20,
	[10497] = 25,
	-- Mageblood potion
	[24363] = 12,
	--Nightfin Soup
	[18194] = 8
};
  
g_CombatManaRegenSpellIdToModifier = {
    -- Mage Armor
    [6117] = 0.3,
    [22782] = 0.3,
    [22783] = 0.3
};

CSC_SYMBOL_TAB   = "    "; -- for some reason "\t" doesn't work
CSC_SYMBOL_SPACE = " ";
                                
                                
                                
                                -- Namespaces
-- core - table (namespace) shared between every lua file
local CharacterStatsClassic = {};
CharacterStatsClassic.UIConfig = {};

-- Defaults
local UISettingsGlobal = {
    useBlizzardBlockValue = false;
}

local UISettingsCharacter = {
    selectedLeftStatsCategory = 1;
    selectedRightStatsCategory = 2;
}

-- for easier referencing the CharacterStatsClassic config
local UIConfig = CharacterStatsClassic.UIConfig;
local CSC_UIFrame = CharacterStatsClassic.UIConfig;
local CSC_ConfigFrame = { };

local statsDropdownList = {
    PLAYERSTAT_BASE_STATS,
    PLAYERSTAT_MELEE_COMBAT,
    PLAYERSTAT_RANGED_COMBAT,
    PLAYERSTAT_SPELL_COMBAT,
    PLAYERSTAT_DEFENSES
}

local NUM_STATS_TO_SHOW = 5;
local LeftStatsTable = { }
local RightStatsTable = { }

local function CSC_ResetStatFrames(statFrames)
    for i=1, NUM_STATS_TO_SHOW, 1 do
        statFrames[i]:Hide();
        statFrames[i]:SetScript("OnEnter", statFrames[i].OnEnterCallback);
        statFrames[i].tooltip = nil;
        statFrames[i].tooltip2 = nil;
        statFrames[i].tooltip3 = nil;
    end
end

function UIConfig:InitializeStatsFrames(leftParentFrame, rightParentFrame)
    local offsetStepY = 15;
    local accumulatedOffsetY = 0;
    
    for i = 1, NUM_STATS_TO_SHOW do
        accumulatedOffsetY = accumulatedOffsetY + offsetStepY;
        local actualOffset = accumulatedOffsetY;
        
        if i == 1 then 
            actualOffset = 32;
            accumulatedOffsetY = 32;
        end

        LeftStatsTable[i] = CreateFrame("Frame", nil, leftParentFrame, "CharacterStatFrameTemplate");
        LeftStatsTable[i]:SetPoint("LEFT", leftParentFrame, "TOPLEFT", 10, -actualOffset);
        LeftStatsTable[i]:SetWidth(130);
        LeftStatsTable[i].OnEnterCallback = LeftStatsTable[i]:GetScript("OnEnter");

        RightStatsTable[i] = CreateFrame("Frame", nil, rightParentFrame, "CharacterStatFrameTemplate");
        RightStatsTable[i]:SetPoint("LEFT", rightParentFrame, "TOPLEFT", 10, -actualOffset);
        RightStatsTable[i]:SetWidth(130);
        RightStatsTable[i].OnEnterCallback = RightStatsTable[i]:GetScript("OnEnter");
    end
end

function UIConfig:SetCharacterStats(statsTable, category)

    CSC_ResetStatFrames(statsTable);

    if category == PLAYERSTAT_BASE_STATS then
        -- str, agility, stamina, intelect, spirit
        CSC_PaperDollFrame_SetPrimaryStats(statsTable, "player");
    elseif category == PLAYERSTAT_DEFENSES then
        -- armor, defense, dodge, parry, block
        CSC_PaperDollFrame_SetArmor(statsTable[1], "player");
        CSC_PaperDollFrame_SetDefense(statsTable[2], "player");
        CSC_PaperDollFrame_SetDodge(statsTable[3], "player");
        CSC_PaperDollFrame_SetParry(statsTable[4], "player");
        CSC_PaperDollFrame_SetBlock(statsTable[5], "player");
    elseif category == PLAYERSTAT_MELEE_COMBAT then
        -- damage, Att Power, speed, hit raiting, crit chance
        CSC_PaperDollFrame_SetDamage(statsTable[1], "player", category);
        CSC_PaperDollFrame_SetMeleeAttackPower(statsTable[2], "player");
        CSC_PaperDollFrame_SetAttackSpeed(statsTable[3], "player");
        CSC_PaperDollFrame_SetCritChance(statsTable[4], "player");
        CSC_PaperDollFrame_SetHitChance(statsTable[5], "player");
    elseif category == PLAYERSTAT_RANGED_COMBAT then
        CSC_PaperDollFrame_SetDamage(statsTable[1], "player", category);
        CSC_PaperDollFrame_SetRangedAttackPower(statsTable[2], "player");
        CSC_PaperDollFrame_SetRangedAttackSpeed(statsTable[3], "player");
        CSC_PaperDollFrame_SetRangedCritChance(statsTable[4], "player");
        CSC_PaperDollFrame_SetRangedHitChance(statsTable[5], "player");
    elseif category == PLAYERSTAT_SPELL_COMBAT then
        -- bonus dmg, bonus healing, crit chance, mana regen, hit
        CSC_PaperDollFrame_SetSpellPower(statsTable[1], "player");
        CSC_PaperDollFrame_SetHealing(statsTable[2], "player");
        CSC_PaperDollFrame_SetManaRegen(statsTable[3], "player");
        CSC_PaperDollFrame_SetSpellCritChance(statsTable[4], "player");
        CSC_PaperDollFrame_SetSpellHitChance(statsTable[5], "player");
    end
end

function UIConfig:CreateMenu()
    -- Hide the default stats
    CharacterAttributesFrame:Hide();

    CSC_UIFrame.CharacterStatsPanel = CreateFrame("Frame", nil, CharacterFrame); --CharacterFrameInsetRight
	CSC_UIFrame.CharacterStatsPanel:SetPoint("LEFT", CharacterFrame, "BOTTOMLEFT", 50, 75); --85 for 6 stats
	CSC_UIFrame.CharacterStatsPanel:SetHeight(320);
    CSC_UIFrame.CharacterStatsPanel:SetWidth(200);

    UIConfig:SetupDropdown();

    UIConfig:InitializeStatsFrames(CSC_UIFrame.CharacterStatsPanel.leftStatsDropDown, CSC_UIFrame.CharacterStatsPanel.rightStatsDropDown);
    UIConfig:UpdateStats();
end

function UIConfig:UpdateStats()
    UIConfig:SetCharacterStats(LeftStatsTable, statsDropdownList[UISettingsCharacter.selectedLeftStatsCategory]);
    UIConfig:SetCharacterStats(RightStatsTable, statsDropdownList[UISettingsCharacter.selectedRightStatsCategory]);
end

local function OnClickLeftStatsDropdown(self)
    UISettingsCharacter.selectedLeftStatsCategory = self:GetID();
    UIDropDownMenu_SetSelectedID(CSC_UIFrame.CharacterStatsPanel.leftStatsDropDown, UISettingsCharacter.selectedLeftStatsCategory);
    UIConfig:SetCharacterStats(LeftStatsTable, statsDropdownList[UISettingsCharacter.selectedLeftStatsCategory]);
end

local function OnClickRightStatsDropdown(self)
    UISettingsCharacter.selectedRightStatsCategory = self:GetID();
    UIDropDownMenu_SetSelectedID(CSC_UIFrame.CharacterStatsPanel.rightStatsDropDown, UISettingsCharacter.selectedRightStatsCategory);
    UIConfig:SetCharacterStats(RightStatsTable, statsDropdownList[UISettingsCharacter.selectedRightStatsCategory]);
end

function UIConfig:InitializeLeftStatsDropdown(self, level)
    local info = UIDropDownMenu_CreateInfo();
    for k,v in pairs(statsDropdownList) do
        info.text = v;
        info.func = OnClickLeftStatsDropdown;
        info.checked = false;
        UIDropDownMenu_AddButton(info, level);
     end
end

function UIConfig:InitializeRightStatsDropdown(self, level)
    local info = UIDropDownMenu_CreateInfo();
    for k,v in pairs(statsDropdownList) do
        info.text = v;
        info.func = OnClickRightStatsDropdown;
        info.checked = false;
        UIDropDownMenu_AddButton(info, level);
     end
end

function UIConfig:SetupDropdown()

    CSC_UIFrame.CharacterStatsPanel.leftStatsDropDown = CreateFrame("Frame", nil, CSC_UIFrame.CharacterStatsPanel, "UIDropDownMenuTemplate");
    CSC_UIFrame.CharacterStatsPanel.leftStatsDropDown:SetPoint("TOPLEFT", CSC_UIFrame.CharacterStatsPanel, "TOPLEFT", 0, 0);

    CSC_UIFrame.CharacterStatsPanel.rightStatsDropDown = CreateFrame("Frame", nil, CSC_UIFrame.CharacterStatsPanel, "UIDropDownMenuTemplate");
    CSC_UIFrame.CharacterStatsPanel.rightStatsDropDown:SetPoint("TOPLEFT", CSC_UIFrame.CharacterStatsPanel, "TOPLEFT", 115, 0);

    UIDropDownMenu_Initialize(CSC_UIFrame.CharacterStatsPanel.leftStatsDropDown, UIConfig.InitializeLeftStatsDropdown);
    UIDropDownMenu_SetSelectedID(CSC_UIFrame.CharacterStatsPanel.leftStatsDropDown, UISettingsCharacter.selectedLeftStatsCategory);
    UIDropDownMenu_SetWidth(CSC_UIFrame.CharacterStatsPanel.leftStatsDropDown, 99);
    UIDropDownMenu_JustifyText(CSC_UIFrame.CharacterStatsPanel.leftStatsDropDown, "LEFT");

    UIDropDownMenu_Initialize(CSC_UIFrame.CharacterStatsPanel.rightStatsDropDown, UIConfig.InitializeRightStatsDropdown);
    UIDropDownMenu_SetSelectedID(CSC_UIFrame.CharacterStatsPanel.rightStatsDropDown, UISettingsCharacter.selectedRightStatsCategory);
    UIDropDownMenu_SetWidth(CSC_UIFrame.CharacterStatsPanel.rightStatsDropDown, 99);
    UIDropDownMenu_JustifyText(CSC_UIFrame.CharacterStatsPanel.rightStatsDropDown, "LEFT");
end

-- Hook a custom function in order to extend the functionality of the default ToggleCharacter function
local function CSC_ToggleCharacterPostHook(tab, onlyShow)
    if (tab == "PaperDollFrame") then
        CSC_UIFrame.CharacterStatsPanel:Show();
        CSC_UIFrame:UpdateStats();
    else
        CSC_UIFrame.CharacterStatsPanel:Hide();
    end
end
hooksecurefunc("ToggleCharacter", CSC_ToggleCharacterPostHook);

-- Serializing the DB
local dbLoader = CreateFrame("Frame");
dbLoader:RegisterEvent("ADDON_LOADED");
dbLoader:RegisterEvent("PLAYER_LOGOUT");

-- ADDON_LOADED is called after the code of the addon is being executed
-- Therefore I have to call any setup-functions dependent on the DB after the event (UIConfig:SetupDropdown())
function dbLoader:OnEvent(event, arg1)
    if (event == "ADDON_LOADED" and arg1 == "_ShiGuang") then
        UIConfig:CreateMenu();
    end
end

dbLoader:SetScript("OnEvent", dbLoader.OnEvent);


local characterStatsClassicEventFrame = CreateFrame("Frame");
characterStatsClassicEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
characterStatsClassicEventFrame:RegisterEvent("UNIT_MODEL_CHANGED");
characterStatsClassicEventFrame:RegisterEvent("UNIT_LEVEL");
characterStatsClassicEventFrame:RegisterEvent("UNIT_RESISTANCES");
characterStatsClassicEventFrame:RegisterEvent("UNIT_STATS");
characterStatsClassicEventFrame:RegisterEvent("UNIT_DAMAGE");
characterStatsClassicEventFrame:RegisterEvent("UNIT_RANGEDDAMAGE");
characterStatsClassicEventFrame:RegisterEvent("PLAYER_DAMAGE_DONE_MODS");
characterStatsClassicEventFrame:RegisterEvent("UNIT_ATTACK_SPEED");
characterStatsClassicEventFrame:RegisterEvent("UNIT_ATTACK_POWER");
characterStatsClassicEventFrame:RegisterEvent("UNIT_RANGED_ATTACK_POWER");
characterStatsClassicEventFrame:RegisterEvent("UNIT_ATTACK");
characterStatsClassicEventFrame:RegisterEvent("PLAYER_GUILD_UPDATE");
characterStatsClassicEventFrame:RegisterEvent("SKILL_LINES_CHANGED");

characterStatsClassicEventFrame:SetScript("OnEvent",
    function(self, event, ...)
        CharacterStatsClassic.UIConfig:UpdateStats();
    end)
    
    --[[
    Util functions that wrap my interface and the Blizzard's WoW Classic lua API code for ease of use
]]

local CSC_ScanTooltip = CreateFrame("GameTooltip", "CSC_ScanTooltip", nil, "GameTooltipTemplate");
CSC_ScanTooltip:SetOwner(WorldFrame, "ANCHOR_NONE");
local CSC_ScanTooltipPrefix = "CSC_ScanTooltip";

local g_lastSeenBaseManaRegen = 0;
local g_lastSeenCastingManaRegen = 0;

-- GENERAL UTIL FUNCTIONS --
local function CSC_GetAppropriateDamage(unit, category)
	if category == PLAYERSTAT_MELEE_COMBAT then
		return UnitDamage(unit);
	elseif category == PLAYERSTAT_RANGED_COMBAT then
		local attackTime, minDamage, maxDamage, bonusPos, bonusNeg, percent = UnitRangedDamage(unit);
		return minDamage, maxDamage, nil, nil, bonusPos, bonusNeg, percent;
	end
end

local function CSC_GetAppropriateAttackSpeed(unit, category)
	if category == PLAYERSTAT_MELEE_COMBAT then
		return UnitAttackSpeed(unit);
	elseif category == PLAYERSTAT_RANGED_COMBAT then
		local attackSpeed = select(1, UnitRangedDamage(unit))
		return attackSpeed, 0;
	end
end

local function CSC_GetAppropriateAttackRaiting(unit, category)
	local attackBase = 0;
	local attackModifier = 0;

	if category == PLAYERSTAT_MELEE_COMBAT then
		attackBase, attackModifier = UnitAttackBothHands(unit);
	elseif category == PLAYERSTAT_RANGED_COMBAT then
		attackBase, attackModifier = UnitRangedAttack(unit)
	end

	local attackWithModifier = attackBase + attackModifier;
	return attackWithModifier;
end

local function CSC_PaperDollFrame_SetLabelAndText(statFrame, label, text, isPercentage, numericValue, precision)
	if ( isPercentage ) then
		precision = precision or "%.1F%%";
		statFrame.Value:SetText(format(precision, numericValue));
	else
		statFrame.Value:SetText(text);
	end
	statFrame.numericValue = numericValue;

	if ( statFrame.Label ) then
		statFrame.Label:SetText(format(STAT_FORMAT, label));
		statFrame.Label:SetWidth(statFrame:GetWidth() - statFrame.Value:GetWidth() - 20);
		statFrame.Label:SetHeight(statFrame:GetHeight());
		statFrame.Label:SetJustifyH("LEFT");
	end
end

local function CSC_PaperDollFormatStat(name, base, posBuff, negBuff)
	local effective = max(0,base + posBuff + negBuff);
	local text = HIGHLIGHT_FONT_COLOR_CODE..name.." "..effective;
	if ( ( posBuff == 0 ) and ( negBuff == 0 ) ) then
		text = text..FONT_COLOR_CODE_CLOSE;
	else 
		if ( posBuff > 0 or negBuff < 0 ) then
			text = text.." ("..base..FONT_COLOR_CODE_CLOSE;
		end
		if ( posBuff > 0 ) then
			text = text..FONT_COLOR_CODE_CLOSE..GREEN_FONT_COLOR_CODE.."+"..posBuff..FONT_COLOR_CODE_CLOSE;
		end
		if ( negBuff < 0 ) then
			text = text..RED_FONT_COLOR_CODE.." "..negBuff..FONT_COLOR_CODE_CLOSE;
		end
		if ( posBuff > 0 or negBuff < 0 ) then
			text = text..HIGHLIGHT_FONT_COLOR_CODE..")"..FONT_COLOR_CODE_CLOSE;
		end

		-- if there is a negative buff then show the main number in red, even if there are
		-- positive buffs. Otherwise show the number in green
		if ( negBuff < 0 ) then
			effective = RED_FONT_COLOR_CODE..effective..FONT_COLOR_CODE_CLOSE;
		elseif (posBuff > 0) then
			effective = GREEN_FONT_COLOR_CODE..effective..FONT_COLOR_CODE_CLOSE;
		end
	end
    
    return effective, text;
end

local function CSC_GetMP5FromGear(unit)
	local mp5 = 0;
	for i=1,18 do
		local itemLink = GetInventoryItemLink(unit, i);
		if itemLink then
			local stats = GetItemStats(itemLink);
			if stats then
				-- For some reason this returns (mp5 - 1) so I have to add 1 to the result
				local statMP5 = stats["ITEM_MOD_POWER_REGEN0_SHORT"];
				if (statMP5) then
					mp5 = mp5 + statMP5 + 1;
				end
			end
		end
	end

	return mp5;
end

local function CSC_GetSkillRankAndModifier(skillHeader, skillName)
	local numSkills = GetNumSkillLines();
	local skillIndex = 0;
	local currentHeader = nil;

	for i = 1, numSkills do
		local currentSkillName = select(1, GetSkillLineInfo(i));
		local isHeader = select(2, GetSkillLineInfo(i));

		if isHeader ~= nil and isHeader then
			currentHeader = currentSkillName;
		else
			if (currentHeader == skillHeader and currentSkillName == skillName) then
				skillIndex = i;
				break;
			end
		end
	end

	local skillRank = nil;
	local skillModifier = nil;
	if (skillIndex > 0) then
		skillRank = select(4, GetSkillLineInfo(skillIndex));
		skillModifier = select(6, GetSkillLineInfo(skillIndex));
	end

	return skillRank, skillModifier;
end

function CSC_GetPlayerWeaponSkill(unit, weaponSlotId)
	local totalWeaponSkill = nil;

	local unitClassId = select(3, UnitClass(unit));
	-- Druid checks
	local shapeIndex = -1;
	if (unitClassId == CSC_DRUID_CLASS_ID) then
		shapeIndex = CSC_GetShapeshiftForm();
	end

	if (unitClassId == CSC_DRUID_CLASS_ID) and (shapeIndex > 0) then
		totalWeaponSkill = UnitLevel(unit) * 5;
	else
		local itemId = GetInventoryItemID(unit, weaponSlotId);
		if (itemId) then
			local itemSubtypeId = select(7, GetItemInfoInstant(itemId));
			if itemSubtypeId then
				local weaponString = g_WeaponStringByWeaponId[itemSubtypeId];
				if weaponString then
					local skillRank, skillModifier = CSC_GetSkillRankAndModifier(CSC_WEAPON_SKILLS_HEADER, weaponString);
					if skillRank and skillModifier then
						-- Weapon skill from racials should be already in skillRank
						totalWeaponSkill = skillRank + skillModifier;
					end
				end
			end
		end
	end

	return totalWeaponSkill;
end

function CSC_GetPlayerMissChances(unit, playerHit, totalWeaponSkill)
	local hitChance = playerHit;
	local missChanceVsNPC = 5; -- Level 60 npcs with 300 def
	local missChanceVsBoss = 9;
	local missChanceVsPlayer = 5; -- Level 60 player def is 300 base

	if totalWeaponSkill then
		local bossDefense = 315; -- level 63
		local playerBossDeltaSkill = bossDefense - totalWeaponSkill;
		
		if (playerBossDeltaSkill > 10) then
			if (hitChance >= 1) then
				hitChance = hitChance - 1;
			end

			missChanceVsBoss = 5 + (playerBossDeltaSkill * 0.2);
		else
			missChanceVsBoss = 5 + (playerBossDeltaSkill * 0.1);
		end
	end

	local dwMissChanceVsNpc = math.max(0, (missChanceVsNPC*0.8 + 20) - playerHit);
	local dwMissChanceVsBoss = math.max(0, (missChanceVsBoss*0.8 + 20) - hitChance);
	local dwMissChanceVsPlayer = math.max(0, (missChanceVsPlayer*0.8 + 20) - playerHit);

	missChanceVsNPC = math.max(0, missChanceVsNPC - playerHit);
	missChanceVsBoss = math.max(0, missChanceVsBoss - hitChance);
	missChanceVsPlayer = math.max(0, missChanceVsPlayer - playerHit);

	return missChanceVsNPC, missChanceVsBoss, missChanceVsPlayer, dwMissChanceVsNpc, dwMissChanceVsBoss, dwMissChanceVsPlayer;
end
-- GENERAL UTIL FUNCTIONS END --

-- PRIMARY STATS --
function CSC_PaperDollFrame_SetPrimaryStats(statFrames, unit)
	
	local statIndexTable = {
		"STRENGTH",
		"AGILITY",
		"STAMINA",
		"INTELLECT",
		"SPIRIT",
	}

	-- Fix for classic (NUM_STATS instead of NUM_STATS-1)
	for i=1, NUM_STATS, 1 do
		local frameText;

		local stat;
		local effectiveStat;
		local posBuff;
		local negBuff;
		stat, effectiveStat, posBuff, negBuff = UnitStat(unit, i);
		
		-- Set the tooltip text
		local tooltipText = HIGHLIGHT_FONT_COLOR_CODE.._G["SPELL_STAT"..i.."_NAME"].." ";

		-- Get class specific tooltip for that stat
		local temp, classFileName = UnitClass(unit);
		local classStatText = _G[strupper(classFileName).."_"..statIndexTable[i].."_".."TOOLTIP"];
		-- If can't find one use the default
		if ( not classStatText ) then
			classStatText = _G["DEFAULT".."_"..statIndexTable[i].."_".."TOOLTIP"];
		end

		if ( ( posBuff == 0 ) and ( negBuff == 0 ) ) then
			--text:SetText(effectiveStat);
			frameText = effectiveStat;
			statFrames[i].tooltip = tooltipText..effectiveStat..FONT_COLOR_CODE_CLOSE;
			statFrames[i].tooltip2 = classStatText;
		else 
			tooltipText = tooltipText..effectiveStat;
			if ( posBuff > 0 or negBuff < 0 ) then
				tooltipText = tooltipText.." ("..(stat - posBuff - negBuff)..FONT_COLOR_CODE_CLOSE;
			end
			if ( posBuff > 0 ) then
				tooltipText = tooltipText..FONT_COLOR_CODE_CLOSE..GREEN_FONT_COLOR_CODE.."+"..posBuff..FONT_COLOR_CODE_CLOSE;
			end
			if ( negBuff < 0 ) then
				tooltipText = tooltipText..RED_FONT_COLOR_CODE.." "..negBuff..FONT_COLOR_CODE_CLOSE;
			end
			if ( posBuff > 0 or negBuff < 0 ) then
				tooltipText = tooltipText..HIGHLIGHT_FONT_COLOR_CODE..")"..FONT_COLOR_CODE_CLOSE;
			end
			statFrames[i].tooltip = tooltipText;
			statFrames[i].tooltip2= classStatText;

			-- If there are any negative buffs then show the main number in red even if there are
			-- positive buffs. Otherwise show in green.
			if ( negBuff < 0 ) then
				frameText = RED_FONT_COLOR_CODE..effectiveStat..FONT_COLOR_CODE_CLOSE;
			else
				frameText = GREEN_FONT_COLOR_CODE..effectiveStat..FONT_COLOR_CODE_CLOSE;
			end
		end
		CSC_PaperDollFrame_SetLabelAndText(statFrames[i], _G["SPELL_STAT"..i.."_NAME"], frameText, false, effectiveStat);
		statFrames[i]:Show();
	end
end

-- DAMAGE --
function CSC_PaperDollFrame_SetDamage(statFrame, unit, category)

	if (category == PLAYERSTAT_RANGED_COMBAT) and not IsRangedWeapon() then
		CSC_PaperDollFrame_SetLabelAndText(statFrame, DAMAGE, NOT_APPLICABLE, false, 0);
		statFrame:Show();
		return;
	end

    statFrame:SetScript("OnEnter", CSC_CharacterDamageFrame_OnEnter)
	statFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
    end)

    local speed, offhandSpeed = CSC_GetAppropriateAttackSpeed(unit, category);
	local minDamage, maxDamage, minOffHandDamage, maxOffHandDamage, physicalBonusPos, physicalBonusNeg, percentMod = CSC_GetAppropriateDamage(unit, category);
	
	-- sometimes this is wrongly reported as 0
	if percentMod == nil or percentMod == 0 then
		percentMod = 1;
	end

	if speed == nil or speed == 0 then
		speed = 1;
	end
    
    local displayMin = max(floor(minDamage),1);
    local displayMax = max(ceil(maxDamage),1);
    
    minDamage = (minDamage / percentMod) - physicalBonusPos - physicalBonusNeg;
    maxDamage = (maxDamage / percentMod) - physicalBonusPos - physicalBonusNeg;
    
    local baseDamage = (minDamage + maxDamage) * 0.5;
	local fullDamage = (baseDamage + physicalBonusPos + physicalBonusNeg) * percentMod;
	local totalBonus = (fullDamage - baseDamage);
	local damagePerSecond = (max(fullDamage,1) / speed);
    local damageTooltip = max(floor(minDamage),1).." - "..max(ceil(maxDamage),1);
    
    local colorPos = "|cff20ff20";
    local colorNeg = "|cffff2020";
	
    -- epsilon check
	if ( totalBonus < 0.1 and totalBonus > -0.1 ) then
		totalBonus = 0.0;
    end
    
    local damageText;

    if ( totalBonus == 0 ) then
		if ( ( displayMin < 100 ) and ( displayMax < 100 ) ) then 
			damageText = displayMin.." - "..displayMax;
		else
			damageText = displayMin.."-"..displayMax;
		end
	else
		-- set bonus color and display
		local color;
		if ( totalBonus > 0 ) then
			color = colorPos;
		else
			color = colorNeg;
		end
		if ( ( displayMin < 100 ) and ( displayMax < 100 ) ) then 
			damageText = color..displayMin.." - "..displayMax.."|r";
		else
			damageText = color..displayMin.."-"..displayMax.."|r";
		end
		if ( physicalBonusPos > 0 ) then
			damageTooltip = damageTooltip..colorPos.." +"..physicalBonusPos.."|r";
		end
		if ( physicalBonusNeg < 0 ) then
			damageTooltip = damageTooltip..colorNeg.." "..physicalBonusNeg.."|r";
		end
		if ( percentMod > 1 ) then
			damageTooltip = damageTooltip..colorPos.." x"..floor(percentMod*100+0.5).."%|r";
		elseif ( percentMod < 1 ) then
			damageTooltip = damageTooltip..colorNeg.." x"..floor(percentMod*100+0.5).."%|r";
		end
    end
    
    CSC_PaperDollFrame_SetLabelAndText(statFrame, DAMAGE, damageText, false, displayMax);

    statFrame.damage = damageTooltip;
	statFrame.attackSpeed = speed;
    statFrame.dps = damagePerSecond;
	statFrame.attackRating = CSC_GetAppropriateAttackRaiting(unit, category);
	statFrame.TooltipMainTxt = INVTYPE_WEAPONMAINHAND;

	if (category == PLAYERSTAT_RANGED_COMBAT) and IsRangedWeapon() then
		statFrame.TooltipMainTxt = INVTYPE_RANGED;
	end

    -- If there's an offhand speed then add the offhand info to the tooltip
	if ( offhandSpeed and category == PLAYERSTAT_MELEE_COMBAT) then
		if offhandSpeed == 0 then
			offhandSpeed = 1;
		end

		minOffHandDamage = (minOffHandDamage / percentMod) - physicalBonusPos - physicalBonusNeg;
		maxOffHandDamage = (maxOffHandDamage / percentMod) - physicalBonusPos - physicalBonusNeg;

		local offhandBaseDamage = (minOffHandDamage + maxOffHandDamage) * 0.5;
		local offhandFullDamage = (offhandBaseDamage + physicalBonusPos + physicalBonusNeg) * percentMod;
		local offhandDamagePerSecond = (max(offhandFullDamage,1) / offhandSpeed);
		local offhandDamageTooltip = max(floor(minOffHandDamage),1).." - "..max(ceil(maxOffHandDamage),1);
		if ( physicalBonusPos > 0 ) then
			offhandDamageTooltip = offhandDamageTooltip..colorPos.." +"..physicalBonusPos.."|r";
		end
		if ( physicalBonusNeg < 0 ) then
			offhandDamageTooltip = offhandDamageTooltip..colorNeg.." "..physicalBonusNeg.."|r";
		end
		if ( percentMod > 1 ) then
			offhandDamageTooltip = offhandDamageTooltip..colorPos.." x"..floor(percentMod*100+0.5).."%|r";
		elseif ( percentMod < 1 ) then
			offhandDamageTooltip = offhandDamageTooltip..colorNeg.." x"..floor(percentMod*100+0.5).."%|r";
		end
		statFrame.offhandDamage = offhandDamageTooltip;
		statFrame.offhandAttackSpeed = offhandSpeed;
		statFrame.offhandDps = offhandDamagePerSecond;
	else
		statFrame.offhandAttackSpeed = nil;
    end

	statFrame:Show();
end

-- Note: while this function was historically named "BothHands",
-- it looks like it only ever displayed attack rating for the main hand.
function CSC_PaperDollFrame_SetAttackBothHands(statFrame, unit)

	local mainHandAttackBase, mainHandAttackMod = UnitAttackBothHands(unit);
	local attackWithModifier = mainHandAttackBase + mainHandAttackMod;
	local attackText;

	if( mainHandAttackMod == 0 ) then
		attackText = mainHandAttackBase;
	else
		local color = RED_FONT_COLOR_CODE;
		if( mainHandAttackMod > 0 ) then
			color = GREEN_FONT_COLOR_CODE;
		end
		attackText = color..attackWithModifier..FONT_COLOR_CODE_CLOSE;
	end

	CSC_PaperDollFrame_SetLabelAndText(statFrame, DAMAGE, attackText, false, attackWithModifier);

	statFrame.tooltip = ATTACK_TOOLTIP;
	statFrame.tooltip2 = ATTACK_TOOLTIP_SUBTEXT;
	statFrame:Show();
end

function CSC_PaperDollFrame_SetMeleeAttackPower(statFrame, unit)
    
	local base, posBuff, negBuff = UnitAttackPower(unit);
    
    local valueText, tooltipText = CSC_PaperDollFormatStat(MELEE_ATTACK_POWER, base, posBuff, negBuff);
    local valueNum = max(0, base + posBuff + negBuff);
    CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_ATTACK_POWER, valueText, false, valueNum);
    statFrame.tooltip = tooltipText;
    statFrame.tooltip2 = format(MELEE_ATTACK_POWER_TOOLTIP, max((base+posBuff+negBuff), 0)/ATTACK_POWER_MAGIC_NUMBER);
	statFrame:Show();
end

function CSC_PaperDollFrame_SetRangedAttackPower(statFrame, unit)
	
	if not IsRangedWeapon() then
		CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_ATTACK_POWER, NOT_APPLICABLE, false, 0);
		statFrame:Show();
		return;
	end

	if ( HasWandEquipped() ) then
		CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_ATTACK_POWER, NOT_APPLICABLE, false, 0);
		statFrame.tooltip = nil;
		statFrame:Show();
		return;
	end

	local base, posBuff, negBuff = UnitRangedAttackPower(unit);
    local valueText, tooltipText = CSC_PaperDollFormatStat(RANGED_ATTACK_POWER, base, posBuff, negBuff);
    local valueNum = max(0, base + posBuff + negBuff);
    CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_ATTACK_POWER, valueText, false, valueNum);
	statFrame.tooltip = tooltipText;
    statFrame.tooltip2 = format(RANGED_ATTACK_POWER_TOOLTIP, valueNum/ATTACK_POWER_MAGIC_NUMBER);
    statFrame:Show();
end

-- SECONDARY STATS --
function CSC_PaperDollFrame_SetCritChance(statFrame, unit)
	
	statFrame:SetScript("OnEnter", CSC_CharacterMeleeCritFrame_OnEnter)
	statFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
    end)
	
	local critChance = GetCritChance();

    CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_CRITICAL_STRIKE, critChance, true, critChance);
	statFrame.criticalStrikeTxt = format(PAPERDOLLFRAME_TOOLTIP_FORMAT, STAT_CRITICAL_STRIKE).." "..format("%.2F%%", critChance);
    statFrame:Show();
end

function CSC_PaperDollFrame_SetRangedCritChance(statFrame, unit)

	if not IsRangedWeapon() then
		CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_CRITICAL_STRIKE, NOT_APPLICABLE, false, 0);
		statFrame:Show();
		return;
	end

	local critChance = GetRangedCritChance();

    CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_CRITICAL_STRIKE, critChance, true, critChance);
	statFrame.tooltip = format(PAPERDOLLFRAME_TOOLTIP_FORMAT, STAT_CRITICAL_STRIKE).." "..format("%.2F%%", critChance);
    statFrame:Show();
end

function CSC_PaperDollFrame_SetSpellCritChance(statFrame, unit)

	statFrame:SetScript("OnEnter", CSC_CharacterSpellCritFrame_OnEnter)
	statFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
    end)
	
	local MAX_SPELL_SCHOOLS = 7;
	local holySchool = 2;

	-- Start at 2 to skip physical damage
	local maxSpellCrit = GetSpellCritChance(holySchool);
	for i=holySchool, MAX_SPELL_SCHOOLS do
		local bonusCrit = GetSpellCritChance(i);
		maxSpellCrit = max(maxSpellCrit, bonusCrit);
	end

	statFrame.holyCrit = GetSpellCritChance(2);
	statFrame.fireCrit = GetSpellCritChance(3);
	statFrame.natureCrit = GetSpellCritChance(4);
	statFrame.frostCrit = GetSpellCritChance(5);
	statFrame.shadowCrit = GetSpellCritChance(6);
	statFrame.arcaneCrit = GetSpellCritChance(7);

	local unitClassId = select(3, UnitClass(unit));
	if (unitClassId == CSC_MAGE_CLASS_ID) then
		local arcaneInstabilityCrit, criticalMassCrit = CSC_GetMageCritStatsFromTalents();
		if (arcaneInstabilityCrit > 0) then
			-- increases the crit of all spell schools
			statFrame.holyCrit = statFrame.holyCrit + arcaneInstabilityCrit;
			statFrame.fireCrit = statFrame.fireCrit + arcaneInstabilityCrit;
			statFrame.natureCrit = statFrame.natureCrit + arcaneInstabilityCrit;
			statFrame.frostCrit = statFrame.frostCrit + arcaneInstabilityCrit;
			statFrame.shadowCrit = statFrame.shadowCrit + arcaneInstabilityCrit;
			statFrame.arcaneCrit = statFrame.arcaneCrit + arcaneInstabilityCrit;
			-- set the new maximum
			maxSpellCrit = maxSpellCrit + arcaneInstabilityCrit;
		end
		if (criticalMassCrit > 0) then
			statFrame.fireCrit = statFrame.fireCrit + criticalMassCrit;
			-- set the new maximum
			maxSpellCrit = max(maxSpellCrit, statFrame.fireCrit);
		end
	elseif (unitClassId == CSC_PRIEST_CLASS_ID) then
		local priestHolyCrit = CSC_GetPriestCritStatsFromTalents();
		priestHolyCrit = priestHolyCrit + CSC_GetHolyCritFromBenediction(unit);
		
		if (priestHolyCrit > 0) then
			statFrame.holyCrit = statFrame.holyCrit + priestHolyCrit;
			-- set the new maximum
			maxSpellCrit = max(maxSpellCrit, statFrame.holyCrit);
		end
	elseif (unitClassId == CSC_WARLOCK_CLASS_ID) then
		local destructionCrit = CSC_GetWarlockCritStatsFromTalents();
		if (destructionCrit > 0) then
			statFrame.shadowCrit = statFrame.shadowCrit + destructionCrit;
			statFrame.fireCrit = statFrame.fireCrit + destructionCrit;
			local tmpMax = max(statFrame.shadowCrit, statFrame.fireCrit);
			-- set the new maximum
			maxSpellCrit = max(maxSpellCrit, tmpMax);
		end
	end

	CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_CRITICAL_STRIKE, maxSpellCrit, true, maxSpellCrit);

    statFrame:Show();
end

function CSC_PaperDollFrame_SetHitChance(statFrame, unit)
	
	statFrame:SetScript("OnEnter", CSC_CharacterHitChanceFrame_OnEnter)
	statFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	
	local hitChance = GetHitModifier();
	
	if not hitChance then
		hitChance = 0;
	end

	local hitChanceText = hitChance;
	CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_HIT_CHANCE, hitChanceText, true, hitChance);
	statFrame.hitChance = hitChance;
	statFrame:Show();
end

local function CSC_GetHitFromBiznicksAccurascope(unit)
	CSC_ScanTooltip:ClearLines();

	local hitFromScope = 0;
	local rangedIndex = 18;

	local itemLink = GetInventoryItemLink(unit, rangedIndex);
	if itemLink then
		local itemId, enchantId = itemLink:match("item:(%d+):(%d*)");
		if enchantId then
			if tonumber(enchantId) == 2523 then
				hitFromScope = 3;
			end
		end
	end

	return hitFromScope;
end

function CSC_PaperDollFrame_SetRangedHitChance(statFrame, unit)
	
	if not IsRangedWeapon() then
		CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_HIT_CHANCE, NOT_APPLICABLE, false, 0);
		statFrame:Show();
		return;
	end

	statFrame:SetScript("OnEnter", CSC_CharacterRangedHitChanceFrame_OnEnter)
	statFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	
	local hitChance = GetHitModifier();
	
	if not hitChance then
		hitChance = 0;
	end

	local hitFromScope = CSC_GetHitFromBiznicksAccurascope(unit);
	if (hitFromScope > 0) then
		hitChance = hitChance + hitFromScope;
	end

	local hitChanceText = hitChance;
	CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_HIT_CHANCE, hitChanceText, true, hitChance);
	statFrame.hitChance = hitChance;
	statFrame:Show();
end

function CSC_PaperDollFrame_SetSpellHitChance(statFrame, unit)
	
	statFrame:SetScript("OnEnter", CSC_CharacterSpellHitChanceFrame_OnEnter)
	statFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)

	local hitChance = GetSpellHitModifier();
	
	if not hitChance then
		hitChance = 0;
	end

	local unitClassId = select(3, UnitClass(unit));

	if unitClassId == CSC_MAGE_CLASS_ID then
		local arcaneHit, frostFireHit = CSC_GetMageSpellHitFromTalents();
		statFrame.arcaneHit = arcaneHit;
		statFrame.frostHit = frostFireHit;
		statFrame.fireHit = frostFireHit;
	elseif unitClassId == CSC_WARLOCK_CLASS_ID then
		statFrame.afflictionHit = CSC_GetWarlockSpellHitFromTalents();
	end

	local hitChanceText = hitChance;
	CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_HIT_CHANCE, hitChanceText, true, hitChance);
	statFrame.hitChance = hitChance;
	statFrame.unitClassId = unitClassId;
	statFrame:Show();
end

function CSC_PaperDollFrame_SetAttackSpeed(statFrame, unit)
	local speed, offhandSpeed = UnitAttackSpeed(unit);
	local speedLabel = WEAPON_SPEED;

	local displaySpeed = format("%.2F", speed);
	if ( offhandSpeed ) then
		offhandSpeed = format("%.2F", offhandSpeed);
	end
	if ( offhandSpeed ) then
		displaySpeed =  displaySpeed.." / ".. offhandSpeed;
	else
		displaySpeed =  displaySpeed;
	end
	CSC_PaperDollFrame_SetLabelAndText(statFrame, speedLabel, displaySpeed, false, speed);
	statFrame.tooltip = format(PAPERDOLLFRAME_TOOLTIP_FORMAT, ATTACK_SPEED).." "..displaySpeed;
	statFrame:Show();
end

function CSC_PaperDollFrame_SetRangedAttackSpeed(statFrame, unit)
	
	if not IsRangedWeapon() then
		CSC_PaperDollFrame_SetLabelAndText(statFrame, WEAPON_SPEED, NOT_APPLICABLE, false, 0);
		statFrame:Show();
		return;
	end

	local attackSpeed, minDamage, maxDamage, bonusPos, bonusNeg, percent = UnitRangedDamage(unit);
	local displaySpeed = format("%.2F", attackSpeed);

	CSC_PaperDollFrame_SetLabelAndText(statFrame, WEAPON_SPEED, displaySpeed, false, attackSpeed);
	statFrame.tooltip = format(PAPERDOLLFRAME_TOOLTIP_FORMAT, ATTACK_SPEED).." "..displaySpeed;
	statFrame:Show();
end

-- DEFENSES --
function CSC_PaperDollFrame_SetArmor(statFrame, unit)

	local base, effectiveArmor, armor, posBuff, negBuff = UnitArmor(unit);
	--negBuff = 0; -- Remove for Classic

	if (unit ~= "player") then
		--[[ In 1.12.0, UnitArmor didn't report positive / negative buffs for units that weren't the active player.
			 This hack replicates that behavior for the UI. ]]
		base = effectiveArmor;
		armor = effectiveArmor;
		posBuff = 0;
		negBuff = 0;
	end

	local playerLevel = UnitLevel(unit);
	local armorReduction = effectiveArmor/((85 * playerLevel) + 400);
	armorReduction = 100 * (armorReduction/(armorReduction + 1));

	local valueText, tooltipText = CSC_PaperDollFormatStat(ARMOR, base, posBuff, negBuff);
	local valueNum = max(0, base + posBuff + negBuff);
	CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_ARMOR, valueText, false, valueNum);
	statFrame.tooltip = tooltipText;
    statFrame.tooltip2 = format(ARMOR_TOOLTIP, playerLevel, armorReduction);
	statFrame:Show();
end

function CSC_PaperDollFrame_SetDefense(statFrame, unit)

	local numSkills = GetNumSkillLines();
	local skillIndex = 0;
	local currentHeader = nil;

	for i = 1, numSkills do
		local skillName = select(1, GetSkillLineInfo(i));
		local isHeader = select(2, GetSkillLineInfo(i));

		if isHeader ~= nil and isHeader then
			currentHeader = skillName;
		else
			if (currentHeader == CSC_WEAPON_SKILLS_HEADER and skillName == DEFENSE) then
				skillIndex = i;
				break;
			end
		end
	end

	local skillRank, skillModifier;
	if (skillIndex > 0) then
		skillRank = select(4, GetSkillLineInfo(skillIndex));
		skillModifier = select(6, GetSkillLineInfo(skillIndex));
	else
		-- Use this as a backup, just in case something goes wrong
		skillRank, skillModifier = UnitDefense(unit); --Not working properly
	end

	local posBuff = 0;
	local negBuff = 0;
	if ( skillModifier > 0 ) then
		posBuff = skillModifier;
	elseif ( skillModifier < 0 ) then
		negBuff = skillModifier;
	end
	local valueText, tooltipText = CSC_PaperDollFormatStat(DEFENSE_COLON, skillRank, posBuff, negBuff);
	local valueNum = max(0, skillRank + posBuff + negBuff);
	CSC_PaperDollFrame_SetLabelAndText(statFrame, DEFENSE, valueText, false, valueNum);
	statFrame.tooltip = tooltipText;
	tooltipText = format(DEFAULT_STATDEFENSE_TOOLTIP, valueNum, 0, valueNum*0.04, valueNum*0.04);
	tooltipText = tooltipText:gsub('.-\n', '', 1);
	tooltipText = tooltipText:gsub('\n|cff888888%b()|r', '');
	statFrame.tooltip2 = tooltipText;
	statFrame:Show();
end

function CSC_PaperDollFrame_SetDodge(statFrame, unit)
	local chance = GetDodgeChance();
	CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_DODGE, chance, true, chance, "%.2F%%");
	statFrame.tooltip = format(PAPERDOLLFRAME_TOOLTIP_FORMAT, DODGE_CHANCE).." "..string.format("%.2F", chance).."%";
	--statFrame.tooltip2 = format(CR_DODGE_TOOLTIP, GetCombatRating(CR_DODGE), GetCombatRatingBonus(CR_DODGE));
	statFrame:Show();
end

function CSC_PaperDollFrame_SetParry(statFrame, unit)
	local chance = GetParryChance();
	CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_PARRY, chance, true, chance, "%.2F%%");
	statFrame.tooltip = format(PAPERDOLLFRAME_TOOLTIP_FORMAT, PARRY_CHANCE).." "..string.format("%.2F", chance).."%";
	--statFrame.tooltip2 = format(CR_PARRY_TOOLTIP, GetCombatRating(CR_PARRY), GetCombatRatingBonus(CR_PARRY));
	statFrame:Show();
end

function CSC_GetBlockValue(unit)
	CSC_ScanTooltip:ClearLines();

	local blockValueFromItems = 0;
	local firstItemslotIndex = 1;
	local lastItemslotIndex = 18;

	local blockValueIDs = { ITEM_MOD_BLOCK_RATING_SHORT, ITEM_MOD_BLOCK_RATING, ITEM_MOD_BLOCK_VALUE };
	local equippedMightSetItems = 0;

	for itemslot=firstItemslotIndex, lastItemslotIndex do
		local hasItem = CSC_ScanTooltip:SetInventoryItem(unit, itemslot);
		if hasItem then
			local itemId = GetInventoryItemID(unit, itemslot);
			if (itemId == g_BattlegearOfMightIds[itemId]) then
				equippedMightSetItems = equippedMightSetItems + 1;
			else
				local maxLines = CSC_ScanTooltip:NumLines();
				for line=1, maxLines do
					local leftText = getglobal(CSC_ScanTooltipPrefix.."TextLeft"..line);
					if leftText:GetText() then
						for blockValueID=1, 3 do
							local valueTxt = string.match(leftText:GetText(), "%d+ "..blockValueIDs[blockValueID]);
							if not valueTxt then
								valueTxt = string.match(leftText:GetText(), string.sub( blockValueIDs[blockValueID], 1, -5).." %d+");
							end
							if valueTxt then
								valueTxt = string.match(valueTxt, "%d+");
								if valueTxt then
									local numValue = tonumber(valueTxt);
									if numValue then
										blockValueFromItems = blockValueFromItems + numValue;
									end
								end
							end
						end
					end
				end
			end
		end
	end

	local strStatIndex = 1;
	local strength = select(2, UnitStat(unit, strStatIndex));
	local blockValue = blockValueFromItems + (strength / 20);
	
	local requiredMightSetItems = 3;
	if (equippedMightSetItems >= requiredMightSetItems) then
		blockValue = blockValue + 30; -- Set bonus reached
	end

	return blockValue;
end

function CSC_PaperDollFrame_SetBlock(statFrame, unit)

	statFrame:SetScript("OnEnter", CSC_CharacterBlock_OnEnter)
	statFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	
	local blockChance = GetBlockChance();
	CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_BLOCK, blockChance, true, blockChance, "%.2F%%");

	statFrame.blockChance = string.format("%.2F", blockChance).."%";
	statFrame:Show();
end

-- SPELL --
function CSC_PaperDollFrame_SetSpellPower(statFrame, unit)

	statFrame:SetScript("OnEnter", CSC_CharacterSpellDamageFrame_OnEnter)
	statFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
    end)

	local MAX_SPELL_SCHOOLS = 7;
	local holySchool = 2;

	-- Start at 2 to skip physical damage
	local maxSpellDmg = GetSpellBonusDamage(holySchool);
	for i=holySchool, MAX_SPELL_SCHOOLS do
		local bonusDamage = GetSpellBonusDamage(i);
		maxSpellDmg = max(maxSpellDmg, bonusDamage);
	end

	CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_SPELLPOWER, BreakUpLargeNumbers(maxSpellDmg), false, maxSpellDmg);
	statFrame:Show();
end

local function CSC_GetMP5FromAuras()
	local mp5FromAuras = 0;
	local mp5CombatModifier = 0;

	for i = 0, 40 do
		--local name = select(1, UnitAura("player", i, "HELPFUL", "PLAYER"));
		local spellId = select(10, UnitAura("player", i, "HELPFUL", "PLAYER"));
		if spellId then
			if g_AuraIdToMp5[spellId] then
				mp5FromAuras = mp5FromAuras + g_AuraIdToMp5[spellId];
			elseif g_CombatManaRegenSpellIdToModifier[spellId] then
				mp5CombatModifier = mp5CombatModifier + g_CombatManaRegenSpellIdToModifier[spellId];
			end
			--print(name.." "..spellId);
		end
	end

	return mp5FromAuras, mp5CombatModifier;
end

function CSC_PaperDollFrame_SetManaRegen(statFrame, unit)

	if ( not UnitHasMana(unit) ) then
		CSC_PaperDollFrame_SetLabelAndText(statFrame, MANA_REGEN, NOT_APPLICABLE, false, 0);
		statFrame.tooltip = nil;
		statFrame:Show();
		return;
	end

	statFrame:SetScript("OnEnter", CSC_CharacterManaRegenFrame_OnEnter)
	statFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
    end)

	-- There is a bug in GetManaRegen() so I have to manually calculate mp5
	-- base == casting always and this is wrong
	local base, casting = GetManaRegen();
	
	-- to avoid the wrongly reported "0" regen after an update
	if base < 1 then base = g_lastSeenBaseManaRegen end
	if casting < 1 then casting = g_lastSeenBaseManaRegen end
	g_lastSeenBaseManaRegen = base;
	g_lastSeenCastingManaRegen = casting;

	local mp5FromGear = CSC_GetMP5FromGear(unit);
	local mp5ModifierCasting = CSC_GetMP5ModifierFromTalents(unit);
	mp5ModifierCasting = mp5ModifierCasting + CSC_GetMP5ModifierFromSetBonus(unit);

	local mp5FromAuras, mp5CombatModifier = CSC_GetMP5FromAuras();
	if mp5CombatModifier > 0 then
		mp5ModifierCasting = mp5ModifierCasting + mp5CombatModifier;
	end
	
	-- All mana regen stats are displayed as mana/5 sec.
	local regenWhenNotCasting = floor(base * 5.0) + mp5FromGear + mp5FromAuras;
	casting = mp5FromGear + mp5FromAuras; -- if GetManaRegen() gets fixed ever, this should be changed

	if mp5ModifierCasting > 0 then
		casting = casting + base * mp5ModifierCasting * 5.0;
	end

	local regenWhenNotCastingText = BreakUpLargeNumbers(regenWhenNotCasting);
	local castingText = BreakUpLargeNumbers(casting);
	-- While Casting mana regen is most important to the player, so we display it as the main value
	CSC_PaperDollFrame_SetLabelAndText(statFrame, MANA_REGEN, castingText, false, casting);
	statFrame.mp5FromGear = BreakUpLargeNumbers(mp5FromGear);
	statFrame.mp5Casting = castingText;
	statFrame.mp5NotCasting = regenWhenNotCastingText;
	statFrame:Show();
end

function CSC_PaperDollFrame_SetHealing(statFrame, unit)
	local healing = GetSpellBonusHealing();
	local healingText = healing;
	CSC_PaperDollFrame_SetLabelAndText(statFrame, STAT_SPELLHEALING, healingText, false, healing);
	statFrame.tooltip = STAT_SPELLHEALING.." "..healing;
	statFrame.tooltip2 = STAT_SPELLHEALING_TOOLTIP;
	statFrame:Show();
end

--[[
    Util functions specific for Classes
]]

-- returns additional crit % stats from Arcane instability and Critical Mass if any
function CSC_GetMageCritStatsFromTalents()

	local arcaneInstabilityCrit = 0;
	local criticalMassCrit = 0;

	-- Arcane Instability (1, 2, 3)%
	local arcaneInstabilityTable = { 1, 2, 3 };
	local spellRank = select(5, GetTalentInfo(1, 15));
	if (spellRank > 0) and (spellRank <= 3) then
		arcaneInstabilityCrit = arcaneInstabilityTable[spellRank];
	end

	-- Critical Mass (2, 4, 6)%
	local criticalMassTable = { 2, 4, 6 };
	spellRank = select(5, GetTalentInfo(2, 13));
	if (spellRank > 0) and (spellRank <= 3) then
		criticalMassCrit = criticalMassTable[spellRank];
    end

	return arcaneInstabilityCrit, criticalMassCrit;
end

-- returns the spell hit from Arcane Focus and Elemental Precision talents
function CSC_GetMageSpellHitFromTalents()
	local arcaneHit = 0;
	local frostFireHit = 0;

	-- Arcane Focus
	local spellRank = select(5, GetTalentInfo(1, 2));
	arcaneHit = spellRank * 2; -- 2% for each point

	-- Elemental Precision
	spellRank = select(5, GetTalentInfo(3, 3));
	frostFireHit = spellRank * 2; -- 2% for each point

	return arcaneHit, frostFireHit;
end

-- returns the spell hit from Suppression talent
function CSC_GetWarlockSpellHitFromTalents()
	local afflictionHit = 0;

	-- Suppression
	local spellRank = select(5, GetTalentInfo(1, 1));
	afflictionHit = spellRank * 2; -- 2% for each point

	return afflictionHit;
end

-- returns the spell crit from Devastation talent
function CSC_GetWarlockCritStatsFromTalents()
	-- the spell rank is equal to the value
	local devastationCrit = select(5, GetTalentInfo(3, 7));

	return devastationCrit;
end

-- returns the combined crit stats from Holy Specialization and Force of Will
function CSC_GetPriestCritStatsFromTalents()
	
	local holySpecializationCrit = 0;
	local forceOfWillCrit = 0;

	local critTable = { 1, 2, 3, 4, 5 };
	-- Holy Specialization (1, 2, 3, 4, 5)%
	local spellRank = select(5, GetTalentInfo(2, 3));
	if (spellRank > 0) and (spellRank <= 5) then
		holySpecializationCrit = critTable[spellRank];
	end

	-- Force of Will (1, 2, 3, 4, 5)%
	spellRank = select(5, GetTalentInfo(1, 14));
	if (spellRank > 0) and (spellRank <= 5) then
		forceOfWillCrit = critTable[spellRank];
	end

    local critCombined = holySpecializationCrit + forceOfWillCrit;
	return critCombined;
end

-- returns the crit bonus from Holy Power
function CSC_GetPaladinCritStatsFromTalents()
	-- Holy Power (1, 2, 3, 4, 5)%
	local spellRank = select(5, GetTalentInfo(1, 13));

	return spellRank;
end

-- returns the defense bonus from the Anticipation Prot talent
local function CSC_GetPaladinDefenseFromTalents()

    local defense = 0;
    local defenseTable = { 2, 4, 6, 8, 10 };

    -- Anticipation (2, 4, 6, 8, 10)%
    local spellRank = select(5, GetTalentInfo(2, 9));
    if (spellRank > 0) and (spellRank <=5) then
        defense = defenseTable[spellRank];
    end

    return defense;
end

-- returns the defense bonus from the Anticipation Prot talent
local function CSC_GetWarriorDefenseFromTalents()
    
    local defense = 0;
    local defenseTable = { 2, 4, 6, 8, 10 };

    -- Anticipation (2, 4, 6, 8, 10)%
    local spellRank = select(5, GetTalentInfo(3, 2));
    if (spellRank > 0) and (spellRank <=5) then
		defense = defenseTable[spellRank];
	end

    return defense;
end

function CSC_GetDefenseFromTalents(unit)
    
	local defense = 0;
	local unitClassId = select(3, UnitClass(unit));

    if (unitClassId == CSC_PALADIN_CLASS_ID) then
        defense = CSC_GetPaladinDefenseFromTalents();
    elseif (unitClassId == CSC_WARRIOR_CLASS_ID) then
        defense = CSC_GetWarriorDefenseFromTalents();
    end

    return defense;
end

-- returns the shapeshift form index for druids
function CSC_GetShapeshiftForm()
	local shapeIndex = 0;

	for possibleForm=1, GetNumShapeshiftForms() do
		if select(2, GetShapeshiftFormInfo(possibleForm)) then
			shapeIndex = possibleForm;
		end
	end

	return shapeIndex;
end

function CSC_GetMP5ModifierFromTalents(unit)
    local unitClassId = select(3, UnitClass(unit));
	local spellRank = 0;

	if unitClassId == CSC_PRIEST_CLASS_ID then
		-- Meditation
        spellRank = select(5, GetTalentInfo(1, 8));
	elseif unitClassId == CSC_MAGE_CLASS_ID then
		-- Arcane Meditation
		spellRank = select(5, GetTalentInfo(1, 12));
	elseif unitClassId == CSC_DRUID_CLASS_ID then
		-- Reflection
        spellRank = select(5, GetTalentInfo(3, 6));
	end
	
	local modifier = spellRank * 0.05;

    return modifier;
end

function CSC_GetMP5ModifierFromSetBonus(unit)
	local unitClassId = select(3, UnitClass(unit));
	local modifier = 0;
	
	-- not Druid or Priest
	if unitClassId ~= CSC_DRUID_CLASS_ID and unitClassId ~= CSC_PRIEST_CLASS_ID then
		return modifier;
	end
	
	local firstItemslotIndex = 1;
	local lastItemslotIndex = 18;

	local equippedSetItems = 0;
    for itemSlot = firstItemslotIndex, lastItemslotIndex do
        local itemId = GetInventoryItemID(unit, itemSlot);
		
		if (itemId) then
			if (itemId == g_VestmentsOfTranscendenceIds[itemId] or itemId == g_StormrageRaimentIds[itemId]) then
				equippedSetItems = equippedSetItems + 1;
			end
		end
    end

    if equippedSetItems >= 3 then
        modifier = 0.15;
	end

    return modifier;
end

function CSC_GetShamanT2SpellCrit(unit)
	local spellCritFromSet = 0;
	local firstItemslotIndex = 1;
	local lastItemslotIndex = 18;

	local equippedSetItems = 0;
    for itemSlot = firstItemslotIndex, lastItemslotIndex do
        local itemId = GetInventoryItemID(unit, itemSlot);
		
		if (itemId) then
			if (itemId == g_TheTenStormsIds[itemId]) then
				equippedSetItems = equippedSetItems + 1;
			end
		end
    end

    if equippedSetItems >= 5 then
        spellCritFromSet = 3;
	end

    return spellCritFromSet;
end

function CSC_GetHolyCritFromBenediction(unit)
	local benedictionCrit = 0;
	local itemId = GetInventoryItemID(unit, INVSLOT_MAINHAND);

	if itemId == 18608 then
		benedictionCrit = 2;
	end

	return benedictionCrit;
end


-- OnEnter Tooltip functions
function CSC_CharacterDamageFrame_OnEnter(self)
	-- Main hand weapon
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(self.TooltipMainTxt, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(ATTACK_SPEED_COLON, format("%.2F", self.attackSpeed), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(DAMAGE_COLON, self.damage, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(DAMAGE_PER_SECOND, format("%.1F", self.dps), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(ATTACK_TOOLTIP..":", self.attackRating, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	-- Check for offhand weapon
	if ( self.offhandAttackSpeed ) then
		GameTooltip:AddLine(CSC_SYMBOL_SPACE); -- Blank line.
		GameTooltip:AddLine(INVTYPE_WEAPONOFFHAND, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
		GameTooltip:AddDoubleLine(ATTACK_SPEED_COLON, format("%.2F", self.offhandAttackSpeed), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
		GameTooltip:AddDoubleLine(DAMAGE_COLON, self.offhandDamage, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
		GameTooltip:AddDoubleLine(DAMAGE_PER_SECOND, format("%.1F", self.offhandDps), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	end
	GameTooltip:Show();
end

function CSC_CharacterSpellDamageFrame_OnEnter(self)
	
	self.holyDmg = GetSpellBonusDamage(2);
	self.fireDmg = GetSpellBonusDamage(3);
	self.natureDmg = GetSpellBonusDamage(4);
	self.frostDmg = GetSpellBonusDamage(5);
	self.shadowDmg = GetSpellBonusDamage(6);
	self.arcaneDmg = GetSpellBonusDamage(7);

	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(STAT_SPELLPOWER, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(STAT_SPELLPOWER_TOOLTIP);
	GameTooltip:AddLine(CSC_SYMBOL_SPACE); -- Blank line.
	GameTooltip:AddDoubleLine(SPELL_SCHOOL1_CAP.." "..DAMAGE..": ", format("%.2F", self.holyDmg), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(SPELL_SCHOOL2_CAP.." "..DAMAGE..": ", format("%.2F", self.fireDmg), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(SPELL_SCHOOL4_CAP.." "..DAMAGE..": ", format("%.2F", self.frostDmg), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(SPELL_SCHOOL6_CAP.." "..DAMAGE..": ", format("%.2F", self.arcaneDmg), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(SPELL_SCHOOL5_CAP.." "..DAMAGE..": ", format("%.2F", self.shadowDmg), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(SPELL_SCHOOL3_CAP.." "..DAMAGE..": ", format("%.2F", self.natureDmg), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:Show();
end

function CSC_CharacterSpellCritFrame_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(STAT_CRITICAL_STRIKE, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddLine(CSC_SYMBOL_SPACE); -- Blank line.
	GameTooltip:AddDoubleLine(SPELL_SCHOOL1_CAP.." "..CRIT_ABBR..": ", format("%.2F", self.holyCrit).."%", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(SPELL_SCHOOL2_CAP.." "..CRIT_ABBR..": ", format("%.2F", self.fireCrit).."%", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(SPELL_SCHOOL4_CAP.." "..CRIT_ABBR..": ", format("%.2F", self.frostCrit).."%", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(SPELL_SCHOOL6_CAP.." "..CRIT_ABBR..": ", format("%.2F", self.arcaneCrit).."%", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(SPELL_SCHOOL5_CAP.." "..CRIT_ABBR..": ", format("%.2F", self.shadowCrit).."%", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(SPELL_SCHOOL3_CAP.." "..CRIT_ABBR..": ", format("%.2F", self.natureCrit).."%", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:Show();
end

function CSC_CharacterManaRegenFrame_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(MANA_REGEN_TOOLTIP, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(MANA_REGEN.." (From Gear):", self.mp5FromGear);
	GameTooltip:AddDoubleLine(MANA_REGEN.." (While Casting):", self.mp5Casting);
	GameTooltip:AddDoubleLine(MANA_REGEN.." (While Not Casting):", self.mp5NotCasting);
	GameTooltip:Show();
end

function CSC_CharacterBlock_OnEnter(self)
	
	if UISettingsGlobal.useBlizzardBlockValue then
		self.blockValue = GetShieldBlock();
	else
		self.blockValue = CSC_GetBlockValue("player");
	end
	
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(" ", HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddDoubleLine(BLOCK_CHANCE..": ", self.blockChance);
	GameTooltip:AddDoubleLine(ITEM_MOD_BLOCK_VALUE_SHORT..": ", self.blockValue);
	GameTooltip:Show();
end

function CSC_CharacterHitChanceFrame_OnEnter(self)
	local hitChance = self.hitChance;

	local totalWeaponSkill = CSC_GetPlayerWeaponSkill("player", INVSLOT_MAINHAND);
	local missChanceVsNPC, missChanceVsBoss, missChanceVsPlayer, dwMissChanceVsNpc, dwMissChanceVsBoss, dwMissChanceVsPlayer = CSC_GetPlayerMissChances("player", hitChance, totalWeaponSkill);

	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(STAT_HIT_CHANCE, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddLine("Reduces your chance to miss.");

	GameTooltip:AddLine(CSC_SYMBOL_SPACE); -- Blank line.
	GameTooltip:AddLine("Miss Chance vs.");
	GameTooltip:AddDoubleLine(format(CSC_SYMBOL_TAB.."Level 60 NPC: %.2F%%", missChanceVsNPC), format("(Dual wield: %.2F%%)", dwMissChanceVsNpc));
	GameTooltip:AddDoubleLine(format(CSC_SYMBOL_TAB.."Level 60 Player: %.2F%%", missChanceVsPlayer), format("(Dual wield: %.2F%%)", dwMissChanceVsPlayer));
	GameTooltip:AddDoubleLine(format(CSC_SYMBOL_TAB.."Level 63 NPC/Boss: %.2F%%", missChanceVsBoss), format("(Dual wield: %.2F%%)", dwMissChanceVsBoss));
	GameTooltip:Show();
end

function CSC_CharacterRangedHitChanceFrame_OnEnter(self)
	local hitChance = self.hitChance;

	local totalWeaponSkill = CSC_GetPlayerWeaponSkill("player", INVSLOT_RANGED);
	local missChanceVsNPC, missChanceVsBoss, missChanceVsPlayer, _, _, _ = CSC_GetPlayerMissChances("player", hitChance, totalWeaponSkill);

	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(STAT_HIT_CHANCE, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddLine("Reduces your chance to miss.");

	GameTooltip:AddLine(CSC_SYMBOL_SPACE); -- Blank line.
	GameTooltip:AddLine("Miss Chance vs.");
	GameTooltip:AddLine(format(CSC_SYMBOL_TAB.."Level 60 NPC: %.2F%%", missChanceVsNPC));
	GameTooltip:AddLine(format(CSC_SYMBOL_TAB.."Level 60 Player: %.2F%%", missChanceVsPlayer));
	GameTooltip:AddLine(format(CSC_SYMBOL_TAB.."Level 63 NPC/Boss: %.2F%%", missChanceVsBoss));
	GameTooltip:Show();
end

function CSC_CharacterSpellHitChanceFrame_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(format(CSC_SPELL_HIT_TOOLTIP_TXT, self.hitChance), HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);

	if self.unitClassId == CSC_MAGE_CLASS_ID then
		GameTooltip:AddLine(CSC_SYMBOL_SPACE); -- Blank line.
		GameTooltip:AddLine(CSC_SPELL_HIT_SUBTOOLTIP_TXT);
		GameTooltip:AddDoubleLine(CSC_SYMBOL_TAB..CSC_ARCANE_SPELL_HIT_TXT, (self.arcaneHit + self.hitChance).."%");
		GameTooltip:AddDoubleLine(CSC_SYMBOL_TAB..CSC_FIRE_SPELL_HIT_TXT, (self.fireHit + self.hitChance).."%");
		GameTooltip:AddDoubleLine(CSC_SYMBOL_TAB..CSC_FROST_SPELL_HIT_TXT, (self.frostHit + self.hitChance).."%");
	elseif self.unitClassId == CSC_WARLOCK_CLASS_ID then
		GameTooltip:AddLine(CSC_SYMBOL_SPACE); -- Blank line.
		GameTooltip:AddLine(CSC_SPELL_HIT_SUBTOOLTIP_TXT);
		GameTooltip:AddDoubleLine(CSC_SYMBOL_TAB..CSC_DESTRUCTION_SPELL_HIT_TXT, self.hitChance.."%");
		GameTooltip:AddDoubleLine(CSC_SYMBOL_TAB..CSC_AFFLICTION_SPELL_HIT_TXT, (self.afflictionHit + self.hitChance).."%");
	end
	GameTooltip:Show();
end

function CSC_CharacterMeleeCritFrame_OnEnter(self)
	local hitChance = GetHitModifier();
	local totalWeaponSkill = CSC_GetPlayerWeaponSkill("player", INVSLOT_MAINHAND);
	local missChanceVsNPC, missChanceVsBoss, missChanceVsPlayer, dwMissChanceVsNpc, dwMissChanceVsBoss, dwMissChanceVsPlayer = CSC_GetPlayerMissChances("player", hitChance, totalWeaponSkill);

	-- no weapon equipped, not supported localization or something else went wrong
	if not totalWeaponSkill then totalWeaponSkill = 300 end

	local critSuppression = 4.8;
	local glancingChance = 40;

	local extraWeaponSkill = totalWeaponSkill - 300;
	local bossDefense = 315; -- level 63
	local skillBossDelta = bossDefense - totalWeaponSkill;
	local dodgeChance = 5 + (skillBossDelta * 0.1);	
	local critCap = 100 - missChanceVsBoss - dodgeChance - glancingChance + critSuppression + (extraWeaponSkill * 0.04);

	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(self.criticalStrikeTxt, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	GameTooltip:AddLine(CSC_SYMBOL_SPACE); -- Blank line.
	GameTooltip:AddLine("Crit cap vs.");
	
	local critChance = GetCritChance();
	local CRITCAP_COLOR_CODE = GREEN_FONT_COLOR_CODE;
	if critChance > critCap then CRITCAP_COLOR_CODE = ORANGE_FONT_COLOR_CODE end
	local critCapTxt = CRITCAP_COLOR_CODE..format("%.2F%%", critCap)..FONT_COLOR_CODE_CLOSE;

	local offhandItemId = GetInventoryItemID("player", INVSLOT_OFFHAND);
	if offhandItemId then
		local critCapDw = 100 - dwMissChanceVsBoss - dodgeChance - glancingChance + critSuppression + (extraWeaponSkill * 0.04);
		
		local DWCRITCAP_COLOR_CODE = GREEN_FONT_COLOR_CODE;
		if critChance > critCapDw then DWCRITCAP_COLOR_CODE = ORANGE_FONT_COLOR_CODE end

		local critCapDwTxt = DWCRITCAP_COLOR_CODE..format("%.2F%%", critCapDw)..FONT_COLOR_CODE_CLOSE;
		GameTooltip:AddDoubleLine(CSC_SYMBOL_TAB.."Level 63 NPC/Boss: "..critCapTxt, "(Dual wield: "..critCapDwTxt..")");
	else
		GameTooltip:AddDoubleLine(CSC_SYMBOL_TAB.."Level 63 NPC/Boss: "..critCapTxt);
	end

	GameTooltip:Show();
end
-- OnEnter Tooltip functions END

