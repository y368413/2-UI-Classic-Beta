-- ## Version: 8.0.1.2 ## Author: Semlar
local FQP, Events, A, T = CreateFrame('frame'), {}, ...

local function Raise(_, event, ...)
	if Events[event] then
		for module in pairs(Events[event]) do
			module[event](module, ...)
		end
	end
end

local function RegisterEvent(module, event, func)
	--if type(func) == 'function' then -- and not module[event]
	if func then
		rawset(module, event, func)
	end
	if not Events[event] then
		Events[event] = {}
	end
	Events[event][module] = true
	if strmatch(event, '^[%u_]+$') then
		FQP:RegisterEvent(event)
	end
	return module
end


local function UnregisterEvent(module, event)
	if Events[event] then
		Events[event][module] = nil
		if not next(Events[event]) and strmatch(event, '^[%u_]+$') then -- don't unregister unless the event table is empty
			FQP:UnregisterEvent(event)
		end
	end
	return module
end

local Module = {
	__newindex = RegisterEvent, -- function E:ADDON_LOADED() end
	__call = Raise, -- E('CallBack', ...) -- Fire a callback across ALL modules
	__index = {
		RegisterEvent = RegisterEvent, -- E:RegisterEvent('ADDON_LOADED', func)
		UnregisterEvent = UnregisterEvent, -- E:UnregisterEvent('ADDON_LOADED')
		Raise = Raise, -- E:Raise('CallBack', ...)
	},
}

T.Eve = setmetatable({}, {
	__call = function(eve)
		local module = setmetatable({}, Module)
		eve[ #eve + 1 ] = module
		return module
	end,
})

FQP:SetScript('OnEvent', Raise)

-------------------------------------
-- Stripped core from SemlarPlates
-------------------------------------

local _, QuestPlatesSet = ...
local E = QuestPlatesSet:Eve()
local Nameplates = {} -- [plate] = f, holds all nameplate frames
local ActiveNameplates = {} -- [plate] = f, only stores currently visible nameplates
local GUIDs = {} -- [guid] = plate
function QuestPlatesSet:GetActiveNameplates()
	return ActiveNameplates
end

function QuestPlatesSet:GetFrameFromNameplate(plate)
	return Nameplates[plate]
end

function QuestPlatesSet:GetPlateForUnit(unitID)
	local plate, f = C_NamePlate.GetNamePlateForUnit(unitID)
	if plate then
		f = Nameplates[plate]
	end
	return plate, f
end

function QuestPlatesSet:GetUnitForPlate(plate)
	return Nameplates[plate] and Nameplates[plate]._unitID
end

function QuestPlatesSet:GetPlateForGUID(guid)
	local plate = GUIDs[guid]
	if plate then
		return plate, ActiveNameplates[plate]
	end
end

function E:NAME_PLATE_CREATED(plate)
	local f = CreateFrame('frame', nil, plate)
	f:SetAllPoints()
	Nameplates[plate] = f
	plate._frame = f
	E('OnNewPlate', f, plate)
end

function E:NAME_PLATE_UNIT_ADDED(unitID)
	local plate = C_NamePlate.GetNamePlateForUnit(unitID)
	local f = Nameplates[plate]
	ActiveNameplates[plate] = f
	f._unitID = unitID
	
	local guid = UnitGUID(unitID)
	if guid then
		GUIDs[guid] = plate
	end
	
	E('OnPlateShow', f, plate, unitID)
end

function E:NAME_PLATE_UNIT_REMOVED(unitID)
	local plate = C_NamePlate.GetNamePlateForUnit(unitID)
	local f = Nameplates[plate]
	ActiveNameplates[plate] = nil
	
	local guid = UnitGUID(unitID)
	if guid then
		GUIDs[guid] = nil
	end
	
	E('OnPlateHide', f, plate, unitID)
end

function E:VARIABLES_LOADED()
	SetCVar('showQuestTrackingTooltips', '1') -- Required for this addon to function, don't turn this off
end

local TextureAtlases = {
	['item'] = 'Banker', -- bag icon, you have to loot something for this quest
	--['monster'] = '', -- you must kill or interact with units for this quest
}

-- C_TaskQuest.GetQuestsForPlayerByMapID(GetCurrentMapAreaID())
local ActiveWorldQuests = {
	-- [questName] = questID ?
}

do
	function E:PLAYER_LOGIN()
		local uiMapID = C_Map.GetBestMapForUnit('player')
		if uiMapID then
			for k, task in pairs(C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID) or {}) do
				if task.inProgress then
					-- track active world quests
					local questID = task.questId
					local questName = C_TaskQuest.GetQuestInfoByQuestID(questID)
					if questName then
						-- print(k, questID, questName)
						ActiveWorldQuests[ questName ] = questID
					end
				end
			end
		end
	end

	function E:QUEST_ACCEPTED(questLogIndex, questID, ...)
		if questID and IsQuestTask(questID) then
			-- print('TASK_QUEST_ACCEPTED', questID, questLogIndex, GetQuestLogTitle(questLogIndex))
			local questName = C_TaskQuest.GetQuestInfoByQuestID(questID)
			if questName then
				ActiveWorldQuests[ questName ] = questID
			end
		else
			-- print('QUEST_ACCEPTED', questID, questLogIndex, GetQuestLogTitle(questLogIndex))
		end
		E:UNIT_QUEST_LOG_CHANGED()
	end
	
	function E:QUEST_REMOVED(questID)
		local questName = C_TaskQuest.GetQuestInfoByQuestID(questID)
		if questName and ActiveWorldQuests[ questName ] then
			ActiveWorldQuests[ questName ] = nil
			-- print('TASK_QUEST_REMOVED', questID, questName)
			-- get task progress when it's updated to display on the nameplate
			-- C_TaskQuest.GetQuestProgressBarInfo
		end
		E:UNIT_QUEST_LOG_CHANGED()
	end
	
	function E:QUEST_WATCH_LIST_CHANGED(questID, added)
		E:QUEST_ACCEPTED(nil, questID)
	end
