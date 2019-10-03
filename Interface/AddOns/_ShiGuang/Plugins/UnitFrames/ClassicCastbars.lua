--## Author: Wardz ## Version: v1.0.8
local ClassicCastbars = {}
local PoolManager = {}
ClassicCastbars.PoolManager = PoolManager

local framePool = CreateFramePool("Statusbar", UIParent, "SmallCastingBarFrameTemplate", PoolManager.ResetterFunc)
local framesCreated = 0
local framesActive = 0

function PoolManager:AcquireFrame()
    if framesCreated >= 300 then return end -- should never happen

    local frame, isNew = framePool:Acquire()
    framesActive = framesActive + 1

    if isNew then
        framesCreated = framesCreated + 1
        self:InitializeNewFrame(frame)
    end

    return frame, isNew, framesCreated
end

function PoolManager:ReleaseFrame(frame)
    if frame then
        framePool:Release(frame)
        framesActive = framesActive - 1
    end
end

function PoolManager:InitializeNewFrame(frame)
    frame:Hide() -- New frames are always shown, hide it while we're updating it
    frame.Flash:SetAlpha(0) -- we don't use this atm

    -- Some of the points set by SmallCastingBarFrameTemplate doesn't
    -- work well when user modify castbar size, so set our own points instead
    frame.Border:ClearAllPoints()
    frame.Icon:ClearAllPoints()
    frame.Text:ClearAllPoints()
    frame.Icon:SetPoint("LEFT", frame, -15, 0)
    frame.Text:SetPoint("CENTER")

    -- Clear any scripts inherited from frame template
    frame:SetScript("OnLoad", nil)
    frame:SetScript("OnEvent", nil)
    frame:SetScript("OnUpdate", nil)
    frame:SetScript("OnShow", nil)

    frame.Timer = frame:CreateFontString(nil, "OVERLAY")
    frame.Timer:SetTextColor(1, 1, 1)
    frame.Timer:SetFontObject("SystemFont_Shadow_Small")
    frame.Timer:SetPoint("RIGHT", frame, -6, 0)
end

function PoolManager:ResetterFunc(pool, frame)
    frame:Hide()
    frame:SetParent(nil)
    frame:ClearAllPoints()

    if frame._data then
        frame._data = nil
    end
end

function PoolManager:GetFramePool()
    return framePool
end

function PoolManager:DebugInfo()
    print(format("Created %d frames in total.", framesCreated))
    print(format("Currently active frames: %d.", framesActive))
end

if date("%d.%m") == "01.04" then -- April Fools :)
    C_Timer.After(1800, function()
        if not UnitIsDeadOrGhost("player") then
            DoEmote("fart")
        end
    end)
end

local AnchorManager = {}
ClassicCastbars.AnchorManager = AnchorManager

local anchors = {
    target = {
        "SUFUnittarget",
        "XPerl_Target",
        "Perl_Target_Frame",
        "ElvUF_Target",
        "oUF_TukuiTarget",
        "btargetUnitFrame",
        "DUF_TargetFrame",
        "GwTargetUnitFrame",
        "PitBull4_Frames_Target",
        "oUF_Target",
        "SUI_targetFrame",
        "gUI4_UnitTarget",
        "oUF_Adirelle_Target",
        "oUF_AftermathhTarget",
        "LUFUnittarget",
        "oUF_LumenTarget",
        "TukuiTargetFrame",
        "CG_UnitFrame_2",
        "TargetFrame", -- Blizzard frame should always be last
    },

    party = {
        "SUFHeaderpartyUnitButton%d",
        "XPerl_party%d",
        "ElvUF_PartyGroup1UnitButton%d",
        "TukuiPartyUnitButton%d",
        "DUF_PartyFrame%d",
        "PitBull4_Groups_PartyUnitButton%d",
        "oUF_Raid%d",
        "GwPartyFrame%d",
        "gUI4_GroupFramesGroup5UnitButton%d",
        "PartyMemberFrame%d",
        "CompactRaidFrame%d",
        "CompactPartyFrameMember%d",
        "CompactRaidGroup1Member%d",
    },
}

local cache = {}
local _G = _G
local strmatch = _G.strmatch
local strfind = _G.string.find
local UnitGUID = _G.UnitGUID
local GetNamePlateForUnit = _G.C_NamePlate.GetNamePlateForUnit

local function GetUnitFrameForUnit(unitType, unitID, hasNumberIndex)
    local anchorNames = anchors[unitType]
    if not anchorNames then return end

    for i = 1, #anchorNames do
        local name = anchorNames[i]
        if hasNumberIndex then
            name = format(name, strmatch(unitID, "%d+")) -- add unit index to unitframe name
        end

        local frame = _G[name]
        if frame and frame:IsVisible() then
            return _G[name], name
        end
    end
end

local function GetPartyFrameForUnit(unitID)
    if unitID == "party-testmode" then
        return GetUnitFrameForUnit("party", "party1", true)
    end

    local guid = UnitGUID(unitID)
    if not guid then return end

    local compact = GetCVarBool("useCompactPartyFrames")

    -- raid frames are recycled so frame10 might be party2 and so on, so we need
    -- to loop through them all and check if the unit matches
    for i = 1, 40 do
        local frame, frameName = GetUnitFrameForUnit("party", "party"..i, true)
        if frame and frame.unit and UnitGUID(frame.unit) == guid and frame:IsVisible() then
            if compact then
                if strfind(frameName, "PartyMemberFrame") == nil then
                    return frame
                end
            else
                return frame
            end
        end
    end
end

function AnchorManager:GetAnchor(unitID)
    if cache[unitID] then
        return cache[unitID]
    end

    if unitID == "player" then
        return UIParent
    end

    local unitType, count = unitID:gsub("%d", "") -- party1 -> party etc

    local frame
    if unitID == "nameplate-testmode" then
        frame = GetNamePlateForUnit("target")
    elseif unitType == "nameplate" then
        frame = GetNamePlateForUnit(unitID)
    elseif unitType == "party" or unitType == "party-testmode" then
        frame = GetPartyFrameForUnit(unitID)
    else -- target
        frame = GetUnitFrameForUnit(unitType, unitID, count > 0)
    end

    if frame and unitType == "target" then
        anchors[unitID] = nil
        cache[unitID] = frame
    end

    return frame
end

local GetSpellInfo = _G.GetSpellInfo

