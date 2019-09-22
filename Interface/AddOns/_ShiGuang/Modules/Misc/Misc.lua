local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:RegisterModule("Misc")

local _G = getfenv(0)
local tostring, tonumber, pairs, select, random, strsplit = tostring, tonumber, pairs, select, math.random, string.split
local InCombatLockdown, IsModifiedClick, IsAltKeyDown = InCombatLockdown, IsModifiedClick, IsAltKeyDown
local GetNumArchaeologyRaces = GetNumArchaeologyRaces
local GetNumArtifactsByRace = GetNumArtifactsByRace
local GetArtifactInfoByRace = GetArtifactInfoByRace
local GetArchaeologyRaceInfo = GetArchaeologyRaceInfo
local GetNumAuctionItems, GetAuctionItemInfo = GetNumAuctionItems, GetAuctionItemInfo
local FauxScrollFrame_GetOffset, SetMoneyFrameColor = FauxScrollFrame_GetOffset, SetMoneyFrameColor
local EquipmentManager_UnequipItemInSlot = EquipmentManager_UnequipItemInSlot
local EquipmentManager_RunAction = EquipmentManager_RunAction
local GetInventoryItemTexture = GetInventoryItemTexture
local GetItemInfo = GetItemInfo
local BuyMerchantItem = BuyMerchantItem
local GetMerchantItemLink = GetMerchantItemLink
local GetMerchantItemMaxStack = GetMerchantItemMaxStack
local GetItemQualityColor = GetItemQualityColor
local GetTime, GetCVarBool, SetCVar = GetTime, GetCVarBool, SetCVar
local GetNumLootItems, LootSlot = GetNumLootItems, LootSlot
local GetNumSavedInstances = GetNumSavedInstances
local GetInstanceInfo = GetInstanceInfo
local GetSavedInstanceInfo = GetSavedInstanceInfo
local SetSavedInstanceExtend = SetSavedInstanceExtend
local RequestRaidInfo, RaidInfoFrame_Update = RequestRaidInfo, RaidInfoFrame_Update
local IsGuildMember, BNGetGameAccountInfoByGUID, C_FriendList_IsFriend = IsGuildMember, BNGetGameAccountInfoByGUID, C_FriendList.IsFriend

--[[
	Miscellaneous 各种有用没用的小玩意儿
]]
function MISC:OnLogin()
	self:AddAlerts()
	self:Expbar()
	self:MailBox()
	self:ShowItemLevel()
	self:QuestNotifier()
	self:ExtendInstance()
	self:UIWidgetFrameMover()
	self:MoveDurabilityFrame()
	self:MoveTicketStatusFrame()
	self:AlertFrame_Setup()
	self:UpdateFasterLoot()
	self:UpdateErrorBlocker()
	self:TradeTargetInfo()
	self:MenuButton_Add()
	self:AutoDismount()
	self:WallpaperKit()
	

	-- Max camera distancee
	if tonumber(GetCVar("cameraDistanceMaxZoomFactor")) ~= 2.6 then
		SetCVar("cameraDistanceMaxZoomFactor", 2.6)
	end

	-- Auto chatBubbles
	if MaoRUIDB["AutoBubbles"] then
		local function updateBubble()
			local name, instType = GetInstanceInfo()
			if name and instType == "raid" then
				SetCVar("chatBubbles", 1)
			else
				SetCVar("chatBubbles", 0)
			end
		end
		M:RegisterEvent("PLAYER_ENTERING_WORLD", updateBubble)
	end

	-- Readycheck sound on master channel
	M:RegisterEvent("READY_CHECK", function()
		PlaySound(SOUNDKIT.READY_CHECK, "master")
	end)

	-- Instant delete
	hooksecurefunc(StaticPopupDialogs["DELETE_GOOD_ITEM"], "OnShow", function(self)
		self.editBox:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)

	-- Fix blizz error
	MAIN_MENU_MICRO_ALERT_PRIORITY = MAIN_MENU_MICRO_ALERT_PRIORITY or {}

	-- RealMobHealth override
	--if RealMobHealth then
		--RealMobHealth.OverrideOption("ModifyHealthBarText", false)
		--RealMobHealth.OverrideOption("ShowTooltipHealthText", false)
		--RealMobHealth.OverrideOption("ShowNamePlateHealthText", false)
		--RealMobHealth.OverrideOption("ShowStatusBarTextAdditions", false)
	--end
