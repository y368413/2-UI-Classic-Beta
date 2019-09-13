--## Author: Runew0lf ## Version: 1.1  Thanks For The Buff
local TFTB = CreateFrame("Frame")
TFTB:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
TFTB:SetScript("OnEvent", function(self, event) self:OnEvent(event, CombatLogGetCurrentEventInfo()) end)
function Set(list)
    local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
end
local buff_list = Set{"Mark of the Wild", "Thorns", "Arcane Intellect", "Blessing Of Might", "Blessing Of Kings", "Power Word: Fortitude", "Power Word: Shield", "Unending Breath"}
function TFTB:OnEvent(event, ...)
    local _, subevent, _, sourceGUID, sourceName, _, _, destGUID, destName = ...
    -- Check to see what event we are processing
    if subevent == "SPELL_AURA_APPLIED" then
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
end
