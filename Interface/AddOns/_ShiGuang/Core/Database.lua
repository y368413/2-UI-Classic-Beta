local _, ns = ...
local M, R, U, I = unpack(ns)

local bit_band, bit_bor = bit.band, bit.bor
local COMBATLOG_OBJECT_AFFILIATION_MINE = COMBATLOG_OBJECT_AFFILIATION_MINE or 0x00000001

I.Version = GetAddOnMetadata("_ShiGuang", "Version")
I.Support = GetAddOnMetadata("_ShiGuang", "X-Support")
I.Client = GetLocale()
I.ScreenWidth, I.ScreenHeight = GetPhysicalScreenSize()
I.isClassic = select(4, GetBuildInfo()) < 20000

-- Colors
I.MyName = UnitName("player")
I.MyRealm = GetRealmName()
I.MyClass = select(2, UnitClass("player"))
I.MyFaction = UnitFactionGroup("player")
I.ClassList = {}
for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
	I.ClassList[v] = k
end
I.ClassColors = {}
-- Shaman classcolor
--RAID_CLASS_COLORS["SHAMAN"].r = 0
--RAID_CLASS_COLORS["SHAMAN"].g = .44
--RAID_CLASS_COLORS["SHAMAN"].b = .87
--RAID_CLASS_COLORS["SHAMAN"].colorStr = "ff0070dd"
local colors = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS
for class, value in pairs(colors) do
	I.ClassColors[class] = {}
	I.ClassColors[class].r = value.r
	I.ClassColors[class].g = value.g
	I.ClassColors[class].b = value.b
	I.ClassColors[class].colorStr = value.colorStr
end
I.r, I.g, I.b = I.ClassColors[I.MyClass].r, I.ClassColors[I.MyClass].g, I.ClassColors[I.MyClass].b
I.MyColor = format("|cff%02x%02x%02x", I.r*255, I.g*255, I.b*255)
I.InfoColor = "|cff99ccff"
I.GreyColor = "|cff7b8489"  --cff808080
I.QualityColors = {}
local qualityColors = BAG_ITEM_QUALITY_COLORS
for index, value in pairs(qualityColors) do
	I.QualityColors[index] = {r = value.r, g = value.g, b = value.b}
end
I.QualityColors[-1] = {r = 0, g = 0, b = 0}
I.QualityColors[LE_ITEM_QUALITY_POOR] = {r = .61, g = .61, b = .61}
I.QualityColors[LE_ITEM_QUALITY_COMMON] = {r = 0, g = 0, b = 0}

-- Fonts
I.Font = {STANDARD_TEXT_FONT, 12, "OUTLINE"}
I.LineString = I.GreyColor.."---------------"

