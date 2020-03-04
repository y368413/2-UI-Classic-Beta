--## Author: Linden Ryuujin ## Version: 1.1.1
local TrackingEye = LibStub("AceAddon-3.0"):NewAddon("TrackingEye", "AceConsole-3.0", "AceEvent-3.0")
function TrackingEye:TrackingMenu_Open()
	local menu = {}
	-- In level order, with racial/professions last
	local spells =
	{
		1494,	--Track Beasts
		19883,	--Track Humanoids
		19884,	--Track Undead
		19885,	--Track Hidden
		19880,	--Track Elementals
		19878,	--Track Demons
		19882,	--Track Giants
		19879,	--Track Dragonkin
		5225,	--Track Humanoids: Druid
		5500,	--Sense Demons
		5502,	--Sense Undead
		2383,	--Find Herbs
		2580,	--Find Minerals
		2481	--Find Treasure
	}
	for key,spellId in ipairs(spells) do
		spellName = GetSpellInfo(spellId)
		if IsPlayerSpell(spellId) then
			table.insert(menu,
			{
				text = spellName,
				icon = GetSpellTexture(spellId),
				func = function()
					CastSpellByID(spellId)
				end
			})
		end
	end

	local menuFrame = CreateFrame("Frame", "TrackingEyeTrackingMenu", UIParent, "UIDropDownMenuTemplate")
	EasyMenu(menu, menuFrame, "cursor", 0 , 0, "MENU");
end

-- Setup minimap button
local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("TrackingEyeData",
{
	type = "group",
	text = "Tracking Eye",
	icon = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\Role\\bubbleTex",
	OnClick = function(_, msg)
		if msg == "LeftButton" then
			TrackingEye:TrackingMenu_Open();
		elseif msg == "RightButton" then
			CancelTrackingBuff();
		end
	end,
})

--------- Isle of Thunder Weekly Check---- by Fluffies------DIY by y368413-------------------------------------------
-- string colors
local LIGHT_RED   = "|cffFF2020"
local LIGHT_GREEN = "|cff20FF20"
local LIGHT_BLUE  = "|cff00ddFF"
local ZONE_BLUE   = "|cff00aacc"
local GREY        = "|cff999999"
local COORD_GREY  = "|cffBBBBBB"
local GOLD        = "|cffffcc00"
local WHITE       = "|cffffffff"
local PINK        = "|cffFFaaaa"
local function AddColor(str,color) return color..(str or " ^-^ ").."|r" end
local function completedstring(arg)
 if IsQuestFlaggedCompleted(arg) then return AddColor(COMPLETE,LIGHT_GREEN) else return AddColor(INCOMPLETE,LIGHT_RED) end
end

function LDB:OnEnter()
   GameTooltip:SetOwner(self, "ANCHOR_NONE")
   GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT")
   GameTooltip:ClearLines()
   GameTooltip:AddDoubleLine(MINIMAP_TRACKING_TOOLTIP_NONE)
   for i = 1, GetNumSavedInstances() do
      GameTooltip:AddLine(" ")
      GameTooltip:AddLine("|TInterface\\CURSOR\\QUEST:12|t "..AddColor(BOSS_DEAD,GOLD))
	   local name, id, _, difficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, level, total, progress = GetSavedInstanceInfo(i)
	   GameTooltip:AddDoubleLine(AddColor(name.."("..level..")",WHITE), locked and AddColor(progress.."/"..total, LIGHT_GREEN) or AddColor(" 0/0 ", LIGHT_RED))
   end
   GameTooltip:Show()
end

function LDB:OnLeave()
    GameTooltip:Hide()
end

function TrackingEye:OnInitialize()
	--MiniMapTrackingFrame:SetScale(0.001) --hide frame permanently by making it tiny
	LibStub("LibDBIcon-1.0"):Register("TrackingEyeData", LDB)
	--LibStub("LibDBIcon-1.0"):GetMinimapButton("TrackingEyeData"):SetScale(1.13)
	LDB.icon = GetTrackingTexture() or "Interface\\AddOns\\_ShiGuang\\Media\\2UI"
	--self:RegisterChatCommand("te", "MinimapButton_ToggleLock")
	self:RegisterEvent("MINIMAP_UPDATE_TRACKING", function() LDB.icon = GetTrackingTexture() or "Interface\\AddOns\\_ShiGuang\\Media\\2UI" end)
end