--[[ 
## Author: Jeff Shipley
## Version: 0.4.1
]]

local defaultFoodMacro = [[#showtooltip
/use [mod:shift]<bandage>;[nocombat,mod]<buffFood>;[nocombat]<food>
/castsequence [combat,nomod]<hPotions>
]]
local defaultDrinkMacro = [[#showtooltip
/use [nocombat,mod]<manaBuff>;[nocombat]<drink>
/castsequence [combat,nomod]<mPotions>
]]

local function CreateOrUpdateMacro(macroName, text)
    local macroID = GetMacroIndexByName(macroName)
    if macroID == 0 then
        CreateMacro(macroName, "Inv_misc_questionmark", text, nil, nil)
    else
        EditMacro(macroID, macroName, "Inv_misc_questionmark", text, nil, nil)
    end
end

local NeedsFoodBadly = CreateFrame("frame")
NeedsFoodBadly:RegisterEvent("BAG_UPDATE_DELAYED")
NeedsFoodBadly:RegisterEvent("PLAYER_REGEN_ENABLED")
NeedsFoodBadly:RegisterEvent("PLAYER_LEVEL_UP")
NeedsFoodBadly.dirty = false
NeedsFoodBadly:SetScript("OnEvent", function (self, event, ...)
    if event == "BAG_UPDATE_DELAYED" or event == "PLAYER_LEVEL_UP" then
        if InCombatLockdown() then 
            NeedsFoodBadly.dirty = true
        else
            NeedsFoodBadly:UpdateMacros()
        end
    elseif event == "PLAYER_REGEN_ENABLED" and NeedsFoodBadly.dirty then
        NeedsFoodBadly:UpdateMacros()
        NeedsFoodBadly.dirty = false
    end
end)

function NeedsFoodBadly:UpdateMacros()
    local best = {
        food = {}, buffFood = {}, drink = {}, buffDrink = {},
        hPotion = {}, mPotion = {}, healthstone = {}, manaGem = {},
        bandage = {}
    }
    for bag = 0,4 do
        for slot = 1,GetContainerNumSlots(bag) do
            local id = GetContainerItemID(bag, slot)
            if not best.food[id] and self:IsUsableFood(self.Food[id]) then
                best.food[id] = self.Food[id]
            end
            if not best.buffFood[id] and self:IsUsableBuffFood(self.Food[id]) then
                best.buffFood[id] = self.Food[id]
            end
            if not best.drink[id] and self:IsUsableDrink(self.Food[id]) then
                best.drink[id] = self.Food[id]
            end
            if not best.buffDrink[id] and self:IsUsableBuffDrink(self.Food[id]) then
                best.buffDrink[id] = self.Food[id]
            end
            if not best.hPotion[id] and self:IsUsableHPotion(self.Potion[id]) then
                best.hPotion[id] = self.Potion[id]
            end
            if not best.mPotion[id] and self:IsUsableMPotion(self.Potion[id]) then
                best.mPotion[id] = self.Potion[id]
            end
            if not best.healthstone[id] and self:IsUsableHealthstone(self.Healthstone[id]) then
                best.healthstone[id] = self.Healthstone[id]
            end
            if not best.manaGem[id] and self:IsUsableManaGem(self.ManaGem[id]) then
                best.manaGem[id] = self.ManaGem[id]
            end
            if not best.bandage[id] and self:IsUsableBandage(self.Bandage[id]) then
                best.bandage[id] = self.Bandage[id]
            end
        end
    end
    best.food = self:Sorted(best.food, self.BetterFood)
    best.buffFood = self:Sorted(best.buffFood, self.BetterBuffFood)
    best.drink = self:Sorted(best.drink, self.BetterDrink)
    best.buffDrink = self:Sorted(best.buffDrink, self.BetterBuffDrink)
    best.hPotion = self:Sorted(best.hPotion, self.BetterHPotion)
    best.mPotion = self:Sorted(best.mPotion, self.BetterMPotion)
    best.healthstone = self:Sorted(best.healthstone, self.BetterHealthstone)
    best.manaGem = self:Sorted(best.manaGem, self.BetterManaGem)
    best.bandage = self:Sorted(best.bandage, self.BetterBandage)
    foodMacro = defaultFoodMacro:gsub("<%a+>", {
        ["<food>"] = 'item:'..tostring(best.food[1] and best.food[1].id or 0),
        ["<buffFood>"] = 'item:'..tostring(best.buffFood[1] and best.buffFood[1].id or 0),
        ["<bandage>"] = 'item:'..tostring(best.bandage[1] and best.bandage[1].id or 0),
        ["<hPotions>"] = self:BuildSequence(best.healthstone, best.hPotion)
    })
    drinkMacro = defaultDrinkMacro:gsub("<%a+>", {
        ["<drink>"] = 'item:'..tostring(best.drink[1] and best.drink[1].id or 0),
        ["<manaBuff>"] = 'item:'..tostring(best.buffDrink[1] and best.buffDrink[1].id or 0),
        ["<mPotions>"] = self:BuildSequence(best.manaGem, best.mPotion)
    })
    CreateOrUpdateMacro("NFB", foodMacro)
    CreateOrUpdateMacro("NDB", drinkMacro)
