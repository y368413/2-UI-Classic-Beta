--## Author: Mikeprod  ## Version: 1.13_classic-fix1    Fix for 8.2 by y368413
local hooks = {}

local function Hook(source, target, secure)
    hooks[source] = _G[source]
    if secure then hooksecurefunc(source, target) else _G[source] = target end
end

local FRIENDS_GROUP_NAME_COLOR = NORMAL_FONT_COLOR

local INVITE_RESTRICTION_NO_GAME_ACCOUNTS = 0
local INVITE_RESTRICTION_CLIENT = 1
local INVITE_RESTRICTION_LEADER = 2
local INVITE_RESTRICTION_FACTION = 3
local INVITE_RESTRICTION_INFO = 4
local INVITE_RESTRICTION_WOW_PROJECT_ID = 5
local INVITE_RESTRICTION_WOW_PROJECT_MAINLINE = 6
local INVITE_RESTRICTION_WOW_PROJECT_CLASSIC = 7
local INVITE_RESTRICTION_NONE = 8
local INVITE_RESTRICTION_MOBILE = 9
local ONE_YEAR = 12 * 30 * 24 * 60 * 60
local FriendButtons = { count = 0 }
local GroupCount = 0
local GroupTotal = {}
local GroupOnline = {}
local GroupSorted = {}
local FriendRequestString = string.sub(FRIEND_REQUESTS,1,-5)
local currentExpansionMaxLevel = 120 -- Make it dynamic somehow

local function ClassColourCode(class,table)
	local initialClass = class
	for k, v in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do
		if class == v then
			class = k
			break
		end
	end
	if class == initialClass then
		for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
			if class == v then
				class = k
				break
			end
		end
	end
	if table then
		return RAID_CLASS_COLORS[class]
	else
		--local colour = RAID_CLASS_COLORS[class]
		--return string.format("|cFF%02x%02x%02x", colour.r*255, colour.g*255, colour.b*255)
	end
end

local function FriendGroups_GetTopButton(offset)
	local usedHeight = 0
	for i = 1, FriendButtons.count do
		local buttonHeight = FRIENDS_BUTTON_HEIGHTS[FriendButtons[i].buttonType]
		if ( usedHeight + buttonHeight >= offset ) then
			return i - 1, offset - usedHeight
		else
			usedHeight = usedHeight + buttonHeight
		end
	end
	return 0,0
end

