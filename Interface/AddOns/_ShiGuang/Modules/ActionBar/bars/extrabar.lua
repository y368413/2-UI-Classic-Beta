local _, ns = ...
local M, R, U, I = unpack(ns)
local Bar = M:GetModule("Actionbar")
local cfg = R.bars.extrabar

function Bar:CreateExtrabar()
	local padding, margin = 10, 5
	local num = 1
	local buttonList = {}

	--create the frame to hold the buttons
	local frame = CreateFrame("Frame", "NDui_ExtraActionBar", UIParent, "SecureHandlerStateTemplate")
	frame:SetWidth(num*cfg.size + (num-1)*margin + 2*padding)
	frame:SetHeight(cfg.size + 2*padding)
	frame.Pos = {"BOTTOM", UIParent, "BOTTOM", 0, 130}
	frame:SetScale(MaoRUISettingDB["Actionbar"]["Scale"])

	--move the buttons into position and reparent them
	ExtraActionBarFrame:SetParent(frame)
	ExtraActionBarFrame:EnableMouse(false)
	ExtraActionBarFrame:ClearAllPoints()
	ExtraActionBarFrame:SetPoint("CENTER", 0, 0)
	ExtraActionBarFrame.ignoreFramePositionManager = true

	--the extra button
	local button = ExtraActionButton1
	table.insert(buttonList, button) --add the button object to the list
	button:SetSize(cfg.size, cfg.size)

	--show/hide the frame on a given state driver
	frame.frameVisibility = "[extrabar] show; hide"
	RegisterStateDriver(frame, "visibility", frame.frameVisibility)

	--create drag frame and drag functionality
	if R.bars.userplaced then
		M.Mover(frame, U["Extrabar"], "Extrabar", frame.Pos)
	end

	--create the mouseover functionality
	if cfg.fader then
		Bar.CreateButtonFrameFader(frame, buttonList, cfg.fader)
	end

	--zone ability
	ZoneAbilityFrame:ClearAllPoints()
	ZoneAbilityFrame.ignoreFramePositionManager = true
	ZoneAbilityFrameNormalTexture:SetAlpha(0)
	M.Mover(ZoneAbilityFrame, U["Zone Ability"], "ZoneAbility", {"BOTTOM", UIParent, "BOTTOM", -360, 100}, 64, 64)

	local spellButton = ZoneAbilityFrame.SpellButton
	spellButton.Style:SetAlpha(0)
	spellButton.Icon:SetTexCoord(unpack(I.TexCoord))
	spellButton:GetHighlightTexture():SetColorTexture(1, 1, 1, .25)
	M.CreateSD(spellButton.Icon, 3, 3)
end