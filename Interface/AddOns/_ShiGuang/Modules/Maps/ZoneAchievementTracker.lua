--[[--------------------------------------------------------------------SavedVariables: ZATDB
	Zone Achievement Tracker
	Automatically tracks the achievement for completing quests in your current zone.
	Copyright 2012-2016 Phanx <addons@phanx.net>. All rights reserved.Version: 7.3.5.0
	https://github.com/Phanx/ZoneAchievementTracker
	https://mods.curse.com/addons/wow/zoneachievementtracker
	https://www.wowinterface.com/downloads/info20975-ZoneAchievementTracker.html
----------------------------------------------------------------------]]

local ENABLE_DEBUGGING = false

local AchievementForZone = {
	[16]  = 4896,  -- Arathi Highlands
	[17]  = 4900,  -- Badlands
	[19]  = 4909,  -- Blasted Lands
	[29]  = 4901,  -- Burning Steppes
	[101] = 4930,  -- Desolace
	[23]  = 4892,  -- Eastern Plaguelands
	[182] = 4931,  -- Felwood
	[37]  = 4906,  -- Northern Stranglethorn
	[28]  = 4910,  -- Searing Gorge
	[261] = 4934,  -- Silithus
	[38]  = 4904,  -- Swamp of Sorrows
	[161] = 4935,  -- Tanaris
	[673] = 4905,  -- The Cape of Stranglethorn
	[26]  = 4897,  -- The Hinterlands
	[61]  = 4938,  -- Thousand Needles
	[201] = 4939,  -- Un'Goro Crater
	[22]  = 4893,  -- Western Plaguelands
	[281] = 4940,  -- Winterspring
	-- Outland
	[475] = 1193,  -- Blade's Edge Mountains
	[479] = 1194,  -- Netherstorm
	[473] = 1195,  -- Shadowmoon Valley
	[467] = 1190,  -- Zangarmarsh
	-- Northrend
	[492] = 40,    -- Icecrown
	[493] = 39,    -- Sholazar Basin
	[495] = 38,    -- The Storm Peaks
	[496] = 36,    -- Zul'Drak
	-- Cataclysm
	[640] = 4871,  -- Deepholm
	[606] = 4870,  -- Mount Hyjal
	[720] = 4872,  -- Uldum
	-- Pandaria
	[858] = 6540,  -- Dread Wastes
	[810] = 6539,  -- Townlong Steppes
	[811] = 7315,  -- Vale of Eternal Blossoms
	[807] = 6301,  -- Valley of the Four Winds
	-- Draenor
		-- All faction-specific
	-- Legion
	[1015] = 10763, -- Aszuna
	[1024] = 10059, -- Highmountain
	[1017] = 10790, -- Stormheim
	[1033] = 11124, -- Suramar
	[1018] = 10698, -- Val'sharah
}

local A = {
	[43]  = 4925,  -- Ashenvale [A]
	[42]  = 4928,  -- Darkshore [A]
	[34]  = 4903,  -- Duskwood [A]
	[141] = 4929,  -- Dustwallow Marsh [A]
	[121] = 4932,  -- Feralas [A]
	[35]  = 4899,  -- Loch Modan [A]
	[36]  = 4902,  -- Redridge Mountains [A]
	[607] = 4937,  -- Southern Barrens [A]
	[81]  = 4936,  -- Stonetalon Mountains [A]
	[39]  = 4903,  -- Westfall [A]
	[40]  = 4899,  -- Wetlands [A]
	-- Outland
	[476] = 4926,  -- Bloodmyst Isle [A]
	[465] = 1189,  -- Hellfire Peninsula [A]
	[477] = 1192,  -- Nagrand [A]
	[478] = 1191,  -- Terokkar Forest [A]
	-- Northrend
	[486] = 33,    -- Borean Tundra [A]
	[488] = 35,    -- Dragonblight [A]
	[490] = 37,    -- Grizzly Hills [A]
	[491] = 34,    -- Howling Fjord [A]
	-- Cataclysm
	[700] = 4873,  -- Twilight Highlands [A]
	-- Pandaria
	[857] = 6535,  -- Krasarang Wilds [A]
	[809] = 6537,  -- Kun-Lai Summit [A]
	[806] = 6300,  -- The Jade Forest [A]
	[613] = 4869,  -- Vashj'ir [A]
	-- Draenor
	[949] = 8923, -- Gorgrond
	[950] = 8927, -- Nagrand
	[947] = 8845, -- Shadowmoon Valley
	[948] = 8925, -- Spires of Arak
	[946] = 8920, -- Talador
}

