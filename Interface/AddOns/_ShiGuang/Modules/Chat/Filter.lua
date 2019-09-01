local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:GetModule("Chat")

local strfind, gsub = string.find, string.gsub
local pairs, ipairs, tonumber = pairs, ipairs, tonumber
local min, max, tremove = math.min, math.max, table.remove
local IsGuildMember, C_FriendList_IsFriend, IsGUIDInGroup, C_Timer_After = IsGuildMember, C_FriendList.IsFriend, IsGUIDInGroup, C_Timer.After
local Ambiguate, UnitIsUnit, BNGetGameAccountInfoByGUID, GetTime, SetCVar = Ambiguate, UnitIsUnit, BNGetGameAccountInfoByGUID, GetTime, SetCVar
local BN_TOAST_TYPE_CLUB_INVITATION = BN_TOAST_TYPE_CLUB_INVITATION or 6

-- Filter Chat symbols
local msgSymbols = {"`", "～", "＠", "＃", "^", "＊", "！", "？", "。", "|", " ", "—", "——", "￥", "’", "‘", "“", "”", "【", "】", "『", "』", "《", "》", "〈", "〉", "（", "）", "〔", "〕", "、", "，", "：", ",", "_", "/", "~", "%-", "%."}

local FilterList = {}
function module:UpdateFilterList()
	M.SplitList(FilterList, MaoRUIDB["ChatFilterList"], true)
end

-- ECF strings compare
local last, this = {}, {}
function module:CompareStrDiff(sA, sB) -- arrays of bytes
	local len_a, len_b = #sA, #sB
	for j = 0, len_b do
		last[j+1] = j
	end
	for i = 1, len_a do
		this[1] = i
		for j = 1, len_b do
			this[j+1] = (sA[i] == sB[j]) and last[j] or (min(last[j+1], this[j], last[j]) + 1)
		end
		for j = 0, len_b do
			last[j+1] = this[j+1]
		end
	end
	return this[len_b+1] / max(len_a, len_b)
end

R.BadBoys = {} -- debug
local chatLines, prevLineID, filterResult = {}, 0, false
function module:GetFilterResult(event, msg, name, flag, guid)
	if name == I.MyName or (event == "CHAT_MSG_WHISPER" and flag == "GM") or flag == "DEV" then
		return
	elseif guid and (IsGuildMember(guid) or BNGetGameAccountInfoByGUID(guid) or C_FriendList_IsFriend(guid) or (IsInInstance() and IsGUIDInGroup(guid))) then
		return
	end

	if R.BadBoys[name] and R.BadBoys[name] >= 5 then return true end

	local filterMsg = gsub(msg, "|H.-|h(.-)|h", "%1")
	filterMsg = gsub(filterMsg, "|c%x%x%x%x%x%x%x%x", "")
	filterMsg = gsub(filterMsg, "|r", "")

	-- Trash Filter
	for _, symbol in ipairs(msgSymbols) do
		filterMsg = gsub(filterMsg, symbol, "")
	end

	local matches = 0
	for keyword in pairs(FilterList) do
		if keyword ~= "" then
			local _, count = gsub(filterMsg, keyword, "")
			if count > 0 then
				matches = matches + 1
			end
		end
	end

	if matches >= MaoRUISettingDB["Chat"]["Matches"] then
		return true
	end

	-- ECF Repeat Filter
	local msgTable = {name, {}, GetTime()}
	if filterMsg == "" then filterMsg = msg end
	for i = 1, #filterMsg do
		msgTable[2][i] = filterMsg:byte(i)
	end
	local chatLinesSize = #chatLines
	chatLines[chatLinesSize+1] = msgTable
	for i = 1, chatLinesSize do
		local line = chatLines[i]
		if line[1] == msgTable[1] and ((msgTable[3] - line[3] < .6) or module:CompareStrDiff(line[2], msgTable[2]) <= .1) then
			tremove(chatLines, i)
			return true
		end
	end
	if chatLinesSize >= 30 then tremove(chatLines, 1) end
end

function module:UpdateChatFilter(event, msg, author, _, _, _, flag, _, _, _, _, lineID, guid)
	if lineID == 0 or lineID ~= prevLineID then
		prevLineID = lineID

		local name = Ambiguate(author, "none")
		filterResult = module:GetFilterResult(event, msg, name, flag, guid)
		if filterResult then R.BadBoys[name] = (R.BadBoys[name] or 0) + 1 end
	end

	return filterResult
end

-- Block addon msg
local addonBlockList = {
	"任务进度提示", "%[接受任务%]", "%(任务完成%)", "<大脚", "【爱不易】", "EUI[:_]", "打断:.+|Hspell", "PS 死亡: .+>", "%*%*.+%*%*", "<iLvl>", ("%-"):rep(20),
	"<小队物品等级:.+>", "<LFG>", "进度:", "属性通报", "汐寒", "wow.+兑换码", "wow.+验证码", "【有爱插件】", "：.+>"
}

local cvar
local function toggleCVar(value)
	value = tonumber(value) or 1
	SetCVar(cvar, value)
end

function module:ToggleChatBubble(party)
	cvar = "chatBubbles"..(party and "Party" or "")
	if not GetCVarBool(cvar) then return end
	toggleCVar(0)
	C_Timer_After(.01, toggleCVar)
end

function module:UpdateAddOnBlocker(event, msg, author)
	local name = Ambiguate(author, "none")
	if UnitIsUnit(name, "player") then return end

	for _, word in ipairs(addonBlockList) do
		if strfind(msg, word) then
			if event == "CHAT_MSG_SAY" or event == "CHAT_MSG_YELL" then
				module:ToggleChatBubble()
			elseif event == "CHAT_MSG_PARTY" or event == "CHAT_MSG_PARTY_LEADER" then
				module:ToggleChatBubble(true)
			end
			return true
		end
	end
