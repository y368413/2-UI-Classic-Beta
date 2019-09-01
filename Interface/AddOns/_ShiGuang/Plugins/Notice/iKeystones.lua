--## Author: Ironi   ## Version: 1.800

local iKeystones = CreateFrame('Frame');
iKeystones:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
iKeystones:RegisterEvent('ADDON_LOADED')
iKeystones:RegisterEvent('CHALLENGE_MODE_MAPS_UPDATE')
iKeystones:RegisterEvent('PLAYER_LOGIN')
iKeystones:RegisterEvent('CHALLENGE_MODE_KEYSTONE_RECEPTABLE_OPEN')
iKeystones:RegisterEvent('MYTHIC_PLUS_CURRENT_AFFIX_UPDATE')
iKeystones:RegisterEvent('MYTHIC_PLUS_NEW_WEEKLY_RECORD')
iKeystones:RegisterEvent('ITEM_PUSH')
iKeystones:RegisterEvent('BAG_UPDATE')
iKeystones:RegisterEvent('CRITERIA_UPDATE')
iKeystones:RegisterEvent('QUEST_LOG_UPDATE')
iKeystones:RegisterEvent('ENCOUNTER_LOOT_RECEIVED')
iKeystones:RegisterEvent('CHAT_MSG_PARTY')
iKeystones:RegisterEvent('CHAT_MSG_PARTY_LEADER')


local iKS = {}
iKS.currentMax = 0
iKS.frames = {}
local shouldBeCorrectInfoForWeekly = false
local player = UnitGUID('player')
local unitName = UnitName('player')
local playerFaction = UnitFactionGroup('player')
--[[
iKS.apFromDungeons = {
	-- Fast
	[244] = 420, -- Atal'Dazar
	[245] = 420, -- Freehold
	[251] = 420, -- The Underrot

	-- Medium
	[246] = 540, -- Tol Dagor
	[247] = 540, -- The Motherlode
	[248] = 540, -- Waycrest Manor
	[250] = 540, -- Temple of Sethraliss
	[353] = 540, -- Siege of Boralus

	--Slow
	[249] = 660, -- King's Rest
	[252] = 660, -- Shrine of the Storm
}
--]]
iKS.keystonesToMapIDs = {
	[197] = 1456, -- Eye of Azhara
	[198] = 1466, -- Darkhearth Thicket
	[199] = 1501, -- Blackrook Hold
	[200] = 1477, -- Halls of Valor
	[206] = 1458, -- Neltharion's Lair
	[207] = 1493, -- Vault of the Wardens
	[208] = 1492, -- Maw of Souls
	[209] = 1516, -- The Arcway
	[210] = 1571, -- Court of Stars
	[227] = 1651, -- Return to Karazhan: Lower
	[233] = 1677, -- Cathedral of Eternal Night
	[234] = 1651, -- Return to Karazhan: Upper
	[239] = 1753, -- The Seat of the Triumvirate

	[244] = 1763, -- Atal'Dazar
	[245] = 1754, -- Freehold
	[246] = 1771, -- Tol Dagor
	[247] = 1594, -- The Motherlode
	[248] = 1862, -- Waycrest Manor
	[249] = 1762, -- King's Rest
	[250] = 1877, -- Temple of Sethraliss
	[251] = 1841, -- The Underrot
	[252] = 1864, -- Shrine of the Storm
	[353] = 1822, -- Siege of Boralus
}
iKS.IsleQuests = {
	['Horde'] = 53435,
	['Alliance'] = 53436,
}
iKS.currentAffixes = {0,0,0,0}
local sortedAffixes = {
	[10] = 1, --Fortified
	[9] = 1, --Tyrannical

	[7] = 2, --Bolstering
	[6] = 2, --Raging
	[8] = 2, --Sanguine
	[5] = 2, --Teeming
	[11] = 2, --Bursting

	[4] = 3, --Necrotic
	[2] = 3, --Skittish
	[3] = 3, --Volcanic
	[13] = 3, --Explosive
	[14] = 3, --Quaking
	[12] = 3, --Grievous

	--[15] = ?, --Relentless
	[16] = 4, --Infested
	[117] = 4, --Reaping
	[119] = 4, -- Beguiling
}

iKS.affixCycles = {
	{9,6,3}, -- Raging, Volcanic, Tyrannical
	{10,5,13}, -- Teeming, Explosive, Fortified
	{9,7,12}, -- Bolstering, Grievous, Tyrannical
	{10,8,4}, -- Sanguine, Necrotic, Fortified
	{9,11,2}, -- Bursting, Skittish, Tyrannical
	{10,5,14}, -- Teeming, Quaking, Fortified
	{9,6,4}, -- Raging, Necrotic, Tyrannical
	{10,7,2}, -- Bolstering, Skittish, Fortified
	{9,5,3}, -- Teeming, Volcanic, Tyrannical
	{10,8,12}, -- Sanguine, Grievous, Fortified
	{9,7,13}, -- Bolstering, Explosive, Tyrannical
	{10,3,14}, -- Bursting, Volcanic, Fortified
}
--C_MythicPlus.GetLastWeeklyBestInformation();
--[[
	2 = 1000
	3 = 1050
	4 = 1100
	5 = 1150
	6 = 1200,
	7 = 1250,
	8 = 1300,
	9 = 1350,
	10 = 1400,
]]
local function spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
	-- otherwise just sort the keys
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end
function iKS:getAP(level, map, current, onlyNumber, forSummary)
	if level and map then
		--[[
		local dif = iKS.apFromDungeons.dif[map] or 2 -- default to normal
		if level >= 15 then
			ap = (iKS.apFromDungeons[dif].m+(level-15)*iKS.apFromDungeons[dif].b)
		elseif level >= 10 then
			ap = (iKS.apFromDungeons[dif].c+(level-10)*iKS.apFromDungeons[dif].b)
		elseif level >= 7 then
			ap = iKS.apFromDungeons[dif].h
		elseif level >= 4 then
			ap = iKS.apFromDungeons[dif].a
		else
			ap = iKS.apFromDungeons[dif].p
		end
		if onlyNumber then
			return ap
		else
			return string.format('%.2f', ap)
		end
		--]]
		return 0
	elseif level then
		if level > 0 then
			return 3000 + (level-2)*75
		else
			return forSummary and '-' or 0
		end
	else
		if onlyNumber then
			return 0
		else
			return '-'
		end
	end
