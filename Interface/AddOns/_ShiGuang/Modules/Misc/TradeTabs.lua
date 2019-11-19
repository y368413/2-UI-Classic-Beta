local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:GetModule("Misc")

local pairs, unpack, tinsert = pairs, unpack, tinsert
local GetSpellCooldown, GetSpellInfo = GetSpellCooldown, GetSpellInfo
local InCombatLockdown, IsPlayerSpell, IsCurrentSpell = InCombatLockdown, IsPlayerSpell, IsCurrentSpell

local CAMPFIRE_ID = 818
local SMELTING_ID = 2656

local tradeList = {
	["Cooking"] = {
		[2550] = true,
		[3102] = true,
		[3413] = true,
		[18260] = true,
	},
	["FistAid"] = {
		[3273] = true,
		[3274] = true,
		[7924] = true,
		[10846] = true,
	},
	["Alchemy"] = {
		[2259] = true,
		[3101] = true,
		[3464] = true,
		[11611] = true,
	},
	["Blacksmithing"] = {
		[2018] = true,
		[3100] = true,
		[3538] = true,
		[9785] = true,
	},
	["Enchanting"] = {
		[7411] = true,
		[7412] = true,
		[7413] = true,
		[13920] = true,
	},
	["Engineering"] = {
		[4036] = true,
		[4037] = true,
		[4038] = true,
		[12656] = true,
	},
	["Leatherworking"] = {
		[2108] = true,
		[3104] = true,
		[3811] = true,
		[10662] = true,
	},
	["Mining"] = {
		[2575] = true,
		[2576] = true,
		[3564] = true,
		[10248] = true,
	},
	["Tailoring"] = {
		[3908] = true,
		[3909] = true,
		[3910] = true,
		[12180] = true,
	},
	["Poisons"] = {
		[2842] = true,
	},
}

local myProfessions = {}
local tabList = {}

function MISC:UpdateProfessions()
	for tradeName, list in pairs(tradeList) do
		for spellID in pairs(list) do
			if IsPlayerSpell(spellID) then
				myProfessions[tradeName] = spellID
				break
			end
		end
	end
end

function MISC:TradeTabs_Update()
	for _, tab in pairs(tabList) do
		local spellID = tab.spellID
		if IsCurrentSpell(spellID) then
			tab:SetChecked(true)
			tab.cover:Show()
		else
			tab:SetChecked(false)
			tab.cover:Hide()
		end

		local start, duration = GetSpellCooldown(spellID)
		if start and duration and duration > 1.5 then
			tab.CD:SetCooldown(start, duration)
		end
	end
end

local index = 1
function MISC:TradeTabs_Create(spellID)
	local name, _, texture = GetSpellInfo(spellID)

	local tab = CreateFrame("CheckButton", nil, TradeSkillFrame, "SpellBookSkillLineTabTemplate, SecureActionButtonTemplate")
	tab.tooltip = name
	tab.spellID = spellID
	tab:SetAttribute("type", "spell")
	tab:SetAttribute("spell", name)
	tab:SetNormalTexture(texture)
	tab:GetHighlightTexture():SetColorTexture(1, 1, 1, .25)
	tab:Show()

	tab.CD = CreateFrame("Cooldown", nil, tab, "CooldownFrameTemplate")
	tab.CD:SetAllPoints()

	local cover = CreateFrame("Frame", nil, tab)
	cover:SetAllPoints()
	cover:EnableMouse(true)
	tab.cover = cover

	tab:SetPoint("TOPLEFT", TradeSkillFrame, "TOPRIGHT", -33, -70 - (index-1)*45)
	tinsert(tabList, tab)
	index = index + 1

	return tab
end

function MISC:TradeTabs_OnLoad()
	MISC:UpdateProfessions()

	local hasCooking

	for tradeName, spellID in pairs(myProfessions) do
		if tradeName == "Mining" then
			spellID = SMELTING_ID
		elseif tradeName == "Cooking" then
			hasCooking = true
		end

		self:TradeTabs_Create(spellID)
	end

	if hasCooking then
		self:TradeTabs_Create(CAMPFIRE_ID)
	end

	MISC:TradeTabs_Update()
	M:RegisterEvent("TRADE_SKILL_SHOW", MISC.TradeTabs_Update)
	M:RegisterEvent("TRADE_SKILL_CLOSE", MISC.TradeTabs_Update)
	M:RegisterEvent("CURRENT_SPELL_CAST_CHANGED", MISC.TradeTabs_Update)
end

function MISC.TradeTabs_OnEvent(event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_TradeSkillUI" then
		M:UnregisterEvent(event, MISC.TradeTabs_OnEvent)
		if InCombatLockdown() then
			M:RegisterEvent("PLAYER_REGEN_ENABLED", MISC.TradeTabs_OnEvent)
		else
			MISC:TradeTabs_OnLoad()
		end
	elseif event == "PLAYER_REGEN_ENABLED" then
		M:UnregisterEvent(event, MISC.TradeTabs_OnEvent)
		MISC:TradeTabs_OnLoad()
	end
end

function MISC:TradeTabs()
	if not MaoRUISettingDB["Misc"]["TradeTabs"] then return end

	M:RegisterEvent("ADDON_LOADED", MISC.TradeTabs_OnEvent)
end