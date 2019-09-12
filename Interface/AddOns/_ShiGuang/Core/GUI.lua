local _, ns = ...
local M, R, U, I = unpack(ns)
local G = M:RegisterModule("GUI")

local tonumber, tostring, pairs, ipairs, next, select, type = tonumber, tostring, pairs, ipairs, next, select, type
local tinsert, format, strsplit = table.insert, string.format, string.split
local r, g, b = I.r, I.g, I.b
local guiTab, guiPage, f, dataFrame = {}, {}

-- Default Settings
local defaultSettings = {
	BFA = false,
	Mover = {},
	InternalCD = {},
	AuraWatchMover = {},
	TempAnchor = {},
	AuraWatchList = {
		Switcher = {},
	},
	Actionbar = {
		Enable = true,
		Hotkeys = true,
		Macro = true,
		Count = true,
		Classcolor = false,
		Cooldown = true,
		DecimalCD = true,
		Style = 6,
		Bar4Fade = false,
		Bar5Fade = true,
		Scale = 1,
		BindType = 1,
		OverrideWA = false,
	},
	Bags = {
		Enable = true,
		BagsScale = 0.9,
		IconSize = 34,
		BagsWidth = 10,
		BankWidth = 16,
		BagsiLvl = true,
		BagsiLvlcolor = false,
		Artifact = true,
		ReverseSort = true,
		ItemFilter = true,
		ItemSetFilter = false,
		DeleteButton = true,
	},
	Auras = {
		Reminder = true,
		Totems = true,
		DestroyTotems = true,
		BlinkComboHelper = true,
		EnergyBar = true,
		ClassRecourePlace = true,
		ClassAuras = false,
		ReverseBuffs = false,
		BuffSize = 30,
		BuffsPerRow = 16,
		ReverseDebuffs = false,
		DebuffSize = 34,
		DebuffsPerRow = 16,
	},
	AuraWatch = {
		Enable = true,
		ClickThrough = false,
		IconScale = 1,
		DeprecatedAuras = false,
	},
	UFs = {
		PlayerFrameScale = 0.9,
		UFPctText = true,
		UFClassIcon = false,
		UFFade = true,
	},
	Chat = {
		Sticky = false,
		Lock = true,
		Invite = true,
		Freedom = true,
		Keyword = "2",
		Oldname = false,
		GuildInvite = false,
		EnableFilter = true,
		Matches = 1,
		BlockAddonAlert = true,
		ChatMenu = true,
		WhisperColor = true,
		ChatItemLevel = true,
		Chatbar = true,
		ChatWidth = 360,
		ChatHeight = 121,
	},
	Map = {
		Coord = true,
		Clock = false,
		CombatPulse = false,
		MapScale = 0.75,
		MinmapScale = 1.5,
		ShowRecycleBin = false,
		WhoPings = true,
		MapReveal = true,
		MapFader = false,
	},
	Nameplate = {
		Enable = true,
		Numberstyle = false,
		ColorBorder = true,
		PlayerAura = false,
		maxAuras = 6,
		AuraSize = 18,
		AuraFilter = 2,
		OtherFilter = 2,
		FriendlyCC = false,
		HostileCC = true,
		TankMode = false,
		Arrow = true,
		InsideView = true,
		QuestIcon = true,
		MinAlpha = .6,
		Distance = 42,
		Width = 106,
		Height = 6,
		blzplates = true,  --副本内显示友方
    nameonly = false,  --只显示名字
    BommIcon = true,
    HighlightTarget = true,
    HighlightFocus = true,
    ClassicCastbars = true,
    TargetClassicCastbars = true,
	},
	Skins = {
		DBM = true,
		Skada = false,
		Bigwigs = true,
		RM = true,
		RMRune = false,
		DBMCount = "10",
		EasyMarking = true,
		TMW = true,
		CastBarstyle = true,
		WeakAuras = true,
		InfobarLine = true,
		Details = true,
		PGFSkin = true,
		Rematch = true,
		QuestTracker = true,
	},
	Tooltip = {
		CombatHide = true,
		Cursor = true,
		ClassColor = false,
		HideRank = false,
		FactionIcon = true,
		TargetBy = true,
		Scale = 1,
		SpecLevelByShift = false,
		HideRealm = false,
		HideTitle = false,
		HideJunkGuild = true,
	},
	Misc = {
		Mail = true,
		ItemLevel = true,
		GemNEnchant = true,
		MissingStats = true,
		HideErrors = true,
		ExpRep = true,
		Interrupt = true,
		OwnInterrupt = true,
		InterruptSound = true,
		AlertInInstance = true,
		BrokenSpell = false,
		FasterLoot = true,
		AutoQuest = true,
		AltTabLfgNotification = false,
		CrazyCatLady = true,
		SpellNotReadyYet = true,
		WallpaperKit = true,
		AutoReagentBank = true,
		kAutoOpen = true,
		AutoConfirmRoll = false,
		Saycast = true,
		AutoMark = true,
		QuestNotifier = true,
		QuestProgress = false,
		OnlyCompleteRing = true,
		ExplosiveCache = {},
		PlacedItemAlert = false,
		RareAlertInWild = false,
		xMerchant = true,
		RaidCD = true,
		PulseCD = false,
		SorasThreat = true,
		EnhancedMenu = false,
		BetterQuest = true,
	},
	Tutorial = {
		Complete = false,
	},
}

local accountSettings = {
	ChatFilterList = "%*",
	Timestamp = false,
	NameplateFilter = {[1]={}, [2]={}},
	totalGold = {},
	RepairType = 1,
	AutoSell = true,
	GuildSortBy = 1,
	GuildSortOrder = true,
	DetectVersion = I.Version,
	ResetDetails = true,
	LockUIScale = false,
	UIScale = .8,
	NumberFormat = 2,
	VersionCheck = true,
	DBMRequest = false,
	SkadaRequest = false,
	BWRequest = false,
	TexStyle = 3,
	KeystoneInfo = {},
	AutoBubbles = false,
	SystemInfoType = 1,
}