local function FriendGroups_UpdateFriendButton(button)
	--local function CampIcon(CampGroup)                   ---DIY by y368413
		--if ( CampGroup == "Alliance" ) then return "Interface\\TargetingFrame\\UI-PVP-ALLIANCE"
		--elseif ( CampGroup == "Horde" ) then return "Interface\\TargetingFrame\\UI-PVP-HORDE"
		--else return ""
		--end
	--end
	local index = button.index
	button.buttonType = FriendButtons[index].buttonType
	button.id = FriendButtons[index].id
	local height = FRIENDS_BUTTON_HEIGHTS[button.buttonType]
	local nameText, nameColor, infoText, broadcastText, isFavoriteFriend
	local hasTravelPassButton = false
	if button.buttonType == FRIENDS_BUTTON_TYPE_WOW then
		local info = C_FriendList.GetFriendInfoByIndex(FriendButtons[index].id)
		broadcastText = nil
		if info.connected then
			button.background:SetColorTexture(FRIENDS_WOW_BACKGROUND_COLOR.r, FRIENDS_WOW_BACKGROUND_COLOR.g, FRIENDS_WOW_BACKGROUND_COLOR.b, FRIENDS_WOW_BACKGROUND_COLOR.a)
			if info.afk then
				button.status:SetTexture(FRIENDS_TEXTURE_AFK)
			elseif info.dnd then
				button.status:SetTexture(FRIENDS_TEXTURE_DND)
			else
				button.status:SetTexture(FRIENDS_TEXTURE_ONLINE)
			end
			nameText = info.name..", "..format(FRIENDS_LEVEL_TEMPLATE, info.level, info.className)
			--nameColor = ClassColourCode(info.className,true)  --nameColor = FRIENDS_WOW_NAME_COLOR
		else
			button.background:SetColorTexture(FRIENDS_OFFLINE_BACKGROUND_COLOR.r, FRIENDS_OFFLINE_BACKGROUND_COLOR.g, FRIENDS_OFFLINE_BACKGROUND_COLOR.b, FRIENDS_OFFLINE_BACKGROUND_COLOR.a)
			button.status:SetTexture(FRIENDS_TEXTURE_OFFLINE)
			nameText = info.name
			nameColor = FRIENDS_GRAY_COLOR
		end
		infoText = info.mobile and LOCATION_MOBILE_APP or info.area
		button.gameIcon:Hide()
		button.summonButton:ClearAllPoints()
		button.summonButton:SetPoint("TOPRIGHT", button, "TOPRIGHT", 1, -1)
		FriendsFrame_SummonButton_Update(button.summonButton)
	elseif button.buttonType == FRIENDS_BUTTON_TYPE_BNET then
		local bnetIDAccount, accountName, battleTag, isBattleTag, characterName, bnetIDGameAccount, client, isOnline, lastOnline, isBnetAFK, isBnetDND, messageText, noteText, isRIDFriend, messageTime, wowProjectID, isReferAFriend, canSummonFriend, isFavorite, mobile = BNGetFriendInfo(FriendButtons[index].id)
		broadcastText = messageText
		isFavoriteFriend = isFavorite
		-- set up player name and character name
		local characterName = characterName
		if accountName then
			nameText = accountName
			if isOnline then
				characterName = BNet_GetValidatedCharacterName(characterName, battleTag, client)
			end
		else
			nameText = UNKNOWN
		end

		-- append character name
		if characterName then
			local level = select(11, BNGetGameAccountInfo(bnetIDGameAccount))
			if client == BNET_CLIENT_WOW and CanCooperateWithGameAccount(bnetIDGameAccount) then
				local class = select(8, BNGetGameAccountInfo(bnetIDGameAccount))
				local nameColor = ClassColourCode(class) or FRIENDS_WOW_NAME_COLOR_CODE
					nameText = nameText.." "..nameColor.."("..level.." "..characterName..")"..FONT_COLOR_CODE_CLOSE
			else
				if ENABLE_COLORBLIND_MODE == "1" then
					characterName = characterName..CANNOT_COOPERATE_LABEL
				end
				if level ~= "" then
					nameText = nameText.." "..FRIENDS_OTHER_NAME_COLOR_CODE.."("..level.." "..characterName..")"..FONT_COLOR_CODE_CLOSE
				else
					nameText = nameText.." "..FRIENDS_OTHER_NAME_COLOR_CODE.."("..characterName..")"..FONT_COLOR_CODE_CLOSE
				end
			end
		end

		if isOnline then
			local _, _, _, realmName, realmID, faction, _, _, _, zoneName, _, gameText, _, _, _, _, _, isGameAFK, isGameBusy, guid, wowProjectID, mobile = BNGetGameAccountInfo(bnetIDGameAccount)
			button.background:SetColorTexture(FRIENDS_BNET_BACKGROUND_COLOR.r, FRIENDS_BNET_BACKGROUND_COLOR.g, FRIENDS_BNET_BACKGROUND_COLOR.b, FRIENDS_BNET_BACKGROUND_COLOR.a)
			if faction == "Alliance" then button.background:SetColorTexture(0.2, 0.2, 0.7, 0.2)   --DIY by y368413
				elseif faction == "Horde" then button.background:SetColorTexture(0.7, 0.2, 0.2, 0.2)
				end
			if isBnetAFK or isGameAFK then
				button.status:SetTexture(FRIENDS_TEXTURE_AFK)
			elseif isBnetDND or isGameBusy then
				button.status:SetTexture(FRIENDS_TEXTURE_DND)
			else
				button.status:SetTexture(FRIENDS_TEXTURE_ONLINE)
			end
			if client == BNET_CLIENT_WOW and wowProjectID == WOW_PROJECT_ID then
				if not zoneName or zoneName == "" then
					infoText = UNKNOWN
				else
					infoText = mobile and LOCATION_MOBILE_APP or zoneName
				end
			--if not button.facIcon then button.facIcon = button:CreateTexture("facIcon") end   --DIY by y368413
				--button.facIcon:ClearAllPoints()
				--button.facIcon:SetPoint("RIGHT", button.gameIcon, "LEFT", 7, -5)
				--button.facIcon:SetWidth(button.gameIcon:GetWidth())
				--button.facIcon:SetHeight(button.gameIcon:GetHeight())
				--button.facIcon:SetTexture(CampIcon(faction))
				--button.facIcon:Show()
			else
				infoText = gameText
			end
			button.gameIcon:SetTexture(BNet_GetClientTexture(client))
			nameColor = FRIENDS_BNET_NAME_COLOR

			--Note - this logic should match the logic in FriendsFrame_ShouldShowSummonButton

			local shouldShowSummonButton = FriendsFrame_ShouldShowSummonButton(button.summonButton)
			button.gameIcon:SetShown(not shouldShowSummonButton)

			-- travel pass
			hasTravelPassButton = true
			local restriction = FriendsFrame_GetInviteRestriction(button.id)
			if ( restriction == INVITE_RESTRICTION_NONE ) then
				button.travelPassButton:Enable()
			else
				button.travelPassButton:Disable()
			end
		else
			button.background:SetColorTexture(FRIENDS_OFFLINE_BACKGROUND_COLOR.r, FRIENDS_OFFLINE_BACKGROUND_COLOR.g, FRIENDS_OFFLINE_BACKGROUND_COLOR.b, FRIENDS_OFFLINE_BACKGROUND_COLOR.a)
			button.status:SetTexture(FRIENDS_TEXTURE_OFFLINE)
			nameColor = FRIENDS_GRAY_COLOR
			button.gameIcon:Hide()
			if ( not lastOnline or lastOnline == 0 or time() - lastOnline >= ONE_YEAR ) then
				infoText = FRIENDS_LIST_OFFLINE
			else
				infoText = string.format(BNET_LAST_ONLINE_TIME, FriendsFrame_GetLastOnline(lastOnline))
			end
		end
		button.summonButton:ClearAllPoints()
		button.summonButton:SetPoint("CENTER", button.gameIcon, "CENTER", 1, 0)
		FriendsFrame_SummonButton_Update(button.summonButton)
	elseif ( button.buttonType == FRIENDS_BUTTON_TYPE_DIVIDER ) then
		local title
		local group = FriendButtons[index].text
		if group == "" or not group then
			title = "[ 2 UI ]"
		else
			title = group
		end
		button.text:SetText(title)
		button.text:Show()

		local counts = "(" .. GroupOnline[group] .. "/" .. GroupTotal[group] .. ")"
		nameText = counts
		nameColor = FRIENDS_GROUP_NAME_COLOR  --NORMAL_FONT_COLOR
		button.name:SetJustifyH("RIGHT")

		if ShiGuangDB["FriendGroupsCollapsed"][group] then
			button.status:SetTexture("Interface\\Buttons\\UI-PlusButton-UP")
		else
			button.status:SetTexture("Interface\\Buttons\\UI-MinusButton-UP")
		end
		infoText = group
		button.info:Hide()
		button.gameIcon:Hide()
		button.background:SetColorTexture(FRIENDS_OFFLINE_BACKGROUND_COLOR.r, FRIENDS_OFFLINE_BACKGROUND_COLOR.g, FRIENDS_OFFLINE_BACKGROUND_COLOR.b, FRIENDS_OFFLINE_BACKGROUND_COLOR.a)
		button.background:SetAlpha(0.5)
		local scrollFrame = FriendsFrameFriendsScrollFrame
		local divider = scrollFrame.dividerPool:Acquire()
		divider:SetParent(scrollFrame.ScrollChild)
		divider:SetAllPoints(button)
		divider:Show()
	elseif ( button.buttonType == FRIENDS_BUTTON_TYPE_INVITE_HEADER ) then
		local header = FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton
		header:SetPoint("TOPLEFT", button, 1, 0)
		header:Show()
		header:SetFormattedText(FRIEND_REQUESTS, BNGetNumFriendInvites())
		local collapsed = GetCVarBool("friendInvitesCollapsed")
		if ( collapsed ) then
			header.DownArrow:Hide()
			header.RightArrow:Show()
		else
			header.DownArrow:Show()
			header.RightArrow:Hide()
		end
		nameText = nil
	elseif ( button.buttonType == FRIENDS_BUTTON_TYPE_INVITE ) then
		local scrollFrame = FriendsFrameFriendsScrollFrame
		local invite = scrollFrame.invitePool:Acquire()
		invite:SetParent(scrollFrame.ScrollChild)
		invite:SetAllPoints(button)
		invite:Show()
		local inviteID, accountName = BNGetFriendInviteInfo(button.id)
		invite.Name:SetText(accountName)
		invite.inviteID = inviteID
		invite.inviteIndex = button.id
		nameText = nil
	end
	-- travel pass?
	if ( hasTravelPassButton ) then
		button.travelPassButton:Show()
	else
		button.travelPassButton:Hide()
	end
	-- selection
	if ( FriendsFrame.selectedFriendType == FriendButtons[index].buttonType and FriendsFrame.selectedFriend == FriendButtons[index].id ) then
		button:LockHighlight()
	else
		button:UnlockHighlight()
	end
	-- finish setting up button if it's not a header
	if ( nameText ) then
		if button.buttonType ~= FRIENDS_BUTTON_TYPE_DIVIDER then
			button.text:Hide()
			button.name:SetJustifyH("LEFT")
			button.background:SetAlpha(1)
			button.info:Show()
		end
		button.name:SetText(nameText)
		button.name:SetTextColor(nameColor.r, nameColor.g, nameColor.b)
		button.info:SetText(infoText)
		button:Show()
		if isFavoriteFriend and button.Favorite then
			button.Favorite:Show()
			button.Favorite:ClearAllPoints()
			button.Favorite:SetPoint("TOPLEFT", button.name, "TOPLEFT", button.name:GetStringWidth(), 0)
		elseif button.Favorite then
			button.Favorite:Hide()
		end
	else
		button:Hide()
	end
	-- update the tooltip if hovering over a button
	if ( FriendsTooltip.button == button ) then
		FriendsFrameTooltip_Show(button)
	end
	if ( GetMouseFocus() == button ) then
		FriendsFrameTooltip_Show(button)
	end
	return height
