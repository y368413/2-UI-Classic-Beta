local _, ns = ...
local M, R, U, I = unpack(ns)

-- Frame Mover
local MoverList, BackupTable, f = {}, {}
function M:Mover(text, value, anchor, width, height, isAuraWatch)
	local key = "Mover"
	if isAuraWatch then key = "AuraWatchMover" end
	if not MaoRUISettingDB[key] then MaoRUISettingDB[key] = {} end
	local mover = CreateFrame("Frame", nil, UIParent)
	mover:SetWidth(width or self:GetWidth())
	mover:SetHeight(height or self:GetHeight())
	M.CreateBD(mover)
	M.CreateSD(mover)
	M.CreateTex(mover)
	M.CreateFS(mover, I.Font[2], text):SetWordWrap(true)
	if not isAuraWatch then
		tinsert(MoverList, mover)
	end

	if not MaoRUISettingDB[key][value] then
		mover:SetPoint(unpack(anchor))
	else
		mover:SetPoint(unpack(MaoRUISettingDB[key][value]))
	end
	mover:EnableMouse(true)
	mover:SetMovable(true)
	mover:SetClampedToScreen(true)
	mover:SetFrameStrata("HIGH")
	mover:RegisterForDrag("LeftButton")
	mover:SetScript("OnDragStart", function() mover:StartMoving() end)
	mover:SetScript("OnDragStop", function()
		mover:StopMovingOrSizing()
		local orig, _, tar, x, y = mover:GetPoint()
		MaoRUISettingDB[key][value] = {orig, "UIParent", tar, x, y}
	end)
	mover:Hide()
	self:ClearAllPoints()
	self:SetPoint("TOPLEFT", mover)

	return mover
end

local function UnlockElements()
	for i = 1, #MoverList do
		local mover = MoverList[i]
		if not mover:IsShown() then
			mover:Show()
		end
	end
	M.CopyTable(MaoRUISettingDB["Mover"], BackupTable)
	f:Show()
end

local function LockElements()
	for i = 1, #MoverList do
		local mover = MoverList[i]
		mover:Hide()
	end
	f:Hide()
	SlashCmdList.AuraWatch("lock")
end

StaticPopupDialogs["RESET_MOVER"] = {
	text = U["Reset Mover Confirm"],
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = function()
		wipe(MaoRUISettingDB["Mover"])
		ReloadUI()
	end,
}

StaticPopupDialogs["CANCEL_MOVER"] = {
	text = U["Cancel Mover Confirm"],
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = function()
		M.CopyTable(BackupTable, MaoRUISettingDB["Mover"])
		ReloadUI()
	end,
}

-- Mover Console
local function CreateConsole()
	if f then return end

	f = CreateFrame("Frame", nil, UIParent)
	f:SetPoint("TOP", 0, -150)
	f:SetSize(296, 65)
	M.CreateBD(f)
	M.CreateSD(f)
	M.CreateTex(f)
	M.CreateMF(f)
	M.CreateFS(f, 15, U["Mover Console"], "system", "TOP", 0, -10)
	local bu, text = {}, {LOCK, CANCEL, U["Grids"], RESET}
	for i = 1, 4 do
		bu[i] = M.CreateButton(f, 70, 28, text[i])
		if i == 1 then
			bu[i]:SetPoint("BOTTOMLEFT", 5, 5)
		else
			bu[i]:SetPoint("LEFT", bu[i-1], "RIGHT", 2, 0)
		end
	end

	-- Lock
	bu[1]:SetScript("OnClick", LockElements)
	-- Cancel
	bu[2]:SetScript("OnClick", function()
		StaticPopup_Show("CANCEL_MOVER")
	end)
	-- Grids
	bu[3]:SetScript("OnClick", function()
		sendCmd("/align") --SlashCmdList["TOGGLEGRID"]("32")
	end)
	-- Reset
	bu[4]:SetScript("OnClick", function()
		StaticPopup_Show("RESET_MOVER")
	end)

	do
		local frame = CreateFrame("Frame", nil, f)
		frame:SetPoint("TOP", f, "BOTTOM", 0, -2)
		frame:SetSize(296, 65)
		M.CreateBD(frame)
		M.CreateSD(frame)
		M.CreateTex(frame)
		M.CreateFS(frame, 15, MINIMAP_MENU_AURACONFIG, "system", "TOP", 0, -10)

		local bu, text = {}, {UNLOCK, LOCK, RESET}
		for i = 1, 3 do
			bu[i] = M.CreateButton(frame, 94, 28, text[i])
			if i == 1 then
				bu[i]:SetPoint("BOTTOMLEFT", 5, 5)
			else
				bu[i]:SetPoint("LEFT", bu[i-1], "RIGHT", 2, 0)
			end
		end
		-- UNLOCK
		bu[1]:SetScript("OnClick", function()
			SlashCmdList.AuraWatch("move")
		end)
		-- Lock
		bu[2]:SetScript("OnClick", LockElements)
		-- RESET
		bu[3]:SetScript("OnClick", function()
			StaticPopup_Show("RESET_AURAWATCH_MOVER")
		end)
	end

	local function showLater(event)
		if event == "PLAYER_REGEN_DISABLED" then
			if f:IsShown() then
				LockElements()
				M:RegisterEvent("PLAYER_REGEN_ENABLED", showLater)
			end
		else
			UnlockElements()
			M:UnregisterEvent(event, showLater)
		end
	end
	M:RegisterEvent("PLAYER_REGEN_DISABLED", showLater)
end

SlashCmdList["NDUI_MOVER"] = function()
	if InCombatLockdown() then
		UIErrorsFrame:AddMessage(I.InfoColor..ERR_NOT_IN_COMBAT)
		return
	end
	CreateConsole()
	UnlockElements()
end
SLASH_NDUI_MOVER1 = "/moveit"