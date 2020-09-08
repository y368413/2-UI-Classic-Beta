local _, ns = ...
local M, R, U, I = unpack(ns)
local Bar = M:GetModule("Actionbar")
local cfg = R.bars.bar5

function Bar:CreateBar5()
	local padding, margin = 2, 2
	local num = NUM_ACTIONBAR_BUTTONS
	local buttonList = {}
	local layout = MaoRUIPerDB["Actionbar"]["Style"]
	if (layout == 6) or (layout == 8) or (layout == 9) or (layout == 10) or (layout == 11) then cfg.size = 38 end

	--create the frame to hold the buttons
	local frame = CreateFrame("Frame", "NDui_ActionBar5", UIParent, "SecureHandlerStateTemplate")
	frame:SetWidth(cfg.size + 2*padding)
	frame:SetHeight(num*cfg.size + (num-1)*margin + 2*padding)
	if layout == 1 or layout == 4 or layout == 5 then
		frame.Pos = {"RIGHT", UIParent, "RIGHT", -(frame:GetWidth()-1), -88}
	elseif layout == 3 then
	  frame:SetWidth(num*cfg.size + (num-1)*margin + 2*padding)
		frame:SetHeight(cfg.size + 2*padding)
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", 0, 80}
	elseif layout == 6 then
		frame:SetWidth(4*cfg.size + margin + padding)
		frame:SetHeight(3*cfg.size + margin + padding)
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", 8*cfg.size + 8*margin , 3*margin}
	elseif layout == 8 then
		frame:SetWidth(7*cfg.size + margin + padding)
		frame:SetHeight(2*cfg.size + margin + padding)
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", 9*cfg.size - 2*margin, 6}
	elseif (layout == 9) or (layout == 10) then
		frame:SetWidth(6*cfg.size)
		frame:SetHeight(2*cfg.size)
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", 9*cfg.size+ 6*padding, 9}
	elseif layout == 11 then
		frame:SetWidth(4*cfg.size + 2*margin + 2*padding)
		frame:SetHeight(3*cfg.size + 4*margin + 2*padding)
		frame.Pos = {"CENTER", UIParent, "CENTER", 8*cfg.size + 6*padding, 4*cfg.size + 6*padding}
	else
		frame.Pos = {"RIGHT", UIParent, "RIGHT", -1, -88}
	end

	--move the buttons into position and reparent them
	MultiBarLeft:SetParent(frame)
	MultiBarLeft:EnableMouse(false)

	for i = 1, num do
		local button = _G["MultiBarLeftButton"..i]
		table.insert(buttonList, button) --add the button object to the list
		button:SetSize(cfg.size, cfg.size)
		button:ClearAllPoints()
		if layout == 3 then
		  if i == 1 then
			  button:SetPoint("BOTTOMLEFT", frame, padding, padding)
		  else
			  local previous = _G["MultiBarLeftButton"..i-1]
			  button:SetPoint("LEFT", previous, "RIGHT", margin, 0)
			 end
		elseif layout == 6 then
			if i == 1 then
				button:SetPoint("TOPLEFT", frame, padding, -padding)
			elseif i == 5 then
				local previous = _G["MultiBarLeftButton1"]
				button:SetPoint("TOP", previous, "BOTTOM", 0, -margin)
			elseif i == 9 then
				local previous = _G["MultiBarLeftButton5"]
				button:SetPoint("TOP", previous, "BOTTOM", 0, -margin)
			else
				local previous = _G["MultiBarLeftButton"..i-1]
				button:SetPoint("LEFT", previous, "RIGHT", margin, 0)
			end
		elseif layout == 8 then
			if i == 1 then
				button:SetSize(cfg.size + 7, cfg.size + 7)
				button:SetPoint("TOPRIGHT", frame, -padding, -padding)
			elseif i == 2 then
				button:SetSize(cfg.size + 7, cfg.size + 7)
				button:SetPoint("RIGHT", _G["MultiBarLeftButton"..i-1], "LEFT", -margin, 0)
			elseif i == 3 then
				button:SetSize(cfg.size + 7, cfg.size + 7)
				button:SetPoint("RIGHT", _G["MultiBarLeftButton"..i-1], "LEFT", -margin, 0)
			elseif i == 4 then
				button:SetSize(cfg.size + 7, cfg.size + 7)
				button:SetPoint("RIGHT", _G["MultiBarLeftButton"..i-1], "LEFT", -margin, 0)
			elseif i == 5 then
				button:SetSize(cfg.size - 7, cfg.size - 7)
				button:SetPoint("TOPRIGHT", _G["MultiBarLeftButton1"], "BOTTOMRIGHT", 0, -margin)
			else
				button:SetSize(cfg.size - 7, cfg.size - 7)
				button:SetPoint("RIGHT", _G["MultiBarLeftButton"..i-1], "LEFT", -1.3*margin, 0)
			end
		elseif layout == 9 then
			if i == 1 then
				button:SetSize(cfg.size + 7, cfg.size + 7)
				button:SetPoint("TOPLEFT", frame, padding, -padding)
			elseif i == 2 then
				button:SetSize(cfg.size + 7, cfg.size + 7)
				button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", margin, 0)
			elseif i == 3 then
				button:SetSize(cfg.size + 7, cfg.size + 7)
				button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", margin, 0)
			elseif i == 4 then
				button:SetSize(cfg.size + 7, cfg.size + 7)
				button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", margin, 0)
			elseif i == 5 then
				button:SetSize(cfg.size + 7, cfg.size + 7)
				button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", margin, 0)
			elseif i == 6 then
				button:SetSize(cfg.size - 7, cfg.size - 7)
				button:SetPoint("TOPLEFT", _G["MultiBarLeftButton1"], "BOTTOMLEFT", 0, -margin)
			else
				button:SetSize(cfg.size - 7, cfg.size - 7)
				button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", 1.3*margin, 0)
			end
		elseif layout == 10 then
		  if i == 1 then
				button:SetSize(cfg.size, cfg.size)
				button:SetPoint("TOPLEFT", frame, padding, -padding)
			elseif i == 2 then
				button:SetSize(cfg.size, cfg.size)
				button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", margin, 0)
			elseif i == 3 then
				button:SetSize(cfg.size, cfg.size)
				button:SetPoint("TOPLEFT", _G["MultiBarLeftButton1"], "BOTTOMLEFT", 0, -margin)
			elseif i == 4 then
				button:SetSize(cfg.size, cfg.size)
				button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", margin, 0)
			elseif i == 5 then
				button:SetSize(cfg.size + 10, cfg.size + 10)
				button:SetPoint("TOPLEFT", _G["MultiBarLeftButton2"], "TOPRIGHT", margin, 0)
			elseif i == 6 then
				button:SetSize(cfg.size + 10, cfg.size + 10)
				button:SetPoint("LEFT", _G["MultiBarLeftButton5"], "RIGHT", margin, 0)
			elseif i == 7 then
				button:SetSize(cfg.size + 10, cfg.size + 10)
				button:SetPoint("LEFT", _G["MultiBarLeftButton6"], "RIGHT", margin, 0)
			elseif i == 8 then
				button:SetSize(cfg.size - 10, cfg.size - 10)
				button:SetPoint("TOPLEFT", _G["MultiBarLeftButton5"], "BOTTOMLEFT", 0, -margin)
			else
				button:SetSize(cfg.size - 10, cfg.size - 10)
				button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", margin, 0)
			end
		elseif layout == 11 then
		  if i == 1 then
			  button:SetSize(cfg.size, cfg.size)
			  button:SetPoint("TOPLEFT", frame, padding, -margin)
		  elseif i == 2 then
			  button:SetSize(cfg.size, cfg.size)
			  button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", padding, 0)
			elseif i == 3 then
			  button:SetSize(cfg.size, cfg.size)
			  button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", padding, 0)
			elseif i == 4 then
			  button:SetSize(cfg.size, cfg.size)
			  button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", padding, 0)
			elseif i == 5 then
			  button:SetSize(cfg.size *1.35, cfg.size *1.35)
			  button:SetPoint("TOPLEFT", _G["MultiBarLeftButton1"], "BOTTOMLEFT", 0, -margin)
			elseif i == 6 then
			  button:SetSize(cfg.size *1.35, cfg.size *1.35)
			  button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", padding, 0)
			elseif i == 7 then
			  button:SetSize(cfg.size *1.35, cfg.size *1.35)
			  button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", padding, 0)
			elseif i == 8 then
			  button:SetSize(cfg.size *0.8, cfg.size*0.8)
			  button:SetPoint("TOPLEFT", _G["MultiBarLeftButton5"], "BOTTOMLEFT", 0, -margin)
			else
			  button:SetSize(cfg.size *0.8, cfg.size*0.8)
			  button:SetPoint("LEFT", _G["MultiBarLeftButton"..i-1], "RIGHT", padding*0.8, 0)
			end
		else
		if i == 1 then
			button:SetPoint("TOPRIGHT", frame, -padding, -padding)
		else
			local previous = _G["MultiBarLeftButton"..i-1]
			button:SetPoint("TOP", previous, "BOTTOM", 0, -margin)
		end
		end
	end

	--show/hide the frame on a given state driver
	frame.frameVisibility = "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists][shapeshift] hide; show"
	RegisterStateDriver(frame, "visibility", frame.frameVisibility)

	--create drag frame and drag functionality
	if R.bars.userplaced then
		frame.mover = M.Mover(frame, SHOW_MULTIBAR4_TEXT, "Bar5", frame.Pos)
	end

	--create the mouseover functionality
	if MaoRUIPerDB["Actionbar"]["Bar5Fade"] and cfg.fader then
		Bar.CreateButtonFrameFader(frame, buttonList, cfg.fader)
	end
end