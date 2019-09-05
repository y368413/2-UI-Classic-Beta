﻿local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:RegisterModule("Chat")
-- Reskin Chat
local maxLines = 1024
local INTERFACE_ACTION_BLOCKED = INTERFACE_ACTION_BLOCKED
local maxWidth, maxHeight = UIParent:GetWidth(), UIParent:GetHeight()
local tostring, pairs, ipairs, strsub, strlower, gsub, strfind = tostring, pairs, ipairs, string.sub, string.lower, string.gsub, string.find
local IsInGroup, IsInRaid, IsInGuild, IsShiftKeyDown, IsControlKeyDown = IsInGroup, IsInRaid, IsInGuild, IsShiftKeyDown, IsControlKeyDown
local ChatEdit_UpdateHeader, GetChatWindowInfo, GetChannelList, GetCVar, SetCVar, Ambiguate = ChatEdit_UpdateHeader, GetChatWindowInfo, GetChannelList, GetCVar, SetCVar, Ambiguate
local GetNumGuildMembers, GetGuildRosterInfo, IsGuildMember, UnitIsGroupLeader, UnitIsGroupAssistant, InviteToGroup = GetNumGuildMembers, GetGuildRosterInfo, IsGuildMember, UnitIsGroupLeader, UnitIsGroupAssistant, InviteToGroup
local BNGetFriendInfoByID, BNGetGameAccountInfo, CanCooperateWithGameAccount, BNInviteFriend, BNFeaturesEnabledAndConnected = BNGetFriendInfoByID, BNGetGameAccountInfo, CanCooperateWithGameAccount, BNInviteFriend, BNFeaturesEnabledAndConnected

function module:TabSetAlpha(alpha)
	if alpha ~= 1 and (not self.isDocked or GeneralDockManager.selected:GetID() == self:GetID()) then
		self:SetAlpha(1)
	elseif alpha < .6 then
		self:SetAlpha(.6)
	end
end

function module:SkinChat()
	if not self or (self and self.styled) then return end

	local name = self:GetName()
	local fontStyle, fontSize, _= self:GetFont()
	self:SetClampRectInsets(0, 0, 0, 0)
	self:SetMaxResize(maxWidth, maxHeight)
	self:SetMinResize(120, 60)
	self:SetFont(fontStyle, fontSize)  --, "OUTLINE"
	self:SetShadowOffset(1, -1)
	self:SetShadowColor(0, 0, 0, 0)
	self:SetClampRectInsets(0, 0, 0, 0)
	self:SetClampedToScreen(false)
	if self:GetMaxLines() < maxLines then
		self:SetMaxLines(maxLines)
	end

	local eb = _G[name.."EditBox"]
	eb:SetAltArrowKeyMode(false)
	eb:ClearAllPoints()
	eb:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 2, 21)
	eb:SetPoint("TOPRIGHT", self, "TOPRIGHT", -12, 43)
	M.CreateBD(eb)
	M.CreateSD(eb)
	M.CreateTex(eb)
	for i = 3, 8 do
		select(i, eb:GetRegions()):SetAlpha(0)
	end

	local lang = _G[name.."EditBoxLanguage"]
	lang:GetRegions():SetAlpha(0)
	lang:SetPoint("TOPLEFT", eb, "TOPRIGHT", 2, 0)
	lang:SetPoint("BOTTOMRIGHT", eb, "BOTTOMRIGHT", 21, 0)
	M.CreateBD(lang)
	M.CreateSD(lang)
	M.CreateTex(lang)

	local tab = _G[name.."Tab"]
	--tab:SetAlpha(1)
	local tabFs = tab:GetFontString()
	tabFs:SetFont(I.Font[1], I.Font[2]+2, I.Font[3])
	tabFs:SetShadowColor(0, 0, 0, 0)
	tabFs:SetTextColor(1, .8, 0)
	M.StripTextures(tab, 7)
	--hooksecurefunc(tab, "SetAlpha", module.TabSetAlpha)

	if MaoRUISettingDB["Chat"]["Lock"] then M.StripTextures(self) end
	M.HideObject(self.buttonFrame)
	--M.HideObject(self.ScrollBar)
	M.HideObject(self.ScrollToBottomButton)

	self.styled = true
