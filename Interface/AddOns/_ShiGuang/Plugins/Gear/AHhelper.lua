--AH搜索上货
local  bag, slot
hooksecurefunc("ContainerFrameItemButton_OnModifiedClick", function(self, button)
      bag, slot = self:GetParent():GetID(), self:GetID()
      local tLink = GetContainerItemLink(bag, slot)
      local tName = GetItemInfo(tLink) 
        if (button == 'LeftButton') and (IsAltKeyDown()) and AuctionFrame and AuctionFrame:IsVisible() and not IsAddOnLoaded('AuctionLite') then
            AuctionFrameTab3:Click()
             PickupContainerItem(bag, slot)
             ClickAuctionSellItemButton()
             ClearCursor()
        elseif (button == 'RightButton') and AuctionFrame and AuctionFrame:IsVisible() and not IsAddOnLoaded('AuctionLite') then
             AuctionFrameTab3:Click()
             PickupContainerItem(bag, slot)
             ClickAuctionSellItemButton()
             ClearCursor()
        elseif (button == 'LeftButton') and (IsShiftKeyDown()) and AuctionFrame and AuctionFrame:IsVisible() and not IsAddOnLoaded('AuctionLite') then
            if tLink then 
              AuctionFrameTab1:Click()
              BrowseName:SetText(tName)
              AuctionFrameBrowse_Search()   
            end
        end   
end)

local AHT = CreateFrame('Frame')
AHT:RegisterEvent('ADDON_LOADED')
AHT:SetScript('OnEvent', function(self, event, name)
    if(name == 'Blizzard_AuctionUI') and not IsAddOnLoaded('AuctionLite') then
        AHTEXT = CreateFrame('Button', 'SomeRandomButton123', AuctionFrame, 'UIPanelButtonTemplate')
        AHTEXT:SetPoint('TOPLEFT', AuctionFrame, 'TOPLEFT', 180, -26)
        AHTEXT:SetSize(1, 1)
        AHTEXT:SetText(GEAR_AHHELPER_AUTOSELL)
		AHT:UnregisterEvent("ADDON_LOADED")
    end
end)

-- daftAuction
local daftAuction =  CreateFrame("Frame");
daftAuction:RegisterEvent("AUCTION_HOUSE_SHOW");
daftAuction:RegisterEvent("AUCTION_ITEM_LIST_UPDATE");

local selectedItem;
local selectedItemVendorPrice;
local selectedItemQuality;
local currentPage = 0;
local myBuyoutPrice, myStartPrice;

