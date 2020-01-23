local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")

function S:SkadaSkin()
	if not MaoRUIDB["Skins"]["Skada"] then return end
	if not IsAddOnLoaded("Skada") then return end

	local pairs, ipairs, tinsert = pairs, ipairs, table.insert
	local Skada = Skada
	local barSpacing = 0
	local barmod = Skada.displays["bar"]
	local function StripOptions(options)
		options.baroptions.args.barspacing = nil
		options.titleoptions.args.texture = nil
		options.titleoptions.args.bordertexture = nil
		options.titleoptions.args.thickness = nil
		options.titleoptions.args.margin = nil
		options.titleoptions.args.color = nil
		options.windowoptions = nil
		options.baroptions.args.barfont = nil
		options.titleoptions.args.font = nil
	end

	barmod.AddDisplayOptions_ = barmod.AddDisplayOptions
	barmod.AddDisplayOptions = function(self, win, options)
		self:AddDisplayOptions_(win, options)
		StripOptions(options)
	end

	for _, options in pairs(Skada.options.args.windows.args) do
		if options.type == "group" then
			StripOptions(options.args)
		end
	end

	barmod.ApplySettings_ = barmod.ApplySettings
	barmod.ApplySettings = function(self, win)
		barmod.ApplySettings_(self, win)
		local window = win.bargroup
		if win.db.enabletitle then
			window.button:SetBackdrop(nil)
		end
		window:SetSpacing(barSpacing)
		window:SetFrameLevel(5)
		window.SetFrameLevel = M.Dummy
		window:SetBackdrop(nil)
		M.StripTextures(window.borderFrame)

		if not window.bg then
			local bg = M.CreateBG(window)
			M.CreateBD(bg)
			M.CreateSD(bg)
			M.CreateTex(bg)
			window.bg = bg

			local open, close = S:CreateToggle(window)
			open:HookScript("OnClick", function()
				window:Show()
			end)
			close:HookScript("OnClick", function()
				window:Hide()
			end)
		end
		window.bg:ClearAllPoints()
		if win.db.enabletitle then
			window.bg:SetPoint("TOPLEFT", window.button, "TOPLEFT", -3, 3)
		else
			window.bg:SetPoint("TOPLEFT", window, "TOPLEFT", -3, 3)
		end
		window.bg:SetPoint("BOTTOMRIGHT", window, "BOTTOMRIGHT", 3, -3)
		window.button:SetBackdropColor(1, 1, 1, 0)
		window.button:SetFrameStrata("MEDIUM")
		window.button:SetFrameLevel(5)
		window:SetFrameStrata("MEDIUM")
	end

	local function EmbedWindow(window, width, barheight, height, ofsx, ofsy)
		window.db.barwidth = width
		window.db.barheight = barheight
		if window.db.enabletitle then
			height = height - barheight
		end
		window.db.background.height = height
		window.db.spark = false
		window.db.barslocked = true
		window.bargroup:ClearAllPoints()
		window.bargroup:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", ofsx, ofsy)
		barmod.ApplySettings(barmod, window)
	end

	local windows = {}
	local function EmbedSkada()
		if #windows == 1 then
			EmbedWindow(windows[1], 285, 16, 165, 0, 21)
		elseif #windows == 2 then
			EmbedWindow(windows[1], 285, 16, 165, 0, 21)
			EmbedWindow(windows[2], 285, 16, 165, -310, 21)
		end
	end

	for _, window in ipairs(Skada:GetWindows()) do
		window:UpdateDisplay()
	end

	Skada.CreateWindow_ = Skada.CreateWindow
	function Skada:CreateWindow(name, db)
		Skada:CreateWindow_(name, db)
		wipe(windows)
		for _, window in ipairs(Skada:GetWindows()) do
			tinsert(windows, window)
		end
		EmbedSkada()
	end

	Skada.DeleteWindow_ = Skada.DeleteWindow
	function Skada:DeleteWindow(name)
		Skada:DeleteWindow_(name)
		wipe(windows)
		for _, window in ipairs(Skada:GetWindows()) do
			tinsert(windows, window)
		end
		EmbedSkada()
	end

	EmbedSkada()

	-- Change Skada Default Settings
	Skada.windowdefaults.bartexture = "HalfStyle"
	Skada.windowdefaults.classicons = false
	Skada.windowdefaults.title.height = 16
	Skada.windowdefaults.title.texture = "None"
	Skada.windowdefaults.title.fontflags = "OUTLINE"
	Skada.windowdefaults.title.fontsize = 11
	Skada.windowdefaults.title.color = {r=0,g=0,b=0,a=.3}
	Skada.windowdefaults.barfontflags = "OUTLINE"
	Skada.windowdefaults.barfontsize = 11
	Skada.windowdefaults.barbgcolor = {r=0,g=0,b=0,a=0}
	Skada.windowdefaults.reversegrowth = true
	Skada.windowdefaults.enabletitle = false

	-- Change Skada NumberFormat
	Skada.options.args.generaloptions.args.numberformat = nil

	function Skada:FormatNumber(number)
		if number then return M.Numb(number) end
	end
end