--## Version: 1.0.5  ## Author: LODWise
local addon = CreateFrame('Button', 'MudmenItemColor');
local defaultSlotWidth, defaultSlotHeight = 68, 68;

-- here we add on new color for quest items in the quality color ref array
LE_ITEM_QUALITY_QUEST = #BAG_ITEM_QUALITY_COLORS + 12;
LE_ITEM_QUALITY_POOR = 0;
LE_ITEM_QUALITY_COMMON = 1;
LE_ITEM_QUALITY_EPIC = #BAG_ITEM_QUALITY_COLORS + 14;
LE_ITEM_QUALITY_LEGENDARY = #BAG_ITEM_QUALITY_COLORS + 13;
LE_ITEM_QUALITY_ARROW = #BAG_ITEM_QUALITY_COLORS + 2;
LE_ITEM_QUALITY_RECIPE = #BAG_ITEM_QUALITY_COLORS + 3;
LE_ITEM_QUALITY_TRASH = #BAG_ITEM_QUALITY_COLORS + 4;
LE_ITEM_QUALITY_CONSUMABLE = #BAG_ITEM_QUALITY_COLORS + 5;
LE_ITEM_QUALITY_CRAFT = #BAG_ITEM_QUALITY_COLORS + 6;
LE_ITEM_QUALITY_HEARTH = #BAG_ITEM_QUALITY_COLORS + 7;
LE_ITEM_QUALITY_BAG = #BAG_ITEM_QUALITY_COLORS + 8;
LE_ITEM_QUALITY_CONJURED = #BAG_ITEM_QUALITY_COLORS + 9;
LE_ITEM_QUALITY_CONSUMABLE2 = #BAG_ITEM_QUALITY_COLORS + 10;
LE_ITEM_QUALITY_TOOL = #BAG_ITEM_QUALITY_COLORS + 11;

BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_POOR] = {r=0.505, g=0.509, b=0.533}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_COMMON] = {r=1, g=1, b=1}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_EPIC] = {r=0.607, g=0.188, b=0.992}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_LEGENDARY] = {r=1, g=0.584, b=0.058}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_QUEST] = {r=0.933, g=0.066, b=0.525}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_ARROW] = {r=.011, g=0, b=0.980}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_RECIPE] = {r=0.752, g=0.541, b=0.086}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_TRASH] = {r=153, g=51, b=0}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_CONSUMABLE] = {r=5, g=.40, b=.20}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_CRAFT] = {r=0.278, g=1, b=0.905}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_HEARTH] = {r=500, g=.10, b=.10}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_BAG] = {r=0.360, g=1, b=0.482}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_CONJURED] = {r=0.78, g=.61, b=0.43}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_CONSUMABLE2] = {r=0.125, g=0.411, b=0.309}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_TOOL] = {r=0.713, g=0.262, b=0.372}

mmDefaultConfig = {
    ['bags'] = 1,
    ['bank'] = 1,
    ['char'] = 1,
    ['inspect'] = 1,
    ['merchant'] = 1,
    ['intensity'] = 1,
}

addon:RegisterEvent('ADDON_LOADED');
addon:RegisterEvent('INSPECT_READY');
addon:RegisterEvent('BAG_UPDATE');
addon:RegisterEvent('BANKFRAME_OPENED');
addon:RegisterEvent('PLAYERBANKSLOTS_CHANGED');
addon:SetScript('OnEvent', function(self, event, arg1) self[event](self, arg1) end);


function addon:ADDON_LOADED(arg1)
    if (arg1 == '_ShiGuang') then
        
        hooksecurefunc('ToggleCharacter', function() addon:characterFrame_OnToggle() end);
        hooksecurefunc('ToggleBackpack', function() addon:backpack_OnShow() end);
        hooksecurefunc('ToggleBag', function(id) addon:bag_OnToggle(id) end);
        hooksecurefunc('MerchantFrame_UpdateMerchantInfo', function() addon:merchant_OnUpdate() end);
        hooksecurefunc('MerchantFrame_UpdateBuybackInfo', function() addon:buyback_OnUpdate() end);
    end
	
	if(arg1 == 'Blizzard_TradeSkillUI') then
        hooksecurefunc('TradeSkillFrame_SetSelection', function(id) addon:tradeskill_OnUpdate(id) end);
    end
end


---
-- character frame events
function addon:characterFrame_OnToggle()
    if (CharacterFrame:IsShown()) then
        addon:characterFrame_OnShow();
    else    
        addon:characterFrame_OnHide();
    end
