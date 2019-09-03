local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:GetModule("AurasTable")

-- 法师的法术监控
local list = {
	["Player Aura"] = {		-- 玩家光环组
		{AuraID = 130, UnitID = "player"},		-- 缓落
	},
	["Target Aura"] = {		-- 目标光环组
		{AuraID = 118, UnitID = "target", Caster = "player"},		-- 变形术
		{AuraID = 122, UnitID = "target", Caster = "player"},		-- 冰霜新星
		{AuraID = 12654, UnitID = "target", Caster = "player"},		-- 点燃
		{AuraID = 11366, UnitID = "target", Caster = "player"},		-- 炎爆术
	},
	["Special Aura"] = {	-- 玩家重要光环组
		{AuraID = 66, UnitID = "player"},		-- 隐形术
		{AuraID = 12042, UnitID = "player"},	-- 奥术强化
		{AuraID = 12472, UnitID = "player"},	-- 冰冷血脉
	},
	["Focus Aura"] = {		-- 焦点光环组
	},
	["Spell Cooldown"] = {	-- 冷却计时组
		{SlotID = 13},		-- 饰品1
		{SlotID = 14},		-- 饰品2
		{TotemID = 1},		-- 能量符文
		{SpellID = 12472},	-- 冰冷血脉
		{SpellID = 12042},	-- 奥术强化
	},
}

module:AddNewAuraWatch("MAGE", list)