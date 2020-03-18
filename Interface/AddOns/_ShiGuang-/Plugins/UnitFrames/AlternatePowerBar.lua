--[[	Modern AlternatePowerBar
	by SDPhantom
	https://www.wowinterface.com/forums/member.php?u=34145	]]
------------------------------------------------------------------

--------------------------------------------------
--[[	Configuration (Blizzard Globals)	]]
--------------------------------------------------
ADDITIONAL_POWER_BAR_NAME="MANA";
ADDITIONAL_POWER_BAR_INDEX=0;

ALT_MANA_BAR_PAIR_DISPLAY_INFO={
	DRUID={
		[Enum.PowerType.Rage]=true;
		[Enum.PowerType.Energy]=true;
	};
};

----------------------------------
--[[	Helper Functions	]]
----------------------------------
local function AlternatePowerBar_Initialize(self)
	if not (self.powerName and self.powerIndex) then--	Blizzard uses these to control what the target power type is per bar
		self.powerName=ADDITIONAL_POWER_BAR_NAME;
		self.powerIndex=ADDITIONAL_POWER_BAR_INDEX;
	end

	local parent=self:GetParent();
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterUnitEvent("UNIT_DISPLAYPOWER",parent.unit);
	self:RegisterUnitEvent("UNIT_MAXPOWER",parent.unit);
	self:RegisterUnitEvent("UNIT_POWER_UPDATE",parent.unit);

	local color=PowerBarColor[self.powerName];
	self:SetStatusBarColor(color.r,color.g,color.b);
end

local function AlternatePowerBar_UpdateMaxValue(self)
	self:SetMinMaxValues(0,UnitPowerMax(self:GetParent().unit,self.powerIndex));
end

local function AlternatePowerBar_UpdateValue(self)
	self:SetValue(UnitPower(self:GetParent().unit,self.powerIndex));
end

local function AlternatePowerBar_UpdatePowerType(self)
	local unit=self:GetParent().unit;
	local _,class=UnitClass(unit);
	local show=(UnitPowerMax(unit,self.powerIndex)>0 and ALT_MANA_BAR_PAIR_DISPLAY_INFO[class] and ALT_MANA_BAR_PAIR_DISPLAY_INFO[class][UnitPowerType(unit)]);

	self.pauseUpdates=not show;--	Suspends/Resumes TextStatusBar updates
	if show then AlternatePowerBar_UpdateValue(self); end
	self:SetShown(show);
end

--------------------------
--[[	Script Handlers	]]
--------------------------
local function AlternatePowerBar_OnLoad(self)
--	TextStatusBar variables
	self.textLockable=1;
	self.cvar="statusText";
	self.cvarLabel="STATUS_TEXT_PLAYER";
	self.capNumericDisplay=true;

	AlternatePowerBar_Initialize(self);
	TextStatusBar_Initialize(self);
end

local function AlternatePowerBar_OnEvent(self,event,...)
	if event=="PLAYER_ENTERING_WORLD" or event=="UNIT_MAXPOWER" then AlternatePowerBar_UpdateMaxValue(self); end
	if event=="PLAYER_ENTERING_WORLD" or event=="UNIT_DISPLAYPOWER" then AlternatePowerBar_UpdatePowerType(self); end
	if event=="UNIT_POWER_UPDATE" and self:IsShown() then AlternatePowerBar_UpdateValue(self); end

	TextStatusBar_OnEvent(self,event,...);
end

local function AlternatePowerBar_OnUpdate(self,elapsed)
	AlternatePowerBar_UpdateValue(self);
end

--------------------------
--[[	UI Setup	]]
--------------------------
local function CreateAlternatePowerBar(name,parent)--	Originally defined as a template in XML, this is remade as a Lua generator
	local bar=CreateFrame("StatusBar",name,parent,"TextStatusBar");
	bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar");
	bar:SetStatusBarColor(0,0,1);
	bar:SetSize(78,12);

--	Background
	bar.DefaultBackground=bar:CreateTexture("$parentBackground","BACKGROUND");
	bar.DefaultBackground:SetColorTexture(0,0,0,0.5);
	bar.DefaultBackground:SetAllPoints(bar);

--	Borders
	bar.DefaultBorderLeft=bar:CreateTexture("$parentLeftBorder","OVERLAY");
	bar.DefaultBorderLeft:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator");
	bar.DefaultBorderLeft:SetTexCoord(0,0.125,1,0);
	bar.DefaultBorderLeft:SetSize(16,16);
	bar.DefaultBorderLeft:SetPoint("TOPLEFT",-12,0);

	bar.DefaultBorder=bar:CreateTexture("$parentBorder","OVERLAY");
	bar.DefaultBorder:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator");
	bar.DefaultBorder:SetTexCoord(0.125,0.25,1,0);
	bar.DefaultBorder:SetHeight(16);
	bar.DefaultBorder:SetPoint("TOPLEFT",4,0);
	bar.DefaultBorder:SetPoint("TOPRIGHT",-4,0);

	bar.DefaultBorderRight=bar:CreateTexture("$parentRightBorder","OVERLAY");
	bar.DefaultBorderRight:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator");
	bar.DefaultBorderRight:SetTexCoord(0.125,0,1,0);
	bar.DefaultBorderRight:SetSize(16,16);
	bar.DefaultBorderRight:SetPoint("TOPRIGHT",12,0);

--	Text
	bar.TextString=bar:CreateFontString("$parentText","OVERLAY","TextStatusBarText");
	bar.TextString:SetPoint("CENTER");

	bar.LeftText=bar:CreateFontString(nil,"OVERLAY","TextStatusBarText");
	bar.LeftText:SetPoint("LEFT");

	bar.RightText=bar:CreateFontString(nil,"OVERLAY","TextStatusBarText");
	bar.RightText:SetPoint("RIGHT");

--	Scripts
	bar:SetScript("OnEvent",AlternatePowerBar_OnEvent);
	bar:SetScript("OnUpdate",AlternatePowerBar_OnUpdate);
	AlternatePowerBar_OnLoad(bar);

--	Return the bar
	return bar;
end

do	local bar=CreateAlternatePowerBar("$parentAlternatePowerBar",PlayerFrame);
	bar:SetSize(104,12);
	bar:SetPoint("BOTTOMLEFT",114,23);
end
