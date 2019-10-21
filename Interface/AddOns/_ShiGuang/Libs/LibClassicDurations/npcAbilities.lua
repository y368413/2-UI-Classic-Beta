--[================[
LibClassicDurations
Author: d87
Description: Tracks all aura applications in combat log and provides duration, expiration time.
And additionally enemy buffs info.

Usage example 1:
-----------------

    -- Simply get the expiration time and duration

    local LibClassicDurations = LibStub("LibClassicDurations")
    LibClassicDurations:Register("YourAddon") -- tell library it's being used and should start working

    hooksecurefunc("CompactUnitFrame_UtilSetBuff", function(buffFrame, unit, index, filter)
        local name, _, _, _, duration, expirationTime, unitCaster, _, _, spellId = UnitBuff(unit, index, filter);

        local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(unit, spellId, unitCaster)
        if duration == 0 and durationNew then
            duration = durationNew
            expirationTime = expirationTimeNew
        end

        local enabled = expirationTime and expirationTime ~= 0;
        if enabled then
            local startTime = expirationTime - duration;
            CooldownFrame_Set(buffFrame.cooldown, startTime, duration, true);
        else
            CooldownFrame_Clear(buffFrame.cooldown);
        end
    end)

Usage example 2:
-----------------

    -- Use library's UnitAura replacement function, that shows enemy buffs and
    -- automatically tries to add duration to everything else

    local LCD = LibStub("LibClassicDurations")
    LCD:Register("YourAddon") -- tell library it's being used and should start working

    local f = CreateFrame("frame", nil, UIParent)
    f:RegisterUnitEvent("UNIT_AURA", "target")

    local EventHandler = function(self, event, unit)
        for i=1,100 do
            local name, _, _, _, duration, expirationTime, _, _, _, spellId = LCD:UnitAura(unit, i, "HELPFUL")
            if not name then break end
            print(name, duration, expirationTime)
        end
    end

    f:SetScript("OnEvent", EventHandler)

    -- NOTE: Enemy buff tracking won't start until you register UNIT_BUFF
    LCD.RegisterCallback(addon, "UNIT_BUFF", function(event, unit)
        EventHandler(f, "UNIT_AURA", unit)
    end)

    -- Optional:
    LCD.RegisterCallback(addon, "UNIT_BUFF_GAINED", function(event, unit, spellID)
        print("Gained", GetSpellInfo(spellID))
    end)

--]================]
if WOW_PROJECT_ID ~= WOW_PROJECT_CLASSIC then return end

local MAJOR, MINOR = "LibClassicDurations", 31
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

lib.callbacks = lib.callbacks or LibStub("CallbackHandler-1.0"):New(lib)
lib.frame = lib.frame or CreateFrame("Frame")

lib.guids = lib.guids or {}
lib.spells = lib.spells or {}
lib.npc_spells = lib.npc_spells or {}

lib.spellNameToID = lib.spellNameToID or {}
local spellNameToID = lib.spellNameToID

local NPCspellNameToID = {}
if lib.NPCSpellTableTimer then
    lib.NPCSpellTableTimer:Cancel()
end

lib.DRInfo = lib.DRInfo or {}
local DRInfo = lib.DRInfo

lib.buffCache = lib.buffCache or {}
local buffCache = lib.buffCache

lib.buffCacheValid = lib.buffCacheValid or {}
local buffCacheValid = lib.buffCacheValid

lib.nameplateUnitMap = lib.nameplateUnitMap or {}
local nameplateUnitMap = lib.nameplateUnitMap

lib.guidAccessTimes = lib.guidAccessTimes or {}
local guidAccessTimes = lib.guidAccessTimes

local f = lib.frame
local callbacks = lib.callbacks
local guids = lib.guids
local spells = lib.spells
local npc_spells = lib.npc_spells
local indirectRefreshSpells

local INFINITY = math.huge
local PURGE_INTERVAL = 900
local PURGE_THRESHOLD = 1800
local UNKNOWN_AURA_DURATION = 3600 -- 60m

local CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo
local UnitGUID = UnitGUID
local UnitAura = UnitAura
local GetSpellInfo = GetSpellInfo
local GetTime = GetTime
local tinsert = table.insert
local unpack = unpack
local GetAuraDurationByUnitDirect
local enableEnemyBuffTracking = false
local COMBATLOG_OBJECT_CONTROL_PLAYER = COMBATLOG_OBJECT_CONTROL_PLAYER

f:SetScript("OnEvent", function(self, event, ...)
    return self[event](self, event, ...)
end)

lib.dataVersions = lib.dataVersions or {}
local SpellDataVersions = lib.dataVersions

function lib:SetDataVersion(dataType, version)
    SpellDataVersions[dataType] = version
    npc_spells = lib.npc_spells
    indirectRefreshSpells = lib.indirectRefreshSpells
end

function lib:GetDataVersion(dataType)
    return SpellDataVersions[dataType] or 0
end