end

local function FriendGroups_UpdateFriends()
	local scrollFrame = FriendsFrameFriendsScrollFrame
	local offset = HybridScrollFrame_GetOffset(scrollFrame)
	local buttons = scrollFrame.buttons
	local numButtons = #buttons
	local numFriendButtons = FriendButtons.count

	local usedHeight = 0

	scrollFrame.dividerPool:ReleaseAll()
	scrollFrame.invitePool:ReleaseAll()
	scrollFrame.PendingInvitesHeaderButton:Hide()
	for i = 1, numButtons do
		local button = buttons[i]
		local index = offset + i
		if ( index <= numFriendButtons ) then
			button.index = index
			local height = FriendGroups_UpdateFriendButton(button)
			button:SetHeight(height)
			usedHeight = usedHeight + height
		else
			button.index = nil
			button:Hide()
		end
	end
	HybridScrollFrame_Update(scrollFrame, scrollFrame.totalFriendListEntriesHeight, usedHeight)

	if hooks["FriendsFrame_UpdateFriends"] then
		hooks["FriendsFrame_UpdateFriends"]()
	end

	-- Delete unused groups in the collapsed part
	for key,_ in pairs(ShiGuangDB["FriendGroupsCollapsed"]) do
		if not GroupTotal[key] then
			ShiGuangDB["FriendGroupsCollapsed"][key] = nil
		end
	end