end

-- Block trash clubs
local trashClubs = {"站桩", "致敬我们"}
function module:BlockTrashClub()
	if self.toastType == BN_TOAST_TYPE_CLUB_INVITATION then
		local text = self.DoubleLine:GetText() or ""
		for _, name in pairs(trashClubs) do
			if strfind(text, name) then
				self:Hide()
				return
			end
		end
	end
end



function module:ChatFilter()
	if MaoRUISettingDB["Chat"]["EnableFilter"] then
		self:UpdateFilterList()
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", self.UpdateChatFilter)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", self.UpdateChatFilter)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", self.UpdateChatFilter)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", self.UpdateChatFilter)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", self.UpdateChatFilter)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_TEXT_EMOTE", self.UpdateChatFilter)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", self.UpdateChatFilter)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", self.UpdateChatFilter)
	end

	if MaoRUISettingDB["Chat"]["BlockAddonAlert"] then
		ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", self.UpdateAddOnBlocker)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", self.UpdateAddOnBlocker)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", self.UpdateAddOnBlocker)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", self.UpdateAddOnBlocker)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", self.UpdateAddOnBlocker)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", self.UpdateAddOnBlocker)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", self.UpdateAddOnBlocker)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", self.UpdateAddOnBlocker)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", self.UpdateAddOnBlocker)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", self.UpdateAddOnBlocker)
	end

	hooksecurefunc(BNToastFrame, "ShowToast", self.BlockTrashClub)
end

--MonsterSayFilter
--Turn off MSF in certain quests. Chat msg are repeated but important in these quests.
local MSFOffQuestT = {[42880] = true, [54090]=true,} -- 42880: Meeting their Quota; 54090: Toys For Destruction
local MSFOffQuestFlag = false

--TODO: If player uses hearthstone to leave questzone, QUEST_REMOVED is not fired.
local Questf = CreateFrame("Frame")
Questf:RegisterEvent("QUEST_ACCEPTED")
Questf:RegisterEvent("QUEST_REMOVED")
Questf:SetScript("OnEvent", function(self,event,arg1,arg2)
	if event == "QUEST_ACCEPTED" and MSFOffQuestT[arg2] then MSFOffQuestFlag = true end
	if event == "QUEST_REMOVED" and MSFOffQuestT[arg1] then MSFOffQuestFlag = false end
end)

local MSL, MSLPos = {}, 1
local function monsterFilter(self,_,msg)
	if MSFOffQuestFlag then return end
	for _, v in ipairs(MSL) do if v == msg then return true end end
	MSL[MSLPos] = msg
	MSLPos = MSLPos + 1
	if MSLPos > 7 then MSLPos = MSLPos - 7 end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_SAY", monsterFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_EMOTE", monsterFilter)

--SystemMessage
local SystemFilterTag = {
	-- !!! Always add parentheses since gsub() has two return values !!!
	(ERR_LEARN_ABILITY_S:gsub("%%s","(.*)")),
	(ERR_LEARN_SPELL_S:gsub("%%s","(.*)")),
	(ERR_SPELL_UNLEARNED_S:gsub("%%s","(.*)")),
	(ERR_LEARN_PASSIVE_S:gsub("%%s","(.*)")),
	(ERR_PET_SPELL_UNLEARNED_S:gsub("%%s","(.*)")),
	(ERR_PET_LEARN_ABILITY_S:gsub("%%s","(.*)")),
	(ERR_PET_LEARN_SPELL_S:gsub("%%s","(.*)")),
}
local function systemMsgFilter(self,_,msg)
	for _, s in ipairs(SystemFilterTag) do if msg:find(s) then return true end end
end
if UnitLevel("player") == GetMaxPlayerLevel() then ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", systemMsgFilter) end


local function SendMessage(event, msg)
	local info = ChatTypeInfo[event:sub(10)]
	for i = 1, NUM_CHAT_WINDOWS do
		local ChatFrames = _G["ChatFrame"..i]
		if ChatFrames and ChatFrames:IsEventRegistered(event) then
			ChatFrames:AddMessage(msg, info.r, info.g, info.b)
		end
	end
end


--AchievementFilter
local achievements = {}
local function achievementReady(id)
	local area, guild = achievements[id].CHAT_MSG_ACHIEVEMENT, achievements[id].CHAT_MSG_GUILD_ACHIEVEMENT
	if area and guild then -- merge area to guild
		for name,class in pairs(area) do
			if guild[name] == class then area[name] = nil end
		end
	end
	for event,players in pairs(achievements[id]) do
		if next(players) ~= nil then -- skip empty
			local list = {}
			for name,class in pairs(players) do
				list[#list+1] = format("|c%s|Hplayer:%s|h%s|h|r", RAID_CLASS_COLORS[class].colorStr, name, name)
			end
			SendMessage(event, format("[%s]获得了成就%s！", table.concat(list, "、"), GetAchievementLink(id)))
		end
	end
	achievements[id] = nil
end

local function achievementFilter(self, event, msg, _, _, _, _, _, _, _, _, _, _, guid)
	if not guid or not guid:find("Player") then return end
	local id = tonumber(msg:match("|Hachievement:(%d+)"))
	if not id then return end
	local _,class,_,_,_,name,server = GetPlayerInfoByGUID(guid)
	if not name then return end -- check nil
	if server ~= "" and server ~= playerServer then name = name.."-"..server end
	if not achievements[id] then
		achievements[id] = {}
		C_Timer_After(0.5, function() achievementReady(id) end)
	end
	achievements[id][event] = achievements[id][event] or {}
	achievements[id][event][name] = class
	return true
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_ACHIEVEMENT", achievementFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD_ACHIEVEMENT", achievementFilter)