-- Initial settings
local textureList = {
	[1] = I.normTex,
	[2] = I.gradTex,
	[3] = I.flatTex,
}

local function InitialSettings(source, target, fullClean)
	for i, j in pairs(source) do
		if type(j) == "table" then
			if target[i] == nil then target[i] = {} end
			for k, v in pairs(j) do
				if target[i][k] == nil then
					target[i][k] = v
				end
			end
		else
			if target[i] == nil then target[i] = j end
		end
	end

	for i, j in pairs(target) do
		if source[i] == nil then target[i] = nil end
		if type(j) == "table" and fullClean then
			for k, v in pairs(j) do
				if type(v) ~= "table" and source[i] and source[i][k] == nil then
					target[i][k] = nil
				end
			end
		end
	end
end

local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:SetScript("OnEvent", function(self, _, addon)
	if addon ~= "_ShiGuang" then return end
	if not MaoRUISettingDB["BFA"] then
		MaoRUISettingDB = {}
		MaoRUISettingDB["BFA"] = true
	end

	InitialSettings(defaultSettings, MaoRUISettingDB, true)
	InitialSettings(accountSettings, MaoRUIDB)
	I.normTex = textureList[MaoRUIDB["TexStyle"]]

	self:UnregisterAllEvents()
end)

local function setupAuraWatch()
	f:Hide()
	SlashCmdList["NDUI_AWCONFIG"]()
end

local function updateBagSortOrder()
	SetSortBagsRightToLeft(not MaoRUISettingDB["Bags"]["ReverseSort"])
end

local function updateChatSticky()
	M:GetModule("Chat"):ChatWhisperSticky()
end

local function updateTimestamp()
	M:GetModule("Chat"):UpdateTimestamp()
end

local function updateWhisperList()
	M:GetModule("Chat"):UpdateWhisperList()
end

local function updateFilterList()
	M:GetModule("Chat"):UpdateFilterList()
end

local function updateInterruptAlert()
	M:GetModule("Misc"):InterruptAlert()
end

local function updateMapFader()
	M:GetModule("Maps"):MapFader()
end

local function showMinimapClock()
	M:GetModule("Maps"):ShowMinimapClock()
end

local function updateInterruptAlert()
	M:GetModule("Misc"):InterruptAlert()
end

local function updateQuestNotifier()
	M:GetModule("Misc"):QuestNotifier()
end

local function updateFasterLoot()
	M:GetModule("Misc"):UpdateFasterLoot()
end

local function updateErrorBlocker()
	M:GetModule("Misc"):UpdateErrorBlocker()
end
-- Config
local tabList = {
	U["Actionbar"],
	U["Nameplate"],
	U["Auras"],
	U["Skins"],
	U["ChatFrame"],
	U["Misc"],
	U["UI Settings"],
}

