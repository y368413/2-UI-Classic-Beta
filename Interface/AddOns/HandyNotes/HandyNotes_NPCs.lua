local name, data = ...

local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local Addon = LibStub("AceAddon-3.0"):NewAddon("HandyNotes_NPCs", "AceConsole-3.0", "AceEvent-3.0")
local Search, AltRecipes -- Modules
local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes")
local LibQTip = LibStub('LibQTip-1.0')

data["nodes"] = { }
local nodes = data["nodes"]

nodes[1452] = {
	[61403720] = {
		name = L["Auctioneer Grizzlin"],
		category = "auctioneers",
		faction = "Neutral",
	},
	[61403700] = {
		name = L["Izzy Coppergrab"],
		category = "bankers",
		description = L["Banker"],
		faction = "Neutral",
	},
	[62203660] = {
		name = L["Maethrya"],
		category = "flightmasters",
		fpName = L["Everlook, Winterspring"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[60403640] = {
		name = L["Yugrek"],
		category = "flightmasters",
		fpName = L["Everlook, Winterspring"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[61203880] = {
		name = L["Innkeeper Vizzie"],
		npcID = 11118,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Neutral",
	},
	[61303860] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Neutral",
	},
	[61603780] = {
		name = L["Nixxrak"],
		npcID = 11182,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Neutral",
	},
	[61603785] = {
		name = L["Blixxrak"],
		npcID = 11183,
		category = "vendors",
		description = L["Light Armor Merchant"],
		faction = "Neutral",
	},
	[61603800] = {
		name = L["Wixxrak"],
		npcID = 11184,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Weaponsmith & Gunsmith"],
		faction = "Neutral",
	},
	[61203480] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[60403800] = {
		name = L["Azzleby"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Neutral",
	},
	[51403080] = {
		name = L["Natheril Raincaller"],
		npcID = 2084,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Alliance",
	},
	[52002920] = {
		name = L["Lyranne Feathersong"],
		npcID = 2303,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Alliance",
	},
	[51602980] = {
		name = L["Syurana"],
		npcID = 3779,
		category = "vendors",
		description = L["Trade Goods Supplies"],
		faction = "Alliance",
	},
	[60803860] = {
		name = L["Xizzer Fizzbolt"],
		npcID = 11185,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Neutral",
	},
	[61803860] = {
		name = L["Lunnix Sprocketslip"],
		npcID = 11186,
		category = "vendors",
		profession = "mining",
		description = L["Mining Supplies"],
		faction = "Neutral",
	},
	[61203900] = {
		name = L["Himmik"],
		npcID = 11187,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Neutral",
	},
	[60803780] = {
		name = L["Evie Whirlbrew"],
		npcID = 11188,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Neutral",
	},
	[61203720] = {
		name = L["Qia"],
		npcID = 11189,
		category = "vendors",
		description = L["Trade Goods Supplies"],
		faction = "Neutral",
	},
	[30203780] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[30604660] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[30803740] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[31003800] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[31603740] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[44003720] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[44603720] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[63606980] = {
		name = L["Kashoch the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[67003740] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[67403760] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[67803720] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[68003780] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[68603800] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[49801160] = {
		name = L["Rak'shiri"],
		category = "rares",
		faction = "Neutral",
	},
	[54601260] = {
		name = L["Rak'shiri"],
		category = "rares",
		faction = "Neutral",
	},
	[60403820] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[30203880] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[30604580] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[40203660] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[66603560] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[57803660] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[57804300] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[63404240] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[54405120] = {
		name = L["General Colbatann"],
		category = "rares",
		faction = "Neutral",
	},
	[55404920] = {
		name = L["General Colbatann"],
		category = "rares",
		faction = "Neutral",
	},
	[57405000] = {
		name = L["General Colbatann"],
		category = "rares",
		faction = "Neutral",
	},
	[59404860] = {
		name = L["General Colbatann"],
		category = "rares",
		faction = "Neutral",
	},
	[30404600] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[39003700] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[40003760] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[45203760] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[62006920] = {
		name = L["Kashoch the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[62806980] = {
		name = L["Kashoch the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[67203760] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[68403540] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[68603600] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[68603820] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[60403920] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[62604140] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[64004180] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[64604240] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[64604860] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[66004980] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[66804800] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[66805060] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[30404620] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[45403880] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[54805120] = {
		name = L["General Colbatann"],
		category = "rares",
		faction = "Neutral",
	},
	[58004940] = {
		name = L["General Colbatann"],
		category = "rares",
		faction = "Neutral",
	},
	[61204940] = {
		name = L["General Colbatann"],
		category = "rares",
		faction = "Neutral",
	},
	[31004560] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[63006880] = {
		name = L["Kashoch the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[63207000] = {
		name = L["Kashoch the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[67003560] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Horde",
	},
	[67403500] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Horde",
	},
	[49401880] = {
		name = L["Rak'shiri"],
		category = "rares",
		faction = "Neutral",
	},
	[49600800] = {
		name = L["Rak'shiri"],
		category = "rares",
		faction = "Neutral",
	},
	[52601440] = {
		name = L["Rak'shiri"],
		category = "rares",
		faction = "Neutral",
	},
	[55601400] = {
		name = L["Rak'shiri"],
		category = "rares",
		faction = "Neutral",
	},
	[57201480] = {
		name = L["Rak'shiri"],
		category = "rares",
		faction = "Neutral",
	},
	[54408700] = {
		name = L["Lady Hederine"],
		category = "rares",
		faction = "Neutral",
	},
	[54805080] = {
		name = L["General Colbatann"],
		category = "rares",
		faction = "Neutral",
	},
	[60004900] = {
		name = L["General Colbatann"],
		category = "rares",
		faction = "Neutral",
	},
	[30203920] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[39803660] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[45003640] = {
		name = L["Mezzir the Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[68403800] = {
		name = L["Grizzle Snowpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[51408440] = {
		name = L["Lady Hederine"],
		category = "rares",
		faction = "Neutral",
	},
	[54008660] = {
		name = L["Lady Hederine"],
		category = "rares",
		faction = "Neutral",
	},
	[63608100] = {
		name = L["Lady Hederine"],
		category = "rares",
		faction = "Neutral",
	},
	[65008020] = {
		name = L["Lady Hederine"],
		category = "rares",
		faction = "Neutral",
	},
	[56004640] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[58004840] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[61804120] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[63005740] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[63404180] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[65604340] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
	[66604740] = {
		name = L["Azurous"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1446] = {
	[52002960] = {
		name = L["Auctioneer Beardo"],
		category = "auctioneers",
		faction = "Neutral",
	},
	[52202880] = {
		name = L["Gimblethorn"],
		category = "bankers",
		description = L["Banker"],
		faction = "Neutral",
	},
	[52202885] = {
		name = L["Qizzik"],
		category = "bankers",
		description = L["Banker"],
		faction = "Neutral",
	},
	[51002920] = {
		name = L["Bera Stonehammer"],
		category = "flightmasters",
		fpName = L["Gadgetzan, Tanaris"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[51602540] = {
		name = L["Bulkrek Ragefist"],
		category = "flightmasters",
		fpName = L["Gadgetzan, Tanaris"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[52402780] = {
		name = L["Innkeeper Fizzgrimble"],
		npcID = 7733,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Neutral",
	},
	[52302780] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Neutral",
	},
	[51402880] = {
		name = L["Krinkle Goodsteel"],
		npcID = 5411,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Neutral",
	},
	[50802760] = {
		name = L["Wrinkle Goodsteel"],
		npcID = 8129,
		category = "repair",
		description = L["Superior Armor Crafter"],
		faction = "Neutral",
	},
	[50802765] = {
		name = L["Blizrik Buckshot"],
		npcID = 8131,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["Gunsmith"],
		faction = "Neutral",
	},
	[54002880] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[52202800] = {
		name = L["Laziphus"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Neutral",
	},
	[52402720] = {
		name = L["Nixx Sprocketspring"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Master Goblin Engineer"],
		faction = "Neutral",
	},
	[51002800] = {
		name = L["Pikkle"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Miner"],
		faction = "Neutral",
	},
	[52202760] = {
		name = L["Buzzek Bracketswing"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Master Engineer"],
		faction = "Neutral",
	},
	[50802700] = {
		name = L["Alchemist Pestlezugg"],
		npcID = 5594,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Neutral",
	},
	[51002740] = {
		name = L["Vizzklick"],
		npcID = 6568,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Neutral",
	},
	[51802860] = {
		name = L["Marin Noggenfogger"],
		npcID = 7564,
		category = "vendors",
		faction = "Neutral",
	},
	[52602800] = {
		name = L["Dirge Quikcleave"],
		npcID = 8125,
		category = "vendors",
		description = L["Butcher"],
		faction = "Neutral",
	},
	[66602200] = {
		name = L["Gikkix"],
		npcID = 8137,
		category = "vendors",
		description = L["Fisherman"],
		faction = "Neutral",
	},
	[67002200] = {
		name = L["Jabbey"],
		npcID = 8139,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Neutral",
	},
	[39007360] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[41207300] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[48406520] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[40607240] = {
		name = L["Cyclok the Mad"],
		category = "rares",
		faction = "Neutral",
	},
	[72404680] = {
		name = L["Kregg Keelhaul"],
		category = "rares",
		faction = "Neutral",
	},
	[74804740] = {
		name = L["Kregg Keelhaul"],
		category = "rares",
		faction = "Neutral",
	},
	[75604540] = {
		name = L["Kregg Keelhaul"],
		category = "rares",
		faction = "Neutral",
	},
	[34804320] = {
		name = L["Soriid the Devourer"],
		category = "rares",
		faction = "Neutral",
	},
	[56607200] = {
		name = L["Haarka the Ravenous"],
		category = "rares",
		faction = "Neutral",
	},
	[57006880] = {
		name = L["Haarka the Ravenous"],
		category = "rares",
		faction = "Neutral",
	},
	[42003440] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[46403300] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[47003780] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[47203900] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[49403480] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[50403940] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[54403260] = {
		name = L["Murderous Blisterpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[42202260] = {
		name = L["Jin'Zallah the Sandbringer"],
		category = "rares",
		faction = "Neutral",
	},
	[38805060] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[39205860] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[39405000] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[44806620] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[48406560] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[74404740] = {
		name = L["Kregg Keelhaul"],
		category = "rares",
		faction = "Neutral",
	},
	[74804760] = {
		name = L["Kregg Keelhaul"],
		category = "rares",
		faction = "Neutral",
	},
	[33204320] = {
		name = L["Soriid the Devourer"],
		category = "rares",
		faction = "Neutral",
	},
	[40402840] = {
		name = L["Warleader Krazzilak"],
		category = "rares",
		faction = "Neutral",
	},
	[42402300] = {
		name = L["Warleader Krazzilak"],
		category = "rares",
		faction = "Neutral",
	},
	[42602440] = {
		name = L["Warleader Krazzilak"],
		category = "rares",
		faction = "Neutral",
	},
	[43002280] = {
		name = L["Warleader Krazzilak"],
		category = "rares",
		faction = "Neutral",
	},
	[43002540] = {
		name = L["Warleader Krazzilak"],
		category = "rares",
		faction = "Neutral",
	},
	[40602900] = {
		name = L["Jin'Zallah the Sandbringer"],
		category = "rares",
		faction = "Neutral",
	},
	[45006420] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[72204600] = {
		name = L["Kregg Keelhaul"],
		category = "rares",
		faction = "Horde",
	},
	[54607320] = {
		name = L["Haarka the Ravenous"],
		category = "rares",
		faction = "Neutral",
	},
	[44203620] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[47603900] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[51603880] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[41805180] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[48603160] = {
		name = L["Murderous Blisterpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[55003340] = {
		name = L["Murderous Blisterpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[42402320] = {
		name = L["Warleader Krazzilak"],
		category = "rares",
		faction = "Neutral",
	},
	[42207520] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[48206700] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[48806520] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[46406540] = {
		name = L["Cyclok the Mad"],
		category = "rares",
		faction = "Neutral",
	},
	[76204560] = {
		name = L["Kregg Keelhaul"],
		category = "rares",
		faction = "Horde",
	},
	[32604400] = {
		name = L["Soriid the Devourer"],
		category = "rares",
		faction = "Neutral",
	},
	[34203980] = {
		name = L["Soriid the Devourer"],
		category = "rares",
		faction = "Neutral",
	},
	[50803900] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[51803960] = {
		name = L["Greater Firebird"],
		category = "rares",
		faction = "Neutral",
	},
	[47802620] = {
		name = L["Murderous Blisterpaw"],
		category = "rares",
		faction = "Neutral",
	},
	[38405420] = {
		name = L["Omgorn the Lost"],
		category = "rares",
		faction = "Neutral",
	},
	[31404500] = {
		name = L["Soriid the Devourer"],
		category = "rares",
		faction = "Neutral",
	},
	[54407280] = {
		name = L["Haarka the Ravenous"],
		category = "rares",
		faction = "Neutral",
	},
	[53403220] = {
		name = L["Murderous Blisterpaw"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1434] = {
	[27807700] = {
		name = L["Auctioneer Kresky"],
		category = "auctioneers",
		faction = "Neutral",
	},
	[28407580] = {
		name = L["Auctioneer Graves"],
		category = "auctioneers",
		faction = "Neutral",
	},
	[26607640] = {
		name = L["Auctioneer O'reely"],
		category = "auctioneers",
		faction = "Neutral",
	},
	[26607645] = {
		name = L["Rickle Goldgrubber"],
		category = "bankers",
		description = L["Banker"],
		faction = "Neutral",
	},
	[32402920] = {
		name = L["Thysta"],
		category = "flightmasters",
		fpName = L["Grom'gol, Stranglethorn"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[26807700] = {
		name = L["Gringer"],
		category = "flightmasters",
		fpName = L["Booty Bay, Stranglethorn"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[27407760] = {
		name = L["Gyll"],
		category = "flightmasters",
		fpName = L["Booty Bay, Stranglethorn"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[31402960] = {
		name = L["Innkeeper Thulbek"],
		npcID = 5814,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[27007720] = {
		name = L["Innkeeper Skindle"],
		npcID = 6807,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Neutral",
	},
	[26707640] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Neutral",
	},
	[32402870] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[32202800] = {
		name = L["Vharr"],
		npcID = 1146,
		category = "repair",
		description = L["Superior Weaponsmith"],
		faction = "Horde",
	},
	[31602900] = {
		name = L["Hragran"],
		npcID = 1147,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Horde",
	},
	[32402800] = {
		name = L["Krakk"],
		npcID = 1381,
		category = "repair",
		description = L["Superior Armorer"],
		faction = "Horde",
	},
	[28407540] = {
		name = L["Zarena Cromwind"],
		npcID = 2482,
		category = "repair",
		description = L["Superior Weaponsmith"],
		faction = "Neutral",
	},
	[35601060] = {
		name = L["Jaquilina Dramet"],
		npcID = 2483,
		category = "repair",
		description = L["Superior Axecrafter"],
		faction = "Neutral",
	},
	[28207460] = {
		name = L["Haren Kanmae"],
		npcID = 2839,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Superior Bowyer"],
		faction = "Neutral",
	},
	[28207520] = {
		name = L["Kizz Bluntstrike"],
		npcID = 2840,
		category = "repair",
		description = L["Macecrafter"],
		faction = "Neutral",
	},
	[27407740] = {
		name = L["Jutak"],
		npcID = 2843,
		category = "repair",
		description = L["Blade Trader"],
		faction = "Neutral",
	},
	[29007500] = {
		name = L["Hurklor"],
		npcID = 2844,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Neutral",
	},
	[29007505] = {
		name = L["Fargon Mortalak"],
		npcID = 2845,
		category = "vendors",
		description = L["Superior Armorer"],
		faction = "Neutral",
	},
	[29007540] = {
		name = L["Jansen Underwood"],
		npcID = 2847,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Neutral",
	},
	[28207740] = {
		name = L["Qixdi Goodstitch"],
		npcID = 2849,
		category = "repair",
		description = L["Cloth Armor and Accessories"],
		faction = "Neutral",
	},
	[30007300] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[38400880] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[27207720] = {
		name = L["Grimestack"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Neutral",
	},
	[31802940] = {
		name = L["Durik"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[27607760] = {
		name = L["Flora Silverwind"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Superior Herbalist"],
		faction = "Neutral",
	},
	[31402800] = {
		name = L["Mudduk"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Superior Cook"],
		faction = "Horde",
	},
	[31602880] = {
		name = L["Brawn"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Expert Leatherworker"],
		faction = "Horde",
	},
	[31202860] = {
		name = L["Kragg"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[26807720] = {
		name = L["Ian Strom"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Neutral",
	},
	[28607680] = {
		name = L["Grarnik Goodstitch"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Expert Tailor"],
		faction = "Neutral",
	},
	[27407700] = {
		name = L["Myizz Luckycatch"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Superior Fisherman"],
		faction = "Neutral",
	},
	[29007545] = {
		name = L["Brikk Keencraft"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Master Blacksmith"],
		faction = "Neutral",
	},
	[28007800] = {
		name = L["Jaxin Chong"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Expert Alchemist"],
		faction = "Neutral",
	},
	[32202740] = {
		name = L["Angrun"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Superior Herbalist"],
		faction = "Horde",
	},
	[31202880] = {
		name = L["Zudd"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Horde",
	},
	[28207620] = {
		name = L["Oglethorpe Obnoticus"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Master Gnome Engineer"],
		faction = "Neutral",
	},
	[36603420] = {
		name = L["Se'Jib"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Master Tribal Leatherworker"],
		faction = "Horde",
	},
	[38000300] = {
		name = L["Corporal Bluth"],
		npcID = 734,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["Camp Trader"],
		faction = "Alliance",
	},
	[32602920] = {
		name = L["Nerrist"],
		npcID = 1148,
		category = "vendors",
		description = L["Trade Goods"],
		faction = "Horde",
	},
	[31602800] = {
		name = L["Uthok"],
		npcID = 1149,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Horde",
	},
	[28407680] = {
		name = L["Sly Garrett"],
		npcID = 2622,
		category = "vendors",
		subcategories = {
			poison = true,
		},
		description = L["Shady Goods"],
		faction = "Neutral",
	},
	[27407705] = {
		name = L["Old Man Heming"],
		npcID = 2626,
		category = "vendors",
		description = L["Fisherman"],
		faction = "Neutral",
	},
	[28207440] = {
		name = L["Narkk"],
		npcID = 2663,
		category = "vendors",
		description = L["Pirate Supplies"],
		faction = "Neutral",
	},
	[28207445] = {
		name = L["Kelsey Yance"],
		npcID = 2664,
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cook"],
		faction = "Neutral",
	},
	[28607685] = {
		name = L["Xizk Goodstitch"],
		npcID = 2670,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Neutral",
	},
	[27008240] = {
		name = L["Cowardly Crosby"],
		npcID = 2672,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Neutral",
	},
	[28407500] = {
		name = L["Mazk Snipeshot"],
		npcID = 2685,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Neutral",
	},
	[51003520] = {
		name = L["Gnaz Blunderflame"],
		npcID = 2687,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Neutral",
	},
	[28407600] = {
		name = L["Rikqiz"],
		npcID = 2699,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Neutral",
	},
	[27007725] = {
		name = L["Nixxrax Fillamug"],
		npcID = 2832,
		category = "vendors",
		description = L["Food and Drink"],
		faction = "Neutral",
	},
	[28207660] = {
		name = L["Crazk Sparks"],
		npcID = 2838,
		category = "vendors",
		description = L["Fireworks Merchant"],
		faction = "Neutral",
	},
	[28007680] = {
		name = L["Wigcik"],
		npcID = 2842,
		category = "vendors",
		description = L["Superior Fisherman"],
		faction = "Neutral",
	},
	[28207745] = {
		name = L["Blixrez Goodstitch"],
		npcID = 2846,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Neutral",
	},
	[28007805] = {
		name = L["Glyx Brewright"],
		npcID = 2848,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Neutral",
	},
	[32202920] = {
		name = L["Nargatt"],
		npcID = 7485,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Horde",
	},
	[51003525] = {
		name = L["Knaz Blunderflame"],
		npcID = 8679,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Neutral",
	},
	[49003180] = {
		name = L["Mosh'Ogg Butcher"],
		category = "rares",
		faction = "Neutral",
	},
	[49203120] = {
		name = L["Mosh'Ogg Butcher"],
		category = "rares",
		faction = "Neutral",
	},
	[49603120] = {
		name = L["Mosh'Ogg Butcher"],
		category = "rares",
		faction = "Neutral",
	},
	[43004580] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Neutral",
	},
	[43004820] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Neutral",
	},
	[43204920] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Neutral",
	},
	[43404700] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Neutral",
	},
	[43604660] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Neutral",
	},
	[44004820] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Neutral",
	},
	[28206320] = {
		name = L["Lord Sakrasis"],
		category = "rares",
		faction = "Neutral",
	},
	[28406240] = {
		name = L["Lord Sakrasis"],
		category = "rares",
		faction = "Neutral",
	},
	[28606060] = {
		name = L["Lord Sakrasis"],
		category = "rares",
		faction = "Neutral",
	},
	[28606220] = {
		name = L["Lord Sakrasis"],
		category = "rares",
		faction = "Neutral",
	},
	[33402240] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Neutral",
	},
	[34002180] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Neutral",
	},
	[34402280] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Neutral",
	},
	[34602140] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Neutral",
	},
	[34602280] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Neutral",
	},
	[34602380] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Neutral",
	},
	[36802700] = {
		name = L["Roloch"],
		category = "rares",
		faction = "Neutral",
	},
	[37402560] = {
		name = L["Roloch"],
		category = "rares",
		faction = "Neutral",
	},
	[37602600] = {
		name = L["Roloch"],
		category = "rares",
		faction = "Neutral",
	},
	[30408600] = {
		name = L["Rippa"],
		category = "rares",
		faction = "Neutral",
	},
	[32808400] = {
		name = L["Rippa"],
		category = "rares",
		faction = "Neutral",
	},
	[33208460] = {
		name = L["Rippa"],
		category = "rares",
		faction = "Neutral",
	},
	[33006580] = {
		name = L["Kurmokk"],
		category = "rares",
		faction = "Neutral",
	},
	[36605440] = {
		name = L["Verifonix"],
		category = "rares",
		description = L["The Surveyor"],
		faction = "Neutral",
	},
	[36605460] = {
		name = L["Verifonix"],
		category = "rares",
		description = L["The Surveyor"],
		faction = "Neutral",
	},
	[36605660] = {
		name = L["Verifonix"],
		category = "rares",
		description = L["The Surveyor"],
		faction = "Neutral",
	},
	[36805600] = {
		name = L["Verifonix"],
		category = "rares",
		description = L["The Surveyor"],
		faction = "Neutral",
	},
	[50003060] = {
		name = L["Mosh'Ogg Butcher"],
		category = "rares",
		faction = "Neutral",
	},
	[43404580] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Neutral",
	},
	[43604860] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Neutral",
	},
	[33002100] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Neutral",
	},
	[34602160] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Neutral",
	},
	[28208440] = {
		name = L["Rippa"],
		category = "rares",
		faction = "Neutral",
	},
	[28608580] = {
		name = L["Rippa"],
		category = "rares",
		faction = "Neutral",
	},
	[33808360] = {
		name = L["Rippa"],
		category = "rares",
		faction = "Neutral",
	},
	[43604620] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Neutral",
	},
	[34001880] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Neutral",
	},
	[34402240] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Neutral",
	},
	[34606440] = {
		name = L["Kurmokk"],
		category = "rares",
		faction = "Neutral",
	},
	[50403140] = {
		name = L["Mosh'Ogg Butcher"],
		category = "rares",
		faction = "Neutral",
	},
	[27007520] = {
		name = L["Rippa"],
		category = "rares",
		faction = "Neutral",
	},
	[24205800] = {
		name = L["Rippa"],
		category = "rares",
		faction = "Neutral",
	},
	[30008480] = {
		name = L["Rippa"],
		category = "rares",
		faction = "Neutral",
	},
	[33806400] = {
		name = L["Kurmokk"],
		category = "rares",
		faction = "Neutral",
	},
	[35806380] = {
		name = L["Kurmokk"],
		category = "rares",
		faction = "Neutral",
	},
	[36605540] = {
		name = L["Verifonix"],
		category = "rares",
		description = L["The Surveyor"],
		faction = "Neutral",
	},
	[42604960] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Alliance",
	},
	[43804800] = {
		name = L["Scale Belly"],
		category = "rares",
		faction = "Alliance",
	},
	[34802260] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Horde",
	},
	[35202440] = {
		name = L["Gluggle"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1453] = {
	[53206060] = {
		name = L["Auctioneer Chilton"],
		category = "auctioneers",
		faction = "Alliance",
	},
	[53406040] = {
		name = L["Auctioneer Fitch"],
		category = "auctioneers",
		faction = "Alliance",
	},
	[53405960] = {
		name = L["Auctioneer Jaxon"],
		category = "auctioneers",
		faction = "Alliance",
	},
	[57407240] = {
		name = L["Olivia Burnside"],
		category = "bankers",
		description = L["Banker"],
		faction = "Alliance",
	},
	[57007280] = {
		name = L["Newton Burnside"],
		category = "bankers",
		description = L["Banker"],
		faction = "Alliance",
	},
	[56407320] = {
		name = L["John Burnside"],
		category = "bankers",
		description = L["Banker"],
		faction = "Alliance",
	},
	[66206240] = {
		name = L["Dungar Longdrink"],
		category = "flightmasters",
		fpName = L["Stormwind, Elwynn"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[57006780] = {
		name = L["Aldwin Laughlin"],
		category = "guildmasters",
		description = L["Guild Master"],
		faction = "Alliance",
	},
	[52606560] = {
		name = L["Innkeeper Allison"],
		npcID = 6740,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[22205770] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[40008410] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[54406640] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[70704030] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[57205700] = {
		name = L["Marda Weller"],
		npcID = 1287,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Weapons Merchant"],
		faction = "Alliance",
	},
	[57205720] = {
		name = L["Gunther Weller"],
		npcID = 1289,
		category = "repair",
		description = L["Weapons Merchant"],
		faction = "Alliance",
	},
	[55005580] = {
		name = L["Carla Granger"],
		npcID = 1291,
		category = "repair",
		description = L["Cloth Armor Merchant"],
		faction = "Alliance",
	},
	[54805520] = {
		name = L["Aldric Moore"],
		npcID = 1294,
		category = "repair",
		description = L["Mail Armor Merchant"],
		faction = "Alliance",
	},
	[54805560] = {
		name = L["Lara Moore"],
		npcID = 1295,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[50405740] = {
		name = L["Lina Stover"],
		npcID = 1297,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bow & Gun Merchant"],
		faction = "Alliance",
	},
	[50205760] = {
		name = L["Frederick Stover"],
		npcID = 1298,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bow & Arrow Merchant"],
		faction = "Alliance",
	},
	[49605500] = {
		name = L["Lisbeth Schneider"],
		npcID = 1299,
		category = "repair",
		description = L["Clothier"],
		faction = "Alliance",
	},
	[41607660] = {
		name = L["Wynne Larson"],
		npcID = 1309,
		category = "repair",
		description = L["Robe Merchant"],
		faction = "Alliance",
	},
	[42407660] = {
		name = L["Evan Larson"],
		npcID = 1310,
		category = "repair",
		description = L["Hatter"],
		faction = "Alliance",
	},
	[42806540] = {
		name = L["Ardwyn Cailen"],
		npcID = 1312,
		category = "repair",
		description = L["Wand Merchant"],
		faction = "Alliance",
	},
	[43407420] = {
		name = L["Duncan Cullen"],
		npcID = 1314,
		category = "repair",
		description = L["Light Armor Merchant"],
		faction = "Alliance",
	},
	[43006540] = {
		name = L["Allan Hafgan"],
		npcID = 1315,
		category = "repair",
		description = L["Staves Merchant"],
		faction = "Alliance",
	},
	[64204300] = {
		name = L["Bryan Cross"],
		npcID = 1319,
		category = "repair",
		description = L["Shield Merchant"],
		faction = "Alliance",
	},
	[67604880] = {
		name = L["Seoman Griffith"],
		npcID = 1320,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[74204740] = {
		name = L["Osric Strang"],
		npcID = 1323,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Alliance",
	},
	[74204280] = {
		name = L["Heinrich Stone"],
		npcID = 1324,
		category = "repair",
		description = L["Blade Merchant"],
		faction = "Alliance",
	},
	[69004240] = {
		name = L["Gerik Koen"],
		npcID = 1333,
		category = "repair",
		description = L["Two Handed Weapon Merchant"],
		faction = "Alliance",
	},
	[67004320] = {
		name = L["Mayda Thane"],
		npcID = 1339,
		category = "repair",
		description = L["Cobbler"],
		faction = "Alliance",
	},
	[74604780] = {
		name = L["Wilhelm Strang"],
		npcID = 1341,
		category = "repair",
		description = L["Mail Armor Merchant"],
		faction = "Alliance",
	},
	[37003940] = {
		name = L["Gregory Ardus"],
		npcID = 1348,
		category = "repair",
		description = L["Staff & Mace Merchant"],
		faction = "Alliance",
	},
	[43804320] = {
		name = L["Agustus Moulaine"],
		npcID = 1349,
		category = "repair",
		description = L["Mail Armor Merchant"],
		faction = "Alliance",
	},
	[43604340] = {
		name = L["Theresa Moulaine"],
		npcID = 1350,
		category = "repair",
		description = L["Robe Vendor"],
		faction = "Alliance",
	},
	[51401240] = {
		name = L["Kathrum Axehand"],
		npcID = 5509,
		category = "repair",
		description = L["Axe Merchant"],
		faction = "Alliance",
	},
	[54401540] = {
		name = L["Thulman Flintcrag"],
		npcID = 5510,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Guns Vendor"],
		faction = "Alliance",
	},
	[56601700] = {
		name = L["Kaita Deepforge"],
		npcID = 5512,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Alliance",
	},
	[73805340] = {
		name = L["Officer Areyn"],
		npcID = 12805,
		category = "repair",
		description = L["Accessories Quartermaster"],
		faction = "Alliance",
	},
	[29405120] = {
		name = L["Sylista"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[61201720] = {
		name = L["Jenova Stoneshield"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[38008160] = {
		name = L["Maginor Dumas"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Master Mage"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[38802640] = {
		name = L["High Priestess Laurena"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[25407820] = {
		name = L["Demisette Cloyce"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[78204720] = {
		name = L["Ander Germaine"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[74405280] = {
		name = L["Osborne the Night Man"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[37203300] = {
		name = L["Lord Grayson Shadowbreaker"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[56801640] = {
		name = L["Dane Lindgren"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Journeyman Blacksmith"],
		faction = "Alliance",
	},
	[67804900] = {
		name = L["Maris Granger"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinning Trainer"],
		faction = "Alliance",
	},
	[43607380] = {
		name = L["Lawrence Schneider"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Journeyman Tailor"],
		faction = "Alliance",
	},
	[43006420] = {
		name = L["Lucan Cordell"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Expert Enchanter"],
		faction = "Alliance",
	},
	[43207360] = {
		name = L["Georgio Bolero"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Artisan Tailor"],
		faction = "Alliance",
	},
	[42802640] = {
		name = L["Shaina Fuller"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Alliance",
	},
	[39407960] = {
		name = L["Larimaine Purdue"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Portal Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[61601580] = {
		name = L["Karrina Mekenda"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Alliance",
	},
	[78804560] = {
		name = L["Wu Shen"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[78604560] = {
		name = L["Ilsa Corbin"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[75603700] = {
		name = L["Stephen Ryback"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cooking Trainer"],
		faction = "Alliance",
	},
	[41002820] = {
		name = L["Brother Benjamin"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[38802680] = {
		name = L["Brother Joshua"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[38603260] = {
		name = L["Arthur the Faithful"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[37403200] = {
		name = L["Katherine the Pure"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[45805820] = {
		name = L["Arnold Leland"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fishing Trainer"],
		faction = "Alliance",
	},
	[26207740] = {
		name = L["Ursula Deline"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[25807900] = {
		name = L["Sandahl"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[38607940] = {
		name = L["Jennea Cannon"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[37008120] = {
		name = L["Elsharin"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[46407920] = {
		name = L["Lilyssia Nightbreeze"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Expert Alchemist"],
		faction = "Alliance",
	},
	[46407900] = {
		name = L["Tel'Athir"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist"],
		faction = "Alliance",
	},
	[15204980] = {
		name = L["Shylamiir"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Alliance",
	},
	[21005540] = {
		name = L["Sheldras Moontree"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Alliance",
	},
	[21405140] = {
		name = L["Theridran"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Alliance",
	},
	[18805360] = {
		name = L["Maldryn"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Alliance",
	},
	[56801645] = {
		name = L["Therum Deepforge"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Expert Blacksmith"],
		faction = "Alliance",
	},
	[51001720] = {
		name = L["Gelman Stonehand"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Mining Trainer"],
		faction = "Alliance",
	},
	[61601540] = {
		name = L["Einris Brightspear"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[62001500] = {
		name = L["Ulfir Ironbeard"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[62401460] = {
		name = L["Thorfin Stoneshield"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[54800780] = {
		name = L["Lilliam Sparkspindle"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Expert Engineer"],
		faction = "Alliance",
	},
	[67204960] = {
		name = L["Simon Tanner"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Expert Leatherworker"],
		faction = "Alliance",
	},
	[44807700] = {
		name = L["Tannysa"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Alliance",
	},
	[42007620] = {
		name = L["Sellandus"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Expert Tailor"],
		faction = "Alliance",
	},
	[26607760] = {
		name = L["Jalane Ayrole"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Master Shadoweave Tailor"],
		faction = "Alliance",
	},
	[54600800] = {
		name = L["Sprite Jumpsprocket"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Journeyman Engineer"],
		faction = "Alliance",
	},
	[43006400] = {
		name = L["Betty Quin"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Journeyman Enchanter"],
		faction = "Alliance",
	},
	[67804940] = {
		name = L["Randal Worth"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Journeyman Leatherworker"],
		faction = "Alliance",
	},
	[20205080] = {
		name = L["Nara Meideros"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[57005760] = {
		name = L["Woo Ping"],
		npcID = 11867,
		category = "trainers",
		subcategories = {
			weaponmaster = true,
		},
		description = L["Weapon Master"],
		faction = "Alliance",
	},
	[78205720] = {
		name = L["Lord Tony Romano"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[52006780] = {
		name = L["Roberto Pupellyverbos"],
		npcID = 277,
		category = "vendors",
		description = L["Merlot Connoisseur"],
		faction = "Alliance",
	},
	[74603680] = {
		name = L["Kendor Kabonka"],
		npcID = 340,
		category = "vendors",
		description = L["Master of Cooking Recipes"],
		faction = "Alliance",
	},
	[60406340] = {
		name = L["Elaine Trias"],
		npcID = 483,
		category = "vendors",
		description = L["Mistress of Cheese"],
		faction = "Alliance",
	},
	[55806520] = {
		name = L["Keldric Boucher"],
		npcID = 1257,
		category = "vendors",
		description = L["Arcane Goods Vendor"],
		faction = "Alliance",
	},
	[56206500] = {
		name = L["Kyra Boucher"],
		npcID = 1275,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Alliance",
	},
	[58206140] = {
		name = L["Thurman Mullby"],
		npcID = 1285,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Vendor"],
		faction = "Alliance",
	},
	[58206060] = {
		name = L["Edna Mullby"],
		npcID = 1286,
		category = "vendors",
		description = L["Trade Supplier"],
		faction = "Alliance",
	},
	[51806840] = {
		name = L["Julia Gallina"],
		npcID = 1301,
		category = "vendors",
		description = L["Wine Vendor"],
		faction = "Alliance",
	},
	[64206100] = {
		name = L["Bernard Gump"],
		npcID = 1302,
		category = "vendors",
		description = L["Florist"],
		faction = "Alliance",
	},
	[64406060] = {
		name = L["Felicia Gump"],
		npcID = 1303,
		category = "vendors",
		profession = "herbalism",
		description = L["Herbalism Supplier"],
		faction = "Alliance",
	},
	[29606780] = {
		name = L["Darian Singh"],
		npcID = 1304,
		category = "vendors",
		description = L["Fireworks Vendor"],
		faction = "Alliance",
	},
	[28607500] = {
		name = L["Jarel Moor"],
		npcID = 1305,
		category = "vendors",
		description = L["Bartender"],
		faction = "Alliance",
	},
	[32408000] = {
		name = L["Charys Yserian"],
		npcID = 1307,
		category = "vendors",
		description = L["Arcane Trinkets Vendor"],
		faction = "Alliance",
	},
	[36007480] = {
		name = L["Owen Vaughn"],
		npcID = 1308,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Alliance",
	},
	[40808980] = {
		name = L["Joachim Brenlow"],
		npcID = 1311,
		category = "vendors",
		description = L["Bartender"],
		faction = "Alliance",
	},
	[46607900] = {
		name = L["Maria Lumere"],
		npcID = 1313,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Alliance",
	},
	[41406520] = {
		name = L["Adair Gilroy"],
		npcID = 1316,
		category = "vendors",
		description = L["Librarian"],
		faction = "Alliance",
	},
	[43006425] = {
		name = L["Jessara Cordell"],
		npcID = 1318,
		category = "vendors",
		profession = "enchanting",
		description = L["Enchanting Supplies"],
		faction = "Alliance",
	},
	[67404900] = {
		name = L["Alyssa Griffith"],
		npcID = 1321,
		category = "vendors",
		description = L["Bag Vendor"],
		faction = "Alliance",
	},
	[78205900] = {
		name = L["Jasper Fel"],
		npcID = 1325,
		category = "vendors",
		description = L["Shady Dealer"],
		faction = "Alliance",
	},
	[76406000] = {
		name = L["Sloan McCoy"],
		npcID = 1326,
		category = "vendors",
		subcategories = {
			poison = true,
		},
		description = L["Poison Supplier"],
		faction = "Alliance",
	},
	[73803720] = {
		name = L["Elly Langston"],
		npcID = 1328,
		category = "vendors",
		description = L["Barmaid"],
		faction = "Alliance",
	},
	[43407400] = {
		name = L["Alexandra Bolero"],
		npcID = 1347,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Alliance",
	},
	[43202680] = {
		name = L["Brother Cassius"],
		npcID = 1351,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Alliance",
	},
	[57806300] = {
		name = L["Thomas Miller"],
		npcID = 3518,
		category = "vendors",
		description = L["Baker"],
		faction = "Alliance",
	},
	[60406360] = {
		name = L["Ben Trias"],
		npcID = 4981,
		category = "vendors",
		description = L["Apprentice of Cheese"],
		faction = "Alliance",
	},
	[57206840] = {
		name = L["Rebecca Laughlin"],
		npcID = 5193,
		category = "vendors",
		description = L["Tabard Vendor"],
		faction = "Alliance",
	},
	[75803680] = {
		name = L["Erika Tate"],
		npcID = 5483,
		category = "vendors",
		profession = "cooking",
		description = L["Cooking Supplier"],
		faction = "Alliance",
	},
	[45805825] = {
		name = L["Catherine Leland"],
		npcID = 5494,
		category = "vendors",
		description = L["Fishing Supplier"],
		faction = "Alliance",
	},
	[46607880] = {
		name = L["Eldraeith"],
		npcID = 5503,
		category = "vendors",
		profession = "herbalism",
		description = L["Herbalism Supplier"],
		faction = "Alliance",
	},
	[51201680] = {
		name = L["Brooke Stonebraid"],
		npcID = 5514,
		category = "vendors",
		profession = "mining",
		description = L["Mining Supplier"],
		faction = "Alliance",
	},
	[55200740] = {
		name = L["Billibub Cogspinner"],
		npcID = 5519,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplier"],
		faction = "Alliance",
	},
	[25807760] = {
		name = L["Spackle Thornberry"],
		npcID = 5520,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[67204940] = {
		name = L["Jillian Tanner"],
		npcID = 5565,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Alliance",
	},
	[64003800] = {
		name = L["Lil Timmy"],
		npcID = 8666,
		category = "vendors",
		description = L["Boy with kittens"],
		faction = "Alliance",
	},
	[30006220] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[30806320] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[31206040] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[31806000] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[35604320] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[40206040] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[41006020] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[49406260] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[49406620] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[49802260] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[50006220] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[59003680] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[60205140] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[63203600] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[63604860] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[63605480] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[64603420] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[65603300] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[66205680] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[35004520] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[37604460] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[38204700] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[48006380] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[57605880] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[62405020] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[62605400] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[64203380] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[64603340] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[64605440] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[64805500] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[66003200] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[66803120] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[36004360] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[36004520] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[35604640] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[38604740] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[64805640] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[41806100] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[62203820] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[66403220] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
	[66405660] = {
		name = L["Sewer Beast"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1454] = {
	[55606280] = {
		name = L["Auctioneer Thathung"],
		category = "auctioneers",
		faction = "Horde",
	},
	[55406480] = {
		name = L["Auctioneer Wabang"],
		category = "auctioneers",
		faction = "Horde",
	},
	[55006200] = {
		name = L["Auctioneer Grimful"],
		category = "auctioneers",
		faction = "Horde",
	},
	[49606940] = {
		name = L["Karus"],
		category = "bankers",
		description = L["Banker"],
		faction = "Horde",
	},
	[50006880] = {
		name = L["Koma"],
		category = "bankers",
		description = L["Banker"],
		faction = "Horde",
	},
	[49206960] = {
		name = L["Soran"],
		category = "bankers",
		description = L["Banker"],
		faction = "Horde",
	},
	[45206380] = {
		name = L["Doras"],
		category = "flightmasters",
		fpName = L["Orgrimmar, Durotar"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[43807460] = {
		name = L["Urtrun Clanbringer"],
		category = "guildmasters",
		description = L["Guild Master"],
		faction = "Horde",
	},
	[54006860] = {
		name = L["Innkeeper Gryshka"],
		npcID = 6929,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[50807040] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[62104060] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[47406860] = {
		name = L["Urtharo"],
		npcID = 3314,
		category = "repair",
		description = L["Weapon Merchant"],
		faction = "Horde",
	},
	[62605040] = {
		name = L["Tor'phan"],
		npcID = 3315,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Horde",
	},
	[62804480] = {
		name = L["Handor"],
		npcID = 3316,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Horde",
	},
	[56207360] = {
		name = L["Ollanus"],
		npcID = 3317,
		category = "repair",
		description = L["Light Armor Merchant"],
		faction = "Horde",
	},
	[55807300] = {
		name = L["Sana"],
		npcID = 3319,
		category = "repair",
		description = L["Mail Armor Merchant"],
		faction = "Horde",
	},
	[56007320] = {
		name = L["Morgum"],
		npcID = 3321,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Horde",
	},
	[52206240] = {
		name = L["Kaja"],
		npcID = 3322,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Guns and Ammo Merchant"],
		faction = "Horde",
	},
	[44404840] = {
		name = L["Muragus"],
		npcID = 3330,
		category = "repair",
		description = L["Staff Merchant"],
		faction = "Horde",
	},
	[45405580] = {
		name = L["Kareth"],
		npcID = 3331,
		category = "repair",
		description = L["Blade Merchant"],
		faction = "Horde",
	},
	[29807400] = {
		name = L["Ukra'nor"],
		npcID = 3349,
		category = "repair",
		description = L["Staff Merchant"],
		faction = "Horde",
	},
	[82402380] = {
		name = L["Sumi"],
		npcID = 3356,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplier"],
		faction = "Horde",
	},
	[73004200] = {
		name = L["Kiro"],
		npcID = 3359,
		category = "repair",
		description = L["War Harness Maker"],
		faction = "Horde",
	},
	[81601880] = {
		name = L["Koru"],
		npcID = 3360,
		category = "repair",
		description = L["Mace & Staves Vendor"],
		faction = "Horde",
	},
	[81401900] = {
		name = L["Shoma"],
		npcID = 3361,
		category = "repair",
		description = L["Weapon Vendor"],
		faction = "Horde",
	},
	[81201900] = {
		name = L["Zendo'jian"],
		npcID = 3409,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Weapon Vendor"],
		faction = "Horde",
	},
	[77803860] = {
		name = L["Jin'sora"],
		npcID = 3410,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bow Merchant"],
		faction = "Horde",
	},
	[82001880] = {
		name = L["Galthuk"],
		npcID = 4043,
		category = "repair",
		description = L["Two-Handed Weapons Merchant"],
		faction = "Horde",
	},
	[82402360] = {
		name = L["Tumi"],
		npcID = 5812,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Horde",
	},
	[44204840] = {
		name = L["Katis"],
		npcID = 5816,
		category = "repair",
		description = L["Wand Merchant"],
		faction = "Horde",
	},
	[41406880] = {
		name = L["Sergeant Ba'sha"],
		npcID = 12799,
		category = "repair",
		description = L["Accessories Quartermaster"],
		faction = "Horde",
	},
	[77802140] = {
		name = L["Field Repair Bot 74A"],
		npcID = 14337,
		category = "repair",
		faction = "Neutral",
	},
	[70201500] = {
		name = L["Xon'cha"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[79602340] = {
		name = L["Snarl"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Expert Blacksmith"],
		faction = "Horde",
	},
	[81401940] = {
		name = L["Hanashi"],
		npcID = 2704,
		category = "trainers",
		subcategories = {
			weaponmaster = true,
		},
		description = L["Weapon Master"],
		faction = "Horde",
	},
	[62804940] = {
		name = L["Snang"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Journeyman Tailor"],
		faction = "Horde",
	},
	[75802440] = {
		name = L["Thund"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Journeyman Engineer"],
		faction = "Horde",
	},
	[48004620] = {
		name = L["Grol'dar"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[48404700] = {
		name = L["Mirket"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[48404560] = {
		name = L["Zevrost"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[42805140] = {
		name = L["Gest"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Horde",
	},
	[44005440] = {
		name = L["Ormok"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Horde",
	},
	[69602920] = {
		name = L["Lumak"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fishing Trainer"],
		faction = "Horde",
	},
	[38803660] = {
		name = L["Kardris Dreamseeker"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[53803840] = {
		name = L["Godan"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Expert Enchanter"],
		faction = "Horde",
	},
	[56603320] = {
		name = L["Yelmak"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Expert Alchemist"],
		faction = "Horde",
	},
	[66201820] = {
		name = L["Ormak Grimshot"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[79603140] = {
		name = L["Grezz Ragefist"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[80203240] = {
		name = L["Sorek"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[82202300] = {
		name = L["Saru Steelfury"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Artisan Blacksmith"],
		faction = "Horde",
	},
	[73002640] = {
		name = L["Makaru"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Mining Trainer"],
		faction = "Horde",
	},
	[63405000] = {
		name = L["Magar"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Expert Tailor"],
		faction = "Horde",
	},
	[62804440] = {
		name = L["Karolek"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Expert Leatherworker"],
		faction = "Horde",
	},
	[34008440] = {
		name = L["Arnok"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Horde",
	},
	[57405360] = {
		name = L["Zamja"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cooking Trainer"],
		faction = "Horde",
	},
	[43005340] = {
		name = L["Shenthul"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Horde",
	},
	[37803660] = {
		name = L["Sian'tsu"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[55403960] = {
		name = L["Jandi"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Horde",
	},
	[67002000] = {
		name = L["Xor'juul"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[67801780] = {
		name = L["Sian'dur"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[80202960] = {
		name = L["Zel'mak"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[75802520] = {
		name = L["Nogg"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Expert Engineer"],
		faction = "Horde",
	},
	[69201300] = {
		name = L["Kildar"],
		npcID = 4752,
		category = "mountTrainer",
		description = L["Wolf Riding Instructor"],
		faction = "Horde",
	},
	[63204480] = {
		name = L["Kamari"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Journeyman Leatherworker"],
		faction = "Horde",
	},
	[38408560] = {
		name = L["Pephredo"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[38808540] = {
		name = L["Enyo"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[38408580] = {
		name = L["Deino"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[38608560] = {
		name = L["Thuul"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Portal Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[35608720] = {
		name = L["Zayus"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["High Priest"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[35808760] = {
		name = L["X'yera"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[35608760] = {
		name = L["Ur'kyo"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[63204520] = {
		name = L["Thuwd"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinning Trainer"],
		faction = "Horde",
	},
	[80202320] = {
		name = L["Shayis Steelfury"],
		category = "primaryProfession",
		profession = "blacksmithing",
		description = L["Armor Crafter"],
		faction = "Horde",
	},
	[39008600] = {
		name = L["Uthel'nay"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[66401500] = {
		name = L["Xao'tsu"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Horde",
	},
	[80602340] = {
		name = L["Ug'thok"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Journeyman Blacksmith"],
		faction = "Horde",
	},
	[76002500] = {
		name = L["Roxxik"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Artisan Engineer"],
		faction = "Horde",
	},
	[55803320] = {
		name = L["Whuut"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist"],
		faction = "Horde",
	},
	[53603820] = {
		name = L["Jhag"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Journeyman Enchanter"],
		faction = "Horde",
	},
	[79602360] = {
		name = L["Borgosh Corebender"],
		category = "primaryProfession",
		profession = "blacksmithing",
		description = L["Weaponsmith"],
		faction = "Horde",
	},
	[81401945] = {
		name = L["Sayoc"],
		npcID = 11868,
		category = "trainers",
		subcategories = {
			weaponmaster = true,
		},
		description = L["Weapon Master"],
		faction = "Horde",
	},
	[38603620] = {
		name = L["Sagorne Creststrider"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[44806980] = {
		name = L["Olvia"],
		npcID = 3312,
		category = "vendors",
		description = L["Meat Vendor"],
		faction = "Horde",
	},
	[48008020] = {
		name = L["Trak'gen"],
		npcID = 3313,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Merchant"],
		faction = "Horde",
	},
	[45405680] = {
		name = L["Horthus"],
		npcID = 3323,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagents Vendor"],
		faction = "Horde",
	},
	[49005400] = {
		name = L["Kor'jus"],
		npcID = 3329,
		category = "vendors",
		description = L["Mushroom Vendor"],
		faction = "Horde",
	},
	[69802960] = {
		name = L["Shankys"],
		npcID = 3333,
		category = "vendors",
		profession = "fishing",
		description = L["Fishing Supplies"],
		faction = "Horde",
	},
	[42204960] = {
		name = L["Rekkul"],
		npcID = 3334,
		category = "vendors",
		subcategories = {
			poison = true,
		},
		description = L["Poison Vendor"],
		faction = "Horde",
	},
	[46004600] = {
		name = L["Hagrus"],
		npcID = 3335,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagents Vendor"],
		faction = "Horde",
	},
	[37605240] = {
		name = L["Shan'ti"],
		npcID = 3342,
		category = "vendors",
		description = L["Fruit Vendor"],
		faction = "Horde",
	},
	[53603800] = {
		name = L["Kithas"],
		npcID = 3346,
		category = "vendors",
		profession = "enchanting",
		description = L["Enchanting Supplies"],
		faction = "Horde",
	},
	[56203420] = {
		name = L["Kor'geld"],
		npcID = 3348,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Horde",
	},
	[46004060] = {
		name = L["Asoran"],
		npcID = 3350,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Vendor"],
		faction = "Horde",
	},
	[45804060] = {
		name = L["Magenius"],
		npcID = 3351,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagents Vendor"],
		faction = "Horde",
	},
	[73202660] = {
		name = L["Gorina"],
		npcID = 3358,
		category = "vendors",
		profession = "mining",
		description = L["Mining Supplier"],
		faction = "Horde",
	},
	[69201260] = {
		name = L["Ogunaro Wolfrunner"],
		npcID = 3362,
		category = "vendors",
		description = L["Kennel Master"],
		faction = "Horde",
	},
	[63005120] = {
		name = L["Borya"],
		npcID = 3364,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Horde",
	},
	[63004520] = {
		name = L["Tamar"],
		npcID = 3366,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Horde",
	},
	[57405780] = {
		name = L["Felika"],
		npcID = 3367,
		category = "vendors",
		description = L["General Trade Goods Merchant"],
		faction = "Horde",
	},
	[57405340] = {
		name = L["Borstan"],
		npcID = 3368,
		category = "vendors",
		description = L["Meat Vendor"],
		faction = "Horde",
	},
	[58805300] = {
		name = L["Gotri"],
		npcID = 3369,
		category = "vendors",
		description = L["Bag Vendor"],
		faction = "Horde",
	},
	[57405320] = {
		name = L["Xen'to"],
		npcID = 3400,
		category = "vendors",
		profession = "cooking",
		description = L["Cooking Supplier"],
		faction = "Horde",
	},
	[55003960] = {
		name = L["Zeal'aya"],
		npcID = 3405,
		category = "vendors",
		profession = "herbalism",
		description = L["Herbalism Supplier"],
		faction = "Horde",
	},
	[75602520] = {
		name = L["Sovik"],
		npcID = 3413,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Horde",
	},
	[43807440] = {
		name = L["Garyl"],
		npcID = 5188,
		category = "vendors",
		description = L["Tabard Vendor"],
		faction = "Horde",
	},
	[54406800] = {
		name = L["Barkeep Morag"],
		npcID = 5611,
		category = "vendors",
		faction = "Horde",
	},
	[47604680] = {
		name = L["Kurgul"],
		npcID = 5815,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[48008025] = {
		name = L["Shimra"],
		npcID = 5817,
		category = "vendors",
		description = L["General Trade Goods Merchant"],
		faction = "Horde",
	},
	[37807660] = {
		name = L["Xan'tish"],
		npcID = 8404,
		category = "vendors",
		description = L["Snake Vendor"],
		faction = "Horde",
	},
}
nodes[1455] = {
	[24007200] = {
		name = L["Auctioneer Buckler"],
		category = "auctioneers",
		faction = "Alliance",
	},
	[24207440] = {
		name = L["Auctioneer Redmuse"],
		category = "auctioneers",
		faction = "Alliance",
	},
	[25807500] = {
		name = L["Auctioneer Lympkin"],
		category = "auctioneers",
		faction = "Alliance",
	},
	[34605900] = {
		name = L["Barnum Stonemantle"],
		category = "bankers",
		description = L["Banker"],
		faction = "Alliance",
	},
	[35406060] = {
		name = L["Bailey Stonemantle"],
		category = "bankers",
		description = L["Banker"],
		faction = "Alliance",
	},
	[36406220] = {
		name = L["Soleil Stonemantle"],
		category = "bankers",
		description = L["Banker"],
		faction = "Alliance",
	},
	[55604800] = {
		name = L["Gryth Thurden"],
		category = "flightmasters",
		fpName = L["Ironforge, Dun Morogh"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[35808500] = {
		name = L["Jondor Steelbrow"],
		category = "guildmasters",
		description = L["Guild Master"],
		faction = "Alliance",
	},
	[18605140] = {
		name = L["Innkeeper Firebrew"],
		npcID = 5111,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[21005190] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[32806500] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[71007250] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[72004910] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[51804240] = {
		name = L["Thurgrum Deepforge"],
		npcID = 4259,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Alliance",
	},
	[36206600] = {
		name = L["Dolman Steelfury"],
		npcID = 5102,
		category = "repair",
		description = L["Weapon Merchant"],
		faction = "Alliance",
	},
	[36206580] = {
		name = L["Grenil Steelfury"],
		npcID = 5103,
		category = "repair",
		description = L["Weapon Merchant"],
		faction = "Alliance",
	},
	[31805780] = {
		name = L["Bromiir Ormsen"],
		npcID = 5106,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Alliance",
	},
	[32005820] = {
		name = L["Mangorn Flinthammer"],
		npcID = 5107,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Alliance",
	},
	[32405800] = {
		name = L["Raena Flinthammer"],
		npcID = 5108,
		category = "repair",
		description = L["Light Armor Merchant"],
		faction = "Alliance",
	},
	[61808860] = {
		name = L["Hegnar Swiftaxe"],
		npcID = 5119,
		category = "repair",
		description = L["Axe Merchant"],
		faction = "Alliance",
	},
	[61808865] = {
		name = L["Brenwyn Wintersteel"],
		npcID = 5120,
		category = "vendors",
		description = L["Blade Merchant"],
		faction = "Alliance",
	},
	[62008900] = {
		name = L["Kelomir Ironhand"],
		npcID = 5121,
		category = "repair",
		description = L["Maces & Staves"],
		faction = "Alliance",
	},
	[71606620] = {
		name = L["Skolmin Goldfury"],
		npcID = 5122,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bow Merchant"],
		faction = "Alliance",
	},
	[72406600] = {
		name = L["Bretta Goldfury"],
		npcID = 5123,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gun Merchant"],
		faction = "Alliance",
	},
	[54208820] = {
		name = L["Dolkin Craghelm"],
		npcID = 5125,
		category = "repair",
		description = L["Mail Armor Merchant"],
		faction = "Alliance",
	},
	[54408740] = {
		name = L["Olthran Craghelm"],
		npcID = 5126,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Neutral",
	},
	[54608820] = {
		name = L["Lissyphus Finespindle"],
		npcID = 5129,
		category = "repair",
		description = L["Light Armor Merchant"],
		faction = "Alliance",
	},
	[22801640] = {
		name = L["Harick Boulderdrum"],
		npcID = 5133,
		category = "repair",
		description = L["Wands Merchant"],
		faction = "Alliance",
	},
	[22601620] = {
		name = L["Bingus"],
		npcID = 5152,
		category = "repair",
		description = L["Weapon Merchant"],
		faction = "Alliance",
	},
	[38400560] = {
		name = L["Ingrys Stonebrow"],
		npcID = 5155,
		category = "repair",
		description = L["Cloth Armor Merchant"],
		faction = "Alliance",
	},
	[38800560] = {
		name = L["Maeva Snowbraid"],
		npcID = 5156,
		category = "repair",
		description = L["Robe Merchant"],
		faction = "Alliance",
	},
	[45400640] = {
		name = L["Hjoldir Stoneblade"],
		npcID = 5170,
		category = "repair",
		description = L["Blade Merchant"],
		faction = "Alliance",
	},
	[61208920] = {
		name = L["Thalgus Thunderfist"],
		npcID = 7976,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Weapon Merchant"],
		faction = "Alliance",
	},
	[31406580] = {
		name = L["Field Repair Bot 74A"],
		npcID = 14337,
		category = "repair",
		faction = "Neutral",
	},
	[69408400] = {
		name = L["Ulbrek Firehand"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[66405520] = {
		name = L["Vosur Brakthel"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist"],
		faction = "Alliance",
	},
	[39003280] = {
		name = L["Gretta Finespindle"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Journeyman Leatherworker"],
		faction = "Alliance",
	},
	[43602820] = {
		name = L["Uthrar Threx"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Journeyman Tailor"],
		faction = "Alliance",
	},
	[67008960] = {
		name = L["Kelstrum Stonebreaker"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[25600740] = {
		name = L["Milstaff Stormeye"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Portal Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[50402600] = {
		name = L["Geofram Bouldertoe"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Mining Trainer"],
		faction = "Alliance",
	},
	[52004180] = {
		name = L["Bengus Deepforge"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Artisan Blacksmith"],
		faction = "Alliance",
	},
	[70209060] = {
		name = L["Kelv Sternhammer"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[66208820] = {
		name = L["Bilban Tosslespanner"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[71009000] = {
		name = L["Daera Brightspear"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[70608380] = {
		name = L["Olmin Burningbeard"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[69808340] = {
		name = L["Regnus Thundergranite"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[39803340] = {
		name = L["Fimble Finespindle"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Expert Leatherworker"],
		faction = "Alliance",
	},
	[55605880] = {
		name = L["Reyna Stonebranch"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Alliance",
	},
	[23800900] = {
		name = L["Theodrus Frostbeard"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Neutral",
	},
	[24600920] = {
		name = L["Braenna Flintcrag"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[25201020] = {
		name = L["Toldren Deepiron"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[27000820] = {
		name = L["Bink"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[26200720] = {
		name = L["Juli Stormkettle"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[25600440] = {
		name = L["Nittlebur Sparkfizzle"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Neutral",
	},
	[23400500] = {
		name = L["Valgar Highforge"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[24600480] = {
		name = L["Beldruk Doombrow"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[23400620] = {
		name = L["Brandur Ironhammer"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[54805860] = {
		name = L["Nissa Firestone"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Alliance",
	},
	[43202900] = {
		name = L["Jormund Stonebrow"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Expert Tailor"],
		faction = "Alliance",
	},
	[60004520] = {
		name = L["Gimble Thistlefuzz"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Expert Enchanter"],
		faction = "Alliance",
	},
	[60003680] = {
		name = L["Daryl Riknussun"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cooking Trainer"],
		faction = "Alliance",
	},
	[48200660] = {
		name = L["Grimnur Stonebrand"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fishing Trainer"],
		faction = "Alliance",
	},
	[50204260] = {
		name = L["Grumnus Steelshaper"],
		category = "primaryProfession",
		profession = "blacksmithing",
		description = L["Armor Crafter"],
		faction = "Alliance",
	},
	[51601480] = {
		name = L["Hulfdan Blackbeard"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[52401480] = {
		name = L["Ormyr Flinteye"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[51601500] = {
		name = L["Fenthwick"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[50800660] = {
		name = L["Thistleheart"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[50200600] = {
		name = L["Briarthorn"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[50200680] = {
		name = L["Alexander Calder"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[68204360] = {
		name = L["Springspindle Fizzlegear"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Artisan Engineer"],
		faction = "Alliance",
	},
	[66405525] = {
		name = L["Tally Berryfizz"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Expert Alchemist"],
		faction = "Alliance",
	},
	[39603240] = {
		name = L["Balthus Stoneflayer"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinning Trainer"],
		faction = "Alliance",
	},
	[26800840] = {
		name = L["Dink"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[69805040] = {
		name = L["Tinkmaster Overspark"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Master Gnome Engineer"],
		faction = "Alliance",
	},
	[70808540] = {
		name = L["Belia Thundergranite"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Alliance",
	},
	[52004240] = {
		name = L["Rotgath Stonebeard"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Expert Blacksmith"],
		faction = "Alliance",
	},
	[51804220] = {
		name = L["Groum Stonebeard"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Journeyman Blacksmith"],
		faction = "Alliance",
	},
	[67804400] = {
		name = L["Jemma Quikswitch"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Journeyman Engineer"],
		faction = "Alliance",
	},
	[67804320] = {
		name = L["Trixie Quikswitch"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Expert Engineer"],
		faction = "Alliance",
	},
	[60404500] = {
		name = L["Thonys Pillarstone"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Journeyman Enchanter"],
		faction = "Alliance",
	},
	[49804500] = {
		name = L["Ironus Coldsteel"],
		category = "primaryProfession",
		profession = "blacksmithing",
		description = L["Special Weapon Crafter"],
		faction = "Alliance",
	},
	[25000840] = {
		name = L["High Priest Rohan"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[61408920] = {
		name = L["Buliwyf Stonehand"],
		npcID = 11865,
		category = "trainers",
		subcategories = {
			weaponmaster = true,
		},
		description = L["Weapon Master"],
		faction = "Alliance",
	},
	[62008920] = {
		name = L["Bixi Wobblebonk"],
		npcID = 13084,
		category = "trainers",
		subcategories = {
			weaponmaster = true,
		},
		description = L["Weapon Master"],
		faction = "Alliance",
	},
	[51002600] = {
		name = L["Golnir Bouldertoe"],
		npcID = 4256,
		category = "vendors",
		profession = "mining",
		description = L["Mining Supplier"],
		faction = "Alliance",
	},
	[36008540] = {
		name = L["Lyesa Steelbrow"],
		npcID = 5049,
		category = "vendors",
		description = L["Guild Tabard Vendor"],
		faction = "Alliance",
	},
	[38407360] = {
		name = L["Fillius Fizzlespinner"],
		npcID = 5100,
		category = "vendors",
		description = L["Trade Supplier"],
		faction = "Alliance",
	},
	[39007380] = {
		name = L["Bryllia Ironbrand"],
		npcID = 5101,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Vendor"],
		faction = "Alliance",
	},
	[32607600] = {
		name = L["Myra Tyrngaarde"],
		npcID = 5109,
		category = "vendors",
		description = L["Bread Vendor"],
		faction = "Alliance",
	},
	[19405620] = {
		name = L["Barim Jurgenstaad"],
		npcID = 5110,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Alliance",
	},
	[18805160] = {
		name = L["Gwenna Firebrew"],
		npcID = 5112,
		category = "vendors",
		description = L["Barmaid"],
		faction = "Alliance",
	},
	[64606940] = {
		name = L["Sognar Cliffbeard"],
		npcID = 5124,
		category = "vendors",
		description = L["Meat Vendor"],
		faction = "Alliance",
	},
	[39403400] = {
		name = L["Bombus Finespindle"],
		npcID = 5128,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Alliance",
	},
	[38207460] = {
		name = L["Pithwick"],
		npcID = 5132,
		category = "vendors",
		description = L["Bag Vendor"],
		faction = "Alliance",
	},
	[55405900] = {
		name = L["Gwina Stonebranch"],
		npcID = 5138,
		category = "vendors",
		profession = "herbalism",
		description = L["Herbalism Supplier"],
		faction = "Alliance",
	},
	[72207600] = {
		name = L["Edris Barleybeard"],
		npcID = 5140,
		category = "vendors",
		description = L["Barmaid"],
		faction = "Alliance",
	},
	[31202740] = {
		name = L["Ginny Longberry"],
		npcID = 5151,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Alliance",
	},
	[43202840] = {
		name = L["Poranna Snowbraid"],
		npcID = 5154,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Alliance",
	},
	[60804420] = {
		name = L["Tilli Thistlefuzz"],
		npcID = 5158,
		category = "vendors",
		profession = "enchanting",
		description = L["Enchanting Supplies"],
		faction = "Alliance",
	},
	[59803760] = {
		name = L["Emrul Riknussun"],
		npcID = 5160,
		category = "vendors",
		profession = "cooking",
		description = L["Cooking Supplier"],
		faction = "Alliance",
	},
	[47800640] = {
		name = L["Tansy Puddlefizz"],
		npcID = 5162,
		category = "vendors",
		description = L["Fishing Supplier"],
		faction = "Alliance",
	},
	[46402720] = {
		name = L["Burbik Gearspanner"],
		npcID = 5163,
		category = "vendors",
		description = L["Trade Supplier"],
		faction = "Alliance",
	},
	[52801320] = {
		name = L["Tynnus Venomsprout"],
		npcID = 5169,
		category = "vendors",
		description = L["Shady Dealer"],
		faction = "Alliance",
	},
	[67804300] = {
		name = L["Gearcutter Cogspinner"],
		npcID = 5175,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Alliance",
	},
	[66405460] = {
		name = L["Soolie Berryfizz"],
		npcID = 5178,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Alliance",
	},
	[73205320] = {
		name = L["Fizzlebang Booms"],
		npcID = 5569,
		category = "vendors",
		description = L["Fireworks Vendor"],
		faction = "Alliance",
	},
	[72207640] = {
		name = L["Bruuk Barleybeard"],
		npcID = 5570,
		category = "vendors",
		description = L["Bartender"],
		faction = "Alliance",
	},
	[53000620] = {
		name = L["Jubahl Corpseseeker"],
		npcID = 6382,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[36001620] = {
		name = L["Bimble Longberry"],
		npcID = 7978,
		category = "vendors",
		description = L["Fruit Vendor"],
		faction = "Alliance",
	},
	[43202920] = {
		name = L["Outfitter Eric"],
		npcID = 8681,
		category = "vendors",
		description = L["Speciality Tailoring Supplies"],
		faction = "Alliance",
	},
	[45004700] = {
		name = L["Sraaz"],
		npcID = 9099,
		category = "vendors",
		description = L["Pie Vendor"],
		faction = "Alliance",
	},
}
nodes[1456] = {
	[40405220] = {
		name = L["Auctioneer Stampi"],
		category = "auctioneers",
		faction = "Horde",
	},
	[38805060] = {
		name = L["Auctioneer Gullem"],
		category = "auctioneers",
		faction = "Horde",
	},
	[47405840] = {
		name = L["Torn"],
		category = "bankers",
		description = L["Banker"],
		faction = "Horde",
	},
	[46805820] = {
		name = L["Chesmu"],
		category = "bankers",
		description = L["Banker"],
		faction = "Horde",
	},
	[47005900] = {
		name = L["Atepa"],
		category = "bankers",
		description = L["Banker"],
		faction = "Horde",
	},
	[46805000] = {
		name = L["Tal"],
		category = "flightmasters",
		fpName = L["Thunder Bluff, Mulgore"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[37406300] = {
		name = L["Krumn"],
		category = "guildmasters",
		description = L["Guild Master"],
		faction = "Horde",
	},
	[45806440] = {
		name = L["Innkeeper Pala"],
		npcID = 6746,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[45005920] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[41206200] = {
		name = L["Jyn Stonehoof"],
		npcID = 2997,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Weapons Merchant"],
		faction = "Horde",
	},
	[40005560] = {
		name = L["Taur Stonehoof"],
		npcID = 2999,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Horde",
	},
	[46804560] = {
		name = L["Kuna Thunderhorn"],
		npcID = 3015,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer & Fletching Goods"],
		faction = "Horde",
	},
	[55605660] = {
		name = L["Hogor Thunderhoof"],
		npcID = 3018,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Guns Merchant"],
		faction = "Horde",
	},
	[53805720] = {
		name = L["Delgo Ragetotem"],
		npcID = 3019,
		category = "repair",
		description = L["Axe Merchant"],
		faction = "Horde",
	},
	[53205780] = {
		name = L["Etu Ragetotem"],
		npcID = 3020,
		category = "repair",
		description = L["Mace & Staff Merchant"],
		faction = "Horde",
	},
	[53205700] = {
		name = L["Kard Ragetotem"],
		npcID = 3021,
		category = "repair",
		description = L["Sword and Dagger Merchant"],
		faction = "Horde",
	},
	[49604920] = {
		name = L["Sunn Ragetotem"],
		npcID = 3022,
		category = "repair",
		description = L["Staff Merchant"],
		faction = "Horde",
	},
	[51805460] = {
		name = L["Sura Wildmane"],
		npcID = 3023,
		category = "repair",
		description = L["War Harness Vendor"],
		faction = "Horde",
	},
	[43404400] = {
		name = L["Tagain"],
		npcID = 3092,
		category = "repair",
		description = L["Cloth Armor Merchant"],
		faction = "Horde",
	},
	[42804320] = {
		name = L["Grod"],
		npcID = 3093,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Horde",
	},
	[42804440] = {
		name = L["Fela"],
		npcID = 3095,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Horde",
	},
	[45205640] = {
		name = L["Hewa"],
		npcID = 8358,
		category = "repair",
		description = L["Cloth Armor Merchant"],
		faction = "Horde",
	},
	[45405580] = {
		name = L["Ahanu"],
		npcID = 8359,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Horde",
	},
	[45005620] = {
		name = L["Elki"],
		npcID = 8360,
		category = "repair",
		description = L["Mail Armor Merchant"],
		faction = "Horde",
	},
	[53205720] = {
		name = L["Ohanko"],
		npcID = 8398,
		category = "repair",
		description = L["Two Handed Weapon Merchant"],
		faction = "Horde",
	},
	[57401720] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[45005925] = {
		name = L["Bulrug"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[29402140] = {
		name = L["Pand Stonebinder"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Horde",
	},
	[39405540] = {
		name = L["Karn Stonehoof"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Expert Blacksmith"],
		faction = "Horde",
	},
	[34605760] = {
		name = L["Brek Stonehoof"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Mining Trainer"],
		faction = "Horde",
	},
	[44204500] = {
		name = L["Tepa"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Expert Tailor"],
		faction = "Horde",
	},
	[41804260] = {
		name = L["Una"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Artisan Leatherworker"],
		faction = "Horde",
	},
	[42204320] = {
		name = L["Mak"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Journeyman Leatherworker"],
		faction = "Horde",
	},
	[46803360] = {
		name = L["Bena Winterhoof"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Expert Alchemist"],
		faction = "Horde",
	},
	[45003800] = {
		name = L["Teg Dawnstrider"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Expert Enchanter"],
		faction = "Horde",
	},
	[49803980] = {
		name = L["Komin Winterhoof"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Horde",
	},
	[51005280] = {
		name = L["Aska Mistrunner"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cooking Trainer"],
		faction = "Horde",
	},
	[56004680] = {
		name = L["Kah Mistrunner"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fishing Trainer"],
		faction = "Horde",
	},
	[23002080] = {
		name = L["Siln Skychaser"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[23401920] = {
		name = L["Tigor Skychaser"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[22201900] = {
		name = L["Beram Skychaser"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[76402760] = {
		name = L["Turak Runetotem"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Horde",
	},
	[77002740] = {
		name = L["Sheal Runetotem"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Horde",
	},
	[76802980] = {
		name = L["Kym Wildmane"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Horde",
	},
	[58208780] = {
		name = L["Kary Thunderhorn"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[57408940] = {
		name = L["Holt Thunderhorn"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[58808660] = {
		name = L["Urek Thunderhorn"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[57608720] = {
		name = L["Torm Ragetotem"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[57208900] = {
		name = L["Sark Ragetotem"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[57808560] = {
		name = L["Ker Ragetotem"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[25401500] = {
		name = L["Miles Welsh"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[24802260] = {
		name = L["Malakai Cross"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[25402080] = {
		name = L["Father Cobb"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[22601480] = {
		name = L["Archmage Shymm"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[25401440] = {
		name = L["Ursyn Ghull"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[25402120] = {
		name = L["Thurston Xane"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[22201720] = {
		name = L["Birgitte Cranston"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Portal Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[44604280] = {
		name = L["Mooranta"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinning Trainer"],
		faction = "Horde",
	},
	[54208360] = {
		name = L["Hesuwa Thunderhorn"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Horde",
	},
	[39205620] = {
		name = L["Thrag Stonehoof"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Journeyman Blacksmith"],
		faction = "Horde",
	},
	[46803420] = {
		name = L["Kray"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist"],
		faction = "Horde",
	},
	[44004440] = {
		name = L["Vhan"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Journeyman Tailor"],
		faction = "Horde",
	},
	[44803880] = {
		name = L["Mot Dawnstrider"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Journeyman Enchanter"],
		faction = "Horde",
	},
	[42404300] = {
		name = L["Tarn"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Expert Leatherworker"],
		faction = "Horde",
	},
	[40806240] = {
		name = L["Ansekhwa"],
		npcID = 11869,
		category = "trainers",
		subcategories = {
			weaponmaster = true,
		},
		description = L["Weapon Master"],
		faction = "Horde",
	},
	[34405700] = {
		name = L["Kurm Stonehoof"],
		npcID = 3002,
		category = "vendors",
		profession = "mining",
		description = L["Mining Supplier"],
		faction = "Horde",
	},
	[41205340] = {
		name = L["Fyr Mistrunner"],
		npcID = 3003,
		category = "vendors",
		description = L["Bread Vendor"],
		faction = "Horde",
	},
	[43804460] = {
		name = L["Mahu"],
		npcID = 3005,
		category = "vendors",
		description = L["Leatherworking & Tailoring Supplies"],
		faction = "Horde",
	},
	[47203400] = {
		name = L["Mani Winterhoof"],
		npcID = 3010,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Horde",
	},
	[45003900] = {
		name = L["Nata Dawnstrider"],
		npcID = 3012,
		category = "vendors",
		profession = "enchanting",
		description = L["Enchanting Supplies"],
		faction = "Horde",
	},
	[49603940] = {
		name = L["Nida Winterhoof"],
		npcID = 3014,
		category = "vendors",
		profession = "herbalism",
		description = L["Herbalism Supplier"],
		faction = "Horde",
	},
	[49003460] = {
		name = L["Tand"],
		npcID = 3016,
		category = "vendors",
		description = L["Basket Weaver"],
		faction = "Horde",
	},
	[47004220] = {
		name = L["Nan Mistrunner"],
		npcID = 3017,
		category = "vendors",
		description = L["Fruit Vendor"],
		faction = "Horde",
	},
	[52404820] = {
		name = L["Kaga Mistrunner"],
		npcID = 3025,
		category = "vendors",
		description = L["Meat Vendor"],
		faction = "Horde",
	},
	[51005285] = {
		name = L["Naal Mistrunner"],
		npcID = 3027,
		category = "vendors",
		profession = "cooking",
		description = L["Cooking Supplier"],
		faction = "Horde",
	},
	[55804720] = {
		name = L["Sewa Mistrunner"],
		npcID = 3029,
		category = "vendors",
		description = L["Fishing Supplier"],
		faction = "Horde",
	},
	[37406305] = {
		name = L["Thrumn"],
		npcID = 5189,
		category = "vendors",
		description = L["Tabard Vendor"],
		faction = "Horde",
	},
	[41605440] = {
		name = L["Chepi"],
		npcID = 8361,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Horde",
	},
	[39006420] = {
		name = L["Kuruk"],
		npcID = 8362,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Vendor"],
		faction = "Horde",
	},
	[40406360] = {
		name = L["Shadi Mistrunner"],
		npcID = 8363,
		category = "vendors",
		description = L["Trade Goods Supplier"],
		faction = "Horde",
	},
	[39206380] = {
		name = L["Pakwa"],
		npcID = 8364,
		category = "vendors",
		description = L["Bag Vendor"],
		faction = "Horde",
	},
	[62205840] = {
		name = L["Halpa"],
		npcID = 8401,
		category = "vendors",
		description = L["Prairie Dog Vendor"],
		faction = "Horde",
	},
	[70803380] = {
		name = L["Bashana Runetotem"],
		npcID = 9087,
		category = "vendors",
		faction = "Horde",
	},
	[11402760] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[14802880] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[15603020] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[20600520] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[21600540] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[23200420] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[23200480] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[24400360] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[25200400] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[25400320] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[27400380] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[28000380] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[29000320] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[29400240] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[33600500] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
}
nodes[1457] = {
	[56405220] = {
		name = L["Auctioneer Tolon"],
		category = "auctioneers",
		faction = "Alliance",
	},
	[56405380] = {
		name = L["Auctioneer Golothas"],
		category = "auctioneers",
		faction = "Alliance",
	},
	[57005340] = {
		name = L["Auctioneer Silva'las"],
		category = "auctioneers",
		faction = "Alliance",
	},
	[55405280] = {
		name = L["Auctioneer Cazarez"],
		category = "auctioneers",
		faction = "Alliance",
	},
	[39804240] = {
		name = L["Idriana"],
		category = "bankers",
		description = L["Banker"],
		faction = "Alliance",
	},
	[40004180] = {
		name = L["Lairn"],
		category = "bankers",
		description = L["Banker"],
		faction = "Alliance",
	},
	[40004220] = {
		name = L["Garryeth"],
		category = "bankers",
		description = L["Banker"],
		faction = "Alliance",
	},
	[67201580] = {
		name = L["Innkeeper Saelienne"],
		npcID = 6735,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[41404220] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[59004600] = {
		name = L["Cylania"],
		npcID = 4164,
		category = "repair",
		description = L["Night Elf Armorer"],
		faction = "Alliance",
	},
	[65206000] = {
		name = L["Merelyssa"],
		npcID = 4171,
		category = "repair",
		description = L["Blade Merchant"],
		faction = "Alliance",
	},
	[55609000] = {
		name = L["Anadyia"],
		npcID = 4172,
		category = "repair",
		description = L["Robe Vendor"],
		faction = "Alliance",
	},
	[63206660] = {
		name = L["Landria"],
		npcID = 4173,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bow Merchant"],
		faction = "Alliance",
	},
	[60407220] = {
		name = L["Vinasia"],
		npcID = 4175,
		category = "repair",
		description = L["Cloth Armor Merchant"],
		faction = "Alliance",
	},
	[57207720] = {
		name = L["Melea"],
		npcID = 4177,
		category = "repair",
		description = L["Mail Armor Merchant"],
		faction = "Alliance",
	},
	[60807200] = {
		name = L["Ealyshia Dewwhisper"],
		npcID = 4180,
		category = "repair",
		description = L["Two Handed Weapon Merchant"],
		faction = "Neutral",
	},
	[58604480] = {
		name = L["Ariyell Skyshadow"],
		npcID = 4203,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Weapon Merchant"],
		faction = "Alliance",
	},
	[65206005] = {
		name = L["Kieran"],
		npcID = 4231,
		category = "vendors",
		description = L["Weapon Merchant"],
		faction = "Alliance",
	},
	[64005900] = {
		name = L["Glorandiir"],
		npcID = 4232,
		category = "repair",
		description = L["Axe Merchant"],
		faction = "Alliance",
	},
	[65006040] = {
		name = L["Mythidan"],
		npcID = 4233,
		category = "repair",
		description = L["Mace & Staff Merchant"],
		faction = "Alliance",
	},
	[56008900] = {
		name = L["Andrus"],
		npcID = 4234,
		category = "repair",
		description = L["Staff Merchant"],
		faction = "Alliance",
	},
	[62406560] = {
		name = L["Turian"],
		npcID = 4235,
		category = "repair",
		description = L["Thrown Weapons Merchant"],
		faction = "Alliance",
	},
	[53008000] = {
		name = L["Cyridan"],
		npcID = 4236,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[56807620] = {
		name = L["Caynrus"],
		npcID = 4240,
		category = "repair",
		description = L["Shield Merchant"],
		faction = "Alliance",
	},
	[77002700] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[39401000] = {
		name = L["Alassin"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[58403520] = {
		name = L["Arias'ta Bladesinger"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[61804180] = {
		name = L["Sildanair"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[38408080] = {
		name = L["Astarii Starseeker"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[38008260] = {
		name = L["Jandria"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[40008740] = {
		name = L["Lariia"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[39600580] = {
		name = L["Jeen'ra Nightrunner"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[40200880] = {
		name = L["Jocaste"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[47605660] = {
		name = L["Astaia"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fishing Trainer"],
		faction = "Alliance",
	},
	[63402220] = {
		name = L["Me'lynn"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Expert Tailor"],
		faction = "Alliance",
	},
	[55002380] = {
		name = L["Ainethil"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Artisan Alchemist"],
		faction = "Alliance",
	},
	[36802180] = {
		name = L["Syurna"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[40408200] = {
		name = L["Elissa Dumas"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Portal Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[48006840] = {
		name = L["Firodren Mooncaller"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Alliance",
	},
	[42200760] = {
		name = L["Dorion"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[49002120] = {
		name = L["Alegorn"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cooking Trainer"],
		faction = "Alliance",
	},
	[51601260] = {
		name = L["Dannelor"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Alliance",
	},
	[64402140] = {
		name = L["Telonis"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Artisan Leatherworker"],
		faction = "Alliance",
	},
	[58601320] = {
		name = L["Taladan"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Expert Enchanter"],
		faction = "Alliance",
	},
	[34602560] = {
		name = L["Erion Shadewhisper"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[37802140] = {
		name = L["Anishar"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[35200800] = {
		name = L["Mathrengyl Bearwalker"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Alliance",
	},
	[34800780] = {
		name = L["Denatharion"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Alliance",
	},
	[33600860] = {
		name = L["Fylerian Nightwing"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Alliance",
	},
	[38601600] = {
		name = L["Jartsam"],
		npcID = 4753,
		category = "mountTrainer",
		description = L["Nightsaber Riding Instructor"],
		faction = "Alliance",
	},
	[64202180] = {
		name = L["Eladriel"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinning Trainer"],
		faction = "Alliance",
	},
	[58603520] = {
		name = L["Darnath Bladesinger"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[42200880] = {
		name = L["Silvaria"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Alliance",
	},
	[55202280] = {
		name = L["Milla Fairancora"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist"],
		faction = "Alliance",
	},
	[56202420] = {
		name = L["Sylvanna Forestmoon"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Expert Alchemist"],
		faction = "Alliance",
	},
	[63602140] = {
		name = L["Trianna"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Journeyman Tailor"],
		faction = "Alliance",
	},
	[58801280] = {
		name = L["Lalina Summermoon"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Journeyman Enchanter"],
		faction = "Alliance",
	},
	[64602160] = {
		name = L["Faldron"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Expert Leatherworker"],
		faction = "Alliance",
	},
	[64402100] = {
		name = L["Darianna"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Journeyman Leatherworker"],
		faction = "Alliance",
	},
	[39208100] = {
		name = L["Priestess Alathea"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[57604640] = {
		name = L["Ilyenia Moonfire"],
		npcID = 11866,
		category = "trainers",
		subcategories = {
			weaponmaster = true,
		},
		description = L["Weapon Master"],
		faction = "Alliance",
	},
	[32801960] = {
		name = L["Kyrai"],
		npcID = 3561,
		category = "vendors",
		subcategories = {
			poison = true,
		},
		description = L["Poison Vendor"],
		faction = "Alliance",
	},
	[38604480] = {
		name = L["Alaindia"],
		npcID = 3562,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Alliance",
	},
	[38202020] = {
		name = L["Dendrythis"],
		npcID = 4167,
		category = "vendors",
		description = L["Food & Drink Vendor"],
		faction = "Alliance",
	},
	[64202160] = {
		name = L["Elynna"],
		npcID = 4168,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Alliance",
	},
	[62205800] = {
		name = L["Jaeana"],
		npcID = 4169,
		category = "vendors",
		description = L["Meat Vendor"],
		faction = "Alliance",
	},
	[64405300] = {
		name = L["Ellandrieth"],
		npcID = 4170,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Vendor"],
		faction = "Alliance",
	},
	[69404480] = {
		name = L["Fyrenna"],
		npcID = 4181,
		category = "vendors",
		description = L["Food & Drink Vendor"],
		faction = "Alliance",
	},
	[48206920] = {
		name = L["Chardryn"],
		npcID = 4216,
		category = "vendors",
		profession = "herbalism",
		description = L["Herbalism Supplier"],
		faction = "Alliance",
	},
	[34000960] = {
		name = L["Cyroen"],
		npcID = 4220,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Alliance",
	},
	[47405700] = {
		name = L["Talaelar"],
		npcID = 4221,
		category = "vendors",
		description = L["Fish Vendor"],
		faction = "Alliance",
	},
	[47005680] = {
		name = L["Voloren"],
		npcID = 4222,
		category = "vendors",
		description = L["Fishing Supplier"],
		faction = "Alliance",
	},
	[48602120] = {
		name = L["Fyldan"],
		npcID = 4223,
		category = "vendors",
		profession = "cooking",
		description = L["Cooking Supplier"],
		faction = "Alliance",
	},
	[63802200] = {
		name = L["Saenorion"],
		npcID = 4225,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Alliance",
	},
	[55802440] = {
		name = L["Ulthir"],
		npcID = 4226,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Alliance",
	},
	[58601440] = {
		name = L["Vaean"],
		npcID = 4228,
		category = "vendors",
		profession = "enchanting",
		description = L["Enchanting Supplies"],
		faction = "Alliance",
	},
	[61001800] = {
		name = L["Mythrin'dir"],
		npcID = 4229,
		category = "vendors",
		description = L["General Trade Supplier"],
		faction = "Alliance",
	},
	[65405300] = {
		name = L["Yldan"],
		npcID = 4230,
		category = "vendors",
		description = L["Bag Merchant"],
		faction = "Alliance",
	},
	[70404520] = {
		name = L["Mydrannul"],
		npcID = 4241,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Vendor"],
		faction = "Alliance",
	},
	[38201560] = {
		name = L["Lelanai"],
		npcID = 4730,
		category = "vendors",
		description = L["Saber Handler"],
		faction = "Alliance",
	},
	[70402320] = {
		name = L["Shalumon"],
		npcID = 5191,
		category = "vendors",
		description = L["Tabard Vendor"],
		faction = "Alliance",
	},
	[69604560] = {
		name = L["Shylenai"],
		npcID = 8665,
		category = "vendors",
		description = L["Owl Trainer"],
		faction = "Alliance",
	},
}
nodes[1458] = {
	[67805220] = {
		name = L["Auctioneer Leeka"],
		category = "auctioneers",
		faction = "Horde",
	},
	[64205220] = {
		name = L["Auctioneer Epitwee"],
		category = "auctioneers",
		faction = "Horde",
	},
	[71204700] = {
		name = L["Auctioneer Stockton"],
		category = "auctioneers",
		faction = "Horde",
	},
	[71404140] = {
		name = L["Auctioneer Yarly"],
		category = "auctioneers",
		faction = "Horde",
	},
	[67803600] = {
		name = L["Auctioneer Cain"],
		category = "auctioneers",
		faction = "Horde",
	},
	[64003600] = {
		name = L["Auctioneer Naxxremis"],
		category = "auctioneers",
		faction = "Horde",
	},
	[60604120] = {
		name = L["Auctioneer Tricket"],
		category = "auctioneers",
		faction = "Horde",
	},
	[60604680] = {
		name = L["Auctioneer Rhyker"],
		category = "auctioneers",
		faction = "Horde",
	},
	[66004300] = {
		name = L["Randolph Montague"],
		category = "bankers",
		description = L["Banker"],
		faction = "Horde",
	},
	[66604400] = {
		name = L["Mortimer Montague"],
		category = "bankers",
		description = L["Banker"],
		faction = "Horde",
	},
	[66004520] = {
		name = L["William Montague"],
		category = "bankers",
		description = L["Banker"],
		faction = "Horde",
	},
	[65204400] = {
		name = L["Ophelia Montague"],
		category = "bankers",
		description = L["Banker"],
		faction = "Horde",
	},
	[63404860] = {
		name = L["Michael Garrett"],
		category = "flightmasters",
		fpName = L["Undercity, Tirisfal"],
		description = L["Bat Handler"],
		faction = "Horde",
	},
	[69404440] = {
		name = L["Christopher Drakul"],
		category = "guildmasters",
		description = L["Guild Master"],
		faction = "Horde",
	},
	[67603820] = {
		name = L["Innkeeper Norman"],
		npcID = 6741,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[67903840] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[61604180] = {
		name = L["Gordon Wendham"],
		npcID = 4556,
		category = "repair",
		description = L["Weapons Merchant"],
		faction = "Horde",
	},
	[61404120] = {
		name = L["Louis Warren"],
		npcID = 4557,
		category = "repair",
		description = L["Weapons Merchant"],
		faction = "Horde",
	},
	[64003800] = {
		name = L["Lauren Newcomb"],
		npcID = 4558,
		category = "repair",
		description = L["Light Armor Merchant"],
		faction = "Horde",
	},
	[62803980] = {
		name = L["Timothy Weldon"],
		npcID = 4559,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Horde",
	},
	[62603900] = {
		name = L["Walter Ellingson"],
		npcID = 4560,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Horde",
	},
	[77005000] = {
		name = L["Charles Seaton"],
		npcID = 4569,
		category = "repair",
		description = L["Blade Merchant"],
		faction = "Horde",
	},
	[69802740] = {
		name = L["Sydney Upton"],
		npcID = 4570,
		category = "repair",
		description = L["Staff Merchant"],
		faction = "Horde",
	},
	[71002920] = {
		name = L["Lucille Castleton"],
		npcID = 4580,
		category = "repair",
		description = L["Robe Vendor"],
		faction = "Horde",
	},
	[77205000] = {
		name = L["Nathaniel Steenwick"],
		npcID = 4592,
		category = "repair",
		description = L["Thrown Weapons Merchant"],
		faction = "Horde",
	},
	[61402940] = {
		name = L["Samuel Van Brunt"],
		npcID = 4597,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplier"],
		faction = "Horde",
	},
	[58403260] = {
		name = L["Geoffrey Hartwell"],
		npcID = 4600,
		category = "repair",
		description = L["Weapon Merchant"],
		faction = "Horde",
	},
	[58603240] = {
		name = L["Francis Eliot"],
		npcID = 4601,
		category = "repair",
		description = L["Weapon Merchant"],
		faction = "Horde",
	},
	[58403240] = {
		name = L["Benijah Fenner"],
		npcID = 4602,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Weapon Merchant"],
		faction = "Horde",
	},
	[62202700] = {
		name = L["Nicholas Atwood"],
		npcID = 4603,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gun Merchant"],
		faction = "Horde",
	},
	[54803800] = {
		name = L["Abigail Sawyer"],
		npcID = 4604,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bow Merchant"],
		faction = "Horde",
	},
	[70002720] = {
		name = L["Zane Bradford"],
		npcID = 5754,
		category = "repair",
		description = L["Wand Vendor"],
		faction = "Horde",
	},
	[61402860] = {
		name = L["Mirelle Tremayne"],
		npcID = 5819,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Horde",
	},
	[70405880] = {
		name = L["Gillian Moore"],
		npcID = 5820,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Horde",
	},
	[70602880] = {
		name = L["Sheldon Von Croy"],
		npcID = 5821,
		category = "repair",
		description = L["Cloth Armor Merchant"],
		faction = "Horde",
	},
	[67801440] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[67403800] = {
		name = L["Anya Maulray"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[70605880] = {
		name = L["Dan Golthas"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Journeyman Leatherworker"],
		faction = "Horde",
	},
	[84201600] = {
		name = L["Lexington Mortaim"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Portal Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[62204460] = {
		name = L["Eunice Burch"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cooking Trainer"],
		faction = "Horde",
	},
	[86001560] = {
		name = L["Kaal Soulreaper"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[86201520] = {
		name = L["Luther Pickman"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[88601600] = {
		name = L["Richard Kerwin"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[85201420] = {
		name = L["Kaelystia Hatebringer"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[85401380] = {
		name = L["Pierce Shackleton"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[85001020] = {
		name = L["Anastasia Hartwell"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[80803120] = {
		name = L["Armand Cromwell"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fishing Trainer"],
		faction = "Horde",
	},
	[70603040] = {
		name = L["Josef Gregorian"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Artisan Tailor"],
		faction = "Horde",
	},
	[86402220] = {
		name = L["Josephine Lister"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Master Shadoweave Tailor"],
		faction = "Horde",
	},
	[83807180] = {
		name = L["Carolyn Ward"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Horde",
	},
	[85007120] = {
		name = L["Miles Dexter"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Horde",
	},
	[84607340] = {
		name = L["Gregory Charles"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Horde",
	},
	[75607320] = {
		name = L["Graham Van Talen"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Journeyman Engineer"],
		faction = "Horde",
	},
	[70405780] = {
		name = L["Arthur Moore"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Expert Leatherworker"],
		faction = "Horde",
	},
	[73405560] = {
		name = L["Mary Edras"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Horde",
	},
	[47201500] = {
		name = L["Christoph Walker"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[48201560] = {
		name = L["Angela Curthas"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[47401700] = {
		name = L["Baltus Fowler"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[61203020] = {
		name = L["James Van Brunt"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Expert Blacksmith"],
		faction = "Horde",
	},
	[56003700] = {
		name = L["Brom Killian"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Mining Trainer"],
		faction = "Horde",
	},
	[60002860] = {
		name = L["Basil Frye"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Journeyman Blacksmith"],
		faction = "Horde",
	},
	[49201820] = {
		name = L["Aelthalyste"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[49601560] = {
		name = L["Father Lankester"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[47401920] = {
		name = L["Father Lazarus"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[51407420] = {
		name = L["Doctor Marsh"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Expert Alchemist"],
		faction = "Horde",
	},
	[47607300] = {
		name = L["Doctor Herbert Halsey"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Artisan Alchemist"],
		faction = "Horde",
	},
	[54204980] = {
		name = L["Martha Alliestar"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Horde",
	},
	[62206160] = {
		name = L["Lavinia Crowe"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Expert Enchanter"],
		faction = "Horde",
	},
	[70405920] = {
		name = L["Killian Hagey"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinning Trainer"],
		faction = "Horde",
	},
	[75807380] = {
		name = L["Franklin Lloyd"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Expert Engineer"],
		faction = "Horde",
	},
	[46607440] = {
		name = L["Doctor Martin Felben"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist Trainer"],
		faction = "Horde",
	},
	[70202960] = {
		name = L["Victor Ward"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Journeyman Tailor"],
		faction = "Horde",
	},
	[70203020] = {
		name = L["Rhiannon Davis"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Expert Tailor"],
		faction = "Horde",
	},
	[62206020] = {
		name = L["Malcomb Wynn"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Journeyman Enchanter"],
		faction = "Horde",
	},
	[57203260] = {
		name = L["Archibald"],
		npcID = 11870,
		category = "trainers",
		subcategories = {
			weaponmaster = true,
		},
		description = L["Weapon Master"],
		faction = "Horde",
	},
	[62404340] = {
		name = L["Ronald Burch"],
		npcID = 4553,
		category = "vendors",
		profession = "cooking",
		description = L["Cooking Supplier"],
		faction = "Horde",
	},
	[65804960] = {
		name = L["Tawny Grisette"],
		npcID = 4554,
		category = "vendors",
		description = L["Mushroom Vendor"],
		faction = "Horde",
	},
	[69004840] = {
		name = L["Eleanor Rusk"],
		npcID = 4555,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Vendor"],
		faction = "Horde",
	},
	[64203780] = {
		name = L["Daniel Bartlett"],
		npcID = 4561,
		category = "vendors",
		description = L["General Trade Supplier"],
		faction = "Horde",
	},
	[69403920] = {
		name = L["Thomas Mordan"],
		npcID = 4562,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Horde",
	},
	[77003040] = {
		name = L["Morley Bates"],
		npcID = 4571,
		category = "vendors",
		description = L["Fungus Vendor"],
		faction = "Horde",
	},
	[81203080] = {
		name = L["Lizbeth Cromwell"],
		npcID = 4574,
		category = "vendors",
		description = L["Fishing Supplier"],
		faction = "Horde",
	},
	[82601600] = {
		name = L["Hannah Akeley"],
		npcID = 4575,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Supplier"],
		faction = "Horde",
	},
	[70403020] = {
		name = L["Millie Gregorian"],
		npcID = 4577,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Horde",
	},
	[77203860] = {
		name = L["Salazar Bloch"],
		npcID = 4581,
		category = "vendors",
		description = L["Book Dealer"],
		faction = "Horde",
	},
	[75405140] = {
		name = L["Ezekiel Graves"],
		npcID = 4585,
		category = "vendors",
		subcategories = {
			poison = true,
		},
		description = L["Poison Vendor"],
		faction = "Horde",
	},
	[75807385] = {
		name = L["Elizabeth Van Talen"],
		npcID = 4587,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplier"],
		faction = "Horde",
	},
	[70405885] = {
		name = L["Joseph Moore"],
		npcID = 4589,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Horde",
	},
	[69606100] = {
		name = L["Jonathan Chambers"],
		npcID = 4590,
		category = "vendors",
		description = L["Bag Vendor"],
		faction = "Horde",
	},
	[56203680] = {
		name = L["Sarah Killian"],
		npcID = 4599,
		category = "vendors",
		profession = "mining",
		description = L["Mining Supplier"],
		faction = "Horde",
	},
	[51807440] = {
		name = L["Algernon"],
		npcID = 4610,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Horde",
	},
	[54604940] = {
		name = L["Katrina Alliestar"],
		npcID = 4615,
		category = "vendors",
		profession = "herbalism",
		description = L["Herbalism Supplier"],
		faction = "Horde",
	},
	[62006080] = {
		name = L["Thaddeus Webb"],
		npcID = 4617,
		category = "vendors",
		profession = "enchanting",
		description = L["Enchanting Supplies"],
		faction = "Horde",
	},
	[64205020] = {
		name = L["Felicia Doan"],
		npcID = 4775,
		category = "vendors",
		description = L["General Trade Goods Vendor"],
		faction = "Horde",
	},
	[69204440] = {
		name = L["Merill Pleasance"],
		npcID = 5190,
		category = "vendors",
		description = L["Tabard Vendor"],
		faction = "Horde",
	},
	[85601580] = {
		name = L["Martha Strain"],
		npcID = 5753,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[58205520] = {
		name = L["Alessandro Luca"],
		npcID = 7683,
		category = "vendors",
		description = L["Blue Moon Odds and Ends"],
		faction = "Horde",
	},
	[67404440] = {
		name = L["Jeremiah Payson"],
		npcID = 8403,
		category = "vendors",
		description = L["Cockroach Vendor"],
		faction = "Horde",
	},
}
nodes[1413] = {
	[62603740] = {
		name = L["Fuzruckle"],
		category = "bankers",
		description = L["Banker"],
		faction = "Neutral",
	},
	[62603745] = {
		name = L["Zikkel"],
		category = "bankers",
		description = L["Banker"],
		faction = "Neutral",
	},
	[44405900] = {
		name = L["Omusa Thunderhorn"],
		category = "flightmasters",
		fpName = L["Camp Taurajo, The Barrens"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[63003700] = {
		name = L["Bragok"],
		category = "flightmasters",
		fpName = L["Ratchet, The Barrens"],
		description = L["Flight Master"],
		faction = "Neutral",
	},
	[52002980] = {
		name = L["Innkeeper Boorand Plainswind"],
		npcID = 3934,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[62003940] = {
		name = L["Innkeeper Wiley"],
		npcID = 6791,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Neutral",
	},
	[45605900] = {
		name = L["Innkeeper Byula"],
		npcID = 7714,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[45105870] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[52003040] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[62203920] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Neutral",
	},
	[51002900] = {
		name = L["Hraq"],
		npcID = 3477,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplier"],
		faction = "Horde",
	},
	[51202920] = {
		name = L["Nargal Deatheye"],
		npcID = 3479,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Horde",
	},
	[51202900] = {
		name = L["Jahan Hawkwing"],
		npcID = 3483,
		category = "repair",
		description = L["Leather & Mail Armor Merchant"],
		faction = "Horde",
	},
	[52203180] = {
		name = L["Halija Whitestrider"],
		npcID = 3486,
		category = "repair",
		description = L["Clothier"],
		faction = "Horde",
	},
	[51002905] = {
		name = L["Uthrok"],
		npcID = 3488,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer & Gunsmith"],
		faction = "Horde",
	},
	[62203740] = {
		name = L["Ironzar"],
		npcID = 3491,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Neutral",
	},
	[62203840] = {
		name = L["Vexspindle"],
		npcID = 3492,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Neutral",
	},
	[62203845] = {
		name = L["Grazlix"],
		npcID = 3493,
		category = "vendors",
		description = L["Armorer & Shieldcrafter"],
		faction = "Neutral",
	},
	[52403060] = {
		name = L["Lizzarik"],
		npcID = 3658,
		category = "repair",
		description = L["Weapon Dealer"],
		faction = "Neutral",
	},
	[43801220] = {
		name = L["Vrang Wildgore"],
		npcID = 3682,
		category = "repair",
		description = L["Weaponsmith & Armorcrafter"],
		faction = "Horde",
	},
	[41803860] = {
		name = L["Kiknikle"],
		npcID = 3683,
		category = "repair",
		description = L["Stylish Clothier"],
		faction = "Horde",
	},
	[41803865] = {
		name = L["Pizznukle"],
		npcID = 3684,
		category = "vendors",
		description = L["Leather Armor Merchant"],
		faction = "Horde",
	},
	[45005900] = {
		name = L["Sanuye Runetotem"],
		npcID = 10380,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Horde",
	},
	[46600840] = {
		name = L["Kelm Hargunth"],
		npcID = 14754,
		category = "repair",
		description = L["Warsong Supply Officer"],
		faction = "Horde",
	},
	[45206100] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[50603260] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[60203980] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[51602960] = {
		name = L["Sikwa"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[45205860] = {
		name = L["Kelsuwa"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[62203925] = {
		name = L["Reggifuz"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Neutral",
	},
	[51202880] = {
		name = L["Traugh"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Expert Blacksmith"],
		faction = "Horde",
	},
	[52203160] = {
		name = L["Kil'hala"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Journeyman Tailor"],
		faction = "Horde",
	},
	[62603620] = {
		name = L["Tinkerwiz"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Journeyman Engineer"],
		faction = "Neutral",
	},
	[44805940] = {
		name = L["Krulmoo Fullmoon"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Expert Leatherworker"],
		faction = "Horde",
	},
	[44805945] = {
		name = L["Gahroot"],
		npcID = 3705,
		category = "vendors",
		description = L["Butcher"],
		faction = "Horde",
	},
	[45005905] = {
		name = L["Dranh"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinner"],
		faction = "Horde",
	},
	[55203180] = {
		name = L["Duhng"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cook"],
		faction = "Horde",
	},
	[52203060] = {
		name = L["Moorane Hearthgrain"],
		npcID = 3480,
		category = "vendors",
		description = L["Baker"],
		faction = "Horde",
	},
	[51603000] = {
		name = L["Barg"],
		npcID = 3481,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Horde",
	},
	[51603005] = {
		name = L["Tari'qa"],
		npcID = 3482,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Horde",
	},
	[52203165] = {
		name = L["Wrahk"],
		npcID = 3485,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Horde",
	},
	[52203200] = {
		name = L["Kalyimah Stormcloud"],
		npcID = 3487,
		category = "vendors",
		description = L["Bags & Sacks"],
		faction = "Horde",
	},
	[52602980] = {
		name = L["Zargh"],
		npcID = 3489,
		category = "vendors",
		description = L["Butcher"],
		faction = "Horde",
	},
	[51403020] = {
		name = L["Hula'mahi"],
		npcID = 3490,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagents and Herbs"],
		faction = "Horde",
	},
	[62603625] = {
		name = L["Gagsprocket"],
		npcID = 3495,
		category = "vendors",
		description = L["Engineering Goods"],
		faction = "Neutral",
	},
	[62803820] = {
		name = L["Kilxx"],
		npcID = 3497,
		category = "vendors",
		description = L["Fisherman"],
		faction = "Neutral",
	},
	[61803880] = {
		name = L["Jazzik"],
		npcID = 3498,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Neutral",
	},
	[61803860] = {
		name = L["Ranik"],
		npcID = 3499,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Neutral",
	},
	[62003900] = {
		name = L["Zizzek"],
		npcID = 3572,
		category = "vendors",
		description = L["Fisherman"],
		faction = "Neutral",
	},
	[52002960] = {
		name = L["Larhka"],
		npcID = 5871,
		category = "vendors",
		description = L["Beverage Merchant"],
		faction = "Horde",
	},
	[45005920] = {
		name = L["Yonada"],
		npcID = 5944,
		category = "vendors",
		description = L["Tailoring & Leatherworking Supplies"],
		faction = "Horde",
	},
	[55003200] = {
		name = L["Tarban Hearthgrain"],
		npcID = 8307,
		category = "vendors",
		description = L["Baker"],
		faction = "Horde",
	},
	[46600845] = {
		name = L["Hecht Copperpinch"],
		npcID = 14964,
		category = "vendors",
		description = L["Smokywood Pastures"],
		faction = "Horde",
	},
	[44206940] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[44406960] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[44607200] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[44807280] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[47607040] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[47807100] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[56402360] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[57202360] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[57602400] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[58002680] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[58202620] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[58402480] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[58602720] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[59002440] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[59002460] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[59202580] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[59602500] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[59602580] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[56600800] = {
		name = L["Sludge Beast"],
		category = "rares",
		faction = "Alliance",
	},
	[46203960] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[46403820] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[46403920] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[46603900] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[46603980] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[47403840] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[47601920] = {
		name = L["Rathorian"],
		category = "rares",
		faction = "Alliance",
	},
	[45005840] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45206460] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45406340] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45406400] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45406580] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45604140] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45605820] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46004260] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46004840] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006240] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006820] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006920] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007040] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007160] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007460] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46206740] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46207120] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46406280] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46407260] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46604640] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46605820] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46606880] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46607080] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806600] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47008080] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47206180] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47206540] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47207520] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47406260] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47407400] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47407620] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47607400] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47805920] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47806100] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47806420] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48206340] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48405040] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48405160] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48405720] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48607720] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48607960] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805240] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805740] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48806240] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49205320] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49404780] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405520] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49407820] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50006100] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50204300] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50204680] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45406380] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45606540] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45804080] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45806640] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45806680] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45806780] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45807160] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46004265] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006245] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006925] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007020] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007465] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46207125] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46406260] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46604645] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46607780] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46608040] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806560] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806880] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47004300] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47006160] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47008085] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47206520] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47406120] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47407405] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47407625] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47607405] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48205220] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48206345] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48207620] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48407840] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48605180] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805700] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49007920] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49205325] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405525] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49604320] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45206540] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45406405] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45804085] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45804820] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45806820] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006220] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007025] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007100] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007440] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46206620] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46207180] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46406680] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46407280] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46607060] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47206240] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47806105] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[48006420] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48205225] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48606240] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48607965] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805720] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405320] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405500] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50204320] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45204100] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45206545] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46004060] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006640] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006825] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007105] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007165] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46204880] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46206220] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46404640] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46406300] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46406700] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46407340] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46608020] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47004305] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47006580] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47607420] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47806425] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48207680] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48405220] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49005260] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49205240] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49205380] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405505] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50004640] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50204280] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[44407500] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[44407980] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[44607960] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[44807360] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[45007640] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[45007940] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[45607920] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[45807820] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[46007280] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[46206980] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[46207140] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[46207200] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[46606920] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[46607160] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[47006960] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[47406540] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[47406620] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[47606460] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[48206440] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[48406000] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[48406160] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[48605720] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[48606080] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[48806040] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[62203380] = {
		name = L["Humar the Pridelord"],
		category = "rares",
		faction = "Neutral",
	},
	[40202320] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[40402400] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[40602280] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[40602420] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[40802180] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41002760] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41202120] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41202700] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41602600] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41802160] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41802260] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[42402120] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[37801560] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[38201500] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[38401660] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[38601460] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39001620] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39201380] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39201680] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39401220] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39401320] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39601260] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39601380] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39601720] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39801640] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[40401520] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[40601660] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[40601780] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[40801560] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[59203260] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[59803120] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[60003280] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[60203020] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[60203180] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[60403420] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[60603180] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[60803300] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[61202960] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[61203080] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[61203460] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[61403380] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[46807780] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[46807880] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[47007680] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[47008020] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[47208140] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[47208160] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[48007940] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[48008040] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[48008060] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[43806260] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[44006140] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[44406160] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[44406360] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[44806400] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[45006240] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[45006260] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[46006320] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[46206225] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[46806280] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[56400840] = {
		name = L["Foreman Grills"],
		category = "rares",
		faction = "Alliance",
	},
	[56600860] = {
		name = L["Foreman Grills"],
		category = "rares",
		faction = "Alliance",
	},
	[56200860] = {
		name = L["Engineer Whirleygig"],
		category = "rares",
		faction = "Alliance",
	},
	[42002460] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[42202440] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[42202740] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[42602480] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[42802380] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[46402320] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[46602500] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[46802320] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[52804380] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Neutral",
	},
	[53004460] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Neutral",
	},
	[53403980] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Neutral",
	},
	[54404640] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Neutral",
	},
	[54604620] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Neutral",
	},
	[56404360] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Neutral",
	},
	[56604380] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Neutral",
	},
	[57004120] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Neutral",
	},
	[51803720] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[52003280] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53203780] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53204200] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53204280] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53204360] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53204560] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53403740] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53404140] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53604100] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53604240] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53604260] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53804020] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[54003920] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[54203820] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[54603820] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[55204500] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[55404580] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[55803820] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56203920] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56204260] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56404140] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56404180] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56604020] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[59800800] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[46808480] = {
		name = L["Heggin Stonewhisker"],
		category = "rares",
		description = L["Bael'dun Chief Engineer"],
		faction = "Alliance",
	},
	[47208420] = {
		name = L["Heggin Stonewhisker"],
		category = "rares",
		description = L["Bael'dun Chief Engineer"],
		faction = "Alliance",
	},
	[49408440] = {
		name = L["Malgin Barleybrew"],
		category = "rares",
		description = L["Bael'dun Morale Officer"],
		faction = "Alliance",
	},
	[47408540] = {
		name = L["Digger Flameforge"],
		category = "rares",
		description = L["Excavation Specialist"],
		faction = "Alliance",
	},
	[47408560] = {
		name = L["Digger Flameforge"],
		category = "rares",
		description = L["Excavation Specialist"],
		faction = "Alliance",
	},
	[47608500] = {
		name = L["Digger Flameforge"],
		category = "rares",
		description = L["Excavation Specialist"],
		faction = "Alliance",
	},
	[47808560] = {
		name = L["Digger Flameforge"],
		category = "rares",
		description = L["Excavation Specialist"],
		faction = "Alliance",
	},
	[49408380] = {
		name = L["Captain Gerogg Hammertoe"],
		category = "rares",
		description = L["Bael'dun Captain of the Guard"],
		faction = "Neutral",
	},
	[49608360] = {
		name = L["Captain Gerogg Hammertoe"],
		category = "rares",
		description = L["Bael'dun Captain of the Guard"],
		faction = "Neutral",
	},
	[41407900] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[41807940] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[42008040] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[42208140] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[42208160] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[42607920] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[42808200] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[42808300] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[43808160] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[44008400] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[44208120] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[44208280] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[41004520] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[41204560] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[43204860] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[43205140] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[43404820] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[43405160] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[43804840] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[44205220] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[44805180] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[45405100] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[40804540] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[41804520] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[42204800] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[43004780] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[43004920] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[43604840] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[43604920] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[49201540] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[49401580] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[49402700] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[49601580] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[49602700] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[51002020] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[51202080] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[51402640] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[51402720] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[51602640] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[51602660] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[45808780] = {
		name = L["Ambassador Bloodrage"],
		category = "rares",
		faction = "Neutral",
	},
	[47809060] = {
		name = L["Ambassador Bloodrage"],
		category = "rares",
		faction = "Neutral",
	},
	[48609560] = {
		name = L["Ambassador Bloodrage"],
		category = "rares",
		faction = "Neutral",
	},
	[42407060] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[47606940] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[60002740] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[46403960] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[46204820] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806520] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806840] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47607660] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49005440] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007140] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007180] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806440] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806845] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47606520] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48407700] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007045] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46204825] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806860] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47807640] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49005445] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45006360] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45604145] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[40402460] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[40802540] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41202160] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41202760] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[39001840] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39201260] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[60603160] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[48008080] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[44406300] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[47202360] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[56004380] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56004480] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[58000720] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[58600680] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[60400960] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[60600980] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[60601360] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[60801340] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[47608540] = {
		name = L["Digger Flameforge"],
		category = "rares",
		description = L["Excavation Specialist"],
		faction = "Alliance",
	},
	[42208100] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[43605200] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[45205220] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[40404520] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[40604520] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[42004860] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[44207200] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[57802400] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[58202660] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[45603820] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[45204160] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45407320] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46004620] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006780] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46607940] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47207300] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47406140] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47606200] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47606465] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48006340] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48407760] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48407980] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805280] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805840] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49406120] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49804520] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46004625] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46206960] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47207305] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47406160] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47607665] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48205720] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48408020] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48605580] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805820] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49406125] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45806685] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46404600] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47006520] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47007280] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47805640] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48407765] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805825] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49406140] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006760] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46407360] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47207280] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47406165] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48605740] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49406145] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45007720] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[45607880] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[47206560] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[48206160] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[48606300] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[41002780] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41202640] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41602080] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[38401520] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[41001540] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[60003340] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[60403200] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[61003360] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[61603120] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[61603320] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[62003180] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[46407860] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[46406285] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[42402620] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[53604000] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53204260] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53204420] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53604120] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[55604480] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56204360] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56404000] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56604060] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[60400940] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[60801400] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[61001300] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[47008380] = {
		name = L["Heggin Stonewhisker"],
		category = "rares",
		description = L["Bael'dun Chief Engineer"],
		faction = "Alliance",
	},
	[47808540] = {
		name = L["Digger Flameforge"],
		category = "rares",
		description = L["Excavation Specialist"],
		faction = "Alliance",
	},
	[42808140] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[43408220] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[46007540] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[45205160] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[43404740] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[44406940] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[44407260] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[44807180] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[44807340] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[57802300] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[60602720] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[61002900] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[46403940] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[46404700] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46607280] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46804780] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806565] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47204860] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47407380] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48405760] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48605480] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49205960] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50404360] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50404480] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46607260] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47204800] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47407385] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48205160] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48405765] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805640] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50204360] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46607285] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47205980] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47206500] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805285] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405960] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50204365] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007060] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806200] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46807340] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47206545] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805645] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405965] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[40802760] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[39401240] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39801700] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[40601540] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[61003480] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[48208020] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[53404000] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Alliance",
	},
	[57004100] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53404005] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[54603840] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[54603880] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[55604520] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56003860] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[61001380] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[43405220] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[41404560] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[42807080] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[44606920] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Neutral",
	},
	[46404060] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[45406620] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46004680] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007065] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46206700] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46604680] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47207340] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47807480] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47808100] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48405960] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48407740] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48605880] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45206465] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46004685] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46604685] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47205040] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47207320] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47405120] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47406500] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47807485] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48207000] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48407745] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48605920] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49205980] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006765] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47207325] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47405800] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47406520] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47806440] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47807500] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48405280] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48407960] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48605900] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49806120] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45206620] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46204640] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46204680] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47005040] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47406420] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47406525] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47806445] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48605940] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49605440] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46006880] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[46206780] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[46407020] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[47206700] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[49605800] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[41002500] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41202680] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41802040] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[41802240] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[59803320] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[61203340] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[61803420] = {
		name = L["Swiftmane"],
		category = "rares",
		faction = "Neutral",
	},
	[47207740] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[47608140] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[44206140] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[45406320] = {
		name = L["Azzere the Skyblade"],
		category = "rares",
		faction = "Alliance",
	},
	[52004380] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[55204700] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[55403820] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[55804420] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[59600720] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[61001360] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[41407940] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[41807900] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[42004580] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[49401540] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[50402060] = {
		name = L["Dishu"],
		category = "rares",
		faction = "Alliance",
	},
	[47607060] = {
		name = L["Silithid Harvester"],
		category = "rares",
		faction = "Alliance",
	},
	[58402140] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[58402460] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[59002340] = {
		name = L["Elder Mystic Razorsnout"],
		category = "rares",
		faction = "Alliance",
	},
	[46603920] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[46803960] = {
		name = L["Gesharahan"],
		category = "rares",
		faction = "Alliance",
	},
	[45006420] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45206280] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47006680] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47206525] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47404260] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48006460] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48008065] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48206140] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48606280] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405380] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405800] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405900] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50205780] = {
		name = L["Aean Swiftriver"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45006400] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45406640] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007220] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46807520] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47207380] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47404265] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48607940] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805500] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805620] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48805680] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49405260] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49604820] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49605700] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50404500] = {
		name = L["Thora Feathermoon"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45006425] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45406645] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46007225] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46206200] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[46806620] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47406505] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47808080] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48405640] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[48605320] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49005560] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50204500] = {
		name = L["Hannah Bladeleaf"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45006405] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45206285] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[47606500] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[49204860] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[50204480] = {
		name = L["Marcus Bel"],
		category = "rares",
		description = L["Alliance Outrunner"],
		faction = "Alliance",
	},
	[45407560] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[45607380] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[47406560] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[49405805] = {
		name = L["Brontus"],
		category = "rares",
		faction = "Neutral",
	},
	[41002240] = {
		name = L["Snort the Heckler"],
		category = "rares",
		faction = "Alliance",
	},
	[38401580] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39201660] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[39801780] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[40001720] = {
		name = L["Sister Rathtalon"],
		category = "rares",
		faction = "Alliance",
	},
	[47008000] = {
		name = L["Thunderstomp"],
		category = "rares",
		faction = "Alliance",
	},
	[42602460] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[46602240] = {
		name = L["Stonearm"],
		category = "rares",
		faction = "Alliance",
	},
	[53004420] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53803980] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Alliance",
	},
	[54204660] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Alliance",
	},
	[54404620] = {
		name = L["Brokespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53004465] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[53604020] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[55803900] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[56004400] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[57004380] = {
		name = L["Rocklance"],
		category = "rares",
		faction = "Alliance",
	},
	[60400920] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[60801300] = {
		name = L["Takk the Leaper"],
		category = "rares",
		faction = "Alliance",
	},
	[49208460] = {
		name = L["Malgin Barleybrew"],
		category = "rares",
		description = L["Bael'dun Morale Officer"],
		faction = "Alliance",
	},
	[47408520] = {
		name = L["Digger Flameforge"],
		category = "rares",
		description = L["Excavation Specialist"],
		faction = "Alliance",
	},
	[44207980] = {
		name = L["Hagg Taurenbane"],
		category = "rares",
		description = L["Razormane Champion"],
		faction = "Alliance",
	},
	[45605240] = {
		name = L["Geopriest Gukk'rok"],
		category = "rares",
		faction = "Alliance",
	},
	[41004525] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[43604860] = {
		name = L["Swinegart Spearhide"],
		category = "rares",
		faction = "Alliance",
	},
	[48609520] = {
		name = L["Ambassador Bloodrage"],
		category = "rares",
		faction = "Neutral",
	},
	[51503034] = {
		name = L["Devrak"],
		category = "flightmasters",
		fpName = L["Crossroads, The Barrens"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
}
nodes[1443] = {
	[64601040] = {
		name = L["Baritanas Skyriver"],
		category = "flightmasters",
		fpName = L["Nijel's Point, Desolace"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[21607400] = {
		name = L["Thalon"],
		category = "flightmasters",
		fpName = L["Shadowprey Village, Desolace"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[66200660] = {
		name = L["Innkeeper Lyshaerya"],
		npcID = 11103,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[24006820] = {
		name = L["Innkeeper Sikewa"],
		npcID = 11106,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[24806880] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[65400690] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[67800840] = {
		name = L["Maxton Strang"],
		npcID = 1322,
		category = "repair",
		description = L["Mail Armor Merchant"],
		faction = "Alliance",
	},
	[55605640] = {
		name = L["Muuran"],
		npcID = 8878,
		category = "repair",
		description = L["Superior Macecrafter"],
		faction = "Horde",
	},
	[25807100] = {
		name = L["Hae'Wilani"],
		npcID = 12045,
		category = "repair",
		description = L["Axecrafter"],
		faction = "Horde",
	},
	[50206280] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[65600780] = {
		name = L["Shelgrayn"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[24806885] = {
		name = L["Aboda"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[55205620] = {
		name = L["Narv Hidecrafter"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Expert Leathercrafter"],
		faction = "Horde",
	},
	[23206980] = {
		name = L["Malux"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinning Trainer"],
		faction = "Horde",
	},
	[22607240] = {
		name = L["Lui'Mala"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Horde",
	},
	[66200665] = {
		name = L["Janet Hommers"],
		npcID = 8150,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Alliance",
	},
	[51205320] = {
		name = L["Harnor"],
		npcID = 8152,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Horde",
	},
	[51005340] = {
		name = L["Kireena"],
		npcID = 9636,
		category = "vendors",
		description = L["Trade Goods"],
		faction = "Horde",
	},
	[25007180] = {
		name = L["Tukk"],
		npcID = 12027,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Vendor"],
		faction = "Horde",
	},
	[23007160] = {
		name = L["Lah'Mawhani"],
		npcID = 12028,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Horde",
	},
	[22607200] = {
		name = L["Mai'Lahii"],
		npcID = 12031,
		category = "vendors",
		profession = "fishing",
		description = L["Fishing Supplies"],
		faction = "Horde",
	},
	[26206980] = {
		name = L["Wulan"],
		npcID = 12033,
		category = "vendors",
		description = L["Cooking Supplies"],
		faction = "Horde",
	},
	[60203800] = {
		name = L["Vendor-Tron 1000"],
		npcID = 12245,
		category = "vendors",
		faction = "Neutral",
	},
	[40407920] = {
		name = L["Super-Seller 680"],
		npcID = 12246,
		category = "vendors",
		faction = "Neutral",
	},
	[66600680] = {
		name = L["Christi Galvanis"],
		npcID = 12960,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Alliance",
	},
	[29806240] = {
		name = L["Cursed Centaur"],
		category = "rares",
		faction = "Neutral",
	},
	[74601200] = {
		name = L["Prince Kellen"],
		category = "rares",
		faction = "Neutral",
	},
	[74601340] = {
		name = L["Prince Kellen"],
		category = "rares",
		faction = "Neutral",
	},
	[77202220] = {
		name = L["Prince Kellen"],
		category = "rares",
		faction = "Neutral",
	},
	[78002320] = {
		name = L["Prince Kellen"],
		category = "rares",
		faction = "Neutral",
	},
	[49007120] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
	[49407260] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
	[55007660] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
	[56407500] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
	[40804720] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[43204840] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[43404180] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[43406120] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[43604240] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[43806180] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[45405240] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[45405460] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[45805340] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[46405400] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[57400840] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[57401000] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[63003500] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[65602440] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[66201720] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[67202340] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[28801460] = {
		name = L["Accursed Slitherblade"],
		category = "rares",
		faction = "Neutral",
	},
	[34800500] = {
		name = L["Accursed Slitherblade"],
		category = "rares",
		faction = "Neutral",
	},
	[29606240] = {
		name = L["Cursed Centaur"],
		category = "rares",
		faction = "Neutral",
	},
	[50007200] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
	[50808000] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
	[63403440] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[63403560] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[63803480] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[66401940] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[66601740] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[28801420] = {
		name = L["Accursed Slitherblade"],
		category = "rares",
		faction = "Neutral",
	},
	[29401540] = {
		name = L["Accursed Slitherblade"],
		category = "rares",
		faction = "Neutral",
	},
	[55207620] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
	[41204820] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[41004680] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[55004860] = {
		name = L["Hissperak"],
		category = "rares",
		faction = "Neutral",
	},
	[61202500] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[66402540] = {
		name = L["Giggler"],
		category = "rares",
		faction = "Neutral",
	},
	[35000380] = {
		name = L["Accursed Slitherblade"],
		category = "rares",
		faction = "Neutral",
	},
	[76001840] = {
		name = L["Prince Kellen"],
		category = "rares",
		faction = "Neutral",
	},
	[76601740] = {
		name = L["Prince Kellen"],
		category = "rares",
		faction = "Neutral",
	},
	[48807000] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
	[49007080] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
	[49007180] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
	[50407660] = {
		name = L["Kaskk"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1445] = {
	[67405120] = {
		name = L["Baldruc"],
		category = "flightmasters",
		fpName = L["Theramore, Dustwallow Marsh"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[35603180] = {
		name = L["Shardi"],
		category = "flightmasters",
		fpName = L["Brackenwall Village, Dustwallow Marsh"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[66604520] = {
		name = L["Innkeeper Janene"],
		npcID = 6272,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[65904540] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[36403080] = {
		name = L["Krak"],
		npcID = 4883,
		category = "repair",
		description = L["Armorer"],
		faction = "Horde",
	},
	[36203160] = {
		name = L["Zulrg"],
		npcID = 4884,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Horde",
	},
	[64605040] = {
		name = L["Hans Weston"],
		npcID = 4886,
		category = "repair",
		description = L["Armorer & Shieldsmith"],
		faction = "Alliance",
	},
	[64605020] = {
		name = L["Marie Holdston"],
		npcID = 4888,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[67404800] = {
		name = L["Torq Ironblast"],
		npcID = 4889,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gunsmith"],
		faction = "Alliance",
	},
	[67404780] = {
		name = L["Piter Verance"],
		npcID = 4890,
		category = "repair",
		description = L["Weaponsmith & Armorer"],
		faction = "Alliance",
	},
	[67804980] = {
		name = L["Jensen Farran"],
		npcID = 4892,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Alliance",
	},
	[35403020] = {
		name = L["Zanara"],
		npcID = 9552,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Horde",
	},
	[39603080] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[63604300] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[66004540] = {
		name = L["Michael"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[64004760] = {
		name = L["Brant Jasperbloom"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalist"],
		faction = "Alliance",
	},
	[64004780] = {
		name = L["Alchemist Narett"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Expert Alchemist"],
		faction = "Alliance",
	},
	[67404740] = {
		name = L["Brother Karman"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[67804820] = {
		name = L["Captain Evencane"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[66205160] = {
		name = L["Timothy Worthington"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Master Tailor"],
		faction = "Alliance",
	},
	[36603100] = {
		name = L["Ogg'marr"],
		npcID = 4879,
		category = "vendors",
		description = L["Butcher"],
		faction = "Horde",
	},
	[65205140] = {
		name = L["Gregor MacVince"],
		npcID = 4885,
		category = "vendors",
		description = L["Horse Breeder"],
		faction = "Alliance",
	},
	[68204740] = {
		name = L["Dwane Wertle"],
		npcID = 4891,
		category = "vendors",
		description = L["Chef"],
		faction = "Alliance",
	},
	[66604525] = {
		name = L["Bartender Lillian"],
		npcID = 4893,
		category = "vendors",
		description = L["Bartender"],
		faction = "Alliance",
	},
	[66804520] = {
		name = L["Craig Nollward"],
		npcID = 4894,
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cook"],
		faction = "Alliance",
	},
	[67405160] = {
		name = L["Charity Mipsy"],
		npcID = 4896,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Alliance",
	},
	[66405140] = {
		name = L["Helenia Olden"],
		npcID = 4897,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Alliance",
	},
	[64004765] = {
		name = L["Uma Bartulm"],
		npcID = 4899,
		category = "vendors",
		profession = "alchemy",
		description = L["Herbalism & Alchemy Supplies"],
		faction = "Alliance",
	},
	[35203080] = {
		name = L["Ghok'kah"],
		npcID = 6567,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Horde",
	},
	[36403040] = {
		name = L["Balai Lok'Wein"],
		npcID = 13476,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Potions, Scrolls and Reagents"],
		faction = "Horde",
	},
	[44408100] = {
		name = L["Brimgore"],
		category = "rares",
		faction = "Neutral",
	},
	[30202140] = {
		name = L["Darkmist Widow"],
		category = "rares",
		faction = "Neutral",
	},
	[30802060] = {
		name = L["Darkmist Widow"],
		category = "rares",
		faction = "Neutral",
	},
	[31002040] = {
		name = L["Darkmist Widow"],
		category = "rares",
		faction = "Neutral",
	},
	[56801720] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[58600800] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[59401040] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[61800720] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[62201900] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[62400820] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[62600800] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[62600920] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[63602640] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[63800840] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[64002720] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[39201960] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[40202080] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[41201900] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[41202000] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[42802200] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[46401860] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[46801740] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[47001760] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[47201880] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[47401540] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[47801880] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[48201760] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[48801800] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[41805540] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[43805060] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[47605440] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[49005720] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[49405780] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[51406440] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[51806140] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[52806600] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[54006500] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[55406780] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[50804980] = {
		name = L["The Rot"],
		category = "rares",
		faction = "Neutral",
	},
	[50805800] = {
		name = L["The Rot"],
		category = "rares",
		faction = "Neutral",
	},
	[51805800] = {
		name = L["The Rot"],
		category = "rares",
		faction = "Neutral",
	},
	[52405540] = {
		name = L["The Rot"],
		category = "rares",
		faction = "Neutral",
	},
	[52805340] = {
		name = L["The Rot"],
		category = "rares",
		faction = "Neutral",
	},
	[55206140] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[55206200] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[57006140] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[57206180] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[39206340] = {
		name = L["Oozeworm"],
		category = "rares",
		faction = "Neutral",
	},
	[38802040] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[48801920] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[49002080] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[49201960] = {
		name = L["Dart"],
		category = "rares",
		faction = "Neutral",
	},
	[44405000] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[47605480] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[52605960] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[52606620] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[52605160] = {
		name = L["The Rot"],
		category = "rares",
		faction = "Neutral",
	},
	[42007560] = {
		name = L["Brimgore"],
		category = "rares",
		faction = "Neutral",
	},
	[30402100] = {
		name = L["Darkmist Widow"],
		category = "rares",
		faction = "Horde",
	},
	[63402760] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Neutral",
	},
	[37601400] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[46601640] = {
		name = L["Dart"],
		category = "rares",
		faction = "Horde",
	},
	[46801720] = {
		name = L["Dart"],
		category = "rares",
		faction = "Horde",
	},
	[48601900] = {
		name = L["Dart"],
		category = "rares",
		faction = "Horde",
	},
	[47205360] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[53605420] = {
		name = L["The Rot"],
		category = "rares",
		faction = "Neutral",
	},
	[54606460] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[57006180] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[36606260] = {
		name = L["Oozeworm"],
		category = "rares",
		faction = "Neutral",
	},
	[39002020] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[42005540] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[43605040] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[47605360] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[52606600] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[54405940] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[39807360] = {
		name = L["Brimgore"],
		category = "rares",
		faction = "Neutral",
	},
	[41207520] = {
		name = L["Brimgore"],
		category = "rares",
		faction = "Neutral",
	},
	[58200940] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Horde",
	},
	[59600920] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Horde",
	},
	[62201840] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Horde",
	},
	[63601740] = {
		name = L["Burgle Eye"],
		category = "rares",
		faction = "Horde",
	},
	[39601980] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[47401980] = {
		name = L["Dart"],
		category = "rares",
		faction = "Horde",
	},
	[37805020] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[51806620] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[54605940] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[54806260] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[54806420] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[57406220] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[36206180] = {
		name = L["Oozeworm"],
		category = "rares",
		faction = "Neutral",
	},
	[36206300] = {
		name = L["Oozeworm"],
		category = "rares",
		faction = "Neutral",
	},
	[39001960] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[39602120] = {
		name = L["Drogoth the Roamer"],
		category = "rares",
		faction = "Neutral",
	},
	[48401440] = {
		name = L["Dart"],
		category = "rares",
		faction = "Horde",
	},
	[48601680] = {
		name = L["Dart"],
		category = "rares",
		faction = "Horde",
	},
	[43405020] = {
		name = L["Ripscale"],
		category = "rares",
		faction = "Neutral",
	},
	[53206560] = {
		name = L["Hayoc"],
		category = "rares",
		faction = "Neutral",
	},
	[52005100] = {
		name = L["The Rot"],
		category = "rares",
		faction = "Neutral",
	},
	[56606120] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[57206160] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
	[57606200] = {
		name = L["Lord Angler"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1448] = {
	[34405380] = {
		name = L["Brakkar"],
		category = "flightmasters",
		fpName = L["Bloodvenom Post, Felwood"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[62402420] = {
		name = L["Mishellena"],
		category = "flightmasters",
		fpName = L["Talonbranch Glade, Felwood"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[34805300] = {
		name = L["Altsoba Ragetotem"],
		npcID = 10379,
		category = "repair",
		description = L["Weapon Merchant"],
		faction = "Horde",
	},
	[62402580] = {
		name = L["Mylini Frostmoon"],
		npcID = 15315,
		category = "repair",
		description = L["Weapon Merchant"],
		faction = "Alliance",
	},
	[49403060] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[56208660] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[62202420] = {
		name = L["Nalesette Wildbringer"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Alliance",
	},
	[61802360] = {
		name = L["Kaerbrus"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[62002440] = {
		name = L["Golhine the Hooded"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Alliance",
	},
	[65600280] = {
		name = L["Meilosh"],
		category = "primaryProfession",
		profession = "tailoring",
		faction = "Neutral",
	},
	[62202560] = {
		name = L["Malygen"],
		npcID = 2803,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Alliance",
	},
	[34805305] = {
		name = L["Bale"],
		npcID = 2806,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Horde",
	},
	[58201760] = {
		name = L["Dessecus"],
		category = "rares",
		faction = "Neutral",
	},
	[38803820] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[38804220] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[39804280] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[43004060] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[43203920] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[44604160] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[45804040] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[46204060] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[47203940] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[48407840] = {
		name = L["Death Howl"],
		category = "rares",
		faction = "Neutral",
	},
	[38808160] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[47609260] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[48409120] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[48409180] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[48608980] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[48609160] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[58201840] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[40607900] = {
		name = L["Mongress"],
		category = "rares",
		faction = "Neutral",
	},
	[57801960] = {
		name = L["Dessecus"],
		category = "rares",
		faction = "Neutral",
	},
	[58601860] = {
		name = L["Dessecus"],
		category = "rares",
		faction = "Neutral",
	},
	[42204180] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[43004020] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[43804240] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[44603780] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[46204220] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[46604300] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[40208400] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[40608600] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[43008540] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[43008580] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[48209180] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[48809120] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[48809180] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[54802560] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[43007680] = {
		name = L["Mongress"],
		category = "rares",
		faction = "Neutral",
	},
	[42804760] = {
		name = L["The Ongar"],
		category = "rares",
		faction = "Neutral",
	},
	[43205040] = {
		name = L["The Ongar"],
		category = "rares",
		faction = "Neutral",
	},
	[57202060] = {
		name = L["Dessecus"],
		category = "rares",
		faction = "Neutral",
	},
	[57402240] = {
		name = L["Dessecus"],
		category = "rares",
		faction = "Neutral",
	},
	[57801740] = {
		name = L["Dessecus"],
		category = "rares",
		faction = "Neutral",
	},
	[58201780] = {
		name = L["Dessecus"],
		category = "rares",
		faction = "Neutral",
	},
	[40604200] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[41204140] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[42004120] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[43204380] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[44004480] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[44403960] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[44604220] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[44804080] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[45003980] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[56408900] = {
		name = L["Death Howl"],
		category = "rares",
		faction = "Neutral",
	},
	[40208520] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[47009280] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[47609360] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[55002140] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[55202200] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[56400920] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[57002200] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[42204860] = {
		name = L["The Ongar"],
		category = "rares",
		faction = "Neutral",
	},
	[42608700] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[49009280] = {
		name = L["Ragepaw"],
		category = "rares",
		faction = "Neutral",
	},
	[56400860] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[39204460] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[39604200] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[40004060] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[41003980] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[42604120] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[39008360] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[42208660] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[54602560] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[54802520] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[57202140] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[46608400] = {
		name = L["Mongress"],
		category = "rares",
		faction = "Neutral",
	},
	[46808320] = {
		name = L["Mongress"],
		category = "rares",
		faction = "Neutral",
	},
	[39004880] = {
		name = L["The Ongar"],
		category = "rares",
		faction = "Neutral",
	},
	[43405020] = {
		name = L["The Ongar"],
		category = "rares",
		faction = "Neutral",
	},
	[57401760] = {
		name = L["Dessecus"],
		category = "rares",
		faction = "Horde",
	},
	[39804200] = {
		name = L["Immolatus"],
		category = "rares",
		faction = "Neutral",
	},
	[48007800] = {
		name = L["Death Howl"],
		category = "rares",
		faction = "Neutral",
	},
	[41008620] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[42808620] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[43008800] = {
		name = L["Alshirr Banebreath"],
		category = "rares",
		faction = "Neutral",
	},
	[58201880] = {
		name = L["Olm the Wise"],
		category = "rares",
		faction = "Neutral",
	},
	[46808300] = {
		name = L["Mongress"],
		category = "rares",
		faction = "Neutral",
	},
	[41404720] = {
		name = L["The Ongar"],
		category = "rares",
		faction = "Neutral",
	},
	[42404720] = {
		name = L["The Ongar"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1447] = {
	[22004960] = {
		name = L["Kroum"],
		category = "flightmasters",
		fpName = L["Valormok, Azshara"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[11807740] = {
		name = L["Jarrodenus"],
		category = "flightmasters",
		fpName = L["Talrendis Point, Azshara"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[22205120] = {
		name = L["Gruul Darkblade"],
		npcID = 10361,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Horde",
	},
	[12007820] = {
		name = L["Brinna Valanaar"],
		npcID = 14301,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Alliance",
	},
	[54207140] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[70401560] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[37406540] = {
		name = L["Peter Galen"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Master Dragonscale Leatherworker"],
		faction = "Alliance",
	},
	[21805200] = {
		name = L["Kurll"],
		npcID = 3621,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Horde",
	},
	[45209080] = {
		name = L["Jubie Gadgetspring"],
		npcID = 8678,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplier"],
		faction = "Alliance",
	},
	[45209085] = {
		name = L["Blimo Gadgetspring"],
		npcID = 12957,
		category = "vendors",
		description = L["Trade Supplier"],
		faction = "Neutral",
	},
	[13407240] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[13407480] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[13607300] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[14007200] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[15807080] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[16207220] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[16406900] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[16606960] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[17006900] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[17406840] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[17606920] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[17806660] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[59403120] = {
		name = L["Magister Hawkhelm"],
		category = "rares",
		faction = "Neutral",
	},
	[17005460] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[17606020] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[48602320] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[51002960] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[54802420] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[55402040] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[35205680] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36405340] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36405700] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36605380] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36805220] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36805480] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[37005720] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[39004840] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[39604660] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[39604840] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[39605520] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[39804860] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[41205420] = {
		name = L["General Fangferror"],
		category = "rares",
		faction = "Neutral",
	},
	[39603360] = {
		name = L["Gatekeeper Rageroar"],
		category = "rares",
		faction = "Neutral",
	},
	[17205340] = {
		name = L["The Evalcharr"],
		category = "rares",
		faction = "Neutral",
	},
	[54004900] = {
		name = L["Scalebeard"],
		category = "rares",
		faction = "Neutral",
	},
	[13407300] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[14807220] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[15007300] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[16007300] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[16406880] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[16606760] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[16806660] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[17006920] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[17606940] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[17607020] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[56407820] = {
		name = L["Monnos the Elder"],
		category = "rares",
		faction = "Neutral",
	},
	[57002880] = {
		name = L["Magister Hawkhelm"],
		category = "rares",
		faction = "Neutral",
	},
	[50202840] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[52803060] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[35805700] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36404800] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36405300] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36804800] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[38605580] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[39804560] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[38203200] = {
		name = L["Gatekeeper Rageroar"],
		category = "rares",
		faction = "Neutral",
	},
	[61802560] = {
		name = L["Master Feardred"],
		category = "rares",
		faction = "Neutral",
	},
	[17806665] = {
		name = L["The Evalcharr"],
		category = "rares",
		faction = "Neutral",
	},
	[18206580] = {
		name = L["The Evalcharr"],
		category = "rares",
		faction = "Neutral",
	},
	[23405500] = {
		name = L["The Evalcharr"],
		category = "rares",
		faction = "Neutral",
	},
	[16607060] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[16607280] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Horde",
	},
	[39204880] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[40204560] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[18806600] = {
		name = L["The Evalcharr"],
		category = "rares",
		faction = "Neutral",
	},
	[55004840] = {
		name = L["Scalebeard"],
		category = "rares",
		faction = "Neutral",
	},
	[13607280] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[16607200] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[17607000] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[19007020] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[36805260] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Alliance",
	},
	[37005640] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Alliance",
	},
	[39004940] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Alliance",
	},
	[39604800] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Alliance",
	},
	[39805000] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Alliance",
	},
	[40405400] = {
		name = L["General Fangferror"],
		category = "rares",
		faction = "Neutral",
	},
	[41605400] = {
		name = L["General Fangferror"],
		category = "rares",
		faction = "Neutral",
	},
	[16807180] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[55807940] = {
		name = L["Monnos the Elder"],
		category = "rares",
		faction = "Neutral",
	},
	[79401780] = {
		name = L["Monnos the Elder"],
		category = "rares",
		faction = "Neutral",
	},
	[50402820] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[51803460] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[36205500] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36405400] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36605400] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36805460] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36805760] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[37005020] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[38205580] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[39405520] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[39605560] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[40205300] = {
		name = L["General Fangferror"],
		category = "rares",
		faction = "Neutral",
	},
	[38403280] = {
		name = L["Gatekeeper Rageroar"],
		category = "rares",
		faction = "Neutral",
	},
	[39003300] = {
		name = L["Gatekeeper Rageroar"],
		category = "rares",
		faction = "Neutral",
	},
	[61802540] = {
		name = L["Master Feardred"],
		category = "rares",
		faction = "Neutral",
	},
	[18006580] = {
		name = L["The Evalcharr"],
		category = "rares",
		faction = "Neutral",
	},
	[54204840] = {
		name = L["Scalebeard"],
		category = "rares",
		faction = "Neutral",
	},
	[54404740] = {
		name = L["Scalebeard"],
		category = "rares",
		faction = "Neutral",
	},
	[54404860] = {
		name = L["Scalebeard"],
		category = "rares",
		faction = "Neutral",
	},
	[16406980] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[16407180] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[16806780] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[17206620] = {
		name = L["Varo'then's Ghost"],
		category = "rares",
		faction = "Neutral",
	},
	[81001700] = {
		name = L["Monnos the Elder"],
		category = "rares",
		faction = "Neutral",
	},
	[81601800] = {
		name = L["Monnos the Elder"],
		category = "rares",
		faction = "Neutral",
	},
	[17405360] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[49002600] = {
		name = L["Antilos"],
		category = "rares",
		faction = "Neutral",
	},
	[36405600] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[36805680] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[37204880] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[37605180] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[38405480] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[39005560] = {
		name = L["Lady Sesspira"],
		category = "rares",
		faction = "Neutral",
	},
	[41005200] = {
		name = L["General Fangferror"],
		category = "rares",
		faction = "Neutral",
	},
	[38203220] = {
		name = L["Gatekeeper Rageroar"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1449] = {
	[45200580] = {
		name = L["Gryfe"],
		category = "flightmasters",
		fpName = L["Marshal's Refuge, Un'Goro Crater"],
		description = L["Flight Master"],
		faction = "Neutral",
	},
	[44000720] = {
		name = L["Gibbert"],
		npcID = 3000,
		category = "repair",
		description = L["Weapon Merchant"],
		faction = "Neutral",
	},
	[80004980] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[43200780] = {
		name = L["Nergal"],
		npcID = 12959,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Vendor"],
		faction = "Neutral",
	},
	[62006440] = {
		name = L["Ravasaur Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[65006820] = {
		name = L["Ravasaur Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[49408320] = {
		name = L["Clutchmother Zavas"],
		category = "rares",
		faction = "Neutral",
	},
	[49408400] = {
		name = L["Clutchmother Zavas"],
		category = "rares",
		faction = "Neutral",
	},
	[30404620] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[31203520] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[31604800] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[31804700] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[32003520] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[34003560] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[36202920] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[67001420] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Neutral",
	},
	[68401420] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Neutral",
	},
	[68601420] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Neutral",
	},
	[68801540] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Neutral",
	},
	[69401680] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Neutral",
	},
	[67006260] = {
		name = L["Ravasaur Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44608160] = {
		name = L["Clutchmother Zavas"],
		category = "rares",
		faction = "Neutral",
	},
	[48808500] = {
		name = L["Clutchmother Zavas"],
		category = "rares",
		faction = "Neutral",
	},
	[29003600] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[37003120] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[68201200] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Neutral",
	},
	[68601220] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Neutral",
	},
	[68601300] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Neutral",
	},
	[37807460] = {
		name = L["Gruff"],
		category = "rares",
		faction = "Neutral",
	},
	[38407620] = {
		name = L["Gruff"],
		category = "rares",
		faction = "Neutral",
	},
	[28803500] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[29403160] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[31003260] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[31203040] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[32803140] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[33203220] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[35203700] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[37603820] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[68801520] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Horde",
	},
	[69401620] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Horde",
	},
	[61007220] = {
		name = L["Ravasaur Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[63406300] = {
		name = L["Ravasaur Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[39007580] = {
		name = L["Gruff"],
		category = "rares",
		faction = "Neutral",
	},
	[29404740] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[68601400] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Horde",
	},
	[68801180] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Horde",
	},
	[62606700] = {
		name = L["Ravasaur Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[49008480] = {
		name = L["Clutchmother Zavas"],
		category = "rares",
		faction = "Neutral",
	},
	[32202940] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[34204160] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[34603580] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[36403060] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[68401460] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Neutral",
	},
	[59807100] = {
		name = L["Ravasaur Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[65006740] = {
		name = L["Ravasaur Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[27203040] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[29203100] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[29604800] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[30604680] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[31204520] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[32202680] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[32203200] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[32403920] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[38202900] = {
		name = L["King Mosh"],
		category = "rares",
		faction = "Neutral",
	},
	[68801560] = {
		name = L["Uhk'loc"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1450] = {
	[48006720] = {
		name = L["Sindrayl"],
		category = "flightmasters",
		fpName = L["Moonglade"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[32206640] = {
		name = L["Faustron"],
		category = "flightmasters",
		fpName = L["Moonglade"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[51803300] = {
		name = L["Geenia Sunshadow"],
		npcID = 4184,
		category = "repair",
		description = L["Speciality Dress Maker"],
		faction = "Neutral",
	},
	[56403000] = {
		name = L["Kharedon"],
		npcID = 12023,
		category = "repair",
		description = L["Light Armor Merchant"],
		faction = "Neutral",
	},
	[51204220] = {
		name = L["Meliri"],
		npcID = 12024,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Neutral",
	},
	[53204280] = {
		name = L["Narianna"],
		npcID = 12029,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Neutral",
	},
	[45604680] = {
		name = L["Malvor"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalist"],
		faction = "Neutral",
	},
	[52404040] = {
		name = L["Loganaar"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Neutral",
	},
	[51603320] = {
		name = L["Darnall"],
		npcID = 7940,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Neutral",
	},
	[48603920] = {
		name = L["Dargon"],
		npcID = 12019,
		category = "vendors",
		description = L["Food & Drink Merchant"],
		faction = "Neutral",
	},
	[45003460] = {
		name = L["Daeolyn Summerleaf"],
		npcID = 12021,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Neutral",
	},
	[48404020] = {
		name = L["Lorelae Wintersong"],
		npcID = 12022,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Neutral",
	},
	[44403400] = {
		name = L["My'lanna"],
		npcID = 12026,
		category = "vendors",
		description = L["Food & Drink Merchant"],
		faction = "Neutral",
	},
	[44404540] = {
		name = L["Bunthen Plainswind"],
		category = "flightmasters",
		fpName = L["Thunder Bluff Flight Master"],
		description = L["Thunder Bluff Flight Master"],
		classes = {
			DRUID = true,
		},
		faction = "Horde",
	},
	[44204520] = {
		name = L["Silva Fil'naveth"],
		category = "flightmasters",
		fpName = L["Darnassus Flight Master"],
		description = L["Darnassus Flight Master"],
		classes = {
			DRUID = true,
		},
		faction = "Alliance",
	},
}
nodes[1444] = {
	[89404580] = {
		name = L["Thyssiana"],
		category = "flightmasters",
		fpName = L["Thalanaar, Feralas"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[30204320] = {
		name = L["Fyldren Moonfeather"],
		category = "flightmasters",
		fpName = L["Feathermoon, Feralas"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[75404420] = {
		name = L["Shyn"],
		category = "flightmasters",
		fpName = L["Camp Mojache, Feralas"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[31004340] = {
		name = L["Innkeeper Shyria"],
		npcID = 7736,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[74804500] = {
		name = L["Innkeeper Greul"],
		npcID = 7737,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[31204380] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[74904400] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[89404585] = {
		name = L["Rendow"],
		npcID = 1695,
		category = "vendors",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[30604260] = {
		name = L["Pratt McGrubben"],
		npcID = 7852,
		category = "repair",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Alliance",
	},
	[74604260] = {
		name = L["Worb Strongstitch"],
		npcID = 8159,
		category = "repair",
		description = L["Light Armor Merchant"],
		faction = "Horde",
	},
	[74804560] = {
		name = L["Cawind Trueaim"],
		npcID = 9548,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gunsmith & Bowyer"],
		faction = "Horde",
	},
	[30804320] = {
		name = L["Dulciea Frostmoon"],
		npcID = 10293,
		category = "repair",
		description = L["Cloth Armor Merchant"],
		faction = "Alliance",
	},
	[31604800] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[54804780] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[73004480] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[74404320] = {
		name = L["Shyrka Wolfrunner"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[31404320] = {
		name = L["Antarius"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[89404640] = {
		name = L["Caryssia Moonhunter"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Tribal Leatherworking Trainer"],
		faction = "Alliance",
	},
	[32204160] = {
		name = L["Brannock"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Alliance",
	},
	[32604380] = {
		name = L["Kylanna Windwhisper"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Master Alchemist"],
		faction = "Alliance",
	},
	[31604420] = {
		name = L["Xylinnia Starshine"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Expert Enchanter"],
		faction = "Alliance",
	},
	[76004220] = {
		name = L["Jannos Lighthoof"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Horde",
	},
	[74404300] = {
		name = L["Kulleg Stonehorn"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinning Trainer"],
		faction = "Horde",
	},
	[76004340] = {
		name = L["Ruw"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Horde",
	},
	[74404305] = {
		name = L["Hahrana Ironhide"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Master Leatherworker"],
		faction = "Horde",
	},
	[74604480] = {
		name = L["Tarhus"],
		npcID = 3500,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Horde",
	},
	[30804200] = {
		name = L["Jadenvis Seawatcher"],
		npcID = 3700,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Alliance",
	},
	[89004580] = {
		name = L["Brienna Starglow"],
		npcID = 6576,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Alliance",
	},
	[49201980] = {
		name = L["Kalin Windflight"],
		npcID = 7772,
		category = "vendors",
		faction = "Neutral",
	},
	[45002540] = {
		name = L["Gregan Brewspewer"],
		npcID = 7775,
		category = "vendors",
		faction = "Neutral",
	},
	[74404280] = {
		name = L["Jangdor Swiftstrider"],
		npcID = 7854,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Horde",
	},
	[32404380] = {
		name = L["Quintis Jonespyre"],
		npcID = 7879,
		category = "vendors",
		faction = "Alliance",
	},
	[31004320] = {
		name = L["Mardrack Greenwell"],
		npcID = 7941,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Alliance",
	},
	[30604340] = {
		name = L["Faralorn"],
		npcID = 7942,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[31004620] = {
		name = L["Harklane"],
		npcID = 7943,
		category = "vendors",
		description = L["Fish Vendor"],
		faction = "Alliance",
	},
	[31004625] = {
		name = L["Savanne"],
		npcID = 7945,
		category = "vendors",
		profession = "fishing",
		description = L["Fishing Supplies"],
		faction = "Alliance",
	},
	[31204340] = {
		name = L["Vivianna"],
		npcID = 7947,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Alliance",
	},
	[75404380] = {
		name = L["Loorana"],
		npcID = 8143,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Horde",
	},
	[74404285] = {
		name = L["Sheendra Tallgrass"],
		npcID = 8145,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Horde",
	},
	[32604400] = {
		name = L["Logannas"],
		npcID = 8157,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Alliance",
	},
	[76004320] = {
		name = L["Bronk"],
		npcID = 8158,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Horde",
	},
	[44804340] = {
		name = L["Zorbin Fandazzle"],
		npcID = 14637,
		category = "vendors",
		faction = "Neutral",
	},
	[24607280] = {
		name = L["Lady Szallah"],
		category = "rares",
		faction = "Neutral",
	},
	[26406560] = {
		name = L["Lady Szallah"],
		category = "rares",
		faction = "Neutral",
	},
	[27206880] = {
		name = L["Lady Szallah"],
		category = "rares",
		faction = "Neutral",
	},
	[28006780] = {
		name = L["Lady Szallah"],
		category = "rares",
		faction = "Neutral",
	},
	[51005980] = {
		name = L["Bloodroar the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[52006080] = {
		name = L["Bloodroar the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[52206020] = {
		name = L["Bloodroar the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[55607480] = {
		name = L["Antilus the Soarer"],
		category = "rares",
		faction = "Neutral",
	},
	[58207360] = {
		name = L["Antilus the Soarer"],
		category = "rares",
		faction = "Neutral",
	},
	[39402300] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[41202420] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[41402500] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[42402340] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[44602280] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[46002540] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[46002620] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[72006420] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[74006260] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[74006460] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[76606560] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[77806220] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[77806360] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[60405940] = {
		name = L["Old Grizzlegut"],
		category = "rares",
		faction = "Neutral",
	},
	[66204740] = {
		name = L["Old Grizzlegut"],
		category = "rares",
		faction = "Neutral",
	},
	[69204700] = {
		name = L["Old Grizzlegut"],
		category = "rares",
		faction = "Neutral",
	},
	[75403880] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[76203800] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[76803900] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[78003860] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[81403940] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[82203980] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[51805960] = {
		name = L["Bloodroar the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[54807420] = {
		name = L["Antilus the Soarer"],
		category = "rares",
		faction = "Neutral",
	},
	[39402200] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[40402220] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[40602200] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[46002340] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[74206260] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[74206460] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[78006400] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[57805760] = {
		name = L["Old Grizzlegut"],
		category = "rares",
		faction = "Neutral",
	},
	[58005700] = {
		name = L["Old Grizzlegut"],
		category = "rares",
		faction = "Neutral",
	},
	[68604840] = {
		name = L["Old Grizzlegut"],
		category = "rares",
		faction = "Neutral",
	},
	[75203680] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[76004345] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[77603820] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[79203760] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[79403860] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[51805980] = {
		name = L["Bloodroar the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[54207000] = {
		name = L["Antilus the Soarer"],
		category = "rares",
		faction = "Neutral",
	},
	[40002320] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[44402260] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[45802340] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[46402400] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[76606620] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[68004800] = {
		name = L["Old Grizzlegut"],
		category = "rares",
		faction = "Neutral",
	},
	[72005800] = {
		name = L["Gnarl Leafbrother"],
		category = "rares",
		faction = "Neutral",
	},
	[75003620] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[75803740] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[76003880] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[78403840] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[79803920] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[83403860] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[53005980] = {
		name = L["Bloodroar the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[44602260] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[73806440] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[74206220] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[77006540] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[75005880] = {
		name = L["Gnarl Leafbrother"],
		category = "rares",
		faction = "Neutral",
	},
	[80804040] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[25007260] = {
		name = L["Lady Szallah"],
		category = "rares",
		faction = "Neutral",
	},
	[51605940] = {
		name = L["Bloodroar the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[52206000] = {
		name = L["Bloodroar the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[43402420] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[44802240] = {
		name = L["Arash-ethis"],
		category = "rares",
		faction = "Neutral",
	},
	[72206440] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Neutral",
	},
	[58005660] = {
		name = L["Old Grizzlegut"],
		category = "rares",
		faction = "Neutral",
	},
	[70605780] = {
		name = L["Gnarl Leafbrother"],
		category = "rares",
		faction = "Neutral",
	},
	[75803880] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[51806040] = {
		name = L["Bloodroar the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[73606300] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Alliance",
	},
	[76806540] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Alliance",
	},
	[78206260] = {
		name = L["Qirot"],
		category = "rares",
		faction = "Alliance",
	},
	[73005820] = {
		name = L["Gnarl Leafbrother"],
		category = "rares",
		faction = "Neutral",
	},
	[74405840] = {
		name = L["Gnarl Leafbrother"],
		category = "rares",
		faction = "Neutral",
	},
	[75403740] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
	[78403780] = {
		name = L["Snarler"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1451] = {
	[50603440] = {
		name = L["Cloud Skydancer"],
		category = "flightmasters",
		fpName = L["Cenarion Hold, Silithus"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[48803660] = {
		name = L["Runk Windtamer"],
		category = "flightmasters",
		fpName = L["Cenarion Hold, Silithus"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[51803900] = {
		name = L["Calandrath"],
		npcID = 15174,
		category = "innkeepers",
		vendors = {
			ammo = true,
		},
		description = L["Innkeeper"],
		faction = "Neutral",
	},
	[51703790] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Neutral",
	},
	[47003840] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[81801780] = {
		name = L["Zannok Hidepiercer"],
		npcID = 12956,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Neutral",
	},
	[48803700] = {
		name = L["Khur Hornstriker"],
		npcID = 15175,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Neutral",
	},
	[26802640] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[19602260] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[22202620] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[29201880] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[29801720] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[22609020] = {
		name = L["Setis"],
		category = "rares",
		faction = "Neutral",
	},
	[59801820] = {
		name = L["Krellack"],
		category = "rares",
		faction = "Neutral",
	},
	[60001920] = {
		name = L["Krellack"],
		category = "rares",
		faction = "Neutral",
	},
	[62804420] = {
		name = L["Krellack"],
		category = "rares",
		faction = "Neutral",
	},
	[65603060] = {
		name = L["Krellack"],
		category = "rares",
		faction = "Neutral",
	},
	[48206740] = {
		name = L["Grubthor"],
		category = "rares",
		faction = "Neutral",
	},
	[29001480] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[64608100] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[26001340] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[27001380] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[29001840] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[40805640] = {
		name = L["Gretheer"],
		category = "rares",
		faction = "Neutral",
	},
	[47406140] = {
		name = L["Gretheer"],
		category = "rares",
		faction = "Neutral",
	},
	[53608680] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[55007260] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[55008940] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[19605720] = {
		name = L["Zora"],
		category = "rares",
		faction = "Neutral",
	},
	[23606960] = {
		name = L["Zora"],
		category = "rares",
		faction = "Neutral",
	},
	[61404400] = {
		name = L["Krellack"],
		category = "rares",
		faction = "Neutral",
	},
	[62804280] = {
		name = L["Krellack"],
		category = "rares",
		faction = "Neutral",
	},
	[66202840] = {
		name = L["Krellack"],
		category = "rares",
		faction = "Neutral",
	},
	[48606720] = {
		name = L["Grubthor"],
		category = "rares",
		faction = "Neutral",
	},
	[22001540] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[24201480] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[25401220] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Neutral",
	},
	[22608720] = {
		name = L["Setis"],
		category = "rares",
		faction = "Neutral",
	},
	[50208200] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[50408280] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[50608100] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[51408220] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[52408440] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[53408380] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[54208560] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[54408380] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[64208360] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[64808240] = {
		name = L["Lapress"],
		category = "rares",
		faction = "Neutral",
	},
	[17606580] = {
		name = L["Zora"],
		category = "rares",
		faction = "Neutral",
	},
	[46402740] = {
		name = L["Rex Ashil"],
		category = "rares",
		faction = "Neutral",
	},
	[47202620] = {
		name = L["Rex Ashil"],
		category = "rares",
		faction = "Neutral",
	},
	[47602540] = {
		name = L["Rex Ashil"],
		category = "rares",
		faction = "Neutral",
	},
	[69604100] = {
		name = L["Krellack"],
		category = "rares",
		faction = "Neutral",
	},
	[36007200] = {
		name = L["Grubthor"],
		category = "rares",
		faction = "Neutral",
	},
	[37207260] = {
		name = L["Grubthor"],
		category = "rares",
		faction = "Neutral",
	},
	[44008060] = {
		name = L["Grubthor"],
		category = "rares",
		faction = "Neutral",
	},
	[20602220] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Horde",
	},
	[21202360] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Horde",
	},
	[21401980] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Horde",
	},
	[21402060] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Horde",
	},
	[21801640] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Horde",
	},
	[24201300] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Horde",
	},
	[26001360] = {
		name = L["Huricanian"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1440] = {
	[34404800] = {
		name = L["Daelyshia"],
		category = "flightmasters",
		fpName = L["Astranaar, Ashenvale"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[12203380] = {
		name = L["Andruk"],
		category = "flightmasters",
		fpName = L["Zoram'gar Outpost, Ashenvale"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[73206160] = {
		name = L["Vhulgra"],
		category = "flightmasters",
		fpName = L["Splintertree Post, Ashenvale"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[37004920] = {
		name = L["Innkeeper Kimlya"],
		npcID = 6738,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[74006060] = {
		name = L["Innkeeper Kaylisk"],
		npcID = 12196,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[36405030] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[73606090] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[50206720] = {
		name = L["Bhaldaran Ravenshade"],
		npcID = 3951,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Alliance",
	},
	[34404960] = {
		name = L["Aeolynn"],
		npcID = 3952,
		category = "repair",
		description = L["Clothier"],
		faction = "Alliance",
	},
	[34604980] = {
		name = L["Tandaan Lightmane"],
		npcID = 3953,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[73406040] = {
		name = L["Burkrum"],
		npcID = 6028,
		category = "repair",
		description = L["Heavy Armor Merchant"],
		faction = "Horde",
	},
	[35805200] = {
		name = L["Xai'ander"],
		npcID = 11137,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[61408380] = {
		name = L["Illiyana Moonblaze"],
		npcID = 14753,
		category = "repair",
		description = L["Silverwing Supply Officer"],
		faction = "Alliance",
	},
	[40205300] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[80605800] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[36405040] = {
		name = L["Maluressian"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[73406100] = {
		name = L["Qeeju"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[18006000] = {
		name = L["Bolyun"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Neutral",
	},
	[50006780] = {
		name = L["Danlaar Nightstride"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[50806700] = {
		name = L["Kylanna"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Expert Alchemist"],
		faction = "Alliance",
	},
	[50606700] = {
		name = L["Cylania Rootstalker"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalist"],
		faction = "Alliance",
	},
	[35805205] = {
		name = L["Aayndia Floralwind"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Expert Leatherworker"],
		faction = "Alliance",
	},
	[49806700] = {
		name = L["Caelyb"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Alliance",
	},
	[50006720] = {
		name = L["Jayla"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinner"],
		faction = "Alliance",
	},
	[18005980] = {
		name = L["Alenndaar Lapidaar"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Neutral",
	},
	[10803360] = {
		name = L["Kil'Hiwana"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Horde",
	},
	[35005200] = {
		name = L["Dalria"],
		npcID = 3954,
		category = "vendors",
		description = L["Trade Goods"],
		faction = "Alliance",
	},
	[49606700] = {
		name = L["Shandrina"],
		npcID = 3955,
		category = "vendors",
		description = L["Trade Goods"],
		faction = "Alliance",
	},
	[50606705] = {
		name = L["Harklan Moongrove"],
		npcID = 3956,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Alliance",
	},
	[34804980] = {
		name = L["Lardan"],
		npcID = 3958,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Alliance",
	},
	[37004980] = {
		name = L["Nantar"],
		npcID = 3959,
		category = "vendors",
		description = L["Baker"],
		faction = "Alliance",
	},
	[50006660] = {
		name = L["Ulthaan"],
		npcID = 3960,
		category = "vendors",
		description = L["Butcher"],
		faction = "Alliance",
	},
	[36604980] = {
		name = L["Maliynn"],
		npcID = 3961,
		category = "vendors",
		description = L["Food & Drink Vendor"],
		faction = "Alliance",
	},
	[34805080] = {
		name = L["Haljan Oakheart"],
		npcID = 3962,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Alliance",
	},
	[36404940] = {
		name = L["Fahran Silentblade"],
		npcID = 3969,
		category = "vendors",
		description = L["Tools & Supplies"],
		faction = "Alliance",
	},
	[35004840] = {
		name = L["Llana"],
		npcID = 3970,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Supplies"],
		faction = "Alliance",
	},
	[18206000] = {
		name = L["Harlown Darkweave"],
		npcID = 6731,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Alliance",
	},
	[11803400] = {
		name = L["Wik'Tar"],
		npcID = 12962,
		category = "vendors",
		description = L["Fish Merchant & Supplies"],
		faction = "Horde",
	},
	[62008280] = {
		name = L["Gapp Jinglepocket"],
		npcID = 14963,
		category = "vendors",
		description = L["Smokywood Pastures"],
		faction = "Alliance",
	},
	[33202100] = {
		name = L["Apothecary Falthis"],
		category = "rares",
		faction = "Horde",
	},
	[33202160] = {
		name = L["Apothecary Falthis"],
		category = "rares",
		faction = "Horde",
	},
	[25206040] = {
		name = L["Akkrilus"],
		category = "rares",
		faction = "Neutral",
	},
	[28406140] = {
		name = L["Akkrilus"],
		category = "rares",
		faction = "Neutral",
	},
	[50603840] = {
		name = L["Terrowulf Packlord"],
		category = "rares",
		faction = "Neutral",
	},
	[50603880] = {
		name = L["Terrowulf Packlord"],
		category = "rares",
		faction = "Neutral",
	},
	[9601540] = {
		name = L["Lady Vespia"],
		category = "rares",
		faction = "Neutral",
	},
	[11202940] = {
		name = L["Lady Vespia"],
		category = "rares",
		faction = "Neutral",
	},
	[11203000] = {
		name = L["Lady Vespia"],
		category = "rares",
		faction = "Neutral",
	},
	[12401840] = {
		name = L["Lady Vespia"],
		category = "rares",
		faction = "Neutral",
	},
	[12401900] = {
		name = L["Lady Vespia"],
		category = "rares",
		faction = "Neutral",
	},
	[12601900] = {
		name = L["Lady Vespia"],
		category = "rares",
		faction = "Neutral",
	},
	[35403280] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[35603200] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[35603260] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[36603540] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[36603620] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[37003400] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[37203340] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[49806060] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[51006140] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[51006160] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[53606100] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[53806240] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[54406260] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[56206320] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[56406240] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[56606280] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[43804520] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[44204560] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[45004600] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[46604840] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[45207140] = {
		name = L["Eck'alom"],
		category = "rares",
		faction = "Neutral",
	},
	[45407160] = {
		name = L["Eck'alom"],
		category = "rares",
		faction = "Neutral",
	},
	[48206980] = {
		name = L["Eck'alom"],
		category = "rares",
		faction = "Neutral",
	},
	[52807020] = {
		name = L["Eck'alom"],
		category = "rares",
		faction = "Neutral",
	},
	[17803680] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Neutral",
	},
	[18803800] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Neutral",
	},
	[19404280] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Neutral",
	},
	[19404480] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Neutral",
	},
	[19804400] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Neutral",
	},
	[20004240] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Neutral",
	},
	[20404320] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Neutral",
	},
	[19403020] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[21803020] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[26401760] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[26401860] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[26601800] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[77404620] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[78204640] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[78404240] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[78604400] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[78804540] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[78804560] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[79804620] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[82404680] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[82804740] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[83004840] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[28206520] = {
		name = L["Akkrilus"],
		category = "rares",
		faction = "Neutral",
	},
	[50203900] = {
		name = L["Terrowulf Packlord"],
		category = "rares",
		faction = "Neutral",
	},
	[12601820] = {
		name = L["Lady Vespia"],
		category = "rares",
		faction = "Neutral",
	},
	[35203220] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[46604900] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[47604660] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[20004260] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Neutral",
	},
	[83405620] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[88606820] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[27406400] = {
		name = L["Akkrilus"],
		category = "rares",
		faction = "Neutral",
	},
	[50003960] = {
		name = L["Terrowulf Packlord"],
		category = "rares",
		faction = "Neutral",
	},
	[49406040] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[44604540] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[47604580] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[20004520] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Horde",
	},
	[20804200] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Horde",
	},
	[21204120] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Horde",
	},
	[21204260] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Horde",
	},
	[17003020] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[18203020] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[22602980] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[27001800] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[77204660] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[78404280] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[83205680] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[87006860] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[50603860] = {
		name = L["Terrowulf Packlord"],
		category = "rares",
		faction = "Neutral",
	},
	[49205980] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[50206060] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[54006260] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[21004220] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Horde",
	},
	[21204140] = {
		name = L["Mugglefin"],
		category = "rares",
		faction = "Horde",
	},
	[20603080] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Neutral",
	},
	[77004700] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[78204260] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[78604680] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[36403600] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[37203320] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[57206220] = {
		name = L["Oakpaw"],
		category = "rares",
		faction = "Horde",
	},
	[46204420] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[77204620] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[79004560] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[79804660] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
	[82404760] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[82804840] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[88006840] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[88406860] = {
		name = L["Ursol'lok"],
		category = "rares",
		faction = "Neutral",
	},
	[28606200] = {
		name = L["Akkrilus"],
		category = "rares",
		faction = "Neutral",
	},
	[10403000] = {
		name = L["Lady Vespia"],
		category = "rares",
		faction = "Horde",
	},
	[10803060] = {
		name = L["Lady Vespia"],
		category = "rares",
		faction = "Horde",
	},
	[12401800] = {
		name = L["Lady Vespia"],
		category = "rares",
		faction = "Horde",
	},
	[35603280] = {
		name = L["Rorgish Jowl"],
		category = "rares",
		faction = "Neutral",
	},
	[47204420] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[47404500] = {
		name = L["Branch Snapper"],
		category = "rares",
		faction = "Neutral",
	},
	[22203000] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Alliance",
	},
	[26601740] = {
		name = L["Mist Howler"],
		category = "rares",
		faction = "Alliance",
	},
	[78204300] = {
		name = L["Prince Raze"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1442] = {
	[45205980] = {
		name = L["Tharm"],
		category = "flightmasters",
		fpName = L["Sun Rock Retreat, Stonetalon Mountains"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[36400720] = {
		name = L["Teloren"],
		category = "flightmasters",
		fpName = L["Stonetalon Peak, Stonetalon Mountains"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[47406200] = {
		name = L["Innkeeper Jayka"],
		npcID = 7731,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[35600580] = {
		name = L["Innkeeper Faralia"],
		npcID = 16458,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[36000730] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[48006110] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[62604020] = {
		name = L["Nizzik"],
		npcID = 4085,
		category = "repair",
		description = L["Venture Armor Salesman"],
		faction = "Neutral",
	},
	[58205160] = {
		name = L["Veenix"],
		npcID = 4086,
		category = "repair",
		description = L["Venture Co. Merchant"],
		faction = "Neutral",
	},
	[35400700] = {
		name = L["Illyanie"],
		npcID = 4188,
		category = "repair",
		description = L["Cloth Armor Merchant"],
		faction = "Alliance",
	},
	[45205920] = {
		name = L["Borand"],
		npcID = 9549,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Horde",
	},
	[57406200] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[47806120] = {
		name = L["Gereck"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[49205720] = {
		name = L["Hgarth"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Artisan Enchanter"],
		faction = "Horde",
	},
	[73409540] = {
		name = L["Denni'ka"],
		npcID = 3411,
		category = "vendors",
		description = L["Butcher"],
		faction = "Horde",
	},
	[45805860] = {
		name = L["Grawnal"],
		npcID = 4082,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Horde",
	},
	[47606160] = {
		name = L["Jeeda"],
		npcID = 4083,
		category = "vendors",
		description = L["Apprentice Witch Doctor"],
		faction = "Horde",
	},
	[35600620] = {
		name = L["Chylina"],
		npcID = 4084,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[46205840] = {
		name = L["Krond"],
		npcID = 5870,
		category = "vendors",
		description = L["Butcher"],
		faction = "Horde",
	},
	[45405940] = {
		name = L["Kulwia"],
		npcID = 12043,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Horde",
	},
	[44204000] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44404120] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44404680] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44603980] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44604460] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44804360] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44804560] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45003920] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45403840] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45404140] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45603860] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45604540] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45804040] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46003760] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46004780] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46203720] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46204120] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46204180] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46404320] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46404640] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46404700] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46604200] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46804460] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47004340] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47004660] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47004760] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47204560] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47404360] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47604400] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47604800] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47804520] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[48004340] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[48204640] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[48404680] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[49004580] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[53003700] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[53203620] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[53403540] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[53403800] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[53604060] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[53803540] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[54003580] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[54003920] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[54203800] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[54204000] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[54803800] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[54803900] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[55003700] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[29206860] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[30006620] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[30206860] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[30207080] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[30406440] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[30407320] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[31006600] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[31406320] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[31406460] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[31407300] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[32007200] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[32007280] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[32007380] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[32606000] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[32607300] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[33207080] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[33406300] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[33607160] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[33807260] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[34006000] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[34006220] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[34207080] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[34207360] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[35007440] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[35407460] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[35807240] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[36207300] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[36207360] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[37407240] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Alliance",
	},
	[25401140] = {
		name = L["Nal'taszar"],
		category = "rares",
		faction = "Alliance",
	},
	[25401200] = {
		name = L["Nal'taszar"],
		category = "rares",
		faction = "Alliance",
	},
	[25401260] = {
		name = L["Nal'taszar"],
		category = "rares",
		faction = "Alliance",
	},
	[25401360] = {
		name = L["Nal'taszar"],
		category = "rares",
		faction = "Alliance",
	},
	[25801240] = {
		name = L["Nal'taszar"],
		category = "rares",
		faction = "Alliance",
	},
	[25801260] = {
		name = L["Nal'taszar"],
		category = "rares",
		faction = "Alliance",
	},
	[28201280] = {
		name = L["Brother Ravenoak"],
		category = "rares",
		faction = "Neutral",
	},
	[28601400] = {
		name = L["Brother Ravenoak"],
		category = "rares",
		faction = "Neutral",
	},
	[30001420] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[30201480] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[30601460] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[31001440] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[32401580] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[32601800] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[32801680] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[34201820] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[36201440] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[36401580] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[37401480] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[46003820] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[46203540] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[47003400] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[47003640] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[47203500] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[47803640] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[48003420] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[48603620] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[48803380] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[48803680] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[49203280] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[49803700] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[50603680] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[51203440] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[51203500] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[27206880] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[27206980] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[27406820] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[27606580] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[27607040] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[28206800] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[28606920] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[29606840] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[29606880] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[29806980] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[35206760] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[36006880] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[36206960] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[36606840] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[37006940] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[37007020] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[37606800] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[38406740] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[63604700] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[64805100] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[65004800] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[65205180] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[65404420] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[65605120] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[66004460] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[66005200] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[66205380] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[66404600] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[66404660] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[66405260] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[66605160] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[66605300] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[66804680] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[67004560] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[67204500] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[68004500] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[68404620] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Alliance",
	},
	[61405040] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[61405120] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[61405160] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[61805160] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62005100] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62205700] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62405520] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62405640] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62605480] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62605620] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[63605540] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64004920] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64405340] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64405400] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64604940] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64605340] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64605400] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64805020] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[73805160] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[44004060] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44204380] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44204500] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45004280] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45204240] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45804000] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45804580] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46004140] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[48804660] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[53203580] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[30807100] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[31606140] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[32206260] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[32806120] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[33806340] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[33807120] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[25401220] = {
		name = L["Nal'taszar"],
		category = "rares",
		faction = "Alliance",
	},
	[26001320] = {
		name = L["Nal'taszar"],
		category = "rares",
		faction = "Alliance",
	},
	[34401800] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[36601400] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[36801640] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[38001840] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[48003340] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[48003380] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[48203720] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[50803700] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Alliance",
	},
	[28007080] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[28406880] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[29006840] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[29406680] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[35606800] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[36406740] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[36606820] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[37606780] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Alliance",
	},
	[65205080] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[65605140] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[65605160] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[65804940] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[66604440] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[66605240] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[67605320] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[68205120] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[61405080] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[61805040] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62604960] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[63205600] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64405040] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64405060] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64405600] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64805080] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[65005160] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[65005480] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[44204320] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45604020] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47204600] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47404420] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[48004320] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[48604660] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[52403800] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[53604180] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[53803980] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[54603800] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[30206740] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[30807180] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[31807400] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[34807340] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[28201200] = {
		name = L["Brother Ravenoak"],
		category = "rares",
		faction = "Neutral",
	},
	[31801500] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[36201720] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[48003500] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[50003560] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[51003620] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[29407060] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[65205280] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[66205220] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[66605340] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[61605740] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62605560] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[63805160] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[47204360] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47404580] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[30607360] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[35207400] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[25601140] = {
		name = L["Nal'taszar"],
		category = "rares",
		faction = "Alliance",
	},
	[32001540] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[33801780] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[34001700] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[46803640] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[28806880] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[29007020] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[29606900] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[29607000] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[30607000] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[64404420] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[66204520] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[66204900] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[66404700] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[64405500] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[43804140] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44804180] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45803800] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[46004760] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[54603920] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[29407220] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[30406360] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[30606540] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[31407040] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[31607000] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[32807000] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[33606280] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[34407280] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[35607120] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[25401160] = {
		name = L["Nal'taszar"],
		category = "rares",
		faction = "Alliance",
	},
	[32001500] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[34801780] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[46403620] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[47003200] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[47403380] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[48403720] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[48603600] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[49403220] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[49803440] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[50403800] = {
		name = L["Sorrow Wing"],
		category = "rares",
		faction = "Neutral",
	},
	[27207040] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[27207100] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[27806880] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[28007040] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[28007060] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[35806800] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[36406880] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[37206800] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[66004700] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[66204540] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[66404360] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[66804700] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[67205460] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[61205580] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62005260] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62205200] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[62605000] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[43604000] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[45404060] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[47604480] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[53804060] = {
		name = L["Pridewing Patriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[28606960] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[33607240] = {
		name = L["Vengeful Ancient"],
		category = "rares",
		faction = "Neutral",
	},
	[28201240] = {
		name = L["Brother Ravenoak"],
		category = "rares",
		faction = "Neutral",
	},
	[28401360] = {
		name = L["Brother Ravenoak"],
		category = "rares",
		faction = "Neutral",
	},
	[31201440] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[33001760] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[35001780] = {
		name = L["Sentinel Amarassan"],
		category = "rares",
		faction = "Alliance",
	},
	[27406980] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[28806960] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[36406720] = {
		name = L["Sister Riven"],
		category = "rares",
		faction = "Neutral",
	},
	[65405540] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[65604520] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[65605440] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[65804860] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[67604720] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[69204360] = {
		name = L["Foreman Rigger"],
		category = "rares",
		faction = "Neutral",
	},
	[60605040] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[61205120] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
	[64804920] = {
		name = L["Taskmaster Whipfang"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1441] = {
	[45004920] = {
		name = L["Nyse"],
		category = "flightmasters",
		fpName = L["Freewind Post, Thousand Needles"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[46005140] = {
		name = L["Innkeeper Abeqwa"],
		npcID = 11116,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[45805100] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[80407680] = {
		name = L["Synge"],
		npcID = 3053,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gun Merchant"],
		faction = "Neutral",
	},
	[45005060] = {
		name = L["Starn"],
		npcID = 9551,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gunsmith & Bowyer"],
		faction = "Horde",
	},
	[30402340] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[69005340] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[45805105] = {
		name = L["Awenasa"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[21003180] = {
		name = L["Laer Stepperunner"],
		npcID = 3689,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Horde",
	},
	[45405100] = {
		name = L["Turhaw"],
		npcID = 4875,
		category = "vendors",
		description = L["Butcher"],
		faction = "Horde",
	},
	[46005145] = {
		name = L["Jandia"],
		npcID = 4877,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Horde",
	},
	[45205060] = {
		name = L["Montarr"],
		npcID = 4878,
		category = "vendors",
		description = L["Lorekeeper"],
		faction = "Horde",
	},
	[80007640] = {
		name = L["Riznek"],
		npcID = 6495,
		category = "vendors",
		description = L["Drink Vendor"],
		faction = "Neutral",
	},
	[77407700] = {
		name = L["Brivelthwerp"],
		npcID = 6496,
		category = "vendors",
		description = L["Ice Cream Vendor"],
		faction = "Neutral",
	},
	[78207580] = {
		name = L["Magus Tirth"],
		npcID = 6548,
		category = "vendors",
		faction = "Neutral",
	},
	[77607780] = {
		name = L["Jinky Twizzlefixxit"],
		npcID = 6730,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Neutral",
	},
	[64208600] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[64808560] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[65408520] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[65608560] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[67408600] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[68408260] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[69008160] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[69208800] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[70008560] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[70608540] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[71208580] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[71408660] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Neutral",
	},
	[18403740] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[18803380] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[18803880] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[19003280] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[19203820] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[20003940] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[20803160] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[21003100] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[22804320] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[23804380] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[25003620] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[25004260] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[25203520] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[25203680] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[26003960] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[15404020] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[15804020] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[16004160] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[16204120] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[16804180] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[17004120] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[17404260] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[17804040] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[17804060] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[80007660] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[83607220] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[84807760] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[85406340] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[85606860] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[85806800] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[85808020] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[86406980] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[86607480] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[86607960] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[86807060] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[87007840] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[87807620] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[69606560] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[69806460] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[70206320] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[70406880] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[70607140] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[71206880] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[71207240] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[71806940] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[72407080] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[73207200] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[32003080] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[32202900] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[32602740] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[32602800] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[32803560] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[33202860] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[34002980] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[34403060] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[34603080] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[36403140] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[36803180] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[36803260] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[51804360] = {
		name = L["Gibblesnik"],
		category = "rares",
		faction = "Neutral",
	},
	[55805080] = {
		name = L["Gibblesnik"],
		category = "rares",
		faction = "Neutral",
	},
	[60204680] = {
		name = L["Gibblesnik"],
		category = "rares",
		faction = "Neutral",
	},
	[26204100] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[86207880] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[86407560] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[87407360] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[87407580] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Neutral",
	},
	[71007400] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[71607280] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[71807500] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[72007420] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[33402880] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[55804880] = {
		name = L["Gibblesnik"],
		category = "rares",
		faction = "Neutral",
	},
	[64008600] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Alliance",
	},
	[69008720] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Alliance",
	},
	[70208480] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Alliance",
	},
	[18003160] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[18203840] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[22003580] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[25204220] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[71607260] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[71807040] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[72806860] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[73006740] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[73006780] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[32602820] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[35803100] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[37603120] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[25004280] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[71607620] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[68408240] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Alliance",
	},
	[22403620] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[22404320] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[23804300] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[24803680] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[25803940] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[17604160] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[86007880] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Alliance",
	},
	[86607240] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Alliance",
	},
	[87008120] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Alliance",
	},
	[87407280] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Alliance",
	},
	[88207340] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Alliance",
	},
	[88807760] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Alliance",
	},
	[70007520] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[70206840] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[70606740] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[32402760] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[63808520] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Alliance",
	},
	[72608460] = {
		name = L["Silithid Ravager"],
		category = "rares",
		faction = "Alliance",
	},
	[17403600] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[17803500] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[17803600] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[17803680] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[21403720] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[22204100] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[24004360] = {
		name = L["Achellios the Banished"],
		category = "rares",
		faction = "Alliance",
	},
	[15804100] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[16604140] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[18004040] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[18004080] = {
		name = L["Heartrazor"],
		category = "rares",
		faction = "Alliance",
	},
	[87807700] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Alliance",
	},
	[88207780] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Alliance",
	},
	[89007800] = {
		name = L["Ironeye the Invincible"],
		category = "rares",
		faction = "Alliance",
	},
	[70006800] = {
		name = L["Vile Sting"],
		category = "rares",
		faction = "Alliance",
	},
	[33802960] = {
		name = L["Harb Foulmountain"],
		category = "rares",
		faction = "Alliance",
	},
	[51204260] = {
		name = L["Gibblesnik"],
		category = "rares",
		faction = "Neutral",
	},
	[51204420] = {
		name = L["Gibblesnik"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1439] = {
	[36404560] = {
		name = L["Caylais Moonfeather"],
		category = "flightmasters",
		fpName = L["Auberdine, Darkshore"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[37004400] = {
		name = L["Innkeeper Shaussiy"],
		npcID = 6737,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[37304380] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[37604040] = {
		name = L["Naram Longclaw"],
		npcID = 4183,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[38204040] = {
		name = L["Shaldyn"],
		npcID = 4185,
		category = "repair",
		description = L["Clothier"],
		faction = "Alliance",
	},
	[37004120] = {
		name = L["Mavralyn"],
		npcID = 4186,
		category = "repair",
		description = L["Leather Armor & Leatherworking Supplies"],
		faction = "Alliance",
	},
	[37004125] = {
		name = L["Harlon Thornguard"],
		npcID = 4187,
		category = "vendors",
		description = L["Armorer & Shieldsmith"],
		faction = "Alliance",
	},
	[38204120] = {
		name = L["Elisa Steelhand"],
		npcID = 6300,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Alliance",
	},
	[41803640] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[43409240] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[37404420] = {
		name = L["Jaelysia"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[38204045] = {
		name = L["Grondal Moonbreeze"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Journeyman Tailor"],
		faction = "Alliance",
	},
	[38204100] = {
		name = L["Kurdram Stonehammer"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Mining Trainer"],
		faction = "Alliance",
	},
	[38204105] = {
		name = L["Jenna Lemkenilli"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Journeyman Engineer"],
		faction = "Alliance",
	},
	[37404040] = {
		name = L["Dalmond"],
		npcID = 4182,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Alliance",
	},
	[38004060] = {
		name = L["Valdaron"],
		npcID = 4189,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Alliance",
	},
	[36804440] = {
		name = L["Kyndri"],
		npcID = 4190,
		category = "vendors",
		description = L["Baker"],
		faction = "Alliance",
	},
	[37004360] = {
		name = L["Allyndia"],
		npcID = 4191,
		category = "vendors",
		description = L["Food & Drink Vendor"],
		faction = "Alliance",
	},
	[36804380] = {
		name = L["Taldan"],
		npcID = 4192,
		category = "vendors",
		description = L["Drink Vendor"],
		faction = "Alliance",
	},
	[43807640] = {
		name = L["Ullanna"],
		npcID = 4194,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Alliance",
	},
	[43607660] = {
		name = L["Tiyani"],
		npcID = 4195,
		category = "vendors",
		description = L["Food & Drink Vendor"],
		faction = "Alliance",
	},
	[36804420] = {
		name = L["Laird"],
		npcID = 4200,
		category = "vendors",
		description = L["Fish Vendor"],
		faction = "Alliance",
	},
	[37005620] = {
		name = L["Heldan Galesong"],
		npcID = 4307,
		category = "vendors",
		description = L["Fisherman"],
		faction = "Alliance",
	},
	[38204125] = {
		name = L["Thelgrum Stonehammer"],
		npcID = 6298,
		category = "vendors",
		profession = "mining",
		description = L["Mining Supplier"],
		faction = "Alliance",
	},
	[38004120] = {
		name = L["Gorbold Steelhand"],
		npcID = 6301,
		category = "vendors",
		description = L["General Trade Supplier"],
		faction = "Alliance",
	},
	[36004480] = {
		name = L["Gubber Blump"],
		npcID = 10216,
		category = "vendors",
		faction = "Alliance",
	},
	[34408620] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[34408700] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[34408900] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[34608680] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[34608860] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[34808800] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[35808840] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[36009040] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[36209080] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[36609120] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[36809340] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[37209380] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[37409220] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[37609120] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[37609200] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[37609320] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[38809380] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[39009140] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[39009340] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[39409160] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[39609040] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[39609220] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[39809120] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[40609300] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[38803440] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39003600] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39203780] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39403700] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39404020] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39804280] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40003500] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40003800] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40203880] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40204000] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40403560] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40404080] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40604060] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40804020] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40804180] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[41003800] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[41203680] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[41606160] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[42005880] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[43006120] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[43205960] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[43206240] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[43406280] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[43605920] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[37005020] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[38005140] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[38805120] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[38805360] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39005340] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39007960] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39205220] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39207760] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39407860] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39605260] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39605400] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39607820] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[40207740] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[40207920] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[40605320] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[42208440] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[42808320] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[43008380] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[43208480] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[43608640] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[44008720] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[44403660] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[44803780] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[45203640] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[45203660] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[46003920] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[46803660] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[47203780] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[47603720] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[38408620] = {
		name = L["Firecaller Radison"],
		category = "rares",
		faction = "Horde",
	},
	[38408700] = {
		name = L["Firecaller Radison"],
		category = "rares",
		faction = "Horde",
	},
	[38608760] = {
		name = L["Firecaller Radison"],
		category = "rares",
		faction = "Horde",
	},
	[39008520] = {
		name = L["Firecaller Radison"],
		category = "rares",
		faction = "Horde",
	},
	[39008640] = {
		name = L["Firecaller Radison"],
		category = "rares",
		faction = "Horde",
	},
	[39008660] = {
		name = L["Firecaller Radison"],
		category = "rares",
		faction = "Horde",
	},
	[35407260] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[35807260] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[36407000] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[36407080] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[36407160] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[36807080] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[37406120] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[37406240] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[37606160] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[38206140] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[42602140] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[43402040] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[44202040] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[44402060] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[57402120] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[57402260] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[58001720] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[58002140] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[58602400] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[59201660] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[59602620] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[59802340] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[60602180] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[61202320] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[61401860] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[61801780] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[55003520] = {
		name = L["Lord Sinslayer"],
		category = "rares",
		faction = "Horde",
	},
	[56603420] = {
		name = L["Lord Sinslayer"],
		category = "rares",
		faction = "Horde",
	},
	[34808520] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[34808740] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[39809160] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[40204060] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[41403680] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[42203820] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[43406260] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[46803640] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[47603640] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[38608740] = {
		name = L["Firecaller Radison"],
		category = "rares",
		faction = "Horde",
	},
	[43002140] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[54603640] = {
		name = L["Lord Sinslayer"],
		category = "rares",
		faction = "Horde",
	},
	[54803660] = {
		name = L["Lord Sinslayer"],
		category = "rares",
		faction = "Horde",
	},
	[56403480] = {
		name = L["Lord Sinslayer"],
		category = "rares",
		faction = "Horde",
	},
	[56603460] = {
		name = L["Lord Sinslayer"],
		category = "rares",
		faction = "Horde",
	},
	[32808880] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[37209260] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[37409240] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[37609440] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[40009260] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[40609200] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[38803580] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39404060] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40803600] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[41605840] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[43206260] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[39407900] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39807840] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[41808620] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[42008540] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[42808440] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[46003680] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[47803660] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[36806280] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[36807200] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[43402060] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[43802220] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[58602300] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[58801620] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[60402400] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[55803480] = {
		name = L["Lord Sinslayer"],
		category = "rares",
		faction = "Horde",
	},
	[38803540] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[43208420] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39008620] = {
		name = L["Firecaller Radison"],
		category = "rares",
		faction = "Horde",
	},
	[36007040] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[36206300] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[36607060] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[37606200] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[57801860] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[55203560] = {
		name = L["Lord Sinslayer"],
		category = "rares",
		faction = "Horde",
	},
	[34208740] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[37409320] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[38009400] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[39609180] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[41805860] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[39205300] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[47003860] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[59801580] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[55603600] = {
		name = L["Lord Sinslayer"],
		category = "rares",
		faction = "Horde",
	},
	[34608700] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[39809140] = {
		name = L["Strider Clutchmother"],
		category = "rares",
		faction = "Neutral",
	},
	[39403780] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39403960] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40603600] = {
		name = L["Shadowclaw"],
		category = "rares",
		faction = "Horde",
	},
	[41805880] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[42005840] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[43406240] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[43606260] = {
		name = L["Lady Moongazer"],
		category = "rares",
		faction = "Horde",
	},
	[39405340] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[39407800] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[43208440] = {
		name = L["Carnivous the Breaker"],
		category = "rares",
		faction = "Horde",
	},
	[45603640] = {
		name = L["Licillin"],
		category = "rares",
		faction = "Horde",
	},
	[36607120] = {
		name = L["Flagglemurk the Cruel"],
		category = "rares",
		faction = "Horde",
	},
	[60001580] = {
		name = L["Lady Vespira"],
		category = "rares",
		faction = "Horde",
	},
	[54803620] = {
		name = L["Lord Sinslayer"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1438] = {
	[58409400] = {
		name = L["Vesprystus"],
		category = "flightmasters",
		fpName = L["Rut'theran Village, Teldrassil"],
		description = L["Hippogryph Master"],
		faction = "Alliance",
	},
	[55605980] = {
		name = L["Innkeeper Keldamyr"],
		npcID = 6736,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[56105840] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[58803960] = {
		name = L["Khardan Proudblade"],
		npcID = 3588,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[59404120] = {
		name = L["Keina"],
		npcID = 3589,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Alliance",
	},
	[59404100] = {
		name = L["Janna Brightmoon"],
		npcID = 3590,
		category = "repair",
		description = L["Clothier"],
		faction = "Alliance",
	},
	[59003960] = {
		name = L["Freja Nightwing"],
		npcID = 3591,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[58603980] = {
		name = L["Andiss"],
		npcID = 3592,
		category = "repair",
		description = L["Armorer & Shieldcrafter"],
		faction = "Alliance",
	},
	[56205940] = {
		name = L["Shalomon"],
		npcID = 3609,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[55805920] = {
		name = L["Jeena Featherbow"],
		npcID = 3610,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Alliance",
	},
	[56206020] = {
		name = L["Brannol Eaglemoon"],
		npcID = 3611,
		category = "repair",
		description = L["Clothier"],
		faction = "Alliance",
	},
	[56205960] = {
		name = L["Sinda"],
		npcID = 3612,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[56205945] = {
		name = L["Meri Ironweave"],
		npcID = 3613,
		category = "vendors",
		description = L["Armorer & Shieldcrafter"],
		faction = "Alliance",
	},
	[56206320] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[58604240] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[56605960] = {
		name = L["Seriadne"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[56805960] = {
		name = L["Keldas"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Alliance",
	},
	[59603840] = {
		name = L["Alyissia"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[59603860] = {
		name = L["Frahun Shadewhisper"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[59204040] = {
		name = L["Shanda"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[58604040] = {
		name = L["Ayanna Everstride"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[58604045] = {
		name = L["Mardant Strongoak"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Alliance",
	},
	[56205920] = {
		name = L["Kyra Windblade"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[56206000] = {
		name = L["Jannok Breezesong"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[55605680] = {
		name = L["Laurna Morninglight"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[56605940] = {
		name = L["Dazalar"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[56006160] = {
		name = L["Kal"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Alliance",
	},
	[57606060] = {
		name = L["Cyndra Kindwhisper"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist"],
		faction = "Alliance",
	},
	[57606065] = {
		name = L["Malorne Bladeleaf"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalist"],
		faction = "Alliance",
	},
	[41804940] = {
		name = L["Nadyia Maneweaver"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Journeyman Leatherworker"],
		faction = "Alliance",
	},
	[36803420] = {
		name = L["Alanna Raveneye"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Journeyman Enchanter"],
		faction = "Alliance",
	},
	[55809340] = {
		name = L["Androl Oakhand"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Alliance",
	},
	[55205680] = {
		name = L["Byancie"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Alliance",
	},
	[57006120] = {
		name = L["Zarrin"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cook"],
		faction = "Alliance",
	},
	[42005000] = {
		name = L["Radnaal Maneweaver"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinner"],
		faction = "Alliance",
	},
	[59404105] = {
		name = L["Lyrai"],
		npcID = 3587,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[55405720] = {
		name = L["Aldia"],
		npcID = 3608,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[55205700] = {
		name = L["Narret Shadowgrove"],
		npcID = 3614,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Alliance",
	},
	[57206120] = {
		name = L["Nyoma"],
		npcID = 4265,
		category = "vendors",
		description = L["Cooking Supplies"],
		faction = "Alliance",
	},
	[55405725] = {
		name = L["Danlyia"],
		npcID = 4266,
		category = "vendors",
		description = L["Food & Drink Vendor"],
		faction = "Alliance",
	},
	[59604080] = {
		name = L["Dellylah"],
		npcID = 6091,
		category = "vendors",
		description = L["Food & Drink Vendor"],
		faction = "Alliance",
	},
	[56209240] = {
		name = L["Nessa Shadowsong"],
		npcID = 10118,
		category = "vendors",
		profession = "fishing",
		description = L["Fishing Supplies"],
		faction = "Alliance",
	},
	[41603700] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[41802920] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[42003800] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[42003920] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[42202560] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[42202840] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[42602820] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[42802880] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[42803740] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[43002560] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[43002700] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[43603000] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[43802940] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[44202780] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[44602740] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[65805720] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[66005800] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[66205900] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[66406020] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[66805800] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67005640] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67005680] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67005880] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67005980] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67605940] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67805840] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67805980] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67806120] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[39207940] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[39408020] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[39808060] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[40407940] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[40407960] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[40607960] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[41007880] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[41207840] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[41407460] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[41407680] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[41607800] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[41607860] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[42407960] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[42608000] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[51207700] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[51607760] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[51807720] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[52607740] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[53607620] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[53807680] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[54807740] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[58007500] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[58007580] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[58407680] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[58607620] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[58607660] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[59807520] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[60207600] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[60407380] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[60607420] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[60607540] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[34203440] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[34403460] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[35203540] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[35403580] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[35403660] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[35403760] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[35603540] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[35603700] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[35803560] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[36203800] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[36403880] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[36603780] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[36603920] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37003460] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37004080] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37004160] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37404000] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37404260] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37604040] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37604280] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37804240] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[51205040] = {
		name = L["Threggil"],
		category = "rares",
		faction = "Horde",
	},
	[51205080] = {
		name = L["Threggil"],
		category = "rares",
		faction = "Horde",
	},
	[51605160] = {
		name = L["Threggil"],
		category = "rares",
		faction = "Horde",
	},
	[52205040] = {
		name = L["Threggil"],
		category = "rares",
		faction = "Horde",
	},
	[52205060] = {
		name = L["Threggil"],
		category = "rares",
		faction = "Horde",
	},
	[52605240] = {
		name = L["Threggil"],
		category = "rares",
		faction = "Horde",
	},
	[42603780] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[44002800] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[67405960] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[40208060] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[41607820] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[53407700] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[58207640] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[60207480] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[60607620] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[35403540] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37404160] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37604060] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[51405040] = {
		name = L["Threggil"],
		category = "rares",
		faction = "Horde",
	},
	[43202900] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[43602740] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[40407920] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[41607840] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[57607620] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[34403480] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[35603560] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[36403960] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37204040] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37804260] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[39004140] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[42802840] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[40807960] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[36403380] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[66805960] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67806000] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[41607880] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[43007920] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[53407660] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[34403440] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[35403800] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[36404240] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[37204160] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[38004400] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[42803860] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[44002820] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[44003080] = {
		name = L["Blackmoss the Fetid"],
		category = "rares",
		faction = "Horde",
	},
	[63805720] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67605960] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[67805740] = {
		name = L["Uruson"],
		category = "rares",
		faction = "Horde",
	},
	[41607600] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[41807700] = {
		name = L["Grimmaw"],
		category = "rares",
		faction = "Horde",
	},
	[51207720] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[57407660] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[60207380] = {
		name = L["Duskstalker"],
		category = "rares",
		faction = "Horde",
	},
	[34403520] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
	[35403620] = {
		name = L["Fury Shelda"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1425] = {
	[81608180] = {
		name = L["Gorkas"],
		category = "flightmasters",
		fpName = L["Revantusk Village, The Hinterlands"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[11004600] = {
		name = L["Guthrum Thunderfist"],
		category = "flightmasters",
		fpName = L["Aerie Peak, The Hinterlands"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[13804160] = {
		name = L["Innkeeper Thulfram"],
		npcID = 7744,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[78208120] = {
		name = L["Lard"],
		npcID = 14731,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[14104570] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[78908040] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[13404400] = {
		name = L["Harggan"],
		npcID = 8161,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Alliance",
	},
	[77408020] = {
		name = L["Smith Slagtree"],
		npcID = 14737,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Horde",
	},
	[72606800] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[14204520] = {
		name = L["Killium Bouldertoe"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[79007940] = {
		name = L["Huntsman Markhor"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[13404340] = {
		name = L["Drakk Stonehand"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Master Leatherworking Trainer"],
		faction = "Alliance",
	},
	[80208140] = {
		name = L["Katoom the Angler"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fishing Trainer & Supplies"],
		faction = "Horde",
	},
	[34203780] = {
		name = L["Ruppo Zipcoil"],
		npcID = 2688,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Horde",
	},
	[14404240] = {
		name = L["Truk Wildbeard"],
		npcID = 4782,
		category = "vendors",
		description = L["Bartender"],
		faction = "Alliance",
	},
	[13404345] = {
		name = L["Nioma"],
		npcID = 8160,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Alliance",
	},
	[34403840] = {
		name = L["Gigget Zipcoil"],
		npcID = 12958,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Horde",
	},
	[79207900] = {
		name = L["Otho Moji'ko"],
		npcID = 14738,
		category = "vendors",
		profession = "cooking",
		description = L["Cooking Supplier"],
		faction = "Horde",
	},
	[78807840] = {
		name = L["Mystic Yayo'jin"],
		npcID = 14739,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Horde",
	},
	[76808120] = {
		name = L["Renn'az"],
		npcID = 17598,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["Ammunition Vendor"],
		faction = "Horde",
	},
	[36205200] = {
		name = L["Razortalon"],
		category = "rares",
		faction = "Neutral",
	},
	[15605300] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[19404940] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[19804960] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[20404840] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[21805040] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[22005060] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[22605240] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[74808840] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[75008660] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[77406300] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[78006380] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[78606320] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[81604760] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[81604880] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[82404600] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[82604680] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[28204520] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Neutral",
	},
	[28404640] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Neutral",
	},
	[30404820] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Neutral",
	},
	[30804760] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Neutral",
	},
	[31004420] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Neutral",
	},
	[31404300] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Neutral",
	},
	[45006860] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[45206780] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[46406460] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[46806800] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[47206540] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[47606660] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[51206580] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[51206660] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[58207080] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[59207540] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[59407560] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[64208140] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[65208000] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[33207000] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[33607380] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[34206840] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[34806980] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[23205760] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[23405720] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[23605760] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[23805460] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[24605720] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[24805820] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[31805760] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[32405720] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[32605940] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[32805760] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[35805260] = {
		name = L["Razortalon"],
		category = "rares",
		faction = "Neutral",
	},
	[36604500] = {
		name = L["Razortalon"],
		category = "rares",
		faction = "Neutral",
	},
	[17205580] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[21605180] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[48604740] = {
		name = L["The Reak"],
		category = "rares",
		faction = "Neutral",
	},
	[76208240] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[76808100] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[77806140] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[77806300] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[81804360] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[82204480] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[82404780] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[31404880] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Neutral",
	},
	[31804380] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Neutral",
	},
	[64605000] = {
		name = L["Grimungous"],
		category = "rares",
		faction = "Neutral",
	},
	[73005640] = {
		name = L["Grimungous"],
		category = "rares",
		faction = "Neutral",
	},
	[46006860] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[46206440] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[46807020] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[47406600] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[49406340] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[64208220] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[34806900] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[34807220] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[35007400] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[23805800] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[24205740] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[32605720] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Neutral",
	},
	[38604520] = {
		name = L["Razortalon"],
		category = "rares",
		faction = "Neutral",
	},
	[17805380] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[18805020] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[46804040] = {
		name = L["The Reak"],
		category = "rares",
		faction = "Neutral",
	},
	[57004220] = {
		name = L["The Reak"],
		category = "rares",
		faction = "Neutral",
	},
	[76606080] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[82004680] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[28604640] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Alliance",
	},
	[30604820] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Alliance",
	},
	[31004340] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Alliance",
	},
	[70605980] = {
		name = L["Grimungous"],
		category = "rares",
		faction = "Neutral",
	},
	[71406500] = {
		name = L["Grimungous"],
		category = "rares",
		faction = "Neutral",
	},
	[78807980] = {
		name = L["Grimungous"],
		category = "rares",
		faction = "Neutral",
	},
	[46406480] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[46606820] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[48406600] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[50806260] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[51206360] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[58207020] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[65008060] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[31807180] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[33407340] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[34207220] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[36804520] = {
		name = L["Razortalon"],
		category = "rares",
		faction = "Neutral",
	},
	[37604520] = {
		name = L["Razortalon"],
		category = "rares",
		faction = "Neutral",
	},
	[18605000] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[21805160] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[57604100] = {
		name = L["The Reak"],
		category = "rares",
		faction = "Neutral",
	},
	[76406420] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Neutral",
	},
	[45606540] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[47006500] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[47206560] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[49206200] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[49806260] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[33206940] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[33607460] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[23205700] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Horde",
	},
	[74208800] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Alliance",
	},
	[77406240] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Alliance",
	},
	[81404820] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Alliance",
	},
	[82604800] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Alliance",
	},
	[82604900] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Alliance",
	},
	[46006840] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[51206520] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[58407000] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[59007640] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[32407340] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[34006940] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[34806960] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[35207080] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Neutral",
	},
	[23205720] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Horde",
	},
	[23605660] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Horde",
	},
	[37204540] = {
		name = L["Razortalon"],
		category = "rares",
		faction = "Neutral",
	},
	[17005460] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[21405040] = {
		name = L["Old Cliff Jumper"],
		category = "rares",
		faction = "Neutral",
	},
	[49405300] = {
		name = L["The Reak"],
		category = "rares",
		faction = "Neutral",
	},
	[57804280] = {
		name = L["The Reak"],
		category = "rares",
		faction = "Neutral",
	},
	[78806200] = {
		name = L["Ironback"],
		category = "rares",
		faction = "Alliance",
	},
	[31204360] = {
		name = L["Jalinde Summerdrake"],
		category = "rares",
		faction = "Alliance",
	},
	[46406560] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[49406320] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[51206560] = {
		name = L["Retherokk the Berserker"],
		category = "rares",
		faction = "Neutral",
	},
	[60207040] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[61008160] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[65408120] = {
		name = L["Mith'rethis the Enchanter"],
		category = "rares",
		faction = "Neutral",
	},
	[32007120] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Alliance",
	},
	[34407000] = {
		name = L["Witherheart the Stalker"],
		category = "rares",
		faction = "Alliance",
	},
	[23805600] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Horde",
	},
	[24605840] = {
		name = L["Zul'arek Hatefowler"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1418] = {
	[4004480] = {
		name = L["Gorrik"],
		category = "flightmasters",
		fpName = L["Kargath, Badlands"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[2804580] = {
		name = L["Innkeeper Shul'kar"],
		npcID = 9356,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[3904730] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[3004740] = {
		name = L["Sranda"],
		npcID = 1407,
		category = "repair",
		description = L["Light Armor & Weapons Merchant"],
		faction = "Horde",
	},
	[42405260] = {
		name = L["Jazzrik"],
		npcID = 9179,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Neutral",
	},
	[8205540] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[56802440] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[3804760] = {
		name = L["Greth"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[62605740] = {
		name = L["Thorkaf Dragoneye"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Master Dragonscale Leatherworker"],
		faction = "Horde",
	},
	[3004600] = {
		name = L["Grawl"],
		npcID = 2908,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Horde",
	},
	[39602800] = {
		name = L["Shadowforge Commander"],
		category = "rares",
		faction = "Neutral",
	},
	[40402640] = {
		name = L["Shadowforge Commander"],
		category = "rares",
		faction = "Neutral",
	},
	[40402860] = {
		name = L["Shadowforge Commander"],
		category = "rares",
		faction = "Neutral",
	},
	[7006200] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[11806560] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[14606680] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[15006440] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[19406000] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[20405960] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[20605800] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[21406000] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[22404700] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[23405900] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[30204660] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[32005540] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[34204360] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[34604220] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[35604300] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[37004200] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[37804820] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[39404040] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[43003200] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[44403240] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[44603580] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[45203180] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[47601140] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[51802760] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[2207880] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[3407880] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[3607820] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[3607940] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[3608120] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[4608120] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[4608160] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[14208980] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[14408860] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[14409100] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[14608760] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[16208600] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[16808560] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[3805040] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[4404540] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[9406520] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[10607400] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[10806380] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[11007500] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[12606720] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[13606460] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[14006600] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[15006540] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[16006860] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[16806980] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[17008140] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[19006080] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[22605420] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[24605180] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[25204920] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[25205020] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[25605260] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[28204540] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[35407240] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[36606960] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[36607100] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[38405520] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[39605640] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[41405440] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[42205280] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[42407280] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[42805300] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[43005420] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[43407260] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[44207300] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[44405280] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[45005340] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[45005380] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[45405120] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[45604900] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[45807300] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[46404680] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[47004980] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[48005080] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[48207320] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[48804760] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[49007360] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[49607200] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[50004600] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[50207400] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[50807060] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[50807460] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[51605080] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[52406980] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[52607380] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[54007000] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[54206640] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[55005420] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[56405580] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[56405940] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[45003600] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[45403680] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[45603620] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[52201540] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[52601580] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[53401720] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[53601680] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[54001520] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[54201200] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[54401560] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[54601640] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[55201700] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[61804300] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[62003040] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[62003280] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[62603100] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[63203020] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[22805460] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[28807400] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[31805560] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[31806820] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[32005320] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[32605780] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[32804620] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33405200] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33605720] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33805280] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33805580] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33805860] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33806640] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34205080] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34206480] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34206760] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34206920] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34206960] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34806480] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35206440] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35206660] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35206840] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35606700] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35806860] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36006480] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36206580] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36405500] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36605560] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36806040] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36806600] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36806740] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36806780] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36807360] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[37805380] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[38007140] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[38605380] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[38806560] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[39806900] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[40207060] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[41007080] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[41205380] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[41405880] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[53406460] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[53804560] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[53806640] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54406500] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55006100] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56806100] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56806340] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[57205820] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[57406480] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[57606060] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[58806000] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[40202660] = {
		name = L["Shadowforge Commander"],
		category = "rares",
		faction = "Neutral",
	},
	[41002620] = {
		name = L["Shadowforge Commander"],
		category = "rares",
		faction = "Neutral",
	},
	[45403300] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[15808840] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[11607240] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[12206840] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[12206980] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[12406940] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[12407060] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[13006900] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[13807020] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[14408000] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[15407960] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[37205440] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[44405100] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[48604020] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[52405240] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[52605200] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[43603820] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[44203640] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[45003940] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[61203080] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[61403440] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[61603180] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[62003060] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[32005160] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[32605140] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33204920] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33406640] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34205240] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35804880] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35806760] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36604200] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[37206920] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[38805340] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[39005660] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[39805580] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[52206120] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[52405840] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54005920] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55005840] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55006260] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55806120] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56606240] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[19408060] = {
		name = L["7:XT"],
		category = "rares",
		description = L["Long Distance Recovery Unit"],
		faction = "Neutral",
	},
	[42002720] = {
		name = L["Shadowforge Commander"],
		category = "rares",
		faction = "Neutral",
	},
	[44603360] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[51602880] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[52603020] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[4408060] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[13208380] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[13608320] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[16208700] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[11407580] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[12607900] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[16207720] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[16607880] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[18806180] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[19805840] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[19805920] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[19807720] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[20007840] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[20405740] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[21005060] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[27407160] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[30405600] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[31206120] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[33007020] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[33807100] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[34206925] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[42605180] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[43407240] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[43607180] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[44405220] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[44604580] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[45405160] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[45805240] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[46404800] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[48604580] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[49004660] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[51804940] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[52007540] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[53007520] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[58006060] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[58806040] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[58806960] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[45603720] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[54801480] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[28605240] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33004840] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33005600] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33405480] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34005340] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34006700] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34205120] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34405040] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34405440] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34605280] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34804560] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34805160] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35406620] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35606980] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35806140] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35807080] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36205520] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36806460] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[37205900] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[39206000] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[40004000] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[42605360] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[46004360] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[46404460] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[49805240] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[53006380] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54006060] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54406400] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55205980] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55206160] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55806800] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56006040] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56205920] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56406240] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56406260] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56406480] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56605920] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56606040] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[58606080] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[60206500] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[53408660] = {
		name = L["7:XT"],
		category = "rares",
		description = L["Long Distance Recovery Unit"],
		faction = "Neutral",
	},
	[54408360] = {
		name = L["7:XT"],
		category = "rares",
		description = L["Long Distance Recovery Unit"],
		faction = "Neutral",
	},
	[40802520] = {
		name = L["Shadowforge Commander"],
		category = "rares",
		faction = "Neutral",
	},
	[37804040] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[45203320] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[5008120] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[13208320] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[13408560] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[13808200] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[14808940] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[15409080] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[16009140] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[9007340] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[35005680] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[35605700] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[42405265] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[43205280] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[54007120] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[27206180] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[31405800] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33005200] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34805100] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35205240] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35205340] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35206640] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35806620] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35806700] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36206940] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[37206420] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[52406260] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[53806320] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54206420] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55006560] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55806460] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56006300] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[57806200] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[58605420] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[60405220] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54605380] = {
		name = L["7:XT"],
		category = "rares",
		description = L["Long Distance Recovery Unit"],
		faction = "Neutral",
	},
	[55405320] = {
		name = L["7:XT"],
		category = "rares",
		description = L["Long Distance Recovery Unit"],
		faction = "Neutral",
	},
	[41002920] = {
		name = L["Shadowforge Commander"],
		category = "rares",
		faction = "Neutral",
	},
	[27606120] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[31605600] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[36004240] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[55002700] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[3008080] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[15608800] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[15608900] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[8404300] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[13006980] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[14406880] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[15807840] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[18407840] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[21007840] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[24805400] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[25405540] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[47004620] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[51807600] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[54607200] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[55406120] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[55806020] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[57805900] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[58005700] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[59406000] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[5604520] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[30004820] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[32405420] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33605320] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35606420] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35806740] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36204740] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36606840] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[37606800] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[38607320] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[50605920] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[52005200] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[53006240] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54205620] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54606140] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54805780] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56005740] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56006140] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56606060] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[58406460] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54208340] = {
		name = L["7:XT"],
		category = "rares",
		description = L["Long Distance Recovery Unit"],
		faction = "Neutral",
	},
	[58406760] = {
		name = L["7:XT"],
		category = "rares",
		description = L["Long Distance Recovery Unit"],
		faction = "Neutral",
	},
	[31804620] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[34204540] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[47801320] = {
		name = L["War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[3408300] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[4007860] = {
		name = L["Rumbler"],
		category = "rares",
		faction = "Neutral",
	},
	[4204920] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[10407420] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[13408140] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[13806420] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[14607960] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[15407820] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[17206800] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[18806060] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[31206660] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[31406980] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[31806860] = {
		name = L["Anathemus"],
		category = "rares",
		faction = "Neutral",
	},
	[44403680] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[44803580] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[45203540] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[45203800] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[45603740] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[53601620] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[55001560] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[60202940] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[62003200] = {
		name = L["Broken Tooth"],
		category = "rares",
		faction = "Horde",
	},
	[3604420] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[30605360] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[31605220] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[32405720] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[32805280] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33004660] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33005440] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33205000] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33406500] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[33606320] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[34805540] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35006600] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35205220] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[35606960] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36006520] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[36007140] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[37405500] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[39805860] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[40805540] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[53806180] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[54805920] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55606500] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[55806080] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56006200] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56206260] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[56406380] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[57805905] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
	[58406100] = {
		name = L["Zaricotl"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1427] = {
	[37803060] = {
		name = L["Lanie Reed"],
		category = "flightmasters",
		fpName = L["Thorium Point, Searing Gorge"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[34803060] = {
		name = L["Grisha"],
		category = "flightmasters",
		fpName = L["Thorium Point, Searing Gorge"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[41407480] = {
		name = L["Graw Cornerstone"],
		npcID = 11703,
		category = "repair",
		description = L["Mail Armor Merchant"],
		faction = "Alliance",
	},
	[38602840] = {
		name = L["Master Smith Burninate"],
		npcID = 14624,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["The Thorium Brotherhood"],
		faction = "Neutral",
	},
	[35402280] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[63607580] = {
		name = L["Sarah Tanner"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Master Elemental Leatherworker"],
		faction = "Alliance",
	},
	[34802620] = {
		name = L["Rekk'tilac"],
		category = "rares",
		faction = "Neutral",
	},
	[61807280] = {
		name = L["Rekk'tilac"],
		category = "rares",
		faction = "Neutral",
	},
	[29206080] = {
		name = L["Smoldar"],
		category = "rares",
		faction = "Horde",
	},
	[30005080] = {
		name = L["Smoldar"],
		category = "rares",
		faction = "Horde",
	},
	[33004480] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[34004620] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[43004280] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[47406600] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[59605620] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[55605880] = {
		name = L["Shleipnarr"],
		category = "rares",
		faction = "Neutral",
	},
	[58405200] = {
		name = L["Shleipnarr"],
		category = "rares",
		faction = "Neutral",
	},
	[65004500] = {
		name = L["Shleipnarr"],
		category = "rares",
		faction = "Neutral",
	},
	[35805600] = {
		name = L["Scald"],
		category = "rares",
		faction = "Neutral",
	},
	[50204880] = {
		name = L["Scald"],
		category = "rares",
		faction = "Neutral",
	},
	[51404540] = {
		name = L["Scald"],
		category = "rares",
		faction = "Neutral",
	},
	[14203760] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[14203880] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[28402600] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[29602700] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[29802620] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[30602640] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[41002500] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[41004460] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[41202620] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[41804380] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[44403740] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[45403860] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[45603880] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[46202580] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[30406980] = {
		name = L["Rekk'tilac"],
		category = "rares",
		faction = "Neutral",
	},
	[35802580] = {
		name = L["Rekk'tilac"],
		category = "rares",
		faction = "Neutral",
	},
	[58005900] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[59405900] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[54805600] = {
		name = L["Shleipnarr"],
		category = "rares",
		faction = "Neutral",
	},
	[37405520] = {
		name = L["Scald"],
		category = "rares",
		faction = "Neutral",
	},
	[50604760] = {
		name = L["Scald"],
		category = "rares",
		faction = "Neutral",
	},
	[29402660] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[40803560] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[41002460] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[41404460] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[42603480] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[42803560] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[45403840] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[46002680] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[30207200] = {
		name = L["Rekk'tilac"],
		category = "rares",
		faction = "Neutral",
	},
	[31207220] = {
		name = L["Rekk'tilac"],
		category = "rares",
		faction = "Neutral",
	},
	[47206720] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[48006800] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[58805600] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[59605700] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[63405220] = {
		name = L["Shleipnarr"],
		category = "rares",
		faction = "Neutral",
	},
	[64605300] = {
		name = L["Shleipnarr"],
		category = "rares",
		faction = "Neutral",
	},
	[66003740] = {
		name = L["Shleipnarr"],
		category = "rares",
		faction = "Neutral",
	},
	[53604520] = {
		name = L["Scald"],
		category = "rares",
		faction = "Neutral",
	},
	[59404140] = {
		name = L["Scald"],
		category = "rares",
		faction = "Neutral",
	},
	[13004060] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[29802640] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[40403540] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[40603580] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[46003020] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[46402680] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[28202580] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[40603500] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[41003560] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Neutral",
	},
	[35202580] = {
		name = L["Rekk'tilac"],
		category = "rares",
		faction = "Neutral",
	},
	[32206080] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[65603820] = {
		name = L["Shleipnarr"],
		category = "rares",
		faction = "Neutral",
	},
	[14403780] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[14603800] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[28002580] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Neutral",
	},
	[41004400] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Horde",
	},
	[44802680] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Horde",
	},
	[46002560] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Horde",
	},
	[50207080] = {
		name = L["Rekk'tilac"],
		category = "rares",
		faction = "Neutral",
	},
	[33406080] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[48206660] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[58205600] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[62406020] = {
		name = L["Faulty War Golem"],
		category = "rares",
		faction = "Neutral",
	},
	[64804800] = {
		name = L["Shleipnarr"],
		category = "rares",
		faction = "Neutral",
	},
	[14403860] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Horde",
	},
	[29602660] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Horde",
	},
	[33402720] = {
		name = L["Highlord Mastrogonde"],
		category = "rares",
		faction = "Horde",
	},
	[40004500] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Horde",
	},
	[41204400] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Horde",
	},
	[41204460] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Horde",
	},
	[41603560] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Horde",
	},
	[41604480] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Horde",
	},
	[46002620] = {
		name = L["Slave Master Blackheart"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1435] = {
	[46005460] = {
		name = L["Breyk"],
		category = "flightmasters",
		fpName = L["Stonard, Swamp of Sorrows"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[45005660] = {
		name = L["Innkeeper Karakul"],
		npcID = 6930,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[45405500] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Neutral",
	},
	[45005020] = {
		name = L["Grimnal"],
		npcID = 980,
		category = "repair",
		description = L["Mail & Plate Merchant"],
		faction = "Horde",
	},
	[45605100] = {
		name = L["Hartash"],
		npcID = 981,
		category = "repair",
		description = L["Weapon Merchant"],
		faction = "Horde",
	},
	[45005140] = {
		name = L["Thralosh"],
		npcID = 984,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Horde",
	},
	[45405160] = {
		name = L["Gharash"],
		npcID = 8176,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Horde",
	},
	[50206220] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[45405505] = {
		name = L["Hekkru"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[44805740] = {
		name = L["Malosh"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[48005780] = {
		name = L["Haromm"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[47205320] = {
		name = L["Ogromm"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[48405540] = {
		name = L["Kartosh"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[48405560] = {
		name = L["Rogvar"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Master Alchemist"],
		faction = "Horde",
	},
	[47205300] = {
		name = L["Grokor"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Horde",
	},
	[46405420] = {
		name = L["Thultash"],
		npcID = 982,
		category = "vendors",
		description = L["Food & Drink Vendor"],
		faction = "Horde",
	},
	[45805300] = {
		name = L["Thultazor"],
		npcID = 983,
		category = "vendors",
		description = L["Arcane Goods Vendor"],
		faction = "Horde",
	},
	[44605680] = {
		name = L["Banalash"],
		npcID = 989,
		category = "vendors",
		description = L["Trade Goods"],
		faction = "Horde",
	},
	[45405700] = {
		name = L["Rartar"],
		npcID = 8177,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Horde",
	},
	[26403160] = {
		name = L["Masat T'andr"],
		npcID = 11874,
		category = "vendors",
		description = L["Superior Leatherworker"],
		faction = "Neutral",
	},
	[48405545] = {
		name = L["Greshka"],
		npcID = 12807,
		category = "vendors",
		description = L["Demon Master"],
		faction = "Horde",
	},
	[61002040] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[61202060] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[61802000] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[61802080] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[61802180] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[62602040] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[62602160] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[63002100] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[62202300] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[62602200] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[62802360] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[62802580] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[65202220] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[65402080] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[65402260] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[65602280] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[65802440] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[66202480] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[66402060] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[67202000] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[63603980] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[64003900] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[68803900] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[69203820] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[70603800] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[76604180] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78204120] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78604440] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78605900] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78606300] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78606380] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[79004780] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[79404620] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[79404660] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[79805080] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[80004860] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[80605120] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[63008560] = {
		name = L["Fingat"],
		category = "rares",
		faction = "Neutral",
	},
	[63008740] = {
		name = L["Fingat"],
		category = "rares",
		faction = "Neutral",
	},
	[63009020] = {
		name = L["Fingat"],
		category = "rares",
		faction = "Neutral",
	},
	[93605960] = {
		name = L["Gilmorian"],
		category = "rares",
		faction = "Neutral",
	},
	[94205620] = {
		name = L["Gilmorian"],
		category = "rares",
		faction = "Neutral",
	},
	[23604500] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[24004100] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[24204560] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[27003500] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[27203580] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[28005140] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[29404580] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[29804760] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[30003300] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[30204580] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[31604440] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[31804260] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[37003800] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[42403320] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[60602040] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[61402420] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[81605260] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Horde",
	},
	[61008560] = {
		name = L["Fingat"],
		category = "rares",
		faction = "Neutral",
	},
	[62208740] = {
		name = L["Fingat"],
		category = "rares",
		faction = "Neutral",
	},
	[65808120] = {
		name = L["Fingat"],
		category = "rares",
		faction = "Neutral",
	},
	[78000560] = {
		name = L["Gilmorian"],
		category = "rares",
		faction = "Neutral",
	},
	[87807900] = {
		name = L["Gilmorian"],
		category = "rares",
		faction = "Neutral",
	},
	[89407440] = {
		name = L["Gilmorian"],
		category = "rares",
		faction = "Neutral",
	},
	[90007340] = {
		name = L["Gilmorian"],
		category = "rares",
		faction = "Neutral",
	},
	[18804480] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[21404620] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[23004700] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[24404920] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[27403740] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[27603380] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[28003700] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[29803660] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[30203540] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[30603440] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[61402260] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[61802240] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[62202400] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[64202340] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Neutral",
	},
	[69603900] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[72203700] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[75003500] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[76803680] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[76803920] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[77204700] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[77803380] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78004680] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78004800] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78206440] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[79404260] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[80604460] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[88008020] = {
		name = L["Gilmorian"],
		category = "rares",
		faction = "Neutral",
	},
	[91803300] = {
		name = L["Gilmorian"],
		category = "rares",
		faction = "Neutral",
	},
	[92206220] = {
		name = L["Gilmorian"],
		category = "rares",
		faction = "Neutral",
	},
	[22004960] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[24605100] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[24805160] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[26205160] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[27803680] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[35803320] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[61202220] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[63202500] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Horde",
	},
	[64002280] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Horde",
	},
	[64602300] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Horde",
	},
	[66003840] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[70603700] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[77206160] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[77403400] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[77804640] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[77804720] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[79805440] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[81203200] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[82005500] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[23004320] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[59802080] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[65002280] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Horde",
	},
	[65402220] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Horde",
	},
	[67404120] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[70003820] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[70803780] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78005060] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[79404980] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[80004760] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[63808760] = {
		name = L["Fingat"],
		category = "rares",
		faction = "Neutral",
	},
	[66008020] = {
		name = L["Fingat"],
		category = "rares",
		faction = "Neutral",
	},
	[23804400] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[35204580] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[61202020] = {
		name = L["Lost One Chieftain"],
		category = "rares",
		faction = "Neutral",
	},
	[62402360] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Horde",
	},
	[62802600] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Horde",
	},
	[63002460] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Horde",
	},
	[65002320] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Horde",
	},
	[65202380] = {
		name = L["Lost One Cook"],
		category = "rares",
		faction = "Horde",
	},
	[65403880] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[68603700] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[77406260] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78204720] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78204780] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[78604360] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[79206460] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[79604500] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[81005080] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[81005160] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[81605160] = {
		name = L["Lord Captain Wyrmak"],
		category = "rares",
		faction = "Neutral",
	},
	[63009120] = {
		name = L["Fingat"],
		category = "rares",
		faction = "Neutral",
	},
	[63208460] = {
		name = L["Fingat"],
		category = "rares",
		faction = "Neutral",
	},
	[28203940] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[29404060] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
	[30404880] = {
		name = L["Molt Thorn"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1422] = {
	[43008500] = {
		name = L["Bibilfaz Featherwhistle"],
		category = "flightmasters",
		fpName = L["Chillwind Camp, Western Plaguelands"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[42808380] = {
		name = L["Argent Quartermaster Lightspark"],
		npcID = 10857,
		category = "repair",
		description = L["The Argent Dawn"],
		faction = "Alliance",
	},
	[68007760] = {
		name = L["Magnus Frostwake"],
		npcID = 11278,
		category = "repair",
		faction = "Neutral",
	},
	[43008420] = {
		name = L["Leonard Porter"],
		npcID = 12942,
		category = "repair",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Alliance",
	},
	[45408540] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[42608380] = {
		name = L["Alchemist Arbington"],
		npcID = 11056,
		category = "vendors",
		faction = "Alliance",
	},
	[69407940] = {
		name = L["Baker Masterson"],
		npcID = 11287,
		category = "vendors",
		faction = "Neutral",
	},
	[42601820] = {
		name = L["Scarlet Judge"],
		category = "rares",
		faction = "Neutral",
	},
	[42601880] = {
		name = L["Scarlet Judge"],
		category = "rares",
		faction = "Neutral",
	},
	[54402400] = {
		name = L["Scarlet High Clerist"],
		category = "rares",
		faction = "Neutral",
	},
	[55002320] = {
		name = L["Scarlet High Clerist"],
		category = "rares",
		faction = "Neutral",
	},
	[45801880] = {
		name = L["Scarlet Executioner"],
		category = "rares",
		faction = "Neutral",
	},
	[45400920] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[48403160] = {
		name = L["Foreman Marcrid"],
		category = "rares",
		faction = "Neutral",
	},
	[44205040] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[45405220] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[45405280] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[45605280] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[38806820] = {
		name = L["Putridius"],
		category = "rares",
		faction = "Neutral",
	},
	[39606740] = {
		name = L["Putridius"],
		category = "rares",
		faction = "Neutral",
	},
	[40806600] = {
		name = L["Putridius"],
		category = "rares",
		faction = "Neutral",
	},
	[44006640] = {
		name = L["Putridius"],
		category = "rares",
		faction = "Neutral",
	},
	[64203800] = {
		name = L["The Husk"],
		category = "rares",
		faction = "Neutral",
	},
	[42201800] = {
		name = L["Scarlet Judge"],
		category = "rares",
		faction = "Neutral",
	},
	[42401900] = {
		name = L["Scarlet Judge"],
		category = "rares",
		faction = "Neutral",
	},
	[54202460] = {
		name = L["Scarlet High Clerist"],
		category = "rares",
		faction = "Neutral",
	},
	[54402620] = {
		name = L["Scarlet High Clerist"],
		category = "rares",
		faction = "Neutral",
	},
	[54602380] = {
		name = L["Scarlet High Clerist"],
		category = "rares",
		faction = "Neutral",
	},
	[54802340] = {
		name = L["Scarlet High Clerist"],
		category = "rares",
		faction = "Neutral",
	},
	[45801840] = {
		name = L["Scarlet Executioner"],
		category = "rares",
		faction = "Neutral",
	},
	[46401560] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[45203740] = {
		name = L["Foreman Marcrid"],
		category = "rares",
		faction = "Neutral",
	},
	[44805060] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[46205220] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[49407860] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Neutral",
	},
	[49607860] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Neutral",
	},
	[50408000] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Neutral",
	},
	[51207920] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Neutral",
	},
	[52208040] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Neutral",
	},
	[40606740] = {
		name = L["Putridius"],
		category = "rares",
		faction = "Neutral",
	},
	[42201820] = {
		name = L["Scarlet Judge"],
		category = "rares",
		faction = "Neutral",
	},
	[55002340] = {
		name = L["Scarlet High Clerist"],
		category = "rares",
		faction = "Neutral",
	},
	[45001780] = {
		name = L["Scarlet Executioner"],
		category = "rares",
		faction = "Neutral",
	},
	[45801860] = {
		name = L["Scarlet Executioner"],
		category = "rares",
		faction = "Neutral",
	},
	[44601900] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[46805280] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[49807440] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Neutral",
	},
	[50207560] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Neutral",
	},
	[50808020] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Neutral",
	},
	[39806800] = {
		name = L["Putridius"],
		category = "rares",
		faction = "Neutral",
	},
	[44601480] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[45001340] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[45801320] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[46201540] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[46801200] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[47601320] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[45200980] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[45401440] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[46001320] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[46001560] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[46601260] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[46601540] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[66604260] = {
		name = L["The Husk"],
		category = "rares",
		faction = "Neutral",
	},
	[67604480] = {
		name = L["The Husk"],
		category = "rares",
		faction = "Neutral",
	},
	[44001100] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[44201240] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[45801380] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[47201240] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[47401280] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[42801860] = {
		name = L["Scarlet Judge"],
		category = "rares",
		faction = "Neutral",
	},
	[54202380] = {
		name = L["Scarlet High Clerist"],
		category = "rares",
		faction = "Neutral",
	},
	[54602660] = {
		name = L["Scarlet High Clerist"],
		category = "rares",
		faction = "Neutral",
	},
	[45801960] = {
		name = L["Scarlet Executioner"],
		category = "rares",
		faction = "Neutral",
	},
	[45201000] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[45601080] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[46001500] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[46601600] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[47401400] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[45003560] = {
		name = L["Foreman Marcrid"],
		category = "rares",
		faction = "Neutral",
	},
	[45805480] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[46205080] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[47205200] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[49207800] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Neutral",
	},
	[45401445] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[42401880] = {
		name = L["Scarlet Judge"],
		category = "rares",
		faction = "Neutral",
	},
	[42601860] = {
		name = L["Scarlet Judge"],
		category = "rares",
		faction = "Neutral",
	},
	[46601420] = {
		name = L["Scarlet Interrogator"],
		category = "rares",
		faction = "Neutral",
	},
	[45201040] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[45601060] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[45801420] = {
		name = L["Foreman Jerris"],
		category = "rares",
		faction = "Neutral",
	},
	[45604980] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[46005100] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[46204860] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[46605360] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[47005120] = {
		name = L["Foulmane"],
		category = "rares",
		faction = "Neutral",
	},
	[49607780] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Horde",
	},
	[50207520] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Horde",
	},
	[50407960] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Horde",
	},
	[54008040] = {
		name = L["Lord Maldazzar"],
		category = "rares",
		faction = "Horde",
	},
	[44401360] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[45201480] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[45601380] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
	[45801240] = {
		name = L["Scarlet Smith"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1417] = {
	[45804620] = {
		name = L["Cedrik Prose"],
		category = "flightmasters",
		fpName = L["Refuge Pointe, Arathi"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[73003260] = {
		name = L["Urda"],
		category = "flightmasters",
		fpName = L["Hammerfall, Arathi"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[73803260] = {
		name = L["Innkeeper Adegwa"],
		npcID = 9501,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[73803310] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[46004760] = {
		name = L["Jannos Ironwill"],
		npcID = 1471,
		category = "repair",
		description = L["Superior Macecrafter"],
		faction = "Alliance",
	},
	[72603340] = {
		name = L["Mu'uta"],
		npcID = 9555,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Horde",
	},
	[73402980] = {
		name = L["Rutherford Twing"],
		npcID = 15126,
		category = "repair",
		description = L["Defilers Supply Officer"],
		faction = "Horde",
	},
	[46004520] = {
		name = L["Samuel Hawke"],
		npcID = 15127,
		category = "repair",
		description = L["League of Arathor Supply Officer"],
		faction = "Alliance",
	},
	[48605560] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[73803320] = {
		name = L["Tharlidun"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[74003380] = {
		name = L["Slagg"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Superior Butcher"],
		faction = "Horde",
	},
	[28204500] = {
		name = L["Brumn Winterhoof"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Master Elemental Leatherworker"],
		faction = "Horde",
	},
	[27005880] = {
		name = L["Deneb Walker"],
		npcID = 2805,
		category = "vendors",
		description = L["Scrolls & Potions"],
		faction = "Alliance",
	},
	[46404760] = {
		name = L["Vikki Lonsav"],
		npcID = 2808,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Alliance",
	},
	[46404740] = {
		name = L["Hammon Karwn"],
		npcID = 2810,
		category = "vendors",
		description = L["Superior Tradesman"],
		faction = "Alliance",
	},
	[46204720] = {
		name = L["Drovnar Strongbrew"],
		npcID = 2812,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Alliance",
	},
	[45604760] = {
		name = L["Narj Deepslice"],
		npcID = 2814,
		category = "vendors",
		description = L["Butcher"],
		faction = "Alliance",
	},
	[45004680] = {
		name = L["Androd Fadran"],
		npcID = 2816,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Alliance",
	},
	[74803460] = {
		name = L["Tunkk"],
		npcID = 2819,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Horde",
	},
	[74003240] = {
		name = L["Graud"],
		npcID = 2820,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Horde",
	},
	[74003260] = {
		name = L["Keena"],
		npcID = 2821,
		category = "vendors",
		description = L["Trade Goods"],
		faction = "Horde",
	},
	[74203380] = {
		name = L["Uttnar"],
		npcID = 4954,
		category = "vendors",
		description = L["Butcher"],
		faction = "Horde",
	},
	[72603640] = {
		name = L["Jun'ha"],
		npcID = 6574,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Horde",
	},
	[46404540] = {
		name = L["Targot Jinglepocket"],
		npcID = 15124,
		category = "vendors",
		description = L["Smokywood Pastures"],
		faction = "Alliance",
	},
	[74002920] = {
		name = L["Kosco Copperpinch"],
		npcID = 15125,
		category = "vendors",
		description = L["Smokywood Pastures"],
		faction = "Horde",
	},
	[27006600] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[27406280] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[27606360] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[27806640] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[28006300] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[29206100] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[31202640] = {
		name = L["Singer"],
		category = "rares",
		faction = "Neutral",
	},
	[32402680] = {
		name = L["Singer"],
		category = "rares",
		faction = "Neutral",
	},
	[32403100] = {
		name = L["Singer"],
		category = "rares",
		faction = "Neutral",
	},
	[32603120] = {
		name = L["Singer"],
		category = "rares",
		faction = "Neutral",
	},
	[33402800] = {
		name = L["Singer"],
		category = "rares",
		faction = "Neutral",
	},
	[33602740] = {
		name = L["Singer"],
		category = "rares",
		faction = "Neutral",
	},
	[20206640] = {
		name = L["Foulbelly"],
		category = "rares",
		faction = "Neutral",
	},
	[21406620] = {
		name = L["Foulbelly"],
		category = "rares",
		faction = "Neutral",
	},
	[21606540] = {
		name = L["Foulbelly"],
		category = "rares",
		faction = "Neutral",
	},
	[18206860] = {
		name = L["Ruul Onestone"],
		category = "rares",
		faction = "Neutral",
	},
	[32004600] = {
		name = L["Kovork"],
		category = "rares",
		faction = "Neutral",
	},
	[32604600] = {
		name = L["Kovork"],
		category = "rares",
		faction = "Neutral",
	},
	[53408000] = {
		name = L["Molok the Crusher"],
		category = "rares",
		faction = "Neutral",
	},
	[53807960] = {
		name = L["Molok the Crusher"],
		category = "rares",
		faction = "Neutral",
	},
	[54007920] = {
		name = L["Molok the Crusher"],
		category = "rares",
		faction = "Neutral",
	},
	[67408120] = {
		name = L["Zalas Witherbark"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[68608080] = {
		name = L["Zalas Witherbark"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[69607960] = {
		name = L["Zalas Witherbark"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[61807300] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[64006780] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[64206660] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[64207440] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[65007420] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[66206220] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[66406260] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[70206620] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[72006400] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[72006580] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[72406480] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[72806620] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[73006480] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[22608520] = {
		name = L["Prince Nazjak"],
		category = "rares",
		faction = "Neutral",
	},
	[23408900] = {
		name = L["Prince Nazjak"],
		category = "rares",
		faction = "Neutral",
	},
	[27406640] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[27606540] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[31202620] = {
		name = L["Singer"],
		category = "rares",
		faction = "Alliance",
	},
	[33202780] = {
		name = L["Singer"],
		category = "rares",
		faction = "Alliance",
	},
	[20006440] = {
		name = L["Foulbelly"],
		category = "rares",
		faction = "Neutral",
	},
	[20006460] = {
		name = L["Foulbelly"],
		category = "rares",
		faction = "Neutral",
	},
	[63006660] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[63806620] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[21808480] = {
		name = L["Prince Nazjak"],
		category = "rares",
		faction = "Neutral",
	},
	[26606620] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[28206480] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[29606060] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[20006520] = {
		name = L["Foulbelly"],
		category = "rares",
		faction = "Neutral",
	},
	[31404580] = {
		name = L["Kovork"],
		category = "rares",
		faction = "Alliance",
	},
	[31604580] = {
		name = L["Kovork"],
		category = "rares",
		faction = "Alliance",
	},
	[54607820] = {
		name = L["Molok the Crusher"],
		category = "rares",
		faction = "Neutral",
	},
	[63606740] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[63806360] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[64806300] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[65407480] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[67006380] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[21608940] = {
		name = L["Prince Nazjak"],
		category = "rares",
		faction = "Neutral",
	},
	[23208420] = {
		name = L["Prince Nazjak"],
		category = "rares",
		faction = "Neutral",
	},
	[29606140] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[19806480] = {
		name = L["Foulbelly"],
		category = "rares",
		faction = "Neutral",
	},
	[32804600] = {
		name = L["Kovork"],
		category = "rares",
		faction = "Alliance",
	},
	[61207180] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[63806900] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[67406300] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[27206380] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[27206580] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[28006240] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[28606400] = {
		name = L["Darbel Montrose"],
		category = "rares",
		description = L["Shadow Council Warlock"],
		faction = "Horde",
	},
	[69207960] = {
		name = L["Zalas Witherbark"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Neutral",
	},
	[20809040] = {
		name = L["Prince Nazjak"],
		category = "rares",
		faction = "Neutral",
	},
	[22408960] = {
		name = L["Prince Nazjak"],
		category = "rares",
		faction = "Neutral",
	},
	[19606500] = {
		name = L["Foulbelly"],
		category = "rares",
		faction = "Neutral",
	},
	[63606780] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Horde",
	},
	[66206280] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Horde",
	},
	[71806300] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Horde",
	},
	[72606420] = {
		name = L["Nimar the Slayer"],
		category = "rares",
		description = L["Warband Leader"],
		faction = "Horde",
	},
	[21208920] = {
		name = L["Prince Nazjak"],
		category = "rares",
		faction = "Neutral",
	},
	[21608900] = {
		name = L["Prince Nazjak"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1419] = {
	[65402440] = {
		name = L["Alexandra Constantine"],
		category = "flightmasters",
		fpName = L["Nethergarde Keep, Blasted Lands"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[64101930] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[66001740] = {
		name = L["Strumner Flintheel"],
		npcID = 5508,
		category = "repair",
		description = L["Armor Crafter"],
		faction = "Alliance",
	},
	[51001220] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[63401680] = {
		name = L["Bernie Heisten"],
		npcID = 3546,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Alliance",
	},
	[66801840] = {
		name = L["Nina Lightbrew"],
		npcID = 8178,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Alliance",
	},
	[41401180] = {
		name = L["Mojo the Twisted"],
		category = "rares",
		faction = "Neutral",
	},
	[41401260] = {
		name = L["Mojo the Twisted"],
		category = "rares",
		faction = "Neutral",
	},
	[45201600] = {
		name = L["Mojo the Twisted"],
		category = "rares",
		faction = "Neutral",
	},
	[48803760] = {
		name = L["Magronos the Unyielding"],
		category = "rares",
		faction = "Neutral",
	},
	[49004000] = {
		name = L["Magronos the Unyielding"],
		category = "rares",
		faction = "Neutral",
	},
	[44604600] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[45404780] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[45604620] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[45804860] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[52005260] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[58204580] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[58804480] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[59604540] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[59804640] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[57203300] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[57803280] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[58404040] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[58803800] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[59403860] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[59403960] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[59404260] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[60003860] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[60203760] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[47403640] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[47803420] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[58203620] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[58603540] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[59203620] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[60203765] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[45004240] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[49603620] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[50603680] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[51203600] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[51803560] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[54203320] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[55003340] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[55003580] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[56003440] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[56403540] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[56803460] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[57003560] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[57603400] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[61003540] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[61603480] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[43802520] = {
		name = L["Deatheye"],
		category = "rares",
		faction = "Neutral",
	},
	[44802520] = {
		name = L["Deatheye"],
		category = "rares",
		faction = "Neutral",
	},
	[45402640] = {
		name = L["Deatheye"],
		category = "rares",
		faction = "Neutral",
	},
	[46202460] = {
		name = L["Deatheye"],
		category = "rares",
		faction = "Neutral",
	},
	[55202700] = {
		name = L["Grunter"],
		category = "rares",
		faction = "Neutral",
	},
	[61802240] = {
		name = L["Grunter"],
		category = "rares",
		faction = "Neutral",
	},
	[39603620] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[40003660] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[41203820] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[42003900] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[42404000] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[42803920] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[42001160] = {
		name = L["Mojo the Twisted"],
		category = "rares",
		faction = "Neutral",
	},
	[49603980] = {
		name = L["Magronos the Unyielding"],
		category = "rares",
		faction = "Neutral",
	},
	[58804040] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[59603640] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[46201760] = {
		name = L["Deatheye"],
		category = "rares",
		faction = "Neutral",
	},
	[47601920] = {
		name = L["Deatheye"],
		category = "rares",
		faction = "Neutral",
	},
	[43001400] = {
		name = L["Mojo the Twisted"],
		category = "rares",
		faction = "Neutral",
	},
	[51205180] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[59404500] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[59804240] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[60004580] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[49403520] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[53803520] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[54403620] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[54403680] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[55003880] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[45202380] = {
		name = L["Deatheye"],
		category = "rares",
		faction = "Neutral",
	},
	[47401800] = {
		name = L["Deatheye"],
		category = "rares",
		faction = "Neutral",
	},
	[47401900] = {
		name = L["Deatheye"],
		category = "rares",
		faction = "Neutral",
	},
	[62402620] = {
		name = L["Grunter"],
		category = "rares",
		faction = "Neutral",
	},
	[39403560] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[42404120] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[43803920] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[44804240] = {
		name = L["Magronos the Unyielding"],
		category = "rares",
		faction = "Neutral",
	},
	[46204400] = {
		name = L["Magronos the Unyielding"],
		category = "rares",
		faction = "Neutral",
	},
	[46204840] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[51405340] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[51605240] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[59204400] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[59404020] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[60003580] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[60203440] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[50403840] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[44003900] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[41601200] = {
		name = L["Mojo the Twisted"],
		category = "rares",
		faction = "Neutral",
	},
	[45604860] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Neutral",
	},
	[59404660] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[61003740] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[61404440] = {
		name = L["Spiteflayer"],
		category = "rares",
		faction = "Neutral",
	},
	[48403600] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[58403600] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[60403720] = {
		name = L["Ravage"],
		category = "rares",
		faction = "Neutral",
	},
	[43602600] = {
		name = L["Deatheye"],
		category = "rares",
		faction = "Neutral",
	},
	[39603540] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[42203760] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[42804120] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[43403840] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[43001420] = {
		name = L["Mojo the Twisted"],
		category = "rares",
		faction = "Neutral",
	},
	[44604380] = {
		name = L["Magronos the Unyielding"],
		category = "rares",
		faction = "Neutral",
	},
	[45404280] = {
		name = L["Magronos the Unyielding"],
		category = "rares",
		faction = "Neutral",
	},
	[48003860] = {
		name = L["Magronos the Unyielding"],
		category = "rares",
		faction = "Neutral",
	},
	[49004040] = {
		name = L["Magronos the Unyielding"],
		category = "rares",
		faction = "Neutral",
	},
	[45804800] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Alliance",
	},
	[59404420] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Alliance",
	},
	[59604440] = {
		name = L["Akubar the Seer"],
		category = "rares",
		faction = "Alliance",
	},
	[55603600] = {
		name = L["Clack the Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[41003860] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[41203960] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[42604080] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
	[43804280] = {
		name = L["Dreadscorn"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1424] = {
	[60201860] = {
		name = L["Zarise"],
		category = "flightmasters",
		fpName = L["Tarren Mill, Hillsbrad"],
		description = L["Bat Handler"],
		faction = "Horde",
	},
	[49405220] = {
		name = L["Darla Harris"],
		category = "flightmasters",
		fpName = L["Southshore, Hillsbrad"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[51205880] = {
		name = L["Innkeeper Anderson"],
		npcID = 2352,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[62601900] = {
		name = L["Innkeeper Shay"],
		npcID = 2388,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[50405860] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[62401980] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[80003900] = {
		name = L["Kris Legace"],
		npcID = 3536,
		category = "repair",
		description = L["Freewheeling Tradeswoman"],
		faction = "Horde",
	},
	[51004800] = {
		name = L["Zixil"],
		npcID = 3537,
		category = "repair",
		description = L["Merchant Supreme"],
		faction = "Neutral",
	},
	[60402600] = {
		name = L["Ott"],
		npcID = 3539,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Horde",
	},
	[51205700] = {
		name = L["Robert Aebischer"],
		npcID = 3543,
		category = "repair",
		description = L["Superior Armorsmith"],
		faction = "Alliance",
	},
	[51605240] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[63601940] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[50205880] = {
		name = L["Wesley"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[62201980] = {
		name = L["Theodore Mont Claire"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[50606100] = {
		name = L["Donald Rabonne"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Alliance",
	},
	[61601960] = {
		name = L["Aranae Venomblood"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalist"],
		faction = "Horde",
	},
	[61601920] = {
		name = L["Serge Hinott"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Expert Alchemist"],
		faction = "Horde",
	},
	[63602080] = {
		name = L["Daryl Stack"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Master Tailor"],
		faction = "Horde",
	},
	[36404440] = {
		name = L["Hillsbrad Tailor"],
		npcID = 2264,
		category = "vendors",
		faction = "Alliance",
	},
	[32004560] = {
		name = L["Hillsbrad Apprentice Blacksmith"],
		npcID = 2265,
		category = "vendors",
		faction = "Alliance",
	},
	[52005560] = {
		name = L["Merideth Carlson"],
		npcID = 2357,
		category = "vendors",
		description = L["Horse Breeder"],
		faction = "Alliance",
	},
	[51005900] = {
		name = L["Neema"],
		npcID = 2364,
		category = "vendors",
		description = L["Waitress"],
		faction = "Alliance",
	},
	[48805720] = {
		name = L["Bront Coldcleave"],
		npcID = 2365,
		category = "vendors",
		description = L["Butcher"],
		faction = "Alliance",
	},
	[51405860] = {
		name = L["Barkeep Kelly"],
		npcID = 2366,
		category = "vendors",
		description = L["Bartender"],
		faction = "Alliance",
	},
	[50805700] = {
		name = L["Nandar Branson"],
		npcID = 2380,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Alliance",
	},
	[49005520] = {
		name = L["Micha Yance"],
		npcID = 2381,
		category = "vendors",
		description = L["Trade Goods"],
		faction = "Alliance",
	},
	[50606105] = {
		name = L["Lindea Rabonne"],
		npcID = 2383,
		category = "vendors",
		description = L["Tackle and Bait"],
		faction = "Alliance",
	},
	[62201900] = {
		name = L["Christoph Jeffcoat"],
		npcID = 2393,
		category = "vendors",
		description = L["Tradesman"],
		faction = "Horde",
	},
	[62002080] = {
		name = L["Mallen Swain"],
		npcID = 2394,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Horde",
	},
	[63001940] = {
		name = L["Derak Nightfall"],
		npcID = 2397,
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cook"],
		faction = "Horde",
	},
	[62401985] = {
		name = L["Kayren Soothallow"],
		npcID = 2401,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Horde",
	},
	[92003820] = {
		name = L["George Candarte"],
		npcID = 2698,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Neutral",
	},
	[49806220] = {
		name = L["Hal McAllister"],
		npcID = 3540,
		category = "vendors",
		description = L["Fish Merchant"],
		faction = "Alliance",
	},
	[49005525] = {
		name = L["Sarah Raycroft"],
		npcID = 3541,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Alliance",
	},
	[50805900] = {
		name = L["Jaysin Lanyda"],
		npcID = 3542,
		category = "vendors",
		subcategories = {
			reagent = true,
			poison = true,
		},
		description = L["Poisons & Reagents"],
		faction = "Alliance",
	},
	[61402000] = {
		name = L["Jason Lemieux"],
		npcID = 3544,
		category = "vendors",
		description = L["Mushroom Seller"],
		faction = "Horde",
	},
	[68207720] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[69407720] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[69607480] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[70607760] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[71807980] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[72007900] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[72008240] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[72208060] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[72808180] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[73408120] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[23406400] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Neutral",
	},
	[23406460] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Neutral",
	},
	[24406680] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Neutral",
	},
	[25006640] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Neutral",
	},
	[25807080] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Neutral",
	},
	[27407120] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Neutral",
	},
	[28407200] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Neutral",
	},
	[29207140] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Neutral",
	},
	[29607280] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Neutral",
	},
	[58007060] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[58607140] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[59407360] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[59807340] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[60207480] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[61207600] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[64207840] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[64407860] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[64607960] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[65007820] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[65608740] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[66808320] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[63805960] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Neutral",
	},
	[63806080] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Neutral",
	},
	[64206180] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Neutral",
	},
	[64805920] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Neutral",
	},
	[65406040] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Neutral",
	},
	[65806160] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Neutral",
	},
	[66006120] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Neutral",
	},
	[34605860] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[34606060] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[35206040] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[35605920] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[39405200] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[75603080] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[84604800] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[85603900] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[86204780] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[69807700] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[29207280] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Neutral",
	},
	[57806920] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[58407240] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[58607240] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[65407840] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[65408220] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[65607780] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[65608160] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[65808020] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[62406160] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[63006100] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[63006220] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[63206340] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[63606140] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[63806500] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[64006300] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[64205820] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[65005840] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[65206200] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[36605900] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[75403160] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[72208260] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[73208080] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[28406440] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[33605620] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[34205840] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[35005820] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[71202880] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[71802940] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[69807680] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[23806420] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Horde",
	},
	[24606360] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Horde",
	},
	[65608340] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[64206100] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[65005980] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[65605960] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[34405840] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[35405860] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[40605500] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[75003280] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[84604680] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[84804780] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[70407720] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[70807020] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[72608180] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[25207120] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Horde",
	},
	[27207020] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Horde",
	},
	[57807100] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[58007000] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[58807120] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[59407320] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[59607220] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[65008100] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[65008260] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[63205820] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[63206180] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[28206400] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[28406340] = {
		name = L["Creepthess"],
		category = "rares",
		faction = "Neutral",
	},
	[71602840] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[85403960] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[70407520] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[70407760] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[71007900] = {
		name = L["Tamra Stormpike"],
		category = "rares",
		faction = "Alliance",
	},
	[23606440] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Horde",
	},
	[24406620] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Horde",
	},
	[25006500] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Horde",
	},
	[26607140] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Horde",
	},
	[28207200] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Horde",
	},
	[29607300] = {
		name = L["Scargil"],
		category = "rares",
		faction = "Horde",
	},
	[59407280] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[59607340] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[60007380] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[66008460] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[66608720] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[67008480] = {
		name = L["Lady Zephris"],
		category = "rares",
		faction = "Alliance",
	},
	[63805840] = {
		name = L["Ro'Bark"],
		category = "rares",
		faction = "Alliance",
	},
	[85803840] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[86603960] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
	[87003880] = {
		name = L["Big Samras"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1431] = {
	[77404440] = {
		name = L["Felicia Maline"],
		category = "flightmasters",
		fpName = L["Darkshire, Duskwood"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[73804440] = {
		name = L["Innkeeper Trelayne"],
		npcID = 6790,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[73804620] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[73604880] = {
		name = L["Gavin Gnarltree"],
		npcID = 225,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[73804860] = {
		name = L["Morg Gnarltree"],
		npcID = 226,
		category = "repair",
		description = L["Armorer"],
		faction = "Alliance",
	},
	[73204480] = {
		name = L["Avette Fellwood"],
		npcID = 228,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Alliance",
	},
	[20004940] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[75005900] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[74004620] = {
		name = L["Steven Black"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[77404860] = {
		name = L["Finbus Geargrind"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Expert Engineer"],
		faction = "Alliance",
	},
	[74004840] = {
		name = L["Clarise Gnarltree"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Expert Blacksmith"],
		faction = "Alliance",
	},
	[74004960] = {
		name = L["Matt Johnson"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Mining Trainer"],
		faction = "Alliance",
	},
	[74004480] = {
		name = L["Mabel Solaj"],
		npcID = 227,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods Vendor"],
		faction = "Alliance",
	},
	[73804420] = {
		name = L["Barkeep Hann"],
		npcID = 274,
		category = "vendors",
		description = L["Bartender"],
		faction = "Alliance",
	},
	[75004640] = {
		name = L["Antonio Perelli"],
		npcID = 844,
		category = "vendors",
		description = L["Traveling Salesman"],
		faction = "Alliance",
	},
	[73804500] = {
		name = L["Gunder Thornbush"],
		npcID = 960,
		category = "vendors",
		description = L["Tradesman"],
		faction = "Alliance",
	},
	[75604460] = {
		name = L["Lohgan Eva"],
		npcID = 1672,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Alliance",
	},
	[76004520] = {
		name = L["Alyssa Eva"],
		npcID = 1673,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Alliance",
	},
	[18005440] = {
		name = L["Bliztik"],
		npcID = 2481,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Alliance",
	},
	[75804540] = {
		name = L["Danielle Zipstitch"],
		npcID = 2668,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Alliance",
	},
	[75604540] = {
		name = L["Sheri Zipstitch"],
		npcID = 2669,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Alliance",
	},
	[77804820] = {
		name = L["Herble Baubbletump"],
		npcID = 3133,
		category = "vendors",
		description = L["Engineering and Mining Supplies"],
		faction = "Alliance",
	},
	[81801980] = {
		name = L["Kzixx"],
		npcID = 3134,
		category = "vendors",
		description = L["Rare Goods"],
		faction = "Neutral",
	},
	[79404440] = {
		name = L["Malissa"],
		npcID = 3135,
		category = "vendors",
		subcategories = {
			poison = true,
		},
		description = L["Poison Supplier"],
		faction = "Alliance",
	},
	[75604840] = {
		name = L["Scott Carevin"],
		npcID = 3138,
		category = "vendors",
		description = L["Mushroom Seller"],
		faction = "Alliance",
	},
	[25603020] = {
		name = L["Lord Malathrom"],
		category = "rares",
		faction = "Horde",
	},
	[59402940] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[59402980] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[60804060] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[61203780] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[61604160] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[61804320] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[62003760] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[62004140] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[62403700] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[62604080] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[62604580] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[63204020] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[63204840] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[63804680] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[63804780] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[64005040] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[64204940] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[64404100] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[65205060] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[21402620] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[23202720] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[23402900] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[24202800] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[24202920] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[24602700] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[29802760] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[33602880] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[33802980] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[37002840] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[37802840] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[38402620] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[60202440] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[65402680] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[70002520] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[70402560] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[71002400] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[61408160] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[61608140] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[62008160] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[62608220] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[62808280] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[71407440] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[72207440] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[73207620] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[73407680] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[73807720] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[74206820] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[74207860] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[74407760] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[74807480] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[76007420] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[86404800] = {
		name = L["Naraxis"],
		category = "rares",
		faction = "Horde",
	},
	[86404860] = {
		name = L["Naraxis"],
		category = "rares",
		faction = "Horde",
	},
	[86405020] = {
		name = L["Naraxis"],
		category = "rares",
		faction = "Horde",
	},
	[86405060] = {
		name = L["Naraxis"],
		category = "rares",
		faction = "Horde",
	},
	[86604940] = {
		name = L["Naraxis"],
		category = "rares",
		faction = "Horde",
	},
	[86604960] = {
		name = L["Naraxis"],
		category = "rares",
		faction = "Horde",
	},
	[87005160] = {
		name = L["Naraxis"],
		category = "rares",
		faction = "Horde",
	},
	[14403340] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[15003520] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[15203440] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[15803440] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[15803540] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[16003720] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[16603780] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[16803480] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[17403740] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[17603520] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[17603740] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[18003560] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[18003800] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[18603560] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[62003440] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[62604420] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[63004300] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[28002760] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[29602620] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[61002320] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[64802560] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[70802480] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[61008120] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[61808140] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[63008300] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[17203520] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[17203780] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[17603760] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[30002660] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[32603060] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[60802480] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[62602220] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[73007500] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[74007740] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[16003440] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[18003540] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[62804240] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[15403700] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[16003460] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[59802900] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[61404240] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[61604120] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[62604360] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[63002520] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[63002700] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[72607420] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[73207640] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[73607480] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[73807700] = {
		name = L["Nefaru"],
		category = "rares",
		faction = "Horde",
	},
	[87605000] = {
		name = L["Naraxis"],
		category = "rares",
		faction = "Horde",
	},
	[14203460] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[15203380] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[17003560] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[59804040] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[60003480] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[60203100] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[61803780] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[63003940] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[63405040] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[63405100] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[65004940] = {
		name = L["Fenros"],
		category = "rares",
		faction = "Horde",
	},
	[23002640] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[25602780] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[35603280] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[37602880] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[37802700] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[70202680] = {
		name = L["Lupos"],
		category = "rares",
		faction = "Horde",
	},
	[85605080] = {
		name = L["Naraxis"],
		category = "rares",
		faction = "Horde",
	},
	[86404900] = {
		name = L["Naraxis"],
		category = "rares",
		faction = "Horde",
	},
	[14203360] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
	[16403780] = {
		name = L["Commander Felstrom"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1433] = {
	[30605920] = {
		name = L["Ariena Stormfeather"],
		category = "flightmasters",
		fpName = L["Lakeshire, Redridge"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[26804460] = {
		name = L["Innkeeper Brianna"],
		npcID = 6727,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[26404670] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[27004560] = {
		name = L["Kimberly Hiett"],
		npcID = 789,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Fletcher"],
		faction = "Alliance",
	},
	[30604660] = {
		name = L["Kara Adams"],
		npcID = 793,
		category = "repair",
		description = L["Shield Crafter"],
		faction = "Alliance",
	},
	[30804660] = {
		name = L["Dorin Songblade"],
		npcID = 956,
		category = "repair",
		description = L["Armorer"],
		faction = "Alliance",
	},
	[23804140] = {
		name = L["Henry Chapal"],
		npcID = 3088,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gunsmith"],
		faction = "Alliance",
	},
	[88207120] = {
		name = L["Bernard Brubaker"],
		npcID = 3097,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[20805640] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[26804660] = {
		name = L["Penny"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[21404580] = {
		name = L["Alma Jainrose"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Alliance",
	},
	[26605100] = {
		name = L["Matthew Hooper"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fishing Trainer"],
		faction = "Alliance",
	},
	[22804380] = {
		name = L["Crystal Boughman"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cooking Trainer"],
		faction = "Alliance",
	},
	[88807100] = {
		name = L["Wilma Ranthal"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinning Trainer"],
		faction = "Alliance",
	},
	[29004740] = {
		name = L["Amy Davenport"],
		npcID = 777,
		category = "vendors",
		description = L["Tradeswoman"],
		faction = "Alliance",
	},
	[29804740] = {
		name = L["Karen Taylor"],
		npcID = 790,
		category = "vendors",
		profession = "blacksmithing",
		description = L["Mining and Smithing Supplies"],
		faction = "Alliance",
	},
	[28804740] = {
		name = L["Lindsay Ashlock"],
		npcID = 791,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[28804745] = {
		name = L["Antonio Perelli"],
		npcID = 844,
		category = "vendors",
		description = L["Traveling Salesman"],
		faction = "Alliance",
	},
	[21004640] = {
		name = L["Lamar Veisilli"],
		npcID = 1671,
		category = "vendors",
		description = L["Fruit Seller"],
		faction = "Alliance",
	},
	[27404760] = {
		name = L["Vernon Hale"],
		npcID = 1678,
		category = "vendors",
		description = L["Bait and Tackle Supplier"],
		faction = "Alliance",
	},
	[88807080] = {
		name = L["Clyde Ranthal"],
		npcID = 2697,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Alliance",
	},
	[26604340] = {
		name = L["Gloria Femmel"],
		npcID = 3085,
		category = "vendors",
		description = L["Cooking Supplies"],
		faction = "Alliance",
	},
	[22604420] = {
		name = L["Gretchen Vogel"],
		npcID = 3086,
		category = "vendors",
		description = L["Waitress"],
		faction = "Alliance",
	},
	[26804340] = {
		name = L["Sherman Femmel"],
		npcID = 3089,
		category = "vendors",
		description = L["Butcher"],
		faction = "Alliance",
	},
	[25004120] = {
		name = L["Gerald Crawley"],
		npcID = 3090,
		category = "vendors",
		subcategories = {
			poison = true,
		},
		description = L["Poison Supplier"],
		faction = "Alliance",
	},
	[27204540] = {
		name = L["Franklin Hamar"],
		npcID = 3091,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Alliance",
	},
	[74407920] = {
		name = L["Captured Servant of Azora"],
		npcID = 3096,
		category = "vendors",
		profession = "tailoring",
		description = L["Specialist Tailoring Supplies"],
		faction = "Alliance",
	},
	[26804380] = {
		name = L["Bartender Wental"],
		npcID = 5620,
		category = "vendors",
		description = L["Food and Drinks"],
		faction = "Alliance",
	},
	[33000660] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[34400700] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[34400820] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[34600720] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[34801020] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[35000760] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[35001140] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[35200860] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[35801200] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36001300] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36200880] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36400960] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36600860] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36600960] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36601120] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[37001300] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[37200780] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[37201160] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[38001300] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[39201400] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[41201560] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[42001560] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[50203780] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[51404340] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[52004240] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[52004520] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[52204560] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[52403840] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[52603900] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[53204040] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[54404720] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[54804360] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[55004340] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[56004380] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[57204160] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[58004040] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[75403300] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[75403960] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[75603260] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[75803180] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[76403600] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[77003540] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[77203920] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[78004040] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[81804860] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[82004720] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[82204780] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[82205500] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[82404960] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[82805400] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[83405760] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[83605680] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[62206120] = {
		name = L["Seeker Aqualon"],
		category = "rares",
		faction = "Neutral",
	},
	[62206180] = {
		name = L["Seeker Aqualon"],
		category = "rares",
		faction = "Neutral",
	},
	[62806220] = {
		name = L["Seeker Aqualon"],
		category = "rares",
		faction = "Neutral",
	},
	[63206260] = {
		name = L["Seeker Aqualon"],
		category = "rares",
		faction = "Neutral",
	},
	[63606260] = {
		name = L["Seeker Aqualon"],
		category = "rares",
		faction = "Neutral",
	},
	[64606600] = {
		name = L["Seeker Aqualon"],
		category = "rares",
		faction = "Neutral",
	},
	[37205020] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[38205680] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[38605940] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[39205440] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[39406420] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[40005360] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[40006440] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[40605180] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[41405080] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[42204920] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[42206440] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[42405160] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[42605420] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[42805140] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[43405160] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[44005120] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[44605220] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[44805140] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[45206420] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[45606500] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[45805260] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[51206860] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[53006620] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[54006220] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[55206400] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[13806280] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[14206620] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[14406180] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[14606740] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[15805840] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[15806000] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[16006720] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[17206640] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[17406280] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[17606500] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[28607440] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[28808280] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[29408120] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[30208000] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[31008320] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[31208200] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[31208400] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[31408460] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[32208240] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[32408340] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[32808400] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[32808480] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[33008200] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[33208300] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[33808140] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[34008320] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[35006600] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[35406680] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[35606660] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[36006620] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[36606660] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[42003260] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[42403120] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[42403160] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[42803140] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[42803240] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[43803100] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[47803460] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[48403440] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[48803420] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[48803520] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[88406360] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Neutral",
	},
	[88606480] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Neutral",
	},
	[88606560] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Neutral",
	},
	[88606760] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Neutral",
	},
	[88806700] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Neutral",
	},
	[89207020] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Neutral",
	},
	[89406860] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Neutral",
	},
	[35000800] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36000800] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[51804500] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[52003780] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[52803740] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[57804800] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[75803160] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[83004780] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[58205820] = {
		name = L["Seeker Aqualon"],
		category = "rares",
		faction = "Neutral",
	},
	[37405400] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[37805320] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[38005100] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[43606420] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[47605060] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[47606540] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[48606740] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[51205880] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[54606260] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[13806460] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[15006020] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[16206060] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[16606040] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[30808320] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[34408280] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[88406500] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Neutral",
	},
	[88406580] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Neutral",
	},
	[35000740] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[35600860] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[51603880] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[54404440] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[55404480] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[56004580] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[75803040] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[81405640] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[82005620] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[83404860] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[72807200] = {
		name = L["Seeker Aqualon"],
		category = "rares",
		faction = "Neutral",
	},
	[38805480] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[42605120] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[49405560] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[49805620] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[51005640] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[51206660] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[51605820] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[52006940] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[17606000] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[52204140] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[53604120] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[76804060] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[37205660] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[38805620] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[39206200] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[46405320] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[48205640] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[14406460] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[15605860] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[31808280] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[32008480] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[43203220] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[47803260] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[89406700] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Horde",
	},
	[89606800] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Horde",
	},
	[89606860] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Horde",
	},
	[90206600] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Horde",
	},
	[36001000] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36401240] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[54004140] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[56204200] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[38405540] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[38405580] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[42605000] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[14806340] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[16405960] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[16806520] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[31008380] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[34800820] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[35800820] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36400900] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36401020] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[36401300] = {
		name = L["Kazon"],
		category = "rares",
		faction = "Horde",
	},
	[50204200] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[51204560] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[56604760] = {
		name = L["Chatter"],
		category = "rares",
		faction = "Horde",
	},
	[75803080] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[76002940] = {
		name = L["Rohh the Silent"],
		category = "rares",
		faction = "Horde",
	},
	[49206860] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[50606820] = {
		name = L["Squiddic"],
		category = "rares",
		faction = "Horde",
	},
	[13406280] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[16206280] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[17806260] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[18206420] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[29008520] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[31008260] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[32208300] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[32408380] = {
		name = L["Ribchaser"],
		category = "rares",
		faction = "Horde",
	},
	[35006660] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[42603300] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[49203400] = {
		name = L["Snarlflare"],
		category = "rares",
		faction = "Horde",
	},
	[87606900] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Horde",
	},
	[88406720] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Horde",
	},
	[88606860] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Horde",
	},
	[88807000] = {
		name = L["Boulderheart"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1423] = {
	[81605920] = {
		name = L["Khaelyn Steelwing"],
		category = "flightmasters",
		fpName = L["Light's Hope Chapel, Eastern Plaguelands"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[80205700] = {
		name = L["Georgia"],
		category = "flightmasters",
		fpName = L["Light's Hope Chapel, Eastern Plaguelands"],
		description = L["Bat Handler"],
		faction = "Horde",
	},
	[80905860] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Neutral",
	},
	[39009260] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[47204420] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[80006460] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[79406380] = {
		name = L["Caretaker Alen"],
		npcID = 11038,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["The Argent Dawn"],
		faction = "Neutral",
	},
	[81606000] = {
		name = L["Quartermaster Miranda Breechlock"],
		npcID = 11536,
		category = "vendors",
		description = L["The Argent Dawn"],
		faction = "Neutral",
	},
	[14403360] = {
		name = L["Augustus the Touched"],
		npcID = 12384,
		category = "vendors",
		faction = "Neutral",
	},
	[80405760] = {
		name = L["Jase Farlane"],
		npcID = 12941,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Neutral",
	},
	[15007920] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[19606560] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[38207520] = {
		name = L["Hed'mush the Rotting"],
		category = "rares",
		faction = "Neutral",
	},
	[65402180] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[70001820] = {
		name = L["Zul'Brin Warpbranch"],
		category = "rares",
		faction = "Neutral",
	},
	[72201460] = {
		name = L["Zul'Brin Warpbranch"],
		category = "rares",
		faction = "Neutral",
	},
	[52001620] = {
		name = L["Ranger Lord Hawkspear"],
		category = "rares",
		faction = "Neutral",
	},
	[52801700] = {
		name = L["Ranger Lord Hawkspear"],
		category = "rares",
		faction = "Neutral",
	},
	[53201860] = {
		name = L["Ranger Lord Hawkspear"],
		category = "rares",
		faction = "Neutral",
	},
	[38402480] = {
		name = L["Lord Darkscythe"],
		category = "rares",
		faction = "Neutral",
	},
	[39205360] = {
		name = L["Deathspeaker Selendre"],
		category = "rares",
		description = L["Cult of the Damned"],
		faction = "Neutral",
	},
	[32408340] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[41406880] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[83003920] = {
		name = L["Deathspeaker Selendre"],
		category = "rares",
		description = L["Cult of the Damned"],
		faction = "Neutral",
	},
	[85404540] = {
		name = L["Deathspeaker Selendre"],
		category = "rares",
		description = L["Cult of the Damned"],
		faction = "Neutral",
	},
	[85404600] = {
		name = L["Deathspeaker Selendre"],
		category = "rares",
		description = L["Cult of the Damned"],
		faction = "Neutral",
	},
	[80608540] = {
		name = L["High General Abbendis"],
		category = "rares",
		faction = "Neutral",
	},
	[14807920] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[15607980] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[19406620] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[32808380] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[54202520] = {
		name = L["Hed'mush the Rotting"],
		category = "rares",
		faction = "Neutral",
	},
	[65802180] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[68002120] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[69002080] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[72001420] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[69201900] = {
		name = L["Zul'Brin Warpbranch"],
		category = "rares",
		faction = "Neutral",
	},
	[53001700] = {
		name = L["Ranger Lord Hawkspear"],
		category = "rares",
		faction = "Neutral",
	},
	[53001780] = {
		name = L["Ranger Lord Hawkspear"],
		category = "rares",
		faction = "Neutral",
	},
	[68605480] = {
		name = L["Gish the Unmoving"],
		category = "rares",
		faction = "Neutral",
	},
	[26003340] = {
		name = L["Lord Darkscythe"],
		category = "rares",
		faction = "Neutral",
	},
	[26603400] = {
		name = L["Lord Darkscythe"],
		category = "rares",
		faction = "Neutral",
	},
	[38002580] = {
		name = L["Lord Darkscythe"],
		category = "rares",
		faction = "Neutral",
	},
	[82003980] = {
		name = L["Deathspeaker Selendre"],
		category = "rares",
		description = L["Cult of the Damned"],
		faction = "Neutral",
	},
	[83003900] = {
		name = L["Deathspeaker Selendre"],
		category = "rares",
		description = L["Cult of the Damned"],
		faction = "Neutral",
	},
	[88408640] = {
		name = L["High General Abbendis"],
		category = "rares",
		faction = "Neutral",
	},
	[19406460] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[69201860] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[19806440] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[25608880] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[49406320] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[67802160] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[68802040] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[72401300] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[68202120] = {
		name = L["Zul'Brin Warpbranch"],
		category = "rares",
		faction = "Neutral",
	},
	[68801960] = {
		name = L["Zul'Brin Warpbranch"],
		category = "rares",
		faction = "Neutral",
	},
	[69801540] = {
		name = L["Zul'Brin Warpbranch"],
		category = "rares",
		faction = "Neutral",
	},
	[67005700] = {
		name = L["Gish the Unmoving"],
		category = "rares",
		faction = "Neutral",
	},
	[85604640] = {
		name = L["Deathspeaker Selendre"],
		category = "rares",
		description = L["Cult of the Damned"],
		faction = "Neutral",
	},
	[19206600] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[19606480] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[25608840] = {
		name = L["Duggan Wildhammer"],
		category = "rares",
		faction = "Neutral",
	},
	[68602120] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[69602080] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[70202040] = {
		name = L["Warlord Thresh'jin"],
		category = "rares",
		faction = "Neutral",
	},
	[71601740] = {
		name = L["Zul'Brin Warpbranch"],
		category = "rares",
		faction = "Neutral",
	},
	[72401340] = {
		name = L["Zul'Brin Warpbranch"],
		category = "rares",
		faction = "Neutral",
	},
	[52401720] = {
		name = L["Ranger Lord Hawkspear"],
		category = "rares",
		faction = "Alliance",
	},
	[52801960] = {
		name = L["Ranger Lord Hawkspear"],
		category = "rares",
		faction = "Alliance",
	},
	[53001760] = {
		name = L["Ranger Lord Hawkspear"],
		category = "rares",
		faction = "Alliance",
	},
	[72005660] = {
		name = L["Gish the Unmoving"],
		category = "rares",
		faction = "Neutral",
	},
	[43602820] = {
		name = L["Lord Darkscythe"],
		category = "rares",
		faction = "Neutral",
	},
	[40805060] = {
		name = L["Deathspeaker Selendre"],
		category = "rares",
		description = L["Cult of the Damned"],
		faction = "Neutral",
	},
	[84604120] = {
		name = L["Deathspeaker Selendre"],
		category = "rares",
		description = L["Cult of the Damned"],
		faction = "Neutral",
	},
}
nodes[1428] = {
	[84406820] = {
		name = L["Borgus Stoutarm"],
		category = "flightmasters",
		fpName = L["Morgan's Vigil, Burning Steppes"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[65602420] = {
		name = L["Vahgruk"],
		category = "flightmasters",
		fpName = L["Flame Crest, Burning Steppes"],
		description = L["Wind Rider Master"],
		faction = "Horde",
	},
	[85006840] = {
		name = L["Felder Stover"],
		npcID = 1296,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[66002200] = {
		name = L["Yuka Screwspigot"],
		npcID = 9544,
		category = "repair",
		faction = "Neutral",
	},
	[63202360] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[84206780] = {
		name = L["Gabrielle Chase"],
		npcID = 3298,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Alliance",
	},
	[65602400] = {
		name = L["Gruna"],
		npcID = 3708,
		category = "vendors",
		description = L["Food & Drink"],
		faction = "Horde",
	},
	[14605620] = {
		name = L["Hematos"],
		category = "rares",
		faction = "Neutral",
	},
	[55803580] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[56603620] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[61003680] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[71203560] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[40403320] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[79402980] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[84005480] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[85205880] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[86205740] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[86803040] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[80004740] = {
		name = L["Hahk'Zor"],
		category = "rares",
		faction = "Neutral",
	},
	[80604860] = {
		name = L["Hahk'Zor"],
		category = "rares",
		faction = "Neutral",
	},
	[80804500] = {
		name = L["Hahk'Zor"],
		category = "rares",
		faction = "Neutral",
	},
	[81404820] = {
		name = L["Hahk'Zor"],
		category = "rares",
		faction = "Neutral",
	},
	[80404640] = {
		name = L["Gorgon'och"],
		category = "rares",
		faction = "Neutral",
	},
	[75403280] = {
		name = L["Deathmaw"],
		category = "rares",
		faction = "Neutral",
	},
	[41804640] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Neutral",
	},
	[47004480] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Neutral",
	},
	[47604300] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Neutral",
	},
	[76002680] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[78806100] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[81205960] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[82806180] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[83403040] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[83803040] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[84002940] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[84403080] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[84403200] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[85803080] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[86602760] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[88603420] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[89005760] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[89403500] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[90003140] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[90203460] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[91804040] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Horde",
	},
	[18204500] = {
		name = L["Hematos"],
		category = "rares",
		faction = "Neutral",
	},
	[28605200] = {
		name = L["Hematos"],
		category = "rares",
		faction = "Neutral",
	},
	[30005260] = {
		name = L["Hematos"],
		category = "rares",
		faction = "Neutral",
	},
	[52804040] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[54004320] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[54204480] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[54404100] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[15403040] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[15403080] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[40003460] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[43005320] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[80203220] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[91404520] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[92404600] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[81804400] = {
		name = L["Hahk'Zor"],
		category = "rares",
		faction = "Neutral",
	},
	[77004320] = {
		name = L["Gorgon'och"],
		category = "rares",
		faction = "Neutral",
	},
	[51004280] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Neutral",
	},
	[69004900] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[70204880] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[70204980] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[70804900] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[71604500] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[71804580] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[72004360] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[72804680] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[73404480] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[79406180] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[80006020] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[80805820] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[81605960] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[81606240] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[82606340] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[89205320] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91204200] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[27206040] = {
		name = L["Hematos"],
		category = "rares",
		faction = "Horde",
	},
	[28006060] = {
		name = L["Hematos"],
		category = "rares",
		faction = "Horde",
	},
	[57004120] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[66804500] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[70603700] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[40203500] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[76603060] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[78604400] = {
		name = L["Hahk'Zor"],
		category = "rares",
		faction = "Neutral",
	},
	[81604400] = {
		name = L["Hahk'Zor"],
		category = "rares",
		faction = "Neutral",
	},
	[78204540] = {
		name = L["Gorgon'och"],
		category = "rares",
		faction = "Neutral",
	},
	[82002940] = {
		name = L["Deathmaw"],
		category = "rares",
		faction = "Neutral",
	},
	[47604320] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Neutral",
	},
	[51204160] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Neutral",
	},
	[70005120] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[72003360] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[72003740] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[72404920] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[73004760] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[73005860] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[73403460] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[73604100] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[79005940] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[81602980] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[81605920] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[83203080] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[83803200] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[85203060] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[85605960] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[85805340] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[88403160] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[89203220] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[89404660] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[90204140] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[54204260] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[61203660] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[71203580] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[86003060] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[86003160] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[86803000] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[87802820] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[88602820] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[51204140] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Neutral",
	},
	[69003160] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Neutral",
	},
	[72205880] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[83202960] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[84003460] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[87205120] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[87605140] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[89804500] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[90804600] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91404000] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[54004040] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[54403520] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[66404380] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[68204600] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[70403660] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[71803640] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Neutral",
	},
	[16003000] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[39803580] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[40403480] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[40603320] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[43405600] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Neutral",
	},
	[85605740] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[85805980] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[87403040] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[80404840] = {
		name = L["Hahk'Zor"],
		category = "rares",
		faction = "Neutral",
	},
	[77804340] = {
		name = L["Gorgon'och"],
		category = "rares",
		faction = "Neutral",
	},
	[78604440] = {
		name = L["Gorgon'och"],
		category = "rares",
		faction = "Neutral",
	},
	[75403200] = {
		name = L["Deathmaw"],
		category = "rares",
		faction = "Neutral",
	},
	[82603040] = {
		name = L["Deathmaw"],
		category = "rares",
		faction = "Neutral",
	},
	[86605120] = {
		name = L["Deathmaw"],
		category = "rares",
		faction = "Neutral",
	},
	[47404360] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Horde",
	},
	[48604360] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Horde",
	},
	[63403780] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Horde",
	},
	[63603760] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Horde",
	},
	[72004380] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[72005100] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[74205920] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[75803100] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[75805980] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[76403220] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[76403300] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[77403140] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[78403160] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[81003020] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[81803140] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[82605720] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[83403220] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[83805940] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[84605700] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[84805820] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[85605560] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[88405040] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[90205440] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[90604360] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91403080] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91403160] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91803520] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91803840] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[55403720] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Alliance",
	},
	[55603660] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Alliance",
	},
	[56803480] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Alliance",
	},
	[61803740] = {
		name = L["Thauris Balgarr"],
		category = "rares",
		faction = "Alliance",
	},
	[40003400] = {
		name = L["Gruklash"],
		category = "rares",
		faction = "Alliance",
	},
	[87403080] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[90203160] = {
		name = L["Malfunctioning Reaver"],
		category = "rares",
		faction = "Neutral",
	},
	[82804340] = {
		name = L["Hahk'Zor"],
		category = "rares",
		faction = "Neutral",
	},
	[77204300] = {
		name = L["Gorgon'och"],
		category = "rares",
		faction = "Neutral",
	},
	[78004360] = {
		name = L["Gorgon'och"],
		category = "rares",
		faction = "Neutral",
	},
	[79404280] = {
		name = L["Gorgon'och"],
		category = "rares",
		faction = "Neutral",
	},
	[80405580] = {
		name = L["Deathmaw"],
		category = "rares",
		faction = "Neutral",
	},
	[50004600] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Horde",
	},
	[50604320] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Horde",
	},
	[63603800] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Horde",
	},
	[68603180] = {
		name = L["Terrorspark"],
		category = "rares",
		faction = "Horde",
	},
	[68803600] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[69404660] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[72003780] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[72803960] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[74205140] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[75403080] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[75603260] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[76005860] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[77602880] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[77803080] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[78202820] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[78803020] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[78805980] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[79402880] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[80605920] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[84206900] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[85806200] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[86803060] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[87005180] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[87006100] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[89204980] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[90403300] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[90404380] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[90803440] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91004660] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91203200] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91203340] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91604600] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91604680] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91803940] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[91803960] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
	[92403000] = {
		name = L["Volchan"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1437] = {
	[9405960] = {
		name = L["Shellei Brondir"],
		category = "flightmasters",
		fpName = L["Menethil Harbor, Wetlands"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[10606080] = {
		name = L["Innkeeper Helbrek"],
		npcID = 1464,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[10805970] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[11405940] = {
		name = L["Brak Durnad"],
		npcID = 1441,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[11405960] = {
		name = L["Brahnmar"],
		npcID = 1450,
		category = "repair",
		description = L["Armorer"],
		faction = "Alliance",
	},
	[8205580] = {
		name = L["Jennabink Powerseam"],
		npcID = 1454,
		category = "repair",
		description = L["Tailoring Supplies & Specialty Goods"],
		faction = "Alliance",
	},
	[11205840] = {
		name = L["Naela Trance"],
		npcID = 1459,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Alliance",
	},
	[11405965] = {
		name = L["Murndan Derth"],
		npcID = 1461,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["Gunsmith"],
		faction = "Alliance",
	},
	[11005840] = {
		name = L["Edwina Monzor"],
		npcID = 1462,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Fletcher"],
		faction = "Alliance",
	},
	[25602580] = {
		name = L["Wenna Silkbeard"],
		npcID = 2679,
		category = "repair",
		description = L["Special Goods Dealer"],
		faction = "Alliance",
	},
	[11404340] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[49404140] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[10405960] = {
		name = L["Bethaine Flinthammer"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[8005580] = {
		name = L["Telurinon Moonshadow"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Alliance",
	},
	[8205860] = {
		name = L["Harold Riggs"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fishing Trainer"],
		faction = "Alliance",
	},
	[10806120] = {
		name = L["Fremal Doohickey"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Alliance",
	},
	[10605680] = {
		name = L["Neal Allen"],
		npcID = 1448,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["Engineering & General Goods Supplier"],
		faction = "Alliance",
	},
	[12005780] = {
		name = L["Gruham Rumdnul"],
		npcID = 1452,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[8005620] = {
		name = L["Dewin Shimmerdawn"],
		npcID = 1453,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Alliance",
	},
	[10406060] = {
		name = L["Kersok Prond"],
		npcID = 1456,
		category = "vendors",
		description = L["Tradesman"],
		faction = "Alliance",
	},
	[10406020] = {
		name = L["Samor Festivus"],
		npcID = 1457,
		category = "vendors",
		description = L["Shady Dealer"],
		faction = "Alliance",
	},
	[8605440] = {
		name = L["Unger Statforth"],
		npcID = 1460,
		category = "vendors",
		description = L["Horse Breeder"],
		faction = "Alliance",
	},
	[8205640] = {
		name = L["Falkan Armonis"],
		npcID = 1463,
		category = "vendors",
		subcategories = {
			reagent = true,
		},
		description = L["Reagent Vendor"],
		faction = "Alliance",
	},
	[26402580] = {
		name = L["Fradd Swiftgear"],
		npcID = 2682,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Alliance",
	},
	[8005820] = {
		name = L["Stuart Fleming"],
		npcID = 3178,
		category = "vendors",
		description = L["Fisherman"],
		faction = "Alliance",
	},
	[46601820] = {
		name = L["Dark Iron Entrepreneur"],
		npcID = 3180,
		category = "vendors",
		description = L["Speciality Goods"],
		faction = "Alliance",
	},
	[50203780] = {
		name = L["Kixxle"],
		npcID = 8305,
		category = "vendors",
		description = L["Potions & Herbs"],
		faction = "Neutral",
	},
	[44204320] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Neutral",
	},
	[44404420] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Neutral",
	},
	[48404740] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Neutral",
	},
	[48804580] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Neutral",
	},
	[48804840] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Neutral",
	},
	[49004520] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Neutral",
	},
	[50004820] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Neutral",
	},
	[52005300] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Neutral",
	},
	[52605280] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Neutral",
	},
	[53005360] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Neutral",
	},
	[45606400] = {
		name = L["Leech Widow"],
		category = "rares",
		faction = "Neutral",
	},
	[46006180] = {
		name = L["Leech Widow"],
		category = "rares",
		faction = "Neutral",
	},
	[46206520] = {
		name = L["Leech Widow"],
		category = "rares",
		faction = "Neutral",
	},
	[46606540] = {
		name = L["Leech Widow"],
		category = "rares",
		faction = "Neutral",
	},
	[46806580] = {
		name = L["Leech Widow"],
		category = "rares",
		faction = "Neutral",
	},
	[47006160] = {
		name = L["Leech Widow"],
		category = "rares",
		faction = "Neutral",
	},
	[69802920] = {
		name = L["Razormaw Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[70803080] = {
		name = L["Razormaw Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[48007420] = {
		name = L["Ma'ruk Wyrmscale"],
		category = "rares",
		description = L["Dragonmaw Warlord"],
		faction = "Horde",
	},
	[38404600] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[38604620] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[39204660] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[39804660] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[41204600] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[46204480] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[22403680] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Neutral",
	},
	[22602380] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Neutral",
	},
	[23803080] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Neutral",
	},
	[25203220] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Neutral",
	},
	[26603000] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Neutral",
	},
	[27003300] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Neutral",
	},
	[27003360] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Neutral",
	},
	[27803280] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Neutral",
	},
	[30003060] = {
		name = L["Gnawbone"],
		category = "rares",
		faction = "Neutral",
	},
	[32603380] = {
		name = L["Gnawbone"],
		category = "rares",
		faction = "Neutral",
	},
	[35802960] = {
		name = L["Gnawbone"],
		category = "rares",
		faction = "Neutral",
	},
	[38802960] = {
		name = L["Gnawbone"],
		category = "rares",
		faction = "Neutral",
	},
	[12007060] = {
		name = L["Sludginn"],
		category = "rares",
		faction = "Neutral",
	},
	[13806860] = {
		name = L["Sludginn"],
		category = "rares",
		faction = "Neutral",
	},
	[14806720] = {
		name = L["Sludginn"],
		category = "rares",
		faction = "Neutral",
	},
	[45606340] = {
		name = L["Leech Widow"],
		category = "rares",
		faction = "Horde",
	},
	[46006220] = {
		name = L["Leech Widow"],
		category = "rares",
		faction = "Horde",
	},
	[67603200] = {
		name = L["Razormaw Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[70003180] = {
		name = L["Razormaw Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[70803040] = {
		name = L["Razormaw Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[43204420] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[44404425] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[21802220] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Horde",
	},
	[22803140] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Horde",
	},
	[67403020] = {
		name = L["Razormaw Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[44404380] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[45404440] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[23403020] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Horde",
	},
	[44604360] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[47604900] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[46206500] = {
		name = L["Leech Widow"],
		category = "rares",
		faction = "Horde",
	},
	[39403720] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[40204640] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[40603740] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[41804260] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[41804520] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[42604020] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[50804960] = {
		name = L["Dragonmaw Battlemaster"],
		category = "rares",
		faction = "Horde",
	},
	[69802900] = {
		name = L["Razormaw Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[70603080] = {
		name = L["Razormaw Matriarch"],
		category = "rares",
		faction = "Neutral",
	},
	[37004400] = {
		name = L["Garneg Charskull"],
		category = "rares",
		faction = "Horde",
	},
	[22402160] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Horde",
	},
	[23803620] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Horde",
	},
	[25402800] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Horde",
	},
	[27603200] = {
		name = L["Mirelow"],
		category = "rares",
		faction = "Horde",
	},
	[37803460] = {
		name = L["Gnawbone"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1432] = {
	[33805080] = {
		name = L["Thorgrum Borrelson"],
		category = "flightmasters",
		fpName = L["Thelsamar, Loch Modan"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[35404840] = {
		name = L["Innkeeper Hearthstove"],
		npcID = 6734,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[34804770] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[34004660] = {
		name = L["Morhan Coppertongue"],
		npcID = 167,
		category = "repair",
		description = L["Metalsmith"],
		faction = "Alliance",
	},
	[42801000] = {
		name = L["Nillen Andemar"],
		npcID = 222,
		category = "repair",
		description = L["Macecrafter"],
		faction = "Alliance",
	},
	[82606400] = {
		name = L["Kat Sampson"],
		npcID = 954,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[64806600] = {
		name = L["Aldren Cordon"],
		npcID = 1214,
		category = "repair",
		description = L["Clothier"],
		faction = "Alliance",
	},
	[24001800] = {
		name = L["Gothor Brumn"],
		npcID = 1362,
		category = "repair",
		description = L["Armorer"],
		faction = "Alliance",
	},
	[35804360] = {
		name = L["Vrok Blunderblast"],
		npcID = 1469,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gunsmith"],
		faction = "Alliance",
	},
	[83006340] = {
		name = L["Irene Sureshot"],
		npcID = 1686,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gunsmith"],
		faction = "Alliance",
	},
	[83006300] = {
		name = L["Cliff Hadin"],
		npcID = 1687,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Alliance",
	},
	[32404680] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[34604800] = {
		name = L["Lina Hearthstove"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[37004920] = {
		name = L["Ghak Healtouch"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist"],
		faction = "Alliance",
	},
	[36404840] = {
		name = L["Kali Healtouch"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalist"],
		faction = "Alliance",
	},
	[37004780] = {
		name = L["Brock Stoneseeker"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Mining Trainer"],
		faction = "Alliance",
	},
	[40603960] = {
		name = L["Warg Deepwater"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Alliance",
	},
	[45801360] = {
		name = L["Deek Fizzlebizz"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Journeyman Engineer"],
		faction = "Alliance",
	},
	[82206280] = {
		name = L["Claude Erksine"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Alliance",
	},
	[82206240] = {
		name = L["Dargh Trueaim"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[37004720] = {
		name = L["Karm Ironquill"],
		npcID = 372,
		category = "vendors",
		profession = "mining",
		description = L["Mining Supplies"],
		faction = "Alliance",
	},
	[35604900] = {
		name = L["Drac Roughcut"],
		npcID = 1465,
		category = "vendors",
		description = L["Tradesman"],
		faction = "Alliance",
	},
	[36004600] = {
		name = L["Rann Flamespinner"],
		npcID = 1474,
		category = "vendors",
		profession = "tailoring",
		description = L["Tailoring Supplies"],
		faction = "Alliance",
	},
	[34804860] = {
		name = L["Yanni Stoutheart"],
		npcID = 1682,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[40403940] = {
		name = L["Khara Deepwater"],
		npcID = 1684,
		category = "vendors",
		profession = "fishing",
		description = L["Fishing Supplies"],
		faction = "Alliance",
	},
	[82406340] = {
		name = L["Xandar Goodbeard"],
		npcID = 1685,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[34404720] = {
		name = L["Greishan Ironstove"],
		npcID = 3291,
		category = "vendors",
		description = L["Traveling Merchant"],
		faction = "Alliance",
	},
	[35204960] = {
		name = L["Honni Goldenoat"],
		npcID = 3948,
		category = "vendors",
		description = L["Baker"],
		faction = "Alliance",
	},
	[62606180] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[67006320] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[67006880] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[67406480] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[67806880] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[68406600] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[68806860] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[69206600] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[69206680] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[69206780] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[70006520] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[70006640] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[70206740] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[72606900] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[68406840] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[68606320] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[68606820] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[69206605] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[69806620] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[70006540] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[70406280] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[70406720] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[70406780] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[70806580] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[71206780] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[72806180] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[72806360] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[34202680] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[34402640] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[34802720] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[35002760] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[35602200] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[35802780] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[36002440] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[36202680] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[36402600] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[36602560] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[56803020] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[57402940] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[57803100] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[58002920] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[58003380] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[58203160] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[58402800] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[58402980] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[58403340] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[58803260] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[58803800] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59003460] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59202220] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59202880] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59203000] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59203240] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59203860] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59603000] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59803180] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59803960] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[60003900] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[47007640] = {
		name = L["Siege Golem"],
		category = "rares",
		faction = "Horde",
	},
	[77805220] = {
		name = L["Shanda the Spinner"],
		category = "rares",
		faction = "Horde",
	},
	[78405300] = {
		name = L["Shanda the Spinner"],
		category = "rares",
		faction = "Horde",
	},
	[79205160] = {
		name = L["Shanda the Spinner"],
		category = "rares",
		faction = "Horde",
	},
	[79805200] = {
		name = L["Shanda the Spinner"],
		category = "rares",
		faction = "Horde",
	},
	[66202100] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[67202160] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[67402300] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[68202180] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[68402300] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[68602920] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69002300] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69002580] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69402140] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69602160] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69602520] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69802000] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69802420] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69802660] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69802760] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[70802020] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[71002100] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[71402240] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[72002420] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[72002500] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[72202320] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[72602560] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[72602760] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[72802440] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[73002140] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[73002160] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[73002700] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[73402540] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[61807800] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[62807820] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[63607740] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[74806780] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[75206660] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[76807380] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[78007320] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[69006600] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[35802740] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[58802820] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59003300] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59203800] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59403120] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[60003840] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[60203900] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[68402120] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[68602220] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69002480] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69402580] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69602560] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[72802620] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[77807460] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[78407440] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[70606860] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[70606420] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[58803740] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[59203420] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[69002780] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[62407740] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[34802640] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[58003260] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[58403380] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[58803080] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[78007460] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[69406700] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[68006860] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[35202480] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[35802440] = {
		name = L["Grizlak"],
		category = "rares",
		faction = "Horde",
	},
	[59203920] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[60204140] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[67002100] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[67202240] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69202340] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69202420] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69802680] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[72602580] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[76807460] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[69606580] = {
		name = L["Boss Galgosh"],
		category = "rares",
		description = L["Stonesplinter Chieftain"],
		faction = "Horde",
	},
	[70606520] = {
		name = L["Magosh"],
		category = "rares",
		description = L["Stonesplinter Tribal Shaman"],
		faction = "Horde",
	},
	[60403940] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[61604120] = {
		name = L["Large Loch Crocolisk"],
		category = "rares",
		faction = "Horde",
	},
	[65401980] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[69602080] = {
		name = L["Emogg the Crusher"],
		category = "rares",
		faction = "Horde",
	},
	[62007740] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[74206780] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[74806640] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[75606640] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[77407460] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
	[77807420] = {
		name = L["Lord Condar"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1421] = {
	[45604240] = {
		name = L["Karos Razok"],
		category = "flightmasters",
		fpName = L["The Sepulcher, Silverpine Forest"],
		description = L["Bat Handler"],
		faction = "Horde",
	},
	[43204120] = {
		name = L["Innkeeper Bates"],
		npcID = 6739,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[43404140] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[46607260] = {
		name = L["Pyrewood Armorer"],
		npcID = 3528,
		category = "repair",
		faction = "Alliance",
	},
	[46408640] = {
		name = L["Wallace the Blind"],
		npcID = 3534,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Horde",
	},
	[44603920] = {
		name = L["Alexandre Lefevre"],
		npcID = 3552,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Horde",
	},
	[43204125] = {
		name = L["Sebastian Meloche"],
		npcID = 3553,
		category = "vendors",
		description = L["Armorer"],
		faction = "Horde",
	},
	[44603925] = {
		name = L["Andrea Boynton"],
		npcID = 3554,
		category = "vendors",
		description = L["Clothier"],
		faction = "Horde",
	},
	[45003940] = {
		name = L["Nadia Vernon"],
		npcID = 9553,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Horde",
	},
	[44204140] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[43404120] = {
		name = L["Sarah Goode"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[43404040] = {
		name = L["Johan Focht"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Miner"],
		faction = "Horde",
	},
	[43204100] = {
		name = L["Guillaume Sorouy"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Journeyman Blacksmith"],
		faction = "Horde",
	},
	[44004000] = {
		name = L["Edwin Harly"],
		npcID = 2140,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Horde",
	},
	[43004180] = {
		name = L["Patrice Dwyer"],
		npcID = 3551,
		category = "vendors",
		subcategories = {
			poison = true,
		},
		description = L["Poison Supplies"],
		faction = "Horde",
	},
	[43204060] = {
		name = L["Andrew Hilbert"],
		npcID = 3556,
		category = "vendors",
		description = L["Trade Goods"],
		faction = "Horde",
	},
	[62206420] = {
		name = L["Dalaran Brewmaster"],
		npcID = 3577,
		category = "vendors",
		faction = "Alliance",
	},
	[62606280] = {
		name = L["Dalaran Miner"],
		npcID = 3578,
		category = "vendors",
		faction = "Alliance",
	},
	[33001780] = {
		name = L["Killian Sanatha"],
		npcID = 5748,
		category = "vendors",
		description = L["Fisherman"],
		faction = "Horde",
	},
	[43005080] = {
		name = L["Lilly"],
		npcID = 5757,
		category = "vendors",
		profession = "enchanting",
		description = L["Enchanting Supplies"],
		faction = "Horde",
	},
	[54008220] = {
		name = L["Leo Sarn"],
		npcID = 5758,
		category = "vendors",
		profession = "enchanting",
		description = L["Enchanting Supplies"],
		faction = "Horde",
	},
	[44003980] = {
		name = L["Gwyn Farrow"],
		npcID = 5886,
		category = "vendors",
		description = L["Mushroom Merchant"],
		faction = "Horde",
	},
	[60606440] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[62206400] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[63006220] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[63006540] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[63406320] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[63606540] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[63606560] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[64202400] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[64802200] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[64802460] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[65002140] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[65002300] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[65202040] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[65602300] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[66002700] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[66402540] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[66602640] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[67002400] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[67002480] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[68002480] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[68202560] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[65002500] = {
		name = L["Snarlmane"],
		category = "rares",
		faction = "Neutral",
	},
	[65402400] = {
		name = L["Snarlmane"],
		category = "rares",
		faction = "Neutral",
	},
	[65602380] = {
		name = L["Snarlmane"],
		category = "rares",
		faction = "Neutral",
	},
	[65802320] = {
		name = L["Snarlmane"],
		category = "rares",
		faction = "Neutral",
	},
	[66202500] = {
		name = L["Snarlmane"],
		category = "rares",
		faction = "Neutral",
	},
	[57207040] = {
		name = L["Ravenclaw Regent"],
		category = "rares",
		faction = "Neutral",
	},
	[57407100] = {
		name = L["Ravenclaw Regent"],
		category = "rares",
		faction = "Neutral",
	},
	[57606980] = {
		name = L["Ravenclaw Regent"],
		category = "rares",
		faction = "Neutral",
	},
	[57607120] = {
		name = L["Ravenclaw Regent"],
		category = "rares",
		faction = "Neutral",
	},
	[57807160] = {
		name = L["Ravenclaw Regent"],
		category = "rares",
		faction = "Neutral",
	},
	[46201720] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[46201800] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[46202660] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[46402620] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[46601760] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[46602480] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[46602680] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[46801900] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[46802560] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[47201700] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[47402440] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[48001920] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[49401900] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[50201820] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[50201880] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[50601800] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[51201940] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[59200840] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[59200860] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[59800800] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[59800920] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[51406260] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[51406380] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[51806280] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[52206380] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[53405220] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[54005260] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[54405240] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[55006060] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[55006240] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[55204960] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[55406260] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[55606120] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[56005980] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[56206240] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[56606400] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[34200940] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[34201580] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[34801100] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[35000800] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[35001000] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[35201460] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[35400900] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[35401220] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[35401300] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[35401560] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[35600800] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[35601560] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[36201440] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[36401340] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[36401460] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[36601440] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[36601460] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[36601740] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[37201560] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[38201300] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[62806520] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[67202560] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[57207020] = {
		name = L["Ravenclaw Regent"],
		category = "rares",
		faction = "Neutral",
	},
	[46401940] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[47001760] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[50401940] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[34401000] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[36201560] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[63006400] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[64602420] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[67602540] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[65802380] = {
		name = L["Snarlmane"],
		category = "rares",
		faction = "Alliance",
	},
	[66202700] = {
		name = L["Snarlmane"],
		category = "rares",
		faction = "Alliance",
	},
	[46402600] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[47002540] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[47801960] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[50401880] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[59800740] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[51606360] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[52006200] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[55206040] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[60406420] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[63006360] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[66802340] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[65802340] = {
		name = L["Snarlmane"],
		category = "rares",
		faction = "Alliance",
	},
	[46601860] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[46801680] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[50801860] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[60201000] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[51606440] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[52006240] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[35200800] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[64402420] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[64602320] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[67002560] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[66202480] = {
		name = L["Snarlmane"],
		category = "rares",
		faction = "Alliance",
	},
	[47002660] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[59600740] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[51006380] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[51606380] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[55806020] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[35601500] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[38001560] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[62006480] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[63006380] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[63206320] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[63406540] = {
		name = L["Dalaran Spellscribe"],
		category = "rares",
		faction = "Neutral",
	},
	[64402400] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[66202600] = {
		name = L["Rot Hide Bruiser"],
		category = "rares",
		faction = "Alliance",
	},
	[57207000] = {
		name = L["Ravenclaw Regent"],
		category = "rares",
		faction = "Alliance",
	},
	[46602560] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[47001880] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[47601640] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[59000860] = {
		name = L["Gorefang"],
		category = "rares",
		faction = "Alliance",
	},
	[51206360] = {
		name = L["Old Vicejaw"],
		category = "rares",
		faction = "Alliance",
	},
	[34001620] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[34601040] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[35401480] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
	[37001540] = {
		name = L["Krethis Shadowspinner"],
		category = "rares",
		faction = "Alliance",
	},
}
nodes[1436] = {
	[56405260] = {
		name = L["Thor"],
		category = "flightmasters",
		fpName = L["Sentinel Hill, Westfall"],
		description = L["Gryphon Master"],
		faction = "Alliance",
	},
	[52805360] = {
		name = L["Innkeeper Heather"],
		npcID = 8931,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[53105330] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[57605380] = {
		name = L["William MacGregor"],
		npcID = 1668,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Alliance",
	},
	[43406680] = {
		name = L["Defias Profiteer"],
		npcID = 1669,
		category = "repair",
		description = L["Free Wheeling Merchant"],
		faction = "Alliance",
	},
	[51404960] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[53005300] = {
		name = L["Kirk Maxwell"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[56003120] = {
		name = L["Farmer Saldean"],
		npcID = 233,
		category = "vendors",
		faction = "Alliance",
	},
	[56804720] = {
		name = L["Quartermaster Lewis"],
		npcID = 491,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["Quartermaster"],
		faction = "Alliance",
	},
	[57605400] = {
		name = L["Gina MacGregor"],
		npcID = 843,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Alliance",
	},
	[57405220] = {
		name = L["Antonio Perelli"],
		npcID = 844,
		category = "vendors",
		description = L["Traveling Salesman"],
		faction = "Alliance",
	},
	[57605360] = {
		name = L["Mike Miller"],
		npcID = 1670,
		category = "vendors",
		description = L["Bread Merchant"],
		faction = "Alliance",
	},
	[36209000] = {
		name = L["Kriggon Talsone"],
		npcID = 4305,
		category = "vendors",
		description = L["Fisherman"],
		faction = "Alliance",
	},
	[52205280] = {
		name = L["Christopher Hewen"],
		npcID = 8934,
		category = "vendors",
		description = L["General Trade Goods Vendor"],
		faction = "Alliance",
	},
	[43406040] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[44605900] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[45405820] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[45605860] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[45606020] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[46005640] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[48404460] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[63007440] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[64405520] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[35203440] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[35403260] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[36003240] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[36203060] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[36403300] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[36403380] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[36602940] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37002760] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37003020] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37003560] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37203100] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37203300] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37403180] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37603340] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37803220] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[38203460] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[38403360] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[38603340] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39603400] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40403320] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[26406680] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[27005140] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[27603900] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[27604240] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[27604340] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[28007060] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[28807080] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[29803160] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[30602720] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[30608060] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[30808160] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[32208260] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[32602520] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[33008360] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[33802280] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[33808480] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[34401980] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[35001980] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[35201920] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[36001920] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[36408660] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[36801760] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[37208780] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[39601320] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[40801260] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[43601260] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[44800940] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[46201020] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[47201100] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[47401020] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[49201080] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[49201160] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[50601040] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[51401080] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[51800880] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[53001160] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[53400940] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[53401020] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[53401080] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[54000960] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[54201120] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[54801020] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[55001060] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[55201240] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[55201340] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[55800940] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[25806460] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[26405100] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[26406560] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[26604780] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[26804060] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[26805000] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[26806960] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[27004160] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[27006600] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[27204720] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[27405180] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[27604200] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[27604620] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[28203740] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[28207420] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[28403880] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[28407180] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[28407460] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[28603740] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[29007320] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[29207780] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[29407660] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[30007980] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[30408060] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[30808080] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[31203120] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[31408200] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[31408300] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[31608240] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[32408300] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[33208220] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[33208440] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[33408280] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[34008340] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[34008480] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[34408420] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[34608460] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[36801800] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[36801980] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[37001920] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[39201360] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[42000960] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[42001120] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[45000980] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[45601020] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[45601060] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[47001040] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[48400980] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[48601120] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[49201020] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[49601480] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[51801080] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[52401040] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[52600900] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[52600980] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[54401080] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[54401200] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[55200960] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[55801100] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[41602800] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Neutral",
	},
	[42202900] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Neutral",
	},
	[42602900] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Neutral",
	},
	[43603000] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Neutral",
	},
	[45602820] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Neutral",
	},
	[61806840] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Neutral",
	},
	[61807280] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Neutral",
	},
	[62606740] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Neutral",
	},
	[64806460] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Neutral",
	},
	[37005160] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[37605100] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[38005180] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[38605100] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[42003420] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[43603580] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[44403700] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[44603820] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[45003580] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[45403480] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[49006420] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[49602320] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[49606440] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50002400] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50206500] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50602480] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50802200] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50802380] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50806720] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50806760] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[51206880] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[51402260] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[62206140] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[45001860] = {
		name = L["Master Digger"],
		category = "rares",
		faction = "Horde",
	},
	[45201840] = {
		name = L["Master Digger"],
		category = "rares",
		faction = "Horde",
	},
	[45801800] = {
		name = L["Master Digger"],
		category = "rares",
		faction = "Horde",
	},
	[46201860] = {
		name = L["Master Digger"],
		category = "rares",
		faction = "Horde",
	},
	[46601940] = {
		name = L["Master Digger"],
		category = "rares",
		faction = "Horde",
	},
	[46601960] = {
		name = L["Master Digger"],
		category = "rares",
		faction = "Horde",
	},
	[35207000] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[64805620] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[34403240] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[34803100] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[35002940] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[36203180] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[36803440] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37603140] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37803200] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[38003780] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[38803380] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[26405240] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[26804680] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[27404100] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[27404600] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[27605140] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[28204120] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[33008260] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[33202340] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[34002160] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[34208420] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[34802300] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[45601065] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[51801085] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[53601240] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[55601080] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[55601460] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[26404880] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[27604020] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[51401085] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[41202760] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[42002920] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[42402980] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[42403080] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[43002840] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[63806720] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[38005080] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[39004940] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[39605200] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[45003160] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[48802400] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[49402480] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50402380] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[51002760] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[52006860] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[62206180] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[63405880] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[47404080] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[47404180] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[51402560] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[36403040] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[26804760] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[26806000] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[30203040] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[31408280] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[32602300] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[41801260] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[44400940] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[52801080] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[26804780] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[27804340] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[32208380] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[39601360] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[39801660] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[47801060] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[43203040] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[45002780] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[61207660] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[61407320] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[62006720] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[37604940] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[37605000] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[38004600] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[39004640] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[39204700] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[40204660] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[42603460] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50202360] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[52206760] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[62606040] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50404780] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[27404640] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[29003460] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[30202900] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[35002080] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[35201940] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[41001240] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[53001100] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[26005880] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[39801240] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[47401025] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[41402820] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[41802560] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[42402960] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[38205040] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[51402400] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[51806780] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[51002420] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[35603400] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37603620] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[37803040] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39402900] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39803120] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[26804840] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[31002640] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[32802280] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[34208180] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[34808260] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[27404560] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[27404960] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[27406880] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[28403780] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[29407840] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[35208320] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[52001020] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[59407700] = {
		name = L["Leprithus"],
		category = "rares",
		faction = "Horde",
	},
	[43803480] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[44203680] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[45003420] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50002200] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[52006980] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[63206020] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[63605940] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50002500] = {
		name = L["Vultros"],
		category = "rares",
		faction = "Horde",
	},
	[36203300] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[36803160] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[39402940] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[40603060] = {
		name = L["Sergeant Brashclaw"],
		category = "rares",
		faction = "Horde",
	},
	[29407780] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[40601200] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[41601240] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[46401100] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[47801080] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[50401200] = {
		name = L["Slark"],
		category = "rares",
		faction = "Horde",
	},
	[26804920] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[29007280] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[30608120] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[33208340] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[34008400] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[39601280] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[50201100] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[50201180] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[52000880] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[53001040] = {
		name = L["Brack"],
		category = "rares",
		faction = "Horde",
	},
	[42403700] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[45203520] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[45203600] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[49802480] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[50402400] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
	[62406140] = {
		name = L["Foe Reaper 4000"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1412] = {
	[46606100] = {
		name = L["Innkeeper Kauth"],
		npcID = 6747,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[47006030] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[44007740] = {
		name = L["Marjak Keenblade"],
		npcID = 3073,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Horde",
	},
	[44207720] = {
		name = L["Varia Hardhide"],
		npcID = 3074,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Horde",
	},
	[44207740] = {
		name = L["Bronk Steelrage"],
		npcID = 3075,
		category = "repair",
		description = L["Armorer and Shieldcrafter"],
		faction = "Horde",
	},
	[45605860] = {
		name = L["Mahnott Roughwound"],
		npcID = 3077,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Horde",
	},
	[45605840] = {
		name = L["Kennah Hawkseye"],
		npcID = 3078,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gunsmith"],
		faction = "Horde",
	},
	[45805860] = {
		name = L["Varg Windwhisper"],
		npcID = 3079,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Horde",
	},
	[45805865] = {
		name = L["Harant Ironbrace"],
		npcID = 3080,
		category = "vendors",
		description = L["Armorer and Shieldcrafter"],
		faction = "Horde",
	},
	[42607800] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[46405540] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[46806020] = {
		name = L["Seikwa"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[44007600] = {
		name = L["Harutt Thunderhorn"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[45007600] = {
		name = L["Gart Mistrunner"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Horde",
	},
	[44207580] = {
		name = L["Lanka Farshot"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[45007605] = {
		name = L["Meela Dawnstrider"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[49406040] = {
		name = L["Krang Stonehoof"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[48405960] = {
		name = L["Gennia Runetotem"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Druid Trainer"],
		classes = {
			DRUID = true,
		},
		faction = "Horde",
	},
	[47805560] = {
		name = L["Yaw Sharpmane"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[48405920] = {
		name = L["Narm Skychaser"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[45405800] = {
		name = L["Pyall Silentstride"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cook"],
		faction = "Horde",
	},
	[45405780] = {
		name = L["Chaw Stronghide"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Journeyman Leatherworker"],
		faction = "Horde",
	},
	[47605560] = {
		name = L["Reban Freerunner"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Horde",
	},
	[47605840] = {
		name = L["Kar Stormsinger"],
		npcID = 3690,
		category = "mountTrainer",
		description = L["Kodo Riding Instructor"],
		faction = "Horde",
	},
	[44406060] = {
		name = L["Uthan Stillwater"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Horde",
	},
	[46806080] = {
		name = L["Vira Younghoof"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Horde",
	},
	[45405785] = {
		name = L["Yonn Deepcut"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinner"],
		faction = "Horde",
	},
	[61803140] = {
		name = L["Twizwick Sprocketgrind"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Journeyman Engineer"],
		faction = "Neutral",
	},
	[45207640] = {
		name = L["Kawnie Softbreeze"],
		npcID = 3072,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Horde",
	},
	[45805760] = {
		name = L["Moorat Longstride"],
		npcID = 3076,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Horde",
	},
	[46205820] = {
		name = L["Wunna Darkmane"],
		npcID = 3081,
		category = "vendors",
		description = L["Trade Goods"],
		faction = "Horde",
	},
	[47405840] = {
		name = L["Harb Clawhoof"],
		npcID = 3685,
		category = "vendors",
		description = L["Kodo Mounts"],
		faction = "Horde",
	},
	[44607780] = {
		name = L["Moodan Sungrain"],
		npcID = 3883,
		category = "vendors",
		description = L["Baker"],
		faction = "Horde",
	},
	[47606140] = {
		name = L["Jhawna Oatwind"],
		npcID = 3884,
		category = "vendors",
		description = L["Baker"],
		faction = "Horde",
	},
	[47405500] = {
		name = L["Harn Longcast"],
		npcID = 5940,
		category = "vendors",
		profession = "fishing",
		description = L["Fishing Supplies"],
		faction = "Horde",
	},
	[30202660] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[30402460] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[30402640] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[30602700] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[30802640] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[31001980] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[31002280] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[31602040] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[31802160] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[31802600] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[32202800] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[32401940] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[32402860] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[32802800] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[33001900] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[33002580] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[33402860] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[33602720] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[33602840] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[34202600] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[34602720] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[36004120] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[36204200] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[37201720] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[37204160] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[38401420] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[38404180] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[38601340] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[39001240] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[39204140] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[39401100] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[39601380] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[39604100] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[39604200] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[40204260] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[41404160] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[41804080] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[42404240] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[43404060] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[44404160] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[44604140] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[48801420] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[48801540] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[49401560] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[49401700] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[49401800] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[50001620] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[50001720] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[50201760] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[50401280] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[50401360] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[50401860] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[50601800] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[51001380] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[51201320] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[51801420] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[51801620] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[52001340] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[52201460] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[52601620] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[53201460] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[53601380] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[33004200] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[33604100] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[33604160] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[34003980] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[34204380] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[34403920] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[34604200] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[35404120] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[35604180] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[35604460] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[36204100] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[36604140] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[36804180] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[36804300] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[37604280] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[38204380] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[38204460] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[39204280] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[39404420] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[39804320] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[40004400] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[40804340] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[40804380] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[41004220] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[42004340] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[43204300] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[43204380] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[43804280] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[44404220] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[44604240] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[45004320] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[46004220] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[46404300] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[46604220] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[47004280] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[47804460] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[48404340] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[48404400] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[49404320] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[50604220] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[51204280] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[51604260] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[51804200] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[52204500] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[54004360] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[54804100] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[55604100] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[56004260] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[56404180] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[56604300] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[29602280] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[30402060] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[30402180] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[30602160] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[31001985] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[31002060] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[36001000] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[36201140] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[36601140] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[36601200] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[54401180] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[55001040] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[55001140] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[55001180] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[55601160] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[47007000] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[47407120] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[47407180] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[47806860] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[47807340] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[48007040] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[48007140] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[48207160] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[48607000] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[48607260] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[48807140] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[48807240] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[49607040] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[52207040] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[52207080] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[52407200] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[52407320] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53007400] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53207140] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53207220] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53207260] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53607140] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53607300] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53607400] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53806980] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53807220] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[54607100] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[54607360] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[55207220] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[39201600] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[39601680] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[40201480] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[40401560] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[40601540] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[40601560] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[40801700] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[41001760] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[48201680] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[48201900] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[48401560] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[48401800] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[48801820] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[49001980] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[49401500] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[49401640] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[49401920] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[49601900] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[49602020] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[49801540] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[49802160] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[50202120] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[50402260] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[50801440] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[50801480] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[50802280] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51401640] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51401740] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51401760] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51601600] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51601840] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51801700] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52002080] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52201380] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52201900] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52201980] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52202160] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52401300] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52601520] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52602140] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52801340] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52801380] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52802160] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[53002000] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[53201600] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[53201700] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54201720] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54201900] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54201980] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54202100] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54401800] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54601960] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54602060] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54801860] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[31002480] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[31602740] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[32201920] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[34002920] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[37604080] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[38204240] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[38401260] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[41004280] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[46204180] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[46804100] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[48601440] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[49401780] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[50401880] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[35204300] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[38804460] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[43204460] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[55201060] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[48606920] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[48607140] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[39401540] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[41001680] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[49602120] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[50402280] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[50601420] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51201680] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51402360] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[33402540] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[35804000] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[36001700] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[37401700] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[38601360] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[41204200] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[43804240] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[44004320] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[50601900] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[51601845] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[52401480] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[42004280] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[49004360] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[52404380] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[52804380] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[54004500] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[55804200] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[56004400] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[53007040] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[54607260] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[40401520] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[41001620] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[48201820] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[50202260] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51001480] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51401900] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52201465] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52601380] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[53002020] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54201760] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[33002800] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[34202660] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[37004120] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[37204220] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[38001440] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[38204200] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[39004220] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[39401140] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[51801820] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[42804380] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[48204400] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[48804380] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[53804380] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[55804440] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[40401580] = {
		name = L["Enforcer Emilgund"],
		category = "rares",
		faction = "Alliance",
	},
	[48801860] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[49402020] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52001740] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52002100] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[33201840] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[34002800] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[36004140] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[37401780] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[42204120] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[38004300] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[39604460] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[55004360] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[55604460] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[30402100] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[30602040] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[30802140] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[54801340] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[56001500] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[48207260] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[53807240] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[49801960] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52401500] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[53202080] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[53202160] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54402180] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[31202780] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[36204060] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[38201420] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[39204020] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[40604280] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[52001820] = {
		name = L["Ghost Howl"],
		category = "rares",
		faction = "Alliance",
	},
	[35603940] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[37404280] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[41404220] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[51204160] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[53004420] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[54204340] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[56204120] = {
		name = L["Mazzranache"],
		category = "rares",
		faction = "Alliance",
	},
	[30402080] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[37201220] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[55001160] = {
		name = L["Sister Hatelash"],
		category = "rares",
		faction = "Alliance",
	},
	[47207080] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[48607020] = {
		name = L["Snagglespear"],
		category = "rares",
		faction = "Alliance",
	},
	[48401700] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[48601780] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[49202160] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[51201660] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[52601460] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
	[54201860] = {
		name = L["The Rake"],
		category = "rares",
		faction = "Alliance",
	},
}
nodes[1411] = {
	[51604160] = {
		name = L["Innkeeper Grosk"],
		npcID = 6928,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[51904210] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[40406800] = {
		name = L["Kzan Thornslash"],
		npcID = 3159,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Horde",
	},
	[40606780] = {
		name = L["Huklah"],
		npcID = 3160,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Horde",
	},
	[40406780] = {
		name = L["Rarc"],
		npcID = 3161,
		category = "repair",
		description = L["Armorer & Shieldcrafter"],
		faction = "Horde",
	},
	[52004040] = {
		name = L["Uhgar"],
		npcID = 3163,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Horde",
	},
	[53004100] = {
		name = L["Ghrawt"],
		npcID = 3165,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Horde",
	},
	[53004080] = {
		name = L["Cutac"],
		npcID = 3166,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Horde",
	},
	[52004120] = {
		name = L["Wuark"],
		npcID = 3167,
		category = "repair",
		description = L["Armorer & Shieldcrafter"],
		faction = "Horde",
	},
	[56407320] = {
		name = L["Trayexir"],
		npcID = 10369,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Weapon Merchant"],
		faction = "Horde",
	},
	[44006920] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[47001740] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[53404440] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[57407320] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[52004180] = {
		name = L["Shoja'my"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[42806940] = {
		name = L["Frang"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[42806920] = {
		name = L["Jen'shan"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[41206800] = {
		name = L["Rwag"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Horde",
	},
	[40606840] = {
		name = L["Nartok"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[42406900] = {
		name = L["Shikrik"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[54204240] = {
		name = L["Tarshaw Jaggedscar"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[52004360] = {
		name = L["Kaplak"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Horde",
	},
	[51804340] = {
		name = L["Thotar"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Horde",
	},
	[54204120] = {
		name = L["Dhugru Gorelust"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[54404260] = {
		name = L["Swart"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Shaman Trainer"],
		classes = {
			SHAMAN = true,
		},
		faction = "Horde",
	},
	[52004060] = {
		name = L["Dwukk"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Journeyman Blacksmith"],
		faction = "Horde",
	},
	[51804080] = {
		name = L["Krunn"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Miner"],
		faction = "Horde",
	},
	[55407400] = {
		name = L["Miao'zan"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist"],
		faction = "Horde",
	},
	[55407500] = {
		name = L["Mishiki"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalist"],
		faction = "Horde",
	},
	[52004340] = {
		name = L["Harruk"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Horde",
	},
	[54204280] = {
		name = L["Tai'jin"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[42406880] = {
		name = L["Ken'jai"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[56207500] = {
		name = L["Un'Thuwa"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[42406905] = {
		name = L["Mai'ah"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[53208140] = {
		name = L["Lau'Tiki"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Horde",
	},
	[54004200] = {
		name = L["Rawrk"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Horde",
	},
	[55207540] = {
		name = L["Xar'Ti"],
		npcID = 7953,
		category = "mountTrainer",
		description = L["Raptor Riding Trainer"],
		faction = "Horde",
	},
	[52204080] = {
		name = L["Mukdrak"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Journeyman Engineer"],
		faction = "Horde",
	},
	[42606740] = {
		name = L["Duokna"],
		npcID = 3158,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Horde",
	},
	[54204220] = {
		name = L["Jark"],
		npcID = 3164,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Horde",
	},
	[52804200] = {
		name = L["Flakk"],
		npcID = 3168,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Horde",
	},
	[56207340] = {
		name = L["K'waii"],
		npcID = 3186,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Goods"],
		faction = "Horde",
	},
	[56407380] = {
		name = L["Tai'tasi"],
		npcID = 3187,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Horde",
	},
	[51204260] = {
		name = L["Grimtak"],
		npcID = 3881,
		category = "vendors",
		description = L["Butcher"],
		faction = "Horde",
	},
	[42606720] = {
		name = L["Zlagk"],
		npcID = 3882,
		category = "vendors",
		description = L["Butcher"],
		faction = "Horde",
	},
	[55607360] = {
		name = L["Hai'zan"],
		npcID = 3933,
		category = "vendors",
		description = L["Butcher"],
		faction = "Horde",
	},
	[56007340] = {
		name = L["Zansoa"],
		npcID = 5942,
		category = "vendors",
		profession = "fishing",
		description = L["Fishing Supplies"],
		faction = "Horde",
	},
	[54604140] = {
		name = L["Kitha"],
		npcID = 6027,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[55207560] = {
		name = L["Zjolnir"],
		npcID = 7952,
		category = "vendors",
		description = L["Raptor Handler"],
		faction = "Horde",
	},
	[40606845] = {
		name = L["Hraug"],
		npcID = 12776,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[46001360] = {
		name = L["Javnir Nashak"],
		npcID = 15012,
		category = "vendors",
		faction = "Horde",
	},
	[46207940] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[46407960] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[46408060] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[46607940] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[46607980] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[47008060] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[47607740] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[47607780] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[48208040] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[48807900] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[49407980] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[49608060] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[50207980] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[50407920] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[50607940] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[51807980] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[59405780] = {
		name = L["Watch Commander Zalaphil"],
		category = "rares",
		faction = "Alliance",
	},
	[59405880] = {
		name = L["Watch Commander Zalaphil"],
		category = "rares",
		faction = "Alliance",
	},
	[51400900] = {
		name = L["Felweaver Scornn"],
		category = "rares",
		faction = "Alliance",
	},
	[51401000] = {
		name = L["Felweaver Scornn"],
		category = "rares",
		faction = "Alliance",
	},
	[51600940] = {
		name = L["Felweaver Scornn"],
		category = "rares",
		faction = "Alliance",
	},
	[51600960] = {
		name = L["Felweaver Scornn"],
		category = "rares",
		faction = "Alliance",
	},
	[51800800] = {
		name = L["Felweaver Scornn"],
		category = "rares",
		faction = "Alliance",
	},
	[52600880] = {
		name = L["Felweaver Scornn"],
		category = "rares",
		faction = "Alliance",
	},
	[53000740] = {
		name = L["Felweaver Scornn"],
		category = "rares",
		faction = "Alliance",
	},
	[53400780] = {
		name = L["Felweaver Scornn"],
		category = "rares",
		faction = "Alliance",
	},
	[53800880] = {
		name = L["Felweaver Scornn"],
		category = "rares",
		faction = "Alliance",
	},
	[35004920] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[35205220] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[36204920] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[36204960] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[36205440] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[36205600] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[36405340] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[36405540] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[37004980] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[37005440] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[37205060] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[37205320] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[37605020] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[38204680] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[38804900] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[39205100] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[38205460] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38405240] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38405320] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38405360] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38605320] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38605480] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38805360] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38805580] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[39005240] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42004140] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42403940] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42403960] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42603620] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42803700] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42803900] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42804060] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[43003840] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[43003960] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[43604000] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[43804120] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[44004920] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[44404180] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[44404980] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[44604920] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[44604980] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[44804840] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[45604920] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42004060] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[42803760] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43004900] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43204020] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43403920] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43404140] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43404980] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43605080] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43803920] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43804020] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43804080] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43805000] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[44004200] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[44004740] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[44404920] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[44604740] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[45604720] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[45804640] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[46204820] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[46404920] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[46804780] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[47204660] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[47204960] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[47404900] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[47604800] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[47804920] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[48404480] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[49004520] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[56805820] = {
		name = L["Watch Commander Zalaphil"],
		category = "rares",
		faction = "Alliance",
	},
	[57805800] = {
		name = L["Watch Commander Zalaphil"],
		category = "rares",
		faction = "Alliance",
	},
	[59605820] = {
		name = L["Watch Commander Zalaphil"],
		category = "rares",
		faction = "Alliance",
	},
	[59805880] = {
		name = L["Watch Commander Zalaphil"],
		category = "rares",
		faction = "Alliance",
	},
	[35204820] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[39205020] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[42804200] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[44004880] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42204980] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[42405060] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[46407940] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[48007880] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[36204700] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[37204820] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[38005060] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[37405340] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38805280] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[39605320] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42004180] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[44004900] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[44405000] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[45804720] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[47604940] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[48207820] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[59605840] = {
		name = L["Watch Commander Zalaphil"],
		category = "rares",
		faction = "Alliance",
	},
	[53600840] = {
		name = L["Felweaver Scornn"],
		category = "rares",
		faction = "Alliance",
	},
	[35205160] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[35405080] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[38004760] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[36605340] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38005360] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[43404080] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43805060] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[47605020] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[36205300] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[37405380] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38005620] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[38805340] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42003920] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[43603720] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[42805060] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[43804940] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[47604980] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[46607920] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[47407740] = {
		name = L["Warlord Kolkanis"],
		category = "rares",
		faction = "Alliance",
	},
	[59405900] = {
		name = L["Watch Commander Zalaphil"],
		category = "rares",
		faction = "Alliance",
	},
	[35205240] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[35605120] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[36404980] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[37005040] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[38204980] = {
		name = L["Death Flayer"],
		category = "rares",
		faction = "Alliance",
	},
	[42603900] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[44805060] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[46204980] = {
		name = L["Captain Flat Tusk"],
		category = "rares",
		description = L["Captain of the Battleguard"],
		faction = "Alliance",
	},
	[43003845] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
	[47004900] = {
		name = L["Geolord Mottle"],
		category = "rares",
		faction = "Alliance",
	},
}
nodes[1426] = {
	[47405240] = {
		name = L["Innkeeper Belm"],
		npcID = 1247,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[47005250] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[28806640] = {
		name = L["Durnan Furcutter"],
		npcID = 836,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Alliance",
	},
	[28606780] = {
		name = L["Rybrad Coldbank"],
		npcID = 945,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[28806780] = {
		name = L["Grundel Harkin"],
		npcID = 1104,
		category = "repair",
		description = L["Armorer"],
		faction = "Alliance",
	},
	[45205180] = {
		name = L["Gamili Frosthide"],
		npcID = 1238,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Alliance",
	},
	[45205185] = {
		name = L["Boran Ironclink"],
		npcID = 1240,
		category = "vendors",
		description = L["Armorer"],
		faction = "Alliance",
	},
	[40606500] = {
		name = L["Hegnar Rumbleshot"],
		npcID = 1243,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Gunsmith"],
		faction = "Alliance",
	},
	[45205200] = {
		name = L["Grawn Thromwyn"],
		npcID = 1273,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[45205160] = {
		name = L["Thrawn Boltar"],
		npcID = 1690,
		category = "repair",
		profession = "blacksmithing",
		description = L["Blacksmithing Supplies"],
		faction = "Alliance",
	},
	[68805580] = {
		name = L["Frast Dokner"],
		npcID = 1698,
		category = "repair",
		description = L["Apprentice Weaponsmith"],
		faction = "Alliance",
	},
	[30204520] = {
		name = L["Burdrak Harglhelm"],
		npcID = 3162,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[63004980] = {
		name = L["Turuk Amberstill"],
		npcID = 3177,
		category = "repair",
		description = L["Dwarven Weaponsmith"],
		faction = "Alliance",
	},
	[29406980] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[47005500] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[54203900] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[47005260] = {
		name = L["Shelby Stoneflint"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[28606620] = {
		name = L["Alamar Grimm"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[28606640] = {
		name = L["Branstock Khalder"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[29006740] = {
		name = L["Thorgas Grimson"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[28806720] = {
		name = L["Thran Khorman"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[28406740] = {
		name = L["Solm Hargrin"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[28806820] = {
		name = L["Bromos Grummner"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[28606645] = {
		name = L["Marryk Nurribit"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[47205220] = {
		name = L["Maxan Anvol"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[47405200] = {
		name = L["Magis Sparkmantle"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[47205260] = {
		name = L["Granis Swiftaxe"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[45805300] = {
		name = L["Grif Wildheart"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Hunter Trainer"],
		classes = {
			HUNTER = true,
		},
		faction = "Alliance",
	},
	[47605200] = {
		name = L["Azar Stronghammer"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[47605260] = {
		name = L["Hogral Bakkan"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[45205205] = {
		name = L["Tognus Flintfire"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Journeyman Blacksmith"],
		faction = "Alliance",
	},
	[68405440] = {
		name = L["Cook Ghilm"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cooking Trainer"],
		faction = "Alliance",
	},
	[47605240] = {
		name = L["Gremlock Pilsnor"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cooking Trainer"],
		faction = "Alliance",
	},
	[35404020] = {
		name = L["Paxton Ganter"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Alliance",
	},
	[69205540] = {
		name = L["Dank Drizzlecut"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Mining Trainer"],
		faction = "Alliance",
	},
	[50205040] = {
		name = L["Bronk Guzzlegear"],
		category = "primaryProfession",
		profession = "Engineering",
		description = L["Journeyman Engineer"],
		faction = "Alliance",
	},
	[47205265] = {
		name = L["Thamner Pol"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["Physician"],
		faction = "Alliance",
	},
	[46605380] = {
		name = L["Peria Lamenur"],
		category = "trainers",
		description = L["Pet Trainer"],
		faction = "Alliance",
	},
	[63805020] = {
		name = L["Ultham Ironhorn"],
		npcID = 4772,
		category = "mountTrainer",
		description = L["Ram Riding Instructor"],
		faction = "Alliance",
	},
	[50005020] = {
		name = L["Yarr Hammerstone"],
		category = "primaryProfession",
		profession = "Mining",
		description = L["Mining Trainer"],
		faction = "Alliance",
	},
	[47205360] = {
		name = L["Gimrizz Shadowcog"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[49204800] = {
		name = L["Binjy Featherwhistle"],
		npcID = 7954,
		category = "mountTrainer",
		description = L["Mechanostrider Pilot"],
		faction = "Alliance",
	},
	[30007140] = {
		name = L["Adlin Pridedrift"],
		npcID = 829,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[68605460] = {
		name = L["Kazan Mogosh"],
		npcID = 1237,
		category = "vendors",
		description = L["Food & Drink Merchant"],
		faction = "Alliance",
	},
	[63405060] = {
		name = L["Veron Amberstill"],
		npcID = 1261,
		category = "vendors",
		description = L["Ram Breeder"],
		faction = "Alliance",
	},
	[63205080] = {
		name = L["Yarlyn Amberstill"],
		npcID = 1263,
		category = "vendors",
		faction = "Alliance",
	},
	[47205240] = {
		name = L["Kreg Bilmn"],
		npcID = 1691,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[46605360] = {
		name = L["Golorn Frostbeard"],
		npcID = 1692,
		category = "vendors",
		description = L["Tradesman"],
		faction = "Alliance",
	},
	[50004940] = {
		name = L["Loslor Rudge"],
		npcID = 1694,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Alliance",
	},
	[30404600] = {
		name = L["Keeg Gibn"],
		npcID = 1697,
		category = "vendors",
		description = L["Ale and Wine"],
		faction = "Alliance",
	},
	[47205365] = {
		name = L["Dannie Fizzwizzle"],
		npcID = 6328,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[28806620] = {
		name = L["Wren Darkspring"],
		npcID = 6376,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[49004800] = {
		name = L["Milli Featherwhistle"],
		npcID = 7955,
		category = "vendors",
		description = L["Mechanostrider Merchant"],
		faction = "Alliance",
	},
	[31404460] = {
		name = L["Gretta Ganter"],
		npcID = 8508,
		category = "vendors",
		profession = "fishing",
		description = L["Fisherman Supplies"],
		faction = "Alliance",
	},
	[52603600] = {
		name = L["Wagner Hammerstrike"],
		npcID = 15011,
		category = "vendors",
		faction = "Alliance",
	},
	[71405140] = {
		name = L["Hammerspine"],
		category = "rares",
		faction = "Horde",
	},
	[71405180] = {
		name = L["Hammerspine"],
		category = "rares",
		faction = "Horde",
	},
	[71605220] = {
		name = L["Hammerspine"],
		category = "rares",
		faction = "Horde",
	},
	[72205280] = {
		name = L["Hammerspine"],
		category = "rares",
		faction = "Horde",
	},
	[72605280] = {
		name = L["Hammerspine"],
		category = "rares",
		faction = "Horde",
	},
	[72805380] = {
		name = L["Hammerspine"],
		category = "rares",
		faction = "Horde",
	},
	[73005180] = {
		name = L["Hammerspine"],
		category = "rares",
		faction = "Horde",
	},
	[52405840] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[52405860] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[52805840] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[52805880] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[53405700] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[54005640] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[54205780] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[54205860] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[54605680] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[54605760] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[54805640] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[55405920] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[55805860] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[55805960] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[56205720] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[56405640] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[56605660] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[56805520] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[58806040] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[58806100] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[58806260] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[59005840] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[59006180] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[59205720] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[59405900] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[60005780] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[62405840] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[62405860] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[62406080] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[62605880] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[62805740] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[63206000] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[63805980] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[65005960] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[31204320] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[31804080] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[32004180] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[32204020] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[32804300] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[33004040] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[33203920] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[33204160] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[33404100] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[33804120] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[34003920] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[34004020] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[34204180] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[34404300] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[34603900] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[34604140] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[34604400] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[35004040] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[35404200] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[36003780] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[36204260] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[36404180] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[36804300] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[39004760] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[39204640] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[39204740] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[39604820] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[39804600] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[40404680] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[40604680] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[40804540] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[41004920] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[42204640] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[43204960] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[43404900] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[21205160] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[21205280] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[21405040] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[21405100] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[21405360] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[21605260] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[21805500] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[22005120] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[22005200] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[22405020] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[22405420] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[22605020] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[22605180] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[23205080] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[23605380] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[23805080] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[24005280] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[25605000] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[24004340] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[24204360] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[24604560] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[24804360] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[25004280] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[25204460] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[25804440] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[25804520] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[26203660] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[26403640] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[27203580] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[27203660] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[27603820] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[28003720] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[59205500] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[59605700] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[59605760] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[59806020] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[62205720] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[62805680] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[62805800] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[33203820] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[33803940] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[22605460] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[23205260] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[71605140] = {
		name = L["Hammerspine"],
		category = "rares",
		faction = "Horde",
	},
	[72405280] = {
		name = L["Hammerspine"],
		category = "rares",
		faction = "Horde",
	},
	[72805220] = {
		name = L["Hammerspine"],
		category = "rares",
		faction = "Horde",
	},
	[53205920] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[53605860] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[56605640] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[56805680] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[57005780] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[59005780] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[59006220] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[62405680] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[62405980] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[32804020] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[39404620] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[21805100] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[23605080] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[25204480] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[59205920] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[61805880] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[21205260] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[23405380] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[23805180] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[62805900] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[63005800] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[31004440] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[33404160] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[35004320] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[35203920] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[39604600] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[21205400] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[21405300] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[53005720] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[54205720] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[56205680] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[59006060] = {
		name = L["Bjarn"],
		category = "rares",
		faction = "Horde",
	},
	[31804260] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[32404160] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[34604160] = {
		name = L["Timber"],
		category = "rares",
		faction = "Horde",
	},
	[43604960] = {
		name = L["Edan the Howler"],
		category = "rares",
		faction = "Horde",
	},
	[22205000] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[22205220] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[22205420] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[23405080] = {
		name = L["Great Father Arctikus"],
		category = "rares",
		faction = "Horde",
	},
	[25004440] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[25004460] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[27403760] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
	[28603560] = {
		name = L["Gibblewilt"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1420] = {
	[61605200] = {
		name = L["Innkeeper Renee"],
		npcID = 5688,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Horde",
	},
	[61405310] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Horde",
	},
	[32406560] = {
		name = L["Archibald Kava"],
		npcID = 2113,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Horde",
	},
	[32406620] = {
		name = L["Blacksmith Rand"],
		npcID = 2116,
		category = "repair",
		description = L["Apprentice Armorer"],
		faction = "Horde",
	},
	[32406640] = {
		name = L["Harold Raims"],
		npcID = 2117,
		category = "repair",
		description = L["Apprentice Weaponsmith"],
		faction = "Horde",
	},
	[60205300] = {
		name = L["Abe Winters"],
		npcID = 2135,
		category = "repair",
		description = L["Apprentice Armorer"],
		faction = "Horde",
	},
	[60205340] = {
		name = L["Oliver Dwor"],
		npcID = 2136,
		category = "repair",
		description = L["Apprentice Weaponsmith"],
		faction = "Horde",
	},
	[60405280] = {
		name = L["Eliza Callen"],
		npcID = 2137,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Horde",
	},
	[52605560] = {
		name = L["Constance Brisboise"],
		npcID = 3522,
		category = "repair",
		description = L["Apprentice Clothier"],
		faction = "Horde",
	},
	[83206820] = {
		name = L["Argent Quartermaster Hasana"],
		npcID = 10856,
		category = "repair",
		description = L["The Argent Dawn"],
		faction = "Neutral",
	},
	[31206480] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[56204940] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[79004080] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[82006940] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[60005220] = {
		name = L["Morganus"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Horde",
	},
	[59805200] = {
		name = L["Faruza"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Apprentice Herbalist"],
		faction = "Horde",
	},
	[32606560] = {
		name = L["Dannal Stern"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[32406565] = {
		name = L["David Trias"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Horde",
	},
	[31006600] = {
		name = L["Dark Cleric Duesten"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[30806600] = {
		name = L["Isabella"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[30806620] = {
		name = L["Maximillion"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[61605240] = {
		name = L["Rupert Boch"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[61805240] = {
		name = L["Cain Firesong"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Horde",
	},
	[61605220] = {
		name = L["Dark Cleric Beryl"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Horde",
	},
	[61605205] = {
		name = L["Marion Call"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Horde",
	},
	[61805245] = {
		name = L["Austil de Mon"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Horde",
	},
	[59405220] = {
		name = L["Carolai Anise"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist"],
		faction = "Horde",
	},
	[52605565] = {
		name = L["Bowen Brisboise"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Journeyman Tailor"],
		faction = "Horde",
	},
	[65406000] = {
		name = L["Shelene Rhobart"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Journeyman Leatherworker"],
		faction = "Horde",
	},
	[60005240] = {
		name = L["Velma Warnam"],
		npcID = 4773,
		category = "mountTrainer",
		description = L["Undead Horse Riding Instructor"],
		faction = "Horde",
	},
	[67205100] = {
		name = L["Clyde Kellen"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Horde",
	},
	[61605160] = {
		name = L["Vance Undergloom"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Journeyman Enchanter"],
		faction = "Horde",
	},
	[61805280] = {
		name = L["Nurse Neela"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["First Aid Trainer"],
		faction = "Horde",
	},
	[65606000] = {
		name = L["Rand Rhobart"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinner"],
		faction = "Horde",
	},
	[32206540] = {
		name = L["Joshua Kien"],
		npcID = 2115,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Horde",
	},
	[61005240] = {
		name = L["Abigail Shiel"],
		npcID = 2118,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Horde",
	},
	[61005260] = {
		name = L["Mrs. Winters"],
		npcID = 2134,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Horde",
	},
	[56605220] = {
		name = L["Hamlin Atkins"],
		npcID = 3547,
		category = "vendors",
		description = L["Mushroom Farmer"],
		faction = "Horde",
	},
	[61805000] = {
		name = L["Selina Weston"],
		npcID = 3548,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy & Herbalism Supplies"],
		faction = "Horde",
	},
	[65805960] = {
		name = L["Martine Tramblay"],
		npcID = 3550,
		category = "vendors",
		profession = "fishing",
		description = L["Fishing Supplies"],
		faction = "Horde",
	},
	[59805260] = {
		name = L["Zachariah Post"],
		npcID = 4731,
		category = "vendors",
		description = L["Undead Horse Merchant"],
		faction = "Horde",
	},
	[30806640] = {
		name = L["Kayla Smithe"],
		npcID = 5749,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[61605260] = {
		name = L["Gina Lang"],
		npcID = 5750,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Horde",
	},
	[83206920] = {
		name = L["Apothecary Dithers"],
		npcID = 11057,
		category = "vendors",
		faction = "Horde",
	},
	[83206960] = {
		name = L["Werg Thickblade"],
		npcID = 12943,
		category = "vendors",
		profession = "leatherworking",
		description = L["Leatherworking Supplies"],
		faction = "Horde",
	},
	[47003940] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[47603540] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[48603540] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[49403740] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53004620] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53204860] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53404660] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53404840] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53604640] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53604680] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53604800] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53604860] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[43403240] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[43803120] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[44003160] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[44003620] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[44203660] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[44403340] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[44403420] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[44403540] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[45003140] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[45003760] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[45403520] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[45803660] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46203160] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46403020] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46403080] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46403620] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46603600] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46603720] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46803040] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47003280] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47003780] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47203540] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47403120] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47403160] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47603240] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47803320] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47803420] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47803520] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[48603480] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[33404380] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[33804240] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[34404440] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[35004380] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[35004500] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[35204140] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[35204340] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[35804640] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[36204240] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[36404120] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[36404340] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[36404400] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[36404460] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[36803900] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[36804000] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[36804080] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[36804180] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[37004340] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[37004440] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[37603920] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[37604040] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[37604140] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[37604160] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[37804340] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[57402840] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[58002640] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[58202660] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[58402780] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[58602760] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[58802720] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[59602700] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[63202840] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[34405140] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[34405240] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[34605200] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[34805260] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[35605200] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[36404940] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[36804940] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[36804960] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[36805080] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[37005300] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[37204840] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[37405200] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[37604920] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[37805280] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[38005140] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[38005160] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[38205020] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[38605140] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[38804940] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[38805160] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[39005260] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[40005160] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[39404160] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[39804260] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[40404240] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[40604200] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[40804140] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[41405240] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[41405280] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[41405380] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[41805240] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[41805280] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[45205100] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[45405320] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[45605160] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[45805300] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[46005080] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[46605140] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[46605180] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[46805260] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[48404920] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[49205060] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[49804900] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[50005020] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[50005080] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[50605100] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[52605340] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[55603940] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[56204060] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[57003840] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[57003980] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[57203940] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[57404060] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[57604040] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[58004080] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[42606880] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[43006640] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[43006760] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[43206440] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[43406700] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[43606620] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[43606740] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[46006500] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[46006600] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[46606640] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[47006500] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[48806540] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[49406580] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[49606340] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[50006540] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[50206440] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[50206560] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[51006620] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[51206380] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[51406320] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[51806440] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[51806540] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[52206340] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[52406240] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[52606220] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[52606380] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[55406100] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[55406180] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[55806000] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[55806180] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[56406140] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[57406300] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[74005960] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[74206080] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[74405900] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[74406160] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75006080] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75006200] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75205940] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75206000] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75206320] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75805780] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76005960] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76006260] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76206060] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76405740] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76405860] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76406220] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76605900] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76606040] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76806120] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76806200] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[77806320] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[83005580] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[83205500] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[83805600] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[84005380] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[84404940] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[84405060] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[84405220] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[84405460] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[84805020] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[85004920] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[85005540] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[85205080] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[88405140] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[88605000] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[88605200] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[88805060] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89204680] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89204800] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89404020] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89404140] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89404600] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89604160] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89604340] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89604700] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[90204600] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[90204760] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[44603140] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[44803620] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[45403180] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46403180] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46803180] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47403560] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47603200] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[36204000] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[36403940] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[58602860] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[63802940] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[40004240] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[40204360] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[42005140] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[49005100] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[49805000] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[45606400] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[45806680] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[55205980] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[74806240] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75005900] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[77606160] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[85005040] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[85204820] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[88405380] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89604220] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89804580] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[53404540] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53604660] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53604820] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[43403440] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[43803140] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46003500] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46203100] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46603000] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47203340] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[34204420] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[34404120] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[35804240] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[35804380] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[62202960] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[62602860] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[37604900] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[40204200] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[42205120] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[43005260] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[45205180] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[46805180] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[49205020] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[58003900] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[58603980] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[74806180] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75805940] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75806160] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[83605400] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[84404980] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[85605040] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[88205060] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[88804040] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89404740] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[45203160] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46803620] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47003060] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[36204460] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[57602580] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[62602920] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[63402820] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[57204120] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[45606620] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[50406440] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[55206160] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[55806260] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[56206360] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[74206120] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75406200] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[75805840] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[88405260] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[88805140] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[90404720] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[53204660] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[53204840] = {
		name = L["Lost Soul"],
		category = "rares",
		faction = "Alliance",
	},
	[43403140] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[46003020] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47603140] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[48403320] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[58202640] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[37405120] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[38005360] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[38605200] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[49805080] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[50405240] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[49406380] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[49406540] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[55406080] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[74406000] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76806280] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[89005220] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[43003480] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[45203660] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[45403580] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47003120] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[47603280] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[48003580] = {
		name = L["Tormented Spirit"],
		category = "rares",
		faction = "Alliance",
	},
	[34804420] = {
		name = L["Muad"],
		category = "rares",
		faction = "Alliance",
	},
	[63402840] = {
		name = L["Deeb"],
		category = "rares",
		faction = "Alliance",
	},
	[38005180] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[38605080] = {
		name = L["Farmer Solliden"],
		category = "rares",
		faction = "Alliance",
	},
	[40804320] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[41005460] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[41404380] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[56604160] = {
		name = L["Bayne"],
		category = "rares",
		faction = "Alliance",
	},
	[42406720] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[43606700] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[54407520] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[54806740] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[56206140] = {
		name = L["Ressan the Needler"],
		category = "rares",
		faction = "Alliance",
	},
	[75806260] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[76606160] = {
		name = L["Fellicent's Shade"],
		category = "rares",
		faction = "Alliance",
	},
	[84204980] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[88805240] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
	[89604120] = {
		name = L["Sri'skulk"],
		category = "rares",
		faction = "Alliance",
	},
}
nodes[1429] = {
	[43806580] = {
		name = L["Innkeeper Farley"],
		npcID = 295,
		category = "innkeepers",
		description = L["Innkeeper"],
		faction = "Alliance",
	},
	[42906540] = {
		name = L["Mailbox"],
		category = "mailboxes",
		faction = "Alliance",
	},
	[41606580] = {
		name = L["Corina Steele"],
		npcID = 54,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[41406560] = {
		name = L["Kurran Steele"],
		npcID = 74,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Alliance",
	},
	[47204180] = {
		name = L["Janos Hammerknuckle"],
		npcID = 78,
		category = "repair",
		description = L["Weaponsmith"],
		faction = "Alliance",
	},
	[47604140] = {
		name = L["Dermot Johns"],
		npcID = 190,
		category = "repair",
		description = L["Cloth & Leather Armor Merchant"],
		faction = "Alliance",
	},
	[25207380] = {
		name = L["Veldan Lightfoot"],
		npcID = 896,
		category = "repair",
		description = L["Leather Armor Merchant"],
		faction = "Alliance",
	},
	[64606960] = {
		name = L["Morley Eberlein"],
		npcID = 959,
		category = "repair",
		description = L["Clothier"],
		faction = "Alliance",
	},
	[83206600] = {
		name = L["Rallic Finn"],
		npcID = 1198,
		category = "repair",
		vendors = {
			ammo = true,
		},
		description = L["Bowyer"],
		faction = "Alliance",
	},
	[47604145] = {
		name = L["Godric Rothgar"],
		npcID = 1213,
		category = "vendors",
		description = L["Armorer & Shieldcrafter"],
		faction = "Alliance",
	},
	[25207400] = {
		name = L["Quartermaster Hudson"],
		npcID = 1249,
		category = "repair",
		description = L["Armorer & Shieldcrafter"],
		faction = "Alliance",
	},
	[25207385] = {
		name = L["Quartermaster Hicks"],
		npcID = 1645,
		category = "vendors",
		description = L["Master Weaponsmith"],
		faction = "Alliance",
	},
	[41606560] = {
		name = L["Andrew Krighton"],
		npcID = 2046,
		category = "repair",
		description = L["Armorer & Shieldcrafter"],
		faction = "Alliance",
	},
	[39406040] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[49404340] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[83406960] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
	[42806580] = {
		name = L["Erma"],
		category = "stablemasters",
		description = L["Stable Master"],
		faction = "Alliance",
	},
	[49603940] = {
		name = L["Khelden Bremen"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[43206620] = {
		name = L["Zaldimar Wefhellt"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Mage Trainer"],
		classes = {
			MAGE = true,
		},
		faction = "Alliance",
	},
	[49803960] = {
		name = L["Priestess Anetta"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[43206560] = {
		name = L["Priestess Josetta"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Priest Trainer"],
		classes = {
			PRIEST = true,
		},
		faction = "Alliance",
	},
	[49804260] = {
		name = L["Drusilla La Salle"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[41606565] = {
		name = L["Smith Argus"],
		category = "primaryProfession",
		profession = "Blacksmithing",
		description = L["Journeyman Blacksmith"],
		faction = "Alliance",
	},
	[44406620] = {
		name = L["Maximillian Crowe"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warlock Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[50204220] = {
		name = L["Llane Beshere"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[41006580] = {
		name = L["Lyria Du Lac"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Warrior Trainer"],
		classes = {
			WARRIOR = true,
		},
		faction = "Alliance",
	},
	[50403980] = {
		name = L["Jorik Kerridan"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Rogue Trainer"],
		classes = {
			ROGUE = true,
		},
		faction = "Alliance",
	},
	[43806585] = {
		name = L["Barkeep Dobbins"],
		npcID = 465,
		category = "vendors",
		description = L["Bartender"],
		faction = "Alliance",
	},
	[50404200] = {
		name = L["Brother Sammuel"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[41006600] = {
		name = L["Brother Wilhelm"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Paladin Trainer"],
		classes = {
			PALADIN = true,
		},
		faction = "Alliance",
	},
	[79206900] = {
		name = L["Eldrin"],
		category = "primaryProfession",
		profession = "Tailoring",
		description = L["Journeyman Tailor"],
		faction = "Alliance",
	},
	[39804840] = {
		name = L["Alchemist Mallory"],
		category = "primaryProfession",
		profession = "Alchemy",
		description = L["Journeyman Alchemist"],
		faction = "Alliance",
	},
	[39804845] = {
		name = L["Herbalist Pomeroy"],
		category = "primaryProfession",
		profession = "Herbalism",
		description = L["Herbalism Trainer"],
		faction = "Alliance",
	},
	[44206600] = {
		name = L["Tomas"],
		category = "secondaryProfession",
		profession = "Cooking",
		description = L["Cook"],
		faction = "Alliance",
	},
	[46406220] = {
		name = L["Adele Fielder"],
		category = "primaryProfession",
		profession = "Leatherworking",
		description = L["Journeyman Leatherworker"],
		faction = "Alliance",
	},
	[47406220] = {
		name = L["Lee Brown"],
		category = "secondaryProfession",
		profession = "Fishing",
		description = L["Fisherman"],
		faction = "Alliance",
	},
	[43406560] = {
		name = L["Michelle Belle"],
		category = "secondaryProfession",
		profession = "First Aid",
		description = L["Physician"],
		faction = "Alliance",
	},
	[84206480] = {
		name = L["Randal Hunter"],
		npcID = 4732,
		category = "mountTrainer",
		description = L["Horse Riding Instructor"],
		faction = "Alliance",
	},
	[46206220] = {
		name = L["Helene Peltskinner"],
		category = "primaryProfession",
		profession = "Skinning",
		description = L["Skinner"],
		faction = "Alliance",
	},
	[64807040] = {
		name = L["Kitta Firewind"],
		category = "primaryProfession",
		profession = "Enchanting",
		description = L["Artisan Enchanter"],
		faction = "Alliance",
	},
	[41806700] = {
		name = L["Tharynn Bouden"],
		npcID = 66,
		category = "vendors",
		description = L["Trade Supplies"],
		faction = "Alliance",
	},
	[43806600] = {
		name = L["Brog Hamfist"],
		npcID = 151,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[47404160] = {
		name = L["Brother Danil"],
		npcID = 152,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General Supplies"],
		faction = "Alliance",
	},
	[42408920] = {
		name = L["Joshua Maclure"],
		npcID = 258,
		category = "vendors",
		description = L["Vintner"],
		faction = "Alliance",
	},
	[84006540] = {
		name = L["Katie Hunter"],
		npcID = 384,
		category = "vendors",
		description = L["Horse Breeder"],
		faction = "Alliance",
	},
	[42606640] = {
		name = L["Antonio Perelli"],
		npcID = 844,
		category = "vendors",
		description = L["Traveling Salesman"],
		faction = "Alliance",
	},
	[33608300] = {
		name = L["Homer Stonefield"],
		npcID = 894,
		category = "vendors",
		description = L["Fruit Seller"],
		faction = "Alliance",
	},
	[24007300] = {
		name = L["Sergeant De Vries"],
		npcID = 955,
		category = "vendors",
		description = L["Morale Officer"],
		faction = "Alliance",
	},
	[64806920] = {
		name = L["Dawn Brightstar"],
		npcID = 958,
		category = "vendors",
		description = L["Arcane Goods"],
		faction = "Alliance",
	},
	[83206660] = {
		name = L["Drake Lindgren"],
		npcID = 1250,
		category = "vendors",
		vendors = {
			ammo = true,
		},
		description = L["General & Trade Supplies"],
		faction = "Alliance",
	},
	[82806340] = {
		name = L["Terry Palin"],
		npcID = 1650,
		category = "vendors",
		description = L["Lumberjack"],
		faction = "Alliance",
	},
	[44206605] = {
		name = L["Toddrick"],
		npcID = 3935,
		category = "vendors",
		description = L["Butcher"],
		faction = "Alliance",
	},
	[39405660] = {
		name = L["Kira Songshine"],
		npcID = 3937,
		category = "vendors",
		description = L["Traveling Baker"],
		faction = "Alliance",
	},
	[44205320] = {
		name = L["Donni Anthania"],
		npcID = 6367,
		category = "vendors",
		description = L["Crazy Cat Lady"],
		faction = "Alliance",
	},
	[50004260] = {
		name = L["Dane Winslow"],
		npcID = 6373,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[44406600] = {
		name = L["Cylina Darkheart"],
		npcID = 6374,
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Demon Trainer"],
		classes = {
			WARLOCK = true,
		},
		faction = "Alliance",
	},
	[28405960] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[29205840] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[29405860] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[30005820] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[30605820] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[49005980] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50008140] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50008320] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50208380] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50407840] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50608320] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50808140] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[51205920] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[51208220] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[51208500] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[51408040] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[51605980] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[51805900] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[52008060] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[52008200] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[52605920] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[52606200] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[53205800] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[53406020] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[53805920] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[54206020] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[87807960] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[88407720] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[88607840] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[88607980] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[89407920] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[89607720] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[89607860] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[90407620] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[39808060] = {
		name = L["Narg the Taskmaster"],
		category = "rares",
		faction = "Horde",
	},
	[40807740] = {
		name = L["Narg the Taskmaster"],
		category = "rares",
		faction = "Horde",
	},
	[41007820] = {
		name = L["Narg the Taskmaster"],
		category = "rares",
		faction = "Horde",
	},
	[41207880] = {
		name = L["Narg the Taskmaster"],
		category = "rares",
		faction = "Horde",
	},
	[41407960] = {
		name = L["Narg the Taskmaster"],
		category = "rares",
		faction = "Horde",
	},
	[41608020] = {
		name = L["Narg the Taskmaster"],
		category = "rares",
		faction = "Horde",
	},
	[29006400] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[29406540] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[29806040] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[29806460] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[30406660] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[30806520] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[30806660] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[31206560] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[31406440] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[31606440] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[31806560] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[32206540] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[32606660] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[32806540] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[25209240] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[25209280] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[26009140] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[26009200] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[26009300] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[26208760] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[26609100] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[26609320] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[27208920] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[27608840] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[28008920] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[28408740] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[28808820] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[28808920] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[28809060] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[29008960] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[60204720] = {
		name = L["Mother Fang"],
		category = "rares",
		faction = "Horde",
	},
	[60204780] = {
		name = L["Mother Fang"],
		category = "rares",
		faction = "Horde",
	},
	[60604960] = {
		name = L["Mother Fang"],
		category = "rares",
		faction = "Horde",
	},
	[61005120] = {
		name = L["Mother Fang"],
		category = "rares",
		faction = "Horde",
	},
	[61204720] = {
		name = L["Mother Fang"],
		category = "rares",
		faction = "Horde",
	},
	[61404820] = {
		name = L["Mother Fang"],
		category = "rares",
		faction = "Horde",
	},
	[61404880] = {
		name = L["Mother Fang"],
		category = "rares",
		faction = "Horde",
	},
	[61604740] = {
		name = L["Mother Fang"],
		category = "rares",
		faction = "Horde",
	},
	[61804760] = {
		name = L["Mother Fang"],
		category = "rares",
		faction = "Horde",
	},
	[66204080] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[66603880] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[66604100] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[67203960] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[67604180] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[67604620] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[67803940] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[67803960] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[67804500] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[68004400] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[68804400] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[69003980] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[69004180] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[69004540] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[69203840] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[69404260] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[69804560] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[70203780] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[70204440] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[70803800] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[30805680] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50408200] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[89607800] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[31606540] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[23608980] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[27408800] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[28208860] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[69603800] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[30005960] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50808240] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[53006020] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[53408120] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[30606220] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[32006780] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[28008880] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[28608960] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[68004060] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[69803920] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[69804520] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[29405960] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50008340] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50608440] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[25209340] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[26609380] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[28808980] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[61404780] = {
		name = L["Mother Fang"],
		category = "rares",
		faction = "Horde",
	},
	[66004080] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[67204180] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
	[29005800] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[50408300] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[29206580] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[30206540] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[33006540] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[25209300] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[26209180] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[26609340] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[29405900] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[29605960] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[49008460] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[52207940] = {
		name = L["Thuros Lightfingers"],
		category = "rares",
		faction = "Horde",
	},
	[33206580] = {
		name = L["Morgaine the Sly"],
		category = "rares",
		faction = "Horde",
	},
	[25609240] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[25609400] = {
		name = L["Gruff Swiftbite"],
		category = "rares",
		faction = "Horde",
	},
	[67003840] = {
		name = L["Fedfennel"],
		category = "rares",
		faction = "Horde",
	},
}
nodes[1416] = {
	[39408160] = {
		name = L["Thanthaldis Snowgleam"],
		npcID = 13217,
		category = "repair",
		description = L["Stormpike Supply Officer"],
		faction = "Alliance",
	},
	[62805940] = {
		name = L["Jekyll Flandring"],
		npcID = 13219,
		category = "repair",
		description = L["Frostwolf Supply Officer"],
		faction = "Horde",
	},
	[84408020] = {
		name = L["Fahrad"],
		category = "trainers",
		subcategories = {
			classTrainer = true,
		},
		description = L["Grand Master Rogue"],
		classes = {
			ROGUE = true,
		},
		faction = "Neutral",
	},
	[38203880] = {
		name = L["Bro'kin"],
		npcID = 2480,
		category = "vendors",
		profession = "alchemy",
		description = L["Alchemy Supplies"],
		faction = "Neutral",
	},
	[47203520] = {
		name = L["Rizz Loosebolt"],
		npcID = 2684,
		category = "vendors",
		profession = "engineering",
		description = L["Engineering Supplies"],
		faction = "Neutral",
	},
	[86008000] = {
		name = L["Zan Shivsproket"],
		npcID = 6777,
		category = "vendors",
		description = L["Speciality Engineer"],
		faction = "Neutral",
	},
	[86007960] = {
		name = L["Smudge Thunderwood"],
		npcID = 6779,
		category = "vendors",
		subcategories = {
			poison = true,
		},
		description = L["Poison Vendor"],
		faction = "Neutral",
	},
	[40208000] = {
		name = L["Mirvyna Jinglepocket"],
		npcID = 14961,
		category = "vendors",
		description = L["Smokywood Pastures"],
		faction = "Neutral",
	},
	[62005860] = {
		name = L["Dillord Copperpinch"],
		npcID = 14962,
		category = "vendors",
		description = L["Smokywood Pastures"],
		faction = "Horde",
	},
	[64404020] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[64404880] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[64604100] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[65204300] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[66604720] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[70204640] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[71804640] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[74404600] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[75404680] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[75804620] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[76604600] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[76804680] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[77604840] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[78004640] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[78204460] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[79604640] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[80404060] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[26807380] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[38808320] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[55406500] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[55806880] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[58805880] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[63003760] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[69004620] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[73606560] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[74404680] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[75004520] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[75204620] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[75406460] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[75804660] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[76006520] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[76406340] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[77206500] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[77806160] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78205960] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78206480] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78405920] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78606500] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78804520] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78806300] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79204440] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79806040] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80203820] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80205800] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80406100] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80604680] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[81005360] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[81204440] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[81405320] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[81605040] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[82205140] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[83005440] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[29406080] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[30606020] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[31405180] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[31805200] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[33405220] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[37003620] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[37403700] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[42606260] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[44406240] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[44806260] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[52604620] = {
		name = L["Lo'Grosh"],
		category = "rares",
		faction = "Neutral",
	},
	[57004280] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[57204160] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[58004280] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[59204300] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[60004160] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[60004460] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[61204200] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[62204380] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[62604400] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[62804240] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[31408480] = {
		name = L["Araga"],
		category = "rares",
		faction = "Neutral",
	},
	[38208920] = {
		name = L["Araga"],
		category = "rares",
		faction = "Neutral",
	},
	[19205100] = {
		name = L["Cranky Benj"],
		category = "rares",
		faction = "Neutral",
	},
	[30003980] = {
		name = L["Cranky Benj"],
		category = "rares",
		faction = "Neutral",
	},
	[58606860] = {
		name = L["Jimmy the Bleeder"],
		category = "rares",
		faction = "Neutral",
	},
	[58607020] = {
		name = L["Jimmy the Bleeder"],
		category = "rares",
		faction = "Neutral",
	},
	[58607100] = {
		name = L["Jimmy the Bleeder"],
		category = "rares",
		faction = "Neutral",
	},
	[69404680] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[53802980] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[62204880] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[65404400] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[75004720] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[75804820] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[76006500] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[77604480] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78206080] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79406180] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79604260] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79605240] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80604380] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80806080] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[81405180] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[81805480] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[82005780] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[82205340] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[83805340] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[31006000] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[36003860] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[59004440] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[59604320] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[62204340] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[63604160] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Neutral",
	},
	[30208580] = {
		name = L["Araga"],
		category = "rares",
		faction = "Neutral",
	},
	[65004200] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[71004660] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[78204400] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[79204445] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[57603240] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[73406540] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[73604600] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[76806400] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[77604500] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78204660] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78404340] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79405320] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79804600] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80205520] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80205640] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80604120] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[81005000] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[81205060] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[81404820] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[82005080] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[32205200] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[35003820] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Neutral",
	},
	[51604740] = {
		name = L["Lo'Grosh"],
		category = "rares",
		faction = "Neutral",
	},
	[52204540] = {
		name = L["Lo'Grosh"],
		category = "rares",
		faction = "Neutral",
	},
	[52604440] = {
		name = L["Lo'Grosh"],
		category = "rares",
		faction = "Neutral",
	},
	[53404500] = {
		name = L["Lo'Grosh"],
		category = "rares",
		faction = "Neutral",
	},
	[53604920] = {
		name = L["Lo'Grosh"],
		category = "rares",
		faction = "Neutral",
	},
	[58204480] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[58804020] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[59204640] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[60404220] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[31007160] = {
		name = L["Araga"],
		category = "rares",
		faction = "Neutral",
	},
	[67804660] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[73804640] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[65004560] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[76406240] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[77006240] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79604440] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79605260] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[82405100] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[60804200] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[61604260] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[61804400] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[62604420] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[30207300] = {
		name = L["Araga"],
		category = "rares",
		faction = "Neutral",
	},
	[80004280] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[33607160] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[35607140] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[51602800] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[52602780] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[65804680] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78405100] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78405200] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79205740] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80004440] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80005420] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80205700] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80605480] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[31004880] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Horde",
	},
	[37403820] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Horde",
	},
	[57204500] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[60404440] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[31803060] = {
		name = L["Cranky Benj"],
		category = "rares",
		faction = "Neutral",
	},
	[35202600] = {
		name = L["Cranky Benj"],
		category = "rares",
		faction = "Neutral",
	},
	[80403580] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[80604060] = {
		name = L["Stone Fury"],
		category = "rares",
		faction = "Horde",
	},
	[75405320] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[75605260] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[77004560] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[78204420] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79405960] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79406560] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[79604420] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80204520] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[80805740] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[81205800] = {
		name = L["Narillasanz"],
		category = "rares",
		faction = "Neutral",
	},
	[30605160] = {
		name = L["Skhowl"],
		category = "rares",
		faction = "Horde",
	},
	[62004420] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[62404240] = {
		name = L["Gravis Slipknot"],
		category = "rares",
		faction = "Horde",
	},
	[39408700] = {
		name = L["Araga"],
		category = "rares",
		faction = "Neutral",
	},
	[17605280] = {
		name = L["Cranky Benj"],
		category = "rares",
		faction = "Neutral",
	},
}
nodes[1430] = {
	[40007500] = {
		name = L["Spirit Healer"],
		category = "spirithealers",
		faction = "Neutral",
	},
}


data["vendors"] = {}
local t = data["vendors"]

t[1322] = "2417, 2418, 2419, 2420, 2421, 2422, 2448, 3891, 17189"
t[8150] = "159, 1179, 1205, 1645, 1708, 4604, 4605, 4606, 4607, 4608, 8766, 8948, 12233, 12240"
t[8152] = "159, 1179, 1205, 1645, 1708, 4604, 4605, 4606, 4607, 4608, 8766, 8948"
t[8878] = "2524, 2525, 2527, 2532, 2533, 2535, 10858"
t[9636] = "2320, 2321, 2324, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6529, 6530, 6532, 7005, 7114, 8343, 8925, 12232, 12240"
t[11103] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[11106] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 8766, 8932"
t[12027] = "159, 1179, 1205, 1645, 1708, 2512, 2515, 2516, 2519, 2946, 3030, 3033, 3107, 3108, 3131, 3135, 3137, 4470, 4471, 4496, 4497, 4498, 5048, 11284, 11285, 15326, 15327"
t[12028] = "2320, 2321, 2324, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6529, 6530, 6532, 7005, 8343, 8925"
t[12031] = "6256, 6365, 6529, 6530, 6532, 6533"
t[12033] = "159, 2678, 2692, 3713, 6369, 16072, 17062, 21099, 21219"
t[12045] = "2522, 2523, 2530, 2531, 12249, 12250"
t[12245] = "1710, 2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3735, 3827, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5489, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 12228, 12231, 12232, 12240"
t[12246] = "159, 1205, 1477, 1645, 1708, 1711, 2289, 2290, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 3734, 4421, 4424, 4470, 4471, 4497, 4498, 4609, 11284, 11285, 12227, 12229, 12233, 12239, 15326, 15327"
t[12960] = "159, 1179, 1205, 1645, 1708, 2512, 2515, 2516, 2519, 2946, 3030, 3033, 3107, 3108, 3131, 3135, 3137, 4470, 4471, 4496, 4497, 4498, 5048, 11284, 11285, 15326, 15327"
t[3951] = "2507, 2512, 2515, 3026, 5439, 11305, 11362"
t[3952] = "200, 201, 202, 203, 792, 793, 794, 795, 837, 838, 839, 840, 2156, 2158, 2159, 2160, 3589, 3590, 3591, 3592, 3597, 3598, 3602, 3603"
t[3953] = "236, 237, 238, 239, 796, 797, 798, 799, 843, 844, 845, 846, 1839, 1840, 1843, 1844, 1849, 1850, 2141, 2142, 2143, 2144, 2145, 2146"
t[3954] = "2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 11039, 11101"
t[3955] = "2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 16072"
t[3956] = "929, 3371, 3372, 3385, 6054, 8925, 18256"
t[3958] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 5973, 6260, 6261, 7005, 8343, 10290, 14341"
t[3959] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[3960] = "117, 2287, 3734, 3770, 3771, 4599, 5489, 8952"
t[3961] = "159, 1179, 1205, 1645, 1708, 4536, 4537, 4538, 4539, 4602, 8766, 8953, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[3962] = "159, 1179, 1205, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498"
t[3969] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[3970] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[6028] = "2148, 2149, 2150, 2151, 2152, 2153, 2417, 2418, 2419, 2420, 2421, 2422, 2446, 2448, 3891, 17189, 17192"
t[11137] = "922, 923, 924, 925, 926, 927, 928, 2209, 2520, 2521, 2522, 2523, 2524, 2525, 2526, 2527"
t[12962] = "787, 4592, 4593, 4594, 6256, 6365, 6369, 6529, 6530, 6532, 6533, 8957, 17062, 21552"
t[14963] = "1205, 1645, 1708, 3770, 3771, 4538, 4539, 4599, 4602, 4606, 4607, 4608, 8766, 8948, 8952, 8953"
t[4879] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952, 12228, 12232, 12239, 20075"
t[4883] = "2148, 2149, 2150, 2151, 2152, 2153"
t[4884] = "2520, 2521, 2522, 2523, 2524, 2525, 2526, 2527, 12250, 12251"
t[4885] = "2414, 5655, 5656, 18776, 18777, 18778"
t[4886] = "2148, 2149, 2150, 2151, 2152, 2153, 2446, 17192"
t[4888] = "2520, 2521, 2522, 2523, 2524, 2525, 2526, 2527, 12248, 12250"
t[4889] = "2516, 2519, 3023, 3024, 3033, 11284"
t[4890] = "4817, 4818, 4824, 4825, 4826, 4830, 4831, 4832, 4833, 4835"
t[4891] = "117, 414, 422, 1707, 2070, 2287, 3770, 3771, 3927, 4536, 4537, 4538, 4539, 4540, 4541, 4542, 4544, 4599, 4601, 4602, 8932, 8950, 8952, 8953"
t[4892] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11305, 11362"
t[4893] = "159, 1179, 1205, 1645, 1708, 8766"
t[4894] = "117, 414, 422, 1707, 2070, 2287, 3770, 3771, 3927, 4540, 4541, 4542, 4544, 4599, 4601, 8932, 8950, 8952"
t[4896] = "159, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327"
t[4897] = "2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5789, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 12228, 12233, 12239"
t[4899] = "1710, 3371, 3372, 3827, 8925, 18256, 22250"
t[6272] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[6567] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 4355, 6260, 6261, 8343, 10290, 14341"
t[9552] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11305, 11362"
t[13476] = "929, 954, 1478, 1711, 1712, 2290, 3012, 3385, 5565, 16084, 16112, 16113, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[3411] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952"
t[4082] = "159, 1179, 1205, 2512, 2515, 2516, 2519, 2946, 3107, 3131, 3135, 4470, 4471, 4496, 4498, 5048"
t[4083] = "785, 929, 2449, 2453, 3355, 3356, 3357, 3385, 5565, 6055, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[4084] = "117, 159, 1179, 1205, 2287, 2512, 2515, 2516, 2519, 2946, 3107, 3131, 3135, 3770, 3771, 4470, 4471, 4496, 4498, 4599, 5048, 8952"
t[4085] = "2148, 2149, 2150, 2151, 2152, 2153, 4827, 4828, 4829, 4830, 4831, 4832, 4833, 4835"
t[4086] = "922, 923, 924, 925, 926, 927, 928, 2209, 4817, 4818, 4836, 4837, 4838, 7561"
t[4188] = "200, 201, 202, 203, 2156, 2158, 2159, 2160, 3591, 3592, 3597, 3598"
t[5870] = "117, 2287, 3770, 3771, 4599, 8952"
t[7731] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952"
t[9549] = "2507, 2512, 2515, 3026, 5439, 11304, 11362"
t[12043] = "2320, 2321, 2324, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 4289, 5956, 6217, 6256, 6529, 6530, 7005, 11039, 11101"
t[16458] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[3053] = "2516, 2519, 3023, 3024, 3033, 11284"
t[3689] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[4875] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952"
t[4876] = "159, 1179, 1205, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498"
t[4877] = "2320, 2321, 2324, 2678, 2692, 2880, 2901, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4399, 4400, 5956, 5973, 6217, 6530, 6532"
t[4878] = "785, 929, 954, 1478, 1711, 1712, 2290, 2449, 2453, 3012, 3355, 3356, 3357, 5565, 6068, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[6495] = "159, 1179, 1205, 1645, 1708, 8766"
t[6496] = "7228"
t[6548] = "11023"
t[6730] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 7560, 10647, 10648, 13309"
t[9551] = "2509, 2511, 2512, 2515, 2516, 2519, 3023, 3024, 3026, 3027, 3030, 3033, 5439, 5441, 11284, 11285, 11304, 11305, 11362"
t[11116] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 8766, 8932"
t[5411] = "2880, 2901, 3466, 3857, 5956, 6047, 18567"
t[5594] = "3371, 3372, 6057, 8925, 9303, 9304, 9305, 12958, 18256"
t[6568] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 7088, 8343, 10290, 14341, 21358"
t[7564] = "8529"
t[8125] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952, 18046"
t[8129] = "2417, 2418, 2419, 2420, 2421, 2422, 2423, 2424, 2425, 2426, 2427, 2428, 2448, 2451, 3891, 3894, 8088, 8089, 8090, 8091, 8092, 8093, 8094, 17189, 17190"
t[8131] = "2516, 2519, 3023, 3024, 3025, 3033, 11284, 18650"
t[8137] = "159, 787, 1179, 1205, 1645, 1708, 4592, 4593, 4594, 8766, 8957, 13939, 13942, 13945, 13946, 21552"
t[8139] = "159, 1179, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327, 16767"
t[1695] = "236, 237, 238, 239, 1849, 1850, 2141, 2142, 2143, 2144, 2145, 2146"
t[3500] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[3700] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[6576] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 7089, 8343, 10290, 14341"
t[7737] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[7772] = "10684"
t[7775] = "11141"
t[7852] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 7451, 8343, 8385, 10290, 14341, 15734"
t[7854] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 7451, 8343, 8385, 8409, 10290, 14341, 15734"
t[7879] = "11020, 11022"
t[7941] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[7942] = "159, 1179, 1205, 1645, 1708, 2512, 2515, 2516, 2519, 2946, 3030, 3033, 3107, 3108, 3131, 3135, 3137, 4470, 4471, 4496, 4497, 4498, 5048, 11284, 11285, 15326, 15327"
t[7943] = "159, 787, 1179, 1205, 1645, 1708, 4592, 4593, 4594, 8766, 8957, 21552"
t[7945] = "6256, 6365, 6529, 6530, 6532, 6533"
t[7947] = "2320, 2321, 2324, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 12229, 13947, 13948, 13949"
t[8143] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[8145] = "2320, 2321, 2324, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 12229, 13947, 13948, 13949"
t[8157] = "3371, 3372, 3928, 6057, 6149, 8925, 9302, 18256"
t[8158] = "3371, 3372, 3928, 6057, 6149, 8925, 9302, 18256"
t[8159] = "2429, 2431, 2432, 2434, 2463, 2464, 2465, 2467, 2468, 2469, 3593, 3594, 3889, 3890, 12253, 12254"
t[9548] = "2512, 2515, 2516, 2519, 3023, 3024, 3025, 3026, 3027, 3030, 3033, 5439, 11284, 11285, 11308, 11362"
t[10293] = "2429, 2431, 2432, 2434, 2435, 2437, 2438, 2440, 3587, 3588, 3593, 3594, 3889, 3892"
t[14637] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648, 19027"
t[3477] = "2880, 2901, 3466, 3857, 5956, 18567"
t[3479] = "851, 852, 853, 854, 1196, 1197, 1198, 2207, 4765, 4766"
t[3480] = "4540, 4541, 4542, 4544, 4601, 8950"
t[3481] = "159, 1179, 2512, 2515, 2516, 2519, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[3482] = "2320, 2321, 2324, 2604, 2605, 2678, 2692, 2880, 2901, 3371, 4289, 5486, 5488, 5956, 6217, 6256, 6260, 6529, 6530, 7005"
t[3483] = "843, 844, 845, 846, 847, 848, 849, 850, 1843, 1844, 1845, 1846"
t[3485] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 5772, 6260, 6261, 6270, 6272, 8343, 10290, 14341"
t[3486] = "837, 838, 839, 840, 3428, 3589, 3590, 4781, 4782, 4786, 4790, 4792, 4793, 16059, 16060"
t[3487] = "4496, 4497, 4498"
t[3488] = "2507, 2509, 2511, 2512, 2515, 2516, 2519, 3026, 5439, 5441, 11304, 11362"
t[3489] = "117, 2287, 3735, 3770, 3771, 4599, 8952"
t[3490] = "765, 785, 2447, 2449, 2453, 2928, 2930, 3371, 3372, 5060, 5140, 5173, 5565, 6053, 8923, 8924, 8925, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[3491] = "2024, 2025, 2026, 2027, 2028, 2029, 2030, 2208"
t[3492] = "200, 201, 202, 203, 236, 237, 238, 239, 1849, 1850, 3597, 3598, 4794, 4795, 4796"
t[3493] = "285, 286, 287, 718, 1852, 1853, 2445, 4797, 4798, 4799, 4800, 4816, 4820, 4821, 4822, 17188"
t[3495] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648, 18648"
t[3497] = "787, 4592, 4593, 4594, 6256, 6330, 6365, 6368, 6529, 6530, 6532, 6533, 8957, 21552"
t[3498] = "159, 1179, 1205, 2512, 2515, 2516, 2519, 2946, 3107, 3131, 3135, 4470, 4471, 4496, 4498, 5048"
t[3499] = "2320, 2321, 2324, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 4289, 5640, 5956, 6217, 6256, 6272, 6275, 6529, 6530, 7005"
t[3572] = "6256, 6365, 6529, 6530, 6532, 6533"
t[3658] = "851, 852, 853, 854, 858, 1196, 1197, 1198, 2207, 2455, 4765, 4766, 4777, 4778"
t[3682] = "285, 286, 287, 718, 1852, 1853, 4765, 4766, 4777, 4778, 4797, 4798, 4799, 4800, 4816"
t[3683] = "837, 838, 839, 840, 3428, 3589, 3590, 4781, 4782, 4786, 5772, 16059, 16060"
t[3684] = "843, 844, 845, 846, 1843, 1844, 4788, 4789"
t[3705] = "117, 2287, 3770, 3771, 4599, 8952"
t[3934] = "159, 1179, 1205, 1645, 1708, 4536, 4537, 4538, 4539, 4602, 8766, 8953"
t[5871] = "159, 1179, 1205, 1645, 1708, 8766"
t[5944] = "2320, 2321, 2324, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 5772, 6260, 6261, 6274, 7005, 8343, 10290, 14341"
t[6791] = "159, 787, 1179, 1205, 1645, 1708, 4592, 4593, 4594, 8766, 8957, 21552"
t[7714] = "159, 1179, 1205, 1645, 1708, 4536, 4537, 4538, 4539, 4602, 8766, 8953"
t[8307] = "159, 2678, 2692, 3713, 4540, 4541, 4542, 4544, 4601, 8950, 21099, 21219"
t[10380] = "843, 844, 845, 846, 1843, 1844"
t[14964] = "1205, 1645, 1708, 3770, 3771, 4538, 4539, 4599, 4602, 4606, 4607, 4608, 8766, 8948, 8952, 8953"
t[2803] = "159, 1179, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327, 16110"
t[2806] = "159, 1179, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327, 16110"
t[10379] = "2522, 2523, 2524, 2525, 2527, 2530, 2531, 2532, 2533, 2535"
t[15315] = "2520, 2521, 2522, 2523, 2526, 2528, 2529, 2530, 2531, 2534"
t[4184] = "13899, 13896, 13897, 13898, 13899"
t[7940] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 8343, 10290, 14341, 14469, 14472, 14488"
t[12019] = "159, 1179, 1205, 1645, 1708, 8766, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[12021] = "159, 1179, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327"
t[12022] = "2320, 2321, 2324, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 14483, 16224, 16243"
t[12023] = "2435, 2437, 2438, 2440, 2470, 2471, 2472, 2473, 2474, 2475, 3587, 3588, 3892, 3893, 12254"
t[12024] = "2528, 2529, 2530, 2531, 2532, 2533, 2534, 2535"
t[12026] = "159, 1179, 1205, 1645, 1708, 8766, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[12029] = "2504, 2505, 2506, 2507, 2512, 2515, 3026, 3027, 3030, 5439, 11308, 11362"
t[2084] = "159, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327"
t[2303] = "159, 1179, 1205, 1645, 1708, 8766, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[3779] = "2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 6217, 6256, 6530, 6532, 7005, 8343, 8925"
t[11118] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952, 22324"
t[11182] = "2423, 2424, 2425, 2426, 2427, 2428, 2451, 3894, 8088, 8089, 8090, 8091, 8092, 8093, 8094, 17190"
t[11183] = "2435, 2437, 2438, 2440, 2470, 2471, 2472, 2473, 2474, 2475, 3587, 3588, 3892, 3893"
t[11184] = "2516, 2519, 2528, 2529, 2530, 2531, 2532, 2533, 2534, 2535, 3023, 3024, 3025, 3033, 11284"
t[11185] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648, 16046, 16047, 16050, 18652, 18656"
t[11186] = "2880, 2901, 3466, 3857"
t[11187] = "117, 159, 787, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4592, 4593, 4594, 4599, 8766, 8952, 8957, 16110, 21552"
t[11188] = "3371, 3372, 3928, 6149, 8925, 13480, 18256"
t[11189] = "14468, 2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 14468, 14481, 14526, 15740, 16221"
t[4182] = "159, 1179, 2512, 2515, 2516, 2519, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[4183] = "851, 852, 853, 854, 1196, 1197, 1198, 2207"
t[4185] = "837, 838, 839, 840, 3428, 3589, 3590, 16059, 16060"
t[4186] = "843, 844, 845, 846, 1843, 1844, 5786, 5787"
t[4187] = "847, 848, 849, 850, 1202, 1845, 1846, 17187"
t[4189] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 5771, 5772, 6260, 6261, 6270, 8343, 10290, 14341"
t[4190] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[4191] = "159, 1179, 1205, 1645, 1708, 4536, 4537, 4538, 4539, 4602, 8766, 8953, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[4192] = "159, 1179, 1205, 1645, 1708, 8766"
t[4194] = "2320, 2321, 2324, 2604, 2605, 2678, 2692, 2880, 2901, 3371, 4289, 5956, 6217, 6256, 6260, 6529, 6530, 7005"
t[4195] = "159, 1179, 1205, 1645, 1708, 8766, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[4200] = "787, 4592, 4593, 4594, 5485, 8957, 21552"
t[4307] = "787, 4592, 4593, 4594, 5528, 6368, 6369, 8957, 17062, 21552"
t[6298] = "2880, 2901, 3466, 3857"
t[6300] = "2880, 2901, 3466, 3857, 5956, 18567"
t[6301] = "2320, 2321, 2324, 2325, 2604, 2605, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6260, 6529, 6530, 6532, 7005, 8343, 8925"
t[10216] = "6256, 6529"
t[3000] = "2520, 2521, 2522, 2523, 2524, 2525, 2526, 2527, 2528, 2529, 2530, 2531, 2532, 2533, 2534, 2535"
t[12959] = "117, 159, 1179, 1205, 1645, 1708, 2287, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 3770, 3771, 4470, 4471, 4497, 4498, 4599, 8766, 8952, 11284, 11285, 15326, 15327, 15758"
t[3621] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952"
t[10361] = "2528, 2529, 2530, 2531, 2532, 2533, 2534, 2535"
t[14301] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11305, 11362"
t[12956] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 10290, 14341, 15724, 15762"
t[15174] = "117, 159, 1179, 1205, 1645, 1708, 2287, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 3770, 3771, 4470, 4471, 4497, 4498, 4599, 8766, 8952, 11284, 11285, 15326, 15327"
t[15175] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 5565, 8923, 8924, 8925, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[3158] = "159, 2512, 2516, 2947, 3111, 4540"
t[3159] = "1194, 2130, 2131, 2132, 2134, 2139, 2479, 2480"
t[3160] = "85, 193, 194, 195, 209, 210, 711, 714, 1835, 1836, 3595, 3596"
t[3161] = "1200, 2386, 2387, 2388, 2389, 2390, 2391, 17183"
t[3163] = "2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[3164] = "159, 2512, 2516, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[3165] = "2506, 2507, 2512, 2515, 5439, 11362"
t[3166] = "2364, 2366, 2367, 2369, 2370, 2371, 2372, 2373, 2374, 2375, 3606, 3607"
t[3167] = "2376, 2398, 2399, 2400, 2401, 2402, 2403, 2880, 2901, 3466, 3857, 17185"
t[3168] = "2320, 2324, 2604, 2678, 2880, 2901, 3371, 4289, 5956, 6217, 6256, 6260, 6529, 7005"
t[3186] = "159, 2512, 2516, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[3187] = "2320, 2324, 2604, 2678, 2880, 2901, 3371, 4289, 5956, 6217, 6256, 6260, 6529, 7005"
t[3881] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 5483, 8766, 8952"
t[3882] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952"
t[3933] = "117, 2287, 3770, 3771, 4599, 8952"
t[5942] = "6256, 6326, 6365, 6368, 6529, 6530, 6532, 6533"
t[6027] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353, 16354, 16355, 16356, 16357, 16358, 16359, 16360, 16361, 16362, 16363, 16364, 163"
t[6928] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952"
t[7952] = "8588, 8591, 8592, 18788, 18789, 18790"
t[10369] = "2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495, 2506, 2507, 2512, 2515, 5439, 11362"
t[12776] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331"
t[15012] = "9312, 9313, 9314, 9315, 9318"
t[3587] = "159, 2512, 2516, 2947, 3111, 4540"
t[3588] = "1194, 2130, 2131, 2132, 2134, 2139, 2479, 2480"
t[3589] = "2506, 2507, 2512, 2515, 5439, 11362"
t[3590] = "2117, 2119, 2120, 2121, 3599, 3600"
t[3591] = "2122, 2123, 2124, 2125, 2126, 2127"
t[3592] = "2129, 2379, 2380, 2381, 2383, 2384, 2385, 17184"
t[3608] = "159, 2512, 2516, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[3609] = "2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[3610] = "2506, 2507, 2512, 2515, 5439, 11362"
t[3611] = "792, 793, 794, 795, 3602, 3603"
t[3612] = "796, 797, 798, 799, 1839, 1840"
t[3613] = "1201, 2392, 2393, 2394, 2395, 2396, 2397, 17186"
t[3614] = "2320, 2324, 2604, 2678, 2880, 2901, 3371, 4289, 5956, 6217, 6256, 6260, 6529, 7005"
t[4265] = "159, 2678, 2692, 3713, 6325, 6328, 21099, 21219"
t[4266] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[6091] = "159, 1179, 1205, 1645, 1708, 8766, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[6736] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[10118] = "6256, 6326, 6365, 6368, 6529, 6530, 6532, 6533"
t[3072] = "159, 2512, 2516, 2947, 3111, 4540"
t[3073] = "1194, 2130, 2131, 2132, 2134, 2139, 2479, 2480"
t[3074] = "85, 209, 210, 714, 1835, 1836"
t[3075] = "1200, 2386, 2387, 2388, 2389, 2390, 2391, 17183"
t[3076] = "159, 2512, 2516, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[3077] = "2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[3078] = "2509, 2510, 2516, 2519, 5441"
t[3079] = "2370, 2371, 2372, 2373, 2374, 2375"
t[3080] = "2376, 2398, 2399, 2400, 2401, 2402, 2403, 17185"
t[3081] = "2320, 2324, 2604, 2678, 2880, 2901, 3371, 4289, 5484, 5956, 6217, 6256, 6260, 6529, 7005"
t[3685] = "15277, 15290, 18793, 18794, 18795"
t[3883] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[3884] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[5940] = "6256, 6325, 6328, 6365, 6529, 6530, 6532, 6533"
t[6747] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[734] = "159, 1179, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 4536, 4537, 4538, 4539, 4602, 8766, 8953, 11284, 11285, 12228, 12231, 15326, 15327"
t[1146] = "2520, 2521, 2522, 2523, 2524, 2525, 2526, 2527, 12164, 12248, 12250"
t[1147] = "2429, 2431, 2432, 2434, 2463, 2464, 2465, 2467, 2468, 2469, 3593, 3594, 3889, 3890"
t[1148] = "2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3682, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 12228, 12231"
t[1149] = "159, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327, 16111"
t[1381] = "2417, 2418, 2419, 2420, 2421, 2422, 2448, 3891, 17189"
t[2482] = "2520, 2521, 2522, 2523, 2524, 2525, 2526, 2527, 12163, 12251, 12252"
t[2483] = "2522, 2523, 2530, 2531, 12164, 12250"
t[2622] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[2626] = "6256, 6365, 6529, 6530, 6532, 6533, 16083"
t[2663] = "8495, 8496, 10728"
t[2664] = "159, 2678, 2692, 3713, 6039, 6369, 13940, 13941, 13943, 17062, 21099, 21219"
t[2670] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 7087, 8343, 10290, 14341, 14630"
t[2672] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 8343, 10290, 10318, 14341"
t[2685] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648, 13310, 18651"
t[2687] = "2880, 2901, 3466, 4357, 4399, 4400, 5956, 10647, 10648, 13311"
t[2699] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 10290, 14341, 14635, 18239"
t[2832] = "159, 1179, 1205, 1645, 1708, 2593, 2594, 2595, 2596, 2723, 4540, 4541, 4542, 4544, 4595, 4600, 4601, 8766, 8950"
t[2838] = "5740, 18648"
t[2839] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11305, 11362"
t[2840] = "852, 1197, 4777, 4778"
t[2842] = "787, 4592, 4593, 4594, 8957, 21552"
t[2843] = "2520, 2521, 2526, 2528, 2529, 2534, 12162, 12248"
t[2844] = "2880, 2901, 3466, 3857, 5956, 18567"
t[2845] = "2417, 2418, 2419, 2420, 2421, 2422, 2448, 3891, 12257, 17189"
t[2846] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 5788, 5789, 6260, 6261, 7005, 8343, 10290, 14341"
t[2847] = "2880, 2901, 3466, 3857, 5956, 18567"
t[2848] = "1710, 3371, 3372, 3827, 6056, 6057, 8925, 18256"
t[2849] = "200, 201, 202, 203, 2156, 2158, 2159, 2160, 2429, 2431, 2432, 2434, 2435, 2437, 2438, 2440, 3587, 3588, 3591, 3592, 3593, 3594, 3597, 3598, 3889, 3892, 7337, 7338, 7339, 7340, 7341, 7342"
t[5814] = "159, 787, 1179, 1205, 1645, 1708, 4536, 4537, 4538, 4539, 4592, 4593, 4594, 4602, 8766, 8953, 8957, 21552"
t[6807] = "159, 787, 1179, 1205, 1645, 1708, 4592, 4593, 4594, 8766, 8957, 21552"
t[7485] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4540, 4541, 4542, 4544, 4599, 4601, 8766, 8950, 8952"
t[8679] = "2880, 2901, 3466, 4399, 4400, 5956, 10602, 10647, 10648"
t[2688] = "2880, 2901, 3466, 4357, 4364, 4382, 4399, 4400, 5956, 10609, 10647, 10648"
t[4782] = "117, 159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 2287, 3770, 3771, 3927, 4599, 4600, 8766, 8932, 8952, 18046"
t[7744] = "159, 1179, 1205, 1645, 1708, 2686, 2894, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[8160] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 8409, 10290, 14341"
t[8161] = "2880, 2901, 3466, 3857, 5956, 7995, 18567"
t[12958] = "2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 15735"
t[14731] = "159, 787, 1179, 1205, 1645, 1708, 4592, 4593, 4594, 8766, 8957, 21552"
t[14737] = "2880, 2901, 3466, 3857, 5956, 18567"
t[14738] = "159, 2678, 2692, 3713, 21099, 21219"
t[14739] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[14740] = "6256, 6365, 6529, 6530, 6532, 6533"
t[17598] = "2512, 2515, 3030, 5439, 11362"
t[1407] = "2429, 2431, 2432, 2434, 2463, 2464, 2465, 2467, 2468, 2469, 2528, 2529, 2530, 2531, 2532, 2533, 2534, 2535, 3593, 3594, 3889, 3890"
t[2908] = "159, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327"
t[9179] = "2880, 2901, 3466, 3857, 5956, 10858, 18567"
t[9356] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952"
t[1471] = "2524, 2525, 2527, 2532, 2533, 2535, 10858"
t[2805] = "929, 954, 1478, 1711, 1712, 2290, 3012, 3385, 5565, 16084, 16112, 16113, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[2808] = "159, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327"
t[2810] = "2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5973, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 12228"
t[2812] = "1710, 3371, 3372, 3827, 6056, 8925, 18256"
t[2814] = "117, 2287, 3770, 3771, 4599, 4609, 8952"
t[2816] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 10290, 13288, 14341"
t[2819] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 10290, 13287, 14341"
t[2820] = "159, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327"
t[2821] = "2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3682, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5973, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 11163, 12228"
t[4954] = "117, 2287, 3770, 3771, 4599, 8952"
t[6574] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 7089, 8343, 10290, 14341"
t[9501] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 8766, 8932"
t[9555] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11305, 11362"
t[15124] = "1205, 1645, 1708, 3770, 3771, 4538, 4539, 4599, 4602, 4606, 4607, 4608, 8766, 8948, 8952, 8953"
t[15125] = "1205, 1645, 1708, 3770, 3771, 4538, 4539, 4599, 4602, 4606, 4607, 4608, 8766, 8948, 8952, 8953"
t[15126] = "17349, 17352, 20068, 20072, 20214, 20220, 20222, 20223, 20224, 20232, 20234, 20235, 21115, 21116, 21120"
t[15127] = "17349, 17352, 20043, 20050, 20055, 20069, 20070, 20071, 20073, 20088, 20089, 20090, 20091, 20092, 20093, 20225, 20226, 20227, 20237, 20243, 20244, 21117, 21118, 21119"
t[2265] = "2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[2352] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 4540, 4541, 4542, 4544, 4601, 8766, 8932, 8950"
t[2357] = "2414, 5655, 5656, 18776, 18777, 18778"
t[2364] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 4540, 4541, 4542, 4544, 4601, 8766, 8932, 8950"
t[2365] = "117, 2287, 3770, 3771, 4599, 8952"
t[2366] = "159, 1179, 1205, 1645, 1708, 8766"
t[2380] = "1710, 3371, 3372, 3827, 6055, 8925, 18256"
t[2381] = "159, 2320, 2321, 2324, 2678, 2692, 2880, 2901, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4355, 4399, 4400, 5788, 5956, 6217, 6530, 6532, 11163, 21099, 21219"
t[2383] = "6256, 6330, 6365, 6369, 6529, 6530, 6532, 6533, 17062"
t[2388] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3703, 3770, 3771, 4599, 8766, 8952"
t[2393] = "2320, 2321, 2324, 2678, 2692, 2880, 2901, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4399, 4400, 5788, 5956, 6054, 6217, 6530, 6532"
t[2394] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 6274, 6401, 8343, 10290, 14341"
t[2397] = "159, 2678, 2692, 3713, 6330, 21099, 21219"
t[2401] = "159, 1179, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327"
t[2698] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 7613, 8343, 10290, 14341"
t[3536] = "236, 237, 238, 239, 1849, 1850, 4794, 4795, 4796, 4830, 4831, 4832"
t[3537] = "4827, 4828, 4829, 4836, 4837, 4838, 5772, 6377, 7362, 7561"
t[3539] = "922, 923, 924, 925, 926, 927, 928, 2209, 4817, 4818, 4824, 4825, 4826, 12247, 12249"
t[3540] = "787, 4592, 4593, 4594, 8957, 21552"
t[3541] = "159, 1179, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327"
t[3542] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 5565, 8923, 8924, 8925, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[3543] = "285, 286, 287, 718, 1852, 1853, 4797, 4798, 4799, 4800, 4816, 4833, 4835"
t[3544] = "4604, 4605, 4606, 4607, 4608, 8948"
t[225] = "922, 923, 924, 925, 926, 927, 928, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2208, 2209, 12247, 12249"
t[226] = "2148, 2149, 2150, 2151, 2152, 2153, 2446, 4797, 4798, 4799, 4800, 4816, 17192"
t[227] = "159, 1179, 1205, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498"
t[228] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11304, 11362"
t[274] = "159, 1179, 1205, 1645, 1708, 1942, 8766"
t[844] = "785, 858, 2449, 2453, 3355, 3356, 3357, 3371, 3372, 4777, 4778, 4794, 4795, 4796, 4817, 4818, 8925, 18256"
t[960] = "2320, 2321, 2324, 2678, 2692, 2880, 2901, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4399, 4400, 5956, 6217, 6530, 6532"
t[1672] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 8343, 10290, 14341"
t[1673] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[2481] = "929, 3371, 3372, 3385, 6068, 8925, 18256"
t[2668] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 8343, 10290, 14341, 14627"
t[2669] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 6275, 6401, 8343, 10290, 14341"
t[3133] = "2880, 2901, 3466, 3857, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648"
t[3134] = "929, 3385, 4827, 4828, 4829, 4836, 4837, 4838, 6053, 7561"
t[3135] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[3138] = "4604, 4605, 4606, 4607, 4608, 8948"
t[6790] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 8766, 8932"
t[980] = "2423, 2424, 2425, 2426, 2427, 2428, 2451, 3894, 8088, 8089, 8090, 8091, 8092, 8093, 8094, 17190"
t[981] = "2528, 2529, 2530, 2531, 2532, 2533, 2534, 2535"
t[982] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952"
t[983] = "3371, 3372, 3928, 5565, 6149, 8925, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 18256, 21177"
t[984] = "2435, 2437, 2438, 2440, 2470, 2471, 2472, 2473, 2474, 2475, 3587, 3588, 3892, 3893, 12255, 12256"
t[989] = "2320, 2321, 2324, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 11223, 12232, 16111"
t[8176] = "2880, 2901, 3466, 3857, 5956, 7995, 18567"
t[8177] = "3371, 3372, 3928, 6149, 8925, 9300, 18256"
t[11874] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 10290, 12253, 12254, 14341, 15726"
t[12807] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353, 16354, 16355, 16356, 16357, 16358, 16359, 16360, 16361, 16362, 16363, 16364, 163"
t[1441] = "922, 923, 924, 925, 926, 927, 928, 2209, 4817, 4818"
t[1448] = "159, 1179, 1205, 2515, 2519, 2880, 2901, 3030, 3033, 3107, 3108, 3135, 3137, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 4470, 4471, 4497, 4498, 5956, 10647, 10648"
t[1450] = "2148, 2149, 2150, 2151, 2152, 2153, 2446, 17192"
t[1452] = "159, 1179, 1205, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498"
t[1453] = "929, 3371, 3372, 8925, 18256"
t[1454] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 4790, 4792, 4793, 4827, 4828, 4829, 5772, 6260, 6261, 6275, 8343, 10290, 14341"
t[1456] = "2320, 2321, 2324, 2678, 2692, 2880, 2901, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4399, 4400, 5956, 6217, 6530, 6532"
t[1457] = "929, 2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[1459] = "2507, 2512, 2515, 3026, 5439, 11304, 11362"
t[1460] = "2411, 2414, 5655, 5656"
t[1461] = "2516, 2519, 3023, 3024, 3033, 11284"
t[1462] = "2512, 2515, 3030, 5439, 11362"
t[1463] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[1464] = "117, 159, 1179, 1205, 1645, 1708, 2287, 2594, 3770, 3771, 4599, 8766, 8952"
t[2679] = "4827, 4828, 4829, 4830, 4831, 4832, 4833, 4835, 7114, 7290, 7613"
t[2682] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648, 13309, 14639"
t[3178] = "787, 4592, 4593, 4594, 6256, 6365, 6368, 6369, 6529, 6530, 6532, 6533, 8957, 17062, 21552"
t[3180] = "4378, 4824, 4825, 4826, 4830, 4831, 4832, 4833, 4835, 5740"
t[8305] = "785, 929, 2449, 2453, 3355, 3356, 3357, 3371, 3372, 8925, 18256"
t[777] = "2320, 2321, 2324, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 4289, 5772, 5956, 6217, 6256, 6529, 6530, 7005, 20576"
t[789] = "2512, 2515, 3030, 5439, 11362"
t[790] = "2880, 2901, 3466, 3857, 5956, 18567"
t[791] = "159, 1179, 1205, 2512, 2515, 2516, 2519, 2946, 3107, 3131, 3135, 4470, 4471, 4496, 4498, 5048"
t[793] = "2445, 4820, 4821, 4822, 17188"
t[956] = "285, 286, 287, 718, 1852, 1853"
t[1671] = "4536, 4537, 4538, 4539, 4602, 8953"
t[1678] = "787, 4592, 4593, 4594, 6256, 6365, 6529, 6530, 6532, 6533, 8957, 21552"
t[2697] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 7289, 8343, 10290, 14341"
t[3085] = "159, 2678, 2692, 3713, 21099, 21219"
t[3086] = "159, 787, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4592, 4593, 4594, 4601, 8766, 8950, 8957, 21552"
t[3088] = "2511, 2516, 2519, 3023, 3033, 5441"
t[3089] = "117, 2287, 3770, 3771, 4599, 8952"
t[3090] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[3091] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 4781, 4782, 4786, 6260, 6261, 8343, 10290, 14341"
t[3096] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 4790, 4792, 4793, 6260, 6261, 8343, 10290, 14341"
t[3097] = "236, 237, 238, 239, 1849, 1850, 4794, 4795, 4796"
t[5620] = "117, 159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 2287, 3770, 3771, 3927, 4540, 4541, 4542, 4544, 4599, 4601, 8766, 8932, 8950, 8952"
t[6727] = "159, 787, 1179, 1205, 1645, 1708, 4592, 4593, 4594, 8766, 8957, 21552"
t[11703] = "847, 848, 849, 850, 1845, 1846"
t[14624] = "117, 159, 1179, 1205, 1645, 1708, 2287, 2515, 2519, 2880, 2901, 3030, 3033, 3107, 3108, 3135, 3137, 3466, 3770, 3771, 3857, 4470, 4471, 4497, 4498, 4599, 5956, 8766, 8952, 11284, 11285, 15326, 15327, 18567"
t[167] = "847, 848, 849, 850, 1845, 1846, 4765, 4766"
t[222] = "852, 1197, 2492, 2493, 4777, 4778"
t[372] = "2880, 2901, 3466, 3857"
t[954] = "843, 844, 845, 846, 1843, 1844, 4788, 4789"
t[1214] = "837, 838, 839, 840, 3428, 3589, 3590, 4781, 4782, 4786, 16059, 16060"
t[1362] = "847, 848, 849, 850, 1845, 1846"
t[1465] = "2320, 2321, 2324, 2604, 2605, 2678, 2692, 2880, 2901, 3371, 4289, 5956, 6217, 6256, 6260, 6529, 6530, 6892, 7005"
t[1469] = "2509, 2511, 2516, 2519, 5441"
t[1474] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 5772, 6260, 6261, 6275, 8343, 10290, 14341"
t[1682] = "159, 1179, 2512, 2515, 2516, 2519, 2686, 2894, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[1684] = "787, 4592, 4593, 4594, 6256, 6325, 6328, 6329, 6365, 6529, 6530, 6532, 6533, 8957, 21552"
t[1685] = "159, 1179, 2512, 2515, 2516, 2519, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042, 5640, 6053"
t[1686] = "2511, 2516, 2519, 3023, 3033, 5441"
t[1687] = "2507, 2512, 2515, 3026, 5439, 11304, 11362"
t[3291] = "4540, 4541, 4542, 4544, 4601, 8950"
t[3948] = "4540, 4541, 4542, 4544, 4601, 8950"
t[6734] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[2113] = "85, 193, 194, 195, 209, 210, 711, 714, 1835, 1836, 3595, 3596"
t[2115] = "159, 2512, 2516, 2947, 3111, 4540"
t[2116] = "1200, 2386, 2387, 2388, 2389, 2390, 2391, 17183"
t[2117] = "1194, 2130, 2131, 2132, 2134, 2139, 2479, 2480"
t[2118] = "2320, 2324, 2604, 2678, 2880, 2901, 3371, 4289, 5956, 6217, 6256, 6260, 6529, 7005, 12226"
t[2134] = "159, 2512, 2516, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[2135] = "2376, 2398, 2399, 2400, 2401, 2402, 2403, 17185"
t[2136] = "2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[2137] = "2370, 2371, 2372, 2373, 2374, 2375"
t[3522] = "2364, 2366, 2367, 2369, 3606, 3607, 6270"
t[3547] = "4604, 4605, 4606, 4607, 4608, 8948"
t[3548] = "765, 785, 858, 2447, 2449, 2453, 3371, 3372, 8925, 18256, 22250"
t[3550] = "6256, 6325, 6326, 6365, 6529, 6530, 6532, 6533"
t[4731] = "13331, 13332, 13333, 13334, 18791"
t[5688] = "159, 1179, 1205, 1645, 1708, 4604, 4605, 4606, 4607, 4608, 8766, 8948"
t[5749] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331"
t[5750] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353, 16354, 16355, 16356, 16357, 16358, 16359, 16360, 16361, 16362, 16363, 16364, 163"
t[10856] = "13482, 13724, 13810, 13813"
t[11057] = "13320"
t[12943] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 10290, 14341, 15725, 15741"
t[2480] = "1710, 3371, 3372, 3827, 8925, 14634, 18256"
t[2684] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648, 13308"
t[6777] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4399, 4400, 4404, 5956, 7742, 10647, 10648"
t[6779] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925, 18160"
t[14961] = "8766, 8948, 8952, 8953"
t[14962] = "8766, 8948, 8952, 8953"
t[233] = "4540, 4541, 4542, 4544, 4601, 8950, 11109"
t[491] = "159, 1179, 2512, 2515, 2516, 2519, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[843] = "2320, 2321, 2324, 2604, 2605, 2678, 2692, 2880, 2901, 3371, 4289, 5771, 5786, 5787, 5956, 6217, 6256, 6260, 6274, 6529, 6530, 7005"
t[1668] = "2507, 2512, 2515, 3026, 5439, 11304, 11362"
t[1669] = "843, 844, 845, 846, 1843, 1844, 4788, 4789, 5640"
t[1670] = "4540, 4541, 4542, 4544, 4601, 8950"
t[4305] = "787, 4592, 4593, 4594, 5528, 6326, 6368, 8957, 16111, 21552"
t[8931] = "159, 787, 1179, 1205, 1645, 1708, 4592, 4593, 4594, 8766, 8957, 21552"
t[8934] = "2320, 2321, 2324, 2325, 2604, 2605, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6260, 6529, 6530, 6532, 7005, 8343, 8925"
t[3546] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 4540, 4541, 4542, 4544, 4601, 8766, 8932, 8950"
t[5508] = "2423, 2424, 2425, 2426, 2427, 2428, 2451, 3894, 8088, 8089, 8090, 8091, 8092, 8093, 8094, 17190"
t[8178] = "3371, 3372, 3928, 6149, 8925, 9300, 18256"
t[10857] = "13482, 13724, 13810, 13813"
t[11056] = "13320"
t[11278] = "8030, 12703, 12819, 12823, 13485, 13501"
t[12942] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 10290, 14341, 15725, 15741"
t[2140] = "159, 858, 1179, 2512, 2515, 2516, 2519, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[3534] = "851, 852, 853, 854, 929, 1196, 1197, 1198, 2207, 4777, 4778, 4817, 4818, 11304"
t[3551] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[3552] = "843, 844, 845, 846, 1843, 1844, 4788, 4789"
t[3553] = "848, 847, 849, 850, 1845, 1846"
t[3554] = "837, 838, 839, 840, 3428, 3589, 3590, 4781, 4782, 4786, 16059, 16060"
t[3556] = "2320, 2321, 2324, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 4289, 5771, 5786, 5787, 5956, 6217, 6256, 6272, 6529, 6530, 6892, 7005"
t[3577] = "1179, 159, 1205, 1645, 1708, 8766"
t[5748] = "6328, 6368"
t[5757] = "4470, 6217, 6342, 6346, 10938, 10940, 11291, 22307"
t[5758] = "4470, 6217, 6342, 6349, 10938, 10940, 11291, 22307"
t[5886] = "4604, 4605, 4606, 4607, 4608, 8948"
t[6739] = "159, 1179, 1205, 1645, 1708, 4604, 4605, 4606, 4607, 4608, 8766, 8948"
t[9553] = "2507, 2512, 2515, 3026, 5439, 11304, 11362"
t[829] = "159, 2512, 2516, 2947, 3111, 4540"
t[836] = "2117, 2119, 2120, 2121, 2122, 2123, 2124, 2125, 2126, 2127, 3599, 3600"
t[945] = "1194, 2130, 2131, 2132, 2134, 2139, 2479, 2480"
t[1104] = "2129, 2379, 2380, 2381, 2383, 2384, 2385, 17184"
t[1237] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 4540, 4541, 4542, 4544, 4601, 8766, 8932, 8950"
t[1238] = "792, 793, 794, 795, 796, 797, 798, 799, 1839, 1840, 2117, 2119, 2120, 2121, 2122, 2123, 2124, 2125, 2126, 2127, 3599, 3600, 3602, 3603"
t[1240] = "2392, 2393, 2394, 2395, 2396, 2397"
t[1243] = "2509, 2510, 2516, 2519, 5441"
t[1247] = "159, 1179, 1205, 1645, 1708, 2686, 2894, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[1261] = "5864, 5872, 5873, 18785, 18786, 18787"
t[1263] = "8497"
t[1273] = "2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[1690] = "2880, 2901, 3466, 3857, 5956, 18567"
t[1691] = "159, 2512, 2516, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[1692] = "2320, 2324, 2604, 2678, 2880, 2901, 3371, 4289, 5956, 6217, 6256, 6260, 6529, 7005"
t[1694] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648"
t[1697] = "159, 1179, 1205, 1645, 1708, 2593, 2594, 2595, 2596, 2723, 8766"
t[1698] = "2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[3162] = "796, 797, 798, 799, 1839, 1840"
t[3177] = "2490, 2491, 2492, 2493"
t[6328] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353, 16354, 16355, 16356, 16357, 16358, 16359, 16360, 16361, 16362, 16363, 16364, 163"
t[6376] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331"
t[7955] = "8563, 8595, 13321, 13322, 18772, 18773, 18774"
t[8508] = "6256, 6325, 6365, 6529, 6530, 6532, 6533"
t[15011] = "9312, 9313, 9314, 9315, 9318"
t[1296] = "2528, 2529, 2530, 2531, 2532, 2533, 2534, 2535"
t[3298] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 8766, 8932"
t[3708] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[9544] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4399, 4400, 4404, 5956, 10602, 10647, 10648"
t[54] = "2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[66] = "2320, 2324, 2604, 2678, 2880, 2901, 3371, 4289, 5956, 6217, 6256, 6260, 6270, 6325, 6328, 6529, 7005"
t[74] = "792, 793, 794, 795, 796, 797, 798, 799, 1839, 1840, 3602, 3603"
t[78] = "1194, 2130, 2131, 2132, 2134, 2139, 2479, 2480"
t[151] = "159, 2512, 2516, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[152] = "159, 2512, 2516, 2947, 3111, 4540"
t[190] = "2117, 2119, 2120, 2121, 2122, 2123, 2124, 2125, 2126, 2127, 3599, 3600"
t[258] = "159, 1179, 1205, 1645, 1708, 2593, 2594, 2595, 2596, 2723, 8766"
t[295] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 8766, 8932"
t[384] = "2414, 5655, 5656, 18776, 18777, 18778"
t[465] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 1939, 2070, 2593, 2594, 2595, 2596, 2723, 3927, 8766, 8932"
t[894] = "4536, 4537, 4538, 4539, 4602, 8953"
t[896] = "796, 797, 798, 799, 843, 844, 845, 846, 1839, 1840, 1843, 1844"
t[955] = "159, 1179, 1205, 1645, 1708, 2593, 2594, 2595, 2596, 2723, 8766"
t[958] = "858, 954, 955, 1180, 1181, 2455, 3012, 3013, 3371, 3372, 5565, 8925, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 18256, 21177"
t[959] = "792, 793, 794, 795, 3602, 3603"
t[1198] = "2506, 2507, 2512, 2515, 5439, 11303, 11362"
t[1213] = "2129, 2379, 2380, 2381, 2383, 2384, 2385, 17184"
t[1249] = "1201, 2392, 2393, 2394, 2395, 2396, 2397, 17186"
t[1250] = "159, 2320, 2324, 2512, 2516, 2604, 2678, 2880, 2901, 2946, 2947, 3111, 3131, 3371, 4289, 4470, 4471, 4496, 4498, 5042, 5956, 6217, 6256, 6260, 6272, 6529, 7005"
t[1645] = "2520, 2521, 2522, 2523, 2524, 2525, 2526, 2527"
t[1650] = "4470"
t[2046] = "1201, 2392, 2393, 2394, 2395, 2396, 2397, 17186"
t[3935] = "117, 2287, 3770, 3771, 4599, 8952"
t[3937] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[6367] = "8485, 8486, 8487, 8488"
t[6373] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331"
t[6374] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353, 16354, 16355, 16356, 16357, 16358, 16359, 16360, 16361, 16362, 16363, 16364, 163"
t[11038] = "159, 1179, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 4604, 4605, 4606, 4607, 4608, 8766, 8948, 11284, 11285, 15326, 15327"
t[11536] = "13482, 13724, 13810, 13813"
t[12384] = "4604, 4605, 4606, 4607, 4608, 8948, 15902"
t[12941] = "2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 6217, 6256, 6530, 6532, 7005, 8343, 8925, 15756"
t[277] = "1941, 2593, 2594, 2595, 2596, 2723"
t[340] = "728, 2697, 2698, 2699, 2700, 2701, 2889, 3678, 3679, 3680, 3681, 3682, 3683"
t[483] = "414, 422, 1707, 2070, 3927, 8932"
t[1257] = "858, 3371, 3372, 5565, 8925, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 18256, 21177"
t[1275] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[1285] = "159, 1179, 1205, 1645, 1708, 2512, 2515, 2516, 2519, 2946, 2947, 3030, 3033, 3107, 3108, 3111, 3131, 3135, 3137, 4470, 4471, 4496, 4497, 4498, 4540, 5042, 5048, 11284, 11285, 15326, 15327"
t[1286] = "2320, 2321, 2324, 2325, 2604, 2605, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6260, 6529, 6530, 6532, 7005, 8343, 8925"
t[1287] = "851, 852, 853, 854, 922, 923, 924, 925, 926, 927, 928, 1196, 1197, 1198, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2101, 2207, 2208, 2209, 2512, 2515, 3030, 7371, 11362, 15807, 15808, 15809"
t[1289] = "851, 852, 853, 854, 922, 923, 924, 925, 926, 927, 928, 1196, 1197, 1198, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2207, 2208, 2209, 15810, 15811"
t[1291] = "200, 201, 202, 203, 792, 793, 794, 795, 837, 838, 839, 840, 3428, 3589, 3590, 3597, 3598, 3602, 3603, 16059, 16060"
t[1294] = "847, 285, 286, 287, 718, 848, 849, 850, 1845, 1846, 1852, 1853, 2392, 2393, 2394, 2395, 2396, 2397"
t[1295] = "236, 237, 238, 239, 796, 797, 798, 799, 843, 844, 845, 846, 1839, 1840, 1843, 1844, 1849, 1850"
t[1297] = "2504, 2505, 2506, 2507, 2509, 2511, 2512, 2515, 2516, 2519, 3023, 3024, 3026, 3027, 3030, 3033, 5439, 5441, 11284, 11362"
t[1298] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11303, 11306, 11307, 11362"
t[1299] = "3426, 3427, 3428, 13896, 13897, 13898"
t[1301] = "2593, 2594, 2595, 2596, 2723"
t[1302] = "785, 2449, 2453, 3355, 3356, 3357, 3419, 3420, 3421, 3422, 3423, 3424"
t[1303] = "2665, 3419, 3420, 3421, 3422, 3423, 3424"
t[1304] = "5740, 18649"
t[1305] = "2593, 2594, 2595, 2596, 2723"
t[1307] = "929, 3385, 4824, 4825, 4826, 4827, 4828, 4829, 5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[1308] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[1309] = "2612, 2613, 2614, 2615, 2616, 2617, 2618"
t[1310] = "3889, 3890, 3891, 3892, 3893, 3894"
t[1311] = "2593, 2594, 2595, 2596, 2723"
t[1312] = "5208, 5209, 5210, 5211, 5236, 5238, 5239, 5347"
t[1313] = "765, 785, 2447, 2449, 2453, 3355, 3356, 3357, 3371, 3372, 8925, 9301, 18256"
t[1314] = "2141, 2142, 2143, 2144, 2145, 2146, 2156, 2158, 2159, 2160, 2429, 2431, 2432, 2434, 2435, 2437, 2438, 2440, 2463, 2464, 2465, 2467, 2468, 2469, 2470, 2471, 2472, 2473, 2474, 2475, 3587, 3588, 3591, 3592, 3593, 3594, 3889, 3890, 3892, 3893"
t[1315] = "2527, 2535"
t[1316] = "954, 955, 1180, 1181, 1478, 1711, 1712, 2290, 3012, 3013, 10647, 10648"
t[1318] = "4470, 6217, 6342, 10938, 10940, 11291, 22307"
t[1319] = "2445, 2446, 2448, 2451, 17188, 17189, 17190, 17192"
t[1320] = "2463, 2464, 2465, 2467, 2468, 2469, 2470, 2471, 2472, 2473, 2474, 2475, 3890, 3893"
t[1321] = "4496, 4497, 4498, 4499"
t[1323] = "2148, 2149, 2150, 2151, 2152, 2153, 2417, 2418, 2419, 2420, 2421, 2422, 2423, 2424, 2425, 2426, 2427, 2428, 2446, 2448, 2451, 3891, 3894, 8088, 8089, 8090, 8091, 8092, 8093, 8094, 17189, 17190, 17192"
t[1324] = "2520, 2526, 2528, 2534"
t[1325] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[1326] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[1328] = "159, 1179, 1205, 1645, 1708, 2593, 2594, 2595, 2596, 2723, 8766"
t[1333] = "2521, 2523, 2525, 2529, 2531, 2533"
t[1339] = "2420, 2426, 2432, 2438, 2467, 2473"
t[1341] = "285, 286, 287, 718, 1852, 1853, 2148, 2149, 2150, 2151, 2152, 2153"
t[1347] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 6274, 8343, 10290, 10325, 14341"
t[1348] = "852, 854, 924, 925, 928, 1197, 2026, 2028, 2030, 2492, 2493"
t[1349] = "2148, 2149, 2150, 2151, 2152, 2153, 2417, 2418, 2419, 2420, 2421, 2422, 2423, 2424, 2425, 2426, 2427, 2428, 2446, 2448, 2451, 3891, 3894, 8088, 8089, 8090, 8091, 8092, 8093, 8094, 17189, 17190, 17192"
t[1350] = "2612, 2613, 2614, 2615, 2616, 2617, 2618"
t[1351] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[3518] = "4540, 4541, 4542, 4544, 4601, 8950"
t[4981] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 8766, 8932"
t[5193] = "5976"
t[5483] = "159, 2678, 2692, 3713, 21099, 21219"
t[5494] = "6256, 6325, 6330, 6365, 6368, 6529, 6530, 6532, 6533"
t[5503] = "3371, 3372, 8925, 22250"
t[5509] = "2522, 2523, 2530, 2531"
t[5510] = "2508, 2509, 2510, 2516, 2519, 5441"
t[5512] = "2880, 2901, 3466, 3857, 5956, 12162, 18567"
t[5514] = "2880, 2901, 3466, 3857"
t[5519] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648"
t[5520] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353, 16354, 16355, 16356, 16357, 16358, 16359, 16360, 16361, 16362, 16363, 16364, 163"
t[5565] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 10290, 14341"
t[6740] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[8666] = "8489"
t[12805] = "15196, 16342, 18440, 18441, 18442, 18443, 18444, 18445, 18447, 18448, 18449, 18452, 18453, 18456, 18457, 18664, 18854, 18856, 18857, 18858, 18859, 18862, 18864"
t[3312] = "117, 2287, 3770, 3771, 4599, 8952"
t[3313] = "159, 1179, 1205, 1645, 1708, 2512, 2515, 2516, 2519, 2946, 2947, 3030, 3033, 3107, 3108, 3111, 3131, 3135, 3137, 4470, 4471, 4496, 4497, 4498, 4540, 5042, 5048, 11284, 11285, 15326, 15327"
t[3314] = "851, 852, 853, 854, 1194, 1196, 1197, 1198, 2130, 2131, 2132, 2134, 2139, 2207, 2479, 2480, 2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[3315] = "2141, 2142, 2143, 2144, 2145, 2146, 2156, 2158, 2159, 2160, 2429, 2431, 2432, 2434, 2435, 2437, 2438, 2440, 2463, 2464, 2465, 2467, 2468, 2469, 2470, 2471, 2472, 2473, 2474, 2475, 2612, 2613, 2614, 2615, 2616, 2617, 2618, 3587, 3588, 3591, 3592, 3593, 359"
t[3316] = "2141, 2142, 2143, 2144, 2145, 2146, 2156, 2158, 2159, 2160, 2429, 2431, 2432, 2434, 2435, 2437, 2438, 2440, 2463, 2464, 2465, 2467, 2468, 2469, 2470, 2471, 2472, 2473, 2474, 2475, 3587, 3588, 3591, 3592, 3593, 3594, 3889, 3890, 3892, 3893, 12256"
t[3317] = "200, 201, 202, 203, 837, 838, 839, 840, 2364, 2366, 2367, 2369, 3428, 3589, 3590, 3597, 3598, 3606, 3607, 16059, 16060"
t[3319] = "285, 286, 287, 718, 847, 848, 849, 850, 1202, 1845, 1846, 1852, 1853, 2376, 2398, 2399, 2400, 2401, 2402, 2403, 2445, 17185, 17187, 17188"
t[3321] = "236, 237, 238, 239, 843, 844, 845, 846, 1843, 1844, 1849, 1850, 2370, 2371, 2372, 2373, 2374, 2375"
t[3322] = "2509, 2511, 2516, 2519, 3023, 3024, 3033, 5441, 11284"
t[3323] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[3329] = "4604, 4605, 4606, 4607, 4608, 8948"
t[3330] = "2527, 2535"
t[3331] = "851, 922, 923, 1198, 2024, 2027, 2207, 2208, 2209, 2520, 2526, 2528, 2534"
t[3333] = "6256, 6365, 6368, 6369, 6529, 6530, 6532, 6533, 17062"
t[3334] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[3335] = "5565, 5640, 5643, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[3342] = "4536, 4537, 4538, 4539, 4602, 8953"
t[3346] = "4470, 6217, 6342, 6346, 6349, 10938, 10940, 11291, 22307"
t[3348] = "5642, 13478, 3371, 3372, 5642, 8925, 13478, 18256"
t[3349] = "2527, 2535"
t[3350] = "159, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327"
t[3351] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[3356] = "2880, 2901, 3466, 3857, 5956, 12162, 18567"
t[3358] = "2880, 2901, 3466, 3857"
t[3359] = "6523, 6524, 6525, 6526"
t[3360] = "852, 854, 924, 925, 928, 1197, 2026, 2028, 2030"
t[3361] = "851, 922, 923, 1198, 2024, 2027, 2207, 2208, 2209, 2520, 2526, 2528, 2534, 15903, 15904, 15905, 15906, 15907, 15909"
t[3362] = "1132, 5665, 5668, 18796, 18797, 18798"
t[3364] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 5772, 6260, 6261, 6270, 6274, 8343, 10290, 10314, 10317, 14341"
t[3366] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 10290, 14341, 18731"
t[3367] = "2320, 2321, 2324, 2325, 2604, 2605, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6260, 6529, 6530, 6532, 7005, 8343, 8925"
t[3368] = "117, 2287, 3770, 3771, 4599, 8952"
t[3369] = "4496, 4497, 4498, 4499"
t[3400] = "159, 2678, 2692, 3713, 21099, 21219"
t[3405] = "3371, 3372, 8925, 22250"
t[3409] = "853, 854, 926, 927, 928, 1196, 2025, 2029, 2030, 2495, 2507, 2512, 2515, 2946, 2947, 3026, 3107, 3108, 3111, 3131, 3135, 3137, 5439, 11362, 15326, 15327"
t[3410] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11303, 11306, 11307, 11362"
t[3413] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648, 16041, 16042, 18647"
t[4043] = "2521, 2523, 2525, 2529, 2531, 2533"
t[5188] = "5976"
t[5611] = "117, 159, 1179, 1205, 1645, 1708, 2287, 2593, 2594, 2595, 2596, 2723, 3770, 3771, 4599, 8766, 8952"
t[5812] = "285, 286, 287, 718, 847, 848, 849, 850, 1845, 1846, 1852, 1853, 2148, 2149, 2150, 2151, 2152, 2153, 2392, 2393, 2394, 2395, 2396, 2397, 2417, 2418, 2419, 2420, 2421, 2422, 2423, 2424, 2425, 2426, 2427, 2428, 2446, 2448, 2451, 3891, 3894, 8088, 8089, 8090,"
t[5815] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353, 16354, 16355, 16356, 16357, 16358, 16359, 16360, 16361, 16362, 16363, 16364, 163"
t[5816] = "5208, 5209, 5210, 5211, 5236, 5238, 5239, 5347"
t[5817] = "2320, 2321, 2324, 2325, 2604, 2605, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6260, 6529, 6530, 6532, 7005, 8343, 8925"
t[8404] = "10360, 10361, 10392"
t[12799] = "15197, 15200, 16335, 16341, 16486, 16532, 18427, 18428, 18429, 18430, 18432, 18437, 18461, 18675, 18834, 18845, 18850, 18852"
t[4256] = "2880, 2901, 3466, 3857"
t[4259] = "2880, 2901, 3466, 3857, 5956, 18567"
t[5049] = "5976"
t[5100] = "2320, 2321, 2324, 2678, 2692, 2880, 2901, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4399, 4400, 5956, 6217, 6530, 6532"
t[5101] = "159, 1205, 1645, 1708, 2515, 2519, 3030, 3033, 3107, 3108, 3135, 3137, 4470, 4471, 4497, 4498, 11284, 11285, 15326, 15327"
t[5102] = "1194, 2130, 2131, 2132, 2134, 2139, 2479, 2480, 2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[5103] = "851, 852, 853, 854, 1196, 1197, 1198, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2207, 2208"
t[5106] = "1201, 2392, 2393, 2394, 2395, 2396, 2397, 17186"
t[5107] = "847, 848, 849, 850, 1202, 1845, 1846, 17187"
t[5108] = "837, 838, 839, 840, 843, 844, 845, 846, 1843, 1844, 3428, 3589, 3590, 16059, 16060"
t[5109] = "4540, 4541, 4542, 4544, 4601, 8950"
t[5110] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[5111] = "117, 159, 1179, 1205, 1645, 1708, 2287, 2593, 2594, 2595, 2596, 2723, 3770, 3771, 4599, 8766, 8952"
t[5112] = "159, 1179, 1205, 1645, 1708, 2593, 2594, 2595, 2596, 2723, 8766"
t[5119] = "853, 926, 927, 1196, 2025, 2029, 2522, 2523, 2530, 2531"
t[5120] = "851, 922, 923, 1198, 2024, 2027, 2207, 2208, 2209, 2520, 2521, 2526, 2528, 2529, 2534, 2946, 2947, 3107, 3108, 3111, 3131, 3135, 3137, 15326, 15327"
t[5121] = "852, 854, 924, 925, 928, 1197, 2026, 2028, 2030, 2524, 2525, 2527, 2532, 2533, 2535"
t[5122] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11303, 11306, 11307, 11362"
t[5123] = "2509, 2510, 2516, 2519, 3023, 3024, 3033, 5441, 11284"
t[5124] = "117, 2287, 3770, 3771, 4599, 8952"
t[5125] = "285, 286, 287, 718, 1852, 1853, 2148, 2149, 2150, 2151, 2152, 2153, 2417, 2418, 2419, 2420, 2421, 2422, 2448, 3891, 17189"
t[5126] = "2423, 2424, 2425, 2426, 2427, 2428, 2445, 2446, 2448, 2451, 3894, 8088, 8089, 8090, 8091, 8092, 8093, 8094, 17188, 17189, 17190, 17192"
t[5128] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 8343, 10290, 14341, 18731"
t[5129] = "2435, 2437, 2438, 2440, 2463, 2464, 2465, 2467, 2468, 2469, 2470, 2471, 2472, 2473, 2474, 2475, 3587, 3588, 3890, 3892, 3893"
t[5132] = "4496, 4497, 4498, 4499"
t[5133] = "5208, 5209, 5210, 5211, 5236, 5238, 5239, 5347"
t[5138] = "3371, 3372, 8925, 22250"
t[5140] = "159, 1179, 1205, 1645, 1708, 2593, 2594, 2595, 2596, 2723, 8766"
t[5151] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[5152] = "2524, 2525, 2527, 2532, 2533, 2535"
t[5154] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 8343, 10290, 14341"
t[5155] = "200, 201, 202, 203, 2429, 2431, 2432, 2434, 2435, 2437, 2438, 2440, 3587, 3588, 3593, 3594, 3597, 3598, 3889, 3892"
t[5156] = "2612, 2613, 2614, 2615, 2616, 2617, 2618"
t[5158] = "4470, 6217, 6342, 6349, 10938, 10940, 11291, 22307"
t[5160] = "159, 2678, 2692, 3713, 21099, 21219"
t[5162] = "6256, 6326, 6328, 6365, 6369, 6529, 6530, 6532, 6533, 17062"
t[5163] = "2320, 2321, 2324, 2678, 2692, 2880, 2901, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4399, 4400, 5956, 6217, 6530, 6532"
t[5169] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[5170] = "2520, 2521, 2526, 2528, 2529, 2534"
t[5175] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 7560, 10647, 10648, 16041, 16042, 18649"
t[5178] = "3371, 3372, 5642, 8925, 13478, 18256"
t[5569] = "5740"
t[5570] = "2593, 2594, 2595, 2596, 2723, 4600"
t[6382] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353, 16354, 16355, 16356, 16357, 16358, 16359, 16360, 16361, 16362, 16363, 16364, 163"
t[7976] = "2101, 2509, 2511, 2512, 2515, 2516, 2519, 3030, 5441, 7371, 11362, 15807, 15808, 15809, 15903, 15904, 15905, 15906, 15907, 15909"
t[7978] = "4536, 4537, 4538, 4539, 4602, 8953"
t[8681] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 8343, 10290, 10314, 10317, 10321, 10323, 10326, 14341"
t[9099] = "8950"
t[2997] = "851, 852, 853, 854, 1194, 1196, 1197, 1198, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2130, 2131, 2132, 2134, 2139, 2207, 2208, 2479, 2480, 2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495, 2509, 2511, 2516, 2519, 5441"
t[2999] = "2880, 2901, 3466, 3857, 5956, 18567"
t[3002] = "2880, 2901, 3466, 3857"
t[3003] = "4540, 4541, 4542, 4544, 4601, 8950"
t[3005] = "7005, 2320, 2321, 2324, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 5771, 5772, 6260, 6261, 7005, 8343, 10290, 10311, 10325, 14341"
t[3010] = "3371, 3372, 8925, 18256"
t[3012] = "4470, 6217, 6342, 6349, 6377, 10938, 10940, 11291, 22307"
t[3014] = "3371, 3372, 3419, 3420, 3421, 3422, 3423, 3424, 8925, 18256"
t[3015] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11303, 11306, 11307, 11362"
t[3016] = "4496, 4497, 4498"
t[3017] = "4536, 4537, 4538, 4539, 4602, 8953"
t[3018] = "2509, 2510, 2511, 2516, 2519, 3023, 3024, 3033, 5441, 11284"
t[3019] = "853, 926, 927, 1196, 2025, 2029, 2522, 2523, 2530, 2531, 12249"
t[3020] = "852, 854, 924, 925, 928, 1197, 2026, 2028, 2030"
t[3021] = "851, 922, 923, 1198, 2024, 2027, 2207, 2208, 2209, 2520, 2526, 2528, 2534"
t[3022] = "2527, 2535"
t[3023] = "6523, 6524, 6525, 6526"
t[3025] = "117, 2287, 3770, 3771, 4599, 8952"
t[3027] = "159, 2678, 2692, 3713, 6328, 6330, 21099, 21219"
t[3029] = "6256, 6325, 6330, 6365, 6529, 6530, 6532, 6533"
t[3092] = "200, 201, 202, 203, 792, 793, 794, 795, 837, 838, 839, 840, 2156, 2158, 2159, 2160, 2429, 2431, 2432, 2434, 2435, 2437, 2438, 2440, 2612, 2613, 2614, 2615, 2616, 2617, 2618, 3587, 3588, 3589, 3590, 3591, 3592, 3593, 3594, 3597, 3598, 3602, 3603, 3889, 389"
t[3093] = "236, 237, 238, 239, 843, 844, 845, 846, 1843, 1844, 1849, 1850, 2370, 2371, 2372, 2373, 2374, 2375"
t[3095] = "2148, 2149, 2150, 2151, 2152, 2153, 2417, 2418, 2419, 2420, 2421, 2422, 2423, 2424, 2425, 2426, 2427, 2428, 2446, 2448, 2451, 3891, 3894, 8088, 8089, 8090, 8091, 8092, 8093, 8094, 17189, 17190, 17192"
t[5189] = "5976"
t[6746] = "159, 414, 422, 1179, 1205, 1645, 1707, 1708, 2070, 3927, 8766, 8932"
t[8358] = "200, 201, 202, 203, 837, 838, 839, 840, 3428, 3589, 3590, 3597, 3598, 16059, 16060"
t[8359] = "236, 237, 238, 239, 843, 844, 845, 846, 1843, 1844, 1849, 1850"
t[8360] = "285, 286, 287, 718, 847, 848, 849, 850, 1202, 1845, 1846, 1852, 1853, 2445, 17187, 17188"
t[8361] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[8362] = "159, 1179, 1205, 1645, 1708, 2512, 2515, 2516, 2519, 2946, 2947, 3030, 3033, 3107, 3108, 3111, 3131, 3135, 3137, 4470, 4471, 4496, 4497, 4498, 4540, 5042, 5048, 11284, 11285, 15326, 15327"
t[8363] = "2320, 2321, 2324, 2325, 2604, 2605, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6260, 6529, 6530, 6532, 7005, 8343, 8925"
t[8364] = "4496, 4497, 4498, 4499"
t[8398] = "2521, 2523, 2525, 2529, 2531, 2533"
t[8401] = "10394"
t[9087] = "11020, 11022"
t[3561] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[3562] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[4164] = "792, 793, 794, 795, 796, 797, 798, 799, 837, 838, 839, 840, 843, 844, 845, 846, 847, 848, 849, 850, 1839, 1840, 1843, 1844, 1845, 1846, 2392, 2393, 2394, 2395, 2396, 2397, 3589, 3590, 3602, 3603"
t[4167] = "159, 1179, 1205, 1645, 1708, 8766, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[4168] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 6260, 6261, 6272, 6275, 8343, 10290, 10311, 14341"
t[4169] = "117, 159, 1179, 1205, 1645, 1708, 2287, 3770, 3771, 4599, 8766, 8952"
t[4170] = "159, 1179, 1205, 2512, 2515, 2516, 2519, 2946, 2947, 3030, 3033, 3107, 3108, 3111, 3131, 3135, 3137, 4470, 4471, 4496, 4497, 4498, 5042, 5048"
t[4171] = "851, 922, 923, 1198, 2024, 2027, 2207, 2208, 2209, 2520, 2526, 2528, 2534"
t[4172] = "2612, 2613, 2614, 2615, 2616, 2617, 2618"
t[4173] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11303, 11306, 11308, 11362"
t[4175] = "200, 201, 202, 203, 792, 793, 794, 795, 837, 838, 839, 840, 2117, 2119, 2120, 2121, 2156, 2158, 2159, 2160, 2429, 2431, 2432, 2434, 2435, 2437, 2438, 2440, 3587, 3588, 3589, 3590, 3591, 3592, 3593, 3594, 3597, 3598, 3599, 3600, 3602, 3603, 3889, 3892, 122"
t[4177] = "285, 286, 287, 718, 847, 848, 849, 850, 1845, 1846, 1852, 1853, 2148, 2149, 2150, 2151, 2152, 2153, 2379, 2380, 2381, 2383, 2384, 2385, 2392, 2393, 2394, 2395, 2396, 2397, 2417, 2418, 2419, 2420, 2421, 2422, 2423, 2424, 2425, 2426, 2427, 2428, 2448, 2451,"
t[4180] = "2521, 2523, 2525, 2529, 2531, 2533"
t[4181] = "159, 1179, 1205, 1645, 1708, 8766, 16166, 16167, 16168, 16169, 16170, 21030, 21031, 21033"
t[4203] = "851, 852, 853, 854, 922, 923, 924, 925, 926, 927, 928, 1196, 1197, 1198, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2207, 2208, 2209, 2507, 2512, 2515, 2946, 2947, 3026, 3107, 3108, 3111, 3131, 3135, 3137, 5439, 11362, 15326, 15327, 15903, 15904, 15905, 15"
t[4216] = "3371, 3372, 8925, 22250"
t[4217] = "11020, 11022"
t[4220] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[4221] = "787, 4592, 4593, 4594, 8957, 21552"
t[4222] = "6256, 6365, 6529, 6530, 6532, 6533"
t[4223] = "159, 2678, 2692, 3713, 21099, 21219"
t[4225] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 7451, 8343, 10290, 14341, 18949"
t[4226] = "3371, 3372, 5642, 5643, 8925, 13477, 18256"
t[4228] = "4470, 6217, 6342, 10938, 10940, 11291, 22307"
t[4229] = "2320, 2321, 2324, 2325, 2604, 2605, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6260, 6529, 6530, 6532, 7005, 8343, 8925, 11223, 16217"
t[4230] = "4496, 4497, 4498, 4499"
t[4231] = "851, 852, 853, 854, 1194, 1196, 1197, 1198, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2130, 2131, 2132, 2134, 2139, 2207, 2208, 2479, 2480, 2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[4232] = "853, 926, 927, 1196, 2025, 2029, 2522, 2523, 2530, 2531, 12249"
t[4233] = "852, 854, 924, 925, 928, 1197, 2026, 2028, 2030"
t[4234] = "2527, 2535"
t[4235] = "2946, 2947, 3107, 3108, 3111, 3131, 3135, 3137, 12247, 15326, 15327"
t[4236] = "236, 237, 238, 239, 796, 797, 798, 799, 843, 844, 845, 846, 1839, 1840, 1843, 1844, 1849, 1850, 2122, 2123, 2124, 2125, 2126, 2127, 2141, 2142, 2143, 2144, 2145, 2146, 2463, 2464, 2465, 2467, 2468, 2469, 2470, 2471, 2472, 2473, 2474, 2475, 3890, 3893"
t[4240] = "1201, 2129, 2445, 2446, 2448, 2451, 17184, 17186, 17188, 17189, 17190, 17192"
t[4241] = "159, 1179, 2512, 2515, 2516, 2519, 2946, 2947, 3111, 3131, 4470, 4471, 4496, 4498, 5042"
t[4730] = "8629, 8631, 8632, 18766, 18767, 18902"
t[5191] = "5976"
t[6735] = "159, 1179, 1205, 1645, 1708, 4536, 4537, 4538, 4539, 4602, 8766, 8953"
t[8665] = "8500, 8501"
t[4553] = "159, 2678, 2692, 3713, 6330, 6368, 21099, 21219"
t[4554] = "159, 1179, 1205, 1645, 1708, 4604, 4605, 4606, 4607, 4608, 8766, 8948"
t[4555] = "159, 1179, 1205, 1645, 1708, 2512, 2515, 2516, 2519, 2946, 3030, 3033, 3107, 3108, 3131, 3135, 3137, 4470, 4471, 4496, 4497, 4498, 5048, 8766, 11284, 11285, 15326, 15327"
t[4556] = "1194, 2130, 2131, 2132, 2134, 2139, 2479, 2480, 2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495"
t[4557] = "851, 852, 853, 854, 1196, 1197, 1198, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2207, 2208"
t[4558] = "85, 193, 194, 195, 209, 210, 711, 714, 837, 838, 839, 840, 843, 844, 845, 846, 1835, 1836, 1843, 1844, 2364, 2366, 2367, 2369, 2370, 2371, 2372, 2373, 2374, 2375, 3428, 3589, 3590, 3595, 3596, 3606, 3607, 16059, 16060"
t[4559] = "1200, 1202, 2376, 2386, 2387, 2388, 2389, 2390, 2391, 2398, 2399, 2400, 2401, 2402, 2403, 17183, 17185, 17187"
t[4560] = "847, 848, 849, 850, 1202, 1845, 1846, 17187"
t[4561] = "2320, 2321, 2324, 2325, 2604, 2605, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 5956, 6217, 6256, 6260, 6529, 6530, 6532, 7005, 8343, 8925, 16217"
t[4562] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[4569] = "851, 922, 923, 1198, 2024, 2027, 2207, 2208, 2209"
t[4570] = "2527, 2535"
t[4571] = "159, 1179, 1205, 1645, 1708, 4604, 4605, 4606, 4607, 4608, 8766, 8948"
t[4574] = "6256, 6325, 6328, 6365, 6369, 6529, 6530, 6532, 6533, 17062"
t[4575] = "5565, 16583, 17020, 17021, 17026, 17028, 17029, 17030, 17031, 17032, 17033, 17034, 17035, 17036, 17037, 17038, 21177"
t[4577] = "2320, 2321, 2324, 2325, 2604, 2605, 4291, 4340, 4341, 4342, 5772, 6260, 6261, 6275, 8343, 10290, 10321, 10323, 10326, 14341"
t[4580] = "2612, 2613, 2614, 2615, 2616, 2617, 2618"
t[4581] = "954, 955, 1180, 1181, 1478, 1711, 1712, 2290, 3012, 3013, 10647, 10648"
t[4585] = "2928, 2930, 3371, 3372, 5060, 5140, 5173, 8923, 8924, 8925"
t[4587] = "2880, 2901, 3466, 4357, 4361, 4363, 4364, 4371, 4382, 4389, 4399, 4400, 4404, 5956, 10647, 10648"
t[4589] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 7451, 8343, 10290, 14341, 18949"
t[4590] = "4496, 4497, 4498, 4499"
t[4592] = "2946, 2947, 3107, 3108, 3111, 3131, 3135, 3137, 15326, 15327"
t[4597] = "2880, 2901, 3466, 3857, 5956, 18567"
t[4599] = "2880, 2901, 3466, 3857"
t[4600] = "2520, 2521, 2523, 2525, 2526, 2528, 2529, 2531, 2533, 2534"
t[4601] = "853, 926, 927, 1196, 2025, 2029, 15810, 15811"
t[4602] = "852, 854, 924, 925, 928, 1197, 2026, 2028, 2030, 2101, 2512, 2515, 3030, 7371, 11362, 15807, 15808, 15809"
t[4603] = "2509, 2510, 2516, 2519, 3023, 3024, 3033, 5441, 11284"
t[4604] = "2512, 2515, 3026, 3027, 3030, 5439, 11285, 11303, 11306, 11307, 11362"
t[4610] = "3371, 3372, 8925, 9301, 13477, 18256"
t[4615] = "3371, 3372, 8925, 22250"
t[4617] = "4470, 6217, 6342, 10938, 10940, 11291, 22307"
t[4775] = "2320, 2321, 2324, 2604, 2605, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4399, 4400, 5956, 6217, 6256, 6260, 6529, 6530, 6532, 7005"
t[5190] = "5976"
t[5753] = "16302, 16316, 16317, 16318, 16319, 16320, 16321, 16322, 16323, 16324, 16325, 16326, 16327, 16328, 16329, 16330, 16331, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353, 16354, 16355, 16356, 16357, 16358, 16359, 16360, 16361, 16362, 16363, 16364, 163"
t[5754] = "5208, 5209, 5210, 5211, 5236, 5238, 5239, 5347"
t[5819] = "285, 286, 287, 718, 847, 848, 849, 850, 1845, 1846, 1852, 1853, 2148, 2149, 2150, 2151, 2152, 2153, 2392, 2393, 2394, 2395, 2396, 2397, 2417, 2418, 2419, 2420, 2421, 2422, 2423, 2424, 2425, 2426, 2427, 2428, 2446, 2448, 2451, 3891, 3894, 8088, 8089, 8090,"
t[5820] = "236, 237, 238, 239, 796, 797, 798, 799, 843, 844, 845, 846, 1839, 1840, 1843, 1844, 1849, 1850, 2141, 2142, 2143, 2144, 2145, 2146, 2463, 2464, 2465, 2467, 2468, 2469, 2470, 2471, 2472, 2473, 2474, 2475, 3890, 3893"
t[5821] = "200, 201, 202, 203, 792, 793, 794, 795, 837, 838, 839, 840, 2156, 2158, 2159, 2160, 2429, 2431, 2432, 2434, 2435, 2437, 2438, 2440, 3587, 3588, 3589, 3590, 3591, 3592, 3593, 3594, 3597, 3598, 3602, 3603, 3889, 3892, 13896, 13897, 13898"
t[8403] = "10393"
t[6731] = "2320, 2321, 2325, 2604, 2605, 4289, 4291, 4340, 4341, 4342, 6260, 6261, 7005, 7361, 8343, 10290, 14341"
t[11557] = "2320"
t[8678] = "2880, 2901, 3466, 4399, 4400, 5956, 10607, 10647, 10648"
t[12957] = "2320, 2321, 2325, 2604, 2678, 2692, 2880, 2901, 2928, 3371, 3372, 3466, 3713, 3857, 4289, 4291, 4340, 4341, 4342, 4399, 4400, 6217, 6256, 6530, 6532, 7005, 8343, 8925"
t[11287] = "159, 1179, 1205, 1645, 1708, 4540, 4541, 4542, 4544, 4601, 8766, 8950"
t[3528] = "847, 848, 849, 850, 1202, 1845, 1846, 17187"
t[2264] = "795"
t[14337] = "2880, 2901, 3466, 4357, 4364, 4399, 4400, 5956, 10647, 10648"
t[3578] = "2880, 2901, 3466, 3857"


data["items"] = { }
local t = data["items"]

t[2417] = {
	name = L["Augmented Chain Vest"],
	quality = 1,
	icon = "inv_chest_plate12",
	buyPrice = 15673,
	sellPrice = 3134,
	reqLevel = 32,
}
t[2418] = {
	name = L["Augmented Chain Leggings"],
	quality = 1,
	icon = "inv_pants_03",
	buyPrice = 15731,
	sellPrice = 3146,
	reqLevel = 32,
}
t[2419] = {
	name = L["Augmented Chain Belt"],
	quality = 1,
	icon = "inv_belt_03",
	buyPrice = 7894,
	sellPrice = 1578,
	reqLevel = 32,
}
t[2420] = {
	name = L["Augmented Chain Boots"],
	quality = 1,
	icon = "inv_boots_01",
	buyPrice = 11937,
	sellPrice = 2387,
	reqLevel = 32,
}
t[2421] = {
	name = L["Augmented Chain Bracers"],
	quality = 1,
	icon = "inv_bracer_07",
	buyPrice = 7952,
	sellPrice = 1590,
	reqLevel = 32,
}
t[2422] = {
	name = L["Augmented Chain Gloves"],
	quality = 1,
	icon = "inv_gauntlets_04",
	buyPrice = 7981,
	sellPrice = 1596,
	reqLevel = 32,
}
t[2448] = {
	name = L["Heavy Pavise"],
	quality = 1,
	icon = "inv_shield_03",
	buyPrice = 16158,
	sellPrice = 3231,
	reqLevel = 32,
}
t[3891] = {
	name = L["Augmented Chain Helm"],
	quality = 1,
	icon = "inv_helmet_03",
	buyPrice = 12284,
	sellPrice = 2456,
	reqLevel = 32,
}
t[17189] = {
	name = L["Metal Buckler"],
	quality = 1,
	icon = "inv_shield_10",
	buyPrice = 12043,
	sellPrice = 2408,
	reqLevel = 29,
}
t[159] = {
	name = L["Refreshing Spring Water"],
	quality = 1,
	icon = "inv_drink_07",
	buyPrice = 25,
	sellPrice = 1,
	reqLevel = 1,
}
t[1179] = {
	name = L["Ice Cold Milk"],
	quality = 1,
	icon = "inv_drink_milk_01",
	buyPrice = 125,
	sellPrice = 6,
	reqLevel = 5,
}
t[1205] = {
	name = L["Melon Juice"],
	quality = 1,
	icon = "inv_drink_09",
	buyPrice = 500,
	sellPrice = 25,
	reqLevel = 15,
}
t[1645] = {
	name = L["Moonberry Juice"],
	quality = 1,
	icon = "inv_drink_02",
	buyPrice = 2000,
	sellPrice = 100,
	reqLevel = 35,
}
t[1708] = {
	name = L["Sweet Nectar"],
	quality = 1,
	icon = "inv_drink_12",
	buyPrice = 1000,
	sellPrice = 50,
	reqLevel = 25,
}
t[4604] = {
	name = L["Forest Mushroom Cap"],
	quality = 1,
	icon = "inv_mushroom_13",
	buyPrice = 25,
	sellPrice = 1,
	reqLevel = 1,
}
t[4605] = {
	name = L["Red-speckled Mushroom"],
	quality = 1,
	icon = "inv_mushroom_11",
	buyPrice = 125,
	sellPrice = 6,
	reqLevel = 5,
}
t[4606] = {
	name = L["Spongy Morel"],
	quality = 1,
	icon = "inv_mushroom_08",
	buyPrice = 500,
	sellPrice = 25,
	reqLevel = 15,
}
t[4607] = {
	name = L["Delicious Cave Mold"],
	quality = 1,
	icon = "inv_misc_herb_06",
	buyPrice = 1000,
	sellPrice = 50,
	reqLevel = 25,
}
t[4608] = {
	name = L["Raw Black Truffle"],
	quality = 1,
	icon = "inv_mushroom_03",
	buyPrice = 2000,
	sellPrice = 100,
	reqLevel = 35,
}
t[8766] = {
	name = L["Morning Glory Dew"],
	quality = 1,
	icon = "inv_potion_01",
	buyPrice = 4000,
	sellPrice = 200,
	reqLevel = 45,
}
t[8948] = {
	name = L["Dried King Bolete"],
	quality = 1,
	icon = "inv_mushroom_05",
	buyPrice = 4000,
	sellPrice = 200,
	reqLevel = 45,
}
t[12233] = {
	name = L["Recipe: Mystery Stew"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 3000,
	sellPrice = 750,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Mystery Stew"],
	learnedAt = 175,
}
t[12240] = {
	name = L["Recipe: Heavy Kodo Stew"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 7000,
	sellPrice = 1750,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Heavy Kodo Stew"],
	learnedAt = 200,
}
t[2524] = {
	name = L["Truncheon"],
	quality = 1,
	icon = "inv_mace_11",
	buyPrice = 19192,
	sellPrice = 3838,
	reqLevel = 29,
}
t[2525] = {
	name = L["War Hammer"],
	quality = 1,
	icon = "inv_hammer_03",
	buyPrice = 26489,
	sellPrice = 5297,
	reqLevel = 30,
}
t[2527] = {
	name = L["Battle Staff"],
	quality = 1,
	icon = "inv_wand_07",
	buyPrice = 29356,
	sellPrice = 5871,
	reqLevel = 31,
}
t[2532] = {
	name = L["Morning Star"],
	quality = 1,
	icon = "inv_mace_12",
	buyPrice = 52608,
	sellPrice = 10521,
	reqLevel = 41,
}
t[2533] = {
	name = L["War Maul"],
	quality = 1,
	icon = "inv_hammer_17",
	buyPrice = 61107,
	sellPrice = 12221,
	reqLevel = 40,
}
t[2535] = {
	name = L["War Staff"],
	quality = 1,
	icon = "inv_staff_14",
	buyPrice = 61556,
	sellPrice = 12311,
	reqLevel = 40,
}
t[10858] = {
	name = L["Plans: Solid Iron Maul"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 3000,
	sellPrice = 750,
	reqLevel = 0,
	profession = L["Blacksmithing"],
	teaches = L["Solid Iron Maul"],
	learnedAt = 155,
}
t[2320] = {
	name = L["Coarse Thread"],
	quality = 1,
	icon = "inv_fabric_linen_03",
	buyPrice = 10,
	sellPrice = 2,
	reqLevel = 0,
}
t[2321] = {
	name = L["Fine Thread"],
	quality = 1,
	icon = "inv_fabric_wool_02",
	buyPrice = 100,
	sellPrice = 25,
	reqLevel = 0,
}
t[2324] = {
	name = L["Bleach"],
	quality = 1,
	icon = "inv_drink_12",
	buyPrice = 25,
	sellPrice = 6,
	reqLevel = 0,
}
t[2325] = {
	name = L["Black Dye"],
	quality = 1,
	icon = "inv_potion_63",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
}
t[2604] = {
	name = L["Red Dye"],
	quality = 1,
	icon = "inv_potion_11",
	buyPrice = 50,
	sellPrice = 12,
	reqLevel = 0,
}
t[2678] = {
	name = L["Mild Spices"],
	quality = 1,
	icon = "inv_misc_food_wheat_02",
	buyPrice = 10,
	sellPrice = 0,
	reqLevel = 0,
}
t[2692] = {
	name = L["Hot Spices"],
	quality = 1,
	icon = "inv_misc_food_wheat_02",
	buyPrice = 40,
	sellPrice = 10,
	reqLevel = 0,
}
t[2880] = {
	name = L["Weak Flux"],
	quality = 1,
	icon = "inv_misc_ammo_gunpowder_02",
	buyPrice = 100,
	sellPrice = 25,
	reqLevel = 0,
}
t[2901] = {
	name = L["Mining Pick"],
	quality = 1,
	icon = "inv_pick_02",
	buyPrice = 81,
	sellPrice = 16,
	reqLevel = 1,
}
t[2928] = {
	name = L["Dust of Decay"],
	quality = 1,
	icon = "inv_misc_dust_02",
	buyPrice = 20,
	sellPrice = 5,
	reqLevel = 0,
}
t[3371] = {
	name = L["Empty Vial"],
	quality = 1,
	icon = "inv_drink_06",
	buyPrice = 20,
	sellPrice = 1,
	reqLevel = 0,
}
t[3372] = {
	name = L["Leaded Vial"],
	quality = 1,
	icon = "inv_drink_06",
	buyPrice = 200,
	sellPrice = 10,
	reqLevel = 0,
}
t[3466] = {
	name = L["Strong Flux"],
	quality = 1,
	icon = "inv_misc_ammo_gunpowder_01",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
}
t[3713] = {
	name = L["Soothing Spices"],
	quality = 1,
	icon = "inv_misc_food_wheat_02",
	buyPrice = 160,
	sellPrice = 40,
	reqLevel = 0,
}
t[3857] = {
	name = L["Coal"],
	quality = 1,
	icon = "inv_ore_tin_01",
	buyPrice = 500,
	sellPrice = 125,
	reqLevel = 0,
}
t[4289] = {
	name = L["Salt"],
	quality = 1,
	icon = "inv_misc_dust_02",
	buyPrice = 50,
	sellPrice = 12,
	reqLevel = 0,
}
t[4291] = {
	name = L["Silken Thread"],
	quality = 1,
	icon = "inv_fabric_silk_02",
	buyPrice = 500,
	sellPrice = 125,
	reqLevel = 0,
}
t[4340] = {
	name = L["Gray Dye"],
	quality = 1,
	icon = "inv_drink_10",
	buyPrice = 350,
	sellPrice = 87,
	reqLevel = 0,
}
t[4341] = {
	name = L["Yellow Dye"],
	quality = 1,
	icon = "inv_potion_12",
	buyPrice = 500,
	sellPrice = 125,
	reqLevel = 0,
}
t[4342] = {
	name = L["Purple Dye"],
	quality = 1,
	icon = "inv_potion_02",
	buyPrice = 2500,
	sellPrice = 625,
	reqLevel = 0,
}
t[4399] = {
	name = L["Wooden Stock"],
	quality = 1,
	icon = "inv_mace_11",
	buyPrice = 200,
	sellPrice = 50,
	reqLevel = 0,
}
t[4400] = {
	name = L["Heavy Stock"],
	quality = 1,
	icon = "inv_mace_11",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
}
t[5956] = {
	name = L["Blacksmith Hammer"],
	quality = 1,
	icon = "inv_hammer_20",
	buyPrice = 18,
	sellPrice = 3,
	reqLevel = 1,
}
t[6217] = {
	name = L["Copper Rod"],
	quality = 1,
	icon = "inv_misc_flute_01",
	buyPrice = 124,
	sellPrice = 24,
	reqLevel = 0,
}
t[6256] = {
	name = L["Fishing Pole"],
	quality = 1,
	icon = "inv_fishingpole_02",
	buyPrice = 23,
	sellPrice = 4,
	reqLevel = 0,
}
t[6529] = {
	name = L["Shiny Bauble"],
	quality = 1,
	icon = "inv_misc_orb_03",
	buyPrice = 50,
	sellPrice = 12,
	reqLevel = 0,
}
t[6530] = {
	name = L["Nightcrawlers"],
	quality = 1,
	icon = "inv_misc_monstertail_03",
	buyPrice = 100,
	sellPrice = 25,
	reqLevel = 0,
}
t[6532] = {
	name = L["Bright Baubles"],
	quality = 1,
	icon = "inv_misc_gem_variety_02",
	buyPrice = 250,
	sellPrice = 62,
	reqLevel = 0,
}
t[7005] = {
	name = L["Skinning Knife"],
	quality = 1,
	icon = "inv_weapon_shortblade_01",
	buyPrice = 82,
	sellPrice = 16,
	reqLevel = 1,
}
t[7114] = {
	name = L["Pattern: Azure Silk Gloves"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
	profession = L["Tailoring"],
	teaches = L["Azure Silk Gloves"],
	learnedAt = 145,
}
t[8343] = {
	name = L["Heavy Silken Thread"],
	quality = 1,
	icon = "inv_fabric_silk_02",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
}
t[8925] = {
	name = L["Crystal Vial"],
	quality = 1,
	icon = "inv_drink_06",
	buyPrice = 2500,
	sellPrice = 125,
	reqLevel = 0,
}
t[12232] = {
	name = L["Recipe: Carrion Surprise"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 5000,
	sellPrice = 1250,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Carrion Surprise"],
	learnedAt = 175,
}
t[4540] = {
	name = L["Tough Hunk of Bread"],
	quality = 1,
	icon = "inv_misc_food_11",
	buyPrice = 25,
	sellPrice = 1,
	reqLevel = 1,
}
t[4541] = {
	name = L["Freshly Baked Bread"],
	quality = 1,
	icon = "inv_misc_food_12",
	buyPrice = 125,
	sellPrice = 6,
	reqLevel = 5,
}
t[4542] = {
	name = L["Moist Cornbread"],
	quality = 1,
	icon = "inv_misc_food_08",
	buyPrice = 500,
	sellPrice = 25,
	reqLevel = 15,
}
t[4544] = {
	name = L["Mulgore Spice Bread"],
	quality = 1,
	icon = "inv_misc_food_11",
	buyPrice = 1000,
	sellPrice = 50,
	reqLevel = 25,
}
t[4601] = {
	name = L["Soft Banana Bread"],
	quality = 1,
	icon = "inv_misc_food_09",
	buyPrice = 2000,
	sellPrice = 100,
	reqLevel = 35,
}
t[8950] = {
	name = L["Homemade Cherry Pie"],
	quality = 1,
	icon = "inv_misc_food_10",
	buyPrice = 4000,
	sellPrice = 200,
	reqLevel = 45,
}
t[414] = {
	name = L["Dalaran Sharp"],
	quality = 1,
	icon = "inv_misc_food_39",
	buyPrice = 125,
	sellPrice = 6,
	reqLevel = 5,
}
t[422] = {
	name = L["Dwarven Mild"],
	quality = 1,
	icon = "inv_misc_food_07",
	buyPrice = 500,
	sellPrice = 25,
	reqLevel = 15,
}
t[1707] = {
	name = L["Stormwind Brie"],
	quality = 1,
	icon = "inv_misc_food_38",
	buyPrice = 1000,
	sellPrice = 62,
	reqLevel = 25,
}
t[2070] = {
	name = L["Darnassian Bleu"],
	quality = 1,
	icon = "inv_misc_food_06",
	buyPrice = 25,
	sellPrice = 1,
	reqLevel = 1,
}
t[3927] = {
	name = L["Fine Aged Cheddar"],
	quality = 1,
	icon = "inv_misc_food_03",
	buyPrice = 2000,
	sellPrice = 150,
	reqLevel = 35,
}
t[8932] = {
	name = L["Alterac Swiss"],
	quality = 1,
	icon = "inv_misc_food_37",
	buyPrice = 4000,
	sellPrice = 200,
	reqLevel = 45,
}
t[2512] = {
	name = L["Rough Arrow"],
	quality = 1,
	icon = "inv_ammo_arrow_02",
	buyPrice = 10,
	sellPrice = 0,
	reqLevel = 1,
}
t[2515] = {
	name = L["Sharp Arrow"],
	quality = 1,
	icon = "inv_ammo_arrow_02",
	buyPrice = 50,
	sellPrice = 0,
	reqLevel = 10,
}
t[2516] = {
	name = L["Light Shot"],
	quality = 1,
	icon = "inv_ammo_bullet_02",
	buyPrice = 10,
	sellPrice = 0,
	reqLevel = 1,
}
t[2519] = {
	name = L["Heavy Shot"],
	quality = 1,
	icon = "inv_ammo_bullet_02",
	buyPrice = 50,
	sellPrice = 0,
	reqLevel = 10,
}
t[2946] = {
	name = L["Balanced Throwing Dagger"],
	quality = 1,
	icon = "inv_weapon_shortblade_05",
	buyPrice = 30,
	sellPrice = 0,
	reqLevel = 3,
}
t[3030] = {
	name = L["Razor Arrow"],
	quality = 1,
	icon = "inv_ammo_arrow_02",
	buyPrice = 300,
	sellPrice = 0,
	reqLevel = 25,
}
t[3033] = {
	name = L["Solid Shot"],
	quality = 1,
	icon = "inv_ammo_bullet_02",
	buyPrice = 300,
	sellPrice = 0,
	reqLevel = 25,
}
t[3107] = {
	name = L["Keen Throwing Knife"],
	quality = 1,
	icon = "inv_throwingknife_01",
	buyPrice = 75,
	sellPrice = 0,
	reqLevel = 11,
}
t[3108] = {
	name = L["Heavy Throwing Dagger"],
	quality = 1,
	icon = "inv_throwingknife_03",
	buyPrice = 200,
	sellPrice = 0,
	reqLevel = 22,
}
t[3131] = {
	name = L["Weighted Throwing Axe"],
	quality = 1,
	icon = "inv_throwingaxe_03",
	buyPrice = 30,
	sellPrice = 0,
	reqLevel = 3,
}
t[3135] = {
	name = L["Sharp Throwing Axe"],
	quality = 1,
	icon = "inv_throwingaxe_01",
	buyPrice = 75,
	sellPrice = 0,
	reqLevel = 11,
}
t[3137] = {
	name = L["Deadly Throwing Axe"],
	quality = 1,
	icon = "inv_throwingaxe_05",
	buyPrice = 200,
	sellPrice = 0,
	reqLevel = 22,
}
t[4470] = {
	name = L["Simple Wood"],
	quality = 1,
	icon = "inv_tradeskillitem_01",
	buyPrice = 38,
	sellPrice = 9,
	reqLevel = 0,
}
t[4471] = {
	name = L["Flint and Tinder"],
	quality = 1,
	icon = "inv_stone_11",
	buyPrice = 135,
	sellPrice = 33,
	reqLevel = 0,
}
t[4496] = {
	name = L["Small Brown Pouch"],
	quality = 1,
	icon = "inv_misc_bag_09",
	buyPrice = 500,
	sellPrice = 125,
	reqLevel = 0,
}
t[4497] = {
	name = L["Heavy Brown Bag"],
	quality = 1,
	icon = "inv_misc_bag_10",
	buyPrice = 20000,
	sellPrice = 5000,
	reqLevel = 0,
}
t[4498] = {
	name = L["Brown Leather Satchel"],
	quality = 1,
	icon = "inv_misc_bag_09",
	buyPrice = 2500,
	sellPrice = 625,
	reqLevel = 0,
}
t[5048] = {
	name = L["Blue Ribboned Wrapping Paper"],
	quality = 1,
	icon = "inv_misc_giftwrap_03",
	buyPrice = 50,
	sellPrice = 12,
	reqLevel = 0,
}
t[11284] = {
	name = L["Accurate Slugs"],
	quality = 1,
	icon = "inv_ammo_bullet_01",
	buyPrice = 1000,
	sellPrice = 1,
	reqLevel = 40,
}
t[11285] = {
	name = L["Jagged Arrow"],
	quality = 1,
	icon = "inv_weapon_shortblade_25",
	buyPrice = 1000,
	sellPrice = 2,
	reqLevel = 40,
}
t[15326] = {
	name = L["Gleaming Throwing Axe"],
	quality = 1,
	icon = "inv_throwingaxe_06",
	buyPrice = 800,
	sellPrice = 1,
	reqLevel = 35,
}
t[15327] = {
	name = L["Wicked Throwing Dagger"],
	quality = 1,
	icon = "inv_throwingknife_03",
	buyPrice = 800,
	sellPrice = 1,
	reqLevel = 35,
}
t[6365] = {
	name = L["Strong Fishing Pole"],
	quality = 1,
	icon = "inv_fishingpole_02",
	buyPrice = 901,
	sellPrice = 180,
	reqLevel = 5,
}
t[6533] = {
	name = L["Aquadynamic Fish Attractor"],
	quality = 1,
	icon = "inv_misc_food_26",
	buyPrice = 250,
	sellPrice = 62,
	reqLevel = 0,
}
t[6369] = {
	name = L["Recipe: Rockscale Cod"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 2200,
	sellPrice = 550,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Rockscale Cod"],
	learnedAt = 175,
}
t[16072] = {
	name = L["Expert Cookbook"],
	quality = 1,
	icon = "inv_misc_book_08",
	buyPrice = 10000,
	sellPrice = 2500,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Cooking"],
	learnedAt = 125,
}
t[17062] = {
	name = L["Recipe: Mithril Head Trout"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 2200,
	sellPrice = 550,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Mithril Headed Trout"],
	learnedAt = 175,
}
t[21099] = {
	name = L["Recipe: Smoked Sagefish"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 500,
	sellPrice = 125,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Smoked Sagefish"],
	learnedAt = 80,
}
t[21219] = {
	name = L["Recipe: Sagefish Delight"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 5000,
	sellPrice = 1250,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Sagefish Delight"],
	learnedAt = 175,
}
t[2522] = {
	name = L["Crescent Axe"],
	quality = 1,
	icon = "inv_throwingaxe_01",
	buyPrice = 22548,
	sellPrice = 4509,
	reqLevel = 30,
}
t[2523] = {
	name = L["Bullova"],
	quality = 1,
	icon = "inv_weapon_halberd_06",
	buyPrice = 28285,
	sellPrice = 5657,
	reqLevel = 30,
}
t[2530] = {
	name = L["Francisca"],
	quality = 1,
	icon = "inv_axe_01",
	buyPrice = 52219,
	sellPrice = 10443,
	reqLevel = 41,
}
t[2531] = {
	name = L["Great Axe"],
	quality = 1,
	icon = "inv_throwingaxe_06",
	buyPrice = 56169,
	sellPrice = 11233,
	reqLevel = 39,
}
t[12249] = {
	name = L["Merciless Axe"],
	quality = 2,
	icon = "inv_axe_17",
	buyPrice = 30195,
	sellPrice = 6039,
	reqLevel = 26,
}
t[12250] = {
	name = L["Midnight Axe"],
	quality = 2,
	icon = "inv_axe_17",
	buyPrice = 40341,
	sellPrice = 8068,
	reqLevel = 29,
}
t[1710] = {
	name = L["Greater Healing Potion"],
	quality = 1,
	icon = "inv_potion_52",
	buyPrice = 500,
	sellPrice = 125,
	reqLevel = 21,
}
t[3735] = {
	name = L["Recipe: Hot Lion Chops"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1800,
	sellPrice = 450,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Hot Lion Chops"],
	learnedAt = 125,
}
t[3827] = {
	name = L["Mana Potion"],
	quality = 1,
	icon = "inv_potion_72",
	buyPrice = 480,
	sellPrice = 120,
	reqLevel = 22,
}
t[5489] = {
	name = L["Recipe: Lean Venison"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1200,
	sellPrice = 300,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Lean Venison"],
	learnedAt = 110,
}
t[12228] = {
	name = L["Recipe: Roast Raptor"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 5000,
	sellPrice = 1250,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Roast Raptor"],
	learnedAt = 175,
}
t[12231] = {
	name = L["Recipe: Jungle Stew"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 3000,
	sellPrice = 750,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Jungle Stew"],
	learnedAt = 175,
}
t[1477] = {
	name = L["Scroll of Agility II"],
	quality = 1,
	icon = "inv_scroll_02",
	buyPrice = 350,
	sellPrice = 87,
	reqLevel = 25,
}
t[1711] = {
	name = L["Scroll of Stamina II"],
	quality = 1,
	icon = "inv_scroll_07",
	buyPrice = 300,
	sellPrice = 75,
	reqLevel = 20,
}
t[2289] = {
	name = L["Scroll of Strength II"],
	quality = 1,
	icon = "inv_scroll_02",
	buyPrice = 350,
	sellPrice = 87,
	reqLevel = 25,
}
t[2290] = {
	name = L["Scroll of Intellect II"],
	quality = 1,
	icon = "inv_scroll_01",
	buyPrice = 300,
	sellPrice = 75,
	reqLevel = 20,
}
t[3734] = {
	name = L["Recipe: Big Bear Steak"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1600,
	sellPrice = 400,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Big Bear Steak"],
	learnedAt = 110,
}
t[4421] = {
	name = L["Scroll of Protection III"],
	quality = 1,
	icon = "inv_scroll_07",
	buyPrice = 400,
	sellPrice = 100,
	reqLevel = 30,
}
t[4424] = {
	name = L["Scroll of Spirit III"],
	quality = 1,
	icon = "inv_scroll_01",
	buyPrice = 400,
	sellPrice = 100,
	reqLevel = 30,
}
t[4609] = {
	name = L["Recipe: Barbecued Buzzard Wing"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Barbecued Buzzard Wing"],
	learnedAt = 175,
}
t[12227] = {
	name = L["Recipe: Lean Wolf Steak"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1600,
	sellPrice = 400,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Lean Wolf Steak"],
	learnedAt = 125,
}
t[12229] = {
	name = L["Recipe: Hot Wolf Ribs"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 5000,
	sellPrice = 1250,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Hot Wolf Ribs"],
	learnedAt = 175,
}
t[12239] = {
	name = L["Recipe: Dragonbreath Chili"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 7000,
	sellPrice = 1750,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Dragonbreath Chili"],
	learnedAt = 200,
}
t[2507] = {
	name = L["Laminated Recurve Bow"],
	quality = 1,
	icon = "inv_weapon_bow_01",
	buyPrice = 1751,
	sellPrice = 350,
	reqLevel = 11,
}
t[3026] = {
	name = L["Reinforced Bow"],
	quality = 1,
	icon = "inv_weapon_bow_02",
	buyPrice = 3812,
	sellPrice = 762,
	reqLevel = 16,
}
t[5439] = {
	name = L["Small Quiver"],
	quality = 1,
	icon = "inv_misc_quiver_09",
	buyPrice = 100,
	sellPrice = 25,
	reqLevel = 1,
}
t[11305] = {
	name = L["Dense Shortbow"],
	quality = 2,
	icon = "inv_weapon_bow_07",
	buyPrice = 25814,
	sellPrice = 5162,
	reqLevel = 30,
}
t[11362] = {
	name = L["Medium Quiver"],
	quality = 1,
	icon = "inv_misc_quiver_10",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 10,
}
t[200] = {
	name = L["Thick Cloth Vest"],
	quality = 1,
	icon = "inv_shirt_02",
	buyPrice = 2270,
	sellPrice = 454,
	reqLevel = 17,
}
t[201] = {
	name = L["Thick Cloth Pants"],
	quality = 1,
	icon = "inv_pants_12",
	buyPrice = 2278,
	sellPrice = 455,
	reqLevel = 17,
}
t[202] = {
	name = L["Thick Cloth Shoes"],
	quality = 1,
	icon = "inv_boots_05",
	buyPrice = 1714,
	sellPrice = 342,
	reqLevel = 17,
}
t[203] = {
	name = L["Thick Cloth Gloves"],
	quality = 1,
	icon = "inv_gauntlets_21",
	buyPrice = 1147,
	sellPrice = 229,
	reqLevel = 17,
}
t[792] = {
	name = L["Knitted Sandals"],
	quality = 1,
	icon = "inv_boots_fabric_01",
	buyPrice = 207,
	sellPrice = 41,
	reqLevel = 5,
}
t[793] = {
	name = L["Knitted Gloves"],
	quality = 1,
	icon = "inv_gauntlets_18",
	buyPrice = 139,
	sellPrice = 27,
	reqLevel = 5,
}
t[794] = {
	name = L["Knitted Pants"],
	quality = 1,
	icon = "inv_pants_11",
	buyPrice = 279,
	sellPrice = 55,
	reqLevel = 5,
}
t[795] = {
	name = L["Knitted Tunic"],
	quality = 1,
	icon = "inv_shirt_10",
	buyPrice = 280,
	sellPrice = 56,
	reqLevel = 5,
}
t[837] = {
	name = L["Heavy Weave Armor"],
	quality = 1,
	icon = "inv_shirt_06",
	buyPrice = 1124,
	sellPrice = 224,
	reqLevel = 12,
}
t[838] = {
	name = L["Heavy Weave Pants"],
	quality = 1,
	icon = "inv_pants_14",
	buyPrice = 1128,
	sellPrice = 225,
	reqLevel = 12,
}
t[839] = {
	name = L["Heavy Weave Gloves"],
	quality = 1,
	icon = "inv_gauntlets_18",
	buyPrice = 566,
	sellPrice = 113,
	reqLevel = 12,
}
t[840] = {
	name = L["Heavy Weave Shoes"],
	quality = 1,
	icon = "inv_boots_05",
	buyPrice = 853,
	sellPrice = 170,
	reqLevel = 12,
}
t[2156] = {
	name = L["Padded Boots"],
	quality = 1,
	icon = "inv_boots_09",
	buyPrice = 3077,
	sellPrice = 615,
	reqLevel = 22,
}
t[2158] = {
	name = L["Padded Gloves"],
	quality = 1,
	icon = "inv_gauntlets_23",
	buyPrice = 2066,
	sellPrice = 413,
	reqLevel = 22,
}
t[2159] = {
	name = L["Padded Pants"],
	quality = 1,
	icon = "inv_pants_07",
	buyPrice = 4148,
	sellPrice = 829,
	reqLevel = 22,
}
t[2160] = {
	name = L["Padded Armor"],
	quality = 1,
	icon = "inv_shirt_02",
	buyPrice = 4163,
	sellPrice = 832,
	reqLevel = 22,
}
t[3589] = {
	name = L["Heavy Weave Belt"],
	quality = 1,
	icon = "inv_belt_25",
	buyPrice = 576,
	sellPrice = 115,
	reqLevel = 12,
}
t[3590] = {
	name = L["Heavy Weave Bracers"],
	quality = 1,
	icon = "inv_bracer_06",
	buyPrice = 578,
	sellPrice = 115,
	reqLevel = 12,
}
t[3591] = {
	name = L["Padded Belt"],
	quality = 1,
	icon = "inv_belt_06",
	buyPrice = 2097,
	sellPrice = 419,
	reqLevel = 22,
}
t[3592] = {
	name = L["Padded Bracers"],
	quality = 1,
	icon = "inv_bracer_11",
	buyPrice = 2104,
	sellPrice = 420,
	reqLevel = 22,
}
t[3597] = {
	name = L["Thick Cloth Belt"],
	quality = 1,
	icon = "inv_belt_06",
	buyPrice = 1081,
	sellPrice = 216,
	reqLevel = 17,
}
t[3598] = {
	name = L["Thick Cloth Bracers"],
	quality = 1,
	icon = "inv_bracer_11",
	buyPrice = 1085,
	sellPrice = 217,
	reqLevel = 17,
}
t[3602] = {
	name = L["Knitted Belt"],
	quality = 1,
	icon = "inv_belt_06",
	buyPrice = 145,
	sellPrice = 29,
	reqLevel = 5,
}
t[3603] = {
	name = L["Knitted Bracers"],
	quality = 1,
	icon = "inv_bracer_03",
	buyPrice = 145,
	sellPrice = 29,
	reqLevel = 5,
}
t[236] = {
	name = L["Cured Leather Armor"],
	quality = 1,
	icon = "inv_chest_leather_10",
	buyPrice = 2795,
	sellPrice = 559,
	reqLevel = 17,
}
t[237] = {
	name = L["Cured Leather Pants"],
	quality = 1,
	icon = "inv_pants_06",
	buyPrice = 2805,
	sellPrice = 561,
	reqLevel = 17,
}
t[238] = {
	name = L["Cured Leather Boots"],
	quality = 1,
	icon = "inv_boots_03",
	buyPrice = 2112,
	sellPrice = 422,
	reqLevel = 17,
}
t[239] = {
	name = L["Cured Leather Gloves"],
	quality = 1,
	icon = "inv_gauntlets_21",
	buyPrice = 1413,
	sellPrice = 282,
	reqLevel = 17,
}
t[796] = {
	name = L["Rough Leather Boots"],
	quality = 1,
	icon = "inv_boots_09",
	buyPrice = 264,
	sellPrice = 52,
	reqLevel = 5,
}
t[797] = {
	name = L["Rough Leather Gloves"],
	quality = 1,
	icon = "inv_gauntlets_18",
	buyPrice = 176,
	sellPrice = 35,
	reqLevel = 5,
}
t[798] = {
	name = L["Rough Leather Pants"],
	quality = 1,
	icon = "inv_pants_09",
	buyPrice = 354,
	sellPrice = 70,
	reqLevel = 5,
}
t[799] = {
	name = L["Rough Leather Vest"],
	quality = 1,
	icon = "inv_chest_wolf",
	buyPrice = 355,
	sellPrice = 71,
	reqLevel = 5,
}
t[843] = {
	name = L["Tanned Leather Boots"],
	quality = 1,
	icon = "inv_boots_wolf",
	buyPrice = 1077,
	sellPrice = 215,
	reqLevel = 12,
}
t[844] = {
	name = L["Tanned Leather Gloves"],
	quality = 1,
	icon = "inv_gauntlets_05",
	buyPrice = 720,
	sellPrice = 144,
	reqLevel = 12,
}
t[845] = {
	name = L["Tanned Leather Pants"],
	quality = 1,
	icon = "inv_pants_wolf",
	buyPrice = 1447,
	sellPrice = 289,
	reqLevel = 12,
}
t[846] = {
	name = L["Tanned Leather Jerkin"],
	quality = 1,
	icon = "inv_chest_wolf",
	buyPrice = 1452,
	sellPrice = 290,
	reqLevel = 12,
}
t[1839] = {
	name = L["Rough Leather Belt"],
	quality = 1,
	icon = "inv_belt_26",
	buyPrice = 184,
	sellPrice = 36,
	reqLevel = 5,
}
t[1840] = {
	name = L["Rough Leather Bracers"],
	quality = 1,
	icon = "inv_bracer_02",
	buyPrice = 185,
	sellPrice = 37,
	reqLevel = 5,
}
t[1843] = {
	name = L["Tanned Leather Belt"],
	quality = 1,
	icon = "inv_belt_23",
	buyPrice = 725,
	sellPrice = 145,
	reqLevel = 12,
}
t[1844] = {
	name = L["Tanned Leather Bracers"],
	quality = 1,
	icon = "inv_bracer_08",
	buyPrice = 728,
	sellPrice = 145,
	reqLevel = 12,
}
t[1849] = {
	name = L["Cured Leather Belt"],
	quality = 1,
	icon = "inv_belt_06",
	buyPrice = 1388,
	sellPrice = 277,
	reqLevel = 17,
}
t[1850] = {
	name = L["Cured Leather Bracers"],
	quality = 1,
	icon = "inv_bracer_04",
	buyPrice = 1393,
	sellPrice = 278,
	reqLevel = 17,
}
t[2141] = {
	name = L["Cuirboulli Vest"],
	quality = 1,
	icon = "inv_chest_leather_09",
	buyPrice = 5223,
	sellPrice = 1044,
	reqLevel = 22,
}
t[2142] = {
	name = L["Cuirboulli Belt"],
	quality = 1,
	icon = "inv_belt_24",
	buyPrice = 2620,
	sellPrice = 524,
	reqLevel = 22,
}
t[2143] = {
	name = L["Cuirboulli Boots"],
	quality = 1,
	icon = "inv_boots_07",
	buyPrice = 3944,
	sellPrice = 788,
	reqLevel = 22,
}
t[2144] = {
	name = L["Cuirboulli Bracers"],
	quality = 1,
	icon = "inv_bracer_04",
	buyPrice = 2639,
	sellPrice = 527,
	reqLevel = 22,
}
t[2145] = {
	name = L["Cuirboulli Gloves"],
	quality = 1,
	icon = "inv_gauntlets_21",
	buyPrice = 2648,
	sellPrice = 529,
	reqLevel = 22,
}
t[2146] = {
	name = L["Cuirboulli Pants"],
	quality = 1,
	icon = "inv_pants_09",
	buyPrice = 4809,
	sellPrice = 961,
	reqLevel = 22,
}
t[11039] = {
	name = L["Formula: Enchant Cloak - Minor Agility"],
	quality = 2,
	icon = "inv_misc_note_01",
	buyPrice = 800,
	sellPrice = 200,
	reqLevel = 0,
	profession = L["Enchanting"],
	teaches = L["Enchant Cloak - Minor Agility"],
	learnedAt = 110,
}
t[11101] = {
	name = L["Formula: Enchant Bracer - Lesser Strength"],
	quality = 2,
	icon = "inv_misc_note_01",
	buyPrice = 2500,
	sellPrice = 625,
	reqLevel = 0,
	profession = L["Enchanting"],
	teaches = L["Enchant Bracer - Lesser Strength"],
	learnedAt = 140,
}
t[929] = {
	name = L["Healing Potion"],
	quality = 1,
	icon = "inv_potion_51",
	buyPrice = 300,
	sellPrice = 75,
	reqLevel = 12,
}
t[3385] = {
	name = L["Lesser Mana Potion"],
	quality = 1,
	icon = "inv_potion_71",
	buyPrice = 120,
	sellPrice = 30,
	reqLevel = 14,
}
t[6054] = {
	name = L["Recipe: Shadow Protection Potion"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 900,
	sellPrice = 225,
	reqLevel = 0,
	profession = L["Alchemy"],
	teaches = L["Shadow Protection Potion"],
	learnedAt = 135,
}
t[18256] = {
	name = L["Imbued Vial"],
	quality = 1,
	icon = "inv_drink_06",
	buyPrice = 30000,
	sellPrice = 1500,
	reqLevel = 0,
}
t[2605] = {
	name = L["Green Dye"],
	quality = 1,
	icon = "inv_potion_12",
	buyPrice = 100,
	sellPrice = 25,
	reqLevel = 0,
}
t[5973] = {
	name = L["Pattern: Barbaric Leggings"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 650,
	sellPrice = 162,
	reqLevel = 0,
	profession = L["Leatherworking"],
	teaches = L["Barbaric Leggings"],
	learnedAt = 170,
}
t[6260] = {
	name = L["Blue Dye"],
	quality = 1,
	icon = "inv_potion_15",
	buyPrice = 50,
	sellPrice = 12,
	reqLevel = 0,
}
t[6261] = {
	name = L["Orange Dye"],
	quality = 1,
	icon = "inv_potion_35",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
}
t[10290] = {
	name = L["Pink Dye"],
	quality = 1,
	icon = "inv_potion_09",
	buyPrice = 2500,
	sellPrice = 625,
	reqLevel = 0,
}
t[14341] = {
	name = L["Rune Thread"],
	quality = 1,
	icon = "spell_shadow_antimagicshell",
	buyPrice = 5000,
	sellPrice = 1250,
	reqLevel = 0,
}
t[117] = {
	name = L["Tough Jerky"],
	quality = 1,
	icon = "inv_misc_food_16",
	buyPrice = 25,
	sellPrice = 1,
	reqLevel = 1,
}
t[2287] = {
	name = L["Haunch of Meat"],
	quality = 1,
	icon = "inv_misc_food_18",
	buyPrice = 125,
	sellPrice = 6,
	reqLevel = 5,
}
t[3770] = {
	name = L["Mutton Chop"],
	quality = 1,
	icon = "inv_misc_food_14",
	buyPrice = 500,
	sellPrice = 25,
	reqLevel = 15,
}
t[3771] = {
	name = L["Wild Hog Shank"],
	quality = 1,
	icon = "inv_misc_food_13",
	buyPrice = 1000,
	sellPrice = 50,
	reqLevel = 25,
}
t[4599] = {
	name = L["Cured Ham Steak"],
	quality = 1,
	icon = "inv_misc_food_14",
	buyPrice = 2000,
	sellPrice = 100,
	reqLevel = 35,
}
t[8952] = {
	name = L["Roasted Quail"],
	quality = 1,
	icon = "inv_misc_food_15",
	buyPrice = 4000,
	sellPrice = 200,
	reqLevel = 45,
}
t[4536] = {
	name = L["Shiny Red Apple"],
	quality = 1,
	icon = "inv_misc_food_19",
	buyPrice = 25,
	sellPrice = 1,
	reqLevel = 1,
}
t[4537] = {
	name = L["Tel'Abim Banana"],
	quality = 1,
	icon = "inv_misc_food_24",
	buyPrice = 125,
	sellPrice = 6,
	reqLevel = 5,
}
t[4538] = {
	name = L["Snapvine Watermelon"],
	quality = 1,
	icon = "inv_misc_food_22",
	buyPrice = 500,
	sellPrice = 25,
	reqLevel = 15,
}
t[4539] = {
	name = L["Goldenbark Apple"],
	quality = 1,
	icon = "inv_misc_food_20",
	buyPrice = 1000,
	sellPrice = 50,
	reqLevel = 25,
}
t[4602] = {
	name = L["Moon Harvest Pumpkin"],
	quality = 1,
	icon = "inv_misc_food_25",
	buyPrice = 2000,
	sellPrice = 100,
	reqLevel = 35,
}
t[8953] = {
	name = L["Deep Fried Plantains"],
	quality = 1,
	icon = "inv_misc_food_23",
	buyPrice = 4000,
	sellPrice = 200,
	reqLevel = 45,
}
t[16166] = {
	name = L["Bean Soup"],
	quality = 1,
	icon = "inv_drink_17",
	buyPrice = 25,
	sellPrice = 1,
	reqLevel = 1,
}
t[16167] = {
	name = L["Versicolor Treat"],
	quality = 1,
	icon = "inv_misc_food_28",
	buyPrice = 125,
	sellPrice = 6,
	reqLevel = 5,
}
t[16168] = {
	name = L["Heaven Peach"],
	quality = 1,
	icon = "inv_misc_food_42",
	buyPrice = 2000,
	sellPrice = 100,
	reqLevel = 35,
}
t[16169] = {
	name = L["Wild Ricecake"],
	quality = 1,
	icon = "inv_misc_food_35",
	buyPrice = 1000,
	sellPrice = 62,
	reqLevel = 25,
}
t[16170] = {
	name = L["Steamed Mandu"],
	quality = 1,
	icon = "inv_misc_food_51",
	buyPrice = 500,
	sellPrice = 25,
	reqLevel = 15,
}
t[21030] = {
	name = L["Darnassus Kimchi Pie"],
	quality = 1,
	icon = "inv_misc_food_10",
	buyPrice = 2000,
	sellPrice = 100,
	reqLevel = 35,
}
t[21031] = {
	name = L["Cabbage Kimchi"],
	quality = 1,
	icon = "inv_misc_food_63",
	buyPrice = 4000,
	sellPrice = 200,
	reqLevel = 45,
}
t[21033] = {
	name = L["Radish Kimchi"],
	quality = 1,
	icon = "inv_misc_food_64",
	buyPrice = 4000,
	sellPrice = 200,
	reqLevel = 45,
}
t[2930] = {
	name = L["Essence of Pain"],
	quality = 1,
	icon = "inv_potion_12",
	buyPrice = 50,
	sellPrice = 12,
	reqLevel = 0,
}
t[5060] = {
	name = L["Thieves' Tools"],
	quality = 1,
	icon = "inv_misc_gear_03",
	buyPrice = 1500,
	sellPrice = 0,
	reqLevel = 15,
}
t[5140] = {
	name = L["Flash Powder"],
	quality = 1,
	icon = "inv_misc_powder_purple",
	buyPrice = 25,
	sellPrice = 6,
	reqLevel = 0,
}
t[5173] = {
	name = L["Deathweed"],
	quality = 1,
	icon = "inv_misc_flower_03",
	buyPrice = 100,
	sellPrice = 25,
	reqLevel = 0,
}
t[8923] = {
	name = L["Essence of Agony"],
	quality = 1,
	icon = "inv_potion_19",
	buyPrice = 200,
	sellPrice = 50,
	reqLevel = 0,
}
t[8924] = {
	name = L["Dust of Deterioration"],
	quality = 1,
	icon = "inv_misc_ammo_gunpowder_01",
	buyPrice = 100,
	sellPrice = 25,
	reqLevel = 0,
}
t[5565] = {
	name = L["Infernal Stone"],
	quality = 1,
	icon = "inv_stone_05",
	buyPrice = 5000,
	sellPrice = 1250,
	reqLevel = 0,
}
t[16583] = {
	name = L["Demonic Figurine"],
	quality = 1,
	icon = "inv_misc_orb_05",
	buyPrice = 10000,
	sellPrice = 2500,
	reqLevel = 0,
}
t[17020] = {
	name = L["Arcane Powder"],
	quality = 1,
	icon = "inv_misc_dust_01",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
}
t[17021] = {
	name = L["Wild Berries"],
	quality = 1,
	icon = "inv_misc_branch_01",
	buyPrice = 700,
	sellPrice = 175,
	reqLevel = 0,
}
t[17026] = {
	name = L["Wild Thornroot"],
	quality = 1,
	icon = "inv_misc_root_01",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
}
t[17028] = {
	name = L["Holy Candle"],
	quality = 1,
	icon = "inv_misc_candle_03",
	buyPrice = 700,
	sellPrice = 175,
	reqLevel = 0,
}
t[17029] = {
	name = L["Sacred Candle"],
	quality = 1,
	icon = "inv_misc_candle_02",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
}
t[17030] = {
	name = L["Ankh"],
	quality = 1,
	icon = "inv_jewelry_talisman_06",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
}
t[17031] = {
	name = L["Rune of Teleportation"],
	quality = 1,
	icon = "inv_misc_rune_06",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
}
t[17032] = {
	name = L["Rune of Portals"],
	quality = 1,
	icon = "inv_misc_rune_08",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
}
t[17033] = {
	name = L["Symbol of Divinity"],
	quality = 1,
	icon = "inv_stone_weightstone_05",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
}
t[17034] = {
	name = L["Maple Seed"],
	quality = 1,
	icon = "inv_misc_food_02",
	buyPrice = 200,
	sellPrice = 50,
	reqLevel = 0,
}
t[17035] = {
	name = L["Stranglethorn Seed"],
	quality = 1,
	icon = "inv_misc_food_02",
	buyPrice = 400,
	sellPrice = 100,
	reqLevel = 0,
}
t[17036] = {
	name = L["Ashwood Seed"],
	quality = 1,
	icon = "inv_misc_food_02",
	buyPrice = 800,
	sellPrice = 200,
	reqLevel = 0,
}
t[17037] = {
	name = L["Hornbeam Seed"],
	quality = 1,
	icon = "inv_misc_food_02",
	buyPrice = 1400,
	sellPrice = 350,
	reqLevel = 0,
}
t[17038] = {
	name = L["Ironwood Seed"],
	quality = 1,
	icon = "inv_misc_food_02",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
}
t[21177] = {
	name = L["Symbol of Kings"],
	quality = 1,
	icon = "inv_misc_symbolofkings_01",
	buyPrice = 3000,
	sellPrice = 37,
	reqLevel = 0,
}
t[2148] = {
	name = L["Polished Scale Belt"],
	quality = 1,
	icon = "inv_belt_04",
	buyPrice = 2907,
	sellPrice = 581,
	reqLevel = 22,
}
t[2149] = {
	name = L["Polished Scale Boots"],
	quality = 1,
	icon = "inv_boots_01",
	buyPrice = 4397,
	sellPrice = 879,
	reqLevel = 22,
}
t[2150] = {
	name = L["Polished Scale Bracers"],
	quality = 1,
	icon = "inv_bracer_03",
	buyPrice = 2930,
	sellPrice = 586,
	reqLevel = 22,
}
t[2151] = {
	name = L["Polished Scale Gloves"],
	quality = 1,
	icon = "inv_gauntlets_04",
	buyPrice = 2941,
	sellPrice = 588,
	reqLevel = 22,
}
t[2152] = {
	name = L["Polished Scale Leggings"],
	quality = 1,
	icon = "inv_pants_03",
	buyPrice = 5906,
	sellPrice = 1181,
	reqLevel = 22,
}
t[2153] = {
	name = L["Polished Scale Vest"],
	quality = 1,
	icon = "inv_chest_chain_09",
	buyPrice = 5927,
	sellPrice = 1185,
	reqLevel = 22,
}
t[2446] = {
	name = L["Kite Shield"],
	quality = 1,
	icon = "inv_shield_06",
	buyPrice = 6182,
	sellPrice = 1236,
	reqLevel = 22,
}
t[17192] = {
	name = L["Reinforced Targe"],
	quality = 1,
	icon = "inv_shield_10",
	buyPrice = 4399,
	sellPrice = 879,
	reqLevel = 19,
}
t[922] = {
	name = L["Dacian Falx"],
	quality = 1,
	icon = "inv_sword_10",
	buyPrice = 12038,
	sellPrice = 2407,
	reqLevel = 21,
}
t[923] = {
	name = L["Longsword"],
	quality = 1,
	icon = "inv_sword_23",
	buyPrice = 8743,
	sellPrice = 1748,
	reqLevel = 21,
}
t[924] = {
	name = L["Maul"],
	quality = 1,
	icon = "inv_hammer_07",
	buyPrice = 10972,
	sellPrice = 2194,
	reqLevel = 21,
}
t[925] = {
	name = L["Flail"],
	quality = 1,
	icon = "inv_mace_01",
	buyPrice = 7797,
	sellPrice = 1559,
	reqLevel = 20,
}
t[926] = {
	name = L["Battle Axe"],
	quality = 1,
	icon = "inv_throwingaxe_05",
	buyPrice = 9784,
	sellPrice = 1956,
	reqLevel = 20,
}
t[927] = {
	name = L["Double Axe"],
	quality = 1,
	icon = "inv_axe_21",
	buyPrice = 6953,
	sellPrice = 1390,
	reqLevel = 19,
}
t[928] = {
	name = L["Long Staff"],
	quality = 1,
	icon = "inv_staff_20",
	buyPrice = 9860,
	sellPrice = 1972,
	reqLevel = 20,
}
t[2209] = {
	name = L["Kris"],
	quality = 1,
	icon = "inv_sword_32",
	buyPrice = 7115,
	sellPrice = 1423,
	reqLevel = 19,
}
t[2520] = {
	name = L["Broadsword"],
	quality = 1,
	icon = "inv_sword_05",
	buyPrice = 24628,
	sellPrice = 4925,
	reqLevel = 31,
}
t[2521] = {
	name = L["Flamberge"],
	quality = 1,
	icon = "inv_sword_26",
	buyPrice = 30896,
	sellPrice = 6179,
	reqLevel = 31,
}
t[2526] = {
	name = L["Main Gauche"],
	quality = 1,
	icon = "inv_weapon_shortblade_15",
	buyPrice = 19336,
	sellPrice = 3867,
	reqLevel = 29,
}
t[787] = {
	name = L["Slitherskin Mackerel"],
	quality = 1,
	icon = "inv_misc_fish_24",
	buyPrice = 25,
	sellPrice = 1,
	reqLevel = 1,
}
t[4592] = {
	name = L["Longjaw Mud Snapper"],
	quality = 1,
	icon = "inv_misc_fish_32",
	buyPrice = 20,
	sellPrice = 1,
	reqLevel = 5,
}
t[4593] = {
	name = L["Bristle Whisker Catfish"],
	quality = 1,
	icon = "inv_misc_fish_30",
	buyPrice = 500,
	sellPrice = 4,
	reqLevel = 15,
}
t[4594] = {
	name = L["Rockscale Cod"],
	quality = 1,
	icon = "inv_misc_fish_04",
	buyPrice = 1000,
	sellPrice = 6,
	reqLevel = 25,
}
t[8957] = {
	name = L["Spinefin Halibut"],
	quality = 1,
	icon = "inv_misc_fish_22",
	buyPrice = 4000,
	sellPrice = 200,
	reqLevel = 45,
}
t[21552] = {
	name = L["Striped Yellowtail"],
	quality = 1,
	icon = "inv_misc_fish_01",
	buyPrice = 2000,
	sellPrice = 5,
	reqLevel = 35,
}
t[20075] = {
	name = L["Recipe: Heavy Crocolisk Stew"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Heavy Crocolisk Stew"],
	learnedAt = 150,
}
t[12251] = {
	name = L["Big Stick"],
	quality = 2,
	icon = "inv_staff_21",
	buyPrice = 53896,
	sellPrice = 10779,
	reqLevel = 32,
}
t[2414] = {
	name = L["Pinto Bridle"],
	quality = 3,
	icon = "ability_mount_ridinghorse",
	buyPrice = 800000,
	sellPrice = 0,
	reqLevel = 40,
}
t[5655] = {
	name = L["Chestnut Mare Bridle"],
	quality = 3,
	icon = "ability_mount_ridinghorse",
	buyPrice = 800000,
	sellPrice = 0,
	reqLevel = 40,
}
t[5656] = {
	name = L["Brown Horse Bridle"],
	quality = 3,
	icon = "ability_mount_ridinghorse",
	buyPrice = 800000,
	sellPrice = 0,
	reqLevel = 40,
}
t[18776] = {
	name = L["Swift Palomino"],
	quality = 4,
	icon = "ability_mount_ridinghorse",
	buyPrice = 10000000,
	sellPrice = 0,
	reqLevel = 60,
}
t[18777] = {
	name = L["Swift Brown Steed"],
	quality = 4,
	icon = "ability_mount_ridinghorse",
	buyPrice = 10000000,
	sellPrice = 0,
	reqLevel = 60,
}
t[18778] = {
	name = L["Swift White Steed"],
	quality = 4,
	icon = "ability_mount_ridinghorse",
	buyPrice = 10000000,
	sellPrice = 0,
	reqLevel = 60,
}
t[12248] = {
	name = L["Daring Dirk"],
	quality = 2,
	icon = "inv_weapon_shortblade_15",
	buyPrice = 32029,
	sellPrice = 6405,
	reqLevel = 29,
}
t[3023] = {
	name = L["Large Bore Blunderbuss"],
	quality = 1,
	icon = "inv_weapon_rifle_03",
	buyPrice = 3771,
	sellPrice = 754,
	reqLevel = 16,
}
t[3024] = {
	name = L["BKP 2700 \"Enforcer\""],
	quality = 1,
	icon = "inv_weapon_rifle_03",
	buyPrice = 7098,
	sellPrice = 1419,
	reqLevel = 21,
}
t[4817] = {
	name = L["Blessed Claymore"],
	quality = 2,
	icon = "inv_sword_13",
	buyPrice = 12311,
	sellPrice = 2462,
	reqLevel = 17,
}
t[4818] = {
	name = L["Executioner's Sword"],
	quality = 2,
	icon = "inv_sword_28",
	buyPrice = 14273,
	sellPrice = 2854,
	reqLevel = 19,
}
t[4824] = {
	name = L["Blurred Axe"],
	quality = 2,
	icon = "inv_axe_14",
	buyPrice = 16856,
	sellPrice = 3371,
	reqLevel = 22,
}
t[4825] = {
	name = L["Callous Axe"],
	quality = 2,
	icon = "inv_axe_21",
	buyPrice = 20472,
	sellPrice = 4094,
	reqLevel = 24,
}
t[4826] = {
	name = L["Marauder Axe"],
	quality = 2,
	icon = "inv_axe_23",
	buyPrice = 15436,
	sellPrice = 3087,
	reqLevel = 21,
}
t[4830] = {
	name = L["Saber Leggings"],
	quality = 2,
	icon = "inv_pants_06",
	buyPrice = 9474,
	sellPrice = 1894,
	reqLevel = 23,
}
t[4831] = {
	name = L["Stalking Pants"],
	quality = 2,
	icon = "inv_pants_10",
	buyPrice = 7858,
	sellPrice = 1571,
	reqLevel = 21,
}
t[4832] = {
	name = L["Mystic Sarong"],
	quality = 2,
	icon = "inv_pants_07",
	buyPrice = 10497,
	sellPrice = 2099,
	reqLevel = 24,
}
t[4833] = {
	name = L["Glorious Shoulders"],
	quality = 2,
	icon = "inv_shoulder_05",
	buyPrice = 8658,
	sellPrice = 1731,
	reqLevel = 23,
}
t[4835] = {
	name = L["Elite Shoulders"],
	quality = 2,
	icon = "inv_shoulder_05",
	buyPrice = 10550,
	sellPrice = 2110,
	reqLevel = 25,
}
t[3027] = {
	name = L["Heavy Recurve Bow"],
	quality = 1,
	icon = "inv_weapon_bow_01",
	buyPrice = 6349,
	sellPrice = 1269,
	reqLevel = 20,
}
t[5789] = {
	name = L["Pattern: Murloc Scale Bracers"],
	quality = 2,
	icon = "inv_scroll_03",
	buyPrice = 2800,
	sellPrice = 700,
	reqLevel = 0,
	profession = L["Leatherworking"],
	teaches = L["Murloc Scale Bracers"],
	learnedAt = 190,
}
t[22250] = {
	name = L["Herb Pouch"],
	quality = 2,
	icon = "inv_misc_bag_herbpouch",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
}
t[4355] = {
	name = L["Pattern: Icy Cloak"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1500,
	sellPrice = 375,
	reqLevel = 0,
	profession = L["Tailoring"],
	teaches = L["Icy Cloak"],
	learnedAt = 200,
}
t[954] = {
	name = L["Scroll of Strength"],
	quality = 1,
	icon = "inv_scroll_02",
	buyPrice = 200,
	sellPrice = 50,
	reqLevel = 10,
}
t[1478] = {
	name = L["Scroll of Protection II"],
	quality = 1,
	icon = "inv_scroll_07",
	buyPrice = 250,
	sellPrice = 62,
	reqLevel = 15,
}
t[1712] = {
	name = L["Scroll of Spirit II"],
	quality = 1,
	icon = "inv_scroll_01",
	buyPrice = 250,
	sellPrice = 62,
	reqLevel = 15,
}
t[3012] = {
	name = L["Scroll of Agility"],
	quality = 1,
	icon = "inv_scroll_02",
	buyPrice = 200,
	sellPrice = 50,
	reqLevel = 10,
}
t[16084] = {
	name = L["Expert First Aid - Under Wraps"],
	quality = 1,
	icon = "inv_misc_book_08",
	buyPrice = 10000,
	sellPrice = 2500,
	reqLevel = 0,
	profession = L["First Aid"],
	teaches = L["First Aid"],
	learnedAt = 125,
}
t[16112] = {
	name = L["Manual: Heavy Silk Bandage"],
	quality = 1,
	icon = "inv_misc_book_03",
	buyPrice = 2200,
	sellPrice = 550,
	reqLevel = 0,
	profession = L["First Aid"],
	teaches = L["Heavy Silk Bandage"],
	learnedAt = 180,
}
t[16113] = {
	name = L["Manual: Mageweave Bandage"],
	quality = 1,
	icon = "inv_misc_book_03",
	buyPrice = 5000,
	sellPrice = 1250,
	reqLevel = 0,
	profession = L["First Aid"],
	teaches = L["Mageweave Bandage"],
	learnedAt = 210,
}
t[785] = {
	name = L["Mageroyal"],
	quality = 1,
	icon = "inv_jewelry_talisman_03",
	buyPrice = 80,
	sellPrice = 20,
	reqLevel = 0,
}
t[2449] = {
	name = L["Earthroot"],
	quality = 1,
	icon = "inv_misc_herb_07",
	buyPrice = 80,
	sellPrice = 20,
	reqLevel = 0,
}
t[2453] = {
	name = L["Bruiseweed"],
	quality = 1,
	icon = "inv_misc_herb_01",
	buyPrice = 100,
	sellPrice = 25,
	reqLevel = 0,
}
t[3355] = {
	name = L["Wild Steelbloom"],
	quality = 1,
	icon = "inv_misc_flower_01",
	buyPrice = 200,
	sellPrice = 50,
	reqLevel = 0,
}
t[3356] = {
	name = L["Kingsblood"],
	quality = 1,
	icon = "inv_misc_herb_03",
	buyPrice = 120,
	sellPrice = 30,
	reqLevel = 0,
}
t[3357] = {
	name = L["Liferoot"],
	quality = 1,
	icon = "inv_misc_root_02",
	buyPrice = 300,
	sellPrice = 75,
	reqLevel = 0,
}
t[6055] = {
	name = L["Recipe: Fire Protection Potion"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1500,
	sellPrice = 375,
	reqLevel = 0,
	profession = L["Alchemy"],
	teaches = L["Fire Protection Potion"],
	learnedAt = 165,
}
t[4827] = {
	name = L["Wizard's Belt"],
	quality = 2,
	icon = "inv_belt_29",
	buyPrice = 3748,
	sellPrice = 749,
	reqLevel = 23,
}
t[4828] = {
	name = L["Nightwind Belt"],
	quality = 2,
	icon = "inv_belt_26",
	buyPrice = 3420,
	sellPrice = 684,
	reqLevel = 22,
}
t[4829] = {
	name = L["Dreamer's Belt"],
	quality = 2,
	icon = "inv_belt_04",
	buyPrice = 4153,
	sellPrice = 830,
	reqLevel = 24,
}
t[4836] = {
	name = L["Fireproof Orb"],
	quality = 2,
	icon = "inv_jewelry_talisman_01",
	buyPrice = 8002,
	sellPrice = 2000,
	reqLevel = 23,
}
t[4837] = {
	name = L["Strength of Will"],
	quality = 2,
	icon = "inv_jewelry_talisman_05",
	buyPrice = 8002,
	sellPrice = 2000,
	reqLevel = 25,
}
t[4838] = {
	name = L["Orb of Power"],
	quality = 2,
	icon = "inv_ore_arcanite_02",
	buyPrice = 8002,
	sellPrice = 2000,
	reqLevel = 21,
}
t[7561] = {
	name = L["Schematic: Goblin Jumper Cables"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
	profession = L["Engineering"],
	teaches = L["Goblin Jumper Cables"],
	learnedAt = 165,
}
t[11304] = {
	name = L["Fine Longbow"],
	quality = 2,
	icon = "inv_weapon_bow_02",
	buyPrice = 4861,
	sellPrice = 972,
	reqLevel = 14,
}
t[6068] = {
	name = L["Recipe: Shadow Oil"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1500,
	sellPrice = 375,
	reqLevel = 0,
	profession = L["Alchemy"],
	teaches = L["Shadow Oil"],
	learnedAt = 165,
}
t[7228] = {
	name = L["Tigule and Foror's Strawberry Ice Cream"],
	quality = 1,
	icon = "inv_misc_food_31",
	buyPrice = 500,
	sellPrice = 25,
	reqLevel = 15,
}
t[11023] = {
	name = L["Ancona Chicken"],
	quality = 1,
	icon = "inv_crate_02",
	buyPrice = 10000,
	sellPrice = 2500,
	reqLevel = 0,
}
t[4357] = {
	name = L["Rough Blasting Powder"],
	quality = 1,
	icon = "inv_misc_dust_01",
	buyPrice = 16,
	sellPrice = 4,
	reqLevel = 0,
}
t[4361] = {
	name = L["Copper Tube"],
	quality = 1,
	icon = "inv_gizmo_pipe_02",
	buyPrice = 480,
	sellPrice = 120,
	reqLevel = 0,
}
t[4363] = {
	name = L["Copper Modulator"],
	quality = 1,
	icon = "inv_gizmo_03",
	buyPrice = 200,
	sellPrice = 50,
	reqLevel = 0,
}
t[4364] = {
	name = L["Coarse Blasting Powder"],
	quality = 1,
	icon = "inv_misc_dust_02",
	buyPrice = 48,
	sellPrice = 12,
	reqLevel = 0,
}
t[4371] = {
	name = L["Bronze Tube"],
	quality = 1,
	icon = "inv_gizmo_pipe_01",
	buyPrice = 800,
	sellPrice = 200,
	reqLevel = 0,
}
t[4382] = {
	name = L["Bronze Framework"],
	quality = 1,
	icon = "inv_gizmo_bronzeframework_01",
	buyPrice = 2400,
	sellPrice = 600,
	reqLevel = 0,
}
t[4389] = {
	name = L["Gyrochronatom"],
	quality = 1,
	icon = "inv_misc_pocketwatch_02",
	buyPrice = 3000,
	sellPrice = 750,
	reqLevel = 0,
}
t[4404] = {
	name = L["Silver Contact"],
	quality = 1,
	icon = "inv_ingot_04",
	buyPrice = 100,
	sellPrice = 25,
	reqLevel = 0,
}
t[7560] = {
	name = L["Schematic: Gnomish Universal Remote"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1200,
	sellPrice = 300,
	reqLevel = 0,
	profession = L["Engineering"],
	teaches = L["Gnomish Universal Remote"],
	learnedAt = 125,
}
t[10647] = {
	name = L["Engineer's Ink"],
	quality = 1,
	icon = "inv_potion_65",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
}
t[10648] = {
	name = L["Blank Parchment"],
	quality = 1,
	icon = "inv_misc_note_02",
	buyPrice = 500,
	sellPrice = 125,
	reqLevel = 0,
}
t[13309] = {
	name = L["Schematic: Lovingly Crafted Boomstick"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
	profession = L["Engineering"],
	teaches = L["Lovingly Crafted Boomstick"],
	learnedAt = 120,
}
t[2509] = {
	name = L["Ornate Blunderbuss"],
	quality = 1,
	icon = "inv_weapon_rifle_02",
	buyPrice = 414,
	sellPrice = 82,
	reqLevel = 4,
}
t[2511] = {
	name = L["Hunter's Boomstick"],
	quality = 1,
	icon = "inv_weapon_rifle_04",
	buyPrice = 1324,
	sellPrice = 264,
	reqLevel = 9,
}
t[5441] = {
	name = L["Small Shot Pouch"],
	quality = 1,
	icon = "inv_misc_ammo_bullet_01",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 1,
}
t[6047] = {
	name = L["Plans: Golden Scale Coif"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 4400,
	sellPrice = 1100,
	reqLevel = 0,
	profession = L["Blacksmithing"],
	teaches = L["Golden Scale Coif"],
	learnedAt = 190,
}
t[18567] = {
	name = L["Elemental Flux"],
	quality = 1,
	icon = "spell_frost_fireresistancetotem",
	buyPrice = 150000,
	sellPrice = 37500,
	reqLevel = 0,
}
t[6057] = {
	name = L["Recipe: Nature Protection Potion"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
	profession = L["Alchemy"],
	teaches = L["Nature Protection Potion"],
	learnedAt = 190,
}
t[9303] = {
	name = L["Recipe: Philosopher's Stone"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 8000,
	sellPrice = 2000,
	reqLevel = 0,
	profession = L["Alchemy"],
	teaches = L["Philosophers' Stone"],
	learnedAt = 225,
}
t[9304] = {
	name = L["Recipe: Transmute Iron to Gold"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 8000,
	sellPrice = 2000,
	reqLevel = 0,
	profession = L["Alchemy"],
	teaches = L["Transmute: Iron to Gold"],
	learnedAt = 225,
}
t[9305] = {
	name = L["Recipe: Transmute Mithril to Truesilver"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 8000,
	sellPrice = 2000,
	reqLevel = 0,
	profession = L["Alchemy"],
	teaches = L["Transmute: Mithril to Truesilver"],
	learnedAt = 225,
}
t[12958] = {
	name = L["Recipe: Transmute Arcanite"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 50000,
	sellPrice = 12500,
	reqLevel = 0,
	profession = L["Alchemy"],
	teaches = L["Transmute: Arcanite"],
	learnedAt = 275,
}
t[7088] = {
	name = L["Pattern: Crimson Silk Robe"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 5000,
	sellPrice = 1250,
	reqLevel = 0,
	profession = L["Tailoring"],
	teaches = L["Crimson Silk Robe"],
	learnedAt = 205,
}
t[21358] = {
	name = L["Pattern: Soul Pouch"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 12000,
	sellPrice = 3000,
	reqLevel = 0,
	profession = L["Tailoring"],
	teaches = L["Soul Pouch"],
	learnedAt = 260,
}
t[8529] = {
	name = L["Noggenfogger Elixir"],
	quality = 1,
	icon = "inv_potion_83",
	buyPrice = 3500,
	sellPrice = 175,
	reqLevel = 35,
}
t[18046] = {
	name = L["Recipe: Tender Wolf Steak"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 12000,
	sellPrice = 3000,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Tender Wolf Steak"],
	learnedAt = 225,
}
t[2423] = {
	name = L["Brigandine Vest"],
	quality = 1,
	icon = "inv_chest_plate13",
	buyPrice = 42770,
	sellPrice = 8554,
	reqLevel = 45,
}
t[2424] = {
	name = L["Brigandine Belt"],
	quality = 1,
	icon = "inv_belt_03",
	buyPrice = 21461,
	sellPrice = 4292,
	reqLevel = 45,
}
t[2425] = {
	name = L["Brigandine Leggings"],
	quality = 1,
	icon = "inv_pants_03",
	buyPrice = 43077,
	sellPrice = 8615,
	reqLevel = 45,
}
t[2426] = {
	name = L["Brigandine Boots"],
	quality = 1,
	icon = "inv_boots_01",
	buyPrice = 32568,
	sellPrice = 6513,
	reqLevel = 45,
}
t[2427] = {
	name = L["Brigandine Bracers"],
	quality = 1,
	icon = "inv_bracer_03",
	buyPrice = 20146,
	sellPrice = 4029,
	reqLevel = 45,
}
t[2428] = {
	name = L["Brigandine Gloves"],
	quality = 1,
	icon = "inv_gauntlets_04",
	buyPrice = 20222,
	sellPrice = 4044,
	reqLevel = 45,
}
t[2451] = {
	name = L["Crested Heater Shield"],
	quality = 1,
	icon = "inv_shield_06",
	buyPrice = 43629,
	sellPrice = 8725,
	reqLevel = 45,
}
t[3894] = {
	name = L["Brigandine Helm"],
	quality = 1,
	icon = "inv_helmet_03",
	buyPrice = 29986,
	sellPrice = 5997,
	reqLevel = 45,
}
t[8088] = {
	name = L["Platemail Belt"],
	quality = 1,
	icon = "inv_belt_15",
	buyPrice = 13335,
	sellPrice = 2667,
	reqLevel = 45,
}
t[8089] = {
	name = L["Platemail Boots"],
	quality = 1,
	icon = "inv_boots_plate_08",
	buyPrice = 20081,
	sellPrice = 4016,
	reqLevel = 45,
}
t[8090] = {
	name = L["Platemail Bracers"],
	quality = 1,
	icon = "inv_bracer_14",
	buyPrice = 13439,
	sellPrice = 2687,
	reqLevel = 45,
}
t[8091] = {
	name = L["Platemail Gloves"],
	quality = 1,
	icon = "inv_gauntlets_29",
	buyPrice = 13489,
	sellPrice = 2697,
	reqLevel = 45,
}
t[8092] = {
	name = L["Platemail Helm"],
	quality = 1,
	icon = "inv_helmet_03",
	buyPrice = 20312,
	sellPrice = 4062,
	reqLevel = 45,
}
t[8093] = {
	name = L["Platemail Leggings"],
	quality = 1,
	icon = "inv_pants_04",
	buyPrice = 27186,
	sellPrice = 5437,
	reqLevel = 45,
}
t[8094] = {
	name = L["Platemail Armor"],
	quality = 1,
	icon = "inv_chest_plate04",
	buyPrice = 27290,
	sellPrice = 5458,
	reqLevel = 45,
}
t[17190] = {
	name = L["Ornate Buckler"],
	quality = 1,
	icon = "inv_shield_10",
	buyPrice = 34609,
	sellPrice = 6921,
	reqLevel = 42,
}
t[3025] = {
	name = L["BKP 42 \"Ultra\""],
	quality = 1,
	icon = "inv_weapon_rifle_03",
	buyPrice = 18478,
	sellPrice = 3695,
	reqLevel = 31,
}
t[18650] = {
	name = L["Schematic: EZ-Thro Dynamite II"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 5000,
	sellPrice = 1250,
	reqLevel = 0,
	profession = L["Engineering"],
	teaches = L["EZ-Thro Dynamite II"],
	learnedAt = 200,
}
t[13939] = {
	name = L["Recipe: Spotted Yellowtail"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 16000,
	sellPrice = 4000,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Spotted Yellowtail"],
	learnedAt = 225,
}
t[13942] = {
	name = L["Recipe: Grilled Squid"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 16000,
	sellPrice = 4000,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Grilled Squid"],
	learnedAt = 240,
}
t[13945] = {
	name = L["Recipe: Nightfin Soup"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 20000,
	sellPrice = 5000,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Nightfin Soup"],
	learnedAt = 250,
}
t[13946] = {
	name = L["Recipe: Poached Sunscale Salmon"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 20000,
	sellPrice = 5000,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Poached Sunscale Salmon"],
	learnedAt = 250,
}
t[16767] = {
	name = L["Recipe: Undermine Clam Chowder"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 3000,
	sellPrice = 750,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Undermine Clam Chowder"],
	learnedAt = 225,
}
t[7089] = {
	name = L["Pattern: Azure Silk Cloak"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 1500,
	sellPrice = 375,
	reqLevel = 0,
	profession = L["Tailoring"],
	teaches = L["Azure Silk Cloak"],
	learnedAt = 175,
}
t[10684] = {
	name = L["Colossal Parachute"],
	quality = 1,
	icon = "ability_whirlwind",
	buyPrice = 2000,
	sellPrice = 500,
	reqLevel = 0,
}
t[11141] = {
	name = L["Bait"],
	quality = 1,
	icon = "inv_misc_food_50",
	buyPrice = 2000,
	sellPrice = 0,
	reqLevel = 0,
}
t[7451] = {
	name = L["Pattern: Green Whelp Bracers"],
	quality = 2,
	icon = "inv_scroll_03",
	buyPrice = 2800,
	sellPrice = 700,
	reqLevel = 0,
	profession = L["Leatherworking"],
	teaches = L["Green Whelp Bracers"],
	learnedAt = 190,
}
t[8385] = {
	name = L["Pattern: Turtle Scale Gloves"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 3500,
	sellPrice = 875,
	reqLevel = 0,
	profession = L["Leatherworking"],
	teaches = L["Turtle Scale Gloves"],
	learnedAt = 205,
}
t[15734] = {
	name = L["Pattern: Living Shoulders"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 14000,
	sellPrice = 3500,
	reqLevel = 0,
	profession = L["Leatherworking"],
	teaches = L["Living Shoulders"],
	learnedAt = 270,
}
t[8409] = {
	name = L["Pattern: Nightscape Shoulders"],
	quality = 2,
	icon = "inv_scroll_03",
	buyPrice = 4000,
	sellPrice = 1000,
	reqLevel = 0,
	profession = L["Leatherworking"],
	teaches = L["Nightscape Shoulders"],
	learnedAt = 210,
}
t[11020] = {
	name = L["Evergreen Pouch"],
	quality = 1,
	icon = "inv_misc_bag_18",
	buyPrice = 10000,
	sellPrice = 0,
	reqLevel = 0,
}
t[11022] = {
	name = L["Packet of Tharlendris Seeds"],
	quality = 1,
	icon = "spell_nature_protectionformnature",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 0,
}
t[13947] = {
	name = L["Recipe: Lobster Stew"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 20000,
	sellPrice = 5000,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Lobster Stew"],
	learnedAt = 275,
}
t[13948] = {
	name = L["Recipe: Mightfish Steak"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 20000,
	sellPrice = 5000,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Mightfish Steak"],
	learnedAt = 275,
}
t[13949] = {
	name = L["Recipe: Baked Salmon"],
	quality = 1,
	icon = "inv_scroll_03",
	buyPrice = 20000,
	sellPrice = 5000,
	reqLevel = 0,
	profession = L["Cooking"],
	teaches = L["Baked Salmon"],
	learnedAt = 275,
}
t[3928] = {
	name = L["Superior Healing Potion"],
	quality = 1,
	icon = "inv_potion_53",
	buyPrice = 1000,
	sellPrice = 250,
	reqLevel = 35,
}
t[6149] = {
	name = L["Greater Mana Potion"],
	quality = 1,
	icon = "inv_potion_73",
	buyPrice = 480,
	sellPrice = 120,
	reqLevel = 31,
}
t[9302] = {
	name = L["Recipe: Ghost Dye"],
	quality = 1,
	icon = "inv_scroll_05",
	buyPrice = 9000,
	sellPrice = 2250,
	reqLevel = 0,
	profession = L["Alchemy"],
	teaches = L["Ghost Dye"],
	learnedAt = 245,
}
t[2429] = {
	name = L["Russet Vest"],
	quality = 1,
	icon = "inv_shirt_14",
	buyPrice = 10138,
	sellPrice = 2027,
	reqLevel = 32,
}
t[2431] = {
	name = L["Russet Pants"],
	quality = 1,
	icon = "inv_pants_10",
	buyPrice = 10215,
	sellPrice = 2043,
	reqLevel = 32,
}
t[2432] = {
	name = L["Russet Boots"],
	quality = 1,
	icon = "inv_boots_05",
	buyPrice = 7690,
	sellPrice = 1538,
	reqLevel = 32,
}
t[2434] = {
	name = L["Russet Gloves"],
	quality = 1,
	icon = "inv_gauntlets_18",
	buyPrice = 5165,
	sellPrice = 1033,
	reqLevel = 32,
}
t[2463] = {
	name = L["Studded Doublet"],
	quality = 1,
	icon = "inv_chest_leather_10",
	buyPrice = 13695,
	sellPrice = 2739,
	reqLevel = 32,
}
t[2464] = {
	name = L["Studded Belt"],
	quality = 1,
	icon = "inv_belt_03",
	buyPrice = 6871,
	sellPrice = 1374,
	reqLevel = 32,
}
t[2465] = {
	name = L["Studded Pants"],
	quality = 1,
	icon = "inv_pants_06",
	buyPrice = 12477,
	sellPrice = 2495,
	reqLevel = 32,
}
t[2467] = {
	name = L["Studded Boots"],
	quality = 1,
	icon = "inv_boots_08",
	buyPrice = 9430,
	sellPrice = 1886,
	reqLevel = 32,
}
t[2468] = {
	name = L["Studded Bracers"],
	quality = 1,
	icon = "inv_bracer_02",
	buyPrice = 6310,
	sellPrice = 1262,
	reqLevel = 32,
}
t[2469] = {
	name = L["Studded Gloves"],
	quality = 1,
	icon = "inv_gauntlets_25",
	buyPrice = 6334,
	sellPrice = 1266,
	reqLevel = 32,
}
t[3593] = {
	name = L["Russet Belt"],
	quality = 1,
	icon = "inv_belt_26",
	buyPrice = 5477,
	sellPrice = 1095,
	reqLevel = 32,
}
t[3594] = {
	name = L["Russet Bracers"],
	quality = 1,
	icon = "inv_bracer_07",
	buyPrice = 5497,
	sellPrice = 1099,
	reqLevel = 32,
}
t[3889] = {
	name = L["Russet Hat"],
	quality = 1,
	icon = "inv_helmet_33",
	buyPrice = 7922,
	sellPrice = 1584,
	reqLevel = 32,
}
t[3890] = {
	name = L["Studded Hat"],
	quality = 1,
	icon = "inv_helmet_20",
	buyPrice = 10201,
	sellPrice = 2040,
	reqLevel = 32,
}
t[12253] = {
	name = L["Brilliant Red Cloak"],
	quality = 2,
	icon = "inv_misc_cape_18",
	buyPrice = 17728,
	sellPrice = 3545,
	reqLevel = 36,
}
t[12254] = {
	name = L["Well Oiled Cloak"],
	quality = 2,
	icon = "inv_misc_cape_04",
	buyPrice = 22416,
	sellPrice = 4483,
	reqLevel = 39,
}
t[11308] = {
	name = L["Sylvan Shortbow"],
	quality = 2,
	icon = "inv_weapon_bow_07",
	buyPrice = 78828,
	sellPrice = 15765,
	reqLevel = 44,
}
t[2435] = {
	name = L["Embroidered Armor"],
	quality = 1,
	icon = "inv_shirt_17",
	buyPrice = 27683,
	sellPrice = 5536,
	reqLevel = 45,
}
t[2437] = {
	name = L["Embroidered Pants"],
	quality = 1,
	icon = "inv_pants_08",
	buyPrice = 27890,
	sellPrice = 5578,
	reqLevel = 45,
}
t[2438] = {
	name = L["Embroidered Boots"],
	quality = 1,
	icon = "inv_boots_05",
	buyPrice = 20996,
	sellPrice = 4199,
	reqLevel = 45,
}
t[2440] = {
	name = L["Embroidered Gloves"],
	quality = 1,
	icon = "inv_gauntlets_18",
	buyPrice = 14099,
	sellPrice = 2819,
	reqLevel = 45,
}
t[3587] = {
	name = L["Embroidered Belt"],
	quality = 1,
	icon = "inv_belt_08",
	buyPrice = 14314,
	sellPrice = 2862,
	reqLevel = 45,
}
t[3588] = {
	name = L["Embroidered Bracers"],
	quality = 1,
	icon = "inv_bracer_13",
	buyPrice = 14365,
	sellPrice = 2873,
}
}