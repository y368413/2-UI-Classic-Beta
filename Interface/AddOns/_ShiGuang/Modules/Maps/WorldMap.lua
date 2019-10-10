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

	playerCoords = M.CreateFS(WorldMapFrame, 12, "", false, "BOTTOMLEFT", 10, 6)
	cursorCoords = M.CreateFS(WorldMapFrame, 12, "", false, "BOTTOMLEFT", 120, 6)

	hooksecurefunc(WorldMapFrame, "OnFrameSizeChanged", module.UpdateMapID)
	hooksecurefunc(WorldMapFrame, "OnMapChanged", module.UpdateMapID)

	local CoordsUpdater = CreateFrame("Frame", nil, WorldMapFrame)
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

function module:SetupWorldMap()
	if IsAddOnLoaded("Leatrix_Maps") then return end

	-- Fix worldmap cursor when scaling
	WorldMapFrame.ScrollContainer.GetCursorPosition = function(f)
		local x, y = MapCanvasScrollControllerMixin.GetCursorPosition(f)
		local scale = WorldMapFrame:GetScale()
		return x / scale, y / scale
	end

	-- Fix scroll zooming in classic
	WorldMapFrame.ScrollContainer:HookScript("OnMouseWheel", function(self, delta)
		local x, y = self:GetNormalizedCursorPosition()
		local nextZoomOutScale, nextZoomInScale = self:GetCurrentZoomRange()
		if delta == 1 then
			if nextZoomInScale > self:GetCanvasScale() then
				self:InstantPanAndZoom(nextZoomInScale, x, y)
			end
		else
			if nextZoomOutScale < self:GetCanvasScale() then
				self:InstantPanAndZoom(nextZoomOutScale, x, y)
			end
		end
	end)

	M.CreateMF(WorldMapFrame, nil, true)
	self.UpdateMapScale(WorldMapFrame)
	hooksecurefunc(WorldMapFrame, "HandleUserActionToggleSelf", self.UpdateMapAnchor)

	-- Default elements
	WorldMapFrame.BlackoutFrame:Hide()
	WorldMapFrame:SetFrameStrata("MEDIUM")
	WorldMapFrame.BorderFrame:SetFrameStrata("MEDIUM")
	WorldMapFrame.BorderFrame:SetFrameLevel(1)
	WorldMapFrame:SetAttribute("UIPanelLayout-area", "center")
	WorldMapFrame:SetAttribute("UIPanelLayout-enabled", false)
	WorldMapFrame:SetAttribute("UIPanelLayout-allowOtherPanels", true)
	WorldMapFrame.HandleUserActionToggleSelf = function()
		if WorldMapFrame:IsShown() then WorldMapFrame:Hide() else WorldMapFrame:Show() end
	end
	tinsert(UISpecialFrames, "WorldMapFrame")

	self:MapPartyDots()
end

local function isMouseOverMap()
	return not WorldMapFrame:IsMouseOver()
end

function module:MapFader()
	if MaoRUISettingDB["Map"]["MapFader"] then
		PlayerMovementFrameFader.AddDeferredFrame(WorldMapFrame, .5, 1, .5, isMouseOverMap)
	else
		PlayerMovementFrameFader.RemoveFrame(WorldMapFrame)
	end
end

function module:MapPartyDots()
	local WorldMapUnitPin, WorldMapUnitPinSizes
	local partyTexture = "Interface\\OptionsFrame\\VoiceChat-Record"

	local function setPinTexture(self)
		self:SetPinTexture("raid", partyTexture)
		self:SetPinTexture("party", partyTexture)
	end

	-- Set group icon textures
	for pin in WorldMapFrame:EnumeratePinsByTemplate("GroupMembersPinTemplate") do
		WorldMapUnitPin = pin
		WorldMapUnitPinSizes = pin.dataProvider:GetUnitPinSizesTable()
		setPinTexture(WorldMapUnitPin)
		hooksecurefunc(WorldMapUnitPin, "UpdateAppearanceData", setPinTexture)
		break
	end

	-- Set party icon size and enable class colors
	WorldMapUnitPinSizes.player = 24
	WorldMapUnitPinSizes.party = 14
	WorldMapUnitPin:SetAppearanceField("party", "useClassColor", true)
	WorldMapUnitPin:SetAppearanceField("raid", "useClassColor", true)
	WorldMapUnitPin:SynchronizePinSizes()
end

function module:OnLogin()
	self:SetupWorldMap()
	self:SetupCoords()
	self:SetupMinimap()
	self:MapReveal()
	self:MapFader()
end