end

-- Extend Instance
function MISC:ExtendInstance()
	local bu = CreateFrame("Button", nil, RaidInfoFrame)
	bu:SetPoint("TOPRIGHT", -35, -5)
	bu:SetSize(25, 25)
	M.PixelIcon(bu, GetSpellTexture(80353), true)
	M.AddTooltip(bu, "ANCHOR_RIGHT", CHARMS_EXTEND, "system")

	bu:SetScript("OnMouseUp", function(_, btn)
		for i = 1, GetNumSavedInstances() do
			local _, _, _, _, _, extended, _, isRaid = GetSavedInstanceInfo(i)
			if isRaid then
				if btn == "LeftButton" then
					if not extended then
						SetSavedInstanceExtend(i, true)		-- extend
					end
				else
					if extended then
						SetSavedInstanceExtend(i, false)	-- cancel
					end
				end
			end
		end
		RequestRaidInfo()
		RaidInfoFrame_Update()
	end)
end

-- Reanchor Vehicle
function MISC:VehicleSeatMover()
	local frame = CreateFrame("Frame", "NDuiVehicleSeatMover", UIParent)
	frame:SetSize(125, 125)
	M.Mover(frame, U["VehicleSeat"], "VehicleSeat", {"BOTTOMRIGHT", UIParent, -285, 21})

	hooksecurefunc(VehicleSeatIndicator, "SetPoint", function(self, _, parent)
		if parent == "MinimapCluster" or parent == MinimapCluster then
			self:ClearAllPoints()
			self:SetPoint("TOPLEFT", frame)
		end
	end)
end

-- Reanchor UIWidgetBelowMinimapContainerFrame
function MISC:UIWidgetFrameMover()
	local frame = CreateFrame("Frame", "NDuiUIWidgetMover", UIParent)
	frame:SetSize(210, 60)
	M.Mover(frame, U["UIWidgetFrame"], "UIWidgetFrame", {"TOPRIGHT", Minimap, "BOTTOMRIGHT", 0, -43})

	hooksecurefunc(UIWidgetBelowMinimapContainerFrame, "SetPoint", function(self, _, parent)
		if parent == "MinimapCluster" or parent == MinimapCluster then
			self:ClearAllPoints()
			self:SetPoint("TOP", frame)
		end
	end)
end

-- Reanchor DurabilityFrame
function MISC:MoveDurabilityFrame()
	hooksecurefunc(DurabilityFrame, "SetPoint", function(self, _, parent)
		if parent ~= Minimap then
			self:ClearAllPoints()
			self:SetPoint("TOPRIGHT", Minimap, "BOTTOMRIGHT", 0, -30)
		end
	end)
end

-- Reanchor TicketStatusFrame
function MISC:MoveTicketStatusFrame()
	hooksecurefunc(TicketStatusFrame, "SetPoint", function(self, relF)
		if relF == "TOPRIGHT" then
			self:ClearAllPoints()
			self:SetPoint("TOP", UIParent, "TOP", -400, -20)
		end
	end)
end

-- Faster Looting
local lootDelay = 0
function MISC:DoFasterLoot()
	if GetTime() - lootDelay >= .3 then
		lootDelay = GetTime()
		if GetCVarBool("autoLootDefault") ~= IsModifiedClick("AUTOLOOTTOGGLE") then
			for i = GetNumLootItems(), 1, -1 do
				LootSlot(i)
			end
			lootDelay = GetTime()
		end
	end