end

local function FillGroups(groups, note, ...)
	wipe(groups)
	local n = select('#', ...)
	for i = 1, n do
		local v = select(i, ...)
		v = strtrim(v)
		groups[v] = true
	end
	if n == 0 then
		groups[""] = true
	end
	return note
end

local function NoteAndGroups(note, groups)
	if not note then
		return FillGroups(groups, "")
	end
	if groups then
		return FillGroups(groups, strsplit("#", note))
	end
	return strsplit("#", note)
end

local function CreateNote(note, groups)
	local value = ""
	if note then
		value = note
	end
	for group in pairs(groups) do
		value = value .. "#" .. group
	end
	return value
end

local function IncrementGroup(group, online)
	if not GroupTotal[group] then
		GroupCount = GroupCount + 1
		GroupTotal[group] = 0
		GroupOnline[group] = 0
	end
	GroupTotal[group] = GroupTotal[group] + 1
	if online then
		GroupOnline[group] = GroupOnline[group] + 1
	end
end

local function FriendGroups_Update(forceUpdate)
	local numBNetTotal, numBNetOnline, numBNetFavorite, numBNetFavoriteOnline = BNGetNumFriends()
	numBNetFavorite = numBNetFavorite or 0
	numBNetFavoriteOnline = numBNetFavoriteOnline or 0
	local numBNetOffline = numBNetTotal - numBNetOnline
	local numBNetFavoriteOffline = numBNetFavorite - numBNetFavoriteOnline
	local numWoWTotal = C_FriendList.GetNumFriends()
	local numWoWOnline = C_FriendList.GetNumOnlineFriends()
	local numWoWOffline = numWoWTotal - numWoWOnline

	if QuickJoinToastButton then
		QuickJoinToastButton:UpdateDisplayedFriendCount()
	end
	if ( not FriendsListFrame:IsShown() and not forceUpdate) then
		return
	end

	wipe(FriendButtons)
	wipe(GroupTotal)
	wipe(GroupOnline)
	wipe(GroupSorted)
	GroupCount = 0

	local BnetFriendGroups = {}
	local WowFriendGroups = {}
	local FriendReqGroup = {}

	local buttonCount = 0

	FriendButtons.count = 0
	local addButtonIndex = 0
	local totalButtonHeight = 0
	local function AddButtonInfo(buttonType, id)
		addButtonIndex = addButtonIndex + 1
		if ( not FriendButtons[addButtonIndex] ) then
			FriendButtons[addButtonIndex] = { }
		end
		FriendButtons[addButtonIndex].buttonType = buttonType
		FriendButtons[addButtonIndex].id = id
		FriendButtons.count = FriendButtons.count + 1
		totalButtonHeight = totalButtonHeight + FRIENDS_BUTTON_HEIGHTS[buttonType]
	end

	-- invites
	local numInvites = BNGetNumFriendInvites()
	if ( numInvites > 0 ) then
		for i = 1, numInvites do
			if not FriendReqGroup[i] then
				FriendReqGroup[i] = {}
			end
			IncrementGroup(FriendRequestString,true)
			NoteAndGroups(nil, FriendReqGroup[i])
			if not ShiGuangDB["FriendGroupsCollapsed"][group] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_INVITE, i)
			end
		end
	end

	-- favorite friends online
	for i = 1, numBNetFavoriteOnline do
		if not BnetFriendGroups[i] then
			BnetFriendGroups[i] = {}
		end
		local noteText = select(13,BNGetFriendInfo(i))
		NoteAndGroups(noteText, BnetFriendGroups[i])
		for group in pairs(BnetFriendGroups[i]) do
			IncrementGroup(group, true)
			 if not ShiGuangDB["FriendGroupsCollapsed"][group] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, i)
			end
		end
	end
	--favorite friends offline
	for i = 1, numBNetFavoriteOffline do
		local j = i + numBNetFavoriteOnline
		if not BnetFriendGroups[j] then
			BnetFriendGroups[j] = {}
		end
		local noteText = select(13,BNGetFriendInfo(j))
		NoteAndGroups(noteText, BnetFriendGroups[j])
		for group in pairs(BnetFriendGroups[j]) do
			IncrementGroup(group)
			 if not ShiGuangDB["FriendGroupsCollapsed"][group] and not ShiGuangDB["FriendGroupsHideOffline"] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, j)
			end
		end
	end
	-- online Battlenet friends
	for i = 1, numBNetOnline - numBNetFavoriteOnline do
		local j = i + numBNetFavorite
		if not BnetFriendGroups[j] then
			BnetFriendGroups[j] = {}
		end
		local noteText = select(13,BNGetFriendInfo(j))
		NoteAndGroups(noteText, BnetFriendGroups[j])
		for group in pairs(BnetFriendGroups[j]) do
			IncrementGroup(group, true)
			 if not ShiGuangDB["FriendGroupsCollapsed"][group] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, j)
			end
		end
	end
	-- online WoW friends
	for i = 1, numWoWOnline do
		if not WowFriendGroups[i] then
			WowFriendGroups[i] = {}
		end
		local note = C_FriendList.GetFriendInfoByIndex(i) and C_FriendList.GetFriendInfoByIndex(i).notes
		NoteAndGroups(note, WowFriendGroups[i])
		for group in pairs(WowFriendGroups[i]) do
			IncrementGroup(group, true)
			if not ShiGuangDB["FriendGroupsCollapsed"][group] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, i)
			end
		end
	end
	-- offline Battlenet friends
	for i = 1, numBNetOffline - numBNetFavoriteOffline do
		local j = i + numBNetFavorite + numBNetOnline - numBNetFavoriteOnline
		if not BnetFriendGroups[j] then
			BnetFriendGroups[j] = {}
		end
		local noteText = select(13,BNGetFriendInfo(j))
		NoteAndGroups(noteText, BnetFriendGroups[j])
		for group in pairs(BnetFriendGroups[j]) do
			IncrementGroup(group)
			 if not ShiGuangDB["FriendGroupsCollapsed"][group] and not ShiGuangDB["FriendGroupsHideOffline"] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, j)
			end
		end
	end
	-- offline WoW friends
	for i = 1, numWoWOffline do
		local j = i + numWoWOnline
		if not WowFriendGroups[j] then
			WowFriendGroups[j] = {}
		end
		local note = C_FriendList.GetFriendInfoByIndex(j) and C_FriendList.GetFriendInfoByIndex(j).notes
		NoteAndGroups(note, WowFriendGroups[j])
		for group in pairs(WowFriendGroups[j]) do
			IncrementGroup(group)
			if not ShiGuangDB["FriendGroupsCollapsed"][group] and not ShiGuangDB["FriendGroupsHideOffline"] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, j)
			end
		end
	end

	buttonCount = buttonCount + GroupCount
	-- 1.5 is a magic number which preventq the list scroll to be too long
	totalScrollHeight = totalButtonHeight + GroupCount * FRIENDS_BUTTON_HEIGHTS[FRIENDS_BUTTON_TYPE_DIVIDER]

	FriendsFrameFriendsScrollFrame.totalFriendListEntriesHeight = totalScrollHeight
	FriendsFrameFriendsScrollFrame.numFriendListEntries = addButtonIndex

	if buttonCount > #FriendButtons then
		for i = #FriendButtons + 1, buttonCount do
			FriendButtons[i] = {}
		end
	end

	for group in pairs(GroupTotal) do
		table.insert(GroupSorted, group)
	end
	table.sort(GroupSorted)

	if GroupSorted[1] == "" then
		table.remove(GroupSorted, 1)
		table.insert(GroupSorted, "")
	end

	for key,val in pairs(GroupSorted) do
		if val == FriendRequestString then
			table.remove(GroupSorted,key)
			table.insert(GroupSorted,1,FriendRequestString)
		end
	end

	local index = 0
	for _,group in ipairs(GroupSorted) do
		index = index + 1
		FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_DIVIDER
		FriendButtons[index].text = group
		if not ShiGuangDB["FriendGroupsCollapsed"][group] then
			for i = 1, #FriendReqGroup do
				if group == FriendRequestString then
					index = index + 1
					FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_INVITE
					FriendButtons[index].id = i
				end
			end
			for i = 1, numBNetFavoriteOnline do
				if BnetFriendGroups[i][group] then
					index = index + 1
					FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_BNET
					FriendButtons[index].id = i
				end
			end
			for i = numBNetFavorite + 1, numBNetOnline + numBNetFavoriteOffline do
				if BnetFriendGroups[i][group] then
					index = index + 1
					FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_BNET
					FriendButtons[index].id = i
				end
			end
			for i = 1, numWoWOnline do
				if WowFriendGroups[i][group] then
					index = index + 1
					FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_WOW
					FriendButtons[index].id = i
				end
			end
			if not ShiGuangDB["FriendGroupsHideOffline"] then
				for i = numBNetFavoriteOnline + 1, numBNetFavorite do
					if BnetFriendGroups[i][group] then
						index = index + 1
						FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_BNET
						FriendButtons[index].id = i
					end
				end
				for i = numBNetOnline + numBNetFavoriteOffline + 1, numBNetTotal do
					if BnetFriendGroups[i][group] then
						index = index + 1
						FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_BNET
						FriendButtons[index].id = i
					end
				end
				for i = numWoWOnline + 1, numWoWTotal do
					if WowFriendGroups[i][group] then
						index = index + 1
						FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_WOW
						FriendButtons[index].id = i
					end
				end
			end
		end
	end
	FriendButtons.count = index

	-- selection
	local selectedFriend = 0
	-- check that we have at least 1 friend
	if numBNetTotal + numWoWTotal > 0 then
		-- get friend
		if FriendsFrame.selectedFriendType == FRIENDS_BUTTON_TYPE_WOW then
			selectedFriend = C_FriendList.GetSelectedFriend()
		elseif FriendsFrame.selectedFriendType == FRIENDS_BUTTON_TYPE_BNET then
			selectedFriend = BNGetSelectedFriend()
		end
		-- set to first in list if no friend
		if not selectedFriend or selectedFriend == 0 then
			FriendsFrame_SelectFriend(FriendButtons[1].buttonType, 1)
			selectedFriend = 1
		end
		-- check if friend is online
		FriendsFrameSendMessageButton:SetEnabled(FriendsList_CanWhisperFriend(FriendsFrame.selectedFriendType, selectedFriend))
	else
		FriendsFrameSendMessageButton:Disable()
	end
	FriendsFrame.selectedFriend = selectedFriend

	-- RID warning, upon getting the first RID invite
	local showRIDWarning = false
	local numInvites = BNGetNumFriendInvites()
	if ( numInvites > 0 and not GetCVarBool("pendingInviteInfoShown") ) then
		local _, _, _, _, _, _, isRIDEnabled = BNGetInfo()
		if ( isRIDEnabled ) then
			for i = 1, numInvites do
				local inviteID, accountName, isBattleTag = BNGetFriendInviteInfo(i)
				if ( not isBattleTag ) then
					-- found one
					showRIDWarning = true
					break
				end
			end
		end
	end
	if showRIDWarning then
		FriendsListFrame.RIDWarning:Show()
		FriendsFrameFriendsScrollFrame.scrollBar:Disable()
		FriendsFrameFriendsScrollFrame.scrollUp:Disable()
		FriendsFrameFriendsScrollFrame.scrollDown:Disable()
	else
		FriendsListFrame.RIDWarning:Hide()
	end
	FriendGroups_UpdateFriends()
