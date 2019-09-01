local _, ns = ...
local M, R, U, I = unpack(ns)
local Bar = M:GetModule("Actionbar")
local cfg = R.bars.bar2

function Bar:CreateBar2()
	local padding, margin = 2, 2
	local num = NUM_ACTIONBAR_BUTTONS
	local buttonList = {}
	local layout = MaoRUISettingDB["Actionbar"]["Style"]

	--create the frame to hold the buttons
	local frame = CreateFrame("Frame", "NDui_ActionBar2", UIParent, "SecureHandlerStateTemplate")
	frame:SetWidth(num*cfg.size + (num-1)*margin + 2*padding)
	frame:SetHeight(cfg.size + 2*padding)
	if layout == 5 then
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", -108, 40}
	elseif (layout == 6) or (layout == 9) or (layout == 10) then
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", 0, 4}
	else
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", 0, 42}
	end
	frame:SetScale(MaoRUISettingDB["Actionbar"]["Scale"])

	--move the buttons into position and reparent them
	MultiBarBottomLeft:SetParent(frame)
	MultiBarBottomLeft:EnableMouse(false)

	for i = 1, num do
		local button = _G["MultiBarBottomLeftButton"..i]
		table.insert(buttonList, button) --add the button object to the list
		button:SetSize(cfg.size, cfg.size)
		button:ClearAllPoints()
		if i == 1 then
			button:SetPoint("BOTTOMLEFT", frame, padding, padding)
		else
			local previous = _G["MultiBarBottomLeftButton"..i-1]
			button:SetPoint("LEFT", previous, "RIGHT", margin, 0)
		end
	end

	--show/hide the frame on a given state driver
	frame.frameVisibility = "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists][shapeshift] hide; show"
	RegisterStateDriver(frame, "visibility", frame.frameVisibility)

	--create drag frame and drag functionality
	if R.bars.userplaced then
		M.Mover(frame, SHOW_MULTIBAR1_TEXT, "Bar2", frame.Pos)
	end

	--create the mouseover functionality
	if cfg.fader then
		Bar.CreateButtonFrameFader(frame, buttonList, cfg.fader)
	end
end