end

local OurName = UnitName('player')
local QuestPlateTooltip = CreateFrame('GameTooltip', 'QuestPlateTooltip', nil, 'GameTooltipTemplate')
QuestLogIndex = {} -- [questName] = questLogIndex, this is to "quickly" look up quests from its name in the tooltip

local function GetQuestProgress(unitID)

	
	QuestPlateTooltip:SetOwner(WorldFrame, 'ANCHOR_NONE')
	--QuestPlateTooltip:SetHyperlink('unit:' .. guid)
	QuestPlateTooltip:SetUnit(unitID)
	
	local progressGlob -- concatenated glob of quest text
	local questType -- 1 for player, 2 for group
	local objectiveCount = 0
	local questTexture -- if usable item
	local questLogIndex -- should generally be set, index usable with questlog functions
	local questID
	for i = 3, QuestPlateTooltip:NumLines() do
		local str = _G['QuestPlateTooltipTextLeft' .. i]
		local text = str and str:GetText()
		if not text then return end
		questID = questID or ActiveWorldQuests[ text ]
		local playerName, progressText = strmatch(text, '^ ([^ ]-) ?%- (.+)$') -- nil or '' if 1 is missing but 2 is there

		if playerName and playerName ~= '' and playerName ~= OurName then -- quest is for another group member
			if not questType then
				questType = 2
			end
		else
		
			if progressText then
				local x, y = strmatch(progressText, '(%d+)/(%d+)')
				if x and y then
					local numLeft = y - x
					if numLeft > objectiveCount then -- track highest number of objectives
						objectiveCount = numLeft
					end
				else
					local progress = tonumber(strmatch(progressText, '([%d%.]+)%%')) -- tooltip actually contains progress %
					if progress and progress <= 100 then
						local questID = ActiveWorldQuests[ text ] -- not a guarantee
						local questType = 3
						return text, questType, ceil(100 - progress), questID
					end
				end
				--local x, y = strmatch(progressText, '(%d+)/(%d+)$')
				if not x or (x and y and x ~= y) then
					progressGlob = progressGlob and progressGlob .. '\n' .. progressText or progressText
				end
			else
				if ActiveWorldQuests[ text ] then
					local questID = ActiveWorldQuests[ text ]
					local progress = C_TaskQuest.GetQuestProgressBarInfo(questID)
					if progress then
						local questType = 3 -- progress bar
						return text, questType, ceil(100 - progress), questID
					end
				else
					local index = QuestLogIndex[text]
					if index then
						questLogIndex = index
					end
				end
			end
		end
	end
	
	return progressGlob, progressGlob and 1 or questType, objectiveCount, questLogIndex, questID
