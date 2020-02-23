--## Version: 1.1.5 ## Author: Bytespire
local ItemProfConstants = {}

local COOK =    0x001
local FAID =    0x002
local ALC =     0x004
local BS =      0x008
local ENC =     0x010
local ENG =     0x020
local LW =      0x040
local TAIL =    0x080
local VENDOR =	0x100
local Q = 		0x200	-- Neutral quests
local ALLI = 	0x400	-- Alliance only
local HORDE = 	0x800	-- Horde only
local DRUID = 	0x1000
local HUNTER = 	0x2000
local MAGE = 	0x4000
local PALADIN = 0x8000
local PRIEST = 	0x10000
local ROGUE = 	0x20000
local SHAMAN = 	0x40000
local WARLOCK = 0x80000
local WARRIOR = 0x100000
local COOK_Q =	0x200000
local FAID_Q = 	0x400000
local ALC_Q =	0x800000
local BS_Q =	0x1000000
local ENC_Q = 	0x2000000
local ENG_Q = 	0x4000000
local LW_Q =	0x8000000
local TAIL_Q =	0x10000000
local DMF =		0x20000000

ItemProfConstants_VENDOR_ITEM_FLAG = VENDOR
ItemProfConstants_DMF_ITEM_FLAG = DMF
ItemProfConstants_QUEST_FLAG = Q
ItemProfConstants_NUM_PROF_FLAGS = 8	-- Num professions tracked

ItemProfConstants_PROF_TEXTURES = {
[ COOK ] = GetSpellTexture( 2550 ),
[ FAID ] = GetSpellTexture( 3273 ),
[ ALC ] = GetSpellTexture( 2259 ),
[ BS ] = GetSpellTexture( 2018 ),
[ ENC ] = GetSpellTexture( 7411 ),
[ ENG ] = GetSpellTexture( 4036 ),
[ LW ] = GetSpellTexture( 2108 ),
[ TAIL ] = GetSpellTexture( 3908 ),
[ Q ] = "Interface\\GossipFrame\\AvailableQuestIcon",
[ DMF ] = "134481"
}

