local _, ns = ...
local M, R, U, I = unpack(ns)
local Bar = M:GetModule("Actionbar")

-- Texture credit: 胡里胡涂
local _G = getfenv(0)
local tinsert, pairs = table.insert, pairs
local buttonList = {}

function Bar:MicroButton_SetupTexture(icon, texture)
	icon:SetOutside(nil, 1, 1)
	icon:SetTexture("Interface\\BUTTONS\\"..texture)
	icon:SetVertexColor(1, 1, 1)
end

function Bar:MicroButton_Create(parent, data)
	local texture, tip, func = unpack(data)

	local bu = CreateFrame("Button", nil, parent)
	tinsert(buttonList, bu)
	bu:SetSize(21, 36)
	bu:SetFrameStrata("BACKGROUND")
	bu:SetScript("OnClick", func)
	M.AddTooltip(bu, "ANCHOR_RIGHT", tip)

	local icon = bu:CreateTexture(nil, "ARTWORK")
	Bar:MicroButton_SetupTexture(icon, texture)
	bu:SetHighlightTexture("Interface\\BUTTONS\\"..texture)
	local hl = bu:GetHighlightTexture()
	Bar:MicroButton_SetupTexture(hl, texture)
	hl:SetVertexColor(1, 1, 1)
end

function Bar:MicroMenu()
	if not MaoRUIPerDB["Actionbar"]["MicroMenu"] then return end

	local menubar = CreateFrame("Frame", nil, UIParent)
	menubar:SetSize(21, 186)  --*MaoRUIPerDB["Map"]["MinimapScale"]
	M.Mover(menubar, U["Menubar"], "Menubar", R.Skins.MicroMenuPos)
	-- Generate Buttons
	local buttonInfo = {
		{"UI-MICROBUTTON-MAINMENU-UP", MicroButtonTooltipText(MAINMENU_BUTTON, "TOGGLEGAMEMENU"), function() ToggleFrame(GameMenuFrame) PlaySound(SOUNDKIT.IG_MINIMAP_OPEN) end},
		{"UI-MicroButton-Help-Up", MicroButtonTooltipText(HELP_BUTTON, "TOGGLEHELP"), function() ToggleFrame(HelpFrame) end},
		{"UI-MicroButton-Abilities-Up", MicroButtonTooltipText(BAGSLOT, "OPENALLBAGS"), ToggleAllBags},
		{"UI-MicroButton-BStore-Up", MicroButtonTooltipText(SOCIAL_BUTTON, "TOGGLESOCIAL"), function() ToggleFrame(FriendsFrame) end},  --UI-MICROBUTTON-SOCIALS-UP
		{"UI-MicroButton-World-Up", MicroButtonTooltipText(WORLDMAP_BUTTON, "TOGGLEWORLDMAP"), ToggleWorldMap},
		{"UI-MICROBUTTON-QUEST-UP", MicroButtonTooltipText(QUESTLOG_BUTTON, "TOGGLEQUESTLOG"), ToggleQuestLog},
		{"UI-MicroButton-Talents-Up", MicroButtonTooltipText(TALENTS, "TOGGLETALENTS"), function()
			if UnitLevel("player") < SHOW_SPEC_LEVEL then
				UIErrorsFrame:AddMessage(I.InfoColor..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, SHOW_SPEC_LEVEL))
			else
				ToggleTalentFrame()
			end
		end},
		{"UI-MicroButton-Spellbook-Up", MicroButtonTooltipText(SPELLBOOK_ABILITIES_BUTTON, "TOGGLESPELLBOOK"), function() ToggleFrame(SpellBookFrame) end},
		{"UI-MicroButton-Raid-Up", MicroButtonTooltipText(CHARACTER_BUTTON, "TOGGLECHARACTER0"), function() ToggleFrame(CharacterFrame) end},
	}
	for _, info in pairs(buttonInfo) do
		Bar:MicroButton_Create(menubar, info)
	end

	-- Order Positions
	for i = 1, #buttonList do
		if i == 1 then
			buttonList[i]:SetPoint("TOPRIGHT", menubar, "TOPRIGHT", 1, 17)
		else
			buttonList[i]:SetPoint("CENTER", buttonList[i-1], "CENTER", 0, -21)
		end
	end

	-- Taint Fix
	ToggleFrame(SpellBookFrame)
	ToggleFrame(SpellBookFrame)
end