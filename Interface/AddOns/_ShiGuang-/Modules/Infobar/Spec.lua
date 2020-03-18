local _, ns = ...
local M, R, U, I = unpack(ns)
if not R.Infobar.Spec then return end

local module = M:GetModule("Infobar")
local info = module:RegisterInfobar("Spec", R.Infobar.SpecPos)
info.text:SetFont(unpack(R.Infobar.TTFonts))
local format, wipe, select, next, strsub = string.format, table.wipe, select, next, strsub
local TALENT, SHOW_SPEC_LEVEL, FEATURE_BECOMES_AVAILABLE_AT_LEVEL, NONE = TALENT, SHOW_SPEC_LEVEL, FEATURE_BECOMES_AVAILABLE_AT_LEVEL, NONE
local UnitLevel, ToggleTalentFrame, UnitCharacterPoints = UnitLevel, ToggleTalentFrame, UnitCharacterPoints
local talentString = "%s (%s)"
local unspendPoints = gsub(CHARACTER_POINTS1_COLON, HEADER_COLON, "")

local function addIcon(texture)
	texture = texture and "|T"..texture..":13:15:0:0:50:50:4:46:4:46|t" or ""
	return texture
end

info.eventList = {
	"PLAYER_ENTERING_WORLD",
	"CHARACTER_POINTS_CHANGED",
	"SPELLS_CHANGED",
}

info.onEvent = function(self)
	local text = ""
	for i = 1, 5 do
		local name, _, pointsSpent = GetTalentTabInfo(i)
		if not name then break end
		text = text.."-"..pointsSpent
	end
	if text == "" then
		text = NONE
	else
		text = strsub(text, 2)
	end
	local points = UnitCharacterPoints("player")
	if points > 0 then
		text = format(talentString, text, points)
	end
	self.text:SetText(TALENT..": "..I.MyColor..text)
end

info.onEnter = function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 15)
	GameTooltip:ClearLines()
	GameTooltip:AddLine(TALENT, 0,.6,1)
	GameTooltip:AddLine(" ")

	for i = 1, 5 do
		local name, _, pointsSpent = GetTalentTabInfo(i)
		if not name then break end
		GameTooltip:AddDoubleLine(name, pointsSpent, 1,1,1, 1,.8,0)
	end
	local points = UnitCharacterPoints("player")
	if points > 0 then
		GameTooltip:AddLine(" ")
		GameTooltip:AddDoubleLine(unspendPoints, points, .6,.8,1, 1,.8,0)
	end

	GameTooltip:AddDoubleLine(" ", I.LineString)
	GameTooltip:AddDoubleLine(" ", I.LeftButton..U["SpecPanel"].." ", 1,1,1, .6,.8,1)
	GameTooltip:Show()
end

info.onLeave = M.HideTooltip

info.onMouseUp = function()
	if UnitLevel("player") < SHOW_SPEC_LEVEL then
		UIErrorsFrame:AddMessage(I.InfoColor..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, SHOW_SPEC_LEVEL))
	else
		ToggleTalentFrame()
	end
end