local optionList = {		-- type, key, value, name, horizon, horizon2, doubleline
	[1] = {
		{1, "Actionbar", "Enable", "|cff00cc4c"..U["Enable Actionbar"]},
		--{3, "Actionbar", "Scale", U["Actionbar Scale"], true, false, {.8, 1.5, 1}},
		{4, "Actionbar", "Style", U["Actionbar Style"], true, true, {"-- 2*(3+12+3) --", "-- 2*(6+12+6) --", "-- 2*6+3*12+2*6 --", "-- 3*12 --", "-- 2*(12+6) --", "-- MR --", "-- PVP --", "-- 3*(4+12+4) --", "-- PVP2 --", "-- JK --"}},
		{},--blank
		{1, "Actionbar", "Cooldown", "|cff00cc4c"..U["Show Cooldown"]},
		{1, "Actionbar", "DecimalCD", U["Decimal Cooldown"].."*", true},
		{1, "Actionbar", "OverrideWA", U["HideCooldownOnWA"], true, true},
		{1, "Actionbar", "Hotkeys", U["Actionbar Hotkey"]},
		{1, "Actionbar", "Macro", U["Actionbar Macro"], true},
		{1, "Actionbar", "Count", U["Actionbar Item Counts"], true, true},
		{1, "Actionbar", "Bar4Fade", U["Bar4 Fade"]},
		{1, "Actionbar", "Bar5Fade", U["Bar5 Fade"], true},
		{1, "Actionbar", "Classcolor", U["ClassColor BG"], true, true},
		--{1, "Skins", "PetBattle", U["PetBattle Skin"], true},
		{1, "Skins", "DBM", U["DBM Skin"]},
		--{1, "Skins", "Skada", U["Skada Skin"], true},
		--{1, "Skins", "Bigwigs", U["Bigwigs Skin"]},
		{1, "Skins", "TMW", U["TMW Skin"], true},
		{1, "Skins", "WeakAuras", U["WeakAuras Skin"], true, true},
		--{1, "Skins", "Details", U["Details Skin"], true},
		--{1, "Skins", "PGFSkin", U["PGF Skin"], true},
		{4, "ACCOUNT", "TexStyle", U["Texture Style"], false, false, {U["Highlight"], U["Gradient"], U["Flat"]}},
		{4, "ACCOUNT", "NumberFormat", U["Numberize"], true, false, {U["Number Type1"], U["Number Type2"], U["Number Type3"]}},
		{2, "Skins", "DBMCount", U["Countdown Sec"].."*", true, true},
	},
	[2] = {
		{1, "Nameplate", "Enable", "|cff00cc4c"..U["Enable Nameplate"], false, false},
		{1, "Nameplate", "Numberstyle", "数字模式", true},
		{1, "Nameplate", "nameonly", "右方仅显示名字", true, true},
		--{1, "Nameplate", "CustomUnitColor", "|cff00cc4c"..U["CustomUnitColor"]},
		--{5, "Nameplate", "CustomColor", U["Custom Color"], 2},
		--{2, "Nameplate", "UnitList", U["UnitColor List"]},
		--{2, "Nameplate", "ShowPowerList", U["ShowPowerList"], true},
		--{1, "Nameplate", "DPSRevertThreat", U["DPS Revert Threat"].."*", true},
		--{5, "Nameplate", "SecureColor", U["Secure Color"].."*"},
		--{5, "Nameplate", "TransColor", U["Trans Color"].."*", 1},
		--{5, "Nameplate", "InsecureColor", U["Insecure Color"].."*", 2},
		{1, "Nameplate", "TankMode", "|cff00cc4c"..U["Tank Mode"].."*"},
		{1, "Nameplate", "FriendlyCC", U["Friendly CC"].."*", true},
		{1, "Nameplate", "HostileCC", U["Hostile CC"].."*", true, true},
		--{1, "Nameplate", "InsideView", U["Nameplate InsideView"], true, true},
		{1, "Nameplate", "BommIcon", "|cff00cc4c"..U["BommIcon"]},
		--{1, "Nameplate", "QuestIcon", U["Nameplate QuestIcon"]},
		{1, "Nameplate", "HighlightTarget", "血条高亮鼠标指向", true},
		{1, "Nameplate", "HighlightTarget", "血条高亮焦点指向", true, true},
		{1, "Nameplate", "ClassicCastbars", "|cff00cc4c血条施法条"},
		{1, "Nameplate", "TargetClassicCastbars", "|cff00cc4c目标头像下方施法条", true},
		--{1, "Nameplate", "FullHealth", U["Show FullHealth"], true},
		--{1, "Nameplate", "ExplosivesScale", U["ExplosivesScale"]},
		--{1, "Nameplate", "AKSProgress", U["AngryKeystones Progress"], true},
		--{4, "Nameplate", "TarArrow", U["Show Arrow"], false, {U["TOP"], U["RIGHT"], DISABLE}},
		{},--blank
		{3, "Nameplate", "MinAlpha", U["Nameplate MinAlpha"], false, false, {0, 1, 1}},
		{3, "Nameplate", "maxAuras", U["Max Auras"], true, false, {0, 10, 0}},
		{3, "Nameplate", "AuraSize", U["Auras Size"], true, true, {12, 36, 0}},
		--{3, "Nameplate", "VerticalSpacing", U["NP VerticalSpacing"].."*", false, {.5, 1.5, 1}},
		{3, "Nameplate", "Distance", U["Nameplate Distance"], false, false, {20, 100, 0}},
		{3, "Nameplate", "Width", U["NP Width"], true, false, {60, 160, 0}},
		{3, "Nameplate", "Height", U["NP Height"], true, true, {3, 16, 0}},
	},
	[3] = {
		{1, "AuraWatch", "Enable", "|cff00cc4c"..U["Enable AuraWatch"], false, false, setupAuraWatch},
		{1, "AuraWatch", "DeprecatedAuras", U["DeprecatedAuras"], true},
		{1, "AuraWatch", "ClickThrough", U["AuraWatch ClickThrough"], true, true},
		{1, "Auras", "Statue", U["Enable Statue"]},
		{1, "Auras", "Totems", U["Enable Totems"], true},
		{1, "Auras", "Reminder", U["Enable Reminder"], true, true},
		{1, "Auras", "Stagger", U["Enable Stagger"]},
		{1, "Auras", "BloodyHell", U["Enable BloodyHell"], true},
		{1, "Auras", "HunterTool", U["Enable Marksman"], true, true},
		--{1, "Auras", "BlinkComboHelper", U["Enable BlinkComboHelper"]},
		{1, "Auras", "EnergyBar", U["Class EnergyBar"]},
	  {1, "Auras", "ClassRecourePlace", U["Class Recoure Center"], true},
	  {1, "Auras", "ReverseBuffs", U["ReverseBuffs"], true, true},
	  {1, "Misc", "RaidCD", U["Raid CD"]},
	  {1, "Misc", "PulseCD", U["Pulse CD"], true},
		--{1, "Auras", "ClassAuras", U["Enable ClassAuras"]},
		{1, "Auras", "ReverseDebuffs", U["ReverseDebuffs"], true, true},
		{3, "Auras", "BuffSize", U["BuffSize"], false, false, {24, 40, 0}},
		{3, "Auras", "DebuffSize", U["DebuffSize"], true, false, {24, 40, 0}},
		{3, "Auras", "BuffsPerRow", U["BuffsPerRow"], false, false, {10, 20, 0}},
		{3, "Auras", "DebuffsPerRow", U["DebuffsPerRow"], true, false, {10, 16, 0}},
		{3, "AuraWatch", "IconScale", U["AuraWatch IconScale"], true, true, {.8, 2, 1}},
	},
	[4] = {
		--{1, "Skins", "RM", "|cff00cc4c"..U["Raid Manger"]},
		--{1, "Skins", "RMRune", U["Runes Check"].."*"},
		--{1, "Skins", "EasyMarking", U["Easy Mark"].."*"},
		{1, "Misc", "QuestNotifier", "|cff00cc4c"..U["QuestNotifier"].."*", false, false, updateQuestNotifier},
		{1, "Misc", "QuestProgress", U["QuestProgress"].."*", true},
		{1, "Misc", "OnlyCompleteRing", U["OnlyCompleteRing"].."*", true, true},
		{1, "Misc", "Interrupt", "|cff00cc4c"..U["Interrupt Alert"].."*", false, false, updateInterruptAlert}, 
		{1, "Misc", "AlertInInstance", U["Alert In Instance"].."*", true},
		{1, "Misc", "OwnInterrupt", U["Own Interrupt"].."*", true, true},
		{1, "Misc", "BrokenSpell", U["Broken Spell"].."*"},
		--{1, "Misc", "UunatAlert", U["Uunat Alert"].."*", false, false, updateUunatAlert},	
		{1, "Misc", "InterruptSound", U["Interrupt Alarm"], true, false},
		{1, "Skins", "QuestTrackerSkinTitle", U["QuestTrackerSkinTitle"], true, true},
		{},--blank
		{1, "Misc", "RareAlerter", "|cff00cc4c"..U["Rare Alert"].."*", false, false, updateRareAlert},
		{1, "Misc", "AlertinChat", U["Alert In Chat"].."*", true},
		--{1, "Misc", "RareAlertInWild", U["RareAlertInWild"].."*", true},
		{1, "Misc", "SoloInfo", U["SoloInfo"].."*", true, true, updateSoloInfo},
		{},--blank
		{1, "UFs", "UFFade", U["UFFade"]},
		{1, "UFs", "UFClassIcon", U["UFClassIcon"], true},
	  {1, "UFs", "UFPctText", U["UFPctText"], true, true},
	  {1, "Skins", "InfobarLine", "底部职业着色条"},
	  {1, "Misc", "xMerchant", U["xMerchant"], true},
	  {1, "Misc", "WallpaperKit", U["WallpaperKit"], true, true},
	  --{1, "Misc", "CrazyCatLady", U["Death Alarm"]},
	  {1, "Misc", "ExplosiveCount", U["Explosive Alert"], nil, nil, updateExplosiveAlert},
	  {1, "Misc", "PlacedItemAlert", U["Placed Item Alert"], true},
	  {1, "Misc", "FreeMountCD", "CD君(CN only)", true, true},
	},
	[5] = {
		{1, "Chat", "Lock", "|cff00cc4c"..U["Lock Chat"]},
		{1, "Chat", "Sticky", U["Chat Sticky"].."*", true, false, updateChatSticky},
		{1, "Chat", "Oldname", U["Default Channel"], true, true},
		--{1, "Chat", "WhisperColor", U["Differ WhipserColor"].."*"},
		{1, "Chat", "Freedom", U["Language Filter"]},
		{1, "ACCOUNT", "Timestamp", U["Timestamp"], true, false, updateTimestamp},
		{},--blank
		{1, "Chat", "Invite", "|cff00cc4c"..U["Whisper Invite"]},
		{1, "Chat", "GuildInvite", U["Guild Invite Only"].."*", true},
		{2, "Chat", "Keyword", U["Whisper Keyword"].."*", true, true, updateWhisperList},		
		{},--blank
		{1, "Chat", "EnableFilter", "|cff00cc4c"..U["Enable Chatfilter"]},
		{1, "Chat", "BlockAddonAlert", U["Block Addon Alert"], true},
		{2, "ACCOUNT", "ChatFilterList", U["Filter List"].."*", true, true, updateFilterList},
		{3, "Chat", "Matches", U["Keyword Match"].."*", false, false, {1, 3, 0}},
	},
	[6] = {
		{1, "Tooltip", "CombatHide", U["Hide Tooltip"].."*"},
		{1, "Tooltip", "Cursor", U["Follow Cursor"].."*", true},
		{1, "Tooltip", "ClassColor", U["Classcolor Border"].."*", true, true},
		{1, "Tooltip", "HideTitle", U["Hide Title"].."*"},
		{1, "Tooltip", "HideRank", U["Hide Rank"].."*", true},
		{1, "Tooltip", "FactionIcon", U["FactionIcon"].."*", true, true},
		{1, "Tooltip", "HideJunkGuild", U["HideJunkGuild"].."*"},
		{1, "Tooltip", "HideRealm", U["Hide Realm"].."*", true},
		{1, "Tooltip", "SpecLevelByShift", U["Show SpecLevelByShift"].."*", true, true},
		{1, "Tooltip", "AzeriteArmor", "|cff00cc4c"..U["Show AzeriteArmor"]},
		{1, "Tooltip", "OnlyArmorIcons", U["Armor icons only"].."*", true},
		{1, "Tooltip", "TargetBy", U["Show TargetedBy"].."*", true, true},
		{1, "Tooltip", "LFDRole", U["Group Roles"].."*"},
		{1, "Bags", "Enable", U["Enable Bags"], true},
		{1, "Misc", "BetterQuest", "任务追踪面板增强", true, true},
		{},--blank
		{1, "Map", "Coord", U["Map Coords"]},
		{1, "Map", "Clock", U["Minimap Clock"], true},
		--{1, "Map", "CombatPulse", U["Minimap Pulse"]},
		--{1, "Map", "ShowRecycleBin", U["Show RecycleBin"], true},
		{1, "Map", "WhoPings", U["Show WhoPings"]},
		{1, "Misc", "ExpRep", U["Show Expbar"], true},
		{1, "Misc", "WorldQusetRewardIcons", U["WorldQusetRewardIcons"], true, true},
	  {1, "Misc", "AutoMark", U["Auto Mark"]},
	  {1, "Misc", "kAutoOpen", U["kAutoOpen"], true},
	  {1, "Misc", "AutoReagentBank", U["Auto Reagent Bank"], true, true},
		{1, "Misc", "AutoConfirmRoll", U["AutoConfirmRoll"]},
		{1, "Misc", "QuickQueue", U["QuickQueue"], true},
	},
	[7] = {
		{1, "Misc", "Mail", U["Mail Tool"]},
		{1, "Misc", "Focuser", U["Easy Focus"], true},
		{1, "Misc", "TradeTab", U["TradeTabs"], true, true},
		{1, "Misc", "ItemLevel", U["Show ItemLevel"]},
		{1, "Misc", "MissingStats", U["Show MissingStats"], true},
		{1, "Misc", "Screenshot", U["Auto ScreenShot"], true, true, updateScreenShot},
		{1, "Misc", "FasterLoot", U["Faster Loot"], false, false, updateFasterLoot},
		{1, "Misc", "HideTalking", U["No Talking"], true},
		{1, "Misc", "HideBanner", U["Hide Bossbanner"], true, true},
		{1, "Misc", "HideErrors", U["Hide Error"], false, false, updateErrorBlocker},
		{1, "Misc", "ParagonRep", U["ParagonRep"], true},
		{1, "ACCOUNT", "AutoBubbles", U["AutoBubbles"], true, true},
		{3, "ACCOUNT", "UIScale", U["Setup UIScale"], false, false, {.4, 1.15, 1}},
		--{3, "Misc", "WorldQusetRewardIconsSize", "WorldQusetRewardIconsSize", true, false, {21, 66, 0}},
		{1, "ACCOUNT", "LockUIScale", "|cff00cc4c"..U["Lock UIScale"]},
		{3, "UFs", "PlayerFrameScale", U["PlayerFrame Scale"], false, false, {0.6, 1.2, 1}},
		{3, "Tooltip", "Scale", U["Tooltip Scale"], true, false, {.5, 1.5, 1}},
		{3, "Map", "MapScale", U["Map Scale"], true, true, {0.25, 2, 1}},
	},
}

