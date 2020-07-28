local _G = getfenv(0)
local TravelGuide = {}
local LibStub = _G.LibStub
local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes")
local constants = {}
TravelGuide.constants = constants

constants.defaults = {
	profile = {
		icon_scale = 1.5,
		icon_alpha = 1.0,
		query_server = false,
--		show_portal = true,
		show_tram = true,
		show_boat = true,
		show_aboat = true,
		show_zepplin = true,
		show_hzepplin = true,
		show_note = true,
		easy_waypoint = true,
	},
	char = {
		hidden = {
			['*'] = {},
		},
	},
}

constants.icon_texture = {
	boat 		= "Interface\\AddOns\\HandyNotes\\Icons\\Boat",
	aboat 		= "Interface\\AddOns\\HandyNotes\\Icons\\Boat_Alliance",
	tram  		= "Interface\\AddOns\\HandyNotes\\Icons\\Tram",
	flightmaster = "Interface\\MINIMAP\\TRACKING\\FlightMaster",	
	zeppelin 	= "Interface\\AddOns\\HandyNotes\\Icons\\Zeppelin",			
	hzeppelin 	= "Interface\\AddOns\\HandyNotes\\Icons\\Zeppelin_Horde",
}


local string = _G.string
local format, gsub = string.format, string.gsub
local next, wipe, pairs, select, type = next, wipe, pairs, select, type
local GameTooltip, WorldMapTooltip, GetSpellInfo, CreateFrame, UnitClass = _G.GameTooltip, _G.WorldMapTooltip, _G.GetSpellInfo, _G.CreateFrame, _G.UnitClass
local UIDropDownMenu_CreateInfo, CloseDropDownMenus, UIDropDownMenu_AddButton, ToggleDropDownMenu = _G.UIDropDownMenu_CreateInfo, _G.CloseDropDownMenus, _G.UIDropDownMenu_AddButton, _G.ToggleDropDownMenu
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local AceDB = LibStub("AceDB-3.0")
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local HandyNotes_TravelGuide = LibStub("AceAddon-3.0"):NewAddon("HandyNotes_TravelGuide", "AceEvent-3.0")

HandyNotes_TravelGuide.descName = L["HandyNotes: TravelGuide (Classic)"]
HandyNotes_TravelGuide.description = L["Shows the boat and zepplin locations on the World Map and the MiniMap."]
HandyNotes_TravelGuide.pluginName = L["TravelGuide (Classic)"]

_G.HandyNotes_TravelGuide = HandyNotes_TravelGuide;

-- //////////////////////////////////////////////////////////////////////////
local function work_out_texture(point)
	local icon_key	
	
	if (point.boat) then icon_key = "boat" end
	if (point.aboat) then icon_key = "aboat" end
	if (point.zeppelin) then icon_key = "zeppelin" end
	if (point.hzeppelin) then icon_key = "hzeppelin" end
--	if (point.portal) then icon_key = "portal" end
	if (point.tram) then icon_key = "tram" end
	if (point.flightmaster) then icon_key = "flightmaster" end

	if (icon_key and TravelGuide.constants.icon_texture[icon_key]) then
		return TravelGuide.constants.icon_texture[icon_key]
	elseif (point.type and TravelGuide.constants.icon_texture[point.type]) then
		return TravelGuide.constants.icon_texture[point.type]
	-- use the icon specified in point data
	elseif (point.icon) then
		return point.icon
	else
		return TravelGuide.constants.defaultIcon
	end
end

local get_point_info = function(point)
	local icon
	if point then
		local label = point.label or point.label2 or UNKNOWN
			icon = work_out_texture(point)		
		return label, label2, icon, quest, lvl, point.scale, point.alpha
	end 
end 

local get_point_info_by_coord = function(uMapID, coord)
	return get_point_info(TravelGuide.DB.points[uMapID] and TravelGuide.DB.points[uMapID][coord])
end

