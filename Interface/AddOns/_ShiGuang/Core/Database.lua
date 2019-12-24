local _, ns = ...
local M, R, U, I = unpack(ns)
I.Version = GetAddOnMetadata("_ShiGuang", "Version")
I.Support = GetAddOnMetadata("_ShiGuang", "X-Support")
I.Client = GetLocale()
I.ScreenWidth, I.ScreenHeight = GetPhysicalScreenSize()
I.isClassic = select(4, GetBuildInfo()) < 20000

-- Colors
I.MyName = UnitName("player")
I.MyRealm = GetRealmName()
I.MyClass = select(2, UnitClass("player"))
I.ClassList = {}
for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
	I.ClassList[v] = k
end
I.ClassColors = {}
-- Shaman classcolor
RAID_CLASS_COLORS["SHAMAN"].r = 0
RAID_CLASS_COLORS["SHAMAN"].g = .44
RAID_CLASS_COLORS["SHAMAN"].b = .87
RAID_CLASS_COLORS["SHAMAN"].colorStr = "ff0070dd"
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
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_POOR] = {r = .61, g = .61, b = .61}
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_COMMON] = {r = 0, g = 0, b = 0}

-- Fonts
I.Font = {STANDARD_TEXT_FONT, 12, "OUTLINE"}
I.TipFont = {GameTooltipText:GetFont(), 14, "OUTLINE"}
I.LineString = I.GreyColor.."---------------"

-- Textures
local Media = "Interface\\Addons\\_ShiGuang\\Media\\"
I.bdTex = "Interface\\ChatFrame\\ChatFrameBackground"
I.glowTex = Media.."glowTex"
I.normTex = Media.."normTex"
I.gradTex = Media.."gradTex"
I.flatTex = Media.."flatTex"
I.bgTex = Media.."bgTex"
I.EnergyTex = Media.."Skullflower3"
I.arrowTex = Media.."Modules\\Raid\\textureArrowAbove"
I.sortTex = Media.."SortIcon"
I.mailTex = "Interface\\Minimap\\Tracking\\Mailbox"
I.gearTex = Media.."arrow-down-active"  --Media.."Modules\\Raid\\ArrowLarge"
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
	normal		= Media.."ActionBars\\Gloss",
	flash		= Media.."ActionBars\\Flash",
	pushed		= Media.."ActionBars\\Pushed",
	checked		= Media.."ActionBars\\Checked",
	equipped	= Media.."ActionBars\\Gloss",
}
I.LeftButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:230:307|t "
I.RightButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:333:411|t "
I.ScrollButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:127:204|t "
I.AFKTex = "|T"..FRIENDS_TEXTURE_AFK..":14:14:0:0:16:16:1:15:1:15|t"
I.DNDTex = "|T"..FRIENDS_TEXTURE_DND..":14:14:0:0:16:16:1:15:1:15|t"

-- Flags
I.MyPetFlags = bit.bor(COMBATLOG_OBJECT_AFFILIATION_MINE, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_PET)
I.PartyPetFlags = bit.bor(COMBATLOG_OBJECT_AFFILIATION_PARTY, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_PET)
I.RaidPetFlags = bit.bor(COMBATLOG_OBJECT_AFFILIATION_RAID, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_PET)
I.GuardianFlags = bit.bor(COMBATLOG_OBJECT_AFFILIATION_MINE, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_GUARDIAN)

--[[ RoleUpdater
local function CheckRole()
	local tree = GetSpecialization()
	if not tree then return end
	local _, _, _, _, role, stat = GetSpecializationInfo(tree)
	if role == "TANK" then
		I.Role = "Tank"
	elseif role == "HEALER" then
		I.Role = "Healer"
	elseif role == "DAMAGER" then
		if stat == 4 then	--1力量，2敏捷，4智力
			I.Role = "Caster"
		else
			I.Role = "Melee"
		end
	end
end
M:RegisterEvent("PLAYER_LOGIN", CheckRole)
M:RegisterEvent("CHARACTER_POINTS_CHANGED", CheckRole)]]

-- Raidbuff Checklist
I.BuffList = {
	[1] = {		-- 合剂
		251836,	-- 敏捷238
		251837,	-- 智力238
		251838,	-- 耐力238
		251839,	-- 力量238
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
	},
}
