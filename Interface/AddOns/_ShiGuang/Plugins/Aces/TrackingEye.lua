--## Author: Linden Ryuujin ## Version: 1.1.1
local TrackingEye = LibStub("AceAddon-3.0"):NewAddon("TrackingEye", "AceConsole-3.0", "AceEvent-3.0")

function TrackingEye:Menu_Open()
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

	local menuFrame = CreateFrame("Frame", "ExampleMenuFrame", UIParent, "UIDropDownMenuTemplate")
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
			TrackingEye:Menu_Open();
		elseif msg == "RightButton" then
			CancelTrackingBuff();
		end
	end,
})
local LDBIcon = LibStub("LibDBIcon-1.0")

function TrackingEye:OnInitialize()
	--MiniMapTrackingFrame:SetScale(0.001) --hide frame permanently by making it tiny
	LDBIcon:Register("TrackingEyeData", LDB)
	--LDBIcon:GetMinimapButton("TrackingEyeData"):SetScale(1.13)
	LDB.icon = GetTrackingTexture()
	--self:RegisterChatCommand("te", "MinimapButton_ToggleLock")
	self:RegisterEvent("MINIMAP_UPDATE_TRACKING", function() LDB.icon = GetTrackingTexture() end)
end