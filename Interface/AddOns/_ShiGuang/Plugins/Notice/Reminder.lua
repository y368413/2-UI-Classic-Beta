----------------------------------------------------------------------------------------
--	Says thanks for some spells(SaySapped by Bitbyte, modified by m2jest1c)
----------------------------------------------------------------------------------------
local thanksspells = {
	[20484] = true,		-- Rebirth
	[61999] = true,		-- Raise Ally
	[20707] = true,		-- Soulstone
	[50769] = true,		-- Revive
	[2006] = true,		-- Resurrection
	[7328] = true,		-- Redemption
	[2008] = true,		-- Ancestral Spirit
	[115178] = true,	-- Resuscitate
}
local Saythanks = CreateFrame("Frame")
Saythanks:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
Saythanks:SetScript("OnEvent", function()
	local _, subEvent, _, _, buffer, _, _, _, player, _, _, spell = CombatLogGetCurrentEventInfo()
	for key, value in pairs(thanksspells) do
		if spell == key and value == true and player == UnitName("player") and buffer ~= UnitName("player") and subEvent == "SPELL_CAST_SUCCESS" then
			--SendChatMessage("Thanks:"....GetSpellLink(spell)..", "..buffer:gsub("%-[^|]+", ""), "WHISPER", nil, buffer)
			print(GetSpellLink(spell)..SHIGUANG_Gets..buffer)
		end
	end
end)

------------------------------- Order Hall Resources Tooltip
local categoryInfo = {}
do
	local frame = CreateFrame("Frame")
	frame:SetScript("OnEvent", function(self, event)
		if C_Garrison.GetLandingPageGarrisonType() ~= LE_GARRISON_TYPE_7_0 then return end

		if event == "GARRISON_FOLLOWER_CATEGORIES_UPDATED" then
			categoryInfo = C_Garrison.GetClassSpecCategoryInfo(LE_FOLLOWER_TYPE_GARRISON_7_0)
		else
			C_Garrison.RequestClassSpecCategoryInfo(LE_FOLLOWER_TYPE_GARRISON_7_0)
		end
	end)
	frame:RegisterEvent("GARRISON_FOLLOWER_CATEGORIES_UPDATED")
	frame:RegisterEvent("GARRISON_FOLLOWER_ADDED")
	frame:RegisterEvent("GARRISON_FOLLOWER_REMOVED")
	frame:RegisterEvent("GARRISON_TALENT_COMPLETE")
	frame:RegisterEvent("GARRISON_TALENT_UPDATE")
	frame:RegisterEvent("GARRISON_SHOW_LANDING_PAGE")
end

GarrisonLandingPageMinimapButton:HookScript("OnEnter", function(self)
	if C_Garrison.GetLandingPageGarrisonType() ~= LE_GARRISON_TYPE_7_0 then return end

	GameTooltip:SetOwner(self, "ANCHOR_NONE")
	GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 1)
	GameTooltip:SetText(self.title, 1, 1, 1)
	GameTooltip:AddLine(self.description, nil, nil, nil, true)
	GameTooltip:AddLine(" ")

	local currency, amount, icon = GetCurrencyInfo(C_Garrison.GetCurrencyTypes(LE_GARRISON_TYPE_7_0))
	GameTooltip:AddDoubleLine(currency, ("%s |T%s:0:0:0:2:64:64:4:60:4:60|t"):format(BreakUpLargeNumbers(amount), icon), 1, 1, 1, 1, 1, 1)

	if #categoryInfo > 0 then
		GameTooltip:AddLine(" ")
		for _, info in ipairs(categoryInfo) do
			GameTooltip:AddDoubleLine(info.name, ("%d/%d |T%d:0|t"):format(info.count, info.limit, info.icon), 1, 1, 1, 1, 1, 1)
		end
	end

	GameTooltip:Show()
end)

