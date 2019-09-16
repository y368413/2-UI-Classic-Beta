local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")
local cr, cg, cb = I.r, I.g, I.b
local pairs = pairs
local LE_QUEST_FREQUENCY_DAILY = LE_QUEST_FREQUENCY_DAILY or 2

function S:QuestTracker()
	local timerMover = CreateFrame("Frame", "NDuiQuestTimerMover", UIParent)
	timerMover:SetSize(150, 30)
	M.Mover(timerMover, QUEST_TIMERS, "QuestTimer", {"TOPLEFT", "UIParent", "TOPLEFT", 60, -43})

	hooksecurefunc(QuestTimerFrame, "SetPoint", function(self, _, parent)
		if parent ~= timerMover then
			self:ClearAllPoints()
			self:SetPoint("TOP", timerMover)
		end
	end)

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

	-- ModernQuestWatch, Ketho
	local function onMouseUp(self)
		if IsShiftKeyDown() then -- untrack quest
			local questID = GetQuestIDFromLogIndex(self.questIndex)
			for index, value in ipairs(QUEST_WATCH_LIST) do
				if value.id == questID then
					tremove(QUEST_WATCH_LIST, index)
				end
			end
			RemoveQuestWatch(self.questIndex)
			QuestWatch_Update()
		else -- open to quest log
			if QuestLogEx then -- https://www.wowinterface.com/downloads/info24980-QuestLogEx.html
				ShowUIPanel(QuestLogExFrame)
				QuestLogEx:QuestLog_SetSelection(self.questIndex)
				QuestLogEx:Maximize()
			elseif ClassicQuestLog then -- https://www.wowinterface.com/downloads/info24937-ClassicQuestLogforClassic.html
				ShowUIPanel(ClassicQuestLog)
				QuestLog_SetSelection(self.questIndex)
			elseif QuestGuru then -- https://www.curseforge.com/wow/addons/questguru_classic
				ShowUIPanel(QuestGuru)
				QuestLog_SetSelection(self.questIndex)
			else
				ShowUIPanel(QuestLogFrame)
				QuestLog_SetSelection(self.questIndex)
				local valueStep = QuestLogListScrollFrame.ScrollBar:GetValueStep()
				QuestLogListScrollFrame.ScrollBar:SetValue(self.questIndex*valueStep/2)
			end
		end
		QuestLog_Update()
	end

	local function onEnter(self)
		if self.completed then
			-- use normal colors instead as highlight
			self.headerText:SetTextColor(.75, .61, 0)
			for _, text in ipairs(self.objectiveTexts) do
				text:SetTextColor(.8, .8, .8)
			end
		else
			self.headerText:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0
			for _, text in ipairs(self.objectiveTexts) do
				text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
			end
		end
	end

	local ClickFrames = {}
	local function SetClickFrame(watchIndex, questIndex, headerText, objectiveTexts, completed)
		if not ClickFrames[watchIndex] then
			ClickFrames[watchIndex] = CreateFrame("Frame")
			ClickFrames[watchIndex]:SetScript("OnMouseUp", onMouseUp)
			ClickFrames[watchIndex]:SetScript("OnEnter", onEnter)
			ClickFrames[watchIndex]:SetScript("OnLeave", QuestWatch_Update)
		end

		local f = ClickFrames[watchIndex]
		f:SetAllPoints(headerText)
		f.watchIndex = watchIndex
		f.questIndex = questIndex
		f.headerText = headerText
		f.objectiveTexts = objectiveTexts
		f.completed = completed
	end

	local function autoQuestWatch(_, questIndex)
		-- tracking otherwise untrackable quests (without any objectives) would still count against the watch limit
		-- calling AddQuestWatch() while on the max watch limit silently fails
		if GetCVarBool("autoQuestWatch") and GetNumQuestLeaderBoards(questIndex) ~= 0 and GetNumQuestWatches() < MAX_WATCHABLE_QUESTS then
			AutoQuestWatch_Insert(questIndex, QUEST_WATCH_NO_EXPIRE)
		end
	end
	M:RegisterEvent("QUEST_ACCEPTED", autoQuestWatch)
end