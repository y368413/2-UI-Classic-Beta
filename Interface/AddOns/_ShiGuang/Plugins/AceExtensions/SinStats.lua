-------------------------------
-- SinStats HUD v1.03 by Sinba-Pagle
-------------------------------

local function CreateConfig(statsframe)
--------------------------
-- Creating Settings Frame
--------------------------
    local SinStatsConfig = CreateFrame("frame","SinStatsConfigFrame", UIParent)
    SinStatsConfig.StatsFrame = statsframe
------------------------
-- Registering the frame
------------------------
    SinStatsConfig:RegisterEvent("ADDON_LOADED")
    SinStatsConfig:RegisterEvent("PLAYER_LOGOUT")

------------------------
-- Customizing the frame
------------------------
    SinStatsConfig:SetBackdrop({
    bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
    tile=1, tileSize=0, edgeSize=0,
 
    })
    SinStatsConfig:SetBackdropBorderColor(0.5,0.5,0.5)
    SinStatsConfig:SetBackdropColor(1,1,1,1)
    SinStatsConfig:SetWidth(500)
    SinStatsConfig:SetHeight(575)
    SinStatsConfig:Hide()
    SinStatsConfig:SetPoint("CENTER",UIParent)
    SinStatsConfig:EnableMouse(true)
    SinStatsConfig:SetMovable(true)
    SinStatsConfig:RegisterForDrag("LeftButton")
    SinStatsConfig:SetScript("OnDragStart", function(self) self:StartMoving() end)
    SinStatsConfig:SetScript("OnDragStart", function(self) self:StartMoving() end)
    SinStatsConfig:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    SinStatsConfig:SetFrameStrata("FULLSCREEN_DIALOG")

    local slider = CreateFrame("Slider","SinStatsSlider",SinStatsConfig,'OptionsSliderTemplate') 
    slider:SetPoint("BOTTOM",0,40,"RIGHT")
    getglobal(slider:GetName() .. 'Low'):SetText('9');	
    getglobal(slider:GetName() .. 'High'):SetText('20');	
    getglobal(slider:GetName() .. 'Text'):SetText('字体大小');
    slider:SetMinMaxValues(9, 20)
	slider:SetValueStep(1)
	slider.slideTitle = SinStatsConfig:CreateFontString(nil, "OVERLAY");
    slider.slideTitle:SetFontObject("GameFontHighlightSmall");
    slider.slideTitle:SetPoint("BOTTOM", SinStatsConfig, 0, 25);
    slider:SetScript("OnValueChanged", function (self)
	local value = math.floor(self:GetValue())
	ShiGuangDB.StatFontSize  = value
	SinStatsFrame:RestiseStats()
	slider.slideTitle:SetText("Current: " .. ShiGuangDB.StatFontSize )
	end)
    slider:SetValue(ShiGuangDB.StatFontSize)
	
------------------------------------------
-- Text for Option Title
------------------------------------------
    SinStatsConfig.SinTitle = SinStatsConfig:CreateFontString(nil, "OVERLAY");
    SinStatsConfig.SinTitle:SetFontObject("GameFontHighlightLarge");
    SinStatsConfig.SinTitle:SetPoint("TOP", SinStatsConfig, "TOP", 0, -3);
    SinStatsConfig.SinTitle:SetText("|cff00c0ffSinStats HUD Settings|r");
 
------------------------------------------
-- Text for checkbox options - Melee Stats
------------------------------------------
    SinStatsConfig.MeleeStats = SinStatsConfig:CreateFontString(nil, "OVERLAY");
    SinStatsConfig.MeleeStats:SetFontObject("GameFontHighlightLarge");
    SinStatsConfig.MeleeStats:SetPoint("TOP", SinStatsConfig, "TOP", 0, -32);
    SinStatsConfig.MeleeStats:SetText("|cfff39c33Melee and Defense Stats|r");
 