----RepSwitch by Ne0nguy(## Version: 7.3.5.9 ## X-Website: Ne0nguy.com)
RepSwitch = {};
RepSwitch.frame = CreateFrame("Frame", nil, UIParent);
RepSwitch.frame:RegisterEvent("COMBAT_TEXT_UPDATE");
RepSwitch.frame:SetScript("OnEvent", function(_, event, arg1, arg2)
	if(event == "COMBAT_TEXT_UPDATE" and arg1 == "FACTION" and arg2 ~= "Guild") then
		for i=1,GetNumFactions() do
			if arg2 == GetFactionInfo(i) then
				SetWatchedFactionIndex(i);
			end
		end
	end
end);
----SonicReputation by 小刺猬(updata for 7.2 by 灰原哀709@NGA)
local rep = {};
local extraRep = {};  --额外声望
local C_Reputation_IsFactionParagon = C_Reputation.IsFactionParagon
function createMessage(msg)
  local info = ChatTypeInfo["COMBAT_FACTION_CHANGE"];
	for j = 1, 4, 1 do
    local chatfrm = getglobal("ChatFrame"..j);
    for k,v in pairs(chatfrm.messageTypeList) do
      if v == "COMBAT_FACTION_CHANGE" then
        chatfrm:AddMessage(msg, info.r, info.g, info.b, info.id);
        break;
      end
    end
  end
end
function initExtraRep(factionID, name)
  local currentValue, threshold, _, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID);
  if not extraRep[name] then
		extraRep[name] = currentValue % threshold
		if hasRewardPending then
      extraRep[name] = extraRep[name] + threshold
    end
    if extraRep[name] > threshold and (not hasRewardPending) then
      extraRep[name] = extraRep[name] - threshold
    end
	end
end
local SonicReputation = CreateFrame("Frame");
SonicReputation:RegisterEvent("UPDATE_FACTION");
SonicReputation:SetScript("OnEvent", function()
	local numFactions = GetNumFactions(self);
	for i = 1, numFactions, 1 do
		local name, _, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID = GetFactionInfo(i);
		local min, max, value = 0;
		--7.2额外声望
		if barValue >= 42000 then
      if C_Reputation_IsFactionParagon(factionID) then
        initExtraRep(factionID,name)
        local currentValue, threshold, _, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
        min, max = 0, threshold
        value = currentValue % threshold
        if hasRewardPending then 
          value = value + threshold
        end
        local extraChange = value - extraRep[name];
        if(extraChange > 0) then 
          extraRep[name] = value
          local extra_msg = string.format("%s: %+d (%d/%d)", name, extraChange, value, threshold)
          createMessage(extra_msg);
        end
      end
    elseif name and (not isHeader) or (hasRep) then
      if not rep[name] then
        rep[name] = barValue;
      end
      local change = barValue - rep[name];
      if (change > 0) then
        rep[name] = barValue
				local msg = string.format("%s: %+d (%d/%d)", name, change, barValue - barMin, barMax - barMin);
        createMessage(msg)
      end
    end
	end
end);
ChatFrame_AddMessageEventFilter("CHAT_MSG_COMBAT_FACTION_CHANGE", function() return true; end);

