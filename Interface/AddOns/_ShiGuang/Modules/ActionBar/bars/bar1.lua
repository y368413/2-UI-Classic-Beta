local _, ns = ...
local M, R, U, I = unpack(ns)
local Bar = M:RegisterModule("Actionbar")
local cfg = R.bars.bar1

local function UpdateActionbarScale(bar)
	local frame = _G["NDui_Action"..bar]
	frame:SetScale(MaoRUIPerDB["Actionbar"]["Scale"])
	frame.mover:SetScale(MaoRUIPerDB["Actionbar"]["Scale"])
end

function Bar:UpdateAllScale()
	if not MaoRUIPerDB["Actionbar"]["Enable"] then return end

	UpdateActionbarScale("Bar1")
	UpdateActionbarScale("Bar2")
	UpdateActionbarScale("Bar3")
	UpdateActionbarScale("Bar4")
	UpdateActionbarScale("Bar5")

	UpdateActionbarScale("BarExit")
	UpdateActionbarScale("BarPet")
	UpdateActionbarScale("BarStance")
end

local tip = CreateFrame("GameTooltip", "NDui_ActionCountTooltip", nil, "GameTooltipTemplate")
local REAGENTS_STRING = gsub(SPELL_REAGENTS, HEADER_COLON.."(.+)", "").."(.+)"
function Bar:GetActionCount(action)
	tip:SetOwner(UIParent, "ANCHOR_NONE")
	tip:SetAction(action)
	for i = 1, tip:NumLines() do
		local line = _G[tip:GetName().."TextLeft"..i]
		if not line then break end
		local text = line:GetText()
		local itemName = text and strmatch(text, REAGENTS_STRING)
		if itemName then
			return GetItemCount(itemName)
		end
	end
end

function Bar:FixActionCount()
	local action = self.action
	local texture = GetActionTexture(action)
	if not texture then return end

	if not IsItemAction(action) and GetActionCount(action) == 0 then
		local count = Bar:GetActionCount(action)
		if count then
			if count > 999 then
				self.Count:SetText("*")
			else
				self.Count:SetText(count)
			end
		end
	end
end