local function handle_tooltip(tooltip, point)
	if point then
		if (point.label) then
				tooltip:AddLine(point.label)
		end
		if (point.label1 and profile.show_note) then
				tooltip:AddDoubleLine(point.label1)
			else
				tooltip:AddLine(point.label2)
			end
		if (point.note and profile.show_note) then
			tooltip:AddLine("("..point.note..")", nil, nil, nil, false) --when true text is wrapping
		end
	else
		tooltip:SetText(UNKNOWN)
	end
	tooltip:Show()
end

local handle_tooltip_by_coord = function(tooltip, uMapID, coord)
	return handle_tooltip(tooltip, TravelGuide.DB.points[uMapID] and TravelGuide.DB.points[uMapID][coord])
end

-- //////////////////////////////////////////////////////////////////////////
local PluginHandler = {}
local info = {}

function PluginHandler:OnEnter(uMapID, coord)
	local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip
	if ( self:GetCenter() > UIParent:GetCenter() ) then -- compare X coordinate
		tooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		tooltip:SetOwner(self, "ANCHOR_RIGHT")
	end
	handle_tooltip_by_coord(tooltip, uMapID, coord)
end

function PluginHandler:OnLeave(uMapID, coord)
	if self:GetParent() == WorldMapButton then
		WorldMapTooltip:Hide()
	else
		GameTooltip:Hide()
	end
end

local function hideNode(button, uMapID, coord)
	TravelGuide.hidden[uMapID][coord] = true
	HandyNotes_TravelGuide:Refresh()
end

local function closeAllDropdowns()
	CloseDropDownMenus(1)
end

local function addTomTomWaypoint(button, uMapID, coord)
	if TomTom then
		local x, y = HandyNotes:getXY(coord)
		TomTom:AddWaypoint(uMapID, x, y, {
			title = get_point_info_by_coord(uMapID, coord),
			persistent = nil,
			minimap = true,
			world = true
		})
	end
end

do
	local currentMapID = nil
	local currentCoord = nil
	local function generateMenu(button, level)
		if (not level) then return end
		if (level == 1) then
			-- Create the title of the menu
			info = UIDropDownMenu_CreateInfo()
			info.isTitle 		= true
			info.text 		= "HandyNotes: " ..HandyNotes_TravelGuide.pluginName
			info.notCheckable 	= true
			UIDropDownMenu_AddButton(info, level)

			if TomTom and not profile.easy_waypoint then
				-- Waypoint menu item
				info = UIDropDownMenu_CreateInfo()
				info.text = LH["Add this location to TomTom waypoints"]
				info.notCheckable = true
				info.func = addTomTomWaypoint
				info.arg1 = currentMapID
				info.arg2 = currentCoord
				UIDropDownMenu_AddButton(info, level)
			end

			-- Hide menu item
			info = UIDropDownMenu_CreateInfo()
			info.text		= HIDE 
			info.notCheckable 	= true
			info.func		= hideNode
			info.arg1		= currentMapID
			info.arg2		= currentCoord
			UIDropDownMenu_AddButton(info, level)

			-- Close menu item
			info = UIDropDownMenu_CreateInfo()
			info.text		= CLOSE
			info.func		= closeAllDropdowns
			info.notCheckable 	= true
			UIDropDownMenu_AddButton(info, level)
		end
	end
	local HL_Dropdown = CreateFrame("Frame", "HandyNotes_TravelGuideDropdownMenu")
	HL_Dropdown.displayMode = "MENU"
	HL_Dropdown.initialize = generateMenu

	function PluginHandler:OnClick(button, down, uMapID, coord)
		if ((down or button ~= "RightButton") and profile.easy_waypoint) then
			return
		end
		if ((button == "RightButton" and not down) and not profile.easy_waypoint) then
			currentMapID = uMapID
			currentCoord = coord
			ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
		end
		if (IsControlKeyDown() and profile.easy_waypoint) then
			currentMapID = uMapID
			currentCoord = coord
			ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
		else
		if profile.easy_waypoint then
			addTomTomWaypoint(button, uMapID, coord)
		end
		end
	end