--[[---------------------------------ExaltedPlus------------------------------------------
local faction,ExaltedPlusFactions,buln,rpt,f={},{},BreakUpLargeNumbers,EmbeddedItemTooltip,CreateFrame("frame")
function f.enumfactions()
	if not f.load then for id in next,ExaltedPlusFactions do if not faction[id] then faction[id]={} end end f.load=true end
	for id in next,faction do
		v,faction[id].m,_,faction[id].rw=C_Reputation.GetFactionParagonInfo(id)
		if v then faction[id].t=faction[id].rw and math.modf(v/faction[id].m)-1 or math.modf(v/faction[id].m)
		faction[id].v=mod(v,faction[id].m) end
	end
end
function f.update(_,id,v)
	for k in ReputationFrame.paragonFramesPool:EnumerateActive() do if k.factionID then
		id=k.factionID if not faction[id] then faction[id]={} end faction[id].fr=k
		if not ExaltedPlusFactions[id] then ExaltedPlusFactions[id]=true end
	end end f.enumfactions() f.rfv=ReputationFrame:IsVisible()
	for k,v in next,StatusTrackingBarManager.bars do if v.factionID then f.wb=v end end
end
f:SetScript("OnUpdate",function(s,e)
	if not s.a then s.a=0.3 end if s.b then s.a=s.a-e else s.a=s.a+e end
	if s.a>=1 then s.a=1 s.b=true elseif s.a<=0.3 then s.a=0.3 s.b=false end
	if s.rfv then for i=1,NUM_FACTIONS_DISPLAYED do
		if s[i] then _G["ReputationBar"..i.."ReputationBar"]:SetStatusBarColor(FACTION_BAR_COLORS[8].r,FACTION_BAR_COLORS[8].g,FACTION_BAR_COLORS[8].b,s.a) end
	end end
	if s.wrw then f.wb.StatusBar:SetStatusBarColor(FACTION_BAR_COLORS[8].r,FACTION_BAR_COLORS[8].g,FACTION_BAR_COLORS[8].b,s.a) end
end)
hooksecurefunc("EmbeddedItemTooltip_SetItemByQuestReward",function(tt,t) f.update()
	if tt==rpt.ItemTooltip and rpt.factionID and faction[rpt.factionID] and faction[rpt.factionID].t then
		t=format(ARCHAEOLOGY_COMPLETION,faction[rpt.factionID].t)
		rpt:AddLine(t) tt.Tooltip:AddLine("\n") tt.Tooltip:Show()
		for i=1,rpt:NumLines() do if _G[rpt:GetName().."TextLeft"..i]:GetText()==t then
			_G[rpt:GetName().."TextLeft"..i]:SetPoint("BOTTOMLEFT",0,-70)
		end end
	end
end)
hooksecurefunc(StatusTrackingBarManager,"UpdateBarsShown",function(_,n,r,id) f.update()
	if f.wb and f.wb:IsShown() then
		n,r,_,_,_,id=GetWatchedFactionInfo()
		if faction[id] and faction[id].rw then f.wrw=true
			f.wb.name=n.." "..faction[id].v.." / "..faction[id].m
			f.wb.StatusBar:SetAnimatedValues(faction[id].v,0,faction[id].m,r)
			f.wb.OverlayFrame.Text:SetText(n.." "..faction[id].v.." / "..faction[id].m)
		elseif id then f.wrw=nil
			r=(GetFriendshipReputation(id)) and 5 or r
			f.wb.StatusBar:SetStatusBarColor(FACTION_BAR_COLORS[r].r,FACTION_BAR_COLORS[r].g,FACTION_BAR_COLORS[r].b,1)
		else f.wrw=nil end
	end
end)
hooksecurefunc("ReputationFrame_Update",function(_,n,id,x,bar,row) f.update()
	for i=1,NUM_FACTIONS_DISPLAYED do
		n,_,_,_,_,_,_,_,_,_,_,_,_,id=GetFactionInfo(ReputationListScrollFrame.offset+i)
		if ExaltedPlusFactions[id] then ExaltedPlusFactions[id]=n end
		if faction[id] and faction[id].v and faction[id].fr then
			f[i]=faction[id].rw or nil
			bar=_G["ReputationBar"..i.."ReputationBar"] row=_G["ReputationBar"..i]
			bar:SetMinMaxValues(0,faction[id].m) bar:SetValue(faction[id].v)
			row.rolloverText=" "..format(REPUTATION_PROGRESS_FORMAT,buln(faction[id].v),buln(faction[id].m))
			faction[id].fr.Check:SetShown(false) faction[id].fr.Glow:SetShown(false)
			faction[id].fr.Highlight:SetShown(false) faction[id].fr.Icon:SetAlpha(f[i] and 1 or 0.3)
		else f[i]=nil end
	end
end)]]
------------ SpellOverlayTimer v1.15.2 by DarkStarX, modified by nj55top @ 2012-11-17     ---------
local SAO = {}
local nextUpdate = 0.2
local activeNum = 0
local OverlayRemap = { [88843] = 19615, [93426] = 91342, [60349] = 53817, [79808] = -1, [126084] = 44544, }--[5143] = 79808,--[126084] = 112965,
local useIcon = False
local iconSize = 48  --64
local iconGap = 8

local SAOF = SpellActivationOverlayFrame