end

function addon:characterFrame_OnShow()
    addon:RegisterEvent("UNIT_INVENTORY_CHANGED");
    addon:charFrame_UpdateBorders('player', 'Character', 1);
end

function addon:characterFrame_OnHide()
	addon:UnregisterEvent("UNIT_INVENTORY_CHANGED")
end

---
-- update player inventory
function addon:UNIT_INVENTORY_CHANGED()
    addon:charFrame_UpdateBorders('player', 'Character', 1);
end

---
-- bag update event
function addon:BAG_UPDATE(arg1)
    addon:refreshBag(arg1);
end

---
-- inspect frame event
function addon:INSPECT_READY()
    addon:charFrame_UpdateBorders('target', 'Inspect',  1);
end

---
-- bank frame opened
function addon:BANKFRAME_OPENED()
    addon:bankbags_UpdateBorders();
end

---
-- bank slots updated
function addon:PLAYERBANKSLOTS_CHANGED()
    addon:bankbags_UpdateBorders();
end

---
-- backpack opened
function addon:backpack_OnShow()
    local containerFrame = _G['ContainerFrame1'];

    if (containerFrame.allBags == true) then
        addon:refreshAllBags()
    end
end

function addon:refreshAllBags()
    for bagId = 0, NUM_BAG_SLOTS do
        OpenBag(bagId);
        addon:refreshBag(bagId);
    end
end

---
-- open/close a bag
function addon:bag_OnToggle(bagId)
    addon:refreshBag(bagId);
end

---
-- refresh a single bag content
function addon:refreshBag(bagId)
    local frameId = IsBagOpen(bagId);

    if (frameId) then
        local nbSlots = GetContainerNumSlots(bagId);

        for slot = 1, nbSlots do
            slotFrameId = nbSlots + 1 - slot;
            local slotFrameName = 'ContainerFrame' .. frameId .. 'Item' .. slotFrameId;
            addon:updateContainerSlot(bagId, slot, slotFrameName, 1);
        end
    end
end

---
-- update bank bag borders
function addon:bankbags_UpdateBorders()
    local container = BANK_CONTAINER;

    for slot = 1, GetContainerNumSlots(container) do
        addon:updateContainerSlot(container, slot, 'BankFrameItem' .. slot, 1);
    end
end

---
-- update border for a container' slot (bank and bag slots)
function addon:updateContainerSlot(containerId, slotId, slotFrameName, show)
    local show = show or 1;

    item = _G[slotFrameName];

    if (not item.qborder) then
        item.qborder = addon:createBorder(slotFrameName, item, defaultSlotWidth, defaultSlotHeight);
    end

    local itemId = GetContainerItemID(containerId, slotId);

    if (itemId and show == 1) then
        local quality = GetItemQuality(itemId);

        -- green or better item, or quest item
        if (LE_ITEM_QUALITY_POOR) then 
            local r, g, b = GetQualityColor(quality);
            item.qborder:SetVertexColor(r, g, b);
            item.qborder:SetAlpha(1);
            item.qborder:Show();
        else
            item.qborder:Hide();
        end
    else
        item.qborder:Hide();
    end
end

local CharacterFrameSlotTypes = {
    'Head',
    'Neck',
    'Shoulder',
    'Back',
    'Chest',
    'Shirt',
    'Tabard',
    'Wrist',
    'Hands',
    'Waist',
    'Legs',
    'Feet',
    'Finger0',
    'Finger1',
    'Trinket0',
    'Trinket1',
    'MainHand',
    'SecondaryHand',
    'Ranged',
    'Ammo',
};

---
-- Update characters frame item border
function addon:charFrame_UpdateBorders(unit, frameType, show)
    local show = show or 1;

    for _, charSlot in ipairs(CharacterFrameSlotTypes) do
        local id, _ = GetInventorySlotInfo(charSlot .. 'Slot');
        local quality = GetInventoryItemQuality(unit, id);

        local slotName = frameType .. charSlot .. 'Slot';
        
        if (_G[slotName]) then
            slot = _G[slotName];

            -- create border if not done yet
            if (not slot.qborder) then
                local height = defaultSlotHeight;
                local width = defaultSlotWidth;

                if charSlot == 'Ammo' then
                    height = 58
                    width = 58
                end

                slot.qborder = addon:createBorder(slotName, _G[slotName], width, height);
            end

            -- update border color
            if (quality and show == 1) then
                local r, g, b = GetQualityColor(quality)
                slot.qborder:SetVertexColor(r, g, b);
                slot.qborder:SetAlpha(1);
                slot.qborder:Show();
            else
                slot.qborder:Hide();
            end
        end
    end