local function SelectTab(i)
	for num = 1, #tabList do
		if num == i then
			guiTab[num]:SetBackdropColor(r, g, b, .3)
			guiTab[num].checked = true
			guiPage[num]:Show()
		else
			guiTab[num]:SetBackdropColor(0, 0, 0, .3)
			guiTab[num].checked = false
			guiPage[num]:Hide()
		end
	end
end

local function tabOnClick(self)
	PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK)
	SelectTab(self.index)
end
local function tabOnEnter(self)
	if self.checked then return end
	self:SetBackdropColor(r, g, b, .3)
end
local function tabOnLeave(self)
	if self.checked then return end
	self:SetBackdropColor(0, 0, 0, .3)
end

local function CreateTab(parent, i, name)
	local tab = CreateFrame("Button", nil, parent)
	tab:SetPoint("TOP", -270 + 90*(i-1), -116)
	tab:SetSize(90, 30)
	M.CreateBD(tab, .3)
	M.CreateFS(tab, 15, name, "system", "CENTER", 0, 0)
	tab.index = i

	tab:SetScript("OnClick", tabOnClick)
	tab:SetScript("OnEnter", tabOnEnter)
	tab:SetScript("OnLeave", tabOnLeave)

	return tab
end

local function NDUI_VARIABLE(key, value, newValue)
	if key == "ACCOUNT" then
		if newValue ~= nil then
			MaoRUIDB[value] = newValue
		else
			return MaoRUIDB[value]
		end
	else
		if newValue ~= nil then
			MaoRUISettingDB[key][value] = newValue
		else
			return MaoRUISettingDB[key][value]
		end
	end
