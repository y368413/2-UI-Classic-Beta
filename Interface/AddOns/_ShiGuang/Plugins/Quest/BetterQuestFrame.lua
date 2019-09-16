local _, ns = ...
local M, R, U, I = unpack(ns)
--## Author: Cytoph ## Version: 0.9.2
local BetterQuestFrame = CreateFrame("Frame", nil, UIParent)
local isCollapsed = false
function BetterQuestFrame:Initialize()
	self:SetFrameStrata("BACKGROUND")
	self:SetMovable(true)
	self:SetClampedToScreen(true)
	self:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
	self:SetBackdropColor(0, 0, 0, 0)
	self:RegisterForDrag("LeftButton")
	self:SetScript("OnDragStart", self.StartMoving)
	self:SetScript("OnDragStop", function(frame)
		frame:StopMovingOrSizing()
	end)
	self.header = {}
	
	local background = self:CreateTexture(nil, "ARTWORK")
	self.header.background = background
	background:SetWidth(260)
	background:SetHeight(60)
	background:SetPoint("TOPLEFT", 0, 21)
	background:SetTexture("Interface\\LFGFrame\\UI-LFG-SEPARATOR")
	background:SetTexCoord(0, .66, 0, .31)
	background:SetVertexColor(I.r, I.g, I.b, .8)
	
	local title = self:CreateFontString(nil, nil, "GameFontNormalLarge")
	self.header.title = title
	title:SetTextColor(I.r, I.g, I.b);
	title:SetPoint("TOPLEFT", 8, -8)

	local collapseButton = CreateFrame("BUTTON", nil, minimize)
	self.header.collapse = collapseButton
	collapseButton:SetWidth(16)
	collapseButton:SetHeight(16)
	collapseButton:SetPoint("TOPRIGHT", self, "TOPRIGHT", -6, -6)
	collapseButton:SetNormalTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Up.blp")
	collapseButton:SetPushedTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Down.blp")
	collapseButton:SetHighlightTexture("Interface\\BUTTONS\\UI-Panel-MinimizeButton-Highlight.blp")
	collapseButton:SetScript("OnClick", function()
		if isCollapsed == true then
			isCollapsed = false
			self:LoadQuests()
			collapseButton:SetNormalTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Up.blp")
			collapseButton:SetPushedTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Down.blp")
		else
			isCollapsed = true
			self:LoadQuests()
			collapseButton:SetNormalTexture("Interface\\BUTTONS\\UI-Panel-ExpandButton-Up.blp")
			collapseButton:SetPushedTexture("Interface\\BUTTONS\\UI-Panel-ExpandButton-Down.blp")
		end
	end)
		
	self.fontStrings = {};
end

function BetterQuestFrame:LoadQuests()

	if QuestWatchFrame:IsVisible() then QuestWatchFrame:Hide() end
	QuestWatchFrame.Show = QuestWatchFrame.Hide
	
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
			
			if isCollapsed ~= true then
					
				local questHeader = "[[quest:level]] [quest:title]"
				questHeader = string.gsub(questHeader, "%[quest:title%]", title)
				questHeader = string.gsub(questHeader, "%[quest:level%]", level)
		
				local questTitle = self:CreateFontString(nil, nil, "GameFontNormal")
				self.fontStrings[l] = questTitle
				questTitle:SetText(questHeader)
				questTitle:SetJustifyH("LEFT")
				
				if isComplete then
					questTitle:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0			
				else
					questTitle:SetTextColor(.75, .61, 0)
				end
				
				if l == 1 then			
					questTitle:SetPoint("TOPLEFT", self.header.title, "BOTTOMLEFT", 5, -15)
				else
					questTitle:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -5)
				end
				
				questTitle:SetPoint("RIGHT", self, "RIGHT", -5, 0)
				
				local objectivesCount = GetNumQuestLeaderBoards(i)
				local objectives = {}
				
				if objectivesCount > 0 then			
					for j = 1, objectivesCount, 1
					do
						l = l + 1
						
						local desc, _, done = GetQuestLogLeaderBoard(j, i)
						
						local objectiveText = self:CreateFontString(nil, nil, "GameFontNormal")
						self.fontStrings[l] = objectiveText
						objectiveText:SetText(" - " .. desc)
						objectiveText:SetJustifyH("LEFT")
						
						if done then
							objectiveText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
						else
							objectiveText:SetTextColor(.8, .8, .8)
						end
						
						objectiveText:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -1)
						objectiveText:SetPoint("RIGHT", self, "RIGHT", -5, 0)
						
						local objective = {}
						objective.text = self.fontStrings[l]
						objective.done = done
						tinsert(objectives, objective)
					end
				else
					l = l + 1			
					
					SelectQuestLogEntry(i);
					local _, desc = GetQuestLogQuestText()
					
					local objectiveText = self:CreateFontString(nil, nil, "GameFontNormal")				
					self.fontStrings[l] = objectiveText
					objectiveText:SetText(" - " .. desc)
					objectiveText:SetJustifyH("LEFT")
					objectiveText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
					objectiveText:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -1)
					objectiveText:SetPoint("RIGHT", self, "RIGHT", -5, 0)
					
					local objective = {}
					objective.text = self.fontStrings[l]
					objective.done = true
					tinsert(objectives, objective)
					
					objectivesCount = 1
				end
				
				BetterQuestFrame:SetClickFrame(i, self.fontStrings[l - objectivesCount], objectives, isComplete)
				
			end
		end
	end
	
	if table.getn(self.fontStrings) > l then
		for i = l, table.getn(self.fontStrings), 1 do
			self.fontStrings = nil;
		end
	end
	self:SetSize(260, GetScreenHeight()*.75)
	self.header.title:SetText(QUEST_LOG.." " .. questCount .. "/20")
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

function BetterQuestFrame:SetClickFrame(questIndex, headerText, objectives, completed)
	local ClickFrames = {}
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

function BetterQuestFrame:ADDON_LOADED(addon)
	if addon == "_ShiGuang" and MaoRUISettingDB["Misc"]["BetterQuest"] then
		self:Initialize()
		local AnchorFrame = CreateFrame("Frame", "QuestMover", UIParent)
	  AnchorFrame:SetSize(260, 43)
	  M.Mover(AnchorFrame, "QuestTracker", "QuestTracker", {"TOPLEFT","UIParent","TOPLEFT",3,-21})
	  local QuickQuestCheckButton = CreateFrame("CheckButton", nil, AnchorFrame, "OptionsCheckButtonTemplate")
	  QuickQuestCheckButton:SetPoint("RIGHT", AnchorFrame, -26, 4)
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

function BetterQuestFrame:QUEST_LOG_UPDATE(unitTarget)
	if MaoRUISettingDB["Misc"]["BetterQuest"] then self:LoadQuests() end
end

function BetterQuestFrame:OnEvent(event, ...)
	if MaoRUISettingDB["Misc"]["BetterQuest"] then self[event](self, ...) end		
end

BetterQuestFrame:RegisterEvent("ADDON_LOADED")
BetterQuestFrame:RegisterEvent("QUEST_LOG_UPDATE")
BetterQuestFrame:SetScript("OnEvent", BetterQuestFrame.OnEvent)