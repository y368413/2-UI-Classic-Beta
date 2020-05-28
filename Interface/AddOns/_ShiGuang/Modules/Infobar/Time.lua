local _, ns = ...
local M, R, U, I = unpack(ns)
if not R.Infobar.Time then return end

local module = M:GetModule("Infobar")
local info = module:RegisterInfobar("Time", R.Infobar.TimePos)
local date = date
info.text:SetFont(unpack(R.Infobar.TimeFonts))
local format = string.format
local tonumber = tonumber
local TIMEMANAGER_TICKER_24HOUR, TIMEMANAGER_TICKER_12HOUR = TIMEMANAGER_TICKER_24HOUR, TIMEMANAGER_TICKER_12HOUR
local FULLDATE, CALENDAR_WEEKDAY_NAMES, CALENDAR_FULLDATE_MONTH_NAMES = FULLDATE, CALENDAR_WEEKDAY_NAMES, CALENDAR_FULLDATE_MONTH_NAMES
local DUNGEONS, RAID_INFO, DUNGEON_DIFFICULTY3 = DUNGEONS, RAID_INFO, DUNGEON_DIFFICULTY3
local RequestRaidInfo = RequestRaidInfo
local GetCVarBool, GetGameTime, GameTime_GetLocalTime, GameTime_GetGameTime, SecondsToTime = GetCVarBool, GetGameTime, GameTime_GetLocalTime, GameTime_GetGameTime, SecondsToTime
local GetNumSavedInstances, GetSavedInstanceInfo = GetNumSavedInstances, GetSavedInstanceInfo

local function updateTimerFormat(color, hour, minute)
	if GetCVarBool("timeMgrUseMilitaryTime") then
		return format(color..TIMEMANAGER_TICKER_24HOUR, hour, minute)
	else
		local timerUnit = I.MyColor..(hour < 12 and "|cffffffff^|r" or "|cffffffff.|")
		if hour > 12 then hour = hour - 12 end
		return format(color..TIMEMANAGER_TICKER_12HOUR..timerUnit, hour, minute)
	end
end

info.onUpdate = function(self, elapsed)
	self.timer = (self.timer or 3) + elapsed
	if self.timer > 5 then
		local color = ""

		local hour, minute
		if GetCVarBool("timeMgrUseLocalTime") then
			hour, minute = tonumber(date("%H")), tonumber(date("%M"))
		else
			hour, minute = GetGameTime()
		end
		self.text:SetText(updateTimerFormat(color, hour, minute))

		self.timer = 0
	end
end

local title
local function addTitle(text)
	if not title then
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(text..":", .6,.8,1)
		title = true
	end
end

info.onEnter = function(self)
	RequestRaidInfo()

	local r,g,b
	GameTooltip:SetOwner(self, "ANCHOR_TOP", -20, 6)
	GameTooltip:ClearLines()
	local today = C_DateAndTime.GetTodaysDate()
	local w, m, d, y = today.weekDay, today.month, today.day, today.year
	GameTooltip:AddLine(format(FULLDATE, CALENDAR_WEEKDAY_NAMES[w], CALENDAR_FULLDATE_MONTH_NAMES[m], d, y), 0,.6,1)
	GameTooltip:AddLine(" ")
	GameTooltip:AddDoubleLine(TIMEMANAGER_TOOLTIP_LOCALTIME, GameTime_GetLocalTime(true), .6,.8,1 ,1,1,1)
	GameTooltip:AddDoubleLine(TIMEMANAGER_TOOLTIP_REALMTIME, GameTime_GetGameTime(true), .6,.8,1 ,1,1,1)

	-- Mythic Dungeons
	title = false
	for i = 1, GetNumSavedInstances() do
		local name, _, reset, diff, locked, extended = GetSavedInstanceInfo(i)
		if diff == 23 and (locked or extended) then
			addTitle(DUNGEON_DIFFICULTY3..DUNGEONS)
			if extended then r,g,b = .3,1,.3 else r,g,b = 1,1,1 end
			GameTooltip:AddDoubleLine(name, SecondsToTime(reset, true, nil, 3), 1,1,1, r,g,b)
		end
	end

	-- Raids
	title = false
	for i = 1, GetNumSavedInstances() do
		local name, _, reset, _, locked, extended, _, isRaid, _, diffName = GetSavedInstanceInfo(i)
		if isRaid and (locked or extended) then
			addTitle(RAID_INFO)
			if extended then r,g,b = .3,1,.3 else r,g,b = 1,1,1 end
			GameTooltip:AddDoubleLine(name.." - "..diffName, SecondsToTime(reset, true, nil, 3), 1,1,1, r,g,b)
		end
	end

	-- Help Info
	GameTooltip:AddDoubleLine(" ", I.LineString)
	GameTooltip:AddDoubleLine(" ",U["Toggle Clock"],1,1,1,.6,.8,1)
	GameTooltip:Show()
end

info.onLeave = M.HideTooltip

info.onMouseUp = function(_, btn)
		ToggleFrame(TimeManagerFrame)
end