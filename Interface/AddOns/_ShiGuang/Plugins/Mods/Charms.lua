--[[--------------Item Selling## Author: Spencer Sohn----------------------
local ItemSelling = StaticPopupDialogs["CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL"] 
ItemSelling.OnAccept=nil 
ItemSelling.OnShow=function() StaticPopup_Hide("CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL"); SellCursorItem(); end]]
----------------ArenaLeaveConfirmer----------------------
hooksecurefunc(StaticPopupDialogs["CONFIRM_LEAVE_BATTLEFIELD"],"OnShow",function(self)
	if IsActiveBattlefieldArena() or GetBattlefieldWinner() then self.button1:Click() end
end)
--------------------------------------Hide the left/right end cap------------------------
MainMenuBarLeftEndCap:Hide()  MainMenuBarRightEndCap:Hide()   

--[[local DressUpTargetBtn = CreateFrame("Button",nil,DressUpModelFrame,"UIPanelButtonTemplate") 
DressUpTargetBtn:SetSize(80, 21)
DressUpTargetBtn:SetText(CHARMS_TARGET)
DressUpTargetBtn:SetPoint("RIGHT", DressUpFrameResetButton, "LEFT", 0,0)
DressUpTargetBtn:Disable()
DressUpTargetBtn:SetScript("OnClick", function()
	DressUpModelFrame:SetUnit("target")
end)
DressUpTargetBtn:RegisterEvent("PLAYER_TARGET_CHANGED")
DressUpTargetBtn:SetScript("OnEvent", function()
	if UnitExists("target") and UnitIsPlayer("target") then
		DressUpTargetBtn:Enable() 
	else 
		DressUpTargetBtn:Disable() 
	end
end)
-- Undress button
local UndressButton = CreateFrame("Button", nil, DressUpModelFrame, "UIPanelButtonTemplate")
UndressButton:SetSize(80, 21)
UndressButton:SetText(CHARMS_NAKEDIZE)
UndressButton:SetPoint("RIGHT", DressUpTargetBtn, "LEFT", 0, 0)
UndressButton:SetScript("OnClick", function()
    DressUpModelFrame:Undress()
    PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK)
end)]]

------------------------------------------------------------------------------- NiceDamage
--Local NiceDamage = CreateFrame("Frame", "NiceDamage");
--function NiceDamage:ApplySystemDamageFonts() DAMAGE_TEXT_FONT = "Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\RedCircl.ttf"; end
--NiceDamage:SetScript("OnEvent", function() if (event == "ADDON_LOADED") then NiceDamage:ApplySystemDamageFonts() end end);
--NiceDamage:RegisterEvent("ADDON_LOADED");
--NiceDamage:ApplySystemDamageFonts()
-------BGRoll----------------##Author: NOGARUKA  ##Version: 2
local NeedList = {
[18231] = true,
[71951] = true,
[71952] = true,
[71953] = true,
}
local BGRoll = CreateFrame("Frame")
BGRoll:RegisterEvent("START_LOOT_ROLL")
BGRoll:RegisterEvent("CONFIRM_LOOT_ROLL")
BGRoll:SetScript("OnEvent", function(self, event, id, rt)
if event == 'START_LOOT_ROLL' then
	local _, Name, _, _, _, Need, Greed, _ = GetLootRollItemInfo(id)
	local Link = GetLootRollItemLink(id)
	local ItemID = tonumber(strmatch(Link, 'item:(%d+)'))
	if NeedList[ItemID] then
		if Need then
			print("→: ", (Name))
			RollOnLoot(id, 1)
		elseif Greed then
			print("→: ", (Name))
			RollOnLoot(id, 2)
		end
	end
end
if event == 'CONFIRM_LOOT_ROLL' then ConfirmLootRoll(id, rt) end
end)



local helmcb = CreateFrame("CheckButton", nil, PaperDollFrame) 
helmcb:ClearAllPoints() 
helmcb:SetSize(21,21) 
helmcb:SetFrameLevel(10) 
helmcb:SetPoint("TOPLEFT", CharacterHeadSlot, "TOPRIGHT", 0, 6) 
helmcb:SetScript("OnClick", function() ShowHelm(not ShowingHelm()) end) 
--helmcb:SetScript("OnEnter", function(self) GameTooltip:SetText("显示/隐藏 头部") end) 
--helmcb:SetScript("OnLeave", function() GameTooltip:Hide() end) 
helmcb:SetScript("OnEvent", function() helmcb:SetChecked(ShowingHelm()) end) 
helmcb:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up") 
helmcb:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down") 
helmcb:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight") 
helmcb:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled") 
helmcb:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check") 
helmcb:RegisterEvent("UNIT_MODEL_CHANGED") 
helmcb:SetChecked(ShowingHelm()) 
local cloakcb = CreateFrame("CheckButton", nil, PaperDollFrame) 
cloakcb:ClearAllPoints() 
cloakcb:SetSize(21,21) 
cloakcb:SetFrameLevel(10) 
cloakcb:SetPoint("TOPLEFT", CharacterBackSlot, "TOPRIGHT", 0, 6) 
cloakcb:SetScript("OnClick", function() ShowCloak(not ShowingCloak()) end) 
--cloakcb:SetScript("OnEnter", function(self) GameTooltip:SetText("显示/隐藏 披风") end) 
--cloakcb:SetScript("OnLeave", function() GameTooltip:Hide() end) 
cloakcb:SetScript("OnEvent", function() cloakcb:SetChecked(ShowingCloak()) end) 
cloakcb:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up") 
cloakcb:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down") 
cloakcb:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight") 
cloakcb:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled") 
cloakcb:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check") 
cloakcb:RegisterEvent("UNIT_MODEL_CHANGED") 
cloakcb:SetChecked(ShowingCloak())