end

-- Swith channels by Tab
local cycles = {
	{ chatType = "SAY", use = function() return 1 end },
    { chatType = "PARTY", use = function() return IsInGroup() end },
    { chatType = "RAID", use = function() return IsInRaid() end },
    { chatType = "GUILD", use = function() return IsInGuild() end },
	{ chatType = "CHANNEL", use = function(_, editbox)
		if GetCVar("portal") ~= "CN" then return false end
		local channels, inWorldChannel, number = {GetChannelList()}
		for i = 1, #channels do
			if channels[i] == "大脚世界频道" then
				inWorldChannel = true
				number = channels[i-1]
				break
			end
		end
		if inWorldChannel then
			editbox:SetAttribute("channelTarget", number)
			return true
		else
			return false
		end
	end },
    { chatType = "SAY", use = function() return 1 end },
}

function module:UpdateTabChannelSwitch()
	if strsub(tostring(self:GetText()), 1, 1) == "/" then return end
    local currChatType = self:GetAttribute("chatType")
    for i, curr in ipairs(cycles) do
        if curr.chatType == currChatType then
            local h, r, step = i+1, #cycles, 1
            if IsShiftKeyDown() then h, r, step = i-1, 1, -1 end
            for j = h, r, step do
                if cycles[j]:use(self, currChatType) then
                    self:SetAttribute("chatType", cycles[j].chatType)
                    ChatEdit_UpdateHeader(self)
                    return
                end
            end
        end
    end
end
hooksecurefunc("ChatEdit_CustomTabPressed", module.UpdateTabChannelSwitch)

-- Quick Scroll
function module:QuickMouseScroll(dir)
	if dir > 0 then
		if IsShiftKeyDown() then
			self:ScrollToTop()
		elseif IsControlKeyDown() then
			self:ScrollUp()
			self:ScrollUp()
		end
	else
		if IsShiftKeyDown() then
			self:ScrollToBottom()
		elseif IsControlKeyDown() then
			self:ScrollDown()
			self:ScrollDown()
		end
	end
end
hooksecurefunc("FloatingChatFrame_OnMouseScroll", module.QuickMouseScroll)

-- Autoinvite by whisper
local whisperList = {}
function module:UpdateWhisperList()
	M.SplitList(whisperList, MaoRUISettingDB["Chat"]["Keyword"], true)
end

function module:IsUnitInGuild(unitName)
	if not unitName then return end
	for i = 1, GetNumGuildMembers() do
		local name = GetGuildRosterInfo(i)
		if name and Ambiguate(name, "none") == Ambiguate(unitName, "none") then
			return true
		end
	end

	return false
end

function module.OnChatWhisper(event, ...)
	local msg, author, _, _, _, _, _, _, _, _, _, guid, presenceID = ...
	for word in pairs(whisperList) do
		if (not IsInGroup() or UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) and strlower(msg) == strlower(word) then
			if event == "CHAT_MSG_BN_WHISPER" then
				local gameID = select(6, BNGetFriendInfoByID(presenceID))
				if gameID then
					local _, charName, _, realmName = BNGetGameAccountInfo(gameID)
					if CanCooperateWithGameAccount(gameID) and (not MaoRUISettingDB["Chat"]["GuildInvite"] or module:IsUnitInGuild(charName.."-"..realmName)) then
						BNInviteFriend(gameID)
					end
				end
			else
				if not MaoRUISettingDB["Chat"]["GuildInvite"] or IsGuildMember(guid) then
					InviteToGroup(author)
				end
			end
		end
	end
end

function module:WhipserInvite()
	if not MaoRUISettingDB["Chat"]["Invite"] then return end
	self:UpdateWhisperList()
	M:RegisterEvent("CHAT_MSG_WHISPER", module.OnChatWhisper)
	M:RegisterEvent("CHAT_MSG_BN_WHISPER", module.OnChatWhisper)
end

