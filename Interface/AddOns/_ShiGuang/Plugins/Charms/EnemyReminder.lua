
-------------------------------------
-- 附近敌方人员提醒   Author: M
-------------------------------------

local durationSecond = 60
local enemies = {}
local races = {
    ["Orc"]    = "Horde",
    ["Undead"] = "Horde",
    ["Tauren"] = "Horde",
    ["Troll"]  = "Horde",
    ["Human"]  = "Alliance",
    ["Gnome"]  = "Alliance",
    ["Dwarf"]  = "Alliance",
    ["NightElf"] = "Alliance",
}
local playerFaction = UnitFactionGroup("player")
local iconAlliance  = "|TInterface\\TargetingFrame\\UI-PVP-ALLIANCE:14:14:0:0:64:64:10:36:2:38|t"
local iconHorde     = "|TInterface\\TargetingFrame\\UI-PVP-HORDE:14:14:0:0:64:64:4:38:2:36|t"
local iconClass     = "|TInterface\\TargetingFrame\\UI-Classes-Circles:14:14:0:0:256:256:%d:%d:%d:%d|t "

local function IsFriendly(race)
    return race and races[race] == playerFaction
end

local function GetFactionByRace(race)
    if (IsFriendly(race)) then
        return playerFaction
    else
        return playerFaction == "Alliance" and "Horde" or "Alliance"
    end
end

local function GetFactionIconByRace(race)
    local faction = GetFactionByRace(race)
    return faction == "Alliance" and iconAlliance or iconHorde
end
 
local function GetClassIcon(class)
    if (not class) then return "" end
    local x1, x2, y1, y2 = unpack(CLASS_ICON_TCOORDS[strupper(class)])
    return format(iconClass, x1*256, x2*256, y1*256, y2*256)
end

local function GetColoredName(name, class)
    local colorStr = select(4,GetClassColor(class))
    return format("|c%s%s|r", colorStr, name)
end

local function WarnEnemy(enemy)
    print(GetFactionIconByRace(enemy.race) .. GetClassIcon(enemy.class) .. GetColoredName(enemy.name, enemy.class))
end

local function UpdateEnemies(guid, name, race, class)
    if (IsFriendly(race)) then return end
    if (not race or not class) then return end
    local t = time()
    if (not enemies[guid]) then
        enemies[guid] = {
            race  = race,
            class = class,
            name  = name,
            lastWarnTime = t,
        }
        WarnEnemy(enemies[guid])
    elseif (t - durationSecond > enemies[guid].lastWarnTime) then
        enemies[guid].lastWarnTime = t
        WarnEnemy(enemies[guid])
    end
end

local frame = CreateFrame("Frame", nil, UIParent)
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:SetScript("OnEvent", function(self, event, ...)
    local timestamp, _, _, sourceGuid, sourceName = CombatLogGetCurrentEventInfo()
    if (strfind(sourceGuid, "Player")) then
        local _, englishClass, _, englishRace = GetPlayerInfoByGUID(sourceGuid)
        UpdateEnemies(sourceGuid, sourceName, englishRace, englishClass)
    end
end)