end

function NeedsFoodBadly:Sorted(t, f)
    sortedTable = {}
    for _, v in pairs(t) do
        table.insert(sortedTable, v)
    end
    table.sort(sortedTable, f)
    return sortedTable
end

function NeedsFoodBadly:IsUsableFood(food)
    return not not (food 
            and food.lvl <= UnitLevel("player")
            and food.hp 
            and not (food.hp5 or food.mp5 or food.str or food.agi or food.stam or food.int or food.spi))
end

function NeedsFoodBadly:IsUsableBuffFood(food)
    return not not (food
    and food.lvl <= UnitLevel("player")
    and (food.hp and food.stam and food.spi))
end

function NeedsFoodBadly:IsUsableDrink(food)
    return not not (food 
    and food.lvl <= UnitLevel("player")
    and food.mp
    and not food.mp5)
end

function NeedsFoodBadly:IsUsableBuffDrink(food)
    return not not (food 
    and food.lvl <= UnitLevel("player")
    and food.mp5)
end

function NeedsFoodBadly:IsUsableHPotion(potion)
    return not not (potion 
    and potion.lvl <= UnitLevel("player")
    and potion.hp
    and not potion.bg)
end

function NeedsFoodBadly:IsUsableMPotion(potion)
    return not not (potion 
            and potion.lvl <= UnitLevel("player")
            and potion.mp
            and not potion.bg)
end

function NeedsFoodBadly:IsUsableHealthstone(healthstone)
    return not not (healthstone
        and healthstone.lvl <= UnitLevel("player"))
end

function NeedsFoodBadly:IsUsableManaGem(manaGem)
    return not not (manaGem
        and manaGem.lvl <= UnitLevel("player"))
end

local function FirstAidSkillPoints()
    for i = 1, GetNumSkillLines() do
        local skillName, _, _, skillRank, numTempPoints, skillModifier = GetSkillLineInfo(i)
        if skillName == PROFESSIONS_FIRST_AID then
            return skillRank + numTempPoints + skillModifier
        end
    end
    return 0
end

function NeedsFoodBadly:IsUsableBandage(bandage)
    return not not (bandage
    	and bandage.skill <= FirstAidSkillPoints()
	and not bandage.bg)
end

function NeedsFoodBadly.BetterFood(a, b)
    if a.conj and not b.conj then
        return true
    elseif b.conj and not a.conj then
        return false
    end
    -- Percent food is stored as a decimal number, ie "Restores 2% health" is hp=0.02
    a_hp, b_hp = a.hp, b.hp
    if a_hp < 1 then a_hp = UnitHealthMax("player") * a_hp end
    if b_hp < 1 then b_hp = UnitHealthMax("player") * b_hp end
    return (a_hp > b_hp) or (a_hp == b_hp and GetItemCount(a.id) < GetItemCount(b.id))
end

function NeedsFoodBadly.BetterBuffFood(a, b)
    return a.stam > b.stam or (a.stam == b.stam and GetItemCount(a.id) < GetItemCount(b.id))
end

function NeedsFoodBadly.BetterDrink(a, b)
    if a.conj and not b.conj then
        return true
    elseif b.conj and not a.conj then
        return false
    end
    a_mp, b_mp = a.mp, b.mp
    if a_mp < 1 then a_mp = UnitHealthMax("player") * a_mp end
    if b_mp < 1 then b_mp = UnitHealthMax("player") * b_mp end
    return a_mp > b_mp or (a_mp == b_mp and GetItemCount(a.id) < GetItemCount(b.id))
end

function NeedsFoodBadly.BetterBuffDrink(a, b)
    return a.mp5 > b.mp5 or (a.mp5 == b.mp5 and GetItemCount(a.id) < GetItemCount(b.id))
end

function NeedsFoodBadly.BetterHPotion(a, b)
    return a.high > b.high
end

function NeedsFoodBadly.BetterMPotion(a, b)
    return a.high > b.high
end

function NeedsFoodBadly.BetterHealthstone(a, b)
    return a.hp > b.hp
end

function NeedsFoodBadly.BetterManaGem(a, b)
    return a.high > b.high
end

function NeedsFoodBadly.BetterBandage(a, b)
    if a.bg and not b.bg then
        return true
    elseif b.bg and not a.bg then
        return false
    end
    return a.hp > b.hp
end

function NeedsFoodBadly:BuildSequence(stone, potions)
    local sequence = {}
    if stone[1] then table.insert(sequence, 'item:'..tostring(stone[1].id)) end
    for _, potion in pairs(potions) do
        for _ = 1,GetItemCount(potion.id) do
            table.insert(sequence, 'item:'..tostring(potion.id))
        end
    end
    sequenceStr = table.concat(sequence, ',', 1, math.min(table.getn(sequence), 14))
    return sequenceStr
end