end

local QuestPlates = {} -- [plate] = f
function E:OnNewPlate(f, plate)
	local frame = CreateFrame('frame', nil, f)
	frame:Hide()
	frame:SetAllPoints(f)
	QuestPlates[plate] = frame
	
	local icon = frame:CreateTexture(nil, nil, nil, 0)
	icon:SetSize(26, 26)
	--icon:SetTexture('Interface/QuestFrame/AutoQuest-Parts')
	--icon:SetTexCoord(0.30273438, 0.41992188, 0.015625, 0.953125)
	icon:SetPoint('RIGHT', frame, 'LEFT', 0, 1)
	frame:SetScale(0.85)
	frame.jellybean = icon
	
	local itemTexture = frame:CreateTexture(nil, nil, nil, 1)
	itemTexture:SetPoint('LEFT', icon, 'RIGHT', -8, 0)
	itemTexture:SetSize(16, 16)
	itemTexture:SetMask('Interface/CharacterFrame/TempPortraitAlphaMask')
	itemTexture:Hide()
	frame.itemTexture = itemTexture
	
	-- Loot icon, display if mob needs to be looted for quest item
	local lootIcon = frame:CreateTexture(nil, nil, nil, 1)
	lootIcon:SetAtlas('Banker')
	lootIcon:SetSize(16, 16)
	lootIcon:SetPoint('LEFT', icon, 'RIGHT', -8, -3)
	lootIcon:Hide()
	frame.lootIcon = lootIcon
	
	local iconText = frame:CreateFontString(nil, 'OVERLAY')
	iconText:SetPoint('CENTER', icon, 0.8, 0)
	iconText:SetShadowOffset(1, -1)
	iconText:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Infinity.ttf", 16, "OUTLINE")
	--iconText:SetText(math.random(22))
	iconText:SetTextColor(1,.82,0)
	frame.iconText = iconText
	
	-- todo: add setting for displaying quest text again
	local questText = frame:CreateFontString(nil, 'BACKGROUND')
	questText:SetPoint('TOP', frame, 'BOTTOM')
	questText:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 12, "OUTLINE")
	questText:SetShadowOffset(1, -1)
	questText:Hide()
	frame.questText = questText
	
	local qmark = frame:CreateTexture(nil, 'OVERLAY')
	qmark:SetSize(28, 28)
	qmark:SetPoint('CENTER', icon)
	qmark:SetTexture('Interface/WorldMap/UI-WorldMap-QuestIcon')
	qmark:SetTexCoord(0, 0.56, 0.5, 1)
	qmark:SetAlpha(0)
	
	local duration = 1
	local group = qmark:CreateAnimationGroup()
	local alpha = group:CreateAnimation('Alpha')
	alpha:SetOrder(1)
	alpha:SetFromAlpha(0)
	alpha:SetToAlpha(1)
	alpha:SetDuration(0)
	
	local translation = group:CreateAnimation('Translation')
	translation:SetOrder(1)
	translation:SetOffset(0, 20)
	translation:SetDuration(duration)
	translation:SetSmoothing('OUT')
	
	local alpha2 = group:CreateAnimation('Alpha')
	alpha2:SetOrder(1)
	alpha2:SetFromAlpha(1)
	alpha2:SetToAlpha(0)
	alpha2:SetDuration(duration)
	alpha2:SetSmoothing('OUT')
	
	frame.ani = group
	
	frame:HookScript('OnShow', function(self)
		group:Play()
	end)
	
end