end

do

local currentMapID = nil
	local function iter(t, prestate)
		if not t then return nil end
		local state, value = next(t, prestate)
		while state do 
			if value and TravelGuide:ShouldShow(state, value, currentMapID) then
				local label, label2, icon, quest, lvl, scale, alpha = get_point_info(value)
				scale = (scale or 1) * (icon and icon.scale or 1) * profile.icon_scale
				alpha = (alpha or 1) * (icon and icon.alpha or 1) * profile.icon_alpha
				return state, nil, icon, scale, alpha
			end
			state, value = next(t, state)
		end
		return nil, nil, nil, nil, nil, nil
	end
	function PluginHandler:GetNodes2(uMapID, minimap)
		currentMapID = uMapID
		return iter, TravelGuide.DB.points[uMapID], nil
	end
	function TravelGuide:ShouldShow(coord, point, currentMapID)
		if (TravelGuide.hidden[currentMapID] and TravelGuide.hidden[currentMapID][coord]) then
			return false
		end
		-- this will check if any node is for specific class
		if (point.class and point.class ~= select(2, UnitClass("player"))) then
			return false
		end
		-- this will check if any node is for specific faction
		if (point.faction and point.faction ~= select(1, UnitFactionGroup("player"))) then
			return false
		end
--		if (point.portal and not TravelGuide.db.show_portal) then return false; end
		if (point.flightmaster and not TravelGuide.db.show_portal) then return false; end
		if (point.tram and not TravelGuide.db.show_tram) then return false; end
		if (point.boat and not TravelGuide.db.show_boat) then return false; end
		if (point.aboat and not TravelGuide.db.show_aboat) then return false; end
		if (point.zeppelin and not TravelGuide.db.show_zepplin) then return false; end
		if (point.hzeppelin and not TravelGuide.db.show_hzepplin) then return false; end
		return true
	end
end

-- //////////////////////////////////////////////////////////////////////////
function HandyNotes_TravelGuide:OnInitialize()
	self.db = AceDB:New("HandyNotes_TravelGuideDB", TravelGuide.constants.defaults)
	
	profile = self.db.profile
	TravelGuide.db = profile
	TravelGuide.hidden = self.db.char.hidden

	-- Initialize database with HandyNotes
	HandyNotes:RegisterPluginDB(HandyNotes_TravelGuide.pluginName, PluginHandler, TravelGuide.config.options)
end

function HandyNotes_TravelGuide:OnEnable()
end

function HandyNotes_TravelGuide:Refresh()
	self:SendMessage("HandyNotes_NotifyUpdate", HandyNotes_TravelGuide.pluginName)
end

function HandyNotes_TravelGuide:ZONE_CHANGED()
	HandyNotes_TravelGuide:Refresh()
end

function HandyNotes_TravelGuide:ZONE_CHANGED_INDOORS()
	HandyNotes_TravelGuide:Refresh()
end

function HandyNotes_TravelGuide:NEW_WMO_CHUNK()
	HandyNotes_TravelGuide:Refresh()
end
--[[
function HandyNotes_TravelGuide:CLOSE_WORLD_MAP()
	closeAllDropdowns()
end
]]
-- //////////////////////////////////////////////////////////////////////////

local pairs = _G.pairs
local config = {}
TravelGuide.config = config

