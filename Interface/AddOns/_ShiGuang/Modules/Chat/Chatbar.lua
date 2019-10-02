﻿local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:GetModule("Chat")
local gsub, gmatch, tinsert, pairs = string.gsub, string.gmatch, table.insert, pairs

 --------------------------------------- 聊天表情-- Author:M-------------------------------------
-- key為圖片名
local emotes = {
        --表情
  { key = "angel",    zhTW="天使",      zhCN="天使" },
	{ key = "angry",    zhTW="生氣",      zhCN="生气" },
	{ key = "biglaugh", zhTW="大笑",      zhCN="大笑" },
	{ key = "clap",     zhTW="鼓掌",      zhCN="鼓掌" },
	{ key = "cool",     zhTW="酷",        zhCN="酷" },
	{ key = "cry",      zhTW="哭",        zhCN="哭" },
	{ key = "cutie",    zhTW="可愛",      zhCN="可爱" },
	{ key = "despise",  zhTW="鄙視",      zhCN="鄙视" },
	{ key = "dreamsmile", zhTW="美夢",    zhCN="美梦" },
	{ key = "embarrass", zhTW="尷尬",     zhCN="尴尬" },
	{ key = "evil",     zhTW="邪惡",      zhCN="邪恶" },
	{ key = "excited",  zhTW="興奮",      zhCN="兴奋" },
	{ key = "faint",    zhTW="暈",        zhCN="晕" },
	{ key = "fight",    zhTW="打架",      zhCN="打架" },
	{ key = "flu",      zhTW="流感",      zhCN="流感" },
	{ key = "freeze",   zhTW="呆",        zhCN="呆" },
	{ key = "frown",    zhTW="皺眉",      zhCN="皱眉" },
	{ key = "greet",    zhTW="致敬",      zhCN="致敬" },
	{ key = "grimace",  zhTW="鬼臉",      zhCN="鬼脸" },
	{ key = "growl",    zhTW="齜牙",      zhCN="龇牙" },
	{ key = "happy",    zhTW="開心",      zhCN="开心" },
	{ key = "heart",    zhTW="心",        zhCN="心" },
	{ key = "horror",   zhTW="恐懼",      zhCN="恐惧" },
	{ key = "ill",      zhTW="生病",      zhCN="生病" },
	{ key = "innocent", zhTW="無辜",      zhCN="无辜" },
	{ key = "kongfu",   zhTW="功夫",      zhCN="功夫" },
	{ key = "love",     zhTW="花痴",      zhCN="花痴" },
	{ key = "mail",     zhTW="郵件",      zhCN="邮件" },
	{ key = "makeup",   zhTW="化妝",      zhCN="化妆" },
    { key = "mario",    zhTW="馬里奧",    zhCN="马里奥" },
	{ key = "meditate", zhTW="沉思",      zhCN="沉思" },
	{ key = "miserable", zhTW="可憐",     zhCN="可怜" },
	{ key = "okay",     zhTW="好",        zhCN="好" },
	{ key = "pretty",   zhTW="漂亮",      zhCN="漂亮" },
	{ key = "puke",     zhTW="吐",        zhCN="吐" },
	{ key = "shake",    zhTW="握手",      zhCN="握手" },
	{ key = "shout",    zhTW="喊",        zhCN="喊" },
	{ key = "shuuuu",   zhTW="閉嘴",      zhCN="闭嘴" },
	{ key = "shy",      zhTW="害羞",      zhCN="害羞" },
	{ key = "sleep",    zhTW="睡覺",      zhCN="睡觉" },
	{ key = "smile",    zhTW="微笑",      zhCN="微笑" },
	{ key = "suprise",  zhTW="吃驚",      zhCN="吃惊" },
	{ key = "surrender", zhTW="失敗",     zhCN="失败" },
	{ key = "sweat",    zhTW="流汗",      zhCN="流汗" },
	{ key = "tear",     zhTW="流淚",      zhCN="流泪" },
	{ key = "tears",    zhTW="悲劇",      zhCN="悲剧" },
	{ key = "think",    zhTW="想",        zhCN="想" },
	{ key = "titter",   zhTW="偷笑",      zhCN="偷笑" },
	{ key = "ugly",     zhTW="猥瑣",      zhCN="猥琐" },
	{ key = "victory",  zhTW="勝利",      zhCN="胜利" },
	{ key = "volunteer", zhTW="雷鋒",     zhCN="雷锋" },
	{ key = "wronged",  zhTW="委屈",      zhCN="委屈" },    
        --指定了texture一般用於BLIZ自帶的素材
    { key = "wrong",    zhTW="錯",        zhCN="错",    texture = "Interface\\RaidFrame\\ReadyCheck-NotReady" },
    { key = "right",    zhTW="對",        zhCN="对",    texture = "Interface\\RaidFrame\\ReadyCheck-Ready" },
    { key = "question", zhTW="疑問",      zhCN="疑问",  texture = "Interface\\RaidFrame\\ReadyCheck-Waiting" },
    { key = "skull",    zhTW="骷髏",      zhCN="骷髅",  texture = "Interface\\TargetingFrame\\UI-TargetingFrame-Skull" },
    { key = "sheep",    zhTW="羊",        zhCN="羊",    texture = "Interface\\TargetingFrame\\UI-TargetingFrame-Sheep" },
        --原版暴雪提供的8个图标
    { key = "rt1",    zhTW="rt1",        zhCN="rt1",    texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1" },
    { key = "rt2",    zhTW="rt2",        zhCN="rt2",    texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2" },
    { key = "rt3",    zhTW="rt3",        zhCN="rt3",    texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_3" },
    { key = "rt4",    zhTW="rt4",        zhCN="rt4",    texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_4" },
    { key = "rt5",    zhTW="rt5",        zhCN="rt5",    texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_5" },
    { key = "rt6",    zhTW="rt6",        zhCN="rt6",    texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_6" },
    { key = "rt7",    zhTW="rt7",        zhCN="rt7",    texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_7" },
    { key = "rt8",    zhTW="rt8",        zhCN="rt8",    texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8" },
}


local function ReplaceEmote(value)
    local emote = value:gsub("[%{%}]", "")
    for _, v in ipairs(emotes) do
        if (emote == v.key or emote == v.zhCN or emote == v.zhTW) then
            return "|T".. (v.texture or "Interface\\AddOns\\_ShiGuang\\Media\\Emotes\\".. v.key) ..":16|t"
        end
    end
    return value
end

local function filter(self, event, msg, ...)
    msg = msg:gsub("%{.-%}", ReplaceEmote)
    return false, msg, ...
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", filter)

 --------------------------------------- 聊天表情-- Author:M  end -------------------------------------
 
function module:Chatbar()
	if not MaoRUISettingDB["Chat"]["Chatbar"] then return end
	local chatFrame = SELECTED_DOCK_FRAME
	local editBox = chatFrame.editBox
	local width, height, padding, buttonList = 16, 18, 6, {}
	local tinsert, pairs = table.insert, pairs
	local Chatbar = CreateFrame("Frame", nil, UIParent)
	Chatbar:SetSize(width, height)
	Chatbar:SetPoint("TOPLEFT", _G.ChatFrame1, "BOTTOMLEFT", 0, 0)

  ------------------------聊天表情--以下是界面部分------------------------
  local function EmoteButton_OnClick(self, button)
    local editBox = ChatEdit_ChooseBoxForSend()
    ChatEdit_ActivateChat(editBox)
    editBox:SetText(editBox:GetText():gsub("{$","") .. self.emote)
    if (button == "LeftButton") then self:GetParent():Hide() end
  end

	Emote_CallButton=CreateFrame("Button","Emote_CallButton",Chatbar)
 	Emote_CallButton:SetSize(18, 18)
 	Emote_CallButton:SetPoint("LEFT", Chatbar, "LEFT", 0, 0)
 	Emote_CallButton:SetNormalTexture("Interface\\AddOns\\_ShiGuang\\media\\Emotes\\suprise")
	Emote_CallButton:SetParent(Chatbar)
 	Emote_CallButton:RegisterForClicks("AnyUp")
 	Emote_CallButton:SetScript("OnClick",function(self) if Emote_IconPanel:IsShown() then Emote_IconPanel:Hide() else Emote_IconPanel:Show() end end)

    local Emote_width, Emote_height, column, space = 21, 21, 13, 6
    local index = 0
    Emote_IconPanel = CreateFrame("Frame", "Emote_IconPanel", Emote_CallButton)
    Emote_IconPanel:SetWidth(column*(Emote_width+space) + 8)
    Emote_IconPanel:SetBackdrop(
        {
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
            insets = {left = 3, right = 3, top = 3, bottom = 3}
        }
    )
    Emote_IconPanel:SetBackdropColor(0,0,0)
    Emote_IconPanel:SetClampedToScreen(true)
    Emote_IconPanel:SetFrameStrata("DIALOG")
    Emote_IconPanel:SetPoint("BOTTOMLEFT",Emote_CallButton,"TOPLEFT",-23,0)
    for _, v in ipairs(emotes) do
        button = CreateFrame("Button", nil, Emote_IconPanel)
        button.emote = "{" .. (v[GetLocale()] or v.key) .. "}"
        button:SetSize(Emote_width, Emote_height)
        if (v.texture) then
            button:SetNormalTexture(v.texture)
        else
            button:SetNormalTexture("Interface\\AddOns\\_ShiGuang\\Media\\Emotes\\" .. v.key)
        end
        button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
        button:SetPoint("TOPLEFT", 8+(index%column)*(Emote_width+space), -8 - floor(index/column)*(Emote_height+space))
        button:SetScript("OnMouseUp", EmoteButton_OnClick)
        button:SetScript("OnEnter", EmoteButton_OnEnter)
        button:SetScript("OnLeave", EmoteButton_OnLeave)
        index = index + 1
    end
    Emote_IconPanel:SetHeight(ceil(index/column)*(Emote_height+space) +8)
    Emote_IconPanel:SetAlpha(0.8)
    Emote_IconPanel:Hide()
    --让输入框支持当输入 { 时自动弹出聊天表情选择框
    hooksecurefunc("ChatEdit_OnTextChanged", function(self, userInput)
        local text = self:GetText()
        if (userInput and strsub(text, -1) == "{") then
            Emote_IconPanel:Show()
        end
    end)

	local function AddButton(r, g, b, text, func)
		local bu = CreateFrame("Button", nil, Chatbar, "SecureActionButtonTemplate")
		bu:SetSize(width, height)
		M.CreateFS(bu, 15, text, "Chatbar", "CENTER", 0, 0, r, g, b)
		bu:SetHitRectInsets(0, 0, -8, -8)
		bu:RegisterForClicks("AnyUp")
		--if text then M.AddTooltip(bu, "ANCHOR_TOP", M.HexRGB(r, g, b)..text) end
		if func then bu:SetScript("OnClick", func) end
		tinsert(buttonList, bu)
		return bu
	end

	local function StatReport()  -- 属性收集
		local StatInfo = ""
			StatInfo = StatInfo..("血量:%s "):format(UnitHealthMax("player"))
			StatInfo = StatInfo..(STAT_STRENGTH..":%s "):format(UnitStat("player", 1))
   	 StatInfo = StatInfo..(STAT_AGILITY..":%s "):format(UnitStat("player", 2))
   	 StatInfo = StatInfo..(STAT_INTELLECT..":%s "):format(UnitStat("player", 4))
   	 StatInfo = StatInfo..(STAT_STAMINA..":%s "):format(UnitStat("player", 3))
			StatInfo = StatInfo..(STAT_ARMOR..":%s "):format(UnitArmor("player"))
			StatInfo = StatInfo..("精神:%s "):format(UnitStat("player", 5))
			StatInfo = StatInfo..("法力回复:%d "):format(GetManaRegen()*5)
			StatInfo = StatInfo..("闪避:%.2f%% "):format(GetDodgeChance())
			StatInfo = StatInfo..("招架:%.2f%% "):format(GetParryChance())
			StatInfo = StatInfo..("格挡:%.2f%% "):format(GetBlockChance())
			StatInfo = StatInfo..(STAT_HASTE..":%.2f%% "):format(GetHaste())  --GetMeleeHaste
			StatInfo = StatInfo..(STAT_CRITICALSTRIKE..":%.2f%% "):format(GetCritChance())
		return StatInfo
	end

	-- Create Chatbars
	local buttonInfo = {
		{255/255,255/255,255/255, Chatbar_ChannelSay, function() ChatFrame_OpenChat("/s ", chatFrame) end},  --SAY.."/"..YELL
		{255/255, 64/255, 64/255, Chatbar_ChannelYell, function() ChatFrame_OpenChat("/y ", chatFrame) end},
		{170/255, 170/255, 255/255, Chatbar_ChannelParty, function() ChatFrame_OpenChat("/p ", chatFrame) end},   --PARTY
		{255/255, 127/255, 0, Chatbar_ChannelBattleGround, function() ChatFrame_OpenChat("/i ", chatFrame) end},  --INSTANCE.."/"..RAID
		{255/255, 127/255, 0, Chatbar_ChannelRaid, function() ChatFrame_OpenChat("/raid ", chatFrame) end},
		{255/255, 69/255, 0, Chatbar_ChannelRaidWarns, function() ChatFrame_OpenChat("/rw ", chatFrame) end},
		{64/255, 255/255, 64/255, Chatbar_ChannelGuild, function() ChatFrame_OpenChat("/g ", chatFrame) end},    --GUILD.."/"..OFFICER
		{170/255, 170/255, 255/255, Chatbar_ChannelOfficer, function() ChatFrame_OpenChat("/o ", chatFrame) end},
		--{0.8, 255/255, 0.6, Chatbar_rollText, function() ChatFrame_OpenChat("/roll", chatFrame) end},
		{0.1, 0.6, 255/255, Chatbar_StatReport, function() ChatFrame_OpenChat(StatReport(), chatFrame) end},
	}
	for _, info in pairs(buttonInfo) do AddButton(unpack(info)) end

	-- ROLL
	local roll = AddButton(.8, 1, .6, Chatbar_rollText)  --LOOT_ROLL
	roll:SetAttribute("type", "macro")
	roll:SetAttribute("macrotext", "/roll")

	-- COMBATLOG
	--local combat = AddButton(1, 1, 0, BINDING_NAME_TOGGLECOMBATLOG)
	--combat:SetAttribute("type", "macro")
	--combat:SetAttribute("macrotext", "/combatlog")
	
	-- WORLD CHANNEL
	if GetCVar("portal") == "CN" then
		local channelName, channelID, channels = "大脚世界频道"
		local wc = AddButton(255/255, 200/255, 150/255, "世")  --U["World Channel"]

		local function isInChannel(event)
			C_Timer.After(.1, function()
				channels = {GetChannelList()}
				for i = 1, #channels do
					if channels[i] == channelName then
						wc.inChannel = true
						channelID = channels[i-1]
						break
					end
				end
				--if wc.inChannel then
					--wc.Icon:SetVertexColor(0, .8, 1)
				--else
					--wc.Icon:SetVertexColor(1, .1, .1)
				--end
			end)

			if event == "PLAYER_ENTERING_WORLD" then
				M:UnregisterEvent(event, isInChannel)
			end
		end
		M:RegisterEvent("PLAYER_ENTERING_WORLD", isInChannel)
		M:RegisterEvent("CHANNEL_UI_UPDATE", isInChannel)

		wc:SetScript("OnClick", function(_, btn)
			if wc.inChannel then
				if btn == "RightButton" then
					LeaveChannelByName(channelName)
					print("<<<|cffFF7F50"..QUIT.."世界頻道|r")  --"|cffFF7F50"..QUIT.."|r "..I.InfoColor..U["World Channel"]
					wc.inChannel = false
				else
					ChatFrame_OpenChat("/"..channelID, chatFrame)
				end
			else
				JoinPermanentChannel(channelName, nil, 1)
				ChatFrame_AddChannel(ChatFrame1, channelName)
				print(">>>|cff00C957"..JOIN.."世界頻道|r")  --"|cff00C957"..JOIN.."|r "..I.InfoColor..U["World Channel"]
				wc.inChannel = true
			end
		end)
	end

	-- Order Postions
	for i = 1, #buttonList do
		if i == 1 then
			buttonList[i]:SetPoint("LEFT", Emote_CallButton, "RIGHT", 4, -2)
		else
			buttonList[i]:SetPoint("LEFT", buttonList[i-1], "RIGHT", padding, 0)
		end
	end

--Voice
	-- Custom ChatMenu
	Voice = CreateFrame("Button", nil, Chatbar)
	Voice:SetSize(18, 18)
	if GetCVar("portal") == "CN" then
	Voice:SetPoint("LEFT", buttonList[11], "RIGHT", 3, 0)
	else
	Voice:SetPoint("LEFT", buttonList[10], "RIGHT", 3, 0)
	end
	Voice:SetNormalTexture("Interface\\AddOns\\_ShiGuang\\media\\Emotes\\zhuan_push_frame")
	Voice:RegisterForClicks("AnyUp")
	Voice:SetScript("OnClick",function(self) if VoiceFrame:IsShown() then VoiceFrame:Hide() else VoiceFrame:Show() end end)
	
	VoiceFrame = CreateFrame("Frame", nil, Chatbar)
	VoiceFrame:SetSize(25, 100)
	VoiceFrame:Hide()
	VoiceFrame:SetPoint("TOPRIGHT", _G.ChatFrame1, 22, 0)
	
	_G.ChatFrameMenuButton:ClearAllPoints()
	_G.ChatFrameMenuButton:SetPoint("TOP", VoiceFrame)	
	_G.ChatFrameMenuButton:SetParent(VoiceFrame)
	_G.ChatFrameChannelButton:ClearAllPoints()
	_G.ChatFrameChannelButton:SetPoint("TOP", _G.ChatFrameMenuButton, "BOTTOM", 0, -2)
	_G.ChatFrameChannelButton:SetParent(VoiceFrame)
	_G.ChatAlertFrame:ClearAllPoints()
	_G.ChatAlertFrame:SetPoint("BOTTOMLEFT", _G.ChatFrame1Tab, "TOPLEFT", 6, 6)
--end

-------------------------- 處理聊天氣泡------------------------
    if (GetCVarBool("chatBubbles")) then
    local frame = CreateFrame("Frame", nil, UIParent)
    --替換文字為表情
    local function TextToEmote(text)
        text = text:gsub("%{.-%}", ReplaceEmote)
        return text
    end
    --找出氣泡框
    local function FindAndReplaceBubble(self)
        local b, v, f
        for i = 2, WorldFrame:GetNumChildren() do
            v = select(i, WorldFrame:GetChildren())
            if (v:IsForbidden()) then return end
            b = v:GetBackdrop()
            if (v:IsShown() and b and b.bgFile == "Interface\\Tooltips\\ChatBubble-Background") then
                for j = 1, v:GetNumRegions() do
                    f = select(j, v:GetRegions())
                    if f:GetObjectType() == "FontString" then
                        local text = f:GetText() or ""
                        local after = TextToEmote(text)
                        if (after ~= text) then
                            f:SetText(after)
                        end
                    end
                end
            end
        end
    end
    frame:SetScript("OnUpdate", function(self, elapsed)
        self.timer = (self.timer or 0) + elapsed
        if (not self.paused and self.timer > 0.16) then
            self.timer = 0
            FindAndReplaceBubble(self)
        end
    end)
    end
end