local castSpellIDs = {
    25262, -- Abomination Spit
    24334, -- Acid Spit
    6306, -- Acid Splash
    26419, -- Acid Spray
    12280, -- Acid of Hakkar
    8352, -- Adjust Attitude
    20904, -- Aimed Shot
    12248, -- Amplify Damage
    9482, -- Amplify Flames
    20777, -- Ancestral Spirit
    24168, -- Animist's Caress
    16991, -- Annihilator
    19645, -- Anti-Magic Shield
    13901, -- Arcane Bolt
    19821, -- Arcane Bomb
    11975, -- Arcane Explosion
    1450, -- Arcane Spirit II
    1451, -- Arcane Spirit III
    1452, -- Arcane Spirit IV
    1453, -- Arcane Spirit V
    25181, -- Arcane Weakness
    16081, -- Arctic Wolf
    8000, -- Area Burn
    10418, -- Arugal spawn-in spell
    7124, -- Arugal's Gift
    25149, -- Arygos's Vengeance
    6422, -- Ashcrombe's Teleport
    6421, -- Ashcrombe's Unlock
    21332, -- Aspect of Neptulon
    556, -- Astral Recall
    10436, -- Attack
    8386, -- Attacking
    16629, -- Attuned Dampener
    17536, -- Awaken Kerlonian
    10258, -- Awaken Vault Warder
    12346, -- Awaken the Soulflayer
    18375, -- Aynasha's Arrow
    6753, -- Backhand
    13982, -- Bael'Gar's Fiery Essence
    23151, -- Balance of Light and Shadow
    5414, -- Balance of Nature
    5412, -- Balance of Nature Failure
    28299, -- Ball Lightning
    18647, -- Banish
    4130, -- Banish Burning Exile
    4131, -- Banish Cresting Exile
    4132, -- Banish Thundering Exile
    5884, -- Banshee Curse
    16868, -- Banshee Wail
    16051, -- Barrier of Light
    11759, -- Basilisk Sample
    1179, -- Beast Claws
    1849, -- Beast Claws II
    3133, -- Beast Claws III
    23677, -- Beasts Deck
    22686, -- Bellowing Roar
    8856, -- Bending Shinbone
    4067, -- Big Bronze Bomb
    7398, -- Birth
    23638, -- Black Amnesty
    20733, -- Black Arrow
    22719, -- Black Battlestrider
    27589, -- Black Grasp of the Destroyer
    17461, -- Black Ram
    7279, -- Black Sludge
    470, -- Black Stallion
    22718, -- Black War Kodo
    22720, -- Black War Ram
    22721, -- Black War Raptor
    22717, -- Black War Steed
    22723, -- Black War Tiger
    22724, -- Black War Wolf
    578, -- Black Wolf
    23639, -- Blackfury
    23652, -- Blackguard
    16978, -- Blazing Rapier
    16965, -- Bleakwood Hew
    16599, -- Blessing of Shahram
    6510, -- Blinding Powder
    15783, -- Blizzard
    3264, -- Blood Howl
    16986, -- Blood Talon
    10969, -- Blue Mechanostrider
    6897, -- Blue Ram
    17463, -- Blue Skeletal Horse
    11365, -- Bly's Band's Escape
    9143, -- Bomb
    1980, -- Bombard
    3015, -- Bombard II
    28280, -- Bombard Slime
    17014, -- Bone Shards
    23392, -- Boulder
    24006, -- Bounty of the Harvest
    7962, -- Break Big Stuff
    7437, -- Break Stuff
    4954, -- Break Tool
    18571, -- Breath
    28352, -- Breath of Sargeras
    8090, -- Bright Baubles
    7359, -- Bright Campfire
    458, -- Brown Horse
    18990, -- Brown Kodo
    6899, -- Brown Ram
    17464, -- Brown Skeletal Horse
    6654, -- Brown Wolf
    17293, -- Burning Winds
    26381, -- Burrow
    20364, -- Bury Samuel's Remains
    27720, -- Buttermilk Delight
    23123, -- Cairne's Hoofprint
    23041, -- Call Anathema
    25167, -- Call Ancients
    23042, -- Call Benediction
    7487, -- Call Bleak Worg
    25166, -- Call Glyphs of Warding
    7489, -- Call Lupine Horror
    25159, -- Call Prismatic Barrier
    7488, -- Call Slavering Worg
    11654, -- Call of Sul'thraze
    11024, -- Call of Thund
    5137, -- Call of the Grave
    21249, -- Call of the Nether
    271, -- Call of the Void
    21648, -- Call to Ivus
    17501, -- Cannon Fire
    9095, -- Cantation of Manifestation
    27571, -- Cascade of Roses
    15120, -- Cenarion Beacon
    11085, -- Chain Bolt
    8211, -- Chain Burn
    10623, -- Chain Heal
    10605, -- Chain Lightning
    15549, -- Chained Bolt
    512, -- Chains of Ice
    11537, -- Charge Stave of Equinex
    16570, -- Charged Arcane Bolt
    22434, -- Charged Scale of Onyxia
    1538, -- Charging
    6648, -- Chestnut Mare
    3132, -- Chilling Breath
    22599, -- Chromatic Mantle of the Dawn
    24576, -- Chromatic Mount
    24973, -- Clean Up Stink Bomb
    27794, -- Cleave
    27890, -- Clone
    9002, -- Coarse Dynamite
    26167, -- Colossal Smash
    19720, -- Combine Pendants
    16781, -- Combining Charms
    21267, -- Conjure Altar of Summoning
    21646, -- Conjure Circle of Calling
    25813, -- Conjure Dream Rift
    21100, -- Conjure Elegant Letter
    28612, -- Conjure Food
    18831, -- Conjure Lily Root
    759, -- Conjure Mana Agate
    10053, -- Conjure Mana Citrine
    3552, -- Conjure Mana Jade
    10054, -- Conjure Mana Ruby
    19797, -- Conjure Torch of Retribution
    10140, -- Conjure Water
    28891, -- Consecrated Weapon
    5174, -- Cookie's Cooking
    23313, -- Corrosive Acid
    21047, -- Corrosive Acid Spit
    3396, -- Corrosive Poison
    20629, -- Corrosive Venom Spit
    18666, -- Corrupt Redpath
    25311, -- Corruption
    6619, -- Cowardly Flight Potion
    5403, -- Crash of Waves
    17951, -- Create Firestone
    17952, -- Create Firestone (Greater)
    6366, -- Create Firestone (Lesser)
    17953, -- Create Firestone (Major)
    28023, -- Create Healthstone
    11729, -- Create Healthstone (Greater)
    6202, -- Create Healthstone (Lesser)
    11730, -- Create Healthstone (Major)
    6201, -- Create Healthstone (Minor)
    20755, -- Create Soulstone
    20756, -- Create Soulstone (Greater)
    20752, -- Create Soulstone (Lesser)
    20757, -- Create Soulstone (Major)
    693, -- Create Soulstone (Minor)
    2362, -- Create Spellstone
    17727, -- Create Spellstone (Greater)
    17728, -- Create Spellstone (Major)
    14532, -- Creeper Venom
    2840, -- Creeping Anguish
    6278, -- Creeping Mold
    2838, -- Creeping Pain
    2841, -- Creeping Torment
    17496, -- Crest of Retribution
    11443, -- Cripple
    11202, -- Crippling Poison
    3421, -- Crippling Poison II
    3974, -- Crude Scope
    16594, -- Crypt Scarabs
    5106, -- Crystal Flash
    3635, -- Crystal Gaze
    30021, -- Crystal Infused Bandage
    30047, -- Crystal Throat Lozenge
    3636, -- Crystalline Slumber
    13399, -- Cultivate Packet of Seeds
    27552, -- Cupid's Arrow
    28133, -- Cure Disease
    8282, -- Curse of Blood
    18502, -- Curse of Hakkar
    7098, -- Curse of Mending
    16597, -- Curse of Shahram
    13524, -- Curse of Stalvan
    16247, -- Curse of Thorns
    3237, -- Curse of Thule
    17505, -- Curse of Timmy
    8552, -- Curse of Weakness
    18702, -- Curse of the Darkmaster
    13583, -- Curse of the Deadwood
    18159, -- Curse of the Fallen Magram
    16071, -- Curse of the Firebrand
    17738, -- Curse of the Plague Rat
    21048, -- Curse of the Tribes
    5267, -- Dalaran Wizard Disguise
    27723, -- Dark Desire
    19799, -- Dark Iron Bomb
    5268, -- Dark Iron Dwarf Disguise
    16588, -- Dark Mending
    7106, -- Dark Restore
    3335, -- Dark Sludge
    16587, -- Dark Whispers
    5514, -- Darken Vision
    23765, -- Darkmoon Faire Fortune
    16987, -- Darkspear
    3146, -- Daunting Growl
    16970, -- Dawn's Edge
    17045, -- Dawn's Gambit
    2835, -- Deadly Poison
    2837, -- Deadly Poison II
    11355, -- Deadly Poison III
    11356, -- Deadly Poison IV
    25347, -- Deadly Poison V
    12459, -- Deadly Scope
    7395, -- Deadmines Dynamite
    11433, -- Death & Decay
    6894, -- Death Bed
    5395, -- Death Capsule
    24161, -- Death's Embrace
    17481, -- Deathcharger
    7901, -- Decayed Agility
    13528, -- Decayed Strength
    12890, -- Deep Slumber
    5169, -- Defias Disguise
    22999, -- Defibrillate
    18559, -- Demon Pick
    22372, -- Demon Portal
    25793, -- Demon Summoning Torch
    23063, -- Dense Dynamite
    5140, -- Detonate
    9435, -- Detonation
    6700, -- Dimensional Portal
    13692, -- Dire Growl
    6653, -- Dire Wolf
    1842, -- Disarm Trap
    27891, -- Disease Buffet
    11397, -- Diseased Shot
    6907, -- Diseased Slime
    17745, -- Diseased Spit
    2641, -- Dismiss Pet
    25808, -- Dispel
    21954, -- Dispel Poison
    16613, -- Displacing Temporal Rift
    5099, -- Disruption
    15746, -- Disturb Rookery Egg
    6310, -- Divining Scroll Spell
    5017, -- Divining Trance
    20604, -- Dominate Mind
    17405, -- Domination
    16053, -- Dominion of Soul
    6805, -- Dousing
    12253, -- Dowse Eternal Flame
    11758, -- Dowsing
    16007, -- Draco-Incarcinatrix 900
    24815, -- Draw Ancient Glyphs
    19564, -- Draw Water Sample
    5219, -- Draw of Thistlenettle
    12304, -- Drawing Kit
    3368, -- Drink Minor Potion
    3359, -- Drink Potion
    8040, -- Druid's Slumber
    20436, -- Drunken Pit Crew
    26072, -- Dust Cloud
    8800, -- Dynamite
    513, -- Earth Elemental
    8376, -- Earthgrab Totem
    23650, -- Ebon Hand
    29335, -- Elderberry Pie
    11820, -- Electrified Net
    849, -- Elemental Armor
    19773, -- Elemental Fire
    877, -- Elemental Fury
    23679, -- Elementals Deck
    26636, -- Elune's Candle
    16533, -- Emberseer Start
    8395, -- Emerald Raptor
    22647, -- Empower Pet
    7081, -- Encage
    4962, -- Encasing Webs
    6296, -- Enchant: Fiery Blaze
    16973, -- Enchanted Battlehammer
    20269, -- Enchanted Gaea Seed
    3443, -- Enchanted Quickness
    20513, -- Enchanted Resonite Crystal
    16798, -- Enchanting Lullaby
    27287, -- Energy Siphon
    22661, -- Enervate
    11963, -- Enfeeble
    27860, -- Engulfing Shadows
    3112, -- Enhance Blunt Weapon
    3113, -- Enhance Blunt Weapon II
    3114, -- Enhance Blunt Weapon III
    9903, -- Enhance Blunt Weapon IV
    16622, -- Enhance Blunt Weapon V
    8365, -- Enlarge
    12655, -- Enlightenment
    11726, -- Enslave Demon
    9853, -- Entangling Roots
    6728, -- Enveloping Winds
    20589, -- Escape Artist
    24302, -- Eternium Fishing Line
    23442, -- Everlook Transporter
    3233, -- Evil Eye
    12458, -- Evil God Counterspell
    28354, -- Exorcise Atiesh
    23208, -- Exorcise Spirits
    7896, -- Exploding Shot
    12719, -- Explosive Arrow
    6441, -- Explosive Shells
    15495, -- Explosive Shot
    24264, -- Extinguish
    26134, -- Eye Beam
    22909, -- Eye of Immol'thar
    126, -- Eye of Kilrogg
    21160, -- Eye of Sulfuras
    1002, -- Eyes of the Beast
    23000, -- Ez-Thro Dynamite
    6950, -- Faerie Fire
    8682, -- Fake Shot
    24162, -- Falcon's Call
    5262, -- Fanatic Blade
    6196, -- Far Sight
    6215, -- Fear
    457, -- Feeblemind
    509, -- Feeblemind II
    855, -- Feeblemind III
    12938, -- Fel Curse
    26086, -- Felcloth Bag
    3488, -- Felstrom Resurrection
    555, -- Feral Spirit
    968, -- Feral Spirit II
    8139, -- Fevered Fatigue
    8600, -- Fevered Plague
    22704, -- Field Repair Bot 74A
    6297, -- Fiery Blaze
    13900, -- Fiery Burst
    6250, -- Fire Cannon
    895, -- Fire Elemental
    134, -- Fire Shield
    184, -- Fire Shield II
    2601, -- Fire Shield III
    2602, -- Fire Shield IV
    13899, -- Fire Storm
    25177, -- Fire Weakness
    29332, -- Fire-toasted Bun
    10149, -- Fireball
    17203, -- Fireball Volley
    11763, -- Firebolt
    690, -- Firebolt II
    1084, -- Firebolt III
    1096, -- Firebolt IV
    25465, -- Firework
    26443, -- Firework Cluster Launcher
    7162, -- First Aid
    16601, -- Fist of Shahram
    23061, -- Fix Ritual Node
    7101, -- Flame Blast
    16396, -- Flame Breath
    16168, -- Flame Buffet
    6305, -- Flame Burst
    15575, -- Flame Cannon
    3356, -- Flame Lash
    22593, -- Flame Mantle of the Dawn
    6725, -- Flame Spike
    10733, -- Flame Spray
    15743, -- Flamecrack
    10854, -- Flames of Chaos
    12534, -- Flames of Retribution
    16596, -- Flames of Shahram
    11021, -- Flamespit
    10216, -- Flamestrike
    27608, -- Flash Heal
    19943, -- Flash of Light
    9092, -- Flesh Eating Worm
    14292, -- Fling Torch
    17458, -- Fluorescent Green Mechanostrider
    3678, -- Focusing
    24189, -- Force Punch
    22797, -- Force Reactive Disk
    8912, -- Forge Verigan's Fist
    18711, -- Forging
    28697, -- Forgiveness
    8435, -- Forked Lightning
    10849, -- Form of the Moonstalker (no invis)
    28324, -- Forming Frame of Atiesh
    23193, -- Forming Lok'delar
    23192, -- Forming Rhok'delar
    7054, -- Forsaken Skills
    29480, -- Fortitude of the Scourge
    18763, -- Freeze
    15748, -- Freeze Rookery Egg
    16028, -- Freeze Rookery Egg - Prototype
    11836, -- Freeze Solid
    19755, -- Frightalon
    3131, -- Frost Breath
    23187, -- Frost Burn
    22594, -- Frost Mantle of the Dawn
    3595, -- Frost Oil
    17460, -- Frost Ram
    25178, -- Frost Weakness
    8398, -- Frostbolt Volley
    16992, -- Frostguard
    6957, -- Frostmane Strength
    16056, -- Frostsaber
    23509, -- Frostwolf Howler
    25840, -- Full Heal
    474, -- Fumble
    507, -- Fumble II
    867, -- Fumble III
    6405, -- Furbolg Form
    16997, -- Gargoyle Strike
    8901, -- Gas Bomb
    19470, -- Gem of the Serpent
    2645, -- Ghost Wolf
    6925, -- Gift of the Xavian
    23632, -- Girdle of the Dawn
    3143, -- Glacial Roar
    26105, -- Glare
    6974, -- Gnome Camera Connection
    12904, -- Gnomish Ham Radio
    23453, -- Gnomish Transporter
    12720, -- Goblin "Boom" Box
    7023, -- Goblin Camera Connection
    10837, -- Goblin Land Mine
    12722, -- Goblin Radio
    16060, -- Golden Sabercat
    24967, -- Gong
    11434, -- Gong Zul'Farrak Gong
    22789, -- Gordok Green Grog
    22924, -- Grasping Vines
    18989, -- Gray Kodo
    6777, -- Gray Ram
    459, -- Gray Wolf
    23249, -- Great Brown Kodo
    23248, -- Great Gray Kodo
    25807, -- Great Heal
    23247, -- Great White Kodo
    15441, -- Greater Arcane Amalgamation
    24997, -- Greater Dispel
    25314, -- Greater Heal
    10228, -- Greater Invisibility
    18991, -- Green Kodo
    17453, -- Green Mechanostrider
    17465, -- Green Skeletal Warhorse
    7636, -- Green Woolen Robe
    24195, -- Grom's Tribute
    4153, -- Guile of the Raptor
    24266, -- Gurubashi Mojo Madness
    6982, -- Gust of Wind
    24239, -- Hammer of Wrath
    16988, -- Hammer of the Titans
    18762, -- Hand of Iruxos
    5166, -- Harvest Silithid Egg
    7277, -- Harvest Swarm
    16336, -- Haunting Phantoms
    7057, -- Haunting Spirits
    8812, -- Heal
    21885, -- Heal Vylestem Vine
    22458, -- Healing Circle
    4209, -- Healing Tongue
    4221, -- Healing Tongue II
    9888, -- Healing Touch
    4971, -- Healing Ward
    10396, -- Healing Wave
    11895, -- Healing Wave of Antu'sul
    8690, -- Hearthstone
    16995, -- Heartseeker
    4062, -- Heavy Dynamite
    30297, -- Heightened Senses
    711, -- Hellfire
    1124, -- Hellfire II
    2951, -- Hellfire III
    22566, -- Hex
    7655, -- Hex of Ravenclaw
    12543, -- Hi-Explosive Bomb
    18658, -- Hibernate
    15261, -- Holy Fire
    25292, -- Holy Light
    9481, -- Holy Smite
    10318, -- Holy Wrath
    24165, -- Hoodoo Hex
    14030, -- Hooked Net
    17928, -- Howl of Terror
    7481, -- Howling Rage
    23124, -- Human Orphan Whistle
    11760, -- Hyena Sample
    28163, -- Ice Guard
    16869, -- Ice Tomb
    28526, -- Icebolt
    11131, -- Icicle
    17459, -- Icy Blue Mechanostrider
    6741, -- Identify Brood
    23316, -- Ignite Flesh
    23054, -- Igniting Kroshius
    6487, -- Ilkrud's Guardians
    25309, -- Immolate
    10451, -- Implosion
    16996, -- Incendia Powder
    23308, -- Incinerate
    6234, -- Incineration
    27290, -- Increase Reputation
    4981, -- Inducing Vision
    1122, -- Inferno
    7739, -- Inferno Shell
    9612, -- Ink Spray
    16967, -- Inlaid Thorium Hammer
    8681, -- Instant Poison
    8686, -- Instant Poison II
    8688, -- Instant Poison III
    11338, -- Instant Poison IV
    11339, -- Instant Poison V
    11343, -- Instant Poison VI
    6651, -- Instant Toxin
    22478, -- Intense Pain
    6576, -- Intimidating Growl
    9478, -- Invis Placing Bear Trap
    885, -- Invisibility
    16746, -- Invulnerable Mail
    4068, -- Iron Grenade
    10795, -- Ivory Raptor
    23140, -- J'eevee summons object
    23122, -- Jaina's Autograph
    9744, -- Jarkal's Translation
    11438, -- Join Map Fragments
    8348, -- Julie's Blessing
    9654, -- Jumping Lightning
    12684, -- Kadrak's Flag
    12512, -- Kalaran Conjures Torch
    3121, -- Kev
    10166, -- Khadgar's Unlocking
    22799, -- King of the Gordok
    18153, -- Kodo Kombobulator
    22790, -- Kreeg's Stout Beatdown
    4065, -- Large Copper Bomb
    4075, -- Large Seaforium Charge
    580, -- Large Timber Wolf
    27146, -- Left Piece of Lord Valthalak's Amulet
    15463, -- Legendary Arcane Amalgamation
    10788, -- Leopard
    11534, -- Leper Cure!
    15402, -- Lesser Arcane Amalgamation
    2053, -- Lesser Heal
    27624, -- Lesser Healing Wave
    66, -- Lesser Invisibility
    8256, -- Lethal Toxin
    3243, -- Life Harvest
    9172, -- Lift Seal
    7364, -- Light Torch
    8598, -- Lightning Blast
    15207, -- Lightning Bolt
    20627, -- Lightning Breath
    6535, -- Lightning Cloud
    28297, -- Lightning Totem
    27871, -- Lightwell
    15712, -- Linken's Boomerang
    16729, -- Lionheart Helm
    5401, -- Lizard Bolt
    28785, -- Locust Swarm
    1536, -- Longshot II
    3007, -- Longshot III
    25247, -- Longsight
    26373, -- Lunar Invititation
    13808, -- M73 Frag Grenade
    10346, -- Machine Gun
    17117, -- Magatha Incendia Powder
    3659, -- Mage Sight
    20565, -- Magma Blast
    19484, -- Majordomo Teleport Visual
    10876, -- Mana Burn
    21097, -- Manastorm
    21960, -- Manifest Spirit
    18113, -- Manifestation Cleansing
    23304, -- Manna-Enriched Horse Feed
    15128, -- Mark of Flames
    12198, -- Marksman Hit
    4526, -- Mass Dispell
    25839, -- Mass Healing
    22421, -- Massive Geyser
    16993, -- Masterwork Stormhammer
    19814, -- Masterwork Target Dummy
    29134, -- Maypole
    7920, -- Mebok Smart Drink
    15057, -- Mechanical Patch Kit
    4055, -- Mechanical Squirrel
    11082, -- Megavolt
    21050, -- Melodious Rapture
    5159, -- Melt Ore
    16032, -- Merging Oozes
    25145, -- Merithra's Wake
    29333, -- Midsummer Sausage
    21154, -- Might of Ragnaros
    16600, -- Might of Shahram
    29483, -- Might of the Scourge
    10947, -- Mind Blast
    10912, -- Mind Control
    606, -- Mind Rot
    8272, -- Mind Tremor
    5761, -- Mind-numbing Poison
    8693, -- Mind-numbing Poison II
    11399, -- Mind-numbing Poison III
    23675, -- Minigun
    3611, -- Minion of Morganth
    3537, -- Minions of Malathrom
    5567, -- Miring Mud
    8138, -- Mirkfallon Fungus
    26218, -- Mistletoe
    12421, -- Mithril Frag Bomb
    12900, -- Mobile Alarm
    15095, -- Molten Blast
    5213, -- Molten Metal
    25150, -- Molten Rain
    20528, -- Mor'rogal Enchant
    16084, -- Mottled Red Raptor
    14928, -- Nagmara's Love Potion
    25688, -- Narain!
    7967, -- Naralex's Nightmare
    25180, -- Nature Weakness
    16069, -- Nefarius Attack 001
    7673, -- Nether Gem
    8088, -- Nightcrawlers
    23653, -- Nightfall
    16055, -- Nightsaber
    6199, -- Nostalgia
    7994, -- Nullify Mana
    16528, -- Numbing Pain
    10798, -- Obsidian Raptor
    11437, -- Opening Chest
    23125, -- Orcish Orphan Whistle
    26063, -- Ouro Submerge Visual
    8153, -- Owl Form
    16379, -- Ozzie Explodes
    471, -- Palamino Stallion
    16082, -- Palomino Stallion
    10787, -- Panther
    17176, -- Panther Cage Key
    8363, -- Parasite
    6758, -- Party Fever
    5668, -- Peasant Disguise
    5669, -- Peon Disguise
    11048, -- Perm. Illusion Bishop Tyriona
    11067, -- Perm. Illusion Tyrion
    27830, -- Persuader
    6461, -- Pick Lock
    16429, -- Piercing Shadow
    4982, -- Pillar Delving
    472, -- Pinto Horse
    15728, -- Plague Cloud
    3429, -- Plague Mind
    28614, -- Pointy Spike
    21067, -- Poison Bolt
    11790, -- Poison Cloud
    25748, -- Poison Stinger
    5208, -- Poisoned Harpoon
    8275, -- Poisoned Shot
    4286, -- Poisonous Spit
    28089, -- Polarity Shift
    28271, -- Polymorph
    28270, -- Polymorph: Cow
    11419, -- Portal: Darnassus
    11416, -- Portal: Ironforge
    28148, -- Portal: Karazhan
    11417, -- Portal: Orgrimmar
    10059, -- Portal: Stormwind
    11420, -- Portal: Thunder Bluff
    11418, -- Portal: Undercity
    23680, -- Portals Deck
    7638, -- Potion Toss
    29467, -- Power of the Scourge
    23008, -- Powerful Seaforium Charge
    10850, -- Powerful Smelling Salts
    25841, -- Prayer of Elune
    25316, -- Prayer of Healing
    3109, -- Presence of Death
    24149, -- Presence of Might
    24164, -- Presence of Sight
    16058, -- Primal Leopard
    13912, -- Princess Summons Portal
    24167, -- Prophetic Aura
    7120, -- Proudmoore's Defense
    15050, -- Psychometry
    16072, -- Purify and Place Food
    22313, -- Purple Hands
    17455, -- Purple Mechanostrider
    23246, -- Purple Skeletal Warhorse
    18809, -- Pyroblast
    3229, -- Quick Bloodlust
    4979, -- Quick Flame Ward
    4980, -- Quick Frost Ward
    9771, -- Radiation Bolt
    3387, -- Rage of Thule
    20568, -- Ragnaros Emerge
    4629, -- Rain of Fire
    28353, -- Raise Dead
    17235, -- Raise Undead Scarab
    5316, -- Raptor Feather
    5280, -- Razor Mane
    20748, -- Rebirth
    22563, -- Recall
    21950, -- Recite Words of Celebras
    4093, -- Reconstruction
    17456, -- Red & Blue Mechanostrider
    10873, -- Red Mechanostrider
    17462, -- Red Skeletal Horse
    22722, -- Red Skeletal Warhorse
    16080, -- Red Wolf
    23254, -- Redeeming the Soul
    20773, -- Redemption
    22430, -- Refined Scale of Onyxia
    9858, -- Regrowth
    25952, -- Reindeer Dust Effect
    23180, -- Release Imp
    23136, -- Release J'eevee
    10617, -- Release Rageclaw
    17166, -- Release Umi's Yeti
    16502, -- Release Winna's Kitten
    12851, -- Release the Hounds
    16031, -- Releasing Corrupt Ooze
    6656, -- Remote Detonate
    22027, -- Remove Insignia
    8362, -- Renew
    11923, -- Repair the Blade of Heroes
    455, -- Replenish Spirit
    932, -- Replenish Spirit II
    29475, -- Resilience of the Scourge
    4961, -- Resupply
    20770, -- Resurrection
    30081, -- Retching Plague
    5161, -- Revive Dig Rat
    982, -- Revive Pet
    15591, -- Revive Ringo
    18363, -- Riding Kodo
    30174, -- Riding Turtle
    9614, -- Rift Beacon
    27738, -- Right Piece of Lord Valthalak's Amulet
    461, -- Righteous Flame On
    18540, -- Ritual of Doom
    18541, -- Ritual of Doom Effect
    698, -- Ritual of Summoning
    7720, -- Ritual of Summoning Effect
    1940, -- Rocket Blast
    15750, -- Rookery Whelp Spawn-in Spell
    26137, -- Rotate Trigger
    4064, -- Rough Copper Bomb
    20875, -- Rumsey Rum
    25804, -- Rumsey Rum Black Label
    25722, -- Rumsey Rum Dark
    25037, -- Rumsey Rum Light
    16980, -- Rune Edge
    3407, -- Rune of Opening
    20051, -- Runed Arcanite Rod
    21403, -- Ryson's All Seeing Eye
    21425, -- Ryson's Eye in the Sky
    1050, -- Sacrifice
    10459, -- Sacrifice Spinneret
    27832, -- Sageblade
    19566, -- Salt Shaker
    26102, -- Sand Blast
    20716, -- Sand Breath
    3204, -- Sapper Explode
    6490, -- Sarilus's Elementals
    28161, -- Savage Guard
    14327, -- Scare Beast
    9232, -- Scarlet Resurrection
    15125, -- Scarshield Portal
    10207, -- Scorch
    11761, -- Scorpid Sample
    13630, -- Scraping
    7960, -- Scry on Azrethoc
    22949, -- Seal Felvine Shard
    9552, -- Searing Flames
    17923, -- Searing Pain
    6358, -- Seduction
    17196, -- Seeping Willow
    5407, -- Segra Darkthorn Effect
    9879, -- Self Destruct
    9575, -- Self Detonation
    18976, -- Self Resurrection
    16983, -- Serenity
    6270, -- Serpentine Cleansing
    6626, -- Set NG-5 Charge (Blue)
    6630, -- Set NG-5 Charge (Red)
    10955, -- Shackle Undead
    11661, -- Shadow Bolt
    14871, -- Shadow Bolt Misfire
    14887, -- Shadow Bolt Volley
    22979, -- Shadow Flame
    28165, -- Shadow Guard
    22596, -- Shadow Mantle of the Dawn
    1112, -- Shadow Nova II
    7136, -- Shadow Port
    17950, -- Shadow Portal
    9657, -- Shadow Shell
    25183, -- Shadow Weakness
    22681, -- Shadowblink
    7761, -- Shared Bonds
    2828, -- Sharpen Blade
    2829, -- Sharpen Blade II
    2830, -- Sharpen Blade III
    9900, -- Sharpen Blade IV
    16138, -- Sharpen Blade V
    22756, -- Sharpen Weapon - Critical
    11402, -- Shay's Bell
    3651, -- Shield of Reflection
    8087, -- Shiny Bauble
    28099, -- Shock
    1698, -- Shockwave
    2480, -- Shoot Bow
    7919, -- Shoot Crossbow
    7918, -- Shoot Gun
    25031, -- Shoot Missile
    25030, -- Shoot Rocket
    21559, -- Shredder Armor Melt
    10096, -- Shrink
    14227, -- Signing
    26069, -- Silence
    8137, -- Silithid Pox
    7077, -- Simple Teleport
    7078, -- Simple Teleport Group
    7079, -- Simple Teleport Other
    8980, -- Skeletal Horse
    6469, -- Skeletal Miner Explode
    29059, -- Skeletal Steed
    11605, -- Slam
    8809, -- Slave Drain
    1090, -- Sleep
    28311, -- Slime Bolt
    6530, -- Sling Dirt
    3650, -- Sling Mud
    3332, -- Slow Poison
    1056, -- Slow Poison II
    7992, -- Slowing Poison
    6814, -- Sludge Toxin
    4066, -- Small Bronze Bomb
    22967, -- Smelt Elementium
    10934, -- Smite
    27572, -- Smitten
    12460, -- Sniper Scope
    21935, -- SnowMaster 9000
    21848, -- Snowman
    8283, -- Snufflenose Command
    3206, -- Sol H
    3120, -- Sol L
    3205, -- Sol M
    3207, -- Sol U
    9901, -- Soothe Animal
    11016, -- Soul Bite
    17506, -- Soul Breaker
    17048, -- Soul Claim
    12667, -- Soul Consumption
    7295, -- Soul Drain
    17924, -- Soul Fire
    10771, -- Soul Shatter
    20762, -- Soulstone Resurrection
    5264, -- South Seas Pirate Disguise
    6252, -- Southsea Cannon Fire
    21027, -- Spark
    16447, -- Spawn Challenge to Urok
    3644, -- Speak with Heads
    31364, -- Spice Mortar
    28615, -- Spike Volley
    8016, -- Spirit Decay
    17680, -- Spirit Spawn-out
    3477, -- Spirit Steal
    10789, -- Spotted Frostsaber
    10792, -- Spotted Panther
    17155, -- Sprinkling Purified Water
    3975, -- Standard Scope
    25298, -- Starfire
    15781, -- Steel Mechanostrider
    10254, -- Stone Dwarf Awaken Visual
    28995, -- Stoneskin
    5265, -- Stonesplinter Trogg Disguise
    20685, -- Storm Bolt
    23510, -- Stormpike Battle Charger
    18163, -- Strength of Arko'narin
    4539, -- Strength of the Ages
    26181, -- Strike
    24245, -- String Together Heads
    8394, -- Striped Frostsaber
    10793, -- Striped Nightsaber
    16741, -- Stronghold Gauntlets
    7355, -- Stuck
    16497, -- Stun Bomb
    21188, -- Stun Bomb Attack
    26234, -- Submerge Visual
    15734, -- Summon
    23004, -- Summon Alarm-o-Bot
    10713, -- Summon Albino Snake
    23428, -- Summon Albino Snapjaw
    15033, -- Summon Ancient Spirits
    10685, -- Summon Ancona
    13978, -- Summon Aquementas
    22567, -- Summon Ar'lia
    12151, -- Summon Atal'ai Skeleton
    10696, -- Summon Azure Whelpling
    25849, -- Summon Baby Shark
    10714, -- Summon Black Kingsnake
    26656, -- Summon Black Qiraji Battle Tank
    15794, -- Summon Blackhand Dreadweaver
    15792, -- Summon Blackhand Veteran
    17567, -- Summon Blood Parrot
    13463, -- Summon Bloodpetal Mini Pests
    25953, -- Summon Blue Qiraji Battle Tank
    10715, -- Summon Blue Racer
    8286, -- Summon Boar Spirit
    15048, -- Summon Bomb
    10673, -- Summon Bombay
    10699, -- Summon Bronze Whelpling
    10716, -- Summon Brown Snake
    17169, -- Summon Carrion Scarab
    23214, -- Summon Charger
    10680, -- Summon Cockatiel
    10681, -- Summon Cockatoo
    10688, -- Summon Cockroach
    15647, -- Summon Common Kitten
    10674, -- Summon Cornish Rex
    15648, -- Summon Corrupted Kitten
    10710, -- Summon Cottontail Rabbit
    10717, -- Summon Crimson Snake
    10697, -- Summon Crimson Whelpling
    8606, -- Summon Cyclonian
    4945, -- Summon Dagun
    10695, -- Summon Dark Whelpling
    10701, -- Summon Dart Frog
    9097, -- Summon Demon of the Orb
    17708, -- Summon Diablo
    25162, -- Summon Disgusting Oozeling
    23161, -- Summon Dreadsteed
    10705, -- Summon Eagle Owl
    12189, -- Summon Echeyakee
    11840, -- Summon Edana Hatetalon
    8677, -- Summon Effect
    10721, -- Summon Elven Wisp
    10869, -- Summon Embers
    10698, -- Summon Emerald Whelpling
    10700, -- Summon Faeling
    13548, -- Summon Farm Chicken
    691, -- Summon Felhunter
    5784, -- Summon Felsteed
    16531, -- Summon Frail Skeleton
    19561, -- Summon Gnashjaw
    13258, -- Summon Goblin Bomb
    10707, -- Summon Great Horned Owl
    26056, -- Summon Green Qiraji Battle Tank
    10718, -- Summon Green Water Snake
    10683, -- Summon Green Wing Macaw
    7762, -- Summon Gunther's Visage
    27241, -- Summon Gurky
    10706, -- Summon Hawk Owl
    23432, -- Summon Hawksbill Snapjaw
    4950, -- Summon Helcular's Puppets
    30156, -- Summon Hippogryph Hatchling
    10682, -- Summon Hyacinth Macaw
    15114, -- Summon Illusionary Dreamwatchers
    6905, -- Summon Illusionary Nightmare
    8986, -- Summon Illusionary Phantasm
    17231, -- Summon Illusory Wraith
    688, -- Summon Imp
    12740, -- Summon Infernal Servant
    12199, -- Summon Ishamuhale
    10702, -- Summon Island Frog
    23811, -- Summon Jubling
    20737, -- Summon Karang's Banner
    23431, -- Summon Leatherback Snapjaw
    19772, -- Summon Lifelike Toad
    5110, -- Summon Living Flame
    23429, -- Summon Loggerhead Snapjaw
    20693, -- Summon Lost Amulet
    18974, -- Summon Lunaclaw
    7132, -- Summon Lupine Delusions
    27291, -- Summon Magic Staff
    18166, -- Summon Magram Ravager
    10675, -- Summon Maine Coon
    12243, -- Summon Mechanical Chicken
    18476, -- Summon Minion
    28739, -- Summon Mr. Wiggles
    25018, -- Summon Murki
    24696, -- Summon Murky
    4141, -- Summon Myzrael
    22876, -- Summon Netherwalker
    23430, -- Summon Olive Snapjaw
    17646, -- Summon Onyxia Whelp
    10676, -- Summon Orange Tabby
    23012, -- Summon Orphan
    17707, -- Summon Panda
    28505, -- Summon Poley
    10686, -- Summon Prairie Chicken
    10709, -- Summon Prairie Dog
    19774, -- Summon Ragnaros
    13143, -- Summon Razelikh
    26054, -- Summon Red Qiraji Battle Tank
    3605, -- Summon Remote-Controlled Golem
    10719, -- Summon Ribbon Snake
    3363, -- Summon Riding Gryphon
    17618, -- Summon Risen Lackey
    15049, -- Summon Robot
    16381, -- Summon Rockwing Gargoyles
    15745, -- Summon Rookery Whelp
    10720, -- Summon Scarlet Snake
    12699, -- Summon Screecher Spirit
    10684, -- Summon Senegal
    12258, -- Summon Shadowcaster
    21181, -- Summon Shadowstrike
    3655, -- Summon Shield Guard
    16796, -- Summon Shy-Rotam
    10677, -- Summon Siamese
    10678, -- Summon Silver Tabby
    17204, -- Summon Skeleton
    11209, -- Summon Smithing Hammer
    16450, -- Summon Smolderweb
    10711, -- Summon Snowshoe Rabbit
    10708, -- Summon Snowy Owl
    6918, -- Summon Snufflenose
    13895, -- Summon Spawn of Bael'Gar
    28738, -- Summon Speedy
    3657, -- Summon Spell Guard
    11548, -- Summon Spider God
    3652, -- Summon Spirit of Old
    10712, -- Summon Spotted Rabbit
    15067, -- Summon Sprite Darter Hatchling
    712, -- Summon Succubus
    9461, -- Summon Swamp Ooze
    9636, -- Summon Swamp Spirit
    3722, -- Summon Syndicate Spectre
    28487, -- Summon Terky
    7076, -- Summon Tervosh's Minion
    3658, -- Summon Theurgist
    21180, -- Summon Thunderstrike
    5666, -- Summon Timberling
    23531, -- Summon Tiny Green Dragon
    23530, -- Summon Tiny Red Dragon
    26010, -- Summon Tranquil Mechanical Yeti
    20702, -- Summon Treant Allies
    12554, -- Summon Treasure Horde
    12564, -- Summon Treasure Horde Visual
    10704, -- Summon Tree Frog
    7949, -- Summon Viper
    697, -- Summon Voidwalker
    13819, -- Summon Warhorse
    17162, -- Summon Water Elemental
    28740, -- Summon Whiskers
    10679, -- Summon White Kitten
    10687, -- Summon White Plymouth Rock
    30152, -- Summon White Tiger Cub
    11017, -- Summon Witherbark Felhunter
    10703, -- Summon Wood Frog
    15999, -- Summon Worg Pup
    23152, -- Summon Xorothian Dreadsteed
    26055, -- Summon Yellow Qiraji Battle Tank
    17709, -- Summon Zergling
    16590, -- Summon Zombie
    16473, -- Summoned Urok
    25186, -- Super Crystal
    15869, -- Superior Healing Ward
    26103, -- Sweep
    27722, -- Sweet Surprise
    23241, -- Swift Blue Raptor
    23238, -- Swift Brown Ram
    23229, -- Swift Brown Steed
    23250, -- Swift Brown Wolf
    23220, -- Swift Dawnsaber
    23221, -- Swift Frostsaber
    23239, -- Swift Gray Ram
    23252, -- Swift Gray Wolf
    23225, -- Swift Green Mechanostrider
    23219, -- Swift Mistsaber
    23242, -- Swift Olive Raptor
    23243, -- Swift Orange Raptor
    23227, -- Swift Palomino
    24242, -- Swift Razzashi Raptor
    23338, -- Swift Stormsaber
    23251, -- Swift Timber Wolf
    23223, -- Swift White Mechanostrider
    23240, -- Swift White Ram
    23228, -- Swift White Steed
    23222, -- Swift Yellow Mechanostrider
    24252, -- Swift Zulian Tiger
    8593, -- Symbol of Life
    24160, -- Syncretist's Sigil
    3718, -- Syndicate Bomb
    5266, -- Syndicate Disguise
    18969, -- Taelan Death
    17161, -- Taking Moon Well Sample
    9795, -- Talvash's Necklace Repair
    20041, -- Tammra Sapling
    16059, -- Tawny Sabercat
    2817, -- Teach Bark of Doom
    18992, -- Teal Kodo
    12521, -- Teleport from Azshara Tower
    12509, -- Teleport to Azshara Tower
    3565, -- Teleport: Darnassus
    3562, -- Teleport: Ironforge
    18960, -- Teleport: Moonglade
    3567, -- Teleport: Orgrimmar
    3561, -- Teleport: Stormwind
    3566, -- Teleport: Thunder Bluff
    3563, -- Teleport: Undercity
    6755, -- Tell Joke
    16378, -- Temperature Reading
    9456, -- Tharnariun Cure 1
    9457, -- Tharnariun's Heal
    12562, -- The Big One
    22989, -- The Breaking
    21953, -- The Feast of Winter Veil
    22990, -- The Forming
    19769, -- Thorium Grenade
    24649, -- Thousand Blades
    24314, -- Threatening Gaze
    5781, -- Threatening Growl
    16075, -- Throw Axe
    27662, -- Throw Cupid's Dart
    14814, -- Throw Dark Iron Ale
    7978, -- Throw Dynamite
    25004, -- Throw Nightmare Object
    4164, -- Throw Rock
    4165, -- Throw Rock II
    10790, -- Tiger
    23312, -- Time Lapse
    25158, -- Time Stop
    6470, -- Tiny Bronze Key
    6471, -- Tiny Iron Key
    27829, -- Titanic Leggings
    29116, -- Toast Smorc
    29334, -- Toasted Smorc
    27739, -- Top Piece of Lord Valthalak's Amulet
    12511, -- Torch Combine
    6257, -- Torch Toss
    28806, -- Toss Fuel on Bonfire
    24706, -- Toss Stink Bomb
    3108, -- Touch of Death
    3263, -- Touch of Ravenclaw
    16554, -- Toxic Bolt
    7125, -- Toxic Saliva
    7951, -- Toxic Spit
    19877, -- Tranquilizing Shot
    7821, -- Transform Victim
    25146, -- Transmute: Elemental Fire
    4320, -- Trelane's Freezing Touch
    20804, -- Triage
    785, -- True Fulfillment
    10348, -- Tune Up
    10326, -- Turn Undead
    10796, -- Turquoise Raptor
    10340, -- Uldaman Boss Agro
    9577, -- Uldaman Key Staff
    11568, -- Uldaman Sub-Boss Agro
    20006, -- Unholy Curse
    3670, -- Unlock Maury's Foot
    10738, -- Unlocking
    17454, -- Unpainted Mechanostrider
    24024, -- Unstable Concoction
    16562, -- Urok Minions Vanish
    19719, -- Use Bauble
    24194, -- Uther's Tribute
    7068, -- Veil of Shadow
    15664, -- Venom Spit
    6354, -- Venom's Bane
    27721, -- Very Berry Cream
    18115, -- Viewing Room Student Transform - Effect
    10799, -- Violet Raptor
    17529, -- Vitreous Focuser
    24163, -- Vodouisant's Vigilant Embrace
    21066, -- Void Bolt
    5252, -- Voidwalker Guardian
    18149, -- Volatile Infection
    16984, -- Volcanic Hammer
    1540, -- Volley
    3013, -- Volley II
    17009, -- Voodoo
    8277, -- Voodoo Hex
    17639, -- Wail of the Banshee
    3436, -- Wandering Plague
    20549, -- War Stomp
    23678, -- Warlord Deck
    16801, -- Warosh's Transform
    7383, -- Water Bubble
    9583, -- Water Sample
    6949, -- Weak Frostbolt
    7220, -- Weapon Chain
    7218, -- Weapon Counterweight
    11410, -- Whirling Barrage
    15779, -- White Mechanostrider
    6898, -- White Ram
    468, -- White Stallion
    16724, -- Whitesoul Helm
    4520, -- Wide Sweep
    28732, -- Widow's Embrace
    9616, -- Wild Regeneration
    16598, -- Will of Shahram
    23339, -- Wing Buffet
    581, -- Winter Wolf
    21736, -- Winterax Wisdom
    17229, -- Winterspring Frostsaber
    22662, -- Wither
    4974, -- Wither Touch
    25121, -- Wizard Oil
    28800, -- Word of Thawing
    30732, -- Worm Sweep
    13227, -- Wound Poison
    13228, -- Wound Poison II
    13229, -- Wound Poison III
    13230, -- Wound Poison IV
    9912, -- Wrath
    3607, -- Yenniku's Release
    24422, -- Zandalar Signet of Might
    24421, -- Zandalar Signet of Mojo
    24420, -- Zandalar Signet of Serenity
    10181, -- Frostbolt (needs to be last for chinese clients, see issue #16)
}

local counter, cursor = 0, 1
local castedSpells = {}
ClassicCastbars.castedSpells = castedSpells

-- TODO: cleanup
local function BuildSpellNameToSpellIDTable()
    counter = 0

    for i = cursor, #castSpellIDs do
        local spellName = GetSpellInfo(castSpellIDs[i])
        if spellName then
            castedSpells[spellName] = castSpellIDs[i]
        end

        cursor = i + 1
        counter = counter + 1
        if counter > 200 then
            break
        end
    end

    if cursor < #castSpellIDs then
        C_Timer.After(2, BuildSpellNameToSpellIDTable)
    else
        castSpellIDs = nil
    end
end

C_Timer.After(0.1, BuildSpellNameToSpellIDTable) -- run asap once the current call stack has executed

-- For channeled spells we need both the spell ID and cast time since
-- GetSpellInfo doesn't return any cast time for channeled casts.
-- value[1] is the cast time in seconds, value[2] is the spell ID used to retrive
-- spell icon later on.
-- TODO: merge with main spell table and just store the cast time here as table value
ClassicCastbars.channeledSpells = {
    -- MISC
    [GetSpellInfo(746)] = { 8, 746 },         -- First Aid
    [GetSpellInfo(13278)] = { 4, 13278 },     -- Gnomish Death Ray
    [GetSpellInfo(20577)] = { 10, 20577 },    -- Cannibalize
    [GetSpellInfo(10797)] = { 6, 10797 },     -- Starshards

    -- DRUID
    [GetSpellInfo(17401)] = { 10, 17401 },   -- Hurricane
    [GetSpellInfo(740)] = { 10, 740 },       -- Tranquility

    -- HUNTER
    [GetSpellInfo(6197)] = { 60, 6197 },      -- Eagle Eye
    [GetSpellInfo(1002)] = { 60, 1002 },      -- Eyes of the Beast
    [GetSpellInfo(1510)] = { 6, 1510 },       -- Volley

    -- MAGE
    [GetSpellInfo(5143)] = { 5, 5143, },       -- Arcane Missiles
    [GetSpellInfo(10)] = { 8, 10 },            -- Blizzard
    [GetSpellInfo(12051)] = { 8, 12051 },      -- Evocation

    -- PRIEST
    [GetSpellInfo(15407)] = { 3, 15407 },     -- Mind Flay
    [GetSpellInfo(2096)] = { 60, 2096 },      -- Mind Vision
    [GetSpellInfo(605)] = { 3, 605 },         -- Mind Control

    -- WARLOCK
    [GetSpellInfo(126)] = { 45, 126 },        -- Eye of Kilrogg
    [GetSpellInfo(689)] = { 5, 689 },         -- Drain Life
    [GetSpellInfo(5138)] = { 5, 5138 },       -- Drain Mana
    [GetSpellInfo(1120)] = { 15, 1120 },      -- Drain Soul
    [GetSpellInfo(5740)] = { 8, 5740 },       -- Rain of Fire
    [GetSpellInfo(1949)] = { 15, 1949 },      -- Hellfire
    [GetSpellInfo(755)] = { 10, 755 },        -- Health Funnel
    [GetSpellInfo(17854)] = { 10, 17854 },    -- Consume Shadows
    [GetSpellInfo(6358)] = { 15, 6358 },      -- Seduction Channel
}

-- List of abilities that increases cast time (reduces speed)
-- Value here is the slow percentage, from highest spell rank.
-- TODO: check if these also affect Aimed Shot/Volley + bosses
ClassicCastbars.castTimeIncreases = {
    -- WARLOCK
    [GetSpellInfo(1714)] = 60,    -- Curse of Tongues
    [GetSpellInfo(1098)] = 30,    -- Enslave Demon

    -- ROGUE
    [GetSpellInfo(5760)] = 60,    -- Mind-Numbing Poison

    -- ITEMS
    [GetSpellInfo(17331)] = 10,   -- Fang of the Crystal Spider

    -- NPCS
    [GetSpellInfo(7127)] = 20,    -- Wavering Will
    [GetSpellInfo(7102)] = 25,    -- Contagion of Rot
    [GetSpellInfo(3603)] = 35,    -- Distracting Pain
    [GetSpellInfo(8140)] = 50,    -- Befuddlement
    [GetSpellInfo(8272)] = 20,    -- Mind Tremor
    [GetSpellInfo(12255)] = 15,   -- Curse of Tuten'kash
    [GetSpellInfo(10651)] = 20,   -- Curse of the Eye
    [GetSpellInfo(14538)] = 35,   -- Aural Shock
    [GetSpellInfo(22247)] = 80,   -- Suppression Aura
    [GetSpellInfo(22642)] = 50,   -- Brood Power: Bronze
    [GetSpellInfo(23153)] = 50,   -- Brood Power: Blue
    [GetSpellInfo(24415)] = 50,   -- Slow
    [GetSpellInfo(19365)] = 50,   -- Ancient Dread
    [GetSpellInfo(28732)] = 25,   -- Widow's Embrace
    [GetSpellInfo(22909)] = 50,   -- Eye of Immol'thar
}

-- Spells that have cast time reduced by talents.
ClassicCastbars.castTimeTalentDecreases = {
    [GetSpellInfo(403)] = 2000,      -- Lightning Bolt
    [GetSpellInfo(421)] = 1500,      -- Chain Lightning
    [GetSpellInfo(6353)] = 4000,     -- Soul Fire
    [GetSpellInfo(116)] = 2500,      -- Frostbolt
    [GetSpellInfo(133)] = 3000,      -- Fireball
    [GetSpellInfo(686)] = 2500,      -- Shadow Bolt
    [GetSpellInfo(348)] = 1500,      -- Immolate
    [GetSpellInfo(331)] = 2500,      -- Healing Wave
    [GetSpellInfo(585)] = 2000,      -- Smite
    [GetSpellInfo(14914)] = 3000,    -- Holy Fire
    [GetSpellInfo(2054)] = 2500,     -- Heal
    [GetSpellInfo(25314)] = 2500,    -- Greater Heal
    [GetSpellInfo(8129)] = 2500,     -- Mana Burn
    [GetSpellInfo(5176)] = 1500,     -- Wrath
    [GetSpellInfo(2912)] = 3000,     -- Starfire
    [GetSpellInfo(5185)] = 3000,     -- Healing Touch
    [GetSpellInfo(2645)] = 1000,     -- Ghost Wolf
    [GetSpellInfo(691)] = 6000,      -- Summon Felhunter
    [GetSpellInfo(688)] = 6000,      -- Summon Imp
    [GetSpellInfo(697)] = 6000,      -- Summon Voidwalker
    [GetSpellInfo(712)] = 6000,      -- Summon Succubus
    [GetSpellInfo(982)] = 4000,      -- Revive Pet
}

-- List of crowd controls.
-- We want to stop the castbar when these auras are detected
-- as SPELL_CAST_FAILED is not triggered when an unit gets CC'ed.
ClassicCastbars.crowdControls = {
    [GetSpellInfo(5211)] = 1,       -- Bash
    [GetSpellInfo(24394)] = 1,      -- Intimidation
    [GetSpellInfo(853)] = 1,        -- Hammer of Justice
    [GetSpellInfo(22703)] = 1,      -- Inferno Effect (Summon Infernal)
    [GetSpellInfo(408)] = 1,        -- Kidney Shot
    [GetSpellInfo(12809)] = 1,      -- Concussion Blow
    [GetSpellInfo(20253)] = 1,      -- Intercept Stun
    [GetSpellInfo(20549)] = 1,      -- War Stomp
    [GetSpellInfo(2637)] = 1,       -- Hibernate
    [GetSpellInfo(3355)] = 1,       -- Freezing Trap
    [GetSpellInfo(19386)] = 1,      -- Wyvern Sting
    [GetSpellInfo(118)] = 1,        -- Polymorph
    [GetSpellInfo(28271)] = 1,      -- Polymorph: Turtle
    [GetSpellInfo(28272)] = 1,      -- Polymorph: Pig
    [GetSpellInfo(20066)] = 1,      -- Repentance
    [GetSpellInfo(1776)] = 1,       -- Gouge
    [GetSpellInfo(6770)] = 1,       -- Sap
    [GetSpellInfo(1513)] = 1,       -- Scare Beast
    [GetSpellInfo(8122)] = 1,       -- Psychic Scream
    [GetSpellInfo(2094)] = 1,       -- Blind
    [GetSpellInfo(5782)] = 1,       -- Fear
    [GetSpellInfo(5484)] = 1,       -- Howl of Terror
    [GetSpellInfo(6358)] = 1,       -- Seduction
    [GetSpellInfo(5246)] = 1,       -- Intimidating Shout
    [GetSpellInfo(6789)] = 1,       -- Death Coil
    [GetSpellInfo(9005)] = 1,       -- Pounce
    [GetSpellInfo(1833)] = 1,       -- Cheap Shot
    [GetSpellInfo(16922)] = 1,      -- Improved Starfire
    [GetSpellInfo(19410)] = 1,      -- Improved Concussive Shot
    [GetSpellInfo(12355)] = 1,      -- Impact
    [GetSpellInfo(20170)] = 1,      -- Seal of Justice Stun
    [GetSpellInfo(15269)] = 1,      -- Blackout
    [GetSpellInfo(18093)] = 1,      -- Pyroclasm
    [GetSpellInfo(12798)] = 1,      -- Revenge Stun
    [GetSpellInfo(5530)] = 1,       -- Mace Stun
    [GetSpellInfo(19503)] = 1,      -- Scatter Shot
    [GetSpellInfo(605)] = 1,        -- Mind Control
    [GetSpellInfo(7922)] = 1,       -- Charge Stun
    [GetSpellInfo(18469)] = 1,      -- Counterspell - Silenced
    [GetSpellInfo(15487)] = 1,      -- Silence
    [GetSpellInfo(18425)] = 1,      -- Kick - Silenced
    [GetSpellInfo(24259)] = 1,      -- Spell Lock
    [GetSpellInfo(18498)] = 1,      -- Shield Bash - Silenced

    -- ITEMS
    [GetSpellInfo(13327)] = 1,      -- Reckless Charge
    [GetSpellInfo(1090)] = 1,       -- Sleep
    [GetSpellInfo(5134)] = 1,       -- Flash Bomb Fear
    [GetSpellInfo(19821)] = 1,      -- Arcane Bomb Silence
    [GetSpellInfo(4068)] = 1,       -- Iron Grenade
    [GetSpellInfo(19769)] = 1,      -- Thorium Grenade
    [GetSpellInfo(13808)] = 1,      -- M73 Frag Grenade
    [GetSpellInfo(4069)] = 1,       -- Big Iron Bomb
    [GetSpellInfo(12543)] = 1,      -- Hi-Explosive Bomb
    [GetSpellInfo(4064)] = 1,       -- Rough Copper Bomb
    [GetSpellInfo(12421)] = 1,      -- Mithril Frag Bomb
    [GetSpellInfo(19784)] = 1,      -- Dark Iron Bomb
    [GetSpellInfo(4067)] = 1,       -- Big Bronze Bomb
    [GetSpellInfo(4066)] = 1,       -- Small Bronze Bomb
    [GetSpellInfo(4065)] = 1,       -- Large Copper Bomb
    [GetSpellInfo(13237)] = 1,      -- Goblin Mortar
    [GetSpellInfo(835)] = 1,        -- Tidal Charm
    [GetSpellInfo(13181)] = 1,      -- Gnomish Mind Control Cap
    [GetSpellInfo(12562)] = 1,      -- The Big One
    [GetSpellInfo(15283)] = 1,      -- Stunning Blow (Weapon Proc)
    [GetSpellInfo(56)] = 1,         -- Stun (Weapon Proc)
    [GetSpellInfo(26108)] = 1,      -- Glimpse of Madness
}

-- Addon Savedvariables
ClassicCastbars.defaultConfig = {
    version = "13", -- settings version
    pushbackDetect = true,
    movementDetect = true,
    locale = GetLocale(),

    nameplate = {
        enabled = true,
        width = 102,
        height = 6,
        iconSize = 16,
        showCastInfoOnly = false,
        showTimer = true,
        autoPosition = true,
        castFont = _G.STANDARD_TEXT_FONT,
        castFontSize = 8,
        castStatusBar = "Interface\\Addons\\_ShiGuang\\Media\\normTex",  --"Interface\\TargetingFrame\\UI-StatusBar",
        castBorder = "Interface\\Tooltips\\ChatBubble-Backdrop",  --"Interface\\CastingBar\\UI-CastingBar-Border-Small"
        hideIconBorder = false,
        position = { "CENTER", -1, -12 },
        iconPositionX = -3,
        iconPositionY = 0,
        borderColor = { 1, 0.8, 0, 1 },
        statusColor = { 1, 0.7, 0, 1 },
        statusColorChannel = { 0, 1, 0, 1 },
        textColor = { 1, 1, 1, 1 },
        textPositionX = 6,
        textPositionY = -1,
        frameLevel = 10,
        statusBackgroundColor = { 0, 0, 0, 0.535 },
    },

    target = {
        enabled = true,
        width = 150,
        height = 15,
        iconSize = 16,
        showCastInfoOnly = false,
        showTimer = false,
        autoPosition = true,
        castFont = _G.STANDARD_TEXT_FONT,
        castFontSize = 10,
        castStatusBar = "Interface\\TargetingFrame\\UI-StatusBar",
        castBorder = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
        hideIconBorder = false,
        position = { "CENTER", -18, -87 },
        iconPositionX = -5,
        iconPositionY = 0,
        borderColor = { 1, 1, 1, 1 },
        statusColor = { 1, 0.7, 0, 1 },
        statusColorChannel = { 0, 1, 0, 1 },
        textColor = { 1, 1, 1, 1 },
        textPositionX = 6,
        textPositionY = -1,
        frameLevel = 10,
        statusBackgroundColor = { 0, 0, 0, 0.535 },
    },

    party = {
        enabled = true,
        width = 120,
        height = 12,
        iconSize = 16,
        showCastInfoOnly = false,
        showTimer = false,
        autoPosition = false,
        castFont = _G.STANDARD_TEXT_FONT,
        castFontSize = 9,
        castStatusBar = "Interface\\Addons\\_ShiGuang\\Media\\normTex",
        castBorder = "Interface\\Tooltips\\ChatBubble-Backdrop",
        hideIconBorder = false,
        position = { "CENTER", -143.5, -5 },
        iconPositionX = -5,
        iconPositionY = 0,
        borderColor = { 1, 1, 1, 1 },
        statusColor = { 1, 0.7, 0, 1 },
        statusColorChannel = { 0, 1, 0, 1 },
        textColor = { 1, 1, 1, 1 },
        textPositionX = 0,
        textPositionY = 0,
        frameLevel = 10,
        statusBackgroundColor = { 0, 0, 0, 0.535 },
    },

    player = {
        enabled = false,
        width = 190,
        height = 19,
        iconSize = 16,
        showCastInfoOnly = false,
        showTimer = false,
        autoPosition = true,
        castFont = _G.STANDARD_TEXT_FONT,
        castFontSize = 12,
        castStatusBar = "Interface\\TargetingFrame\\UI-StatusBar",
        castBorder = "Interface\\CastingBar\\UI-CastingBar-Border",
        hideIconBorder = false,
        position = { "CENTER", -18, -87 },
        iconPositionX = -5,
        iconPositionY = 0,
        borderColor = { 1, 1, 1, 1 },
        statusColor = { 1, 0.7, 0, 1 },
        statusColorChannel = { 0, 1, 0, 1 },
        textColor = { 1, 1, 1, 1 },
        textPositionX = 0,
        textPositionY = 0,
        frameLevel = 10,
        statusBackgroundColor = { 0, 0, 0, 0.535 },
    },
}

local PoolManager = ClassicCastbars.PoolManager

local addon = CreateFrame("Frame")
addon:RegisterEvent("PLAYER_LOGIN")
addon:SetScript("OnEvent", function(self, event, ...)
    return self[event](self, ...)
end)

local activeGUIDs = {}
local activeTimers = {}
local activeFrames = {}
local npcCastTimeCacheStart = {}
local npcCastTimeCache = {}

addon.AnchorManager = ClassicCastbars.AnchorManager
addon.defaultConfig = ClassicCastbars.defaultConfig
addon.activeFrames = activeFrames
--ClassicCastbars.addon = addon
--ClassicCastbars = addon -- global ref for ClassicCastbars_Options

-- upvalues for speed
local pairs = _G.pairs
local UnitGUID = _G.UnitGUID
local UnitAura = _G.UnitAura
local GetSpellTexture = _G.GetSpellTexture
local GetSpellInfo = _G.GetSpellInfo
local CombatLogGetCurrentEventInfo = _G.CombatLogGetCurrentEventInfo
local GetTime = _G.GetTime
local max = _G.math.max
local abs = _G.math.abs
local next = _G.next
local GetUnitSpeed = _G.GetUnitSpeed
local CastingInfo = _G.CastingInfo
local bit_band = _G.bit.band
local COMBATLOG_OBJECT_TYPE_PLAYER_OR_PET = _G.COMBATLOG_OBJECT_TYPE_PLAYER + _G.COMBATLOG_OBJECT_TYPE_PET
local castTimeIncreases = ClassicCastbars.castTimeIncreases

function addon:CheckCastModifier(unitID, unitGUID)
    if not self.db.pushbackDetect then return end
    for i = 1, 16 do
        local name = UnitAura(unitID, i, "HARMFUL")
        if not name then return end -- no more debuffs

        local slowPercentage = castTimeIncreases[name]
        if slowPercentage then
            return self:SetCastDelay(unitGUID, slowPercentage, nil, true)
        end
    end
end

function addon:StartCast(unitGUID, unitID)
    if not activeTimers[unitGUID] then return end

    local castbar = self:GetCastbarFrame(unitID)
    if not castbar then return end

    castbar._data = activeTimers[unitGUID] -- set ref to current cast data
    self:DisplayCastbar(castbar, unitID)
    self:CheckCastModifier(unitID, unitGUID)
end

function addon:StopCast(unitID, noFadeOut)
    local castbar = activeFrames[unitID]
    if not castbar then return end

    if not castbar.isTesting then
        self:HideCastbar(castbar, noFadeOut)
    end

    castbar._data = nil
end

function addon:StartAllCasts(unitGUID)
    if not activeTimers[unitGUID] then return end

    for unitID, guid in pairs(activeGUIDs) do
        if guid == unitGUID then
            self:StartCast(guid, unitID)
        end
    end
end

function addon:StopAllCasts(unitGUID, noFadeOut)
    for unitID, guid in pairs(activeGUIDs) do
        if guid == unitGUID then
            self:StopCast(unitID, noFadeOut)
        end
    end
end

-- Store new cast data for unit, and start castbar(s)
function addon:StoreCast(unitGUID, spellName, iconTexturePath, castTime, isPlayer, isChanneled)
    local currTime = GetTime()

    if not activeTimers[unitGUID] then
        activeTimers[unitGUID] = {}
    end

    local cast = activeTimers[unitGUID]
    cast.spellName = spellName
    cast.icon = iconTexturePath
    cast.maxValue = castTime / 1000
    cast.endTime = currTime + (castTime / 1000)
    cast.isChanneled = isChanneled
    cast.unitGUID = unitGUID
    cast.timeStart = currTime
    cast.isPlayer = isPlayer
    cast.prevCurrTimeModValue = nil
    cast.currTimeModValue = nil
    cast.pushbackValue = nil
    cast.showCastInfoOnly = nil
    cast.isInterrupted = nil
    cast.isCastComplete = nil

    self:StartAllCasts(unitGUID)
end

-- Delete cast data for unit, and stop any active castbars
function addon:DeleteCast(unitGUID, isInterrupted, skipDeleteCache, isCastComplete, noFadeOut)
    if not unitGUID then return end

    local cast = activeTimers[unitGUID]
    if cast then
        cast.isInterrupted = isInterrupted -- just so we can avoid passing it as an arg for every function call
        cast.isCastComplete = isCastComplete
        self:StopAllCasts(unitGUID, noFadeOut)
        activeTimers[unitGUID] = nil
    end

    -- Weak tables doesn't work with literal values so we need to manually handle memory for this cache :/
    if not skipDeleteCache and npcCastTimeCacheStart[unitGUID] then
        npcCastTimeCacheStart[unitGUID] = nil
    end
end

-- Spaghetti code inc, you're warned.
-- A lot of this complexity is so we can also track modifiers in the combat log without
-- having to rely on UnitAura that requires a valid unitID.
function addon:SetCastDelay(unitGUID, percentageAmount, auraFaded, skipStore)
    if not self.db.pushbackDetect then return end
    local cast = activeTimers[unitGUID]
    if not cast or cast.isChanneled then return end

    --if cast.prevCurrTimeModValue then print("stored total:", #cast.prevCurrTimeModValue) end

    -- Set cast time modifier (i.e Curse of Tongues)
    if not auraFaded and percentageAmount and percentageAmount > 0 then
        if not cast.currTimeModValue or cast.currTimeModValue < percentageAmount then -- run only once unless % changed to higher val
            if cast.currTimeModValue then -- already was reduced
                -- if existing modifer is e.g 50% and new is 60%, we only want to adjust cast by 10%
                percentageAmount = percentageAmount - cast.currTimeModValue

                -- Store previous lesser modifier that was active incase new one expires first or gets dispelled
                cast.prevCurrTimeModValue = cast.prevCurrTimeModValue or {}
                cast.prevCurrTimeModValue[#cast.prevCurrTimeModValue + 1] = cast.currTimeModValue
                --print("stored lesser modifier")
            end

            --print("refreshing timer", percentageAmount)
            cast.currTimeModValue = (cast.currTimeModValue or 0) + percentageAmount -- highest active modifier
            cast.maxValue = cast.maxValue + (cast.maxValue * percentageAmount) / 100
            cast.endTime = cast.endTime + (cast.maxValue * percentageAmount) / 100
        elseif cast.currTimeModValue == percentageAmount and not skipStore then
            -- new modifier has same percentage as current active one, just store it for later
            --print("same percentage, storing")
            cast.prevCurrTimeModValue = cast.prevCurrTimeModValue or {}
            cast.prevCurrTimeModValue[#cast.prevCurrTimeModValue + 1] = percentageAmount
        end
    elseif auraFaded and percentageAmount then
        -- Reset cast time modifier
        if cast.currTimeModValue == percentageAmount then
            cast.maxValue = cast.maxValue - (cast.maxValue * percentageAmount) / 100
            cast.endTime = cast.endTime - (cast.maxValue * percentageAmount) / 100
            cast.currTimeModValue = nil

            -- Reset to lesser modifier if available
            if cast.prevCurrTimeModValue then
                local highest, index = 0
                for i = 1, #cast.prevCurrTimeModValue do
                    if cast.prevCurrTimeModValue[i] and cast.prevCurrTimeModValue[i] > highest then
                        highest, index = cast.prevCurrTimeModValue[i], i
                    end
                end

                if index then
                    cast.prevCurrTimeModValue[index] = nil
                    --print("resetting to lesser modifier", highest)
                    return self:SetCastDelay(unitGUID, highest)
                end
            end
        end

        if cast.prevCurrTimeModValue then
            -- Delete 1 old modifier (doesn't matter which one aslong as its the same %)
            for i = 1, #cast.prevCurrTimeModValue do
                if cast.prevCurrTimeModValue[i] == percentageAmount then
                    --print("deleted lesser modifier, new total:", #cast.prevCurrTimeModValue - 1)
                    cast.prevCurrTimeModValue[i] = nil
                    return
                end
            end
        end
    end
end

function addon:CastPushback(unitGUID)
    if not self.db.pushbackDetect then return end
    local cast = activeTimers[unitGUID]
    if not cast then return end

    if not cast.isChanneled then
        -- https://wow.gamepedia.com/index.php?title=Interrupt&oldid=305918
        -- On level 1 it seems like the pushback value starts at 0.5 but at
        -- higher lvl it is 1.0s. This needs some more testing.
        cast.pushbackValue = cast.pushbackValue or 1.0
        cast.maxValue = cast.maxValue + cast.pushbackValue
        cast.endTime = cast.endTime + cast.pushbackValue
        cast.pushbackValue = max(cast.pushbackValue - 0.5, 0.2)
    else
        -- channels are reduced by 25% per hit afaik
        cast.maxValue = cast.maxValue - (cast.maxValue * 25) / 100
        cast.endTime = cast.endTime - (cast.maxValue * 25) / 100
    end
end

function addon:ToggleUnitEvents(shouldReset)
    if MaoRUISettingDB["Nameplate"]["TargetClassicCastbars"] then
        self:RegisterEvent("PLAYER_TARGET_CHANGED")
        if self.db.target.autoPosition then
            self:RegisterUnitEvent("UNIT_AURA", "target")
            self:RegisterEvent("UNIT_TARGET")
        end
    else
        self:UnregisterEvent("PLAYER_TARGET_CHANGED")
        self:UnregisterEvent("UNIT_AURA")
        self:UnregisterEvent("UNIT_TARGET")
    end

    if MaoRUISettingDB["Nameplate"]["ClassicCastbars"] then
        self:RegisterEvent("NAME_PLATE_UNIT_ADDED")
        self:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
    else
        self:UnregisterEvent("NAME_PLATE_UNIT_ADDED")
        self:UnregisterEvent("NAME_PLATE_UNIT_REMOVED")
    end

    if self.db.party.enabled then
        self:RegisterEvent("GROUP_ROSTER_UPDATE")
        self:RegisterEvent("GROUP_JOINED")
        self:RegisterEvent("GROUP_LEFT")
    else
        self:UnregisterEvent("GROUP_ROSTER_UPDATE")
        self:UnregisterEvent("GROUP_JOINED")
        self:UnregisterEvent("GROUP_LEFT") -- TODO: check if needed
    end

    if shouldReset then
        self:PLAYER_ENTERING_WORLD() -- reset all data
    end
end

function addon:PLAYER_ENTERING_WORLD(isInitialLogin)
    if isInitialLogin then return end

    -- Reset all data on loading screens
    wipe(activeGUIDs)
    wipe(activeTimers)
    wipe(activeFrames)
    PoolManager:GetFramePool():ReleaseAll() -- also wipes castbar._data

    if self.db.party.enabled and IsInGroup() then
        self:GROUP_ROSTER_UPDATE()
    end
end

function addon:ZONE_CHANGED_NEW_AREA()
    wipe(npcCastTimeCacheStart)
    wipe(npcCastTimeCache)
end

-- Copies table values from src to dst if they don't exist in dst
local function CopyDefaults(src, dst)
    if type(src) ~= "table" then return {} end
    if type(dst) ~= "table" then dst = {} end

    for k, v in pairs(src) do
        if type(v) == "table" then
            dst[k] = CopyDefaults(v, dst[k])
        elseif type(v) ~= type(dst[k]) then
            dst[k] = v
        end
    end

    return dst
end

function addon:PLAYER_LOGIN()
    ClassicCastbarsDB = ClassicCastbarsDB or {}

    -- Copy any settings from defaults if they don't exist in current profile
    self.db = CopyDefaults(ClassicCastbars.defaultConfig, ClassicCastbarsDB)
    self.db.version = ClassicCastbars.defaultConfig.version

    -- Reset fonts on game locale switched (fonts only works for certain locales)
    if self.db.locale ~= GetLocale() then
        self.db.locale = GetLocale()
        self.db.target.castFont = _G.STANDARD_TEXT_FONT
        self.db.nameplate.castFont = _G.STANDARD_TEXT_FONT
    end

    -- config is not needed anymore if options are not loaded
    if not IsAddOnLoaded("ClassicCastbars_Options") then
        self.defaultConfig = nil
        ClassicCastbars.defaultConfig = nil
    end

    if self.db.player.enabled then
        self:SkinPlayerCastbar()
    end

    self.PLAYER_GUID = UnitGUID("player")
    self:ToggleUnitEvents()
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    self:UnregisterEvent("PLAYER_LOGIN")
    self.PLAYER_LOGIN = nil
end

local auraRows = 0
function addon:UNIT_AURA()
    if not self.db.target.autoPosition then return end
    if auraRows == TargetFrame.auraRows then return end
    auraRows = TargetFrame.auraRows

    if activeFrames.target and activeGUIDs.target then
        local parentFrame = self.AnchorManager:GetAnchor("target")
        if parentFrame then
            self:SetTargetCastbarPosition(activeFrames.target, parentFrame)
        end
    end
end

function addon:UNIT_TARGET(unitID)
    -- reanchor castbar when target of target is cleared or shown
    if self.db.target.autoPosition then
        if unitID == "target" or unitID == "player" then
            if activeFrames.target and activeGUIDs.target then
                local parentFrame = self.AnchorManager:GetAnchor("target")
                if parentFrame then
                    self:SetTargetCastbarPosition(activeFrames.target, parentFrame)
                end
            end
        end
    end
end

-- Bind unitIDs to unitGUIDs so we can efficiently get unitIDs in CLEU events
function addon:PLAYER_TARGET_CHANGED()
    activeGUIDs.target = UnitGUID("target") or nil

    self:StopCast("target", true) -- always hide previous target's castbar
    self:StartCast(activeGUIDs.target, "target") -- Show castbar again if available
end

function addon:NAME_PLATE_UNIT_ADDED(namePlateUnitToken)
    local unitGUID = UnitGUID(namePlateUnitToken)
    activeGUIDs[namePlateUnitToken] = unitGUID

    self:StartCast(unitGUID, namePlateUnitToken)
end

function addon:NAME_PLATE_UNIT_REMOVED(namePlateUnitToken)
    activeGUIDs[namePlateUnitToken] = nil

    -- Release frame, but do not delete cast data
    local castbar = activeFrames[namePlateUnitToken]
    if castbar then
        PoolManager:ReleaseFrame(castbar)
        activeFrames[namePlateUnitToken] = nil
    end
end

function addon:GROUP_ROSTER_UPDATE()
    for i = 1, 5 do
        local unitID = "party"..i
        activeGUIDs[unitID] = UnitGUID(unitID) or nil

        if activeGUIDs[unitID] then
            self:StopCast(unitID, true)
        else
            local castbar = activeFrames[unitID]
            if castbar then
                PoolManager:ReleaseFrame(castbar)
                activeFrames[unitID] = nil
            end
        end
    end
end
addon.GROUP_LEFT = addon.GROUP_ROSTER_UPDATE
addon.GROUP_JOINED = addon.GROUP_ROSTER_UPDATE

local channeledSpells = ClassicCastbars.channeledSpells
local castTimeTalentDecreases = ClassicCastbars.castTimeTalentDecreases
local crowdControls = ClassicCastbars.crowdControls
local castedSpells = ClassicCastbars.castedSpells
local ARCANE_MISSILES = GetSpellInfo(5143)

function addon:COMBAT_LOG_EVENT_UNFILTERED()
    local _, eventType, _, srcGUID, srcName, srcFlags, _, dstGUID,  _, dstFlags, _, _, spellName = CombatLogGetCurrentEventInfo()

    if eventType == "SPELL_CAST_START" then
        local spellID = castedSpells[spellName]
        if not spellID then return end
        local _, _, icon, castTime = GetSpellInfo(spellID)
        if not castTime or castTime < 300 then return end

        local isPlayer = bit_band(srcFlags, COMBATLOG_OBJECT_TYPE_PLAYER_OR_PET) > 0

        if isPlayer then
            -- Use talent reduced cast time for certain player spells
            local reducedTime = castTimeTalentDecreases[spellName]
            if reducedTime then
                castTime = reducedTime
            end
        else
            local cachedTime = npcCastTimeCache[srcName .. spellName]
            if cachedTime then
                -- Use cached time stored from earlier sightings for NPCs.
                -- This is because mobs have various cast times, e.g a lvl 20 mob casting Frostbolt might have
                -- 3.5 cast time but another lvl 40 mob might have 2.5 cast time instead for Frostbolt.
                castTime = cachedTime
            else
                npcCastTimeCacheStart[srcGUID] = GetTime()
            end
        end

        -- Note: using return here will make the next function (StoreCast) reuse the current stack frame which is slightly more performant
        return self:StoreCast(srcGUID, spellName, icon, castTime, isPlayer)
    elseif eventType == "SPELL_CAST_SUCCESS" then
        local channelData = channeledSpells[spellName]
        local spellID = castedSpells[spellName]
        if not channelData and not spellID then return end

        local isPlayer = bit_band(srcFlags, COMBATLOG_OBJECT_TYPE_PLAYER_OR_PET) > 0

        -- Auto correct cast times for mobs
        if not isPlayer and not channelData then
            local cachedTime = npcCastTimeCache[srcName .. spellName]
            if not cachedTime then
                local restoredStartTime = npcCastTimeCacheStart[srcGUID]
                if restoredStartTime then
                    local castTime = (GetTime() - restoredStartTime) * 1000
                    local origCastTime = 0
                    if spellID then
                        local _, _, _, cTime = GetSpellInfo(spellID)
                        origCastTime = cTime or 0
                    end

                    local castTimeDiff = abs(castTime - origCastTime)
                    if castTimeDiff <= 4000 and castTimeDiff > 250 then -- heavy lag might affect this so only store time if the diff isn't too big
                        npcCastTimeCache[srcName .. spellName] = castTime
                    end
                end
            end
        end

        -- Channeled spells are started on SPELL_CAST_SUCCESS instead of stopped
        -- Also there's no castTime returned from GetSpellInfo for channeled spells so we need to get it from our own list
        if channelData then
            -- Arcane Missiles triggers this event for every tick so ignore after first tick has been detected
            if spellName == ARCANE_MISSILES and activeTimers[srcGUID] and activeTimers[srcGUID].spellName == ARCANE_MISSILES then return end

            return self:StoreCast(srcGUID, spellName, GetSpellTexture(channelData[2]), channelData[1] * 1000, isPlayer, true)
        end

        -- non-channeled spell, finish it.
        -- We also check the expiration timer in OnUpdate script just incase this event doesn't trigger when i.e unit is no longer in range.
        return self:DeleteCast(srcGUID, nil, nil, true)
    elseif eventType == "SPELL_AURA_APPLIED" then
        if castTimeIncreases[spellName] then
            -- Aura that slows casting speed was applied
            return self:SetCastDelay(dstGUID, ClassicCastbars.castTimeIncreases[spellName])
        elseif crowdControls[spellName] then
            -- Aura that interrupts cast was applied
            return self:DeleteCast(dstGUID)
        end
    elseif eventType == "SPELL_AURA_REMOVED" then
        -- Channeled spells has no SPELL_CAST_* event for channel stop,
        -- so check if aura is gone instead since most (all?) channels has an aura effect.
        if channeledSpells[spellName] and srcGUID == dstGUID then
            return self:DeleteCast(srcGUID, nil, nil, true)
        elseif castTimeIncreases[spellName] then
            -- Aura that slows casting speed was removed.
            return self:SetCastDelay(dstGUID, castTimeIncreases[spellName], true)
        end
    elseif eventType == "SPELL_CAST_FAILED" then
        if srcGUID == self.PLAYER_GUID then
            -- Spamming cast keybinding triggers SPELL_CAST_FAILED so check if actually casting or not for the player
            if not CastingInfo() then
                return self:DeleteCast(srcGUID)
            end
        else
            return self:DeleteCast(srcGUID)
        end
    elseif eventType == "PARTY_KILL" or eventType == "UNIT_DIED" or eventType == "SPELL_INTERRUPT" then
        return self:DeleteCast(dstGUID, eventType == "SPELL_INTERRUPT")
    elseif eventType == "SWING_DAMAGE" or eventType == "ENVIRONMENTAL_DAMAGE" or eventType == "RANGE_DAMAGE" or eventType == "SPELL_DAMAGE" then
        if bit_band(dstFlags, COMBATLOG_OBJECT_TYPE_PLAYER_OR_PET) > 0 then -- is player
            return self:CastPushback(dstGUID)
        end
    end
end

local castStopBlacklist = {
    [GetSpellInfo(4068)] = 1,       -- Iron Grenade
    [GetSpellInfo(19769)] = 1,      -- Thorium Grenade
    [GetSpellInfo(13808)] = 1,      -- M73 Frag Grenade
}

local refresh = 0
addon:SetScript("OnUpdate", function(self, elapsed)
    if not next(activeTimers) then return end
    local currTime = GetTime()
    local pushbackEnabled = self.db.pushbackDetect

    if self.db.movementDetect then
        refresh = refresh - elapsed

        -- Check if unit is moving to stop castbar, thanks to Cordankos for this idea
        if refresh < 0 then
            if next(activeGUIDs) then
                for unitID, unitGUID in pairs(activeGUIDs) do
                    local cast = activeTimers[unitGUID]
                    -- Only stop cast for players since some mobs runs while casting, also because
                    -- of lag we have to only stop it if the cast has been active for atleast 0.25 sec
                    if cast and cast.isPlayer and currTime - cast.timeStart > 0.25 then
                        if not castStopBlacklist[cast.spellName] and GetUnitSpeed(unitID) ~= 0 then
                            self:DeleteCast(unitGUID)
                        end
                    end
                end
            end
            refresh = 0.1
        end
    end

    -- Update all shown castbars in a single OnUpdate call
    for unit, castbar in pairs(activeFrames) do
        local cast = castbar._data

        if cast then
            local castTime = cast.endTime - currTime

            if (castTime > 0) then
                if not cast.showCastInfoOnly then
                    local maxValue = cast.endTime - cast.timeStart
                    local value = currTime - cast.timeStart
                    if cast.isChanneled then -- inverse
                        value = maxValue - value
                    end

                    if pushbackEnabled then
                        -- maxValue is only updated dynamically when pushback detect is enabled
                        castbar:SetMinMaxValues(0, maxValue)
                    end

                    castbar:SetValue(value)
                    castbar.Timer:SetFormattedText("%.1f", castTime)
                    local sparkPosition = (value / maxValue) * castbar:GetWidth()
                    castbar.Spark:SetPoint("CENTER", castbar, "LEFT", sparkPosition, 0)
                end
            else
                -- Delete cast incase stop event wasn't detected in CLEU
                self:DeleteCast(cast.unitGUID, false, true, false, true)
            end
        end
    end
end)


local AnchorManager = ClassicCastbars.AnchorManager
local PoolManager = ClassicCastbars.PoolManager

--local addon = ClassicCastbars.addon
local activeFrames = addon.activeFrames
local gsub = _G.string.gsub
local unpack = _G.unpack
local min = _G.math.min
local max = _G.math.max
local UnitExists = _G.UnitExists
local UIFrameFadeOut = _G.UIFrameFadeOut
local UIFrameFadeRemoveFrame = _G.UIFrameFadeRemoveFrame

function addon:GetCastbarFrame(unitID)
    -- PoolManager:DebugInfo()
    if unitID == "player" then return CastingBarFrame end

    if activeFrames[unitID] then
        return activeFrames[unitID]
    end

    activeFrames[unitID] = PoolManager:AcquireFrame()

    return activeFrames[unitID]
end

function addon:SetTargetCastbarPosition(castbar, parentFrame)
    local auraRows = parentFrame.auraRows or 0

    if parentFrame.haveToT or parentFrame.haveElite or UnitExists("targettarget") then
        if parentFrame.buffsOnTop or auraRows <= 1 then
            castbar:SetPoint("CENTER", parentFrame, -18, -75)
        else
            castbar:SetPoint("CENTER", parentFrame, -18, max(min(-75, -37.5 * auraRows), -150))
        end
    else
        if not parentFrame.buffsOnTop and auraRows > 0 then
            castbar:SetPoint("CENTER", parentFrame, -18, max(min(-75, -37.5 * auraRows), -150))
        else
            castbar:SetPoint("CENTER", parentFrame, -18, -50)
        end
    end
end

function addon:SetCastbarIconAndText(castbar, cast, db)
    local spellName = cast.spellName

    if castbar.Text:GetText() ~= spellName then
        castbar.Icon:SetTexture(cast.icon)
        castbar.Text:SetText(spellName)

        -- Move timer position depending on spellname length
        if db.showTimer then
            castbar.Timer:SetPoint("RIGHT", castbar, (spellName:len() >= 19) and 30 or -6, 0)
        end
    end
end

function addon:SetCastbarStyle(castbar, cast, db)
    castbar:SetSize(db.width, db.height)
    castbar.Timer:SetShown(db.showTimer)
    castbar:SetStatusBarTexture(db.castStatusBar)
    castbar:SetFrameLevel(db.frameLevel)

    if db.showCastInfoOnly then
        castbar.Timer:SetText("")
        castbar:SetValue(0)
        castbar.Spark:SetAlpha(0)
    else
        castbar.Spark:SetAlpha(1)
    end

    if db.hideIconBorder then
        castbar.Icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    else
        castbar.Icon:SetTexCoord(0, 1, 0, 1)
    end

    castbar.Spark:SetHeight(db.height * 2.1)
    castbar.Icon:SetSize(db.iconSize, db.iconSize)
    castbar.Icon:SetPoint("BOTTOMLEFT", castbar, db.iconPositionX - db.iconSize, db.iconPositionY)
    castbar.Border:SetVertexColor(unpack(db.borderColor))

    if db.castBorder == "Interface\\CastingBar\\UI-CastingBar-Border-Small" or db.castBorder == "Interface\\CastingBar\\UI-CastingBar-Border" then -- default border
        castbar.Border:SetAlpha(1)
        if castbar.BorderFrame then
            -- Hide LSM border frame if it exists
            castbar.BorderFrame:SetAlpha(0)
        end

        -- Update border to match castbar size
        local width, height = castbar:GetWidth() * 1.16, castbar:GetHeight() * 1.16
        castbar.Border:SetPoint("TOPLEFT", width, height)
        castbar.Border:SetPoint("BOTTOMRIGHT", -width, -height)
    else
        -- Using border sat by LibSharedMedia
        self:SetLSMBorders(castbar, cast, db)
    end
end

-- LSM uses backdrop for borders instead of normal textures
function addon:SetLSMBorders(castbar, cast, db)
    -- Create new frame to contain our backdrop
    -- (castbar.Border is a texture object and not a frame so we can't reuse that)
    if not castbar.BorderFrame then
        castbar.BorderFrame = CreateFrame("Frame", nil, castbar)
        castbar.BorderFrame:SetPoint("TOPLEFT", castbar, -2, 2)
        castbar.BorderFrame:SetPoint("BOTTOMRIGHT", castbar, 2, -2)
    end

    castbar.Border:SetAlpha(0) -- hide default border
    castbar.BorderFrame:SetAlpha(1)

    -- TODO: should be a better way to handle this.
    -- Certain borders with transparent textures requires frame level 1 to show correctly.
    -- Meanwhile non-transparent textures requires the frame level to be higher than the castbar frame level
    if db.castBorder == "Interface\\CHARACTERFRAME\\UI-Party-Border" or db.castBorder == "Interface\\Tooltips\\ChatBubble-Backdrop" then
        castbar.BorderFrame:SetFrameLevel(1)
    else
        castbar.BorderFrame:SetFrameLevel(castbar:GetFrameLevel() + 1)
    end

    -- Apply backdrop if it isn't already active
    if castbar.BorderFrame.currentTexture ~= db.castBorder then
        castbar.BorderFrame:SetBackdrop({
            edgeFile = db.castBorder,
            tile = false, tileSize = 0,
            edgeSize = castbar:GetHeight(),
        })
        castbar.BorderFrame.currentTexture = db.castBorder
    end
    castbar.BorderFrame:SetBackdropBorderColor(unpack(db.borderColor))
end

function addon:SetCastbarFonts(castbar, cast, db)
    local fontName, fontHeight = castbar.Text:GetFont()

    if fontName ~= db.castFont or db.castFontSize ~= fontHeight then
        castbar.Text:SetFont(db.castFont, db.castFontSize)
        castbar.Timer:SetFont(db.castFont, db.castFontSize)
    end

    local c = db.textColor
    castbar.Text:SetTextColor(c[1], c[2], c[3], c[4])
    castbar.Timer:SetTextColor(c[1], c[2], c[3], c[4])
    castbar.Text:SetPoint("LEFT", db.textPositionX, db.textPositionY)
end

function addon:DisplayCastbar(castbar, unitID)
    local parentFrame = AnchorManager:GetAnchor(unitID)
    if not parentFrame then return end -- sanity check

    local db = self.db[gsub(unitID, "%d", "")] -- nameplate1 -> nameplate
    if unitID == "nameplate-testmode" then
        db = self.db.nameplate
    elseif unitID == "party-testmode" then
        db = self.db.party
    end

    if castbar.fadeInfo then
        -- need to remove frame if it's currently fading so alpha doesn't get changed after re-displaying castbar
        UIFrameFadeRemoveFrame(castbar)
        castbar.fadeInfo.finishedFunc = nil
    end

    local cast = castbar._data
    cast.showCastInfoOnly = db.showCastInfoOnly
    castbar:SetParent(parentFrame)
    castbar.Text:SetWidth(db.width - 10) -- ensure text gets truncated

    if not castbar.Background then
        for k, v in pairs({ castbar:GetRegions() }) do
            if v.GetTexture and v:GetTexture() and strfind(v:GetTexture(), "Color-") then
                castbar.Background = v
                break
            end
        end
    end
    castbar.Background:SetColorTexture(unpack(db.statusBackgroundColor))

    if cast.isChanneled then
        castbar:SetStatusBarColor(unpack(db.statusColorChannel))
    else
        castbar:SetStatusBarColor(unpack(db.statusColor))
    end

    if unitID == "target" and self.db.target.autoPosition then
        self:SetTargetCastbarPosition(castbar, parentFrame)
    else
        castbar:SetPoint(db.position[1], parentFrame, db.position[2], db.position[3])
    end

    -- Note: since frames are recycled and we also allow having different styles
    -- between castbars for target frame & nameplates, we need to always update the style here
    -- incase it was modified to something else on last recycle
    self:SetCastbarStyle(castbar, cast, db)
    self:SetCastbarFonts(castbar, cast, db)
    self:SetCastbarIconAndText(castbar, cast, db)

    if not castbar.isTesting then
        castbar:SetMinMaxValues(0, cast.maxValue)
        castbar:SetValue(0)
        castbar.Spark:SetPoint("CENTER", castbar, "LEFT", 0, 0)
    end

    castbar:SetAlpha(1)
    castbar:Show()
end

function addon:HideCastbar(castbar, noFadeOut)
    if noFadeOut then
        castbar:SetAlpha(0)
        castbar:Hide()
        return
    end

    local cast = castbar._data

    if cast and cast.isInterrupted then
        castbar.Text:SetText(_G.INTERRUPTED)
        castbar:SetStatusBarColor(castbar.failedCastColor:GetRGB())
    end

    --[[if cast and cast.isCastComplete and not cast.isChanneled then
        castbar:SetStatusBarColor(0, 1, 0)
    end]]

    UIFrameFadeOut(castbar, cast and cast.isInterrupted and 1.5 or 0.2, 1, 0)
end

-- TODO: reset to default skin on mode disabled without having to reloadui
function addon:SkinPlayerCastbar()
    local db = self.db.player

    if not CastingBarFrame.Timer then
        CastingBarFrame.Timer = CastingBarFrame:CreateFontString(nil, "OVERLAY")
        CastingBarFrame.Timer:SetTextColor(1, 1, 1)
        CastingBarFrame.Timer:SetFontObject("SystemFont_Shadow_Small")
        CastingBarFrame.Timer:SetPoint("RIGHT", CastingBarFrame, -6, 0)
        CastingBarFrame:HookScript("OnUpdate", function(frame)
            if db.enabled and db.showTimer then
                if not frame.channeling then
                    frame.Timer:SetFormattedText("%.1f", frame.casting and (frame.maxValue - frame.value) or 0)
                else
                    frame.Timer:SetFormattedText("%.1f", frame.fadeOut and 0 or frame.value)
                end
            end
        end)
    end
    CastingBarFrame.Timer:SetShown(db.showTimer)

    if db.castBorder == "Interface\\CastingBar\\UI-CastingBar-Border" or db.castBorder == "Interface\\CastingBar\\UI-CastingBar-Border-Small" then
        CastingBarFrame.Flash:SetSize(db.width + 61, db.height + 51)
        CastingBarFrame.Flash:SetPoint("TOP", 0, 26)
    else
        CastingBarFrame.Flash:SetSize(0.01, 0.01) -- hide it using size, SetAlpha() or Hide() wont work without messing with blizz code
    end

    CastingBarFrame_SetStartCastColor(CastingBarFrame, unpack(db.statusColor))
	CastingBarFrame_SetStartChannelColor(CastingBarFrame, unpack(db.statusColorChannel))
	--CastingBarFrame_SetFinishedCastColor(CastingBarFrame, unpack(db.statusColor))
	--CastingBarFrame_SetNonInterruptibleCastColor(CastingBarFrame, 0.7, 0.7, 0.7)
	--CastingBarFrame_SetFailedCastColor(CastingBarFrame, 1.0, 0.0, 0.0)

    CastingBarFrame.Text:ClearAllPoints()
    CastingBarFrame.Text:SetPoint("CENTER")
    CastingBarFrame.Icon:ClearAllPoints()
    CastingBarFrame.Icon:SetShown(db.enabled)

    if not CastingBarFrame.Background then
        for k, v in pairs({ CastingBarFrame:GetRegions() }) do
            if v.GetTexture and v:GetTexture() and strfind(v:GetTexture(), "Color-") then
                CastingBarFrame.Background = v
                break
            end
        end
    end
    CastingBarFrame.Background:SetColorTexture(unpack(db.statusBackgroundColor))

    CastingBarFrame:ClearAllPoints()
    if not db.autoPosition then
        local pos = db.position
        CastingBarFrame:SetPoint(pos[1], UIParent, pos[2], pos[3])
        CastingBarFrame.OldSetPoint = CastingBarFrame.SetPoint
        CastingBarFrame.SetPoint = function() end -- just incase any Blizzard code modifies it again
    else
        if CastingBarFrame.OldSetPoint then
            CastingBarFrame.SetPoint = CastingBarFrame.OldSetPoint
        end
        CastingBarFrame:SetPoint("BOTTOM", UIParent, 0, 150)
    end

    self:SetCastbarStyle(CastingBarFrame, nil, db)
    self:SetCastbarFonts(CastingBarFrame, nil, db)
end
