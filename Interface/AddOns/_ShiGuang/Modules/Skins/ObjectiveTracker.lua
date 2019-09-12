﻿local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")
local cr, cg, cb = I.r, I.g, I.b
local pairs = pairs
local LE_QUEST_FREQUENCY_DAILY = LE_QUEST_FREQUENCY_DAILY or 2

function S:QuestTracker()
	-- Show quest color and level
	local function Showlevel(self)
		local numEntries = GetNumQuestLogEntries()

		for i = 1, QUESTS_DISPLAYED, 1 do
			local questIndex = i + FauxScrollFrame_GetOffset(QuestLogListScrollFrame)
			local questLogTitle = _G["QuestLogTitle"..i]
			local questCheck = _G["QuestLogTitle"..i.."Check"]

			if questIndex <= numEntries then
				local questLogTitleText, level, _, isHeader, _, isComplete, frequency = GetQuestLogTitle(questIndex)

				if not isHeader then
					questLogTitleText = "["..level.."] "..questLogTitleText
					if isComplete then
						questLogTitleText = "|cffff78ff"..questLogTitleText
					elseif frequency == LE_QUEST_FREQUENCY_DAILY then
						questLogTitleText = "|cff3399ff"..questLogTitleText
					end

					questLogTitle:SetText(questLogTitleText)
					questCheck:SetPoint("LEFT", questLogTitle, questLogTitle:GetWidth()-22, 0)
				end
			end
		end
	end
	hooksecurefunc("QuestLog_Update", Showlevel)
end