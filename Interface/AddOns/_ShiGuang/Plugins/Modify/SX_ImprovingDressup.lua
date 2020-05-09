--## Version: 1.30 ## Author: Saxitoxin
-----------------------------------------
-- DO NOT EDIT ANYTHING UNDER HERE UNLESS YOU KNOW WHAT YOU ARE DOING
-----------------------------------------
SX_ImprovingDressupcfg_portraitmedia = "Interface\\CHARACTERFRAME\\TEMPORARYPORTRAIT-"
SX_ImprovingDressupcfg_raceID = {
	[ "Human"] = 1,
	[ "Orc"] = 2,
	[ "Dwarf"] = 3,
	[ "NightElf"] = 4,
	[ "Scourge"] = 5,
	[ "Tauren"] = 6,
	[ "Gnome"] = 7,
	[ "Troll"] = 8,
	[ "Goblin"] = 9,
	[ "BloodElf"] = 10,
	[ "Draenei"] = 11,
	[ "Worgen"] = 22,
	[ "Pandaren"] = 24,
	[ "Nightborne"] = 27,
	[ "HighmountainTauren"] = 28,
	[ "VoidElf"] = 29,
	[ "LightforgedDraenei"] = 30, 
	["ZandalariTroll"] = 31,
	["KulTiranHuman"] = 32,
	["DarkIronDwarf"] = 34,
	["MagharOrc"] = 36,
}

local gender = 0
local gendertext = ""
local activeRace = select(2,UnitRace("player"))
local faction = UnitFactionGroup("player")

local buttonHolder = CreateFrame("Frame","SXidButtonHolderFrame", DressUpFrame)
buttonHolder:SetAllPoints()

buttonHolder:SetScript("OnShow", function(self)
	UIFrameFadeIn(self, .2, 0, 1)
end)

if UnitSex("player") == 3 then gender = 1 else gender = 0 end
if gender == 0 then genderText = "Male" else genderText = "Female" end

local function onEnter(self) 
	UIFrameFadeIn(self.hightlight, .1, self.hightlight:GetAlpha(), .5)
end

local function onLeave(self) 
	UIFrameFadeOut(self.hightlight, .5, self.hightlight:GetAlpha(), 0)
end

local function onClick(self)
	activeRace = self.text:GetText()
	DressUpModelFrame:SetCustomRace(SX_ImprovingDressupcfg_raceID[activeRace], gender)
end

local function raceButtonTemplate(parent, size, race, ...)
  local f = CreateFrame("BUTTON", nil, parent or UIParent)
  f:SetSize(size, size)
	f:EnableMouse(true)
  f:SetPoint(...)
	-- BG
  f.bg = f:CreateTexture(nil,"BACKGROUND",nil,-8)
  f.bg:SetPoint("CENTER")
	f.bg:SetSize(size, size)
  f.bg:SetTexture("Interface\\CHARACTERFRAME\\TempPortraitAlphaMask")
	f.bg:SetVertexColor(.1,.1,.1)
	
	-- ICON
  f.icon = f:CreateTexture(nil,"BACKGROUND",nil,-7)
  f.icon:SetPoint("CENTER")
	f.icon:SetSize(size, size)
  f.icon:SetTexture(SX_ImprovingDressupcfg_portraitmedia..genderText.."-"..race)
		
	-- HIGHTLIGHT
	f.hightlight = f:CreateTexture(nil,"BACKGROUND",nil,-5)
  f.hightlight:SetPoint("CENTER",0,-1)
	f.hightlight:SetSize(size*1.6, size*1.6)
	f.hightlight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
	f.hightlight:SetTexCoord(0.84375000, 0.94140625, 0.10253906, 0.15136719)
	f.hightlight:SetAlpha(0)
	f.hightlight:SetBlendMode("ADD")

	-- BORDER
	f.border = f:CreateTexture(nil,"BACKGROUND",nil,-4)
  f.border:SetPoint("CENTER",-1,-1)
	f.border:SetSize(size*1.6, size*1.6)
	f.border:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
	f.border:SetTexCoord(0.50585938, 0.63085938, 0.02246094, 0.08203125)
	
	f.text = f:CreateFontString(nil, "OVERLAY",nil,6)
	f.text:SetPoint("BOTTOM", f )
	f.text:SetFont(STANDARD_TEXT_FONT, 12, "THINOUTLINE")
	f.text:SetText(race)
	f.text:SetAlpha(0)
	
	f:SetScript("OnEnter", onEnter)
	f:SetScript("OnLeave", onLeave)
	f:SetScript("OnMouseUp", onClick)
  return f
end

