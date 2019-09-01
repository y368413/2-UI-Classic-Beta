local _, ns = ...
local _, R = unpack(ns)

R.CoolDownData = {
	-- Shaman | 萨满
	[108280] = 180,		-- 治疗之潮图腾
	[114052] = 180,		-- 升腾(治疗)
	[98008] = 180,		-- 灵魂链接图腾
	[192077] = 120,		-- 狂风图腾
	-- Druid | 德鲁伊
	[740] = 180,		-- 宁静, 有天赋120
	[33891] = 180,		-- 化身：生命之树
	[106898] = 120,		-- 狂奔怒吼
	-- Monk | 武僧
	[198644] = 180,		-- 朱鹤赤精
	[115310] = 180,		-- 还魂术
	-- 队伍打断
	[1766] = 15, -- Kick (Rogue)
	[2139] = 24, -- Counterspell (Mage)
	[6552] = 15, -- Pummel (Warrior)
	[19647] = 15, -- Spell Lock (Warlock)
	[47528] = 15, -- Mind Freeze (Death Knight)
	[57994] = 12, -- Wind Shear (Shaman)
	[91802] = 12, -- Shambling Rush (Death Knight)
	[96231] = 15, -- Rebuke (Paladin)
	[106839] = 15, -- Skull Bash (Feral)
	[115781] = 15, -- Optical Blast (Warlock)
	[116705] = 15, -- Spear Hand Strike (Monk)
	[132409] = 24, -- Spell Lock (Warlock With Sacrifice)
	[147362] = 24, -- Counter Shot (Hunter)
	[171138] = 24, -- Countershot (Hunter)
	[183752] = 15, -- Disrupt
	[187707] = 15, -- Muzzle
	[212619] = 15, -- Call Felhunter (Warlock)
	[231665] = 15, -- Avengers Shield (Paladin)
	
	--[15487] = 45, -- Silence
	--[78675] = 60, -- Solar Beam
	--[119910] = 24,  -- Spell Lock  (With pet)
	
}

R.RaidSpells = {
	-- Battle resurrection
	[20484] = 600,	-- 复生
	[61999] = 600,	-- 复活盟友
	[20707] = 600,	-- Soulstone
	-- Heroism
	[32182] = 300,	-- 英勇
	[2825] = 300,	-- 嗜血
	[80353] = 300,	-- 时间扭曲
	[90355] = 300,	-- 远古狂乱
	-- Healing 抬血技能
	[633] = 600,	-- Lay on Hands
	[740] = 180,--宁静
	[115310] = 180,--还魂术
	[64843] = 180,--神圣赞美诗
	[108280] = 180,--治疗之潮图腾
	[15286] = 180,--吸血鬼的拥抱
	[108281] = 120,	-- Ancestral Guidance
	-- Defense
	[88611] = 180,	-- Smoke Bomb
	[116849] = 120,	-- Life Cocoon
	--单体减伤
	[33206] = 180,--痛苦压制
	[6940] = 120,--牺牲之手
	[102342] = 60,--铁木树皮
	[114030] = 120,--警戒
	[47788] = 180,--守护之魂
	--团队免伤技能	
	[97462] = 180,  -- 集结呐喊
	[31821] = 180,  -- 虔诚光环(NQ)
	[62618] = 180,  -- 真言术: 障
	[98008] = 180,  -- 灵魂链接图腾
	[196718] = 180, --幻影打击(DH)
	[51052] = 120, --反魔法领域
	--特殊类
	--	[172106] = 180,  -- 灵狐守护
	[106898] = 120,  -- 群奔怒吼
	[192077] = 120, --[192077] = {120, class = "SHAMAN", talent = 21963}, --Wind Rush Totem (10yd aoe, 15s, +60% movement speed for 5s), talent
	--	[159916] = 120, --魔法增效
	--橙戒
	[187616] = 120, --尼萨姆斯(智力输出)
	[187617] = 120, --萨克图斯(坦克)
	[187618] = 120, --伊瑟拉鲁斯(治疗)
	[187619] = 120, --索拉苏斯(力量输出)
	[187620] = 120, --玛鲁斯(敏捷输出)
	--控制技能CD
	[46968] = 40,  --震荡波
	[115750]= 90,  --盲目之光
	[108199]= 180,  --血魔之握
	[102359]= 30,  --群体缠绕
	[179057]= 60,  --混乱新星
	[119381]= 45,  --扫堂腿
	[192058]= 45,  --闪电奔涌图腾
	[109248]= 45,  --束缚射击
	[122]= 30,  --冰霜新星
	[30283]= 30,  --暗影之怒
	[132469]= 30,  --吹风
	[78675]= 60,  --日光术	
	[196932]= 30,  --巫毒图腾
	[51485]= 30,  --陷地图腾
	[113724]= 45,  --冰霜之环
	[31661]= 20,  --龙息术
	--
	[29166] = 180,	-- 激活
}
R.enemy_spells = {
	-- Interrupts and Silences
	[57994] = 12, -- Wind Shear
	[47528] = 15,	 -- Mind Freeze
	[106839] = 15,	-- Skull Bash
	[116705] = 15,	-- Spear Hand Strike
	[96231] = 15,	-- Rebuke
	[1766] = 15,	-- Kick
	[6552] = 15,	-- Pummel
	[147362] = 24,	-- Counter Shot
	[2139] = 24,	-- Counterspell
	[19647] = 24,	-- Spell Lock
	[115781] = 24,	-- Optical Blast
	[15487] = 45,	-- Silence
	[47476] = 60,	-- Strangulate
	[78675] = 60,	-- Solar Beam
	-- Crowd Controls
	[115078] = 15,	-- Paralysis
	[20066] = 15,	-- Repentance
	[187650] = 30,	-- Freezing Trap
	[8122] = 30,	-- Psychic Scream
	[30283] = 30,	-- Shadowfury
	[107570] = 30,	-- Storm Bolt
	[51514] = 30,	-- Hex
	[5484] = 40,	-- Howl of Terror
	[108194] = 45,	-- Asphyxiate
	[19386] = 45,	-- Wyvern Sting
	[113724] = 45,	-- Ring of Frost
	[119381] = 45,	-- Leg Sweep
	[64044] = 45,	-- Psychic Horror
	[6789] = 45,	-- Mortal Coil
	[853] = 60,		-- Hammer of Justice
	-- Defense abilities
	[48707] = 60,	-- Anti-Magic Shell
	[31224] = 90,	-- Cloak of Shadows
	[46924] = 90,	-- Bladestorm
	[287081] = 60,	-- Lichborne
	[213664] = 120,	-- Nimble Brew
	[47585] = 120,	-- Dispersion
	[1856] = 120,	-- Vanish
	[7744] = 120,	-- Will of the Forsaken (Racial)
	[186265] = 180,	-- Aspect of the Turtle
	[33206] = 180,	-- Pain Suppression
}
	
R.pulse_ignored_spells = {
	--GetSpellInfo(spellID),	-- Spell name
}