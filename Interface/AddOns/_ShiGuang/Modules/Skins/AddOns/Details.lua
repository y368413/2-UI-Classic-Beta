local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")

local function ReskinDetails()
	local function setupInstance(instance)
		if instance.styled then return end
		if not instance.baseframe then return end

		instance:ChangeSkin("Minimalistic")
		instance:InstanceWallpaper(false)
		instance:DesaturateMenu(true)
		instance:HideMainIcon(false)
		instance:SetBackdropTexture("None")
		instance:MenuAnchor(16, 3)
		instance:ToolbarMenuButtonsSize(1)
		instance:AttributeMenu(true, 0, 3, DB.Font[1], 13, {1, 1, 1}, 1, true)
		instance:SetBarSettings(18, MaoRUIDB["ResetDetails"] and "normTex" or nil)
		instance:SetBarTextSettings(13, I.Font[1], nil, nil, nil, true, true, nil, nil, nil, nil, nil, nil, false, nil, false, nil)

		local bg = M.CreateBG(instance.baseframe)
		bg:SetPoint("TOPLEFT", -1, 18)
		M.CreateBD(bg)
		M.CreateSD(bg)
		M.CreateTex(bg)
		instance.baseframe.bg = bg

		if instance:GetId() <= 2 then
			local open, close = S:CreateToggle(instance.baseframe)
			open:HookScript("OnClick", function()
				instance:ShowWindow()
			end)
			close:HookScript("OnClick", function()
				instance:HideWindow()
			end)
		end

		instance.styled = true
	end

	local index = 1
	local instance = Details:GetInstance(index)
	while instance do
		setupInstance(instance)
		index = index + 1
		instance = Details:GetInstance(index)
	end

	-- Reanchor
	local instance1 = Details:GetInstance(1)
	local instance2 = Details:GetInstance(2)

	local function EmbedWindow(instance, x, y, width, height)
		if not instance.baseframe then return end
		instance.baseframe:ClearAllPoints()
		instance.baseframe:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", x, y)
		instance:SetSize(width, height)
		instance:SaveMainWindowPosition()
		instance:RestoreMainWindowPosition()
		instance:LockInstance(true)
	end

	if MaoRUIDB["ResetDetails"] then
		local height = 190
		if instance1 then
			if instance2 then
				height = 95
				EmbedWindow(instance2, -3, 140, 320, height)
			end
			EmbedWindow(instance1, -3, 25, 320, height)
		end
	end

	local listener = Details:CreateEventListener()
	listener:RegisterEvent("DETAILS_INSTANCE_OPEN")
	function listener:OnDetailsEvent(event, instance)
		if event == "DETAILS_INSTANCE_OPEN" then
			setupInstance(instance)

			if instance:GetId() == 2 then
				instance1:SetSize(320, 95)
				EmbedWindow(instance, -3, 140, 320, 95)
			end
		end
	end

	-- Numberize
	local _detalhes = _G._detalhes
	local current = MaoRUIDB["NumberFormat"]
	if current < 3 then
		_detalhes.numerical_system = current
		_detalhes:SelectNumericalSystem()
	end

	MaoRUIDB["ResetDetails"] = false
end

S:LoadWithAddOn("Details", "Details", ReskinDetails)