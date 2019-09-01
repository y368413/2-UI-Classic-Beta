local _, ns = ...
local M, R, U, I = unpack(ns)
--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
----------------------------------------------------------------------------]]--
local AzeritePowerWeights = {}

-- Powers for every Class and Spec
local sourceData = {
	["center"] = {
		["spellID"] = 263978,
		["icon"] = 2065624,
		["name"] = "Azerite Empowered",
		["azeritePowerID"] = 13,
	},
	["class"] = {
		{
			[73] = {
				{
					["spellID"] = 272824,
					["icon"] = 136105,
					["name"] = "Deafening Crash",
					["azeritePowerID"] = 118,
				}, -- [1]
				{
					["spellID"] = 279172,
					["icon"] = 1377132,
					["name"] = "Bloodsport",
					["azeritePowerID"] = 177,
				}, -- [2]
				{
					["spellID"] = 287377,
					["icon"] = 254108,
					["name"] = "Bastion of Might",
					["azeritePowerID"] = 237,
				}, -- [3]
				{
					["spellID"] = 278760,
					["icon"] = 132353,
					["name"] = "Callous Reprisal",
					["azeritePowerID"] = 440,
				}, -- [4]
				{
					["spellID"] = 278765,
					["icon"] = 942783,
					["name"] = "Iron Fortress",
					["azeritePowerID"] = 441,
				}, -- [5]
				{
					["spellID"] = 277636,
					["icon"] = 134951,
					["name"] = "Brace for Impact",
					["azeritePowerID"] = 450,
				}, -- [6]
			},
			[71] = {
				{
					["spellID"] = 288452,
					["icon"] = 236317,
					["name"] = "Striking the Anvil",
					["azeritePowerID"] = 121,
				}, -- [1]
				{
					["spellID"] = 273409,
					["icon"] = 236303,
					["name"] = "Gathering Storm",
					["azeritePowerID"] = 174,
				}, -- [2]
				{
					["spellID"] = 275529,
					["icon"] = 236314,
					["name"] = "Test of Might",
					["azeritePowerID"] = 226,
				}, -- [3]
				{
					["spellID"] = 277639,
					["icon"] = 132223,
					["name"] = "Seismic Wave",
					["azeritePowerID"] = 433,
				}, -- [4]
				{
					["spellID"] = 278751,
					["icon"] = 132340,
					["name"] = "Crushing Assault",
					["azeritePowerID"] = 434,
				}, -- [5]
				{
					["spellID"] = 278752,
					["icon"] = 464973,
					["name"] = "Lord of War",
					["azeritePowerID"] = 435,
				}, -- [6]
			},
			[72] = {
				{
					["spellID"] = 288056,
					["icon"] = 132344,
					["name"] = "Unbridled Ferocity",
					["azeritePowerID"] = 119,
				}, -- [1]
				{
					["spellID"] = 273409,
					["icon"] = 236303,
					["name"] = "Gathering Storm",
					["azeritePowerID"] = 174,
				}, -- [2]
				{
					["spellID"] = 288080,
					["icon"] = 236276,
					["name"] = "Cold Steel, Hot Blood",
					["azeritePowerID"] = 176,
				}, -- [3]
				{
					["spellID"] = 275632,
					["icon"] = 132352,
					["name"] = "Pulverizing Blows",
					["azeritePowerID"] = 229,
				}, -- [4]
				{
					["spellID"] = 278757,
					["icon"] = 136110,
					["name"] = "Simmering Rage",
					["azeritePowerID"] = 437,
				}, -- [5]
				{
					["spellID"] = 278758,
					["icon"] = 132147,
					["name"] = "Reckless Flurry",
					["azeritePowerID"] = 438,
				}, -- [6]
				{
					["spellID"] = 277638,
					["icon"] = 458972,
					["name"] = "Infinite Fury",
					["azeritePowerID"] = 451,
				}, -- [7]
			},
		}, -- [1]
		{
			[70] = {
				{
					["spellID"] = 272898,
					["icon"] = 135875,
					["name"] = "Avenger's Might",
					["azeritePowerID"] = 125,
				}, -- [1]
				{
					["spellID"] = 278617,
					["icon"] = 135897,
					["name"] = "Relentless Inquisitor",
					["azeritePowerID"] = 154,
				}, -- [2]
				{
					["spellID"] = 273473,
					["icon"] = 1360757,
					["name"] = "Expurgation",
					["azeritePowerID"] = 187,
				}, -- [3]
				{
					["spellID"] = 275496,
					["icon"] = 135959,
					["name"] = "Indomitable Justice",
					["azeritePowerID"] = 235,
				}, -- [4]
				{
					["spellID"] = 278593,
					["icon"] = 135917,
					["name"] = "Grace of the Justicar",
					["azeritePowerID"] = 393,
				}, -- [5]
				{
					["spellID"] = 286229,
					["icon"] = 135878,
					["name"] = "Light's Decree",
					["azeritePowerID"] = 396,
				}, -- [6]
				{
					["spellID"] = 286390,
					["icon"] = 236263,
					["name"] = "Empyrean Power",
					["azeritePowerID"] = 453,
				}, -- [7]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [8]
			},
			[65] = {
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [1]
				{
					["spellID"] = 272898,
					["icon"] = 135875,
					["name"] = "Avenger's Might",
					["azeritePowerID"] = 125,
				}, -- [2]
				{
					["spellID"] = 287268,
					["icon"] = 1360764,
					["name"] = "Glimmer of Light",
					["azeritePowerID"] = 139,
				}, -- [3]
				{
					["spellID"] = 273513,
					["icon"] = 135907,
					["name"] = "Moment of Compassion",
					["azeritePowerID"] = 188,
				}, -- [4]
				{
					["spellID"] = 275463,
					["icon"] = 236254,
					["name"] = "Divine Revelations",
					["azeritePowerID"] = 233,
				}, -- [5]
				{
					["spellID"] = 275496,
					["icon"] = 135959,
					["name"] = "Indomitable Justice",
					["azeritePowerID"] = 235,
				}, -- [6]
				{
					["spellID"] = 278593,
					["icon"] = 135917,
					["name"] = "Grace of the Justicar",
					["azeritePowerID"] = 393,
				}, -- [7]
				{
					["spellID"] = 278594,
					["icon"] = 461859,
					["name"] = "Breaking Dawn",
					["azeritePowerID"] = 394,
				}, -- [8]
				{
					["spellID"] = 277674,
					["icon"] = 135972,
					["name"] = "Radiant Incandescence",
					["azeritePowerID"] = 452,
				}, -- [9]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [10]
			},
			[66] = {
				{
					["spellID"] = 272898,
					["icon"] = 135875,
					["name"] = "Avenger's Might",
					["azeritePowerID"] = 125,
				}, -- [1]
				{
					["spellID"] = 272976,
					["icon"] = 135943,
					["name"] = "Bulwark of Light",
					["azeritePowerID"] = 133,
				}, -- [2]
				{
					["spellID"] = 278605,
					["icon"] = 135874,
					["name"] = "Soaring Shield",
					["azeritePowerID"] = 150,
				}, -- [3]
				{
					["spellID"] = 287126,
					["icon"] = 135981,
					["name"] = "Righteous Conviction",
					["azeritePowerID"] = 189,
				}, -- [4]
				{
					["spellID"] = 275477,
					["icon"] = 236265,
					["name"] = "Inner Light",
					["azeritePowerID"] = 234,
				}, -- [5]
				{
					["spellID"] = 275496,
					["icon"] = 135959,
					["name"] = "Indomitable Justice",
					["azeritePowerID"] = 235,
				}, -- [6]
				{
					["spellID"] = 278593,
					["icon"] = 135917,
					["name"] = "Grace of the Justicar",
					["azeritePowerID"] = 393,
				}, -- [7]
				{
					["spellID"] = 278609,
					["icon"] = 133176,
					["name"] = "Inspiring Vanguard",
					["azeritePowerID"] = 395,
				}, -- [8]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [9]
			},
		}, -- [2]
		{
			[255] = {
				{
					["spellID"] = 272717,
					["icon"] = 132176,
					["name"] = "Serrated Jaws",
					["azeritePowerID"] = 107,
				}, -- [1]
				{
					["spellID"] = 272742,
					["icon"] = 451164,
					["name"] = "Wildfire Cluster",
					["azeritePowerID"] = 110,
				}, -- [2]
				{
					["spellID"] = 273283,
					["icon"] = 1033905,
					["name"] = "Latent Poison",
					["azeritePowerID"] = 163,
				}, -- [3]
				{
					["spellID"] = 274590,
					["icon"] = 136067,
					["name"] = "Venomous Fangs",
					["azeritePowerID"] = 213,
				}, -- [4]
				{
					["spellID"] = 287093,
					["icon"] = 236186,
					["name"] = "Dire Consequences",
					["azeritePowerID"] = 365,
				}, -- [5]
				{
					["spellID"] = 277653,
					["icon"] = 2065565,
					["name"] = "Blur of Talons",
					["azeritePowerID"] = 371,
				}, -- [6]
				{
					["spellID"] = 278532,
					["icon"] = 132214,
					["name"] = "Wilderness Survival",
					["azeritePowerID"] = 372,
				}, -- [7]
				{
					["spellID"] = 288570,
					["icon"] = 132210,
					["name"] = "Primeval Intuition",
					["azeritePowerID"] = 373,
				}, -- [8]
			},
			[254] = {
				{
					["spellID"] = 264198,
					["icon"] = 461115,
					["name"] = "In The Rhythm",
					["azeritePowerID"] = 36,
				}, -- [1]
				{
					["spellID"] = 287707,
					["icon"] = 132212,
					["name"] = "Surging Shots",
					["azeritePowerID"] = 162,
				}, -- [2]
				{
					["spellID"] = 274444,
					["icon"] = 132329,
					["name"] = "Unerring Vision",
					["azeritePowerID"] = 212,
				}, -- [3]
				{
					["spellID"] = 277651,
					["icon"] = 135130,
					["name"] = "Steady Aim",
					["azeritePowerID"] = 368,
				}, -- [4]
				{
					["spellID"] = 278530,
					["icon"] = 132330,
					["name"] = "Rapid Reload",
					["azeritePowerID"] = 369,
				}, -- [5]
				{
					["spellID"] = 278531,
					["icon"] = 878211,
					["name"] = "Focused Fire",
					["azeritePowerID"] = 370,
				}, -- [6]
			},
			[253] = {
				{
					["spellID"] = 272717,
					["icon"] = 132176,
					["name"] = "Serrated Jaws",
					["azeritePowerID"] = 107,
				}, -- [1]
				{
					["spellID"] = 273262,
					["icon"] = 132127,
					["name"] = "Haze of Rage",
					["azeritePowerID"] = 161,
				}, -- [2]
				{
					["spellID"] = 274441,
					["icon"] = 132133,
					["name"] = "Dance of Death",
					["azeritePowerID"] = 211,
				}, -- [3]
				{
					["spellID"] = 287093,
					["icon"] = 236186,
					["name"] = "Dire Consequences",
					["azeritePowerID"] = 365,
				}, -- [4]
				{
					["spellID"] = 279806,
					["icon"] = 136074,
					["name"] = "Primal Instincts",
					["azeritePowerID"] = 366,
				}, -- [5]
				{
					["spellID"] = 278529,
					["icon"] = 2058007,
					["name"] = "Feeding Frenzy",
					["azeritePowerID"] = 367,
				}, -- [6]
				{
					["spellID"] = 278530,
					["icon"] = 132330,
					["name"] = "Rapid Reload",
					["azeritePowerID"] = 369,
				}, -- [7]
			},
		}, -- [3]
		{
			[260] = {
				{
					["spellID"] = 272935,
					["icon"] = 1373908,
					["name"] = "Deadshot",
					["azeritePowerID"] = 129,
				}, -- [1]
				{
					["spellID"] = 288979,
					["icon"] = 132350,
					["name"] = "Keep Your Wits About You",
					["azeritePowerID"] = 180,
				}, -- [2]
				{
					["spellID"] = 275846,
					["icon"] = 132336,
					["name"] = "Snake Eyes",
					["azeritePowerID"] = 239,
				}, -- [3]
				{
					["spellID"] = 278675,
					["icon"] = 1373910,
					["name"] = "Paradise Lost",
					["azeritePowerID"] = 410,
				}, -- [4]
				{
					["spellID"] = 278676,
					["icon"] = 135610,
					["name"] = "Ace Up Your Sleeve",
					["azeritePowerID"] = 411,
				}, -- [5]
				{
					["spellID"] = 277676,
					["icon"] = 136206,
					["name"] = "Brigand's Blitz",
					["azeritePowerID"] = 446,
				}, -- [6]
			},
			[261] = {
				{
					["spellID"] = 286121,
					["icon"] = 237532,
					["name"] = "Replicating Shadows",
					["azeritePowerID"] = 124,
				}, -- [1]
				{
					["spellID"] = 273418,
					["icon"] = 1373907,
					["name"] = "Night's Vengeance",
					["azeritePowerID"] = 175,
				}, -- [2]
				{
					["spellID"] = 275896,
					["icon"] = 1373912,
					["name"] = "Blade In The Shadows",
					["azeritePowerID"] = 240,
				}, -- [3]
				{
					["spellID"] = 278681,
					["icon"] = 236279,
					["name"] = "The First Dance",
					["azeritePowerID"] = 413,
				}, -- [4]
				{
					["spellID"] = 278683,
					["icon"] = 252272,
					["name"] = "Inevitability",
					["azeritePowerID"] = 414,
				}, -- [5]
				{
					["spellID"] = 277673,
					["icon"] = 132090,
					["name"] = "Perforate",
					["azeritePowerID"] = 445,
				}, -- [6]
			},
			[259] = {
				{
					["spellID"] = 273007,
					["icon"] = 132304,
					["name"] = "Double Dose",
					["azeritePowerID"] = 136,
				}, -- [1]
				{
					["spellID"] = 273488,
					["icon"] = 132287,
					["name"] = "Twist the Knife",
					["azeritePowerID"] = 181,
				}, -- [2]
				{
					["spellID"] = 286573,
					["icon"] = 458726,
					["name"] = "Nothing Personal",
					["azeritePowerID"] = 249,
				}, -- [3]
				{
					["spellID"] = 277679,
					["icon"] = 132302,
					["name"] = "Scent of Blood",
					["azeritePowerID"] = 406,
				}, -- [4]
				{
					["spellID"] = 287649,
					["icon"] = 236273,
					["name"] = "Echoing Blades",
					["azeritePowerID"] = 407,
				}, -- [5]
				{
					["spellID"] = 278666,
					["icon"] = 132297,
					["name"] = "Shrouded Suffocation",
					["azeritePowerID"] = 408,
				}, -- [6]
			},
		}, -- [4]
		{
			[257] = {
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [1]
				{
					["spellID"] = 272780,
					["icon"] = 135907,
					["name"] = "Permeating Glow",
					["azeritePowerID"] = 114,
				}, -- [2]
				{
					["spellID"] = 273313,
					["icon"] = 237541,
					["name"] = "Blessed Sanctuary",
					["azeritePowerID"] = 165,
				}, -- [3]
				{
					["spellID"] = 275602,
					["icon"] = 135943,
					["name"] = "Prayerful Litany",
					["azeritePowerID"] = 228,
				}, -- [4]
				{
					["spellID"] = 277681,
					["icon"] = 135913,
					["name"] = "Everlasting Light",
					["azeritePowerID"] = 400,
				}, -- [5]
				{
					["spellID"] = 278645,
					["icon"] = 135944,
					["name"] = "Word of Mending",
					["azeritePowerID"] = 401,
				}, -- [6]
				{
					["spellID"] = 287336,
					["icon"] = 135937,
					["name"] = "Promise of Deliverance",
					["azeritePowerID"] = 402,
				}, -- [7]
			},
			[258] = {
				{
					["spellID"] = 272788,
					["icon"] = 237565,
					["name"] = "Searing Dialogue",
					["azeritePowerID"] = 115,
				}, -- [1]
				{
					["spellID"] = 288340,
					["icon"] = 135978,
					["name"] = "Thought Harvester",
					["azeritePowerID"] = 166,
				}, -- [2]
				{
					["spellID"] = 275541,
					["icon"] = 136202,
					["name"] = "Depth of the Shadows",
					["azeritePowerID"] = 227,
				}, -- [3]
				{
					["spellID"] = 275722,
					["icon"] = 237298,
					["name"] = "Whispers of the Damned",
					["azeritePowerID"] = 236,
				}, -- [4]
				{
					["spellID"] = 277682,
					["icon"] = 458229,
					["name"] = "Spiteful Apparitions",
					["azeritePowerID"] = 403,
				}, -- [5]
				{
					["spellID"] = 278659,
					["icon"] = 136163,
					["name"] = "Death Throes",
					["azeritePowerID"] = 404,
				}, -- [6]
				{
					["spellID"] = 278661,
					["icon"] = 1386549,
					["name"] = "Chorus of Insanity",
					["azeritePowerID"] = 405,
				}, -- [7]
			},
			[256] = {
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [1]
				{
					["spellID"] = 272775,
					["icon"] = 135936,
					["name"] = "Moment of Repose",
					["azeritePowerID"] = 113,
				}, -- [2]
				{
					["spellID"] = 273307,
					["icon"] = 237545,
					["name"] = "Weal and Woe",
					["azeritePowerID"] = 164,
				}, -- [3]
				{
					["spellID"] = 275541,
					["icon"] = 136202,
					["name"] = "Depth of the Shadows",
					["azeritePowerID"] = 227,
				}, -- [4]
				{
					["spellID"] = 287355,
					["icon"] = 135922,
					["name"] = "Sudden Revelation",
					["azeritePowerID"] = 397,
				}, -- [5]
				{
					["spellID"] = 278629,
					["icon"] = 237567,
					["name"] = "Contemptuous Homily",
					["azeritePowerID"] = 398,
				}, -- [6]
				{
					["spellID"] = 278643,
					["icon"] = 1386546,
					["name"] = "Enduring Luminescence",
					["azeritePowerID"] = 399,
				}, -- [7]
			},
		}, -- [5]
		{
			[252] = {
				{
					["spellID"] = 288417,
					["icon"] = 348276,
					["name"] = "Magus of the Dead",
					["azeritePowerID"] = 109,
				}, -- [1]
				{
					["spellID"] = 273088,
					["icon"] = 136144,
					["name"] = "Bone Spike Graveyard",
					["azeritePowerID"] = 140,
				}, -- [2]
				{
					["spellID"] = 286832,
					["icon"] = 342913,
					["name"] = "Helchains",
					["azeritePowerID"] = 142,
				}, -- [3]
				{
					["spellID"] = 274081,
					["icon"] = 1129420,
					["name"] = "Festermight",
					["azeritePowerID"] = 199,
				}, -- [4]
				{
					["spellID"] = 275929,
					["icon"] = 136145,
					["name"] = "Harrowing Decay",
					["azeritePowerID"] = 244,
				}, -- [5]
				{
					["spellID"] = 278482,
					["icon"] = 879926,
					["name"] = "Cankerous Wounds",
					["azeritePowerID"] = 350,
				}, -- [6]
				{
					["spellID"] = 278489,
					["icon"] = 136133,
					["name"] = "Last Surprise",
					["azeritePowerID"] = 351,
				}, -- [7]
			},
			[251] = {
				{
					["spellID"] = 272718,
					["icon"] = 135372,
					["name"] = "Icy Citadel",
					["azeritePowerID"] = 108,
				}, -- [1]
				{
					["spellID"] = 273093,
					["icon"] = 237520,
					["name"] = "Latent Chill",
					["azeritePowerID"] = 141,
				}, -- [2]
				{
					["spellID"] = 287283,
					["icon"] = 1580450,
					["name"] = "Frostwhelp's Indignation",
					["azeritePowerID"] = 198,
				}, -- [3]
				{
					["spellID"] = 275917,
					["icon"] = 135833,
					["name"] = "Echoing Howl",
					["azeritePowerID"] = 242,
				}, -- [4]
				{
					["spellID"] = 278480,
					["icon"] = 135305,
					["name"] = "Killer Frost",
					["azeritePowerID"] = 346,
				}, -- [5]
				{
					["spellID"] = 278487,
					["icon"] = 538770,
					["name"] = "Frozen Tempest",
					["azeritePowerID"] = 347,
				}, -- [6]
			},
			[250] = {
				{
					["spellID"] = 272684,
					["icon"] = 132155,
					["name"] = "Deep Cuts",
					["azeritePowerID"] = 106,
				}, -- [1]
				{
					["spellID"] = 273088,
					["icon"] = 136144,
					["name"] = "Bone Spike Graveyard",
					["azeritePowerID"] = 140,
				}, -- [2]
				{
					["spellID"] = 274057,
					["icon"] = 237517,
					["name"] = "Marrowblood",
					["azeritePowerID"] = 197,
				}, -- [3]
				{
					["spellID"] = 289339,
					["icon"] = 135338,
					["name"] = "Bloody Runeblade",
					["azeritePowerID"] = 243,
				}, -- [4]
				{
					["spellID"] = 278479,
					["icon"] = 135277,
					["name"] = "Eternal Rune Weapon",
					["azeritePowerID"] = 348,
				}, -- [5]
				{
					["spellID"] = 278484,
					["icon"] = 1376745,
					["name"] = "Bones of the Damned",
					["azeritePowerID"] = 349,
				}, -- [6]
			},
		}, -- [6]
		{
			[263] = {
				{
					["spellID"] = 263786,
					["icon"] = 538565,
					["name"] = "Astral Shift",
					["azeritePowerID"] = 17,
				}, -- [1]
				{
					["spellID"] = 272992,
					["icon"] = 236289,
					["name"] = "Primal Primer",
					["azeritePowerID"] = 137,
				}, -- [2]
				{
					["spellID"] = 273461,
					["icon"] = 136086,
					["name"] = "Strength of Earth",
					["azeritePowerID"] = 179,
				}, -- [3]
				{
					["spellID"] = 275388,
					["icon"] = 237443,
					["name"] = "Lightning Conduit",
					["azeritePowerID"] = 223,
				}, -- [4]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [5]
				{
					["spellID"] = 278719,
					["icon"] = 132314,
					["name"] = "Roiling Storm",
					["azeritePowerID"] = 420,
				}, -- [6]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [7]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [8]
				{
					["spellID"] = 287768,
					["icon"] = 136046,
					["name"] = "Thunderaan's Fury",
					["azeritePowerID"] = 530,
				}, -- [9]
			},
			[264] = {
				{
					["spellID"] = 263786,
					["icon"] = 538565,
					["name"] = "Astral Shift",
					["azeritePowerID"] = 17,
				}, -- [1]
				{
					["spellID"] = 263792,
					["icon"] = 136015,
					["name"] = "Lightningburn",
					["azeritePowerID"] = 24,
				}, -- [2]
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [3]
				{
					["spellID"] = 272978,
					["icon"] = 237582,
					["name"] = "Volcanic Lightning",
					["azeritePowerID"] = 135,
				}, -- [4]
				{
					["spellID"] = 272989,
					["icon"] = 136042,
					["name"] = "Soothing Waters",
					["azeritePowerID"] = 138,
				}, -- [5]
				{
					["spellID"] = 287300,
					["icon"] = 237590,
					["name"] = "Turn of the Tide",
					["azeritePowerID"] = 191,
				}, -- [6]
				{
					["spellID"] = 275488,
					["icon"] = 135127,
					["name"] = "Swelling Stream",
					["azeritePowerID"] = 224,
				}, -- [7]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [8]
				{
					["spellID"] = 278713,
					["icon"] = 252995,
					["name"] = "Surging Tides",
					["azeritePowerID"] = 422,
				}, -- [9]
				{
					["spellID"] = 278715,
					["icon"] = 237586,
					["name"] = "Spouting Spirits",
					["azeritePowerID"] = 423,
				}, -- [10]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [11]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [12]
				{
					["spellID"] = 277658,
					["icon"] = 136037,
					["name"] = "Overflowing Shores",
					["azeritePowerID"] = 449,
				}, -- [13]
				{
					["spellID"] = 279829,
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [14]
			},
			[262] = {
				{
					["spellID"] = 263786,
					["icon"] = 538565,
					["name"] = "Astral Shift",
					["azeritePowerID"] = 17,
				}, -- [1]
				{
					["spellID"] = 263792,
					["icon"] = 136015,
					["name"] = "Lightningburn",
					["azeritePowerID"] = 24,
				}, -- [2]
				{
					["spellID"] = 272978,
					["icon"] = 237582,
					["name"] = "Volcanic Lightning",
					["azeritePowerID"] = 135,
				}, -- [3]
				{
					["spellID"] = 273448,
					["icon"] = 136026,
					["name"] = "Lava Shock",
					["azeritePowerID"] = 178,
				}, -- [4]
				{
					["spellID"] = 275381,
					["icon"] = 135790,
					["name"] = "Echo of the Elementals",
					["azeritePowerID"] = 222,
				}, -- [5]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [6]
				{
					["spellID"] = 286949,
					["icon"] = 136025,
					["name"] = "Tectonic Thunder",
					["azeritePowerID"] = 417,
				}, -- [7]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [8]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [9]
				{
					["spellID"] = 279829,
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [10]
			},
		}, -- [7]
		{
			[64] = {
				{
					["spellID"] = 272968,
					["icon"] = 612394,
					["name"] = "Packed Ice",
					["azeritePowerID"] = 132,
				}, -- [1]
				{
					["spellID"] = 288164,
					["icon"] = 236209,
					["name"] = "Flash Freeze",
					["azeritePowerID"] = 170,
				}, -- [2]
				{
					["spellID"] = 279854,
					["icon"] = 2126034,
					["name"] = "Glacial Assault",
					["azeritePowerID"] = 225,
				}, -- [3]
				{
					["spellID"] = 277663,
					["icon"] = 135846,
					["name"] = "Tunnel of Ice",
					["azeritePowerID"] = 379,
				}, -- [4]
				{
					["spellID"] = 278541,
					["icon"] = 135844,
					["name"] = "Whiteout",
					["azeritePowerID"] = 380,
				}, -- [5]
				{
					["spellID"] = 278542,
					["icon"] = 135838,
					["name"] = "Frigid Grasp",
					["azeritePowerID"] = 381,
				}, -- [6]
			},
			[63] = {
				{
					["spellID"] = 272932,
					["icon"] = 135810,
					["name"] = "Flames of Alacrity",
					["azeritePowerID"] = 128,
				}, -- [1]
				{
					["spellID"] = 288755,
					["icon"] = 460698,
					["name"] = "Wildfire",
					["azeritePowerID"] = 168,
				}, -- [2]
				{
					["spellID"] = 274596,
					["icon"] = 135807,
					["name"] = "Blaster Master",
					["azeritePowerID"] = 215,
				}, -- [3]
				{
					["spellID"] = 277656,
					["icon"] = 135808,
					["name"] = "Trailing Embers",
					["azeritePowerID"] = 376,
				}, -- [4]
				{
					["spellID"] = 278538,
					["icon"] = 135812,
					["name"] = "Duplicative Incineration",
					["azeritePowerID"] = 377,
				}, -- [5]
				{
					["spellID"] = 278539,
					["icon"] = 236218,
					["name"] = "Firemind",
					["azeritePowerID"] = 378,
				}, -- [6]
			},
			[62] = {
				{
					["spellID"] = 270669,
					["icon"] = 136096,
					["name"] = "Arcane Pummeling",
					["azeritePowerID"] = 88,
				}, -- [1]
				{
					["spellID"] = 286027,
					["icon"] = 135732,
					["name"] = "Equipoise",
					["azeritePowerID"] = 127,
				}, -- [2]
				{
					["spellID"] = 273326,
					["icon"] = 136075,
					["name"] = "Brain Storm",
					["azeritePowerID"] = 167,
				}, -- [3]
				{
					["spellID"] = 274594,
					["icon"] = 236205,
					["name"] = "Arcane Pressure",
					["azeritePowerID"] = 214,
				}, -- [4]
				{
					["spellID"] = 278536,
					["icon"] = 135730,
					["name"] = "Galvanizing Spark",
					["azeritePowerID"] = 374,
				}, -- [5]
				{
					["spellID"] = 278537,
					["icon"] = 136116,
					["name"] = "Explosive Echo",
					["azeritePowerID"] = 375,
				}, -- [6]
			},
		}, -- [8]
		{
			[266] = {
				{
					["spellID"] = 272944,
					["icon"] = 136181,
					["name"] = "Shadow's Bite",
					["azeritePowerID"] = 130,
				}, -- [1]
				{
					["spellID"] = 273523,
					["icon"] = 236296,
					["name"] = "Umbral Blaze",
					["azeritePowerID"] = 190,
				}, -- [2]
				{
					["spellID"] = 275395,
					["icon"] = 2032610,
					["name"] = "Explosive Potential",
					["azeritePowerID"] = 231,
				}, -- [3]
				{
					["spellID"] = 278737,
					["icon"] = 535592,
					["name"] = "Demonic Meteor",
					["azeritePowerID"] = 428,
				}, -- [4]
				{
					["spellID"] = 287059,
					["icon"] = 237561,
					["name"] = "Baleful Invocation",
					["azeritePowerID"] = 429,
				}, -- [5]
				{
					["spellID"] = 276007,
					["icon"] = 460856,
					["name"] = "Excoriate",
					["azeritePowerID"] = 443,
				}, -- [6]
				{
					["spellID"] = 279878,
					["icon"] = 2065628,
					["name"] = "Supreme Commander",
					["azeritePowerID"] = 458,
				}, -- [7]
			},
			[267] = {
				{
					["spellID"] = 287637,
					["icon"] = 134075,
					["name"] = "Chaos Shards",
					["azeritePowerID"] = 131,
				}, -- [1]
				{
					["spellID"] = 275425,
					["icon"] = 135817,
					["name"] = "Flashpoint",
					["azeritePowerID"] = 232,
				}, -- [2]
				{
					["spellID"] = 278747,
					["icon"] = 1380866,
					["name"] = "Rolling Havoc",
					["azeritePowerID"] = 431,
				}, -- [3]
				{
					["spellID"] = 278748,
					["icon"] = 135789,
					["name"] = "Chaotic Inferno",
					["azeritePowerID"] = 432,
				}, -- [4]
				{
					["spellID"] = 277644,
					["icon"] = 236291,
					["name"] = "Crashing Chaos",
					["azeritePowerID"] = 444,
				}, -- [5]
				{
					["spellID"] = 279909,
					["icon"] = 135807,
					["name"] = "Bursting Flare",
					["azeritePowerID"] = 460,
				}, -- [6]
			},
			[265] = {
				{
					["spellID"] = 272891,
					["icon"] = 237564,
					["name"] = "Wracking Brilliance",
					["azeritePowerID"] = 123,
				}, -- [1]
				{
					["spellID"] = 273521,
					["icon"] = 537517,
					["name"] = "Inevitable Demise",
					["azeritePowerID"] = 183,
				}, -- [2]
				{
					["spellID"] = 275372,
					["icon"] = 136228,
					["name"] = "Cascading Calamity",
					["azeritePowerID"] = 230,
				}, -- [3]
				{
					["spellID"] = 278721,
					["icon"] = 136139,
					["name"] = "Sudden Onset",
					["azeritePowerID"] = 425,
				}, -- [4]
				{
					["spellID"] = 278727,
					["icon"] = 1416161,
					["name"] = "Dreadful Calling",
					["azeritePowerID"] = 426,
				}, -- [5]
				{
					["spellID"] = 289364,
					["icon"] = 136230,
					["name"] = "Pandemic Invocation",
					["azeritePowerID"] = 442,
				}, -- [6]
			},
		}, -- [9]
		{
			[269] = {
				{
					["spellID"] = 287055,
					["icon"] = 606548,
					["name"] = "Fury of Xuen",
					["azeritePowerID"] = 117,
				}, -- [1]
				{
					["spellID"] = 273291,
					["icon"] = 642415,
					["name"] = "Sunrise Technique",
					["azeritePowerID"] = 184,
				}, -- [2]
				{
					["spellID"] = 288634,
					["icon"] = 1381297,
					["name"] = "Glory of the Dawn",
					["azeritePowerID"] = 388,
				}, -- [3]
				{
					["spellID"] = 279918,
					["icon"] = 627606,
					["name"] = "Open Palm Strikes",
					["azeritePowerID"] = 389,
				}, -- [4]
				{
					["spellID"] = 278577,
					["icon"] = 606551,
					["name"] = "Pressure Point",
					["azeritePowerID"] = 390,
				}, -- [5]
				{
					["spellID"] = 286585,
					["icon"] = 607849,
					["name"] = "Dance of Chi-Ji",
					["azeritePowerID"] = 391,
				}, -- [6]
			},
			[270] = {
				{
					["spellID"] = 287829,
					["icon"] = 611418,
					["name"] = "Secret Infusion",
					["azeritePowerID"] = 76,
				}, -- [1]
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [2]
				{
					["spellID"] = 273291,
					["icon"] = 642415,
					["name"] = "Sunrise Technique",
					["azeritePowerID"] = 184,
				}, -- [3]
				{
					["spellID"] = 273328,
					["icon"] = 775461,
					["name"] = "Overflowing Mists",
					["azeritePowerID"] = 185,
				}, -- [4]
				{
					["spellID"] = 275975,
					["icon"] = 627487,
					["name"] = "Misty Peaks",
					["azeritePowerID"] = 248,
				}, -- [5]
				{
					["spellID"] = 277667,
					["icon"] = 627485,
					["name"] = "Burst of Life",
					["azeritePowerID"] = 385,
				}, -- [6]
				{
					["spellID"] = 279875,
					["icon"] = 1360978,
					["name"] = "Font of Life",
					["azeritePowerID"] = 386,
				}, -- [7]
				{
					["spellID"] = 278576,
					["icon"] = 1020466,
					["name"] = "Uplifted Spirits",
					["azeritePowerID"] = 387,
				}, -- [8]
				{
					["spellID"] = 288634,
					["icon"] = 1381297,
					["name"] = "Glory of the Dawn",
					["azeritePowerID"] = 388,
				}, -- [9]
			},
			[268] = {
				{
					["spellID"] = 272792,
					["icon"] = 615339,
					["name"] = "Boiling Brew",
					["azeritePowerID"] = 116,
				}, -- [1]
				{
					["spellID"] = 273464,
					["icon"] = 1500803,
					["name"] = "Staggering Strikes",
					["azeritePowerID"] = 186,
				}, -- [2]
				{
					["spellID"] = 275892,
					["icon"] = 133701,
					["name"] = "Fit to Burst",
					["azeritePowerID"] = 238,
				}, -- [3]
				{
					["spellID"] = 285958,
					["icon"] = 1360979,
					["name"] = "Straight, No Chaser",
					["azeritePowerID"] = 382,
				}, -- [4]
				{
					["spellID"] = 278569,
					["icon"] = 611419,
					["name"] = "Training of Niuzao",
					["azeritePowerID"] = 383,
				}, -- [5]
				{
					["spellID"] = 278571,
					["icon"] = 642416,
					["name"] = "Elusive Footwork",
					["azeritePowerID"] = 384,
				}, -- [6]
			},
		}, -- [10]
		{
			[103] = {
				{
					["spellID"] = 279524,
					["icon"] = 236149,
					["name"] = "Blood Mist",
					["azeritePowerID"] = 111,
				}, -- [1]
				{
					["spellID"] = 273338,
					["icon"] = 132122,
					["name"] = "Untamed Ferocity",
					["azeritePowerID"] = 169,
				}, -- [2]
				{
					["spellID"] = 273344,
					["icon"] = 236169,
					["name"] = "Masterful Instincts",
					["azeritePowerID"] = 171,
				}, -- [3]
				{
					["spellID"] = 274424,
					["icon"] = 132242,
					["name"] = "Jungle Fury",
					["azeritePowerID"] = 209,
				}, -- [4]
				{
					["spellID"] = 275906,
					["icon"] = 451161,
					["name"] = "Twisted Claws",
					["azeritePowerID"] = 241,
				}, -- [5]
				{
					["spellID"] = 276021,
					["icon"] = 132134,
					["name"] = "Iron Jaws",
					["azeritePowerID"] = 247,
				}, -- [6]
				{
					["spellID"] = 278509,
					["icon"] = 132152,
					["name"] = "Gushing Lacerations",
					["azeritePowerID"] = 358,
				}, -- [7]
				{
					["spellID"] = 279527,
					["icon"] = 236305,
					["name"] = "Wild Fleshrending",
					["azeritePowerID"] = 359,
				}, -- [8]
			},
			[104] = {
				{
					["spellID"] = 269379,
					["icon"] = 136096,
					["name"] = "Long Night",
					["azeritePowerID"] = 51,
				}, -- [1]
				{
					["spellID"] = 279552,
					["icon"] = 1378702,
					["name"] = "Layered Mane",
					["azeritePowerID"] = 112,
				}, -- [2]
				{
					["spellID"] = 273344,
					["icon"] = 236169,
					["name"] = "Masterful Instincts",
					["azeritePowerID"] = 171,
				}, -- [3]
				{
					["spellID"] = 275906,
					["icon"] = 451161,
					["name"] = "Twisted Claws",
					["azeritePowerID"] = 241,
				}, -- [4]
				{
					["spellID"] = 289314,
					["icon"] = 571585,
					["name"] = "Burst of Savagery",
					["azeritePowerID"] = 251,
				}, -- [5]
				{
					["spellID"] = 279527,
					["icon"] = 236305,
					["name"] = "Wild Fleshrending",
					["azeritePowerID"] = 359,
				}, -- [6]
				{
					["spellID"] = 278510,
					["icon"] = 132091,
					["name"] = "Gory Regeneration",
					["azeritePowerID"] = 360,
				}, -- [7]
				{
					["spellID"] = 278511,
					["icon"] = 132136,
					["name"] = "Guardian's Wrath",
					["azeritePowerID"] = 361,
				}, -- [8]
			},
			[105] = {
				{
					["spellID"] = 269379,
					["icon"] = 136096,
					["name"] = "Long Night",
					["azeritePowerID"] = 51,
				}, -- [1]
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [2]
				{
					["spellID"] = 287251,
					["icon"] = 236153,
					["name"] = "Early Harvest",
					["azeritePowerID"] = 120,
				}, -- [3]
				{
					["spellID"] = 279778,
					["icon"] = 134914,
					["name"] = "Grove Tending",
					["azeritePowerID"] = 172,
				}, -- [4]
				{
					["spellID"] = 274432,
					["icon"] = 136081,
					["name"] = "Autumn Leaves",
					["azeritePowerID"] = 210,
				}, -- [5]
				{
					["spellID"] = 278505,
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [6]
				{
					["spellID"] = 278515,
					["icon"] = 136085,
					["name"] = "Rampant Growth",
					["azeritePowerID"] = 362,
				}, -- [7]
				{
					["spellID"] = 278513,
					["icon"] = 134157,
					["name"] = "Waking Dream",
					["azeritePowerID"] = 363,
				}, -- [8]
				{
					["spellID"] = 279642,
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [9]
			},
			[102] = {
				{
					["spellID"] = 269379,
					["icon"] = 136096,
					["name"] = "Long Night",
					["azeritePowerID"] = 51,
				}, -- [1]
				{
					["spellID"] = 272871,
					["icon"] = 136060,
					["name"] = "Streaking Stars",
					["azeritePowerID"] = 122,
				}, -- [2]
				{
					["spellID"] = 273367,
					["icon"] = 136096,
					["name"] = "Power of the Moon",
					["azeritePowerID"] = 173,
				}, -- [3]
				{
					["spellID"] = 287773,
					["icon"] = 135730,
					["name"] = "Arcanic Pulsar",
					["azeritePowerID"] = 200,
				}, -- [4]
				{
					["spellID"] = 276152,
					["icon"] = 135753,
					["name"] = "Dawning Sun",
					["azeritePowerID"] = 250,
				}, -- [5]
				{
					["spellID"] = 278505,
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [6]
				{
					["spellID"] = 278507,
					["icon"] = 236168,
					["name"] = "Lunar Shrapnel",
					["azeritePowerID"] = 357,
				}, -- [7]
				{
					["spellID"] = 279642,
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [8]
			},
		}, -- [11]
		{
			[577] = {
				{
					["spellID"] = 279581,
					["icon"] = 1305149,
					["name"] = "Revolving Blades",
					["azeritePowerID"] = 126,
				}, -- [1]
				{
					["spellID"] = 273231,
					["icon"] = 1305156,
					["name"] = "Furious Gaze",
					["azeritePowerID"] = 159,
				}, -- [2]
				{
					["spellID"] = 273236,
					["icon"] = 1344649,
					["name"] = "Infernal Armor",
					["azeritePowerID"] = 160,
				}, -- [3]
				{
					["spellID"] = 288754,
					["icon"] = 1305157,
					["name"] = "Chaotic Transformation",
					["azeritePowerID"] = 220,
				}, -- [4]
				{
					["spellID"] = 275934,
					["icon"] = 1097741,
					["name"] = "Seething Power",
					["azeritePowerID"] = 245,
				}, -- [5]
				{
					["spellID"] = 278493,
					["icon"] = 1305152,
					["name"] = "Thirsting Blades",
					["azeritePowerID"] = 352,
				}, -- [6]
				{
					["spellID"] = 278500,
					["icon"] = 463286,
					["name"] = "Eyes of Rage",
					["azeritePowerID"] = 353,
				}, -- [7]
			},
			[581] = {
				{
					["spellID"] = 272983,
					["icon"] = 1344647,
					["name"] = "Revel in Pain",
					["azeritePowerID"] = 134,
				}, -- [1]
				{
					["spellID"] = 273236,
					["icon"] = 1344649,
					["name"] = "Infernal Armor",
					["azeritePowerID"] = 160,
				}, -- [2]
				{
					["spellID"] = 275350,
					["icon"] = 1344645,
					["name"] = "Rigid Carapace",
					["azeritePowerID"] = 221,
				}, -- [3]
				{
					["spellID"] = 288878,
					["icon"] = 615099,
					["name"] = "Hour of Reaping",
					["azeritePowerID"] = 246,
				}, -- [4]
				{
					["spellID"] = 278502,
					["icon"] = 1344652,
					["name"] = "Cycle of Binding",
					["azeritePowerID"] = 354,
				}, -- [5]
				{
					["spellID"] = 278501,
					["icon"] = 1344648,
					["name"] = "Essence Sever",
					["azeritePowerID"] = 355,
				}, -- [6]
			},
		}, -- [12]
	},
	["defensive"] = {
		{
			{
				["spellID"] = 280023,
				["icon"] = 132351,
				["name"] = "Moment of Glory",
				["azeritePowerID"] = 476,
			}, -- [1]
			{
				["spellID"] = 280128,
				["icon"] = 132342,
				["name"] = "Bury the Hatchet",
				["azeritePowerID"] = 477,
			}, -- [2]
			{
				["spellID"] = 288641,
				["icon"] = 132126,
				["name"] = "Intimidating Presence",
				["azeritePowerID"] = 554,
			}, -- [3]
		}, -- [1]
		{
			{
				["spellID"] = 274388,
				["icon"] = 524354,
				["name"] = "Stalwart Protector",
				["azeritePowerID"] = 206,
			}, -- [1]
			{
				["spellID"] = 280017,
				["icon"] = 1360759,
				["name"] = "Gallant Steed",
				["azeritePowerID"] = 471,
			}, -- [2]
			{
				["spellID"] = 287729,
				["icon"] = 135928,
				["name"] = "Empyreal Ward",
				["azeritePowerID"] = 538,
			}, -- [3]
		}, -- [2]
		{
			{
				["spellID"] = 274355,
				["icon"] = 132199,
				["name"] = "Shellshock",
				["azeritePowerID"] = 203,
			}, -- [1]
			{
				["spellID"] = 280014,
				["icon"] = 132293,
				["name"] = "Duck and Cover",
				["azeritePowerID"] = 469,
			}, -- [2]
			{
				["spellID"] = 287938,
				["icon"] = 1014024,
				["name"] = "Nature's Salve",
				["azeritePowerID"] = 543,
			}, -- [3]
		}, -- [3]
		{
			{
				["spellID"] = 274692,
				["icon"] = 132307,
				["name"] = "Footpad",
				["azeritePowerID"] = 217,
			}, -- [1]
			{
				["spellID"] = 280020,
				["icon"] = 136177,
				["name"] = "Shrouded Mantle",
				["azeritePowerID"] = 473,
			}, -- [2]
			{
				["spellID"] = 288079,
				["icon"] = 132301,
				["name"] = "Lying In Wait",
				["azeritePowerID"] = 548,
			}, -- [3]
		}, -- [4]
		{
			{
				["spellID"] = 274366,
				["icon"] = 135994,
				["name"] = "Sanctum",
				["azeritePowerID"] = 204,
			}, -- [1]
			{
				["spellID"] = 280018,
				["icon"] = 136066,
				["name"] = "Twist Magic",
				["azeritePowerID"] = 472,
			}, -- [2]
			{
				["spellID"] = 287717,
				["icon"] = 463835,
				["name"] = "Death Denied",
				["azeritePowerID"] = 537,
			}, -- [3]
		}, -- [5]
		{
			{
				["spellID"] = 280010,
				["icon"] = 136120,
				["name"] = "Runic Barrier",
				["azeritePowerID"] = 201,
			}, -- [1]
			{
				["spellID"] = 280011,
				["icon"] = 237561,
				["name"] = "March of the Damned",
				["azeritePowerID"] = 465,
			}, -- [2]
			{
				["spellID"] = 288424,
				["icon"] = 237525,
				["name"] = "Cold Hearted",
				["azeritePowerID"] = 549,
			}, -- [3]
		}, -- [6]
		{
			{
				["spellID"] = 274412,
				["icon"] = 538565,
				["name"] = "Serene Spirit",
				["azeritePowerID"] = 207,
			}, -- [1]
			{
				["spellID"] = 280021,
				["icon"] = 136095,
				["name"] = "Pack Spirit",
				["azeritePowerID"] = 474,
			}, -- [2]
			{
				["spellID"] = 287774,
				["icon"] = 133439,
				["name"] = "Ancient Ankh Talisman",
				["azeritePowerID"] = 539,
			}, -- [3]
		}, -- [7]
		{
			{
				["spellID"] = 274379,
				["icon"] = 135991,
				["name"] = "Eldritch Warding",
				["azeritePowerID"] = 205,
			}, -- [1]
			{
				["spellID"] = 280015,
				["icon"] = 135736,
				["name"] = "Cauterizing Blink",
				["azeritePowerID"] = 468,
			}, -- [2]
			{
				["spellID"] = 288121,
				["icon"] = 135754,
				["name"] = "Quick Thinking",
				["azeritePowerID"] = 546,
			}, -- [3]
		}, -- [8]
		{
			{
				["spellID"] = 274418,
				["icon"] = 538745,
				["name"] = "Lifeblood",
				["azeritePowerID"] = 208,
			}, -- [1]
			{
				["spellID"] = 280022,
				["icon"] = 136169,
				["name"] = "Desperate Power",
				["azeritePowerID"] = 475,
			}, -- [2]
			{
				["spellID"] = 287822,
				["icon"] = 136183,
				["name"] = "Terror of the Mind",
				["azeritePowerID"] = 531,
			}, -- [3]
		}, -- [9]
		{
			{
				["spellID"] = 274762,
				["icon"] = 606546,
				["name"] = "Strength of Spirit",
				["azeritePowerID"] = 218,
			}, -- [1]
			{
				["spellID"] = 280016,
				["icon"] = 642414,
				["name"] = "Sweep the Leg",
				["azeritePowerID"] = 470,
			}, -- [2]
			{
				["spellID"] = 289322,
				["icon"] = 574574,
				["name"] = "Exit Strategy",
				["azeritePowerID"] = 566,
			}, -- [3]
		}, -- [10]
		{
			{
				["spellID"] = 274813,
				["icon"] = 136080,
				["name"] = "Reawakening",
				["azeritePowerID"] = 219,
			}, -- [1]
			{
				["spellID"] = 280013,
				["icon"] = 136097,
				["name"] = "Ursoc's Endurance",
				["azeritePowerID"] = 467,
			}, -- [2]
			{
				["spellID"] = 287803,
				["icon"] = 135879,
				["name"] = "Switch Hitter",
				["azeritePowerID"] = 540,
			}, -- [3]
		}, -- [11]
		{
			{
				["spellID"] = 274344,
				["icon"] = 1305158,
				["name"] = "Soulmonger",
				["azeritePowerID"] = 202,
			}, -- [1]
			{
				["spellID"] = 280012,
				["icon"] = 828455,
				["name"] = "Burning Soul",
				["azeritePowerID"] = 466,
			}, -- [2]
			{
				["spellID"] = 288973,
				["icon"] = 1392554,
				["name"] = "Thrive in Chaos",
				["azeritePowerID"] = 564,
			}, -- [3]
		}, -- [12]
		["common"] = {
			{
				["spellID"] = 268594,
				["icon"] = 538536,
				["name"] = "Longstrider",
				["azeritePowerID"] = 14,
			}, -- [1]
			{
				["spellID"] = 263962,
				["icon"] = 1769069,
				["name"] = "Resounding Protection",
				["azeritePowerID"] = 15,
			}, -- [2]
			{
				["spellID"] = 268599,
				["icon"] = 237395,
				["name"] = "Vampiric Speed",
				["azeritePowerID"] = 44,
			}, -- [3]
			{
				["spellID"] = 268437,
				["icon"] = 1387707,
				["name"] = "Impassive Visage",
				["azeritePowerID"] = 83,
			}, -- [4]
			{
				["spellID"] = 268595,
				["icon"] = 651746,
				["name"] = "Bulwark of the Masses",
				["azeritePowerID"] = 84,
			}, -- [5]
			{
				["spellID"] = 268596,
				["icon"] = 1686575,
				["name"] = "Gemhide",
				["azeritePowerID"] = 85,
			}, -- [6]
			{
				["spellID"] = 268435,
				["icon"] = 646669,
				["name"] = "Azerite Fortification",
				["azeritePowerID"] = 86,
			}, -- [7]
			{
				["spellID"] = 268600,
				["icon"] = 413591,
				["name"] = "Self Reliance",
				["azeritePowerID"] = 87,
			}, -- [8]
		},
	},
	["role"] = {
		["tank"] = {
			{
				["spellID"] = 267671,
				["icon"] = 1029596,
				["name"] = "Winds of War",
				["azeritePowerID"] = 43,
			}, -- [1]
			{
				["spellID"] = 267683,
				["icon"] = 1129419,
				["name"] = "Azerite Veins",
				["azeritePowerID"] = 89,
			}, -- [2]
			{
				["spellID"] = 271536,
				["icon"] = 134978,
				["name"] = "Crystalline Carapace",
				["azeritePowerID"] = 98,
			}, -- [3]
			{
				["spellID"] = 271540,
				["icon"] = 645224,
				["name"] = "Ablative Shielding",
				["azeritePowerID"] = 99,
			}, -- [4]
			{
				["spellID"] = 271546,
				["icon"] = 136031,
				["name"] = "Strength in Numbers",
				["azeritePowerID"] = 100,
			}, -- [5]
			{
				["spellID"] = 271557,
				["icon"] = 1323035,
				["name"] = "Shimmering Haven",
				["azeritePowerID"] = 101,
			}, -- [6]
		},
		["nonhealer"] = {
			{
				["spellID"] = 263984,
				["icon"] = 1029585,
				["name"] = "Elemental Whirl",
				["azeritePowerID"] = 21,
			}, -- [1]
			{
				["spellID"] = 266180,
				["icon"] = 252174,
				["name"] = "Overwhelming Power",
				["azeritePowerID"] = 30,
			}, -- [2]
			{
				["spellID"] = 266937,
				["icon"] = 132109,
				["name"] = "Gutripper",
				["azeritePowerID"] = 31,
			}, -- [3]
			{
				["spellID"] = 266936,
				["icon"] = 646670,
				["name"] = "Azerite Globules",
				["azeritePowerID"] = 462,
			}, -- [4]
		},
		["healer"] = {
			{
				["spellID"] = 267880,
				["icon"] = 463526,
				["name"] = "Woundbinder",
				["azeritePowerID"] = 19,
			}, -- [1]
			{
				["spellID"] = 267883,
				["icon"] = 413576,
				["name"] = "Savior",
				["azeritePowerID"] = 42,
			}, -- [2]
			{
				["spellID"] = 267882,
				["icon"] = 970412,
				["name"] = "Concentrated Mending",
				["azeritePowerID"] = 103,
			}, -- [3]
			{
				["spellID"] = 267884,
				["icon"] = 236832,
				["name"] = "Bracing Chill",
				["azeritePowerID"] = 104,
			}, -- [4]
			{
				["spellID"] = 267886,
				["icon"] = 133020,
				["name"] = "Ephemeral Recovery",
				["azeritePowerID"] = 105,
			}, -- [5]
			{
				["spellID"] = 267889,
				["icon"] = 135905,
				["name"] = "Blessed Portents",
				["azeritePowerID"] = 463,
			}, -- [6]
		},
		["common"] = {
			{
				["spellID"] = 264108,
				["icon"] = 538560,
				["name"] = "Blood Siphon",
				["azeritePowerID"] = 18,
			}, -- [1]
			{
				["spellID"] = 267665,
				["icon"] = 236166,
				["name"] = "Lifespeed",
				["azeritePowerID"] = 20,
			}, -- [2]
			{
				["spellID"] = 263987,
				["icon"] = 237589,
				["name"] = "Heed My Call",
				["azeritePowerID"] = 22,
			}, -- [3]
			{
				["spellID"] = 267879,
				["icon"] = 132565,
				["name"] = "On My Way",
				["azeritePowerID"] = 38,
			}, -- [4]
			{
				["spellID"] = 279899,
				["icon"] = 514016,
				["name"] = "Unstable Flames",
				["azeritePowerID"] = 459,
			}, -- [5]
			{
				["spellID"] = 279926,
				["icon"] = 2065623,
				["name"] = "Earthlink",
				["azeritePowerID"] = 461,
			}, -- [6]
		}
	},
	["raid"] = {
		{
			["spellID"] = 280555,
			["icon"] = 2000853,
			["name"] = "Archive of the Titans",
			["azeritePowerID"] = 483,
		}, -- [1]
		{
			["spellID"] = 280559,
			["icon"] = 136039,
			["name"] = "Laser Matrix",
			["azeritePowerID"] = 485,
		}, -- [2]
		{
			["spellID"] = 288802,
			["icon"] = 895888,
			["name"] = "Bonded Souls",
			["azeritePowerID"] = 560,
		}, -- [3]
		{
			["spellID"] = 288749,
			["icon"] = 2442247,
			["name"] = "Seductive Power",
			["azeritePowerID"] = 561,
		}, -- [4]
		{
			["spellID"] = 288953,
			["icon"] = 1778226,
			["name"] = "Treacherous Covenant",
			["azeritePowerID"] = 562,
		}, -- [5]
		{
			["spellID"] = 303008,
			["icon"] = 1698701,
			["name"] = "Undulating Tides",
			["azeritePowerID"] = 575,
		}, -- [6]
		{
			["spellID"] = 303007,
			["icon"] = 136159,
			["name"] = "Loyal to the End",
			["azeritePowerID"] = 576,
		}, -- [7]
		{
			["spellID"] = 303006,
			["icon"] = 1391778,
			["name"] = "Arcane Heart",
			["azeritePowerID"] = 577,
		}, -- [8]
	},
	["zone"] = {
		{
			["spellID"] = 280710,
			["icon"] = 135885,
			["name"] = "Champion of Azeroth",
			["azeritePowerID"] = 82,
		}, -- [1]
		{
			["spellID"] = 273150,
			["icon"] = 135780,
			["name"] = "Ruinous Bolt",
			["azeritePowerID"] = 156,
		}, -- [2]
		{
			["spellID"] = 273790,
			["icon"] = 2011133,
			["name"] = "Rezan's Fury",
			["azeritePowerID"] = 157,
		}, -- [3]
		{
			["spellID"] = 273682,
			["icon"] = 132299,
			["name"] = "Meticulous Scheming",
			["azeritePowerID"] = 192,
		}, -- [4]
		{
			["spellID"] = 273823,
			["icon"] = 1778229,
			["name"] = "Blightborne Infusion",
			["azeritePowerID"] = 193,
		}, -- [5]
		{
			["spellID"] = 273834,
			["icon"] = 840409,
			["name"] = "Filthy Transfusion",
			["azeritePowerID"] = 194,
		}, -- [6]
		{
			["spellID"] = 273829,
			["icon"] = 463858,
			["name"] = "Secrets of the Deep",
			["azeritePowerID"] = 195,
		}, -- [7]
		{
			["spellID"] = 280429,
			["icon"] = 796638,
			["name"] = "Swirling Sands",
			["azeritePowerID"] = 196,
		}, -- [8]
		{
			["spellID"] = 280402,
			["icon"] = 1698701,
			["name"] = "Tidal Surge",
			["azeritePowerID"] = 478,
		}, -- [9]
		{
			["spellID"] = 280284,
			["icon"] = 135642,
			["name"] = "Dagger in the Back",
			["azeritePowerID"] = 479,
		}, -- [10]
		{
			["spellID"] = 280407,
			["icon"] = 463568,
			["name"] = "Blood Rite",
			["azeritePowerID"] = 480,
		}, -- [11]
		{
			["spellID"] = 280410,
			["icon"] = 132193,
			["name"] = "Incite the Pack",
			["azeritePowerID"] = 481,
		}, -- [12]
		{
			["spellID"] = 280380,
			["icon"] = 839983,
			["name"] = "Thunderous Blast",
			["azeritePowerID"] = 482,
		}, -- [13]
		{
			["spellID"] = 281514,
			["icon"] = 2032578,
			["name"] = "Unstable Catalyst",
			["azeritePowerID"] = 504,
		}, -- [14]
		{
			["spellID"] = 281841,
			["icon"] = 1029595,
			["name"] = "Tradewinds",
			["azeritePowerID"] = 505,
		}, -- [15]
		{
			["spellID"] = 287467,
			["icon"] = 135900,
			["name"] = "Shadow of Elune",
			["azeritePowerID"] = 521,
		}, -- [16]
		{
			["spellID"] = 287604,
			["icon"] = 874580,
			["name"] = "Ancients' Bulwark",
			["azeritePowerID"] = 522,
		}, -- [17]
		{
			["spellID"] = 287631,
			["icon"] = 463547,
			["name"] = "Apothecary's Concoctions",
			["azeritePowerID"] = 523,
		}, -- [18]
		{
			["spellID"] = 287662,
			["icon"] = 2357388,
			["name"] = "Endless Hunger",
			["azeritePowerID"] = 526,
		}, -- [19]
		{
			["spellID"] = 300168,
			["icon"] = 2115322,
			["name"] = "Person-Computer Interface",
			["azeritePowerID"] = 568,
		}, -- [20]
		{
			["spellID"] = 300170,
			["icon"] = 134377,
			["name"] = "Clockwork Heart",
			["azeritePowerID"] = 569,
		}, -- [21]
	},
	["profession"] = {
		{
			["spellID"] = 280163,
			["icon"] = 463515,
			["name"] = "Barrage Of Many Bombs",
			["azeritePowerID"] = 498,
		}, -- [1]
		{
			["spellID"] = 280168,
			["icon"] = 134427,
			["name"] = "Ricocheting Inflatable Pyrosaw",
			["azeritePowerID"] = 499,
		}, -- [2]
		{
			["spellID"] = 280174,
			["icon"] = 1320373,
			["name"] = "Synaptic Spark Capacitor",
			["azeritePowerID"] = 500,
		}, -- [3]
		{
			["spellID"] = 280178,
			["icon"] = 133873,
			["name"] = "Relational Normalization Gizmo",
			["azeritePowerID"] = 501,
		}, -- [4]
		{
			["spellID"] = 280181,
			["icon"] = 1336885,
			["name"] = "Personal Absorb-o-Tron",
			["azeritePowerID"] = 502,
		}, -- [5]
		{
			["spellID"] = 280172,
			["icon"] = 514950,
			["name"] = "Auto-Self-Cauterizer",
			["azeritePowerID"] = 503,
		}, -- [6]
	},
	["pvp"] = {
		{
			["spellID"] = 280577,
			["icon"] = 1028980,
			["name"] = "Glory in Battle",
			["azeritePowerID"] = 486,
		}, -- [1]
		{
			["spellID"] = 280579,
			["icon"] = 1035504,
			["name"] = "Retaliatory Fury",
			["azeritePowerID"] = 487,
		}, -- [2]
		{
			["spellID"] = 280582,
			["icon"] = 236646,
			["name"] = "Battlefield Focus",
			["azeritePowerID"] = 488,
		}, -- [3]
		{
			["spellID"] = 280598,
			["icon"] = 236560,
			["name"] = "Sylvanas' Resolve",
			["azeritePowerID"] = 489,
		}, -- [4]
		{
			["spellID"] = 280580,
			["icon"] = 236324,
			["name"] = "Combined Might",
			["azeritePowerID"] = 490,
		}, -- [5]
		{
			["spellID"] = 280581,
			["icon"] = 136003,
			["name"] = "Collective Will",
			["azeritePowerID"] = 491,
		}, -- [6]
		{
			["spellID"] = 280623,
			["icon"] = 1028984,
			["name"] = "Liberator's Might",
			["azeritePowerID"] = 492,
		}, -- [7]
		{
			["spellID"] = 280624,
			["icon"] = 236478,
			["name"] = "Last Gift",
			["azeritePowerID"] = 493,
		}, -- [8]
		{
			["spellID"] = 280627,
			["icon"] = 132486,
			["name"] = "Battlefield Precision",
			["azeritePowerID"] = 494,
		}, -- [9]
		{
			["spellID"] = 280628,
			["icon"] = 1042294,
			["name"] = "Anduin's Dedication",
			["azeritePowerID"] = 495,
		}, -- [10]
		{
			["spellID"] = 280625,
			["icon"] = 2022762,
			["name"] = "Stronger Together",
			["azeritePowerID"] = 496,
		}, -- [11]
		{
			["spellID"] = 280626,
			["icon"] = 236344,
			["name"] = "Stand As One",
			["azeritePowerID"] = 497,
		}, -- [12]
		{
			["spellID"] = 287818,
			["icon"] = 236310,
			["name"] = "Fight or Flight",
			["azeritePowerID"] = 541,
		}, -- [13]
	}
}
AzeritePowerWeights.sourceData = sourceData
-- 8.2 Azerite Essences
local essenceData = {
	["common"] = {
		{
			["essenceID"] = 4,
			["name"] = "Worldvein Resonance",
			["icon"] = 1830317,
		}, -- [1]
		{
			["essenceID"] = 12,
			["name"] = "The Crucible of Flame",
			["icon"] = 3015740,
		}, -- [2]
		{
			["essenceID"] = 15,
			["name"] = "Ripple in Space",
			["icon"] = 2967109,
		}, -- [3]
		{
			["essenceID"] = 22,
			["name"] = "Vision of Perfection",
			["icon"] = 3015743,
		}, -- [4]
		{
			["essenceID"] = 27,
			["name"] = "Memory of Lucid Dreams",
			["icon"] = 2967104,
		}, -- [5]
		{
			["essenceID"] = 32,
			["name"] = "Conflict and Strife",
			["icon"] = 3015742,
		}, -- [6]
	},
	["tank"] = {
		{
			["essenceID"] = 2,
			["name"] = "Azeroth's Undying Gift",
			["icon"] = 2967107,
		}, -- [1]
		{
			["essenceID"] = 3,
			["name"] = "Sphere of Suppression",
			["icon"] = 2065602,
		}, -- [2]
		{
			["essenceID"] = 7,
			["name"] = "Anima of Life and Death",
			["icon"] = 2967105,
		}, -- [3]
		{
			["essenceID"] = 13,
			["name"] = "Nullification Dynamo",
			["icon"] = 3015741,
		}, -- [4]
		{
			["essenceID"] = 25,
			["name"] = "Aegis of the Deep",
			["icon"] = 2967110,
		}, -- [5]
	},
	["healer"] = {
		{
			["essenceID"] = 17,
			["name"] = "The Ever-Rising Tide",
			["icon"] = 2967108,
		}, -- [1]
		{
			["essenceID"] = 18,
			["name"] = "Artifice of Time",
			["icon"] = 2967112,
		}, -- [2]
		{
			["essenceID"] = 19,
			["name"] = "The Well of Existence",
			["icon"] = 516796,
		}, -- [3]
		{
			["essenceID"] = 20,
			["name"] = "Life-Binder's Invocation",
			["icon"] = 2967106,
		}, -- [4]
		{
			["essenceID"] = 21,
			["name"] = "Vitality Conduit",
			["icon"] = 2967100,
		}, -- [5]
	},
	["damager"] = {
		{
			["essenceID"] = 5,
			["name"] = "Essence of the Focusing Iris",
			["icon"] = 2967111,
		}, -- [1]
		{
			["essenceID"] = 6,
			["name"] = "Purification Protocol",
			["icon"] = 2967103,
		}, -- [2]
		{
			["essenceID"] = 14,
			["name"] = "Condensed Life-Force",
			["icon"] = 2967113,
		}, -- [3]
		{
			["essenceID"] = 23,
			["name"] = "Blood of the Enemy",
			["icon"] = 2032580,
		}, -- [4]
		{
			["essenceID"] = 28,
			["name"] = "The Unbound Force",
			["icon"] = 2967102,
		}, -- [5]
	}
}
AzeritePowerWeights.essenceData = essenceData

-- Default Scales Data
--[[
local defaultName = U["DefaultScaleName_Default"]
local defensiveName = U["DefaultScaleName_Defensive"]
local offensiveName = U["DefaultScaleName_Offensive"]
local defaultNameTable = {
	--[defaultName] = true,
	[defensiveName] = true,
	[offensiveName] = true
}
]]
local defaultName = "Default"
local defensiveName = "Defensive"
local offensiveName = "Offensive"
local defaultNameTable = {
	[defaultName] = U["DefaultScaleName_Default"],
	[defensiveName] = U["DefaultScaleName_Defensive"],
	[offensiveName] = U["DefaultScaleName_Offensive"]
}
AzeritePowerWeights.defaultNameTable = defaultNameTable
local defaultScalesData = {}
AzeritePowerWeights.defaultScalesData = defaultScalesData

local function insertDefaultScalesData(scaleName, classIndex, specNum, powerScales, essenceScales, timestamp)
	defaultScalesData[#defaultScalesData + 1] = {
		scaleName,
		classIndex,
		specNum,
		powerScales,
		essenceScales,
		timestamp
	}
end

do
		insertDefaultScalesData(defaultName, 12, 1, { -- Havoc Demon Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16807 - 19345 (avg 18212), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[159] = 9.76, -- Furious Gaze
			[496] = 1.49, -- Stronger Together
			[459] = 2.28, -- Unstable Flames
			[18] = 1.35, -- Blood Siphon
			[461] = 1.5, -- Earthlink
			[83] = 0.02, -- Impassive Visage
			[21] = 2.19, -- Elemental Whirl
			[560] = 2.14, -- Bonded Souls
			[82] = 6.33, -- Champion of Azeroth
			[561] = 4.14, -- Seductive Power
			[504] = 5.2, -- Unstable Catalyst
			[19] = 0.02, -- Woundbinder
			[38] = 2.17, -- On My Way
			[104] = 0.07, -- Bracing Chill
			[495] = 4.45, -- Anduin's Dedication
			[220] = 9.31, -- Chaotic Transformation
			[30] = 4.17, -- Overwhelming Power
			[523] = 5.03, -- Apothecary's Concoctions
			[500] = 3.28, -- Synaptic Spark Capacitor
			[160] = 0.08, -- Infernal Armor
			[564] = 0.15, -- Thrive in Chaos
			[541] = 1.67, -- Fight or Flight
			[42] = 0.01, -- Savior
			[44] = 0.06, -- Vampiric Speed
			[192] = 4.66, -- Meticulous Scheming
			[497] = 1.26, -- Stand As One
			[493] = 1.93, -- Last Gift
			[466] = 0.1, -- Burning Soul
			[562] = 7.17, -- Treacherous Covenant
			[522] = 7.32, -- Ancients' Bulwark
			[194] = 4.89, -- Filthy Transfusion
			[494] = 6.47, -- Battlefield Precision
			[480] = 4.37, -- Blood Rite
			[86] = 0.07, -- Azerite Fortification
			[99] = 0.13, -- Ablative Shielding
			[156] = 3.52, -- Ruinous Bolt
			[31] = 3.29, -- Gutripper
			[126] = 7.18, -- Revolving Blades
			[483] = 5.13, -- Archive of the Titans
			[482] = 5.09, -- Thunderous Blast
			[196] = 6.11, -- Swirling Sands
			[505] = 3.46, -- Tradewinds
			[43] = 0.01, -- Winds of War
			[492] = 4.22, -- Liberator's Might
			[245] = 4.33, -- Seething Power
			[521] = 4.25, -- Shadow of Elune
			[501] = 5.49, -- Relational Normalization Gizmo
			[576] = 2.39, -- Loyal to the End
			[526] = 7.33, -- Endless Hunger
			[569] = 5.59, -- Clockwork Heart
			[462] = 1.88, -- Azerite Globules
			[103] = 0.01, -- Concentrated Mending
			[499] = 2.41, -- Ricocheting Inflatable Pyrosaw
			[193] = 6.73, -- Blightborne Infusion
			[577] = 2.21, -- Arcane Heart
			[575] = 10, -- Undulating Tides
			[22] = 2.75, -- Heed My Call
			[85] = 0.06, -- Gemhide
			[481] = 3.3, -- Incite the Pack
			[195] = 4.61, -- Secrets of the Deep
			[498] = 4.11, -- Barrage Of Many Bombs
			[485] = 5.51, -- Laser Matrix
			[105] = 0.1, -- Ephemeral Recovery
			[352] = 9.09, -- Thirsting Blades
			[353] = 2.5, -- Eyes of Rage
			[478] = 6, -- Tidal Surge
			[98] = 0.06, -- Crystalline Carapace
			[157] = 6.35, -- Rezan's Fury
			[20] = 2.1, -- Lifespeed
			[479] = 6.37, -- Dagger in the Back
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16649 - 21117 (avg 18088), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 1.97, 1.19 }, -- Worldvein Resonance
			[22] = { 6.28, 1.64 }, -- Vision of Perfection
			[23] = { 6.28, 1.99 }, -- Blood of the Enemy
			[15] = { 4.9, 0.03 }, -- Ripple in Space
			[27] = { 6.64, 3.32 }, -- Memory of Lucid Dreams
			[5] = { 9.06, 3.47 }, -- Essence of the Focusing Iris
			[28] = { 4.05, 1.54 }, -- The Unbound Force
			[12] = { 10, 3.63 }, -- The Crucible of Flame
			[6] = { 7.14, 2.99 }, -- Purification Protocol
			[14] = { 9.5, 3.58 }, -- Condensed Life-Force
		}, 1564736400)

		insertDefaultScalesData(offensiveName, 12, 2, { -- Vengeance Demon Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5006 - 8272 (avg 5616), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[42] = 0.02, -- Savior
			[13] = 0.03, -- Azerite Empowered
			[156] = 3.8, -- Ruinous Bolt
			[497] = 1, -- Stand As One
			[459] = 1.83, -- Unstable Flames
			[194] = 5.7, -- Filthy Transfusion
			[98] = 0.05, -- Crystalline Carapace
			[576] = 2.21, -- Loyal to the End
			[564] = 0.06, -- Thrive in Chaos
			[541] = 1.36, -- Fight or Flight
			[560] = 1.16, -- Bonded Souls
			[577] = 0.64, -- Arcane Heart
			[479] = 4.6, -- Dagger in the Back
			[561] = 3.06, -- Seductive Power
			[193] = 5.1, -- Blightborne Infusion
			[195] = 3.64, -- Secrets of the Deep
			[481] = 2.93, -- Incite the Pack
			[18] = 1.18, -- Blood Siphon
			[522] = 4.37, -- Ancients' Bulwark
			[498] = 3.92, -- Barrage Of Many Bombs
			[134] = 0.06, -- Revel in Pain
			[38] = 1.28, -- On My Way
			[562] = 5.57, -- Treacherous Covenant
			[521] = 2.57, -- Shadow of Elune
			[503] = 0.06, -- Auto-Self-Cauterizer
			[502] = 0.03, -- Personal Absorb-o-Tron
			[478] = 6.44, -- Tidal Surge
			[495] = 3.52, -- Anduin's Dedication
			[83] = 0.02, -- Impassive Visage
			[504] = 4.05, -- Unstable Catalyst
			[100] = 0.01, -- Strength in Numbers
			[21] = 1.49, -- Elemental Whirl
			[461] = 1.25, -- Earthlink
			[500] = 3.39, -- Synaptic Spark Capacitor
			[492] = 2.79, -- Liberator's Might
			[463] = 0.07, -- Blessed Portents
			[20] = 1.14, -- Lifespeed
			[505] = 3.15, -- Tradewinds
			[494] = 6.3, -- Battlefield Precision
			[483] = 4.05, -- Archive of the Titans
			[493] = 1.83, -- Last Gift
			[192] = 3.32, -- Meticulous Scheming
			[44] = 0.02, -- Vampiric Speed
			[466] = 0.02, -- Burning Soul
			[462] = 1.77, -- Azerite Globules
			[569] = 3.82, -- Clockwork Heart
			[14] = 0.06, -- Longstrider
			[485] = 5.49, -- Laser Matrix
			[496] = 0.92, -- Stronger Together
			[99] = 0.01, -- Ablative Shielding
			[501] = 3.71, -- Relational Normalization Gizmo
			[157] = 6.21, -- Rezan's Fury
			[480] = 2.49, -- Blood Rite
			[499] = 2.42, -- Ricocheting Inflatable Pyrosaw
			[31] = 3.02, -- Gutripper
			[22] = 2.85, -- Heed My Call
			[196] = 4.54, -- Swirling Sands
			[82] = 4.12, -- Champion of Azeroth
			[103] = 0.02, -- Concentrated Mending
			[575] = 10, -- Undulating Tides
			[482] = 5.26, -- Thunderous Blast
			[526] = 4.28, -- Endless Hunger
			[43] = 0.01, -- Winds of War
			[523] = 5.06, -- Apothecary's Concoctions
			[30] = 2.28, -- Overwhelming Power
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5020 - 5548 (avg 5289), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 0.12, 0 }, -- Ripple in Space
			[32] = { 3.26, 3.07 }, -- Conflict and Strife
			[4] = { 2.56, 2.55 }, -- Worldvein Resonance
			[7] = { 0.03, 0.03 }, -- Anima of Life and Death
			[2] = { 0.05, 0.04 }, -- Azeroth's Undying Gift
			[12] = { 10, 9.94 }, -- The Crucible of Flame
			[3] = { 6.74, 6.94 }, -- Sphere of Suppression
			[13] = { 0.01, 0 }, -- Nullification Dynamo
			[25] = { 1.47, 1.38 }, -- Aegis of the Deep
			[22] = { 2.47, 0.25 }, -- Vision of Perfection
			[27] = { 2.52, 2.65 }, -- Memory of Lucid Dreams
		}, 1564736400)

		insertDefaultScalesData(offensiveName, 6, 1, { -- Blood Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7175 - 10276 (avg 7669), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[501] = 3.77, -- Relational Normalization Gizmo
			[497] = 0.87, -- Stand As One
			[192] = 3.81, -- Meticulous Scheming
			[562] = 4.9, -- Treacherous Covenant
			[104] = 0.01, -- Bracing Chill
			[459] = 1.75, -- Unstable Flames
			[98] = 0.06, -- Crystalline Carapace
			[193] = 5.19, -- Blightborne Infusion
			[493] = 1.57, -- Last Gift
			[479] = 4.63, -- Dagger in the Back
			[478] = 6.01, -- Tidal Surge
			[348] = 3.25, -- Eternal Rune Weapon
			[560] = 1.76, -- Bonded Souls
			[499] = 2.57, -- Ricocheting Inflatable Pyrosaw
			[157] = 6.23, -- Rezan's Fury
			[106] = 1.87, -- Deep Cuts
			[140] = 0.75, -- Bone Spike Graveyard
			[19] = 0.04, -- Woundbinder
			[503] = 0.1, -- Auto-Self-Cauterizer
			[485] = 5.62, -- Laser Matrix
			[197] = 0.07, -- Marrowblood
			[495] = 3.06, -- Anduin's Dedication
			[492] = 3.16, -- Liberator's Might
			[463] = 0.04, -- Blessed Portents
			[156] = 3.67, -- Ruinous Bolt
			[31] = 3.11, -- Gutripper
			[481] = 2.73, -- Incite the Pack
			[89] = 0.06, -- Azerite Veins
			[20] = 1.13, -- Lifespeed
			[480] = 3.1, -- Blood Rite
			[194] = 5.7, -- Filthy Transfusion
			[504] = 3.59, -- Unstable Catalyst
			[577] = 0.66, -- Arcane Heart
			[243] = 3.43, -- Bloody Runeblade
			[86] = 0.1, -- Azerite Fortification
			[462] = 1.86, -- Azerite Globules
			[569] = 4.1, -- Clockwork Heart
			[465] = 0.13, -- March of the Damned
			[461] = 1.16, -- Earthlink
			[505] = 2.97, -- Tradewinds
			[494] = 6.37, -- Battlefield Precision
			[105] = 0.07, -- Ephemeral Recovery
			[14] = 0.07, -- Longstrider
			[483] = 3.7, -- Archive of the Titans
			[42] = 0.05, -- Savior
			[101] = 0.06, -- Shimmering Haven
			[523] = 5.14, -- Apothecary's Concoctions
			[196] = 4.62, -- Swirling Sands
			[482] = 5.43, -- Thunderous Blast
			[44] = 0.1, -- Vampiric Speed
			[15] = 0.07, -- Resounding Protection
			[496] = 0.91, -- Stronger Together
			[201] = 0.05, -- Runic Barrier
			[195] = 3.21, -- Secrets of the Deep
			[526] = 4.51, -- Endless Hunger
			[43] = 0.02, -- Winds of War
			[521] = 3.06, -- Shadow of Elune
			[575] = 10, -- Undulating Tides
			[576] = 2.04, -- Loyal to the End
			[87] = 0.12, -- Self Reliance
			[21] = 1.57, -- Elemental Whirl
			[99] = 0.03, -- Ablative Shielding
			[18] = 1.15, -- Blood Siphon
			[561] = 2.82, -- Seductive Power
			[522] = 4.57, -- Ancients' Bulwark
			[83] = 0.04, -- Impassive Visage
			[38] = 1.31, -- On My Way
			[30] = 3.05, -- Overwhelming Power
			[498] = 4.13, -- Barrage Of Many Bombs
			[541] = 1.14, -- Fight or Flight
			[100] = 0.05, -- Strength in Numbers
			[84] = 0.09, -- Bulwark of the Masses
			[349] = 0.32, -- Bones of the Damned
			[82] = 4.06, -- Champion of Azeroth
			[22] = 2.84, -- Heed My Call
			[568] = 0.04, -- Person-Computer Interface
			[500] = 3.26, -- Synaptic Spark Capacitor
			[549] = 0.08, -- Cold Hearted
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7017 - 7733 (avg 7374), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[2] = { 0.03, 0.03 }, -- Azeroth's Undying Gift
			[4] = { 1.27, 0.84 }, -- Worldvein Resonance
			[12] = { 10, 3.54 }, -- The Crucible of Flame
			[22] = { 0.05, 0.03 }, -- Vision of Perfection
			[32] = { 1.21, 1.16 }, -- Conflict and Strife
			[7] = { 2.16, 0.03 }, -- Anima of Life and Death
			[15] = { 3.77, 0.02 }, -- Ripple in Space
			[3] = { 3.03, 3.03 }, -- Sphere of Suppression
			[13] = { 0.05, 0 }, -- Nullification Dynamo
			[25] = { 0.59, 0.6 }, -- Aegis of the Deep
			[27] = { 0, 1.34 }, -- Memory of Lucid Dreams
		}, 1564736400)

		insertDefaultScalesData(defaultName, 6, 2, { -- Frost Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 13656 - 17358 (avg 14567), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[504] = 6.8, -- Unstable Catalyst
			[498] = 4.04, -- Barrage Of Many Bombs
			[22] = 2.65, -- Heed My Call
			[501] = 6.26, -- Relational Normalization Gizmo
			[479] = 6.35, -- Dagger in the Back
			[196] = 7.42, -- Swirling Sands
			[31] = 2.88, -- Gutripper
			[38] = 2.31, -- On My Way
			[505] = 6.03, -- Tradewinds
			[577] = 2.15, -- Arcane Heart
			[495] = 5.9, -- Anduin's Dedication
			[521] = 4.52, -- Shadow of Elune
			[492] = 4.76, -- Liberator's Might
			[493] = 3.05, -- Last Gift
			[21] = 2.54, -- Elemental Whirl
			[194] = 5.57, -- Filthy Transfusion
			[526] = 7.83, -- Endless Hunger
			[499] = 2.32, -- Ricocheting Inflatable Pyrosaw
			[523] = 4.91, -- Apothecary's Concoctions
			[198] = 4.47, -- Frostwhelp's Indignation
			[482] = 5.15, -- Thunderous Blast
			[478] = 6.43, -- Tidal Surge
			[483] = 6.51, -- Archive of the Titans
			[522] = 7.96, -- Ancients' Bulwark
			[485] = 5.54, -- Laser Matrix
			[497] = 1.55, -- Stand As One
			[141] = 5.83, -- Latent Chill
			[347] = 6.47, -- Frozen Tempest
			[461] = 1.92, -- Earthlink
			[195] = 6.12, -- Secrets of the Deep
			[549] = 0.03, -- Cold Hearted
			[541] = 2.14, -- Fight or Flight
			[18] = 2.21, -- Blood Siphon
			[242] = 4.86, -- Echoing Howl
			[494] = 6.26, -- Battlefield Precision
			[561] = 4.95, -- Seductive Power
			[562] = 9.3, -- Treacherous Covenant
			[576] = 3.91, -- Loyal to the End
			[496] = 1.48, -- Stronger Together
			[502] = 0.04, -- Personal Absorb-o-Tron
			[575] = 10, -- Undulating Tides
			[346] = 4.86, -- Killer Frost
			[82] = 7.38, -- Champion of Azeroth
			[192] = 4.63, -- Meticulous Scheming
			[156] = 3.83, -- Ruinous Bolt
			[30] = 3.94, -- Overwhelming Power
			[462] = 1.76, -- Azerite Globules
			[108] = 5.33, -- Icy Citadel
			[459] = 2.96, -- Unstable Flames
			[20] = 1.88, -- Lifespeed
			[569] = 5.63, -- Clockwork Heart
			[193] = 8.22, -- Blightborne Infusion
			[157] = 6.22, -- Rezan's Fury
			[560] = 1.93, -- Bonded Souls
			[481] = 5.54, -- Incite the Pack
			[500] = 3.41, -- Synaptic Spark Capacitor
			[480] = 4.67, -- Blood Rite
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 12016 - 15385 (avg 13828), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 1.81, 1.55 }, -- Worldvein Resonance
			[22] = { 4.51, 0.34 }, -- Vision of Perfection
			[28] = { 4.1, 1.92 }, -- The Unbound Force
			[5] = { 10, 3.12 }, -- Essence of the Focusing Iris
			[14] = { 9.41, 3.27 }, -- Condensed Life-Force
			[23] = { 7.14, 0.76 }, -- Blood of the Enemy
			[12] = { 8.79, 3.54 }, -- The Crucible of Flame
			[15] = { 4.56, 0.02 }, -- Ripple in Space
			[32] = { 5.22, 2.01 }, -- Conflict and Strife
			[6] = { 6.83, 2.9 }, -- Purification Protocol
			[27] = { 7.21, 4.38 }, -- Memory of Lucid Dreams
		}, 1564736400)

		insertDefaultScalesData(defaultName, 6, 3, { -- Unholy Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 8763 - 12061 (avg 9225), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[560] = 2.14, -- Bonded Souls
			[499] = 2.68, -- Ricocheting Inflatable Pyrosaw
			[192] = 4.98, -- Meticulous Scheming
			[84] = 0.12, -- Bulwark of the Masses
			[526] = 7.28, -- Endless Hunger
			[494] = 6.51, -- Battlefield Precision
			[201] = 0.14, -- Runic Barrier
			[87] = 0.3, -- Self Reliance
			[541] = 1.99, -- Fight or Flight
			[576] = 3.37, -- Loyal to the End
			[101] = 0.1, -- Shimmering Haven
			[20] = 2.12, -- Lifespeed
			[505] = 4.78, -- Tradewinds
			[502] = 0.14, -- Personal Absorb-o-Tron
			[140] = 0.15, -- Bone Spike Graveyard
			[480] = 4.35, -- Blood Rite
			[15] = 0.21, -- Resounding Protection
			[501] = 5.71, -- Relational Normalization Gizmo
			[244] = 5.93, -- Harrowing Decay
			[462] = 1.95, -- Azerite Globules
			[493] = 2.71, -- Last Gift
			[504] = 6.17, -- Unstable Catalyst
			[22] = 2.9, -- Heed My Call
			[465] = 0.17, -- March of the Damned
			[196] = 6.61, -- Swirling Sands
			[157] = 6.39, -- Rezan's Fury
			[479] = 6.65, -- Dagger in the Back
			[459] = 2.68, -- Unstable Flames
			[351] = 3.45, -- Last Surprise
			[19] = 0.22, -- Woundbinder
			[521] = 4.32, -- Shadow of Elune
			[103] = 0.22, -- Concentrated Mending
			[42] = 0.09, -- Savior
			[503] = 0.17, -- Auto-Self-Cauterizer
			[481] = 4.38, -- Incite the Pack
			[522] = 7.27, -- Ancients' Bulwark
			[561] = 4.45, -- Seductive Power
			[562] = 8.46, -- Treacherous Covenant
			[495] = 5.28, -- Anduin's Dedication
			[575] = 10, -- Undulating Tides
			[18] = 1.8, -- Blood Siphon
			[194] = 5.83, -- Filthy Transfusion
			[82] = 6.34, -- Champion of Azeroth
			[497] = 1.6, -- Stand As One
			[99] = 0.16, -- Ablative Shielding
			[100] = 0.12, -- Strength in Numbers
			[568] = 0.06, -- Person-Computer Interface
			[199] = 9.56, -- Festermight
			[105] = 0.13, -- Ephemeral Recovery
			[193] = 7.42, -- Blightborne Infusion
			[30] = 4.15, -- Overwhelming Power
			[142] = 5.78, -- Helchains
			[31] = 3.19, -- Gutripper
			[500] = 3.55, -- Synaptic Spark Capacitor
			[463] = 0.11, -- Blessed Portents
			[156] = 3.85, -- Ruinous Bolt
			[577] = 1.65, -- Arcane Heart
			[549] = 0.08, -- Cold Hearted
			[482] = 5.42, -- Thunderous Blast
			[350] = 3.98, -- Cankerous Wounds
			[98] = 0.27, -- Crystalline Carapace
			[89] = 0.09, -- Azerite Veins
			[44] = 0.2, -- Vampiric Speed
			[569] = 4.92, -- Clockwork Heart
			[43] = 0.2, -- Winds of War
			[13] = 0.26, -- Azerite Empowered
			[14] = 0.22, -- Longstrider
			[478] = 6.23, -- Tidal Surge
			[498] = 4.27, -- Barrage Of Many Bombs
			[104] = 0.03, -- Bracing Chill
			[109] = 7.33, -- Magus of the Dead
			[38] = 2.24, -- On My Way
			[461] = 1.93, -- Earthlink
			[86] = 0.12, -- Azerite Fortification
			[21] = 2.31, -- Elemental Whirl
			[85] = 0.11, -- Gemhide
			[496] = 1.48, -- Stronger Together
			[195] = 5.43, -- Secrets of the Deep
			[83] = 0.2, -- Impassive Visage
			[523] = 5.33, -- Apothecary's Concoctions
			[483] = 5.86, -- Archive of the Titans
			[492] = 4.46, -- Liberator's Might
			[485] = 5.57, -- Laser Matrix
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7826 - 11530 (avg 9084), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 4.83, 0.05 }, -- Ripple in Space
			[27] = { 3.29, 2.35 }, -- Memory of Lucid Dreams
			[14] = { 8.42, 3.08 }, -- Condensed Life-Force
			[23] = { 5.32, 0.5 }, -- Blood of the Enemy
			[12] = { 8.92, 3.29 }, -- The Crucible of Flame
			[22] = { 2.21, 0 }, -- Vision of Perfection
			[32] = { 1.68, 1.71 }, -- Conflict and Strife
			[5] = { 10, 2.74 }, -- Essence of the Focusing Iris
			[28] = { 3.81, 1.59 }, -- The Unbound Force
			[4] = { 2.03, 1.24 }, -- Worldvein Resonance
			[6] = { 6.42, 2.63 }, -- Purification Protocol
		}, 1564736400)

		insertDefaultScalesData(defaultName, 11, 1, { -- Balance Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11044 - 14111 (avg 12001), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[482] = 3.31, -- Thunderous Blast
			[103] = 0.02, -- Concentrated Mending
			[42] = 0.12, -- Savior
			[498] = 2.46, -- Barrage Of Many Bombs
			[18] = 1.63, -- Blood Siphon
			[499] = 1.58, -- Ricocheting Inflatable Pyrosaw
			[492] = 2.77, -- Liberator's Might
			[364] = 2.86, -- Lively Spirit
			[479] = 3.96, -- Dagger in the Back
			[104] = 0.09, -- Bracing Chill
			[173] = 2.52, -- Power of the Moon
			[495] = 3.42, -- Anduin's Dedication
			[497] = 0.91, -- Stand As One
			[480] = 2.88, -- Blood Rite
			[503] = 0.08, -- Auto-Self-Cauterizer
			[523] = 3.15, -- Apothecary's Concoctions
			[250] = 3.69, -- Dawning Sun
			[504] = 3.97, -- Unstable Catalyst
			[541] = 1.28, -- Fight or Flight
			[459] = 1.54, -- Unstable Flames
			[478] = 3.46, -- Tidal Surge
			[481] = 3.77, -- Incite the Pack
			[196] = 4.09, -- Swirling Sands
			[575] = 6.12, -- Undulating Tides
			[569] = 3.81, -- Clockwork Heart
			[15] = 0.02, -- Resounding Protection
			[30] = 2.8, -- Overwhelming Power
			[156] = 2.11, -- Ruinous Bolt
			[483] = 3.93, -- Archive of the Titans
			[44] = 0.01, -- Vampiric Speed
			[14] = 0.11, -- Longstrider
			[98] = 0.11, -- Crystalline Carapace
			[86] = 0.04, -- Azerite Fortification
			[357] = 0.06, -- Lunar Shrapnel
			[493] = 2.2, -- Last Gift
			[560] = 1.56, -- Bonded Souls
			[20] = 1.36, -- Lifespeed
			[462] = 1.16, -- Azerite Globules
			[526] = 4.55, -- Endless Hunger
			[461] = 1.23, -- Earthlink
			[540] = 0.01, -- Switch Hitter
			[38] = 1.29, -- On My Way
			[356] = 1.77, -- High Noon
			[22] = 1.66, -- Heed My Call
			[500] = 1.89, -- Synaptic Spark Capacitor
			[501] = 3.76, -- Relational Normalization Gizmo
			[522] = 4.61, -- Ancients' Bulwark
			[561] = 3.21, -- Seductive Power
			[496] = 0.93, -- Stronger Together
			[521] = 2.87, -- Shadow of Elune
			[99] = 0.04, -- Ablative Shielding
			[82] = 4.56, -- Champion of Azeroth
			[87] = 0.06, -- Self Reliance
			[43] = 0.03, -- Winds of War
			[502] = 0.04, -- Personal Absorb-o-Tron
			[122] = 3.68, -- Streaking Stars
			[105] = 0.02, -- Ephemeral Recovery
			[200] = 10, -- Arcanic Pulsar
			[192] = 3.64, -- Meticulous Scheming
			[85] = 0.1, -- Gemhide
			[100] = 0.07, -- Strength in Numbers
			[194] = 3.41, -- Filthy Transfusion
			[195] = 3.58, -- Secrets of the Deep
			[31] = 1.93, -- Gutripper
			[494] = 3.86, -- Battlefield Precision
			[505] = 4.02, -- Tradewinds
			[467] = 0.02, -- Ursoc's Endurance
			[568] = 0.01, -- Person-Computer Interface
			[193] = 4.55, -- Blightborne Infusion
			[89] = 0.1, -- Azerite Veins
			[157] = 3.74, -- Rezan's Fury
			[84] = 0.04, -- Bulwark of the Masses
			[485] = 3.36, -- Laser Matrix
			[21] = 1.65, -- Elemental Whirl
			[576] = 2.71, -- Loyal to the End
			[19] = 0.12, -- Woundbinder
			[562] = 5.35, -- Treacherous Covenant
			[577] = 1.44, -- Arcane Heart
			[83] = 0.02, -- Impassive Visage
			[101] = 0.04, -- Shimmering Haven
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 9231 - 14147 (avg 11730), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 3.6, 0.12 }, -- Ripple in Space
			[32] = { 10, 2 }, -- Conflict and Strife
			[4] = { 0.83, 1.49 }, -- Worldvein Resonance
			[27] = { 5, 2.91 }, -- Memory of Lucid Dreams
			[14] = { 9.7, 3.46 }, -- Condensed Life-Force
			[28] = { 3.2, 1.84 }, -- The Unbound Force
			[23] = { 4.69, 0.91 }, -- Blood of the Enemy
			[5] = { 8.34, 3.27 }, -- Essence of the Focusing Iris
			[6] = { 5.39, 2.89 }, -- Purification Protocol
			[12] = { 6.78, 3.56 }, -- The Crucible of Flame
			[22] = { 4.75, 1.18 }, -- Vision of Perfection
		}, 1564736400)

		insertDefaultScalesData(defaultName, 11, 2, { -- Feral Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 17189 - 20447 (avg 18520), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[505] = 5.74, -- Tradewinds
			[568] = 0.03, -- Person-Computer Interface
			[494] = 5.54, -- Battlefield Precision
			[157] = 5.4, -- Rezan's Fury
			[42] = 0.03, -- Savior
			[461] = 1.67, -- Earthlink
			[100] = 0.07, -- Strength in Numbers
			[98] = 0.04, -- Crystalline Carapace
			[194] = 4.16, -- Filthy Transfusion
			[523] = 4.46, -- Apothecary's Concoctions
			[541] = 1.63, -- Fight or Flight
			[493] = 3.06, -- Last Gift
			[209] = 10, -- Jungle Fury
			[499] = 2.22, -- Ricocheting Inflatable Pyrosaw
			[504] = 4.93, -- Unstable Catalyst
			[500] = 2.74, -- Synaptic Spark Capacitor
			[43] = 0.11, -- Winds of War
			[358] = 5.41, -- Gushing Lacerations
			[38] = 2.19, -- On My Way
			[478] = 5.34, -- Tidal Surge
			[462] = 1.57, -- Azerite Globules
			[526] = 7.64, -- Endless Hunger
			[14] = 0.03, -- Longstrider
			[522] = 7.49, -- Ancients' Bulwark
			[241] = 0.02, -- Twisted Claws
			[467] = 0.05, -- Ursoc's Endurance
			[82] = 7.22, -- Champion of Azeroth
			[22] = 2.36, -- Heed My Call
			[104] = 0.09, -- Bracing Chill
			[575] = 8.68, -- Undulating Tides
			[31] = 2.73, -- Gutripper
			[44] = 0.1, -- Vampiric Speed
			[89] = 0.1, -- Azerite Veins
			[156] = 3.26, -- Ruinous Bolt
			[359] = 6.47, -- Wild Fleshrending
			[479] = 5.72, -- Dagger in the Back
			[101] = 0.14, -- Shimmering Haven
			[501] = 4.75, -- Relational Normalization Gizmo
			[19] = 0.16, -- Woundbinder
			[20] = 1.82, -- Lifespeed
			[21] = 2.46, -- Elemental Whirl
			[193] = 8.09, -- Blightborne Infusion
			[569] = 6.46, -- Clockwork Heart
			[192] = 4.35, -- Meticulous Scheming
			[169] = 2.73, -- Untamed Ferocity
			[503] = 0.12, -- Auto-Self-Cauterizer
			[13] = 0.09, -- Azerite Empowered
			[463] = 0.1, -- Blessed Portents
			[495] = 4.19, -- Anduin's Dedication
			[103] = 0.1, -- Concentrated Mending
			[576] = 3.88, -- Loyal to the End
			[480] = 3.64, -- Blood Rite
			[219] = 0.17, -- Reawakening
			[30] = 3.33, -- Overwhelming Power
			[540] = 0.06, -- Switch Hitter
			[483] = 4.99, -- Archive of the Titans
			[481] = 5.39, -- Incite the Pack
			[99] = 0.13, -- Ablative Shielding
			[86] = 0.13, -- Azerite Fortification
			[482] = 4.53, -- Thunderous Blast
			[562] = 6.82, -- Treacherous Covenant
			[497] = 1.13, -- Stand As One
			[18] = 2.24, -- Blood Siphon
			[498] = 3.55, -- Barrage Of Many Bombs
			[496] = 1.61, -- Stronger Together
			[84] = 0.14, -- Bulwark of the Masses
			[521] = 3.77, -- Shadow of Elune
			[485] = 4.72, -- Laser Matrix
			[247] = 1.39, -- Iron Jaws
			[111] = 4.79, -- Blood Mist
			[459] = 2.92, -- Unstable Flames
			[492] = 4.38, -- Liberator's Might
			[83] = 0.07, -- Impassive Visage
			[195] = 4.45, -- Secrets of the Deep
			[560] = 1.89, -- Bonded Souls
			[105] = 0.08, -- Ephemeral Recovery
			[577] = 2.45, -- Arcane Heart
			[196] = 7.3, -- Swirling Sands
			[561] = 3.91, -- Seductive Power
			[15] = 0.11, -- Resounding Protection
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16949 - 18874 (avg 18047), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 2.71, 2.22 }, -- Memory of Lucid Dreams
			[5] = { 6, 2.27 }, -- Essence of the Focusing Iris
			[12] = { 5.88, 2.48 }, -- The Crucible of Flame
			[6] = { 4.51, 2.04 }, -- Purification Protocol
			[28] = { 2.31, 1.25 }, -- The Unbound Force
			[23] = { 4.64, 0.76 }, -- Blood of the Enemy
			[4] = { 0.94, 0.99 }, -- Worldvein Resonance
			[22] = { 1.97, 0.47 }, -- Vision of Perfection
			[14] = { 6.03, 2.38 }, -- Condensed Life-Force
			[15] = { 2.69, 0.03 }, -- Ripple in Space
			[32] = { 10, 1.84 }, -- Conflict and Strife
		}, 1564736400)

		insertDefaultScalesData(offensiveName, 11, 3, { -- Guardian Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 4171 - 6574 (avg 4738), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[495] = 3.71, -- Anduin's Dedication
			[467] = 0.01, -- Ursoc's Endurance
			[251] = 4.51, -- Burst of Savagery
			[494] = 6.29, -- Battlefield Precision
			[481] = 3.38, -- Incite the Pack
			[21] = 1.67, -- Elemental Whirl
			[196] = 4.41, -- Swirling Sands
			[569] = 4.14, -- Clockwork Heart
			[103] = 0.07, -- Concentrated Mending
			[483] = 4.31, -- Archive of the Titans
			[89] = 0.03, -- Azerite Veins
			[502] = 0.03, -- Personal Absorb-o-Tron
			[30] = 3.1, -- Overwhelming Power
			[194] = 5.38, -- Filthy Transfusion
			[20] = 1.68, -- Lifespeed
			[157] = 6.24, -- Rezan's Fury
			[361] = 4.06, -- Guardian's Wrath
			[359] = 1.57, -- Wild Fleshrending
			[496] = 0.96, -- Stronger Together
			[501] = 4.36, -- Relational Normalization Gizmo
			[499] = 2.42, -- Ricocheting Inflatable Pyrosaw
			[195] = 3.89, -- Secrets of the Deep
			[84] = 0.08, -- Bulwark of the Masses
			[522] = 5.28, -- Ancients' Bulwark
			[562] = 5.97, -- Treacherous Covenant
			[156] = 3.74, -- Ruinous Bolt
			[82] = 5.01, -- Champion of Azeroth
			[14] = 0.01, -- Longstrider
			[575] = 10, -- Undulating Tides
			[104] = 0.04, -- Bracing Chill
			[505] = 3.78, -- Tradewinds
			[241] = 4.47, -- Twisted Claws
			[461] = 1.34, -- Earthlink
			[480] = 3.2, -- Blood Rite
			[482] = 5.26, -- Thunderous Blast
			[478] = 6.39, -- Tidal Surge
			[541] = 1.28, -- Fight or Flight
			[498] = 4.06, -- Barrage Of Many Bombs
			[87] = 0.03, -- Self Reliance
			[576] = 2.48, -- Loyal to the End
			[560] = 1.49, -- Bonded Souls
			[521] = 3.34, -- Shadow of Elune
			[503] = 0.02, -- Auto-Self-Cauterizer
			[523] = 5.05, -- Apothecary's Concoctions
			[31] = 2.98, -- Gutripper
			[577] = 1.17, -- Arcane Heart
			[459] = 1.79, -- Unstable Flames
			[526] = 5.21, -- Endless Hunger
			[485] = 5.48, -- Laser Matrix
			[492] = 3.16, -- Liberator's Might
			[22] = 2.66, -- Heed My Call
			[561] = 3.22, -- Seductive Power
			[500] = 3.42, -- Synaptic Spark Capacitor
			[462] = 1.8, -- Azerite Globules
			[193] = 4.98, -- Blightborne Infusion
			[493] = 1.89, -- Last Gift
			[479] = 4.55, -- Dagger in the Back
			[100] = 0.01, -- Strength in Numbers
			[504] = 4.4, -- Unstable Catalyst
			[38] = 1.52, -- On My Way
			[18] = 1.37, -- Blood Siphon
			[497] = 1.02, -- Stand As One
			[192] = 4.27, -- Meticulous Scheming
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 4222 - 5510 (avg 4550), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 6.56, 1.58 }, -- Conflict and Strife
			[15] = { 3.99, 0 }, -- Ripple in Space
			[25] = { 0.73, 0.69 }, -- Aegis of the Deep
			[12] = { 10, 3.97 }, -- The Crucible of Flame
			[22] = { 1.54, 0.04 }, -- Vision of Perfection
			[13] = { 0, 0.01 }, -- Nullification Dynamo
			[27] = { 1.42, 0.69 }, -- Memory of Lucid Dreams
			[7] = { 2.15, 0 }, -- Anima of Life and Death
			[4] = { 0.89, 1.11 }, -- Worldvein Resonance
			[2] = { 0.01, 0.01 }, -- Azeroth's Undying Gift
			[3] = { 3.54, 3.55 }, -- Sphere of Suppression
		}, 1564736400)

		insertDefaultScalesData(defaultName, 3, 1, { -- Beast Mastery Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 14135 - 17030 (avg 15296), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[485] = 5.1, -- Laser Matrix
			[576] = 3.68, -- Loyal to the End
			[459] = 2.88, -- Unstable Flames
			[31] = 2.75, -- Gutripper
			[193] = 8.35, -- Blightborne Infusion
			[107] = 4.05, -- Serrated Jaws
			[501] = 6.52, -- Relational Normalization Gizmo
			[494] = 5.71, -- Battlefield Precision
			[493] = 2.93, -- Last Gift
			[521] = 5.33, -- Shadow of Elune
			[156] = 3.78, -- Ruinous Bolt
			[560] = 2.22, -- Bonded Souls
			[21] = 2.62, -- Elemental Whirl
			[522] = 8.39, -- Ancients' Bulwark
			[561] = 4.08, -- Seductive Power
			[18] = 2.02, -- Blood Siphon
			[541] = 1.81, -- Fight or Flight
			[479] = 6.02, -- Dagger in the Back
			[157] = 5.81, -- Rezan's Fury
			[526] = 8.37, -- Endless Hunger
			[575] = 9.08, -- Undulating Tides
			[367] = 6.99, -- Feeding Frenzy
			[495] = 4.93, -- Anduin's Dedication
			[461] = 1.71, -- Earthlink
			[482] = 4.79, -- Thunderous Blast
			[483] = 5.9, -- Archive of the Titans
			[498] = 3.65, -- Barrage Of Many Bombs
			[22] = 2.43, -- Heed My Call
			[504] = 5.81, -- Unstable Catalyst
			[82] = 8.13, -- Champion of Azeroth
			[38] = 2.33, -- On My Way
			[161] = 6.47, -- Haze of Rage
			[577] = 0.82, -- Arcane Heart
			[496] = 1.63, -- Stronger Together
			[481] = 5.1, -- Incite the Pack
			[192] = 7.25, -- Meticulous Scheming
			[462] = 1.56, -- Azerite Globules
			[492] = 4.95, -- Liberator's Might
			[478] = 6.4, -- Tidal Surge
			[523] = 4.64, -- Apothecary's Concoctions
			[500] = 3.42, -- Synaptic Spark Capacitor
			[569] = 7, -- Clockwork Heart
			[20] = 2.38, -- Lifespeed
			[366] = 9.04, -- Primal Instincts
			[365] = 5.94, -- Dire Consequences
			[211] = 10, -- Dance of Death
			[480] = 5.49, -- Blood Rite
			[505] = 5.51, -- Tradewinds
			[499] = 2.11, -- Ricocheting Inflatable Pyrosaw
			[30] = 4.25, -- Overwhelming Power
			[194] = 4.25, -- Filthy Transfusion
			[497] = 1.33, -- Stand As One
			[195] = 5.23, -- Secrets of the Deep
			[196] = 7.55, -- Swirling Sands
			[562] = 8.11, -- Treacherous Covenant
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 12975 - 16079 (avg 14893), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 4.39, 0 }, -- Ripple in Space
			[6] = { 5.75, 2.16 }, -- Purification Protocol
			[14] = { 7.15, 2.51 }, -- Condensed Life-Force
			[22] = { 1.93, 0.71 }, -- Vision of Perfection
			[32] = { 2.16, 2.11 }, -- Conflict and Strife
			[12] = { 8.4, 2.84 }, -- The Crucible of Flame
			[28] = { 4.11, 1.61 }, -- The Unbound Force
			[5] = { 10, 3.13 }, -- Essence of the Focusing Iris
			[23] = { 4.76, 0.58 }, -- Blood of the Enemy
			[4] = { 1.72, 0.99 }, -- Worldvein Resonance
			[27] = { 1.02, 1 }, -- Memory of Lucid Dreams
		}, 1564736400)

		insertDefaultScalesData(defaultName, 3, 2, { -- Marksmanship Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11405 - 14442 (avg 12259), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[503] = 0.06, -- Auto-Self-Cauterizer
			[575] = 8.34, -- Undulating Tides
			[497] = 1.12, -- Stand As One
			[203] = 0.02, -- Shellshock
			[482] = 4.45, -- Thunderous Blast
			[493] = 2.76, -- Last Gift
			[368] = 3.17, -- Steady Aim
			[496] = 1.14, -- Stronger Together
			[480] = 4.58, -- Blood Rite
			[481] = 4.49, -- Incite the Pack
			[194] = 4.77, -- Filthy Transfusion
			[560] = 1.92, -- Bonded Souls
			[42] = 0.01, -- Savior
			[101] = 0.05, -- Shimmering Haven
			[82] = 6.01, -- Champion of Azeroth
			[156] = 3.44, -- Ruinous Bolt
			[561] = 3.58, -- Seductive Power
			[21] = 2.3, -- Elemental Whirl
			[576] = 3.45, -- Loyal to the End
			[500] = 3.02, -- Synaptic Spark Capacitor
			[499] = 1.97, -- Ricocheting Inflatable Pyrosaw
			[196] = 5.83, -- Swirling Sands
			[20] = 1.71, -- Lifespeed
			[30] = 3.89, -- Overwhelming Power
			[31] = 2.52, -- Gutripper
			[162] = 6.61, -- Surging Shots
			[504] = 5, -- Unstable Catalyst
			[577] = 1.6, -- Arcane Heart
			[522] = 6.79, -- Ancients' Bulwark
			[84] = 0.01, -- Bulwark of the Masses
			[99] = 0.06, -- Ablative Shielding
			[18] = 1.76, -- Blood Siphon
			[505] = 4.84, -- Tradewinds
			[22] = 2.37, -- Heed My Call
			[526] = 6.59, -- Endless Hunger
			[479] = 5.65, -- Dagger in the Back
			[105] = 0.01, -- Ephemeral Recovery
			[36] = 10, -- In The Rhythm
			[461] = 1.54, -- Earthlink
			[569] = 4.68, -- Clockwork Heart
			[212] = 7.88, -- Unerring Vision
			[521] = 4.53, -- Shadow of Elune
			[459] = 2.33, -- Unstable Flames
			[192] = 5.69, -- Meticulous Scheming
			[494] = 5.33, -- Battlefield Precision
			[495] = 4.34, -- Anduin's Dedication
			[370] = 8.58, -- Focused Fire
			[523] = 4.36, -- Apothecary's Concoctions
			[485] = 4.68, -- Laser Matrix
			[501] = 5.44, -- Relational Normalization Gizmo
			[157] = 5.37, -- Rezan's Fury
			[193] = 6.63, -- Blightborne Infusion
			[492] = 3.93, -- Liberator's Might
			[478] = 5.5, -- Tidal Surge
			[483] = 5.02, -- Archive of the Titans
			[541] = 1.56, -- Fight or Flight
			[195] = 4.4, -- Secrets of the Deep
			[562] = 6.97, -- Treacherous Covenant
			[38] = 1.78, -- On My Way
			[498] = 3.3, -- Barrage Of Many Bombs
			[462] = 1.49, -- Azerite Globules
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 10319 - 13608 (avg 11912), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 10, 3.48 }, -- Essence of the Focusing Iris
			[14] = { 9.13, 3.38 }, -- Condensed Life-Force
			[23] = { 5.01, 0.5 }, -- Blood of the Enemy
			[4] = { 1.2, 1.34 }, -- Worldvein Resonance
			[12] = { 7.97, 3.77 }, -- The Crucible of Flame
			[15] = { 3.92, 0 }, -- Ripple in Space
			[22] = { 4.64, 1.41 }, -- Vision of Perfection
			[28] = { 3.03, 1.64 }, -- The Unbound Force
			[32] = { 2.13, 2.12 }, -- Conflict and Strife
			[6] = { 6.18, 2.91 }, -- Purification Protocol
			[27] = { 1.3, 0.7 }, -- Memory of Lucid Dreams
		}, 1564736400)

		insertDefaultScalesData(defaultName, 3, 3, { -- Survival Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7720 - 10815 (avg 8984), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[110] = 2.59, -- Wildfire Cluster
			[85] = 0.1, -- Gemhide
			[480] = 5.34, -- Blood Rite
			[195] = 5.28, -- Secrets of the Deep
			[30] = 5.19, -- Overwhelming Power
			[560] = 2.57, -- Bonded Souls
			[107] = 3.98, -- Serrated Jaws
			[38] = 2.14, -- On My Way
			[562] = 8.24, -- Treacherous Covenant
			[22] = 2.81, -- Heed My Call
			[156] = 3.52, -- Ruinous Bolt
			[100] = 0.04, -- Strength in Numbers
			[157] = 6.19, -- Rezan's Fury
			[163] = 7.32, -- Latent Poison
			[478] = 5.8, -- Tidal Surge
			[103] = 0.04, -- Concentrated Mending
			[494] = 6.4, -- Battlefield Precision
			[462] = 1.86, -- Azerite Globules
			[373] = 7.5, -- Primeval Intuition
			[485] = 5.45, -- Laser Matrix
			[481] = 4.57, -- Incite the Pack
			[505] = 4.97, -- Tradewinds
			[372] = 10, -- Wilderness Survival
			[101] = 0.02, -- Shimmering Haven
			[497] = 1.4, -- Stand As One
			[87] = 0.03, -- Self Reliance
			[192] = 6.03, -- Meticulous Scheming
			[461] = 1.87, -- Earthlink
			[493] = 2.64, -- Last Gift
			[371] = 9.05, -- Blur of Talons
			[576] = 3.35, -- Loyal to the End
			[561] = 4.48, -- Seductive Power
			[500] = 3.26, -- Synaptic Spark Capacitor
			[42] = 0.03, -- Savior
			[541] = 1.89, -- Fight or Flight
			[21] = 2.49, -- Elemental Whirl
			[482] = 5.3, -- Thunderous Blast
			[577] = 1.47, -- Arcane Heart
			[98] = 0.01, -- Crystalline Carapace
			[526] = 7.24, -- Endless Hunger
			[89] = 0.09, -- Azerite Veins
			[18] = 1.9, -- Blood Siphon
			[568] = 0.15, -- Person-Computer Interface
			[575] = 9.99, -- Undulating Tides
			[104] = 0.06, -- Bracing Chill
			[522] = 7.23, -- Ancients' Bulwark
			[501] = 6.58, -- Relational Normalization Gizmo
			[498] = 4.05, -- Barrage Of Many Bombs
			[86] = 0.01, -- Azerite Fortification
			[523] = 5.16, -- Apothecary's Concoctions
			[492] = 4.57, -- Liberator's Might
			[83] = 0.02, -- Impassive Visage
			[504] = 5.98, -- Unstable Catalyst
			[499] = 2.51, -- Ricocheting Inflatable Pyrosaw
			[365] = 6, -- Dire Consequences
			[479] = 6.49, -- Dagger in the Back
			[521] = 5.41, -- Shadow of Elune
			[569] = 5.91, -- Clockwork Heart
			[31] = 2.98, -- Gutripper
			[196] = 6.32, -- Swirling Sands
			[213] = 5.13, -- Venomous Fangs
			[496] = 1.4, -- Stronger Together
			[459] = 2.51, -- Unstable Flames
			[483] = 5.69, -- Archive of the Titans
			[193] = 7.14, -- Blightborne Infusion
			[82] = 7.02, -- Champion of Azeroth
			[463] = 0.08, -- Blessed Portents
			[194] = 5.41, -- Filthy Transfusion
			[495] = 5.17, -- Anduin's Dedication
			[20] = 2.53, -- Lifespeed
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7602 - 10663 (avg 8867), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 6.46, 2.32 }, -- Memory of Lucid Dreams
			[32] = { 1.87, 1.87 }, -- Conflict and Strife
			[12] = { 8.55, 3.39 }, -- The Crucible of Flame
			[14] = { 8.83, 3.17 }, -- Condensed Life-Force
			[28] = { 3.46, 1.57 }, -- The Unbound Force
			[23] = { 4.65, 0.71 }, -- Blood of the Enemy
			[6] = { 6.42, 2.72 }, -- Purification Protocol
			[22] = { 4.27, 1.38 }, -- Vision of Perfection
			[4] = { 1.77, 1.32 }, -- Worldvein Resonance
			[15] = { 4.51, 0.09 }, -- Ripple in Space
			[5] = { 10, 3.62 }, -- Essence of the Focusing Iris
		}, 1564736400)

		insertDefaultScalesData(defaultName, 8, 1, { -- Arcane Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 20016 - 23709 (avg 21438), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[461] = 1.68, -- Earthlink
			[192] = 3.11, -- Meticulous Scheming
			[562] = 7.63, -- Treacherous Covenant
			[500] = 2.82, -- Synaptic Spark Capacitor
			[494] = 4.4, -- Battlefield Precision
			[505] = 4.7, -- Tradewinds
			[459] = 2.43, -- Unstable Flames
			[480] = 4.14, -- Blood Rite
			[483] = 5.17, -- Archive of the Titans
			[577] = 3.82, -- Arcane Heart
			[521] = 4.07, -- Shadow of Elune
			[576] = 3.32, -- Loyal to the End
			[22] = 2.17, -- Heed My Call
			[157] = 5.14, -- Rezan's Fury
			[82] = 6.01, -- Champion of Azeroth
			[485] = 4.41, -- Laser Matrix
			[497] = 1.23, -- Stand As One
			[30] = 4.01, -- Overwhelming Power
			[99] = 0.04, -- Ablative Shielding
			[499] = 2.03, -- Ricocheting Inflatable Pyrosaw
			[88] = 5.85, -- Arcane Pummeling
			[498] = 3.22, -- Barrage Of Many Bombs
			[522] = 7.52, -- Ancients' Bulwark
			[374] = 6.58, -- Galvanizing Spark
			[575] = 7.93, -- Undulating Tides
			[21] = 2.53, -- Elemental Whirl
			[84] = 0.04, -- Bulwark of the Masses
			[214] = 2.85, -- Arcane Pressure
			[101] = 0.03, -- Shimmering Haven
			[100] = 0.1, -- Strength in Numbers
			[526] = 7.52, -- Endless Hunger
			[479] = 5.32, -- Dagger in the Back
			[31] = 2.21, -- Gutripper
			[502] = 0.15, -- Personal Absorb-o-Tron
			[205] = 0.01, -- Eldritch Warding
			[569] = 4.17, -- Clockwork Heart
			[195] = 4.65, -- Secrets of the Deep
			[503] = 0.04, -- Auto-Self-Cauterizer
			[493] = 2.7, -- Last Gift
			[167] = 3, -- Brain Storm
			[156] = 3.28, -- Ruinous Bolt
			[463] = 0.03, -- Blessed Portents
			[193] = 7.22, -- Blightborne Infusion
			[523] = 4.19, -- Apothecary's Concoctions
			[478] = 5.09, -- Tidal Surge
			[492] = 4.84, -- Liberator's Might
			[13] = 0.03, -- Azerite Empowered
			[127] = 10, -- Equipoise
			[501] = 5.18, -- Relational Normalization Gizmo
			[560] = 2.64, -- Bonded Souls
			[482] = 4.21, -- Thunderous Blast
			[561] = 3.88, -- Seductive Power
			[194] = 4.32, -- Filthy Transfusion
			[38] = 2.1, -- On My Way
			[481] = 4.28, -- Incite the Pack
			[196] = 6.11, -- Swirling Sands
			[568] = 0.05, -- Person-Computer Interface
			[541] = 1.65, -- Fight or Flight
			[86] = 0.06, -- Azerite Fortification
			[496] = 1.35, -- Stronger Together
			[462] = 1.57, -- Azerite Globules
			[20] = 1.14, -- Lifespeed
			[18] = 1.79, -- Blood Siphon
			[504] = 5.38, -- Unstable Catalyst
			[495] = 4.76, -- Anduin's Dedication
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 19591 - 26093 (avg 21916), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 3.28, 0 }, -- Ripple in Space
			[28] = { 1.7, 1.35 }, -- The Unbound Force
			[27] = { 4.15, 2.87 }, -- Memory of Lucid Dreams
			[32] = { 2.42, 2.48 }, -- Conflict and Strife
			[14] = { 8.38, 2.89 }, -- Condensed Life-Force
			[23] = { 4.08, 0.54 }, -- Blood of the Enemy
			[22] = { 0.4, 0 }, -- Vision of Perfection
			[12] = { 6.68, 3.23 }, -- The Crucible of Flame
			[5] = { 10, 4.56 }, -- Essence of the Focusing Iris
			[6] = { 4.63, 2.48 }, -- Purification Protocol
			[4] = { 1.44, 1.32 }, -- Worldvein Resonance
		}, 1564736400)

		insertDefaultScalesData(defaultName, 8, 2, { -- Fire Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 25928 - 30170 (avg 27516), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[20] = 1.55, -- Lifespeed
			[478] = 6.34, -- Tidal Surge
			[205] = 0.05, -- Eldritch Warding
			[504] = 5.01, -- Unstable Catalyst
			[378] = 5.92, -- Firemind
			[83] = 0.09, -- Impassive Visage
			[38] = 2.28, -- On My Way
			[31] = 3.05, -- Gutripper
			[195] = 4.59, -- Secrets of the Deep
			[194] = 4.71, -- Filthy Transfusion
			[157] = 6.15, -- Rezan's Fury
			[468] = 0.03, -- Cauterizing Blink
			[568] = 0.21, -- Person-Computer Interface
			[85] = 0.06, -- Gemhide
			[480] = 4.03, -- Blood Rite
			[523] = 5.07, -- Apothecary's Concoctions
			[104] = 0.02, -- Bracing Chill
			[101] = 0.07, -- Shimmering Haven
			[575] = 10, -- Undulating Tides
			[576] = 3.54, -- Loyal to the End
			[193] = 8.2, -- Blightborne Infusion
			[21] = 2.22, -- Elemental Whirl
			[546] = 0.21, -- Quick Thinking
			[569] = 6.38, -- Clockwork Heart
			[461] = 1.56, -- Earthlink
			[485] = 5.48, -- Laser Matrix
			[98] = 0.12, -- Crystalline Carapace
			[498] = 4.07, -- Barrage Of Many Bombs
			[84] = 0.08, -- Bulwark of the Masses
			[463] = 0.08, -- Blessed Portents
			[496] = 1.39, -- Stronger Together
			[481] = 4.39, -- Incite the Pack
			[541] = 1.86, -- Fight or Flight
			[497] = 1.21, -- Stand As One
			[89] = 0.04, -- Azerite Veins
			[30] = 3.32, -- Overwhelming Power
			[502] = 0.09, -- Personal Absorb-o-Tron
			[483] = 4.7, -- Archive of the Titans
			[459] = 2.91, -- Unstable Flames
			[561] = 3.85, -- Seductive Power
			[377] = 5.26, -- Duplicative Incineration
			[215] = 4.58, -- Blaster Master
			[577] = 2.88, -- Arcane Heart
			[87] = 0.08, -- Self Reliance
			[500] = 3.5, -- Synaptic Spark Capacitor
			[22] = 2.76, -- Heed My Call
			[494] = 6.17, -- Battlefield Precision
			[18] = 1.97, -- Blood Siphon
			[493] = 2.71, -- Last Gift
			[492] = 4.27, -- Liberator's Might
			[14] = 0.03, -- Longstrider
			[168] = 9.05, -- Wildfire
			[499] = 2.49, -- Ricocheting Inflatable Pyrosaw
			[522] = 7.86, -- Ancients' Bulwark
			[526] = 7.89, -- Endless Hunger
			[156] = 3.76, -- Ruinous Bolt
			[521] = 4.01, -- Shadow of Elune
			[501] = 5.29, -- Relational Normalization Gizmo
			[560] = 1.4, -- Bonded Souls
			[376] = 3.88, -- Trailing Embers
			[495] = 4.39, -- Anduin's Dedication
			[462] = 1.89, -- Azerite Globules
			[99] = 0.09, -- Ablative Shielding
			[482] = 5.17, -- Thunderous Blast
			[100] = 0.05, -- Strength in Numbers
			[13] = 0.15, -- Azerite Empowered
			[15] = 0.06, -- Resounding Protection
			[103] = 0.08, -- Concentrated Mending
			[503] = 0.12, -- Auto-Self-Cauterizer
			[505] = 4.9, -- Tradewinds
			[192] = 3.96, -- Meticulous Scheming
			[479] = 6.28, -- Dagger in the Back
			[105] = 0.17, -- Ephemeral Recovery
			[42] = 0.13, -- Savior
			[86] = 0.11, -- Azerite Fortification
			[128] = 2.88, -- Flames of Alacrity
			[562] = 6.94, -- Treacherous Covenant
			[82] = 6.48, -- Champion of Azeroth
			[196] = 7.27, -- Swirling Sands
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 24212 - 28224 (avg 26792), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 6.92, 2.57 }, -- Condensed Life-Force
			[4] = { 0.36, 0.9 }, -- Worldvein Resonance
			[15] = { 2.59, 0.02 }, -- Ripple in Space
			[22] = { 0.86, 0 }, -- Vision of Perfection
			[27] = { 10, 6.49 }, -- Memory of Lucid Dreams
			[32] = { 1.73, 1.75 }, -- Conflict and Strife
			[6] = { 4.1, 2.24 }, -- Purification Protocol
			[28] = { 2.03, 1.33 }, -- The Unbound Force
			[12] = { 5.44, 2.67 }, -- The Crucible of Flame
			[5] = { 6.77, 2.17 }, -- Essence of the Focusing Iris
			[23] = { 1.48, 0.72 }, -- Blood of the Enemy
		}, 1564736400)

		insertDefaultScalesData(defaultName, 8, 3, { -- Frost Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16291 - 19036 (avg 17214), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[459] = 2.3, -- Unstable Flames
			[503] = 0.02, -- Auto-Self-Cauterizer
			[481] = 3.56, -- Incite the Pack
			[562] = 5.93, -- Treacherous Covenant
			[21] = 1.93, -- Elemental Whirl
			[193] = 5.5, -- Blightborne Infusion
			[498] = 2.57, -- Barrage Of Many Bombs
			[132] = 3.57, -- Packed Ice
			[483] = 4.16, -- Archive of the Titans
			[496] = 1.25, -- Stronger Together
			[462] = 1.14, -- Azerite Globules
			[541] = 1.36, -- Fight or Flight
			[504] = 4.43, -- Unstable Catalyst
			[84] = 0.01, -- Bulwark of the Masses
			[523] = 3.28, -- Apothecary's Concoctions
			[577] = 1.09, -- Arcane Heart
			[526] = 5.99, -- Endless Hunger
			[561] = 3.22, -- Seductive Power
			[575] = 6.39, -- Undulating Tides
			[170] = 10, -- Flash Freeze
			[196] = 5.72, -- Swirling Sands
			[192] = 3.29, -- Meticulous Scheming
			[31] = 1.79, -- Gutripper
			[521] = 3.49, -- Shadow of Elune
			[30] = 3.1, -- Overwhelming Power
			[20] = 1.62, -- Lifespeed
			[500] = 2.17, -- Synaptic Spark Capacitor
			[194] = 3.71, -- Filthy Transfusion
			[18] = 1.36, -- Blood Siphon
			[501] = 4.43, -- Relational Normalization Gizmo
			[379] = 4.04, -- Tunnel of Ice
			[494] = 3.77, -- Battlefield Precision
			[156] = 2.54, -- Ruinous Bolt
			[157] = 4.02, -- Rezan's Fury
			[576] = 2.5, -- Loyal to the End
			[86] = 0.02, -- Azerite Fortification
			[569] = 4.73, -- Clockwork Heart
			[479] = 4.27, -- Dagger in the Back
			[225] = 3.9, -- Glacial Assault
			[22] = 1.74, -- Heed My Call
			[482] = 3.37, -- Thunderous Blast
			[478] = 4.07, -- Tidal Surge
			[461] = 1.3, -- Earthlink
			[82] = 5.42, -- Champion of Azeroth
			[98] = 0.02, -- Crystalline Carapace
			[381] = 3.67, -- Frigid Grasp
			[497] = 0.99, -- Stand As One
			[505] = 3.83, -- Tradewinds
			[195] = 3.77, -- Secrets of the Deep
			[522] = 6.01, -- Ancients' Bulwark
			[485] = 3.57, -- Laser Matrix
			[499] = 1.45, -- Ricocheting Inflatable Pyrosaw
			[492] = 3.76, -- Liberator's Might
			[493] = 2.04, -- Last Gift
			[560] = 1.57, -- Bonded Souls
			[38] = 1.71, -- On My Way
			[380] = 3.65, -- Whiteout
			[480] = 3.45, -- Blood Rite
			[495] = 3.78, -- Anduin's Dedication
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 15867 - 17826 (avg 16892), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 0.13, 1.53 }, -- Worldvein Resonance
			[27] = { 5.75, 3.84 }, -- Memory of Lucid Dreams
			[23] = { 4.67, 1.05 }, -- Blood of the Enemy
			[32] = { 3.03, 3.01 }, -- Conflict and Strife
			[6] = { 5.09, 2.88 }, -- Purification Protocol
			[28] = { 3.23, 1.95 }, -- The Unbound Force
			[22] = { 4.12, 0.83 }, -- Vision of Perfection
			[14] = { 10, 3.43 }, -- Condensed Life-Force
			[12] = { 6.07, 3.75 }, -- The Crucible of Flame
			[15] = { 3.67, 0 }, -- Ripple in Space
			[5] = { 8.28, 4.45 }, -- Essence of the Focusing Iris
		}, 1564736400)

		insertDefaultScalesData(offensiveName, 10, 1, { -- Brewmaster Monk
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6306 - 10212 (avg 6933), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = 0.06, -- Resounding Protection
			[577] = 0.66, -- Arcane Heart
			[38] = 0.99, -- On My Way
			[481] = 2.52, -- Incite the Pack
			[523] = 5.14, -- Apothecary's Concoctions
			[218] = 0.04, -- Strength of Spirit
			[30] = 1.68, -- Overwhelming Power
			[493] = 1.45, -- Last Gift
			[382] = 0.01, -- Straight, No Chaser
			[384] = 2.95, -- Elusive Footwork
			[459] = 1.35, -- Unstable Flames
			[496] = 0.65, -- Stronger Together
			[526] = 3.84, -- Endless Hunger
			[156] = 3.72, -- Ruinous Bolt
			[192] = 2.31, -- Meticulous Scheming
			[569] = 2.73, -- Clockwork Heart
			[480] = 1.87, -- Blood Rite
			[82] = 3.56, -- Champion of Azeroth
			[503] = 0.02, -- Auto-Self-Cauterizer
			[470] = 0.06, -- Sweep the Leg
			[20] = 0.94, -- Lifespeed
			[562] = 4.24, -- Treacherous Covenant
			[560] = 0.95, -- Bonded Souls
			[89] = 0.02, -- Azerite Veins
			[157] = 6.3, -- Rezan's Fury
			[497] = 0.71, -- Stand As One
			[31] = 3.03, -- Gutripper
			[22] = 2.81, -- Heed My Call
			[500] = 3.27, -- Synaptic Spark Capacitor
			[521] = 1.82, -- Shadow of Elune
			[87] = 0.05, -- Self Reliance
			[498] = 4.04, -- Barrage Of Many Bombs
			[85] = 0.02, -- Gemhide
			[194] = 5.24, -- Filthy Transfusion
			[482] = 5.25, -- Thunderous Blast
			[522] = 3.85, -- Ancients' Bulwark
			[504] = 3.02, -- Unstable Catalyst
			[104] = 0.02, -- Bracing Chill
			[479] = 4.47, -- Dagger in the Back
			[478] = 6.21, -- Tidal Surge
			[100] = 0.01, -- Strength in Numbers
			[195] = 2.76, -- Secrets of the Deep
			[193] = 3.8, -- Blightborne Infusion
			[576] = 1.74, -- Loyal to the End
			[485] = 5.49, -- Laser Matrix
			[561] = 2.36, -- Seductive Power
			[461] = 0.9, -- Earthlink
			[483] = 3.11, -- Archive of the Titans
			[495] = 2.69, -- Anduin's Dedication
			[501] = 2.66, -- Relational Normalization Gizmo
			[196] = 3.4, -- Swirling Sands
			[83] = 0.06, -- Impassive Visage
			[499] = 2.45, -- Ricocheting Inflatable Pyrosaw
			[505] = 2.68, -- Tradewinds
			[383] = 1.48, -- Training of Niuzao
			[103] = 0.05, -- Concentrated Mending
			[43] = 0.02, -- Winds of War
			[575] = 10, -- Undulating Tides
			[541] = 1.07, -- Fight or Flight
			[21] = 1.15, -- Elemental Whirl
			[492] = 2.15, -- Liberator's Might
			[462] = 1.86, -- Azerite Globules
			[18] = 0.97, -- Blood Siphon
			[116] = 1.19, -- Boiling Brew
			[494] = 6.44, -- Battlefield Precision
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6472 - 7624 (avg 6756), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 0.48, 0.45 }, -- Aegis of the Deep
			[32] = { 0.99, 1.01 }, -- Conflict and Strife
			[3] = { 1.79, 1.79 }, -- Sphere of Suppression
			[13] = { 0.03, 0 }, -- Nullification Dynamo
			[4] = { 0.72, 0.73 }, -- Worldvein Resonance
			[12] = { 10, 3.62 }, -- The Crucible of Flame
			[27] = { 0.03, 0 }, -- Memory of Lucid Dreams
		}, 1564736400)

		insertDefaultScalesData(defaultName, 10, 3, { -- Windwalker Monk
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 10767 - 13269 (avg 11532), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[504] = 4.92, -- Unstable Catalyst
			[562] = 6.7, -- Treacherous Covenant
			[521] = 3.81, -- Shadow of Elune
			[194] = 5, -- Filthy Transfusion
			[42] = 0.16, -- Savior
			[541] = 1.56, -- Fight or Flight
			[99] = 0.11, -- Ablative Shielding
			[103] = 0.12, -- Concentrated Mending
			[575] = 9.6, -- Undulating Tides
			[105] = 0.09, -- Ephemeral Recovery
			[560] = 1.81, -- Bonded Souls
			[494] = 5.9, -- Battlefield Precision
			[38] = 2.16, -- On My Way
			[13] = 0.18, -- Azerite Empowered
			[184] = 5.19, -- Sunrise Technique
			[461] = 1.65, -- Earthlink
			[483] = 4.68, -- Archive of the Titans
			[497] = 1.26, -- Stand As One
			[388] = 8.04, -- Glory of the Dawn
			[479] = 6.28, -- Dagger in the Back
			[568] = 0.05, -- Person-Computer Interface
			[195] = 4.35, -- Secrets of the Deep
			[21] = 2.23, -- Elemental Whirl
			[82] = 6.24, -- Champion of Azeroth
			[498] = 3.91, -- Barrage Of Many Bombs
			[561] = 3.91, -- Seductive Power
			[44] = 0.08, -- Vampiric Speed
			[569] = 4.64, -- Clockwork Heart
			[117] = 10, -- Fury of Xuen
			[480] = 3.74, -- Blood Rite
			[389] = 8.22, -- Open Palm Strikes
			[101] = 0.03, -- Shimmering Haven
			[43] = 0.12, -- Winds of War
			[31] = 3.05, -- Gutripper
			[20] = 1.7, -- Lifespeed
			[522] = 7.25, -- Ancients' Bulwark
			[478] = 6.39, -- Tidal Surge
			[481] = 4.31, -- Incite the Pack
			[492] = 3.77, -- Liberator's Might
			[218] = 0.14, -- Strength of Spirit
			[482] = 4.98, -- Thunderous Blast
			[86] = 0.09, -- Azerite Fortification
			[391] = 5.94, -- Dance of Chi-Ji
			[493] = 2.57, -- Last Gift
			[89] = 0.1, -- Azerite Veins
			[84] = 0.19, -- Bulwark of the Masses
			[576] = 3.29, -- Loyal to the End
			[566] = 0.24, -- Exit Strategy
			[577] = 1.68, -- Arcane Heart
			[502] = 0.16, -- Personal Absorb-o-Tron
			[83] = 0.1, -- Impassive Visage
			[156] = 3.92, -- Ruinous Bolt
			[192] = 4.16, -- Meticulous Scheming
			[104] = 0.22, -- Bracing Chill
			[157] = 6.08, -- Rezan's Fury
			[523] = 5.07, -- Apothecary's Concoctions
			[501] = 5.14, -- Relational Normalization Gizmo
			[193] = 6.62, -- Blightborne Infusion
			[499] = 2.32, -- Ricocheting Inflatable Pyrosaw
			[85] = 0.07, -- Gemhide
			[463] = 0.07, -- Blessed Portents
			[18] = 1.85, -- Blood Siphon
			[496] = 1.36, -- Stronger Together
			[503] = 0.01, -- Auto-Self-Cauterizer
			[459] = 2.43, -- Unstable Flames
			[526] = 7.23, -- Endless Hunger
			[390] = 6.3, -- Pressure Point
			[505] = 4.92, -- Tradewinds
			[15] = 0.08, -- Resounding Protection
			[87] = 0.1, -- Self Reliance
			[196] = 5.97, -- Swirling Sands
			[462] = 1.81, -- Azerite Globules
			[485] = 5.28, -- Laser Matrix
			[495] = 4.34, -- Anduin's Dedication
			[100] = 0.08, -- Strength in Numbers
			[500] = 3.45, -- Synaptic Spark Capacitor
			[22] = 2.7, -- Heed My Call
			[98] = 0.08, -- Crystalline Carapace
			[30] = 3.07, -- Overwhelming Power
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 8257 - 12361 (avg 11107), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 6.52, 1.68 }, -- Essence of the Focusing Iris
			[23] = { 3.5, 0.49 }, -- Blood of the Enemy
			[27] = { 0, 0.03 }, -- Memory of Lucid Dreams
			[28] = { 1.86, 0.96 }, -- The Unbound Force
			[15] = { 2.39, 0.04 }, -- Ripple in Space
			[12] = { 5.97, 2.44 }, -- The Crucible of Flame
			[32] = { 10, 1.53 }, -- Conflict and Strife
			[22] = { 0.06, 0.02 }, -- Vision of Perfection
			[6] = { 4.1, 1.84 }, -- Purification Protocol
			[14] = { 5.94, 2.2 }, -- Condensed Life-Force
			[4] = { 0.6, 0.81 }, -- Worldvein Resonance
		}, 1564736400)

		insertDefaultScalesData(offensiveName, 2, 2, { -- Protection Paladin
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 14415 - 17869 (avg 15314), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[492] = 3.58, -- Liberator's Might
			[15] = 0.03, -- Resounding Protection
			[150] = 1.33, -- Soaring Shield
			[157] = 6.19, -- Rezan's Fury
			[85] = 0.03, -- Gemhide
			[478] = 6, -- Tidal Surge
			[22] = 2.76, -- Heed My Call
			[125] = 3.36, -- Avenger's Might
			[84] = 0.01, -- Bulwark of the Masses
			[192] = 4.31, -- Meticulous Scheming
			[82] = 5.25, -- Champion of Azeroth
			[498] = 3.94, -- Barrage Of Many Bombs
			[31] = 2.99, -- Gutripper
			[497] = 0.93, -- Stand As One
			[196] = 5.27, -- Swirling Sands
			[30] = 3.17, -- Overwhelming Power
			[14] = 0.06, -- Longstrider
			[523] = 5, -- Apothecary's Concoctions
			[575] = 10, -- Undulating Tides
			[485] = 5.55, -- Laser Matrix
			[133] = 0.04, -- Bulwark of Light
			[454] = 0.04, -- Judicious Defense
			[500] = 3.23, -- Synaptic Spark Capacitor
			[576] = 2.38, -- Loyal to the End
			[501] = 4.33, -- Relational Normalization Gizmo
			[526] = 5.37, -- Endless Hunger
			[504] = 4.01, -- Unstable Catalyst
			[483] = 3.88, -- Archive of the Titans
			[89] = 0.07, -- Azerite Veins
			[194] = 4.93, -- Filthy Transfusion
			[480] = 3.56, -- Blood Rite
			[562] = 5.51, -- Treacherous Covenant
			[541] = 1.29, -- Fight or Flight
			[479] = 4.51, -- Dagger in the Back
			[235] = 3.2, -- Indomitable Justice
			[521] = 3.58, -- Shadow of Elune
			[20] = 1.65, -- Lifespeed
			[461] = 1.29, -- Earthlink
			[38] = 1.43, -- On My Way
			[395] = 8.37, -- Inspiring Vanguard
			[503] = 0.04, -- Auto-Self-Cauterizer
			[471] = 0.09, -- Gallant Steed
			[234] = 1.58, -- Inner Light
			[193] = 5.95, -- Blightborne Infusion
			[522] = 5.3, -- Ancients' Bulwark
			[105] = 0.05, -- Ephemeral Recovery
			[505] = 3.4, -- Tradewinds
			[495] = 3.53, -- Anduin's Dedication
			[577] = 1.63, -- Arcane Heart
			[86] = 0.08, -- Azerite Fortification
			[393] = 0.02, -- Grace of the Justicar
			[560] = 1.7, -- Bonded Souls
			[206] = 0.01, -- Stalwart Protector
			[482] = 5.18, -- Thunderous Blast
			[195] = 3.59, -- Secrets of the Deep
			[569] = 4, -- Clockwork Heart
			[481] = 3.07, -- Incite the Pack
			[156] = 3.62, -- Ruinous Bolt
			[18] = 1.29, -- Blood Siphon
			[103] = 0.02, -- Concentrated Mending
			[21] = 1.79, -- Elemental Whirl
			[493] = 1.86, -- Last Gift
			[496] = 1.19, -- Stronger Together
			[459] = 2.16, -- Unstable Flames
			[502] = 0.01, -- Personal Absorb-o-Tron
			[494] = 6.46, -- Battlefield Precision
			[43] = 0.03, -- Winds of War
			[462] = 1.78, -- Azerite Globules
			[561] = 3, -- Seductive Power
			[499] = 2.42, -- Ricocheting Inflatable Pyrosaw
			[19] = 0.04, -- Woundbinder
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 14067 - 16123 (avg 15049), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 0.1, 0.02 }, -- Ripple in Space
			[32] = { 4.38, 4.38 }, -- Conflict and Strife
			[2] = { 0.01, 0 }, -- Azeroth's Undying Gift
			[27] = { 1.48, 1.6 }, -- Memory of Lucid Dreams
			[13] = { 0.05, 0 }, -- Nullification Dynamo
			[25] = { 2.16, 1.96 }, -- Aegis of the Deep
			[7] = { 0.31, 0.05 }, -- Anima of Life and Death
			[12] = { 9.32, 9.5 }, -- The Crucible of Flame
			[22] = { 6.23, 0.53 }, -- Vision of Perfection
			[3] = { 9.88, 10 }, -- Sphere of Suppression
			[4] = { 2.36, 2.3 }, -- Worldvein Resonance
		}, 1564736400)

		insertDefaultScalesData(defaultName, 2, 3, { -- Retribution Paladin
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 15761 - 18635 (avg 16768), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[30] = 3.13, -- Overwhelming Power
			[459] = 1.86, -- Unstable Flames
			[499] = 1.61, -- Ricocheting Inflatable Pyrosaw
			[492] = 3.1, -- Liberator's Might
			[82] = 5.24, -- Champion of Azeroth
			[471] = 0.06, -- Gallant Steed
			[494] = 3.9, -- Battlefield Precision
			[193] = 4.99, -- Blightborne Infusion
			[31] = 1.94, -- Gutripper
			[235] = 3.46, -- Indomitable Justice
			[498] = 2.69, -- Barrage Of Many Bombs
			[478] = 4.16, -- Tidal Surge
			[505] = 3.66, -- Tradewinds
			[538] = 0.07, -- Empyreal Ward
			[479] = 4.37, -- Dagger in the Back
			[99] = 0.01, -- Ablative Shielding
			[504] = 3.54, -- Unstable Catalyst
			[187] = 5.48, -- Expurgation
			[89] = 0.08, -- Azerite Veins
			[18] = 1.34, -- Blood Siphon
			[44] = 0.09, -- Vampiric Speed
			[560] = 1.83, -- Bonded Souls
			[523] = 3.42, -- Apothecary's Concoctions
			[38] = 1.45, -- On My Way
			[541] = 1.07, -- Fight or Flight
			[497] = 0.88, -- Stand As One
			[195] = 3.29, -- Secrets of the Deep
			[192] = 4.4, -- Meticulous Scheming
			[500] = 2.24, -- Synaptic Spark Capacitor
			[496] = 1.1, -- Stronger Together
			[13] = 0.03, -- Azerite Empowered
			[561] = 2.92, -- Seductive Power
			[568] = 0.07, -- Person-Computer Interface
			[576] = 2.54, -- Loyal to the End
			[101] = 0.02, -- Shimmering Haven
			[575] = 6.68, -- Undulating Tides
			[156] = 2.54, -- Ruinous Bolt
			[495] = 3.22, -- Anduin's Dedication
			[521] = 3.48, -- Shadow of Elune
			[453] = 5.28, -- Empyrean Power
			[14] = 0.03, -- Longstrider
			[480] = 3.49, -- Blood Rite
			[154] = 5.5, -- Relentless Inquisitor
			[481] = 3.36, -- Incite the Pack
			[482] = 3.54, -- Thunderous Blast
			[21] = 1.68, -- Elemental Whirl
			[125] = 4.21, -- Avenger's Might
			[485] = 3.7, -- Laser Matrix
			[393] = 0.04, -- Grace of the Justicar
			[22] = 1.91, -- Heed My Call
			[194] = 3.49, -- Filthy Transfusion
			[98] = 0.06, -- Crystalline Carapace
			[19] = 0.01, -- Woundbinder
			[577] = 1.67, -- Arcane Heart
			[501] = 4.05, -- Relational Normalization Gizmo
			[87] = 0.06, -- Self Reliance
			[104] = 0.03, -- Bracing Chill
			[462] = 1.24, -- Azerite Globules
			[396] = 10, -- Light's Decree
			[20] = 1.87, -- Lifespeed
			[562] = 5.1, -- Treacherous Covenant
			[461] = 1.05, -- Earthlink
			[493] = 2.02, -- Last Gift
			[526] = 5.31, -- Endless Hunger
			[100] = 0.03, -- Strength in Numbers
			[569] = 3.73, -- Clockwork Heart
			[157] = 4.31, -- Rezan's Fury
			[105] = 0.09, -- Ephemeral Recovery
			[483] = 3.6, -- Archive of the Titans
			[522] = 5.45, -- Ancients' Bulwark
			[196] = 4.35, -- Swirling Sands
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 14640 - 18439 (avg 16507), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 3.89, 0.42 }, -- Blood of the Enemy
			[6] = { 6.1, 2.63 }, -- Purification Protocol
			[4] = { 1.48, 1.13 }, -- Worldvein Resonance
			[27] = { 5.09, 3.51 }, -- Memory of Lucid Dreams
			[5] = { 10, 3.8 }, -- Essence of the Focusing Iris
			[12] = { 8.48, 3.43 }, -- The Crucible of Flame
			[22] = { 9.39, 3.44 }, -- Vision of Perfection
			[32] = { 2.32, 2.33 }, -- Conflict and Strife
			[14] = { 8.59, 3.16 }, -- Condensed Life-Force
			[28] = { 3.01, 1.36 }, -- The Unbound Force
		}, 1564736400)

		insertDefaultScalesData(defaultName, 4, 1, { -- Assassination Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 12426 - 16186 (avg 13215), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 1.91, -- Blood Siphon
			[481] = 4.73, -- Incite the Pack
			[157] = 5.72, -- Rezan's Fury
			[192] = 4.2, -- Meticulous Scheming
			[459] = 2.67, -- Unstable Flames
			[485] = 5, -- Laser Matrix
			[483] = 5.36, -- Archive of the Titans
			[479] = 5.91, -- Dagger in the Back
			[497] = 1.13, -- Stand As One
			[20] = 2.11, -- Lifespeed
			[500] = 2.83, -- Synaptic Spark Capacitor
			[499] = 1.95, -- Ricocheting Inflatable Pyrosaw
			[82] = 7.1, -- Champion of Azeroth
			[576] = 3.65, -- Loyal to the End
			[136] = 8.03, -- Double Dose
			[461] = 1.56, -- Earthlink
			[577] = 2.99, -- Arcane Heart
			[522] = 7.52, -- Ancients' Bulwark
			[501] = 6.01, -- Relational Normalization Gizmo
			[406] = 3.3, -- Scent of Blood
			[193] = 8.12, -- Blightborne Infusion
			[569] = 6.75, -- Clockwork Heart
			[575] = 9.25, -- Undulating Tides
			[495] = 4.82, -- Anduin's Dedication
			[156] = 3.31, -- Ruinous Bolt
			[498] = 3.53, -- Barrage Of Many Bombs
			[195] = 4.86, -- Secrets of the Deep
			[492] = 4.64, -- Liberator's Might
			[562] = 7.67, -- Treacherous Covenant
			[494] = 6.03, -- Battlefield Precision
			[22] = 2.37, -- Heed My Call
			[31] = 2.73, -- Gutripper
			[505] = 5.26, -- Tradewinds
			[482] = 4.75, -- Thunderous Blast
			[541] = 1.54, -- Fight or Flight
			[249] = 10, -- Nothing Personal
			[496] = 1.51, -- Stronger Together
			[526] = 7.55, -- Endless Hunger
			[504] = 5.56, -- Unstable Catalyst
			[38] = 2.13, -- On My Way
			[480] = 4.61, -- Blood Rite
			[194] = 4.56, -- Filthy Transfusion
			[30] = 4.2, -- Overwhelming Power
			[408] = 1.52, -- Shrouded Suffocation
			[478] = 5.67, -- Tidal Surge
			[561] = 3.94, -- Seductive Power
			[181] = 6.09, -- Twist the Knife
			[521] = 4.73, -- Shadow of Elune
			[523] = 4.55, -- Apothecary's Concoctions
			[560] = 2.09, -- Bonded Souls
			[196] = 7.28, -- Swirling Sands
			[462] = 1.59, -- Azerite Globules
			[493] = 2.74, -- Last Gift
			[21] = 2.45, -- Elemental Whirl
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 10700 - 14879 (avg 13019), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 1.28, 0.73 }, -- Worldvein Resonance
			[6] = { 4.23, 1.8 }, -- Purification Protocol
			[14] = { 5.81, 2.05 }, -- Condensed Life-Force
			[27] = { 10, 3.55 }, -- Memory of Lucid Dreams
			[23] = { 5.59, 1.08 }, -- Blood of the Enemy
			[28] = { 3.2, 1.44 }, -- The Unbound Force
			[12] = { 6.2, 2.16 }, -- The Crucible of Flame
			[15] = { 3.21, 0 }, -- Ripple in Space
			[32] = { 1.57, 1.61 }, -- Conflict and Strife
			[5] = { 7.33, 2.64 }, -- Essence of the Focusing Iris
		}, 1564736400)

		insertDefaultScalesData(defaultName, 4, 2, { -- Outlaw Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 36626 - 48941 (avg 39846), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[577] = 2.14, -- Arcane Heart
			[479] = 6.76, -- Dagger in the Back
			[562] = 6.64, -- Treacherous Covenant
			[523] = 5.21, -- Apothecary's Concoctions
			[504] = 4.82, -- Unstable Catalyst
			[576] = 2.44, -- Loyal to the End
			[180] = 4.22, -- Keep Your Wits About You
			[82] = 6.43, -- Champion of Azeroth
			[463] = 0.03, -- Blessed Portents
			[561] = 3.89, -- Seductive Power
			[446] = 7.56, -- Brigand's Blitz
			[495] = 4.16, -- Anduin's Dedication
			[485] = 5.67, -- Laser Matrix
			[501] = 5.4, -- Relational Normalization Gizmo
			[239] = 3.86, -- Snake Eyes
			[38] = 1.98, -- On My Way
			[483] = 4.92, -- Archive of the Titans
			[499] = 2.35, -- Ricocheting Inflatable Pyrosaw
			[101] = 0.03, -- Shimmering Haven
			[482] = 5.09, -- Thunderous Blast
			[500] = 3.33, -- Synaptic Spark Capacitor
			[481] = 3.24, -- Incite the Pack
			[100] = 0.03, -- Strength in Numbers
			[526] = 6.89, -- Endless Hunger
			[462] = 1.92, -- Azerite Globules
			[498] = 4.07, -- Barrage Of Many Bombs
			[478] = 6, -- Tidal Surge
			[157] = 6.38, -- Rezan's Fury
			[480] = 4.49, -- Blood Rite
			[43] = 0.04, -- Winds of War
			[192] = 5.25, -- Meticulous Scheming
			[84] = 0.1, -- Bulwark of the Masses
			[14] = 0.15, -- Longstrider
			[502] = 0.17, -- Personal Absorb-o-Tron
			[42] = 0.01, -- Savior
			[569] = 5.31, -- Clockwork Heart
			[22] = 2.77, -- Heed My Call
			[195] = 4.39, -- Secrets of the Deep
			[19] = 0.09, -- Woundbinder
			[521] = 4.41, -- Shadow of Elune
			[494] = 6.35, -- Battlefield Precision
			[156] = 3.79, -- Ruinous Bolt
			[194] = 4.64, -- Filthy Transfusion
			[497] = 1.18, -- Stand As One
			[411] = 8.18, -- Ace Up Your Sleeve
			[44] = 0.01, -- Vampiric Speed
			[85] = 0.13, -- Gemhide
			[496] = 1.35, -- Stronger Together
			[522] = 6.92, -- Ancients' Bulwark
			[461] = 1.67, -- Earthlink
			[541] = 1.59, -- Fight or Flight
			[492] = 4.13, -- Liberator's Might
			[193] = 6.2, -- Blightborne Infusion
			[129] = 6.65, -- Deadshot
			[575] = 10, -- Undulating Tides
			[83] = 0.03, -- Impassive Visage
			[560] = 2.27, -- Bonded Souls
			[20] = 2.17, -- Lifespeed
			[459] = 2.39, -- Unstable Flames
			[505] = 3.6, -- Tradewinds
			[30] = 4.26, -- Overwhelming Power
			[493] = 1.89, -- Last Gift
			[15] = 0.03, -- Resounding Protection
			[86] = 0.04, -- Azerite Fortification
			[196] = 5.72, -- Swirling Sands
			[21] = 2.09, -- Elemental Whirl
			[18] = 1.29, -- Blood Siphon
			[13] = 0.11, -- Azerite Empowered
			[410] = 3.77, -- Paradise Lost
			[31] = 3.05, -- Gutripper
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 33972 - 41687 (avg 38601), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 2.29, 2.34 }, -- Conflict and Strife
			[15] = { 4.35, 0 }, -- Ripple in Space
			[22] = { 5.7, 2.62 }, -- Vision of Perfection
			[14] = { 9.34, 3.47 }, -- Condensed Life-Force
			[4] = { 1.45, 1.19 }, -- Worldvein Resonance
			[12] = { 10, 3.76 }, -- The Crucible of Flame
			[5] = { 9.57, 3.74 }, -- Essence of the Focusing Iris
			[6] = { 7.01, 2.97 }, -- Purification Protocol
			[23] = { 3.41, 0.97 }, -- Blood of the Enemy
			[27] = { 8.28, 6.15 }, -- Memory of Lucid Dreams
			[28] = { 3.39, 1.02 }, -- The Unbound Force
		}, 1564736400)

		insertDefaultScalesData(defaultName, 4, 3, { -- Subtlety Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 20300 - 24722 (avg 22736), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = 1.4, -- Heed My Call
			[414] = 3.86, -- Inevitability
			[82] = 3.58, -- Champion of Azeroth
			[240] = 3.91, -- Blade In The Shadows
			[105] = 0.03, -- Ephemeral Recovery
			[497] = 0.71, -- Stand As One
			[86] = 0.01, -- Azerite Fortification
			[99] = 0.08, -- Ablative Shielding
			[562] = 3.78, -- Treacherous Covenant
			[541] = 0.92, -- Fight or Flight
			[501] = 3.11, -- Relational Normalization Gizmo
			[175] = 3.91, -- Night's Vengeance
			[498] = 1.95, -- Barrage Of Many Bombs
			[504] = 2.83, -- Unstable Catalyst
			[493] = 1.18, -- Last Gift
			[500] = 1.84, -- Synaptic Spark Capacitor
			[560] = 1.26, -- Bonded Souls
			[482] = 2.63, -- Thunderous Blast
			[14] = 0.07, -- Longstrider
			[523] = 2.6, -- Apothecary's Concoctions
			[38] = 1.15, -- On My Way
			[481] = 2.01, -- Incite the Pack
			[479] = 3.34, -- Dagger in the Back
			[19] = 0.04, -- Woundbinder
			[217] = 0.04, -- Footpad
			[21] = 1.27, -- Elemental Whirl
			[503] = 0.03, -- Auto-Self-Cauterizer
			[483] = 2.87, -- Archive of the Titans
			[30] = 2.3, -- Overwhelming Power
			[485] = 2.73, -- Laser Matrix
			[494] = 3.11, -- Battlefield Precision
			[87] = 0.05, -- Self Reliance
			[98] = 0.09, -- Crystalline Carapace
			[196] = 3.6, -- Swirling Sands
			[473] = 0.04, -- Shrouded Mantle
			[577] = 0.84, -- Arcane Heart
			[445] = 1.7, -- Perforate
			[192] = 2.46, -- Meticulous Scheming
			[157] = 3.22, -- Rezan's Fury
			[18] = 0.86, -- Blood Siphon
			[193] = 3.97, -- Blightborne Infusion
			[521] = 2.66, -- Shadow of Elune
			[100] = 0.04, -- Strength in Numbers
			[413] = 10, -- The First Dance
			[561] = 1.95, -- Seductive Power
			[195] = 2.53, -- Secrets of the Deep
			[194] = 2.6, -- Filthy Transfusion
			[103] = 0.02, -- Concentrated Mending
			[459] = 1.48, -- Unstable Flames
			[84] = 0.01, -- Bulwark of the Masses
			[43] = 0.01, -- Winds of War
			[548] = 0.03, -- Lying In Wait
			[156] = 2, -- Ruinous Bolt
			[13] = 0.01, -- Azerite Empowered
			[20] = 1.14, -- Lifespeed
			[575] = 4.83, -- Undulating Tides
			[526] = 3.92, -- Endless Hunger
			[569] = 3.83, -- Clockwork Heart
			[83] = 0.04, -- Impassive Visage
			[463] = 0.01, -- Blessed Portents
			[502] = 0.02, -- Personal Absorb-o-Tron
			[15] = 0.12, -- Resounding Protection
			[478] = 3.28, -- Tidal Surge
			[461] = 1.14, -- Earthlink
			[576] = 1.51, -- Loyal to the End
			[124] = 1.44, -- Replicating Shadows
			[462] = 0.89, -- Azerite Globules
			[499] = 1.1, -- Ricocheting Inflatable Pyrosaw
			[492] = 2.55, -- Liberator's Might
			[522] = 3.94, -- Ancients' Bulwark
			[31] = 1.5, -- Gutripper
			[495] = 2.4, -- Anduin's Dedication
			[496] = 0.89, -- Stronger Together
			[505] = 2.21, -- Tradewinds
			[480] = 2.69, -- Blood Rite
			[104] = 0.03, -- Bracing Chill
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 18789 - 24124 (avg 22028), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 7.58, 2.68 }, -- The Crucible of Flame
			[5] = { 8.35, 3.45 }, -- Essence of the Focusing Iris
			[14] = { 6.2, 2.4 }, -- Condensed Life-Force
			[15] = { 3.57, 0.03 }, -- Ripple in Space
			[27] = { 10, 6.42 }, -- Memory of Lucid Dreams
			[28] = { 3.35, 1.38 }, -- The Unbound Force
			[4] = { 1.53, 1.07 }, -- Worldvein Resonance
			[32] = { 2.02, 2.03 }, -- Conflict and Strife
			[6] = { 5.1, 2.05 }, -- Purification Protocol
			[23] = { 4.89, 0.68 }, -- Blood of the Enemy
			[22] = { 3.66, 1.14 }, -- Vision of Perfection
		}, 1564736400)

		insertDefaultScalesData(defaultName, 7, 1, { -- Elemental Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 13639 - 18054 (avg 14733), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[485] = 3.63, -- Laser Matrix
			[492] = 3.83, -- Liberator's Might
			[42] = 0.02, -- Savior
			[38] = 1.49, -- On My Way
			[20] = 1.74, -- Lifespeed
			[459] = 2.26, -- Unstable Flames
			[417] = 0.02, -- Tectonic Thunder
			[561] = 2.98, -- Seductive Power
			[576] = 1.51, -- Loyal to the End
			[479] = 4.19, -- Dagger in the Back
			[457] = 10, -- Igneous Potential
			[562] = 5.72, -- Treacherous Covenant
			[104] = 0.02, -- Bracing Chill
			[31] = 2.07, -- Gutripper
			[577] = 1.65, -- Arcane Heart
			[495] = 3.45, -- Anduin's Dedication
			[462] = 1.17, -- Azerite Globules
			[499] = 1.53, -- Ricocheting Inflatable Pyrosaw
			[193] = 6.49, -- Blightborne Infusion
			[498] = 2.59, -- Barrage Of Many Bombs
			[494] = 3.91, -- Battlefield Precision
			[503] = 0.09, -- Auto-Self-Cauterizer
			[222] = 2.59, -- Echo of the Elementals
			[84] = 0.01, -- Bulwark of the Masses
			[447] = 3.59, -- Ancestral Resonance
			[82] = 4.99, -- Champion of Azeroth
			[18] = 0.84, -- Blood Siphon
			[493] = 1.16, -- Last Gift
			[501] = 4.22, -- Relational Normalization Gizmo
			[504] = 4.15, -- Unstable Catalyst
			[21] = 1.75, -- Elemental Whirl
			[30] = 2.77, -- Overwhelming Power
			[496] = 1.05, -- Stronger Together
			[482] = 3.5, -- Thunderous Blast
			[157] = 4.18, -- Rezan's Fury
			[192] = 3.9, -- Meticulous Scheming
			[416] = 6.16, -- Natural Harmony
			[461] = 1.25, -- Earthlink
			[500] = 2.3, -- Synaptic Spark Capacitor
			[196] = 5.72, -- Swirling Sands
			[478] = 4.16, -- Tidal Surge
			[156] = 2.48, -- Ruinous Bolt
			[481] = 2.02, -- Incite the Pack
			[575] = 6.56, -- Undulating Tides
			[497] = 0.99, -- Stand As One
			[483] = 3.97, -- Archive of the Titans
			[178] = 3.62, -- Lava Shock
			[480] = 3.12, -- Blood Rite
			[569] = 4.12, -- Clockwork Heart
			[44] = 0.01, -- Vampiric Speed
			[505] = 2.2, -- Tradewinds
			[195] = 3.61, -- Secrets of the Deep
			[523] = 3.34, -- Apothecary's Concoctions
			[522] = 5.32, -- Ancients' Bulwark
			[194] = 3.56, -- Filthy Transfusion
			[560] = 1.61, -- Bonded Souls
			[541] = 1.31, -- Fight or Flight
			[521] = 3.14, -- Shadow of Elune
			[99] = 0.01, -- Ablative Shielding
			[448] = 3.25, -- Synapse Shock
			[526] = 5.36, -- Endless Hunger
			[22] = 1.77, -- Heed My Call
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 13192 - 15196 (avg 14344), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 0.48, 1.09 }, -- Worldvein Resonance
			[27] = { 1.4, 1.05 }, -- Memory of Lucid Dreams
			[5] = { 7.19, 3.08 }, -- Essence of the Focusing Iris
			[22] = { 2.42, 0.06 }, -- Vision of Perfection
			[6] = { 4.39, 2.28 }, -- Purification Protocol
			[23] = { 5.17, 0.74 }, -- Blood of the Enemy
			[28] = { 2.57, 2.39 }, -- The Unbound Force
			[32] = { 10, 2.12 }, -- Conflict and Strife
			[12] = { 5.62, 2.86 }, -- The Crucible of Flame
			[15] = { 2.98, 0 }, -- Ripple in Space
			[14] = { 6.84, 2.68 }, -- Condensed Life-Force
		}, 1564736400)

		insertDefaultScalesData(defaultName, 7, 2, { -- Enhancement Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 28543 - 36709 (avg 33598), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[20] = 1.49, -- Lifespeed
			[521] = 3.16, -- Shadow of Elune
			[560] = 1.43, -- Bonded Souls
			[179] = 3.44, -- Strength of Earth
			[523] = 3.22, -- Apothecary's Concoctions
			[195] = 3.24, -- Secrets of the Deep
			[485] = 3.43, -- Laser Matrix
			[483] = 3.49, -- Archive of the Titans
			[137] = 2.63, -- Primal Primer
			[462] = 1.07, -- Azerite Globules
			[495] = 3.12, -- Anduin's Dedication
			[18] = 1.3, -- Blood Siphon
			[480] = 3.18, -- Blood Rite
			[192] = 3.91, -- Meticulous Scheming
			[494] = 3.82, -- Battlefield Precision
			[577] = 1.65, -- Arcane Heart
			[461] = 1.06, -- Earthlink
			[30] = 2.77, -- Overwhelming Power
			[193] = 5.16, -- Blightborne Infusion
			[22] = 1.63, -- Heed My Call
			[447] = 5.45, -- Ancestral Resonance
			[223] = 1.95, -- Lightning Conduit
			[38] = 1.32, -- On My Way
			[561] = 2.77, -- Seductive Power
			[481] = 3.24, -- Incite the Pack
			[157] = 3.87, -- Rezan's Fury
			[420] = 10, -- Roiling Storm
			[499] = 1.4, -- Ricocheting Inflatable Pyrosaw
			[505] = 3.45, -- Tradewinds
			[576] = 2.29, -- Loyal to the End
			[522] = 4.91, -- Ancients' Bulwark
			[526] = 4.86, -- Endless Hunger
			[82] = 4.71, -- Champion of Azeroth
			[575] = 6.16, -- Undulating Tides
			[479] = 4.1, -- Dagger in the Back
			[497] = 0.77, -- Stand As One
			[541] = 1.03, -- Fight or Flight
			[21] = 1.53, -- Elemental Whirl
			[156] = 2.22, -- Ruinous Bolt
			[504] = 3.48, -- Unstable Catalyst
			[496] = 0.95, -- Stronger Together
			[569] = 3.74, -- Clockwork Heart
			[530] = 5.29, -- Thunderaan's Fury
			[478] = 3.79, -- Tidal Surge
			[482] = 3.12, -- Thunderous Blast
			[31] = 1.83, -- Gutripper
			[498] = 2.39, -- Barrage Of Many Bombs
			[196] = 4.59, -- Swirling Sands
			[500] = 1.98, -- Synaptic Spark Capacitor
			[416] = 6.77, -- Natural Harmony
			[501] = 3.91, -- Relational Normalization Gizmo
			[194] = 3.2, -- Filthy Transfusion
			[562] = 5.07, -- Treacherous Covenant
			[493] = 1.83, -- Last Gift
			[492] = 3.13, -- Liberator's Might
			[459] = 1.89, -- Unstable Flames
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 26388 - 34097 (avg 32297), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 1.53, 1.25 }, -- Worldvein Resonance
			[12] = { 8.83, 3.63 }, -- The Crucible of Flame
			[15] = { 3.98, 0 }, -- Ripple in Space
			[6] = { 6.43, 2.89 }, -- Purification Protocol
			[14] = { 9.35, 3.36 }, -- Condensed Life-Force
			[28] = { 4.02, 2.1 }, -- The Unbound Force
			[23] = { 8.26, 2.57 }, -- Blood of the Enemy
			[22] = { 1.7, 0.13 }, -- Vision of Perfection
			[27] = { 0.84, 1.48 }, -- Memory of Lucid Dreams
			[32] = { 6.94, 2.57 }, -- Conflict and Strife
			[5] = { 10, 4.15 }, -- Essence of the Focusing Iris
		}, 1565341200)

		insertDefaultScalesData(offensiveName, 7, 3, { -- Restoration Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6767 - 8437 (avg 7149), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[99] = 0.04, -- Ablative Shielding
			[82] = 2.17, -- Champion of Azeroth
			[526] = 3.2, -- Endless Hunger
			[30] = 1.84, -- Overwhelming Power
			[568] = 0.01, -- Person-Computer Interface
			[503] = 0.05, -- Auto-Self-Cauterizer
			[577] = 0.68, -- Arcane Heart
			[492] = 1.7, -- Liberator's Might
			[521] = 2.04, -- Shadow of Elune
			[194] = 3.55, -- Filthy Transfusion
			[43] = 0.01, -- Winds of War
			[20] = 1.02, -- Lifespeed
			[416] = 2.58, -- Natural Harmony
			[539] = 0.07, -- Ancient Ankh Talisman
			[157] = 3.87, -- Rezan's Fury
			[84] = 0.04, -- Bulwark of the Masses
			[480] = 2.06, -- Blood Rite
			[38] = 0.97, -- On My Way
			[31] = 1.83, -- Gutripper
			[485] = 3.4, -- Laser Matrix
			[448] = 2.5, -- Synapse Shock
			[22] = 1.76, -- Heed My Call
			[479] = 4.1, -- Dagger in the Back
			[104] = 0.03, -- Bracing Chill
			[462] = 1.1, -- Azerite Globules
			[482] = 3.23, -- Thunderous Blast
			[98] = 0.01, -- Crystalline Carapace
			[102] = 0.05, -- Synergistic Growth
			[483] = 2.75, -- Archive of the Titans
			[86] = 0.03, -- Azerite Fortification
			[449] = 0.06, -- Overflowing Shores
			[474] = 0.01, -- Pack Spirit
			[569] = 1.71, -- Clockwork Heart
			[459] = 0.9, -- Unstable Flames
			[461] = 0.88, -- Earthlink
			[481] = 0.02, -- Incite the Pack
			[14] = 0.03, -- Longstrider
			[504] = 2.69, -- Unstable Catalyst
			[192] = 1.1, -- Meticulous Scheming
			[18] = 0.04, -- Blood Siphon
			[560] = 1, -- Bonded Souls
			[463] = 0.02, -- Blessed Portents
			[575] = 6, -- Undulating Tides
			[83] = 0.01, -- Impassive Visage
			[224] = 0.03, -- Swelling Stream
			[496] = 0.52, -- Stronger Together
			[423] = 0.02, -- Spouting Spirits
			[494] = 3.49, -- Battlefield Precision
			[103] = 0.02, -- Concentrated Mending
			[101] = 0.04, -- Shimmering Haven
			[196] = 2.19, -- Swirling Sands
			[85] = 0.02, -- Gemhide
			[422] = 0.03, -- Surging Tides
			[541] = 0.84, -- Fight or Flight
			[499] = 1.47, -- Ricocheting Inflatable Pyrosaw
			[478] = 3.89, -- Tidal Surge
			[195] = 2.47, -- Secrets of the Deep
			[497] = 0.62, -- Stand As One
			[522] = 3.13, -- Ancients' Bulwark
			[21] = 0.75, -- Elemental Whirl
			[447] = 1.01, -- Ancestral Resonance
			[138] = 0.03, -- Soothing Waters
			[501] = 2.69, -- Relational Normalization Gizmo
			[87] = 0.02, -- Self Reliance
			[495] = 2.43, -- Anduin's Dedication
			[500] = 2.11, -- Synaptic Spark Capacitor
			[502] = 0.02, -- Personal Absorb-o-Tron
			[193] = 2.45, -- Blightborne Infusion
			[562] = 3.78, -- Treacherous Covenant
			[89] = 0.07, -- Azerite Veins
			[457] = 10, -- Igneous Potential
			[156] = 2.32, -- Ruinous Bolt
			[498] = 2.44, -- Barrage Of Many Bombs
			[100] = 0.06, -- Strength in Numbers
			[15] = 0.06, -- Resounding Protection
			[561] = 2.1, -- Seductive Power
			[523] = 3.13, -- Apothecary's Concoctions
			[207] = 0.07, -- Serene Spirit
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6679 - 7606 (avg 7030), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 1.54, 1.5 }, -- Conflict and Strife
			[23] = { 0.37, 0.37 }, -- Blood of the Enemy
			[12] = { 10, 4.91 }, -- The Crucible of Flame
			[15] = { 3.59, 0 }, -- Ripple in Space
			[28] = { 0.98, 0.97 }, -- The Unbound Force
			[4] = { 0.45, 1.11 }, -- Worldvein Resonance
			[14] = { 3.61, 3.6 }, -- Condensed Life-Force
			[5] = { 2.41, 2.34 }, -- Essence of the Focusing Iris
			[6] = { 3.07, 3.03 }, -- Purification Protocol
		}, 1564736400)

		insertDefaultScalesData(defaultName, 9, 1, { -- Affliction Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 15481 - 21493 (avg 17933), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[156] = 3.61, -- Ruinous Bolt
			[123] = 6.22, -- Wracking Brilliance
			[425] = 5.15, -- Sudden Onset
			[14] = 0.08, -- Longstrider
			[501] = 5.83, -- Relational Normalization Gizmo
			[463] = 0.16, -- Blessed Portents
			[31] = 3.06, -- Gutripper
			[13] = 0.18, -- Azerite Empowered
			[196] = 6.47, -- Swirling Sands
			[105] = 0.2, -- Ephemeral Recovery
			[481] = 5.15, -- Incite the Pack
			[505] = 5.62, -- Tradewinds
			[496] = 1.77, -- Stronger Together
			[568] = 0.07, -- Person-Computer Interface
			[43] = 0.08, -- Winds of War
			[462] = 2.01, -- Azerite Globules
			[22] = 2.83, -- Heed My Call
			[99] = 0.18, -- Ablative Shielding
			[20] = 2.41, -- Lifespeed
			[19] = 0.11, -- Woundbinder
			[82] = 7, -- Champion of Azeroth
			[21] = 2.54, -- Elemental Whirl
			[426] = 6.51, -- Dreadful Calling
			[475] = 0.2, -- Desperate Power
			[479] = 6.42, -- Dagger in the Back
			[569] = 4.75, -- Clockwork Heart
			[499] = 2.48, -- Ricocheting Inflatable Pyrosaw
			[504] = 5.08, -- Unstable Catalyst
			[38] = 2.15, -- On My Way
			[483] = 4.66, -- Archive of the Titans
			[531] = 0.08, -- Terror of the Mind
			[100] = 0.18, -- Strength in Numbers
			[183] = 7.07, -- Inevitable Demise
			[560] = 2.6, -- Bonded Souls
			[561] = 3.75, -- Seductive Power
			[500] = 3.37, -- Synaptic Spark Capacitor
			[492] = 4.67, -- Liberator's Might
			[15] = 0.15, -- Resounding Protection
			[503] = 0.16, -- Auto-Self-Cauterizer
			[104] = 0.17, -- Bracing Chill
			[442] = 5.85, -- Pandemic Invocation
			[192] = 5.45, -- Meticulous Scheming
			[83] = 0.05, -- Impassive Visage
			[522] = 7.11, -- Ancients' Bulwark
			[42] = 0.06, -- Savior
			[523] = 5.07, -- Apothecary's Concoctions
			[541] = 1.82, -- Fight or Flight
			[89] = 0.1, -- Azerite Veins
			[493] = 3.13, -- Last Gift
			[230] = 7.05, -- Cascading Calamity
			[480] = 4.77, -- Blood Rite
			[577] = 2.26, -- Arcane Heart
			[576] = 3.93, -- Loyal to the End
			[194] = 5.43, -- Filthy Transfusion
			[497] = 1.28, -- Stand As One
			[482] = 5.36, -- Thunderous Blast
			[85] = 0.25, -- Gemhide
			[485] = 5.53, -- Laser Matrix
			[101] = 0.08, -- Shimmering Haven
			[44] = 0.18, -- Vampiric Speed
			[86] = 0.23, -- Azerite Fortification
			[521] = 4.95, -- Shadow of Elune
			[193] = 7.31, -- Blightborne Infusion
			[575] = 10, -- Undulating Tides
			[87] = 0.22, -- Self Reliance
			[208] = 0.08, -- Lifeblood
			[195] = 4.49, -- Secrets of the Deep
			[98] = 0.16, -- Crystalline Carapace
			[495] = 4.43, -- Anduin's Dedication
			[18] = 2.32, -- Blood Siphon
			[30] = 4.61, -- Overwhelming Power
			[459] = 2.6, -- Unstable Flames
			[157] = 6.23, -- Rezan's Fury
			[461] = 1.51, -- Earthlink
			[498] = 3.97, -- Barrage Of Many Bombs
			[562] = 6.82, -- Treacherous Covenant
			[526] = 7.12, -- Endless Hunger
			[84] = 0.17, -- Bulwark of the Masses
			[502] = 0.06, -- Personal Absorb-o-Tron
			[494] = 6.44, -- Battlefield Precision
			[103] = 0.05, -- Concentrated Mending
			[478] = 5.95, -- Tidal Surge
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 10696 - 21892 (avg 17646), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[28] = { 3.73, 1.82 }, -- The Unbound Force
			[32] = { 1.8, 1.93 }, -- Conflict and Strife
			[4] = { 0.77, 0.95 }, -- Worldvein Resonance
			[6] = { 5.58, 2.56 }, -- Purification Protocol
			[14] = { 7.56, 2.96 }, -- Condensed Life-Force
			[23] = { 5.98, 0.97 }, -- Blood of the Enemy
			[12] = { 7.56, 2.99 }, -- The Crucible of Flame
			[15] = { 3.35, 0.07 }, -- Ripple in Space
			[22] = { 0.24, 2.61 }, -- Vision of Perfection
			[27] = { 3.04, 1.26 }, -- Memory of Lucid Dreams
			[5] = { 10, 3.52 }, -- Essence of the Focusing Iris
		}, 1564736400)

		insertDefaultScalesData(defaultName, 9, 2, { -- Demonology Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11073 - 19041 (avg 13640), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[561] = 3.13, -- Seductive Power
			[521] = 4.7, -- Shadow of Elune
			[428] = 4.31, -- Demonic Meteor
			[492] = 4.17, -- Liberator's Might
			[195] = 4.03, -- Secrets of the Deep
			[30] = 3.89, -- Overwhelming Power
			[462] = 1.26, -- Azerite Globules
			[86] = 0.03, -- Azerite Fortification
			[22] = 1.92, -- Heed My Call
			[157] = 4.7, -- Rezan's Fury
			[541] = 1.44, -- Fight or Flight
			[498] = 2.81, -- Barrage Of Many Bombs
			[482] = 3.58, -- Thunderous Blast
			[38] = 1.81, -- On My Way
			[560] = 2.08, -- Bonded Souls
			[499] = 1.67, -- Ricocheting Inflatable Pyrosaw
			[82] = 5.51, -- Champion of Azeroth
			[479] = 4.86, -- Dagger in the Back
			[156] = 2.85, -- Ruinous Bolt
			[483] = 4.27, -- Archive of the Titans
			[522] = 6.3, -- Ancients' Bulwark
			[577] = 0.41, -- Arcane Heart
			[496] = 1.41, -- Stronger Together
			[576] = 3, -- Loyal to the End
			[500] = 2.55, -- Synaptic Spark Capacitor
			[105] = 0.01, -- Ephemeral Recovery
			[459] = 2.15, -- Unstable Flames
			[493] = 2.41, -- Last Gift
			[458] = 3.52, -- Supreme Commander
			[130] = 2.34, -- Shadow's Bite
			[31] = 2.06, -- Gutripper
			[21] = 2.24, -- Elemental Whirl
			[20] = 1.46, -- Lifespeed
			[429] = 10, -- Baleful Invocation
			[196] = 4.96, -- Swirling Sands
			[478] = 4.66, -- Tidal Surge
			[523] = 3.77, -- Apothecary's Concoctions
			[569] = 5.45, -- Clockwork Heart
			[562] = 6.19, -- Treacherous Covenant
			[505] = 4.51, -- Tradewinds
			[575] = 7.02, -- Undulating Tides
			[193] = 6.06, -- Blightborne Infusion
			[497] = 0.97, -- Stand As One
			[480] = 4.55, -- Blood Rite
			[463] = 0.04, -- Blessed Portents
			[99] = 0.02, -- Ablative Shielding
			[504] = 4.45, -- Unstable Catalyst
			[481] = 4.1, -- Incite the Pack
			[190] = 3.52, -- Umbral Blaze
			[526] = 6.35, -- Endless Hunger
			[494] = 2.99, -- Battlefield Precision
			[461] = 1.33, -- Earthlink
			[18] = 1.71, -- Blood Siphon
			[192] = 5, -- Meticulous Scheming
			[501] = 5.17, -- Relational Normalization Gizmo
			[194] = 3.78, -- Filthy Transfusion
			[495] = 3.94, -- Anduin's Dedication
			[485] = 3.8, -- Laser Matrix
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 11892 - 18167 (avg 13812), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[6] = { 5.46, 2.71 }, -- Purification Protocol
			[27] = { 4.75, 3.17 }, -- Memory of Lucid Dreams
			[12] = { 7.14, 3.75 }, -- The Crucible of Flame
			[14] = { 9.15, 3.21 }, -- Condensed Life-Force
			[28] = { 3.38, 1.57 }, -- The Unbound Force
			[15] = { 3.77, 0.02 }, -- Ripple in Space
			[22] = { 6, 2.07 }, -- Vision of Perfection
			[32] = { 2.83, 2.71 }, -- Conflict and Strife
			[5] = { 10, 3.7 }, -- Essence of the Focusing Iris
			[23] = { 6.64, 0.36 }, -- Blood of the Enemy
			[4] = { 1.7, 1.4 }, -- Worldvein Resonance
		}, 1564736400)

		insertDefaultScalesData(defaultName, 9, 3, { -- Destruction Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 19820 - 24680 (avg 21617), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[18] = 2.44, -- Blood Siphon
			[131] = 6.37, -- Chaos Shards
			[157] = 6.53, -- Rezan's Fury
			[82] = 7.14, -- Champion of Azeroth
			[577] = 1.95, -- Arcane Heart
			[485] = 5.55, -- Laser Matrix
			[193] = 8.02, -- Blightborne Infusion
			[208] = 0.05, -- Lifeblood
			[499] = 2.29, -- Ricocheting Inflatable Pyrosaw
			[541] = 1.86, -- Fight or Flight
			[481] = 5.65, -- Incite the Pack
			[22] = 2.79, -- Heed My Call
			[196] = 6.96, -- Swirling Sands
			[194] = 5.27, -- Filthy Transfusion
			[459] = 2.77, -- Unstable Flames
			[15] = 0.07, -- Resounding Protection
			[523] = 5.19, -- Apothecary's Concoctions
			[522] = 7.89, -- Ancients' Bulwark
			[482] = 5.13, -- Thunderous Blast
			[568] = 0.1, -- Person-Computer Interface
			[14] = 0.01, -- Longstrider
			[496] = 1.53, -- Stronger Together
			[20] = 2.1, -- Lifespeed
			[560] = 2.32, -- Bonded Souls
			[500] = 3.29, -- Synaptic Spark Capacitor
			[492] = 4.66, -- Liberator's Might
			[480] = 5.19, -- Blood Rite
			[562] = 7.55, -- Treacherous Covenant
			[13] = 0.03, -- Azerite Empowered
			[156] = 3.82, -- Ruinous Bolt
			[526] = 7.92, -- Endless Hunger
			[100] = 0.09, -- Strength in Numbers
			[98] = 0.09, -- Crystalline Carapace
			[498] = 4.12, -- Barrage Of Many Bombs
			[103] = 0.03, -- Concentrated Mending
			[576] = 4.07, -- Loyal to the End
			[521] = 5.08, -- Shadow of Elune
			[505] = 6.17, -- Tradewinds
			[504] = 5.44, -- Unstable Catalyst
			[502] = 0.04, -- Personal Absorb-o-Tron
			[462] = 1.87, -- Azerite Globules
			[497] = 1.3, -- Stand As One
			[561] = 4.04, -- Seductive Power
			[444] = 6.26, -- Crashing Chaos
			[192] = 5.34, -- Meticulous Scheming
			[475] = 0.06, -- Desperate Power
			[495] = 4.95, -- Anduin's Dedication
			[38] = 2.12, -- On My Way
			[461] = 1.73, -- Earthlink
			[575] = 10, -- Undulating Tides
			[21] = 2.52, -- Elemental Whirl
			[501] = 6.17, -- Relational Normalization Gizmo
			[478] = 6.18, -- Tidal Surge
			[101] = 0.1, -- Shimmering Haven
			[569] = 4.72, -- Clockwork Heart
			[531] = 0.08, -- Terror of the Mind
			[460] = 5.95, -- Bursting Flare
			[30] = 4.63, -- Overwhelming Power
			[232] = 5.85, -- Flashpoint
			[195] = 4.85, -- Secrets of the Deep
			[494] = 5.81, -- Battlefield Precision
			[493] = 3.29, -- Last Gift
			[479] = 6.68, -- Dagger in the Back
			[483] = 5.09, -- Archive of the Titans
			[31] = 3.05, -- Gutripper
			[432] = 5.72, -- Chaotic Inferno
			[463] = 0.12, -- Blessed Portents
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 12490 - 27249 (avg 21264), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 6.47, 3.28 }, -- The Crucible of Flame
			[23] = { 3.41, 0.64 }, -- Blood of the Enemy
			[14] = { 7.02, 2.98 }, -- Condensed Life-Force
			[28] = { 2.06, 1.11 }, -- The Unbound Force
			[6] = { 4.93, 2.5 }, -- Purification Protocol
			[4] = { 0.3, 1.1 }, -- Worldvein Resonance
			[22] = { 10, 4.6 }, -- Vision of Perfection
			[32] = { 2.24, 2.18 }, -- Conflict and Strife
			[5] = { 8.87, 3.34 }, -- Essence of the Focusing Iris
			[15] = { 3.12, 0 }, -- Ripple in Space
			[27] = { 7.11, 2.23 }, -- Memory of Lucid Dreams
		}, 1564736400)

		insertDefaultScalesData(defaultName, 1, 1, { -- Arms Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 17256 - 20412 (avg 18117), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[459] = 3.49, -- Unstable Flames
			[463] = 0.21, -- Blessed Portents
			[99] = 0.16, -- Ablative Shielding
			[226] = 10, -- Test of Might
			[480] = 5, -- Blood Rite
			[478] = 5.5, -- Tidal Surge
			[174] = 4.95, -- Gathering Storm
			[89] = 0.11, -- Azerite Veins
			[20] = 2.33, -- Lifespeed
			[561] = 4.22, -- Seductive Power
			[85] = 0.21, -- Gemhide
			[492] = 5.45, -- Liberator's Might
			[98] = 0.11, -- Crystalline Carapace
			[44] = 0.14, -- Vampiric Speed
			[526] = 8.82, -- Endless Hunger
			[462] = 1.79, -- Azerite Globules
			[156] = 3.38, -- Ruinous Bolt
			[575] = 9.2, -- Undulating Tides
			[521] = 5.05, -- Shadow of Elune
			[21] = 2.89, -- Elemental Whirl
			[483] = 5.17, -- Archive of the Titans
			[192] = 5.89, -- Meticulous Scheming
			[13] = 0.03, -- Azerite Empowered
			[435] = 4.54, -- Lord of War
			[100] = 0.16, -- Strength in Numbers
			[505] = 5.75, -- Tradewinds
			[523] = 4.4, -- Apothecary's Concoctions
			[82] = 8.26, -- Champion of Azeroth
			[495] = 4.62, -- Anduin's Dedication
			[482] = 5.02, -- Thunderous Blast
			[42] = 0.04, -- Savior
			[193] = 9.8, -- Blightborne Infusion
			[500] = 3.13, -- Synaptic Spark Capacitor
			[83] = 0.14, -- Impassive Visage
			[577] = 2.71, -- Arcane Heart
			[504] = 5.43, -- Unstable Catalyst
			[497] = 1.26, -- Stand As One
			[498] = 4.02, -- Barrage Of Many Bombs
			[433] = 4.01, -- Seismic Wave
			[476] = 0.2, -- Moment of Glory
			[569] = 6.65, -- Clockwork Heart
			[485] = 5.32, -- Laser Matrix
			[30] = 4.84, -- Overwhelming Power
			[562] = 7.23, -- Treacherous Covenant
			[461] = 1.76, -- Earthlink
			[31] = 3.04, -- Gutripper
			[560] = 2.56, -- Bonded Souls
			[501] = 5.88, -- Relational Normalization Gizmo
			[493] = 3.18, -- Last Gift
			[496] = 1.88, -- Stronger Together
			[43] = 0.19, -- Winds of War
			[195] = 4.82, -- Secrets of the Deep
			[86] = 0.21, -- Azerite Fortification
			[121] = 5.8, -- Striking the Anvil
			[38] = 2.5, -- On My Way
			[434] = 8.49, -- Crushing Assault
			[494] = 6.02, -- Battlefield Precision
			[103] = 0.15, -- Concentrated Mending
			[541] = 1.94, -- Fight or Flight
			[522] = 8.8, -- Ancients' Bulwark
			[22] = 2.7, -- Heed My Call
			[481] = 5.47, -- Incite the Pack
			[576] = 4.1, -- Loyal to the End
			[196] = 8.58, -- Swirling Sands
			[14] = 0.17, -- Longstrider
			[477] = 0.19, -- Bury the Hatchet
			[84] = 0.07, -- Bulwark of the Masses
			[502] = 0.17, -- Personal Absorb-o-Tron
			[15] = 0.11, -- Resounding Protection
			[19] = 0.2, -- Woundbinder
			[194] = 4.91, -- Filthy Transfusion
			[18] = 2.35, -- Blood Siphon
			[105] = 0.13, -- Ephemeral Recovery
			[479] = 5.71, -- Dagger in the Back
			[499] = 2.27, -- Ricocheting Inflatable Pyrosaw
			[554] = 0.05, -- Intimidating Presence
			[157] = 5.8, -- Rezan's Fury
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 17030 - 18547 (avg 17875), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 8.91, 3.27 }, -- Condensed Life-Force
			[6] = { 6.32, 2.89 }, -- Purification Protocol
			[12] = { 8.86, 3.18 }, -- The Crucible of Flame
			[22] = { 0.09, 0.07 }, -- Vision of Perfection
			[32] = { 2.68, 2.85 }, -- Conflict and Strife
			[28] = { 4.65, 2.56 }, -- The Unbound Force
			[4] = { 1.74, 1.24 }, -- Worldvein Resonance
			[27] = { 9.88, 4.53 }, -- Memory of Lucid Dreams
			[23] = { 5.99, 1.05 }, -- Blood of the Enemy
			[15] = { 4.09, 0.06 }, -- Ripple in Space
			[5] = { 10, 4.11 }, -- Essence of the Focusing Iris
		}, 1564736400)

		insertDefaultScalesData(defaultName, 1, 2, { -- Fury Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 19013 - 21744 (avg 19835), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[481] = 4.76, -- Incite the Pack
			[38] = 2.03, -- On My Way
			[461] = 1.03, -- Earthlink
			[119] = 7.47, -- Unbridled Ferocity
			[479] = 5.13, -- Dagger in the Back
			[437] = 6.06, -- Simmering Rage
			[451] = 4.27, -- Infinite Fury
			[485] = 5.54, -- Laser Matrix
			[477] = 0.01, -- Bury the Hatchet
			[569] = 6.7, -- Clockwork Heart
			[157] = 5.98, -- Rezan's Fury
			[561] = 3.46, -- Seductive Power
			[497] = 0.84, -- Stand As One
			[541] = 1.25, -- Fight or Flight
			[156] = 2.95, -- Ruinous Bolt
			[483] = 3.99, -- Archive of the Titans
			[480] = 5.06, -- Blood Rite
			[22] = 2.63, -- Heed My Call
			[462] = 1.86, -- Azerite Globules
			[577] = 2.35, -- Arcane Heart
			[575] = 10, -- Undulating Tides
			[30] = 5.64, -- Overwhelming Power
			[438] = 6.22, -- Reckless Flurry
			[31] = 3.02, -- Gutripper
			[196] = 6.48, -- Swirling Sands
			[478] = 5.04, -- Tidal Surge
			[523] = 4.04, -- Apothecary's Concoctions
			[576] = 3.32, -- Loyal to the End
			[493] = 2.7, -- Last Gift
			[21] = 2.63, -- Elemental Whirl
			[498] = 3.98, -- Barrage Of Many Bombs
			[194] = 4.9, -- Filthy Transfusion
			[521] = 5.09, -- Shadow of Elune
			[492] = 5.07, -- Liberator's Might
			[500] = 2.59, -- Synaptic Spark Capacitor
			[526] = 7.53, -- Endless Hunger
			[482] = 5.05, -- Thunderous Blast
			[562] = 5.56, -- Treacherous Covenant
			[176] = 8.89, -- Cold Steel, Hot Blood
			[229] = 4.46, -- Pulverizing Blows
			[522] = 7.59, -- Ancients' Bulwark
			[505] = 5.21, -- Tradewinds
			[494] = 6.17, -- Battlefield Precision
			[499] = 2.24, -- Ricocheting Inflatable Pyrosaw
			[193] = 7.45, -- Blightborne Infusion
			[192] = 6.55, -- Meticulous Scheming
			[18] = 1.84, -- Blood Siphon
			[504] = 4.01, -- Unstable Catalyst
			[496] = 1.39, -- Stronger Together
			[195] = 3.67, -- Secrets of the Deep
			[501] = 5.39, -- Relational Normalization Gizmo
			[20] = 3.52, -- Lifespeed
			[82] = 8.69, -- Champion of Azeroth
			[15] = 0.02, -- Resounding Protection
			[495] = 3.42, -- Anduin's Dedication
			[459] = 2.44, -- Unstable Flames
			[560] = 3.37, -- Bonded Souls
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 18402 - 21233 (avg 19500), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 8.33, 3.05 }, -- Memory of Lucid Dreams
			[23] = { 4.69, 1.8 }, -- Blood of the Enemy
			[12] = { 6.91, 3.88 }, -- The Crucible of Flame
			[15] = { 2.22, 0 }, -- Ripple in Space
			[32] = { 2.62, 2.55 }, -- Conflict and Strife
			[4] = { 0, 1.01 }, -- Worldvein Resonance
			[22] = { 2.51, 0.57 }, -- Vision of Perfection
			[5] = { 10, 5.44 }, -- Essence of the Focusing Iris
			[6] = { 5.73, 3.3 }, -- Purification Protocol
			[28] = { 2.83, 1.64 }, -- The Unbound Force
			[14] = { 9.82, 3.85 }, -- Condensed Life-Force
		}, 1564736400)

		insertDefaultScalesData(offensiveName, 1, 3, { -- Protection Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 15893 - 20133 (avg 17239), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[177] = 0.04, -- Bloodsport
			[98] = 0.16, -- Crystalline Carapace
			[194] = 5.36, -- Filthy Transfusion
			[31] = 3.1, -- Gutripper
			[100] = 0.08, -- Strength in Numbers
			[560] = 1.83, -- Bonded Souls
			[501] = 4.39, -- Relational Normalization Gizmo
			[195] = 3.7, -- Secrets of the Deep
			[19] = 0.04, -- Woundbinder
			[492] = 3.8, -- Liberator's Might
			[157] = 6.4, -- Rezan's Fury
			[526] = 6.06, -- Endless Hunger
			[44] = 0.09, -- Vampiric Speed
			[497] = 0.97, -- Stand As One
			[477] = 0.02, -- Bury the Hatchet
			[461] = 1.29, -- Earthlink
			[495] = 3.71, -- Anduin's Dedication
			[13] = 0.03, -- Azerite Empowered
			[14] = 0.02, -- Longstrider
			[502] = 0.05, -- Personal Absorb-o-Tron
			[505] = 3.63, -- Tradewinds
			[15] = 0.07, -- Resounding Protection
			[440] = 1.4, -- Callous Reprisal
			[21] = 2.03, -- Elemental Whirl
			[237] = 4.83, -- Bastion of Might
			[576] = 2.51, -- Loyal to the End
			[156] = 3.37, -- Ruinous Bolt
			[38] = 1.89, -- On My Way
			[18] = 1.33, -- Blood Siphon
			[43] = 0.07, -- Winds of War
			[523] = 4.5, -- Apothecary's Concoctions
			[82] = 5.58, -- Champion of Azeroth
			[89] = 0.05, -- Azerite Veins
			[496] = 1.31, -- Stronger Together
			[494] = 6.12, -- Battlefield Precision
			[485] = 5.64, -- Laser Matrix
			[30] = 3.51, -- Overwhelming Power
			[481] = 3.52, -- Incite the Pack
			[499] = 2.44, -- Ricocheting Inflatable Pyrosaw
			[99] = 0.06, -- Ablative Shielding
			[522] = 6.1, -- Ancients' Bulwark
			[575] = 10, -- Undulating Tides
			[105] = 0.04, -- Ephemeral Recovery
			[480] = 3.51, -- Blood Rite
			[459] = 2.38, -- Unstable Flames
			[192] = 4.49, -- Meticulous Scheming
			[479] = 4.12, -- Dagger in the Back
			[493] = 1.97, -- Last Gift
			[462] = 1.84, -- Azerite Globules
			[42] = 0.12, -- Savior
			[498] = 4.29, -- Barrage Of Many Bombs
			[541] = 1.37, -- Fight or Flight
			[101] = 0.06, -- Shimmering Haven
			[569] = 4.8, -- Clockwork Heart
			[193] = 6.68, -- Blightborne Infusion
			[85] = 0.03, -- Gemhide
			[561] = 3.32, -- Seductive Power
			[562] = 5.57, -- Treacherous Covenant
			[478] = 5.65, -- Tidal Surge
			[482] = 5.24, -- Thunderous Blast
			[84] = 0.02, -- Bulwark of the Masses
			[22] = 2.74, -- Heed My Call
			[503] = 0.11, -- Auto-Self-Cauterizer
			[441] = 2.46, -- Iron Fortress
			[20] = 1.74, -- Lifespeed
			[568] = 0.04, -- Person-Computer Interface
			[87] = 0.1, -- Self Reliance
			[103] = 0.06, -- Concentrated Mending
			[577] = 1.54, -- Arcane Heart
			[450] = 4.45, -- Brace for Impact
			[521] = 3.45, -- Shadow of Elune
			[83] = 0.13, -- Impassive Visage
			[196] = 6.18, -- Swirling Sands
			[500] = 3.07, -- Synaptic Spark Capacitor
			[504] = 4.09, -- Unstable Catalyst
			[483] = 4.14, -- Archive of the Titans
			[118] = 1.9, -- Deafening Crash
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 15731 - 17536 (avg 16945), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 02.08.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 1.26, 1.18 }, -- Aegis of the Deep
			[4] = { 1.27, 1.27 }, -- Worldvein Resonance
			[7] = { 3.29, 0.02 }, -- Anima of Life and Death
			[13] = { 0.08, 0.1 }, -- Nullification Dynamo
			[15] = { 4.52, 0.04 }, -- Ripple in Space
			[22] = { 5.71, 3.46 }, -- Vision of Perfection
			[32] = { 2.54, 2.59 }, -- Conflict and Strife
			[3] = { 5.08, 5.05 }, -- Sphere of Suppression
			[12] = { 10, 4.8 }, -- The Crucible of Flame
			[27] = { 1.42, 0.63 }, -- Memory of Lucid Dreams
			[2] = { 0.04, 0.13 }, -- Azeroth's Undying Gift
		}, 1564736400)

		insertDefaultScalesData(defensiveName, 12, 2, { -- Vengeance Demon Hunter (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5073 - 8312 (avg 5585), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[504] = 2.83, -- Unstable Catalyst
			[497] = 0.73, -- Stand As One
			[21] = 0.77, -- Elemental Whirl
			[43] = 0.07, -- Winds of War
			[461] = 0.77, -- Earthlink
			[501] = 2.78, -- Relational Normalization Gizmo
			[134] = 0.01, -- Revel in Pain
			[492] = 1.84, -- Liberator's Might
			[105] = 0.03, -- Ephemeral Recovery
			[83] = 0.07, -- Impassive Visage
			[495] = 2.27, -- Anduin's Dedication
			[192] = 4.4, -- Meticulous Scheming
			[561] = 3.24, -- Seductive Power
			[466] = 0.08, -- Burning Soul
			[564] = 0.07, -- Thrive in Chaos
			[195] = 2.39, -- Secrets of the Deep
			[562] = 3.75, -- Treacherous Covenant
			[493] = 1, -- Last Gift
			[100] = 0.08, -- Strength in Numbers
			[463] = 0.09, -- Blessed Portents
			[14] = 0.02, -- Longstrider
			[499] = 0.02, -- Ricocheting Inflatable Pyrosaw
			[87] = 0.12, -- Self Reliance
			[30] = 1.83, -- Overwhelming Power
			[82] = 3.07, -- Champion of Azeroth
			[569] = 1.29, -- Clockwork Heart
			[526] = 4.15, -- Endless Hunger
			[483] = 2.93, -- Archive of the Titans
			[541] = 0.85, -- Fight or Flight
			[481] = 2, -- Incite the Pack
			[193] = 4.67, -- Blightborne Infusion
			[20] = 0.09, -- Lifespeed
			[38] = 1.18, -- On My Way
			[568] = 0.02, -- Person-Computer Interface
			[482] = 0.04, -- Thunderous Blast
			[480] = 2.39, -- Blood Rite
			[19] = 0.07, -- Woundbinder
			[459] = 1.91, -- Unstable Flames
			[576] = 1.32, -- Loyal to the End
			[522] = 4.07, -- Ancients' Bulwark
			[496] = 0.53, -- Stronger Together
			[521] = 2.46, -- Shadow of Elune
			[196] = 4.59, -- Swirling Sands
			[505] = 2.05, -- Tradewinds
			[494] = 0.03, -- Battlefield Precision
			[560] = 0.16, -- Bonded Souls
			[18] = 3.55, -- Blood Siphon
			[354] = 0.01, -- Cycle of Binding
			[15] = 10, -- Resounding Protection
			[84] = 0.02, -- Bulwark of the Masses
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 5011 - 5621 (avg 5271), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 1.36, 1.27 }, -- Worldvein Resonance
			[32] = { 2.31, 2.42 }, -- Conflict and Strife
			[15] = { 0.19, 0.01 }, -- Ripple in Space
			[27] = { 7.79, 7.76 }, -- Memory of Lucid Dreams
			[25] = { 0.96, 1.01 }, -- Aegis of the Deep
			[12] = { 0, 0.1 }, -- The Crucible of Flame
			[22] = { 10, 2.54 }, -- Vision of Perfection
			[3] = { 7.26, 7.19 }, -- Sphere of Suppression
			[7] = { 4.52, 4.5 }, -- Anima of Life and Death
		}, 1564822800)

		insertDefaultScalesData(defensiveName, 6, 1, { -- Blood Death Knight (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 7098 - 10128 (avg 7675), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[560] = 2.25, -- Bonded Souls
			[243] = 9.7, -- Bloody Runeblade
			[481] = 5.85, -- Incite the Pack
			[196] = 3.81, -- Swirling Sands
			[193] = 4.12, -- Blightborne Infusion
			[461] = 0.72, -- Earthlink
			[496] = 1.05, -- Stronger Together
			[43] = 0.11, -- Winds of War
			[349] = 4.81, -- Bones of the Damned
			[197] = 7.06, -- Marrowblood
			[495] = 1.99, -- Anduin's Dedication
			[82] = 6.03, -- Champion of Azeroth
			[15] = 10, -- Resounding Protection
			[348] = 4.02, -- Eternal Rune Weapon
			[18] = 5.65, -- Blood Siphon
			[526] = 3.6, -- Endless Hunger
			[577] = 0.92, -- Arcane Heart
			[561] = 4.22, -- Seductive Power
			[30] = 3.86, -- Overwhelming Power
			[192] = 5.2, -- Meticulous Scheming
			[505] = 6.41, -- Tradewinds
			[501] = 4.85, -- Relational Normalization Gizmo
			[493] = 3.5, -- Last Gift
			[521] = 4.16, -- Shadow of Elune
			[497] = 0.9, -- Stand As One
			[459] = 1.6, -- Unstable Flames
			[195] = 2.38, -- Secrets of the Deep
			[201] = 0.04, -- Runic Barrier
			[106] = 3.85, -- Deep Cuts
			[492] = 3.38, -- Liberator's Might
			[21] = 1.77, -- Elemental Whirl
			[480] = 3.98, -- Blood Rite
			[140] = 2.69, -- Bone Spike Graveyard
			[485] = 0.06, -- Laser Matrix
			[44] = 0.07, -- Vampiric Speed
			[498] = 0.08, -- Barrage Of Many Bombs
			[19] = 0.06, -- Woundbinder
			[504] = 2.8, -- Unstable Catalyst
			[20] = 2.2, -- Lifespeed
			[541] = 0.91, -- Fight or Flight
			[562] = 3.78, -- Treacherous Covenant
			[479] = 0.01, -- Dagger in the Back
			[569] = 4.52, -- Clockwork Heart
			[522] = 3.34, -- Ancients' Bulwark
			[38] = 0.81, -- On My Way
			[22] = 0.05, -- Heed My Call
			[576] = 4.35, -- Loyal to the End
			[483] = 3.04, -- Archive of the Titans
			[104] = 0.13, -- Bracing Chill
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6865 - 7777 (avg 7389), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 0.71, 0.87 }, -- Conflict and Strife
			[3] = { 3.15, 3.26 }, -- Sphere of Suppression
			[7] = { 3.8, 3.69 }, -- Anima of Life and Death
			[4] = { 0.69, 0.48 }, -- Worldvein Resonance
			[25] = { 0.36, 0.21 }, -- Aegis of the Deep
			[2] = { 0, 0.03 }, -- Azeroth's Undying Gift
			[22] = { 0.97, 0 }, -- Vision of Perfection
			[15] = { 0.56, 0 }, -- Ripple in Space
			[27] = { 10, 5.63 }, -- Memory of Lucid Dreams
		}, 1564822800)

		insertDefaultScalesData(defensiveName, 11, 3, { -- Guardian Druid (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 4302 - 6592 (avg 4739), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[87] = 0.06, -- Self Reliance
			[499] = 0.01, -- Ricocheting Inflatable Pyrosaw
			[83] = 0.05, -- Impassive Visage
			[19] = 0.01, -- Woundbinder
			[496] = 0.19, -- Stronger Together
			[504] = 0.71, -- Unstable Catalyst
			[483] = 0.65, -- Archive of the Titans
			[505] = 1.47, -- Tradewinds
			[459] = 0.74, -- Unstable Flames
			[193] = 1.9, -- Blightborne Infusion
			[576] = 1, -- Loyal to the End
			[43] = 0.03, -- Winds of War
			[540] = 0.07, -- Switch Hitter
			[461] = 0.19, -- Earthlink
			[493] = 0.73, -- Last Gift
			[497] = 0.55, -- Stand As One
			[568] = 0.09, -- Person-Computer Interface
			[15] = 10, -- Resounding Protection
			[86] = 0.05, -- Azerite Fortification
			[481] = 1.34, -- Incite the Pack
			[495] = 0.6, -- Anduin's Dedication
			[562] = 0.98, -- Treacherous Covenant
			[194] = 0.02, -- Filthy Transfusion
			[560] = 0.02, -- Bonded Souls
			[98] = 0.05, -- Crystalline Carapace
			[84] = 0.01, -- Bulwark of the Masses
			[251] = 1.49, -- Burst of Savagery
			[482] = 0.03, -- Thunderous Blast
			[359] = 0.05, -- Wild Fleshrending
			[195] = 0.55, -- Secrets of the Deep
			[100] = 0.08, -- Strength in Numbers
			[14] = 0.01, -- Longstrider
			[492] = 0.77, -- Liberator's Might
			[561] = 2.29, -- Seductive Power
			[241] = 0.75, -- Twisted Claws
			[502] = 0.02, -- Personal Absorb-o-Tron
			[21] = 0.48, -- Elemental Whirl
			[42] = 0.09, -- Savior
			[501] = 0.87, -- Relational Normalization Gizmo
			[112] = 0.06, -- Layered Mane
			[526] = 1.86, -- Endless Hunger
			[522] = 1.82, -- Ancients' Bulwark
			[82] = 1.47, -- Champion of Azeroth
			[20] = 0.1, -- Lifespeed
			[18] = 4.49, -- Blood Siphon
			[196] = 1.92, -- Swirling Sands
			[569] = 1.06, -- Clockwork Heart
			[541] = 0.23, -- Fight or Flight
			[38] = 0.54, -- On My Way
			[101] = 0.12, -- Shimmering Haven
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 3893 - 5366 (avg 4534), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 0.62, 0 }, -- Ripple in Space
			[7] = { 9.97, 10 }, -- Anima of Life and Death
			[25] = { 0.4, 0.49 }, -- Aegis of the Deep
			[32] = { 1.08, 1.37 }, -- Conflict and Strife
			[2] = { 0, 0.08 }, -- Azeroth's Undying Gift
			[3] = { 0.1, 0 }, -- Sphere of Suppression
			[13] = { 0.11, 0 }, -- Nullification Dynamo
			[4] = { 0.55, 0.44 }, -- Worldvein Resonance
			[12] = { 0.05, 0.07 }, -- The Crucible of Flame
			[27] = { 0, 0.09 }, -- Memory of Lucid Dreams
		}, 1564822800)

		insertDefaultScalesData(defensiveName, 10, 1, { -- Brewmaster Monk (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6358 - 10086 (avg 6923), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[522] = 0.59, -- Ancients' Bulwark
			[496] = 0.1, -- Stronger Together
			[526] = 0.6, -- Endless Hunger
			[577] = 0.08, -- Arcane Heart
			[541] = 0.11, -- Fight or Flight
			[504] = 0.28, -- Unstable Catalyst
			[569] = 0.43, -- Clockwork Heart
			[98] = 0.01, -- Crystalline Carapace
			[82] = 0.65, -- Champion of Azeroth
			[193] = 0.26, -- Blightborne Infusion
			[22] = 0.01, -- Heed My Call
			[481] = 0.77, -- Incite the Pack
			[196] = 0.23, -- Swirling Sands
			[561] = 0.51, -- Seductive Power
			[566] = 0.01, -- Exit Strategy
			[21] = 0.22, -- Elemental Whirl
			[15] = 3.35, -- Resounding Protection
			[18] = 1.22, -- Blood Siphon
			[459] = 0.09, -- Unstable Flames
			[505] = 0.78, -- Tradewinds
			[470] = 0.01, -- Sweep the Leg
			[20] = 0.17, -- Lifespeed
			[560] = 0.12, -- Bonded Souls
			[497] = 0.12, -- Stand As One
			[382] = 0.01, -- Straight, No Chaser
			[492] = 0.21, -- Liberator's Might
			[483] = 0.3, -- Archive of the Titans
			[501] = 0.31, -- Relational Normalization Gizmo
			[383] = 0.52, -- Training of Niuzao
			[461] = 0.08, -- Earthlink
			[30] = 0.11, -- Overwhelming Power
			[156] = 0.02, -- Ruinous Bolt
			[116] = 4.06, -- Boiling Brew
			[84] = 0.02, -- Bulwark of the Masses
			[85] = 0.01, -- Gemhide
			[500] = 0.02, -- Synaptic Spark Capacitor
			[576] = 0.66, -- Loyal to the End
			[495] = 0.23, -- Anduin's Dedication
			[493] = 0.5, -- Last Gift
			[384] = 0.41, -- Elusive Footwork
			[195] = 0.26, -- Secrets of the Deep
			[562] = 0.38, -- Treacherous Covenant
			[38] = 0.16, -- On My Way
			[194] = 0.01, -- Filthy Transfusion
			[523] = 0.01, -- Apothecary's Concoctions
			[186] = 10, -- Staggering Strikes
			[521] = 0.11, -- Shadow of Elune
			[480] = 0.1, -- Blood Rite
			[192] = 0.13, -- Meticulous Scheming
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 6475 - 7855 (avg 6712), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 2.12, 2.27 }, -- Conflict and Strife
			[25] = { 0.95, 1.05 }, -- Aegis of the Deep
			[22] = { 0.12, 0.08 }, -- Vision of Perfection
			[15] = { 0.12, 0.02 }, -- Ripple in Space
			[27] = { 0.16, 0.12 }, -- Memory of Lucid Dreams
			[4] = { 0.71, 0.98 }, -- Worldvein Resonance
			[12] = { 0, 0.02 }, -- The Crucible of Flame
			[3] = { 1.28, 1.23 }, -- Sphere of Suppression
			[7] = { 9.93, 10 }, -- Anima of Life and Death
			[13] = { 0, 0.08 }, -- Nullification Dynamo
		}, 1564822800)

		insertDefaultScalesData(defensiveName, 2, 2, { -- Protection Paladin (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 14480 - 17958 (avg 15329), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[496] = 0.2, -- Stronger Together
			[150] = 0.44, -- Soaring Shield
			[192] = 0.61, -- Meticulous Scheming
			[395] = 0.68, -- Inspiring Vanguard
			[560] = 0.18, -- Bonded Souls
			[481] = 1.02, -- Incite the Pack
			[504] = 0.36, -- Unstable Catalyst
			[196] = 0.97, -- Swirling Sands
			[234] = 0.22, -- Inner Light
			[480] = 0.48, -- Blood Rite
			[521] = 0.51, -- Shadow of Elune
			[82] = 1.1, -- Champion of Azeroth
			[461] = 0.08, -- Earthlink
			[495] = 0.28, -- Anduin's Dedication
			[497] = 0.19, -- Stand As One
			[522] = 0.84, -- Ancients' Bulwark
			[562] = 0.46, -- Treacherous Covenant
			[459] = 0.42, -- Unstable Flames
			[30] = 0.4, -- Overwhelming Power
			[501] = 0.81, -- Relational Normalization Gizmo
			[526] = 0.8, -- Endless Hunger
			[15] = 10, -- Resounding Protection
			[38] = 0.22, -- On My Way
			[505] = 1.1, -- Tradewinds
			[541] = 0.1, -- Fight or Flight
			[577] = 0.24, -- Arcane Heart
			[569] = 0.86, -- Clockwork Heart
			[499] = 0.03, -- Ricocheting Inflatable Pyrosaw
			[18] = 4.26, -- Blood Siphon
			[492] = 0.59, -- Liberator's Might
			[20] = 0.26, -- Lifespeed
			[576] = 0.73, -- Loyal to the End
			[561] = 1.08, -- Seductive Power
			[493] = 0.62, -- Last Gift
			[195] = 0.27, -- Secrets of the Deep
			[193] = 1.07, -- Blightborne Infusion
			[483] = 0.34, -- Archive of the Titans
			[125] = 0.31, -- Avenger's Might
			[21] = 0.32, -- Elemental Whirl
			[85] = 0.01, -- Gemhide
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 14276 - 15975 (avg 15131), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 0.55, 0.39 }, -- Vision of Perfection
			[7] = { 9.84, 10 }, -- Anima of Life and Death
			[4] = { 0.39, 0.39 }, -- Worldvein Resonance
			[32] = { 1.3, 1.21 }, -- Conflict and Strife
			[15] = { 0, 0.01 }, -- Ripple in Space
			[25] = { 0.5, 0.55 }, -- Aegis of the Deep
			[27] = { 3.28, 3.28 }, -- Memory of Lucid Dreams
			[3] = { 2.52, 2.57 }, -- Sphere of Suppression
		}, 1564822800)

		insertDefaultScalesData(defensiveName, 1, 3, { -- Protection Warrior (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16202 - 20050 (avg 17251), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[440] = 10, -- Callous Reprisal
			[87] = 0.01, -- Self Reliance
			[492] = 0.14, -- Liberator's Might
			[477] = 0.01, -- Bury the Hatchet
			[193] = 0.24, -- Blightborne Infusion
			[86] = 0.01, -- Azerite Fortification
			[44] = 0.01, -- Vampiric Speed
			[459] = 0.11, -- Unstable Flames
			[497] = 0.05, -- Stand As One
			[15] = 3.15, -- Resounding Protection
			[523] = 0.01, -- Apothecary's Concoctions
			[19] = 0.01, -- Woundbinder
			[568] = 0.01, -- Person-Computer Interface
			[20] = 0.03, -- Lifespeed
			[576] = 0.12, -- Loyal to the End
			[541] = 0.05, -- Fight or Flight
			[84] = 0.01, -- Bulwark of the Masses
			[485] = 0.01, -- Laser Matrix
			[482] = 0.01, -- Thunderous Blast
			[480] = 0.05, -- Blood Rite
			[31] = 0.01, -- Gutripper
			[101] = 0.01, -- Shimmering Haven
			[38] = 0.06, -- On My Way
			[192] = 0.04, -- Meticulous Scheming
			[526] = 0.16, -- Endless Hunger
			[450] = 0.21, -- Brace for Impact
			[495] = 0.11, -- Anduin's Dedication
			[156] = 0.01, -- Ruinous Bolt
			[196] = 0.23, -- Swirling Sands
			[157] = 0.01, -- Rezan's Fury
			[22] = 0.01, -- Heed My Call
			[504] = 0.13, -- Unstable Catalyst
			[30] = 0.05, -- Overwhelming Power
			[195] = 0.13, -- Secrets of the Deep
			[89] = 0.01, -- Azerite Veins
			[560] = 0.04, -- Bonded Souls
			[496] = 0.03, -- Stronger Together
			[483] = 0.13, -- Archive of the Titans
			[18] = 1.32, -- Blood Siphon
			[561] = 0.25, -- Seductive Power
			[118] = 0.01, -- Deafening Crash
			[554] = 0.01, -- Intimidating Presence
			[500] = 0.02, -- Synaptic Spark Capacitor
			[569] = 0.12, -- Clockwork Heart
			[522] = 0.14, -- Ancients' Bulwark
			[463] = 0.01, -- Blessed Portents
			[99] = 0.01, -- Ablative Shielding
			[562] = 0.17, -- Treacherous Covenant
			[493] = 0.1, -- Last Gift
			[575] = 0.01, -- Undulating Tides
			[13] = 0.02, -- Azerite Empowered
			[503] = 0.01, -- Auto-Self-Cauterizer
			[82] = 0.17, -- Champion of Azeroth
			[577] = 0.05, -- Arcane Heart
			[501] = 0.13, -- Relational Normalization Gizmo
			[100] = 0.01, -- Strength in Numbers
			[21] = 0.06, -- Elemental Whirl
			[521] = 0.04, -- Shadow of Elune
			[441] = 0.1, -- Iron Fortress
			[177] = 1.39, -- Bloodsport
			[505] = 0.16, -- Tradewinds
			[237] = 0.54, -- Bastion of Might
			[481] = 0.16, -- Incite the Pack
			[461] = 0.05, -- Earthlink
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 30918)
			-- Iterations: 16011 - 17624 (avg 16938), Target Error: 0.05, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 03.08.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 1, 0.11 }, -- The Crucible of Flame
			[22] = { 6.61, 4.55 }, -- Vision of Perfection
			[3] = { 0.89, 0.82 }, -- Sphere of Suppression
			[2] = { 0.06, 0.2 }, -- Azeroth's Undying Gift
			[27] = { 10, 4.72 }, -- Memory of Lucid Dreams
			[32] = { 0.95, 0.96 }, -- Conflict and Strife
			[25] = { 0.51, 0.57 }, -- Aegis of the Deep
			[7] = { 0, 6.09 }, -- Anima of Life and Death
			[13] = { 0.12, 0 }, -- Nullification Dynamo
			[4] = { 0.36, 0.55 }, -- Worldvein Resonance
			[15] = { 0.51, 0.09 }, -- Ripple in Space
		}, 1564822800)

		insertDefaultScalesData(defaultName, 5, 3, { -- Shadow Priest
			-- Shadow Priest by WarcraftPriests (https://warcraftpriests.com/)
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_AS.md
			-- First Imported: 03.09.2018, Updated: 03.08.2019
			[405] = 5.94,
			[575] = 5.25,
			[193] = 4.33,
			[236] = 4.31,
			[82] = 3.95,
			[522] = 3.94,
			[526] = 3.92,
			[196] = 3.9,
			[562] = 3.56,
			[479] = 3.4,
			[488] = 3.34,
			[192] = 3.27,
			[157] = 3.18,
			[501] = 3.13,
			[569] = 3.13,
			[403] = 2.9,
			[30] = 2.85,
			[505] = 2.74,
			[482] = 2.74,
			[523] = 2.7,
			[194] = 2.67,
			[504] = 2.67,
			[486] = 2.6,
			[478] = 2.58,
			[521] = 2.56,
			[480] = 2.56,
			[481] = 2.53,
			[404] = 2.48,
			[195] = 2.38,
			[489] = 2.31,
			[561] = 2.3,
			[498] = 2.12,
			[577] = 1.86,
			[31] = 1.6,
			[560] = 1.59,
			[156] = 1.54,
			[459] = 1.52,
			[22] = 1.48,
			[487] = 1.45,
			[21] = 1.36,
			[500] = 1.35,
			[499] = 1.28,
			[38] = 1.12,
			[491] = 1.03,
			[166] = 1.02,
			[18] = 1,
			[462] = 0.97,
			[541] = 0.9,
			[490] = 0.86,
			[461] = 0.8,
			[13] = 0.31,
		}, {
		}, 1564822800)


		insertDefaultScalesData(offensiveName, 5, 1, { -- Discipline Priest

		}, {})

		insertDefaultScalesData(defaultName, 5, 1, { -- Discipline Priest

		}, {})

		insertDefaultScalesData(defaultName, 5, 2, { -- Holy Priest

		}, {})

		insertDefaultScalesData(defaultName, 7, 3, { -- Restoration Shaman

		}, {})

		insertDefaultScalesData(defaultName, 10, 2, { -- Mistweaver Monk

		}, {})

		insertDefaultScalesData(defaultName, 11, 4, { -- Restoration Druid

		}, {})

		insertDefaultScalesData(defaultName, 2, 1, { -- Holy Paladin

		}, {})

end

local tankSpecs = {
	[1] = 3, -- Protection Warrior
	[2] = 2, -- Protection Paladin
	[6] = 1, -- Blood Death Knight
	[10] = 1, -- Brewmaster Monk
	[11] = 3, -- Guardian Druid
	[12] = 2 -- Vengeance Demon Hunter
}

-- Default ScaleSets for Class and Spec Combinations
local function GetDefaultScaleSet(classID, specNum)
	if (classID) and (specNum) then
		if tankSpecs[classID] == specNum then -- Tank Case
			return "D/"..classID.."/"..specNum.."/"..defensiveName
		else -- Generic Case
			return "D/"..classID.."/"..specNum.."/"..defaultName
		end
	end
end

AzeritePowerWeights.GetDefaultScaleSet = GetDefaultScaleSet

--#EOF


--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
----------------------------------------------------------------------------]]--
local AceGUI = LibStub("AceGUI-3.0")

-- Scale Viewer/Editor Frame
local function CreateUI(...)
	-- Main Frame
	local frame = AceGUI:Create("Frame")
	frame:SetLayout("Fill")
	frame:SetTitle(format(U["ScaleWeightEditor_Title"], "AzeritePowerWeights"))
	frame:SetStatusText("")
	--frame:SetWidth(474)
	frame:SetWidth(540)
	frame:SetHeight(484)
	frame.frame:SetMinResize(474, 484)
	frame:Hide()

	-- Scales List
	local treeGroup = AceGUI:Create("TreeGroup")
	treeGroup:SetFullWidth(true)
	treeGroup:SetFullHeight(true)
	treeGroup:SetLayout("Fill")

	frame:AddChild(treeGroup)
	AzeritePowerWeights.treeGroup = treeGroup

	-- Content Area
	local scalesScroll = AceGUI:Create("ScrollFrame")
	scalesScroll:SetLayout("Flow")

	treeGroup:AddChild(scalesScroll)
	AzeritePowerWeights.scalesScroll = scalesScroll

	return frame
end

AzeritePowerWeights.CreateUI = CreateUI


-- PopUp Frame
local popupOpenAlready = false
local function CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	local function _closePopUp(widget)
		widget.frame:GetParent().obj:Hide()
	end

	if popupOpenAlready then -- Check if we have popup open already...
		--print("AzeritePowerWeights", "POPUP JAMMERED!")
		return
	end

	local height = 100
	local frame = AceGUI:Create("Window")
	frame:SetTitle(titleText)
	frame:SetWidth(350)
	frame:SetHeight(height)
	frame:EnableResize(false)
	frame:SetLayout("Flow")
	frame:SetCallback("OnClose", function(widget)
		--print("RELEASED!")
		AceGUI:Release(widget)
		popupOpenAlready = false
	end)

	--frame.frame:SetToplevel()
	frame.frame:Raise()

	local text = AceGUI:Create("Label")
	text:SetFullWidth(true)
	text:SetFontObject(GameFontHighlight)
	text:SetText(descriptionText)
	text:SetJustifyH("CENTER")
	frame:AddChild(text)

	local topLine = AceGUI:Create("Heading")
	topLine:SetFullWidth(true)
	frame:AddChild(topLine)

	local edit, multiEdit
	if mode == "MassImport" then
		multiEdit = AceGUI:Create("MultiLineEditBox")
		multiEdit:SetFullWidth(true)
		multiEdit:DisableButton(true)
		multiEdit:SetText("")
		multiEdit:SetLabel("")
		multiEdit:SetNumLines(4)
		multiEdit:SetFocus()
		multiEdit:SetCallback("OnEnterPressed", callbackFunction or _closePopUp)
		frame:AddChild(multiEdit)
	else
		edit = AceGUI:Create("EditBox")
		edit:SetFullWidth(true)
		edit:DisableButton(true)
		edit:SetText("")
		edit:SetFocus()
		edit:SetCallback("OnEnterPressed", callbackFunction or _closePopUp)
		frame:AddChild(edit)
	end

	local bottomLine = AceGUI:Create("Heading")
	bottomLine:SetFullWidth(true)
	frame:AddChild(bottomLine)

	if mode == "Import" then -- Import
		local accept = AceGUI:Create("Button")
		accept:SetRelativeWidth(.5)
		accept:SetText(_G.ACCEPT)
		accept:SetCallback("OnClick", callbackFunction or _closePopUp)
		frame:AddChild(accept)

		local close = AceGUI:Create("Button")
		close:SetRelativeWidth(.5)
		close:SetText(_G.CANCEL)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		edit:SetCallback("OnTextChanged", function(widget, callback, text)
			edit:SetUserData("importString", text)
			accept:SetUserData("importString", text)
		end)
		-- Make sure we get return even if the text doesn't change
		edit:SetUserData("importString", editboxText)
		accept:SetUserData("importString", editboxText)

	elseif mode == "MassImport" then -- Mass Import
		local accept = AceGUI:Create("Button")
		accept:SetRelativeWidth(.5)
		accept:SetText(_G.ACCEPT)
		accept:SetCallback("OnClick", callbackFunction or _closePopUp)
		frame:AddChild(accept)

		local close = AceGUI:Create("Button")
		close:SetRelativeWidth(.5)
		close:SetText(_G.CANCEL)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		multiEdit:SetCallback("OnTextChanged", function(widget, callback, text)
			multiEdit:SetUserData("importString", text)
			accept:SetUserData("importString", text)
		end)
		-- Make sure we get return even if the text doesn't change
		multiEdit:SetUserData("importString", editboxText)
		accept:SetUserData("importString", editboxText)

	elseif mode == "Create" then -- Create
		local accept = AceGUI:Create("Button")
		accept:SetRelativeWidth(.5)
		accept:SetText(_G.ACCEPT)
		accept:SetCallback("OnClick", callbackFunction or _closePopUp)
		frame:AddChild(accept)

		local close = AceGUI:Create("Button")
		close:SetRelativeWidth(.5)
		close:SetText(_G.CANCEL)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		local classTable, specTable, orderTable = {}, {}, {}
		local classIconsFile = "Interface\\Glues\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES"
		--local classIconsFile = "Interface\\TargetingFrame\\UI-Classes-Circles"
		for i = 1, _G.MAX_CLASSES do
			local classDisplayName, classTag = GetClassInfo(i)
			local c = _G.RAID_CLASS_COLORS[classTag]
			local left, right, top, bottom = unpack(_G.CLASS_ICON_TCOORDS[classTag])
			local classIcon = ("|T%s:18:18:0:0:256:256:%d:%d:%d:%d|t"):format(classIconsFile, left*256, right*256, top*256, bottom*256)
			classTable[i] = ("  %s |c%s%s|r  "):format(classIcon, c.colorStr, classDisplayName)
		end

		local classDropdown = AceGUI:Create("Dropdown")
		classDropdown:SetRelativeWidth(.5)
		classDropdown:SetList(classTable)
		frame:AddChild(classDropdown, edit)

		local specDropdown = AceGUI:Create("Dropdown")
		specDropdown:SetRelativeWidth(.5)
		specDropdown:SetList(specTable)
		frame:AddChild(specDropdown, edit)

		edit:SetCallback("OnTextChanged", function(widget, callback, text)
			classDropdown:SetUserData("nameString", text)
			specDropdown:SetUserData("nameString", text)
			edit:SetUserData("nameString", text)
			accept:SetUserData("nameString", text)
		end)
		classDropdown:SetCallback("OnValueChanged", function(widget, callback, key)
			wipe(specTable)
			wipe(orderTable)
			local value
			for i = 1, GetNumSpecializationsForClassID(key) do
				local specID, name, _, iconID = GetSpecializationInfoForClassID(key, i)
				specTable[specID] = ("  |T%d:18|t %s  "):format(iconID, name)
				orderTable[i] = specID
				if not value then
					value = specID
				end
			end
			specDropdown:SetList(specTable, orderTable)
			specDropdown:SetValue(value)

			classDropdown:SetUserData("classID", key)
			specDropdown:SetUserData("classID", key)
			edit:SetUserData("classID", key)
			accept:SetUserData("classID", key)

			classDropdown:SetUserData("specID", value)
			specDropdown:SetUserData("specID", value)
			edit:SetUserData("specID", value)
			accept:SetUserData("specID", value)
		end)
		specDropdown:SetCallback("OnValueChanged", function(widget, callback, key)
			classDropdown:SetUserData("specID", key)
			specDropdown:SetUserData("specID", key)
			edit:SetUserData("specID", key)
			accept:SetUserData("specID", key)
		end)
		-- Make sure we get return even if the text doesn't change
		classDropdown:SetUserData("nameString", editboxText)
		specDropdown:SetUserData("nameString", editboxText)
		edit:SetUserData("nameString", editboxText)
		accept:SetUserData("nameString", editboxText)
		--classDropdown:SetValue(1) -- Warrior
		--specDropdown:SetValue(71) -- Arms

	elseif mode == "Export" then -- Export
		local close = AceGUI:Create("Button")
		close:SetFullWidth(true)
		close:SetText(_G.CLOSE)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		edit:SetText(editboxText)
		edit:HighlightText()
		edit:SetCallback("OnTextChanged", function(widget, callback, text)
			edit:SetText(editboxText)
			edit:HighlightText()
		end)

	elseif mode == "Rename" then -- Rename
		local accept = AceGUI:Create("Button")
		accept:SetRelativeWidth(.5)
		accept:SetText(_G.ACCEPT)
		accept:SetCallback("OnClick", callbackFunction or _closePopUp)
		frame:AddChild(accept)

		local close = AceGUI:Create("Button")
		close:SetRelativeWidth(.5)
		close:SetText(_G.CANCEL)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		edit:SetText(editboxText)
		edit:HighlightText()
		edit:SetCallback("OnTextChanged", function(widget, callback, text)
			edit:SetUserData("renameString", text)
			accept:SetUserData("renameString", text)
		end)
		-- Make sure we get return even if the text doesn't change
		edit:SetUserData("renameString", editboxText)
		accept:SetUserData("renameString", editboxText)

	elseif mode == "Delete" then -- Delete
		local accept = AceGUI:Create("Button")
		accept:SetRelativeWidth(.5)
		accept:SetText(_G.ACCEPT)
		accept:SetCallback("OnClick", callbackFunction or _closePopUp)
		frame:AddChild(accept)

		local close = AceGUI:Create("Button")
		close:SetRelativeWidth(.5)
		close:SetText(_G.CANCEL)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		edit:SetText(editboxText)
		edit:SetDisabled(true)

	end

	-- Resize frame to fit all elements
	local total, odd = 0, true
	for _, e in pairs(frame.children) do
		local h = e.frame.height or e.frame:GetHeight()
		local w = e.frame.width or e.frame:GetWidth()
		if w < 245 then -- FullWidth elements are 326 pixels wide, half width ~163 pixels
			if odd then -- Count only every other half width element to the total height
				total = total + h + 3
				odd = false
			else
				odd = true
			end
		else
			total = total + h + 3
		end
		--print(">>", h, w, odd, total)
	end

	while frame.content:GetHeight() < total do
		height = height + 1
		frame:SetHeight(height)
	end

	popupOpenAlready = true
end

AzeritePowerWeights.CreatePopUp = CreatePopUp

--#EOF


--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
----------------------------------------------------------------------------]]--
-- Libs
local ACD = LibStub("AceConfigDialog-3.0")
local ACR = LibStub("AceConfigRegistry-3.0")
local AceGUI = LibStub("AceGUI-3.0")

-- Default DB settings
local dbVersion = 2
local dbDefaults = {
	customScales = {},
	char = {},
	dbVersion = dbVersion
}
local charDefaults = {
	debug = false,
	onlyOwnClassDefaults = true,
	onlyOwnClassCustoms = false,
	importingCanUpdate = true,
	defensivePowers = true,
	rolePowers = true,
	rolePowersNoOffRolePowers = true,
	zonePowers = true,
	professionPowers = false,
	pvpPowers = false,
	addILvlToScore = true,
	scaleByAzeriteEmpowered = false,
	addPrimaryStatToScore = false,
	relativeScore = false,
	showOnlyUpgrades = false,
	showTooltipLegend = false,
	outlineScores = true,
	specScales = {},
	tooltipScales = {}
}

-- Slots for Azerite Gear
local azeriteSlots = {
	[1] = true, -- Head
	[3] = true, -- Shoulder
	[5] = true -- Chest
}

-- Weight Editor
local importVersion = 2

-- Score Strings
local reallyBigNumber = 2^31 - 1 -- 2147483647, go over this and errors are thrown
local activeStrings = {} -- Pointers of score strings in use are save in this table
local scoreData = {} -- Current active scales are saved to this table
-- 8.2 Azerite Essences
local essenceScoreData = {}

-- Pointers and Eventframe
local customScales, cfg
local db, lastOpenScale
local playerClassID, playerSpecID
local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(self, event, ...)
	return self[event] and self[event](self, event, ...)
end)
f:RegisterEvent("ADDON_LOADED")


local function Print(text, ...)
	if text then
		if text:match("%%[dfqs%d%.]") then
			DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00AzeritePowerWeights:|r " .. format(text, ...))
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00AzeritePowerWeights:|r " .. strjoin(" ", text, tostringall(...)))
		end
	end
end

local function initDB(db, defaults) -- This function copies values from one table into another:
	if type(db) ~= "table" then db = {} end
	if type(defaults) ~= "table" then return db end
	for k, v in pairs(defaults) do
		if type(v) == "table" then
			db[k] = initDB(db[k], v)
		elseif type(v) ~= type(db[k]) then
			db[k] = v
		end
	end
	return db
end

local function _isInteger(number)
	return number == floor(number)
end

local function _getDecimals(number)
	local num, decimals = strsplit(".", tostring(number))
	return decimals and strlen(decimals) or 0
end

local function _activeSpec() -- Get current active spec for scoreData population etc.
	local currentSpec = GetSpecialization()
	if currentSpec then
		local specID = GetSpecializationInfo(currentSpec)
		if specID then
			playerSpecID = specID
		end
	end
end

local traitStack, essenceStack = {}, {}
local function _populateWeights() -- Populate scoreData with active spec's scale
	if not playerSpecID then return end -- No playerSpecID yet, return
	local scaleKey = cfg.specScales[playerSpecID].scaleID
	local groupSet, classID, specNum, scaleName = strsplit("/", scaleKey)
	if groupSet and classID and specNum and scaleName then
		classID = tonumber(classID)
		specNum = tonumber(specNum)
		for _, dataSet in ipairs(groupSet == "C" and customScales or AzeritePowerWeights.defaultScalesData) do
			if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
				wipe(scoreData)
				local scoreCount = 0
				for k, v in pairs(dataSet[4]) do
					scoreData[k] = v
					scoreCount = scoreCount + 1
				end
				traitStack.loading = scoreCount
				-- 8.2 Azerite Essences
				wipe(essenceScoreData)
				local essenceCount = 0
				for k, v in pairs(dataSet[5]) do
					essenceScoreData[k] = v
					essenceCount = essenceCount + 1
				end
				essenceStack.loading = essenceCount
				if AzeritePowerWeights.guiContainer then
					--AzeritePowerWeights.guiContainer:SetStatusText(format(L.WeightEditor_CurrentScale, scaleName))
					AzeritePowerWeights.guiContainer:SetStatusText(format(U["WeightEditor_CurrentScale"], groupSet == "D" and (AzeritePowerWeights.defaultNameTable[scaleName] or cfg.specScales[playerSpecID].scaleName) or cfg.specScales[playerSpecID].scaleName))
				end
				return
			end
		end
	else
		return
	end
end

local AcquireString, ReleaseString
do
	local string_cache = {}

	function AcquireString(parent, text)
		local string

		if #string_cache > 0 then
			string = tremove(string_cache)
		else
			string = f:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		end

		local fontName, fontHeight, fontFlags = string:GetFont()
		if cfg.outlineScores then
			string:SetFont(fontName, fontHeight, "OUTLINE")
		else
			string:SetFont(fontName, fontHeight, "")
		end

		string:Show()
		string:SetPoint("CENTER", parent)
		string:SetText(text)
		f:SetFrameStrata("HIGH") -- parent:GetFrameStrata() returns MEDIUM after a while for some reason?

		return string
	end

	function ReleaseString(string)
		string:SetText("")
		string:Hide()
		string:ClearAllPoints()

		string_cache[#string_cache + 1] = string
	end
end -- StringPool

-- Delay function
local lock
local function delayedUpdate()
	if not lock then
		lock = true
		C_Timer.After(0, f.UpdateValues) -- Wait until next frame
	end
end

-- Scale weight editor related functions
local function _customSort(a, b)
	if a.value and b.value then -- Sorting Tree
		if a.text ~= b.text then
			return a.text < b.text
		else
			return a.value < b.value
		end
	else -- Sorting Custom Scales save-table
		if a[1] ~= b[1] then
			return a[1] < b[1]
		elseif a[2] ~= b[2] then
			return a[2] < b[2]
		else
			return a[3] < a[3]
		end
	end
end

local pvpPairs = { -- Used for Exporting/Importing. These powers have same effects, but are different powers
	-- Horde
	[486] = 6,
	[487] = 6,
	[488] = 6,
	[489] = 6,
	[490] = 6,
	[491] = 6,

	-- Alliance
	[492] = -6,
	[493] = -6,
	[494] = -6,
	[495] = -6,
	[496] = -6,
	[497] = -6
}
local function insertCustomScalesData(scaleName, classIndex, specID, powerData, essenceData, scaleMode) -- Insert into table
	local t, e = {}, {}
	if powerData and powerData ~= "" then -- String to table
		for _, weight in pairs({ strsplit(",", powerData) }) do
			local azeritePowerID, value = strsplit("=", strtrim(weight))
			azeritePowerID = tonumber(azeritePowerID) or nil
			value = tonumber(value) or nil

			if azeritePowerID and value and value > 0 then
				value = value > reallyBigNumber and reallyBigNumber or value
				t[azeritePowerID] = value
				if pvpPairs[azeritePowerID] then -- Mirror PvP Powers for both factions
					t[azeritePowerID + pvpPairs[azeritePowerID]] = value
				end
			end
		end
	end

	-- 8.2 Azerite Essences
	if essenceData and essenceData ~= "" then -- String to table
		for _, weight in pairs({ strsplit(",", essenceData) }) do
			local essenceID, valuePair = strsplit("=", strtrim(weight))
			if essenceID and valuePair then
				local majorValue, minorValue = strsplit("/", strtrim(valuePair))
				essenceID = tonumber(essenceID) or nil
				majorValue = tonumber(majorValue) or nil
				minorValue = tonumber(minorValue) or nil

				if essenceID and (majorValue or minorValue) and (majorValue > 0 or minorValue > 0) then
					majorValue = majorValue and (majorValue > reallyBigNumber and reallyBigNumber or majorValue) or 0
					minorValue = minorValue and (minorValue > reallyBigNumber and reallyBigNumber or minorValue) or 0
					e[essenceID] = { majorValue, minorValue }
				end
			end
		end
	end

	local updated = false
	-- Check if we have scale with same name already and update it
	for key, dataSet in ipairs(customScales) do
		if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classIndex and dataSet[3] == specID then
			dataSet[4] = t
			-- 8.2 Azerite Essences
			--dataSet[5] = time() -- Timestamp
			--dataSet[6] = 2 -- Set scaleMode to 2 (Only Imports should update scales)
			dataSet[5] = e
			dataSet[6] = time() -- Timestamp
			dataSet[7] = 2 -- Set scaleMode to 2 (Only Imports should update scales)
			updated = true
			break
		end
	end

	-- Create new scale if we didn't find existing set
	if not updated then
		customScales[#customScales + 1] = {
			scaleName,
			classIndex,
			specID,
			t,
			e,
			time(), -- Timestamp
			scaleMode -- Set scaleMode either 1 (Created) or 2 (Imported)
		}
	end

	sort(customScales, _customSort)

	return updated -- Return info if we created new or updated old
end

local function _buildTree(t)
	local t = {}

	t[1] = {
		value = 1,
		text = U["ScalesList_CustomGroupName"],
		disabled = true,
		children = {}
	}
	t[2] = {
		value = 2,
		text = U["ScalesList_DefaultGroupName"],
		disabled = true,
		children = {}
	}

	playerClassID = playerClassID or select(3, UnitClass("player"))

	for _, dataSet in ipairs(customScales) do
		local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
		local specID, name, description, iconID, role, class = GetSpecializationInfoByID(dataSet[3])
		local c = _G.RAID_CLASS_COLORS[classTag]

		--if (dataSet) then
		if (dataSet) and ((cfg.onlyOwnClassCustoms and classID == playerClassID) or (not cfg.onlyOwnClassCustoms)) then -- Hide custom scales of other classes if enabled
			t[1].children[#t[1].children + 1] = {
				value = "C/"..dataSet[2].."/"..dataSet[3].."/"..dataSet[1],
				text = ("|c%s%s|r"):format(c.colorStr, dataSet[1]),
				icon = iconID
			}
		end
	end

	sort(t[1].children, _customSort)
	tinsert(t[1].children, 1, { -- Make sure Create New/Import is the first item on the list
		value = "AzeritePowerWeightsImport",
		text = U["ScalesList_CreateImportText"],
		icon = 134400
	})

	for _, dataSet in ipairs(AzeritePowerWeights.defaultScalesData) do
		local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
		local specID, name, description, iconID, role, isRecommended, isAllowed = GetSpecializationInfoForClassID(classID, dataSet[3])
		local c = _G.RAID_CLASS_COLORS[classTag]

		--local scaleName = AzeritePowerWeights.defaultNameTable[ dataSet[1] ] and classDisplayName .. " - " .. name .. " (" .. dataSet[1] .. ")" or classDisplayName .. " - " .. name
		local scaleName = (AzeritePowerWeights.defaultNameTable[ dataSet[1] ] and AzeritePowerWeights.defaultNameTable[ dataSet[1] ] ~= U["DefaultScaleName_Default"]) and classDisplayName .. " - " .. name .. " (" .. AzeritePowerWeights.defaultNameTable[ dataSet[1] ] .. ")" or classDisplayName .. " - " .. name
		if (dataSet) and ((cfg.onlyOwnClassDefaults and classID == playerClassID) or (not cfg.onlyOwnClassDefaults)) then
			t[2].children[#t[2].children + 1] = {
				value = "D/"..dataSet[2].."/"..dataSet[3].."/"..dataSet[1],
				text = ("|c%s%s|r"):format(c.colorStr, scaleName),
				icon = iconID
			}
		end
	end

	return t
end

local function _SelectGroup(widget, callback, group)
	local dataGroup, scaleKey = strsplit("\001", group)

	if dataGroup and not scaleKey then
		scaleKey = dataGroup
	end

	local groupSet, classID, specNum, scaleName = strsplit("/", scaleKey)

	if scaleKey == "AzeritePowerWeightsImport" then -- Create New / Import
		AzeritePowerWeights:CreateImportGroup(AzeritePowerWeights.scalesScroll)
	else -- Scaleset
		classID = tonumber(classID)
		specNum = tonumber(specNum)
	
		if groupSet == "C" then -- Custom Scales

			for _, dataSet in ipairs(customScales) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
					--AzeritePowerWeights:CreateWeightEditorGroup(true, AzeritePowerWeights.scalesScroll, dataSet[1], dataSet[4], scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specNum) -- specNum is actually specID here
					AzeritePowerWeights:CreateWeightEditorGroup(true, AzeritePowerWeights.scalesScroll, dataSet, scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specNum) -- specNum is actually specID here

					break
				end
			end

		elseif groupSet == "D" then -- Default Scales

			for _, dataSet in ipairs(AzeritePowerWeights.defaultScalesData) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
					local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
					local specID, name, description, iconID, role, isRecommended, isAllowed = GetSpecializationInfoForClassID(classID, dataSet[3])

					--AzeritePowerWeights:CreateWeightEditorGroup(false, AzeritePowerWeights.scalesScroll, ("%s - %s (%s)"):format(classDisplayName, name, dataSet[1]), dataSet[4], scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specID)
					AzeritePowerWeights:CreateWeightEditorGroup(false, AzeritePowerWeights.scalesScroll, dataSet, scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specID)

					break
				end
			end

		else -- ???
		end
	end

	delayedUpdate()
end

local function _enableScale(powerWeights, essenceWeights, scaleKey)
	wipe(scoreData)
	local scoreCount = 0
	for k, v in pairs(powerWeights) do
		scoreData[k] = v
		scoreCount = scoreCount + 1
	end
	traitStack.loading = scoreCount
	-- 8.2 Azerite Essences
	wipe(essenceScoreData)
	local essenceCount = 0
	for k, v in pairs(essenceWeights) do
		essenceScoreData[k] = v
		essenceCount = essenceCount + 1
	end
	essenceStack.loading = essenceCount

	local groupSet, _, _, scaleName = strsplit("/", scaleKey)
	--AzeritePowerWeights.guiContainer:SetStatusText(format(U["WeightEditor_CurrentScale"], scaleName))
	AzeritePowerWeights.guiContainer:SetStatusText(format(U["WeightEditor_CurrentScale"], groupSet == "D" and (AzeritePowerWeights.defaultNameTable[scaleName] or scaleName) or scaleName))

	cfg.specScales[playerSpecID].scaleID = scaleKey
	cfg.specScales[playerSpecID].scaleName = scaleName
	--cfg.specScales[playerSpecID].scaleName = groupSet == "D" and (AzeritePowerWeights.defaultNameTable[scaleName] or scaleName) or scaleName
	AzeritePowerWeights.treeGroup:SelectByValue(cfg.specScales[playerSpecID].scaleID)
end

local function _checkForNameCollisions(nameString, previousName, classID, specID)
	local collision = true
	local testName = nameString
	local c = 1
	while collision == true do
		collision = false
		for key, dataSet in ipairs(customScales) do
			if (dataSet) and dataSet[1] == testName and dataSet[2] == classID and dataSet[3] == specID then
				collision = true
				testName = ("%s (%d)"):format(nameString, c)
				c = c + 1

				if previousName and testName == previousName then -- Earlier name had (x) in it and we hit the same number, don't increase it
					collision = false
				end

				break
			end
		end
	end

	return testName
end

local function _exportScale(powerWeights, essenceWeights, scaleName, classID, specID) -- Create export string and show export popup
	local template = "( %s:%d:\"%s\":%d:%d:%s:%s )"
	local t, e = {}, {}
	local isHorde = UnitFactionGroup("player") == "Horde"
	for k, v in pairs(powerWeights) do
		if type(tonumber(v)) == "number" and tonumber(v) > 0 then
			if pvpPairs[tonumber(k)] then
				if isHorde and pvpPairs[tonumber(k)] > 0 then -- Horde player and Horde power
					t[#t + 1] = k.."="..v
				elseif not isHorde and pvpPairs[tonumber(k)] < 0 then -- Alliance player and Alliance power
					t[#t + 1] = k.."="..v
				end
			else
				t[#t + 1] = k.."="..v
			end
		end
	end
	sort(t)
	for k, v in pairs(essenceWeights) do
		e[#e + 1] = k.."="..(v[1] or 0).."/"..(v[2] or 0)
	end

	local exportString = format(template, "AzeritePowerWeights", importVersion, scaleName, classID, specID, #t > 0 and " "..strjoin(", ", unpack(t)) or "", #e > 0 and " "..strjoin(", ", unpack(e)) or "")

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	AzeritePowerWeights.CreatePopUp("Export", U["ExportPopup_Title"], format(U["ExportPopup_Desc"], NORMAL_FONT_COLOR_CODE .. scaleName .. FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE), exportString)
end

local importStack = {}
local function _importScale(importMode) -- Show import popup and parse input
	local template = "^%s*%(%s*AzeritePowerWeights%s*:%s*(%d+)%s*:%s*\"([^\"]+)\"%s*:%s*(%d+)%s*:%s*(%d+)%s*:%s*(.+)%s*:%s*(.+)%s*%)%s*$"
	wipe(importStack)

	local callbackFunction = function(widget, callback, ...)
		local function _saveString(importString, version)
			importStack[#importStack + 1] = ("Version: %s"):format(tostring(version))
			importStack[#importStack + 1] = importString

			if version and version == 1 then
				template = "^%s*%(%s*" .. "AzeritePowerWeights" .. "%s*:%s*(%d+)%s*:%s*\"([^\"]+)\"%s*:%s*(%d+)%s*:%s*(%d+)%s*:%s*(.+)%s*%)%s*$"
			end
			local startPos, endPos, stringVersion, scaleName, classID, specID, powerWeights, essenceWeights = strfind(importString, template)

			importStack[#importStack + 1] = ("startPos: %s, endPos: %s, stringVersion: %s, scaleName: %s, classID: %s, specID: %s"):format(tostring(startPos), tostring(endPos), tostring(stringVersion), tostring(scaleName), tostring(classID), tostring(specID))
			importStack[#importStack + 1] = ("powerWeights: %s"):format(tostring(powerWeights))
			importStack[#importStack + 1] = ("essenceWeights: %s"):format(tostring(essenceWeights))

			stringVersion = tonumber(stringVersion) or 0
			scaleName = scaleName or U["ScaleName_Unnamed"]
			powerWeights = powerWeights or ""
			essenceWeights = essenceWeights or ""
			classID = tonumber(classID) or nil
			specID = tonumber(specID) or nil

			if stringVersion == 0 then -- Try to find string version if we didn't find it previously
				startPos, endPos, stringVersion = strfind(importString, "^%s*%(%s*" .. "AzeritePowerWeights" .. "%s*:%s*(%d+)%s*:.*%)%s*$")
				stringVersion = tonumber(stringVersion) or 0

				importStack[#importStack + 1] = ("Fixed stringVersion: %s"):format(tostring(stringVersion))
			end

			if (not cfg.importingCanUpdate) or (version and version > 0) then -- No updating for you, get collision free name
				scaleName = _checkForNameCollisions(scaleName, false, classID, specID)
			end

			if (version and stringVersion < version) or (not version and stringVersion < importVersion) then -- String version is old and not supported
				importStack[#importStack + 1] = ("String version is old: %s / %s / %s"):format(tostring(stringVersion), tostring(importVersion), tostring(version))
				if not version then
					importStack[#importStack + 1] = "-> First retry...\n"
					Print("ERROR: Old or malformed \"Import string\"")
					_saveString(importString, (importVersion - 1))
				elseif version > 1 then
					importStack[#importStack + 1] = "-> Still retrying...\n"
					_saveString(importString, (version - 1))
				else
					importStack[#importStack + 1] = "-> Too old or malformed, can't figure this out...\n> END"
					Print(U["ImportPopup_Error_OldStringVersion"])
				end
			elseif type(classID) ~= "number" or classID < 1 or type(specID) ~= "number" or specID < 1 then -- No class or no spec, this really shouldn't happen ever
				importStack[#importStack + 1] = ("Problem with classID %s or specID %s, bailing out...\n> END"):format(tostring(classID), tostring(specID))
				Print(U["ImportPopup_Error_MalformedString"])
			else -- Everything seems to be OK
				importStack[#importStack + 1] = "Everything seems to be OK"
				local result = insertCustomScalesData(scaleName, classID, specID, powerWeights, essenceWeights, 2) -- Set scaleMode 2 for Imported

				-- Rebuild Tree
				AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
				AzeritePowerWeights.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..scaleName)
				AzeritePowerWeights.treeGroup:RefreshTree(true)

				if result then -- Updated old scale
					importStack[#importStack + 1] = "- Updated old scale.\n> END"
					Print(U["ImportPopup_UpdatedScale"], scaleName)
					-- Update the scores just incase if it is the scale actively in use
					_populateWeights()
					delayedUpdate()
				else -- Created new
					importStack[#importStack + 1] = "- Created new scale\n> END"
					Print(U["ImportPopup_CreatedNewScale"], scaleName)
				end
			end
		end

		local input = widget:GetUserData("importString") or ""

		if importMode then
			local t = { strsplit("\r\n", input) }
			if #t > 0 then
				for k, v in pairs(t) do
					if v then -- Let's make sure there is something
						_saveString(v)
					end
				end
			else
				Print(U["ImportPopup_Error_MalformedString"])
			end

		else
			_saveString(input)
		end

		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	if importMode then -- Mass Import
		importStack[#importStack + 1] = "=== MassImport"
		AzeritePowerWeights.CreatePopUp("MassImport", U["ImportPopup_Title"], format(U["ImportPopup_Desc"], NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), "", callbackFunction)
	else -- Import
		importStack[#importStack + 1] = "=== Import"
	AzeritePowerWeights.CreatePopUp("Import", U["ImportPopup_Title"], format(U["ImportPopup_Desc"], NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), "", callbackFunction)
	end
end

local function _createScale() -- Show create popup and parse input
	local callbackFunction = function(widget, callback, ...)
		local classID = widget:GetUserData("classID")
		local specID = widget:GetUserData("specID")
		local nameString = widget:GetUserData("nameString")

		if not nameString or nameString == "" then
			nameString = U["ScaleName_Unnamed"]
		end
		if not classID then
			classID = 1 -- Warrior
			specID = 71 -- Arms
		end

		local scaleName = _checkForNameCollisions(nameString, false, classID, specID)

		if scaleName then
			local result = insertCustomScalesData(scaleName, classID, specID, nil, nil, 1) -- Set scaleMode 1 for Created

			-- Rebuild Tree
			AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
			AzeritePowerWeights.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..scaleName)
			AzeritePowerWeights.treeGroup:RefreshTree(true)


			if result then -- Updated old instead of creating new, which should never happen
				Print(U["CreatePopup_Error_UnknownError, scaleName"])
			else -- Expected result
				Print(U["CreatePopup_Error_CreatedNewScale, scaleName"])
			end
		end


		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	AzeritePowerWeights.CreatePopUp("Create", U["CreatePopup_Title"], format(U["CreatePopup_Desc"], NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), "", callbackFunction)
end

local function _renameScale(scaleName, classID, specID, isCurrentScales) -- Show rename popup and check for name collisions
	local callbackFunction = function(widget, callback, ...)
		local renameString = widget:GetUserData("renameString")

		if not renameString or renameString == "" then
			renameString = U["ScaleName_Unnamed"]
		end

		if renameString ~= scaleName then -- Check if name actually changed
			local finalName = _checkForNameCollisions(renameString, scaleName, classID, specID)

			local scaleWeights, essenceWeights
			for key, dataSet in ipairs(customScales) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specID then

					dataSet[1] = finalName
					scaleWeights = dataSet[4]
					-- 8.2 Azerite Essences
					essenceWeights = dataSet[5]

					break
				end
			end

			Print(U["RenamePopup_RenamedScale"], scaleName, finalName)

			AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
			AzeritePowerWeights.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..finalName)
			AzeritePowerWeights.treeGroup:RefreshTree(true)

			if isCurrentScales and scaleWeights then
				_enableScale(scaleWeights, essenceWeights, "C/"..classID.."/"..specID.."/"..finalName)
			end

			-- Check if we have to rename scaleKeys for other tooltips
			for realmName, realmData in pairs(db.char) do
				for charName, charData in pairs(realmData) do
					if charData.tooltipScales and #charData.tooltipScales > 0 then
						for i, tooltipData in ipairs(charData.tooltipScales) do
							if tooltipData.scaleName == scaleName and tooltipData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, update scaleKey
								tooltipData.scaleID = "C/"..classID.."/"..specID.."/"..finalName
								tooltipData.scaleName = finalName
							end
						end
					end
				end
			end

			-- Check if we have to rename scaleKeys for other characters using same scale
			for realmName, realmData in pairs(db.char) do
				for charName, charData in pairs(realmData) do
					for spec, specData in pairs(charData.specScales) do
						if spec == specID and specData.scaleName == scaleName and specData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, update scaleKey
							specData.scaleID = "C/"..classID.."/"..specID.."/"..finalName
							specData.scaleName = finalName
						end
					end
				end
			end
		end

		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	AzeritePowerWeights.CreatePopUp("Rename", U["RenamePopup_Title"], format(U["RenamePopup_Desc"], NORMAL_FONT_COLOR_CODE .. scaleName .. FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), scaleName, callbackFunction)
end

local function _deleteScale(scaleName, classID, specID, isCurrentScales) -- Show delete popup and remove scale
	local callbackFunction = function(widget, callback, ...)
		local index
		-- Find where in the table scaleKey to be removed is
		for key, dataSet in ipairs(customScales) do
			if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specID then
				index = key
				break
			end
		end

		-- Remove without breaking the indexing
		tremove(customScales, index)
		Print(U["DeletePopup_DeletedScale"], scaleName)

		AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
		AzeritePowerWeights.treeGroup:SelectByValue("AzeritePowerWeightsImport")
		AzeritePowerWeights.treeGroup:RefreshTree(true)

		-- If removed scaleKey was in use, revert back to default option
		if isCurrentScales then
			local specNum = GetSpecialization()
			playerClassID = playerClassID or select(3, UnitClass("player"))
			local scaleKey = AzeritePowerWeights.GetDefaultScaleSet(playerClassID, specNum)
			local _, _, _, defaultScaleName = strsplit("/", scaleKey)
			
			for _, dataSet in ipairs(AzeritePowerWeights.defaultScalesData) do
				if (dataSet) and dataSet[1] == defaultScaleName and dataSet[2] == playerClassID and dataSet[3] == specNum then
					_enableScale(dataSet[4], dataSet[5], scaleKey)

					break
				end
			end

			Print(U["DeletePopup_DeletedDefaultScale"])
		end

		-- Check if this scale was in tooltips
		for realmName, realmData in pairs(db.char) do
			for charName, charData in pairs(realmData) do
				if charData.tooltipScales and #charData.tooltipScales > 0 then
					for i = #charData.tooltipScales, 1 , -1 do -- Go backwards to prevent holes and errors
						local tooltipData = charData.tooltipScales[i]
						if tooltipData.scaleName == scaleName and tooltipData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, remove scaleKey
							tremove(charData.tooltipScales, i)
						end
					end
				end
			end
		end

		-- Check if someone used this scale and remove it so they can revert back to default on their next login
		for realmName, realmData in pairs(db.char) do
			for charName, charData in pairs(realmData) do
				for spec, specData in pairs(charData.specScales) do
					if spec == specID and specData.scaleName == scaleName and specData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, remove scaleKey
						charData.specScales[spec] = nil
					end
				end
			end
		end

		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	AzeritePowerWeights.CreatePopUp("Delete", U["DeletePopup_Title"], format(U["DeletePopup_Desc"], NORMAL_FONT_COLOR_CODE .. scaleName .. FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), U["DeletePopup_Warning"], callbackFunction)
end

function AzeritePowerWeights:CreateImportGroup(container)
	container:ReleaseChildren()

	local version = AceGUI:Create("Label")
	version:SetText(" 8.2.8")
	version:SetJustifyH("RIGHT")
	version:SetFullWidth(true)
	container:AddChild(version)

	local title = AceGUI:Create("Heading")
	title:SetText(U["ScalesList_CreateImportText"])
	title:SetFullWidth(true)
	container:AddChild(title)

	local newButton = AceGUI:Create("Button")
	newButton:SetText(U["WeightEditor_CreateNewText"])
	newButton:SetFullWidth(true)
	newButton:SetCallback("OnClick", function()
		-- Call _createScale
		_createScale()
	end)
	container:AddChild(newButton)

	local importButton = AceGUI:Create("Button")
	importButton:SetText(U["WeightEditor_ImportText"])
	importButton:SetFullWidth(true)
	importButton:SetCallback("OnClick", function()
		-- Call _importScale
		_importScale()
	end)
	container:AddChild(importButton)

	local massImportButton = AceGUI:Create("Button")
	massImportButton:SetText("Mass Import")
	massImportButton:SetFullWidth(true)
	massImportButton:SetCallback("OnClick", function()
		-- Call _importScale
		_importScale(true)
	end)
	container:AddChild(massImportButton)

	local line = AceGUI:Create("Heading")
	line:SetFullWidth(true)
	container:AddChild(line)

	lastOpenScale = "AzeritePowerWeightsImport"
end

--function AzeritePowerWeights:CreateWeightEditorGroup(isCustomScale, container, titleText, powerWeights, scaleKey, isCurrentScales, classID, specID)
function AzeritePowerWeights:CreateWeightEditorGroup(isCustomScale, container, dataSet, scaleKey, isCurrentScales, classID, specID)
	local classDisplayName = GetClassInfo(dataSet[2])
	local _, specName = GetSpecializationInfoForClassID(classID, dataSet[3])
	local titleText = isCustomScale and dataSet[1] or ("%s - %s (%s)"):format(classDisplayName, specName, dataSet[1])
	local powerWeights = dataSet[4]
	-- 8.2 Azerite Essences
	local essenceWeights = dataSet[5]

	container:ReleaseChildren()

	local title = AceGUI:Create("Heading")
	title:SetText(titleText)
	title:SetFullWidth(true)
	container:AddChild(title)

	local useButton = AceGUI:Create("Button")
	if isCurrentScales then
		useButton:SetText(GRAY_FONT_COLOR_CODE .. U["WeightEditor_EnableScaleText"] .. FONT_COLOR_CODE_CLOSE)
	else
		useButton:SetText(U["WeightEditor_EnableScaleText"])
	end
	useButton:SetRelativeWidth(.5)
	useButton:SetDisabled(isCurrentScales)
	useButton:SetCallback("OnClick", function()
		-- Call _enableScale
		_enableScale(powerWeights, essenceWeights, scaleKey)
	end)
	container:AddChild(useButton)

	local exportButton = AceGUI:Create("Button")
	exportButton:SetText(U["WeightEditor_ExportText"])
	exportButton:SetRelativeWidth(.5)
	exportButton:SetCallback("OnClick", function()
		-- Call _exportScale
		_exportScale(powerWeights, essenceWeights, titleText, classID, specID)
	end)
	container:AddChild(exportButton)

	if isCustomScale then
		local renameButton = AceGUI:Create("Button")
		renameButton:SetText(U["WeightEditor_RenameText"])
		renameButton:SetRelativeWidth(.5)
		renameButton:SetCallback("OnClick", function()
			-- Call _renameScale
			_renameScale(titleText, classID, specID, isCurrentScales)
		end)
		container:AddChild(renameButton)

		local deleteButton = AceGUI:Create("Button")
		deleteButton:SetText(U["WeightEditor_DeleteText"])
		deleteButton:SetRelativeWidth(.5)
		deleteButton:SetCallback("OnClick", function()
			-- Call _deleteScale
			_deleteScale(titleText, classID, specID, isCurrentScales)
		end)
		container:AddChild(deleteButton)
	end

	-- Tooltip start
	local tooltipCheckbox = AceGUI:Create("CheckBox")
	tooltipCheckbox:SetLabel(U["WeightEditor_TooltipText"])
	tooltipCheckbox:SetFullWidth(true)
	tooltipCheckbox:SetValue(false)
	tooltipCheckbox:SetCallback("OnValueChanged", function(widget, callback, checked)
		if checked == true then
			local groupSet, _, _, thisScaleName = strsplit("/", scaleKey)
			cfg.tooltipScales[#cfg.tooltipScales + 1] = {
				scaleID = scaleKey,
				--scaleName = thisScaleName
				scaleName = groupSet == "D" and (AzeritePowerWeights.defaultNameTable[thisScaleName] or thisScaleName) or thisScaleName
			}
		else
			if #cfg.tooltipScales > 0 then
				for i = #cfg.tooltipScales, 1, -1 do -- Just to make sure if for any erroneous reason, there are multiple copies of same scale, they all get removed.
					local v = cfg.tooltipScales[i]
					if v.scaleID == scaleKey then
						tremove(cfg.tooltipScales, i)
					end
				end
			end
		end
		widget:SetValue(checked)
	end)
	container:AddChild(tooltipCheckbox)

	for _, v in ipairs(cfg.tooltipScales) do
		if v.scaleID == scaleKey then
			tooltipCheckbox:SetValue(true)
			break -- No need to iterate more
		end
	end
	-- Tooltip end

	-- Timestamp start
	local timestampText = AceGUI:Create("Label")
	container:AddChild(timestampText)

	local function _updateTimestamp()
		-- dataSet[5] == timestamp
		-- dataSet[6] = scaleMode: 0 = Default/Updated, 1 = Created, 2 = Imported
		-- 8.2 Azerite Essences
		-- timestamp 5->6, scaleMode 6->7
		if dataSet[7] == 1 then
			timestampText:SetText(format("Created %s", date("%Y.%m.%d", (dataSet[6] or 0))))
		elseif dataSet[7] == 2 then
			timestampText:SetText(format("Imported %s", date("%Y.%m.%d", (dataSet[6] or 0))))
		else -- dataSet[6] 0, Default or Updated
			--timestampText:SetText(format(L.WeightEditor_TimestampText_Created, date("%Y.%m.%d %H:%M", (dataSet[5] or 0)))) -- Debug
			timestampText:SetText(format("Updated %s", date("%Y.%m.%d", (dataSet[6] or 0))))
		end
	end

	_updateTimestamp()
	-- Timestamp end

	local spacer = AceGUI:Create("Label")
	spacer:SetText(" \n ")
	spacer:SetFullWidth(true)
	container:AddChild(spacer)

	local isHorde = UnitFactionGroup("player") == "Horde"
	local roleBits = 0x0
	local BIT_DAMAGER = 0x1
	local BIT_TANK = 0x2
	local BIT_HEALER = 0x4
	for i = 1, GetNumSpecializationsForClassID(classID) do
		local spec, _, _, _, role = GetSpecializationInfoForClassID(classID, i)
		if spec and ((cfg.rolePowersNoOffRolePowers and spec == specID) or (not cfg.rolePowersNoOffRolePowers)) then -- Check if only powers suitable for the spec
			if role == "DAMAGER" then
				roleBits = bit.bor(roleBits, BIT_DAMAGER)
			elseif role == "TANK" then
				roleBits = bit.bor(roleBits, BIT_TANK)
			elseif role == "HEALER" then
				roleBits = bit.bor(roleBits, BIT_HEALER)
			end
		end
	end

	local e = {}
	local c = 1

	local function _saveValue(widget, callback, text)
		local value = tonumber(text) or 0
		value = value > reallyBigNumber and reallyBigNumber or value
		local pointer = widget:GetUserData("dataPointer")
		local pairPointer = widget:GetUserData("pairPointer")
		-- Save to DB
		powerWeights[pointer] = value
		widget:SetText(text == "" and "" or (value and value or ""))
		AceGUI:ClearFocus()
		if pairPointer then
			powerWeights[pairPointer] = value
		end
		if isCurrentScales then
			-- Update visible numbers
			scoreData[pointer] = value
			delayedUpdate()
		end

		-- Update scaleMode and timestamp
		-- 8.2 Azerite Essences
		--dataSet[5] = time()
		--dataSet[6] = 0
		dataSet[6] = time()
		dataSet[7] = 0
		_updateTimestamp()
	end

	local function _saveEssenceValue(widget, callback, text)
		local value = tonumber(text) or 0
		value = value > reallyBigNumber and reallyBigNumber or value
		local pointer = widget:GetUserData("essencePointer")
		local major = widget:GetUserData("essenceMajor")
		-- Save to DB
		essenceWeights[pointer] = essenceWeights[pointer] or {}
		if major then
			essenceWeights[pointer][1] = value
		else
			essenceWeights[pointer][2] = value
		end
		widget:SetText(text == "" and "" or (value and value or ""))
		AceGUI:ClearFocus()

		if isCurrentScales then
			-- Update visible numbers
			essenceScoreData[pointer] = essenceScoreData[pointer] or {}
			if major then
				essenceScoreData[pointer][1] = value
			else
				essenceScoreData[pointer][2] = value
			end
			delayedUpdate()
		end

		-- Update scaleMode and timestamp
		dataSet[6] = time()
		dataSet[7] = 0
		_updateTimestamp()
	end

	if _G.AzeriteEmpoweredItemUI and _G.AzeriteEmpoweredItemUI:IsShown() then
		-- Class Powers title
		local classTitle = AceGUI:Create("Heading")
		classTitle:SetText(U["PowersTitles_Class"])
		classTitle:SetFullWidth(true)
		container:AddChild(classTitle)

		-- Center Power
		local cname = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(AzeritePowerWeights.sourceData.center.azeritePowerID).spellID)
		e[c] = AceGUI:Create("EditBox")
		e[c]:SetLabel(format("  |T%d:18|t %s", AzeritePowerWeights.sourceData.center.icon, cname or AzeritePowerWeights.sourceData.center.name))
		e[c]:SetText(powerWeights[AzeritePowerWeights.sourceData.center.azeritePowerID] or "")
		e[c]:SetRelativeWidth(.5)
		if isCustomScale then
			e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.center.azeritePowerID)
			e[c]:SetCallback("OnEnterPressed", _saveValue)
		else
			e[c]:SetDisabled(true)
		end
		container:AddChild(e[c])
		c = c + 1

		-- Class Powers
		for i, powerData in ipairs(AzeritePowerWeights.sourceData.class[classID][specID]) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.class[classID][specID][i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end

		if cfg.defensivePowers then
			local defTitle = AceGUI:Create("Heading")
			defTitle:SetText(U["PowersTitles_Defensive"])
			defTitle:SetFullWidth(true)
			container:AddChild(defTitle)

			-- Defensive Powers
			for i, powerData in ipairs(AzeritePowerWeights.sourceData.defensive[classID]) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.defensive[classID][i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
			for i, powerData in ipairs(AzeritePowerWeights.sourceData.defensive.common) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.defensive.common[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end

		if cfg.rolePowers then
			local roleTitle = AceGUI:Create("Heading")
			roleTitle:SetText(U["PowersTitles_Role"])
			roleTitle:SetFullWidth(true)
			container:AddChild(roleTitle)

			-- Role Powers
			for i, powerData in ipairs(AzeritePowerWeights.sourceData.role.common) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0:3:::64:16:16:64:0:16|t" -- Tank, DPS & Healer
				e[c]:SetLabel(format("  %s |T%d:18|t %s", roleIcon, powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.role.common[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end

			-- Non-Healer Powers
			if bit.band(roleBits, bit.bor(BIT_DAMAGER, BIT_TANK)) ~= 0 then
				for i, powerData in ipairs(AzeritePowerWeights.sourceData.role.nonhealer) do
					local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
					e[c] = AceGUI:Create("EditBox")
					local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0:2:::64:16:16:48:0:16|t" -- Tank & DPS
					e[c]:SetLabel(format("  %s |T%d:18|t %s", roleIcon, powerData.icon, name or powerData.name))
					e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
					e[c]:SetRelativeWidth(.5)
					if isCustomScale then
						e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.role.nonhealer[i].azeritePowerID)
						e[c]:SetCallback("OnEnterPressed", _saveValue)
					else
						e[c]:SetDisabled(true)
					end
					container:AddChild(e[c])
					c = c + 1
				end
			end
			-- Tank Powers
			if bit.band(roleBits, BIT_TANK) ~= 0 then
				for i, powerData in ipairs(AzeritePowerWeights.sourceData.role.tank) do
					local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
					e[c] = AceGUI:Create("EditBox")
					local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0::::64:16:32:48:0:16|t" -- Tank
					e[c]:SetLabel(format("  %s |T%d:18|t %s", roleIcon, powerData.icon, name or powerData.name))
					e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
					e[c]:SetRelativeWidth(.5)
					if isCustomScale then
						e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.role.tank[i].azeritePowerID)
						e[c]:SetCallback("OnEnterPressed", _saveValue)
					else
						e[c]:SetDisabled(true)
					end
					container:AddChild(e[c])
					c = c + 1
				end
			end
			-- Healer Powers
			if bit.band(roleBits, BIT_HEALER) ~= 0 then
				for i, powerData in ipairs(AzeritePowerWeights.sourceData.role.healer) do
					local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
					e[c] = AceGUI:Create("EditBox")
					local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0::::64:16:48:64:0:16|t" -- Healer
					e[c]:SetLabel(format("  %s |T%d:18|t %s", roleIcon, powerData.icon, name or powerData.name))
					e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
					e[c]:SetRelativeWidth(.5)
					if isCustomScale then
						e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.role.healer[i].azeritePowerID)
						e[c]:SetCallback("OnEnterPressed", _saveValue)
					else
						e[c]:SetDisabled(true)
					end
					container:AddChild(e[c])
					c = c + 1
				end
			end
		end

		if cfg.zonePowers then
			local zoneTitle = AceGUI:Create("Heading")
			zoneTitle:SetText(U["PowersTitles_Zone"])
			zoneTitle:SetFullWidth(true)
			container:AddChild(zoneTitle)

			-- Raid Powers
			for i, powerData in ipairs(AzeritePowerWeights.sourceData.raid) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t*%s*", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.raid[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
			-- Zone Powers
			-- 8.0:
			local startPoint = 1
			local endPoint = 15
			for i = startPoint, endPoint do
				local powerData = AzeritePowerWeights.sourceData.zone[i]
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.zone[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
			-- Different Zone traits for Alliance and Horde in 8.1
			local tidesStart = isHorde and 18 or 16
			local tidesEnd = isHorde and 19 or 17
			for i = tidesStart, tidesEnd do
				local powerData = AzeritePowerWeights.sourceData.zone[i]
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.zone[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
			-- 8.2 ->
			for i = 20, #AzeritePowerWeights.sourceData.zone do
				local powerData = AzeritePowerWeights.sourceData.zone[i]
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.zone[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end

		if cfg.professionPowers then
			local professionTitle = AceGUI:Create("Heading")
			professionTitle:SetText(U["PowersTitles_Profession"])
			professionTitle:SetFullWidth(true)
			container:AddChild(professionTitle)

			-- Profession Powers
			for i, powerData in ipairs(AzeritePowerWeights.sourceData.profession) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.profession[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end

		if cfg.pvpPowers then
			local pvpTitle = AceGUI:Create("Heading")
			pvpTitle:SetText(U["PowersTitles_PvP"])
			pvpTitle:SetFullWidth(true)
			container:AddChild(pvpTitle)

			-- PvP Powers
			-- 8.0:
			local startPoint = isHorde and 1 or 7
			local endPoint = isHorde and 6 or 12
			for i = startPoint, endPoint do
				local powerData = AzeritePowerWeights.sourceData.pvp[i]
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.pvp[i].azeritePowerID)
					e[c]:SetUserData("pairPointer", AzeritePowerWeights.sourceData.pvp[i].pair)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
			-- 8.1:
			for i = 13, #AzeritePowerWeights.sourceData.pvp do
				local powerData = AzeritePowerWeights.sourceData.pvp[i]
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.pvp[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		traitStack.editor = #e or 0
	elseif _G.AzeriteEssenceUI and _G.AzeriteEssenceUI:IsShown() then
		local topLine = AceGUI:Create("Heading")
		topLine:SetFullWidth(true)
		container:AddChild(topLine)

		for i, essenceData in ipairs(AzeritePowerWeights.essenceData.common) do
			local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0:3:::64:16:16:64:0:16|t" -- Tank, DPS & Healer
			local essenceTitle = AceGUI:Create("Heading")
			essenceTitle:SetText(format("|T%d:18|t %s", essenceData.icon, essenceData.name))
			essenceTitle:SetRelativeWidth(.5)
			container:AddChild(essenceTitle)

			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  %s %s", roleIcon, "Major"))
			e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][1] or "")
			e[c]:SetRelativeWidth(.25)
			if isCustomScale then
				e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.common[i].essenceID)
				e[c]:SetUserData("essenceMajor", true)
				e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1

			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  %s %s", roleIcon, "Minor"))
			e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][2] or "")
			e[c]:SetRelativeWidth(.25)
			if isCustomScale then
				e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.common[i].essenceID)
				e[c]:SetUserData("essenceMajor", false)
				e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end

		-- Tank Powers
		if bit.band(roleBits, BIT_TANK) ~= 0 then
			for i, essenceData in ipairs(AzeritePowerWeights.essenceData.tank) do
				local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0::::64:16:32:48:0:16|t" -- Tank
				local essenceTitle = AceGUI:Create("Heading")
				essenceTitle:SetText(format("|T%d:18|t %s", essenceData.icon, essenceData.name))
				essenceTitle:SetRelativeWidth(.5)
				container:AddChild(essenceTitle)

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Major"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][1] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.tank[i].essenceID)
					e[c]:SetUserData("essenceMajor", true)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Minor"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][2] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.tank[i].essenceID)
					e[c]:SetUserData("essenceMajor", false)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		-- Healer Powers
		if bit.band(roleBits, BIT_HEALER) ~= 0 then
			for i, essenceData in ipairs(AzeritePowerWeights.essenceData.healer) do
				local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0::::64:16:48:64:0:16|t" -- Healer
				local essenceTitle = AceGUI:Create("Heading")
				essenceTitle:SetText(format("|T%d:18|t %s", essenceData.icon, essenceData.name))
				essenceTitle:SetRelativeWidth(.5)
				container:AddChild(essenceTitle)

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Major"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][1] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.healer[i].essenceID)
					e[c]:SetUserData("essenceMajor", true)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Minor"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][2] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.healer[i].essenceID)
					e[c]:SetUserData("essenceMajor", false)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		-- DPS Powers
		if bit.band(roleBits, BIT_DAMAGER) ~= 0 then
			for i, essenceData in ipairs(AzeritePowerWeights.essenceData.damager) do
				local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0::::64:16:16:32:0:16|t" -- Damager
				local essenceTitle = AceGUI:Create("Heading")
				essenceTitle:SetText(format("|T%d:18|t %s", essenceData.icon, essenceData.name))
				essenceTitle:SetRelativeWidth(.5)
				container:AddChild(essenceTitle)

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Major"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][1] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.damager[i].essenceID)
					e[c]:SetUserData("essenceMajor", true)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Minor"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][2] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.damager[i].essenceID)
					e[c]:SetUserData("essenceMajor", false)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		essenceStack.editor = #e or 0
	end
	
	local line = AceGUI:Create("Heading")
	line:SetFullWidth(true)
	container:AddChild(line)

	lastOpenScale = scaleKey
end

local function _toggleEditorUI()
	if not AzeritePowerWeights.guiContainer then return end

	AzeritePowerWeights.guiContainer:ClearAllPoints()
	if _G.AzeriteEmpoweredItemUI and _G.AzeriteEmpoweredItemUI:IsShown() then
		AzeritePowerWeights.guiContainer:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI, "TOPRIGHT", 10, 0)
		AzeritePowerWeights.guiContainer:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMRIGHT", 10, 0)
	elseif _G.AzeriteEssenceUI and _G.AzeriteEssenceUI:IsShown() then
		AzeritePowerWeights.guiContainer:SetPoint("TOPLEFT", _G.AzeriteEssenceUI, "TOPRIGHT", 10, 0)
		AzeritePowerWeights.guiContainer:SetPoint("BOTTOMLEFT", _G.AzeriteEssenceUI, "BOTTOMRIGHT", 10, 0)
	else
		AzeritePowerWeights.guiContainer:SetPoint("CENTER", _G.UIParent)
	end

	if AzeritePowerWeights.guiContainer:IsShown() then
		AzeritePowerWeights.guiContainer:Hide()
	else
		AzeritePowerWeights.guiContainer:Show()
	end
end

-- Hook and Init functions
local function _setupStringAndEnableButton() -- Move string and enableButton between AzeriteEmpoweredItemUI and AzeriteEssenceUI
	C_Timer.After(0, function() -- Fire on next frame instead of current frame
		if _G.AzeriteEmpoweredItemUI and _G.AzeriteEmpoweredItemUI:IsShown() then
			AzeritePowerWeights.frame:SetParent(_G.AzeriteEmpoweredItemUI)

			if _G.AzeriteEmpoweredItemUIPortrait:IsShown() then -- Default UI etc. who show Portrait
				AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, -50)
			else -- ElvUI etc. who hides Portrait
				AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, -10)
			end

			AzeritePowerWeights.enableButton:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMLEFT", 10, 10)
			AzeritePowerWeights.enableButton.frame:SetParent(_G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame) -- Fix enableButton hiding behind AzeriteEmpoweredItemUI elements with ElvUI if the AzeriteUI skinning is disabled.
		elseif _G.AzeriteEssenceUI and _G.AzeriteEssenceUI:IsShown() then
			AzeritePowerWeights.frame:SetParent(_G.AzeriteEssenceUI)

			if ElvUI and ElvUI[3] and ElvUI[3].skins and ElvUI[3].skins.blizzard and ElvUI[3].skins.blizzard.AzeriteEssence then -- ElvUI etc. who hides Portrait
				AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEssenceUI.LeftInset, 10, -10)
			else -- Default UI etc. who show Portrait
				AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEssenceUI.LeftInset, 10, -50)
			end

			AzeritePowerWeights.enableButton:SetPoint("BOTTOMLEFT", _G.AzeriteEssenceUI, "BOTTOMLEFT", 10, 10)
			AzeritePowerWeights.enableButton.frame:SetParent(_G.AzeriteEssenceUI.LeftInset)
		else
			AzeritePowerWeights.frame:Hide()
			AzeritePowerWeights.enableButton.frame:Hide()

			return
		end
		AzeritePowerWeights.frame:Show()
		AzeritePowerWeights.enableButton.frame:Show()
	end)
end

function f:HookAzeriteUI() -- Set Parents and Anchors
	if not playerSpecID then return end -- No playerSpecID yet, return
	self:InitUI()

	--[[
	if _G.AzeriteEmpoweredItemUIPortrait:IsShown() then -- Default UI etc. who show Portrait
		AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, -50)
	else -- ElvUI etc. who hides Portrait
		AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, -10)
	end
	AzeritePowerWeights.frame:Show()

	AzeritePowerWeights.enableButton:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMLEFT", 10, 10)
	AzeritePowerWeights.enableButton.frame:SetParent(_G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame) -- Fix enableButton hiding behind AzeriteEmpoweredItemUI elements with ElvUI if the AzeriteUI skinning is disabled.
	AzeritePowerWeights.enableButton.frame:Show()
	]]
	_setupStringAndEnableButton()

	_G.AzeriteEmpoweredItemUI:HookScript("OnHide", function() -- Hide strings on frame hide
		while #activeStrings > 0 do
			local s = tremove(activeStrings)
			ReleaseString(s)
		end

		if AzeritePowerWeights.guiContainer then
			AzeritePowerWeights.scalesScroll:ReleaseChildren()
			lastOpenScale = nil
			f:RefreshConfig()

			AzeritePowerWeights.guiContainer:Hide()
		end
	end)
end

function f:HookAzeriteEssenceUI() -- Set Parents and Anchors for the 8.2 AzeriteEssenceUI
	if not playerSpecID then return end -- No playerSpecID yet, return
	self:InitUI()

	_setupStringAndEnableButton()

	_G.AzeriteEssenceUI:HookScript("OnHide", function() -- Hide strings on frame hide
		while #activeStrings > 0 do
			local s = tremove(activeStrings)
			ReleaseString(s)
		end

		if AzeritePowerWeights.guiContainer then
			AzeritePowerWeights.scalesScroll:ReleaseChildren()
			lastOpenScale = nil
			f:RefreshConfig()

			AzeritePowerWeights.guiContainer:Hide()
		end
	end)
end

local initDone
function f:InitUI() -- Build UI and set up some initial data
	if initDone then return end
	initDone = true


	local frame = CreateFrame("Frame")
	frame:Hide()
	AzeritePowerWeights.frame = frame

	local string = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	string:SetJustifyH("LEFT")
	string:SetJustifyV("TOP")
	string:SetText("")
	AzeritePowerWeights.string = string

	-- Enable Button
	local enableButton = AceGUI:Create("Button")
	--enableButton:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMLEFT", 10, 10)
	enableButton:SetText(U["Weights"])
	enableButton:SetAutoWidth(true)
	enableButton:SetCallback("OnClick", _toggleEditorUI)
	AzeritePowerWeights.enableButton = enableButton

	-- Editor GUI
	AzeritePowerWeights.guiContainer = AzeritePowerWeights.CreateUI()
	--AzeritePowerWeights.guiContainer:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI, "TOPRIGHT", 10, 0)
	--AzeritePowerWeights.guiContainer:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMRIGHT", 10, 0)

	-- TreeGroup Hacks for QoL
	AzeritePowerWeights.treeGroup:SetCallback("OnGroupSelected", _SelectGroup)
	AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
	local statusTable = {}
	for i = 1, #AzeritePowerWeights.treeGroup.tree do
		statusTable[#statusTable + 1] = true
	end
	AzeritePowerWeights.treeGroup:SetStatusTable({
		groups = statusTable,
		treesizable = false,
		selected = ("%d\001%s"):format(1, "AzeritePowerWeightsImport")
	}) -- Expand groups

	-- Content Area
	AzeritePowerWeights:CreateImportGroup(AzeritePowerWeights.scalesScroll)

	-- Check if we have spec
	if not (playerSpecID and cfg and cfg.specScales[playerSpecID] and cfg.specScales[playerSpecID].scaleID) then
		_activeSpec()
	end
	-- Populate scoreData
	_populateWeights()
end

function f:UpdateValues() -- Update scores
	lock = nil
	if not (_G.AzeriteEmpoweredItemUI or _G.AzeriteEssenceUI) then return end

	if _G.AzeriteEmpoweredItemUI and _G.AzeriteEmpoweredItemUI:IsShown() then
		local currentScore, currentPotential, maxScore, currentLevel, maxLevel, midTrait = 0, 0, 0, 0, 0, 0
		local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
		if azeriteItemLocation then
			currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)
		end

		-- Update score strings and calculate current score
		while #activeStrings > 0 do
			local s = tremove(activeStrings)
			ReleaseString(s)
		end

		traitStack.scoreData = traitStack.scoreData or {}
		wipe(traitStack.scoreData)

		local container = _G.AzeriteEmpoweredItemUI.ClipFrame.PowerContainerFrame
		local children = { container:GetChildren() }
		local frameTmp = "> Frames:"
		for _, frame in ipairs(children) do
			if frame and frame:IsShown() then

				local score = 0
				local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(frame.azeritePowerID)
				if powerInfo then
					score = scoreData[powerInfo.azeritePowerID] or scoreData[powerInfo.spellID] or 0
				end

				if frame.isSelected == true then
					currentScore = currentScore + score

					if powerInfo.azeritePowerID == 13 then -- Middle
						midTrait = midTrait + 1
					end
				end

				if currentLevel < frame.unlockLevel then
					score = GRAY_FONT_COLOR_CODE .. score .. FONT_COLOR_CODE_CLOSE
				end

				if not C_AzeriteEmpoweredItem.IsPowerAvailableForSpec(frame.azeritePowerID, playerSpecID) then -- Recolor unusable powers
					score = RED_FONT_COLOR_CODE .. score .. FONT_COLOR_CODE_CLOSE
				end
				frameTmp = frameTmp .. " " .. (frame.azeritePowerID or "?") .. ":" .. (scoreData[powerInfo.azeritePowerID] or "!") .. ":" .. (scoreData[frame.azeritePowerID] or "!")
				local s = AcquireString(frame, score)
				activeStrings[#activeStrings + 1] = s

				if powerInfo then
					traitStack.scoreData[#traitStack.scoreData + 1] = ("%s = %s"):format(tostring(powerInfo.azeritePowerID), tostring(score))
				end
			end
		end

		-- Calculate maxScore for the item
		local allTierInfo = _G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetAllTierInfo()
		if not allTierInfo then
			local itemID = _G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetItem():GetItemID()
			if not itemID then return end
			allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemID)
		end

		--[[
			Dump: value=C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(158041)
			[1]={
				[1]={
					azeritePowerIDs={
						[1]=195,
						[2]=186,
						[3]=385,
						[4]=184
					},
					unlockLevel=10
				},
				[2]={
					azeritePowerIDs={
						[1]=218,
						[2]=83
					},
					unlockLevel=15
				},
				[3]={
					azeritePowerIDs={
						[1]=13
					},
					unlockLevel=20
				}
			}
		]]

		for tierIndex, tierInfo in ipairs(allTierInfo) do
			local maximum, tierMaximum = 0, 0
			local scoreTmp = "> Tier " .. tierIndex .. ":"
			for _, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
				local score = 0
				local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(azeritePowerID)
				if powerInfo then
					score = scoreData[powerInfo.azeritePowerID] or scoreData[powerInfo.spellID] or 0
				end

				if maximum < score then
					maximum = score
				end
				if tierInfo.unlockLevel <= currentLevel and tierMaximum < score then
					tierMaximum = score
				end
				scoreTmp = scoreTmp .. " " .. (azeritePowerID or "?") .. ":" .. (scoreData[powerInfo.azeritePowerID] or "!") .. ":" .. (scoreData[azeritePowerID] or "!")
			end

			maxScore = maxScore + maximum
			currentPotential = currentPotential + tierMaximum
			if maxLevel < tierInfo.unlockLevel then
				maxLevel = tierInfo.unlockLevel
			end
		end

		if currentLevel >= maxLevel then
			midTrait = midTrait + 1 -- 0 = Middle is locked, 1 = Middle is open, 2 = Middle is open and selected
			if midTrait == 1 then
			end
		else
		end

		local effectiveILvl = _G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetItem():GetCurrentItemLevel()
		if cfg.addILvlToScore and effectiveILvl then
			local middleTraitValue = midTrait == 1 and 5 or 0
			if cfg.scaleByAzeriteEmpowered then
				local azeriteEmpoweredWeight = scoreData and scoreData[13] or 0
				effectiveILvl = effectiveILvl / 5 * azeriteEmpoweredWeight -- Azerite Empowered is +5ilvl
				middleTraitValue = middleTraitValue / 5 * azeriteEmpoweredWeight
			end

			currentScore = currentScore + effectiveILvl + middleTraitValue
			currentPotential = currentPotential + effectiveILvl + middleTraitValue
			maxScore = maxScore + effectiveILvl + (midTrait == 2 and 0 or middleTraitValue)
		end

		local stats = GetItemStats(_G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetItem():GetItemLink())
		if cfg.addPrimaryStatToScore and stats then
			local statScore = stats["ITEM_MOD_AGILITY_SHORT"] or stats["ITEM_MOD_INTELLECT_SHORT"] or stats["ITEM_MOD_STRENGTH_SHORT"] or 0

			currentScore = currentScore + statScore
			currentPotential = currentPotential + statScore
			maxScore = maxScore + statScore
		end

		-- Integer or Float?
		local cS, cP, mS
		if _isInteger(currentScore) and _isInteger(currentPotential) and _isInteger(maxScore) then
			cS, cP, mS = currentScore, currentPotential, maxScore
		else
			local decimals = max(_getDecimals(currentScore), _getDecimals(currentPotential), _getDecimals(maxScore))
			cS = (currentScore == 0 and "%d" or ("%%.%df"):format(decimals)):format(currentScore)
			cP = (currentPotential == 0 and "%d" or ("%%.%df"):format(decimals)):format(currentPotential)
			mS = (maxScore == 0 and "%d" or ("%%.%df"):format(decimals)):format(maxScore)
		end

	local baseScore = format(U["PowersScoreString"], cS, cP, mS, currentLevel, maxLevel)

	local groupSet, _, _, scaleName = strsplit("/", cfg.specScales[playerSpecID].scaleID)
	--AzeritePowerWeights.string:SetText(format("%s\n%s", NORMAL_FONT_COLOR_CODE .. (cfg.specScales[playerSpecID].scaleName or U["ScaleName_Unknown"]) .. FONT_COLOR_CODE_CLOSE, baseScore))
	AzeritePowerWeights.string:SetText(format("%s\n%s", NORMAL_FONT_COLOR_CODE .. ((groupSet == "D" and (AzeritePowerWeights.defaultNameTable[scaleName] or cfg.specScales[playerSpecID].scaleName) or cfg.specScales[playerSpecID].scaleName) or U["ScaleName_Unknown"]) .. FONT_COLOR_CODE_CLOSE, baseScore))

		traitStack.scoreData.current = cS
		traitStack.scoreData.potential = cP
		traitStack.scoreData.maximum = mS

	elseif _G.AzeriteEssenceUI and _G.AzeriteEssenceUI:IsShown() then -- 8.2 Azerite Essences
		local currentScore, currentPotential, maxScore = 0, 0, 0

		-- Update score strings and calculate current score
		while #activeStrings > 0 do
			local s = tremove(activeStrings)
			ReleaseString(s)
		end

		essenceStack.scoreData = essenceStack.scoreData or {}
		wipe(essenceStack.scoreData)

		--[[
			AzeriteEssenceInfo
			Key			Type
			-------------------
			ID			number
			name		string
			rank		number
			unlocked	bool
			valid		bool
			icon		number
		]]--

		-- Draw scores on the Essences inside the scroll-frame
		local container = _G.AzeriteEssenceUI.EssenceList.ScrollChild
		local children = { container:GetChildren() }
		for _, frame in ipairs(children) do
			if frame and frame:IsShown() then -- There are 13 buttons, but you can fit only 12 on the screen at any given time or you end up with numbers hovering under or over the frame

				if frame.essenceID then
					local majorScore, minorScore = 0, 0

					local essenceInfo = C_AzeriteEssence.GetEssenceInfo(frame.essenceID)
					if essenceInfo then
						if essenceScoreData[essenceInfo.ID] then
							majorScore = essenceScoreData[essenceInfo.ID][1] or 0
							minorScore = essenceScoreData[essenceInfo.ID][2] or 0
						end
					end

					if not frame.majorString then
						--frame.majorString = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
						frame.majorString = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
						frame.majorString:SetPoint("TOPRIGHT", -2, -5)
					end
					frame.majorString:SetText(majorScore)

					if not frame.minorString then
						--frame.minorString = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
						frame.minorString = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
						frame.minorString:SetPoint("BOTTOMRIGHT", -2, 5)
					end
					frame.minorString:SetText(minorScore)

					if essenceInfo and not essenceInfo.valid then
						frame.majorString:SetText(RED_FONT_COLOR_CODE .. frame.majorString:GetText() .. FONT_COLOR_CODE_CLOSE)
						frame.minorString:SetText(RED_FONT_COLOR_CODE .. frame.minorString:GetText() .. FONT_COLOR_CODE_CLOSE)
					elseif essenceInfo and not essenceInfo.unlocked then
						frame.majorString:SetText(GRAY_FONT_COLOR_CODE .. frame.majorString:GetText() .. FONT_COLOR_CODE_CLOSE)
						frame.minorString:SetText(GRAY_FONT_COLOR_CODE .. frame.minorString:GetText() .. FONT_COLOR_CODE_CLOSE)
					end
				end

			end
		end

		--[[
			Major Slot
			---------------------
			milestoneID		115
			requiredLevel	0
			slot			0
			swirlScale		1

			canUnlock		false
			isDraggable		true
			isMajorSlot		true
			unlocked		true

			Minor Slot 1
			---------------------
			milestoneID		116
			requiredLevel	55
			slot			1
			swirlScale		1

			canUnlock		false
			isDraggable		false
			isMajorSlot		false
			unlocked		false

			Minor Slot 2
			---------------------
			milestoneID		117
			requiredLevel	65
			slot			2
			swirlScale		1

			canUnlock		false
			isDraggable		false
			isMajorSlot		false
			unlocked		false
		]]--
		local essences = C_AzeriteEssence.GetEssences()
		local tempMaxMajors, tempMaxMinors = {}, {}
		local tempPotMajors, tempPotMinors = {}, {}
		for i = 1, #essences do
			--[[
				[8]={
					valid=true,
					name="Nullification Dynamo",
					ID=13,
					icon=3015741,
					unlocked=false,
					rank=0
				},
			]]--
			local essence = essences[i]
			if essenceScoreData[essence.ID] then
				if essence.valid then
					tempMaxMajors[essence.ID] = essenceScoreData[essence.ID][1] or 0
					tempMaxMinors[essence.ID] = essenceScoreData[essence.ID][1] or 0

					if essence.unlocked then
						tempPotMajors[essence.ID] = essenceScoreData[essence.ID][1] or 0
						tempPotMinors[essence.ID] = essenceScoreData[essence.ID][1] or 0
					end
				end

				local majorS = essenceScoreData[essence.ID][1] or 0
				local minorS = essenceScoreData[essence.ID][2] or 0
				if not essence.unlocked then
					majorS = GRAY_FONT_COLOR_CODE .. majorS .. FONT_COLOR_CODE_CLOSE
					minorS = GRAY_FONT_COLOR_CODE .. minorS .. FONT_COLOR_CODE_CLOSE
				end

				essenceStack.scoreData[#essenceStack.scoreData + 1] = ("%s = %s/%s"):format(tostring(essence.ID), tostring(majorS), tostring(minorS))
			end
		end

		local milestones = C_AzeriteEssence.GetMilestones()
		local slots = 0
		for i = #milestones, 1, -1 do
			if milestones[i].ID == 117 and milestones[i].unlocked == true then -- Major + 2 Minor
				slots = 3
				break
			elseif milestones[i].ID == 116 and milestones[i].unlocked == true then -- Major + Minor
				slots = 2
				break
			elseif milestones[i].ID == 115 and milestones[i].unlocked == true then -- Major
				slots = 1
				break
			end
		end

		-- Find Maximum score
		local tempMax, tempMaxID = 0, 0
		local tempMiniMax = {}
		for essenceID, majorScore in pairs(tempMaxMajors) do -- Find maximum Major/Minor-score -combination
			local score = majorScore + tempMaxMinors[essenceID]
			if tempMax < score then
				tempMax = score
				tempMaxID = essenceID
			end
		end
		maxScore = maxScore + tempMax
		tempMaxMinors[tempMaxID] = nil -- Remove the top Major score's minor score
		-- Find top 2 maximum Minor scores from the rest by putting them into table and sorting them and picking first 2
		for _, minorScore in pairs(tempMaxMinors) do
			tempMiniMax[#tempMiniMax + 1] = minorScore
		end
		sort(tempMiniMax)
		local firstMax = tremove(tempMiniMax) or 0
		local secondMax = tremove(tempMiniMax) or 0
		maxScore = maxScore + firstMax + secondMax
		-- Find Potential score
		local tempPot, tempPotID = 0, 0
		local tempMiniPot = {}
		for essenceID, majorScore in pairs(tempPotMajors) do -- Find maximum Major/Minor-score -combination
			local score = majorScore + tempPotMinors[essenceID]
			if tempPot < score then
				tempPot = score
				tempPotID = essenceID
			end
		end
		currentPotential = currentPotential + tempPot
		tempPotMinors[tempPotID] = nil -- Remove the top Major score's minor score
		-- Find top 2 maximum Minor scores from the rest by putting them into table and sorting them and picking first 2
		for _, minorScore in pairs(tempPotMinors) do
			tempMiniPot[#tempMiniPot + 1] = minorScore
		end
		sort(tempMiniPot)
		local firstPot = tremove(tempMiniPot) or 0
		local secondPot = tremove(tempMiniPot) or 0

		if slots == 1 then
			--currentPotential = currentPotential -- Previously set Major slot's score
		elseif slots == 2 then
			currentPotential = currentPotential + firstPot
		elseif slots == 3 then
			currentPotential = currentPotential + firstPot + secondPot
		else -- Slots == 0
			currentPotential = 0
		end

		--[[
			maxScore: 10.5 10.5 7 3.5 25
			maxScore: 17.5 4 3
			currentPotential: 9 9 5 4 27
			currentPotential: 9 2 1 1
			currentScore: 7 7
		]]--

		-- Draw scores for the Essences in the main view of the UI
		local frameTmp = "> Frames:"
		essenceStack.scoreData[#essenceStack.scoreData + 1] = "---"
		for _, slotFrame in ipairs(_G.AzeriteEssenceUI.Slots) do
			local score = 0

			local essenceID = C_AzeriteEssence.GetMilestoneEssence(slotFrame.milestoneID)
			if essenceID then
				if essenceScoreData[essenceID] then
					if slotFrame.isMajorSlot then -- Major Slot
						score = (essenceScoreData[essenceID][1] or 0) + (essenceScoreData[essenceID][2] or 0)
					else -- Minor Slot
						score = essenceScoreData[essenceID][2] or 0
					end
				end

				currentScore = currentScore + score

				essenceStack.scoreData[#essenceStack.scoreData + 1] = ("%s = %s/%s"):format(tostring(essenceID), tostring(score), tostring(slotFrame.isMajorSlot))
			end

			frameTmp = frameTmp .. " " .. (slotFrame.milestoneID or "?") .. " " .. (slotFrame.requiredLevel or "?") .. " " .. (slotFrame.slot or "?") .. " " .. (slotFrame.swirlScale or "?") .. " " .. tostring(slotFrame.canUnlock) .. " " .. tostring(slotFrame.isDraggable) .. " " .. tostring(slotFrame.isMajorSlot) .. " " .. tostring(slotFrame.unlocked)

			if slotFrame.unlocked then
				local s = AcquireString(slotFrame, score)
				activeStrings[#activeStrings + 1] = s
			end
		end

		--AzeritePowerWeights.string:SetText("Cool")
		local currentLevel = _G.AzeriteEssenceUI.powerLevel or 0
		local maxLevel = milestones[#milestones].requiredLevel or 0

		-- Integer or Float?
		local cS, cP, mS
		if _isInteger(currentScore) and _isInteger(currentPotential) and _isInteger(maxScore) then
			cS, cP, mS = currentScore, currentPotential, maxScore
		else
			local decimals = max(_getDecimals(currentScore), _getDecimals(currentPotential), _getDecimals(maxScore))
			cS = (currentScore == 0 and "%d" or ("%%.%df"):format(decimals)):format(currentScore)
			cP = (currentPotential == 0 and "%d" or ("%%.%df"):format(decimals)):format(currentPotential)
			mS = (maxScore == 0 and "%d" or ("%%.%df"):format(decimals)):format(maxScore)
		end

		local baseScore = format(U["PowersScoreString"], cS, cP, mS, currentLevel, maxLevel)
		local groupSet, _, _, scaleName = strsplit("/", cfg.specScales[playerSpecID].scaleID)

		AzeritePowerWeights.string:SetText(format("%s\n%s", NORMAL_FONT_COLOR_CODE .. ((groupSet == "D" and (AzeritePowerWeights.defaultNameTable[scaleName] or cfg.specScales[playerSpecID].scaleName) or cfg.specScales[playerSpecID].scaleName) or U["ScaleName_Unknown"]) .. FONT_COLOR_CODE_CLOSE, baseScore))

		essenceStack.scoreData.current = cS
		essenceStack.scoreData.potential = cP
		essenceStack.scoreData.maximum = mS
		essenceStack.scoreData.slots = slots
	end
end

-- Item Tooltip & Hook - Hacked together and probably could be done better
local azeriteEmpoweredItemLocation = ItemLocation:CreateEmpty()
local itemEquipLocToSlot = {
	["INVTYPE_HEAD"] = 1,
	["INVTYPE_SHOULDER"] = 3,
	["INVTYPE_CHEST"] = 5,
	["INVTYPE_ROBE"] = 5
}

local function _getGearScore(dataPointer, itemEquipLoc)
	local currentLevel, maxLevel = 0, 0
	local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
	if azeriteItemLocation then
		currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)
	end

	local itemLink = GetInventoryItemLink("player", itemEquipLoc)
	
	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		local equipLocation = ItemLocation:CreateFromEquipmentSlot(itemEquipLoc)
		local allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemLink)

		local currentScore, currentPotential, maxScore, midTrait = 0, 0, 0, 0
		for tierIndex, tierInfo in ipairs(allTierInfo) do
			local maximum, tierMaximum = 0, 0
			for _, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
				local score = 0
				local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(azeritePowerID)
				if powerInfo then
					score = dataPointer[powerInfo.azeritePowerID] or dataPointer[powerInfo.spellID] or 0

					if equipLocation:HasAnyLocation() and C_AzeriteEmpoweredItem.IsPowerSelected(equipLocation, powerInfo.azeritePowerID) then
						currentScore = currentScore + score

						if powerInfo.azeritePowerID == 13 then -- Middle
							midTrait = midTrait + 1
						end
					end
				end
				
				if maximum < score then
					maximum = score
				end
				if tierInfo.unlockLevel <= currentLevel and tierMaximum < score then
					tierMaximum = score
				end
			end

			maxScore = maxScore + maximum
			currentPotential = currentPotential + tierMaximum
			if maxLevel < tierInfo.unlockLevel then
				maxLevel = tierInfo.unlockLevel
			end
		end

		if currentLevel >= maxLevel then
			midTrait = midTrait + 1 -- 0 = Middle is locked, 1 = Middle is open, 2 = Middle is open and selected
			if midTrait == 1 then
			end
		else
		end

		return currentScore, currentPotential, maxScore, itemLink, midTrait
	end

	return 0, 0, 0, itemLink, 0
end

local tooltipTable = {}
local function _updateTooltip(tooltip, itemLink)
	local currentLevel, maxLevel = 0, 0
	local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
	if azeriteItemLocation then
		currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)
	end

	--if not tooltipTable.itemLink or tooltipTable.itemLink ~= itemLink then
		wipe(tooltipTable)
		tooltipTable.itemLink = itemLink
		tooltipTable.currentLevel = currentLevel
		tooltipTable.scores = {}
	--end
	local allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemLink)

	local currentScore, currentPotential, maxScore, scaleInfo, midTrait = {}, {}, {}, {}, {}
	for i, tooltipScale in ipairs(cfg.tooltipScales) do
		currentScore[i] = 0
		currentPotential[i] = 0
		maxScore[i] = 0
		scaleInfo[i] = {}
		midTrait[i] = 0

		tooltipTable[i] = tooltipTable[i] or {}
		tooltipTable[i].tooltipScale = tooltipScale.scaleID
		local dataPointer
		local groupSet, classID, specNum, scaleName = strsplit("/", tooltipScale.scaleID)
		if groupSet and classID and specNum and scaleName then
			classID = tonumber(classID)
			specNum = tonumber(specNum)
			for _, dataSet in ipairs(groupSet == "C" and customScales or AzeritePowerWeights.defaultScalesData) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
					dataPointer = dataSet[4]

					scaleInfo[i].class = classID
					if groupSet == "C" then
						local _, specName, _, iconID = GetSpecializationInfoByID(specNum)
						scaleInfo[i].icon = iconID
					else
						local _, specName, _, iconID = GetSpecializationInfoForClassID(classID, specNum)
						scaleInfo[i].icon = iconID
					end

					break
				end
			end
		end

		if dataPointer then
			for tierIndex, tierInfo in ipairs(allTierInfo) do

				tooltipTable[i][tierIndex] = tooltipTable[i][tierIndex] or {}
				tooltipTable[i][tierIndex].unlockLevel = tooltipTable[i][tierIndex].unlockLevel or tierInfo.unlockLevel

				local maximum, tierMaximum = 0, 0
				for _, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
					local score = 0
					local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(azeritePowerID)
					if powerInfo then
						score = dataPointer[powerInfo.azeritePowerID] or dataPointer[powerInfo.spellID] or 0

						tooltipTable[i][tierIndex][powerInfo.azeritePowerID] = score
						if azeriteEmpoweredItemLocation:HasAnyLocation() and C_AzeriteEmpoweredItem.IsPowerSelected(azeriteEmpoweredItemLocation, powerInfo.azeritePowerID) then
							currentScore[i] = currentScore[i] + score

							tooltipTable[i][tierIndex][powerInfo.azeritePowerID] = ">" .. score .. "<"
							if powerInfo.azeritePowerID == 13 then -- Middle
								midTrait[i] = midTrait[i] + 1
							end
						else
						end
					end
					
					if maximum < score then
						maximum = score
					end
					if tierInfo.unlockLevel <= currentLevel and tierMaximum < score then
						tierMaximum = score
					end
				end
				maxScore[i] = maxScore[i] + maximum
				currentPotential[i] = currentPotential[i] + tierMaximum
				if maxLevel < tierInfo.unlockLevel then
					maxLevel = tierInfo.unlockLevel
				end
			end
		end

		if currentLevel >= maxLevel then
			midTrait[i] = midTrait[i] + 1 -- 0 = Middle is locked, 1 = Middle is open, 2 = Middle is open and selected
			if midTrait[i] == 1 then
			end
		else
		end
		tooltipTable.scores[i] = tooltipTable.scores[i] or {}
		tooltipTable.scores[i].traitScore = currentScore[i]
		tooltipTable.scores[i].traitPotential = currentPotential[i]
		tooltipTable.scores[i].traitMax = maxScore[i]

		local _, _, _, _, _, _, _, _, itemEquipLoc = GetItemInfo(itemLink)
		local effectiveILvl = GetDetailedItemLevelInfo(itemLink)
		if cfg.addILvlToScore and effectiveILvl then
			local middleTraitValue = midTrait[i] == 1 and 5 or 0
			if cfg.scaleByAzeriteEmpowered then
				local azeriteEmpoweredWeight = dataPointer and dataPointer[13] or 0
				effectiveILvl = effectiveILvl / 5 * azeriteEmpoweredWeight -- Azerite Empowered is +5ilvl
				middleTraitValue = middleTraitValue / 5 * azeriteEmpoweredWeight
			end

			currentScore[i] = currentScore[i] + effectiveILvl + middleTraitValue
			currentPotential[i] = currentPotential[i] + effectiveILvl + middleTraitValue
			maxScore[i] = maxScore[i] + effectiveILvl + (midTrait[i] == 2 and 0 or middleTraitValue)
			tooltipTable.scores[i].midTrait = midTrait[i]
			tooltipTable.scores[i].middleTraitValue = middleTraitValue
			tooltipTable.scores[i].ilvlScore = currentScore[i]
			tooltipTable.scores[i].ilvlPotential = currentPotential[i]
			tooltipTable.scores[i].ilvlMax = maxScore[i]
		end

		tooltipTable.scores.effectiveILvl = effectiveILvl
		local stats = GetItemStats(itemLink)
		if cfg.addPrimaryStatToScore and stats then
			local statScore = stats["ITEM_MOD_AGILITY_SHORT"] or stats["ITEM_MOD_INTELLECT_SHORT"] or stats["ITEM_MOD_STRENGTH_SHORT"] or 0

			currentScore[i] = currentScore[i] + statScore
			currentPotential[i] = currentPotential[i] + statScore
			maxScore[i] = maxScore[i] + statScore
			tooltipTable.scores[i].statAmount = statScore
			tooltipTable.scores[i].statScore = currentScore[i]
			tooltipTable.scores[i].statPotential = currentPotential[i]
			tooltipTable.scores[i].statMax = maxScore[i]
		end

		if cfg.relativeScore and dataPointer then
			local equippedScore, equippedPotential, equippedMax, equippedItemLink, equippedMidTrait = _getGearScore(dataPointer, itemEquipLocToSlot[itemEquipLoc])

			local equippedEffectiveILvl = GetDetailedItemLevelInfo(equippedItemLink)
			tooltipTable.equippedItemLink = equippedItemLink
			tooltipTable.equippedEffectiveILvl = equippedEffectiveILvl
			tooltipTable.scores[i].relTraitScore = equippedScore
			tooltipTable.scores[i].relTraitPotential = equippedPotential
			tooltipTable.scores[i].relTraitMax = equippedMax
			if cfg.addILvlToScore and equippedEffectiveILvl then
				local middleTraitValue = equippedMidTrait == 1 and 5 or 0
				if cfg.scaleByAzeriteEmpowered then
					local azeriteEmpoweredWeight = dataPointer and dataPointer[13] or 0
					equippedEffectiveILvl = equippedEffectiveILvl / 5 * azeriteEmpoweredWeight -- Azerite Empowered is +5ilvl
					middleTraitValue = middleTraitValue / 5 * azeriteEmpoweredWeight
				end

				equippedScore = equippedScore + equippedEffectiveILvl + middleTraitValue
				equippedPotential = equippedPotential + equippedEffectiveILvl + middleTraitValue
				equippedMax = equippedMax + equippedEffectiveILvl + (equippedMidTrait == 2 and 0 or middleTraitValue)
				tooltipTable.scores[i].relMidTrait = equippedMidTrait
				tooltipTable.scores[i].relMiddleTraitValue = middleTraitValue
				tooltipTable.scores[i].relIlvlScore = equippedScore
				tooltipTable.scores[i].relIlvlPotential = equippedPotential
				tooltipTable.scores[i].relIlvlMax = equippedMax
			end

			local equippedStats = GetItemStats(equippedItemLink)
			if cfg.addPrimaryStatToScore and equippedStats then
				local statScore = equippedStats["ITEM_MOD_AGILITY_SHORT"] or equippedStats["ITEM_MOD_INTELLECT_SHORT"] or equippedStats["ITEM_MOD_STRENGTH_SHORT"] or 0
				equippedScore = equippedScore + statScore
				equippedPotential = equippedPotential + statScore
				equippedMax = equippedMax + statScore
				tooltipTable.scores[i].relStatAmount = statScore
				tooltipTable.scores[i].relStatScore = equippedScore
				tooltipTable.scores[i].relStatPotential = equippedPotential
				tooltipTable.scores[i].relStatMax = equippedMax
			end

			currentScore[i] = equippedScore == 0 and 0 or floor((currentScore[i] / equippedScore - 1) * 100 + .5)
			currentPotential[i] = equippedPotential == 0 and 0 or floor((currentPotential[i] / equippedPotential - 1) * 100 + .5)
			maxScore[i] = equippedMax == 0 and 0 or floor((maxScore[i] / equippedMax - 1) * 100 + .5)
		end
	end

	--tooltip:AddLine(" \n".."AzeritePowerWeights")
	local tooltipLine = ""  --" \n" .. "AzeritePowerWeights" .. "\n"
	--if cfg.showTooltipLegend then
		--tooltipLine = tooltipLine .. HIGHLIGHT_FONT_COLOR_CODE .. U["ItemToolTip_Legend"] .. FONT_COLOR_CODE_CLOSE .. "\n"
	--end
	local showTooltipLine = false

	for i = 1, #maxScore do
		if scaleInfo[i].class then
			local _, classTag = GetClassInfo(scaleInfo[i].class)
			local c = _G.RAID_CLASS_COLORS[classTag]

			local string = "|T%d:0|t |c%s%s|r: "
			if cfg.relativeScore then -- Relative score
				string = string .. ("%s%%d%s%s"):format(currentScore[i] < 0 and RED_FONT_COLOR_CODE or GREEN_FONT_COLOR_CODE .. "+", "%%", FONT_COLOR_CODE_CLOSE)
				string = string .. " / "
				string = string .. ("%s%%d%s%s"):format(currentPotential[i] < 0 and RED_FONT_COLOR_CODE or GREEN_FONT_COLOR_CODE .. "+", "%%", FONT_COLOR_CODE_CLOSE)
				string = string .. " / "
				string = string .. ("%s%%d%s%s"):format(maxScore[i] < 0 and RED_FONT_COLOR_CODE or GREEN_FONT_COLOR_CODE .. "+", "%%", FONT_COLOR_CODE_CLOSE)
			elseif _isInteger(currentScore[i]) and _isInteger(currentPotential[i]) and _isInteger(maxScore[i]) then -- All integers
				string = string .. "%d / %d / %d"
			else -- There are some floats
				local decimals = max(_getDecimals(currentScore[i]), _getDecimals(currentPotential[i]), _getDecimals(maxScore[i]))
				--string = string .. ("%%.%df / %%.%df / %%.%df"):format(decimals, decimals, decimals)
				string = string .. (currentScore[i] == 0 and "%d" or ("%%.%df"):format(decimals))
				string = string .. " / "
				string = string .. (currentPotential[i] == 0 and "%d" or ("%%.%df"):format(decimals))
				string = string .. " / "
				string = string .. (maxScore[i] == 0 and "%d" or ("%%.%df"):format(decimals))
			end

			if not cfg.showOnlyUpgrades or cfg.showOnlyUpgrades and (currentScore[i] > 0 or currentPotential[i] > 0 or maxScore[i] > 0) then
				--tooltip:AddLine(format(string, scaleInfo[i].icon, c.colorStr, cfg.tooltipScales[i].scaleName, currentScore[i], currentPotential[i], maxScore[i]),  1, 1, 1)
				tooltipLine = tooltipLine .. format(string, scaleInfo[i].icon, c.colorStr, cfg.tooltipScales[i].scaleName, currentScore[i], currentPotential[i], maxScore[i]) .. "\n"
				showTooltipLine = true
			end
		end
	end

	--tooltip:AddLine(format(U["ItemToolTip_AzeriteLevel"], currentLevel, maxLevel))
	tooltipLine = tooltipLine .. format(U["ItemToolTip_AzeriteLevel"], currentLevel, maxLevel)
	if showTooltipLine then
		tooltip:AddLine(tooltipLine)
	end
	tooltip:Show() -- Make updates visible
end

-- Item from bags
hooksecurefunc(GameTooltip, "SetBagItem", function(self, ...) -- This can be called 4-5 times per second
	if not cfg or not cfg.tooltipScales then return end
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local bag, slot = ...
	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		azeriteEmpoweredItemLocation = ItemLocation:CreateFromBagAndSlot(bag, slot)

		_updateTooltip(self, itemLink)
	end
end)

-- Equipped item
hooksecurefunc(GameTooltip, "SetInventoryItem", function(self, ...) -- This can be called 4-5 times per second
	if not cfg or not cfg.tooltipScales then return end
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local unit, equipLoc = ... -- player 1 nil true
	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		azeriteEmpoweredItemLocation = ItemLocation:CreateFromEquipmentSlot(equipLoc)

		_updateTooltip(self, itemLink)
	end
end)

-- Any other item, EJ etc.
hooksecurefunc(GameTooltip, "SetHyperlink", function(self, ...)
	if not cfg or not cfg.tooltipScales then return end
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		_updateTooltip(self, itemLink)
	end
end)

-- Vendor item (https://wow.gamepedia.com/Widget_API)
hooksecurefunc(GameTooltip, "SetMerchantItem", function(self, ...) -- ... = merchantSlot
	if not cfg or not cfg.tooltipScales then return end
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		--azeriteEmpoweredItemLocation = ItemLocation:CreateFromBagAndSlot(bag, slot) -- WTH have I been thinking or have I just been copy&pasting?

		_updateTooltip(self, itemLink)
	end
end)

-- Comparison tooltip for Vendor items (https://www.townlong-yak.com/framexml/27602/GameTooltip.lua#490)
hooksecurefunc(GameTooltip.shoppingTooltips[1], "SetCompareItem", function(self, ...) -- ... = ShoppingTooltip2, GameTooltip
	if not cfg or not cfg.tooltipScales then return end
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		local _, _, _, _, _, _, _, _, itemEquipLoc = GetItemInfo(itemLink)
		azeriteEmpoweredItemLocation = ItemLocation:CreateFromEquipmentSlot(itemEquipLocToSlot[itemEquipLoc])

		_updateTooltip(self, itemLink)
	end
end)

-- Comparison tooltip for WQ items (https://github.com/phanx-wow/PhanxBorder/blob/master/Blizzard.lua#L205)
-- WorldmapTooltip is being deprecated in 8.1.5. GameTooltip should be used instead. (https://www.wowinterface.com/forums/showthread.php?t=56964)
--[[
hooksecurefunc(WorldMapCompareTooltip1, "SetCompareItem", function(self, ...) -- ... = WorldMapCompareTooltip2, WorldMapTooltipTooltip
	if not cfg or not cfg.tooltipScales then return end
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		local _, _, _, _, _, _, _, _, itemEquipLoc = GetItemInfo(itemLink)
		azeriteEmpoweredItemLocation = ItemLocation:CreateFromEquipmentSlot(itemEquipLocToSlot[itemEquipLoc])

		_updateTooltip(self, itemLink)
	end
end)
]]

-- World Quest rewards (https://www.townlong-yak.com/framexml/27547/GameTooltip.lua#925)
hooksecurefunc("EmbeddedItemTooltip_SetItemByQuestReward", function(self, questLogIndex, questID)
	if not cfg or not cfg.tooltipScales then return end
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local iName, itemTexture, quantity, quality, isUsable, itemID = GetQuestLogRewardInfo(questLogIndex, questID)
	--[[if not itemID or type(itemID) ~= "number" then return end
	local itemName, itemLink = GetItemInfo(itemID)
	if not itemName then return end]]

	-- Fix for GetItemInfo(itemID) returning the base item instead of the properly upgraded item for better geared characters.
	-- This also fixes the missing rings (3 rings vs 5 rings) from calculations for those items.
	if not (iName and itemTexture) then return end
	local itemName, itemLink = self.Tooltip:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		--[[local item = Item:CreateFromItemLink(itemLink) -- Try to cache the item for real itemlevel
		item:ContinueOnItemLoad(function()
			_updateTooltip(self.Tooltip, itemLink)
		end)]]
		_updateTooltip(self.Tooltip, itemLink)
	end
end)

GameTooltip:HookScript("OnHide", function()
	azeriteEmpoweredItemLocation:Clear()
end)

-- Quest rewards (https://www.townlong-yak.com/framexml/27602/QuestInfo.lua#964)
hooksecurefunc(GameTooltip, "SetQuestItem", function(self, ...) -- ... = type, ID
	if not cfg or not cfg.tooltipScales then return end
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		_updateTooltip(self, itemLink)
	end
end)


-- Event functions
function f:ADDON_LOADED(event, addon)
	if addon == "_ShiGuang" then
		AzeritePowerWeightsDB = initDB(AzeritePowerWeightsDB, dbDefaults)
		db = AzeritePowerWeightsDB

		local playerName = UnitName("player")
		local playerRealm = GetRealmName()

		if db.dbVersion == 1 then -- Changing default-setting for all users because the old system wasn't clear enough for some users.
			for rName, rData in pairs(db.char) do
				for pName, pData in pairs(rData) do
					db.char[rName][pName].rolePowersNoOffRolePowers = false
				end
			end
			db.dbVersion = 2
		end

		if db.dbVersion == 2 then -- Add Azerite Essences to the Custom-scales
			for _, scale in pairs(db.customScales) do
				if type(scale[5]) ~= "table" then -- Old scale, update it with inserting Essence-table and bumping everything else down a notch
					tinsert(scale, 5, {})
				end
			end
			db.dbVersion = 3
		end

		db.char[playerRealm] = db.char[playerRealm] or {}
		db.char[playerRealm][playerName] = initDB(db.char[playerRealm][playerName], charDefaults)

		customScales = db.customScales
		cfg = db.char[playerRealm][playerName]

		self:RegisterEvent("PLAYER_LOGIN")
		self:RegisterEvent("AZERITE_ITEM_POWER_LEVEL_CHANGED")
		self:RegisterEvent("AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED")
		self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
		self:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")

		playerClassID = select(3, UnitClass("player"))
		for i = 1, GetNumSpecializationsForClassID(playerClassID) do
			local specID = GetSpecializationInfoForClassID(playerClassID, i)
			if
				not cfg.specScales[specID]
			or
				-- Localized Default-scalenames were causing issues, trying to revert those to normal state
				(cfg.specScales[specID].scaleName == U["DefaultScaleName_Default"] or
				cfg.specScales[specID].scaleName == U["DefaultScaleName_Defensive"] or
				cfg.specScales[specID].scaleName == U["DefaultScaleName_Offensive"])
			or
				-- More checks for the above
				(select(3, strmatch(cfg.specScales[specID].scaleID, "D/(%d+)/(%d+)/(.+)")) == U["DefaultScaleName_Default"] or
				select(3, strmatch(cfg.specScales[specID].scaleID, "D/(%d+)/(%d+)/(.+)")) == U["DefaultScaleName_Defensive"] or
				select(3, strmatch(cfg.specScales[specID].scaleID, "D/(%d+)/(%d+)/(.+)")) == U["DefaultScaleName_Offensive"])
			then

				local scaleKey = AzeritePowerWeights.GetDefaultScaleSet(playerClassID, i)
				local _, _, _, defaultScaleName = strsplit("/", scaleKey)

				cfg.specScales[specID] = {
					scaleID = scaleKey,
					scaleName = defaultScaleName
				}
			end
		end

		--self:CreateOptions()

	elseif addon == "Blizzard_AzeriteUI" then
		-- Hook 'em & Cook 'em
		hooksecurefunc(_G.AzeriteEmpoweredItemUI, "UpdateTiers", delayedUpdate)
		--hooksecurefunc(_G.AzeriteEmpoweredItemUI, "Refresh", delayedUpdate)
		hooksecurefunc(_G.AzeriteEmpoweredItemUI, "OnItemSet", delayedUpdate)
		C_Timer.After(0, function() -- Fire on next frame instead of current frame
			delayedUpdate()
			_G.AzeriteEmpoweredItemUI:HookScript("OnShow", function()
				_setupStringAndEnableButton()
				delayedUpdate()
			end)
		end)
		self:HookAzeriteUI()

	elseif addon == "Blizzard_AzeriteEssenceUI" then
		-- Hook 'em & Cook 'em
		hooksecurefunc(_G.AzeriteEssenceUI, "RefreshMilestones", delayedUpdate)
		--hooksecurefunc(_G.AzeriteEssenceUI.EssenceList, "Update", delayedUpdate)
		hooksecurefunc(_G.AzeriteEssenceUI.EssenceList, "Refresh", delayedUpdate)
		--hooksecurefunc(_G.AzeriteEssenceUI.EssenceList, "CalculateScrollOffset", delayedUpdate)

		C_Timer.After(0, function() -- Fire on next frame instead of current frame
			delayedUpdate()
			_G.AzeriteEssenceUI:HookScript("OnShow", function()
				_setupStringAndEnableButton()
				delayedUpdate()
			end)
		end)
		self:HookAzeriteEssenceUI()
	end
end

function f:PLAYER_LOGIN(event)
	_activeSpec()

	if _G.AzeriteEmpoweredItemUI then
		self:HookAzeriteUI()
	end
end

function f:AZERITE_ITEM_POWER_LEVEL_CHANGED(event)
	delayedUpdate()
end

function f:AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED(event)
	delayedUpdate()
end

function f:PLAYER_EQUIPMENT_CHANGED(event, equipmentSlot, hasCurrent)
	if not azeriteSlots[equipmentSlot] then return end
	delayedUpdate()
end

function f:PLAYER_SPECIALIZATION_CHANGED(event, ...)
	_activeSpec()

	if _G.AzeriteEmpoweredItemUI then
		_populateWeights()
	end

	delayedUpdate()
end

-- Config
function f:RefreshConfig()
	delayedUpdate()
	if AzeritePowerWeights.treeGroup and AzeritePowerWeights.treeGroup.tree then
		AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
		AzeritePowerWeights.treeGroup:RefreshTree(true)

		local lastExists;
		for _, v in ipairs(AzeritePowerWeights.treeGroup.tree) do
			if v.value == lastOpenScale then
				lastExists = true
			end
		end

		AzeritePowerWeights.treeGroup:SelectByValue(lastExists and lastOpenScale or "AzeritePowerWeightsImport")
	end
end

-- Slash
SLASH_AZERITEPOWERWEIGHTS1 = "/azerite"
if U["Slash_Command"] and U["Slash_Command"] ~= "/azerite" then
	SLASH_AZERITEPOWERWEIGHTS2 = U["Slash_Command"]
end

local SlashHandlers = {
	["reset"] = function()
		wipe(AzeritePowerWeightsDB)

		f:ADDON_LOADED("ADDON_LOADED", "AzeritePowerWeights")
		if AzeritePowerWeights.treeGroup and AzeritePowerWeights.treeGroup.tree then
			AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
			AzeritePowerWeights.treeGroup:SelectByValue("AzeritePowerWeightsImport")
			AzeritePowerWeights.treeGroup:RefreshTree(true)
		end
		--ReloadUI()
	end,
	["ticket"] = function()
		local text = ("%s %s/%d/%s (%s)\nSettings: "):format("AzeritePowerWeights", "8.2.8", GetCVar("scriptErrors"), cfg.specScales[playerSpecID].scaleName or U["ScaleName_Unknown"], cfg.specScales[playerSpecID].scaleID)
		local first = true
		local skip = {
			["onlyOwnClassDefaults"] = false,
			["onlyOwnClassCustoms"] = false,
			["importingCanUpdate"] = true,
			["defensivePowers"] = false,
			["rolePowers"] = false,
			["rolePowersNoOffRolePowers"] = false,
			["zonePowers"] = false,
			["professionPowers"] = false,
			["pvpPowers"] = false,
			["addILvlToScore"] = true,
			["scaleByAzeriteEmpowered"] = true,
			["addPrimaryStatToScore"] = true,
			["relativeScore"] = true,
			["showOnlyUpgrades"] = true,
			["showTooltipLegend"] = true,
			["outlineScores"] = true,
			["specScales"] = true,
			["tooltipScales"] = true
		}
		for key, _ in pairs(charDefaults) do
			if not skip[key] then
				if first then
					first = false
					text = text .. ("%s: %s"):format(key, tostring(cfg[key]))
				else
					text = text .. (", %s: %s"):format(key, tostring(cfg[key]))
				end
			end
		end
		if AzeritePowerWeights.frame then
			text = text .. ("\nFrame: %s, %s, %s/%s, %s/%s"):format(tostring(AzeritePowerWeights.frame:GetParent():GetName()), tostring(AzeritePowerWeights.frame:IsShown()), tostring(AzeritePowerWeights.frame:GetFrameStrata()), tostring(AzeritePowerWeights.frame:GetParent():GetFrameStrata()), tostring(AzeritePowerWeights.frame:GetFrameLevel()), tostring(AzeritePowerWeights.frame:GetParent():GetFrameLevel()))
			text = text .. ("\nString: %s, %s"):format(tostring(AzeritePowerWeights.string:GetParent():GetParent():GetName()), tostring(AzeritePowerWeights.string:IsShown()))
			text = text .. ("\nButton: %s, %s, %s/%s, %s/%s"):format(tostring(AzeritePowerWeights.enableButton.frame:GetParent():GetParent():GetName() or AzeritePowerWeights.enableButton.frame:GetParent():GetParent():GetParent():GetName()), tostring(AzeritePowerWeights.enableButton.frame:IsShown()), tostring(AzeritePowerWeights.enableButton.frame:GetFrameStrata()), tostring(AzeritePowerWeights.enableButton.frame:GetParent():GetFrameStrata()), tostring(AzeritePowerWeights.enableButton.frame:GetFrameLevel()), tostring(AzeritePowerWeights.enableButton.frame:GetParent():GetFrameLevel()))
		end
		text = text .. ("\nTrait Scores:\nLoaded: %s, Editor: %s"):format(tostring(traitStack.loading), tostring(traitStack.editor))
		if traitStack.scoreData then
			first = true
			text = text .. ("\nC/P/M: %s / %s / %s"):format(tostring(traitStack.scoreData.current), tostring(traitStack.scoreData.potential), tostring(traitStack.scoreData.maximum))
			for _, v in ipairs(traitStack.scoreData) do
				if string.find(v, RED_FONT_COLOR_CODE) then
					v = v .. "R"
				elseif string.find(v, GRAY_FONT_COLOR_CODE) then
					v = v .. "G"
				end
				if first then
					first = false
					text = text .. ("\nNumbers: %s"):format(tostring(v))
				else
					text = text .. (", %s"):format(tostring(v))
				end
			end
		end
		text = text .. ("\nEssence Scores:\nLoaded: %s, Editor: %s"):format(tostring(essenceStack.loading), tostring(essenceStack.editor))
		if essenceStack.scoreData then
			first = true
			text = text .. ("\nC/P/M/Slots: %s / %s / %s / %s"):format(tostring(essenceStack.scoreData.current), tostring(essenceStack.scoreData.potential), tostring(essenceStack.scoreData.maximum), tostring(essenceStack.scoreData.slots))
			for _, v in ipairs(essenceStack.scoreData) do
				if string.find(v, RED_FONT_COLOR_CODE) then
					v = v .. "R"
				elseif string.find(v, GRAY_FONT_COLOR_CODE) then
					v = v .. "G"
				end
				if first then
					first = false
					text = text .. ("\nNumbers: %s"):format(tostring(v))
				else
					text = text .. (", %s"):format(tostring(v))
				end
			end
		end

	end,
	["tt"] = function(...) -- Get tooltip stuff
		local text = string.format("> START\n- - - - - - - - - -\nVer. %s\nClass/Spec: %s / %s\nScale: %s (%s)\n- - - - - - - - - -\n", "8.2.8", playerClassID, playerSpecID, cfg.specScales[playerSpecID].scaleName or U["ScaleName_Unknown"], cfg.specScales[playerSpecID].scaleID)

		text = text .. string.format("Score settings:\naddILvlToScore: %s\nscaleByAzeriteEmpowered: %s\naddPrimaryStatToScore: %s\nrelativeScore: %s\nshowOnlyUpgrades: %s\nshowTooltipLegend: %s\n- - - - - - - - - -\n", tostring(cfg.addILvlToScore), tostring(cfg.scaleByAzeriteEmpowered), tostring(cfg.addPrimaryStatToScore), tostring(cfg.relativeScore), tostring(cfg.showOnlyUpgrades), tostring(cfg.showTooltipLegend))

		if tooltipTable.itemLink then
			local _, id = strsplit(":", tooltipTable.itemLink)
			local itemID = tonumber(id) or -1

			text = text .. string.format("HoA level: %s\n\nTooltip:\nItem: %s (%s)\nItemlink: %s\nEffective ilvl: %d\nTraits and scores:\n", tooltipTable.currentLevel or "", tooltipTable.itemLink or "", itemID, string.gsub(tooltipTable.itemLink or "", "\124", "\124\124"), tooltipTable.scores and tooltipTable.scores.effectiveILvl or -1)

			for i, v in ipairs(tooltipTable) do
				text = text .. string.format("> Scale %d: %s\n", i, v.tooltipScale)

				for tierIndex, w in ipairs(v) do
					text = text .. string.format("   T%d (%d):\n     ", tierIndex, w.unlockLevel or -1)

					for azeritePowerID, score in pairs(w) do
						if type(azeritePowerID) == "number" then -- skip "unlockLevel"
							text = text .. string.format(" %d = %s ", azeritePowerID, tostring(score or -1))
						end
					end

					text = text .. "\n"
				end

				if tooltipTable.scores then
					text = text .. string.format("\nTrait Score: %s / %s / %s\n\n" , tostring(tooltipTable.scores[i].traitScore or ""), tostring(tooltipTable.scores[i].traitPotential or ""), tostring(tooltipTable.scores[i].traitMax or ""))

					if cfg.addILvlToScore then
						text = text .. string.format("Ilvl Score: %s / %s / %s\nMiddle Trait: %s (%d)\n\n" , tostring(tooltipTable.scores[i].ilvlScore or ""), tostring(tooltipTable.scores[i].ilvlPotential or ""), tostring(tooltipTable.scores[i].ilvlMax or ""), tostring(tooltipTable.scores[i].middleTraitValue or ""), tooltipTable.scores[i].midTrait or -1)
					end

					if cfg.addPrimaryStatToScore then
						text = text .. string.format("Stat Score: %s / %s / %s\nStat value: %d\n\n" , tostring(tooltipTable.scores[i].statScore or ""), tostring(tooltipTable.scores[i].statPotential or ""), tostring(tooltipTable.scores[i].statMax or ""), tooltipTable.scores[i].statAmount or -1)
					end
				end
			end
			text = text .. "- - - - - - - - - -\n"
		end

		if tooltipTable.equippedItemLink then
			if tooltipTable.itemLink and tooltipTable.itemLink ~= tooltipTable.equippedItemLink then
				local _, eid = strsplit(":", tooltipTable.equippedItemLink)
				local eItemID = tonumber(eid) or -1

				text = text .. string.format("Equipped for relative scores:\nItem: %s (%s)\nItemlink: %s\nEffective ilvl: %d\nTraits and scores:\n", tooltipTable.equippedItemLink or "", eItemID, string.gsub(tooltipTable.equippedItemLink or "", "\124", "\124\124"), tooltipTable.equippedEffectiveILvl or -1)

				for i, v in ipairs(tooltipTable) do
					text = text .. string.format("> Scale %d: %s\n", i, v.tooltipScale)

					if tooltipTable.scores then
						text = text .. string.format("Trait Score: %s / %s / %s\n\n" , tostring(tooltipTable.scores[i].relTraitScore or ""), tostring(tooltipTable.scores[i].relTraitPotential or ""), tostring(tooltipTable.scores[i].relTraitMax or ""))

						if cfg.addILvlToScore then
							text = text .. string.format("Ilvl Score: %s / %s / %s\nMiddle Trait: %s (%d)\n\n" , tostring(tooltipTable.scores[i].relIlvlScore or ""), tostring(tooltipTable.scores[i].relIlvlPotential or ""), tostring(tooltipTable.scores[i].relIlvlMax or ""), tostring(tooltipTable.scores[i].relMiddleTraitValue or ""), tooltipTable.scores[i].relMidTrait or -1)
						end

						if cfg.addPrimaryStatToScore then
							text = text .. string.format("Stat Score: %s / %s / %s\nStat value: %d\n\n" , tostring(tooltipTable.scores[i].relStatScore or ""), tostring(tooltipTable.scores[i].relStatPotential or ""), tostring(tooltipTable.scores[i].relStatMax or ""), tooltipTable.scores[i].relStatAmount or -1)
						end
					end
				end
			elseif not tooltipTable.itemLink then
				text = text .. "Equipped for relative scores:\nItem: Not found!\n"
			else
				text = text .. "Equipped for relative scores:\nItem: Same as in tooltip!\n"
			end

			text = text .. "- - - - - - - - - -\n"
		end

		text = text .. "> END"

	end,
	["is"] = function()
		local text = string.join("\n", ("> START\nVer. %s"):format("8.2.8"), unpack(importStack))
	end,
	["bang"] = function(...)
		local number = tonumber(...)
		Print("Bang:", number)
	end,
	["data"] = function()
		Print("Data check start")
		local numSpecs = {
			[1] = 3+1, -- Warrior (+1 for TMI)
			[2] = 3+1-1, -- Paladin (+1 for TMI, -1 for Holy)
			[3] = 3, -- Hunter
			[4] = 3, -- Rogue
			[5] = 3+1-2-1, -- Priest (+1 for Disc Off, -2 for Disc and Disc Off, -1 for Holy)
			[6] = 3+1, -- Death Knight (+1 for TMI)
			[7] = 3+1-1, -- Shaman (+1 for Resto Off, -1 for Resto)
			[8] = 3, -- Mage
			[9] = 3, -- Warlock
			[10] = 3+1-1, -- Monk (+1 for TMI, -1 for MW)
			[11] = 4+1-1, -- Druid (+1 for TMI, -1 for Resto)
			[12] = 2+1, -- Demon Hunter (+1 for TMI)
		}
		for _, v in ipairs(AzeritePowerWeights.defaultScalesData) do
			numSpecs[v[2]] = numSpecs[v[2]] - 1
		end
		for k, v in ipairs(numSpecs) do
			if v ~= 0 then
				Print("!!!", k, v)
			end
		end
		Print("Data check end")
	end,
	["test"] = function(...) -- To test new features
		Print("TEST")
	end,
}

local shouldKnowAboutConfig
SlashCmdList["AZERITEPOWERWEIGHTS"] = function(text)
	local command, params = strsplit(" ", text, 2)

	if SlashHandlers[command] then
		SlashHandlers[command](params)
	else
		if not shouldKnowAboutConfig then
			Print(U["Slash_RemindConfig"], "AzeritePowerWeights")
			shouldKnowAboutConfig = true
		end
		if not AzeritePowerWeights.guiContainer then
			if not _G.AzeriteEmpoweredItemUI then
				local loaded, reason = LoadAddOn("Blizzard_AzeriteUI")
				if loaded then
					_toggleEditorUI()
				else
					Print(U["Slash_Error_Unkown"])
				end
			end
		else
			_toggleEditorUI()
		end
	end
end

--#EOF
