local _, ns = ...
local M, R, U, I = unpack(ns)
if not R.Infobar.Durability then return end

local module = M:GetModule("Infobar")
local info = module:RegisterInfobar("Durability", R.Infobar.DurabilityPos)
local format, gsub, sort, floor, modf, select = string.format, string.gsub, table.sort, math.floor, math.modf, select
local GetInventoryItemLink, GetInventoryItemDurability, GetInventoryItemTexture = GetInventoryItemLink, GetInventoryItemDurability, GetInventoryItemTexture
local GetMoney, GetRepairAllCost, RepairAllItems, CanMerchantRepair = GetMoney, GetRepairAllCost, RepairAllItems, CanMerchantRepair
local C_Timer_After, IsShiftKeyDown, InCombatLockdown, CanMerchantRepair = C_Timer.After, IsShiftKeyDown, InCombatLockdown, CanMerchantRepair
local repairCostString = gsub(REPAIR_COST, HEADER_COLON, ":")

local localSlots = {
	[1] = {1, INVTYPE_HEAD, 1000},
	[2] = {3, INVTYPE_SHOULDER, 1000},
	[3] = {5, INVTYPE_CHEST, 1000},
	[4] = {6, INVTYPE_WAIST, 1000},
	[5] = {9, INVTYPE_WRIST, 1000},
	[6] = {10, U["Hands"], 1000},
	[7] = {7, INVTYPE_LEGS, 1000},
	[8] = {8, U["Feet"], 1000},
	[9] = {16, INVTYPE_WEAPONMAINHAND, 1000},
	[10] = {17, INVTYPE_WEAPONOFFHAND, 1000},
	[11] = {18, INVTYPE_RANGED, 1000}
}

local lastClick = 0
local inform = CreateFrame("Frame", nil, nil, "MicroButtonAlertTemplate")
inform:SetPoint("BOTTOM", info, "TOP", 0, 23)
inform.Text:SetText(U["Low Durability"])
inform:Hide()

local function sortSlots(a, b)
	if a and b then
		return (a[3] == b[3] and a[1] < b[1]) or (a[3] < b[3])
	end
end

local function getItemDurability()
	local numSlots = 0
	for i = 1, #localSlots do
		localSlots[i][3] = 1000
		local index = localSlots[i][1]
		if GetInventoryItemLink("player", index) then
			local current, max = GetInventoryItemDurability(index)
			if current then
				localSlots[i][3] = current/max
				numSlots = numSlots + 1
			end
		end
	end
	sort(localSlots, sortSlots)

	return numSlots
end

local function isLowDurability()
	for i = 1, #localSlots do
		if localSlots[i][3] < .25 then
			return true
		end
	end
end

local function gradientColor(perc)
	perc = perc > 1 and 1 or perc < 0 and 0 or perc -- Stay between 0-1
	local seg, relperc = modf(perc*2)
	local r1, g1, b1, r2, g2, b2 = select(seg*3+1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0) -- R -> Y -> G
	local r, g, b = r1+(r2-r1)*relperc, g1+(g2-g1)*relperc, b1+(b2-b1)*relperc
	return format("|cff%02x%02x%02x", r*255, g*255, b*255), r, g, b
end

local tip = CreateFrame("GameTooltip", "NDuiDurabilityTooltip")
tip:SetOwner(UIParent, "ANCHOR_NONE")

info.eventList = {
	"UPDATE_INVENTORY_DURABILITY", "PLAYER_ENTERING_WORLD",
}

info.onEvent = function(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end

		local numSlots = getItemDurability()
		if numSlots > 0 then
			self.text:SetText(format(gsub("[color]%d|r%%" , "%[color%]", (gradientColor(floor(localSlots[1][3]*100)/100))), floor(localSlots[1][3]*100)))
		else
			self.text:SetText(I.MyColor..NONE)
		end

	if isLowDurability() and ((lastClick == 0) or (GetTime() - lastClick > 60*30)) then -- only half an hour
		inform:Show()
	else
		inform:Hide()
	end
end

inform.CloseButton:HookScript("OnClick", function()
	--[[if InCombatLockdown() then
		info:UnregisterEvent("UPDATE_INVENTORY_DURABILITY")
		info:RegisterEvent("PLAYER_REGEN_ENABLED")
	end]]
	lastClick = GetTime()
end)

info.onMouseUp = function(self, btn)
	if btn == "RightButton" then
		MaoRUIDB["RepairType"] = mod(MaoRUIDB["RepairType"] + 1, 2)
		self:onEnter()
	else
		ToggleCharacter("PaperDollFrame")
	end
end

local repairlist = {
	[0] = "|cffff5555"..VIDEO_OPTIONS_DISABLED,
	[1] = "|cff55ff55"..VIDEO_OPTIONS_ENABLED,
}

info.onEnter = function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 15)
	GameTooltip:ClearLines()
	GameTooltip:AddDoubleLine(DURABILITY, " ", 0,.6,1, 0,.6,1)
	GameTooltip:AddLine(" ")

	local totalCost = 0
	for i = 1, #localSlots do
		if localSlots[i][3] ~= 1000 then
			local slot = localSlots[i][1]
			local green = localSlots[i][3]*2
			local red = 1 - green
			local slotIcon = "|T"..GetInventoryItemTexture("player", slot)..":13:15:0:0:50:50:4:46:4:46|t " or ""
			GameTooltip:AddDoubleLine(slotIcon..localSlots[i][2], floor(localSlots[i][3]*100).."%", 1,1,1, red+1,green,0)

			totalCost = totalCost + select(3, tip:SetInventoryItem("player", slot))
		end
	end

	if totalCost > 0 then
		GameTooltip:AddLine(" ")
		GameTooltip:AddDoubleLine(repairCostString, module:GetMoneyString(totalCost), .6,.8,1, 1,1,1)
	end

	GameTooltip:AddDoubleLine(" ", I.LineString)
	GameTooltip:AddDoubleLine(" ", U["Auto Repair"]..": "..repairlist[MaoRUIDB["RepairType"]].." ", 1,1,1, .6,.8,1)
	GameTooltip:Show()
end

info.onLeave = M.HideTooltip

-- Auto repair
local isShown

local function autoRepair(override)
	if isShown and not override then return end
	isShown = true

	local myMoney = GetMoney()
	local repairAllCost, canRepair = GetRepairAllCost()

	if canRepair and repairAllCost > 0 then
		if myMoney > repairAllCost then
			RepairAllItems()
			print(format(I.InfoColor.."%s|r%s", U["Repair cost"], module:GetMoneyString(repairAllCost)))
		else
			print(I.InfoColor..U["Repair error"])
		end
	end
end

local function merchantClose()
	isShown = false
	M:UnregisterEvent("MERCHANT_CLOSED", merchantClose)
end

local function merchantShow()
	if IsShiftKeyDown() or MaoRUIDB["RepairType"] == 0 or not CanMerchantRepair() then return end
	autoRepair()
	M:RegisterEvent("MERCHANT_CLOSED", merchantClose)
end
M:RegisterEvent("MERCHANT_SHOW", merchantShow)