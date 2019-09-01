--[[--------------------------------------------------------------------
	Exonumist
	Shows currency counts for all your characters in currency tooltips.
	Copyright (c) 2010-2015 Phanx <addons@phanx.net>. All rights reserved.
	http://www.wowinterface.com/downloads/info16452-Exonumist.html
	http://www.curse.com/addons/wow/exonumist
	https://github.com/Phanx/Exonumist
----------------------------------------------------------------------]]

local realmDB, charDB
local nameToID = {} -- maps localized currency names to IDs
local names, icons, playerList, classColor = {}, {}, {}, {} -- cached data for LDB tooltip

------------------------------------------------------------------------

local collapsed, scanning = {}
local function UpdateData()
	if scanning then return end
	scanning = true
	wipe(names)
	local i, limit = 1, GetCurrencyListSize()
	while i <= limit do
		local name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo(i)
		if isHeader then
			if not isExpanded then
				collapsed[name] = true
				ExpandCurrencyList(i, 1)
				limit = GetCurrencyListSize()
			end
		else
			local link = GetCurrencyListLink(i)
			local id = tonumber(strmatch(link, "currency:(%d+)"))
			nameToID[name] = id
			if count > 0 then
				charDB[id] = count
				tinsert(names, name)
				icons[name] = icon
			else
				charDB[id] = nil
			end
		end
		i = i + 1
	end
	while i > 0 do
		local name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo(i)
		if isHeader and isExpanded and collapsed[name] then
			ExpandCurrencyList(i, 0)
		end
		i = i - 1
	end
	wipe(collapsed)
	sort(names)
	scanning = nil
end

------------------------------------------------------------------------

local function AddTooltipInfo(tooltip, currency, includePlayer)
	if not currency then return end
	local spaced
	for i = (includePlayer and 1 or 2), #playerList do
		local name = playerList[i]
		local n = realmDB[name][currency]
		if n then
			if not spaced then
				tooltip:AddLine(" ")
				spaced = true
			end
			local r, g, b
			local class = realmDB[name].class
			if class then
				r, g, b = unpack(classColor[class])
			else
				r, g, b = 0.5, 0.5, 0.5
			end
			tooltip:AddDoubleLine(name, n, r, g, b, r, g, b)
		end
	end
	if spaced then
		tooltip:Show()
	end
end

------------------------------------------------------------------------