end

---
-- merchant trade window update
function addon:MERCHANT_UPDATE()
    addon:merchantItems_Update();

	if(not BuybackBG:IsShown()) then
        addon:merchantMainBuyBack_Update();
    end
end

---
-- merchant page update event
function addon:merchant_OnUpdate()
    addon:merchantItems_Update(GetMerchantItemLink);
    addon:merchantMainBuyBack_Update();
end

---
-- merchant buyback page update event
function addon:buyback_OnUpdate()
    addon:merchantItems_Update(GetBuybackItemLink);
end

---
-- merchant trade window do stuff
function addon:merchantItems_Update(itemLinkFunc)
    for slotId = 1, 12 do
        local slotName = 'MerchantItem' .. slotId .. 'ItemButton';
        itemFrame = _G[slotName];

        if (not itemFrame.qborder) then
            itemFrame.qborder = addon:createBorder(slotName, itemFrame, defaultSlotWidth, defaultSlotHeight);
        end

        local link = itemLinkFunc(slotId);

        if (link)  then
            addon:updateSlotBorderColor(itemFrame, link, LE_ITEM_QUALITY_COMMON);
        else
            itemFrame.qborder:Hide();
        end
    end
end

---
-- update the buy back button on the trade window
function addon:merchantMainBuyBack_Update()
    local buybackSlotName = 'MerchantBuyBackItemItemButton';
    item = _G[buybackSlotName];

    if (not item.qborder) then
        item.qborder = addon:createBorder(buybackSlotName, item, defaultSlotWidth, defaultSlotHeight);
    end

    local lastLink = FindLastBuybackItem();

    if (lastLink) then
        addon:updateSlotBorderColor(item, lastLink, LE_ITEM_QUALITY_COMMON);
    else
        item.qborder:Hide();
    end
end

function addon:updateSlotBorderColor(item, itemId, minQuality)
    local itemQuality = GetItemQuality(itemId);

    if (itemQuality and itemQuality > minQuality) then
        local r, g, b = GetQualityColor(itemQuality);
        item.qborder:SetVertexColor(r, g, b);
        item.qborder:SetAlpha(1);
        item.qborder:Show();
    else
        item.qborder:Hide();
    end
end


---
-- find last item in buy back queue
function FindLastBuybackItem()
    local lastLink = nil;

    -- find last buy back item
    for slotId = 1, 12 do
        local link = GetBuybackItemLink(slotId);
        if (link) then lastLink = link; end
    end

    return lastLink;
end

---
-- tradeskill item and reageants borders
function addon:tradeskill_OnUpdate(id)
    addon:updateTradeSkillItem(id);
    addon:updateTradeSkillReageant(id);
end

function addon:updateTradeSkillItem(id)
    local slotName = 'TradeSkillSkillIcon';
    item = _G[slotName];

    if (not item.qborder) then
        item.qborder = addon:createBorder(slotName, item, defaultSlotWidth, defaultSlotHeight);
    end

    local link = GetTradeSkillItemLink(id);

    if (link) then
        addon:updateSlotBorderColor(item, link, LE_ITEM_QUALITY_COMMON);
    else
        item.qborder:Hide();
    end
end

function addon:updateTradeSkillReageant(id)
    local nb = GetTradeSkillNumReagents(id);
    for index = 1, nb do
        local slotName = 'TradeSkillReagent' .. index;
        item = _G[slotName];
        
        if (not item.qborder) then
            item.qborder = addon:createBorder(slotName, item, defaultSlotWidth, defaultSlotHeight, -54);
        end

        local link = GetTradeSkillReagentItemLink(id, index)

        if (link) then
            addon:updateSlotBorderColor(item, link, LE_ITEM_QUALITY_COMMON);
        else
            item.qborder:Hide();
        end
    end
end

---
-- create a border texture for an inventory slot
function addon:createBorder(name, parent, width, height, x, y)
    local x = x or 0;
    local y = y or 1;

    local border = parent:CreateTexture(name .. 'Quality', 'OVERLAY');

    border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border");
    border:SetBlendMode('ADD');
    border:SetAlpha(1);
    border:SetHeight(height);
    border:SetWidth(width);
    border:SetPoint('CENTER', parent, 'CENTER', x, y);
    border:Hide();

    return border;
