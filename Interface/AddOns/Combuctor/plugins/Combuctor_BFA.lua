--## Thanks Adibags
local arrZoneItems = {
166846,166970,166971,166973,16701216,16707716,167562,167649,16789316,16789616,16790216,16790216,16790316,16790316,16790416,16790516,16790616,16790716,16790816,16790916,16791016,16791116,16791216,16791316,16791416,16791516,16791616,16792316,168045,16816116,168213,168215,168216,168217,168233,16826116,168262,168327,168832,168950,168951,168952,168961,169218,16933216,16933316,16933416,16947716,16947816,16947916,16948016,16948116,16948216,16948316,16948416,16948516,169610,169674,169675,16978016,16978116,16978216,16978316,169868,169872,169873,169878,17010016,17018016,17018616,17018916,17019116,17047216,17051216,17054716,
--}
-- Tinkering Parts
--local parts = {
	166846, --Spare Parts
	166970, --Energy Cell
	166971, --Empty Energy Cell
	167562, --Ionized Minnow
	168215, --Machined Gear Assembly
	168216, --Tempered Plating
	168217, --Hardened Spring
	168262, --Sentry Fish
	168327, --Chain Ignitercoil
	168832, --Galvanic Oscillator
	168946, --Bundle of Recyclable Parts
	169610, --S.P.A.R.E. Crate
--}
-- Mechagon Boxes
--local boxes = {
	167744, --Aspirant's Equipment Cache
	168264, --Recycling Requisition
	168266, --Strange Recycling Requisition
	169471, --Cogfrenzy's Construction Toolkit
	169838, --Azeroth Mini: Starter Pack
	170061, --Rustbolt Supplies
	298140, --Rustbolt Requisitions
--}
-- Item blueprints
--local blueprints = {
	167042, --Blueprint: Scrap Trap
	167652, --Blueprint: Hundred-Fathom Lure
	167787, --Blueprint: Mechanocat Laser Pointer
	167836, --Blueprint: Canned Minnows
	167843, --Blueprint: Vaultbot Key
	167844, --Blueprint: Emergency Repair Kit
	167845, --Blueprint: Emergency Powerpack
	167846, --Blueprint: Mechano-Treat
	167847, --Blueprint: Ultrasafe Transporter: Mechagon
	167871, --Blueprint: G99.99 Landshark
	168062, --Blueprint: Rustbolt Gramophone
	168063, --Blueprint: Rustbolt Kegerator
	168219, --Blueprint: Beastbot Powerpack
	168220, --Blueprint: Re-Procedurally Generated Punchcard
	168248, --Blueprint: BAWLD-371
	168490, --Blueprint: Protocol Transference Device
	168491, --Blueprint: Personal Time Displacer
	168492, --Blueprint: Emergency Rocket Chicken
	168493, --Blueprint: Battle Box
	168494, --Blueprint: Rustbolt Resistance Insignia
	168495, --Blueprint: Rustbolt Requisitions	
	168906, --Blueprint: Holographic Digitalization Relay
	168908, --Blueprint: Experimental Adventurer Augment
	169112, --Blueprint: Advanced Adventurer Augment
	169134, --Blueprint: Extraodinary Adventurer Augment
	169167, --Blueprint: Orange Spraybot
	169168, --Blueprint: Green Spraybot
	169169, --Blueprint: Blue Spraybot
	169170, --Blueprint: Utility Mechanoclaw
	169171, --Blueprint: Microbot XD
	169172, --Blueprint: Perfectly Timed Differential
	169173, --Blueprint: Anti-Gravity Pack
	169174, --Blueprint: Rustbolt Pocket Turret
	169175, --Blueprint: Annoy-o-Tron Gang
	169176, --Blueprint: Encrypted Black Market Radio
	169190, --Blueprint: Mega-Sized Spare Parts
--}
-- Mount Paints
--local paint = {
	167796, --Paint Vial: Mechagon Gold
	167790, --Paint Vial: Fireball Red
	167791, --Paint Vial: Battletorn Blue
	167792, --Paint Vial: Fel Mint Green
	167793, --Paint Vial: Overload Orange
	167794, --Paint Vial: Lemonade Steel
	167795, --Paint Vial: Copper Trim
	168001, --Paint Vial: Big-ol Bronze
	170146, --Paint Bottle: Nukular Red
	170147, --Paint Bottle: Goblin Green
	170148, --Paint Bottle: Electric Blue
--}
-- Mechagon Minis
--local minis = {
	169794, --Azeroth Mini: Izira Gearsworn
	169795, --Azeroth Mini: Bondo Bigblock
	169796, --Azeroth Mini Collection: Mechagon
	169797, --Azeroth Mini: Wrenchbot
	169840, --Azeroth Mini: Gazlowe
	169841, --Azeroth Mini: Erazmin
	169842, --Azeroth Mini: Roadtrogg
	169843, --Azeroth Mini: Cork Stuttguard
	169844, --Azeroth Mini: Overspark
	169845, --Azeroth Mini: HK-8
	169846, --Azeroth Mini: King Mechagon
	169849, --Azeroth Mini: Naeno Megacrash
	169851, --Azeroth Mini: Cogstar
	169852, --Azeroth Mini: Blastatron
	169876, --Azeroth Mini: Sapphronetta
	169895, --Azeroth Mini: Beastbot
	169896, --Azeroth Mini: Pascal-K1N6
--}
-- Mechagon Misc
--local misc = {
	168497, --Rustbolt Resistance Insignia
	169107, --T.A.R.G.E.T. Device
	169688, --Vinyl: Gnomeregan Forever
	169689, --Vinyl: Mimiron's Brainstorm
	169690, --Vinyl: Battle of Gnomeregan
	169691, --Vinyl: Depths of Ulduar
	169692, --Vinyl: Triumph of Gnomeregan
}

-----------------------------------------------------------------------------------------------------------------------------------------
function isBFA(player, bagType, name, link, quality, level, ilvl, type, subType, stackCount, equipLoc)
	--if not subType then return false end
	if not link then return false end
	if not link or link=="" then return nil end

	local linkType, itemId, enchantId,jewelId1, jewelId2, jewelId3, jewelId4,suffixId, uniqueId = strsplit(":", string.match(link, "item[%-?%d:]+"))
	if (linkType == 'item') then return itemId end

	return arrZoneItems[tonumber(ItemID)];
end
-----------------------------------------------------------------------------------------------------------------------------------------
Combuctor.Rules:New('BFA', "BFA", 'Interface/Icons/inv_misc_ancient_mana', isBFA)