local function SAO_GetTimeLeft(spellID, onwho)
	local i = 1
	local name, icon, count, _, _, buff_expiretime, _, _, _, buff_spellid = UnitBuff(onwho, i)
	while name do
		i = i + 1
		if buff_spellid == spellID then
			return floor(buff_expiretime-GetTime()), name, count, icon
		end
		name, icon, count, _, _, buff_expiretime, _, _, _, buff_spellid = UnitBuff(onwho, i)
	end
	return false, false
end

local function SAO_CreateTimeText(self, isCount)
	local name = isCount and self.spellID .. "Count" or self.spellID .. "Timeleft"
	local timerText = self:CreateFontString(self.spellID, "ARTWORK", "CombatTextFont")
	timerText:SetTextColor(1, 0, 0, 1)
	timerText:SetTextHeight(24)
	return timerText
end

local function SAOTimer_OnUpdate(self, elapsed)
	nextUpdate = nextUpdate - elapsed
	if nextUpdate > 0 then return end
	local timeleft, spellname, count = SAO_GetTimeLeft(self.spellID, self.checkwho)
	if timeleft and timeleft < 0 then timeleft = 0 end
	if timeleft then
		spellname = useIcon and "" or format("|cff3366ff%s|r ", spellname)
		self.text:SetText(timeleft.." s")
		--self.text:SetText(spellname..timeleft.." s")
	else
		self.text:SetText("")
	end
	if count and count > 1 then
		self.count:SetText(count)
	else
		self.count:SetText("")
	end
	nextUpdate = 0.2
end

function SAO_ShowTimer(...)
	local self, spellID, texturePath, position = ...
	--local icon = GetSpellTexture(spellID)
	local overlay = SpellActivationOverlay_GetOverlay(self, spellID, position)
	if OverlayRemap[spellID] then spellID = OverlayRemap[spellID] end
	local checkwho = "player"
	local spellname, timeleft, count, icon = SAO_GetTimeLeft(spellID, checkwho)
	if timeleft == false then
		checkwho = "pet"
		spellname, timeleft, count, icon  = SAO_GetTimeLeft(spellID, checkwho)
	end
	if timeleft == false then return end

	if not SAO[spellID] then
		SAO[spellID] = {}
		SAO[spellID].timer = CreateFrame("frame", spellID)
		SAO[spellID].timer.spellID = spellID
		SAO[spellID].timer.checkwho = checkwho
		SAO[spellID].timer.text = SAO_CreateTimeText(SAO[spellID].timer)
		SAO[spellID].timer.count = SAO_CreateTimeText(SAO[spellID].timer, true)
		SAO[spellID].timer:Hide()
		SAO[spellID].position = position
		SAO[spellID].active = false
	end
	if not SAO[spellID].active then
		activeNum = activeNum + 1
		SAO[spellID].active = true
		SAO[spellID].timer:Show()
		SAO[spellID].timer:SetScript("OnUpdate", SAOTimer_OnUpdate)
	end
	SAO[spellID].timer.text:ClearAllPoints()
	if useIcon and icon then
		overlay.texture:SetTexture(icon)
		overlay:SetSize(iconSize, iconSize)
		overlay:ClearAllPoints()
		overlay:SetPoint("TOP", SAOF, "BOTTOM", ( activeNum - 1 ) * ( iconSize + iconGap ), 0)
		SAO[spellID].timer.text:SetPoint("TOP", overlay, "BOTTOM")
	elseif SAO[spellID].position ~= position then
		SAO[spellID].timer.text:SetPoint("CENTER", overlay, "TOP", 135, 0)
	else
		SAO[spellID].timer.text:SetPoint("CENTER", overlay, "TOP")
	end
end

function SAO_HideTimer(...)
	local self, spellID = ...
	if OverlayRemap[spellID] then spellID = OverlayRemap[spellID] end
	if not SAO[spellID] or not SAO[spellID].active then return end
	activeNum = activeNum - 1
	SAO[spellID].active = false
	SAO[spellID].timer:Hide()
	SAO[spellID].timer:SetScript("OnUpdate", nil)
end

hooksecurefunc("SpellActivationOverlay_ShowOverlay", SAO_ShowTimer)
hooksecurefunc("SpellActivationOverlay_HideOverlays", SAO_HideTimer)