------------------------------------------
-- Text for checkbox options - Ranged Stats
------------------------------------------
    SinStatsConfig.RangedStats = SinStatsConfig:CreateFontString(nil, "OVERLAY");
    SinStatsConfig.RangedStats:SetFontObject("GameFontHighlightLarge");
    SinStatsConfig.RangedStats:SetPoint("TOP", SinStatsConfig, "TOP", 0, -160);
    SinStatsConfig.RangedStats:SetText("|cfff39c33Ranged Stats|r");
 
------------------------------------------
-- Text for checkbox options - Spell Stats
------------------------------------------
    SinStatsConfig.SpellStats = SinStatsConfig:CreateFontString(nil, "OVERLAY");
    SinStatsConfig.SpellStats:SetFontObject("GameFontHighlightLarge");
    SinStatsConfig.SpellStats:SetPoint("CENTER", SinStatsConfig, "CENTER", -8, 37);
    SinStatsConfig.SpellStats:SetText("|cfff39c33Spell Stats|r");
 
------------------------------------------
-- Text for checkbox options - Other Stats
------------------------------------------
    SinStatsConfig.SpellStats = SinStatsConfig:CreateFontString(nil, "OVERLAY");
    SinStatsConfig.SpellStats:SetFontObject("GameFontHighlightLarge");
    SinStatsConfig.SpellStats:SetPoint("CENTER", SinStatsConfig, "CENTER", -8, -125);
    SinStatsConfig.SpellStats:SetText("|cfff39c33Other Stats|r");
 
-------------------------
-- Text for HUD Options
-------------------------
    SinStatsConfig.locksection = SinStatsConfig:CreateFontString(nil, "OVERLAY");
    SinStatsConfig.locksection:SetFontObject("GameFontHighlightLarge");
    SinStatsConfig.locksection:SetPoint("CENTER", SinStatsConfig, "CENTER", 0, -200);
    SinStatsConfig.locksection:SetText("|cfff39c33HUD Options|r");
 
------------
-- Signature
------------
    SinStatsConfig.SigSection = SinStatsConfig:CreateFontString(nil, "OVERLAY");
    SinStatsConfig.SigSection:SetFontObject("GameFontHighlightSmall");
    SinStatsConfig.SigSection:SetPoint("BOTTOMLEFT", 5, 1);
    SinStatsConfig.SigSection:SetText("|cff00c0ffby Sinba-Pagle");
 
--------------------------------
-- Frame Options - Hide and Lock
--------------------------------
    SinStatsConfig.SinClose = CreateFrame('Button', 'SinClose', SinStatsConfig, "UIPanelButtonTemplate")
    SinStatsConfig.SinClose:SetPoint('BOTTOMRIGHT', -8,6)
    SinStatsConfig.SinClose:SetSize(80, 20)
    SinStatsConfig.SinClose:SetText("Save")
    SinStatsConfig.SinClose:SetScript('OnClick', function(self)
        self:GetParent():Hide()
    end)
 
    SinStatsConfig.SinXButton = CreateFrame('Button', 'SinXButton', SinStatsConfig, "UIPanelButtonTemplate")
    SinStatsConfig.SinXButton:SetPoint('TOPRIGHT', -5,0)
    SinStatsConfig.SinXButton:SetSize(15, 13)
    SinStatsConfig.SinXButton:SetText("X")
    SinStatsConfig.SinXButton:SetScript('OnClick', function(self)
        self:GetParent():Hide()
    end)
 
    SinStatsConfig.LockFr = SinStatsConfig:CreateFontString(nil, "OVERLAY");
    SinStatsConfig.LockFr:SetFontObject("GameFontHighlight");
    SinStatsConfig.LockFr:SetPoint("BOTTOM", SinStatsConfig, 162, 43);
    local ChkBoxVar
        SinStatsConfig.SinLockFrame = CreateFrame("CheckButton", "$parentSinLockFrame", SinStatsConfig, "ChatConfigCheckButtonTemplate")
