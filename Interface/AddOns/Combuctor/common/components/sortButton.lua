--[[
	sortButton.lua
		A style agnostic item sorting button
--]]

local ADDON, Addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale(ADDON)
local SortButton = Addon:NewClass('SortButton', 'Button')


--[[ Constructor ]]--

function SortButton:New(parent)
	local b = self:Bind(CreateFrame('Button', nil, parent, ADDON .. self.Name .. 'Template'))
	b:RegisterForClicks('anyUp')
	b:SetScript('OnClick', b.OnClick)
	b:SetScript('OnEnter', b.OnEnter)
	b:SetScript('OnLeave', b.OnLeave)

	return b
end


--[[ Interaction ]]--

function SortButton:OnClick(button)
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
	if IsControlKeyDown() then     ---------------Thanks Siweia  么么哒·~~~~
		DepositReagentBank()
	else
		if self:GetParent():IsBank() then
			self:RegisterEvent('BAG_UPDATE_DELAYED')
			SortBankBags()
			--SortReagentBankBags()   8.1.5已失效
		elseif button == 'RightButton' then
		  SetSortBagsRightToLeft(false)      --整理向左边背包移动
		  SetInsertItemsLeftToRight(false)   --新增物品自动进入最右边背包 
			SortBags()
			ReverseSort()
		else
		  SetSortBagsRightToLeft(true)      --整理向左边背包移动
		  SetInsertItemsLeftToRight(false)  --新增物品自动进入最右边背包
		  SortBags()
		end
	end
end

function SortButton:OnEnter()
	GameTooltip:SetOwner(self, self:GetRight() > (GetScreenWidth() / 2) and 'ANCHOR_LEFT' or 'ANCHOR_RIGHT')

	if self:GetParent():IsBank() then
		GameTooltip:SetText(L.TipManageBank)
		GameTooltip:AddLine(L.TipDepositReagents, 1,1,1)
		GameTooltip:AddLine(L.TipCleanBank, 1,1,1)
	else
		GameTooltip:SetText(L.TipCleanBags)
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
