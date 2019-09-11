local _, ns = ...
local M, R, U, I = unpack(ns)
--## Author: Cytoph ## Version: 0.9.2
BetterQuestFrame = CreateFrame("Frame", nil, UIParent)
local BQF = BetterQuestFrame
local ClickFrames = {}

function BQF:Initialize()
	self:SetFrameStrata("BACKGROUND")
	self:SetMovable(true)
	self:SetClampedToScreen(true)
	self:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
	self:SetBackdropColor(0, 0, 0, 0)
	self.header  = self:CreateFontString(nil, nil, "GameFontNormalLarge")
	self.header:SetText("Quests")
	self.header:SetTextColor(I.r, I.g, I.b);
	self.header:SetPoint("TOPLEFT", 0, 0)
	self.fontStrings = {};
end

function BQF:LoadQuests()

	if QuestWatchFrame:IsVisible() then QuestWatchFrame:Hide() end
	
	for i = 1, table.getn(self.fontStrings), 1 do
		self.fontStrings[i]:Hide()
		self.fontStrings[i] = nil;
	end
	
	local numEntries, _ = GetNumQuestLogEntries()
	local questCount = 0
	local l = 0
	
	for i = 1, numEntries, 1
	do
		local title, level, _, isHeader, _, isComplete, _, questID, _, displayQuestID, _, _, _, _ = GetQuestLogTitle(i);
		
		if not isHeader then
		
			l = l + 1
			questCount = questCount + 1
	
			self.fontStrings[l] = self:CreateFontString(nil, nil, "GameFontNormal")
			self.fontStrings[l]:SetText("[" .. level .. "] " .. title)
					self.fontStrings[l]:SetJustifyH("LEFT")
			
			if isComplete then
				self.fontStrings[l]:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0			
			else
				self.fontStrings[l]:SetTextColor(.75, .61, 0)
			end
			
			if l == 1 then			
				self.fontStrings[l]:SetPoint("TOPLEFT", self.header, "BOTTOMLEFT", 5, -10)
			else
				self.fontStrings[l]:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -5)
			end
			
			self.fontStrings[l]:SetPoint("RIGHT", self, "RIGHT", -5, 0)
			
			local objectivesCount = GetNumQuestLeaderBoards(i)
			local objectives = {}
			
			if objectivesCount > 0 then			
				for j = 1, objectivesCount, 1
				do
					l = l + 1
					
					local desc, _, done = GetQuestLogLeaderBoard(j, i)
					
					self.fontStrings[l] = self:CreateFontString(nil, nil, "GameFontNormal")				
					self.fontStrings[l]:SetText(" - " .. desc)
					self.fontStrings[l]:SetJustifyH("LEFT")
					
					if done then
						self.fontStrings[l]:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
					else
						self.fontStrings[l]:SetTextColor(.8, .8, .8)
					end
					
					self.fontStrings[l]:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -1)
					self.fontStrings[l]:SetPoint("RIGHT", self, "RIGHT", -5, 0)
					
					local objective = {}
					objective.text = self.fontStrings[l]
					objective.done = done
					tinsert(objectives, objective)
				end
			else
				l = l + 1			
				
				SelectQuestLogEntry(i);
				local _, desc = GetQuestLogQuestText()
				
				self.fontStrings[l] = self:CreateFontString(nil, nil, "GameFontNormal")				
				self.fontStrings[l]:SetText(" - " .. desc)
				self.fontStrings[l]:SetJustifyH("LEFT")
				self.fontStrings[l]:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
				self.fontStrings[l]:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -1)
				self.fontStrings[l]:SetPoint("RIGHT", self, "RIGHT", -5, 0)
				
				local objective = {}
				objective.text = self.fontStrings[l]
				objective.done = true
				tinsert(objectives, objective)
				
				objectivesCount = 1
			end
			
			BQF:SetClickFrame(i, self.fontStrings[l - objectivesCount], objectives, isComplete)
		end
	end
	
	if table.getn(self.fontStrings) > l then
		for i = l, table.getn(self.fontStrings), 1 do
			self.fontStrings = nil;
		end
	end
	
	local frameHeight = 0
	
	for _, text in pairs(self.fontStrings) do
		frameHeight = frameHeight + text:GetHeight()
	end
	
	frameHeight = frameHeight + 10						-- Spacing between title and first quest
	frameHeight = frameHeight + ((questCount - 1) * 5)	-- Spacing before all quest titles but the first
	frameHeight = frameHeight + ((l - questCount) * 1)	-- Spacing before each quest objectives
	frameHeight = frameHeight + l							-- General spacing between each FontString
	
	self:SetSize(260, frameHeight)
	self.header:SetText(QUEST_LOG.." " .. questCount .. "/20")