lib.AddAura = function(id, opts)
    if not opts then return end

    local lastRankID
    if type(id) == "table" then
        local clones = id
        lastRankID = clones[#clones]
    else
        lastRankID = id
    end

    local spellName = GetSpellInfo(lastRankID)
    spellNameToID[spellName] = lastRankID

    if type(id) == "table" then
        for _, spellID in ipairs(id) do
            spells[spellID] = opts
        end
    else
        spells[id] = opts
    end
end


lib.Talent = function (...)
    for i=1, 5 do
        local spellID = select(i, ...)
        if not spellID then break end
        if IsPlayerSpell(spellID) then return i end
    end
    return 0
end

local prevID
local counter = 0
local function processNPCSpellTable()
    local dataTable = lib.npc_spells
    counter = 0
    local id = next(dataTable, prevID)
    while (id and counter < 300) do
        NPCspellNameToID[GetSpellInfo(id)] = id

        counter = counter + 1
        prevID = id
        id = next(dataTable, prevID)
    end
    if (id) then
        C_Timer.After(1, processNPCSpellTable)
    end
end
lib.NPCSpellTableTimer = C_Timer.NewTimer(10, processNPCSpellTable)


local function isHunterGUID(guid)
    return select(2, GetPlayerInfoByGUID(guid)) == "HUNTER"
end
local function isFriendlyFeigning(guid)
    if IsInRaid() then
        for i = 1, MAX_RAID_MEMBERS do
            local unitID = "raid"..i
            if (UnitGUID(unitID) == guid) and UnitIsFeignDeath(unitID) then
                return true
            end
        end
    elseif IsInGroup() then
        for i = 1, MAX_PARTY_MEMBERS do
            local unitID = "party"..i
            if (UnitGUID(unitID) == guid) and UnitIsFeignDeath(unitID) then
                return true
            end
        end
    end
end
--------------------------
-- OLD GUIDs PURGE
--------------------------

local function purgeOldGUIDs()
    local now = GetTime()
    local deleted = {}
    for guid, lastAccessTime in pairs(guidAccessTimes) do
        if lastAccessTime + PURGE_THRESHOLD < now then
            guids[guid] = nil
            nameplateUnitMap[guid] = nil
            buffCacheValid[guid] = nil
            buffCache[guid] = nil
            DRInfo[guid] = nil
            tinsert(deleted, guid)
        end
    end
    for _, guid in ipairs(deleted) do
        guidAccessTimes[guid] = nil
    end
end
lib.purgeTicker = lib.purgeTicker or C_Timer.NewTicker( PURGE_INTERVAL, purgeOldGUIDs)

--------------------------
-- DIMINISHING RETURNS
--------------------------
local bit_band = bit.band
local DRResetTime = 18.4
local COMBATLOG_OBJECT_TYPE_PLAYER = COMBATLOG_OBJECT_TYPE_PLAYER
local COMBATLOG_OBJECT_REACTION_FRIENDLY = COMBATLOG_OBJECT_REACTION_FRIENDLY

local DRMultipliers = { 0.5, 0.25, 0}
local function addDRLevel(dstGUID, category)
    local guidTable = DRInfo[dstGUID]
    if not guidTable then
        DRInfo[dstGUID] = {}
        guidTable = DRInfo[dstGUID]
    end

    local catTable = guidTable[category]
    if not catTable then
        guidTable[category] = {}
        catTable = guidTable[category]
    end

    local now = GetTime()
    local isExpired = (catTable.expires or 0) <= now
    if isExpired then
        catTable.level = 1
        catTable.expires = now + DRResetTime
    else
        catTable.level = catTable.level + 1
    end
end
local function clearDRs(dstGUID)
    DRInfo[dstGUID] = nil
end
local function getDRMul(dstGUID, spellID)
    local category = lib.DR_CategoryBySpellID[spellID]
    if not category then return 1 end

    local guidTable = DRInfo[dstGUID]
    if guidTable then
        local catTable = guidTable[category]
        if catTable then
            local now = GetTime()
            local isExpired = (catTable.expires or 0) <= now
            if isExpired then
                return 1
            else
                local mul = DRMultipliers[catTable.level]
                return mul or 1
            end
        end
    end
    return 1
end

local function CountDiminishingReturns(eventType, srcGUID, srcFlags, dstGUID, dstFlags, spellID, auraType)
    if auraType == "DEBUFF" then
        if eventType == "SPELL_AURA_REMOVED" or eventType == "SPELL_AURA_REFRESH" then
            local category = lib.DR_CategoryBySpellID[spellID]
            if not category then return end

            local isDstPlayer = bit_band(dstFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0
            -- local isFriendly = bit_band(dstFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) > 0

            if not isDstPlayer then
                if not lib.DR_TypesPVE[category] then return end
            end

            addDRLevel(dstGUID, category)
        end
        if eventType == "UNIT_DIED" then
            if not isHunterGUID(dstGUID) then
                clearDRs(dstGUID)
            end
        end
    end
end

------------------------
-- COMBO POINTS
------------------------

local GetComboPoints = GetComboPoints
local _, playerClass = UnitClass("player")
local cpWas = 0
local cpNow = 0
local function GetCP()
    if not cpNow then return GetComboPoints("player", "target") end
    return cpWas > cpNow and cpWas or cpNow
end

function f:PLAYER_TARGET_CHANGED(event)
    return self:UNIT_POWER_UPDATE(event, "player", "COMBO_POINTS")
end
function f:UNIT_POWER_UPDATE(event,unit, ptype)
    if ptype == "COMBO_POINTS" then
        cpWas = cpNow
        cpNow = GetComboPoints(unit, "target")
    end
end

---------------------------
-- COMBAT LOG
---------------------------

local function cleanDuration(duration, spellID, srcGUID, comboPoints)
    if type(duration) == "function" then
        local isSrcPlayer = srcGUID == UnitGUID("player")
        -- Passing startTime for the sole reason of identifying different Rupture/KS applications for Rogues
        -- Then their duration func will cache one actual duration calculated at the moment of application
        return duration(spellID, isSrcPlayer, comboPoints)
    end
    return duration
end

local function RefreshTimer(srcGUID, dstGUID, spellID)
    local guidTable = guids[dstGUID]
    if not guidTable then return end

    local spellTable = guidTable[spellID]
    if not spellTable then return end

    local applicationTable
    if spellTable.applications then
        applicationTable = spellTable.applications[srcGUID]
    else
        applicationTable = spellTable
    end
    if not applicationTable then return end

    applicationTable[2] = GetTime() -- set start time to now
    return true
end

local function SetTimer(srcGUID, dstGUID, dstName, dstFlags, spellID, spellName, opts, auraType, doRemove)
    if not opts then return end

    local guidTable = guids[dstGUID]
    if not guidTable then
        guids[dstGUID] = {}
        guidTable = guids[dstGUID]
    end

    local isStacking = opts.stacking
    -- local auraUID = MakeAuraUID(spellID, isStacking and srcGUID)

    if doRemove then
        if guidTable[spellID] then
            if isStacking then
                if guidTable[spellID].applications then
                    guidTable[spellID].applications[srcGUID] = nil
                end
            else
                guidTable[spellID] = nil
            end
        end
        return
    end

    local spellTable = guidTable[spellID]
    if not spellTable then
        guidTable[spellID] = {}
        spellTable = guidTable[spellID]
        if isStacking then
            spellTable.applications = {}
        end
    end

    local applicationTable
    if isStacking then
        applicationTable = spellTable.applications[srcGUID]
        if not applicationTable then
            spellTable.applications[srcGUID] = {}
            applicationTable = spellTable.applications[srcGUID]
        end
    else
        applicationTable = spellTable
    end

    local duration = opts.duration
    local isDstPlayer = bit_band(dstFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) > 0
    if isDstPlayer and opts.pvpduration then
        duration = opts.pvpduration
    end

    if not duration then
        return SetTimer(srcGUID, dstGUID, dstName, dstFlags, spellID, spellName, opts, auraType, true)
    end
    -- local mul = getDRMul(dstGUID, spellID)
    -- duration = duration * mul
    local now = GetTime()
    -- local expirationTime
    -- if duration == 0 then
    --     expirationTime = now + UNKNOWN_AURA_DURATION -- 60m
    -- else
    --     -- local temporaryDuration = cleanDuration(opts.duration, spellID, srcGUID)
    --     expirationTime = now + duration
    -- end

    applicationTable[1] = duration
    applicationTable[2] = now
    -- applicationTable[2] = expirationTime
    applicationTable[3] = auraType

    local isSrcPlayer = srcGUID == UnitGUID("player")
    local comboPoints
    if isSrcPlayer and playerClass == "ROGUE" then
        comboPoints = GetCP()
    end
    applicationTable[4] = comboPoints

    guidAccessTimes[dstGUID] = now
end

local function FireToUnits(event, dstGUID)
    if dstGUID == UnitGUID("target") then
        callbacks:Fire(event, "target")
    end
    local nameplateUnit = nameplateUnitMap[dstGUID]
    if nameplateUnit then
        callbacks:Fire(event, nameplateUnit)
    end
end

local function GetLastRankSpellID(spellName)
    local spellID = spellNameToID[spellName]
    if not spellID then
        spellID = NPCspellNameToID[spellName]
    end
    return spellID
end

local lastResistSpellID
local lastResistTime = 0
---------------------------
-- COMBAT LOG HANDLER
---------------------------
function f:COMBAT_LOG_EVENT_UNFILTERED(event)

    local timestamp, eventType, hideCaster,
    srcGUID, srcName, srcFlags, srcFlags2,
    dstGUID, dstName, dstFlags, dstFlags2,
    spellID, spellName, spellSchool, auraType, amount = CombatLogGetCurrentEventInfo()

    if indirectRefreshSpells[spellName] then
        local refreshTable = indirectRefreshSpells[spellName]
        if refreshTable.events[eventType] then
            local targetSpellID = refreshTable.targetSpellID

            local condition = refreshTable.condition
            if condition then
                local isMine = bit_band(srcFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE
                if not condition(isMine) then return end
            end

            if refreshTable.targetResistCheck then
                local now = GetTime()
                if lastResistSpellID == targetSpellID and now - lastResistTime < 0.4 then
                    return
                end
            end

            if refreshTable.applyAura then
                local opts = spells[targetSpellID]
                if opts then
                    local targetAuraType = "DEBUFF"
                    local targetSpellName = GetSpellInfo(targetSpellID)
                    SetTimer(srcGUID, dstGUID, dstName, dstFlags, targetSpellID, targetSpellName, opts, targetAuraType)
                end
            else
                RefreshTimer(srcGUID, dstGUID, targetSpellID)
            end
        end
    end

    if  eventType == "SPELL_MISSED" and
        bit_band(srcFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE
    then
        local missType = auraType
        if missType == "RESIST" then
            spellID = GetLastRankSpellID(spellName)
            if not spellID then
                return
            end

            lastResistSpellID = spellID
            lastResistTime = GetTime()
        end
    end

    if auraType == "BUFF" or auraType == "DEBUFF" or eventType == "SPELL_CAST_SUCCESS" then
        if spellID == 0 then
            -- so not to rewrite the whole thing to spellnames after the combat log change
            -- just treat everything as max rank id of that spell name
            spellID = GetLastRankSpellID(spellName)
            if not spellID then
                return
            end
        end

        CountDiminishingReturns(eventType, srcGUID, srcFlags, dstGUID, dstFlags, spellID, auraType)

        local isDstFriendly = bit_band(dstFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) > 0

        local opts = spells[spellID]

        if not opts then
            local npc_aura_duration = npc_spells[spellID]
            if npc_aura_duration then
                opts = { duration = npc_aura_duration }
            -- elseif enableEnemyBuffTracking and not isDstFriendly and auraType == "BUFF" then
                -- opts = { duration = 0 } -- it'll be accepted but as an indefinite aura
            end
        end

        if opts then
            local castEventPass
            if eventType == "SPELL_CAST_SUCCESS" and opts.castFilter then
                -- For spells that have cast filter enabled, transform their CAST event into AURA_APPLIED
                -- And give them a pass, while their normal AURA_APPLIED events get rejected without it
                eventType = "SPELL_AURA_APPLIED"
                auraType = opts.type == "BUFF" and "BUFF" or "DEBUFF"
                castEventPass = true
            end

            local isEnemyBuff = not isDstFriendly and auraType == "BUFF"
            -- print(eventType, srcGUID, "=>", dstName, spellID, spellName, auraType )
            if  eventType == "SPELL_AURA_REFRESH" or
                eventType == "SPELL_AURA_APPLIED" or
                eventType == "SPELL_AURA_APPLIED_DOSE"
            then
                if  not opts.castFilter or
                    castEventPass or
                    isEnemyBuff
                then
                    SetTimer(srcGUID, dstGUID, dstName, dstFlags, spellID, spellName, opts, auraType)
                end
            elseif eventType == "SPELL_AURA_REMOVED" then
                SetTimer(srcGUID, dstGUID, dstName, dstFlags, spellID, spellName, opts, auraType, true)
            -- elseif eventType == "SPELL_AURA_REMOVED_DOSE" then
                -- self:RemoveDose(srcGUID, dstGUID, spellID, spellName, auraType, amount)
            end
            if enableEnemyBuffTracking and isEnemyBuff then
                -- invalidate buff cache
                buffCacheValid[dstGUID] = nil

                FireToUnits("UNIT_BUFF", dstGUID)
                if  eventType == "SPELL_AURA_REFRESH" or
                    eventType == "SPELL_AURA_APPLIED" or
                    eventType == "SPELL_AURA_APPLIED_DOSE"
                then
                    FireToUnits("UNIT_BUFF_GAINED", dstGUID, spellID)
                end
            end
        end
    end
    if eventType == "UNIT_DIED" then
        if isHunterGUID(dstGUID) then
            local isDstFriendly = bit_band(dstFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) > 0
            if not isDstFriendly or isFriendlyFeigning(dstGUID) then
                return
            end
        end

        guids[dstGUID] = nil
        buffCache[dstGUID] = nil
        buffCacheValid[dstGUID] = nil
        guidAccessTimes[dstGUID] = nil
        local isDstFriendly = bit_band(dstFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) > 0
        if enableEnemyBuffTracking and not isDstFriendly then
            FireToUnits("UNIT_BUFF", dstGUID)
        end
        nameplateUnitMap[dstGUID] = nil
    end
end

---------------------------
-- ENEMY BUFFS
---------------------------
local makeBuffInfo = function(spellID, applicationTable, dstGUID, srcGUID)
    local name, rank, icon, castTime, minRange, maxRange, _spellId = GetSpellInfo(spellID)
    local durationFunc, startTime, auraType, comboPoints = unpack(applicationTable)
    local duration = cleanDuration(durationFunc, spellID, srcGUID, comboPoints) -- srcGUID isn't needed actually
    -- no DRs on buffs
    local expirationTime = startTime + duration
    if duration == INFINITY then
        duration = 0
        expirationTime = 0
    end
    local now = GetTime()
    if expirationTime > now then
        return { name, icon, 1, nil, duration, expirationTime, nil, nil, nil, spellID }
    end
end

local shouldDisplayAura = function(auraTable)
    if auraTable[3] == "BUFF" then
        local now = GetTime()
        local expirationTime = auraTable[2]
        return expirationTime > now
    end
    return false
end

local function RegenerateBuffList(dstGUID)
    local guidTable = guids[dstGUID]
    if not guidTable then
        return
    end

    local buffs = {}
    for spellID, t in pairs(guidTable) do
        if t.applications then
            for srcGUID, auraTable in pairs(t.applications) do
                if auraTable[3] == "BUFF" then
                    local buffInfo = makeBuffInfo(spellID, auraTable, dstGUID, srcGUID)
                    if buffInfo then
                        tinsert(buffs, buffInfo)
                    end
                end
            end
        else
            if t[3] == "BUFF" then
                local buffInfo = makeBuffInfo(spellID, t, dstGUID)
                if buffInfo then
                    tinsert(buffs, buffInfo)
                end
            end
        end
    end

    buffCache[dstGUID] = buffs
    buffCacheValid[dstGUID] = true
end

local FillInDuration = function(unit, buffName, icon, count, debuffType, duration, expirationTime, caster, canStealOrPurge, nps, spellId, ...)
    if buffName then
        local durationNew, expirationTimeNew = GetAuraDurationByUnitDirect(unit, spellId, caster, buffName)
        if duration == 0 and durationNew then
            duration = durationNew
            expirationTime = expirationTimeNew
        end
        return buffName, icon, count, debuffType, duration, expirationTime, caster, canStealOrPurge, nps, spellId, ...
    end
end

function lib.UnitAuraDirect(unit, index, filter)
    if enableEnemyBuffTracking and filter == "HELPFUL" and not UnitIsFriend("player", unit) and not UnitAura(unit, 1, filter) then
        local unitGUID = UnitGUID(unit)
        if not unitGUID then return end
        if not buffCacheValid[unitGUID] then
            RegenerateBuffList(unitGUID)
        end

        local buffCacheHit = buffCache[unitGUID]
        if buffCacheHit then
            local buffReturns = buffCache[unitGUID][index]
            if buffReturns then
                return unpack(buffReturns)
            end
        end
    else
        return FillInDuration(unit, UnitAura(unit, index, filter))
    end
end
lib.UnitAuraWithBuffs = lib.UnitAuraDirect

function lib.UnitAuraWrapper(unit, ...)
    return FillInDuration(unit, UnitAura(unit, ...))
end

function lib:UnitAura(...)
    return self.UnitAuraDirect(...)
end

function f:NAME_PLATE_UNIT_ADDED(event, unit)
    local unitGUID = UnitGUID(unit)
    nameplateUnitMap[unitGUID] = unit
end
function f:NAME_PLATE_UNIT_REMOVED(event, unit)
    local unitGUID = UnitGUID(unit)
    if unitGUID then -- it returns correctly on death, but just in case
        nameplateUnitMap[unitGUID] = nil
    end
end

function callbacks.OnUsed()
    enableEnemyBuffTracking = true
    f:RegisterEvent("NAME_PLATE_UNIT_ADDED")
    f:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
end
function callbacks.OnUnused()
    enableEnemyBuffTracking = false
    f:UnregisterEvent("NAME_PLATE_UNIT_ADDED")
    f:UnregisterEvent("NAME_PLATE_UNIT_REMOVED")
end

---------------------------
-- PUBLIC FUNCTIONS
---------------------------
local function GetGUIDAuraTime(dstGUID, spellName, spellID, srcGUID, isStacking)
    local guidTable = guids[dstGUID]
    if guidTable then

        local lastRankID = spellNameToID[spellName]

        local spellTable = guidTable[lastRankID]
        if spellTable then
            local applicationTable
            if isStacking then
                if srcGUID and spellTable.applications then
                    applicationTable = spellTable.applications[srcGUID]
                elseif spellTable.applications then -- return some duration
                    applicationTable = select(2,next(spellTable.applications))
                end
            else
                applicationTable = spellTable
            end
            if not applicationTable then return end
            local durationFunc, startTime, auraType, comboPoints = unpack(applicationTable)
            local duration = cleanDuration(durationFunc, spellID, srcGUID, comboPoints)
            if duration == INFINITY then return nil end
            if not duration then return nil end
            local mul = getDRMul(dstGUID, spellID)
            -- local mul = getDRMul(dstGUID, lastRankID)
            duration = duration * mul
            local expirationTime = startTime + duration
            if GetTime() <= expirationTime then
                return duration, expirationTime
            end
        end
    end
end

if playerClass == "MAGE" then
    local NormalGetGUIDAuraTime = GetGUIDAuraTime
    local Chilled = GetSpellInfo(12486)
    GetGUIDAuraTime = function(dstGUID, spellName, spellID, ...)

        -- Overriding spellName for Improved blizzard's spellIDs
        if spellName == Chilled and
            spellID == 12486 or spellID == 12484 or spellID == 12485
        then
            spellName = "ImpBlizzard"
        end
        return NormalGetGUIDAuraTime(dstGUID, spellName, spellID, ...)
    end
end

function lib.GetAuraDurationByUnitDirect(unit, spellID, casterUnit, spellName)
    assert(spellID, "spellID is nil")
    local opts = spells[spellID]
    if not opts then return end
    local dstGUID = UnitGUID(unit)
    local srcGUID = casterUnit and UnitGUID(casterUnit)
    if not spellName then spellName = GetSpellInfo(spellID) end
    return GetGUIDAuraTime(dstGUID, spellName, spellID, srcGUID, opts.stacking)
end
GetAuraDurationByUnitDirect = lib.GetAuraDurationByUnitDirect

function lib:GetAuraDurationByUnit(...)
    return self.GetAuraDurationByUnitDirect(...)

end
function lib:GetAuraDurationByGUID(dstGUID, spellID, srcGUID, spellName)
    local opts = spells[spellID]
    if not opts then return end
    if not spellName then spellName = GetSpellInfo(spellID) end
    return GetGUIDAuraTime(dstGUID, spellName, spellID, srcGUID, opts.stacking)
end

function lib:GetLastRankSpellIDByName(spellName)
    return spellNameToID[spellName]
end

-- Will not work for cp-based durations, KS and Rupture
function lib:GetDurationForRank(spellName, spellID, srcGUID)
    local lastRankID = spellNameToID[spellName]
    local opts = spells[lastRankID]
    if opts then
        return cleanDuration(opts.duration, spellID, srcGUID)
    end
end

local activeFrames = {}
function lib:RegisterFrame(frame)
    activeFrames[frame] = true
    if next(activeFrames) then
        f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        if playerClass == "ROGUE" then
            f:RegisterEvent("PLAYER_TARGET_CHANGED")
            f:RegisterUnitEvent("UNIT_POWER_UPDATE", "player")
        end
    end
end
lib.Register = lib.RegisterFrame

function lib:UnregisterFrame(frame)
    activeFrames[frame] = nil
    if not next(activeFrames) then
        f:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        if playerClass == "ROGUE" then
            f:UnregisterEvent("PLAYER_TARGET_CHANGED")
            f:UnregisterEvent("UNIT_POWER_UPDATE")
        end
    end
end
lib.Unregister = lib.UnregisterFrame


function lib:ToggleDebug()
    if not lib.debug then
        lib.debug = CreateFrame("Frame")
        lib.debug:SetScript("OnEvent",function( self, event )
            local timestamp, eventType, hideCaster,
            srcGUID, srcName, srcFlags, srcFlags2,
            dstGUID, dstName, dstFlags, dstFlags2,
            spellID, spellName, spellSchool, auraType, amount = CombatLogGetCurrentEventInfo()
            local isSrcPlayer = (bit_band(srcFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE)
            if isSrcPlayer then
                print (GetTime(), "ID:", spellID, spellName, eventType, srcFlags, srcGUID,"|cff00ff00==>|r", dstGUID, dstFlags, auraType, amount)
            end
        end)
    end
    if not lib.debug.enabled then
        lib.debug:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        lib.debug.enabled = true
        print("[LCD] Enabled combat log event display")
    else
        lib.debug:UnregisterAllEvents()
        lib.debug.enabled = false
        print("[LCD] Disabled combat log event display")
    end
end

function lib:MonitorUnit(unit)
    if not lib.debug then
        lib.debug = CreateFrame("Frame")
        local debugGUID = UnitGUID(unit)
        lib.debug:SetScript("OnEvent",function( self, event )
            local timestamp, eventType, hideCaster,
            srcGUID, srcName, srcFlags, srcFlags2,
            dstGUID, dstName, dstFlags, dstFlags2,
            spellID, spellName, spellSchool, auraType, amount = CombatLogGetCurrentEventInfo()
            if srcGUID == debugGUID or dstGUID == debugGUID then
                print (GetTime(), "ID:", spellID, spellName, eventType, srcFlags, srcGUID,"|cff00ff00==>|r", dstGUID, dstFlags, auraType, amount)
            end
        end)
    end
    if not lib.debug.enabled then
        lib.debug:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        lib.debug.enabled = true
        print("[LCD] Enabled combat log event display")
    else
        lib.debug:UnregisterAllEvents()
        lib.debug.enabled = false
        print("[LCD] Disabled combat log event display")
    end
end


local lib = LibStub and LibStub("LibClassicDurations", true)
if not lib then return end

local Type, Version = "SpellTable", 39
if lib:GetDataVersion(Type) >= Version then return end  -- older versions didn't have that function

local Spell = lib.AddAura
local Talent = lib.Talent
local INFINITY = math.huge

local _, class = UnitClass("player")
local locale = GetLocale()

-- Temporary
-- Erases Fire Vulnerability from the name to id table in case older version of the lib written it there
if locale == "zhCN" then
    lib.spellNameToID[GetSpellInfo(980)] = nil
end

-- https://github.com/rgd87/LibClassicDurations/issues/11
lib.indirectRefreshSpells = {
    [GetSpellInfo(11597)] = { -- Sunder Armor
        events = {
            ["SPELL_CAST_SUCCESS"] = true
        },
        targetSpellID = 11597,
    },

    [GetSpellInfo(25357)] = { -- Healing Wave
        events = {
            ["SPELL_CAST_SUCCESS"] = true
        },
        targetSpellID = 29203, -- Healing Way
    },
}

if class == "MAGE" then
    lib.indirectRefreshSpells[GetSpellInfo(10207)] = { -- Scorch
        events = {
            ["SPELL_DAMAGE"] = true
        },
        targetSpellID = 22959, -- Fire Vulnerability
        targetResistCheck = true,
        condition = function(isMine) return isMine end,
        -- it'll refresg only from mages personal casts which is fine
        -- because if mage doesn't have imp scorch then he won't even see a Fire Vulnerability timer
    }

    lib.indirectRefreshSpells[GetSpellInfo(10)] = { -- Blizzard
        events = {
            ["SPELL_PERIODIC_DAMAGE"] = true
        },
        applyAura = true,
        targetSpellID = 12486, -- Imp Blizzard
    }
end

if class == "PRIEST" then
    -- Shadow Weaving
    lib.indirectRefreshSpells[GetSpellInfo(10894)] = { -- SW:Pain
        events = {
            ["SPELL_AURA_APPLIED"] = true,
            ["SPELL_AURA_REFRESH"] = true,
        },
        targetSpellID = 15258, -- Shadow Weaving
        targetResistCheck = true,
        condition = function(isMine) return isMine end,
    }
    lib.indirectRefreshSpells[GetSpellInfo(10947)] = { -- Mind Blast
        events = {
            ["SPELL_DAMAGE"] = true,
        },
        targetSpellID = 15258, -- Shadow Weaving
        targetResistCheck = true,
        condition = function(isMine) return isMine end,
    }
    lib.indirectRefreshSpells[GetSpellInfo(18807)] = { -- Mind Flay
        events = {
            ["SPELL_AURA_APPLIED"] = true,
            ["SPELL_AURA_REFRESH"] = true,
        },
        targetSpellID = 15258, -- Shadow Weaving
        targetResistCheck = true,
        condition = function(isMine) return isMine end,
    }
end

------------------
-- GLOBAL
------------------

Spell(1604, { duration = 4 }) -- Common Daze
Spell( 23605, { duration = 5 }) -- Nightfall (Axe) Proc
Spell( 835, { duration = 3 }) -- Tidal Charm
Spell( 11196, { duration = 60 }) -- Recently Bandaged

Spell({ 13099, 13138, 16566 }, {
    duration = function(spellID)
        if spellID == 13138 then return 20 -- backfire
        elseif spellID == 16566 then return 30 -- backfire
        else return 10 end
    end
}) -- Net-o-Matic

Spell( 23451, { duration = 10 }) -- Battleground speed buff
Spell( 23493, { duration = 10 }) -- Battleground heal buff
Spell( 23505, { duration = 60 }) -- Battleground damage buff
Spell({ 4068 }, { duration = 3 }) -- Iron Grenade
Spell({ 19769 }, { duration = 3 }) -- Thorium Grenade
Spell( 6615, { duration = 30, type = "BUFF" }) -- Free Action Potion
Spell( 24364, { duration = 5, type = "BUFF" }) -- Living Action Potion
Spell( 3169, { duration = 6, type = "BUFF" }) -- Limited Invulnerability Potion
Spell( 16621, { duration = 3, type = "BUFF" }) -- Invulnerable Mail
Spell( 1090, { duration = 30 }) -- Magic Dust
Spell( 13327, { duration = 30 }) -- Reckless Charge
Spell({ 26740, 13181 }, { duration = 20 }) -- Mind Control Cap + Backfire
Spell( 11359, { duration = 30, type = "BUFF" }) -- Restorative Potion
Spell( 6727, { duration = 30 }) -- Violet Tragan
Spell( 5024, { duration = 10, type = "BUFF" }) -- Skull of Impending Doom
Spell( 2379, { duration = 15, type = "BUFF" }) -- Swiftness Potion
Spell( 5134, { duration = 10 }) -- Flash Bomb
Spell( 23097, { duration = 5, type = "BUFF" }) -- Fire Reflector
Spell( 23131, { duration = 5, type = "BUFF" }) -- Frost Reflector
Spell( 23132, { duration = 5, type = "BUFF" }) -- Shadow Reflector
Spell({ 25750, 25747, 25746, 23991 }, { duration = 15, type = "BUFF" }) -- AB Trinkets
Spell( 23506, { duration = 20, type = "BUFF" }) -- Arena Grand Master trinket
Spell( 29506, { duration = 20, type = "BUFF" }) -- Burrower's Shell trinket
Spell( 12733, { duration = 30, type = "BUFF" }) -- Blacksmith trinket
-- Spell( 15753, { duration = 2 }) -- Linken's Boomerang stun
-- Spell( 15752, { duration = 10 }) -- Linken's Boomerang disarm
Spell( 14530, { duration = 10, type = "BUFF" }) -- Nifty Stopwatch
Spell( 13237, { duration = 3 }) -- Goblin Mortar trinket
Spell( 14253, { duration = 8, type = "BUFF" }) -- Black Husk Shield
Spell( 9175, { duration = 15, type = "BUFF" }) -- Swift Boots
Spell( 13141, { duration = 20, type = "BUFF" }) -- Gnomish Rocket Boots
Spell( 8892, { duration = 20, type = "BUFF" }) -- Goblin Rocket Boots
Spell( 9774, { duration = 5, type = "BUFF" }) -- Spider Belt & Ornate Mithril Boots

-------------
-- RACIALS
-------------

Spell( 26635 ,{ duration = 10, type = "BUFF" }) -- Berserking
Spell( 20600 ,{ duration = 20, type = "BUFF" }) -- Perception
Spell( 23234 ,{ duration = 15, type = "BUFF" }) -- Blood Fury
Spell( 23230 ,{ duration = 25 }) -- Blood Fury debuff
Spell( 20594 ,{ duration = 8, type = "BUFF" }) -- Stoneform
Spell( 20549 ,{ duration = 2 }) -- War Stomp
Spell( 7744, { duration = 5, type = "BUFF" }) -- Will of the Forsaken

-------------
-- PRIEST
-------------

Spell( 15473, { duration = INFINITY, type = "BUFF" }) -- Shadowform
Spell( 14751, { duration = INFINITY, type = "BUFF" }) -- Inner focus

-- Why long auras are disabled
-- When you first get in combat log range with a player,
-- you'll get AURA_APPLIED event as if it was just applied, when it actually wasn't.
-- That's extremely common for these long self-buffs
-- Long raid buffs now have cast filter, that is only if you directly casted a spell it'll register
-- Cast Filter is ignored for enemies, so some personal buffs have it to still show enemy buffs

Spell({ 1243, 1244, 1245, 2791, 10937, 10938 }, { duration = 1800, type = "BUFF", castFilter = true }) -- Power Word: Fortitude
Spell({ 21562, 21564 }, { duration = 3600, type = "BUFF", castFilter = true }) -- Prayer of Fortitude
Spell({ 976, 10957, 10958 }, { duration = 600, type = "BUFF", castFilter = true }) -- Shadow Protection
Spell( 27683, { duration = 600, type = "BUFF", castFilter = true }) -- Prayer of Shadow Protection
Spell({ 14752, 14818, 14819, 27841 }, { duration = 1800, type = "BUFF", castFilter = true }) -- Divine Spirit
Spell( 27681, { duration = 3600, type = "BUFF", castFilter = true }) -- Prayer of Spirit

Spell({ 588, 602, 1006, 7128, 10951, 10952 }, { duration = 600, type = "BUFF", castFilter = true }) -- Inner Fire

Spell({ 14743, 27828 }, { duration = 6, type = "BUFF" }) -- Focused Casting (Martyrdom)
Spell( 27827, { duration = 10, type = "BUFF" }) -- Spirit of Redemption
Spell( 15271, { duration = 15, type = "BUFF" }) -- Spirit Tap

Spell({ 2943, 19249, 19251, 19252, 19253, 19254 }, { duration = 120 }) -- Touch of Weakness Effect
Spell({ 13896, 19271, 19273, 19274, 19275 }, { duration = 15, type = "BUFF" }) -- Feedback
Spell({ 2651, 19289, 19291, 19292, 19293 }, { duration = 15, type = "BUFF" }) -- Elune's Grace
Spell({ 9035, 19281, 19282, 19283, 19284, 19285 }, { duration = 120 }) -- Hex of Weakness

Spell( 6346, { duration = 600, type = "BUFF" }) -- Fear Ward
Spell({ 7001, 27873, 27874 }, { duration = 10, type = "BUFF" }) -- Lightwell Renew
Spell( 552, { duration = 20, type = "BUFF" }) -- Abolish Disease
Spell({ 17, 592, 600, 3747, 6065, 6066, 10898, 10899, 10900, 10901 }, {duration = 30, type = "BUFF" }) -- PWS
Spell( 6788, { duration = 15 }) -- Weakened Soul
Spell({ 139, 6074, 6075, 6076, 6077, 6078, 10927, 10928, 10929, 25315 }, { duration = 15, type = "BUFF" }) -- Renew

Spell( 15487, { duration = 5 }) -- Silence
Spell({ 10797, 19296, 19299, 19302, 19303, 19304, 19305 }, { duration = 6, stacking = true }) -- starshards
Spell({ 2944, 19276, 19277, 19278, 19279, 19280 }, { duration = 24, stacking = true }) --devouring plague
Spell({ 453, 8192, 10953 }, { duration = 15 }) -- mind soothe

Spell({ 9484, 9485, 10955 }, {
    duration = function(spellID)
        if spellID == 9484 then return 30
        elseif spellID == 9485 then return 40
        else return 50 end
    end
}) -- Shackle Undead

Spell( 10060, { duration = 15, type = "BUFF" }) --Power Infusion
Spell({ 14914, 15261, 15262, 15263, 15264, 15265, 15266, 15267 }, { duration = 10, stacking = true }) -- Holy Fire, stacking?
Spell({ 586, 9578, 9579, 9592, 10941, 10942 }, { duration = 10, type = "BUFF" }) -- Fade
Spell({ 8122, 8124, 10888, 10890 }, { duration = 8,  }) -- Psychic Scream
Spell({ 589, 594, 970, 992, 2767, 10892, 10893, 10894 }, { stacking = true,
    duration = function(spellID, isSrcPlayer)
        -- Improved SWP, 2 ranks: Increases the duration of your Shadow Word: Pain spell by 3 sec.
        local talents = isSrcPlayer and 3*Talent(15275, 15317) or 0
        return 18 + talents
    end
}) -- SW:P
Spell( 15269 ,{ duration = 3 }) -- Blackout

if class == "PRIEST" then
Spell( 15258 ,{
    duration = function(spellID, isSrcPlayer)
        -- Only SP himself can see the timer
        if Talent(15257, 15331, 15332, 15333, 15334) > 0 then
            return 15
        else
            return nil
        end
    end
}) -- Shadow Weaving
end

Spell( 15286 ,{ duration = 60 }) -- Vampiric Embrace
Spell({ 15407, 17311, 17312, 17313, 17314, 18807 }, { duration = 3 }) -- Mind Flay
Spell({ 605, 10911, 10912 }, { duration = 60 }) -- Mind Control

---------------
-- DRUID
---------------

Spell( 768, { duration = INFINITY, type = "BUFF" }) -- Cat Form
Spell( 783, { duration = INFINITY, type = "BUFF" }) -- Travel Form
Spell( 5487, { duration = INFINITY, type = "BUFF" }) -- Bear Form
Spell( 9634, { duration = INFINITY, type = "BUFF" }) -- Dire Bear Form
Spell( 1066, { duration = INFINITY, type = "BUFF" }) -- Aquatic Form
Spell( 24858, { duration = INFINITY, type = "BUFF" }) -- Moonkin Form
Spell( 17116, { duration = INFINITY, type = "BUFF" }) -- Nature's Swiftness

Spell({ 1126, 5232, 5234, 6756, 8907, 9884, 9885 }, { duration = 1800, type = "BUFF", castFilter = true }) -- Mark of the Wild
Spell({ 21849, 21850 }, { duration = 3600, type = "BUFF", castFilter = true }) -- Gift of the Wild
Spell( 19975, { duration = 12 }) -- Nature's Grasp root
Spell({ 16689, 16810, 16811, 16812, 16813, 17329 }, { duration = 45, type = "BUFF" }) -- Nature's Grasp
Spell( 16864, { duration = 600, type = "BUFF", castFilter = true }) -- Omen of Clarity
Spell( 16870, { duration = 15, type = "BUFF" }) -- Clearcasting from OoC



Spell( 19675, { duration = 4 }) -- Feral Charge
Spell({ 467, 782, 1075, 8914, 9756, 9910 }, { duration = 600, type = "BUFF" }) -- Thorns
Spell( 22812 ,{ duration = 15, type = "BUFF" }) -- Barkskin
--SKIPPING: Hurricane (Channeled)
Spell({ 339, 1062, 5195, 5196, 9852, 9853 }, {
    pvpduration = 20,
    duration = function(spellID)
        if spellID == 339 then return 12
        elseif spellID == 1062 then return 15
        elseif spellID == 5195 then return 18
        elseif spellID == 5196 then return 21
        elseif spellID == 9852 then return 24
        else return 27 end
    end
}) -- Entangling Roots
Spell({ 2908, 8955, 9901 }, { duration = 15 }) -- Soothe Animal
Spell({ 770, 778, 9749, 9907 }, { duration = 40 }) -- Faerie Fire
Spell({ 16857, 17390, 17391, 17392 }, { duration = 40 }) -- Faerie Fire (Feral)
Spell({ 2637, 18657, 18658 }, {
    pvpduration = 20,
    duration = function(spellID)
        if spellID == 2637 then return 20
        elseif spellID == 18657 then return 30
        else return 40 end
    end
}) -- Hibernate
Spell({ 99, 1735, 9490, 9747, 9898 }, { duration = 30 }) -- Demoralizing Roar
Spell({ 5211, 6798, 8983 }, { stacking = true, -- stacking?
    duration = function(spellID)
        local brutal_impact = Talent(16940, 16941)*0.5
        if spellID == 5211 then return 2+brutal_impact
        elseif spellID == 6798 then return 3+brutal_impact
        else return 4+brutal_impact end
    end
}) -- Bash
Spell( 5209, { duration = 6 }) -- Challenging Roar
Spell( 6795, { duration = 3, stacking = true }) -- Taunt

Spell({ 1850, 9821 }, { duration = 15, type = "BUFF" }) -- Dash
Spell( 5229, { duration = 10, type = "BUFF" }) -- Enrage
Spell({ 22842, 22895, 22896 }, { duration = 10, type = "BUFF" }) -- Frenzied Regeneration
Spell( 16922, { duration = 3 }) -- Imp Starfire Stun

Spell({ 9005, 9823, 9827 }, { -- Pounce stun doesn't create a debuff icon, so this is not going to be used
    duration = function(spellID)
        local brutal_impact = Talent(16940, 16941)*0.5
        return 2+brutal_impact
    end
}) -- Pounce
Spell({ 9007, 9824, 9826 }, { duration = 18, stacking = true, }) -- Pounce Bleed
Spell({ 8921, 8924, 8925, 8926, 8927, 8928, 8929, 9833, 9834, 9835 }, {
    duration = function(spellID)
        if spellID == 8921 then return 9
        else return 12 end
    end
}) -- Moonfire
Spell({ 1822, 1823, 1824, 9904 }, { duration = 9, stacking = true }) -- Rake
Spell({ 1079, 9492, 9493, 9752, 9894, 9896 }, { duration = 12, stacking = true }) -- Rip
Spell({ 5217, 6793, 9845, 9846 }, { name = "Tiger's Fury", duration = 6 })

Spell( 2893 ,{ duration = 8, type = "BUFF" }) -- Abolish Poison
Spell( 29166 , { duration = 20, type = "BUFF" }) -- Innervate

Spell({ 8936, 8938, 8939, 8940, 8941, 9750, 9856, 9857, 9858 }, { duration = 21, type = "BUFF" }) -- Regrowth
Spell({ 774, 1058, 1430, 2090, 2091, 3627, 8910, 9839, 9840, 9841, 25299 }, { duration = 12, stacking = false, type = "BUFF" }) -- Rejuv
Spell({ 5570, 24974, 24975, 24976, 24977 }, { duration = 12, stacking = true }) -- Insect Swarm

-------------
-- WARRIOR
-------------

Spell( 2457 , { duration = INFINITY, type = "BUFF" }) -- Battle Stance
Spell( 2458 , { duration = INFINITY, type = "BUFF" }) -- Berserker Stance
Spell( 71 , { duration = INFINITY, type = "BUFF" }) -- Def Stance

Spell( 12294, { duration = 10 }) -- Mortal Strike Healing Reduction

Spell({72, 1671, 1672}, { duration = 6 }) -- Shield Bash
Spell( 18498, { duration = 3 }) -- Improved Shield Bash

Spell( 20230, { duration = 15, type = "BUFF" }) -- Retaliation
Spell( 1719, { duration = 15, type = "BUFF" }) -- Recklessness
Spell( 871, { type = "BUFF", duration = 10 }) -- Shield wall, varies
Spell( 12976, { duration = 20, type = "BUFF" }) -- Last Stand
Spell( 12328, { duration = 30 }) -- Death Wish
Spell({ 772, 6546, 6547, 6548, 11572, 11573, 11574 }, { stacking = true,
    duration = function(spellID)
        if spellID == 772 then return 9
        elseif spellID == 6546 then return 12
        elseif spellID == 6547 then return 15
        elseif spellID == 6548 then return 18
        else return 21 end
    end
}) -- Rend
Spell( 12721, { duration = 12, stacking = true }) -- Deep Wounds

Spell({ 1715, 7372, 7373 }, { duration = 15 }) -- Hamstring
Spell( 23694 , { duration = 5 }) -- Improved Hamstring
Spell({ 6343, 8198, 8204, 8205, 11580, 11581 }, {
    duration = function(spellID)
        if spellID == 6343 then return 10
        elseif spellID == 8198 then return 14
        elseif spellID == 8204 then return 18
        elseif spellID == 8205 then return 22
        elseif spellID == 11580 then return 26
        else return 30 end
    end
}) -- Thunder Clap
Spell({ 694, 7400, 7402, 20559, 20560 }, { duration = 6 }) -- Mocking Blow
Spell( 1161 ,{ duration = 6 }) -- Challenging Shout
Spell( 355 ,{ duration = 3, stacking = true }) -- Taunt
Spell({ 5242, 6192, 6673, 11549, 11550, 11551, 25289 }, { type = "BUFF",
    duration = function(spellID, isSrcPlayer)
        local talents = isSrcPlayer and Talent(12321, 12835, 12836, 12837, 12838) or 0
        return 120 * (1 + 0.1 * talents)
    end
}) -- Battle Shout
Spell({ 1160, 6190, 11554, 11555, 11556 }, {
    duration = function(spellID, isSrcPlayer)
        local talents = isSrcPlayer and Talent(12321, 12835, 12836, 12837, 12838) or 0
        return 30 * (1 + 0.1 * talents)
    end
}) -- Demoralizing Shout, varies
Spell( 18499, { duration = 10, type = "BUFF" }) -- Berserker Rage
Spell({ 20253, 20614, 20615 }, { duration = 3 }) -- Intercept
Spell( 12323, { duration = 6 }) -- Piercing Howl
Spell( 5246, { duration = 8 }) -- Intimidating Shout Fear
Spell( 20511, { duration = 8 }) -- Intimidating Shout Main Target Cower Effect

Spell( 676 ,{
    duration = function(spellID, isSrcPlayer)
        local talents = isSrcPlayer and Talent(12313, 12804, 12807) or 0
        return 10 + talents
    end,
}) -- Disarm, varies
Spell( 29131 ,{ duration = 10, type = "BUFF" }) -- Bloodrage
Spell( 12798 , { duration = 3 }) -- Imp Revenge Stun
Spell( 2565 ,{ duration = 5, type = "BUFF" }) -- Shield Block, varies BUFF

Spell({ 7386, 7405, 8380, 11596, 11597 }, { duration = 30 }) -- Sunder Armor
Spell( 12809 ,{ duration = 5 }) -- Concussion Blow
Spell( 12292 ,{ duration = 20, type = "BUFF" }) -- Sweeping Strikes
Spell({ 12880, 14201, 14202, 14203, 14204 }, { duration = 12, type = "BUFF" }) -- Enrage
Spell({ 12966, 12967, 12968, 12969, 12970 }, { duration = 15, type = "BUFF" }) -- Flurry
Spell({ 16488, 16490, 16491 }, { duration = 6, type = "BUFF" }) -- Blood Craze
Spell(7922, { duration = 1 }) -- Charge
Spell(5530, { duration = 3 }) -- Mace Specialization

--------------
-- ROGUE
--------------

Spell( 14177 , { duration = INFINITY, type = "BUFF" }) -- Cold Blood
Spell({ 1784, 1785, 1786, 1787 } , { duration = INFINITY, type = "BUFF" }) -- Stealth

Spell( 14278 , { duration = 7, type = "BUFF" }) -- Ghostly Strike
Spell({ 16511, 17347, 17348 }, { duration = 15 }) -- Hemorrhage
Spell({ 11327, 11329 }, { duration = 10 }) -- Vanish
Spell({ 3409, 11201 }, { duration = 12 }) -- Crippling Poison
-- Spell({ 13218, 13222, 13223, 13224 }, { duration = 15 }) -- Wound Poison
-- Spell({ 2818, 2819, 11353, 11354, 25349 }, { duration = 12, stacking = true }) -- Deadly Poison
Spell({ 5760, 8692, 11398 }, {
    duration = function(spellID)
        if spellID == 5760 then return 10
        elseif spellID == 8692 then return 12
        else return 14 end
    end
}) -- Mind-numbing Poison

Spell( 18425, { duration = 2 }) -- Improved Kick Silence
Spell( 13750, { duration = 15, type = "BUFF" }) -- Adrenaline Rush
Spell( 13877, { duration = 15, type = "BUFF" }) -- Blade Flurry
Spell( 1833, { duration = 4 }) -- Cheap Shot
Spell({ 2070, 6770, 11297 }, {
    pvpduration = 20,
    duration = function(spellID)
        if spellID == 6770 then return 25 -- yes, Rank 1 spell id is 6770 actually
        elseif spellID == 2070 then return 35
        else return 45 end
    end
}) -- Sap
Spell( 2094 , { duration = 10 }) -- Blind

Spell({ 8647, 8649, 8650, 11197, 11198 }, { duration = 30 }) -- Expose Armor
Spell({ 703, 8631, 8632, 8633, 11289, 11290 }, { duration = 18 }) -- Garrote

Spell({ 408, 8643 }, {
    duration = function(spellID, isSrcPlayer, comboPoints)
        local duration = spellID == 8643 and 1 or 0 -- if Rank 2, add 1s
        if isSrcPlayer then
            return duration + comboPoints
        else
            return duration + 5 -- just assume 5cp i guess
        end
    end
}) -- Kidney Shot

Spell({ 1943, 8639, 8640, 11273, 11274, 11275 }, { stacking = true,
    duration = function(spellID, isSrcPlayer, comboPoints)
        if isSrcPlayer then
            return (6 + comboPoints*2)
        else
            return 16
        end
    end
}) -- Rupture
-- SnD -- player-only, can skip

Spell({ 2983, 8696, 11305 }, { duration = 15, type = "BUFF" }) -- Sprint
Spell( 5277 ,{ duration = 15, type = "BUFF" }) -- Evasion
Spell({ 1776, 1777, 8629, 11285, 11286 }, {
    duration = function(spellID, isSrcPlayer)
        if isSrcPlayer then
            return 4 + 0.5*Talent(13741, 13793, 13792)
        else
            return 5.5
        end
    end
}) -- Gouge

Spell( 14251 , { duration = 6 }) -- Riposte (disarm)

------------
-- WARLOCK
------------

Spell({ 20707, 20762, 20763, 20764, 20765 }, { duration = 1800, type = "BUFF" }) -- Soulstone Resurrection
Spell({ 687, 696, 706, 1086, 11733, 11734, 11735 }, { duration = 1800, type = "BUFF", castFilter = true }) -- Demon SKin/Armor
-- Spell({ 18791, 18789, 18792, 18790 }, { duration = 1800, type = "BUFF" })  -- Touch of Shadow, Burning Wish, Fel Energy, Fel Stamina

--SKIPPING: Drain Life, Mana, Soul, Enslave, Health funnel, kilrog
Spell( 24259 ,{ duration = 3 }) -- Spell Lock Silence
Spell({ 17767, 17850, 17851, 17852, 17853, 17854 }, { duration = 10 }) -- Consume Shadows (Voidwalker)
Spell( 18118, { duration = 5 }) -- Aftermath Proc
Spell({ 132, 2970, 11743 }, { duration = 600 }) -- Detect Invisibility
Spell( 5697, { duration = 600 }) -- Unending Breath
-- Spell({ 17794, 17798, 17797, 17799, 17800 }, { duration = 12 }) -- Shadow Vulnerability (Imp Shadow Bolt)
-- SKIPPING: Amplify Curse
Spell({ 1714, 11719 }, { duration = 30 }) -- Curse of Tongues
Spell({ 702, 1108, 6205, 7646, 11707, 11708 },{ duration = 120 }) -- Curse of Weakness
Spell({ 17862, 17937 }, { duration = 300 }) -- Curse of Shadows
Spell({ 1490, 11721, 11722 }, { duration = 300 }) -- Curse of Elements
Spell({ 704, 7658, 7659, 11717 }, { duration = 120 }) -- Curse of Recklessness
Spell( 603 ,{ duration = 60, stacking = true }) -- Curse of Doom
Spell( 18223 ,{ duration = 12 }) -- Curse of Exhaustion
Spell( 6358, {
    pvpduration = 20,
    duration = function(spellID, isSrcPlayer)
        if isSrcPlayer then
            local mul = 1 + Talent(18754, 18755, 18756)*0.1
            return 15*mul
        else
            return 15
        end
    end
}) -- Seduction, varies, Improved Succubus
Spell({ 5484, 17928 }, {
    duration = function(spellID)
        return spellID == 5484 and 10 or 15
    end
}) -- Howl of Terror
Spell({ 5782, 6213, 6215 }, {
    pvpduration = 20,
    duration = function(spellID)
        if spellID == 5782 then return 10
        elseif spellID == 6213 then return 15
        else return 20 end
    end
}) -- Fear

Spell({ 710, 18647 }, {
    duration = function(spellID)
        return spellID == 710 and 20 or 30
    end
}) -- Banish
Spell({ 6789, 17925, 17926 }, { duration = 3 }) -- Death Coil

Spell({ 18265, 18879, 18880, 18881}, { duration = 30, stacking = true }) -- Siphon Life

if locale ~= "zhCN" or class ~= "MAGE" then
Spell({ 980, 1014, 6217, 11711, 11712, 11713 }, { duration = 24, stacking = true }) -- Curse of Agony
end

Spell({ 172, 6222, 6223, 7648, 11671, 11672, 25311 }, { stacking = true,
    duration = function(spellID)
        if spellID == 172 then
            return 12
        elseif spellID == 6222 then
            return 15
        else
            return 18
        end
    end
})
Spell({ 348, 707, 1094, 2941, 11665, 11667, 11668, 25309 },{ duration = 15, stacking = true }) -- Immolate

Spell({ 6229, 11739, 11740, 28610 } ,{ duration = 30, type = "BUFF" }) -- Shadow Ward
Spell({ 7812, 19438, 19440, 19441, 19442, 19443 }, { duration = 30, type = "BUFF" }) -- Sacrifice
Spell({ 17877, 18867, 18868, 18869, 18870, 18871 }, { duration = 5 }) -- Shadowburn Debuff
Spell( 18093 ,{ duration = 3 }) -- Pyroclasm

---------------
-- SHAMAN
---------------

Spell({ 8185, 10534, 10535 }, { duration = INFINITY, type = "BUFF" }) -- Fire Resistance Totem
Spell({ 8182, 10476, 10477 }, { duration = INFINITY, type = "BUFF" }) -- Frost Resistance Totem
Spell({ 10596, 10598, 10599 }, { duration = INFINITY, type = "BUFF" }) -- Nature Resistance Totem
Spell( 25909, { duration = INFINITY, type = "BUFF" }) -- Tranquil Air Totem
Spell({ 5672, 6371, 6372, 10460, 10461 }, { duration = INFINITY, type = "BUFF" }) -- Healing Stream Totem
Spell({ 5677, 10491, 10493, 10494 }, { duration = INFINITY, type = "BUFF" }) -- Mana Spring Totem
Spell({ 8076, 8162, 8163, 10441, 25362 }, { duration = INFINITY, type = "BUFF" }) -- Strength of Earth Totem
Spell({ 8836, 10626, 25360 }, { duration = INFINITY, type = "BUFF" }) -- Grace of Air Totem
Spell({ 8072, 8156, 8157, 10403, 10404, 10405 }, { duration = INFINITY, type = "BUFF" }) -- Stoneskin Totem
Spell({ 16191, 17355, 17360 }, { duration = 12, type = "BUFF" }) -- Mana Tide Totem


Spell( 8178 ,{ duration = 45, type = "BUFF" }) -- Grounding Totem Effect, no duration, but lasts 45s. Keeping for enemy buffs

-- Using Druid's NS
-- Spell( 16188, { duration = INFINITY, type = "BUFF" }) -- Nature's Swiftness

Spell({ 324, 325, 905, 945, 8134, 10431, 10432 }, { duration = 600, type = "BUFF" }) -- Lightning Shield
Spell( 546 ,{ duration = 600, type = "BUFF" }) -- Water Walkign
Spell( 131 ,{ duration = 600, type = "BUFF" }) -- Water Breahing
Spell({ 16257, 16277, 16278, 16279, 16280 }, { duration = 15, type = "BUFF" }) -- Flurry

Spell( 17364 ,{ duration = 12 }) -- Stormstrike
Spell({ 16177, 16236, 16237 }, { duration = 15, type = "BUFF" }) -- Ancestral Fortitude from Ancestral Healing
Spell({ 8056, 8058, 10472, 10473 }, { duration = 8 }) -- Frost Shock
Spell({ 8050, 8052, 8053, 10447, 10448, 29228 }, { duration = 12, stacking = true }) -- Flame Shock
Spell( 29203 ,{ duration = 15, type = "BUFF" }) -- Healing Way
Spell({ 8034, 8037, 10458, 16352, 16353 }, { duration = 8 }) -- Frostbrand Attack
Spell( 3600 ,{ duration = 5 }) -- Earthbind Totem

--------------
-- PALADIN
--------------

Spell( 19746, { duration = INFINITY, type = "BUFF" }) -- Concentration Aura
Spell({ 465, 643, 1032, 10290, 10291, 10292, 10293 }, { duration = INFINITY, type = "BUFF" }) -- Devotion Aura
Spell({ 19891, 19899, 19900 }, { duration = INFINITY, type = "BUFF" }) -- Fire Resistance Aura
Spell({ 19888, 19897, 19898 }, { duration = INFINITY, type = "BUFF" }) -- Frost Resistance Aura
Spell({ 19876, 19895, 19896 }, { duration = INFINITY, type = "BUFF" }) -- Shadow Resistance Aura
Spell({ 7294, 10298, 10299, 10300, 10301 }, { duration = INFINITY, type = "BUFF" }) -- Retribution Aura


Spell( 25780, { duration = 1800, type = "BUFF" }) -- Righteous Fury

Spell({ 19740, 19834, 19835, 19836, 19837, 19838, 25291 }, { duration = 300, type = "BUFF", castFilter = true }) -- Blessing of Might
Spell({ 25782, 25916 }, { duration = 900, type = "BUFF", castFilter = true }) -- Greater Blessing of Might

Spell({ 19742, 19850, 19852, 19853, 19854, 25290 }, { duration = 300, type = "BUFF", castFilter = true }) -- Blessing of Wisdom
Spell({ 25894, 25918 }, { duration = 900, type = "BUFF", castFilter = true }) -- Greater Blessing of Might

Spell(20217, { duration = 300, type = "BUFF", castFilter = true }) -- Blessing of Kings
Spell(25898, { duration = 900, type = "BUFF", castFilter = true }) -- Greater Blessing of Kings

Spell({ 20911, 20912, 20913 }, { duration = 300, type = "BUFF", castFilter = true }) -- Blessing of Sanctuary
Spell(25899, { duration = 900, type = "BUFF", castFilter = true }) -- Greater Blessing of Sanctuary

Spell(1038, { duration = 300, type = "BUFF", castFilter = true }) -- Blessing of Salvation
Spell(25895, { duration = 900, type = "BUFF", castFilter = true }) -- Greater Blessing of Salvation

Spell({ 19977, 19978, 19979 }, { duration = 300, type = "BUFF", castFilter = true }) -- Blessing of Light
Spell(25890, { duration = 900, type = "BUFF", castFilter = true }) -- Greater Blessing of Light

Spell( 20066, { duration = 6 }) -- Repentance
Spell({ 2878, 5627, 5627 }, {
    duration = function(spellID)
        if spellID == 2878 then return 10
        elseif spellID == 5627 then return 15
        else return 20 end
    end
}) -- Turn Undead

Spell( 1044, { duration = 10, type = "BUFF" }) -- Blessing of Freedom
Spell({ 6940, 20729 }, { duration = 30, type = "BUFF" }) -- Blessing of Sacrifice
Spell({ 1022, 5599, 10278 }, { type = "BUFF",
    duration = function(spellID)
        if spellID == 1022 then return 6
        elseif spellID == 5599 then return 8
        else return 10 end
    end
}) -- Blessing of Protection
Spell(25771, { duration = 60 }) -- Forbearance
Spell({ 498, 5573 }, { type = "BUFF",
    duration = function(spellID)
        return spellID == 498 and 6 or 8
    end
}) -- Divine Protection
Spell({ 642, 1020 }, { type = "BUFF",
    duration = function(spellID)
        return spellID == 642 and 10 or 12
    end
}) -- Divine Shield
Spell({ 20375, 20915, 20918, 20919, 20920 }, { duration = 30, type = "BUFF" }) -- Seal of Command
Spell({ 21084, 20287, 20288, 20289, 20290, 20291, 20292, 20293 }, { duration = 30, type = "BUFF"}) -- Seal of Righteousness
Spell({ 20162, 20305, 20306, 20307, 20308, 21082 }, { duration = 30, type = "BUFF" }) -- Seal of the Crusader
Spell({ 20165, 20347, 20348, 20349 }, { duration = 30, type = "BUFF" }) -- Seal of Light
Spell({ 20166, 20356, 20357 }, { duration = 30, type = "BUFF" }) -- Seal of Wisdom
Spell( 20164 , { duration = 30, type = "BUFF" }) -- Seal of Justice

Spell({ 21183, 20188, 20300, 20301, 20302, 20303 }, { duration = 10 }) -- Judgement of the Crusader
Spell({ 20185, 20344, 20345, 20346 }, {
    duration = function(spellID, isSrcPlayer)
        if isSrcPlayer then
            local talents = 10*Talent(20359, 20360, 20361)
            return 10+talents
        else
            return 10
        end
    end
}) -- Judgement of Light
Spell({ 20186, 20354, 20355 }, {
    duration = function(spellID, isSrcPlayer)
        if isSrcPlayer then
            local talents = 10*Talent(20359, 20360, 20361)
            return 10+talents
        else
            return 10
        end
    end
}) -- Judgement of Wisdom
Spell(20184, { duration = 10 }) -- Judgement of Justice

Spell({ 853, 5588, 5589, 10308 }, {
    duration = function(spellID)
        if spellID == 853 then return 3
        elseif spellID == 5588 then return 4
        elseif spellID == 5589 then return 5
        else return 6 end
    end
}) -- Hammer of Justice

Spell({ 20925, 20927, 20928 }, { duration = 10, type = "BUFF" }) -- Holy Shield
Spell({ 20128, 20131, 20132, 20133, 20134 }, { duration = 10, type = "BUFF" }) -- Holy Shield
Spell({ 67, 26017, 26018 }, { duration = 10, type = "BUFF" }) -- Vindication
Spell({ 20050, 20052, 20053, 20054, 20055 }, { duration = 8, type = "BUFF" }) -- Vengeance
Spell( 20170 ,{ duration = 2 }) -- Seal of Justice stun

-------------
-- HUNTER
-------------

Spell( 13161, { duration = INFINITY, type = "BUFF" }) -- Aspect of the Beast
Spell( 5118, { duration = INFINITY, type = "BUFF" }) -- Aspect of the Cheetah
Spell( 13159, { duration = INFINITY, type = "BUFF" }) -- Aspect of the Pack
Spell( 13163, { duration = INFINITY, type = "BUFF" }) -- Aspect of the Monkey
Spell({ 20043, 20190 }, { duration = INFINITY, type = "BUFF" }) -- Aspect of the Wild
Spell({ 13165, 14318, 14319, 14320, 14321, 14322, 25296 }, { duration = INFINITY, type = "BUFF" }) -- Aspect of the Hawk
Spell( 5384, { duration = INFINITY, type = "BUFF" }) -- Feign Death (Will it work?)

Spell({ 19506, 20905, 20906 }, { duration = 1800, type = "BUFF", castFilter = true }) -- Trueshot Aura
--SKIPPING: Frenzy
Spell({ 1130, 14323, 14324, 14325 }, { duration = 120 }) -- Hunter's Mark
Spell(19263, { duration = 10, type = "BUFF" }) -- Deterrence
Spell(3045, { duration = 15, type = "BUFF" }) -- Rapid Fire
Spell(19574, { duration = 18, type = "BUFF" }) -- Bestial Wrath
Spell({ 1978, 13549, 13550, 13551, 13552, 13553, 13554, 13555, 25295 }, { duration = 15, stacking = true }) -- Serpent Sting
Spell({ 3043, 14275, 14276, 14277 }, { duration = 20 }) -- Scorpid Sting
Spell({ 3034, 14279, 14280 }, { duration = 8 }) -- Viper Sting
Spell({ 19386, 24132, 24133 }, { duration = 12 }) -- Wyvern Sting
Spell({ 24131, 24134, 24135 }, { duration = 12 }) -- Wyvern Sting Dot
Spell({ 1513, 14326, 14327 }, {
    pvpduration = 20,
    duration = function(spellID)
        if spellID == 1513 then return 10
        elseif spellID == 14326 then return 15
        else return 20 end
    end
}) -- Scare Beast

Spell(19229, { duration = 5 }) -- Wing Clip Root
Spell({ 19306, 20909, 20910 }, { duration = 5 }) -- Counterattack
-- Spell({ 13812, 14314, 14315 }, { duration = 20, stacking = true }) -- Explosive Trap
Spell({ 13797, 14298, 14299, 14300, 14301 }, { duration = 15, stacking = true }) -- Immolation Trap
Spell({ 3355, 14308, 14309 }, {
    pvpduration = 20,
    duration = function(spellID, isSrcPlayer)
        local mul = 1
        if isSrcPlayer then
            mul = mul + 0.15*Talent(19239, 19245) -- Clever Traps
        end
        if spellID == 3355 then return 10*mul
        elseif spellID == 14308 then return 15*mul
        else return 20*mul end
    end
}) -- Freezing Trap
Spell(19503, { duration = 4 }) -- Scatter Shot
Spell({ 2974, 14267, 14268 }, { duration = 10 }) -- Wing Clip
Spell(5116, { duration = 4 }) -- Concussive Shot
Spell(19410, { duration = 3 }) -- Conc Stun
Spell(24394, { duration = 3 }) -- Intimidation
-- Spell(15571, { duration = 4 }) -- Daze from Aspect
Spell(19185, { duration = 5 }) -- Entrapment
Spell(25999, { duration = 1 }) -- Boar Charge
Spell(1002, { duration = 60 }) -- Eye of the Beast
Spell(1539, { duration = 20 }) -- Feed Pet Effect

-------------
-- MAGE
-------------

Spell( 12043, { duration = INFINITY, type = "BUFF" }) -- Presence of Mind

Spell({ 1459, 1460, 1461, 10156, 10157 }, { duration = 1800, type = "BUFF", castFilter = true }) -- Arcane Intellect
Spell( 23028, { duration = 3600, type = "BUFF", castFilter = true }) -- Arcane Brilliance
Spell({ 6117, 22782, 22783 }, { duration = 1800, type = "BUFF", castFilter = true }) -- Mage Armor
Spell({ 168, 7300, 7301, 7302, 7320, 10219, 10220 }, { duration = 1800, type = "BUFF", castFilter = true }) -- Frost/Ice Armor

Spell( 2855, { duration = 1800, type = "BUFF" }) -- Detect Magic
Spell( 130, { duration = 1800, type = "BUFF" }) -- Slow Fall

Spell({ 133, 143, 145, 3140, 8400, 8401, 8402, 10148, 10149, 10150, 10151, 25306 }, {
    stacking = true,
    duration = function(spellID)
        if spellID == 133 then return 4
        elseif spellID == 143 then return 6
        elseif spellID == 145 then return 6
        else return 8 end
    end
}) -- Fireball
Spell({ 11366, 12505, 12522, 12523, 12524, 12525, 12526, 18809 }, { duration = 12, stacking = true }) -- Pyroblast

Spell({ 604, 8450, 8451, 10173, 10174 }, { duration = 600, type = "BUFF" }) -- Dampen Magic
Spell({ 1008, 8455, 10169, 10170 }, { duration = 600, type = "BUFF" }) -- Amplify Magic

Spell(18469, { duration = 4 }) -- Imp CS Silence
Spell({ 118, 12824, 12825, 12826, 28270, 28271, 28272 }, {
    pvpduration = 20,
    duration = function(spellID)
        if spellID == 118 then return 20
        elseif spellID == 12824 then return 30
        elseif spellID == 12825 then return 40
        else return 50 end
    end
}) -- Polymorph
Spell(11958, { duration = 10, type = "BUFF" }) -- Ice Block
Spell({ 1463, 8494, 8495, 10191, 10192, 10193 }, { duration = 60, type = "BUFF" }) -- Mana Shield
Spell({ 11426, 13031, 13032, 13033 }, { duration = 60, type = "BUFF" }) -- Ice Barrier
Spell({ 543, 8457, 8458, 10223, 10225 }, { duration = 30, type = "BUFF" }) -- Fire Ward
Spell({ 6143, 8461, 8462, 10177, 28609 }, { duration = 30, type = "BUFF" }) -- Frost Ward

Spell(12355, { duration = 2 }) -- Impact
Spell(12654, { duration = 4 }) -- Ignite

if class == "MAGE" then
Spell(22959, {
    duration = function(spellID, isSrcPlayer)
        if Talent(11095, 12872, 12873) > 0 then
            return 30
        else
            return nil
        end
    end }) -- Fire Vulnerability
end

Spell({ 11113, 13018, 13019, 13020, 13021 }, { duration = 6 }) -- Blast Wave

Spell({ 2120, 2121, 8422, 8423, 10215, 10216 }, { duration = 8, stacking = true }) -- Flamestrike

Spell({ 120, 8492, 10159, 10160, 10161 }, {
    duration = function(spellID, isSrcPlayer)
        local permafrost = isSrcPlayer and Talent(11175, 12569, 12571) or 0
        return 8 + permafrost
    end
}) -- Cone of Cold


if class == "MAGE" then
-- Chilled from Imp Blizzard
Spell({ 12484, 12485, 12486 }, {
    duration = function(spellID, isSrcPlayer)
        if Talent(11185, 12487, 12488) > 0 then -- Don't show anything if mage doesn't have imp blizzard talent
            local permafrost = Talent(11175, 12569, 12571) -- Always count player's permafost, even source isn't player.
            return 1.5 + permafrost + 0.5
            -- 0.5 compensates for delay between damage event and slow application
        else
            return nil
        end
    end
}) -- Improved Blizzard (Chilled)

-- Manually setting a custom spellname for ImpBlizzard's "Chilled" aura
lib.spellNameToID["ImpBlizzard"] = 12486
-- Frost Armor will overwrite Chilled to 7321 right after
end

Spell({6136, 7321}, {
    duration = function(spellID, isSrcPlayer)
        local permafrost = isSrcPlayer and Talent(11175, 12569, 12571) or 0
        return 5 + permafrost
    end
}) -- Frost/Ice Armor (Chilled)

Spell({ 116, 205, 837, 7322, 8406, 8407, 8408, 10179, 10180, 10181, 25304 }, {
    duration = function(spellID, isSrcPlayer)
        local permafrost = isSrcPlayer and Talent(11175, 12569, 12571) or 0
        if spellID == 116 then return 5 + permafrost
        elseif spellID == 205 then return 6 + permafrost
        elseif spellID == 837 then return 6 + permafrost
        elseif spellID == 7322 then return 7 + permafrost
        elseif spellID == 8406 then return 7 + permafrost
        elseif spellID == 8407 then return 8 + permafrost
        elseif spellID == 8408 then return 8 + permafrost
        else return 9 + permafrost end
    end
}) -- Frostbolt

Spell(12494, { duration = 5 }) -- Frostbite
Spell({ 122, 865, 6131, 10230 }, { duration = 8 }) -- Frost Nova
-- Spell(12536, { duration = 15 }) -- Clearcasting
Spell(12043, { duration = 15 }) -- Presence of Mind
Spell(12042, { duration = 15 }) -- Arcane Power
Spell(12051, { duration = 8, type = "BUFF" }) -- Evocation




lib:SetDataVersion(Type, Version)



local lib = LibStub("LibClassicDurations", true)
if not lib then return end

local Type, Version = "DRTable", 7
if lib:GetDataVersion(Type) >= Version then return end

local FEAR = "FEAR"
local SILENCE = "SILENCE"
local INCAP = "INCAP"
local STUN = "STUN"
local HORROR = "HORROR"
local ROOT = "ROOT"
-- local OPENER_STUN = "OPENER_STUN"
local RANDOM_STUN = "RANDOM_STUN"
local RANDOM_ROOT = "RANDOM_ROOT"
local FROST_SHOCK = "FROST_SHOCK"
local KIDNEY_SHOT = "KIDNEY_SHOT"

lib.DR_TypesPVE = {
    [KIDNEY_SHOT] = true,
    [STUN] = true,
}

lib.DR_CategoryBySpellID = {
    -- Silences weren't on DR until 3.0.8
    -- Are random stuns even diminished at all among themselves?
    -- Random roots?

    [835] = STUN, -- Tidal Charm
    [20549] = STUN, -- War Stomp
    [16566] = ROOT, -- Net-o-Matic
    [1090] = INCAP, -- Magic Dust
    [13327] = INCAP, -- Goblin Rocket Helm, Reckless Charge
    [5134] = FEAR, -- Flash Bomb

    [5782] = FEAR, -- Fear 3 ranks
    [6213] = FEAR,
    [6215] = FEAR,
    [5484] = FEAR, -- Howl of Terror 2 ranks
    [17928] = FEAR,
    [6358] = FEAR, -- Seduction

    -- [24259] = SILENCE, -- Spell Lock

    -- Coil wasn't on DR in classic
    -- [6789]    = HORROR, -- Death Coil 3 ranks
    -- [17925]   = HORROR,
    -- [17926]   = HORROR,
    [22703] = STUN, -- Infernal Summon Stun


    [20066] = INCAP, -- Repentance

    [853] = STUN, -- Hammer of Justice 4 ranks
    [5588] = STUN,
    [5589] = STUN,
    [10308] = STUN,

    [20170] = RANDOM_STUN, -- Seal of Justice Stun



    [3355] = INCAP, -- Freezing Trap Effect 3 ranks
    [14308] = INCAP,
    [14309] = INCAP,

    [19386] = INCAP, -- Wyvern Sting 3 ranks
    [24132] = INCAP,
    [24133] = INCAP,

    [19503] = INCAP, -- Scatter Shot
    -- [19229] = RANDOM_ROOT, -- Improved Wing Clip Root

    [19306] = ROOT, -- Counterattack

    [19410] = RANDOM_STUN, -- Conc stun
    [24394] = STUN, -- Intimidation


    [2637] = INCAP, -- Hibernate 3 ranks
    [18657] = INCAP,
    [18658] = INCAP,

    [5211] = STUN, -- Bash 3 ranks
    [6798] = STUN,
    [8983] = STUN,

    [339] = ROOT, -- Entangling Roots 6 ranks
    [1062] = ROOT,
    [5195] = ROOT,
    [5196] = ROOT,
    [9852] = ROOT,
    [9853] = ROOT,
    [16922] = RANDOM_STUN, -- Improved Starfire

    [9005] = STUN, -- Pounce 3 ranks
    [9823] = STUN,
    [9827] = STUN,


    -- [18469] = SILENCE, -- Silence (Improved Counterspell)

    [118] = INCAP, -- Polymorph 7 variants
    [12824] = INCAP,
    [12825] = INCAP,
    [12826] = INCAP,
    [28270] = INCAP,
    [28271] = INCAP,
    [28272] = INCAP,

    -- Frostbite wasn't on DR until 2.1.0
    -- [12494] = RANDOM_ROOT, -- Frostbite
    [12355] = RANDOM_STUN, -- Impact

    [122] = ROOT, -- Frost Nova 4 rank
    [865] = ROOT,
    [6131] = ROOT,
    [10230] = ROOT,

    [8056] = FROST_SHOCK, -- Frost Shock 4 ranks
    [8058] = FROST_SHOCK,
    [10472] = FROST_SHOCK,
    [10473] = FROST_SHOCK,


    -- [15487] = SILENCE, -- Silence (Priest)
    [15269] = RANDOM_STUN, -- Blackout

    -- MIND CONTROL ???
    -- No Undeads for Shackle in classic

    [8122] = FEAR, -- Psychic Scream
    [8124] = FEAR,
    [10888] = FEAR,
    [10890] = FEAR,


    -- [18425] = SILENCE, -- Imp Kick
    [1833] = STUN, -- Cheap Shot
    -- Blind wasn't on Fear until some time in 3.0, and before that it was with Cyclone,
    -- and in classic probably with itself
    -- [2094] = FEAR, -- Blind

    [2070] = INCAP, -- Sap 3 ranks
    [6770] = INCAP,
    [11297] = INCAP,

    [1776] = INCAP, -- Gouge 5 ranks
    [1777] = INCAP,
    [8629] = INCAP,
    [11285] = INCAP,
    [11286] = INCAP,

    [408] = KIDNEY_SHOT, -- Kidney Shot 2 ranks
    [8643] = KIDNEY_SHOT,

    [5530] = RANDOM_STUN, -- Mace Spec Stun, shared by both Rogue and Warrior


    -- [18498] = SILENCE, -- Imp Shield Bash Silence
    -- [23694] = RANDOM_ROOT, -- Improved Hamstring Root

    -- Disarm wasn't on DR until 2.3.0
    -- [676] = "DISARM", -- Disarm

    [12809] = STUN, -- Concussion Blow
    [12798] = RANDOM_STUN, -- Improved Revenge
    [5246] = FEAR, -- Intimidating Shout
    [7922] = STUN, -- Charge

    [20253] = STUN, -- Intercept Stun 3 ranks
    [20614] = STUN,
    [20615] = STUN,
}

lib:SetDataVersion(Type, Version)


local lib = LibStub and LibStub("LibClassicDurations", true)
if not lib then return end

local Type, Version = "NPCSpellTable", 2
if lib:GetDataVersion(Type) >= Version then return end

lib.npc_spells = {
    [11]=30,[12]=10,[13]=30,[16]=15,[17]=30,[22]=10,[25]=5,[43]=30,[47]=10,[56]=3,
    [65]=30,[66]=120,[67]=10,[89]=20,[91]=30,[96]=10,[99]=30,[101]=3,[111]=10,
    [112]=10,[113]=15,[116]=5,[118]=20,[120]=8,[122]=8,[126]=45,[128]=60,[130]=30,
    [131]=600,[132]=600,[133]=4,[134]=60,[136]=5,[139]=15,[143]=6,[145]=6,[168]=1800,
    [172]=12,[184]=60,[205]=6,[228]=10,[246]=10,[302]=30,[324]=600,[325]=600,
    [339]=12,[348]=15,[355]=3,[379]=60,[409]=60,[410]=60,[411]=60,[430]=18,[431]=21,
    [432]=24,[433]=18,[434]=21,[435]=24,[450]=5,[453]=15,[454]=10,[457]=30,[467]=600,
    [474]=30,[498]=6,[507]=30,[509]=30,[512]=20,[543]=30,[546]=600,[550]=30,[552]=20,
    [553]=30,[568]=8,[586]=10,[588]=600,[589]=18,[592]=30,[594]=18,[595]=30,[600]=30,
    [602]=600,[603]=60,[604]=600,[605]=60,[606]=30,[642]=10,[673]=3600,[676]=10,
    [687]=1800,[689]=5,[692]=10,[694]=6,[696]=1800,[699]=5,[700]=20,[702]=120,
    [703]=18,[704]=120,[706]=1800,[707]=15,[709]=5,[710]=20,[720]=8,[731]=8,[742]=30,
    [744]=30,[745]=10,[746]=6,[755]=10,[770]=40,[772]=9,[774]=12,[775]=8,[776]=5,
    [778]=40,[782]=600,[785]=20,[800]=0.25,[802]=240,[804]=4,[806]=60,[822]=60,
    [829]=30,[830]=30,[833]=10,[834]=3600,[835]=3,[837]=6,[839]=30,[849]=60,[851]=10,
    [853]=3,[855]=30,[863]=60,[865]=8,[867]=30,[871]=10,[877]=30,[885]=120,[905]=600,
    [945]=600,[970]=18,[976]=600,[980]=24,[992]=18,[994]=30,[1002]=60,[1006]=600,
    [1008]=600,[1009]=5,[1010]=120,[1014]=24,[1020]=12,[1022]=6,[1038]=300,[1044]=10,
    [1056]=30,[1058]=12,[1062]=15,[1075]=600,[1079]=12,[1086]=1800,[1090]=30,
    [1094]=15,[1098]=300,[1108]=120,[1120]=15,[1121]=8,[1126]=1800,[1127]=27,
    [1129]=30,[1130]=120,[1131]=30,[1132]=30,[1133]=27,[1135]=30,[1137]=30,[1138]=60,
    [1139]=15,[1159]=6,[1160]=30,[1161]=6,[1179]=10,[1243]=1800,[1244]=1800,
    [1245]=1800,[1302]=45,[1430]=12,[1450]=1800,[1451]=1800,[1452]=1800,[1453]=1800,
    [1459]=1800,[1460]=1800,[1461]=1800,[1462]=30,[1463]=60,[1490]=300,[1513]=10,
    [1515]=20,[1528]=1,[1539]=20,[1604]=4,[1663]=30,[1664]=30,[1665]=30,[1706]=120,
    [1714]=30,[1715]=15,[1719]=15,[1731]=15,[1732]=15,[1735]=30,[1776]=4,[1777]=4,
    [1822]=9,[1823]=9,[1824]=9,[1833]=4,[1834]=180,[1849]=30,[1850]=15,[1864]=300,
    [1906]=8,[1943]=6,[1949]=15,[1953]=1,[1978]=15,[2070]=35,[2090]=12,[2091]=12,
    [2094]=10,[2096]=60,[2140]=15,[2313]=20,[2351]=30,[2353]=30,[2354]=30,[2361]=300,
    [2367]=3600,[2374]=3600,[2376]=3600,[2378]=3600,[2379]=15,[2380]=180,[2381]=600,
    [2425]=5,[2479]=30,[2537]=30,[2564]=5,[2565]=5,[2601]=30,[2602]=15,[2637]=20,
    [2639]=21,[2647]=5,[2651]=15,[2652]=600,[2691]=0.001,[2766]=30,[2767]=18,
    [2791]=1800,[2818]=12,[2819]=12,[2855]=120,[2871]=30,[2878]=10,[2880]=10,
    [2893]=8,[2908]=15,[2941]=15,[2943]=120,[2944]=24,[2947]=180,[2969]=15,
    [2970]=600,[2974]=10,[2983]=15,[3019]=15,[3023]=30,[3034]=8,[3043]=20,[3045]=15,
    [3105]=600,[3109]=10,[3111]=5,[3120]=5,[3130]=6,[3132]=12,[3133]=30,[3136]=10,
    [3140]=8,[3143]=3,[3145]=5,[3146]=30,[3147]=12,[3148]=20,[3149]=15,[3150]=600,
    [3151]=6,[3157]=3600,[3158]=3600,[3159]=3600,[3160]=3600,[3161]=3600,[3162]=3600,
    [3163]=3600,[3164]=3600,[3165]=3600,[3166]=3600,[3167]=3600,[3168]=3600,[3169]=6,
    [3219]=3600,[3220]=3600,[3221]=3600,[3222]=3600,[3223]=3600,[3229]=5,[3232]=60,
    [3237]=240,[3238]=8,[3242]=2,[3247]=15,[3248]=6,[3252]=12,[3256]=240,[3258]=4,
    [3260]=8,[3261]=20,[3263]=5,[3264]=15,[3267]=7,[3268]=7,[3269]=8,[3271]=2,
    [3288]=10,[3329]=60,[3332]=30,[3335]=300,[3355]=10,[3356]=45,[3358]=40,
    [3369]=120,[3385]=4,[3387]=120,[3388]=45,[3389]=6,[3396]=30,[3409]=12,[3416]=10,
    [3419]=6,[3424]=120,[3427]=300,[3429]=600,[3436]=300,[3439]=300,[3442]=15,
    [3443]=15,[3446]=6,[3485]=15,[3490]=5,[3510]=3,[3514]=3,[3542]=30,[3547]=8,
    [3551]=2,[3574]=8,[3583]=120,[3584]=120,[3586]=180,[3589]=8,[3593]=3600,[3600]=5,
    [3602]=30,[3603]=15,[3604]=8,[3609]=8,[3618]=300,[3627]=12,[3635]=6,[3636]=15,
    [3639]=6,[3648]=45,[3650]=15,[3651]=10,[3661]=5,[3662]=5,[3671]=180,[3672]=180,
    [3673]=180,[3674]=30,[3680]=15,[3698]=10,[3699]=10,[3700]=10,[3719]=30,[3742]=15,
    [3747]=30,[3815]=45,[3826]=3,[4057]=60,[4058]=3,[4060]=12,[4063]=30,[4064]=1,
    [4065]=1,[4066]=2,[4067]=2,[4068]=3,[4069]=3,[4077]=60,[4079]=10,[4083]=30,
    [4092]=10,[4101]=6,[4102]=15,[4104]=15,[4105]=15,[4107]=10,[4108]=10,[4109]=12,
    [4111]=12,[4134]=10,[4135]=10,[4137]=10,[4139]=10,[4146]=15,[4147]=30,[4148]=300,
    [4149]=10,[4150]=12,[4153]=30,[4154]=8,[4159]=5,[4166]=3,[4167]=8,[4168]=10,
    [4169]=12,[4238]=120,[4240]=8,[4242]=15,[4243]=3,[4244]=8,[4246]=15,[4282]=10,
    [4285]=8,[4286]=15,[4316]=30,[4318]=1800,[4320]=12,[4321]=5,[4504]=30,[4505]=30,
    [4507]=5,[4514]=12,[4524]=3,[4538]=12,[4539]=10,[4805]=15,[4932]=20,[4940]=30,
    [4941]=90,[4948]=15,[4952]=5,[4955]=12,[4962]=6,[4970]=10,[4974]=120,[4979]=10,
    [4980]=10,[5003]=90,[5004]=18,[5005]=21,[5006]=24,[5007]=27,[5020]=300,
    [5021]=300,[5024]=10,[5101]=30,[5105]=60,[5106]=15,[5115]=6,[5116]=4,[5119]=180,
    [5120]=60,[5121]=60,[5122]=60,[5123]=60,[5124]=60,[5134]=10,[5137]=60,[5138]=5,
    [5143]=3,[5144]=4,[5145]=5,[5159]=20,[5164]=2,[5165]=8,[5171]=6,[5195]=18,
    [5196]=21,[5202]=1800,[5208]=60,[5209]=6,[5211]=2,[5213]=15,[5217]=6,[5219]=8,
    [5220]=15,[5229]=10,[5232]=1800,[5234]=1800,[5242]=120,[5246]=8,[5250]=30,
    [5254]=30,[5256]=20,[5257]=300,[5259]=15,[5260]=15,[5262]=10,[5271]=20,[5276]=15,
    [5277]=15,[5280]=45,[5302]=5,[5306]=120,[5320]=1800,[5321]=1800,[5322]=1800,
    [5323]=1800,[5324]=1800,[5325]=1800,[5337]=8,[5363]=20,[5365]=20,[5366]=20,
    [5367]=20,[5376]=8,[5384]=360,[5402]=300,[5403]=10,[5413]=120,[5416]=45,[5422]=8,
    [5424]=4,[5426]=6,[5480]=15,[5484]=10,[5508]=15,[5514]=12,[5515]=8,[5530]=3,
    [5543]=2,[5567]=5,[5570]=12,[5573]=8,[5579]=0.1,[5588]=4,[5589]=5,[5597]=10,
    [5598]=10,[5599]=8,[5627]=15,[5628]=6,[5648]=3,[5649]=5,[5665]=600,[5697]=600,
    [5703]=4,[5708]=2,[5726]=5,[5727]=8,[5759]=240,[5760]=10,[5781]=30,[5782]=10,
    [5810]=6,[5858]=300,[5862]=1800,[5884]=12,[5909]=600,[5915]=60,[5917]=10,
    [5918]=5,[5934]=6,[5951]=2,[5990]=8,[6016]=20,[6065]=30,[6066]=30,[6074]=15,
    [6075]=15,[6076]=15,[6077]=15,[6078]=15,[6114]=300,[6115]=60,[6117]=1800,
    [6131]=8,[6136]=5,[6143]=30,[6146]=15,[6150]=12,[6190]=30,[6192]=120,[6196]=60,
    [6197]=60,[6205]=120,[6213]=15,[6215]=20,[6217]=24,[6222]=15,[6223]=18,[6226]=5,
    [6229]=30,[6238]=20,[6240]=0.001,[6253]=2,[6257]=30,[6264]=8,[6266]=3,[6268]=3,
    [6272]=60,[6277]=120,[6278]=60,[6298]=300,[6304]=3,[6306]=30,[6343]=10,
    [6346]=600,[6355]=10,[6358]=15,[6405]=180,[6409]=5,[6410]=21,[6411]=21,[6422]=3,
    [6431]=30,[6432]=10,[6434]=10,[6435]=3,[6466]=3,[6467]=180,[6468]=6,[6495]=300,
    [6507]=60,[6512]=600,[6513]=60,[6524]=2,[6528]=0.001,[6530]=10,[6531]=60,
    [6533]=10,[6538]=60,[6546]=12,[6547]=15,[6548]=18,[6576]=5,[6580]=3,[6581]=10,
    [6584]=10,[6600]=5,[6601]=5,[6602]=5,[6605]=4,[6607]=2,[6608]=5,[6614]=30,
    [6615]=30,[6634]=8,[6664]=2,[6669]=2,[6673]=120,[6685]=15,[6711]=360,[6713]=6,
    [6714]=4,[6716]=3,[6724]=10,[6726]=6,[6727]=30,[6728]=10,[6730]=2,[6741]=20,
    [6742]=30,[6749]=5,[6751]=12,[6754]=3,[6756]=1800,[6758]=120,[6767]=600,
    [6770]=25,[6772]=3,[6774]=6,[6788]=15,[6789]=3,[6793]=6,[6795]=3,[6798]=3,
    [6814]=45,[6816]=4,[6817]=4,[6818]=4,[6819]=4,[6844]=10,[6864]=8,[6866]=180,
    [6869]=2,[6870]=180,[6873]=120,[6894]=10,[6902]=120,[6903]=10,[6907]=120,
    [6909]=180,[6917]=10,[6921]=6,[6922]=300,[6927]=5,[6940]=30,[6942]=6,[6945]=5,
    [6946]=180,[6950]=60,[6951]=300,[6955]=300,[6957]=180,[6960]=180,[6965]=4,
    [6969]=1,[6974]=1,[6982]=4,[6984]=10,[6985]=10,[7001]=10,[7020]=15,[7022]=300,
    [7023]=1,[7035]=5,[7036]=5,[7038]=60,[7039]=60,[7040]=60,[7041]=60,[7042]=60,
    [7043]=60,[7044]=60,[7045]=60,[7046]=60,[7047]=60,[7048]=60,[7049]=60,[7050]=60,
    [7051]=60,[7053]=60,[7054]=300,[7057]=300,[7068]=15,[7072]=60,[7074]=5,
    [7081]=300,[7082]=3,[7090]=300,[7093]=4,[7098]=180,[7102]=240,[7103]=240,
    [7104]=10,[7120]=1800,[7121]=10,[7124]=300,[7125]=120,[7127]=60,[7128]=600,
    [7136]=10,[7137]=6,[7139]=3,[7140]=5,[7144]=15,[7164]=180,[7178]=1800,[7184]=300,
    [7211]=10,[7230]=3600,[7231]=3600,[7232]=3600,[7233]=3600,[7234]=3600,
    [7235]=3600,[7236]=3600,[7237]=3600,[7238]=3600,[7239]=3600,[7240]=3600,
    [7241]=3600,[7242]=3600,[7243]=3600,[7244]=3600,[7245]=3600,[7246]=3600,
    [7247]=3600,[7248]=3600,[7249]=3600,[7250]=3600,[7251]=3600,[7252]=3600,
    [7253]=3600,[7254]=3600,[7267]=3,[7272]=12,[7279]=120,[7288]=20,[7289]=120,
    [7290]=10,[7291]=30,[7295]=10,[7300]=1800,[7301]=1800,[7302]=1800,[7320]=1800,
    [7321]=5,[7322]=7,[7336]=1,[7337]=1.5,[7338]=2,[7339]=2.5,[7353]=60,[7357]=15,
    [7358]=60,[7365]=30,[7366]=240,[7367]=180,[7371]=4,[7372]=15,[7373]=15,[7383]=30,
    [7386]=30,[7389]=15,[7396]=30,[7399]=4,[7400]=6,[7402]=6,[7405]=30,[7481]=300,
    [7483]=300,[7484]=300,[7586]=10,[7587]=10,[7621]=10,[7638]=3,[7645]=10,
    [7646]=120,[7648]=18,[7651]=5,[7656]=30,[7657]=30,[7658]=120,[7659]=120,
    [7670]=2.5,[7713]=6,[7737]=15,[7739]=10,[7744]=5,[7750]=12,[7761]=4,[7764]=1800,
    [7803]=5,[7806]=180,[7807]=180,[7808]=180,[7812]=30,[7840]=20,[7844]=1800,
    [7870]=300,[7901]=300,[7914]=9,[7922]=1,[7926]=8,[7927]=8,[7947]=60,[7948]=20,
    [7950]=3,[7961]=5,[7964]=4,[7965]=300,[7967]=15,[7992]=25,[7997]=300,[7998]=10,
    [8014]=1200,[8016]=1200,[8034]=8,[8037]=8,[8040]=15,[8041]=10,[8050]=12,
    [8052]=12,[8053]=12,[8056]=8,[8058]=8,[8064]=30,[8066]=120,[8067]=120,
    [8068]=1800,[8070]=12,[8078]=10,[8091]=1800,[8094]=1800,[8095]=1800,[8096]=1800,
    [8097]=1800,[8098]=1800,[8099]=1800,[8100]=1800,[8101]=1800,[8112]=1800,
    [8113]=1800,[8114]=1800,[8115]=1800,[8116]=1800,[8117]=1800,[8118]=1800,
    [8119]=1800,[8120]=1800,[8122]=8,[8124]=8,[8134]=600,[8137]=1800,[8138]=2700,
    [8139]=1800,[8140]=15,[8142]=10,[8147]=10,[8150]=2.5,[8151]=2.5,[8191]=15,
    [8192]=15,[8198]=14,[8202]=1200,[8204]=18,[8205]=22,[8208]=10,[8212]=120,
    [8215]=120,[8219]=3600,[8220]=3600,[8221]=3600,[8222]=3600,[8223]=10,[8224]=600,
    [8225]=5,[8226]=300,[8233]=1.5,[8236]=1.5,[8242]=2,[8245]=300,[8255]=10,
    [8256]=180,[8257]=30,[8260]=4,[8267]=600,[8269]=120,[8272]=600,[8275]=75,
    [8277]=120,[8281]=10,[8282]=600,[8285]=2.5,[8288]=15,[8289]=15,[8312]=10,
    [8313]=20,[8314]=3600,[8316]=180,[8317]=180,[8338]=2,[8345]=60,[8346]=20,
    [8348]=12,[8359]=300,[8361]=2,[8362]=20,[8363]=75,[8365]=60,[8377]=4,[8379]=10,
    [8380]=30,[8382]=45,[8383]=3600,[8384]=3600,[8385]=3600,[8391]=3,[8392]=10,
    [8398]=8,[8399]=10,[8400]=8,[8401]=8,[8402]=8,[8406]=7,[8407]=8,[8408]=8,
    [8416]=5,[8417]=5,[8450]=600,[8451]=600,[8455]=600,[8457]=30,[8458]=30,[8461]=30,
    [8462]=30,[8492]=8,[8494]=60,[8495]=60,[8510]=2,[8511]=2,[8516]=1.5,[8552]=120,
    [8553]=600,[8554]=2,[8599]=120,[8600]=180,[8602]=10,[8609]=3,[8611]=6,[8629]=4,
    [8631]=18,[8632]=18,[8633]=18,[8639]=6,[8640]=6,[8643]=1,[8646]=2,[8647]=30,
    [8649]=30,[8650]=30,[8672]=30,[8692]=12,[8696]=15,[8699]=20,[8715]=3,[8716]=12,
    [8733]=3600,[8788]=600,[8806]=60,[8817]=3,[8818]=18,[8822]=30,[8823]=30,
    [8824]=30,[8892]=20,[8893]=2,[8898]=1200,[8899]=1200,[8900]=1200,[8901]=20,
    [8902]=20,[8907]=1800,[8909]=600,[8910]=12,[8914]=600,[8921]=9,[8924]=12,
    [8925]=12,[8926]=12,[8927]=12,[8928]=12,[8929]=12,[8936]=21,[8938]=21,[8939]=21,
    [8940]=21,[8941]=21,[8955]=15,[8983]=4,[8988]=10,[8989]=10,[8994]=15,[9005]=2,
    [9007]=18,[9032]=30,[9034]=21,[9035]=120,[9080]=10,[9095]=600,[9128]=120,
    [9159]=10,[9175]=15,[9176]=60,[9177]=24,[9178]=120,[9179]=3,[9192]=120,
    [9199]=300,[9220]=120,[9234]=1800,[9256]=10,[9275]=21,[9373]=12,[9438]=8,
    [9458]=3,[9459]=60,[9462]=8,[9482]=30,[9484]=30,[9485]=40,[9490]=30,[9492]=12,
    [9493]=12,[9552]=9,[9574]=45,[9576]=10,[9578]=10,[9579]=10,[9587]=180,[9592]=10,
    [9612]=15,[9614]=60,[9616]=20,[9632]=9,[9657]=10,[9658]=45,[9672]=4,[9712]=5,
    [9733]=4,[9735]=1200,[9736]=30,[9738]=120,[9741]=6,[9747]=30,[9749]=40,[9750]=21,
    [9752]=12,[9756]=600,[9773]=8,[9774]=5,[9775]=60,[9779]=8,[9791]=20,[9796]=60,
    [9800]=60,[9806]=20,[9810]=10,[9821]=15,[9823]=2,[9824]=18,[9826]=18,[9827]=2,
    [9833]=12,[9834]=12,[9835]=12,[9839]=12,[9840]=12,[9841]=12,[9845]=6,[9846]=6,
    [9852]=24,[9853]=27,[9856]=21,[9857]=21,[9858]=21,[9884]=1800,[9885]=1800,
    [9894]=12,[9896]=12,[9898]=30,[9901]=15,[9904]=9,[9906]=5,[9907]=40,[9910]=600,
    [9915]=10,[9930]=30,[9991]=604800,[9992]=10,[10017]=10,[10018]=10,[10060]=15,
    [10072]=3600,[10093]=1,[10096]=120,[10134]=7,[10136]=1200,[10148]=8,[10149]=8,
    [10150]=8,[10151]=8,[10156]=1800,[10157]=1800,[10159]=8,[10160]=8,[10161]=8,
    [10169]=600,[10170]=600,[10173]=600,[10174]=600,[10177]=30,[10179]=9,[10180]=9,
    [10181]=9,[10191]=60,[10192]=60,[10193]=60,[10211]=5,[10212]=5,[10219]=1800,
    [10220]=1800,[10223]=30,[10225]=30,[10228]=120,[10230]=8,[10236]=180,[10238]=180,
    [10240]=180,[10241]=180,[10242]=180,[10250]=30,[10251]=180,[10252]=5,[10253]=10,
    [10256]=30,[10257]=30,[10259]=2,[10260]=20,[10263]=90,[10266]=2,[10268]=180,
    [10278]=10,[10308]=6,[10326]=20,[10336]=30,[10337]=30,[10342]=15,[10345]=20,
    [10348]=20,[10351]=5,[10368]=15,[10370]=60,[10371]=10,[10431]=600,[10432]=600,
    [10447]=12,[10448]=12,[10452]=20,[10455]=0.001,[10458]=8,[10472]=8,[10473]=8,
    [10484]=1.5,[10576]=6,[10578]=8,[10608]=1.5,[10610]=1.5,[10618]=120,[10651]=120,
    [10653]=120,[10654]=10,[10667]=3600,[10668]=3600,[10669]=3600,[10670]=3600,
    [10671]=3600,[10672]=3600,[10690]=3600,[10691]=3600,[10692]=3600,[10693]=3600,
    [10730]=10,[10732]=10,[10734]=3,[10737]=10,[10767]=1800,[10794]=30,[10797]=6,
    [10805]=3,[10831]=5,[10834]=3,[10835]=3,[10836]=3,[10838]=8,[10839]=8,
    [10849]=300,[10851]=15,[10852]=10,[10855]=10,[10856]=8,[10857]=35,[10888]=8,
    [10890]=8,[10892]=18,[10893]=18,[10894]=18,[10898]=30,[10899]=30,[10900]=30,
    [10901]=30,[10909]=60,[10911]=60,[10912]=60,[10927]=15,[10928]=15,[10929]=15,
    [10937]=1800,[10938]=1800,[10941]=10,[10942]=10,[10951]=600,[10952]=600,
    [10953]=15,[10955]=50,[10957]=600,[10958]=600,[10967]=20,[10968]=30,[10987]=5,
    [11013]=120,[11014]=15,[11020]=8,[11089]=30,[11113]=6,[11131]=10,[11196]=60,
    [11197]=30,[11198]=30,[11201]=12,[11206]=600,[11264]=10,[11273]=6,[11274]=6,
    [11275]=6,[11285]=4,[11286]=4,[11289]=18,[11290]=18,[11297]=45,[11305]=15,
    [11319]=1800,[11327]=10,[11328]=3600,[11329]=10,[11330]=3600,[11331]=3600,
    [11332]=3600,[11333]=3600,[11334]=3600,[11348]=3600,[11349]=3600,[11350]=15,
    [11353]=12,[11354]=12,[11359]=30,[11363]=180,[11364]=180,[11366]=12,[11371]=1800,
    [11374]=180,[11389]=3600,[11390]=1800,[11391]=30,[11392]=18,[11393]=3600,
    [11394]=3600,[11395]=3600,[11396]=3600,[11397]=300,[11398]=14,[11403]=120,
    [11404]=3600,[11405]=3600,[11406]=300,[11407]=3600,[11426]=60,[11428]=2,
    [11430]=2,[11436]=10,[11442]=180,[11443]=15,[11444]=20,[11445]=60,[11446]=300,
    [11469]=12,[11470]=12,[11471]=12,[11474]=1800,[11481]=11,[11534]=20,[11538]=4,
    [11539]=12,[11549]=120,[11550]=120,[11551]=120,[11554]=30,[11555]=30,[11556]=30,
    [11572]=21,[11573]=21,[11574]=21,[11580]=26,[11581]=30,[11596]=30,[11597]=30,
    [11639]=18,[11640]=15,[11641]=10,[11647]=30,[11650]=3,[11657]=20,[11658]=15,
    [11665]=15,[11667]=15,[11668]=15,[11671]=18,[11672]=18,[11675]=15,[11683]=15,
    [11684]=15,[11693]=10,[11694]=10,[11695]=10,[11699]=5,[11700]=5,[11703]=5,
    [11704]=5,[11707]=120,[11708]=120,[11711]=24,[11712]=24,[11713]=24,[11717]=120,
    [11719]=30,[11721]=300,[11722]=300,[11725]=300,[11726]=300,[11733]=1800,
    [11734]=1800,[11735]=1800,[11739]=30,[11740]=30,[11743]=600,[11770]=180,
    [11771]=180,[11790]=15,[11791]=30,[11820]=10,[11826]=3,[11831]=8,[11835]=30,
    [11836]=10,[11841]=600,[11876]=5,[11877]=5,[11879]=5,[11892]=120,[11918]=15,
    [11920]=20,[11922]=15,[11958]=10,[11960]=60,[11962]=21,[11963]=120,[11971]=30,
    [11974]=30,[11977]=15,[11980]=120,[11983]=10,[12001]=240,[12020]=60,[12021]=10,
    [12023]=5,[12024]=5,[12040]=30,[12042]=15,[12051]=8,[12054]=15,[12096]=8,
    [12097]=20,[12098]=20,[12134]=12,[12160]=12,[12166]=5,[12169]=5,[12174]=1800,
    [12175]=1800,[12176]=1800,[12177]=1800,[12178]=1800,[12179]=1800,[12241]=4,
    [12242]=3,[12245]=300,[12248]=10,[12251]=30,[12252]=10,[12255]=900,[12257]=5,
    [12279]=600,[12280]=60,[12292]=20,[12294]=10,[12323]=6,[12328]=30,[12355]=2,
    [12421]=2,[12438]=10,[12461]=2,[12479]=10,[12480]=15,[12483]=15,[12484]=1.5,
    [12485]=1.5,[12486]=1.5,[12493]=120,[12494]=5,[12505]=12,[12509]=3,[12520]=4,
    [12521]=3,[12522]=12,[12523]=12,[12524]=12,[12525]=12,[12526]=12,[12528]=10,
    [12530]=60,[12531]=8,[12533]=45,[12536]=15,[12540]=4,[12541]=600,[12542]=4,
    [12543]=3,[12544]=1800,[12545]=20,[12548]=8,[12550]=600,[12551]=10,[12557]=8,
    [12561]=60,[12562]=5,[12579]=15,[12608]=600,[12611]=8,[12613]=6,[12654]=4,
    [12655]=4,[12674]=8,[12675]=4,[12685]=10,[12686]=15,[12705]=6,[12721]=12,
    [12731]=8,[12733]=30,[12734]=3,[12737]=4,[12738]=10,[12741]=120,[12742]=21,
    [12747]=10,[12748]=5,[12766]=45,[12795]=120,[12798]=3,[12809]=5,[12824]=30,
    [12825]=40,[12826]=50,[12843]=60,[12844]=0.001,[12845]=30,[12880]=12,[12884]=45,
    [12888]=6,[12889]=15,[12890]=15,[12891]=45,[12941]=15,[12942]=10,[12943]=10,
    [12946]=10,[12966]=15,[12967]=15,[12968]=15,[12969]=15,[12970]=15,[12976]=20,
    [13003]=20,[13004]=30,[13005]=4,[13007]=8,[13010]=30,[13013]=20,[13018]=6,
    [13019]=6,[13020]=6,[13021]=6,[13031]=60,[13032]=60,[13033]=60,[13099]=10,
    [13119]=20,[13138]=20,[13141]=20,[13158]=5,[13168]=10,[13181]=20,[13183]=10,
    [13218]=15,[13222]=15,[13223]=15,[13224]=15,[13234]=600,[13235]=20,[13237]=3,
    [13238]=3,[13278]=4,[13298]=30,[13318]=30,[13322]=2,[13323]=20,[13326]=1800,
    [13327]=30,[13338]=15,[13360]=2,[13424]=30,[13438]=6,[13439]=5,[13443]=15,
    [13444]=30,[13445]=15,[13459]=30,[13466]=7,[13488]=50,[13490]=30,[13493]=4,
    [13494]=30,[13496]=10,[13518]=15,[13524]=60,[13526]=30,[13528]=30,[13530]=3,
    [13532]=10,[13533]=10,[13534]=10,[13542]=5,[13543]=5,[13544]=5,[13549]=15,
    [13550]=15,[13551]=15,[13552]=15,[13553]=15,[13554]=15,[13555]=15,[13566]=8,
    [13578]=8,[13579]=4,[13582]=120,[13583]=120,[13585]=600,[13608]=10,[13619]=180,
    [13692]=15,[13704]=6,[13729]=12,[13730]=30,[13736]=2,[13737]=5,[13738]=15,
    [13744]=15,[13747]=10,[13750]=15,[13752]=30,[13787]=1800,[13797]=15,[13808]=3,
    [13835]=3,[13847]=15,[13864]=1800,[13874]=8,[13877]=15,[13880]=30,[13884]=180,
    [13896]=15,[13902]=5,[13903]=30,[13907]=5,[13910]=0.001,[13951]=20,[14030]=10,
    [14032]=18,[14087]=30,[14100]=5,[14102]=2,[14110]=30,[14118]=30,[14120]=30,
    [14130]=600,[14143]=20,[14147]=30,[14149]=20,[14180]=4,[14183]=10,[14201]=12,
    [14202]=12,[14203]=12,[14204]=12,[14207]=5,[14251]=6,[14253]=8,[14267]=10,
    [14268]=10,[14275]=20,[14276]=20,[14277]=20,[14278]=7,[14279]=8,[14280]=8,
    [14296]=30,[14298]=15,[14299]=15,[14300]=15,[14301]=15,[14308]=15,[14309]=20,
    [14323]=120,[14324]=120,[14325]=120,[14326]=15,[14327]=20,[14331]=15,[14514]=1,
    [14515]=15,[14517]=30,[14518]=30,[14530]=10,[14532]=300,[14533]=300,[14534]=300,
    [14535]=300,[14538]=300,[14539]=300,[14621]=20,[14743]=6,[14744]=180,
    [14752]=1800,[14792]=30,[14795]=12,[14797]=21,[14818]=1800,[14819]=1800,
    [14821]=15,[14822]=15,[14823]=15,[14868]=30,[14870]=3,[14871]=1,[14872]=15,
    [14874]=10,[14875]=30,[14888]=1800,[14890]=0.001,[14893]=15,[14897]=25,[14902]=4,
    [14903]=2,[14907]=8,[14914]=10,[15039]=12,[15041]=60,[15042]=600,[15043]=4,
    [15044]=60,[15056]=7,[15061]=5,[15062]=10,[15063]=8,[15087]=15,[15089]=8,
    [15091]=6,[15096]=12,[15123]=3600,[15128]=120,[15229]=15,[15231]=1800,
    [15233]=1800,[15235]=120,[15244]=8,[15258]=15,[15261]=10,[15262]=10,[15263]=10,
    [15264]=10,[15265]=10,[15266]=10,[15267]=10,[15269]=3,[15271]=15,[15277]=30,
    [15279]=600,[15280]=20,[15283]=8,[15286]=60,[15288]=1800,[15346]=30,[15357]=15,
    [15359]=15,[15366]=3600,[15398]=8,[15407]=3,[15470]=15,[15471]=8,[15474]=10,
    [15475]=120,[15487]=5,[15494]=10,[15497]=4,[15499]=8,[15502]=30,[15505]=21,
    [15507]=600,[15529]=10,[15530]=4,[15531]=8,[15532]=8,[15534]=20,[15535]=10,
    [15548]=10,[15570]=21,[15571]=4,[15572]=30,[15583]=10,[15588]=10,[15593]=8,
    [15595]=10,[15602]=30,[15604]=10,[15609]=10,[15616]=12,[15618]=2,[15621]=2,
    [15636]=10,[15642]=5,[15646]=10,[15652]=2,[15654]=18,[15655]=2,[15656]=15,
    [15660]=10,[15661]=21,[15662]=6,[15664]=10,[15708]=5,[15716]=120,[15727]=30,
    [15728]=240,[15730]=180,[15732]=21,[15735]=5,[15742]=3,[15744]=6,[15752]=10,
    [15753]=2,[15784]=60,[15790]=5,[15798]=12,[15802]=120,[15822]=12,[15848]=1800,
    [15850]=5,[15852]=600,[15859]=5,[15860]=9,[15878]=3,[15970]=10,[15971]=30,
    [15976]=10,[15981]=12,[16001]=9,[16037]=2,[16045]=30,[16046]=6,[16048]=60,
    [16049]=604800,[16050]=10,[16051]=2,[16053]=60,[16071]=300,[16075]=2,[16094]=10,
    [16095]=15,[16096]=5,[16097]=10,[16098]=600,[16099]=10,[16104]=6,[16122]=4,
    [16128]=180,[16143]=600,[16145]=30,[16147]=21,[16168]=20,[16170]=30,[16172]=20,
    [16177]=15,[16186]=180,[16231]=120,[16236]=15,[16237]=15,[16244]=30,[16246]=15,
    [16247]=180,[16249]=4,[16257]=15,[16277]=15,[16278]=15,[16279]=15,[16280]=15,
    [16310]=3,[16321]=10,[16322]=20,[16323]=1800,[16325]=600,[16326]=600,
    [16327]=1800,[16329]=600,[16333]=120,[16336]=300,[16337]=300,[16340]=10,
    [16350]=10,[16352]=8,[16353]=8,[16359]=30,[16361]=1.5,[16366]=60,[16373]=30,
    [16391]=30,[16392]=30,[16393]=30,[16400]=15,[16401]=30,[16402]=3,[16403]=30,
    [16404]=10,[16406]=30,[16412]=6,[16413]=6,[16415]=8,[16420]=0.5,[16427]=30,
    [16429]=1800,[16430]=12,[16431]=60,[16432]=8,[16448]=1800,[16449]=1800,
    [16451]=10,[16452]=3,[16454]=30,[16458]=1800,[16460]=1800,[16461]=1800,
    [16469]=10,[16470]=10,[16488]=6,[16490]=6,[16491]=6,[16497]=5,[16498]=60,
    [16499]=1800,[16508]=8,[16509]=15,[16511]=15,[16528]=10,[16532]=600,[16536]=45,
    [16551]=3,[16552]=10,[16555]=300,[16557]=10,[16560]=15,[16561]=21,[16566]=30,
    [16567]=600,[16568]=3,[16569]=10,[16573]=45,[16587]=600,[16591]=600,[16593]=120,
    [16595]=600,[16597]=10,[16598]=20,[16599]=20,[16600]=5,[16601]=8,[16603]=25,
    [16608]=4,[16609]=3600,[16610]=600,[16612]=1800,[16617]=600,[16618]=300,
    [16621]=3,[16627]=9,[16628]=9,[16629]=30,[16637]=20,[16689]=45,[16707]=20,
    [16708]=20,[16709]=20,[16711]=300,[16712]=300,[16713]=60,[16714]=60,[16716]=5,
    [16717]=5,[16727]=5,[16739]=300,[16789]=15,[16790]=2,[16791]=60,[16798]=10,
    [16799]=4,[16803]=5,[16804]=12,[16805]=10,[16810]=45,[16811]=45,[16812]=45,
    [16813]=45,[16834]=6,[16835]=6,[16838]=5,[16843]=4,[16856]=5,[16857]=40,
    [16864]=600,[16866]=10,[16867]=12,[16869]=10,[16870]=15,[16871]=60,[16873]=1800,
    [16874]=600,[16875]=1800,[16876]=1800,[16877]=600,[16878]=1800,[16881]=600,
    [16882]=600,[16883]=1200,[16884]=3600,[16885]=3600,[16886]=15,[16887]=3600,
    [16888]=3600,[16889]=1800,[16890]=3600,[16891]=3600,[16892]=3600,[16893]=3600,
    [16894]=3600,[16895]=3600,[16898]=30,[16916]=30,[16922]=3,[16927]=5,[16928]=45,
    [16939]=20,[17008]=5,[17011]=5,[17013]=1800,[17014]=10,[17038]=1200,[17052]=300,
    [17057]=3,[17105]=12,[17134]=60,[17139]=30,[17140]=8,[17141]=8,[17142]=8,
    [17145]=6,[17146]=18,[17148]=30,[17150]=1800,[17151]=600,[17152]=10,[17153]=30,
    [17154]=30,[17158]=10,[17165]=3,[17168]=10,[17170]=12,[17172]=5,[17173]=5,
    [17174]=3,[17175]=3600,[17177]=8,[17179]=20,[17183]=15,[17189]=20,[17196]=30,
    [17197]=6,[17205]=1200,[17207]=2,[17213]=900,[17227]=120,[17230]=300,[17238]=5,
    [17243]=5,[17244]=120,[17246]=120,[17250]=120,[17252]=1800,[17272]=2,[17273]=12,
    [17274]=12,[17275]=300,[17276]=4,[17277]=6,[17281]=30,[17286]=4,[17292]=30,
    [17293]=8,[17307]=6,[17308]=2,[17311]=3,[17312]=3,[17313]=3,[17314]=3,[17315]=30,
    [17329]=45,[17330]=20,[17331]=10,[17333]=10,[17347]=15,[17348]=15,[17351]=10,
    [17352]=10,[17364]=12,[17368]=3,[17390]=40,[17391]=40,[17392]=40,[17398]=5,
    [17405]=15,[17407]=25,[17445]=20,[17446]=10,[17447]=10,[17473]=12,[17483]=6,
    [17484]=30,[17492]=5,[17494]=30,[17499]=30,[17500]=2,[17503]=4,[17504]=30,
    [17505]=60,[17506]=30,[17510]=3,[17511]=20,[17528]=20,[17535]=3600,[17537]=3600,
    [17538]=3600,[17539]=3600,[17540]=120,[17543]=3600,[17544]=3600,[17545]=3600,
    [17546]=3600,[17547]=5,[17548]=3600,[17549]=3600,[17620]=5,[17624]=60,
    [17626]=7200,[17627]=7200,[17628]=7200,[17629]=7200,[17633]=30,[17639]=12,
    [17651]=6,[17668]=1,[17680]=60,[17682]=5,[17686]=10,[17687]=15,[17691]=300,
    [17692]=5,[17697]=5,[17715]=15,[17716]=1.5,[17729]=60,[17730]=60,[17734]=3600,
    [17738]=14,[17740]=60,[17741]=60,[17743]=120,[17745]=10,[17767]=10,[17771]=30,
    [17772]=5,[17774]=8,[17794]=12,[17797]=12,[17798]=12,[17799]=12,[17800]=12,
    [17820]=15,[17831]=60,[17850]=10,[17851]=10,[17852]=10,[17853]=10,[17854]=10,
    [17862]=300,[17877]=5,[17883]=21,[17925]=3,[17926]=3,[17928]=15,[17937]=300,
    [17941]=10,[17961]=1800,[17963]=30,[18070]=30,[18075]=30,[18077]=15,[18078]=30,
    [18082]=6,[18088]=3,[18093]=3,[18097]=30,[18099]=10,[18100]=1800,[18101]=5,
    [18103]=2,[18105]=8,[18106]=30,[18108]=8,[18118]=5,[18124]=27,[18125]=600,
    [18137]=600,[18140]=30,[18141]=600,[18144]=2,[18149]=120,[18151]=120,[18159]=900,
    [18163]=1800,[18165]=8,[18172]=300,[18173]=20,[18191]=600,[18192]=600,
    [18193]=600,[18194]=600,[18197]=15,[18199]=6,[18200]=30,[18202]=30,[18203]=30,
    [18208]=25,[18209]=604800,[18210]=604800,[18222]=600,[18223]=12,[18229]=27,
    [18230]=27,[18231]=27,[18232]=27,[18233]=27,[18234]=27,[18265]=30,[18266]=15,
    [18267]=30,[18270]=90,[18278]=6,[18288]=30,[18289]=15,[18327]=10,[18328]=60,
    [18347]=600,[18364]=15,[18371]=10,[18376]=24,[18377]=300,[18381]=30,[18395]=2,
    [18396]=0.001,[18425]=2,[18431]=3,[18461]=1,[18469]=4,[18498]=3,[18499]=10,
    [18501]=5,[18502]=120,[18503]=10,[18520]=30,[18543]=21,[18545]=20,[18546]=6,
    [18557]=5,[18608]=8,[18610]=8,[18633]=30,[18647]=30,[18652]=15,[18654]=15,
    [18656]=3,[18657]=30,[18658]=40,[18671]=30,[18702]=60,[18708]=15,[18733]=5,
    [18747]=300,[18763]=15,[18765]=20,[18787]=30,[18789]=1800,[18790]=1800,
    [18791]=1800,[18792]=1800,[18796]=6,[18798]=5,[18802]=10,[18803]=4,[18807]=3,
    [18809]=12,[18810]=3600,[18811]=2,[18812]=2,[18820]=10,[18826]=10,[18828]=20,
    [18867]=5,[18868]=5,[18869]=5,[18870]=5,[18871]=5,[18874]=7,[18879]=30,
    [18880]=30,[18881]=30,[18942]=3600,[18946]=30,[18948]=300,[18949]=30,[18956]=30,
    [18957]=30,[18958]=45,[18968]=600,[18972]=20,[18977]=10,[19030]=300,[19128]=2,
    [19133]=8,[19134]=8,[19135]=15,[19136]=5,[19137]=20,[19185]=5,[19229]=5,
    [19231]=300,[19249]=120,[19251]=120,[19252]=120,[19253]=120,[19254]=120,
    [19261]=600,[19262]=600,[19263]=10,[19264]=600,[19265]=600,[19266]=600,
    [19271]=15,[19273]=15,[19274]=15,[19275]=15,[19276]=24,[19277]=24,[19278]=24,
    [19279]=24,[19280]=24,[19281]=120,[19282]=120,[19283]=120,[19284]=120,
    [19285]=120,[19289]=15,[19291]=15,[19292]=15,[19293]=15,[19296]=6,[19299]=6,
    [19302]=6,[19303]=6,[19304]=6,[19305]=6,[19306]=5,[19308]=600,[19309]=600,
    [19310]=600,[19311]=600,[19312]=600,[19364]=5,[19365]=900,[19366]=900,
    [19367]=900,[19369]=5,[19372]=900,[19386]=12,[19393]=16,[19397]=60,[19408]=8,
    [19410]=3,[19428]=8,[19438]=30,[19440]=30,[19441]=30,[19442]=30,[19443]=30,
    [19448]=30,[19450]=30,[19451]=8,[19463]=10,[19469]=15,[19478]=60,[19479]=10,
    [19482]=2,[19486]=20,[19496]=15,[19503]=4,[19514]=600,[19516]=1800,[19548]=20,
    [19574]=18,[19577]=15,[19597]=900,[19615]=8,[19631]=60,[19634]=15,[19635]=60,
    [19636]=6,[19638]=30,[19641]=6,[19643]=5,[19645]=10,[19652]=10,[19653]=10,
    [19654]=10,[19655]=60,[19656]=60,[19659]=300,[19660]=60,[19674]=20,[19675]=4,
    [19676]=900,[19677]=900,[19678]=900,[19679]=900,[19680]=900,[19681]=900,
    [19682]=900,[19683]=900,[19684]=900,[19685]=900,[19686]=900,[19687]=20,
    [19688]=20,[19689]=20,[19690]=900,[19692]=20,[19693]=20,[19694]=20,[19695]=8,
    [19696]=20,[19697]=20,[19699]=20,[19700]=20,[19702]=10,[19703]=300,[19705]=900,
    [19706]=900,[19708]=900,[19709]=900,[19710]=900,[19711]=900,[19713]=300,
    [19714]=30,[19716]=300,[19725]=20,[19727]=3600,[19740]=300,[19742]=300,
    [19753]=180,[19755]=60,[19769]=3,[19771]=30,[19776]=18,[19778]=30,[19779]=10,
    [19780]=2,[19784]=4,[19812]=8,[19820]=20,[19821]=5,[19822]=10,[19832]=90,
    [19834]=300,[19835]=300,[19836]=300,[19837]=300,[19838]=300,[19850]=300,
    [19852]=300,[19853]=300,[19854]=300,[19872]=30,[19937]=900,[19952]=10,[19953]=10,
    [19970]=27,[19971]=24,[19972]=21,[19973]=18,[19974]=15,[19975]=12,[19977]=300,
    [19978]=300,[19979]=300,[20005]=5,[20006]=12,[20007]=15,[20019]=6,[20050]=8,
    [20052]=8,[20053]=8,[20054]=8,[20055]=8,[20066]=6,[20128]=10,[20131]=10,
    [20132]=10,[20133]=10,[20134]=10,[20154]=30,[20162]=30,[20164]=30,[20165]=30,
    [20166]=30,[20170]=2,[20184]=10,[20185]=10,[20186]=10,[20188]=10,[20217]=300,
    [20223]=10,[20228]=12,[20229]=8,[20230]=15,[20233]=120,[20236]=120,[20253]=3,
    [20276]=2,[20277]=4,[20287]=30,[20288]=30,[20289]=30,[20290]=30,[20291]=30,
    [20292]=30,[20293]=30,[20294]=21,[20297]=4,[20300]=10,[20301]=10,[20302]=10,
    [20303]=10,[20305]=30,[20306]=30,[20307]=30,[20308]=30,[20310]=2,[20344]=10,
    [20345]=10,[20346]=10,[20347]=30,[20348]=30,[20349]=30,[20354]=10,[20355]=10,
    [20356]=30,[20357]=30,[20375]=30,[20436]=30,[20475]=8,[20478]=8,[20481]=1800,
    [20507]=1,[20508]=0.001,[20510]=15,[20511]=8,[20512]=20,[20541]=0.1,[20542]=15,
    [20544]=2,[20545]=600,[20547]=8,[20548]=3,[20549]=2,[20553]=2,[20559]=6,
    [20560]=6,[20564]=8,[20570]=10,[20578]=10,[20586]=20,[20587]=600,[20590]=600,
    [20594]=8,[20600]=20,[20604]=15,[20612]=8,[20614]=3,[20615]=3,[20619]=10,
    [20620]=300,[20624]=3600,[20629]=10,[20631]=10,[20654]=15,[20655]=60,[20656]=60,
    [20663]=10,[20664]=12,[20665]=21,[20667]=30,[20668]=10,[20669]=10,[20672]=3,
    [20683]=5,[20685]=8,[20690]=12,[20697]=30,[20699]=15,[20701]=12,[20706]=30,
    [20707]=1800,[20716]=10,[20717]=10,[20729]=30,[20733]=60,[20740]=15,[20743]=5,
    [20753]=30,[20762]=1800,[20763]=1800,[20764]=1800,[20765]=1800,[20785]=1800,
    [20786]=10,[20787]=21,[20792]=4,[20798]=1800,[20800]=21,[20806]=4,[20812]=15,
    [20819]=4,[20822]=4,[20826]=21,[20828]=8,[20875]=900,[20882]=300,[20909]=5,
    [20910]=5,[20911]=300,[20912]=300,[20913]=300,[20914]=300,[20915]=30,[20918]=30,
    [20919]=30,[20920]=30,[20925]=10,[20927]=10,[20928]=10,[20988]=4,[20989]=10,
    [21007]=120,[21008]=6,[21030]=8,[21047]=10,[21048]=1800,[21049]=30,[21055]=30,
    [21056]=60,[21060]=10,[21062]=30,[21063]=45,[21066]=10,[21067]=10,[21068]=24,
    [21069]=6,[21075]=10,[21081]=30,[21082]=30,[21084]=30,[21086]=1800,[21087]=1800,
    [21090]=1800,[21091]=10,[21095]=5,[21098]=30,[21099]=5,[21141]=30,[21149]=18,
    [21151]=30,[21152]=3,[21153]=10,[21159]=8,[21162]=10,[21163]=1800,[21165]=10,
    [21167]=1,[21171]=120,[21172]=10,[21174]=10,[21183]=10,[21188]=2,[21307]=7200,
    [21330]=2,[21331]=15,[21335]=600,[21337]=600,[21340]=600,[21354]=3,[21369]=4,
    [21401]=8,[21403]=1800,[21425]=120,[21540]=10,[21546]=900,[21547]=5,[21551]=10,
    [21552]=10,[21553]=10,[21556]=1800,[21562]=3600,[21564]=3600,[21566]=1800,
    [21655]=1,[21669]=12,[21670]=60,[21687]=15,[21708]=15,[21736]=7200,[21740]=4,
    [21748]=2,[21749]=2,[21787]=120,[21793]=10,[21794]=16,[21808]=8,[21827]=600,
    [21833]=8,[21840]=6,[21847]=6,[21849]=3600,[21850]=3600,[21860]=5,[21863]=600,
    [21866]=16,[21869]=8,[21878]=15,[21887]=10,[21892]=2,[21896]=5,[21898]=2,
    [21909]=8,[21920]=1800,[21921]=4,[21925]=4,[21927]=4,[21929]=4,[21932]=4,
    [21936]=60,[21949]=30,[21952]=20,[21955]=10,[21956]=10,[21961]=30,[21970]=60,
    [21971]=10,[21976]=4,[21980]=60,[21990]=4,[21992]=12,[22008]=10,[22009]=15,
    [22011]=30,[22067]=10,[22127]=10,[22128]=600,[22168]=20,[22187]=30,[22206]=12,
    [22247]=6,[22272]=5,[22274]=20,[22284]=5,[22289]=6,[22290]=6,[22291]=5,
    [22335]=30,[22356]=10,[22357]=2,[22371]=120,[22373]=21,[22412]=30,[22415]=10,
    [22417]=30,[22418]=1800,[22419]=4,[22420]=60,[22423]=12,[22424]=6,[22426]=30,
    [22427]=5,[22428]=8,[22433]=20,[22438]=30,[22440]=0.001,[22442]=6,[22478]=15,
    [22479]=6,[22519]=2,[22558]=5,[22559]=6,[22561]=1,[22566]=8,[22570]=2,[22572]=5,
    [22582]=8,[22592]=2,[22639]=30,[22640]=5,[22642]=6,[22643]=4,[22645]=8,
    [22646]=0.001,[22651]=8,[22652]=10,[22660]=30,[22661]=10,[22662]=21,[22666]=6,
    [22667]=15,[22678]=6,[22682]=10,[22685]=1800,[22686]=4,[22687]=6,[22688]=30,
    [22689]=20,[22690]=4,[22691]=6,[22692]=8,[22693]=10,[22695]=21,[22703]=2,
    [22707]=1.7,[22710]=30,[22713]=20,[22730]=600,[22731]=27,[22734]=30,[22735]=7200,
    [22736]=600,[22739]=8,[22742]=20,[22744]=10,[22746]=8,[22751]=120,[22752]=900,
    [22782]=1800,[22783]=1800,[22788]=604800,[22789]=900,[22790]=900,[22800]=8,
    [22807]=3600,[22812]=15,[22817]=7200,[22818]=7200,[22820]=7200,[22822]=6,
    [22823]=6,[22833]=10,[22835]=60,[22839]=15,[22842]=10,[22850]=10,[22857]=15,
    [22859]=5,[22863]=10,[22884]=4,[22888]=7200,[22895]=10,[22896]=10,[22901]=30,
    [22909]=4,[22911]=2,[22914]=3,[22915]=3,[22917]=240,[22919]=3,[22924]=10,
    [22935]=3,[22937]=10,[22948]=5,[22959]=30,[22969]=5,[22992]=11,[22994]=10,
    [22997]=40,[22998]=3,[23006]=3,[23009]=2,[23010]=1,[23015]=18,[23016]=18,
    [23023]=10,[23028]=3600,[23038]=12,[23039]=6,[23055]=2,[23060]=240,[23097]=5,
    [23099]=15,[23102]=4,[23103]=10,[23108]=10,[23109]=15,[23110]=15,[23113]=6,
    [23115]=8,[23120]=6,[23126]=300,[23128]=8,[23131]=5,[23132]=5,[23145]=15,
    [23147]=15,[23148]=15,[23153]=600,[23154]=600,[23155]=600,[23162]=10,[23164]=20,
    [23165]=30,[23169]=600,[23170]=600,[23171]=4,[23174]=300,[23175]=300,[23177]=300,
    [23179]=1200,[23182]=900,[23183]=12,[23186]=90,[23187]=15,[23189]=15,[23205]=45,
    [23207]=10,[23224]=8,[23226]=6,[23230]=25,[23234]=15,[23244]=4,[23257]=30,
    [23260]=20,[23262]=30,[23268]=18,[23269]=4,[23270]=20,[23271]=15,[23273]=0.1,
    [23274]=0.1,[23275]=5,[23276]=0.1,[23277]=0.1,[23279]=30,[23298]=45,[23299]=18,
    [23303]=5,[23310]=8,[23312]=8,[23313]=15,[23314]=15,[23315]=60,[23316]=60,
    [23331]=8,[23340]=8,[23341]=20,[23342]=10,[23355]=20,[23364]=2,[23365]=8,
    [23379]=30,[23380]=12,[23387]=1,[23388]=2,[23397]=30,[23398]=30,[23401]=30,
    [23402]=30,[23410]=30,[23411]=8,[23412]=9,[23414]=30,[23415]=5,[23417]=6,
    [23418]=30,[23425]=30,[23427]=0.001,[23444]=10,[23445]=7200,[23447]=5,[23449]=24,
    [23451]=10,[23452]=90,[23454]=1,[23456]=10,[23457]=10,[23461]=15,[23492]=5,
    [23493]=10,[23505]=60,[23506]=20,[23511]=30,[23513]=180,[23537]=600,[23552]=600,
    [23567]=8,[23568]=8,[23569]=8,[23577]=7,[23580]=6,[23600]=6,[23601]=4,[23603]=20,
    [23605]=5,[23618]=10,[23619]=15,[23620]=20,[23684]=15,[23693]=120,[23694]=5,
    [23696]=8,[23697]=600,[23698]=30,[23719]=8,[23720]=30,[23721]=10,[23723]=20,
    [23724]=20,[23726]=20,[23733]=20,[23734]=20,[23735]=7200,[23736]=7200,
    [23737]=7200,[23738]=7200,[23766]=7200,[23767]=7200,[23768]=7200,[23769]=7200,
    [23770]=14400,[23780]=20,[23782]=20,[23790]=3600,[23848]=10,[23850]=10,[23860]=8,
    [23862]=10,[23865]=10,[23885]=8,[23886]=8,[23887]=8,[23888]=8,[23895]=15,
    [23918]=10,[23919]=2,[23931]=10,[23947]=3600,[23948]=3600,[23951]=15,[23952]=18,
    [23953]=10,[23958]=60,[23964]=600,[23978]=10,[23991]=15,[24002]=8,[24003]=8,
    [24004]=10,[24005]=25,[24011]=10,[24018]=10,[24020]=2,[24021]=8,[24043]=6,
    [24048]=2,[24049]=10,[24053]=5,[24054]=120,[24057]=2,[24065]=5,[24066]=4,
    [24086]=604800,[24087]=20,[24097]=30,[24099]=10,[24109]=60,[24110]=8,[24111]=30,
    [24131]=12,[24132]=12,[24133]=12,[24134]=12,[24135]=12,[24152]=15,[24170]=18,
    [24178]=20,[24185]=30,[24192]=6,[24193]=2,[24203]=30,[24210]=120,[24212]=18,
    [24213]=2,[24217]=30,[24221]=60,[24223]=10,[24225]=6,[24236]=2,[24238]=12,
    [24244]=300,[24255]=12,[24259]=3,[24268]=30,[24300]=7,[24306]=20,[24312]=604800,
    [24314]=6,[24317]=20,[24318]=90,[24321]=90,[24322]=8,[24323]=8,[24324]=8,
    [24327]=10,[24328]=10,[24331]=9,[24332]=9,[24333]=2,[24335]=12,[24336]=12,
    [24339]=180,[24345]=5,[24348]=4,[24352]=20,[24354]=20,[24355]=30,[24360]=12,
    [24361]=3600,[24363]=3600,[24364]=5,[24375]=5,[24378]=60,[24379]=10,[24382]=7200,
    [24383]=7200,[24388]=30,[24389]=60,[24390]=10,[24394]=3,[24395]=15,[24396]=15,
    [24397]=15,[24408]=2,[24412]=8,[24413]=8,[24414]=8,[24415]=20,[24417]=7200,
    [24423]=4,[24425]=7200,[24427]=60,[24435]=5,[24438]=20,[24498]=15,[24499]=20,
    [24542]=15,[24543]=20,[24544]=20,[24546]=15,[24573]=5,[24574]=20,[24575]=20,
    [24577]=4,[24578]=4,[24579]=4,[24583]=10,[24586]=10,[24587]=10,[24594]=7,
    [24596]=120,[24597]=10,[24600]=7,[24603]=10,[24604]=10,[24605]=10,[24610]=15,
    [24611]=9,[24614]=15,[24615]=1.5,[24617]=10,[24618]=5,[24619]=12,[24640]=10,
    [24646]=15,[24647]=2,[24648]=10,[24658]=20,[24659]=20,[24661]=20,[24662]=20,
    [24664]=6,[24671]=2,[24672]=20,[24673]=600,[24674]=10,[24686]=6,[24687]=5,
    [24688]=10,[24689]=8,[24690]=2,[24692]=604800,[24698]=4,[24699]=20,[24700]=2,
    [24701]=15,[24705]=7200,[24707]=25,[24708]=3600,[24709]=3600,[24710]=3600,
    [24711]=3600,[24712]=3600,[24713]=3600,[24716]=3,[24723]=3600,[24725]=15,
    [24732]=3600,[24734]=4,[24735]=3600,[24736]=3600,[24740]=3600,[24742]=18,
    [24743]=5,[24744]=4,[24745]=1,[24747]=1,[24752]=1800,[24753]=45,[24754]=6,
    [24755]=3600,[24756]=4,[24757]=1,[24758]=4,[24759]=1,[24760]=4,[24761]=1,
    [24762]=1,[24763]=4,[24765]=4,[24766]=1,[24768]=4,[24769]=1,[24770]=4,[24771]=1,
    [24772]=4,[24773]=1,[24776]=0.001,[24778]=5,[24783]=4,[24784]=4,[24785]=1,
    [24786]=4,[24787]=1,[24788]=4,[24789]=4,[24790]=4,[24791]=1,[24792]=1,[24793]=1,
    [24798]=900,[24799]=900,[24800]=30,[24803]=4,[24811]=5,[24818]=30,[24828]=3,
    [24832]=5,[24833]=600,[24839]=45,[24865]=25,[24869]=24,[24870]=900,[24871]=5,
    [24884]=10,[24893]=11,[24906]=10,[24910]=10,[24918]=120,[24919]=5,[24920]=2,
    [24924]=1200,[24925]=1200,[24926]=1200,[24927]=1200,[24928]=120,[24935]=300,
    [24937]=300,[24942]=4,[24948]=5,[24957]=12,[24974]=12,[24975]=12,[24976]=12,
    [24977]=12,[24984]=15,[24991]=7200,[24992]=15,[24998]=15,[25006]=300,[25020]=600,
    [25022]=6,[25023]=1800,[25029]=2,[25037]=900,[25040]=900,[25042]=12,[25043]=90,
    [25049]=6,[25050]=120,[25051]=20,[25053]=30,[25056]=2,[25057]=10,[25058]=15,
    [25098]=8,[25101]=900,[25102]=60,[25161]=1,[25164]=30,[25165]=15,[25174]=30,
    [25177]=45,[25178]=45,[25180]=45,[25181]=45,[25183]=45,[25185]=8,[25187]=30,
    [25189]=10,[25195]=15,[25199]=1800,[25260]=6,[25262]=10,[25282]=6,[25289]=120,
    [25290]=300,[25291]=300,[25295]=15,[25299]=12,[25304]=9,[25306]=8,[25309]=15,
    [25311]=18,[25315]=15,[25345]=5,[25348]=12,[25349]=12,[25371]=15,[25374]=15,
    [25410]=15,[25424]=10,[25425]=2,[25462]=60,[25471]=10,[25473]=10,[25495]=8,
    [25497]=8,[25503]=10,[25515]=5,[25516]=30,[25565]=0.1,[25605]=15,[25645]=30,
    [25646]=15,[25651]=20,[25654]=2,[25655]=8,[25656]=20,[25660]=30,[25661]=900,
    [25668]=20,[25678]=180,[25685]=604800,[25688]=1800,[25694]=900,[25695]=30,
    [25696]=30,[25697]=30,[25698]=7,[25700]=21,[25701]=21,[25702]=21,[25703]=21,
    [25722]=900,[25725]=10,[25746]=15,[25747]=15,[25748]=10,[25750]=15,[25751]=30,
    [25752]=10,[25756]=2,[25757]=10,[25768]=8,[25771]=60,[25772]=120,[25773]=120,
    [25774]=3,[25780]=1800,[25782]=900,[25790]=600,[25794]=3600,[25795]=3600,
    [25796]=3600,[25797]=3600,[25798]=3600,[25799]=3600,[25804]=900,[25805]=15,
    [25806]=30,[25809]=12,[25810]=12,[25811]=10,[25812]=16,[25815]=6,[25816]=120,
    [25821]=2,[25824]=604800,[25838]=20,[25839]=12,[25851]=30,[25852]=2,[25864]=1,
    [25886]=21,[25887]=21,[25888]=21,[25889]=21,[25890]=900,[25891]=20,
    [25893]=604800,[25894]=900,[25895]=900,[25898]=900,[25899]=900,[25907]=10,
    [25916]=900,[25918]=900,[25937]=15,[25941]=900,[25942]=10,[25945]=10,
    [25947]=1800,[25990]=20,[25991]=10,[25999]=1,[26004]=1800,[26008]=1800,
    [26009]=300,[26013]=900,[26015]=1,[26017]=10,[26018]=10,[26025]=8,[26030]=27,
    [26035]=1800,[26038]=8,[26041]=10,[26042]=4,[26043]=30,[26044]=8,[26049]=8,
    [26050]=30,[26051]=8,[26053]=8,[26064]=12,[26068]=3600,[26069]=10,[26070]=8,
    [26071]=15,[26072]=12,[26077]=8,[26078]=30,[26079]=10,[26083]=15,[26099]=30,
    [26102]=5,[26108]=3,[26121]=8,[26129]=20,[26132]=8,[26136]=300,[26141]=10,
    [26143]=10,[26157]=1800,[26166]=30,[26168]=30,[26177]=4,[26178]=4,[26179]=4,
    [26180]=12,[26195]=20,[26196]=15,[26197]=20,[26198]=30,[26199]=1800,[26201]=4,
    [26211]=10,[26218]=3600,[26222]=1.5,[26226]=4,[26235]=45,[26258]=20,[26259]=12,
    [26260]=30,[26261]=30,[26263]=25,[26272]=1800,[26273]=1800,[26274]=1800,
    [26276]=1800,[26331]=20,[26332]=3.8,[26379]=6,[26381]=10,[26382]=3,[26386]=12,
    [26387]=1200,[26390]=10,[26393]=3600,[26400]=20,[26401]=30,[26402]=30,[26419]=10,
    [26462]=1800,[26463]=60,[26464]=60,[26467]=30,[26470]=8,[26472]=30,[26473]=30,
    [26474]=30,[26475]=30,[26480]=30,[26522]=1800,[26525]=20,[26527]=120,[26542]=10,
    [26548]=8,[26552]=8,[26556]=40,[26580]=8,[26592]=15,[26601]=10,[26613]=6,
    [26615]=3600,[26619]=45,[26634]=604800,[26635]=10,[26637]=1.7,[26641]=3,
    [26650]=0.1,[26651]=1,[26652]=10,[26662]=300,[26664]=3600,[26680]=3600,
    [26681]=3600,[26682]=3600,[26740]=20,[26787]=0.001,[26802]=3600,[26898]=3600,
    [26977]=60,[27039]=4,[27042]=4,[27177]=10,[27183]=300,[27192]=300,[27193]=300,
    [27194]=300,[27195]=300,[27196]=300,[27197]=300,[27198]=300,[27199]=300,
    [27200]=300,[27205]=4,[27208]=4,[27420]=3,[27499]=10,[27532]=12,[27533]=6,
    [27534]=6,[27535]=6,[27536]=6,[27538]=6,[27540]=6,[27543]=10,[27545]=10,
    [27551]=30,[27553]=2,[27555]=10,[27556]=15,[27559]=3,[27564]=5,[27565]=10,
    [27568]=604800,[27569]=604800,[27571]=120,[27572]=3600,[27575]=600,[27578]=120,
    [27579]=30,[27580]=10,[27581]=10,[27582]=30,[27584]=15,[27603]=8,[27605]=18,
    [27606]=15,[27607]=30,[27610]=8,[27615]=5,[27616]=600,[27619]=10,[27620]=4,
    [27633]=10,[27634]=3,[27636]=6,[27637]=21,[27638]=15,[27640]=3,[27641]=6,
    [27648]=12,[27652]=1800,[27653]=1800,[27664]=3600,[27665]=3600,[27666]=3600,
    [27669]=3600,[27670]=3600,[27671]=3600,[27672]=5,[27673]=30,[27675]=15,
    [27680]=600,[27681]=3600,[27683]=1200,[27685]=4,[27688]=300,[27689]=30,
    [27720]=3600,[27721]=3600,[27722]=3600,[27723]=3600,[27737]=12,[27758]=5,
    [27759]=30,[27760]=15,[27775]=10,[27779]=30,[27807]=20,[27808]=5,[27813]=6,
    [27814]=6,[27817]=6,[27818]=6,[27819]=5,[27825]=15,[27827]=10,[27828]=6,
    [27841]=1800,[27852]=0.1,[27857]=300,[27861]=2700,[27863]=600,[27864]=300,
    [27865]=60,[27868]=3,[27873]=10,[27874]=10,[27880]=3,[27891]=20,[27897]=600,
    [27965]=1,[27990]=4,[27991]=30,[27993]=12,[27994]=5,[27995]=20,[28007]=230,
    [28009]=180,[28011]=120,[28018]=7200,[28059]=60,[28084]=60,[28095]=3600,
    [28127]=8,[28131]=300,[28134]=10,[28137]=3,[28158]=60,[28169]=10,[28190]=30,
    [28200]=20,[28225]=300,[28270]=50,[28271]=50,[28272]=50,[28310]=8,[28311]=10,
    [28314]=3,[28315]=2,[28316]=3,[28323]=2,[28333]=2,[28334]=6,[28335]=2,[28342]=90,
    [28350]=7,[28362]=604800,[28371]=8,[28374]=3,[28391]=1,[28406]=8,[28409]=20,
    [28410]=20,[28412]=3,[28413]=8,[28418]=120,[28419]=120,[28420]=120,[28431]=9,
    [28434]=1,[28440]=6,[28445]=3,[28450]=0.1,[28456]=6,[28467]=15,[28478]=4,
    [28479]=4,[28498]=300,[28522]=25,[28531]=5,[28542]=12,[28608]=24,[28609]=30,
    [28610]=30,[28616]=30,[28618]=1,[28619]=2,[28620]=2,[28621]=2,[28622]=60,
    [28627]=55,[28679]=60,[28681]=1800,[28701]=20,[28725]=5,[28727]=30,[28732]=30,
    [28747]=600,[28750]=4,[28754]=15,[28757]=4,[28762]=8,[28765]=30,[28766]=30,
    [28768]=30,[28769]=30,[28770]=30,[28772]=30,[28773]=20,[28776]=30,[28777]=20,
    [28778]=20,[28779]=20,[28780]=30,[28785]=20,[28786]=6,[28790]=8,[28791]=8,
    [28793]=8,[28795]=8,[28796]=8,[28798]=1800,[28804]=30,[28810]=30,[28824]=8,
    [28825]=8,[28826]=8,[28827]=8,[28832]=75,[28833]=75,[28834]=75,[28835]=75,
    [28846]=5,[28858]=15,[28862]=20,[28866]=15,[28882]=8,[28911]=18,[28913]=10,
    [28969]=10,[28991]=10,[28995]=6,[29001]=3600,[29002]=3600,[29003]=3600,
    [29006]=1800,[29007]=30,[29008]=30,[29035]=15,[29038]=21,[29039]=21,[29040]=900,
    [29041]=30,[29042]=20,[29051]=60,[29055]=25,[29060]=20,[29061]=20,[29063]=6,
    [29073]=30,[29104]=5,[29124]=20,[29131]=10,[29134]=5,[29163]=5,[29164]=5,
    [29166]=20,[29168]=6,[29169]=10,[29175]=3600,[29177]=10,[29178]=10,[29183]=60,
    [29184]=60,[29185]=120,[29194]=120,[29195]=60,[29196]=120,[29197]=60,[29198]=120,
    [29199]=60,[29203]=15,[29204]=10,[29207]=1,[29208]=1,[29209]=1,[29210]=1,
    [29211]=1,[29212]=15,[29213]=10,[29214]=10,[29220]=300,[29228]=12,[29232]=90,
    [29233]=4,[29235]=3600,[29252]=5,[29261]=5,[29265]=5,[29270]=5,[29274]=1,
    [29296]=2,[29306]=60,[29325]=25,[29330]=25,[29331]=3600,[29332]=3600,
    [29333]=3600,[29334]=3600,[29335]=3600,[29338]=3600,[29350]=45,[29388]=12,
    [29407]=10,[29419]=10,[29432]=3600,[29484]=10,[29506]=20,[29530]=1,[29534]=1800,
    [29544]=8,[29602]=20,[29607]=0.001,[29685]=5,[29825]=30,[29846]=3600,[29848]=20,
    [29849]=8,[29851]=2,[29865]=12,[29871]=5,[29910]=1,[29915]=10,[29943]=8,
    [29998]=21,[30001]=8,[30002]=6,[30003]=7200,[30020]=10,[30080]=300,[30081]=300,
    [30082]=3,[30088]=3600,[30089]=3600,[30090]=3600,[30092]=8,[30094]=8,[30095]=8,
    [30109]=5,[30110]=604800,[30112]=2,[30113]=30,[30165]=10,[30167]=600,[30225]=8,
    [30238]=1800,[30285]=15,[30297]=1800,[30331]=7200,[30336]=7200,[30338]=7200,
    [30440]=30,[30441]=30,[30803]=10,[30804]=10,[30805]=10,[30806]=10,[30807]=10,
    [30918]=1,[31248]=1,[31316]=0.1,[31362]=1,[31466]=1,[31562]=6,[31800]=27,
    [301100]=3,[301101]=3,
}

lib:SetDataVersion(Type, Version)