end

local function editBoxOnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:ClearLines()
	GameTooltip:AddLine(U["Tips"])
	GameTooltip:AddLine(U["EdieBox Tip"], .6,.8,1)
	GameTooltip:Show()
end

local function CreateOption(i)
	local parent, offset = guiPage[i].child, 20

	for _, option in pairs(optionList[i]) do
		local optType, key, value, name, horizon, horizon2, data, callback = unpack(option)
		-- Checkboxes
		if optType == 1 then
			local cb = M.CreateCheckBox(parent)
			cb:SetHitRectInsets(-5, -5, -5, -5)
			if horizon2 then
				cb:SetPoint("TOPLEFT", 470, -offset + 32)
			elseif horizon then
				cb:SetPoint("TOPLEFT", 240, -offset + 32)
			else
				cb:SetPoint("TOPLEFT", 20, -offset)
				offset = offset + 32
			end
			cb.name = M.CreateFS(cb, 14, name, false, "LEFT", 30, 0)
			cb:SetChecked(NDUI_VARIABLE(key, value))
			cb:SetScript("OnClick", function()
				NDUI_VARIABLE(key, value, cb:GetChecked())
				if callback then callback() end
			end)
			if data and type(data) == "function" then
				local bu = M.CreateGear(parent)
				bu:SetPoint("LEFT", cb.name, "RIGHT", -2, 1)
				bu:SetScript("OnClick", data)
			end
		-- Editbox
		elseif optType == 2 then
			local eb = M.CreateEditBox(parent, 160, 30)
			eb:SetMaxLetters(999)
			if horizon2 then
				eb:SetPoint("TOPLEFT", 470, -offset + 32)
			elseif horizon then
				eb:SetPoint("TOPLEFT", 240, -offset + 32)
			else
				eb:SetPoint("TOPLEFT", 20, -offset - 26)
				offset = offset + 58
			end
			eb:SetText(NDUI_VARIABLE(key, value))
			eb:HookScript("OnEscapePressed", function()
				eb:SetText(NDUI_VARIABLE(key, value))
			end)
			eb:HookScript("OnEnterPressed", function()
				NDUI_VARIABLE(key, value, eb:GetText())
				if callback then callback() end
			end)
			eb:SetScript("OnEnter", editBoxOnEnter)
			eb:SetScript("OnLeave", M.HideTooltip)

			M.CreateFS(eb, 14, name, "system", "CENTER", 0, 25)
		-- Slider
		elseif optType == 3 then
			local min, max, step = unpack(data)
			local s = CreateFrame("Slider", key..value.."Slider", parent, "OptionsSliderTemplate")
			if horizon2 then
				s:SetPoint("TOPLEFT", 470, -offset + 32)
			elseif horizon then
				s:SetPoint("TOPLEFT", 240, -offset + 32)
			else
				s:SetPoint("TOPLEFT", 20, -offset - 26)
				offset = offset + 58
			end
			s:SetWidth(160)
			s:SetMinMaxValues(min, max)
			s:SetValue(NDUI_VARIABLE(key, value))
			s:SetScript("OnValueChanged", function(_, v)
				local current = tonumber(format("%."..step.."f", v))
				NDUI_VARIABLE(key, value, current)
				_G[s:GetName().."Text"]:SetText(current)
				if callback then callback() end
			end)

			M.CreateFS(s, 14, name, "system", "CENTER", 0, 21)
			_G[s:GetName().."Low"]:SetText(min)
			_G[s:GetName().."High"]:SetText(max)
			_G[s:GetName().."Text"]:ClearAllPoints()
			_G[s:GetName().."Text"]:SetPoint("TOP", s, "BOTTOM", 0, 3)
			_G[s:GetName().."Text"]:SetText(format("%."..step.."f", NDUI_VARIABLE(key, value)))
			s:SetBackdrop(nil)
			local bd = CreateFrame("Frame", nil, s)
			bd:SetPoint("TOPLEFT", 14, -2)
			bd:SetPoint("BOTTOMRIGHT", -15, 3)
			bd:SetFrameStrata("BACKGROUND")
			M.CreateBD(bd, .3)
			local thumb = _G[s:GetName().."Thumb"]
			thumb:SetTexture(I.sparkTex)
			thumb:SetBlendMode("ADD")
		-- Dropdown
		elseif optType == 4 then
			local dd = M.CreateDropDown(parent, 143, 26, data)
			if horizon2 then
				dd:SetPoint("TOPLEFT", 470, -offset + 32)
			elseif horizon then
				dd:SetPoint("TOPLEFT", 240, -offset + 32)
			else
				dd:SetPoint("TOPLEFT", 20, -offset - 26)
				offset = offset + 58
			end
			dd.Text:SetText(data[NDUI_VARIABLE(key, value)])

			local opt = dd.options
			dd.button:HookScript("OnClick", function()
				for num = 1, #data do
					if num == NDUI_VARIABLE(key, value) then
						opt[num]:SetBackdropColor(1, .8, 0, .3)
						opt[num].selected = true
					else
						opt[num]:SetBackdropColor(0, 0, 0, .3)
						opt[num].selected = false
					end
				end
			end)
			for i in pairs(data) do
				opt[i]:HookScript("OnClick", function()
					NDUI_VARIABLE(key, value, i)
					if callback then callback() end
				end)
			end

			M.CreateFS(dd, 14, name, "system", "CENTER", 0, 25)
		-- Colorswatch
		elseif optType == 5 then
			local f = M.CreateColorSwatch(parent)
			local width = 25 + (horizon or 0)*155
			if horizon2 then
				dd:SetPoint("TOPLEFT", width, -offset + 30)
			elseif horizon then
				f:SetPoint("TOPLEFT", width, -offset + 30)
			else
				f:SetPoint("TOPLEFT", width, -offset - 6)
				offset = offset + 36
			end
			M.CreateFS(f, 14, name, false, "LEFT", 26, 0)
			f.tex:SetVertexColor(NDUI_VARIABLE(key, value).r, NDUI_VARIABLE(key, value).g, NDUI_VARIABLE(key, value).b)

			local function onUpdate()
				local r, g, b = ColorPickerFrame:GetColorRGB()
				f.tex:SetVertexColor(r, g, b)
				NDUI_VARIABLE(key, value).r, NDUI_VARIABLE(key, value).g, NDUI_VARIABLE(key, value).b = r, g, b
				if callback then callback() end
			end

			local function onCancel()
				local r, g, b = ColorPicker_GetPreviousValues()
				f.tex:SetVertexColor(r, g, b)
				NDUI_VARIABLE(key, value).r, NDUI_VARIABLE(key, value).g, NDUI_VARIABLE(key, value).b = r, g, b
			end

			f:SetScript("OnClick", function()
				local r, g, b = NDUI_VARIABLE(key, value).r, NDUI_VARIABLE(key, value).g, NDUI_VARIABLE(key, value).b
				ColorPickerFrame.func = onUpdate
				ColorPickerFrame.previousValues = {r = r, g = g, b = b}
				ColorPickerFrame.cancelFunc = onCancel
				ColorPickerFrame:SetColorRGB(r, g, b)
				ColorPickerFrame:Show()
			end)
		-- Blank, no optType
		else
			local l = CreateFrame("Frame", nil, parent)
			l:SetPoint("TOPLEFT", 25, -offset - 12)
			M.CreateGF(l, 550, R.mult, "Horizontal", .7, .7, .7, .7, 0)
			offset = offset + 32
		end
	end
