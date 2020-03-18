local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:RegisterModule("AurasTable")
local pairs, next, format, wipe = pairs, next, string.format, wipe

-- AuraWatch
local AuraWatchList = {}
local groups = {
	-- groups name = direction, interval, mode, iconsize, position, barwidth
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
					if I.isDeveloper then print(format("|cffFF0000XXX:|r '%s' %s", class, spellID)) end
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

-- RaidFrame spells
local RaidBuffs = {}
function module:AddClassSpells(list)
	for class, value in pairs(list) do
		if class == "ALL" then
			if not RaidBuffs[class] then RaidBuffs[class] = {} end
			for spellID in pairs(value) do
				local name = GetSpellInfo(spellID)
				if name then
					RaidBuffs[class][name] = true
				end
			end
		end
	end
end

-- RaidFrame debuffs
local RaidDebuffs = {}
function module:AddRaidDebuffs(list)
	for instType, value in pairs(list) do
		for spellID, prio in pairs(value) do
			if not RaidDebuffs[instType] then RaidDebuffs[instType] = {} end
			if prio > 6 then prio = 6 end
			RaidDebuffs[instType][spellID] = prio
		end
	end
end

function module:BuildNameListFromID()
	if not R.CornerBuffsByName then R.CornerBuffsByName = {} end
	wipe(R.CornerBuffsByName)

	local myCornerBuffs = MaoRUIDB["CornerBuffs"][I.MyClass]
	if not myCornerBuffs then return end

	for spellID, value in pairs(myCornerBuffs) do
		local name = GetSpellInfo(spellID)
		if name then
			R.CornerBuffsByName[name] = value
		end
	end
end

function module:OnLogin()
	-- Cleanup data
	if next(MaoRUIDB["RaidDebuffs"]) and not MaoRUIDB["RaidDebuffs"]["raid"] and not MaoRUIDB["RaidDebuffs"]["other"] then
		wipe(MaoRUIDB["RaidDebuffs"])
	end
	for instType, value in pairs(RaidDebuffs) do
		for spellID, prio in pairs(value) do
			if MaoRUIDB["RaidDebuffs"][instType] and MaoRUIDB["RaidDebuffs"][instType][spellID] and MaoRUIDB["RaidDebuffs"][instType][spellID] == prio then
				MaoRUIDB["RaidDebuffs"][instType][spellID] = nil
			end
		end
	end

	R.AuraWatchList = AuraWatchList
	R.RaidBuffs = RaidBuffs
	R.RaidDebuffs = RaidDebuffs

	if not MaoRUIDB["CornerBuffs"][I.MyClass] then MaoRUIDB["CornerBuffs"][I.MyClass] = {} end
	if not next(MaoRUIDB["CornerBuffs"][I.MyClass]) then
		M.CopyTable(R.CornerBuffs[I.MyClass], MaoRUIDB["CornerBuffs"][I.MyClass])
	end
	self:BuildNameListFromID()
end