end

local function FriendGroups_OnClick(self, button)
    if not self.text:IsShown() then
        hooks["FriendsFrameFriendButton_OnClick"](self, button)
        return
    end
    
    local group = self.info:GetText() or ""
    if button == "RightButton" then
        --ToggleDropDownMenu(1, group, FriendGroups_Menu, "cursor", 0, 0)
        ShiGuangDB["FriendGroupsHideOffline"] = not ShiGuangDB["FriendGroupsHideOffline"]
        FriendGroups_Update()
    else
        ShiGuangDB["FriendGroupsCollapsed"][group] = not ShiGuangDB["FriendGroupsCollapsed"][group]
        FriendGroups_Update()
    end
end

local function FriendGroups_Rename(self, old)
	local input = self.editBox:GetText()
	if input == "" then
		return
	end
	local groups = {}
	for i = 1, BNGetNumFriends() do
		local presenceID, _, _, _, _, _, _, _, _, _, _, _, noteText = BNGetFriendInfo(i)
		local note = NoteAndGroups(noteText, groups)
		if groups[old] then
			groups[old] = nil
			groups[input] = true
			note = CreateNote(note, groups)
			BNSetFriendNote(presenceID, note)
		end
	end
	for i = 1, C_FriendList.GetNumFriends() do
		local note = C_FriendList.GetFriendInfoByIndex(i) and C_FriendList.GetFriendInfoByIndex(i).notes
		note = NoteAndGroups(note, groups)
		if groups[old] then
			groups[old] = nil
			groups[input] = true
			note = CreateNote(note, groups)
			SetFriendNotes(i, note)
		end
	end
	FriendGroups_Update()