end

local bloodlustFilter = {
	[57723] = true,
	[57724] = true,
	[80354] = true,
	[264689] = true
}

local function exportData()
	local text = I.Version..":"..I.MyName..":"..I.MyClass
	for KEY, VALUE in pairs(MaoRUISettingDB) do
		if type(VALUE) == "table" then
			for key, value in pairs(VALUE) do
				if type(value) == "table" then
					if value.r then
						for k, v in pairs(value) do
							text = text..";"..KEY..":"..key..":"..k..":"..v
						end
					elseif key == "ExplosiveCache" then
						text = text..";"..KEY..":"..key..":EMPTYTABLE"
					elseif KEY == "AuraWatchList" then
						if key == "Switcher" then
							for k, v in pairs(value) do
								text = text..";"..KEY..":"..key..":"..k..":"..tostring(v)
							end
						else
							for spellID, k in pairs(value) do
								text = text..";"..KEY..":"..key..":"..spellID
								if k[5] == nil then k[5] = false end
								for _, v in ipairs(k) do
									text = text..":"..tostring(v)
								end
							end
						end
					elseif KEY == "Mover" or KEY == "InternalCD" then
						text = text..";"..KEY..":"..key
						for _, v in ipairs(value) do
							text = text..":"..tostring(v)
						end
					end
				else
					if MaoRUISettingDB[KEY][key] ~= defaultSettings[KEY][key] then
						text = text..";"..KEY..":"..key..":"..tostring(value)
					end
				end
			end
		end
	end

	for KEY, VALUE in pairs(MaoRUIDB) do
		if KEY == "NameplateFilter" then
			for index, value in pairs(VALUE) do
				text = text..";ACCOUNT:"..KEY..":"..index
				for spellID in pairs(value) do
					text = text..":"..spellID
				end
			end
		end
	end

	dataFrame.editBox:SetText(M:Encode(text))
	dataFrame.editBox:HighlightText()