end

local function OnMouseUp(self)
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
		else
			ShowUIPanel(QuestLogFrame)
			QuestLog_SetSelection(self.questIndex)
			local valueStep = QuestLogListScrollFrame.ScrollBar:GetValueStep()
			QuestLogListScrollFrame.ScrollBar:SetValue(self.questIndex*valueStep/2)
		end
	end
end

local function OnEnter(self)
	if self.completed then
		-- use normal colors instead as highlight
		self.headerText:SetTextColor(.75, .61, 0)
		for _, objective in ipairs(self.objectives) do
			objective.text:SetTextColor(.8, .8, .8)
		end
	else
		self.headerText:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0
		for _, objective in ipairs(self.objectives) do
			objective.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
		end
	end
end

local function OnLeave(self)
	if self.completed then
		self.headerText:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0
		for _, objective in ipairs(self.objectives) do
			objective.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
		end
	else
		self.headerText:SetTextColor(.75, .61, 0)
		for _, objective in ipairs(self.objectives) do
			if objective.done then
				objective.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
			else
				objective.text:SetTextColor(.8, .8, .8)
			end
		end
	end
end

function BQF:SetClickFrame(questIndex, headerText, objectives, completed)
	if not ClickFrames[questIndex] then
		ClickFrames[questIndex] = CreateFrame("Frame")
		ClickFrames[questIndex]:SetScript("OnMouseUp", OnMouseUp)
		ClickFrames[questIndex]:SetScript("OnEnter", OnEnter)
		ClickFrames[questIndex]:SetScript("OnLeave", OnLeave)
	end
	local f = ClickFrames[questIndex]
	f:SetAllPoints(headerText)
	f.questIndex = questIndex
	f.headerText = headerText
	f.objectives = objectives
	f.completed = completed
end

function BQF:ADDON_LOADED(addon)
	if addon == "_ShiGuang" then
		self:Initialize()
		local AnchorFrame = CreateFrame("Frame", "QuestMover", UIParent)
	  AnchorFrame:SetSize(260, 43)
	  M.Mover(AnchorFrame, "QuestTracker", "QuestTracker", {"TOPLEFT","UIParent","TOPLEFT",8,-28})
	  local QuickQuestCheckButton = CreateFrame("CheckButton", nil, AnchorFrame, "OptionsCheckButtonTemplate")
	  QuickQuestCheckButton:SetPoint("RIGHT", AnchorFrame, -21, 12)
	  QuickQuestCheckButton:SetSize(21, 21)
	  QuickQuestCheckButton:SetHitRectInsets(0, -10, 0, 0)
	  QuickQuestCheckButton:RegisterEvent("PLAYER_LOGIN")
	  QuickQuestCheckButton:SetScript("OnEvent", function(self) self:SetChecked(MaoRUISettingDB["Misc"].AutoQuest) end)
	  QuickQuestCheckButton:SetScript("OnClick", function(self) MaoRUISettingDB["Misc"].AutoQuest = self:GetChecked() end)
		self:ClearAllPoints()
		self:SetPoint("TOPRIGHT", AnchorFrame, "TOPRIGHT", 0, 0)
		self:UnregisterEvent("ADDON_LOADED")
	end
end

function BQF:QUEST_LOG_UPDATE(unitTarget)
	self:LoadQuests()
end

-- only make the frame movable when mouseovering and pressing alt
function BQF:MODIFIER_STATE_CHANGED()
	if self:IsMouseOver() then
		if IsAltKeyDown() then -- easier than checking for event payload imo
			self:EnableMouse(true)
			self:SetBackdropColor(0, 1, 0, .5)
		else
			self:EnableMouse(false)
			self:SetBackdropColor(0, 0, 0, 0)
			-- avoid getting stuck to the cursor when alt is released while dragging
			self:StopMovingOrSizing()
		end
	else
		if self:IsMouseEnabled() then
			-- avoid leaving the backdrop enabled when alt is still pressed but not mouseovering
			self:EnableMouse(false)
			self:SetBackdropColor(0, 0, 0, 0)
		end
	end
end

function BQF:OnEvent(event, ...)
	self[event](self, ...)
end

-- DEFAULT_CHAT_FRAME:AddMessage("Test")

BQF:RegisterEvent("ADDON_LOADED")
BQF:RegisterEvent("QUEST_LOG_UPDATE")
BQF:RegisterEvent("MODIFIER_STATE_CHANGED")
BQF:SetScript("OnEvent", BQF.OnEvent)