function Bar:OnLogin()
	if not MaoRUIPerDB["Actionbar"]["Enable"] then return end

	local padding, margin = 2, 2
	local num = NUM_ACTIONBAR_BUTTONS
	local buttonList = {}
	local layout = MaoRUIPerDB["Actionbar"]["Style"]

	--create the frame to hold the buttons
	local frame = CreateFrame("Frame", "NDui_ActionBar1", UIParent, "SecureHandlerStateTemplate")
	frame:SetWidth(num*cfg.size + (num-1)*margin + 2*padding)
	frame:SetHeight(cfg.size + 2*padding)
	if layout == 5 then
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", -108, 2}
	elseif layout == 6 then
		frame.Pos = {"CENTER", UIParent, "CENTER", 105, -220}
	elseif layout == 9 then
	    frame:SetWidth(num*cfg.size + (num-1)*margin + 2*padding)
	    frame:SetHeight(cfg.size + 2*padding)
		frame.Pos = {"CENTER", UIParent, "CENTER", 76, -220}
	elseif layout == 10 then
		frame.Pos = {"CENTER", UIParent, "CENTER", 80, -220}
	else
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", 0, 2}
	end

	for i = 1, num do
		local button = _G["ActionButton"..i]
		table.insert(buttonList, button) --add the button object to the list
		button:SetParent(frame)
		button:SetSize(cfg.size, cfg.size)
		button:ClearAllPoints()
		if layout == 6 then
		  if i == 1 then
			  button:SetSize(cfg.size + 5, cfg.size + 5)
			  button:SetPoint("LEFT", frame, padding, 0)
		    elseif i == 7 then
			  button:SetSize(cfg.size, cfg.size)
			  button:SetPoint("RIGHT", _G["MultiBarBottomRightButton1"], "LEFT", -margin, 0)
		    elseif i == 8 then
			  button:SetSize(cfg.size, cfg.size)
			  button:SetPoint("TOP", _G["ActionButton7"], "BOTTOM", 0, -margin)
		    elseif i == 9 then
			  button:SetSize(cfg.size + 8, cfg.size + 8)
			  button:SetPoint("TOPRIGHT", _G["ActionButton7"], "LEFT", -margin, 0)
		    elseif i == 10 then
			  button:SetSize(cfg.size, cfg.size)
			  button:SetPoint("LEFT", _G["MultiBarBottomRightButton12"], "RIGHT", margin, 0)
			elseif i == 11 then
			  button:SetSize(cfg.size, cfg.size)
			  button:SetPoint("TOP", _G["ActionButton10"], "BOTTOM", 0, -margin)
			elseif i == 12 then
			  button:SetSize(cfg.size + 8, cfg.size + 8)
			  button:SetPoint("TOPLEFT", _G["ActionButton10"], "RIGHT", margin, 0)
			else
			  button:SetSize(cfg.size + 5, cfg.size + 5)
			  button:SetPoint("LEFT", _G["ActionButton"..i-1], "RIGHT", margin, 0)
			end
		elseif layout == 9 then
		  if i == 1 then
			  button:SetPoint("LEFT", frame, padding, 0)
		  elseif i == 9 then
			  local previous = _G["ActionButton1"]
			  button:SetPoint("TOPRIGHT", previous, "BOTTOM", -margin+10, 0)
			elseif i == 11 then
			  local previous = _G["ActionButton7"]
			  button:SetPoint("TOPLEFT", previous, "BOTTOM", margin-10, 0)
			else
			  local previous = _G["ActionButton"..i-1]
			  button:SetPoint("LEFT", previous, "RIGHT", margin, 0)
			end
		elseif layout == 10 then
		  if i == 1 then
			  button:SetPoint("LEFT", frame, padding, 0)
		  elseif i == 9 then
			  local previous = _G["MultiBarRightButton1"]
			  button:SetPoint("RIGHT", previous, "LEFT", -margin, 0)
		  elseif i == 10 then
			  local previous = _G["ActionButton9"]
			  button:SetPoint("TOP", previous, "BOTTOM", 0, -margin)
			elseif i == 11 then
			  local previous = _G["MultiBarRightButton9"]
			  button:SetPoint("LEFT", previous, "RIGHT", margin, 0)
			elseif i == 12 then
			  local previous = _G["ActionButton11"]
			  button:SetPoint("TOP", previous, "BOTTOM", 0, -margin)
			else
			  local previous = _G["ActionButton"..i-1]
			  button:SetPoint("LEFT", previous, "RIGHT", margin, 0)
			end
		else
		  if i == 1 then
			  button:SetPoint("BOTTOMLEFT", frame, padding, padding)
		  else
			  local previous = _G["ActionButton"..i-1]
			  button:SetPoint("LEFT", previous, "RIGHT", margin, 0)
		  end
		end
	end

	--show/hide the frame on a given state driver
	frame.frameVisibility = "[petbattle] hide; show"
	RegisterStateDriver(frame, "visibility", frame.frameVisibility)

	--create drag frame and drag functionality
	if R.bars.userplaced then
		frame.mover = M.Mover(frame, U["Main Actionbar"], "Bar1", frame.Pos)
	end

	--create the mouseover functionality
	if cfg.fader then
		Bar.CreateButtonFrameFader(frame, buttonList, cfg.fader)
	end

	--_onstate-page state driver
	local actionPage = "[bar:6]6;[bar:5]5;[bar:4]4;[bar:3]3;[bar:2]2;[overridebar]14;[shapeshift]13;[vehicleui]12;[possessbar]12;[bonusbar:5]11;[bonusbar:4]10;[bonusbar:3]9;[bonusbar:2]8;[bonusbar:1]7;1"
	local buttonName = "ActionButton"
	for i, button in next, buttonList do
		frame:SetFrameRef(buttonName..i, button)
	end

	frame:Execute(([[
		buttons = table.new()
		for i = 1, %d do
			table.insert(buttons, self:GetFrameRef("%s"..i))
		end
	]]):format(num, buttonName))

	frame:SetAttribute("_onstate-page", [[
		for _, button in next, buttons do
			button:SetAttribute("actionpage", newstate)
		end
	]])
	RegisterStateDriver(frame, "page", actionPage)

	--add elements
	self:CreateBar2()
	self:CreateBar3()
	self:CreateBar4()
	self:CreateBar5()
	self:CreateLeaveVehicle()
	self:CreatePetbar()
	self:CreateStancebar()
	self:HideBlizz()
	self:ReskinBars()
	self:UpdateAllScale()
	-- Credit: ShowActionCount, prozhong
	hooksecurefunc("ActionButton_UpdateCount", self.FixActionCount)
end