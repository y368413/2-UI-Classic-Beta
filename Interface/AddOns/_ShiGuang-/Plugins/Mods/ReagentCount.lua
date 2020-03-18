--## Version: 1.0.8  ## Author: Pazza (Bronzebeard)
-- local references to globals
local ActionButton_Update = ActionButton_Update
local CreateFrame = CreateFrame
local GetContainerItemInfo = GetContainerItemInfo
local GetContainerNumSlots = GetContainerNumSlots
local SPELL_REAGENTS = SPELL_REAGENTS

local tooltipFrame

local function cleanName (name)
	-- pull text from link
	local itemString, itemName = name:match("|H(.*)|h%[(.*)%]|h")
	return itemName or name
end

local function reagentCheck (slot)
	tooltipFrame:SetAction(slot)
	regions = { tooltipFrame:GetRegions() }

	for i, region in pairs(regions) do
		if region:GetObjectType() == "FontString" then
			local text = region:GetText()
			if text and string.find(text, SPELL_REAGENTS) then
				local reagent = string.gsub(text, SPELL_REAGENTS, '')
				return cleanName(reagent)
			end
		end
	end

	return nil
end

local function getInventoryCount (item)
	local toFind = cleanName(item)
	local count = 0
	for bag = 4, 0, -1 do
		local size = GetContainerNumSlots(bag)
		for slot = 1, size do
			local texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(bag, slot);
			if itemLink then
				if toFind == cleanName(itemLink) then
					count = count + itemCount
				end
			end
		end
	end
	return count
end

local function init ()
	-- create tooltip frame
	tooltipFrame = CreateFrame("GameTooltip", "ReagentCount_GameTooltip", nil, "GameTooltipTemplate")
	tooltipFrame:SetOwner(WorldFrame, "ANCHOR_NONE");

	-- hook ActionButton_UpdateCount
	hooksecurefunc("ActionButton_UpdateCount",
		function (self)
			local slot = self.action

			if (GetActionInfo(slot) ~= 'item') then
				local reagent = reagentCheck(slot)
				if (reagent) then
					local itemCount = getInventoryCount(reagent)
					self.Count:SetText(itemCount)
				end
			end
		end
	)
end

init()