end

local function FriendGroups_Create(self, data)
  if self.editBox:GetText() == "" then return end
	data.set(data.id, AddGroup(data.note, self.editBox:GetText()))
end

StaticPopupDialogs["FRIEND_GROUP_RENAME"] = {
    text = "输入新组别名称",
    button1 = ACCEPT,
    button2 = CANCEL,
    hasEditBox = 1,
    OnAccept = FriendGroups_Rename,
    EditBoxOnEnterPressed = function(self)
        local parent = self:GetParent()
        FriendGroups_Rename(parent, parent.data)
        parent:Hide()
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1
}

StaticPopupDialogs["FRIEND_GROUP_CREATE"] = {
    text = "输入新组别名称",
    button1 = ACCEPT,
    button2 = CANCEL,
    hasEditBox = 1,
    OnAccept = FriendGroups_Create,
    EditBoxOnEnterPressed = function(self)
        local parent = self:GetParent()
        FriendGroups_Create(parent, parent.data)
        parent:Hide()
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1
}

local function InviteOrGroup(clickedgroup, invite)
    local groups = {}
	for i = 1, BNGetNumFriends() do
		local presenceID, _, _, _, _, toonID, _, _, _, _, _, _, noteText = BNGetFriendInfo(i)
		local note = NoteAndGroups(noteText, groups)
		if groups[clickedgroup] then
			if invite and toonID then
				BNInviteFriend(toonID)
			elseif not invite then
				groups[clickedgroup] = nil
				note = CreateNote(note, groups)
				BNSetFriendNote(presenceID, note)
			end
		end
	end
	for i = 1, C_FriendList.GetNumFriends() do
		local friend_info = C_FriendList.GetFriendInfoByIndex(i)
		local name = friend_info.name
		local connected = friend_info.connected
		local noteText = friend_info.notes
		local note = NoteAndGroups(noteText, groups)
		if groups[clickedgroup] then
			if invite and connected then
				InviteUnit(name)
			elseif not invite then
				groups[clickedgroup] = nil
				note = CreateNote(note, groups)
				SetFriendNotes(i, note)
			end
		end
	end