-- Textures
local Media = "Interface\\Addons\\_ShiGuang\\Media\\"
I.bdTex = "Interface\\ChatFrame\\ChatFrameBackground"
I.glowTex = Media.."glowTex"
I.normTex = Media.."normTex"
I.gradTex = Media.."gradTex"
I.flatTex = Media.."flatTex"
I.bgTex = Media.."bgTex"
I.arrowTex = Media.."Modules\\Raid\\Arrow"
I.MicroTex = Media.."Hutu\\"
I.rolesTex = Media.."UI-LFG-ICON-ROLES"
I.chatLogo = Media.."2UI.blp"
I.logoTex = Media.."2UI.blp"
I.sortTex = Media.."SortIcon"
I.arrowUp = Media.."arrow-up-active"
I.arrowDown = Media.."arrow-down-active"
I.arrowLeft = Media.."arrow-left-active"
I.arrowRight = Media.."arrow-right-active"
I.EnergyTex = Media.."EnergyTex"
I.mailTex = "Interface\\Minimap\\Tracking\\Mailbox"
I.gearTex = "Interface\\WorldMap\\Gear_64"
I.eyeTex = "Interface\\Minimap\\Raid_Icon"		-- blue: \\Dungeon_Icon
I.garrTex = "Interface\\HelpFrame\\HelpIcon-ReportLag"
I.copyTex = "Interface\\Buttons\\UI-GuildButton-PublicNote-Up"
I.binTex = "Interface\\HelpFrame\\ReportLagIcon-Loot"
I.questTex = "adventureguide-microbutton-alert"
I.objectTex = "Warfronts-BaseMapIcons-Horde-Barracks-Minimap"
I.creditTex = "Interface\\HelpFrame\\HelpIcon-KnowledgeBase"
I.newItemFlash = "Interface\\Cooldown\\star4"
I.sparkTex = "Interface\\CastingBar\\UI-CastingBar-Spark"
I.TexCoord = {.08, .92, .08, .92}
I.textures = {
	normal		= Media.."ActionBar\\gloss",
	flash		= Media.."ActionBar\\flash",
	pushed		= Media.."ActionBar\\pushed",
}
I.LeftButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:230:307|t "
I.RightButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:333:411|t "
I.ScrollButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:127:204|t "
I.AFKTex = "|T"..FRIENDS_TEXTURE_AFK..":14:14:0:0:16:16:1:15:1:15|t"
I.DNDTex = "|T"..FRIENDS_TEXTURE_DND..":14:14:0:0:16:16:1:15:1:15|t"

-- Flags
function I:IsMyPet(flags)
	return bit_band(flags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0
end
I.PartyPetFlags = bit_bor(COMBATLOG_OBJECT_AFFILIATION_PARTY, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_PET)
I.RaidPetFlags = bit_bor(COMBATLOG_OBJECT_AFFILIATION_RAID, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_PET)



-- Raidbuff Checklist
I.BuffList = {
	[1] = {		-- 合剂
		--251836,	-- 敏捷238
		--251837,	-- 智力238
		--251838,	-- 耐力238
		--251839,	-- 力量238
		298836,	-- 敏捷360
		298837,	-- 智力360
		298839,	-- 耐力360
		298841,	-- 力量360
	},
	[2] = {     -- 进食充分
		104273, -- 250敏捷，BUFF名一致
	},
	[3] = {     -- 10%智力
		1459,
		264760,
	},
	[4] = {     -- 10%耐力
		21562,
		264764,
	},
	[5] = {     -- 10%攻强
		6673,
		264761,
	},
	[6] = {     -- 符文
		270058,
	},
}

-- Reminder Buffs Checklist
I.ReminderBuffs = {
	MAGE = {
		{	spells = {	-- 奥术智慧
				[1459] = true,
				[8096] = true,  -- 智力卷轴
				[23028] = true, -- 奥术光辉
			},
			depend = 1459,
			combat = true,
			instance = true,
			pvp = true,
		},
	},
	PRIEST = {
		{	spells = {	-- 真言术耐
				[1243] = true,
				[8099] = true,  -- 耐力卷轴
				[21562] = true, -- 坚韧祷言
			},
			depend = 1243,
			combat = true,
			instance = true,
			pvp = true,
		},
		{	spells = {	-- 心灵之火
				[588] = true,
			},
			depend = 588,
			combat = true,
			instance = true,
			pvp = true,
		},
	},
	DRUID = {
		{	spells = {	-- 野性印记
				[1126] = true,
				[21849] = true, -- 野性赐福
			},
			depend = 1126,
			combat = true,
			instance = true,
			pvp = true,
		},
		{	spells = {	--- 荆棘术
				[467] = true,
			},
			depend = 467,
			combat = true,
			instance = true,
			pvp = true,
		},
	},
	WARRIOR = {
		{	spells = {	-- 战斗怒吼
				[6673] = true,
				[25289] = true,
			},
			depends = {6673, 5242, 6192, 11549, 11550, 11551, 25289},
			combat = true,
			instance = true,
			pvp = true,
		},
	},
}