end

function MISC:UpdateFasterLoot()
	if MaoRUISettingDB["Misc"]["FasterLoot"] then
		M:RegisterEvent("LOOT_READY", MISC.DoFasterLoot)
	else
		M:UnregisterEvent("LOOT_READY", MISC.DoFasterLoot)
	end
end

-- Hide errors in combat
local erList = {
	[ERR_ABILITY_COOLDOWN] = true,
	[ERR_ATTACK_MOUNTED] = true,
	[ERR_OUT_OF_ENERGY] = true,
	[ERR_OUT_OF_FOCUS] = true,
	[ERR_OUT_OF_HEALTH] = true,
	[ERR_OUT_OF_MANA] = true,
	[ERR_OUT_OF_RAGE] = true,
	[ERR_OUT_OF_RANGE] = true,
	[ERR_OUT_OF_RUNES] = true,
	[ERR_OUT_OF_HOLY_POWER] = true,
	[ERR_OUT_OF_RUNIC_POWER] = true,
	[ERR_OUT_OF_SOUL_SHARDS] = true,
	[ERR_OUT_OF_ARCANE_CHARGES] = true,
	[ERR_OUT_OF_COMBO_POINTS] = true,
	[ERR_OUT_OF_CHI] = true,
	[ERR_OUT_OF_POWER_DISPLAY] = true,
	[ERR_SPELL_COOLDOWN] = true,
	[ERR_ITEM_COOLDOWN] = true,
	[SPELL_FAILED_BAD_IMPLICIT_TARGETS] = true,
	[SPELL_FAILED_BAD_TARGETS] = true,
	[SPELL_FAILED_CASTER_AURASTATE] = true,
	[SPELL_FAILED_NO_COMBO_POINTS] = true,
	[SPELL_FAILED_SPELL_IN_PROGRESS] = true,
	[SPELL_FAILED_TARGET_AURASTATE] = true,
	[ERR_NO_ATTACK_TARGET] = true,
}

local isRegistered = true
function MISC:ErrorBlockerOnEvent(_, text)
	if InCombatLockdown() and erList[text] then
		if isRegistered then
			UIErrorsFrame:UnregisterEvent(self)
			isRegistered = false
		end
	else
		if not isRegistered then
			UIErrorsFrame:RegisterEvent(self)
			isRegistered = true
		end
	end
end

function MISC:UpdateErrorBlocker()
	if MaoRUISettingDB["Misc"]["HideErrors"] then
		M:RegisterEvent("UI_ERROR_MESSAGE", MISC.ErrorBlockerOnEvent)
	else
		isRegistered = true
		UIErrorsFrame:RegisterEvent("UI_ERROR_MESSAGE")
		M:UnregisterEvent("UI_ERROR_MESSAGE", MISC.ErrorBlockerOnEvent)
	end
end

-- TradeFrame hook
function MISC:TradeTargetInfo()
	local infoText = M.CreateFS(TradeFrame, 16, "")
	infoText:ClearAllPoints()
	infoText:SetPoint("TOP", TradeFrameRecipientNameText, "BOTTOM", 0, -5)

	local function updateColor()
		local r, g, b = M.UnitColor("NPC")
		TradeFrameRecipientNameText:SetTextColor(r, g, b)

		local guid = UnitGUID("NPC")
		if not guid then return end
		local text = "|cffff0000"..U["Stranger"]
		if BNGetGameAccountInfoByGUID(guid) or C_FriendList_IsFriend(guid) then
			text = "|cffffff00"..FRIEND
		elseif IsGuildMember(guid) then
			text = "|cff00ff00"..GUILD
		end
		infoText:SetText(text)
	end
	hooksecurefunc("TradeFrame_Update", updateColor)
end