ChkBoxVar = SinStatsConfig.SinLockFrame
ChkBoxVar:SetPoint('BOTTOM', 120,37)
ChkBoxVar.tooltip = "Lock the Stats Frame"
ChkBoxVar:SetScript('OnClick', function(self)
        local SinStats = self:GetParent().StatsFrame
        ShiGuangDB.SinLockVar = self:GetChecked()
        SinStatsConfig.LockFr:SetText(ShiGuangDB.SinLockVar and "已锁定" or "锁定")        
        local parent = self:GetParent()
        if ShiGuangDB.SinLockVar == true then
		SinStats:SetUserPlaced(true)
		SinStats:SetMovable(true);
		SinStats:EnableMouse(false);		
		SinStats:SetUserPlaced(true)		
		SinStats:SetBackdropColor(1,1,1,0)
        elseif ShiGuangDB.SinHideVar == true and not ShiGuangDB.SinLockVar then
		SinStats:SetMovable(true);
		SinStats:EnableMouse(true);
		SinStats:SetUserPlaced(true);
		SinStats:SetBackdropColor(1,1,1,0)
        elseif not ShiGuangDB.SinLockVar then
		SinStats:SetMovable(true);
		SinStats:EnableMouse(true);
		SinStats:SetUserPlaced(true);		
		SinStats:SetBackdropColor(1,1,1,1)
        end
        end)
    ChkBoxVar:SetChecked(ShiGuangDB.SinLockVar)
    ChkBoxVar:GetScript('OnClick')(ChkBoxVar)
 
SinStatsConfig.HideFr = SinStatsConfig:CreateFontString(nil, "OVERLAY");
SinStatsConfig.HideFr:SetFontObject("GameFontHighlight");
SinStatsConfig.HideFr:SetPoint("BOTTOM", SinStatsConfig, -140, 43);
    local HideBoxVar
    SinStatsConfig.SinHideFrame = CreateFrame("CheckButton", "$parentSinStatsHide", SinStatsConfig, "ChatConfigCheckButtonTemplate")
    HideBoxVar = SinStatsConfig.SinHideFrame
    HideBoxVar:SetPoint('BOTTOM', -174,37)
    HideBoxVar.tooltip = "Disable the Stats Frame"
    HideBoxVar:SetScript('OnClick', function(self)
        local Parent = self:GetParent()
        local SinStats = Parent.StatsFrame
        -- local SinStatsMove = SinStats.MoveFrame
        ShiGuangDB.SinHideVar = self:GetChecked()
        Parent.HideFr:SetText(ShiGuangDB.SinHideVar and "Show" or "隐藏")
        if ShiGuangDB.SinHideVar then
            SinStats:Hide()
            -- SinStatsMove:SetMovable(false);
            -- SinStatsMove:EnableMouse(false);
            -- SinStatsMove:Hide()
        elseif not ShiGuangDB.SinHideVar and not ShiGuangDB.SinLockVar then
            SinStats:Show()
            -- SinStatsMove:Show()
        else
            SinStats:Show()
        end
    end)
    HideBoxVar:SetChecked(ShiGuangDB.SinHideVar)
    HideBoxVar:GetScript('OnClick')(HideBoxVar)
	
local SinSlider

 
-----------------------------------------------------
-- Factory functions for creating check boxes
-----------------------------------------------------
 
    local function UpdateSetting(self)
        local Parent = self:GetParent()
        local StatsFrame = Parent.StatsFrame
        ShiGuangDB.Stats[self.ID] = self:GetChecked()
        StatsFrame[self.ID]:SetShown(self:GetChecked())
        StatsFrame:redrawStats()
    end
 
    local function CreateCheckBox(parent, id, label)
        local f = CreateFrame("CheckButton", "$parent"..id, parent, "ChatConfigCheckButtonTemplate")
        f.Label = f:CreateFontString(nil, "OVERLAY");
        f.Label:SetFontObject("GameFontHighlight");
        f.Label:SetPoint("LEFT", f, "RIGHT", 5, 0);
        f.Label:SetText(label)
        f.ID = id
        f:SetScript("OnClick", UpdateSetting)
        f:SetChecked(ShiGuangDB.Stats[id])
        parent.StatsFrame[id]:SetShown(ShiGuangDB.Stats[id])
        return f
    end
