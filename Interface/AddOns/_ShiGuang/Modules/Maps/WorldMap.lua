﻿local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:RegisterModule("Maps")

local select = select
local WorldMapFrame = WorldMapFrame
local CreateVector2D = CreateVector2D
local UnitPosition = UnitPosition
local C_Map_GetWorldPosFromMapPos = C_Map.GetWorldPosFromMapPos
local C_Map_GetBestMapForUnit = C_Map.GetBestMapForUnit

local mapRects = {}
local tempVec2D = CreateVector2D(0, 0)
local currentMapID, playerCoords, cursorCoords

function module:GetPlayerMapPos(mapID)
	tempVec2D.x, tempVec2D.y = UnitPosition("player")
	if not tempVec2D.x then return end

	local mapRect = mapRects[mapID]
	if not mapRect then
		mapRect = {}
		mapRect[1] = select(2, C_Map_GetWorldPosFromMapPos(mapID, CreateVector2D(0, 0)))
		mapRect[2] = select(2, C_Map_GetWorldPosFromMapPos(mapID, CreateVector2D(1, 1)))
		mapRect[2]:Subtract(mapRect[1])

		mapRects[mapID] = mapRect
	end
	tempVec2D:Subtract(mapRect[1])

	return tempVec2D.y/mapRect[2].y, tempVec2D.x/mapRect[2].x
end

function module:GetCursorCoords()
	if not WorldMapFrame.ScrollContainer:IsMouseOver() then return end

	local cursorX, cursorY = WorldMapFrame.ScrollContainer:GetNormalizedCursorPosition()
	if cursorX < 0 or cursorX > 1 or cursorY < 0 or cursorY > 1 then return end
	return cursorX, cursorY
end

local function CoordsFormat(owner, none)
	local text = none and ": |cffff0000^-^|r" or ": %.1f, %.1f"
	return owner..I.MyColor..text
end

function module:UpdateCoords(elapsed)
	self.elapsed = (self.elapsed or 0) + elapsed
	if self.elapsed > .1 then
		local cursorX, cursorY = module:GetCursorCoords()
		if cursorX and cursorY then
			cursorCoords:SetFormattedText(CoordsFormat(MOUSE_LABEL), 100 * cursorX, 100 * cursorY)
		else
			cursorCoords:SetText(CoordsFormat(MOUSE_LABEL, true))
		end

		if not currentMapID then
			playerCoords:SetText(CoordsFormat(PLAYER, true))
		else
			local x, y = module:GetPlayerMapPos(currentMapID)
			if not x or (x == 0 and y == 0) then
				playerCoords:SetText(CoordsFormat(PLAYER, true))
			else
				playerCoords:SetFormattedText(CoordsFormat(PLAYER), 100 * x, 100 * y)
			end
		end

		self.elapsed = 0
	end
end

function module:UpdateMapID()
	if self:GetMapID() == C_Map_GetBestMapForUnit("player") then
		currentMapID = self:GetMapID()
	else
		currentMapID = nil
	end
end

function module:SetupCoords()
	if not MaoRUISettingDB["Map"]["Coord"] then return end

	playerCoords = M.CreateFS(WorldMapFrame.BorderFrame, 12, "", false, "BOTTOMLEFT", 10, 3)
	cursorCoords = M.CreateFS(WorldMapFrame.BorderFrame, 12, "", false, "BOTTOMLEFT", 120, 3)

	hooksecurefunc(WorldMapFrame, "OnFrameSizeChanged", module.UpdateMapID)
	hooksecurefunc(WorldMapFrame, "OnMapChanged", module.UpdateMapID)

	local CoordsUpdater = CreateFrame("Frame", nil, WorldMapFrame.BorderFrame)
	CoordsUpdater:SetScript("OnUpdate", module.UpdateCoords)
end

function module:UpdateMapScale()
	if self.isMaximized and self:GetScale() ~= 1 then
		self:SetScale(1)
	elseif not self.isMaximized and self:GetScale() ~= MaoRUISettingDB["Map"]["MapScale"] then
		self:SetScale(MaoRUISettingDB["Map"]["MapScale"])
	end
end

function module:UpdateMapAnchor()
	module.UpdateMapScale(self)
	if not self.isMaximized then M.RestoreMF(self) end
end

function module:WorldMapScale()
	-- Fix worldmap cursor when scaling
	WorldMapFrame.ScrollContainer.GetCursorPosition = function(f)
		local x, y = MapCanvasScrollControllerMixin.GetCursorPosition(f)
		local scale = WorldMapFrame:GetScale()
		return x / scale, y / scale
	end

	M.CreateMF(WorldMapFrame, nil, true)
	hooksecurefunc(WorldMapFrame, "HandleUserActionToggleSelf", self.UpdateMapAnchor)
	WorldMapFrame.BlackoutFrame:Hide()
end

function module:MapFader()
	if MaoRUISettingDB["Map"]["MapFader"] then
		PlayerMovementFrameFader.AddDeferredFrame(WorldMapFrame, .5, 1, 1)
	else
		PlayerMovementFrameFader.RemoveFrame(WorldMapFrame)
	end
end

function module:OnLogin()
	self:WorldMapScale()
	self:SetupCoords()
	self:SetupMinimap()
	self:MapReveal()
	self:MapFader()
end