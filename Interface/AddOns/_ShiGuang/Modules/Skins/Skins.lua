local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:RegisterModule("Skins")

function S:OnLogin()
	PlayerFrame:SetScale(MaoRUISettingDB["UFs"]["PlayerFrameScale"]) 
	TargetFrame:SetScale(MaoRUISettingDB["UFs"]["PlayerFrameScale"])
	local cr, cg, cb = 0, 0, 0
	if MaoRUISettingDB["Skins"]["ClassLine"] then cr, cg, cb = I.r, I.g, I.b end

	-- TOPLEFT
	local Tinfobar = CreateFrame("Frame", nil, UIParent)
	Tinfobar:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -2)
	M.CreateGF(Tinfobar, 520, 16, "Horizontal", 0, 0, 0, .6, 0)
	local Tinfobar1 = CreateFrame("Frame", nil, Tinfobar)
	Tinfobar1:SetPoint("BOTTOM", Tinfobar, "TOP")
	M.CreateGF(Tinfobar1, 520, R.mult, "Horizontal", cr, cg, cb, .8, 0)
	local Tinfobar2 = CreateFrame("Frame", nil, Tinfobar)
	Tinfobar2:SetPoint("TOP", Tinfobar, "BOTTOM")
	M.CreateGF(Tinfobar2, 520, R.mult, "Horizontal", cr, cg, cb, .8, 0)
	-- BOTTOMLEFT
	local Linfobar = CreateFrame("Frame", nil, UIParent)
	Linfobar:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 1)
	M.CreateGF(Linfobar, 520, 16, "Horizontal", 0, 0, 0, .6, 0)
	local Linfobar1 = CreateFrame("Frame", nil, Linfobar)
	Linfobar1:SetPoint("BOTTOM", Linfobar, "TOP")
	M.CreateGF(Linfobar1, 520, R.mult, "Horizontal", cr, cg, cb, 0.8, 0)
	local Linfobar2 = CreateFrame("Frame", nil, Linfobar)
	Linfobar2:SetPoint("TOP", Linfobar, "BOTTOM")
	M.CreateGF(Linfobar2, 520, R.mult, "Horizontal", cr, cg, cb, .8, 0)
	-- BOTTOMRIGHT
	local Rinfobar = CreateFrame("Frame", nil, UIParent)
	Rinfobar:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 1)
	M.CreateGF(Rinfobar, 520, 16, "Horizontal", 0, 0, 0, 0, .6)
	local Rinfobar1 = CreateFrame("Frame", nil, Rinfobar)
	Rinfobar1:SetPoint("BOTTOM", Rinfobar, "TOP")
	M.CreateGF(Rinfobar1, 520, R.mult, "Horizontal", cr, cg, cb, 0, .8)
	local Rinfobar2 = CreateFrame("Frame", nil, Rinfobar)
	Rinfobar2:SetPoint("TOP", Rinfobar, "BOTTOM")
	M.CreateGF(Rinfobar2, 520, R.mult, "Horizontal", cr, cg, cb, 0, .8)
   ----BOTTOM
   if MaoRUISettingDB["Skins"]["InfobarLine"] then
   local Bottomline = CreateFrame("Frame", nil, UIParent) 
   Bottomline:SetFrameLevel(0) 
   Bottomline:SetFrameStrata("BACKGROUND")
   Bottomline:SetHeight(16)
   Bottomline:SetWidth(UIParent:GetWidth())
   Bottomline:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 0) 
   Bottomline:SetBackdrop({bgFile = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\line"}) 
   Bottomline:SetBackdropColor(I.r, I.g, I.b, 0.8)
   end

	-- Add Skins
	self:QuestTracker()
	self:DBMSkin()
	self:SkadaSkin()
	self:BigWigsSkin()
	--self:PostalSkin()
	--self:ExtraQuestSkin()
	self:LoadOtherSkins()
	self:LootEx()		-- Ê°È¡ÔöÇ¿
	-- Register skin
	local media = LibStub and LibStub("LibSharedMedia-3.0", true)
	if media then
		media:Register("statusbar", "normTex", I.normTex)
		media:Register("statusbar", "ShiGuang",		[[Interface\Addons\_ShiGuang\Media\Modules\Raid\ColorBar]])
		media:Register("statusbar", "HalfStyle",		[[Interface\Addons\_ShiGuang\Media\Modules\Skada\YaSkada05]])
		media:Register("statusbar", "AtlzSkada",		[[Interface\Addons\_ShiGuang\Media\Modules\Skada\AtlzSkada]])
		media:Register("statusbar", "Yaskada",		[[Interface\Addons\_ShiGuang\Media\Modules\Skada\Yaskada]])
		media:Register("statusbar", "Yaskada02",		[[Interface\Addons\_ShiGuang\Media\Modules\Skada\Yaskada02]])
		media:Register("statusbar", "Yaskada03",		[[Interface\Addons\_ShiGuang\Media\Modules\Skada\Yaskada03]])
		media:Register("statusbar", "Yaskada04",		[[Interface\Addons\_ShiGuang\Media\Modules\Skada\Yaskada04]])
		media:Register("statusbar", "None",		[[Interface\Addons\_ShiGuang\Media\backdrop]])
		media:Register("font", "Vera Serif",			[[Interface\Addons\_ShiGuang\Media\Fonts\Pixel.ttf]])
	end
end

function S:CreateToggle(frame)
	local close = M.CreateButton(frame, 20, 80, ">", 18)
	close:SetPoint("RIGHT", frame.bg, "LEFT", -2, 0)
	M.CreateSD(close)
	M.CreateTex(close)

	local open = M.CreateButton(UIParent, 20, 80, "<", 18)
	open:SetPoint("RIGHT", frame.bg, "RIGHT", 2, 0)
	M.CreateSD(open)
	M.CreateTex(open)
	open:Hide()

	open:SetScript("OnClick", function()
		open:Hide()
	end)
	close:SetScript("OnClick", function()
		open:Show()
	end)

	return open, close
end

function S:LoadWithAddOn(addonName, value, func)
	local function loadFunc(event, addon)
		if not MaoRUISettingDB["Skins"][value] then return end

		if event == "PLAYER_ENTERING_WORLD" then
			M:UnregisterEvent(event, loadFunc)
			if IsAddOnLoaded(addonName) then
				func()
				M:UnregisterEvent("ADDON_LOADED", loadFunc)
			end
		elseif event == "ADDON_LOADED" and addon == addonName then
			func()
			M:UnregisterEvent(event, loadFunc)
		end
	end

	M:RegisterEvent("PLAYER_ENTERING_WORLD", loadFunc)
	M:RegisterEvent("ADDON_LOADED", loadFunc)
end