local function UpdateQuestIcon(plate, unitID)
	local Q = QuestPlates[plate]
	local unitID = unitID or QuestPlatesSet:GetUnitForPlate(plate)
	if not Q then return end
	
	local scenarioName, currentStage, numStages, flags, _, _, _, xp, money, scenarioType, _, textureKitID = C_Scenario.GetInfo()
	local inChallengeMode = (scenarioType == LE_SCENARIO_TYPE_CHALLENGE_MODE)
	if inChallengeMode and UnitGUID(unitID) then -- C_MythicPlus.IsMythicPlusActive() and guid then
		Q:Hide()
		return
	end
	
	local progressGlob, questType, objectiveCount, questLogIndex, questID = GetQuestProgress(unitID)
	if progressGlob and questType ~= 2 then
		Q.questText:SetText(progressGlob or '')
		
		if questType == 3 then -- todo: progress bar
			Q.iconText:SetText(objectiveCount > 0 and objectiveCount or '')
		else
			Q.iconText:SetText(objectiveCount > 0 and objectiveCount or '')
		end

		if questType == 1 then
			Q.jellybean:SetDesaturated(false)
			Q.iconText:SetTextColor(1, .82, 0)
		elseif questType == 2 then
			Q.jellybean:SetDesaturated(true)
			Q.iconText:SetTextColor(1, 1, 1)
		elseif questType == 3 then
			Q.jellybean:SetDesaturated(false)
			Q.iconText:SetTextColor(0.2, 1, 1)
		end
		Q.itemTexture:Hide()
		Q.lootIcon:Hide()
		if questLogIndex or questID then
			if questID then
				for i = 1, 10 do
					local text, objectiveType, finished = GetQuestObjectiveInfo(questID, i, false)
					if not text then break end
					if not finished and (objectiveType == 'item' or objectiveType == 'object') then
						Q.lootIcon:Show()
					end
				end
			else
				local _, _, _, _, _, _, _, questID = GetQuestLogTitle(questLogIndex)
				for i = 1, GetNumQuestLeaderBoards(questLogIndex) or 0 do
					local text, objectiveType, finished = GetQuestObjectiveInfo(questID, i, false)
					if not finished and (objectiveType == 'item' or objectiveType == 'object') then
						Q.lootIcon:Show()
					end
				end
			end
			
			if questLogIndex then
				local link, itemTexture, charges, showItemWhenComplete = GetQuestLogSpecialItemInfo(questLogIndex)
				if link and itemTexture then
					Q.itemTexture:SetTexture(itemTexture)
					Q.itemTexture:Show()
				else
					Q.itemTexture:Hide()
				end
			end
		end
		
		if not Q:IsVisible() then
			Q.ani:Stop()
			Q:Show()
			Q.ani:Play()
		end
		--Q:Show()
	else
		Q:Hide()
	end	
end

function E:OnPlateShow(f, plate, unitID)
	UpdateQuestIcon(plate, unitID)
end

QuestObjectiveStrings = {}
local function CacheQuestIndexes()
	wipe(QuestLogIndex)
	for i = 1, GetNumQuestLogEntries() do
		-- for i = 1, GetNumQuestLogEntries() do if not select(4,GetQuestLogTitle(i)) and select(11,GetQuestLogTitle(i)) then QuestLogPushQuest(i) end end
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isBounty, isStory = GetQuestLogTitle(i)
		if not isHeader then
			QuestLogIndex[title] = i
			for objectiveID = 1, GetNumQuestLeaderBoards(i) or 0 do
				local objectiveText, objectiveType, finished, numFulfilled, numRequired = GetQuestObjectiveInfo(questID, objectiveID, false)
				if objectiveText then
					QuestObjectiveStrings[ title .. objectiveText ] = {questID, objectiveID}
				end
			end
		end
	end
	
	for plate, f in pairs(QuestPlatesSet:GetActiveNameplates()) do
		UpdateQuestIcon(plate, f._unitID)
	end
end

function E:UNIT_QUEST_LOG_CHANGED(unitID)
	if unitID == 'player' then
		CacheQuestIndexes()
	else	
		for plate in pairs(QuestPlatesSet:GetActiveNameplates()) do
			UpdateQuestIcon(plate)
		end
	end
end

function E:QUEST_LOG_UPDATE()
	CacheQuestIndexes()
end
E:UnregisterEvent('QUEST_LOG_UPDATE')

function E:PLAYER_LEAVING_WORLD()
	E:UnregisterEvent('QUEST_LOG_UPDATE')
end

function E:ADDON_LOADED()
	E:RegisterEvent('QUEST_LOG_UPDATE')
end