-- adjust LossOfControlFrame by nj55top

local showAbilityName = true
function LoCF_AdjustDisplay(self)
	self.blackBg:SetAlpha(0)
	self.RedLineTop:SetAlpha(0)
	self.RedLineBottom:SetAlpha(0)
--	self.Icon:SetSize(iconSize, iconSize)
	self.Icon:ClearAllPoints()
	self.TimeLeft.NumberText:ClearAllPoints()
	if useIcon or useBuffIcon then
		self.Icon:SetPoint("TOP", SAOF, "BOTTOM", -(iconSize + iconGap), 21)
		self.TimeLeft.NumberText:SetPoint("TOPLEFT", self.Icon, "BOTTOMLEFT")
	else
		self.Icon:SetPoint("TOP", SAOF, "BOTTOM", 0, 21)
		self.TimeLeft.NumberText:SetPoint("LEFT", self.Icon, "RIGHT")
	end
--	self.TimeLeft.NumberText:SetTextHeight(fontSize)
--	self.TimeLeft.SecondsText:SetTextHeight(fontSize)
	self.TimeLeft.SecondsText:SetText("")
--	self.AbilityName:SetTextHeight(fontSize)
	self.AbilityName:ClearAllPoints()
	self.AbilityName:SetPoint("RIGHT", self.Icon, "LEFT")
	if not showAbilityName then self.AbilityName:SetText("") end
end

hooksecurefunc("LossOfControlFrame_SetUpDisplay", LoCF_AdjustDisplay)


------------------------------BattleResAlert---------------------------
local BattleResAlert = CreateFrame("Frame")
BattleResAlert:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
BattleResAlert:SetScript("OnEvent",function(a,b,c,event, d,e,sourceName, f,g,h,destName, i,j,spellId)
	if (((spellId == 95750) or (spellId == 20484) or (spellId == 113269) or (spellId == 61999) or (spellId == 126393)) and (event == "SPELL_CAST_SUCCESS") and (destName == UnitName("player"))) then
		DEFAULT_CHAT_FRAME:AddMessage("战复 "..sourceName..".")
		--PlaySound("ReadyCheck", "Master")
	end
end)

------------------------------------------------------     HideFishingBobberTooltip     -----------------------------------------------------
local HideFishingBobberTooltip = CreateFrame("Frame")
HideFishingBobberTooltip:RegisterEvent("PLAYER_LOGIN")
HideFishingBobberTooltip:SetScript("OnEvent", function()
  local L = {
    deDE = "Angelschwimmer",
    enUS = "Fishing Bobber",
    esES = "Corcho de pesca",
    frFR = "Flotteur",
    ptBR = "Flutador para Pesca",
    ruRU = "Поплавок",
    -- itIT = "",
    -- esMX = "",
    -- koKR = "",
    zhCN = "鱼漂",
    zhTW = "魚漂",
  }
  local localized = L[GetLocale()]
  GameTooltip:HookScript("OnShow", function()
    local tooltipText = GameTooltipTextLeft1
    if tooltipText and tooltipText:GetText() == localized then
      GameTooltip:Hide()
    end
  end)
end)
------------------------------------------------------     重置副本提示     -----------------------------------------------------
local success = gsub(INSTANCE_RESET_SUCCESS, "%%s", "")
local failed = gsub(INSTANCE_RESET_FAILED, ".*%%s", "")
local fail_offline = gsub(INSTANCE_RESET_FAILED_OFFLINE, ".*%%s", "")
local fail_zone = gsub(INSTANCE_RESET_FAILED_ZONING, ".*%%s", "")


local Echof = CreateFrame("Frame")
Echof:RegisterEvent("CHAT_MSG_SYSTEM")
Echof:SetScript("OnEvent", function(self, event, ...)
	local instance = ...
	if event == "CHAT_MSG_SYSTEM" then
		if UnitIsGroupLeader("player") and (strfind(instance, success) or strfind(instance, failed) or strfind(instance, fail_offline) or strfind(instance, fail_zone)) then
			SendChatMessage(" ^-^  "..instance, "PARTY")
		end
	end
end)