-- Show BID and highlight price
-- AH Gold Icon
local function formats(value)
	local str = ''
	if value > 9999 then
		str = str .. format('|c00ffd700%d●|r', floor(value / 10000))
	end
	if value > 99 and floor(value/100)%100 ~= 0 then
		str = str .. format('|c00c7c7cf%d●|r', (floor(value / 100) % 100))
	end
	if floor(value)%100 ~= 0 then
		str = str .. format('|c00eda55f%d●|r', (floor(value) % 100))
	end
	return str
end
do
	local function setupMisc(event, addon)
		if addon == "Blizzard_AuctionUI" then
			hooksecurefunc("AuctionFrameBrowse_Update", function()
				local numBatchAuctions = GetNumAuctionItems("list")
				local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame)
				local name, buyoutPrice, bidAmount, hasAllInfo
				for i = 1, NUM_BROWSE_TO_DISPLAY do
					local index = offset + i + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameBrowse.page)
					local shouldHide = index > (numBatchAuctions + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameBrowse.page))
					if not shouldHide then
						name, _, count, _, _, _, _, _, _, buyoutPrice, bidAmount, _, _, _, _, _, _, hasAllInfo = GetAuctionItemInfo("list", offset + i)
						if not hasAllInfo then shouldHide = true end
					end
					if not shouldHide then
						local alpha = .5
						local color = "yellow"
						local buttonName = "BrowseButton"..i
						local itemName = _G[buttonName.."Name"]
						local moneyFrame = _G[buttonName.."MoneyFrame"]
						local buyoutMoney = _G[buttonName.."BuyoutFrameMoney"]
						if buyoutPrice >= 5*1e7 then color = "red" end
							if bidAmount > 0 then
								name = name .. " |cffffff00[￥]|r"
								alpha = 1.0
							end
							if (buyoutPrice > 0) and (count > 1) then
								name = name .. " |cffffff00["..formats(floor(buyoutPrice / count)).."|cffffff00]|r"
							end
							itemName:SetText(name)
							moneyFrame:SetAlpha(alpha)
							SetMoneyFrameColor(buyoutMoney:GetName(), color)
					end
				end
			end)
			M:UnregisterEvent(event, setupMisc)
		end
	end
	M:RegisterEvent("ADDON_LOADED", setupMisc)
end

-- ALT+RightClick to buy a stack
do
	local cache = {}
	local itemLink, id

	StaticPopupDialogs["BUY_STACK"] = {
		text = CHARMS_BUY_STACK,
		button1 = YES,
		button2 = NO,
		OnAccept = function()
			if not itemLink then return end
			BuyMerchantItem(id, GetMerchantItemMaxStack(id))
			cache[itemLink] = true
			itemLink = nil
		end,
		hideOnEscape = 1,
		hasItemFrame = 1,
	}

	local _MerchantItemButton_OnModifiedClick = MerchantItemButton_OnModifiedClick
	function MerchantItemButton_OnModifiedClick(self, ...)
		if IsAltKeyDown() then
			id = self:GetID()
			itemLink = GetMerchantItemLink(id)
			if not itemLink then return end
			local name, _, quality, _, _, _, _, maxStack, _, texture = GetItemInfo(itemLink)
			if maxStack and maxStack > 1 then
				if not cache[itemLink] then
					local r, g, b = GetItemQualityColor(quality or 1)
					StaticPopup_Show("BUY_STACK", " ", " ", {["texture"] = texture, ["name"] = name, ["color"] = {r, g, b, 1}, ["link"] = itemLink, ["index"] = id, ["count"] = maxStack})
				else
					BuyMerchantItem(id, GetMerchantItemMaxStack(id))
				end
			end
		end

		_MerchantItemButton_OnModifiedClick(self, ...)
	end
end

-- Temporary taint fix
do
	InterfaceOptionsFrameCancel:SetScript("OnClick", function()
		InterfaceOptionsFrameOkay:Click()
	end)
end

