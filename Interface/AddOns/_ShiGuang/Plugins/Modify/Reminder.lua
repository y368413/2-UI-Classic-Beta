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
			DEFAULT_CHAT_FRAME:AddMessage(GetSpellLink(spell)..SHIGUANG_Gets..buffer)
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
		PlaySound(SOUNDKIT.READY_CHECK, "Master")
	end
end)

------------------------------------------------------     HideFishingBobberTooltip     -----------------------------------------------------
local HideFishingBobberTooltip = CreateFrame("Frame")
HideFishingBobberTooltip:RegisterEvent("PLAYER_LOGIN")
HideFishingBobberTooltip:SetScript("OnEvent", function()
  local Fish = {
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
  GameTooltip:HookScript("OnShow", function()
    local tooltipText = GameTooltipTextLeft1
    if tooltipText and tooltipText:GetText() == Fish[GetLocale()] then GameTooltip:Hide() end
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

--  CtrlIndicator    Author: 图图   --检测Ctrl是否卡住,Ctrl按下4.5秒之后就会提示
local ctrlCnt, AltCnt, ShiftCnt = 0, 0, 0;
C_Timer.NewTicker(0.1, function()
    if not MaoRUIPerDB["Misc"]["CtrlIndicator"] then return end
    if IsControlKeyDown() then ctrlCnt=ctrlCnt+1 else ctrlCnt = 0 end
    if ctrlCnt==45 then
        PlaySoundFile("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\Legendary.ogg", "Master")
        UIErrorsFrame:AddMessage("你的Ctrl可能卡啦!",1,0,0,5)
        --RaidNotice_AddMessage(RaidWarningFrame, "|cffff0000你的Ctrl可能卡啦!|r", ChatTypeInfo["RAID_WARNING"])
    end
    if IsAltKeyDown() then AltCnt=AltCnt+1 else AltCnt = 0 end
    if AltCnt==45 then
        PlaySoundFile("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\Legendary.ogg", "Master")
        UIErrorsFrame:AddMessage("你的Alt可能卡啦!",1,0,0,5)
        --RaidNotice_AddMessage(RaidWarningFrame, "|cffff0000你的Alt可能卡啦!|r", ChatTypeInfo["RAID_WARNING"])
    end
    if IsShiftKeyDown() then ShiftCnt=ShiftCnt+1 else ShiftCnt = 0 end
    if ShiftCnt==45 then
        PlaySoundFile("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\Legendary.ogg", "Master")
        UIErrorsFrame:AddMessage("你的Shift可能卡啦!",1,0,0,5)
        --RaidNotice_AddMessage(RaidWarningFrame, "|cffff0000你的Shift可能卡啦!|r", ChatTypeInfo["RAID_WARNING"])
    end
end)

--------------------------------------------------------------------------- CrazyCatLady
local CrazyCatLady = CreateFrame("Frame") 
CrazyCatLady:RegisterEvent("PLAYER_DEAD")
CrazyCatLady:RegisterEvent("PLAYER_UNGHOST")
CrazyCatLady:SetScript("OnEvent", function(self, event, ...) 
  if not MaoRUIPerDB["Misc"]["CrazyCatLady"] then self:UnregisterAllEvents() return end
	if event == "PLAYER_DEAD" then PlaySoundFile("Sound\\creature\\Auriaya\\UR_Auriaya_Death01.ogg", "Master")
	elseif event == "PLAYER_UNGHOST" then StopMusic() end
end)



local CombatNotificationAlertFrame = CreateFrame("Frame", "CombatNotificationAlertFrame", UIParent)
CombatNotificationAlertFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
CombatNotificationAlertFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
CombatNotificationAlertFrame:RegisterEvent("PARTY_LOOT_METHOD_CHANGED");
CombatNotificationAlertFrame:SetSize(360, 43)
CombatNotificationAlertFrame:SetPoint("TOP", 0, -260)
CombatNotificationAlertFrame.Bg = CombatNotificationAlertFrame:CreateTexture(nil, "BACKGROUND")
CombatNotificationAlertFrame.Bg:SetTexture("Interface\\LEVELUP\\MinorTalents")
CombatNotificationAlertFrame.Bg:SetPoint("TOP")
CombatNotificationAlertFrame.Bg:SetSize(380, 42)
CombatNotificationAlertFrame.Bg:SetTexCoord(0, 400 / 512, 341 / 512, 407 / 512)
CombatNotificationAlertFrame.Bg:SetVertexColor(1, 1, 1, 0.4)
CombatNotificationAlertFrame.text = CombatNotificationAlertFrame:CreateFontString(nil, "OVERLAY")  --ARTWORK", "GameFont_Gigantic"
CombatNotificationAlertFrame.text:SetFont(GameFontNormal:GetFont(), 26, 'OUTLINE')	-- 字体
CombatNotificationAlertFrame.text:SetShadowOffset(0,0)
CombatNotificationAlertFrame.text:SetPoint("CENTER")
CombatNotificationAlertFrame:Hide()
CombatNotificationAlertFrame:SetScript("OnShow", function()
    CombatNotificationAlertFrame.totalTime = 0.8
    CombatNotificationAlertFrame.timer = 0
end)
CombatNotificationAlertFrame:SetScript("OnUpdate", function(self, elapsed)
    CombatNotificationAlertFrame.timer = CombatNotificationAlertFrame.timer + elapsed
    if (CombatNotificationAlertFrame.timer > CombatNotificationAlertFrame.totalTime) then CombatNotificationAlertFrame:Hide() end
    if (CombatNotificationAlertFrame.timer <= 0.6) then
        CombatNotificationAlertFrame:SetAlpha(CombatNotificationAlertFrame.timer * 2)
    elseif (CombatNotificationAlertFrame.timer > 0.8) then
        CombatNotificationAlertFrame:SetAlpha(1 - CombatNotificationAlertFrame.timer / CombatNotificationAlertFrame.totalTime)
    end
end)
--[[	Author: Zack Youngren	License: GNU AGPLv3  ]]
local loot_method_strings = {
  ["needbeforegreed"] = "需求优先",
  ["group"] = "队伍分配",
  ["master"] = "队长分配",
  ["roundrobin"] = "轮流拾取",
  ["freeforall"] = "自由拾取",
};
CombatNotificationAlertFrame:SetScript("OnEvent", function(self, event)
    CombatNotificationAlertFrame:Hide()
    if (event == "PLAYER_REGEN_DISABLED") then
        CombatNotificationAlertFrame.text:SetText("|cFFFF0000"..COMBATNOTIFICATIONINFO_combat_enter.."|r")
    elseif (event == "PLAYER_REGEN_ENABLED") then
        CombatNotificationAlertFrame.text:SetText("|cff00ff00"..COMBATNOTIFICATIONINFO_combat_leave.."|r")
    elseif (event == "PARTY_LOOT_METHOD_CHANGED") then
        if IsInRaid() then return; end
        PlaySound(8959) -- RAID_WARNING;
        local warning_message = "拾取模式已设为: |r" .. loot_method_strings[GetLootMethod()];
        CombatNotificationAlertFrame.text:SetText("|cFFFF0000"..warning_message)
    end
    CombatNotificationAlertFrame:Show()
end)