----------------------------
-- Melee Attack Power Option
----------------------------
    SinStatsConfig.AP = CreateCheckBox(SinStatsConfig, "AP", "近战攻击强度")
    SinStatsConfig.AP:SetPoint('TOPLEFT', 5,-62)
 
-------------------------
-- Critical Strike Option
-------------------------
    SinStatsConfig.Crit = CreateCheckBox(SinStatsConfig, "Crit", "近战暴击")
    SinStatsConfig.Crit:SetPoint('TOPLEFT', 5,-85)
   
--------------------
-- Hit Chance Option
--------------------
    SinStatsConfig.Hit = CreateCheckBox(SinStatsConfig, "Hit", "近战命中")
    SinStatsConfig.Hit:SetPoint('TOP', -40,-62)
 
----------------
-- Damage Option
----------------
    SinStatsConfig.DMG = CreateCheckBox(SinStatsConfig, "DMG", "近战伤害")
    SinStatsConfig.DMG:SetPoint('TOP', -40,-85)
 
----------------
-- Armor Option
----------------
    SinStatsConfig.Armor = CreateCheckBox(SinStatsConfig, "Armor", "护甲值")
    SinStatsConfig.Armor:SetPoint('TOPRIGHT', -110,-62)
 
-----------------
-- Defense Option
-----------------
    SinStatsConfig.Defense = CreateCheckBox(SinStatsConfig, "Defense", "防御等级")
    SinStatsConfig.Defense:SetPoint('TOPRIGHT', -110,-85)
 
---------------
-- Dodge Option
---------------
    SinStatsConfig.Dodge = CreateCheckBox(SinStatsConfig, "Dodge", "闪避")
    SinStatsConfig.Dodge:SetPoint('TOPLEFT', 5,-110)
 
----------------
-- Parry Option
----------------
    SinStatsConfig.Parry = CreateCheckBox(SinStatsConfig, "Parry", "招架")
    SinStatsConfig.Parry:SetPoint('TOP', -40,-110)
 
----------------
-- Block Option
----------------
    SinStatsConfig.Block = CreateCheckBox(SinStatsConfig, "Block", "格挡")
    SinStatsConfig.Block:SetPoint('TOPRIGHT', -110,-108)

--------------------------------
-- Ranged Attack Power Option
--------------------------------
    SinStatsConfig.RAP = CreateCheckBox(SinStatsConfig, "RAP", "远程攻击强度")
    SinStatsConfig.RAP:SetPoint('CENTER', SinStatsConfig, 'LEFT',18,85)
	
-----------------------
-- Ranged Damage Option
-----------------------
    SinStatsConfig.RDMG = CreateCheckBox(SinStatsConfig, "RDMG", "远程伤害")
    SinStatsConfig.RDMG:SetPoint('CENTER', SinStatsConfig, 'LEFT',18,60)

--------------------
-- Ranged Hit Option
--------------------
    SinStatsConfig.RangedHit = CreateCheckBox(SinStatsConfig, "RangedHit", "远程命中")
    SinStatsConfig.RangedHit:SetPoint('CENTER', SinStatsConfig, 'CENTER', -48,85)
	
--------------------------------
-- Ranged Critical Strike Option
--------------------------------
    SinStatsConfig.RangedCrit = CreateCheckBox(SinStatsConfig, "RangedCrit", "远程暴击")
	SinStatsConfig.RangedCrit:SetPoint('CENTER', SinStatsConfig, 'RIGHT', -157,85)
 