local BS = 40
local gnoTroButton = raceButtonTemplate(buttonHolder, BS, CHARMS_GNOME, "BOTTOMLEFT", DressUpModelFrame, "BOTTOMRIGHT", 16, 21)
local NElfTauButton = raceButtonTemplate(buttonHolder, BS, CHARMS_NIGHTELF ,"BOTTOM", gnoTroButton, "TOP", 0, 8)
local dwaUndButton = raceButtonTemplate(buttonHolder, BS, CHARMS_DWARF ,"BOTTOM", NElfTauButton, "TOP", 0, 8)
local humOrcButton = raceButtonTemplate(buttonHolder, BS, CHARMS_HUMAN ,"BOTTOM", dwaUndButton, "TOP", 0, 8)

local factionButton = raceButtonTemplate(buttonHolder, BS*1.2, "Faction" ,"TOPLEFT",DressUpModelFrame, "TOPRIGHT", 16, 43)
factionButton.icon:SetTexture("Interface\\FriendsFrame\\PlusManz-"..faction)
local genderButton = raceButtonTemplate(buttonHolder, BS*1.2, "Gender" ,"TOP", factionButton, "BOTTOM", 0, -10)
genderButton.icon:SetTexture("interface\\addons\\_ShiGuang\\Media\\Modules\\Role\\gender_"..genderText)

local function updateButtons()
	if faction == "Horde" then
		humOrcButton.text:SetText("Orc")
		humOrcButton.icon:SetTexture(SX_ImprovingDressupcfg_portraitmedia..genderText.."-Orc")
		dwaUndButton.text:SetText("Scourge")
		dwaUndButton.icon:SetTexture(SX_ImprovingDressupcfg_portraitmedia..genderText.."-Scourge")
		NElfTauButton.text:SetText("Tauren")
		NElfTauButton.icon:SetTexture(SX_ImprovingDressupcfg_portraitmedia..genderText.."-Tauren")
		gnoTroButton.text:SetText("Troll")
		gnoTroButton.icon:SetTexture(SX_ImprovingDressupcfg_portraitmedia..genderText.."-Troll")
	else
		humOrcButton.text:SetText("Human")
		humOrcButton.icon:SetTexture(SX_ImprovingDressupcfg_portraitmedia..genderText.."-Human")
		dwaUndButton.text:SetText("Dwarf")
		dwaUndButton.icon:SetTexture(SX_ImprovingDressupcfg_portraitmedia..genderText.."-Dwarf")
		NElfTauButton.text:SetText("NightElf")
		NElfTauButton.icon:SetTexture(SX_ImprovingDressupcfg_portraitmedia..genderText.."-NightElf")
		gnoTroButton.text:SetText("Gnome")
		gnoTroButton.icon:SetTexture(SX_ImprovingDressupcfg_portraitmedia..genderText.."-Gnome")
	end
	factionButton.icon:SetTexture("Interface\\FriendsFrame\\PlusManz-"..faction)
	genderButton.icon:SetTexture("interface\\addons\\_ShiGuang\\Media\\Modules\\Role\\gender_"..genderText)
end

genderButton:SetScript("OnMouseUp", function(self, button)
	gender = gender+1
	if gender > 1 then gender = 0 end
	if gender == 0 then genderText = "male" else genderText = "female" end
	updateButtons()
	DressUpModelFrame:SetCustomRace(SX_ImprovingDressupcfg_raceID[activeRace], gender)
end)

factionButton:SetScript("OnMouseUp", function(self, button)
	if faction == "Horde" then faction = "Alliance" else faction = "Horde" end
	factionButton.icon:SetTexture("Interface\\Timer\\"..faction.."-Logo")
	updateButtons()
end)

local lowerButtonHolder = CreateFrame("Frame",nil, DressUpFrame)
lowerButtonHolder:SetAllPoints()

--[[local SXimprovedDressupDropdown = CreateFrame("Button", "SXimprovedDressupDropdown", lowerButtonHolder, "UIDropDownMenuTemplate")
SXimprovedDressupDropdown:SetPoint("BOTTOMLEFT", DressUpFrame, -16, -4)

local gear = {
	"Tabard",		-- 19
	"Head",			-- 1
	"Shoulder",		-- 3
	"Chest",		-- 5	
	"Belt",			-- 6
	"Pants",		-- 7 
	"Boots",		-- 8
	"Wrists",		-- 9
	"Hands",		-- 10
	"Main Hand",	-- 16
	"Off Hand",		-- 17
	"Shirt",		-- 4
}

local function OnClick(self)
	
	if self:GetID() == 1 then		
		DressUpModelFrame:UndressSlot(19)
	elseif self:GetID() == 2 then 
		DressUpModelFrame:UndressSlot(1)
	elseif self:GetID() == 3 then 
		DressUpModelFrame:UndressSlot(3)
	elseif self:GetID() == 10 then 
		DressUpModelFrame:UndressSlot(16)
	elseif self:GetID() == 11 then 
		DressUpModelFrame:UndressSlot(17)
	elseif self:GetID() == 12 then 
		DressUpModelFrame:UndressSlot(4)
	else
		DressUpModelFrame:UndressSlot(self:GetID())
	end
	
	UIDropDownMenu_SetSelectedID(SXimprovedDressupDropdown, 0)
	UIDropDownMenu_SetText(SXimprovedDressupDropdown, "Select what to undress")
end
	 
local function initialize(self, level)
   local info = UIDropDownMenu_CreateInfo()
   for k,v in pairs(gear) do
	  info = UIDropDownMenu_CreateInfo()
	  info.text = v
	  info.value = v
	  info.func = OnClick
	  UIDropDownMenu_AddButton(info, level)
   end
end
	 
UIDropDownMenu_Initialize(SXimprovedDressupDropdown, initialize)
UIDropDownMenu_SetWidth(SXimprovedDressupDropdown, 72)
UIDropDownMenu_SetButtonWidth(SXimprovedDressupDropdown, 72)
UIDropDownMenu_SetText(SXimprovedDressupDropdown, "Select to undress")
UIDropDownMenu_JustifyText(SXimprovedDressupDropdown, "LEFT")]]

