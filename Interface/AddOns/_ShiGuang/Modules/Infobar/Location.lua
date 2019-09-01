local _, ns = ...
local M, R, U, I = unpack(ns)
if not R.Infobar.Location then return end

local module = M:GetModule("Infobar")
local info = module:RegisterInfobar("Location", R.Infobar.LocationPos)
local mapModule = M:GetModule("Maps")
local format, unpack = string.format, unpack
info.text:SetFont(unpack(R.Infobar.TTFonts))
local WorldMapFrame, SELECTED_DOCK_FRAME, ChatFrame_OpenChat = WorldMapFrame, SELECTED_DOCK_FRAME, ChatFrame_OpenChat
local GetSubZoneText, GetZoneText, GetZonePVPInfo, IsInInstance = GetSubZoneText, GetZoneText, GetZonePVPInfo, IsInInstance
local C_Map_GetBestMapForUnit = C_Map.GetBestMapForUnit

local zoneInfo = {
	sanctuary = {SANCTUARY_TERRITORY, {.41, .8, .94}},
	arena = {FREE_FOR_ALL_TERRITORY, {1, .1, .1}},
	friendly = {FACTION_CONTROLLED_TERRITORY, {.1, 1, .1}},
	hostile = {FACTION_CONTROLLED_TERRITORY, {1, .1, .1}},
	contested = {CONTESTED_TERRITORY, {1, .7, 0}},
	combat = {COMBAT_ZONE, {1, .1, .1}},
	neutral = {format(FACTION_CONTROLLED_TERRITORY, FACTION_STANDING_LABEL4), {1, .93, .76}}
}

local subzone, zone, pvp
local coordX, coordY = 0, 0

local function formatCoords()
	return format("%.1f, %.1f", coordX*100, coordY*100)
end

info.eventList = {
	"ZONE_CHANGED",
	"ZONE_CHANGED_INDOORS",
	"ZONE_CHANGED_NEW_AREA",
	"PLAYER_ENTERING_WORLD",
}

info.onEvent = function(self)
	subzone, realzone, zone, pvp = GetSubZoneText(), GetRealZoneText(), GetZoneText(), {GetZonePVPInfo()}
	if not pvp[1] then pvp[1] = "neutral" end
	local r, g, b = unpack(zoneInfo[pvp[1]][2])
	if subzone ~= '' and subzone ~= realzone then self.text:SetFormattedText('%s - %s', realzone, subzone) else self.text:SetText(realzone) end
	self.text:SetTextColor(r, g, b)
end