-------------------------------
-- Spell Critical Strike Option
-------------------------------
    SinStatsConfig.SpellCrit = CreateCheckBox(SinStatsConfig, "SpellCrit", "法术暴击")
    SinStatsConfig.SpellCrit:SetPoint('LEFT', 6,1)
 
-------------------
-- Spell Hit Option
-------------------
    SinStatsConfig.SpellHit = CreateCheckBox(SinStatsConfig, "SpellHit", "法术命中")
    SinStatsConfig.SpellHit:SetPoint('CENTER', -46,2)
 
-----------------------
-- Healing Spell Option
-----------------------
    SinStatsConfig.Healing = CreateCheckBox(SinStatsConfig, "Healing", "治疗效果")
    SinStatsConfig.Healing:SetPoint('CENTER', SinStatsConfig, "RIGHT", -119,1)
	
--------------------
-- Mana Regen Option
--------------------
    SinStatsConfig.ManaRegen = CreateCheckBox(SinStatsConfig, "ManaRegen", "回蓝")
    SinStatsConfig.ManaRegen:SetPoint('CENTER', SinStatsConfig, "LEFT", 18,-82)

-------------
-- MP5 Option
-------------
    SinStatsConfig.MP5Cast = CreateCheckBox(SinStatsConfig, "MP5Cast", "5回加成")
    SinStatsConfig.MP5Cast:SetPoint('CENTER', SinStatsConfig, -46,-83)
	
--------------------
-- Holy Spell Option
--------------------
    SinStatsConfig.Holy = CreateCheckBox(SinStatsConfig, "Holy", "神圣伤害")
    SinStatsConfig.Holy:SetPoint('CENTER', SinStatsConfig, "LEFT", 18,-26)
 
----------------------
-- Arcane Spell Option
----------------------
    SinStatsConfig.Arcane = CreateCheckBox(SinStatsConfig, "Arcane", "奥数伤害")
    SinStatsConfig.Arcane:SetPoint('CENTER', -46,-28)
 
-----------------------
-- Fire Spell Option
-----------------------
    SinStatsConfig.Fire = CreateCheckBox(SinStatsConfig, "Fire", "火焰伤害")
    SinStatsConfig.Fire:SetPoint('CENTER', SinStatsConfig, "RIGHT", -119,-28)
 
--------------------
-- Nature Spell Option
--------------------
    SinStatsConfig.Nature = CreateCheckBox(SinStatsConfig, "Nature", "自然伤害")
    SinStatsConfig.Nature:SetPoint('CENTER', SinStatsConfig, "LEFT", 18,-53)
 
----------------------
-- Frost Spell Option
----------------------
    SinStatsConfig.Frost = CreateCheckBox(SinStatsConfig, "Frost", "冰霜伤害")
    SinStatsConfig.Frost:SetPoint('CENTER', -46,-55)
 
-----------------------
-- Shadow Spell Option
-----------------------
    SinStatsConfig.Shadow = CreateCheckBox(SinStatsConfig, "Shadow", "暗影伤害")
    SinStatsConfig.Shadow:SetPoint('CENTER', SinStatsConfig, "RIGHT", -119,-55)
 
------------------------
-- Movement Speed Option
------------------------
    SinStatsConfig.Speed = CreateCheckBox(SinStatsConfig, "Speed", "移动速度")
    SinStatsConfig.Speed:SetPoint('CENTER', SinStatsConfig, "LEFT", 95,-155)
 
--------------------
-- Durability Option
--------------------
    SinStatsConfig.Durability = CreateCheckBox(SinStatsConfig, "Durability", "耐久度")
    SinStatsConfig.Durability:SetPoint('CENTER', SinStatsConfig, "LEFT", 265,-155)
end 
---------------------------
-- Creating the Stats Frame
---------------------------
local f
local SinStats = CreateFrame("frame", "SinStatsFrame", UIParent)
 