end

---
-- custom quality color function because we injected custom colors
function GetQualityColor(quality)
    local q = BAG_ITEM_QUALITY_COLORS[quality];
    return q.r, q.g, q.b;
end

---
-- custom quality function to manage custom items
function GetItemQuality(itemId)
    local quality, _, _, _, _, _, _, _, _, classId = select(3, GetItemInfo(itemId));
    if (classId == 12) then quality = LE_ITEM_QUALITY_QUEST;end
	if (classId == 6) then quality = LE_ITEM_QUALITY_ARROW;end
    if (classId == 9) then quality = LE_ITEM_QUALITY_RECIPE;end
    if (classId == 15) then quality = LE_ITEM_QUALITY_TRASH;end
	if (classId == 0) then quality = LE_ITEM_QUALITY_CONSUMABLE;end
	if (classId == 7) then quality = LE_ITEM_QUALITY_CRAFT;end
	if (classId == 5) then quality = LE_ITEM_QUALITY_CRAFT;end
	if (classId == 14) then quality = LE_ITEM_QUALITY_CRAFT;end
	if (itemId == 6948) then quality = LE_ITEM_QUALITY_HEARTH;end
	if (classId == 1) then quality = LE_ITEM_QUALITY_BAG;end
	
	--TOOLS--
	if (itemId == 4471) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 19307) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 20065) then quality = LE_ITEM_QUALITY_TOOL;end	
	if (itemId == 20066) then quality = LE_ITEM_QUALITY_TOOL;end
    if (itemId == 20067) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 20232) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 20234) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 20235) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 2581) then quality = LE_ITEM_QUALITY_TOOL;end
    if (itemId == 8545) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 14530) then quality = LE_ITEM_QUALITY_TOOL;end	
	if (itemId == 6451) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 3531) then quality = LE_ITEM_QUALITY_TOOL;end	
	if (itemId == 20237) then quality = LE_ITEM_QUALITY_TOOL;end
    if (itemId == 20243) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 20244) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 1251) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 8544) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 14529) then quality = LE_ITEM_QUALITY_TOOL;end
    if (itemId == 6450) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 19067) then quality = LE_ITEM_QUALITY_TOOL;end	
	if (itemId == 19066) then quality = LE_ITEM_QUALITY_TOOL;end
    if (itemId == 19068) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 3530) then quality = LE_ITEM_QUALITY_TOOL;end	
	if (itemId == 5956) then quality = LE_ITEM_QUALITY_TOOL;end
    if (itemId == 7005) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 2901) then quality = LE_ITEM_QUALITY_TOOL;end	
	if (itemId == 6365) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 6256) then quality = LE_ITEM_QUALITY_TOOL;end	
	if (itemId == 6366) then quality = LE_ITEM_QUALITY_TOOL;end
    if (itemId == 12225) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 6367) then quality = LE_ITEM_QUALITY_TOOL;end	
    if (itemId == 15872) then quality = LE_ITEM_QUALITY_TOOL;end
    if (itemId == 15870) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 15869) then quality = LE_ITEM_QUALITY_TOOL;end
	if (itemId == 15871) then quality = LE_ITEM_QUALITY_TOOL;end
	
	--CRAFT--
	if (itemId == 17056) then quality = LE_ITEM_QUALITY_CRAFT;end
	if (itemId == 7286) then quality = LE_ITEM_QUALITY_CRAFT;end
	
	--TRASH--
    if (itemId == 2296) then quality = LE_ITEM_QUALITY_TRASH;end
	if (itemId == 878) then quality = LE_ITEM_QUALITY_TRASH;end
	
	--CONJURED--
	if (itemId == 2288) then quality = LE_ITEM_QUALITY_CONJURED;end
    if (itemId == 1113) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 5350) then quality = LE_ITEM_QUALITY_CONJURED;end
    if (itemId == 5349) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 22895) then quality = LE_ITEM_QUALITY_CONJURED;end
    if (itemId == 8079) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 8077) then quality = LE_ITEM_QUALITY_CONJURED;end
    if (itemId == 1487) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 2136) then quality = LE_ITEM_QUALITY_CONJURED;end
    if (itemId == 1114) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 8075) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 8078) then quality = LE_ITEM_QUALITY_CONJURED;end
    if (itemId == 3772) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 8076) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 5522) then quality = LE_ITEM_QUALITY_CONJURED;end
    if (itemId == 13603) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 13602) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 13701) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 1254) then quality = LE_ITEM_QUALITY_CONJURED;end
    if (itemId == 13700) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 13699) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 16893) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 5232) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 16896) then quality = LE_ITEM_QUALITY_CONJURED;end
    if (itemId == 16892) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 16895) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 5512) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 5511) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 5512) then quality = LE_ITEM_QUALITY_CONJURED;end
    if (itemId == 5510) then quality = LE_ITEM_QUALITY_CONJURED;end
	if (itemId == 9421) then quality = LE_ITEM_QUALITY_CONJURED;end
	
	--BAGS--
	if (itemId == 3573) then quality = LE_ITEM_QUALITY_BAG;end
	if (itemId == 7278) then quality = LE_ITEM_QUALITY_BAG;end
	if (itemId == 2101) then quality = LE_ITEM_QUALITY_BAG;end
    if (itemId == 11362) then quality = LE_ITEM_QUALITY_BAG;end
	if (itemId == 5439) then quality = LE_ITEM_QUALITY_BAG;end
	if (itemId == 5441) then quality = LE_ITEM_QUALITY_BAG;end
	if (itemId == 7279) then quality = LE_ITEM_QUALITY_BAG;end
	if (itemId == 2102) then quality = LE_ITEM_QUALITY_BAG;end
    if (itemId == 11363) then quality = LE_ITEM_QUALITY_BAG;end
	if (itemId == 3574) then quality = LE_ITEM_QUALITY_BAG;end	
	
	--CONSUMABLE2--
	if (itemId == 23122) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 2863) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 3240) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 12404) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
    if (itemId == 12643) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 2871) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 3241) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 2862) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 3239) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
    if (itemId == 7964) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 7965) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end	
	if (itemId == 3012) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
    if (itemId == 1477) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 4425) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 10309) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 955) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 2290) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
    if (itemId == 4419) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 10308) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end	
	if (itemId == 3013) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
    if (itemId == 1478) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 4421) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 10305) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 1181) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 1712) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
    if (itemId == 4424) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 10306) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end	
	if (itemId == 1180) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
    if (itemId == 1711) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 4422) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 10307) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 954) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 2289) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
    if (itemId == 4426) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 10310) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 6529) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 6530) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end	
	if (itemId == 6811) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
    if (itemId == 6532) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 7307) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end
	if (itemId == 6533) then quality = LE_ITEM_QUALITY_CONSUMABLE2;end	
	
    --ARROW--
	if (itemId == 2946) then quality = LE_ITEM_QUALITY_ARROW;end
	if (itemId == 3111) then quality = LE_ITEM_QUALITY_ARROW;end	
	if (itemId == 3137) then quality = LE_ITEM_QUALITY_ARROW;end
    if (itemId == 15326) then quality = LE_ITEM_QUALITY_ARROW;end
	if (itemId == 3108) then quality = LE_ITEM_QUALITY_ARROW;end	
	if (itemId == 3107) then quality = LE_ITEM_QUALITY_ARROW;end
	if (itemId == 3135) then quality = LE_ITEM_QUALITY_ARROW;end	
	if (itemId == 2947) then quality = LE_ITEM_QUALITY_ARROW;end
    if (itemId == 3131) then quality = LE_ITEM_QUALITY_ARROW;end
	if (itemId == 15327) then quality = LE_ITEM_QUALITY_ARROW;end	

    --QUEST--
	if (itemId == 2798) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 9249) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 18250) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 12382) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 7146) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 20022) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 12301) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 5691) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 4882) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13140) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 7500) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 4483) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 3499) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 5690) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 5089) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 5851) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 18249) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 4484) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13303) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 9275) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 22739) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 22738) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13195) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 11197) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 6783) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 7923) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 3467) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13305) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 8444) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13194) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13304) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 18268) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 21762) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 11602) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 11818) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 7442) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 15767) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13307) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13196) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 5687) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 18266) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 9472) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 5050) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 2629) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 15328) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 17242) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 5396) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13306) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 5020) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 11106) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 6077) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13302) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 3930) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 7499) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 12942) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 11140) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 15881) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 15878) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 11078) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 3704) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 21761) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 4103) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 19064) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 11000) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 8072) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13704) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 14688) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 5689) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 2719) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 15736) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 7208) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 4485) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 7498) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 14645) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 5521) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13873) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 6893) then quality = LE_ITEM_QUALITY_QUEST;end
	if (itemId == 13197) then quality = LE_ITEM_QUALITY_QUEST;end
    return quality;
end

