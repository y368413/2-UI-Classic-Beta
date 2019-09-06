----------------------------------------------------------------------------------------
--	Show item level for weapons and armor in merchant
----------------------------------------------------------------------------------------
local function MerchantItemlevel()
	local numItems = GetMerchantNumItems()

	for i = 1, MERCHANT_ITEMS_PER_PAGE do
		local index = (MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE + i
		if index > numItems then return end

		local button = _G["MerchantItem"..i.."ItemButton"]
		if button and button:IsShown() then
			if not button.text then
				button.text = button:CreateFontString(nil, "OVERLAY", "SystemFont_Outline_Small")
				button.text:SetPoint("TOPLEFT", 1, -1)
				button.text:SetTextColor(1, 1, 0)
			else
				button.text:SetText("")
			end

			local itemLink = GetMerchantItemLink(index)
			if itemLink then
				local _, _, quality, itemlevel, _, _, _, _, _, _, _, itemClassID = GetItemInfo(itemLink)
				if (itemlevel and itemlevel > 1) and (quality and quality > 1) and (itemClassID == LE_ITEM_CLASS_WEAPON or itemClassID == LE_ITEM_CLASS_ARMOR) then
					button.text:SetText(itemlevel)
				end
			end
		end
	end
end
hooksecurefunc("MerchantFrame_UpdateMerchantInfo", MerchantItemlevel)
----------------------------------------------------------------------------------------
-- Learn all available skills(TrainAll by SDPhantom)
----------------------------------------------------------------------------------------
local TrainAll = CreateFrame("Frame")
TrainAll:RegisterEvent("ADDON_LOADED")
TrainAll:SetScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_TrainerUI" then
		local button = CreateFrame("Button", "ClassTrainerTrainAllButton", ClassTrainerFrame, "UIPanelButtonTemplate")
		button:SetText(ALL..LEARN )
		button:SetPoint("TOPRIGHT", ClassTrainerTrainButton, "TOPLEFT", 0, 0)
		button:SetWidth(min(88, button:GetTextWidth() + 21))
		button:SetScript("OnClick", function()
			for i = 1, GetNumTrainerServices() do
				if select(2, GetTrainerServiceInfo(i)) == "available" then
					BuyTrainerService(i)
				end
			end
		end)
		hooksecurefunc("ClassTrainerFrame_Update", function()
			for i = 1, GetNumTrainerServices() do
				if ClassTrainerTrainButton:IsEnabled() and select(2, GetTrainerServiceInfo(i)) == "available" then
					button:Enable()
					return
				end
			end
			button:Disable()
		end)
	end
end)

----------------------------------------------------------------------------------------
--	Enchantment scroll on TradeSkill frame(OneClickEnchantScroll by Sara.Festung)
----------------------------------------------------------------------------------------
local OneClickEnchantScroll = CreateFrame("Frame")
OneClickEnchantScroll:RegisterEvent("ADDON_LOADED")
OneClickEnchantScroll:SetScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_TradeSkillUI" and not IsAddOnLoaded("OneClickEnchantScroll") then
		local button = CreateFrame("Button", "TradeSkillCreateScrollButton", TradeSkillFrame, "MagicButtonTemplate")
		button:SetPoint("TOPRIGHT", TradeSkillFrame.DetailsFrame.CreateButton, "TOPLEFT")
		button:SetScript("OnClick", function()
			C_TradeSkillUI.CraftRecipe(TradeSkillFrame.DetailsFrame.selectedRecipeID)
			UseItemByName(38682)
		end)

		hooksecurefunc(TradeSkillFrame.DetailsFrame, "RefreshButtons", function(self)
			if C_TradeSkillUI.IsTradeSkillGuild() or C_TradeSkillUI.IsNPCCrafting() or C_TradeSkillUI.IsTradeSkillLinked() then
				button:Hide()
			else
				local recipeInfo = self.selectedRecipeID and C_TradeSkillUI.GetRecipeInfo(self.selectedRecipeID)
				if recipeInfo and recipeInfo.alternateVerb then
					local _, _, _, _, _, parentSkillLineID = C_TradeSkillUI.GetTradeSkillLine()
					if parentSkillLineID == 333 then
						button:Show()
						local numCreateable = recipeInfo.numAvailable
						local numScrollsAvailable = GetItemCount(38682)
						button:SetText("& ("..numScrollsAvailable..")")
						 if numScrollsAvailable == 0 then
							numCreateable = 0
						end
						if numCreateable > 0 then
							button:Enable()
						else
							button:Disable()
						end
					else
						button:Hide()
					end
				else
					button:Hide()
				end
			end
		end)
	end
end)