end
function iKS:getResiduum(level, numberOnly, forSummary)
	if not level or level == 0 then
		return forSummary and "-" or 0
	end
	if level <= 10 then
		if current then return 0 end
		return numberOnly and 17e3 or "17k"
	elseif level <= 20 then
		local value = 17e3 + (level-10)*900
		return numberOnly and value or string.format("%.1fk", value/1e3)
	else -- assume it will grow 650 per level
		local value = 26e3 + (level-20)*650
		return numberOnly and value or string.format("%.2fk", value/1e3)
	end
end
function iKS:weeklyReset()
	for guid,data in pairs(iKeystonesDB) do
		if iKeystonesDB[guid].maxCompleted and iKeystonesDB[guid].maxCompleted > 0 then
			iKeystonesDB[guid].canLoot = true
		end
		if iKeystonesDB[guid].isle and iKeystonesDB[guid].isle.done then
			iKeystonesDB[guid].isle = {
				progress = 0,
				done = false,
			}
		end
		iKeystonesDB[guid].key = {}
		iKeystonesDB[guid].maxCompleted = 0
	end

	iKS:scanInventory()
end
function iKS:createPlayer()
	if player and not iKeystonesDB[player] then
		local isleProgress, isleMax = select(4, GetQuestObjectiveInfo(iKS.IsleQuests[playerFaction], 1, false))
		local isleDone = IsQuestFlaggedCompleted(iKS.IsleQuests[playerFaction])
		if UnitLevel('player') >= 120 and not iKeystonesConfig.ignoreList[player] then
			iKeystonesDB[player] = {
				name = UnitName('player'),
				server = GetRealmName(),
				class = select(2, UnitClass('player')),
				maxCompleted = 0,
				key = {},
				canLoot = false,
				faction = UnitFactionGroup('player'),
				isle = {
					progress = string.format("%0.f", isleProgress/isleMax*100),
					done = isleDone,
				},
			}
			return true
		else
			return false
		end
	elseif player and UnitLevel('player') < 120 and iKeystonesDB[player] then
		iKeystonesDB[player] = nil
		return false
	elseif player and iKeystonesDB[player] then
		iKeystonesDB[player].name = UnitName('player') -- fix for name changing
		iKeystonesDB[player].faction = UnitFactionGroup('player') -- faction change (tbh i think guid would change) and update old DB
		if not iKeystonesDB[player].isle then
			local isleProgress, isleMax = select(4, GetQuestObjectiveInfo(iKS.IsleQuests[playerFaction], 1, false))
			local isleDone = IsQuestFlaggedCompleted(iKS.IsleQuests[playerFaction])
			iKeystonesDB[player].isle = {
				progress = string.format("%0.f", isleProgress/isleMax*100),
				done = isleDone,
			}
		end
		return true
	else
		return false
	end
end
local validDungeons
local function IsValidDungeon(dungeonID)
	dungeonID = tonumber(dungeonID)
	if not dungeonID then return end
	if not validDungeons then
		validDungeons = {}
		C_MythicPlus.RequestMapInfo()
		local t = C_ChallengeMode.GetMapTable()
		for _,v in pairs(t) do
			validDungeons[v] = true
		end
	end
	return validDungeons[dungeonID]
end
function iKS:scanCharacterMaps()
	if not iKS:createPlayer() then return end
	local maps = C_ChallengeMode.GetMapTable()
	local maxCompleted = 0
	for _, mapID in pairs(maps) do
		local _, level, _, affixes, members = C_MythicPlus.GetWeeklyBestForMap(mapID)
		if members then
			for _,member in pairs(members) do -- Avoid leaking from another char (wtf??, how is this even possible)
				if member.name == unitName then
					if level and level > maxCompleted then
						maxCompleted = level
					end
					break;
				end
			end
		end
	end
	if iKeystonesDB[player].maxCompleted and iKeystonesDB[player].maxCompleted < maxCompleted then
		iKeystonesDB[player].maxCompleted = maxCompleted
	end
end
function iKS:scanInventory(requestingSlots, requestingItemLink)
	if not iKS:createPlayer() then return end
	local _map = C_MythicPlus.GetOwnedKeystoneChallengeMapID()
	local _level = C_MythicPlus.GetOwnedKeystoneLevel()
	if not _map or not _level then return end
	if requestingSlots or requestingItemLink then
		for bagID = 0, 4 do
			for invID = 1, GetContainerNumSlots(bagID) do
				local itemID = GetContainerItemID(bagID, invID)
				if itemID and itemID == 158923 then
					if requestingSlots then
						return bagID, invID
					end
					return GetContainerItemLink(bagID, invID)
				end
			end
		end
	end
	iKeystonesDB[player].key = {
		['map'] = _map,
		['level'] = _level,
	}
	if (iKS.keyLevel and iKS.keyLevel < _level) or not iKS.keyLevel then
		local itemLink = iKS:getKeystoneLink(_level, _map)
		print(' -------- ' .. itemLink .. ' -------- ')
	end
	iKS.keyLevel = _level
	iKS.mapID = _map
end
function iKS:getItemColor(level)
	if level < 4 then	-- Epic
		return '|cffa335ee'
	elseif level < 7 then	-- Green
		return '|cff3fbf3f'
	elseif level < 10 then	-- Yellow
		return '|cffffd100'
	elseif level < 15 then	-- orange
		return '|cffff7f3f'
	else -- Red
		return '|cffff1919'
	end
end
function iKS:getZoneInfo(mapID, zone)
	local name, arg2, timeLimit = C_ChallengeMode.GetMapUIInfo(mapID)
	if zone then
		return iKS.keystonesToMapIDs[mapID]
	else
		return name
	end