-- Timestamp
function module:UpdateTimestamp()
	local greyStamp = I.GreyColor.."[%H:%M:%S]|r "
	if MaoRUIDB["Timestamp"] then
		SetCVar("showTimestamps", greyStamp)
	elseif GetCVar("showTimestamps") == greyStamp then
		SetCVar("showTimestamps", "none")
	end
end

-- Sticky whisper
function module:ChatWhisperSticky()
	if MaoRUISettingDB["Chat"]["Sticky"] then
		ChatTypeInfo["WHISPER"].sticky = 1
		ChatTypeInfo["BN_WHISPER"].sticky = 1
	else
		ChatTypeInfo["WHISPER"].sticky = 0
		ChatTypeInfo["BN_WHISPER"].sticky = 0
	end
end

local isScaling = false
function module:FixChatFrameAnchor()
	if isScaling then return end
	isScaling = true

	local x, y = select(4, ChatFrame1:GetPoint())
	if x ~= 0 or y ~= 28 then
		ChatFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 21)
	end
	isScaling = false
end

function module:UpdateTabColors(selected)
	if selected then
		self:GetFontString():SetTextColor(1, .8, 0)
	else
		self:GetFontString():SetTextColor(.5, .5, .5)
	end
end

-- Easy Resizing chatframe by dragging tab1
function module:ResizeChatFrame()
	ChatFrame1Tab:HookScript("OnMouseDown", function(_, btn)
		if btn == "LeftButton" then
			if select(8, GetChatWindowInfo(1)) then
				ChatFrame1:StartSizing("TOP")
			end
		end
	end)
	ChatFrame1Tab:SetScript("OnMouseUp", function(_, btn)
		if btn == "LeftButton" then
			ChatFrame1:StopMovingOrSizing()
			FCF_SavePositionAndDimensions(ChatFrame1)
		end
	end)
end

function module:UpdateChannelNames(text, ...)
	if strfind(text, INTERFACE_ACTION_BLOCKED) then return end
		text = gsub(text, "|h%[(%d+)%. 大脚世界频道%]|h", "|h%[%1%.世界%]|h")
		text = gsub(text, "|h%[(%d+)%. 大腳世界頻道%]|h", "|h%[%1%.世界%]|h")
		return self.oldAddMsg(self, text, ...) --self.oldAddMsg(self, gsub(text, "|h%[(%d+)%..-%]|h", "|h[%1]|h"), ...)
end

function module:OnLogin()
	for i = 1, NUM_CHAT_WINDOWS do
		self.SkinChat(_G["ChatFrame"..i])
		-- ChannelRename
		if i ~= 2 then
			local chatFrame = _G["ChatFrame"..i]
			chatFrame.oldAddMsg = chatFrame.AddMessage
			chatFrame.AddMessage = module.UpdateChannelNames
		end
	end

	hooksecurefunc("FCF_OpenTemporaryWindow", function()
		for _, chatFrameName in next, CHAT_FRAMES do
			local frame = _G[chatFrameName]
			if frame.isTemporary then
				self.SkinChat(frame)
			end
		end
	end)

	hooksecurefunc("FCFTab_UpdateColors", self.UpdateTabColors)

	-- Font size
	for i = 1, 15 do
		CHAT_FONT_HEIGHTS[i] = i + 9
	end

	-- Default
	SetCVar("chatStyle", "classic")
	M.HideOption(InterfaceOptionsSocialPanelChatStyle)
	CombatLogQuickButtonFrame_CustomTexture:SetTexture(nil)

	-- Fix chatframe anchor after scaling
	if MaoRUISettingDB["Chat"]["Lock"] then
		M:RegisterEvent("UI_SCALE_CHANGED", self.FixChatFrameAnchor)
	end

	-- Add Elements
	self:UpdateTimestamp()
	self:ChatWhisperSticky()
	self:ChatFilter()
	self:Chatbar()
	self:UrlCopy()
	self:WhipserInvite()

	-- ProfanityFilter
	if not BNFeaturesEnabledAndConnected() then return end
	if not MaoRUISettingDB["Chat"]["Freedom"] then
		SetCVar("profanityFilter", 1)
	else
		SetCVar("profanityFilter", 0)
	end
end