local H = {
	[43]  = 4976,  -- Ashenvale [H]
	[181] = 4927,  -- Azshara [H]
	[141] = 4978,  -- Dustwallow Marsh [H]
	[121] = 4979,  -- Feralas [H]
	[24]  = 4895,  -- Hillsbrad Foothills [H]
	[11]  = 4933,  -- Northern Barrens [H]
	[21]  = 4894,  -- Silverpine Forest [H]
	[607] = 4981,  -- Southern Barrens [H]
	[81]  = 4980,  -- Stonetalon Mountains [H]
	-- Outland
	[463] = 4908,  -- Ghostlands [H]
	[465] = 1271,  -- Hellfire Peninsula [H]
	[477] = 1273,  -- Nagrand [H]
	[478] = 1272,  -- Terokkar Forest [H]
	-- Northrend
	[486] = 1358,  -- Borean Tundra [H]
	[488] = 1359,  -- Dragonblight [H]
	[490] = 1357,  -- Grizzly Hills [H]
	[491] = 1356,  -- Howling Fjord [H]
	-- Cataclysm
	[700] = 5501,  -- Twilight Highlands [H]
	-- Pandaria
	[857] = 6536,  -- Krasarang Wilds [H]
	[809] = 6538,  -- Kun-Lai Summit [H]
	[806] = 6534,  -- The Jade Forest [H]
	[613] = 4982,  -- Vashj'ir [H]
	-- Draenor
	[941] = 8671, -- Frostfire Ridge
	-- [941] = 9529, -- Frostfire Ridge (2)
	[949] = 8924, -- Gorgrond
	[950] = 8928, -- Nagrand
	[948] = 8926, -- Spires of Arak
	[946] = 8919, -- Talador
}

local M = {
	-- Pandaria
	[858] = true,  -- Dread Wastes
	[857] = true,  -- Krasarang Wilds
	[809] = true,  -- Kun-Lai Summit
	[806] = true,  -- The Jade Forest
	[810] = true,  -- Townlong Steppes
	[811] = true,  -- Vale of Eternal Blossoms
	[807] = true,  -- Valley of the Four Winds
	-- Draenor
	[941] = true,  -- Frostfire Ridge
	[949] = true,  -- Gorgrond
	[950] = true,  -- Nagrand
	[947] = true,  -- Shadowmoon Valley
	[948] = true,  -- Spires of Arak
	[946] = true,  -- Talador
	-- Legion
	[1015] = true, -- Aszuna
	[1024] = true, -- Highmountain
	[1017] = true, -- Stormheim
	[1033] = true, -- Suramar
	[1018] = true, -- Val'sharah
}

local PLAYER_FACTION
local ZoneForAchievement

