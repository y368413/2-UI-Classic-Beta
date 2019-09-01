------------------------------------------------------------ImprovedLootFrame
local wow_classic = WOW_PROJECT_ID and WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
	--LOOTFRAME_AUTOLOOT_DELAY = 0.5;
	--LOOTFRAME_AUTOLOOT_RATE = 0.1;
	
	-- Woah, nice coding, blizz.
	-- Anchor something positioned at the top of the frame to the center of the frame instead,
	-- and make it an anonymous font string so I have to work to find it
	local i = 1

	while true do
		local r = select(i, LootFrame:GetRegions())
		if not r then break end
		if r.GetText and r:GetText() == ITEMS then
			r:ClearAllPoints()
			r:SetPoint("TOP", 12, -5)
		end
		i = i + 1
	end

-- Calculate base height of the loot frame
local p, r, x, y = "TOP", "BOTTOM", 0, -4
local buttonHeight = LootButton1:GetHeight() + abs(y)
local baseHeight = LootFrame:GetHeight() - (buttonHeight * LOOTFRAME_NUMBUTTONS) - 5

LootFrame.OverflowText = LootFrame:CreateFontString(nil, "OVERLAY", "GameFontRedSmall")
local OverflowText = LootFrame.OverflowText
OverflowText:SetPoint("TOP", LootFrame, "TOP", 0, -26)
OverflowText:SetPoint("LEFT", LootFrame, "LEFT", 60, 0)
OverflowText:SetPoint("RIGHT", LootFrame, "RIGHT", -8, 0)
OverflowText:SetPoint("BOTTOM", LootFrame, "TOP", 0, -65)
OverflowText:SetSize(1, 1)
OverflowText:SetJustifyH("LEFT")
OverflowText:SetJustifyV("TOP")
OverflowText:SetText("Hit 50-mob limit! Take some, then re-loot for more.")
OverflowText:Hide()

local t = {}
local function CalculateNumMobsLooted()
	wipe(t)

	for i = 1, GetNumLootItems() do
		for n = 1, select("#", GetLootSourceInfo(i)), 2 do
			local GUID, num = select(n, GetLootSourceInfo(i))
			t[GUID] = true
		end
	end

	local n = 0
	for k, v in pairs(t) do
		n = n + 1
	end

	return n
end

hooksecurefunc("LootFrame_Show", function(self, ...)
	local maxButtons = floor(UIParent:GetHeight()/LootButton1:GetHeight() * 0.7)
	
	local num = GetNumLootItems()

	if self.AutoLootTable then
		num = #self.AutoLootTable
	end

	--self.AutoLootDelay = 0.4 + (num * 0.05)
	
	num = min(num, maxButtons)
	
	LootFrame:SetHeight(baseHeight + (num * buttonHeight))
	for i = 1, num do
		if i > LOOTFRAME_NUMBUTTONS then
			local button = _G["LootButton"..i]
			if not button then
				button = CreateFrame(wow_classic and "Button" or "ItemButton", "LootButton"..i, LootFrame, "LootButtonTemplate", i)
			end
			LOOTFRAME_NUMBUTTONS = i
		end
		if i > 1 then
			local button = _G["LootButton"..i]
			button:ClearAllPoints()
			button:SetPoint(p, "LootButton"..(i-1), r, x, y)
		end
	end

	if CalculateNumMobsLooted() >= 50 then
		OverflowText:Show()
	else
		OverflowText:Hide()
	end

	LootFrame_Update();
end)

-------BGRoll----------------##Author: NOGARUKA  ##Version: 2
local NeedList = {
[18231] = true,
[71951] = true,
[71952] = true,
[71953] = true,
}
local BGRoll = CreateFrame("Frame")
BGRoll:RegisterEvent("START_LOOT_ROLL")
BGRoll:RegisterEvent("CONFIRM_LOOT_ROLL")
BGRoll:SetScript("OnEvent", function(self, event, id, rt)
if event == 'START_LOOT_ROLL' then
	local _, Name, _, _, _, Need, Greed, _ = GetLootRollItemInfo(id)
	local Link = GetLootRollItemLink(id)
	local ItemID = tonumber(strmatch(Link, 'item:(%d+)'))
	if NeedList[ItemID] then
		if Need then
			print("→: ", (Name))
			RollOnLoot(id, 1)
		elseif Greed then
			print("→: ", (Name))
			RollOnLoot(id, 2)
		end
	end
end
if event == 'CONFIRM_LOOT_ROLL' then ConfirmLootRoll(id, rt) end
end)

--[[local UnLootAlert = CreateFrame("Frame", "UnLootAlert")
UnLootAlert:RegisterEvent("ZONE_CHANGED_NEW_AREA")
UnLootAlert:RegisterEvent("PLAYER_ENTERING_WORLD")
UnLootAlert:SetScript("OnEvent", function(self, event, ...)
  if event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
    if select(2, IsInInstance()) == "raid" then
    AlertFrame:UnregisterEvent('SHOW_LOOT_TOAST')
    AlertFrame:UnregisterEvent('LOOT_ITEM_ROLL_WON')
    AlertFrame:UnregisterEvent('SHOW_LOOT_TOAST_UPGRADE')
    AlertFrame:UnregisterEvent('BONUS_ROLL_RESULT')
    end
  else
    AlertFrame:RegisterEvent('SHOW_LOOT_TOAST')
    AlertFrame:RegisterEvent('LOOT_ITEM_ROLL_WON')
    AlertFrame:RegisterEvent('SHOW_LOOT_TOAST_UPGRADE')
    AlertFrame:RegisterEvent('BONUS_ROLL_RESULT')
  end
 end)]]