------------------------------
-- Registering the Stats Frame
------------------------------
SinStats:RegisterEvent("PLAYER_LOGIN")
SinStats:RegisterEvent("UNIT_STATS", "player")
SinStats:RegisterUnitEvent("UNIT_AURA", "player")
 
------------------------
-- Customizing the frame
------------------------
SinStats:SetBackdrop({
    bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
    tile=1, tileSize=0, edgeSize=0,
})
SinStats:SetBackdropColor(1,1,1,1)
SinStats:SetWidth(200)
SinStats:SetHeight(15)
SinStats:SetPoint("CENTER",UIParent)
SinStats:EnableMouse(false)
SinStats:SetMovable(true)
SinStats:SetUserPlaced(true) 
SinStats:RegisterForDrag("LeftButton")
SinStats:SetScript("OnDragStart", function(self) self:StartMoving() end)
SinStats:SetScript("OnDragStart", function(self) self:StartMoving() end)
SinStats:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
SinStats:SetFrameStrata("BACKGROUND")

---------------------------------------
-- Creating stats text inside the frame
---------------------------------------
local function SetFont(self)
    self:SetFont(STANDARD_TEXT_FONT, ShiGuangDB.StatFontSize, "OUTLINE")
end
 
function SinStats:RestiseStats()
    for i=1, #self.Texts do
        SetFont(self.Texts[i])
        end
end
local function CreateStatStrings(self)
local DisplayOrder = {
            "AP",
            "RAP",
            "DMG",
			"RDMG",
            "Crit",		
            "RangedCrit",
            "SpellCrit",
            "Hit",
            "RangedHit",
            "SpellHit",	
			"ManaRegen",
			"MP5Cast",			
            "Healing",
            "Holy",
            "Arcane",
            "Fire",
            "Nature",
            "Frost",
            "Shadow",
            "Armor",
            "Defense",
            "Dodge",
            "Parry",
            "Block",
            "Speed",
            "Durability",
}
    local function CreateText(parent, name)
        local f = parent:CreateFontString("$parent"..name, "OVERLAY", "GameFontNormal")
		f:SetFont("Fonts\\ARIALN.ttf", ShiGuangDB.StatFontSize, "OUTLINE")
        f:SetTextColor(1,1,1,1)
        tinsert(parent.Texts, f)
        f.ID = #parent.Texts
        return f
    end
    self.Texts = {}
    for i=1, #DisplayOrder do
        if ShiGuangDB.Stats[DisplayOrder[i]] == nil then
            print("|cffff0000SinsStats:|r Missing Saved Variable:|cff00ff00", DisplayOrder[i])
        end
        self[DisplayOrder[i]] = CreateText(self, DisplayOrder[i])
    end
end