config.options = {
	type = "group",
	name = HandyNotes_TravelGuide.pluginName,
	desc = HandyNotes_TravelGuide.description,
	get = function(info) return TravelGuide.db[info[#info]] end,
	set = function(info, v)
		TravelGuide.db[info[#info]] = v
		HandyNotes_TravelGuide:SendMessage("HandyNotes_NotifyUpdate", HandyNotes_TravelGuide.pluginName)
	end,
	args = {
		icon = {
			type = "group",
			name = L["Icon settings"],
			inline = true,
			order = 10,
			args = {
				desc = {
					name = L["These settings control the look and feel of the icon."],
					type = "description",
					order = 0,
				},
				icon_scale = {
					type = "range",
					name = L["Icon Scale"],
					desc = L["The scale of the icons"],
					min = 0.25, max = 2, step = 0.01,
					order = 20,
				},
				icon_alpha = {
					type = "range",
					name = L["Icon Alpha"],
					desc = L["The alpha transparency of the icons"],
					min = 0, max = 1, step = 0.01,
					order = 30,
				},
			},
		},
		display = {
			type = "group",
			name = L["What to display?"],
			inline = true,
			order = 20,
			args = {
				desc = {
					name = L["These settings control what type of icons to be displayed."],
					type = "description",
					order = 0,
				},
				show_boat = {
					type = "toggle",
					name = L["Boat"],
					desc = L["Show the boat locations."],
					order = 20,
				},
				show_aboat = {
					type = "toggle",
					name = L["Alliance Boat"],
					desc = L["Show the Alliance boat locations."],
					order = 22,
				},
				show_zepplin = {
					type = "toggle",
					name = L["Zeppelin"],
					desc = L["Show the Zeppelin locations."],
					order = 23,
				},	
				show_hzepplin = {
					type = "toggle",
					name = L["Horde Zeppelin"],
					desc = L["Show the Horde Zeppelin locations."],
					order = 24,
				},
--[[
				show_portal = {
					type = "toggle",
					name = L["Portal"],
					desc = L["Show the portal locations."],
					order = 25,
				},
]]--
				show_tram = {
					type = "toggle",
					name = L["Deeprun Tram"],
					desc = L["Show the Deeprun Tram locations in Stormwind and Ironforge."],
					order = 26,
				},
				show_note = {
					type = "toggle",
					name = L["Note"],
					desc = L["Show the node's additional notes when it's available."],
					order = 28,
				},
				easy_waypoint = {
					type = "toggle",
					name = L["Easy waypoints"],
					desc = L["easy_waypoints_desc"],
					order = 30,
				},
			},
		},
		plugin_config = {
			type = "group",
			name = L["AddOn Settings"],
			inline = true,
			order = 30,
			args = {
--[[				query_server = {
					type = "toggle",
					name = L["Query from server"],
					desc = L["Send query request to server to lookup localized name. May be a little bit slower for the first time lookup but would be very fast once the name is found and cached."],
					order = 10,
				},
]]--				
				unhide = {
					type = "execute",
					name = L["Reset hidden nodes"],
					desc = L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."],
					func = function()
						for map,coords in pairs(TravelGuide.hidden) do
							wipe(coords)
						end
						HandyNotes_TravelGuide:Refresh()
					end,
					order = 50,
				},
			},
		},
	},
}


-- Functions
-- Libraries
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
-------------------------------------------------------------------------------
local ElwynnForest = L["Eastern Kingdoms, Elwynn Forest"]
local DrTtoIF = L["Deeprun Tram to Ironforge"]

local DunMorogh = L["Eastern Kingdoms, Dun Morogh"]
local DrTtoSW = L["Deeprun Tram to Stormwind"]

local Durotar = L["Kalimdor, Durotar"]
local ZtoOG = L["Zeppelin to Orgrimmar"]

local Tirisfal = L["Eastern Kingdoms, Tirisfal Glades"]
local ZtoUC = L["Zeppelin to Undercity"]

local Barrens = L["Kalimdor, The Barrens"]
local BtoBootyBay = L["Boat to Booty Bay"]

local Wetlands = L["Eastern Kingdoms, Wetlands"]
local BtoMenethilHarbor = L["Boat to Menethil Harbor"]

local StranglethornVale = L["Eastern Kingdoms, Stranglethorn Vale"]
local GromgolBaseCamp = L["Eastern Kingdoms, Grom'gol Base Camp"]
local ZtoStranglethornVale = L["Zeppelin to Stranglethorn Vale"]
local BtoRatchet = L["Boat to Ratchet"]

local DustwallowMarsh = L["Kalimdor, Dustwallow Marsh"]
local BtoTheramore = L["Boat to Theramore"]

local Teldrassil = L["Kalimdor, Teldrassil"]
local BtoDarnassus = L["Boat to Darnassus"]

local Darkshore = L["Kalimdor, Darkshore"]
local BtoAuberdine = L["Boat to Auberdine"]

--LOCAL END----------------------------------------------------------------------
local DB = {}

TravelGuide.DB = DB

DB.points = {
-- MAPID from https://wow.gamepedia.com/UiMapID/Classic
	--[[ structure:
	[UiMapID] = { -- "_terrain1" etc will be stripped from attempts to fetch this
		[coord] = {
			label=[string], 		-- label: text that'll be the label, optional
			npc=[id], 				-- related npc id, used to display names in tooltip
			type=[string], 			-- the pre-define icon type which can be found in Constant.lua
			class=[CLASS NAME],		-- specified the class name so that this node will only be available for this class
			faction="FACTION",      -- shows only for selected faction
			note=[string],			-- additional notes for this node
			level=[number]			-- map level from dropdown
		},
	},
--]]

--Vanilla-------------------------------------------------------------------------------------------------------------------------------------------------------
	[1429] = { -- Elwynn Forest
		[29201782] = { tram=true, label=DrTtoIF, note=DunMorogh },
		},
	[1453] = { -- Stormwind
		[63910817] = { tram=true, label=DrTtoIF, note=DunMorogh },
		},
		[1411] = { -- Durotar
		[34017850] = { boat=true, label=BtoBootyBay, note=StranglethornVale },
		[50571265] = { zeppelin=true, label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Horde" },
		[50581265] = { hzeppelin=true, label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Alliance"},
		[50821385] = { zeppelin=true, label=ZtoUC, note=Tirisfal, faction="Horde" },
		[50831385] = { hzeppelin=true, label=ZtoUC, note=Tirisfal, faction="Alliance" },
		},
	[1420] = { -- Trisfal Glades
		[60695877] = { zeppelin=true, label=ZtoOG, note=Durotar, faction="Horde" },
		[60695878] = { hzeppelin=true, label=ZtoOG, note=Durotar, faction="Alliance" },
		[61885907] = { zeppelin=true, label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Horde" },
		[61885906] = { hzeppelin=true, label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Alliance" },
		},
	[1437] = { -- Wetlands
		[05026348] = { boat=true, label=BtoTheramore, note=DustwallowMarsh, faction="Alliance" },
		[05026349] = { aboat=true, label=BtoTheramore, note=DustwallowMarsh, faction="Horde" },
		[04635710] = { boat=true, label=BtoAuberdine, note=Darkshore, faction="Alliance" },
		[04635711] = { aboat=true, label=BtoAuberdine, note=Darkshore, faction="Horde" },
		},
	[1414] = { -- Kalimdor
		[56785623] = { boat=true, label=BtoBootyBay, note=StranglethornVale },
		[59276854] = { boat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
		[59276855] = { aboat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
		[43591733] = { boat=true, label=BtoAuberdine, note=Darkshore, faction="Alliance" },
		[43591734] = { aboat=true, label=BtoAuberdine, note=Darkshore, faction="Horde" },
--		[44292533] = { boat=true, label=BtoDarnassus, note=Teldrassil, faction="Alliance" },
--		[44292534] = { aboat=true, label=BtoDarnassus, note=Teldrassil, faction="Horde" },
--		[44152600] = { boat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
--		[44152601] = { aboat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
		[44292533] = { aboat=true, label1= BtoDarnassus.." ("..Teldrassil..")\n"..format(BtoMenethilHarbor.." ("..Wetlands..")"),
								  label2= BtoDarnassus.."\n"..format(BtoMenethilHarbor..""), faction="Horde"},
		[44262534] = { boat=true, label1= BtoDarnassus.." ("..Teldrassil..")\n"..format(BtoMenethilHarbor.." ("..Wetlands..")"),
									label2= BtoDarnassus.."\n"..format(BtoMenethilHarbor..""), faction="Alliance" },
		[58994665] = { zeppelin=true, label1= ZtoUC.." ("..Tirisfal..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")"),
								  label2= ZtoUC.."\n"..format(ZtoStranglethornVale..""), faction="Horde"},
		[58994666] = { hzeppelin=true, label1= ZtoUC.." ("..Tirisfal..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")"),
									label2= ZtoUC.."\n"..format(ZtoStranglethornVale..""), faction="Alliance" },
		},
	[1413] = { -- The Barrens
		[63683862] = { boat=true, label=BtoBootyBay, note=StranglethornVale },
		},
	[1415] = { -- Eastern Kingdom
		[43839266] = { boat=true, label=BtoRatchet, note=Barrens },
		[43976740] = { tram=true, label=DrTtoIF, note=DunMorogh },
		[49215244] = { tram=true, label=DrTtoSW, note=ElwynnForest, },
		[44702303] = { zeppelin=true, label1= ZtoOG.." ("..Durotar..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")"),
								  label2= ZtoOG.."\n"..format(ZtoStranglethornVale..""), faction="Horde"},
		[44712303] = { hzeppelin=true, label1= ZtoOG.." ("..Durotar..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")"),
									label2= ZtoOG.."\n"..format(ZtoStranglethornVale..""), faction="Alliance" },
		[44868478] = { zeppelin=true, label1= ZtoOG.." ("..Durotar..")\n"..format(ZtoUC.." ("..Tirisfal..")"),
								  label2= ZtoOG.."\n"..format(ZtoUC..""), faction="Horde"},
		[44868479] = { hzeppelin=true, label1= ZtoOG.." ("..Durotar..")\n"..format(ZtoUC.." ("..Tirisfal..")"),
									label2= ZtoOG.."\n"..format(ZtoUC..""), faction="Alliance" },
	
		[47544793] = { aboat=true, label1= BtoAuberdine.." ("..Darkshore..")\n"..format(BtoTheramore.." ("..DustwallowMarsh..")"),
								  label2= BtoAuberdine.."\n"..format(BtoTheramore..""), faction="Horde"},
		[47544794] = { boat=true, label1= BtoAuberdine.." ("..Darkshore..")\n"..format(BtoTheramore.." ("..DustwallowMarsh..")"),
									label2= BtoAuberdine.."\n"..format(BtoTheramore..""), faction="Alliance" },
		},
	[1434] = { -- Stranglethorn Vale
		[25867311] = { boat=true, label=BtoRatchet, note=Barrens },
		[31363015] = { zeppelin=true, label=ZtoOG, note=Durotar, faction="Horde" },
		[31363016] = { hzeppelin=true, label=ZtoOG, note=Durotar, faction="Alliance" },
		[31582911] = { zeppelin=true, label=ZtoUC, note=Tirisfal, faction="Horde" },
		[31582912] = { hzeppelin=true, label=ZtoUC, note=Tirisfal, faction="Alliance" },
		},
	[1426] = { -- Dun Morogh
		[63432936] = { tram=true, label=DrTtoSW, note=ElwynnForest, },
		},
	[1455] = { -- Ironforge
		[76985153] = { tram=true, label=DrTtoSW, note=ElwynnForest, },
		},
	[1445] = { -- Dustwallow Marsh
		[71625648] = { boat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
		[71625649] = { aboat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
		},
	[1438] = { -- Teldrassil
		[54859680] = { boat=true, label=BtoAuberdine, note=Darkshore, faction="Alliance" },
		[54859681] = { aboat=true, label=BtoAuberdine, note=Darkshore, faction="Horde" },
		},
	[1439] = { -- Darkshore
		[33194006] = { boat=true, label=BtoDarnassus, note=Teldrassil, faction="Alliance" },
		[33194007] = { aboat=true, label=BtoDarnassus, note=Teldrassil, faction="Horde" },
		[32404584] = { boat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
		[32404585] = { aboat=true, label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
		},
}