end

local function toBoolean(value)
	if value == "true" then
		return true
	elseif value == "false" then
		return false
	end
end

local function importData()
	local profile = dataFrame.editBox:GetText()
	if M:IsBase64(profile) then profile = M:Decode(profile) end
	local options = {strsplit(";", profile)}
	--local title, _, _, class = strsplit(":", options[1])
	--if title ~= "NDuiSettings" then
		--UIErrorsFrame:AddMessage(I.InfoColor..U["Import data error"])
		--return
	--end

	for i = 2, #options do
		local option = options[i]
		local key, value, arg1 = strsplit(":", option)
		if arg1 == "true" or arg1 == "false" then
			MaoRUISettingDB[key][value] = toBoolean(arg1)
		elseif arg1 == "EMPTYTABLE" then
			MaoRUISettingDB[key][value] = {}
		elseif arg1 == "r" or arg1 == "g" or arg1 == "b" then
			local color = select(4, strsplit(":", option))
			if MaoRUISettingDB[key][value] then
				MaoRUISettingDB[key][value][arg1] = tonumber(color)
			end
		elseif key == "AuraWatchList" then
			if value == "Switcher" then
				local index, state = select(3, strsplit(":", option))
				MaoRUISettingDB[key][value][tonumber(index)] = toBoolean(state)
			else
				local idType, spellID, unit, caster, stack, amount, timeless, combat, text, flash = select(4, strsplit(":", option))
				value = tonumber(value)
				arg1 = tonumber(arg1)
				spellID = tonumber(spellID)
				stack = tonumber(stack)
				amount = toBoolean(amount)
				timeless = toBoolean(timeless)
				combat = toBoolean(combat)
				flash = toBoolean(flash)
				if not MaoRUISettingDB[key][value] then MaoRUISettingDB[key][value] = {} end
				MaoRUISettingDB[key][value][arg1] = {idType, spellID, unit, caster, stack, amount, timeless, combat, text, flash}
			end
		elseif key == "Mover" then
			local relFrom, parent, relTo, x, y = select(3, strsplit(":", option))
			x = tonumber(x)
			y = tonumber(y)
			MaoRUISettingDB[key][value] = {relFrom, parent, relTo, x, y}
		elseif key == "InternalCD" then
			local spellID, duration, indicator, unit, itemID = select(3, strsplit(":", option))
			spellID = tonumber(spellID)
			duration = tonumber(duration)
			itemID = tonumber(itemID)
			MaoRUISettingDB[key][spellID] = {spellID, duration, indicator, unit, itemID}
		elseif key == "ACCOUNT" then
			if value == "NameplateFilter" then
				local spells = {select(4, strsplit(":", option))}
				for _, spellID in next, spells do
					MaoRUIDB[value][tonumber(arg1)][tonumber(spellID)] = true
				end
			end
		elseif tonumber(arg1) then
			if value == "DBMCount" then
				MaoRUISettingDB[key][value] = arg1
			else
				MaoRUISettingDB[key][value] = tonumber(arg1)
			end
		end
	end

	ReloadUI()
end

local function updateTooltip()
	local profile = dataFrame.editBox:GetText()
	if M:IsBase64(profile) then profile = M:Decode(profile) end
	local option = strsplit(";", profile)
	local title, version, name, class = strsplit(":", option)
	--if title == "NDuiSettings" then
		dataFrame.version = version
		dataFrame.name = name
		dataFrame.class = class
	--else
		--dataFrame.version = nil
	--end
end

local function createDataFrame()
	if dataFrame then dataFrame:Show() return end

	dataFrame = CreateFrame("Frame", nil, UIParent)
	dataFrame:SetPoint("CENTER")
	dataFrame:SetSize(500, 500)
	dataFrame:SetFrameStrata("DIALOG")
	M.CreateMF(dataFrame)
	M.SetBackground(dataFrame)
	dataFrame.Header = M.CreateFS(dataFrame, 16, U["Export Header"], true, "TOP", 0, -5)

	local scrollArea = CreateFrame("ScrollFrame", nil, dataFrame, "UIPanelScrollFrameTemplate")
	scrollArea:SetPoint("TOPLEFT", 10, -30)
	scrollArea:SetPoint("BOTTOMRIGHT", -28, 40)
	M.CreateBD(M.CreateBG(scrollArea), .25)

	local editBox = CreateFrame("EditBox", nil, dataFrame)
	editBox:SetMultiLine(true)
	editBox:SetMaxLetters(99999)
	editBox:EnableMouse(true)
	editBox:SetAutoFocus(true)
	editBox:SetFont(I.Font[1], 14)
	editBox:SetWidth(scrollArea:GetWidth())
	editBox:SetHeight(scrollArea:GetHeight())
	editBox:SetScript("OnEscapePressed", function() dataFrame:Hide() end)
	scrollArea:SetScrollChild(editBox)
	dataFrame.editBox = editBox

	StaticPopupDialogs["NDUI_IMPORT_DATA"] = {
		text = U["Import data warning"],
		button1 = YES,
		button2 = NO,
		OnAccept = function()
			importData()
		end,
		whileDead = 1,
	}
	local accept = M.CreateButton(dataFrame, 100, 20, OKAY)
	accept:SetPoint("BOTTOM", 0, 10)
	accept:SetScript("OnClick", function(self)
		if self.text:GetText() ~= OKAY and dataFrame.editBox:GetText() ~= "" then
			StaticPopup_Show("NDUI_IMPORT_DATA")
		end
		dataFrame:Hide()
	end)
	accept:HookScript("OnEnter", function(self)
		if dataFrame.editBox:GetText() == "" then return end
		updateTooltip()

		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 10)
		GameTooltip:ClearLines()
		if dataFrame.version then
			GameTooltip:AddLine(U["Data Info"])
			GameTooltip:AddDoubleLine(U["Version"], dataFrame.version, .6,.8,1, 1,1,1)
			GameTooltip:AddDoubleLine(U["Character"], dataFrame.name, .6,.8,1, M.ClassColor(dataFrame.class))
		else
			GameTooltip:AddLine(U["Data Exception"], 1,0,0)
		end
		GameTooltip:Show()
	end)
	accept:HookScript("OnLeave", M.HideTooltip)
	dataFrame.text = accept.text