-------------------------------
-- Executing the stats OnUpdate
-------------------------------
local updatespeed = 0.125
local TimeToNextUpdate = updatespeed
SinStats:SetScript("OnUpdate", function (self, elapsed)
    TimeToNextUpdate = TimeToNextUpdate - elapsed
    if TimeToNextUpdate > 1 then return end
    TimeToNextUpdate = updatespeed
	
    local base, posBuff, negBuff = UnitAttackPower("player");
    local effectiveAP = base + posBuff + negBuff;
    self.AP:SetText("攻击强度: " .. effectiveAP);
 
    local critChance = GetCritChance("player");
    self.Crit:SetText("暴击: " .. ("%.2f"):format(critChance) .. "%");
 
    local critRangedChance = GetRangedCritChance("player");
    self.RangedCrit:SetText("远程暴击: " .. ("%.2f"):format(critRangedChance) .. "%");
 
    local critSpellChance = GetSpellCritChance("player");
    self.SpellCrit:SetText("法术暴击: " .. ("%.2f"):format(critSpellChance) .. "%");
 
    local hitChance = GetHitModifier("player");
    self.Hit:SetText("命中: " .. hitChance .. "%");
 
    local label, hitRangedChance, percentAdded = "（远程）命中: ", nil, ""
    local slotId = GetInventorySlotInfo("RangedSlot")
    local link = GetInventoryItemLink("player", slotId)
    if link then
        hitRangedChance = GetHitModifier("player");
            local itemId, enchantId = link:match("item:(%d+):(%d+)")
            if enchantId then 
                enchantId = tonumber(enchantId)
                if enchantId == 2523 then
                    hitRangedChance = hitRangedChance + 3
                    -- percentAdded = percentAdded .. " |cff00ff00+3% Scope"
                end
            end
    end
    self.RangedHit:SetText(label .. (hitRangedChance and hitRangedChance or "not equiped") .. "%");  
 
    local hitSpellChance = GetSpellHitModifier("player");
    self.SpellHit:SetText("法术命中: " .. hitSpellChance .. "%");      
 
    local lowDmg, hiDmg, offlowDmg, offhiDmg, posBuff, negBuff, percentmod = UnitDamage("player");
    local dmgeffect = hiDmg;
    self.DMG:SetText("近战伤害: " .. ("%.0f"):format(dmgeffect));
	
	local speed, lowDmg, hiDmg, posBuff, negBuff, percent = UnitRangedDamage("player");
    local Rdmgeffect = hiDmg;
    self.RDMG:SetText("远程伤害: " .. ("%.0f"):format(Rdmgeffect));
 
    local SinHealSpell = GetSpellBonusHealing();
    self.Healing:SetText("治疗效果: +" .. SinHealSpell);
 
    local SinHolySpell = GetSpellBonusDamage(2);
    self.Holy:SetText("神圣伤害: +" .. SinHolySpell);    

	local SinFireSpell = GetSpellBonusDamage(3);
    self.Fire:SetText("火焰伤害: +" .. SinFireSpell);  

    local SinNatureSpell = GetSpellBonusDamage(4);
    self.Nature:SetText("自然伤害: +" .. SinNatureSpell);  
	
    local SinFrostSpell = GetSpellBonusDamage(5);
    self.Frost:SetText("冰霜伤害: +" .. SinFrostSpell); 

    local SinShadowSpell = GetSpellBonusDamage(6);
    self.Shadow:SetText("暗影伤害: +" .. SinShadowSpell);	
	
    local SinArcaneSpell = GetSpellBonusDamage(7);
    self.Arcane:SetText("奥术伤害: +" .. SinArcaneSpell);      
 
    local base, effectiveArmor, armor, posBuff, negBuff = UnitArmor("player");
    self.Armor:SetText("护甲值: " .. effectiveArmor);
 
    local currentSpeed, runSpeed, flightSpeed, swimSpeed = GetUnitSpeed("player")
    self.Speed:SetText(string.format("移动速度: %d%%", GetUnitSpeed("player") / 7 * 100));
 
    local baseDefense, armorDefense = UnitDefense("player");
    local totalDef = baseDefense + armorDefense
    self.Defense:SetText("防御等级: " .. totalDef)
 
    local dodgeChance = GetDodgeChance("player");
    self.Dodge:SetText("闪避: " .. ("%.2f"):format(dodgeChance) .. "%");
 
    local parryChance = GetParryChance("player");
    self.Parry:SetText("招架: " .. ("%.2f"):format(parryChance) .. "%");
 
    local blockChance = GetBlockChance("player");
    self.Block:SetText("格挡: " .. ("%.2f"):format(blockChance) .. "%");
 
    local base, posBuff, negBuff = UnitRangedAttackPower("player");
    local effectiveRanged = base + posBuff + negBuff;
    self.RAP:SetText("远程攻强: " .. effectiveRanged);

    local MP5Modifier = 0
    local mp5 = 0
    for i=1,18 do
        local itemLink = GetInventoryItemLink("player", i)
            if itemLink then
                local stats = GetItemStats(itemLink)
            if stats then
                local statMP5 = stats["ITEM_MOD_POWER_REGEN0_SHORT"]
            if (statMP5) then
                mp5 = mp5 + statMP5 + 1
            end
            end
            end
    end
    MP5Modifier = mp5
    local   MP5Stat = mp5
    self.MP5Cast:SetText("5回加成: " .. format("%.0f", MP5Stat))
   
    local base, casting = GetManaRegen()
    local effectiveMR = MP5Modifier * 0.4
    self.ManaRegen:SetText("回蓝: " .. format("%.2f", (base * 2) + effectiveMR))

    local Durability, Current, Full, Percent
    local LowestCurrent, LowestFull, t1, t2, t3 = 500, 0, 0, 0, 100
    for i=1,19 do
        Current, Full = GetInventoryItemDurability(i)
        if Current and Full then
            Percent = floor(100*Current/Full + 0.5)
            if (Percent < t3) then
                t3 = Percent
            end
            if (Current < LowestCurrent) then
                LowestCurrent = Current
                LowestFull = Full
            end
            t1 = t1 + Current
            t2 = t2 + Full
        end
    end
	
    if t2 == 0 then
        Durability = "N/A"
    else
        Durability = floor(t1 * 100 / t2)
    end
    local Text = ""
    if type(Durability) == "number" then
        if Durability > 50 then
            Text = string.format("|cff%2xff00", ((Durability > 50) and (255 - 2.55*Durability) or (2.55*Durability)), Durability) .. Text
        else
            Text = string.format("|cffff%2x00", (2.55*Durability), Durability) .. Text
        end
        Text = Text..Durability.."%"
    end
    local Text = "耐久度: " .. Text
    self.Durability:SetText(Text)
end)
 