local function init()
	ZATDB = ZATDB or {}

	local factionGroup = UnitFactionGroup("player")

	local temp
	if factionGroup == "Alliance" then
		temp = A
	elseif factionGroup == "Horde" then
		temp = H
	end

	if not temp then
		if ENABLE_DEBUGGING then
			print("|cffff6666ZAT:|r", "Unsupported faction:", factionGroup)
		end
		return
	end

	if ENABLE_DEBUGGING then
		print("|cffff6666ZAT:|r", "Initalizing...")
	end

	PLAYER_FACTION = factionGroup

	for zoneID, achievementID in pairs(AchievementForZone) do
		temp[zoneID] = achievementID
	end

	wipe(AchievementForZone)
	for zoneID, achievementID in pairs(temp) do
		local _, _, name = pcall(GetAchievementInfo, achievementID)
		if not name then
			if ENABLE_DEBUGGING then
				print(achievementID, "is not a valid achievement.")
			end
		elseif select(2, GetCategoryInfo(GetAchievementCategory(achievementID))) ~= 96 then
			if ENABLE_DEBUGGING then
				print(achievementID, "is not a quest achievement.")
			end
		else
			AchievementForZone[zoneID] = achievementID
		end
	end

	ZoneForAchievement = {}
	for zoneID, achievementID in pairs(AchievementForZone) do
		ZoneForAchievement[achievementID] = zoneID
	end

	A, H, temp = nil, nil, nil
	if ENABLE_DEBUGGING then
		print("|cffff6666ZAT:|r", "Done.")
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:SetScript("OnEvent", function(self, event)
	if ENABLE_DEBUGGING then
		print("|cffff6666ZAT:|r", "OnEvent", event)
	end
	if not ZoneForAchievement then
		init()
	end

	local zoneID = WorldMapFrame:GetMapID()
	if not zoneID then return end

	local achievementID, achievementName, completed, _ = AchievementForZone[zoneID]
	if type(achievementID) == "number" then
		_, achievementName, _, _, _, _, _, _, _, _, _, _, completed = GetAchievementInfo(achievementID)
	elseif achievementID then
		print("|cffff6666[ERROR] Zone Achievement Tracker:|r")
		print(string.format(">> %s achievement for %s zone %d %s.", achievementID, PLAYER_FACTION, zoneID, GetRealZoneText()))
		print("Please report this error so it can be fixed!")
		achievementID = nil
	end

	if ENABLE_DEBUGGING then
		print("|cffff6666ZAT:|r", zoneID, GetRealZoneText(), achievementID, achievementName, completed)
	end

	if M[zoneID] and ZATDB.noMoP then
		achievementID = nil
		if ENABLE_DEBUGGING then
			print("|cffff6666ZAT:|r", "noMoP")
		end
	end

	local tracked
	for _, id in ipairs({ GetTrackedAchievements() }) do
		if id == achievementID and not completed then
			if ENABLE_DEBUGGING then
				print("|cffff6666ZAT:|r", "Already tracking", achievementID, achievementName)
			end
			tracked = true
		elseif ZoneForAchievement[id] then
			if ENABLE_DEBUGGING then
				local _, name = GetAchievementInfo(id)
				print("|cffff6666ZAT:|r", "RemoveTrackedAchievement", id, name)
			end
			RemoveTrackedAchievement(id)
		end
	end

	if achievementID and not completed and not tracked then
		if ENABLE_DEBUGGING then
			print("|cffff6666ZAT:|r", "AddTrackedAchievement", achievementID, achievementName)
		end
		AddTrackedAchievement(achievementID)
	end
end)

if ENABLE_DEBUGGING then
	f.Ach4Zone = AchievementForZone
	f.Zone4Ach = ZoneForAchievement
	ZAT = f
end

SLASH_ZONEACHIEVEMENTTRACKER1 = "/zat"
SlashCmdList.ZONEACHIEVEMENTTRACKER = function()
	ZATDB.noMoP = not ZATDB.noMoP

	local LOCALE = GetLocale()
	if LOCALE == "deDE" then
		DEFAULT_CHAT_FRAME:AddMessage(format("|cffffcc00Zone Achievement Tracker:|r Zonen mit mehreren Geschichtsstränge %s|r.", ZATDB.noMoP and "|cff7f7f7fdeaktiviert" or "|cff7fff7faktiviert"))
	elseif LOCALE == "esES" or LOCALE == "esMX" then
		DEFAULT_CHAT_FRAME:AddMessage(format("|cffffcc00Zone Achievement Tracker:|r Zonas con múltiples tramas %s|r.", ZATDB.noMoP and "|cff7f7f7fdesactivada" or "|cff7fff7factivada"))
	elseif LOCALE == "frFR" then
		DEFAULT_CHAT_FRAME:AddMessage(format("|cffffcc00Zone Achievement Tracker:|r Zones avec des suites de quêtes multiples %s|r.", ZATDB.noMoP and "|cff7f7f7fdésactivé" or "|cff7fff7factivé"))
	elseif LOCALE == "itIT" then
		DEFAULT_CHAT_FRAME:AddMessage(format("|cffffcc00Zone Achievement Tracker:|r Zone con gruppi di missioni multipli %s|r.", ZATDB.noMoP and "|cff7f7f7fdisattivata" or "|cff7fff7fattivata"))
	elseif LOCALE == "ptBR" then
		DEFAULT_CHAT_FRAME:AddMessage(format("|cffffcc00Zone Achievement Tracker:|r Zonas com múltiplos histórias %s|r.", ZATDB.noMoP and "|cff7f7f7fdesativada" or "|cff7fff7fativada"))
	elseif LOCALE == "ruRU" then
		DEFAULT_CHAT_FRAME:AddMessage(format("|cffffcc00Zone Achievement Tracker:|r Зоны с несколько этапов развития сюжета %s|r.", ZATDB.noMoP and "|cff7f7f7fотключена" or "|cff7fff7fвключена"))
	else
		DEFAULT_CHAT_FRAME:AddMessage(format("|cffffcc00Zone Achievement Tracker:|r Zones with multiple criteria %s|r.", ZATDB.noMoP and "|cff7f7f7fdisabled" or "|cff7fff7fenabled"))
	end

	f:GetScript("OnEvent")(f, "SlashCmdList")
end