end

local function OpenGUI()
	if InCombatLockdown() then UIErrorsFrame:AddMessage(I.InfoColor..ERR_NOT_IN_COMBAT) return end
	if f then f:Show() return end

	-- Main Frame
	f = CreateFrame("Frame", "NDuiGUI", UIParent)
	tinsert(UISpecialFrames, "NDuiGUI")
	 local bgTexture = f:CreateTexture("name", "BACKGROUND")
    bgTexture:SetTexture("Interface\\Destiny\\UI-Destiny");  --FontStyles\\FontStyleGarrisons
    bgTexture:SetTexCoord(0,1,0,600/1024);
    bgTexture:SetAllPoints();
    bgTexture:SetAlpha(1)
	f:SetSize(1280, 600)
	f:SetPoint("CENTER")
	f:SetFrameStrata("HIGH")
	f:SetFrameLevel(5)
	M.CreateMF(f)
	M.CreateFS(f, 43, "2 UI", true, "TOP", 0, -62)
	M.CreateFS(f, 21, "v"..I.Version, false, "TOP", 80, -80)

	local close = M.CreateButton(f, 21, 21, "X")
	close:SetPoint("TOP", 280, -56)
	close:SetScript("OnClick", function() f:Hide() end)

	local scaleOld = MaoRUIDB["UIScale"]
	local ok = M.CreateButton(f, 66, 21, OKAY)
	ok:SetPoint("BOTTOMRIGHT", -260, 66)
	ok:SetScript("OnClick", function()
		local scale = MaoRUIDB["UIScale"]
		if scale ~= scaleOld then
			UIParent:SetScale(scale)
		end
		f:Hide()
		StaticPopup_Show("RELOAD_NDUI")
	end)

	for i, name in pairs(tabList) do
		guiTab[i] = CreateTab(f, i, name)
		guiPage[i] = CreateFrame("ScrollFrame", nil, f)
		guiPage[i]:SetPoint("TOPLEFT", 300, -160)
		guiPage[i]:SetSize(680, 400)
		guiPage[i]:Hide()
		guiPage[i].child = CreateFrame("Frame", nil, guiPage[i])
		guiPage[i].child:SetSize(610, 1)
		guiPage[i]:SetScrollChild(guiPage[i].child)
		CreateOption(i)
	end
	local reset = M.CreateButton(f, 66, 21, "Reset?")
	reset:SetPoint("BOTTOM", ok, "TOP", 0, 2)
	StaticPopupDialogs["RESET_NDUI"] = {
		text = CONFIRM_RESET_SETTINGS,
		button1 = YES,
		button2 = NO,
		OnAccept = function()
			MaoRUISettingDB = {}
			MaoRUIDB = {}
			ReloadUI()
		end,
		whileDead = 1,
	}
	reset:SetScript("OnClick", function()
		StaticPopup_Show("RESET_NDUI")
	end)

	local import = M.CreateButton(f, 66, 21, U["Import"])
	import:SetPoint("BOTTOMLEFT", 270, 66)
	import:SetScript("OnClick", function()
		f:Hide()
		createDataFrame()
		dataFrame.Header:SetText(U["Import Header"])
		dataFrame.text:SetText(U["Import"])
		dataFrame.editBox:SetText("")
	end)

	local export = M.CreateButton(f, 66, 21, U["Export"])
	export:SetPoint("BOTTOM", import, "TOP", 0, 2)
	export:SetScript("OnClick", function()
		f:Hide()
		createDataFrame()
		dataFrame.Header:SetText(U["Export Header"])
		dataFrame.text:SetText(OKAY)
		exportData()
	end)

	local credit = CreateFrame("Button", nil, f)
	credit:SetPoint("BOTTOM", 0, 66)
	credit:SetSize(360, 21)
	M.CreateFS(credit, 18, "This GUI learn form Siweia·s NDui，Sincere Gratitude！", true)
	
	local optTip = M.CreateFS(f, 12, U["Option* Tips"], "system", "CENTER", 0, 0)
	optTip:SetPoint("TOP", credit, "BOTTOM", 0, -2)

	local function showLater(event)
		if event == "PLAYER_REGEN_DISABLED" then
			if f:IsShown() then
				f:Hide()
				M:RegisterEvent("PLAYER_REGEN_ENABLED", showLater)
			end
		else
			f:Show()
			M:UnregisterEvent(event, showLater)
		end
	end
	M:RegisterEvent("PLAYER_REGEN_DISABLED", showLater)

	SelectTab(1)
end

function G:OnLogin()
	local gui = CreateFrame("Button", "GameMenuFrameNDui", GameMenuFrame, "GameMenuButtonTemplate")
	gui:SetText("2 UI")
	gui:SetPoint("TOP", GameMenuButtonAddons, "BOTTOM", 0, -2)
	GameMenuFrame:HookScript("OnShow", function(self)
		GameMenuButtonLogout:SetPoint("TOP", gui, "BOTTOM", 0, -12)
		self:SetHeight(self:GetHeight() + gui:GetHeight() + 6)
	end)

	gui:SetScript("OnClick", function()
		OpenGUI()
		HideUIPanel(GameMenuFrame)
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION)
	end)
end



SlashCmdList["MAORUIGUI"] = OpenGUI
SLASH_MAORUIGUI1 = '/mr'
