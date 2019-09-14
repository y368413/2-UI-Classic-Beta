--## Author: Runew0lf ## Version: 1.3  Thanks For The Buff
local TFTB = CreateFrame("Frame")
TFTB:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
TFTB:SetScript("OnEvent", function(self, event) self:OnEvent(event, CombatLogGetCurrentEventInfo()) end)
function Set(list)
    local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
end

-- Build Spell list (this ignores ranks)
local buff_list = Set{
    (GetSpellInfo(5231)), --Mark of the Wild
    (GetSpellInfo(467)), --Thorns
    (GetSpellInfo(1459)), --Arcane Intellect
    (GetSpellInfo(19740)), --Blessing Of Might
    (GetSpellInfo(20217)), --Blessing Of Kings
    (GetSpellInfo(56521)), --Blessing Of Wisdom
    (GetSpellInfo(1255)), --Power Word: Fortitude
    (GetSpellInfo(5697)), --Unending Breath

}
function TFTB:OnEvent(event, ...)
    local _, subevent, _, sourceGUID, sourceName, _, _, destGUID, destName = ...
        local spell_name, _, aura_type = select(13, ...)
        -- Check to see if the aura is a buff and its in our list of buffs
        if aura_type == "BUFF" and buff_list[spell_name] then
            -- Make sure its cast on us from another source and they are not in our raidgroup / party
            if destGUID == UnitGUID("player") and not UnitInParty(sourceName) and not UnitInRaid(sourcename) and 
                sourceGUID ~= UnitGUID("player") then
                -- if destGUID == UnitGUID("player") and sourceGUID ~= UnitGUID("player") then
                -- Make sure the other source is a player
                if strsplit("-", sourceGUID) == "Player" then
                    DoEmote("cheer", sourceName)
                end
            end
        end
end
