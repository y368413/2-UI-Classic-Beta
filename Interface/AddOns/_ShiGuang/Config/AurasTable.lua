local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:RegisterModule("AurasTable")
local pairs, next, format, wipe = pairs, next, string.format, wipe

-- AuraWatch
local AuraWatchList = {}
local groups = {
	-- groups name = direction, interval, mode, iconsize, position, barwidth
	["ClassBar"] = {"RIGHT", 6, "ICON", 36, R.Auras.ClassBarPos},
	["Player Aura"] = {"UP", 2, "BAR2", 21, R.Auras.PlayerAuraPos, 60},
	["Target Aura"] = {"UP", 2, "BAR", 28, R.Auras.TargetAuraPos, 80},
	["Special Aura"] = {"UP", 2, "BAR2", 28, R.Auras.SpecialPos, 80},
	["Focus Aura"] = {"UP", 2, "BAR", 21, R.Auras.FocusPos, 60},
	["Spell Cooldown"] = {"LEFT", 2, "ICON", 32, R.Auras.CDPos},
	["Enchant Aura"] = {"UP", 2, "ICON", 32, R.Auras.EnchantPos},	
	["Raid Buff"] = {"UP", 2, "ICON", 36, R.Auras.RaidBuffPos},
	["Raid Debuff"] = {"UP", 2, "ICON", 36, R.Auras.RaidDebuffPos},
	["Warning"] = {"UP", 2, "ICON", 32, R.Auras.WarningPos},
	["InternalCD"] = {"DOWN", 2, "BAR2", 16, R.Auras.InternalPos, 120},
	["Absorb"] = {"DOWN", 2, "TEXT", 21, R.Auras.AbsorbPos},
	["Shield"] = {"DOWN", 2, "TEXT", 21, R.Auras.ShieldPos},
}

local function newAuraFormat(value)
	local newTable = {}
	for _, v in pairs(value) do
		local id = v.AuraID or v.SpellID or v.ItemID or v.SlotID or v.TotemID or v.IntID
		if id then
			newTable[id] = v
		end
	end
	return newTable
end

function module:AddNewAuraWatch(class, list)
	for _, k in pairs(list) do
		for _, v in pairs(k) do
			local spellID = v.AuraID or v.SpellID
			if spellID then
				local name = GetSpellInfo(spellID)
				if not name then
					wipe(v)
					if I.isDeveloper then
						print(format("|cffFF0000XXX:|r '%s' %s", class, spellID))
					end
				end
			end
		end
	end

	if class ~= "ALL" and class ~= I.MyClass then return end
	if not AuraWatchList[class] then AuraWatchList[class] = {} end

	for name, v in pairs(list) do
		local direction, interval, mode, size, pos, width = unpack(groups[name])
		tinsert(AuraWatchList[class], {
			Name = name,
			Direction = direction,
			Interval = interval,
			Mode = mode,
			IconSize = size,
			Pos = pos,
			BarWidth = width,
			List = newAuraFormat(v)
		})
	end
end

function module:AddDeprecatedGroup()
	if not MaoRUISettingDB["AuraWatch"]["DeprecatedAuras"] then return end

	for name, value in pairs(R.DeprecatedAuras) do
		for _, list in pairs(AuraWatchList["ALL"]) do
			if list.Name == name then
				local newTable = newAuraFormat(value)
				for spellID, v in pairs(newTable) do
					list.List[spellID] = v
				end
			end
		end
	end
	wipe(R.DeprecatedAuras)
end

function module:OnLogin()
	self:AddDeprecatedGroup()
	R.AuraWatchList = AuraWatchList
end