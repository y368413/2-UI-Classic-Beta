local _, ns = ...
local M, R, U, I = unpack(ns)

------------------------------ yClassColors, by yleaf-- NDui MOD----------------------------
local format, ipairs, tinsert = string.format, ipairs, table.insert

-- Colors
local function classColor(class, showRGB)
	local color = I.ClassColors[I.ClassList[class] or class]
	if not color then color = I.ClassColors["PRIEST"] end

	if showRGB then
		return color.r, color.g, color.b
	else
		return "|c"..color.colorStr
	end
end

local function diffColor(level)
	return M.HexRGB(GetQuestDifficultyColor(level))
end

local rankColor = {
	1, 0, 0,
	1, 1, 0,
	0, 1, 0
}

local repColor = {
	1, 0, 0,
	1, 1, 0,
	0, 1, 0,
	0, 1, 1,
	0, 0, 1,
}

local function colorsAndPercent(a, b, ...)
	if(a <= 0 or b == 0) then
		return nil, ...
	elseif(a >= b) then
		return nil, select(-3, ...)
	end

	local num = select('#', ...) / 3
	local segment, relperc = math.modf((a / b) * (num - 1))
	return
end
	
local function RGBColorGradient(...)
	local relperc, r1, g1, b1, r2, g2, b2 = colorsAndPercent(...)
	if(relperc) then
		return r1 + (r2 - r1) * relperc, g1 + (g2 - g1) * relperc, b1 + (b2 - b1) * relperc
	else
		return r1, g1, b1
	end
end

local function smoothColor(cur, max, color)
	local r, g, b = RGBColorGradient(cur, max, unpack(color))
	return M.HexRGB(r, g, b)
end

-- Guild
hooksecurefunc("GuildStatus_Update", function()
	local guildIndex
	local playerArea = GetRealZoneText()
	local guildOffset = FauxScrollFrame_GetOffset(GuildListScrollFrame)
	if FriendsFrame.playerStatusFrame then
		for i = 1, GUILDMEMBERS_TO_DISPLAY, 1 do
			guildIndex = guildOffset + i
			local fullName, _, _, level, class, zone, _, _, online = GetGuildRosterInfo(guildIndex)
			if fullName and online then
				local r, g, b = classColor(class, true)
				_G["GuildFrameButton"..i.."Name"]:SetTextColor(r, g, b)
				if zone == playerArea then
					_G["GuildFrameButton"..i.."Zone"]:SetTextColor(0, 1, 0)
				end
				local color = GetQuestDifficultyColor(level)
				_G["GuildFrameButton"..i.."Level"]:SetTextColor(color.r, color.g, color.b)
				_G["GuildFrameButton"..i.."Class"]:SetTextColor(r, g, b)
			end
		end
	else
		for i = 1, GUILDMEMBERS_TO_DISPLAY, 1 do
			guildIndex = guildOffset + i
			local fullName, _, rankIndex, _, class, zone, _, _, online = GetGuildRosterInfo(guildIndex)
			if fullName and online then
				local r, g, b = classColor(class, true)
				_G["GuildFrameGuildStatusButton"..i.."Name"]:SetTextColor(r, g, b)
				local lr, lg, lb = oUF:RGBColorGradient(rankIndex, 10, unpack(rankColor))
				if lr then
					_G["GuildFrameGuildStatusButton"..i.."Rank"]:SetTextColor(lr, lg, lb)
				end
			end
		end
	end
end)

-- Whoframe
local columnTable = {}
local function updateWhoList()
	local whoOffset = FauxScrollFrame_GetOffset(WhoListScrollFrame)
	local playerZone = GetRealZoneText()
	local playerGuild = GetGuildInfo("player")
	local playerRace = UnitRace("player")

	for i = 1, WHOS_TO_DISPLAY, 1 do
		local index = whoOffset + i
		local nameText = _G["WhoFrameButton"..i.."Name"]
		local levelText = _G["WhoFrameButton"..i.."Level"]
		local variableText = _G["WhoFrameButton"..i.."Variable"]
		local info = C_FriendList.GetWhoInfo(index)
		if info then
			local guild, level, race, zone, class = info.fullGuildName, info.level, info.raceStr, info.area, info.filename
			if zone == playerZone then zone = "|cff00ff00"..zone end
			if guild == playerGuild then guild = "|cff00ff00"..guild end
			if race == playerRace then race = "|cff00ff00"..race end

			wipe(columnTable)
			tinsert(columnTable, zone)
			tinsert(columnTable, guild)
			tinsert(columnTable, race)

			nameText:SetTextColor(classColor(class, true))
			levelText:SetText(diffColor(level)..level)
			variableText:SetText(columnTable[UIDropDownMenu_GetSelectedID(WhoFrameDropDown)])
		end
	end
end
hooksecurefunc("WhoList_Update", updateWhoList)