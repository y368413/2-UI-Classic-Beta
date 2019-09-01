--## Author: Smonman ## Version: 0.1

local firstAddonLoadOfSession = true
local mapF = WorldMapFrame.ScrollContainer.Child

local alpha = 1
local nodeSize = 143
local width = 143

local allNodes = {}

local allNodeCoords = {
	1900, -840, true,	--1
	1918, -1020, false,	--2

	1960, -1055, true,	--3
	1920, -1115, false,	--4

	1615, -970, true,	--5
	1800, -2190, true,	--6

	1615, -1020, true,	--7
	1918, -1020, false,	--8

	1645, -600, true,	--9
	1565, -285, true,	--10

	1805, -500, true,	--11
	1930, -840, false,	--12

	2025, -315, true,	--13
	1725, -160, true,	--14

	2025, -280, true,	--15
	2280, -280, true,	--16

	2040, -500, true,	--17
	2027, -300, false,	--18

	1735, -133, true,	--19
	1780, -520, false,	--20

	2260, -830, true,	--21
	2930, -1020, false,	--22

	2750, -375, true,	--23
	2270, -580, false,	--24

	1565, -2150, true,	--25
	1800, -2210, false	--26
}

-- Dazar'Alor = 1165

function OnPlayerLogin()
	if firstAddonLoadOfSession == true then
		mapF.dazarAlor = CreateFrame("FRAME", "DazarAlorFrame", mapF)
		mapF.dazarAlor:SetAllPoints(mapF)
		mapF.dazarAlor:SetFrameStrata("MEDIUM")
		SetupTextures()
	end
	firstAddonLoadOfSession = false
end

function Update()
	if IsAddOnLoaded("Blizzard_WorldMap") and WorldMapFrame:IsShown() then
		if WorldMapFrame:GetMapID() ~= 1165 then mapF.dazarAlor:Hide()
		else mapF.dazarAlor:Show()
			for i = 1, #allNodes do
				if allNodes[i].text ~= nil then allNodes[i].text:Show() end
			end
		end
	end
end

local PLAYER_ENTERING_WORLD_Frame = CreateFrame("FRAME")
PLAYER_ENTERING_WORLD_Frame:RegisterEvent("PLAYER_LOGIN")
PLAYER_ENTERING_WORLD_Frame:SetScript("OnEvent", OnPlayerLogin)

local ON_UPDATE = CreateFrame("FRAME")
ON_UPDATE:SetScript("OnUpdate", Update)

function NewNode(x, y, isStartNode, size, alpha, parent)
	local node = {}
	node.x = x
	node.y = y
	node.isStartNode = isStartNode
	node.tex = parent:CreateTexture("BACKGROUND")
	node.tex:SetDrawLayer("BACKGROUND", -7)
	if isStartNode then
		--node.tex:SetColorTexture(1, 1, 1, alpha)
		node.tex:SetAtlas("collections-icon-favorites")  --SetTexture("INTERFACE\\TAXIFRAME\\UI-Taxi-Icon-Yellow.blp")
		node.tex:SetSize(size, size)
		node.tex:SetPoint("TOPLEFT", parent, "TOPLEFT", x - size / 2, y + size / 2)
	else
		--node.tex:SetColorTexture(0, 0, 0, alpha)
		node.tex:SetTexture("INTERFACE\\TAXIFRAME\\UI-Taxi-Icon-Nub.blp")
		node.tex:SetSize(size / 1.2, size / 1.2)
		node.tex:SetPoint("TOPLEFT", parent, "TOPLEFT", x - size / 1.2 / 2, y + size / 1.2 / 2)
	end
	node.tex.SetPoint = function() end

	node.text = parent:CreateFontString(nil, "OVERLAY")
	--node.text:SetFontObject("NumberFontNormalHuge")
	node.text:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 43, "OUTLINE")
	node.text:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
	node.text.SetPoint = function() end

	return node
end

-- http://www.wowinterface.com/forums/showthread.php?p=15012
function NewLine(nodeA, nodeB, width, alpha, parent)
	local T = parent:CreateTexture("BACKGROUND")
	T:SetDrawLayer("BACKGROUND", -8)
	local C = parent
	local w = width

	local sx, sy = nodeA.x, nodeA.y
	local ex, ey = nodeB.x, nodeB.y

	local relPoint = "TOPLEFT"

	local LINEFACTOR = 32 / 30; -- Multiplying factor for texture coordinates
	local LINEFACTOR_2 = LINEFACTOR / 2; -- Half o that

	-- Determine dimensions and center point of line
	local dx,dy = ex - sx, ey - sy;
	local cx,cy = (sx + ex) / 2, (sy + ey) / 2;

	-- Normalize direction if necessary
	if (dx < 0) then
		dx,dy = -dx,-dy;
	end

	-- Calculate actual length of line
	local l = sqrt((dx * dx) + (dy * dy));

	-- Quick escape if it's zero length
	if (l == 0) then
		T:SetTexCoord(0,0,0,0,0,0,0,0);
		T:SetPoint("BOTTOMLEFT", C, relPoint, cx,cy);
		T:SetPoint("TOPRIGHT", C, relPoint, cx,cy);
		return;
	end

	-- Sin and Cosine of rotation, and combination (for later)
	local s,c = -dy / l, dx / l;
	local sc = s * c;

	-- Calculate bounding box size and texture coordinates
	local Bwid, Bhgt, BLx, BLy, TLx, TLy, TRx, TRy, BRx, BRy;
	if (dy >= 0) then
		Bwid = ((l * c) - (w * s)) * LINEFACTOR_2;
		Bhgt = ((w * c) - (l * s)) * LINEFACTOR_2;
		BLx, BLy, BRy = (w / l) * sc, s * s, (l / w) * sc;
		BRx, TLx, TLy, TRx = 1 - BLy, BLy, 1 - BRy, 1 - BLx; 
		TRy = BRx;
	else
		Bwid = ((l * c) + (w * s)) * LINEFACTOR_2;
		Bhgt = ((w * c) + (l * s)) * LINEFACTOR_2;
		BLx, BLy, BRx = s * s, -(l / w) * sc, 1 + (w / l) * sc;
		BRy, TLx, TLy, TRy = BLx, 1 - BRx, 1 - BLx, 1 - BLy;
		TRx = TLy;
	end

	-- Set texture coordinates and anchors
	T:SetTexture("INTERFACE\\TAXIFRAME\\UI-Taxi-Line.blp")
	T:SetTexCoord(TLx, TLy, BLx, BLy, TRx, TRy, BRx, BRy);
	T:SetPoint("BOTTOMLEFT", C, relPoint, cx - Bwid, cy - Bhgt);
	T:SetPoint("TOPRIGHT", C, relPoint, cx + Bwid, cy + Bhgt);
	T:SetVertexColor(1, 1, 1, alpha)
	return T
end

function SetupTextures()
	local i = 1
	local n = 1
	while i < #allNodeCoords do
		local nodeA = NewNode(allNodeCoords[i], allNodeCoords[i + 1], allNodeCoords[i + 2], nodeSize, alpha, mapF.dazarAlor)
		local nodeB = NewNode(allNodeCoords[i + 3], allNodeCoords[i + 4], allNodeCoords[i + 5], nodeSize, alpha, mapF.dazarAlor)
		table.insert(allNodes, nodeA)
		table.insert(allNodes, nodeB)
		table.insert(allNodes, NewLine(nodeA, nodeB, width, alpha, mapF.dazarAlor))
		nodeA.text:SetText(n)
		nodeB.text:SetText(n + 1)
		i = i + 6
		n = n + 2
	end
end