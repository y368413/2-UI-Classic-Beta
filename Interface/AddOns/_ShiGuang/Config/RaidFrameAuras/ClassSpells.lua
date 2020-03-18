local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:GetModule("AurasTable")

-- 角标的相关法术 [spellID] = {anchor, {r, g, b}}
R.CornerBuffs = {
	["PRIEST"] = {
		[17]     = {"BOTTOMLEFT", {.7, .7, .7}},		-- 真言术盾
		[139]    = {"TOPLEFT", {.4, .7, .2}},			-- 恢复
		[6788]   = {"BOTTOMRIGHT", {.8, .1, .1}, true},	-- 虚弱灵魂
	},
	["DRUID"] = {
		[467]    = {"BOTTOMRIGHT", {.3, 1, .3}},		-- 荆棘术
		[774]    = {"TOPRIGHT", {.8, .4, .8}},			-- 回春
		[8936]   = {"RIGHT", {.2, .8, .2}},				-- 愈合
	},
	["PALADIN"] = {
		[1022]   = {"TOPRIGHT", {.2, .2, 1}, true},		-- 保护
		[6940]   = {"RIGHT", {.89, .1, .1}, true},		-- 牺牲
		[1044]   = {"BOTTOMRIGHT", {.89, .45, 0}, true},-- 自由
		[25771]  = {"TOP", {.86, .11, .11}, true},		-- 自律
	},
	["WARLOCK"] = {
		[2970]   = {"TOPRIGHT", {0, .8, .5}},			-- 侦测隐形
		[6512]   = {"TOPRIGHT", {0, .8, .5}},			-- 侦测次级隐形
		[11743]  = {"TOPRIGHT", {0, .8, .5}},			-- 侦测强效隐形
		[20707]  = {"BOTTOMRIGHT", {.8, .4, .8}},		-- 灵魂石
	},
	["MAGE"] = {
		[604]    = {"TOPRIGHT", {0, .8, .5}},			-- 魔法抑制
		[1008]   = {"TOPRIGHT", {1, .8, 0}},			-- 魔法增效
	},
	["WARRIOR"] = {
		[6673]   = {"TOPRIGHT", {1, .5, .2}},			-- 战斗怒吼
	},
	["SHAMAN"] = {},
	["ROGUE"] = {},
	["HUNTER"] = {},
}

-- 团队框体职业相关Buffs
local list = {
	["ALL"] = {			-- 全职业
		[642] = true,		-- 圣盾术
		[871] = true,		-- 盾墙
		[1022] = true,		-- 保护祝福
		[27827] = true,		-- 救赎之魂
	},
}
module:AddClassSpells(list)