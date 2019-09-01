--[[	RealMobHealth UI Tweaks Module
	by SDPhantom
	https://www.wowinterface.com/forums/member.php?u=34145	]]
------------------------------------------------------------------

--------------------------
--[[	Namespace	]]
--------------------------
local Name,AddOn=...;
AddOn.API=AddOn.API or {};
AddOn.Options=AddOn.Options or {};

----------------------------------
--[[	Options Defaults	]]
----------------------------------
AddOn.Options.ShowTooltipText=false;
AddOn.Options.ShowStatusBarTextAdditions=true;
AddOn.Options.ModifyHealthBarText=true;
AddOn.Options.ShowNamePlateHealthText=true;

----------------------------------
--[[	Local References	]]
----------------------------------
local ipairs=ipairs;
local next=next;
local math_abs=math.abs;
local math_floor=math.floor;
local math_log10=math.log10;
local math_max=math.max;
local pairs=pairs;
local tostring=tostring
local UnitCanAttack=UnitCanAttack;
local unpack=unpack;

----------------------------------
--[[	Helper Functions	]]
----------------------------------
local NumberCaps={FIRST_NUMBER_CAP,SECOND_NUMBER_CAP};
local function AbbreviateNumber(val)--	Abbreviates large numbers
	local exp=math_max(0,math_floor(math_log10(math_abs(val))));--	Calculate exponent of 10 and clamp to zero
	if exp<3 then return tostring(math_floor(val)); end--	Less than 1k, return as-is

	local factor=math_floor(exp/3);--	Exponent factor of 1k
	local precision=math_max(0,2-exp%3);--	Dynamic precision based on how many digits we have (Returns numbers like 100k, 10.0k, and 1.00k)

--	Fallback to scientific notation if we run out of units
	return ((val<0 and "-" or "").."%0."..precision.."f%s"):format(val/1000^factor,NumberCaps[factor] or "e"..(factor*3));
end

----------------------------------
--[[	GameTooltip Tweaks	]]
----------------------------------
GameTooltip:HookScript("OnTooltipSetUnit",function(self)
	local _,unit=self:GetUnit();
	if AddOn.Options.ShowTooltipText and unit and UnitCanAttack("player",unit) and AddOn.IsUnitMob(unit) then
		local creaturekey=AddOn.GetUnitCreatureKey(unit);
		local hasdata=false;

		if AddOn.IsBlacklistedUnit(unit) then self:AddLine(AddOn.Localization.UITweaksTooltip_Blacklisted,0.5,0.5,0.5); hasdata=true; end
		if creaturekey then
			if AddOn.UnitHasHealthData(unit) then self:AddLine(AddOn.Localization.UITweaksTooltip_HealthRecorded,0,1,0); hasdata=true; end
			if AddOn.HasHealthOverride(creaturekey) then self:AddLine(AddOn.Localization.UITweaksTooltip_HealthOverride,0.5,0.5,1); hasdata=true; end
			if not hasdata then self:AddLine(AddOn.Localization.UITweaksTooltip_NoData,1,0,0); end
		end
	end
end);

----------------------------------
--[[	Setup TargetFrame	]]
----------------------------------
local StatusBarTextAdditionsEnabled=true;
local StatusBarTextAdditions={};

local StatusBarTextSubTexts={
	TextString={"CENTER",0,0};
	LeftText={"LEFT",2,0};
	RightText={"RIGHT",-2,0};
};

local InitStatusBarsOnUse={--	Register these to be setup when called for
--	TargetFrame doesn't have FontStrings for the health and mana bars
	[TargetFrameHealthBar]=TargetFrameTextureFrame;
	[TargetFrameManaBar]=TargetFrameTextureFrame;
};

local function SetupStatusBarText(parent,bar)--	Create strings for TextStatusBars
	if StatusBarTextAdditions[bar] then return; end--	Already set up

	local subtexts={};--	Store only SubTexts we've created (respect layout addons already creating these)
	for key,anchor in pairs(StatusBarTextSubTexts) do
		if not bar[key] then
			local text=parent:CreateFontString(nil,"OVERLAY","TextStatusBarText");
			bar[key],subtexts[key]=text,text;
			text:SetPoint(anchor[1],bar,unpack(anchor));
		end
	end
	StatusBarTextAdditions[bar]=subtexts;
end

AddOn.RegisterAddOnEvent("OPTIONS_UPDATE",function(_,option,value)
	if option==nil then option,value="ShowStatusBarTextAdditions",AddOn.Options.ShowStatusBarTextAdditions; end
	if option=="ShowStatusBarTextAdditions" then
		for bar,texts in pairs(StatusBarTextAdditions) do
			if value then
				for key,text in pairs(texts) do
					if bar[key]==nil then bar[key]=text; end--	Only set if empty
				end
				TextStatusBar_UpdateTextString(bar);
			else
				for key,text in pairs(texts) do
					if bar[key]==text then bar[key]=nil; end--	Only clear if it's ours
					text:Hide();
				end
			end
		end
	end
end);

----------------------------------
--[[	HealthBar Tweaks	]]
----------------------------------
local HookedHealthBars={};
hooksecurefunc("UnitFrameHealthBar_Update",function(self,unit)
	if not HookedHealthBars[self] then
		HookedHealthBars[self]=true;
		TextStatusBar_UpdateTextString(self);--	Runs our hook below
	end
end);

--	Replace health text with our own values (We can secure hook, but if taint doesn't get too out of hand, this should have better performance)
function TextStatusBar_UpdateTextString(self)--	Recreate Blizzard version with our modifications
	if InitStatusBarsOnUse[self] then
		SetupStatusBarText(InitStatusBarsOnUse[self],self);
		InitStatusBarsOnUse[self]=nil;
	end

	local text=self.TextString;
	if text then
		local val,min,max;
		if AddOn.Options.ModifyHealthBarText and HookedHealthBars[self] and self.unit and AddOn.IsUnitMob(self.unit) then--	Only modify HealthBars, can run on uninitialized ones
			min,val,max=0,AddOn.GetUnitHealth(self.unit);
		else val,min,max=self:GetValue(),self:GetMinMaxValues(); end
		TextStatusBar_UpdateTextStringWithValues(self,text,val,min,max);--	This needs to call from global to let layout addons work
	end
end

--	Event registration
AddOn.RegisterAddOnEvent("HEALTH_UPDATE",function(_,creaturekey)
	for bar in next,HookedHealthBars do
		if bar.unit and (not creaturekey or creaturekey==AddOn.GetUnitCreatureKey(bar.unit)) then TextStatusBar_UpdateTextString(bar); end--	Re-run our hook
	end
end);

AddOn.RegisterAddOnEvent("OPTIONS_UPDATE",function(_,option)
	if option==nil or option=="ModifyHealthBarText" then
		for bar in next,HookedHealthBars do TextStatusBar_UpdateTextString(bar); end
	end
end);

----------------------------------
--[[	Nameplate Tweaks	]]
----------------------------------
local ShowNamePlateHealthText=AddOn.Options.ShowNamePlateHealthText;--	Cache for settings
local NamePlateHealthText={};
hooksecurefunc(NamePlateDriverFrame,"OnNamePlateCreated",function(self,base)--	Hook Nameplate creation
	local unitframe=base.UnitFrame;

	local health=unitframe.healthBar:CreateFontString(nil,"OVERLAY");--"NumberFontNormalSmall");
	health:SetFont("Fonts\\ArialN.ttf",10,"THICKOUTLINE");--	Fonts are easier to read when made from scratch rather than resizing an inherited one
	health:SetPoint("LEFT",0,0);
	health:SetTextColor(0,1,0);
	health:SetShown(ShowNamePlateHealthText);--	Show/Hide based on options

	NamePlateHealthText[unitframe]=health;
end);

--	Updates text
local function UpdateNamePlateHealthText(unitframe)
	local health=AddOn.GetUnitHealth(unitframe.displayedUnit);
	NamePlateHealthText[unitframe]:SetText(AbbreviateNumber(health));
end

--	Hook text set
hooksecurefunc("CompactUnitFrame_UpdateHealth",function(self)--	This is a shared function with other UnitFrames
	if not NamePlateHealthText[self] then return; end
	UpdateNamePlateHealthText(self);
end);

--	Event registration
AddOn.RegisterAddOnEvent("HEALTH_UPDATE",function(_,creaturekey)
	for unitframe in next,NamePlateHealthText do
		if unitframe.displayedUnit and (not creaturekey or creaturekey==AddOn.GetUnitCreatureKey(unitframe.displayedUnit)) then
			UpdateNamePlateHealthText(unitframe);
		end
	end
end);

AddOn.RegisterAddOnEvent("OPTIONS_UPDATE",function(_,option,value)
	if option==nil then option,value="ShowNamePlateHealthText",AddOn.Options.ShowNamePlateHealthText; end
	if option=="ShowNamePlateHealthText" then
		ShowNamePlateHealthText=value;--	Update cache
		for _,text in pairs(NamePlateHealthText) do text:SetShown(value); end--	Show/Hide based on options
	end
end);