---------------------[[ Bag Space Checker Created by BrknSoul on 17th January 2014 --]]
--Frame creation and event registration
local frameBSC=CreateFrame("FRAME")
frameBSC:RegisterEvent("BAG_UPDATE_DELAYED")
frameBSC:RegisterEvent("BAG_UPDATE")
frameBSC:SetScript("OnEvent",function(event,arg1)  --Event Handlers
  if event == "BAG_UPDATE_DELAYED" then
    local BSCSpace = 0
    for i=0,NUM_BAG_SLOTS do 
      BSCSpace = BSCSpace + GetContainerNumFreeSlots(i)
    end
    if BSCSpace <= 8 then
      UIErrorsFrame:AddMessage(REMINDER_BAGS_SPACE..BSCSpace,1,0,0,5)
      PlaySoundFile(540594, "Master")  --"Sound\\SPELLS\\SPELL_Treasure_Goblin_Coin_Toss_09.OGG"
    end
  end
end)

--[[----------------------------------------------------------------------------AltTabLfgNotification
local AltTabLfgNotification, Flashevents = CreateFrame("Frame", "AltTabLfgNotification"), {};
------------------------------------------------------- start of events
-- party invite
function Flashevents:PARTY_INVITE_REQUEST(...) SendChatMessage("-- 你有组队邀请 --", "WHISPER", nil, UnitName("player")); end
function Flashevents:PARTY_INVITE_XREALM(...) SendChatMessage("-- 你有组队邀请 --", "WHISPER", nil, UnitName("player")); end
-- going to queue into lfg
function Flashevents:LFG_ROLE_CHECK_SHOW(...) SendChatMessage("-- 职责确认 --", "WHISPER", nil, UnitName("player")); end
-- lfg queue ready
function Flashevents:LFG_PROPOSAL_SHOW(...) SendChatMessage("-- 可以进本了 --", "WHISPER", nil, UnitName("player")); end
-- readycheck
function Flashevents:READY_CHECK(...) SendChatMessage("-- 就位确认 --", "WHISPER", nil, UnitName("player")); end
-- rolecheck
function Flashevents:ROLE_POLL_BEGIN(...) SendChatMessage("-- 职责确认 --", "WHISPER", nil, UnitName("player")); end
-- summon request
function Flashevents:CONFIRM_SUMMON(...) SendChatMessage("-- 有人拉你 --", "WHISPER", nil, UnitName("player")); end
-- resurrect request
function Flashevents:RESURRECT_REQUEST(...) SendChatMessage("-- 有人救你了 --", "WHISPER", nil, UnitName("player")); end
-- bg queue ready
function Flashevents:UPDATE_BATTLEFIELD_STATUS(...)
for i = 1, 10 do
	local bgstatus = GetBattlefieldStatus(i)
	if (bgstatus == "confirm") then SendChatMessage("-- 进本啦 --", "WHISPER", nil, UnitName("player")); end
end
end
-- tb/wg queue ready
function Flashevents:BATTLEFIELD_MGR_ENTRY_INVITE(...) SendChatMessage("BATTLEFIELD_MGR_ENTRY_INVITE", "WHISPER", nil, UnitName("player")); end
-- worldpvp--Add by y368413
function Flashevents:BFMGR_INVITED_TO_ENTER(...) SendChatMessage("*BFMGR_INVITED_TO_ENTER*", "WHISPER", nil, UnitName("player")); end
-- duel_request--Add by y368413
function Flashevents:DUEL_REQUESTED(...) SendChatMessage("-- 决斗 --", "WHISPER", nil, UnitName("player")); end
function Flashevents:PET_BATTLE_PVP_DUEL_REQUESTED(...) SendChatMessage("-- 宠物对决 --", "WHISPER", nil, UnitName("player")); end
-- summon--Add by y368413
function Flashevents:CONFIRM_SUMMON_STARTING_AREA(...) SendChatMessage("*CONFIRM_SUMMON_STARTING_AREA*", "WHISPER", nil, UnitName("player")); end
-- tarde--Add by y368413
function Flashevents:TRADE_WITH_QUESTION(...) SendChatMessage("*TRADE_WITH_QUESTION*", "WHISPER", nil, UnitName("player")); end
function Flashevents:TRADE_SHOW(...) SendChatMessage("-- 交易 --", "WHISPER", nil, UnitName("player")); end
--------------------------------------------------------------------------- end of events
AltTabLfgNotification:SetScript("OnEvent", function(self, event, ...)
 if not MaoRUISettingDB["Misc"]["AltTabLfgNotification"] then return end
 Flashevents[event](self, ...);
end);
for k, v in pairs(Flashevents) do AltTabLfgNotification:RegisterEvent(k);  end]]