local DressUpTargetBtn = CreateFrame("Button","DressUpTargetBtn",DressUpModelFrame,"UIPanelButtonTemplate") 
DressUpTargetBtn:SetSize(DressUpFrameResetButton:GetSize())
DressUpTargetBtn:SetPoint("RIGHT", DressUpFrameResetButton, "LEFT", -2,0)
DressUpTargetBtn:SetText(CHARMS_TARGET)
DressUpTargetBtn:Disable()
DressUpTargetBtn:SetScript("OnClick", function()
	DressUpModelFrame:SetUnit("target")
	faction = UnitFactionGroup("target")
	_, activeRace = UnitRace("target")
	if UnitSex("target") == 3 then gender = 1 else gender = 0 end
	if gender == 0 then genderText = "Male" else genderText = "Female" end
	updateButtons()
end)
DressUpTargetBtn:RegisterEvent("PLAYER_TARGET_CHANGED")
DressUpTargetBtn:SetScript("OnEvent", function(self,event, ...)
	if UnitExists("target") and UnitIsPlayer("target") then
		DressUpTargetBtn:Enable() 
	else 
		DressUpTargetBtn:Disable() 
	end
end)

local DressUpUndressBtn = CreateFrame("Button","DressUpUndressBtn",DressUpModelFrame,"UIPanelButtonTemplate") 
DressUpUndressBtn:SetSize(DressUpFrameResetButton:GetSize())
DressUpUndressBtn:SetPoint("RIGHT", DressUpTargetBtn, "LEFT", -2, 0)
DressUpUndressBtn:SetText(CHARMS_NAKEDIZE)
DressUpUndressBtn:SetScript("OnClick", function()
for i = 1, 19 do
			DressUpModelFrame:UndressSlot(i)
		end
    --DressUpModelFrame:Undress()
    --PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK)
end)

DressUpFrameResetButton.oldMouseUp = DressUpFrameResetButton:GetScript("OnMouseUp")
DressUpFrameResetButton:SetScript("OnMouseUp", function(self, button)
	_, activeRace = UnitRace("player")
	if UnitSex("player") == 3 then gender = 1 else gender = 0 end
	if gender == 0 then genderText = "Male" else genderText = "Female" end
	DressUpModelFrame:SetModelByUnit("player", false, true)
	updateButtons()
	self.oldMouseUp(self)
end)

local function repositionButtons()
	if DressUpFrame:IsShown() then
		C_Timer.After(.001, function()
			--if MaximizeMinimizeFrame.MaximizeButton:IsShown() then
				buttonHolder:SetScale(0.85)
			--else
				--buttonHolder:SetScale(SX_ImprovingDressupcfg_bigScale)
			--end
			--if not SX_ImprovingDressupcfg_useExtraButtons then lowerButtonHolder:Hide() else lowerButtonHolder:Show() end
			lowerButtonHolder:Show()
		end)
	end
end

DressUpFrame.oldOnShow = DressUpFrame:GetScript("OnShow")
DressUpFrame:SetScript("OnShow", function(self)
	DressUpFrame:SetScale(1)
	--DressUpModelFrame:SetModelByUnit("player", false, true)
	faction = UnitFactionGroup("player")
	_, activeRace = UnitRace("player")
	if UnitSex("player") == 3 then gender = 1 else gender = 0 end
	if gender == 0 then genderText = "Male" else genderText = "Female" end
	
	repositionButtons()	
	updateButtons()
		
	self.oldOnShow(self)
end)

buttonHolder:RegisterEvent("PLAYER_ENTERING_WORLD")
buttonHolder:SetScript("OnEvent", function(self, event, ...)
	tinsert(UISpecialFrames, DressUpFrame:GetName())
	--if SX_ImprovingDressupcfg_test then DressUpFrame:Show()	end
	updateButtons()
	repositionButtons()
end)