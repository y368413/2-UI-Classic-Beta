----------------Item Selling## Author: Spencer Sohn----------------------
local ItemSelling = StaticPopupDialogs["CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL"] 
ItemSelling.OnAccept=nil 
ItemSelling.OnShow=function() StaticPopup_Hide("CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL"); SellCursorItem(); end
----------------ArenaLeaveConfirmer----------------------
hooksecurefunc(StaticPopupDialogs["CONFIRM_LEAVE_BATTLEFIELD"],"OnShow",function(self)
	if IsActiveBattlefieldArena() or GetBattlefieldWinner() then self.button1:Click() end
end)
--------------------------------------Hide the left/right end cap------------------------
MainMenuBarLeftEndCap:Hide()  MainMenuBarRightEndCap:Hide()   
-------------------------------------------------------------------------------  Auto Reagent Bank
local AutoReagentBank = CreateFrame("Frame")
AutoReagentBank:RegisterEvent("BANKFRAME_OPENED")
AutoReagentBank:SetScript("OnEvent", function(self, event, ...)
  if not MaoRUISettingDB["Misc"]["AutoReagentBank"] then self:UnregisterAllEvents() return end
	if not BankFrameItemButton_Update_OLD then
		BankFrameItemButton_Update_OLD = BankFrameItemButton_Update
		
		BankFrameItemButton_Update = function(button)
			if BankFrameItemButton_Update_PASS == false then
				BankFrameItemButton_Update_OLD(button)
			else
				BankFrameItemButton_Update_PASS = false
			end
		end
	end
	
	BankFrameItemButton_Update_PASS = true
	DepositReagentBank()
end)

--[[----------------------------------------------------------------------------- ItemQualityIcons
hooksecurefunc("SetItemButtonQuality", function(button, quality, itemIDOrLink)
	button.IconBorder:Hide()

	local qualityIcon = button.qualityIcon
	if not qualityIcon then
		qualityIcon = CreateFrame("Frame", nil, button)
		qualityIcon:SetAllPoints()
		button.qualityIcon = qualityIcon
	end

	local iconColor = button.iconColor
	if not iconColor then
		iconColor = qualityIcon:CreateTexture("iconColor", "OVERLAY")
		iconColor:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\Role\\bubbleTex")
		iconColor:ClearAllPoints()
		iconColor:SetPoint("TOPRIGHT", -5, -5)
		iconColor:SetSize(9, 9)
	end

	if quality then
		if BAG_ITEM_QUALITY_COLORS[quality] and quality ~= 1 then
			iconColor:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b)
		elseif quality == 1 then
			iconColor:SetVertexColor(1, 1, 1)
		elseif quality == 0 then
			iconColor:SetVertexColor(0.61568, 0.61568, 0.61568)
		end

		button.qualityIcon:Show()
	else
		button.qualityIcon:Hide()
	end
end)]]

------------------------------------------------------------------------------- NiceDamage
--Local NiceDamage = CreateFrame("Frame", "NiceDamage");
--function NiceDamage:ApplySystemDamageFonts() DAMAGE_TEXT_FONT = "Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\RedCircl.ttf"; end
--NiceDamage:SetScript("OnEvent", function() if (event == "ADDON_LOADED") then NiceDamage:ApplySystemDamageFonts() end end);
--NiceDamage:RegisterEvent("ADDON_LOADED");
--NiceDamage:ApplySystemDamageFonts()


--## Title: Extended Transmog UI  ## Author: Germbread ## Version: 1.1.0
function ExtTransmog_RebuildFrame()
    WardrobeFrame:SetWidth(1200);
    --WardrobeFrame:SetScale(0.82);
    WardrobeTransmogFrame:SetWidth(535);
    WardrobeTransmogFrame.Model:ClearAllPoints();
    WardrobeTransmogFrame.Model:SetPoint("TOP", WardrobeTransmogFrame, "TOP", 0, -4);
    WardrobeTransmogFrame.Model:SetWidth(420);
    WardrobeTransmogFrame.Model:SetHeight(420);
    WardrobeTransmogFrame.Inset.BG:SetWidth(529);

    WardrobeTransmogFrame.Model.HeadButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.HeadButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "TOP", -238, -41);
    WardrobeTransmogFrame.Model.HandsButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.HandsButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "TOP", 235, -118);

    WardrobeTransmogFrame.Model.MainHandButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.MainHandButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "BOTTOM", -26, -5);
    WardrobeTransmogFrame.Model.SecondaryHandButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.SecondaryHandButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "BOTTOM", 27, -5);
    WardrobeTransmogFrame.Model.MainHandEnchantButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.MainHandEnchantButton:SetPoint("BOTTOM", WardrobeTransmogFrame.Model.MainHandButton, "BOTTOM", 0, -20);
    WardrobeTransmogFrame.Model.SecondaryHandEnchantButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.SecondaryHandEnchantButton:SetPoint("BOTTOM", WardrobeTransmogFrame.Model.SecondaryHandButton, "BOTTOM", 0, -20);    
end
local ExtTransmogUI = CreateFrame("Frame")
ExtTransmogUI:RegisterEvent("ADDON_LOADED")
ExtTransmogUI:SetScript("OnEvent",function(self,event,addon)
    if addon=="Blizzard_Collections" then
		ExtTransmog_RebuildFrame()
		ExtTransmogUI:UnregisterEvent("ADDON_LOADED")
	end
end)

------------------------------ ## Notes: Automatically destroys items in the pre-defined list    ## Author: Tim @ WoW Interface    ## Version: 1.0
local itemList = {
	[2287] = true,		-- haunch of meat (tested in RFC)  肉排
	[1179] = true,		-- ice cold milk (tested in RFC)   冰镇牛奶
}
local DESTROY = CreateFrame("Frame", "AutoItemDestroyer")
DESTROY:RegisterEvent("BAG_UPDATE")
DESTROY:RegisterEvent("BAG_UPDATE_DELAYED")
DESTROY:RegisterEvent("CHAT_MSG_LOOT")
DESTROY:SetScript("OnEvent", function(_, event, ...)
   for bags = 0, 4 do
      for slots = 1, GetContainerNumSlots(bags) do
         local itemLink, linkID = GetContainerItemLink(bags, slots), GetContainerItemID(bags, slots)
         if (itemLink and linkID) then
            if (select(11, GetItemInfo(itemLink)) ~= nil and select(2, GetContainerItemInfo(bags, slots)) ~= nil) then
               local itemName, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ = GetItemInfo(linkID) 
               if itemList[linkID] then
                  PickupContainerItem(bags, slots)
                  DeleteCursorItem()
                  --print("Searched bags... FOUND & DESTROYED: |cff6699dd", itemName.." [ID: "..linkID.."]")
               end
            end
         end
      end
   end
end)