end
function iKS:getKeystoneLink(keyLevel, map)
	return string.format('%s|Hkeystone:%d:%d:%d:%d:%d:%d|h[%s (%s)]|h|r', iKS:getItemColor(keyLevel), map, keyLevel, (keyLevel >= 4 and iKS.currentAffixes[2] or 0), (keyLevel >= 7 and iKS.currentAffixes[3] or 0), iKS.currentAffixes[1],((keyLevel >= 10 and iKS.currentAffixes[4]) and iKS.currentAffixes[4] or 0), iKS:getZoneInfo(map), keyLevel)
end
function iKS:printKeystones()
	local allCharacters = {}
	for guid,data in pairs(iKeystonesDB) do
		local itemLink = ''
		if data.key.map then
			itemLink = iKS:getKeystoneLink(data.key.level,data.key.map)
		else
			itemLink = UNKNOWN
		end
		local str = ''
		if data.server == GetRealmName() then
			str = string.format('|c%s%s\124r: %s M:%s', RAID_CLASS_COLORS[data.class].colorStr, data.name, itemLink, (data.maxCompleted >= iKS.currentMax and '|cff00ff00' .. data.maxCompleted) or data.maxCompleted)
		else
			str = string.format('|c%s%s-%s\124r: %s M:%s', RAID_CLASS_COLORS[data.class].colorStr, data.name, data.server,itemLink,(data.maxCompleted >= iKS.currentMax and '|cff00ff00' .. data.maxCompleted) or data.maxCompleted)
		end
		if data.maxCompleted > 0 then
			local ilvl = C_MythicPlus.GetRewardLevelForDifficultyLevel(data.maxCompleted)
			str = str.. string.format('|r (%d) AP: %s', ilvl, iKS:getAP(data.maxCompleted))
		end
		print(str)
	end
end
function iKS:shouldReportKey(KeyLevel, exactLevel, minLevel, maxLevel)
	if not KeyLevel then return false end
	if not exactLevel and not minLevel and not maxLevel then return true end
	if exactLevel then if KeyLevel == exactLevel then return true else return end end
	if minLevel then if KeyLevel >= minLevel and (not maxLevel or (maxLevel and KeyLevel <= maxLevel)) then return true else return end end
end
function iKS:PasteKeysToChat(all,channel, exactLevel, minLevel, maxLevel, requestingWeekly)
	if all then -- All keys for this faction
		local i = 0
		local totalCounter = 0
		local str = ''
		local faction = UnitFactionGroup('player')
		local msgs = {}
		for guid,data in pairs(iKeystonesDB) do
			if i == 3 then
				SendChatMessage(str, channel)
				str = ''
				i = 0
			end
			if data.faction == faction then
				--if not level or (level and data.key.level and data.key.level >= level) then
				if not requestingWeekly or (requestingWeekly and data.maxCompleted < iKS.currentMax) then
					if iKS:shouldReportKey(data.key.level, exactLevel, minLevel, maxLevel) then
						local itemLink = ''
						if data.key.map then
							if i > 0 then
								str = str .. ' - '
							end
							itemLink = string.format('%s (%s)', iKS:getZoneInfo(data.key.map), data.key.level)
							str = str..string.format('%s: %s', data.name, itemLink)
							i = i + 1
							totalCounter = totalCounter + 1
						end
					end
				end
			end
		end
		if totalCounter > 0 then
			if i > 0 then
				SendChatMessage(str, channel)
			end
		elseif exactLevel and not requestingWeekly then
			SendChatMessage("No keystones at " .. exactLevel..".", channel)
		elseif minLevel and not maxLevel and not requestingWeekly  then
			SendChatMessage("No keystones at or above " .. minLevel..".", channel)
		elseif minLevel and maxLevel and not requestingWeekly  then
			SendChatMessage("No keystones between "..minLevel.." and "..maxLevel..".", channel)
		elseif not requestingWeekly then
			SendChatMessage("No keystones.", channel)
		end
	else -- Only this char
		local data = iKeystonesDB[player]
		if data then
			if data.key.map then
				local itemLink = iKS:scanInventory(false, true)
				if itemLink then -- nil check
					SendChatMessage(itemLink, channel)
				else
					SendChatMessage(UNKNOWN, channel)
				end
			else
				SendChatMessage("No keystones.", channel)
			end
		else
			SendChatMessage("No keystones.", channel)
		end
	end
end
function iKS:help()
	print([[iKeystones:
/iks reset - reset all characters
/iks start (s) - start dungeon
/iks next (n) - print affixes for next reset
/iks ignore (i) - ignore this character
/iks whitelist (w) - enable tracking for this character (remove ignore)
/iks help (h) - show this help
/iks delete (d) characterName serverName - delete specific character]])
end
function iKeystones:PLAYER_LOGIN()
	player = UnitGUID('player')
	C_MythicPlus.RequestCurrentAffixes()
	C_MythicPlus.RequestMapInfo()
  C_MythicPlus.RequestRewards()
	--[[GarrisonLandingPageMinimapButton:HookScript('OnEnter', function()
		if IsShiftKeyDown() then
			iKS:createMainWindow()
		else
			GameTooltip:AddLine('Shift-Hover to show iKeystones')
		end
		GameTooltip:Show() -- force refresh to resize
	end)
	GarrisonLandingPageMinimapButton:HookScript('OnLeave', function()
		if iKS.anchor then
			iKS.anchor:Hide()
		end
	end)]]
end
function iKeystones:ADDON_LOADED(addonName)
	if addonName == '_ShiGuang' then
		iKeystonesDB = iKeystonesDB or {}
		iKeystonesConfig = iKeystonesConfig or {}
		if not iKeystonesConfig.ignoreList then
			iKeystonesConfig.ignoreList = {}
		end
		if not iKeystonesConfig.affstring then --remove old stuff and reset chars
			iKeystonesDB = {}
			iKeystonesConfig.aff = nil
			iKeystonesConfig.affstring = ""
		end
		if iKeystonesConfig.ak then -- remove old ak stuff from wtf file
			iKeystonesConfig.ak = nil
		end
		LoadAddOn("Blizzard_ChallengesUI")
	elseif addonName == 'Blizzard_ChallengesUI' then
		iKeystones:MYTHIC_PLUS_CURRENT_AFFIX_UPDATE()
	end
