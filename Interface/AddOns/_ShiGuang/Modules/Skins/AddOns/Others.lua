local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")


function S:ResetRecount()
	Recount:RestoreMainWindowPosition(797, -405, 320, 220)

	Recount.db.profile.Locked = true
	Recount:LockWindows(true)

	Recount.db.profile.MainWindowHeight = 320
	Recount.db.profile.MainWindowWidth = 220
	Recount:ResizeMainWindow()

	Recount.db.profile.MainWindow.RowHeight = 18
	Recount:BarsChanged()

	Recount.db.profile.BarTexture = "normTex"
	Recount.db.profile.Font = DEFAULT
	Recount:UpdateBarTextures()

	MaoRUISettingDB["Skins"]["ResetRecount"] = false
end

function S:RecountSkin()
	if not MaoRUISettingDB["Skins"]["Recount"] then return end
	if not IsAddOnLoaded("Recount") then return end

	local frame = Recount_MainWindow
	M.StripTextures(frame)
	local bg = M.CreateBG(frame)
	bg:SetPoint("TOPLEFT", 0, -10)
	M.CreateBD(bg)
	M.CreateSD(bg)
	M.CreateTex(bg)
	frame.bg = bg

	local open, close = S:CreateToggle(frame)
	open:HookScript("OnClick", function()
		Recount.MainWindow:Show()
		Recount:RefreshMainWindow()
	end)
	close:HookScript("OnClick", function()
		Recount.MainWindow:Hide()
	end)

	if MaoRUISettingDB["Skins"]["ResetRecount"] then S:ResetRecount() end
	hooksecurefunc(Recount, "ResetPositions", S.ResetRecount)

end