daftAuction:SetScript("OnEvent", function(self, event)
	if event == "AUCTION_HOUSE_SHOW" and not IsAddOnLoaded("AuctionsMaster") then		
		AuctionsItemButton:HookScript("OnEvent", function(self, event)			
			if event=="NEW_AUCTION_UPDATE" then -- user placed an item into auction item box
				self:SetScript("OnUpdate", nil);
				myBuyoutPrice = nil;
				myStartPrice = nil;
				currentPage = 0;
				selectedItem = nil;
				selectedItem, texture, count, quality, canUse, price, _, stackCount, totalCount, selectedItemID = GetAuctionSellItemInfo();
				local canQuery = CanSendAuctionQuery();
				if canQuery and selectedItem then -- query auction house based on item name
					ResetCursor();
					QueryAuctionItems(selectedItem);
				end;
			end;
		end);

	elseif event == "AUCTION_ITEM_LIST_UPDATE" and not IsAddOnLoaded("AuctionLite") then -- the auction list was updated or sorted
		if (selectedItem ~= nil) then -- an item was placed in the auction item box
			local batch, totalAuctions = GetNumAuctionItems("list");
			if totalAuctions == 0 then -- No matches
				_, _, selectedItemQuality, selectedItemLevel, _, _, _, _, _, _, selectedItemVendorPrice = GetItemInfo(selectedItem);
							
				--if PRICE_BY == "QUALITY" then			
					if selectedItemQuality == 0 then myBuyoutPrice = 100000 end;
					if selectedItemQuality == 1 then myBuyoutPrice = 200000 end;
					if selectedItemQuality == 2 then myBuyoutPrice = 2000000 end;
					if selectedItemQuality == 3 then myBuyoutPrice = 5000000 end;
					if selectedItemQuality == 4 then myBuyoutPrice = 10000000 end;
				--elseif PRICE_BY == "VENDOR" then			
					--if selectedItemQuality == 0 then myBuyoutPrice = selectedItemVendorPrice * 20 end;
					--if selectedItemQuality == 1 then myBuyoutPrice = selectedItemVendorPrice * 30 end;
					--if selectedItemQuality == 2 then myBuyoutPrice = selectedItemVendorPrice * 40 end;
					--if selectedItemQuality == 3 then myBuyoutPrice = selectedItemVendorPrice * 50 end;
					--if selectedItemQuality == 4 then myBuyoutPrice = selectedItemVendorPrice * 60 end;
				--end;
				
				myStartPrice = myBuyoutPrice;
			end;
			
			local currentPageCount = floor(totalAuctions/50);
			
			for i=1, batch do -- SCAN CURRENT PAGE
				local postedItem, _, count, _, _, _, _, minBid, _, buyoutPrice, _, _, _, owner = GetAuctionItemInfo("list",i);
				
				if postedItem == selectedItem and owner ~= UnitName("player") and buyoutPrice ~= nil then -- selected item matches the one found on auction list
					
					if myBuyoutPrice == nil and myStartPrice == nil then
						myBuyoutPrice = (buyoutPrice/count) * .97;
						myStartPrice = (minBid/count) * .97;
					
					elseif myBuyoutPrice > (buyoutPrice/count) then
						myBuyoutPrice = (buyoutPrice/count) * .97;
						myStartPrice = (minBid/count) * .97;
					end;
				end;
			end;
			
			if currentPage < currentPageCount then -- GO TO NEXT PAGES			
				self:SetScript("OnUpdate", function(self, elapsed)			
					if not self.timeSinceLastUpdate then 
						self.timeSinceLastUpdate = 0 ;
					end;
					self.timeSinceLastUpdate = self.timeSinceLastUpdate + elapsed;
					
					if self.timeSinceLastUpdate > .1 then -- a cycle has passed, run this
						selectedItem = GetAuctionSellItemInfo();
						local canQuery = CanSendAuctionQuery();
						
						if canQuery then -- check the next page of auctions
							currentPage = currentPage + 1;
							QueryAuctionItems(selectedItem, nil, nil, currentPage);
							self:SetScript("OnUpdate", nil);
						end;
						self.timeSinceLastUpdate = 0;
					end;
				end);
			
			else -- ALL PAGES SCANNED
				self:SetScript("OnUpdate", nil);
				local stackSize = AuctionsStackSizeEntry:GetNumber();
				if myStartPrice ~= nil then				
					if stackSize > 1 then -- this is a stack of items				
						if MSA_DropDownMenu_GetSelectedValue(PriceDropDown) == 1 then -- input price per item
							MoneyInputFrame_SetCopper(StartPrice, myStartPrice);
							MoneyInputFrame_SetCopper(BuyoutPrice, myBuyoutPrice);
						else -- input price for entire stack
							MoneyInputFrame_SetCopper(StartPrice, myStartPrice*stackSize);
							MoneyInputFrame_SetCopper(BuyoutPrice, myBuyoutPrice*stackSize);
						end;
						
					else -- this is not a stack
						MoneyInputFrame_SetCopper(StartPrice, myStartPrice);
						MoneyInputFrame_SetCopper(BuyoutPrice, myBuyoutPrice);
					end;
					if MSA_DropDownMenu_GetSelectedValue(DurationDropDown) ~= 3 then 
						MSA_DropDownMenu_SetSelectedValue(DurationDropDown, 3); -- set duration to 3 (48h)
						DurationDropDownText:SetText("48 H"); -- set duration text since it keeps bugging to "Custom"  48 Hours
					end;
				end;
					
				myBuyoutPrice = nil;
				myStartPrice = nil;
				currentPage = 0;
				selectedItem = nil;
				stackSize = nil;
			end;
		end;
	end;
end);