end
local delayLoadingTimer
function iKeystones:MYTHIC_PLUS_CURRENT_AFFIX_UPDATE()
	local temp = C_MythicPlus.GetCurrentAffixes()
	if not temp then
		if not delayLoadingTimer then
			delayLoadingTimer = C_Timer.NewTimer(2, function()
				iKeystones:MYTHIC_PLUS_CURRENT_AFFIX_UPDATE()
			end)
		end
		return
	end
	if temp[1] then
		iKS.currentAffixes[sortedAffixes[temp[1].id]] = temp[1].id
	end
	if temp[2] then
		iKS.currentAffixes[sortedAffixes[temp[2].id]] = temp[2].id
	end
	if temp[3] then
		iKS.currentAffixes[sortedAffixes[temp[3].id]] = temp[3].id
	end
	if temp[4] then
		iKS.currentAffixes[sortedAffixes[temp[4].id]] = temp[4].id
	end
	if iKeystonesDB[player] then
		iKeystonesDB[player].canLoot = C_MythicPlus.IsWeeklyRewardAvailable()
	end
	local affstring = string.format("%d%d%d%d", iKS.currentAffixes[1], iKS.currentAffixes[2],iKS.currentAffixes[3],iKS.currentAffixes[4])
	--print("affixes:",affstring) -- debug
	if iKeystonesConfig.affstring ~= affstring then
		iKeystonesConfig.affstring = affstring
		iKS:weeklyReset()
	end
	if not iKS:createPlayer() then return end
	local key = C_MythicPlus.GetOwnedKeystoneLevel()
	local mapID = C_MythicPlus.GetOwnedKeystoneChallengeMapID()
	iKS.keyLevel = key
	iKS.mapID = mapID
	iKeystonesDB[player].key = {
		['map'] = mapID,
		['level'] = key,
	}
	--Get max dynamically
	local lastMax = 0
	local currentMaxLevel = 0
	for i = 2, 30 do
		local ilvl = C_MythicPlus.GetRewardLevelForDifficultyLevel(i)
		if lastMax < ilvl then
			lastMax = ilvl
			iKS.currentMax = i
		end
	end
end
function iKeystones:MYTHIC_PLUS_NEW_WEEKLY_RECORD(mapChallengeModeID, completionMilliseconds, level)
	if not iKS:createPlayer() or not level or not IsValidDungeon(mapChallengeModeID) then return end
	if level > iKeystonesDB[player].maxCompleted then
		iKeystonesDB[player].maxCompleted = level
	end
end
function iKeystones:BAG_UPDATE()
	iKS:scanInventory()
end
function iKeystones:ITEM_PUSH(bag, id)
	if id == 525134 then
		iKS:scanInventory()
	end
end
function iKeystones:CHALLENGE_MODE_MAPS_UPDATE()
	iKS:scanCharacterMaps()
end
function iKeystones:QUEST_LOG_UPDATE()
	if not iKeystonesDB[player] then return end
	if IsQuestFlaggedCompleted(44554) then
		iKeystonesDB[player].canLoot = false
	end
	if IsQuestFlaggedCompleted(iKS.IsleQuests[playerFaction]) then
		iKeystonesDB[player].isle = {
			progress = 0,
			done = true,
		}
	else
		if not iKeystonesDB[player].isle then
			iKeystonesDB[player].isle = {}
		end
		local isleProgress, isleMax = select(4, GetQuestObjectiveInfo(iKS.IsleQuests[playerFaction], 1, false))
		if not isleProgress or not isleMax then return end
		iKeystonesDB[player].isle = {
			progress = string.format("%0.f", isleProgress/isleMax*100),
			done = false,
		}
	end
end
function iKeystones:CRITERIA_UPDATE()
	iKeystones:QUEST_LOG_UPDATE()
end
function iKeystones:ENCOUNTER_LOOT_RECEIVED(_, itemid)
	if itemid ~= 158923 then return end
	C_Timer.After(5, function()
		iKeystonesDB[player].canLoot = C_MythicPlus.IsWeeklyRewardAvailable()
	end)

end
local function ChatHandling(msg, channel)
	if not msg then return end -- not sure if this can even happen, maybe?
	msg = msg:lower()
	if msg == '.keys' or msg == "!keys" then
		iKS:PasteKeysToChat(false,channel)
	elseif msg == '.weekly' or msg == "!weekly" then
		iKS:PasteKeysToChat(true,channel,nil,iKS.currentMax,nil, true)
	elseif msg:find('^[!%.]allkeys') then
		local level = msg:match('^[!%.]allkeys (%d*)')
		if msg:match('^[!%.]allkeys (%d*)%+$') then -- .allkeys x+
			local level = msg:match('^[!%.]allkeys (%d*)%+$')
			iKS:PasteKeysToChat(true,channel,nil,tonumber(level))
		elseif msg:match('^[!%.]allkeys (%d*)%-(%d*)$') then -- .allkeys x-y
			local minlevel, maxlevel = msg:match('^[!%.]allkeys (%d*)%-(%d*)$')
			iKS:PasteKeysToChat(true,channel,nil, tonumber(minlevel), tonumber(maxlevel))
		elseif msg:match('^[!%.]allkeys (%d*)') then -- .allkeys 15
			local level = msg:match('^[!%.]allkeys (%d*)')
			iKS:PasteKeysToChat(true,channel,tonumber(level))
		else
			iKS:PasteKeysToChat(true,channel)
		end
	end
end
function iKeystones:CHAT_MSG_GUILD(msg)
	ChatHandling(msg, 'guild')
end
function iKeystones:CHAT_MSG_GUILD_LEADER(msg)
	ChatHandling(msg, 'guild')
end
function iKeystones:CHAT_MSG_OFFICER(msg)
	ChatHandling(msg, 'officer')
end
function iKeystones:CHAT_MSG_INSTANCE(msg)
	ChatHandling(msg, 'instance')
