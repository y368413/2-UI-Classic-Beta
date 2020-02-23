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
	[5231] = true,	-- Resuscitate
	[467] = true,	-- 
	[1459] = true,	-- 
	[19740] = true,	-- 
	[20217] = true,	-- 
	[56521] = true,	-- 
	[1255] = true,	--
	[5697] = true,	-- 
}
local Saythanks = CreateFrame("Frame")
Saythanks:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
Saythanks:SetScript("OnEvent", function()
	local _, subEvent, _, _, buffer, _, _, _, player, _, _, spell = CombatLogGetCurrentEventInfo()
	for key, value in pairs(thanksspells) do
		if spell == key and value == true and player == UnitName("player") and buffer ~= UnitName("player") and subEvent == "SPELL_CAST_SUCCESS" then
			--SendChatMessage("Thanks:"....GetSpellLink(spell)..", "..buffer:gsub("%-[^|]+", ""), "WHISPER", nil, buffer)
			print(GetSpellLink(spell)..SHIGUANG_Gets..buffer)
			DoEmote("cheer", buffer)
		end
	end
end)

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

--  CtrlIndicator    Author: 图图   --用途: 用于检测Ctrl是否卡住,Ctrl按下4.5秒之后就会提示
UIParent:CreateFontString("CtrlIndicatorTextCtrl", "OVERLAY")
UIParent:CreateFontString("CtrlIndicatorTextAlt", "OVERLAY")
UIParent:CreateFontString("CtrlIndicatorTextShift", "OVERLAY")

CtrlIndicatorTextCtrl:SetPoint("TOP", 0, -88)
CtrlIndicatorTextCtrl:SetFont(STANDARD_TEXT_FONT, 21,"OUTLINE")
CtrlIndicatorTextCtrl:SetText("|cffffffff你的Ctrl可能卡啦!|r")
UIParent:CreateTexture("CtrlIndicatorCtrlBG")
CtrlIndicatorCtrlBG:SetPoint("CENTER", CtrlIndicatorTextCtrl, "CENTER", 0, 0)
CtrlIndicatorCtrlBG:SetAtlas("OBJFX-BarGlow", true)

CtrlIndicatorTextAlt:SetPoint("TOP", 0, -88)
CtrlIndicatorTextAlt:SetFont(STANDARD_TEXT_FONT, 21,"OUTLINE")
CtrlIndicatorTextAlt:SetText("|cffffffff你的Alt可能卡啦!|r")
UIParent:CreateTexture("CtrlIndicatorAltBG")
CtrlIndicatorAltBG:SetPoint("CENTER", CtrlIndicatorTextAlt, "CENTER", 0, 0);
CtrlIndicatorAltBG:SetAtlas("OBJFX-BarGlow", true)

CtrlIndicatorTextShift:SetPoint("TOP", 0, -88)
CtrlIndicatorTextShift:SetFont(STANDARD_TEXT_FONT, 21,"OUTLINE")
CtrlIndicatorTextShift:SetText("|cffffffff你的Shift可能卡啦!|r")
UIParent:CreateTexture("CtrlIndicatorShiftBG")
CtrlIndicatorShiftBG:SetPoint("CENTER", CtrlIndicatorTextAlt, "CENTER", 0, 0)
CtrlIndicatorShiftBG:SetAtlas("OBJFX-BarGlow", true)

local ctrlCnt, AltCnt, ShiftCnt = 0, 0, 0;
C_Timer.NewTicker(0.1, function()
    if IsControlKeyDown() then
        ctrlCnt=ctrlCnt+1
    else    
        ctrlCnt = 0
        CtrlIndicatorTextCtrl:Hide();
    end
    if ctrlCnt==45 then
        print("|cffff0000你的Ctrl可能卡啦!|r")
        CtrlIndicatorTextCtrl:Show();
    end
    if ctrlCnt > 45 then
        CtrlIndicatorCtrlBG:SetAlpha(0.69+math.sin((ctrlCnt%20)/20*2*3.1415926535898)/3.3333333);
    else
        CtrlIndicatorCtrlBG:SetAlpha(0);
    end
    if IsAltKeyDown() then
        AltCnt=AltCnt+1
    else    
        AltCnt = 0
        CtrlIndicatorTextAlt:Hide();
    end
    if AltCnt==45 then
        print("|cffff0000你的Alt可能卡啦!|r")
        CtrlIndicatorTextAlt:Show();
    end
    if AltCnt > 45 then
        CtrlIndicatorAltBG:SetAlpha(0.69+math.sin((AltCnt%20)/20*2*3.1415926535898)/3.3333333);
    else
        CtrlIndicatorAltBG:SetAlpha(0);
    end
    if IsShiftKeyDown() then
        ShiftCnt=ShiftCnt+1
    else    
        ShiftCnt = 0
        CtrlIndicatorTextShift:Hide();
    end
    if ShiftCnt==45 then
        print("|cffff0000你的Shift可能卡啦!|r")
        CtrlIndicatorTextShift:Show();
    end
    if ShiftCnt > 45 then
        CtrlIndicatorShiftBG:SetAlpha(0.69+math.sin((ShiftCnt%20)/20*2*3.1415926535898)/3.3333333);
    else
        CtrlIndicatorShiftBG:SetAlpha(0);
    end
end)

--------------------------------------------------------------------------- CrazyCatLady
local CrazyCatLady = CreateFrame("Frame") 
CrazyCatLady:RegisterEvent("UNIT_AURA") 
CrazyCatLady:RegisterEvent("PLAYER_DEAD")
CrazyCatLady:RegisterEvent("PLAYER_UNGHOST")
CrazyCatLady:SetScript("OnEvent", function(self, event, ...) 
  if not MaoRUIPerDB["Misc"]["CrazyCatLady"] then self:UnregisterAllEvents() return end
	if event == "PLAYER_DEAD" then PlaySoundFile("Sound\\creature\\Auriaya\\UR_Auriaya_Death01.ogg", "Master")
	elseif event == "PLAYER_UNGHOST" then StopMusic() end
end)