--  CtrlIndicator    Author: 图图   --用途: 用于检测Ctrl是否卡住,Ctrl按下4.5秒之后就会提示

UIParent:CreateFontString("CtrlIndicatorText", "OVERLAY");
CtrlIndicatorText:SetPoint("TOP", 0, -88);
CtrlIndicatorText:SetFont(STANDARD_TEXT_FONT, 21,"OUTLINE")
CtrlIndicatorText:SetText("|cffffffff你的Ctrl或者Shift可能卡啦!|r")
UIParent:CreateTexture("CtrlIndicatorBG");
CtrlIndicatorBG:SetPoint("CENTER", CtrlIndicatorText, "CENTER", 0, 0);
CtrlIndicatorBG:SetAtlas("OBJFX-BarGlow", true)
local ctrlCnt = 0;
C_Timer.NewTicker(0.1, function()
    if(IsControlKeyDown()) or (IsShiftKeyDown()) then
        ctrlCnt=ctrlCnt+1
    else    
        ctrlCnt = 0
        CtrlIndicatorText:Hide();
    end
    if ctrlCnt==45 then
        print("|cffff0000你的Ctrl或者Shift可能卡啦!|r")
        CtrlIndicatorText:Show();
    end
    if ctrlCnt > 45 then
        CtrlIndicatorBG:SetAlpha(0.69+math.sin((ctrlCnt%20)/20*2*3.1415926535898)/3.3333333);
    else
        CtrlIndicatorBG:SetAlpha(0);
    end
end)

--[[------------------------------------------------------------------------- CrazyCatLady
local CrazyCatLady = CreateFrame("Frame") 
CrazyCatLady:RegisterEvent("UNIT_AURA") 
CrazyCatLady:RegisterEvent("PLAYER_DEAD")
CrazyCatLady:RegisterEvent("PLAYER_UNGHOST")
CrazyCatLady:SetScript("OnEvent", function(self, event, ...) 
  if not MaoRUISettingDB["Misc"]["CrazyCatLady"] then self:UnregisterAllEvents() return end
	if event == "PLAYER_DEAD" then PlaySoundFile("Sound\\creature\\Auriaya\\UR_Auriaya_Death01.ogg", "Master")
	elseif event == "PLAYER_UNGHOST" then StopMusic() end
end)]]

--------------------------------------------------------------------------- m4xLegendary
local m4xLegendary = CreateFrame("Frame")
m4xLegendary:RegisterEvent("SHOW_LOOT_TOAST_LEGENDARY_LOOTED")
m4xLegendary:SetScript("OnEvent", function(self) PlaySoundFile("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\Legendary.ogg", "Master") end)

--[[--- only replace the function when the achievement frame is opened (before that it doesn't exist)
local AchievementDisplayFrame = CreateFrame("Frame")
AchievementDisplayFrame:RegisterEvent("ADDON_LOADED")
AchievementDisplayFrame:SetScript("OnEvent", function (self, event, arg)
	if arg == "Blizzard_AchievementUI" then
			local originalDisplayAchievement = AchievementButton_DisplayAchievement
	function AchievementButton_DisplayAchievement(button, category, achievement, selectionID, renderOffScreen)
		originalDisplayAchievement(button, category, achievement, selectionID, renderOffScreen)
		local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(category, achievement);
		if ( completed and not wasEarnedByMe ) then
			--- if an achievement was not earned by this char, hide the date completed and show the shield as grey
			button.dateCompleted:Hide();
			button:Desaturate();
		end
		return id
	end 
	end
end)]]