end
function iKeystones:CHAT_MSG_INSTANCE_LEADER(msg)
	ChatHandling(msg, 'instance')
end
function iKeystones:CHAT_MSG_PARTY(msg)
	ChatHandling(msg, 'party')
end
function iKeystones:CHAT_MSG_PARTY_LEADER(msg)
	ChatHandling(msg, 'party')
end
function iKeystones:CHAT_MSG_RAID(msg)
	ChatHandling(msg, 'raid')
end
function iKeystones:CHAT_MSG_RAID_LEADER(msg)
	ChatHandling(msg, 'raid')
end

function iKeystones:CHALLENGE_MODE_KEYSTONE_RECEPTABLE_OPEN()
	local _, _, _, _, _, _, _, mapID = GetInstanceInfo()
	if iKS.mapID and iKS.keystonesToMapIDs[iKS.mapID] == mapID then
		local bagID, slotID = iKS:scanInventory(true)
		PickupContainerItem(bagID, slotID)
		C_Timer.After(0.1, function()
			if CursorHasItem() then
				C_ChallengeMode.SlotKeystone()
			end
		end)
	end
end
local function chatFiltering(self, event, msg, ...)
	if event == 'CHAT_MSG_LOOT' then
		local linkStart = msg:find('Hitem:158923')
		if linkStart then
			local preLink = msg:sub(1, linkStart-12)
			local linkStuff = msg:sub(math.max(linkStart-11, 0))
			local tempTable = {strsplit(':', linkStuff)}
			tempTable[1] = iKS:getItemColor(tonumber(tempTable[16])) .. '|Hitem'
			for k,v in pairs(tempTable) do
				if v and v:match('%[.-%]') then
					tempTable[k] = string.gsub(tempTable[k], '%[.-%]', string.format('[%s (%s)]',iKS:getZoneInfo(tonumber(tempTable[15])), tonumber(tempTable[16]), tonumber(tempTable[16])), 1)
					break
				end
			end
			return false, preLink..table.concat(tempTable, ':'), ...
		end
	else
		local linkStart = msg:find('Hkeystone')
		if linkStart then
			if event == 'CHAT_MSG_BN_WHISPER_INFORM' or event == "CHAT_MSG_BN_WHISPER" then
				linkStart = linkStart + 10
				msg = msg:gsub('|Hkeystone:', '|cffa335ee|Hkeystone:')
				local m = msg:sub(math.max(linkStart-1, 0))
				local keystoneName = m:match('%[(.-)%]')
				msg = msg:gsub(keystoneName..'%]|h', keystoneName..']|h|r', 1)
			end
			local preLink = msg:sub(1, linkStart-12)
			local linkStuff = msg:sub(math.max(linkStart-11, 0))
			local tempTable = {strsplit(':', linkStuff)}
			tempTable[1] = iKS:getItemColor(tonumber(tempTable[3]), tonumber(tempTable[4])) .. '|Hkeystone'

			local fullString = table.concat(tempTable, ':')
			fullString = string.gsub(fullString, '%[.-%]', string.format('[%s (%s)]',iKS:getZoneInfo(tonumber(tempTable[3])), tonumber(tempTable[4])), 1)
			return false, preLink..fullString, ...
		end
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD_LEADER", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_LEADER", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER_INFORM", chatFiltering)
ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", chatFiltering)