-- Mapping the item IDs to texture indices
ItemProfConstants_ITEM_PROF_FLAGS = {
[ 118 ] = ALC,
[ 159 ] = COOK + ENG + VENDOR,
[ 723 ] = COOK + ALLI,	--q
[ 729 ] = COOK + ALLI,	--q
[ 730 ] = COOK + ALLI,	--q
[ 731 ] = COOK + ALLI,	--q
[ 732 ] = ALLI,			--q
[ 737 ] = Q,		--q
[ 765 ] = ALC,
[ 769 ] = COOK + ALLI,	--q
[ 774 ] = BS + ENG,
[ 783 ] = LW,
[ 785 ] = ALC,
[ 814 ] = ENG + ALLI,		--q ALLIANCE
[ 818 ] = BS + ENG,
[ 929 ] = TAIL + Q,		--q
[ 1015 ] = COOK + ALLI,	--q
[ 1080 ] = COOK + ALLI,	--q
[ 1081 ] = COOK + ALLI,	--q
[ 1179 ] = COOK + VENDOR,
[ 1206 ] = BS + ENG + LW + Q, --q
[ 1210 ] = BS + ENC + ENG + LW,
[ 1274 ] = ALLI,			--q ALLIANCE
[ 1288 ] = FAID + ALC,
[ 1468 ] = COOK + ALLI,	--q
[ 1475 ] = FAID,
[ 1529 ] = BS + ENG + LW + TAIL + MAGE,	--q MAGE
[ 1705 ] = BS + ENG,
[ 2251 ] = COOK + ALLI,	--q
[ 2296 ] = Q,
[ 2309 ] = ALLI + LW_Q + DMF,	--q LW ALLIANCE
[ 2310 ] = ALLI + LW_Q,			--q LW ALLIANCE
[ 2312 ] = LW,
[ 2314 ] = DMF,
[ 2318 ] = BS + ENG + LW + TAIL,		--q HORDE LW/SKINNING ?????
[ 2319 ] = BS + ENG + LW + TAIL,
[ 2320 ] = LW + TAIL + VENDOR + HORDE,			--q VENDOR
[ 2321 ] = BS + LW + TAIL + VENDOR + ALLI,		--q VENDOR ALLIANCE
[ 2324 ] = LW + TAIL + VENDOR,
[ 2325 ] = LW + TAIL + VENDOR,
[ 2447 ] = ALC,
[ 2449 ] = ALC + DRUID,		--q DRUID
[ 2450 ] = ALC,
[ 2452 ] = COOK + ALC,
[ 2453 ] = ALC,
[ 2454 ] = ALLI + ALC_Q,	--q ALC
[ 2455 ] = ALLI,			--q ALLIANCE
[ 2457 ] = LW,
[ 2458 ] = ALLI,			--q ALLIANCE
[ 2459 ] = BS + LW,
[ 2589 ] = FAID + BS + ENG + TAIL + MAGE + PALADIN,	--q MAGE PALADIN
[ 2592 ] = FAID + BS + ENG + TAIL,
[ 2594 ] = VENDOR + ALLI,		--q ALLIANCE VENDOR
[ 2596 ] = COOK + VENDOR,
[ 2604 ] = TAIL + VENDOR,
[ 2605 ] = BS + LW + TAIL + VENDOR,
[ 2633 ] = ALLI,		--q ALLIANCE
[ 2665 ] = COOK + VENDOR + ALLI,		--q VENDOR
[ 2672 ] = COOK,
[ 2673 ] = COOK,
[ 2674 ] = COOK,
[ 2675 ] = COOK,
[ 2677 ] = COOK,
[ 2678 ] = COOK + VENDOR,
[ 2692 ] = COOK + VENDOR,
[ 2725 ] = Q,
[ 2728 ] = Q,
[ 2730 ] = Q,
[ 2732 ] = Q,
[ 2734 ] = Q,
[ 2735 ] = Q,
[ 2738 ] = Q,
[ 2740 ] = Q,
[ 2742 ] = Q,
[ 2744 ] = Q,
[ 2745 ] = Q,
[ 2748 ] = Q,
[ 2749 ] = Q,
[ 2750 ] = Q,
[ 2751 ] = Q,
[ 2772 ] = ENC,
[ 2798 ] = ALLI,		--q ALLIANCE
[ 2835 ] = BS + ENG,
[ 2836 ] = BS + ENG,
[ 2838 ] = BS + ENG,
[ 2840 ] = BS + ENG,
[ 2841 ] = BS + ENG,
[ 2842 ] = BS + ENG + Q,	--q
[ 2845 ] = ALLI + BS_Q,	--q BS ALLIANCE
[ 2851 ] = ALLI + BS_Q,	--q BS ALLIANCE
[ 2857 ] = ALLI + BS_Q,	--q BS
[ 2868 ] = Q,				--q 
[ 2880 ] = BS + ENG + VENDOR,
[ 2886 ] = COOK + ALLI,	--q
[ 2894 ] = COOK + VENDOR + ALLI,		--q VENDOR
[ 2924 ] = COOK + ALLI,		--q
[ 2934 ] = LW,
[ 2996 ] = TAIL,
[ 2997 ] = LW + TAIL + ALLI,	--q ALLIANCE
[ 3164 ] = ALC + HORDE,			--q HORDE
[ 3172 ] = COOK + ALLI,		--q
[ 3173 ] = COOK + ALLI,		--q
[ 3174 ] = COOK + ALLI,		--q
[ 3182 ] = LW + TAIL,
[ 3240 ] = DMF,
[ 3340 ] = ALLI,
[ 3355 ] = ALC,
[ 3356 ] = ALC + ENC + LW,
[ 3357 ] = ALC + WARRIOR,			--q WARRIOR
[ 3358 ] = ALC,
[ 3369 ] = ALC,
[ 3371 ] = ALC + ENC + VENDOR,
[ 3372 ] = ALC + ENC + VENDOR,
[ 3383 ] = LW + TAIL,
[ 3388 ] = HORDE,				-- q HORDE
[ 3389 ] = LW,
[ 3390 ] = LW,
[ 3391 ] = BS,
[ 3404 ] = COOK + Q,	--q
[ 3466 ] = BS + VENDOR,
[ 3470 ] = BS,
[ 3478 ] = BS,
[ 3482 ] = HORDE + BS_Q,			--q BS
[ 3483 ] = HORDE + BS_Q,			--q BS
[ 3486 ] = BS + DMF,
[ 3575 ] = ALC + BS + ENG + HORDE + BS_Q + WARRIOR,	--q WARRIOR BS	****
[ 3577 ] = BS + ENG + TAIL + WARLOCK,				--q WARLOCK SMELTING ****
[ 3667 ] = COOK,
[ 3685 ] = COOK,
[ 3703 ] = VENDOR + Q,			--q VENDOR
[ 3712 ] = COOK + Q,	--q
[ 3713 ] = COOK + VENDOR + Q, 	--q VENDOR
[ 3719 ] = ALLI,			--q ALLIANCE
[ 3730 ] = COOK,
[ 3731 ] = COOK,
[ 3818 ] = ALC,
[ 3819 ] = ALC + ENC,
[ 3820 ] = ALC,
[ 3821 ] = COOK + ALC,
[ 3823 ] = BS + Q,			--q
[ 3824 ] = ALC + BS + LW + TAIL,
[ 3825 ] = ALLI,					--q ALLIANCE
[ 3827 ] = TAIL + ALLI,			--q ULDAMAN
[ 3829 ] = BS + ENC + ENG + TAIL + Q,	--q
[ 3835 ] = HORDE + BS_Q + DMF,		--q BS HORDE
[ 3836 ] = HORDE + BS_Q,			--q BS HORDE
[ 3842 ] = HORDE + BS_Q,			--q BS HORDE
[ 3851 ] = HORDE + BS_Q,			--q BS
[ 3853 ] = Q,						--q BS + MARSH
[ 3855 ] = BS_Q,					--q BS
[ 3858 ] = ALC,
[ 3859 ] = BS + ENG,
[ 3860 ] = ALC + BS + ENG + BS_Q,			--q BS
[ 3864 ] = BS + ENG + LW + TAIL + BS_Q,	--q BS
[ 4096 ] = LW,
[ 4231 ] = LW,
[ 4232 ] = LW,
[ 4233 ] = LW,
[ 4234 ] = BS + ENG + LW + TAIL,
[ 4235 ] = LW,
[ 4236 ] = LW,
[ 4239 ] = ALLI + LW_Q,			--q LW ALLIANCE
[ 4243 ] = LW,
[ 4246 ] = LW,
[ 4255 ] = BS,
[ 4278 ] = ALLI,						--q ALLIANCE
[ 4289 ] = LW + VENDOR,
[ 4291 ] = LW + TAIL + VENDOR,
[ 4304 ] = BS + ENG + LW + TAIL + LW_Q,		--q LW
[ 4305 ] = LW + TAIL,
[ 4306 ] = FAID + BS + ENG + TAIL + Q,		--q
[ 4337 ] = ENG + LW + TAIL,
[ 4338 ] = FAID + BS + ENG + LW + TAIL,
[ 4339 ] = ENG + TAIL,
[ 4340 ] = LW + TAIL + VENDOR,
[ 4341 ] = TAIL + VENDOR,
[ 4342 ] = ALC + TAIL + VENDOR,
[ 4357 ] = ENG,
[ 4359 ] = ENG,
[ 4361 ] = ENG,
[ 4363 ] = ENG + DMF,
[ 4364 ] = ENG,
[ 4368 ] = ENG,
[ 4369 ] = HORDE,
[ 4371 ] = ENG + ALLI + ROGUE,		--q
[ 4375 ] = ENG + DMF,
[ 4377 ] = ENG,
[ 4382 ] = ENG,
[ 4384 ] = ENG_Q,			--q ENG
[ 4385 ] = ENG,
[ 4387 ] = ENG,
[ 4389 ] = ENG + Q,		--q
[ 4392 ] = Q,			--q ENG + DESOLACE REP?
[ 4394 ] = ENG + ENG_Q,		--q ENG
[ 4399 ] = ENG + VENDOR,
[ 4400 ] = ENG + VENDOR,
[ 4402 ] = COOK + ALC + ENG,
[ 4404 ] = ENG,
[ 4407 ] = ENG + ENG_Q,		--q ENG
[ 4457 ] = Q,
[ 4461 ] = LW,
[ 4470 ] = ENC + VENDOR,
[ 4479 ] = WARRIOR,			--q WARRIOR
[ 4480 ] = WARRIOR,			--q WARRIOR
[ 4481 ] = WARRIOR,			--q WARRIOR
[ 4536 ] = COOK + VENDOR,
[ 4582 ] = DMF,
[ 4589 ] = TAIL + HORDE,	--q HORDE
[ 4595 ] = VENDOR + Q,			--q VENDOR
[ 4603 ] = COOK,
[ 4611 ] = ENG + Q,		--q
[ 4625 ] = ALC + ENC + TAIL,
[ 4655 ] = COOK,
[ 5051 ] = COOK + HORDE,	--q HORDE
[ 5075 ] = HORDE,			--q HORDE
[ 5082 ] = LW,
[ 5116 ] = LW,
[ 5117 ] = DMF,
[ 5134 ] = DMF,
[ 5373 ] = LW,
[ 5465 ] = COOK + ALLI,	--q
[ 5466 ] = COOK,
[ 5467 ] = COOK,
[ 5468 ] = COOK,
[ 5469 ] = COOK + ALLI,	--q
[ 5470 ] = COOK,
[ 5471 ] = COOK,
[ 5498 ] = BS + LW + TAIL,
[ 5500 ] = BS + ENC + LW + TAIL,
[ 5503 ] = COOK,
[ 5504 ] = COOK,
[ 5633 ] = LW,
[ 5635 ] = ALC + BS + HORDE + BS_Q,	--q BS HORDE?
[ 5637 ] = ALC + BS + ENC + LW,
[ 5739 ] = DMF,
[ 5770 ] = WARLOCK,			--q WARLOCK
[ 5784 ] = LW,
[ 5785 ] = LW,
[ 5833 ] = Q,			--q
[ 5966 ] = BS,
[ 5997 ] = ALLI + ALC_Q,			--q ALC
[ 6037 ] = BS + ENC + ENG + TAIL + ALLI,		--q ALLIANCE BS SMELTING
[ 6040 ] = ALLI + BS_Q,			--q BS ALLIANCE
[ 6048 ] = ENC + TAIL,
[ 6214 ] = ALLI + BS_Q,			--q BS
[ 6260 ] = TAIL + VENDOR,
[ 6261 ] = TAIL + VENDOR,
[ 6289 ] = COOK,
[ 6291 ] = COOK,
[ 6303 ] = COOK,
[ 6308 ] = COOK,
[ 6317 ] = COOK,
[ 6338 ] = ENC,
[ 6358 ] = ALC,
[ 6359 ] = ALC,
[ 6361 ] = COOK,
[ 6362 ] = COOK,
[ 6370 ] = ALC + ENC,
[ 6371 ] = ALC + ENC + TAIL,
[ 6470 ] = LW,
[ 6471 ] = LW,
[ 6522 ] = COOK + ALC,
[ 6530 ] = ENG + VENDOR,
[ 6889 ] = COOK,
[ 7067 ] = ALC + BS + ENC + ENG + LW + TAIL + HORDE + SHAMAN,	--q SHAMAN
[ 7068 ] = ALC + BS + ENC + ENG + TAIL + HORDE + SHAMAN,		--q SHAMAN
[ 7069 ] = ALC + BS + ENG + TAIL + HORDE + SHAMAN,				--q SHAMAN
[ 7070 ] = ALC + BS + LW + TAIL + HORDE + SHAMAN,				--q SHAMAN
[ 7071 ] = LW + TAIL,
[ 7072 ] = TAIL,
[ 7075 ] = BS + ENC + ENG + LW + LW_Q,					--q LW
[ 7076 ] = ALC + BS + ENC + ENG + LW + TAIL,
[ 7077 ] = ALC + BS + ENC + ENG + LW + TAIL + LW_Q,	--q LW
[ 7078 ] = ALC + BS + ENC + ENG + LW + TAIL,
[ 7079 ] = ENC + ENG + LW + TAIL + LW_Q,				--q LW SILITHUS
[ 7080 ] = ALC + BS + ENC + ENG + LW + TAIL,
[ 7081 ] = BS + ENC + LW_Q,							--q LW
[ 7082 ] = ALC + ENC + ENG + LW + TAIL,
[ 7191 ] = ENG,
[ 7286 ] = LW,
[ 7287 ] = LW,
[ 7387 ] = ENG,
[ 7392 ] = ENC + LW,
[ 7428 ] = LW,
--[ 7642 ] = Q,				--q PALADIN MOUNT
[ 7909 ] = BS + ENC + ENG,
[ 7910 ] = BS + ENG + TAIL,							--q SMELTING
[ 7912 ] = BS + ENG,
[ 7922 ] = HORDE + BS_Q,			--q BS HORDE
[ 7926 ] = BS_Q,			--q BS ALLIANCE?
[ 7927 ] = BS_Q,			--q BS
[ 7928 ] = BS_Q,			--q BS
[ 7930 ] = BS_Q,			--q BS
[ 7931 ] = BS_Q,			--q BS
[ 7933 ] = BS_Q,			--q BS ALLIANCE
[ 7935 ] = BS_Q,			--q BS
[ 7936 ] = BS_Q,			--q BS
[ 7937 ] = BS_Q,			--q BS
[ 7941 ] = BS_Q,			--q BS
[ 7945 ] = BS_Q + DMF,		--q BS
[ 7956 ] = HORDE + BS_Q,			--q BS HORDE
[ 7957 ] = HORDE + BS_Q,			--q BS HORDE
[ 7958 ] = HORDE + BS_Q,			--q BS HORDE
[ 7963 ] = HORDE + BS_Q,			--q BS HORDE
[ 7966 ] = BS,
[ 7971 ] = BS + ENC + LW + TAIL,
[ 7972 ] = ALC + BS + ENC + ENG + TAIL + PRIEST,			--q PRIEST
[ 7974 ] = COOK + COOK_Q,	--q
[ 8146 ] = BS + LW,
[ 8150 ] = COOK + ENG + LW,	--q ?? AQ MALLET QUEST?
[ 8151 ] = ENG + LW,
[ 8152 ] = LW,
[ 8153 ] = ALC + BS + ENC + ENG + LW + TAIL + LW_Q,	--q LW
[ 8154 ] = LW,
[ 8165 ] = LW + LW_Q,	--q LW
[ 8167 ] = LW,
[ 8168 ] = BS + LW,
[ 8169 ] = LW,
[ 8170 ] = BS + ENC + ENG + LW + TAIL + Q,
[ 8171 ] = LW,
[ 8172 ] = LW,
[ 8173 ] = LW_Q,		--q LW
[ 8175 ] = LW_Q,		--q LW
[ 8176 ] = LW_Q,		--q LW
[ 8185 ] = DMF,
[ 8187 ] = LW_Q,		--q LW
[ 8189 ] = LW_Q,		--q LW
[ 8191 ] = LW_Q,		--q LW
[ 8193 ] = LW_Q,		--q LW
[ 8197 ] = LW_Q,		--q LW
[ 8198 ] = LW_Q,		--q LW
[ 8203 ] = LW_Q,		--q LW
[ 8204 ] = LW_Q,		--q LW
[ 8211 ] = LW_Q,		--q LW
[ 8214 ] = LW_Q,		--q LW
[ 8244 ] = Q,
[ 8343 ] = LW + TAIL + VENDOR,
[ 8365 ] = COOK,
[ 8368 ] = LW,
[ 8391 ] = Q,
[ 8392 ] = Q,
[ 8393 ] = Q,
[ 8394 ] = Q,
[ 8396 ] = Q,
[ 8411 ] = Q,
[ 8424 ] = Q,
[ 8483 ] = Q,
[ 8831 ] = ALC + ENC + TAIL,
[ 8836 ] = ALC + PALADIN,
[ 8838 ] = ALC + ENC,
[ 8839 ] = ALC,
[ 8845 ] = ALC,
[ 8846 ] = ALC + Q,		--q BRD
[ 8925 ] = ALC + ENC + VENDOR,
[ 8932 ] = VENDOR + COOK_Q,		--q VENDOR
[ 8949 ] = LW,
[ 8951 ] = LW,
[ 9060 ] = ENG,
[ 9061 ] = COOK + ENG,	--q AQ / SILITHUS
[ 9224 ] = ENC,
[ 9260 ] = ALC,
[ 9262 ] = ALC,
[ 9259 ] = ALLI,			--q ALLIANCE
[ 9264 ] = WARLOCK,			--q WARLOCK MOUNT
[ 9308 ] = Q,			--q ALLIANCE
[ 9313 ] = DMF,
[ 10026 ] = ENG,
[ 10285 ] = ENG + TAIL,
[ 10286 ] = ALC + ENG + TAIL,
[ 10290 ] = TAIL + VENDOR,
[ 10450 ] = Q,
[ 10500 ] = ENG,
[ 10502 ] = ENG,
[ 10505 ] = ENG,
[ 10507 ] = ENG + ENG_Q,	--q ENG
[ 10543 ] = ENG,
[ 10546 ] = ENG,
[ 10558 ] = ENG,
[ 10559 ] = ENG + ENG_Q,	--q ENG
[ 10560 ] = ENG + Q,	--q
[ 10561 ] = ENG + Q,	--q
[ 10562 ] = Q,
[ 10576 ] = ENG,
[ 10577 ] = ENG,
[ 10586 ] = ENG,
[ 10592 ] = ENG,
[ 10593 ] = Q,
[ 10620 ] = ALC,
[ 10647 ] = ENG + VENDOR,
[ 10648 ] = ENG + VENDOR,
[ 10938 ] = ENC,
[ 10939 ] = ENC,
[ 10940 ] = ENC,
[ 10978 ] = ENC,
[ 10998 ] = ENC,
[ 11018 ] = Q,			--q
[ 11040 ] = TAIL + Q,	--q
[ 11082 ] = ENC,
[ 11083 ] = ENC,
[ 11084 ] = ENC,
[ 11128 ] = ENC + Q,
[ 11134 ] = ENC,
[ 11135 ] = ENC,
[ 11137 ] = ENC + TAIL,
[ 11138 ] = ENC,
[ 11139 ] = ENC,
[ 11144 ] = ENC,
[ 11174 ] = ENC + Q,		--q FELWOOD SALVE
[ 11175 ] = ENC,
[ 11176 ] = ALC + ENC + TAIL,
[ 11177 ] = ENC,
[ 11178 ] = ENC,
[ 11184 ] = BS + Q,		--q
[ 11185 ] = BS + Q,		--q
[ 11186 ] = BS + Q,		--q
[ 11188 ] = BS + Q,		--q
[ 11291 ] = ENC + VENDOR,
[ 11315 ] = Q,			--q BOP?
[ 11370 ] = WARLOCK,	-- MOUNT QUEST
[ 11371 ] = BS + ENG,
[ 11382 ] = BS + ENC,
[ 11404 ] = DMF,
[ 11407 ] = DMF,
[ 11477 ] = HORDE,			--q HORDE
[ 11516 ] = Q,
[ 11563 ] = Q,
[ 11564 ] = Q,
[ 11567 ] = Q,
[ 11590 ] = DMF,
[ 11732 ] = Q,				-- q LIBRAM
[ 11733 ] = Q,				-- q LIBRAM
[ 11734 ] = Q,				-- q LIBRAM
[ 11736 ] = Q,				-- q LIBRAM
[ 11737 ] = Q,				-- q LIBRAM
[ 11751 ] = Q,
[ 11752 ] = Q,
[ 11753 ] = Q,
[ 11754 ] = BS + ENC + LW + Q,		-- q LIBRAM
[ 11951 ] = Q,
[ 11952 ] = Q,
[ 12037 ] = COOK,
[ 12184 ] = COOK,
[ 12202 ] = COOK,
[ 12203 ] = COOK,
[ 12204 ] = COOK,
[ 12205 ] = COOK,
[ 12206 ] = COOK,
[ 12207 ] = COOK + COOK_Q,	--q
[ 12208 ] = COOK,
[ 12223 ] = COOK,
[ 12238 ] = ALLI,			--q ALLIANCE
[ 12359 ] = ALC + BS + ENC + ENG + Q,  --q  BS
[ 12360 ] = BS + ENG + TAIL + PALADIN + WARLOCK,			--q MOUNT QUESTS (AQ QUEST)
[ 12361 ] = BS + ENG,
[ 12363 ] = ALC,
[ 12364 ] = BS + ENG + TAIL,
[ 12365 ] = BS + ENG,
[ 12431 ] = Q,			--q NO EXP
[ 12432 ] = Q,			--q NO EXP
[ 12433 ] = Q,			--q NO EXP
[ 12434 ] = Q,			--q NO EXP
[ 12435 ] = Q,			--q NO EXP
[ 12436 ] = Q,			--q NO EXP
[ 12607 ] = LW,
[ 12644 ] = BS + DMF,
[ 12655 ] = BS + ENG,
[ 12662 ] = BS + TAIL,
[ 12735 ] = Q,
[ 12753 ] = BS + LW + Q,
[ 12799 ] = BS + ENG,
[ 12800 ] = BS + ENG + TAIL + PALADIN + SHAMAN,		--q SHAMAN PALADIN MOUNT? AQ
[ 12803 ] = ALC + BS + ENC + ENG + LW + TAIL,
[ 12804 ] = BS + ENG + LW + TAIL,
[ 12808 ] = ALC + BS + ENC + ENG + TAIL,
[ 12809 ] = BS + ENC + LW + TAIL,
[ 12810 ] = BS + ENG + LW + TAIL,
[ 12811 ] = BS + ENC + TAIL,
[ 12938 ] = Q,
--[ 13365 ] = BS + ENG,		-- TYPO SOMETHING IS MISSING
[ 13180 ] = Q,		-- ALSO PALADIN MOUNT QUEST
[ 13422 ] = ALC,
[ 13423 ] = ALC,
[ 13463 ] = ALC,
[ 13464 ] = ALC,
[ 13465 ] = ALC,
[ 13466 ] = ALC,
[ 13467 ] = ALC + ENC + ENG,
[ 13468 ] = ALC + ENC + TAIL,
[ 13510 ] = BS,
[ 13512 ] = BS,			-- q ?? RAID QUEST
[ 13545 ] = HORDE,			--q HORDE
[ 13546 ] = HORDE,			--q HORDE
[ 13754 ] = COOK,
[ 13755 ] = COOK,
[ 13756 ] = COOK,
[ 13758 ] = COOK,
[ 13759 ] = COOK,
[ 13760 ] = COOK,
[ 13888 ] = COOK,
[ 13889 ] = COOK,
[ 13893 ] = COOK,
[ 13926 ] = ENC + TAIL,
[ 14044 ] = LW,
[ 14047 ] = FAID + BS + ENG + LW + TAIL + PALADIN,	-- REP QUESTS & PALADIN MOUNT
[ 14048 ] = LW + TAIL + Q,
[ 14227 ] = ENG + LW + TAIL,
[ 14256 ] = LW + TAIL + WARLOCK,		--q WARLOCK
[ 14341 ] = LW + TAIL + VENDOR + Q,
[ 14342 ] = LW + TAIL,
[ 14343 ] = ENC,
[ 14344 ] = ENC + TAIL + Q,	--WARLOCK,		-- WARLOCK MOUNT, DM LIBRAM
[ 15407 ] = ENG + LW,
[ 15408 ] = LW,
[ 15409 ] = LW,
[ 15410 ] = LW,
[ 15412 ] = LW,
[ 15414 ] = LW,
[ 15415 ] = LW,
[ 15416 ] = LW + WARLOCK,		--q WARLOCK MOUNT
[ 15417 ] = BS + LW,
[ 15419 ] = LW,
[ 15420 ] = LW,
[ 15422 ] = LW,
[ 15423 ] = LW,
[ 15564 ] = DMF,
[ 15992 ] = ENG,
[ 15994 ] = ENG + Q + DMF,
[ 16000 ] = ENG,
[ 16006 ] = ENG,
[ 16202 ] = ENC,
[ 16203 ] = ENC + TAIL,
[ 16204 ] = ENC,
[ 16206 ] = ENC,
[ 16885 ] = ROGUE,		--q ROGUE
[ 17010 ] = BS + ENG + LW + TAIL,
[ 17011 ] = BS + ENG + LW + TAIL,
[ 17012 ] = BS + LW + TAIL,
[ 17034 ] = ENC + VENDOR,
[ 17035 ] = ENC + VENDOR,
[ 17194 ] = COOK + VENDOR,
[ 17202 ] = ENG + VENDOR,
[ 17203 ] = BS,		--q BS
[ 18240 ] = LW + TAIL + Q,
[ 18255 ] = COOK,
[ 18256 ] = ALC + ENC + VENDOR,
[ 18332 ] = Q,
[ 18333 ] = Q,
[ 18334 ] = Q,
[ 18335 ] = Q,	--SHAMAN + PALADIN,		--q LIBRAM SHAMAN PALADIN(MOUNT)
[ 18512 ] = ENC + LW,
[ 18631 ] = ENG,
[ 19441 ] = FAID,
[ 19726 ] = BS + ENG + LW + TAIL,
[ 19767 ] = LW,
[ 19768 ] = LW,
[ 19774 ] = BS + ENG,
[ 19933 ] = DMF,
[ 20381 ] = LW,
[ 20424 ] = COOK,
[ 20498 ] = LW,
[ 20500 ] = LW,
[ 20501 ] = LW,
[ 20520 ] = BS + TAIL,
[ 20725 ] = BS + ENC,
[ 21024 ] = COOK,	--q	AQ MALLET?
[ 21071 ] = COOK,
[ 21153 ] = COOK,
[ 22202 ] = BS,
[ 22682 ] = BS + LW + TAIL
}

