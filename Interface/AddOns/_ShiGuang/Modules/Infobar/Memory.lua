﻿local _, ns = ...
local M, R, U, I = unpack(ns)
if not R.Infobar.Memory then return end

local module = M:GetModule("Infobar")
local info = module:RegisterInfobar("Memory", R.Infobar.MemoryPos)
local select, gcinfo, collectgarbage = select, gcinfo, collectgarbage
local format, min, sort, wipe = string.format, math.min, table.sort, table.wipe
local ADDONS, GetNumAddOns, GetAddOnInfo = ADDONS, GetNumAddOns, GetAddOnInfo
local IsShiftKeyDown, IsAddOnLoaded = IsShiftKeyDown, IsAddOnLoaded
local UpdateAddOnMemoryUsage, GetAddOnMemoryUsage = UpdateAddOnMemoryUsage, GetAddOnMemoryUsage

local function formatMemory(value)
	if value > 1024 then
		return format("%.1fm", value / 1024)
	else
		return format("%.0fk", value)
	end
end

local function memoryColor(value, times)
	if not times then times = 1 end

	if value <= 2048*times then
		return 0, 1, 0
	elseif value <= 4096*times then
		return .75, 1, 0
	elseif value <= 8192*times then
		return 1, 1, 0
	elseif value <= 10240*times then
		return 1, .75, 0
	elseif value <= 16384*times then
		return 1, .5, 0
	else
		return 1, .1, 0
	end
end

local memoryTable, totalMemory, entered = {}, 0

local function updateMemoryTable()
	local numAddons = GetNumAddOns()
	if numAddons == #memoryTable then return end

	wipe(memoryTable)
	for i = 1, numAddons do
		memoryTable[i] = {i, select(2, GetAddOnInfo(i)), 0}
	end
end

local function sortMemory(a, b)
	if a and b then
		return a[3] > b[3]
	end
end

local function updateMemory()
	UpdateAddOnMemoryUsage()

	local total = 0
	for i = 1, #memoryTable do
		local value = memoryTable[i]
		value[3] = GetAddOnMemoryUsage(value[1])
		total = total + value[3]
	end
	sort(memoryTable, sortMemory)

	return total
end

info.onUpdate = function(self, elapsed)
	self.timer = (self.timer or 3) + elapsed
	if self.timer > 5 then
		updateMemoryTable()
		totalMemory = updateMemory()
		self.text:SetText(M.HexRGB(memoryColor(totalMemory, 10))..format("%.1fm", totalMemory/1024))
		if entered then self:onEnter() end

		self.timer = 0
	end
end

info.onMouseUp = function(self, btn)
		local before = gcinfo()
		collectgarbage("collect")
		print(format("|cff66C6FF%s:|r %s", U["Collect Memory"], formatMemory(before - gcinfo())))
		updateMemory()
		self:onEnter()
end

info.onEnter = function(self)
	entered = true
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM", 0, -15)
	GameTooltip:ClearLines()
	GameTooltip:AddDoubleLine(ADDONS, formatMemory(totalMemory), 0,.6,1, .6,.8,1)
	GameTooltip:AddLine(" ")

	local maxAddOns = R.Infobar.MaxAddOns
	local isShiftKeyDown = IsShiftKeyDown()
	local maxShown = isShiftKeyDown and #memoryTable or min(maxAddOns, #memoryTable)
	local numEnabled = 0
	for i = 1, #memoryTable do
		local value = memoryTable[i]
		if value and IsAddOnLoaded(value[1]) then
			numEnabled = numEnabled + 1
			if numEnabled <= maxShown then
				GameTooltip:AddDoubleLine(value[2], formatMemory(value[3]), 1,1,1, memoryColor(value[3], 5))
			end
		end
	end

	if not isShiftKeyDown and (numEnabled > maxAddOns) then
		local hiddenMemory = 0
		for i = (maxAddOns + 1), numEnabled do
			hiddenMemory = hiddenMemory + memoryTable[i][3]
		end
		GameTooltip:AddDoubleLine(format("%d %s (%s)", numEnabled - maxAddOns, U["Hidden"], U["Hold Shift"]), formatMemory(hiddenMemory), .6,.8,1, .6,.8,1)
	end

	GameTooltip:AddLine(" ")
	GameTooltip:AddDoubleLine(U["Default UI Memory Usage:"], formatMemory(gcinfo() - totalMemory), .6,.8,1, 1,1,1)
	GameTooltip:AddDoubleLine(U["Total Memory Usage:"], formatMemory(collectgarbage("count")), .6,.8,1, 1,1,1)
	--GameTooltip:AddDoubleLine(" ", I.LineString)
	--GameTooltip:AddDoubleLine(" ", U["Collect Memory"].." ", 1,1,1, .6,.8,1)
	GameTooltip:Show()

	self:RegisterEvent("MODIFIER_STATE_CHANGED")
end

info.onLeave = function(self)
	entered = false
	GameTooltip:Hide()
	self:UnregisterEvent("MODIFIER_STATE_CHANGED")
end

info.eventList = {
	"PLAYER_ENTERING_WORLD"
}

info.onEvent = function(self, event, arg1)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	if event == "MODIFIER_STATE_CHANGED" and arg1 == "LSHIFT" then
		self:onEnter()
	end
end
