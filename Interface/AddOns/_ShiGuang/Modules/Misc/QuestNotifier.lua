local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:GetModule("Misc")

local completedQuest, initComplete = {}
local strmatch, strfind, gsub, format = string.match, string.find, string.gsub, string.format
local mod, tonumber, pairs, floor = mod, tonumber, pairs, math.floor
local soundKitID = SOUNDKIT.ALARM_CLOCK_WARNING_3
local QUEST_COMPLETE, LE_QUEST_TAG_TYPE_PROFESSION, LE_QUEST_FREQUENCY_DAILY = QUEST_COMPLETE, LE_QUEST_TAG_TYPE_PROFESSION, LE_QUEST_FREQUENCY_DAILY

local function acceptText(link, daily)
	if daily then
		return format("|cFFFFFF00[%s]|r%s-%s", DAILY, GARRISON_START_MISSION, link)
	else
		return format("%s-%s", ACCEPT..GARRISON_MISSIONS, link)  --"→"
	end
end

local function completeText(link)
	PlaySound(soundKitID, "Master")  --PlaySoundFile("Interface\\Addons\\_ShiGuang\\Media\\Sounds\\QuestNotifier.ogg", "Master")
	return format("%s-%s", QUEST_COMPLETE, link)  --"✓"
end

local function sendQuestMsg(msg)
	if MaoRUISettingDB["Misc"]["OnlyCompleteRing"] then return end

	--if IsPartyLFG() then
		--SendChatMessage(msg, "INSTANCE_CHAT")
	--elseif IsInRaid() then
		--SendChatMessage(msg, "RAID")
	if IsInGroup() and not IsInRaid() then
		SendChatMessage(msg, "PARTY")
	end
end

local function getPattern(pattern)
	pattern = gsub(pattern, "%(", "%%%1")
	pattern = gsub(pattern, "%)", "%%%1")
	pattern = gsub(pattern, "%%%d?$?.", "(.+)")
	return format("^%s$", pattern)
end

local questMatches = {
	["Found"] = getPattern(ERR_QUEST_ADD_FOUND_SII),
	["Item"] = getPattern(ERR_QUEST_ADD_ITEM_SII),
	["Kill"] = getPattern(ERR_QUEST_ADD_KILL_SII),
	["PKill"] = getPattern(ERR_QUEST_ADD_PLAYER_KILL_SII),
	["ObjectiveComplete"] = getPattern(ERR_QUEST_OBJECTIVE_COMPLETE_S),
	["QuestComplete"] = getPattern(ERR_QUEST_COMPLETE_S),
	["QuestFailed"] = getPattern(ERR_QUEST_FAILED_S),
}

function MISC:FindQuestProgress(_, msg)
	if not MaoRUISettingDB["Misc"]["QuestProgress"] then return end
	if MaoRUISettingDB["Misc"]["OnlyCompleteRing"] then return end

	for _, pattern in pairs(questMatches) do
		if strmatch(msg, pattern) then
			local _, _, _, cur, max = strfind(msg, "(.*)[:]%s*([-%d]+)%s*/%s*([-%d]+)%s*$")
			cur, max = tonumber(cur), tonumber(max)
			if cur and max and max >= 10 then
				if mod(cur, floor(max/5)) == 0 then
					sendQuestMsg(msg)
				end
			else
				sendQuestMsg(msg)
			end
			break
		end
	end
end

function MISC:FindQuestAccept(questLogIndex, questID)
	local name, _, _, _, _, _, frequency = GetQuestLogTitle(questLogIndex)
	if name then
		sendQuestMsg(acceptText(name, frequency == LE_QUEST_FREQUENCY_DAILY))
	end
end

function MISC:FindQuestComplete()
	for i = 1, GetNumQuestLogEntries() do
		local name, _, _, _, _, isComplete, _, questID = GetQuestLogTitle(i)
		if name and isComplete and not completedQuest[questID] then
			if initComplete then
				sendQuestMsg(completeText(name))
			end
			completedQuest[questID] = true
		end
	end
	initComplete = true
end

function MISC:QuestNotifier()
	if MaoRUISettingDB["Misc"]["QuestNotifier"] then
		self:FindQuestComplete()
		M:RegisterEvent("QUEST_ACCEPTED", self.FindQuestAccept)
		M:RegisterEvent("QUEST_LOG_UPDATE", self.FindQuestComplete)
		M:RegisterEvent("UI_INFO_MESSAGE", self.FindQuestProgress)
	else
		wipe(completedQuest)
		M:UnregisterEvent("QUEST_ACCEPTED", self.FindQuestAccept)
		M:UnregisterEvent("QUEST_LOG_UPDATE", self.FindQuestComplete)
		M:UnregisterEvent("UI_INFO_MESSAGE", self.FindQuestProgress)
	end
end