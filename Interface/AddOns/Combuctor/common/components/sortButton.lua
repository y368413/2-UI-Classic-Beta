--[[
	sortButton.lua
		A style agnostic item sorting button
--]]

local ADDON, Addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale(ADDON)
local SortButton = Addon:NewClass('SortButton', 'CheckButton')


--[[ Constructor ]]--

function SortButton:New(parent)
	local b = self:Bind(CreateFrame('CheckButton', nil, parent, ADDON .. self.Name .. 'Template'))
	b:RegisterSignal('SORTING_STATUS')
	b:SetScript('OnClick', b.OnClick)
	b:SetScript('OnEnter', b.OnEnter)
	b:SetScript('OnLeave', b.OnLeave)
	b:RegisterForClicks('anyUp')

	return b
end

function SortButton:SORTING_STATUS(_,_, bags)
	self:SetChecked(self:GetParent().Bags == bags)
end

--[[ Interaction ]]--

function SortButton:OnClick(button)
	self:SetChecked(nil)
	local PickupContainerItem = _G.PickupContainerItem   
	local function ReverseSort()
		C_Timer.After(.5, function()
			for bag = 0, 4 do
				local numSlots = GetContainerNumSlots(bag)
				for slot = 1, numSlots do
					local texture, _, locked = GetContainerItemInfo(bag, slot)
					if texture and not locked then
						PickupContainerItem(bag, slot)
						PickupContainerItem(bag, numSlots+1 - slot)
					end
				end
			end
		end)
	end 
	if IsControlKeyDown() and DepositReagentBank then     ---------------Thanks Siweia  么么哒·~~~~
		return DepositReagentBank()
	end
	local frame = self:GetParent()
	if not frame:IsCached() then
		--if self:GetParent():IsBank() then
			--self:RegisterEvent('BAG_UPDATE_DELAYED')
			--SortBankBags()
		--else
		if button == 'RightButton' then
		  SetSortBagsRightToLeft(false)      --整理向左边背包移动
		  SetInsertItemsLeftToRight(false)   --新增物品自动进入最右边背包 
			frame:SortItems()  --SortBags()
			ReverseSort()
		else
		  SetSortBagsRightToLeft(true)      --整理向左边背包移动
		  SetInsertItemsLeftToRight(false)  --新增物品自动进入最右边背包
		  frame:SortItems()   --SortBags()
		end
	end
end

function SortButton:OnEnter()
	GameTooltip:SetOwner(self, self:GetRight() > (GetScreenWidth() / 2) and 'ANCHOR_LEFT' or 'ANCHOR_RIGHT')

	if DepositReagentBank then
		GameTooltip:SetText(BAG_FILTER_CLEANUP)
		GameTooltip:AddLine(L.TipCleanItems:format(L.LeftClick), 1,1,1)
		GameTooltip:AddLine(L.TipDepositReagents:format(L.RightClick), 1,1,1)
	else
		GameTooltip:SetText(L.TipCleanItems:format(L.Click))
	end

	GameTooltip:Show()
end

function SortButton:OnLeave()
	if GameTooltip:IsOwned(self) then
		GameTooltip:Hide()
	end
end


--[[ Events ]]--

function SortButton:BAG_UPDATE_DELAYED()
	self:UnregisterEvent('BAG_UPDATE_DELAYED')
	SortReagentBankBags()
end