local Exonumist = CreateFrame("Frame")
Exonumist:RegisterEvent("ADDON_LOADED")
Exonumist:SetScript("OnEvent", function(self, event)
	if event == "ADDON_LOADED" then
		local faction = UnitFactionGroup("player")
		if faction ~= "Alliance" and faction ~= "Horde" then return end

		local realm   = GetRealmName()
		local player  = UnitName("player")

		ShiGuangDB["Exonumist"] = ShiGuangDB["Exonumist"] or { }
		ShiGuangDB["Exonumist"][realm] = ShiGuangDB["Exonumist"][realm] or { }
		ShiGuangDB["Exonumist"][realm][faction] = ShiGuangDB["Exonumist"][realm][faction] or { }
		ShiGuangDB["Exonumist"][realm][faction][player] = ShiGuangDB["Exonumist"][realm][faction][player] or { }

		realmDB = ShiGuangDB["Exonumist"][realm][faction]
		if not realmDB then return end -- probably low level Pandaren

		charDB = realmDB[player]

		local now = time()
		charDB.class = select(2, UnitClass("player"))
		charDB.lastSeen = now

		local cutoff = now - (60 * 60 * 24 * 30) -- 30 days
		for name, data in pairs(realmDB) do
			if data.lastSeen and data.lastSeen < cutoff then
				realmDB[name] = nil
			elseif name ~= player then
				tinsert(playerList, name)
			end
		end
		sort(playerList)
		tinsert(playerList, 1, player)

		self:UnregisterEvent("ADDON_LOADED")

		if IsLoggedIn() then
			self:GetScript("OnEvent")(self, "PLAYER_LOGIN")
		else
			self:RegisterEvent("PLAYER_LOGIN")
		end
	elseif event == "PLAYER_LOGIN" then
		for k, v in pairs(CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS) do
			classColor[k] = { v.r, v.g, v.b }
		end
		if CUSTOM_CLASS_COLORS then
			CUSTOM_CLASS_COLORS:RegisterCallback(function()
				for k, v in pairs(CUSTOM_CLASS_COLORS) do
					classColor[k][1] = v.r
					classColor[k][2] = v.g
					classColor[k][3] = v.b
				end
			end)
		end

		self:UnregisterEvent("PLAYER_LOGIN")

		self:RegisterEvent("PLAYER_LOGOUT")

		hooksecurefunc("BackpackTokenFrame_Update", UpdateData)
		hooksecurefunc("TokenFrame_Update", UpdateData)
		UpdateData()

		hooksecurefunc(GameTooltip, "SetCurrencyByID", function(tooltip, id)
			AddTooltipInfo(tooltip, id, not MerchantMoneyInset:IsMouseOver())
		end)

		hooksecurefunc(GameTooltip, "SetCurrencyToken", function(tooltip, i)
			local name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo(i)
			AddTooltipInfo(tooltip, nameToID[name], not TokenFrame:IsMouseOver())
		end)

		hooksecurefunc(GameTooltip, "SetHyperlink", function(tooltip, link)
			local id = strmatch(link, "currency:(%d+)")
			if id then
				AddTooltipInfo(tooltip, tonumber(id), true)
			end
		end)

		hooksecurefunc(ItemRefTooltip, "SetHyperlink", function(tooltip, link)
			local id = strmatch(link, "currency:(%d+)")
			if id then
				AddTooltipInfo(tooltip, tonumber(id), true)
			end
		end)

		----------------------
		--	Merchant costs
		----------------------

		hooksecurefunc(GameTooltip, "SetMerchantCostItem", function(tooltip, item, currency)
			local icon, _, _, name = GetMerchantItemCostItem(item, currency)
			AddTooltipInfo(tooltip, nameToID[name], true)
		end)

		------------------------------
		--	Dungeon finder rewards
		------------------------------

		hooksecurefunc(GameTooltip, "SetLFGDungeonReward", function(tooltip, dungeonID, rewardIndex)

			local name = GetLFGDungeonRewardInfo(dungeonID, rewardIndex)
			if name then
				AddTooltipInfo(tooltip, nameToID[name], true)
			end
		end)

		hooksecurefunc(GameTooltip, "SetLFGDungeonShortageReward", function(tooltip, dungeonID, shortageIndex, rewardIndex)

			local name = GetLFGDungeonShortageRewardInfo(dungeonID, shortageIndex, rewardIndex)
			if name then
				AddTooltipInfo(tooltip, nameToID[name], true)
			end
		end)

		---------------------
		--	Quest rewards
		---------------------

		hooksecurefunc(GameTooltip, "SetQuestCurrency", function(tooltip, type, id)
			local name = GetQuestCurrencyInfo(type, id)
			if name then
				AddTooltipInfo(tooltip, nameToID[name], true)
			end
		end)

		hooksecurefunc(GameTooltip, "SetQuestLogCurrency", function(tooltip, type, id)
			local name = GetQuestLogRewardCurrencyInfo(id)
			if name then
				AddTooltipInfo(tooltip, nameToID[name], true)
			end
		end)

		-----------------
		--	xMerchant
		-----------------

		if xMerchantFrame then
			local function xMerchantTooltip(self)
				if self.pointType == "Beta" then
					local id = nameToID[self.itemLink]
					if id then
						self.UpdateTooltip = nil
						return GameTooltip:SetCurrencyByID(id)
					end
				end
				self.UpdateTooltip = self.origUpdateTooltip
			end

			for i = 1, 10 do
				for j = 1, MAX_ITEM_COST do
					local item = _G["xMerchantFrame"..i.."Item"..j]
					item:HookScript("OnEnter", xMerchantTooltip)
					item.origUpdateTooltip = item.UpdateTooltip
				end
			end
		end
	elseif event == "PLAYER_LOGOUT" then
		UpdateData()
	end
end)