local frame = CreateFrame( "Frame" )
local previousItemID = -1
local itemIcons = ""
local iconSize

local ITEM_VENDOR_FLAG = ItemProfConstants_VENDOR_ITEM_FLAG
local ITEM_DMF_FLAG = ItemProfConstants_DMF_ITEM_FLAG
local ITEM_PROF_FLAGS = ItemProfConstants_ITEM_PROF_FLAGS
local QUEST_FLAG = ItemProfConstants_QUEST_FLAG
local NUM_PROFS_TRACKED = ItemProfConstants_NUM_PROF_FLAGS
local PROF_TEXTURES = ItemProfConstants_PROF_TEXTURES

local showProfs
local showQuests
local profFilter
local questFilter
local includeVendor
local showDMF

ItemProfConstants_configTooltipIconsRealm = GetRealmName()
ItemProfConstants_configTooltipIconsChar = UnitName( "player" )

local function CreateItemIcons( itemFlags )
	if not includeVendor then
		-- Return if the item has the vendor flag
		local isVendor = bit.band( itemFlags, ITEM_VENDOR_FLAG )
		if isVendor ~= 0 then
			return nil
		end
	end
	local t = {}
	if showProfs then
		local enabledFlags = bit.band( itemFlags, profFilter )
		for i=0, NUM_PROFS_TRACKED-1 do
			local bitMask = bit.lshift( 1, i )
			local isSet = bit.band( enabledFlags, bitMask )
			if isSet ~= 0 then
				t[ #t+1 ] = "|T"
				t[ #t+1 ] = PROF_TEXTURES[ bitMask ]
				t[ #t+1 ] = ":"
				t[ #t+1 ] = iconSize
				t[ #t+1 ] = "|t "
			end
		end
	end
	
	if showDMF then
	
		local isTicketItem = bit.band( itemFlags, ITEM_DMF_FLAG )
		if isTicketItem ~= 0 then
			t[ #t+1 ] = "|T"
			t[ #t+1 ] = PROF_TEXTURES[ ITEM_DMF_FLAG ]
			t[ #t+1 ] = ":"
			t[ #t+1 ] = iconSize
			t[ #t+1 ] = "|t "
		end
	end
	
	if showQuests then
		-- Quest filter flags start at 0x200, shift to bit 0 will align with config filter
		local questFlags = bit.rshift( itemFlags, 9 )
		local isSet = bit.band( questFlags, questFilter )
		
		-- Check if the quest is faction exclusive
		local isFactionQuest = bit.band( questFlags, 0x06 )
		if isFactionQuest ~= 0 then
			-- Ignore the quest if the configuration isnt tracking this faction
			local isFactionEnabled = bit.band( isFactionQuest, questFilter )
			local showFaction = bit.band( isFactionQuest, isFactionEnabled )
			if showFaction == 0 then
				isSet = 0
			end
			
			-- Both flags must be set if the faction quest was for a specific class/profession
			if isSet < 0x08 and questFlags >= 0x08 then
				isSet = 0
			end
		end
		
		if isSet ~= 0 then
			t[ #t+1 ] = "|T"
			t[ #t+1 ] = PROF_TEXTURES[ QUEST_FLAG ]
			t[ #t+1 ] = ":"
			t[ #t+1 ] = iconSize
			t[ #t+1 ] = "|t "
		end
	end

	return table.concat( t )
end


local function ModifyItemTooltip( tt ) 
		
	local itemName, itemLink = tt:GetItem() 
	if not itemName then return end
	local itemID = select( 1, GetItemInfoInstant( itemName ) )
	
	if itemID == nil then
		-- Extract ID from link: GetItemInfoInstant unreliable with AH items (uncached on client?)
		itemID = tonumber( string.match( itemLink, "item:?(%d+):" ) )
		if itemID == nil then
			-- The item link doesn't contain the item ID field
			return
		end
	end
	
	-- Reuse the texture state if the item hasn't changed
	if previousItemID == itemID then
		tt:AddLine( itemIcons )
		return
	end
	
	-- Check if the item is a profession reagent
	local itemFlags = ITEM_PROF_FLAGS[ itemID ]
	if itemFlags == nil then
		-- Don't modify the tooltip
		return
	end
	
	-- Convert the flags into texture icons
	previousItemID = itemID
	itemIcons = CreateItemIcons( itemFlags )
	
	tt:AddLine( itemIcons )
end


function ItemProfConstants:ConfigChanged()

	showProfs = ShiGuangDB[ ItemProfConstants_configTooltipIconsRealm ][ ItemProfConstants_configTooltipIconsChar ].showProfs
	showQuests = ShiGuangDB[ ItemProfConstants_configTooltipIconsRealm ][ ItemProfConstants_configTooltipIconsChar ].showQuests
	profFilter = ShiGuangDB[ ItemProfConstants_configTooltipIconsRealm ][ ItemProfConstants_configTooltipIconsChar ].profFlags
	questFilter = ShiGuangDB[ ItemProfConstants_configTooltipIconsRealm ][ ItemProfConstants_configTooltipIconsChar ].questFlags
	includeVendor = ShiGuangDB[ ItemProfConstants_configTooltipIconsRealm ][ ItemProfConstants_configTooltipIconsChar ].includeVendor
	iconSize = ShiGuangDB[ ItemProfConstants_configTooltipIconsRealm ][ ItemProfConstants_configTooltipIconsChar ].iconSize
	showDMF = ShiGuangDB[ ItemProfConstants_configTooltipIconsRealm ][ ItemProfConstants_configTooltipIconsChar ].showDMF
	
	previousItemID = -1		-- Reset line
end

local function InitFrame()
	GameTooltip:HookScript("OnTooltipSetItem", ModifyItemTooltip )
	--ItemRefTooltip:HookScript( "OnTooltipSetItem", ModifyItemTooltip )
end
InitFrame()

local frame = CreateFrame( "Frame" )
frame.name = ITEMTOOLTIPPROFESSION_TITLE
local NUM_PROFS_TRACKED = ItemProfConstants_NUM_PROF_FLAGS

local profsCheck
local questCheck
local vendorCheck
local dmfCheck
local classQuestLabel
local profQuestLabel
local iconSizeSlider
local iconSizeLabel
local iconDemoTexture

local PROF_CHECK = {}
local QUEST_CHECK = {}

local configDefaultShowProfs = true
local configDefaultShowQuests = true
local configDefaultProfFlags = 0xFF
local configDefaultQuestFlags = 0xFFFFF
local configDefaultIncludeVendor = false
local configDefaultIconSize = 16
local configDefaultShowDMF = true

local userVariables



local function SaveAndQuit() 

	local profFlags = 0
	-- Ignore the profession flags if master profession checkbox is unchecked
	for i=0, NUM_PROFS_TRACKED-1 do
		local bitMask = bit.lshift( 1, i )
		local isChecked = PROF_CHECK[ bitMask ]:GetChecked()
		if isChecked then
			profFlags = profFlags + bitMask
		end
	end
	
	local questFlags = 1		-- Normal quests flag
	for i=1, 19 do
		local bitMask = bit.lshift( 1, i )
		local isChecked = QUEST_CHECK[ bitMask ]:GetChecked()
		if isChecked then
			questFlags = questFlags + bitMask
		end
	end
	
	
	userVariables.showProfs = profsCheck:GetChecked()
	userVariables.showQuests = questCheck:GetChecked()
	userVariables.profFlags = profFlags
	userVariables.questFlags = questFlags
	userVariables.includeVendor = vendorCheck:GetChecked()
	userVariables.iconSize = iconSizeSlider:GetValue()
	userVariables.showDMF = dmfCheck:GetChecked()

	ItemProfConstants:ConfigChanged()
end



local function ToggleProfCheckbox() 

	local isChecked = profsCheck:GetChecked()
	-- How do I call as a stored function CheckButton:Enable()?
	for k,v in pairs( PROF_CHECK ) do
		if isChecked then
			v:Enable()
		else
			v:Disable()
		end
	end
	
end


local function ToggleQuestCheckbox() 

	local isChecked = questCheck:GetChecked()
	if isChecked then
		for k,v in pairs( QUEST_CHECK ) do
			v:Enable()
		end
	else
		for k,v in pairs( QUEST_CHECK ) do
			v:Disable()
		end
	end
	
end


local function RefreshWidgets()

	-- Sync the widgets state with the config variables
	profsCheck:SetChecked( userVariables.showProfs )
	questCheck:SetChecked( userVariables.showQuests )
	vendorCheck:SetChecked( userVariables.includeVendor )
	dmfCheck:SetChecked( userVariables.showDMF )
	local profFlags = userVariables.profFlags
	local questFlags = userVariables.questFlags
	iconSizeSlider:SetValue( userVariables.iconSize )
	
	-- Update the profession checkboxes
	for i=0, NUM_PROFS_TRACKED-1 do
		local bitMask = bit.lshift( 1, i )
		local isSet = bit.band( profFlags, bitMask )
		PROF_CHECK[ bitMask ]:SetChecked( isSet ~= 0 )
	end

	-- Update the quest checkboxes
	for i=1, 19 do
		local bitMask = bit.lshift( 1, i )
		local isSet = bit.band( questFlags, bitMask )
		QUEST_CHECK[ bitMask ]:SetChecked( isSet ~= 0 )
	end
	
	-- Set checkboxes enabled/disabled
	ToggleProfCheckbox()
	ToggleQuestCheckbox()
end


local function IconSizeChanged( self, value ) 

	-- Called when the icon slider widget changes value
	iconDemoTexture:SetSize( value, value )
	iconSizeLabel:SetText( value )
end


local function InitVariables()
	
	local configRealm = ItemProfConstants_configTooltipIconsRealm
	local configChar = ItemProfConstants_configTooltipIconsChar

	if not ShiGuangDB[ configRealm ] then
		ShiGuangDB[ configRealm ] = {}
	end
	
	if not ShiGuangDB[ configRealm ][ configChar ] then
		ShiGuangDB[ configRealm ][ configChar ] = {}
	end
	
	userVariables = ShiGuangDB[ configRealm ][ configChar ]
	
	if userVariables.showProfs == nil then
		userVariables.showProfs = configDefaultShowProfs
	end
	
	if userVariables.showQuests == nil then
		userVariables.showQuests = configDefaultShowQuests
	end
	
	if userVariables.profFlags == nil then
		userVariables.profFlags = configDefaultProfFlags
	end
	
	if userVariables.questFlags == nil then
		userVariables.questFlags = configDefaultQuestFlags
	end
	
	if userVariables.includeVendor == nil then
		userVariables.includeVendor = configDefaultIncludeVendor
	end
	
	if userVariables.iconSize == nil then
		userVariables.iconSize = configDefaultIconSize
	end
	
	if userVariables.showDMF == nil then
		userVariables.showDMF = configDefaultShowDMF
	end
	
	
	RefreshWidgets()
	ItemProfConstants:ConfigChanged()
end


local function CreateCheckbox( name, x, y, label, tooltip )

	local check = CreateFrame( "CheckButton", name, frame, "ChatConfigCheckButtonTemplate" ) --"OptionsCheckButtonTemplate" )
	_G[ name .. "Text" ]:SetText( label )
	check.tooltip = tooltip
	check:SetPoint( "TOPLEFT", x, y )

	return check
end


local function CreateProfessionWidgets() 

	profsCheck = CreateCheckbox( "ItemTooltipIconsConfigCheck0", 20, -50, " Enable Profession Icons", "If enabled profession icons will be displayed on items that are crafting materials" )
	profsCheck:SetScript( "OnClick", ToggleProfCheckbox )

	PROF_CHECK[ 1 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck0a", 45, -70, " Cooking", nil )
	PROF_CHECK[ 2 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck0b", 45, -90, " First Aid", nil )
	PROF_CHECK[ 4 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck0c", 45, -110, " Alchemy", nil )
	PROF_CHECK[ 8 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck0d", 45, -130, " Blacksmithing", nil )
	PROF_CHECK[ 16 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck0e", 245, -70, " Enchanting", nil )
	PROF_CHECK[ 32 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck0f", 245, -90, " Engineering", nil )
	PROF_CHECK[ 64 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck0g", 245, -110, " Leatherworking", nil )
	PROF_CHECK[ 128 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck0h", 245, -130, " Tailoring", nil )
end

local function CreateQuestWidgets() 
	
	questCheck = CreateCheckbox( "ItemTooltipIconsConfigCheck1", 20, -180, " Enable Quest Icons", "If enabled quest icons will be displayed on items that are needed by quests" )
	questCheck:SetScript( "OnClick", ToggleQuestCheckbox )

	QUEST_CHECK[ 0x00002 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1b", 45, -200, " Alliance", nil )
	QUEST_CHECK[ 0x00004 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1c", 45, -220, " Horde", nil )


	classQuestLabel = frame:CreateFontString( "ClassQuestLabel", "OVERLAY", "GameTooltipText" )
	classQuestLabel:SetFont( "Fonts\\FRIZQT__.TTF", 14, "THINOUTLINE" )
	classQuestLabel:SetPoint( "TOPLEFT", 45, -255 )
	classQuestLabel:SetTextColor( 1, 0.85, 0.15 )
	classQuestLabel:SetText( "Class Quests" )

	QUEST_CHECK[ 0x00008 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1d1", 45, -270, " Druid", nil )
	QUEST_CHECK[ 0x00010 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1d2", 45, -290, " Hunter", nil )
	QUEST_CHECK[ 0x00020 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1d3", 45, -310, " Mage", nil )
	QUEST_CHECK[ 0x00040 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1d4", 245, -270, " Paladin", nil )
	QUEST_CHECK[ 0x00080 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1d5", 245, -290, " Priest", nil )
	QUEST_CHECK[ 0x00100 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1d6", 245, -310, " Rogue", nil )
	QUEST_CHECK[ 0x00200 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1d7", 445, -270, " Shaman", nil )
	QUEST_CHECK[ 0x00400 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1d8", 445, -290, " Warlock", nil )
	QUEST_CHECK[ 0x00800 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1d9", 445, -310, " Warrior", nil )



	profQuestLabel = frame:CreateFontString( "ProfQuestLabel", "OVERLAY", "GameTooltipText" )
	profQuestLabel:SetFont( "Fonts\\FRIZQT__.TTF", 14, "THINOUTLINE" )
	profQuestLabel:SetPoint( "TOPLEFT", 45, -345 )
	profQuestLabel:SetTextColor( 1, 0.85, 0.15 )
	profQuestLabel:SetText( "Profession Quests" )

	QUEST_CHECK[ 0x01000 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1e1", 45, -360, " Cooking", nil )
	QUEST_CHECK[ 0x02000 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1e2", 45, -380, " First Aid", nil )
	QUEST_CHECK[ 0x04000 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1e3", 45, -400, " Alchemy", nil )
	QUEST_CHECK[ 0x08000 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1e4", 45, -420, " Blacksmithing", nil )
	QUEST_CHECK[ 0x10000 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1e5", 245, -360, " Enchanting", nil )
	QUEST_CHECK[ 0x20000 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1e6", 245, -380, " Engineering", nil )
	QUEST_CHECK[ 0x40000 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1e7", 245, -400, " Leatherworking", nil )
	QUEST_CHECK[ 0x80000 ] = CreateCheckbox( "ItemTooltipIconsConfigCheck1e8", 245, -420, " Tailoring", nil )
end

local function CreateIconResizeWidgets()

	iconSizeSlider = CreateFrame( "Slider", "ItemTooltipIconsConfigSlider0", frame, "OptionsSliderTemplate" )
	iconSizeSlider:SetPoint( "TOPLEFT", 20, -540 )
	iconSizeSlider:SetMinMaxValues( 8, 32 )
	iconSizeSlider:SetValueStep( 1 )
	iconSizeSlider:SetStepsPerPage( 1 )
	iconSizeSlider:SetWidth( 200 )
	iconSizeSlider:SetObeyStepOnDrag( true )
	iconSizeSlider:SetScript( "OnValueChanged", IconSizeChanged )
	_G[ "ItemTooltipIconsConfigSlider0Text" ]:SetText( "Icon Size" )
	_G[ "ItemTooltipIconsConfigSlider0Low" ]:SetText( nil )
	_G[ "ItemTooltipIconsConfigSlider0High" ]:SetText( nil )

	iconSizeLabel = frame:CreateFontString( nil, "OVERLAY", "GameTooltipText" )
	iconSizeLabel:SetFont( "Fonts\\FRIZQT__.TTF", 12, "THINOUTLINE" )
	iconSizeLabel:SetPoint( "TOPLEFT", 225, -542 )

	iconDemoTexture = frame:CreateTexture( nil, "OVERLAY" )
	iconDemoTexture:SetPoint( "TOPLEFT", 300, -540 )
	iconDemoTexture:SetTexture( GetSpellTexture( 4036 ) )
end


local dialogHeader = frame:CreateFontString( nil, "OVERLAY", "GameTooltipText" )
dialogHeader:SetFont( "Fonts\\FRIZQT__.TTF", 10, "THINOUTLINE" )
dialogHeader:SetPoint( "TOPLEFT", 20, -20 )
dialogHeader:SetText( "These options allow you control which icons are displayed on the item tooltips.\nThe quest icon can be filtered to display on items needed for quests of specific class/profession." )


CreateProfessionWidgets()
CreateQuestWidgets()
vendorCheck = CreateCheckbox( "ItemTooltipIconsConfigCheck2", 20, -470, " Vendor Items", "Display icons on items sold by vendors" )
dmfCheck = CreateCheckbox( "ItemTooltipIconsConfigCheck3", 20, -490, " Darkmoon Faire Ticket Items", "Display a ticket icon if the item can be exchanged for Darkmoon Faire tickets" )
CreateIconResizeWidgets()



frame.okay = SaveAndQuit
frame:SetScript( "OnShow", RefreshWidgets )
frame:SetScript( "OnEvent", InitVariables )
frame:RegisterEvent( "VARIABLES_LOADED" )


InterfaceOptions_AddCategory( frame )