end

--[[local FriendGroups_Menu = CreateFrame("Frame", "FriendGroups_Menu")
FriendGroups_Menu.displayMode = "MENU"
local menu_items = {
		{ text = "", notCheckable = true, isTitle = true },
		{ text = "|cff76ee00重新命名分组|r", notCheckable = true, func = function(self, menu, clickedgroup) StaticPopup_Show("FRIEND_GROUP_RENAME", nil, nil, clickedgroup) end },
		{ text = "|cff76ee00删除分组|r", notCheckable = true, func = function(self, menu, clickedgroup) InviteOrGroup(clickedgroup) end },
		{ text = "|cff76ee00隐藏离线好友|r", checked = function() return ShiGuangDB["FriendGroupsHideOffline"] end, func = function() MSA_CloseDropDownMenus() ShiGuangDB["FriendGroupsHideOffline"] = not ShiGuangDB["FriendGroupsHideOffline"] FriendGroups_Update() end },
}
 
FriendGroups_Menu.initialize = function(self, level)
	if not menu_items[level] then return end
	for _, items in ipairs(menu_items[level]) do
		local info = UIDropDownMenu_CreateInfo()
		for prop, value in pairs(items) do
			info[prop] = value ~= "" and value or UIDROPDOWNMENU_MENU_VALUE ~= "" and UIDROPDOWNMENU_MENU_VALUE or "[ 2 UI ]"
		end
		info.arg1 = k
		info.arg2 = UIDROPDOWNMENU_MENU_VALUE
		UIDropDownMenu_AddButton(info, level)
	end
end]]

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    --if not MaoRUISettingDB["Misc"]["FriendGroups"] then self:UnregisterAllEvents() return end
    if event == "PLAYER_LOGIN" then
        Hook("FriendsList_Update", FriendGroups_Update, true)
        --if other addons have hooked this, we should too
        if not issecurevariable("FriendsFrame_UpdateFriends") then
            Hook("FriendsFrame_UpdateFriends", FriendGroups_UpdateFriends)
        end
        Hook("FriendsFrameFriendButton_OnClick", FriendGroups_OnClick)
        --Hook("UnitPopup_ShowMenu", FriendGroups_SaveOpenMenu, true)
        --Hook("UnitPopup_OnClick", FriendGroups_OnFriendMenuClick, true)
        --Hook("UnitPopup_HideButtons", FriendGroups_HideButtons, true)
        Hook("FriendsFrameTooltip_Show",function(button)
			if ( button.buttonType == FRIENDS_BUTTON_TYPE_DIVIDER ) then
				if FriendsTooltip:IsShown() then
					FriendsTooltip:Hide()
				end
				return
			end
		end,true)-- Fixes tooltip showing on groups

        FriendsFrameFriendsScrollFrame.dynamic = FriendGroups_GetTopButton
        FriendsFrameFriendsScrollFrame.update = FriendGroups_UpdateFriends
		
		--add some more buttons
		FriendsFrameFriendsScrollFrame.buttons[1]:SetHeight(FRIENDS_FRAME_FRIENDS_FRIENDS_HEIGHT)
		HybridScrollFrame_CreateButtons(FriendsFrameFriendsScrollFrame, "FriendsFrameButtonTemplate")
        
        --table.remove(UnitPopupMenus["BN_FRIEND"], 5) --remove target option
        
        --add our add/remove group buttons to the friend list popup menus
        --for _,menu in ipairs(friend_popup_menus) do
			--table.insert(UnitPopupMenus[menu], #UnitPopupMenus[menu], "FRIEND_GROUP_NEW")
			--table.insert(UnitPopupMenus[menu], #UnitPopupMenus[menu], "FRIEND_GROUP_ADD")
            --table.insert(UnitPopupMenus[menu], #UnitPopupMenus[menu], "FRIEND_GROUP_DEL")
        --end
      
        if ShiGuangDB["FriendGroupsCollapsed"] == nil then ShiGuangDB["FriendGroupsCollapsed"] = {} end
        if ShiGuangDB["FriendGroupsHideOffline"] == nil then ShiGuangDB["FriendGroupsHideOffline"] = true end
        --if ShiGuangDB["FriendGroupsColourClasses"] == nil then ShiGuangDB["FriendGroupsColourClasses"] = true end
    end
end)