----- Configuration file for Wallpaper_Kit Version 0.3 -----
--object container
local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:GetModule("Misc")
function MISC:WallpaperKit()
if not MaoRUIDB["Misc"]["WallpaperKit"] then return end
local WallpaperKitcfg = {}
-- DISPLAY
WallpaperKitcfg.show = {
	name = true, guild = true,	-- TEXT
	background = true, auratexture = true, classicon = true, factionicon = true, toptexture = true, bottomtexture = true,	-- TEXTURES
	playermodel = true, petmodel = true, battlepetmodel = true,	-- MODELS
}
WallpaperKitcfg.color = {class = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2, UnitClass("player"))],}
WallpaperKitcfg.playermodel = {animation = 4, rotation = -21, camdistance = 1.5, pos = { Y = 1, Z = -0.1, },}  -- PLAYER MODEL SETTING  动画 、旋转、缩放 、位置
WallpaperKitcfg.petmodel = {rotation = 45, camdistance = 1.8, pos = { Y = -3.8, Z = -1.2, },}  -- PET MODEL SETTINGS
WallpaperKitcfg.battlepetmodel = {rotation = 20, camdistance = 3, pos = { Y = 0, Z = -1.25, },}  -- BATTLEPET MODEL SETTINGS
-- TOP / BOTTOM TEXTURE
WallpaperKitcfg.background = {
	top = { size = 0.1, gradient = true,
		gradientcolor = { 0.2,0.2,0.2,0, 0,0,0,0.9}, -- THE FIRST FOUR DIGITS IS THE BOTTOM COLOR, THE SECOND FOUR IS THE TOP COLOR
		staticcolor = { 0.15,0.15,0.15,0.6 },
	},
	bottom = { size = 0.3, gradient = true,
		gradientcolor = { 0,0,0,0.9, 0.2,0.2,0.2,0 }, -- THE FIRST FOUR DIGITS IS THE TOP COLOR, THE SECOND FOUR IS THE BOTTOM COLOR
		staticcolor = { 0.15,0.15,0.15,0.6 },
	},
}
-- TEXT
WallpaperKitcfg.text ={
	name = { size = 43, flag = "OUTLINE", pos = { point = "TOP", X = -0.21, Y = -0.08, },},
	guild = { size = 36, flag = "OUTLINE", },
}
-- CENTER AURA
WallpaperKitcfg.aura = {classcolor = true, size = 0.15, texture = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\Wallpaper\\AuraWings", color = {1,1,1,1},pos = { point = "CENTER", X = 0, Y = 0, },}
-- CENTER CLASSICON
WallpaperKitcfg.classicon = { size = 21, font = "Interface\\Addons\\_ShiGuang\\Media\\Fonts\\RedCircl.ttf", text = "--- |cFFFFFF00 2 |r|cFFFF0000 UI|r ---", pos = { point = "BOTTOM", X = 0, Y = 43, },}
-- FACTION ICON
WallpaperKitcfg.factionicon = { size = 0.8, pos = { point = "CENTER", X = -430, Y = -21, },}
------------------------------- FUNCTIONS-----------------------------
local function OnEvent(self)
	if UIParent:IsShown() and self:IsShown() then self:Disable() return end
	if UnitIsAFK("player") then self:Enable() end
end
--canvas frame
local WallpaperKit = CreateFrame("Frame",nil,UIParent)
WallpaperKit:SetAllPoints()
WallpaperKit:SetFrameStrata("HIGH")
WallpaperKit:SetFrameLevel(0)
WallpaperKit:EnableMouse(true)
WallpaperKit:SetAlpha(0)
WallpaperKit:Hide()
WallpaperKit.w,WallpaperKit.h = WallpaperKit:GetSize()
-- BACKGROUND TEXTURE
if WallpaperKitcfg.show.background then
WallpaperKit.bg = WallpaperKit:CreateTexture(nil,"BACKGROUND",nil,-8)
--WallpaperKit.bg:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\Wallpaper\\bg")
WallpaperKit.bg:SetColorTexture(0.85, 0.3, 0.27, 0.8)
WallpaperKit.bg:SetVertexColor(WallpaperKitcfg.color.class.r, WallpaperKitcfg.color.class.g, WallpaperKitcfg.color.class.b, 1)
WallpaperKit.bg:SetPoint("CENTER")
WallpaperKit.bg:SetSize(WallpaperKit.w,WallpaperKit.w)
else
end
-- AURA TEXTURE
if WallpaperKitcfg.show.auratexture then
WallpaperKit.bg2 = WallpaperKit:CreateTexture(nil,"BACKGROUND",nil,-7)
WallpaperKit.bg2:SetTexture("") --WallpaperKitcfg.aura.texture
if WallpaperKitcfg.aura.classcolor then WallpaperKit.bg2:SetVertexColor(WallpaperKitcfg.color.class.r, WallpaperKitcfg.color.class.g, WallpaperKitcfg.color.class.b, 1)
else WallpaperKit.bg2:SetVertexColor(unpack(WallpaperKitcfg.aura.color)) end
WallpaperKit.bg2:SetPoint(WallpaperKitcfg.aura.pos.point, WallpaperKitcfg.aura.pos.X, WallpaperKitcfg.aura.pos.Y)
WallpaperKit.bg2:SetSize(WallpaperKit.w*WallpaperKitcfg.aura.size,WallpaperKit.w*WallpaperKitcfg.aura.size)
else return end

-- TOP SHADE
if WallpaperKitcfg.show.toptexture then
WallpaperKit.topbg = WallpaperKit:CreateTexture(nil,"BACKGROUND",nil,-5)
WallpaperKit.topbg:SetColorTexture(1,1,1,1)
WallpaperKit.topbg:SetPoint("TOPLEFT")
WallpaperKit.topbg:SetPoint("TOPRIGHT")
WallpaperKit.topbg:SetHeight(WallpaperKit.h*WallpaperKitcfg.background.top.size)
if WallpaperKitcfg.background.top.gradient then WallpaperKit.topbg:SetGradientAlpha("VERTICAL", unpack(WallpaperKitcfg.background.top.gradientcolor))
else WallpaperKit.topbg:SetVertexColor(unpack(WallpaperKitcfg.background.top.staticcolor)) end
end
-- BOTTOM SHADE
if WallpaperKitcfg.show.bottomtexture then
WallpaperKit.bottombg = WallpaperKit:CreateTexture(nil,"BACKGROUND",nil,-5)
WallpaperKit.bottombg:SetColorTexture(1,1,1,1)
WallpaperKit.bottombg:SetPoint("BOTTOMLEFT")
WallpaperKit.bottombg:SetPoint("BOTTOMRIGHT")
WallpaperKit.bottombg:SetHeight(WallpaperKit.h*WallpaperKitcfg.background.bottom.size)
if WallpaperKitcfg.background.bottom.gradient then WallpaperKit.bottombg:SetGradientAlpha("VERTICAL", unpack(WallpaperKitcfg.background.bottom.gradientcolor))
else WallpaperKit.bottombg:SetVertexColor(unpack(WallpaperKitcfg.background.bottom.staticcolor)) end
else return end
-- CLASS ICON
if WallpaperKitcfg.show.classicon then
	WallpaperKit.classicon = WallpaperKit:CreateFontString(nil, "OVERLAY")
	WallpaperKit.classicon:SetPoint(WallpaperKitcfg.classicon.pos.point, WallpaperKitcfg.classicon.pos.X, WallpaperKitcfg.classicon.pos.Y)
	WallpaperKit.classicon:SetFont(WallpaperKitcfg.classicon.font, WallpaperKitcfg.classicon.size, "OUTLINE")
	WallpaperKit.classicon:SetText(WallpaperKitcfg.classicon.text)
else return end
-- FACTION ICON
if WallpaperKitcfg.show.factionicon then
WallpaperKit.factionicon = WallpaperKit:CreateTexture(nil,"BACKGROUND",nil,-4)
WallpaperKit.factionicon:SetPoint(WallpaperKitcfg.factionicon.pos.point, WallpaperKitcfg.factionicon.pos.X, WallpaperKitcfg.factionicon.pos.Y)
WallpaperKit.factionicon:SetSize(WallpaperKit.h*WallpaperKitcfg.factionicon.size, WallpaperKit.h*WallpaperKitcfg.factionicon.size)
local faction = UnitFactionGroup("player")
if faction ~= "Neutral" then WallpaperKit.factionicon:SetTexture("Interface\\Timer\\"..faction.."-Logo") end
else return end
------------------------------- MODELS----------------------------- 
-- PLAYER MODEL
WallpaperKit.playermodel = CreateFrame("PlayerModel",nil,WallpaperKit)
WallpaperKit.playermodel:SetSize(WallpaperKit.w,WallpaperKit.h)
WallpaperKit.playermodel:SetPoint("CENTER")
-- PET MODEL
WallpaperKit.petmodel = CreateFrame("PlayerModel",nil,WallpaperKit)
WallpaperKit.petmodel:SetSize(WallpaperKit.w,WallpaperKit.h)
WallpaperKit.petmodel:SetPoint("CENTER")
-- BATTLEPET MODEL
WallpaperKit.battlepetmodel = CreateFrame("PlayerModel",nil,WallpaperKit)
WallpaperKit.battlepetmodel:SetSize(WallpaperKit.w,WallpaperKit.h)
WallpaperKit.battlepetmodel:SetPoint("CENTER")

function WallpaperKit:UpdateModel()
	-- PLAYER
	if WallpaperKitcfg.show.playermodel then
	self.playermodel:SetUnit("player")
	self.playermodel:SetAnimation(WallpaperKitcfg.playermodel.animation)
	self.playermodel:SetRotation(math.rad(WallpaperKitcfg.playermodel.rotation))
	self.playermodel:SetCamDistanceScale(WallpaperKitcfg.playermodel.camdistance)
	if UnitRace("player") == "侏儒" then self.playermodel:SetPosition(0,0.6,0)
	elseif UnitRace("player") == "矮人" then self.playermodel:SetPosition(0,0.9,0)
	else self.playermodel:SetPosition(0,WallpaperKitcfg.playermodel.pos.Y,WallpaperKitcfg.playermodel.pos.Z) end
  else return end
	-- PET
	if WallpaperKitcfg.show.petmodel then
		self.petmodel:SetUnit("pet")
		self.petmodel:SetRotation(math.rad(WallpaperKitcfg.petmodel.rotation))
		self.petmodel:SetCamDistanceScale(WallpaperKitcfg.petmodel.camdistance)
		self.petmodel:SetPosition(0,WallpaperKitcfg.petmodel.pos.Y,WallpaperKitcfg.petmodel.pos.Z)
  else return end
	--TEXT
	if WallpaperKitcfg.show.name then
	local NAMEANDTITLE = UnitPVPName("player")
	self.textname:SetText(NAMEANDTITLE)
  else return end
	if WallpaperKitcfg.show.guild then
	local faction = UnitFactionGroup("player")
	if(IsInGuild()) then
		local guildName, guildRankName = GetGuildInfo("player");
		if faction == "Horde" then self.textguild:SetText("|cffffd200"..guildRankName.."|cff9d9d9d  <|cffffd200 "..guildName.." |cff9d9d9d>  |cffE60D12"..GetRealmName())
		elseif faction == "Alliance" then self.textguild:SetText("|cffffd200"..guildRankName.."|cff9d9d9d  <|cffffd200 "..guildName.." |cff9d9d9d>  |cff4A54E8"..GetRealmName())
    else return end
	else
		if faction == "Horde" then self.textguild:SetText("|cff9d9d9d |cffE60D12"..GetRealmName())
		elseif faction == "Alliance" then self.textguild:SetText("|cff9d9d9d |cff4A54E8"..GetRealmName())
		else self.textguild:SetText("|cff9d9d9d |cff20ff20"..GetRealmName()) end
	end else return end
end
-- NAME 
WallpaperKit.textname = WallpaperKit:CreateFontString(nil, "OVERLAY")
WallpaperKit.textname:SetFont(STANDARD_TEXT_FONT, WallpaperKitcfg.text.name.size, WallpaperKitcfg.text.name.flag)
WallpaperKit.textname:SetPoint(WallpaperKitcfg.text.name.pos.point, WallpaperKit.h*WallpaperKitcfg.text.name.pos.X, WallpaperKit.h*WallpaperKitcfg.text.name.pos.Y) 
WallpaperKit.textname:SetTextColor(WallpaperKitcfg.color.class.r,WallpaperKitcfg.color.class.g,WallpaperKitcfg.color.class.b)
-- GUILD
WallpaperKit.textguild = WallpaperKit:CreateFontString(nil, "OVERLAY")
WallpaperKit.textguild:SetFont(STANDARD_TEXT_FONT, WallpaperKitcfg.text.guild.size, WallpaperKitcfg.text.guild.flag)
WallpaperKit.textguild:SetPoint("TOP", WallpaperKit.textname, "BOTTOM", 0, 0) 
--fade in anim
WallpaperKit.fadeIn = WallpaperKit:CreateAnimationGroup()
WallpaperKit.fadeIn.anim = WallpaperKit.fadeIn:CreateAnimation("Alpha")
WallpaperKit.fadeIn.anim:SetDuration(0.8)
WallpaperKit.fadeIn.anim:SetSmoothing("IN")
WallpaperKit.fadeIn.anim:SetFromAlpha(0)
WallpaperKit.fadeIn.anim:SetToAlpha(1)
WallpaperKit.fadeIn:HookScript("OnFinished", function(self) self:GetParent():SetAlpha(1) end)
--fade out anim
WallpaperKit.fadeOut = WallpaperKit:CreateAnimationGroup()
WallpaperKit.fadeOut.anim = WallpaperKit.fadeOut:CreateAnimation("Alpha")
WallpaperKit.fadeOut.anim:SetDuration(0.8)
WallpaperKit.fadeOut.anim:SetSmoothing("OUT")
WallpaperKit.fadeOut.anim:SetFromAlpha(1)
WallpaperKit.fadeIn.anim:SetToAlpha(0)
WallpaperKit.fadeOut:HookScript("OnFinished", function(self) self:GetParent():SetAlpha(0) self:GetParent():Hide() end)
----------------------nice-------------------------------------------
SLASH_WALLPAPERKIT1 = '/wallpaperkit'; --'/wpk', 3.
function SlashCmdList.WALLPAPERKIT(msg, editbox) -- 4.
if WallpaperKit:IsShown() then WallpaperKit:Disable() else WallpaperKit:Enable() end end
function button_OnClick() WallpaperKit:Disable(); if UnitIsAFK("player") then SendChatMessage("", "AFK"); end end
local hidebutton = CreateFrame("BUTTON", nil, WallpaperKit)
hidebutton:SetSize(UIParent:GetWidth(),UIParent:GetHeight())
hidebutton:SetPoint("CENTER")
hidebutton.t = hidebutton:CreateTexture(nil,"BACKGROUND",nil,0)
hidebutton:SetScript("OnClick", button_OnClick)
-----------------------------------------------------------------------
-- canvas enable func
function WallpaperKit:Enable() self:Show() self:UpdateModel() self.fadeIn:Play() end  --UIParent:Hide()
-- canvas disable func
function WallpaperKit:Disable() UIParent:Show() self.fadeOut:Play() end

WallpaperKit:SetScript("OnEvent",OnEvent)
WallpaperKit:RegisterEvent("PLAYER_FLAGS_CHANGED")
WallpaperKit:RegisterEvent("PLAYER_ENTERING_WORLD")
WallpaperKit:RegisterEvent("PLAYER_LEAVING_WORLD")
UIParent:HookScript("OnShow", function() OnEvent(WallpaperKit) end)

--/script T,F=T or 0,F or CreateFrame("frame")if X then X=nil print("OFF.")else print("ON.") X=function()local t=GetTime()if t-T>1 then StaticPopup1Button2:Click()T=t end end end F:SetScript("OnUpdate",X)
end 