iKS.bd = {
	bgFile = "Interface\\Buttons\\WHITE8x8",
	edgeFile = "Interface\\Buttons\\WHITE8x8",
	edgeSize = 1,
	insets = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
function iKS:createNewLine()
	--char -- key -- highest -- ap gain
	iKS.frames[#iKS.frames+1] = {}
	local f = iKS.frames[#iKS.frames]
	f.name = CreateFrame('frame', nil , iKS.anchor)
	f.name:SetSize(100,20)
	f.name:SetBackdrop(iKS.bd)
	f.name:SetBackdropColor(.1,.1,.1,.9)
	f.name:SetBackdropBorderColor(0,0,0,1)
	f.name:SetPoint('TOPLEFT', (#iKS.frames == 1 and iKS.anchor or iKS.frames[#iKS.frames-1].name), 'BOTTOMLEFT', 0,1)

	f.name.text = f.name:CreateFontString()
	f.name.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
	f.name.text:SetPoint('LEFT', f.name, 'LEFT', 2,0)
	f.name.text:SetText(#iKS.frames == 1 and 'Character' or '')
	f.name.text:Show()

	f.key = CreateFrame('frame', nil , iKS.anchor)
	f.key:SetSize(150,20)
	f.key:SetBackdrop(iKS.bd)
	f.key:SetBackdropColor(.1,.1,.1,.9)
	f.key:SetBackdropBorderColor(0,0,0,1)
	f.key:SetPoint('TOPLEFT', f.name, 'TOPRIGHT', -1,0)

	f.key.text = f.key:CreateFontString()
	f.key.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
	f.key.text:SetPoint('LEFT', f.key, 'LEFT', 2,0)
	f.key.text:SetText(#iKS.frames == 1 and 'Current key' or '')
	f.key.text:Show()

	f.max = CreateFrame('frame', nil , iKS.anchor)
	f.max:SetSize(50,20)
	f.max:SetBackdrop(iKS.bd)
	f.max:SetBackdropColor(.1,.1,.1,.9)
	f.max:SetBackdropBorderColor(0,0,0,1)
	f.max:SetPoint('TOPLEFT', f.key, 'TOPRIGHT', -1,0)

	f.max.text = f.max:CreateFontString()
	f.max.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
	f.max.text:SetPoint('CENTER', f.max, 'CENTER', 0,0)
	f.max.text:SetText(#iKS.frames == 1 and 'Max' or '')
	f.max.text:Show()

	f.ilvl = CreateFrame('frame', nil , iKS.anchor)
	f.ilvl:SetSize(50,20)
	f.ilvl:SetBackdrop(iKS.bd)
	f.ilvl:SetBackdropColor(.1,.1,.1,.9)
	f.ilvl:SetBackdropBorderColor(0,0,0,1)
	f.ilvl:SetPoint('TOPLEFT', f.max, 'TOPRIGHT', -1,0)

	f.ilvl.text = f.key:CreateFontString()
	f.ilvl.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
	f.ilvl.text:SetPoint('CENTER', f.ilvl, 'CENTER', 0,0)
	f.ilvl.text:SetText(#iKS.frames == 1 and 'iLvL' or '')
	f.ilvl.text:Show()

	f.ap = CreateFrame('frame', nil , iKS.anchor)
	f.ap:SetSize(50,20)
	f.ap:SetBackdrop(iKS.bd)
	f.ap:SetBackdropColor(.1,.1,.1,.9)
	f.ap:SetBackdropBorderColor(0,0,0,1)
	f.ap:SetPoint('TOPLEFT', f.ilvl, 'TOPRIGHT', -1,0)

	f.ap.text = f.ap:CreateFontString()
	f.ap.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
	f.ap.text:SetPoint('CENTER', f.ap, 'CENTER', 0,0)
	f.ap.text:SetText(#iKS.frames == 1 and 'AP' or '')
	f.ap.text:Show()

	f.tr = CreateFrame('frame', nil , iKS.anchor)
	f.tr:SetSize(50,20)
	f.tr:SetBackdrop(iKS.bd)
	f.tr:SetBackdropColor(.1,.1,.1,.9)
	f.tr:SetBackdropBorderColor(0,0,0,1)
	f.tr:SetPoint('TOPLEFT', f.ap, 'TOPRIGHT', -1,0)

	f.tr.text = f.ap:CreateFontString()
	f.tr.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
	f.tr.text:SetPoint('CENTER', f.tr, 'CENTER', 0,0)
	f.tr.text:SetText(#iKS.frames == 1 and 'TR' or '')
	f.tr.text:Show()

	f.isle = CreateFrame('frame', nil , iKS.anchor)
	f.isle:SetSize(50,20)
	f.isle:SetBackdrop(iKS.bd)
	f.isle:SetBackdropColor(.1,.1,.1,.9)
	f.isle:SetBackdropBorderColor(0,0,0,1)
	f.isle:SetPoint('TOPLEFT', f.tr, 'TOPRIGHT', -1,0)

	f.isle.text = f.ap:CreateFontString()
	f.isle.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
	f.isle.text:SetPoint('CENTER', f.isle, 'CENTER', 0,0)
	f.isle.text:SetText(#iKS.frames == 1 and 'Isle' or '')
	f.isle.text:Show()
end
local function reColor(f, faction)
	local r,g,b = .1,.1,.1
	if faction and faction == 'Horde' then
		r = .20
	elseif faction and faction == 'Alliance' then
		b = .20
	end
	f.name:SetBackdropColor(r,g,b,.9)
	f.key:SetBackdropColor(r,g,b,.9)
	f.max:SetBackdropColor(r,g,b,.9)
	f.ilvl:SetBackdropColor(r,g,b,.9)
	f.ap:SetBackdropColor(r,g,b,.9)
	f.tr:SetBackdropColor(r,g,b,.9)
	f.isle:SetBackdropColor(r,g,b,.9)
end
function iKS:createMainWindow()
	if not iKS.anchor then
		iKS.anchor = CreateFrame('frame', nil, UIParent)
		iKS.anchor:SetSize(2,1)
	end
	if iKeystonesConfig.windowPos == 1 then -- Screen one
		local width = math.floor(UIParent:GetWidth()/4)
		iKS.anchor:SetPoint('TOP', UIParent, 'TOP', -width+1,-50)
	elseif iKeystonesConfig.windowPos == 2 then -- Screen two
		local width = math.floor(UIParent:GetWidth()/4)
		iKS.anchor:SetPoint('TOP', UIParent, 'TOP', width,-50)
	else
		iKS.anchor:SetPoint('TOP', UIParent, 'TOP', 0,-50)
	end

	iKS.anchor:Show()
	if #iKS.frames == 0 then
		iKS:createNewLine()
		--Create affix slots
		iKS.affixes = {}
		local f = iKS.affixes
		f.aff2 = CreateFrame('frame', nil , iKS.anchor)
		f.aff2:SetSize(150,20)
		f.aff2:SetBackdrop(iKS.bd)
		f.aff2:SetBackdropColor(.1,.1,.1,.9)
		f.aff2:SetBackdropBorderColor(0,0,0,1)
		--f.aff4:SetPoint('TOPLEFT', iKS.anchor, 'BOTTOMLEFT', 0,0)

		f.aff2.text = f.aff2:CreateFontString()
		f.aff2.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
		f.aff2.text:SetPoint('CENTER', f.aff2, 'CENTER', 0,0)
		f.aff2.text:SetText('Tyrannical')
		--f.aff4.text:Show()

		f.aff4 = CreateFrame('frame', nil , iKS.anchor)
		f.aff4:SetSize(150,20)
		f.aff4:SetBackdrop(iKS.bd)
		f.aff4:SetBackdropColor(.1,.1,.1,.9)
		f.aff4:SetBackdropBorderColor(0,0,0,1)
		f.aff4:SetPoint('TOPLEFT', f.aff2, 'TOPRIGHT', 0,0)

		f.aff4.text = f.aff4:CreateFontString()
		f.aff4.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
		f.aff4.text:SetPoint('CENTER', f.aff4, 'CENTER', 0,0)
		f.aff4.text:SetText('Teeming')
		--f.aff7.text:Show()

		f.aff7 = CreateFrame('frame', nil , iKS.anchor)
		f.aff7:SetSize(150,20)
		f.aff7:SetBackdrop(iKS.bd)
		f.aff7:SetBackdropColor(.1,.1,.1,.9)
		f.aff7:SetBackdropBorderColor(0,0,0,1)
		f.aff7:SetPoint('TOPLEFT', f.aff4, 'TOPRIGHT', 0,0)

		f.aff7.text = f.aff7:CreateFontString()
		f.aff7.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
		f.aff7.text:SetPoint('CENTER', f.aff7, 'CENTER', 0,0)
		f.aff7.text:SetText('Volcanic')
		--f.aff7.text:Show()
	end
	local i = 1
	local maxSizes = {
		name = 96,
		key = 146,
		ap = 46,
		tr = 46,
		isle = 46,
	}
	local treasure = '|TInterface\\Icons\\inv_misc_treasurechest02b:16|t'
	for k,v in spairs(iKeystonesDB, function(t,a,b) return t[b].name > t[a].name end) do
		i = i + 1
		if not iKS.frames[i] then
			iKS:createNewLine()
		end
		local f = iKS.frames[i]
		f.name:Show()
		f.key:Show()
		f.max:Show()
		f.ilvl:Show()
		f.ap:Show()
		f.tr:Show()
		f.isle:Show()
		if v.server == GetRealmName() then
			f.name.text:SetText(string.format('%s|c%s%s\124r', (v.canLoot and treasure or ''),RAID_CLASS_COLORS[v.class].colorStr, v.name))
		else
			f.name.text:SetText(string.format('%s|c%s%s\124r - %s',(v.canLoot and treasure or ''),RAID_CLASS_COLORS[v.class].colorStr, v.name, v.server))
		end
		f.key.text:SetText(v.key.level and string.format('%s%s (%s)|r', iKS:getItemColor(v.key.level), iKS:getZoneInfo(v.key.map), v.key.level) or '-')
		f.max.text:SetText((not v.maxCompleted or v.maxCompleted == 0 and "-") or (v.maxCompleted >= iKS.currentMax and '|cff00ff00' .. v.maxCompleted) or (v.maxCompleted > 0 and v.maxCompleted))
		local ilvl = C_MythicPlus.GetRewardLevelForDifficultyLevel(v.maxCompleted)
		f.ilvl.text:SetText(v.maxCompleted > 0 and ilvl or '-')
		f.ap.text:SetText(iKS:getAP(v.maxCompleted,nil,nil,nil,true))
		f.tr.text:SetText(iKS:getResiduum(v.maxCompleted,nil,true))
		f.isle.text:SetText((v.isle and v.isle.done and '|cff00ff00100%') or (v.isle and (v.isle.progress .."%")) or '0%')
		if f.name.text:GetWidth() > maxSizes.name then
			maxSizes.name = f.name.text:GetWidth()
		end
		if f.key.text:GetWidth() > maxSizes.key then
			maxSizes.key = f.key.text:GetWidth()
		end
		if f.ap.text:GetWidth() > maxSizes.ap then
			maxSizes.ap = f.ap.text:GetWidth()
		end
		if f.tr.text:GetWidth() > maxSizes.tr then
			maxSizes.tr = f.tr.text:GetWidth()
		end
		if f.isle.text:GetWidth() > maxSizes.isle then
			maxSizes.isle = f.isle.text:GetWidth()
		end
		reColor(f, v.faction)
	end
	for k,v in pairs(maxSizes) do
		maxSizes[k] = math.ceil(v)
	end
	for id = 1, i do
		local f = iKS.frames[id]
		f.name:SetWidth(maxSizes.name+4)
		f.key:SetWidth(maxSizes.key+4)
		f.ap:SetWidth(maxSizes.ap+4)
		f.tr:SetWidth(maxSizes.tr+4)
		f.isle:SetWidth(maxSizes.isle+4)
	end
	for j = i+1, #iKS.frames do
		local f = iKS.frames[j]
		f.name:Hide()
		f.key:Hide()
		f.max:Hide()
		f.ilvl:Hide()
		f.ap:Hide()
		f.tr:Hide()
		f.isle:Hide()
	end
	local w = maxSizes.name+maxSizes.key+maxSizes.ap+maxSizes.tr+maxSizes.isle+100-5 --+max(50)+ilvl(50)
	iKS.anchor:SetWidth(w)

	iKS.affixes.aff2:ClearAllPoints()
	iKS.affixes.aff2:SetPoint('TOPLEFT', iKS.frames[i].name, 'BOTTOMLEFT', 0,1)
	iKS.affixes.aff2:SetWidth(math.floor(w/3))
	iKS.affixes.aff2.text:SetText(C_ChallengeMode.GetAffixInfo(iKS.currentAffixes[1]))

	iKS.affixes.aff7:SetWidth(math.floor(w/3))
	iKS.affixes.aff7:ClearAllPoints()
	iKS.affixes.aff7:SetPoint('TOPRIGHT', iKS.frames[i].isle, 'BOTTOMRIGHT', 0,1)
	iKS.affixes.aff7.text:SetText(C_ChallengeMode.GetAffixInfo(iKS.currentAffixes[3]))

	iKS.affixes.aff4:ClearAllPoints()
	iKS.affixes.aff4:SetPoint('LEFT', iKS.affixes.aff2, 'RIGHT', -1,0)
	iKS.affixes.aff4:SetPoint('RIGHT', iKS.affixes.aff7, 'LEFT', 1,0)
	iKS.affixes.aff4.text:SetText(C_ChallengeMode.GetAffixInfo(iKS.currentAffixes[2]))
end
function iKS:addToTooltip(self, map, keyLevel)
	map = tonumber(map)
	keyLevel = tonumber(keyLevel)
	local wIlvl, ilvl = C_MythicPlus.GetRewardLevelForDifficultyLevel(keyLevel)
	self:AddLine(' ')
	self:AddDoubleLine(string.format('Items: %s |cff00ff00+1|r', (keyLevel > iKS.currentMax and (2+(keyLevel-iKS.currentMax)*.4) or 2)), 'ilvl: ' .. ilvl)
	--if keyLevel > iKeystonesDB[player].maxCompleted then
		self:AddDoubleLine(string.format('Weekly: |cff00ff00+%s|rap', iKS:getAP(keyLevel, nil, nil, true) - iKS:getAP(iKeystonesDB[player].maxCompleted, nil, nil, true)),
		string.format('TR: |cff00ff00+%.1fk|r', (iKS:getResiduum(keyLevel,true) - iKS:getResiduum(iKeystonesDB[player].maxCompleted, true))/1e3))
	--end
end
local function gameTooltipScanning(self)
	local itemName, itemLink = self:GetItem()
	if not (itemLink and itemLink:find('Hkeystone')) then
		return
	end
	local itemId, map, keyLevel,l4,l7,l10 = string.match(itemLink, 'keystone:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)')
	iKS:addToTooltip(self, map, keyLevel)
end
local function itemRefScanning(self)
	local itemName, itemLink = self:GetItem()
	if not (itemLink and itemLink:find('Hitem:138019')) then
		return
	end
	local tempTable = {strsplit(':', itemLink)}
	local map = tempTable[15]
	local level = tempTable[16]
	iKS:addToTooltip(self, map, level)
end
GameTooltip:HookScript('OnTooltipSetItem', gameTooltipScanning)
ItemRefTooltip:HookScript('OnTooltipSetItem', itemRefScanning)

SLASH_IKEYSTONES1 = "/ikeystones"
SLASH_IKEYSTONES2 = "/iks"
SlashCmdList["IKEYSTONES"] = function(msg)
	if msg and msg:len() > 0 then
		msg = string.lower(msg)
		if msg == 'reset' then
			iKeystonesDB = nil
			iKeystonesDB = {}
			iKS:scanInventory()
			iKS:scanCharacterMaps()
		elseif msg == 'print' then
			iKS:printKeystones()
		elseif msg == 'start' or msg == 's' then
			if C_ChallengeMode.GetSlottedKeystoneInfo() then
				C_ChallengeMode.StartChallengeMode()
			end
		elseif msg == 'force' or msg == 'f' then
			local _, _, _, _, _, _, _, mapID = GetInstanceInfo()
			local bagID, slotID = iKS:scanInventory(true)
			PickupContainerItem(bagID, slotID)
			C_Timer.After(0.1, function()
				if CursorHasItem() then
					C_ChallengeMode.SlotKeystone()
				end
			end)
		elseif msg == 'next' or msg == 'n' then
			for i = 1, #iKS.affixCycles do
				if iKS.affixCycles[i][1] == iKS.currentAffixes[1] and iKS.affixCycles[i][2] == iKS.currentAffixes[2] and iKS.affixCycles[i][3] == iKS.currentAffixes[3] then
					local nextCycle = i+1 <= #iKS.affixCycles and i+1 or 1
					local aff1 = C_ChallengeMode.GetAffixInfo(iKS.affixCycles[nextCycle][1])
					local aff2 = C_ChallengeMode.GetAffixInfo(iKS.affixCycles[nextCycle][2])
					local aff3 = C_ChallengeMode.GetAffixInfo(iKS.affixCycles[nextCycle][3])
					print(string.format('iKS: Next cycle : %s, %s, %s.',aff1, aff2, aff3))
					return
				end
			end
			print(string.format('iKS: Unknown cycle, contact author'))
		elseif msg == 'ignore' or msg == 'i' then
			iKeystonesConfig.ignoreList[player] = true
			iKeystonesDB[player] = nil
			print('iKS: This character will now be ignored.')
		elseif msg == 'whitelist' or msg == 'w' then
			iKeystonesConfig.ignoreList[player] = nil
			iKS:scanCharacterMaps()
			iKS:scanInventory()
			print('iKS: This character is now whitelisted.')
		elseif msg == 'help' or msg == 'h' then
			iKS:help()
		elseif msg:match('^completed (%d+)$') or msg:match('^c (%d+)$') then
			local level = msg:match('^completed (%d+)$')
			if not level then
				level = msg:match('^c (%d+)$')
			end
			if not iKS:createPlayer() then return end
			iKeystonesDB[player].maxCompleted = tonumber(level)
		elseif msg:match('delete') or msg:match('d') then
			local _,char,server = msg:match("^(.-) (.-) (.*)$")
			if not (char and server) then
				print('iKS: ' .. msg .. ' is not a valid format, please use /iks delete characterName serverName, eg /iks delete ironi stormreaver')
				return
			end
			for guid,data in pairs(iKeystonesDB) do
				if server == string.lower(data.server) and char == string.lower(data.name) then
					iKeystonesDB[guid] = nil
					print('iKS: Succesfully deleted:' ..char..'-'..server..'.')
					return
				end
			end
			print('iKS: cannot find ' ..char..'-'..server..'.')
		elseif msg == 'screen1' then
			iKeystonesConfig.windowPos = 1
		elseif msg == 'screen2' then
			iKeystonesConfig.windowPos = 2
		elseif msg == "screennormal" then
			iKeystonesConfig.windowPos = 0
		elseif msg:match("^(%d-)$") then
			local lvl = msg:match("^(%d-)$")
			local health, damage = C_ChallengeMode.GetPowerLevelDamageHealthMod(lvl)
			local wIlvl, ilvl = C_MythicPlus.GetRewardLevelForDifficultyLevel(lvl)
			if not ilvl then
				ilvl = UNKNOWN
			end
			if not health or not damage then
				print("iKS: No data for level: " .. lvl)
			elseif not iKS.currentAffixes[1] then
				print(string.format("iKS: Didn't find Fortified orTyrannical affix\nBase Multipliers: Health %.2f - Damage %.2f\niLvL: %s", 1+health/100, 1+damage/100, ilvl))
			elseif iKS.currentAffixes[1] == 9 then -- Tyrannical
				print(string.format("iKS: Multipliers this week for level %d\nBosses: Health %.2f - Damage %.2f\nTrash: Health %.2f - Damage %.2f\niLvL: %s", lvl, (1+health/100)*1.4, (1+damage/100)*1.15, 1+health/100, 1+damage/100, ilvl))
			else -- Fortified
				print(string.format("iKS: Multipliers this week for level %d\nBosses: Health %.2f - Damage %.2f\nTrash: Health %.2f - Damage %.2f\niLvL: %s", lvl, 1+health/100, 1+damage/100, (1+health/100)*1.2, (1+damage/100)*1.3, ilvl))
			end
		else
			iKS:help()
		end
	else
		if iKS.anchor and iKS.anchor:IsShown() then
			iKS.anchor:Hide()
		else
			iKS:createMainWindow()
		end
	end
end