NeedsFoodBadly.Food = {
    [8932]={id=8932, name="Alterac Swiss", lvl=45, conj=false, hp=2148},
    [4536]={id=4536, name="Shiny Red Apple", lvl=1, conj=false, hp=61.2},
    [13546]={id=13546, name="Bloodbelly Fish", lvl=25, conj=false, hp=1392},
    [159]={id=159, name="Refreshing Spring Water", lvl=2, conj=false, mp=151.2},
    [13928]={id=13928, name="Grilled Squid", lvl=35, conj=false, hp=874.8, agi=10},
    [18254]={id=18254, name="Runn Tum Tuber Surprise", lvl=45, conj=false, hp=1933.2, int=10},
    [12218]={id=12218, name="Monster Omelet", lvl=40, conj=false, hp=1392, stam=12, spi=12},
    [20452]={id=20452, name="Smoked Desert Dumplings", lvl=45, conj=false, hp=2148, str=20},
    [12238]={id=12238, name="Darkshore Grouper", lvl=5, conj=false, hp=243.6},
    [4791]={id=4791, name="Enchanted Water", lvl=25, conj=false, mp=1344.6},
    [16971]={id=16971, name="Clamlette Surprise", lvl=40, conj=false, hp=1392, stam=12, spi=12},
    [21023]={id=21023, name="Dirge's Kickin' Chimaerok Chops", lvl=55, conj=false, hp=2550, stam=25},
    [4593]={id=4593, name="Bristle Whisker Catfish", lvl=15, conj=false, hp=552},
    [1179]={id=1179, name="Ice Cold Milk", lvl=5, conj=false, mp=436.8},
    [17222]={id=17222, name="Spider Sausage", lvl=35, conj=false, hp=1392, stam=12, spi=12},
    [18255]={id=18255, name="Runn Tum Tuber", lvl=45, conj=false, hp=1392},
    [11109]={id=11109, name="Special Chicken Feed", lvl=0, conj=false, hp=30},
    [13724]={id=13724, name="Enriched Manna Biscuit", lvl=45, conj=false, hp=2148, mp=4410},
    [5527]={id=5527, name="Goblin Deviled Clams", lvl=15, conj=false, hp=552, stam=6, spi=6},
    [4592]={id=4592, name="Longjaw Mud Snapper", lvl=5, conj=false, hp=243.6},
    [3729]={id=3729, name="Soothing Turtle Bisque", lvl=25, conj=false, hp=874.8, stam=8, spi=8},
    [8952]={id=8952, name="Roasted Quail", lvl=45, conj=false, hp=2148},
    [13810]={id=13810, name="Blessed Sunfruit", lvl=45, conj=false, hp=1933.2, str=10},
    [4457]={id=4457, name="Barbecued Buzzard Wing", lvl=25, conj=false, hp=874.8, stam=8, spi=8},
    [6299]={id=6299, name="Sickly Looking Fish", lvl=0, conj=false, hp=30},
    [8766]={id=8766, name="Morning Glory Dew", lvl=45, conj=false, mp=2934},
    [6887]={id=6887, name="Spotted Yellowtail", lvl=35, conj=false, hp=1392},
    [8079]={id=8079, name="Conjured Crystal Water", lvl=55, conj=true, mp=4200},
    [3771]={id=3771, name="Wild Hog Shank", lvl=25, conj=false, hp=874.8},
    [18045]={id=18045, name="Tender Wolf Steak", lvl=40, conj=false, hp=1392, stam=12, spi=12},
    [1645]={id=1645, name="Moonberry Juice", lvl=35, conj=false, mp=1992},
    [3770]={id=3770, name="Mutton Chop", lvl=15, conj=false, hp=552},
    [13851]={id=13851, name="Hot Wolf Ribs", lvl=25, conj=false, hp=874.8, stam=8, spi=8},
    [8364]={id=8364, name="Mithril Head Trout", lvl=25, conj=false, hp=874.8},
    [12216]={id=12216, name="Spiced Chili Crab", lvl=40, conj=false, hp=1392, stam=12, spi=12},
    [4594]={id=4594, name="Rockscale Cod", lvl=25, conj=false, hp=874.8},
    [4599]={id=4599, name="Cured Ham Steak", lvl=35, conj=false, hp=1392},
    [1708]={id=1708, name="Sweet Nectar", lvl=25, conj=false, mp=1344.6},
    [3927]={id=3927, name="Fine Aged Cheddar", lvl=35, conj=false, hp=1392},
    [12213]={id=12213, name="Carrion Surprise", lvl=25, conj=false, hp=874.8, stam=8, spi=8},
    [4544]={id=4544, name="Mulgore Spice Bread", lvl=25, conj=false, hp=874.8},
    [2684]={id=2684, name="Coyote Steak", lvl=5, conj=false, hp=243.6, stam=4, spi=4},
    [16766]={id=16766, name="Undermine Clam Chowder", lvl=35, conj=false, hp=1392},
    [13927]={id=13927, name="Cooked Glossy Mightfish", lvl=35, conj=false, hp=874.8, stam=10},
    [12214]={id=12214, name="Mystery Stew", lvl=25, conj=false, hp=874.8, stam=8, spi=8},
    [117]={id=117, name="Tough Jerky", lvl=6, conj=false, hp=61.2},
    [5525]={id=5525, name="Boiled Clams", lvl=5, conj=false, hp=243.6, stam=4, spi=4},
    [3665]={id=3665, name="Curiously Tasty Omelet", lvl=15, conj=false, hp=552, stam=6, spi=6},
    [19301]={id=19301, name="Alterac Manna Biscuit", lvl=51, conj=false, hp=4410, mp=4410},
    [5095]={id=5095, name="Rainbow Fin Albacore", lvl=5, conj=false, hp=243.6},
    [787]={id=787, name="Slitherskin Mackerel", lvl=0, conj=false, hp=61.2},
    [3728]={id=3728, name="Tasty Lion Steak", lvl=20, conj=false, hp=874.8, stam=8, spi=8},
    [6290]={id=6290, name="Brilliant Smallfish", lvl=0, conj=false, hp=61.2},
    [12212]={id=12212, name="Jungle Stew", lvl=25, conj=false, hp=874.8, stam=8, spi=8},
    [4604]={id=4604, name="Forest Mushroom Cap", lvl=4, conj=false, hp=61.2},
    [12210]={id=12210, name="Roast Raptor", lvl=25, conj=false, hp=874.8, stam=8, spi=8},
    [10841]={id=10841, name="Goldthorn Tea", lvl=25, conj=false, mp=1344.6},
    [2683]={id=2683, name="Crab Cake", lvl=5, conj=false, hp=243.6, stam=4, spi=4},
    [20074]={id=20074, name="Heavy Crocolisk Stew", lvl=20, conj=false, hp=874.8, stam=8, spi=8},
    [8078]={id=8078, name="Conjured Sparkling Water", lvl=45, conj=true, mp=2934},
    [13934]={id=13934, name="Mightfish Steak", lvl=45, conj=false, hp=1933.2, stam=10},
    [2687]={id=2687, name="Dry Pork Ribs", lvl=5, conj=false, hp=243.6, stam=4, spi=4},
    [4539]={id=4539, name="Goldenbark Apple", lvl=25, conj=false, hp=874.8},
    [13930]={id=13930, name="Filet of Redgill", lvl=35, conj=false, hp=1392},
    [18300]={id=18300, name="Hyjal Nectar", lvl=55, conj=false, mp=4200},
    [6890]={id=6890, name="Smoked Bear Meat", lvl=5, conj=false, hp=243.6},
    [4607]={id=4607, name="Delicious Cave Mold", lvl=25, conj=false, hp=874.8},
    [1017]={id=1017, name="Seasoned Wolf Kabob", lvl=15, conj=false, hp=552, stam=6, spi=6},
    [4537]={id=4537, name="Tel'Abim Banana", lvl=5, conj=false, hp=243.6},
    [13935]={id=13935, name="Baked Salmon", lvl=45, conj=false, hp=2148},
    [13929]={id=13929, name="Hot Smoked Bass", lvl=35, conj=false, hp=874.8, spi=10},
    [4602]={id=4602, name="Moon Harvest Pumpkin", lvl=35, conj=false, hp=1392},
    [2888]={id=2888, name="Beer Basted Boar Ribs", lvl=5, conj=false, hp=61.2, stam=2, spi=2},
    [8077]={id=8077, name="Conjured Mineral Water", lvl=35, conj=true, mp=1992},
    [13933]={id=13933, name="Lobster Stew", lvl=45, conj=false, hp=2148},
    [5472]={id=5472, name="Kaldorei Spider Kabob", lvl=1, conj=false, hp=61.2, stam=2, spi=2},
    [22895]={id=22895, name="Conjured Cinnamon Roll", lvl=55, conj=true, hp=3180},
    [4608]={id=4608, name="Raw Black Truffle", lvl=35, conj=false, hp=1392},
    [3666]={id=3666, name="Gooey Spider Cake", lvl=15, conj=false, hp=552, stam=6, spi=6},
    [8957]={id=8957, name="Spinefin Halibut", lvl=45, conj=false, hp=2148},
    [3220]={id=3220, name="Blood Sausage", lvl=5, conj=false, hp=243.6, stam=4, spi=4},
    [7228]={id=7228, name="Tigule and Foror's Strawberry Ice Cream", lvl=15, conj=false, hp=552},
    [1082]={id=1082, name="Redridge Goulash", lvl=10, conj=false, hp=552, stam=6, spi=6},
    [2287]={id=2287, name="Haunch of Meat", lvl=5, conj=false, hp=243.6},
    [1707]={id=1707, name="Stormwind Brie", lvl=25, conj=false, hp=874.8},
    [8950]={id=8950, name="Homemade Cherry Pie", lvl=45, conj=false, hp=2148},
    [18632]={id=18632, name="Moonbrook Riot Taffy", lvl=25, conj=false, hp=874.8},
    [8948]={id=8948, name="Dried King Bolete", lvl=45, conj=false, hp=2148},
    [3772]={id=3772, name="Conjured Spring Water", lvl=25, conj=true, mp=1344.6},
    [12209]={id=12209, name="Lean Wolf Steak", lvl=15, conj=false, hp=552, stam=6, spi=6},
    [3726]={id=3726, name="Big Bear Steak", lvl=15, conj=false, hp=552, stam=6, spi=6},
    [733]={id=733, name="Westfall Stew", lvl=5, conj=false, hp=552},
    [3664]={id=3664, name="Crocolisk Gumbo", lvl=15, conj=false, hp=552, stam=6, spi=6},
    [1205]={id=1205, name="Melon Juice", lvl=15, conj=false, mp=835.2},
    [4605]={id=4605, name="Red-speckled Mushroom", lvl=5, conj=false, hp=243.6},
    [2682]={id=2682, name="Cooked Crab Claw", lvl=5, conj=false, hp=294, mp=294},
    [20031]={id=20031, name="Essence Mango", lvl=55, conj=false, hp=2550, mp=4410},
    [5477]={id=5477, name="Strider Stew", lvl=5, conj=false, hp=243.6, stam=4, spi=4},
    [4606]={id=4606, name="Spongy Morel", lvl=15, conj=false, hp=552},
    [5478]={id=5478, name="Dig Rat Stew", lvl=10, conj=false, hp=552},
    [12215]={id=12215, name="Heavy Kodo Stew", lvl=35, conj=false, hp=1392, stam=12, spi=12},
    [3663]={id=3663, name="Murloc Fin Soup", lvl=15, conj=false, hp=552, stam=6, spi=6},
    [8953]={id=8953, name="Deep Fried Plantains", lvl=45, conj=false, hp=2148},
    [5480]={id=5480, name="Lean Venison", lvl=15, conj=false, hp=552, stam=6, spi=6},
    [2136]={id=2136, name="Conjured Purified Water", lvl=15, conj=true, mp=835.2},
    [2681]={id=2681, name="Roasted Boar Meat", lvl=0, conj=false, hp=61.2},
    [12224]={id=12224, name="Crispy Bat Wing", lvl=0, conj=false, hp=61.2, stam=2, spi=2},
    [4538]={id=4538, name="Snapvine Watermelon", lvl=15, conj=false, hp=552},
    [5479]={id=5479, name="Crispy Lizard Tail", lvl=12, conj=false, hp=552, stam=6, spi=6},
    [3727]={id=3727, name="Hot Lion Chops", lvl=15, conj=false, hp=552, stam=6, spi=6},
    [4601]={id=4601, name="Soft Banana Bread", lvl=35, conj=false, hp=1392},
    [3448]={id=3448, name="Senggin Root", lvl=9, conj=false, hp=294, mp=294},
    [6807]={id=6807, name="Frog Leg Stew", lvl=30, conj=false, hp=874.8},
    [2680]={id=2680, name="Spiced Wolf Meat", lvl=0, conj=false, hp=61.2, stam=2, spi=2},
    [21552]={id=21552, name="Striped Yellowtail", lvl=35, conj=false, hp=1392},
    [2679]={id=2679, name="Charred Wolf Meat", lvl=0, conj=false, hp=61.2},
    [6038]={id=6038, name="Giant Clam Scorcho", lvl=25, conj=false, hp=874.8, stam=8, spi=8},
    [5066]={id=5066, name="Fissure Plant", lvl=5, conj=false, hp=243.6},
    [6888]={id=6888, name="Herb Baked Egg", lvl=0, conj=false, hp=61.2, stam=2, spi=2},
    [5526]={id=5526, name="Clam Chowder", lvl=10, conj=false, hp=552},
    [5350]={id=5350, name="Conjured Water", lvl=0, conj=true, mp=151.2},
    [1326]={id=1326, name="Sauteed Sunfish", lvl=12, conj=false, hp=243.6},
    [21215]={id=21215, name="Graccu's Mince Meat Fruitcake", lvl=40, conj=false, hp=0.05, mp=0.05},
    [8076]={id=8076, name="Conjured Sweet Roll", lvl=45, conj=true, hp=2148},
    [9451]={id=9451, name="Bubbling Water", lvl=15, conj=false, mp=835.2},
    [422]={id=422, name="Dwarven Mild", lvl=15, conj=false, hp=552},
    [2070]={id=2070, name="Darnassian Bleu", lvl=1, conj=false, hp=61.2},
    [4541]={id=4541, name="Freshly Baked Bread", lvl=5, conj=false, hp=243.6},
    [414]={id=414, name="Dalaran Sharp", lvl=5, conj=false, hp=243.6},
    [17197]={id=17197, name="Gingerbread Cookie", lvl=0, conj=false, hp=61.2, stam=2, spi=2},
    [17119]={id=17119, name="Deeprun Rat Kabob", lvl=5, conj=false, hp=243.6},
    [724]={id=724, name="Goretusk Liver Pie", lvl=5, conj=false, hp=243.6, stam=4, spi=4},
    [8075]={id=8075, name="Conjured Sourdough", lvl=35, conj=true, hp=1392},
    [4542]={id=4542, name="Moist Cornbread", lvl=15, conj=false, hp=552},
    [2288]={id=2288, name="Conjured Fresh Water", lvl=5, conj=true, mp=436.8},
    [17198]={id=17198, name="Egg Nog", lvl=0, conj=false, hp=61.2, stam=2, spi=2},
    [9681]={id=9681, name="Grilled King Crawler Legs", lvl=35, conj=false, hp=1392},
    [7097]={id=7097, name="Leg Meat", lvl=0, conj=false, hp=61.2},
    [19300]={id=19300, name="Bottled Winterspring Water", lvl=35, conj=false, mp=1992},
    [4540]={id=4540, name="Tough Hunk of Bread", lvl=6, conj=false, hp=61.2},
    [3662]={id=3662, name="Crocolisk Steak", lvl=5, conj=false, hp=243.6, stam=4, spi=4},
    [2685]={id=2685, name="Succulent Pork Ribs", lvl=10, conj=false, hp=552},
    [11584]={id=11584, name="Cactus Apple Surprise", lvl=1, conj=false, hp=61.2, stam=2, spi=2},
    [1487]={id=1487, name="Conjured Pumpernickel", lvl=25, conj=true, hp=874.8},
    [1113]={id=1113, name="Conjured Bread", lvl=5, conj=true, hp=243.6},
    [5474]={id=5474, name="Roasted Kodo Meat", lvl=0, conj=false, hp=61.2, stam=2, spi=2},
    [5349]={id=5349, name="Conjured Muffin", lvl=0, conj=true, hp=61.2},
    [19996]={id=19996, name="Harvest Fish", lvl=0, conj=false, hp=0.02},
    [961]={id=961, name="Healing Herb", lvl=1, conj=false, hp=61.2},
    [1114]={id=1114, name="Conjured Rye", lvl=15, conj=true, hp=552},
    [5476]={id=5476, name="Fillet of Frenzy", lvl=5, conj=false, hp=243.6, stam=4, spi=4},
    [21031]={id=21031, name="Cabbage Kimchi", lvl=45, conj=false, hp=2148},
    [23172]={id=23172, name="Refreshing Red Apple", lvl=0, conj=false, hp=0.04, mp=0.04},
    [21254]={id=21254, name="Winter Veil Cookie", lvl=0, conj=false, hp=0.02, stam=0.25, spi=0.25},
    [11444]={id=11444, name="Grim Guzzler Boar", lvl=45, conj=false, hp=2148},
    [4656]={id=4656, name="Small Pumpkin", lvl=8, conj=false, hp=61.2},
    [11415]={id=11415, name="Mixed Berries", lvl=45, conj=false, hp=2148},
    [6316]={id=6316, name="Loch Frenzy Delight", lvl=5, conj=false, hp=243.6},
    [19299]={id=19299, name="Fizzy Faire Drink", lvl=15, conj=false, mp=835.2},
    [20516]={id=20516, name="Bobbing Apple", lvl=0, conj=false, hp=0.02, stam=0.25, spi=0.25},
    [19224]={id=19224, name="Red Hot Wings", lvl=25, conj=false, hp=874.8},
    [19696]={id=19696, name="Harvest Bread", lvl=0, conj=true, hp=0.02},
    [16170]={id=16170, name="Steamed Mandu", lvl=15, conj=false, hp=552},
    [17406]={id=17406, name="Holiday Cheesewheel", lvl=5, conj=false, hp=243.6},
    [21030]={id=21030, name="Darnassus Kimchi Pie", lvl=35, conj=false, hp=1392},
    [17404]={id=17404, name="Blended Bean Brew", lvl=5, conj=false, mp=436.8},
    [17344]={id=17344, name="Candy Cane", lvl=0, conj=false, hp=61.2},
    [22324]={id=22324, name="Winter Kimchi", lvl=45, conj=false, hp=2148},
    [16168]={id=16168, name="Heaven Peach", lvl=35, conj=false, hp=1392},
    [5057]={id=5057, name="Ripe Watermelon", lvl=8, conj=false, hp=61.2},
    [21236]={id=21236, name="Winter Veil Loaf", lvl=0, conj=false, hp=0.02},
    [8543]={id=8543, name="Underwater Mushroom Cap", lvl=25, conj=false, hp=874.8},
    [16167]={id=16167, name="Versicolor Treat", lvl=5, conj=false, hp=243.6},
    [12763]={id=12763, name="Un'Goro Etherfruit", lvl=45, conj=false, hp=2148},
    [21235]={id=21235, name="Winter Veil Roast", lvl=0, conj=false, hp=0.02},
    [19306]={id=19306, name="Crunchy Frog", lvl=35, conj=false, hp=1392},
    [17407]={id=17407, name="Graccu's Homemade Meat Pie", lvl=25, conj=false, hp=874.8},
    [16169]={id=16169, name="Wild Ricecake", lvl=25, conj=false, hp=874.8},
    [19304]={id=19304, name="Spiced Beef Jerky", lvl=5, conj=false, hp=243.6},
    [18633]={id=18633, name="Styleen's Sour Suckerpop", lvl=5, conj=false, hp=243.6},
    [7807]={id=7807, name="Candy Bar", lvl=0, conj=false, hp=61.2, stam=2, spi=2},
    [7808]={id=7808, name="Chocolate Square", lvl=0, conj=false, hp=61.2, stam=2, spi=2},
    [19994]={id=19994, name="Harvest Fruit", lvl=0, conj=false, hp=0.02},
    [17199]={id=17199, name="Bad Egg Nog", lvl=0, conj=false, hp=61.2, stam=2, spi=2},
    [23160]={id=23160, name="Friendship Bread", lvl=45, conj=false, hp=2148},
    [17408]={id=17408, name="Spicy Beefstick", lvl=35, conj=false, hp=1392},
    [19223]={id=19223, name="Darkmoon Dog", lvl=0, conj=false, hp=61.2},
    [21033]={id=21033, name="Radish Kimchi", lvl=45, conj=false, hp=2148},
    [19995]={id=19995, name="Harvest Boar", lvl=0, conj=false, hp=0.02},
    [16171]={id=16171, name="Shinsollo", lvl=45, conj=false, hp=2148},
    [12211]={id=12211, name="Spiced Wolf Ribs", lvl=25, conj=false, hp=874.8, stam=8, spi=8},
    [7806]={id=7806, name="Lollipop", lvl=0, conj=false, hp=61.2, stam=2, spi=2},
    [19225]={id=19225, name="Deep Fried Candybar", lvl=45, conj=false, hp=2148},
    [18635]={id=18635, name="Bellara's Nutterbar", lvl=35, conj=false, hp=1392},
    [21240]={id=21240, name="Winter Veil Candy", lvl=0, conj=false, hp=0.02},
    [1119]={id=1119, name="Bottled Spirits", lvl=0, conj=false, hp=552},
    [19305]={id=19305, name="Pickled Kodo Foot", lvl=15, conj=false, hp=552},
    [16166]={id=16166, name="Bean Soup", lvl=0, conj=false, hp=61.2},
    [13813]={id=13813, name="Blessed Sunfruit Juice", lvl=45, conj=false, mp=4410, spi=10},
    [13931]={id=13931, name="Nightfin Soup", lvl=35, conj=false, hp=874.8, mp5=8},
    [21217]={id=21217, name="Sagefish Delight", lvl=30, conj=false, hp=840.0, mp=1260, mp5=6},
    [21072]={id=21072, name="Smoked Sagefish", lvl=10, conj=false, hp=378.0, mp=567, mp5=3},
    [13932]={id=13932, name="Poached Sunscale Salmon", lvl=35, conj=false, hp=874.8, hp5=6},
    [1401]={id=1401, name="Green Tea Leaf", lvl=4, conj=false, hp=30, mp=60},
    [5473]={id=5473, name="Scorpid Surprise", lvl=0, conj=false, hp=294}
}
NeedsFoodBadly.Potion = {
    [13446]={id=13446, name="Major Healing Potion", lvl=45, low=1050, high=1750, hp=true},
    [13444]={id=13444, name="Major Mana Potion", lvl=49, low=1350, high=2250, mp=true},
    [929]={id=929, name="Healing Potion", lvl=12, low=280, high=360, hp=true},
    [6149]={id=6149, name="Greater Mana Potion", lvl=31, low=700, high=900, mp=true},
    [1710]={id=1710, name="Greater Healing Potion", lvl=21, low=455, high=585, hp=true},
    [13443]={id=13443, name="Superior Mana Potion", lvl=41, low=900, high=1500, mp=true},
    [3928]={id=3928, name="Superior Healing Potion", lvl=35, low=700, high=900, hp=true},
    [3827]={id=3827, name="Mana Potion", lvl=22, low=455, high=585, mp=true},
    [858]={id=858, name="Lesser Healing Potion", lvl=3, low=140, high=180, hp=true},
    [3385]={id=3385, name="Lesser Mana Potion", lvl=14, low=280, high=360, mp=true},
    [118]={id=118, name="Minor Healing Potion", lvl=0, low=70, high=90, hp=true},
    [2455]={id=2455, name="Minor Mana Potion", lvl=5, low=140, high=180, mp=true},
    [18253]={id=18253, name="Major Rejuvenation Potion", lvl=50, low=1440, high=1760, hp=true, mp=true},
    [9144]={id=9144, name="Wildvine Potion", lvl=35, low=1, high=1500, hp=true, mp=true},
    [2456]={id=2456, name="Minor Rejuvenation Potion", lvl=5, low=90, high=150, hp=true, mp=true},
    [4596]={id=4596, name="Discolored Healing Potion", lvl=5, low=140, high=180, hp=true},
    [18839]={id=18839, name="Combat Healing Potion", lvl=35, low=700, high=900, hp=true},
    [18841]={id=18841, name="Combat Mana Potion", lvl=41, low=900, high=1500, mp=true},
    [3087]={id=3087, name="Mug of Shimmer Stout", lvl=0, low=140, high=180, mp=true},
    [17351]={id=17351, name="Major Mana Draught", lvl=45, low=980, high=1260, mp=true, bg=true},
    [17348]={id=17348, name="Major Healing Draught", lvl=45, low=980, high=1260, hp=true, bg=true},
    [17349]={id=17349, name="Superior Healing Draught", lvl=35, low=560, high=720, hp=true, bg=true},
    [17352]={id=17352, name="Superior Mana Draught", lvl=35, low=560, high=720, mp=true, bg=true}
}
NeedsFoodBadly.Healthstone = {
    [19004]={id=19004, name="Minor Healthstone", lvl=10, hp=110},
    [19005]={id=19005, name="Minor Healthstone", lvl=10, hp=120},
    [19006]={id=19006, name="Lesser Healthstone", lvl=22, hp=275},
    [19007]={id=19007, name="Lesser Healthstone", lvl=22, hp=300},
    [19008]={id=19008, name="Healthstone", lvl=34, hp=550},
    [19009]={id=19009, name="Healthstone", lvl=34, hp=600},
    [19010]={id=19010, name="Greater Healthstone", lvl=46, hp=880},
    [19011]={id=19011, name="Greater Healthstone", lvl=46, hp=960},
    [19012]={id=19012, name="Major Healthstone", lvl=58, hp=1320},
    [5509]={id=5509, name="Healthstone", lvl=34, hp=500},
    [19013]={id=19013, name="Major Healthstone", lvl=58, hp=1440},
    [5510]={id=5510, name="Greater Healthstone", lvl=46, hp=800},
    [5511]={id=5511, name="Lesser Healthstone", lvl=22, hp=250},
    [5512]={id=5512, name="Minor Healthstone", lvl=10, hp=100},
    [9421]={id=9421, name="Major Healthstone", lvl=58, hp=1200}
}
NeedsFoodBadly.ManaGem = {
    [5514]={id=5514, name="Mana Agate", lvl=1, low=375, high=425},
    [5513]={id=5513, name="Mana Jade", lvl=38, low=550, high=650},
    [8007]={id=8007, name="Mana Citrine", lvl=48, low=775, high=925},
    [8008]={id=8008, name="Mana Ruby", lvl=58, low=1000, high=1200}
}
NeedsFoodBadly.Bandage = {
    [8545]={id=8545, name="Heavy Mageweave Bandage", skill=175, hp=1104},
    [14529]={id=14529, name="Runecloth Bandage", skill=200, hp=1360},
    [14530]={id=14530, name="Heavy Runecloth Bandage", skill=225, hp=2000},
    [6450]={id=6450, name="Silk Bandage", skill=100, hp=400},
    [6451]={id=6451, name="Heavy Silk Bandage", skill=125, hp=640},
    [8544]={id=8544, name="Mageweave Bandage", skill=150, hp=800},
    [3530]={id=3530, name="Wool Bandage", skill=50, hp=161},
    [3531]={id=3531, name="Heavy Wool Bandage", skill=75, hp=301},
    [2581]={id=2581, name="Heavy Linen Bandage", skill=20, hp=114},
    [1251]={id=1251, name="Linen Bandage", skill=1, hp=66},
    [19307]={id=19307, name="Alterac Heavy Runecloth Bandage", skill=225, hp=2000},
    [23684]={id=23684, name="Crystal Infused Bandage", skill=225, hp=2500},
    [19068]={id=19068, name="Warsong Gulch Silk Bandage", lvl=25, skill=125, hp=640, bg=2},
    [19067]={id=19067, name="Warsong Gulch Mageweave Bandage", lvl=35, skill=175, hp=1104, bg=2},
    [19066]={id=19066, name="Warsong Gulch Runecloth Bandage", lvl=45, skill=225, hp=2000, bg=2},
    [20067]={id=20067, name="Arathi Basin Silk Bandage", lvl=25, skill=125, hp=640, bg=3},
    [20235]={id=20235, name="Defiler's Silk Bandage", lvl=25, skill=125, hp=640, bg=3},
    [20244]={id=20244, name="Highlander's Silk Bandage", lvl=25, skill=125, hp=640, bg=3},
    [20065]={id=20065, name="Arathi Basin Mageweave Bandage", lvl=35, skill=175, hp=1104, bg=3},
    [20232]={id=20232, name="Defiler's Mageweave Bandage", lvl=35, skill=175, hp=1104, bg=3},
    [20237]={id=20237, name="Highlander's Mageweave Bandage", lvl=35, skill=175, hp=1104, bg=3},
    [20066]={id=20066, name="Arathi Basin Runecloth Bandage", lvl=45, skill=225, hp=2000, bg=3},
    [20234]={id=20234, name="Defiler's Runecloth Bandage", lvl=45, skill=225, hp=2000, bg=3},
    [20243]={id=20243, name="Highlander's Runecloth Bandage", lvl=45, skill=225, hp=2000, bg=3}
}