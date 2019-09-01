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

-------------------------------------------------------------------------------------------------------MerchantFilterButtons
local MerchantFrame = _G.MerchantFrame
local GetMerchantFilter = _G.GetMerchantFilter
local UnitFactionGroup = _G.UnitFactionGroup
local GameToolTip = _G.GameToolTip
local UnitClass = _G.UnitClass
local GetNumSpecializations = _G.GetNumSpecializations
local GetSpecializationInfo = _G.GetSpecializationInfo
local SetPushed,Buttons

local spacing = 36
local alltexture,allcoord
do
	if UnitFactionGroup("player") == "Neutral" and select(2,UnitClass("player")) == "MONK" then
		alltexture = "Interface\\Glues\\AccountUpgrade\\upgrade-panda"
		allcoord = {0,1,0,1}
	else
		alltexture = "Interface\\COMMON\\icon-"..strlower(UnitFactionGroup("player"))
		allcoord = {0.25,0.75,0.2,0.8}
	end
end

local function BuildButtons()
	Buttons = {
		["ALL"] = {
			text = ALL,
			texture = alltexture,
			coord = allcoord,
			filter = LE_LOOT_FILTER_ALL,
			x = -60
		},
		["BOE"] = {
			text = ITEM_BIND_ON_EQUIP,
			texture = "Interface\\Buttons\\UI-GroupLoot-Coin-Up",
			coord = {0.1,0.9,0.1,0.9},
			filter = LE_LOOT_FILTER_BOE,
			x = -(spacing) - 60,
			y = 2
		},
		["CLASS"] = {
			text = select(1,UnitClass("player")),
			texture = "Interface\\WorldStateFrame\\ICONS-CLASSES",
			coord = CLASS_ICON_TCOORDS[select(2,UnitClass("player"))],
			filter = LE_LOOT_FILTER_CLASS,
			x = -(spacing*2) - 60
		}
	}

	for i = 1, GetNumSpecializations() do
		local arg1, name, arg3, icon = GetSpecializationInfo(i);
		Buttons["SPEC"..i] = {}
		Buttons["SPEC"..i].text = name;
		Buttons["SPEC"..i].texture = icon;
		Buttons["SPEC"..i].filter = LE_LOOT_FILTER_SPEC1 + i - 1;
		Buttons["SPEC"..i].coord = {0.1,0.9,0.1,0.9};
		Buttons["SPEC"..i].x = (-(spacing)*(i+2))-30;
	end
	
	SetPushed = function(Filter)
		for k,v in pairs(Buttons) do
			local button = _G["MFB_"..k]
			if Filter == v.filter or Filter == LE_LOOT_FILTER_ALL then
				SetDesaturation(_G["MFB_"..k.."_Overlay"], nil)
			else
				SetDesaturation(_G["MFB_"..k.."_Overlay"], 1)			
			end
			if Filter == v.filter then
				--button.Flash.flasher:Play()				
				button:SetButtonState("PUSHED", 1)
			else
				--if button.Flash.flasher:IsPlaying() then
					--button.Flash.flasher:Stop()
				--end
				button:SetButtonState("NORMAL")
			end
		end	
	end
	for k,v in pairs(Buttons) do
		local button = CreateFrame("Button","MFB_"..k,MerchantFrame,"MainMenuBarMicroButton")
		button.text = v.text
		button:SetPoint("TOPLEFT",MerchantFrame,"TOPRIGHT",-4,v.x)
		button:SetScript("OnEnter",function()
			GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
			GameTooltip:AddLine(v.text);
			GameTooltip:Show();
		end)
		button:SetScript("OnLeave",function() GameTooltip:Hide(); end)
		button:SetNormalTexture("Interface\\Buttons\\UI-MicroButtonCharacter-Up");
		button:SetPushedTexture("Interface\\Buttons\\UI-MicroButtonCharacter-Down");
		button:SetHighlightTexture("Interface\\Buttons\\UI-MicroButton-Hilight");
		button.overlay = button:CreateTexture("MFB_"..k.."_Overlay","OVERLAY")
		button.overlay:SetSize(18,20)
		button.overlay:SetPoint("TOP",button,"TOP",0,(-15-(v.y or 0)))
		button.overlay:SetTexture(v.texture)
		button.overlay:SetTexCoord(unpack(v.coord))
		button.Flash.flasher = button.Flash:CreateAnimationGroup()
		local fade1 = button.Flash.flasher:CreateAnimation("Alpha")
		fade1:SetDuration(0.5)
		fade1:SetToAlpha(1)
		fade1:SetOrder(1)
		local fade2 = button.Flash.flasher:CreateAnimation("Alpha")
		fade2:SetDuration(0.5)
		fade2:SetFromAlpha(1)
		fade2:SetOrder(2)
		button.Flash:SetAlpha(0)
		button.Flash:Show()
		button:SetScript("OnClick",function(self,button)
			MerchantFrame_SetFilter(MerchantFrame,v.filter)
			SetPushed(GetMerchantFilter())			
		end)
	end
end

local MerchantFilterButtons = CreateFrame("frame")
MerchantFilterButtons:RegisterEvent("PLAYER_ENTERING_WORLD")
MerchantFilterButtons:RegisterEvent("MERCHANT_FILTER_ITEM_UPDATE")
MerchantFilterButtons:SetScript("OnEvent", function(self,event)
	if event == "PLAYER_ENTERING_WORLD" then
		MerchantFrame_SetFilter(MerchantFrame, GetMerchantFilter())
		self:UnregisterEvent(event)
		MerchantFrameLootFilter:Hide()
		BuildButtons()
	elseif event == "MERCHANT_FILTER_ITEM_UPDATE" then
		SetPushed(GetMerchantFilter())
	end
end)
MerchantFrame:HookScript("OnShow", function() MerchantFrame_SetFilter(MerchantFrame, GetMerchantFilter()) SetPushed(GetMerchantFilter()) end)

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