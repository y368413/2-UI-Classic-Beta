-- This addon binds keys 1-9 to important elements of the quest pickup and turn-in windows and gossip frames.

-- 05/25/2019 1.0.6-classic: update for classic beta client, disabled buttons get a binding too
-- 07/17/2018 1.0.5 toc update for 8.0 patch
-- 08/29/2017 1.0.4 toc update for 7.3 patch
-- 03/28/2017 1.0.3 toc update for 7.2 patch
-- 07/16/2016 1.0.2 toc update for 7.0 patch
-- 06/22/2015 1.0.1 toc update for 6.2 patch
-- 05/07/2015 1.0.0 initial release

local qb = {}

qb.pool = {} -- pool of frames with a circle and number for the bound key
qb.noteworthy = {} -- default frames that we look for to attach a key to
-- title buttons (the clickable lines of text on gossip and quest frames) take first keys
for i=1,32 do
	tinsert(qb.noteworthy,"GossipTitleButton"..i)
	tinsert(qb.noteworthy,"QuestTitleButton"..i)
end
-- then quest rewards
for i=1,6 do
	tinsert(qb.noteworthy,"QuestInfoRewardsFrameQuestInfoItem"..i)
end
-- and finally the buttons at the bottom of the window
for _,button in pairs({ "GossipFrameGreetingGoodbyeButton", "QuestFrameAcceptButton", "QuestFrameDeclineButton", "QuestFrameCompleteButton", "QuestFrameCompleteQuestButton", "QuestFrameGreetingGoodbyeButton", "QuestFrameGoodbyeButton" }) do
	tinsert(qb.noteworthy,button)
end

-- displays a numbered key beside the parent button (a gossip or dialog button)
-- note: displayed keys aren't actually parented to the parent, just anchored to it
function qb:SetKey(key,parent)
	local parentName = parent:GetName()
	if not parentName then
		return false -- SetOverrideBindingClick needs a name to click
	end
	if key>9 then
		return false -- only binding keys 1 to 9
	end
	if parentName:match("QuestInfoRewardsFrameQuestInfoItem") and (not QuestInfoFrame.chooseItems or parent.type~="choice") then
		return false -- don't put keys when showing rewards that can't be chosen
	end
	local button = qb.pool[key]
	if not button then -- create a key button if one doesn't exist yet
		qb.pool[key] = CreateFrame("Frame",nil,UIParent)
		button = qb.pool[key]
		button:SetFrameStrata("HIGH")
		button:SetSize(16,16)
		--button.back = button:CreateTexture(nil,"BACKGROUND")
		--button.back:SetAllPoints(true)
		--button.back:SetTexture("Interface\\PetBattles\\PetJournal")
		--button.back:SetTexCoord(0.06835938, 0.10937500, 0.02246094, 0.04296875)
		button.key = button:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
		button.key:SetPoint("CENTER")
		button.key:SetText(key)
	end
	button:ClearAllPoints() -- anchor it next to its noteworthy button
	if parentName:match("QuestTitleButton") then
		button:SetPoint("RIGHT",parent,"LEFT",5,3)
	elseif parentName:match("GossipTitleButton") then
		button:SetPoint("RIGHT",parent,"LEFT",3,2)
	elseif parentName:match("QuestInfoRewardsFrameQuestInfoItem") then
		button:SetPoint("CENTER",parent,"TOPLEFT")
	else
		button:SetPoint("CENTER",parent,"LEFT")
	end
	button:Show()
	SetOverrideBindingClick(qb.frame,false,tostring(key),parentName) -- bind key to click the parent
	return true
end

qb.frame = CreateFrame("Frame")
qb.frame:SetScript("OnEvent",function(self,event,...)
	ClearOverrideBindings(qb.frame) -- for all events, clear bindings and hide buttons first
	for i=1,#qb.pool do
		qb.pool[i]:Hide()
	end
	if event=="GOSSIP_CLOSED" or event=="QUEST_FINISHED" or event=="PLAYER_REGEN_DISABLED" then
		self:UnregisterEvent("PLAYER_REGEN_DISABLED") -- no need to watch this if not looking at a quest
	elseif not InCombatLockdown() then
		local key = 1
		for _,name in pairs(qb.noteworthy) do
			local button = _G[name]
			-- if noteworthy button is visible, enabled and anchored
			if button and button:IsVisible() --[[and button:IsEnabled()]] and button:GetPoint() then
				if qb:SetKey(key,button) then -- then give it a key
					key = key + 1 -- if a key successfully set, move to next key for next button
				end
			end
		end
		self:RegisterEvent("PLAYER_REGEN_DISABLED") -- must clear bindings if entering combat while keys up
	end
end)

for _,event in pairs({"GOSSIP_SHOW", "QUEST_DETAIL", "QUEST_PROGRESS", "QUEST_GREETING", "GOSSIP_CLOSED", "QUEST_COMPLETE", "QUEST_FINISHED" }) do
	qb.frame:RegisterEvent(event)
end