-- Select target when click on raid units
do
	local function fixRaidGroupButton()
		for i = 1, 40 do
			local bu = _G["RaidGroupButton"..i]
			if bu and bu.unit and not bu.clickFixed then
				bu:SetAttribute("type", "target")
				bu:SetAttribute("unit", bu.unit)

				bu.clickFixed = true
			end
		end
	end

	local function setupMisc(event, addon)
		if event == "ADDON_LOADED" and addon == "Blizzard_RaidUI" then
			if not InCombatLockdown() then
				fixRaidGroupButton()
			else
				M:RegisterEvent("PLAYER_REGEN_ENABLED", setupMisc)
			end
			M:UnregisterEvent(event, setupMisc)
		elseif event == "PLAYER_REGEN_ENABLED" then
			if RaidGroupButton1 and RaidGroupButton1:GetAttribute("type") ~= "target" then
				fixRaidGroupButton()
				M:UnregisterEvent(event, setupMisc)
			end
		end
	end

	M:RegisterEvent("ADDON_LOADED", setupMisc)
end

-- Add friend and guild invite on target menu
function MISC:MenuButton_OnClick(info)
	local name, server = UnitName(info.unit)
	if server and server ~= "" then name = name.."-"..server end

	if info.value == "name" then
		if MailFrame:IsShown() then
			MailFrameTab_OnClick(nil, 2)
			SendMailNameEditBox:SetText(name)
			SendMailNameEditBox:HighlightText()
		else
			local editBox = ChatEdit_ChooseBoxForSend()
			local hasText = (editBox:GetText() ~= "")
			ChatEdit_ActivateChat(editBox)
			editBox:Insert(name)
			if not hasText then editBox:HighlightText() end
		end
	elseif info.value == "guild" then
		GuildInvite(name)
	end
end

function MISC:MenuButton_Show(_, unit)
	if UIDROPDOWNMENU_MENU_LEVEL > 1 then return end

	if unit and (unit == "target" or string.find(unit, "party") or string.find(unit, "raid")) then
		local info = UIDropDownMenu_CreateInfo()
		info.text = MISC.MenuButtonList["name"]
		info.arg1 = {value = "name", unit = unit}
		info.func = MISC.MenuButton_OnClick
		info.notCheckable = true
		UIDropDownMenu_AddButton(info)

		if IsInGuild() and UnitIsPlayer(unit) and not UnitCanAttack("player", unit) and not UnitIsUnit("player", unit) then
			info = UIDropDownMenu_CreateInfo()
			info.text = MISC.MenuButtonList["guild"]
			info.arg1 = {value = "guild", unit = unit}
			info.func = MISC.MenuButton_OnClick
			info.notCheckable = true
			UIDropDownMenu_AddButton(info)
		end
	end
end

function MISC:MenuButton_Add()
	if not MaoRUISettingDB["Misc"]["EnhancedMenu"] then return end

	MISC.MenuButtonList = {
		["name"] = COPY_NAME,
		["guild"] = gsub(CHAT_GUILD_INVITE_SEND, HEADER_COLON, ""),
	}
	hooksecurefunc("UnitPopup_ShowMenu", MISC.MenuButton_Show)
end

-- Auto dismount and auto stand
function MISC:AutoDismount()
	if not MaoRUISettingDB["Misc"]["AutoDismount"] then return end

	local standString = {
		[ERR_LOOT_NOTSTANDING] = true,
		[SPELL_FAILED_NOT_STANDING] = true,
	}

	local dismountString = {
		[ERR_ATTACK_MOUNTED] = true,
		[ERR_NOT_WHILE_MOUNTED] = true,
		[ERR_TAXIPLAYERALREADYMOUNTED] = true,
		[SPELL_FAILED_NOT_MOUNTED] = true,
	}

	local function updateEvent(event, ...)
		local _, msg = ...
		if standString[msg] then
			DoEmote("STAND")
		elseif dismountString[msg] then
			Dismount()
		end
	end
	M:RegisterEvent("UI_ERROR_MESSAGE", updateEvent)
end