-------------------------------
-- Redrawing stats on the frame
-------------------------------
 
function SinStats:redrawStats()
    local first, last
    for i=1, #self.Texts do
        if self.Texts[i]:IsShown() then
            self.Texts[i]:ClearAllPoints()
            if not first then
                self.Texts[i]:SetPoint("TOPLEFT")
                first = true
            else
                self.Texts[i]:SetPoint("TOPLEFT", last, "BOTTOMLEFT")
            end
            last = self.Texts[i]
        end
    end
end
 
SinStats:SetScript("OnEvent", function (self, event, ...)
    if event == "PLAYER_LOGIN" then
        --if not ShiGuangDB then
        --ShiGuangDB = { 
            if ShiGuangDB.SinLockVar == nil then ShiGuangDB.SinLockVar = true end
            if ShiGuangDB.SinHideVar == nil then ShiGuangDB.SinHideVar = false end
            if ShiGuangDB.Stats == nil then ShiGuangDB.Stats = {
                        AP = false,
                        Crit = false,
                        RangedCrit = false,
                        SpellCrit = false,
                        Hit = false,
                        RangedHit = false,
                        SpellHit = false,
                        DMG = false,
						RDMG = false,
                        Healing = false,
						ManaRegen = false,
						MP5Cast = false,
                        Holy = false,
                        Arcane = false,
                        Fire = false,
                        Nature = false,
                        Frost = false,
                        Shadow = false,
                        Armor = false,
                        Defense = false,
                        Dodge = false,
                        Parry = false,
                        Block = false,
                        Speed = false,
						RAP = false,
						Durability = false,
                    } end
                --}
            --end
			if ShiGuangDB.StatFontSize == nil  then ShiGuangDB.StatFontSize  = 12 end
        CreateStatStrings(self)
        CreateConfig(self)
	end
    self:redrawStats()
end)  
-------------------------------------------
-- Slash command to open the Settings frame
-------------------------------------------
SLASH_SINSTATS1 = "/sinstats"
function SlashCmdList.SINSTATS()
  if (SinStatsConfigFrame:IsVisible()) then
      HideUIPanel(SinStatsConfigFrame);
  else
      ShowUIPanel(SinStatsConfigFrame);
  end
end