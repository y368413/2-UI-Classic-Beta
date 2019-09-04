--## Author: d87
local ClassicAuraDurations = {}
local LibClassicDurations
local LibAuraTypes
local LibSpellLocks

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(self, event, ...)
	return self[event](self, event, ...)
end)

local defaults = {
    portraitIcon = true,
    enemyBuffs = true,
    hookTargetFrame = true,
    verbosePortraitIcon = false,
}

-- Redefining blizzard consts
local AURA_START_X = 5;
local AURA_START_Y = 32;
local AURA_OFFSET_Y = 1;
local LARGE_AURA_SIZE = 21;
local SMALL_AURA_SIZE = 17;
local AURA_ROW_WIDTH = 122;
local TOT_AURA_ROW_WIDTH = 101;
local NUM_TOT_AURA_ROWS = 2;

local largeBuffList = {};
local largeDebuffList = {};
local function ShouldAuraBeLarge(caster)
    -- In Classic, all auras will be the same size.
    return true;
end



local UpdatePortraitIcon = function(unit, maxPrio, maxPrioIndex, maxPrioFilter)
    local auraCD = TargetFrame.CADPortraitFrame
    local originalPortrait = auraCD.originalPortrait

    local isLocked = LibSpellLocks:GetSpellLockInfo(unit)

    local CUTOFF_AURA_TYPE = defaults.verbosePortraitIcon and "SPEED_BOOST" or "SILENCE"
    local PRIO_SILENCE = LibAuraTypes.GetDebuffTypePriority(CUTOFF_AURA_TYPE)
    if isLocked and PRIO_SILENCE > maxPrio then
        maxPrio = PRIO_SILENCE
        maxPrioIndex = -1
    end

    if maxPrio >= PRIO_SILENCE then
        local name, icon, _, _, duration, expirationTime, caster, _,_, spellId
        if maxPrioIndex == -1 then
            spellId, name, icon, duration, expirationTime = LibSpellLocks:GetSpellLockInfo(unit)
        else
            name, icon, _, _, duration, expirationTime, caster, _,_, spellId = LibClassicDurations:UnitAura(unit, maxPrioIndex, maxPrioFilter)
            local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(unit, spellId, caster)
            if duration == 0 and durationNew then
                duration = durationNew
                expirationTime = expirationTimeNew
            end
        end
        SetPortraitToTexture(auraCD.texture, icon)
        originalPortrait:Hide()
        auraCD:SetCooldown(expirationTime-duration, duration)
        auraCD:Show()
    else
        auraCD:Hide()
        originalPortrait:Show()
    end
end


f.SimpleTargetFrameHook = function(self)
    local frame, frameName;
    local frameIcon, frameCount, frameCooldown;
    local numBuffs = 0;
    -- local playerIsTarget = UnitIsUnit(PlayerFrame.unit, self.unit);
    local selfName = self:GetName();
    --[[ PORTRAIT AURA ]]
    local maxPrio = 0
    local maxPrioFilter
    local maxPrioIndex = 1

    for i = 1, MAX_TARGET_BUFFS do
        local buffName, icon, count, debuffType, duration, expirationTime, caster, canStealOrPurge, _ , spellId, _, _, casterIsPlayer, nameplateShowAll = UnitBuff(self.unit, i, nil);
        if (buffName) then
            frameName = selfName.."Buff"..(i);
            frame = _G[frameName];

            -- Handle cooldowns
            frameCooldown = _G[frameName.."Cooldown"];
            local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(self.unit, spellId, caster)
            if duration == 0 and durationNew then
                duration = durationNew
                expirationTime = expirationTimeNew
            end
            CooldownFrame_Set(frameCooldown, expirationTime - duration, duration, duration > 0, true);

            --[[ PORTRAIT AURA ]]
            if defaults.portraitIcon then
                local rootSpellID, spellType, prio = LibAuraTypes.GetDebuffInfo(spellId)
                if prio and prio > maxPrio then
                    maxPrio = prio
                    maxPrioIndex = i
                    maxPrioFilter = "HELPFUL"
                end
            end
        else
            break;
        end
    end


    local numDebuffs = 0;
    local frameNum = 1;
    local index = 1;

    local maxDebuffs = self.maxDebuffs or MAX_TARGET_DEBUFFS;
    while ( frameNum <= maxDebuffs and index <= maxDebuffs ) do
        local debuffName, icon, count, debuffType, duration, expirationTime, caster, _, _, spellId, _, _, casterIsPlayer, nameplateShowAll = UnitDebuff(self.unit, index, "INCLUDE_NAME_PLATE_ONLY");
        if ( debuffName ) then
            if ( TargetFrame_ShouldShowDebuffs(self.unit, caster, nameplateShowAll, casterIsPlayer) ) then
                frameName = selfName.."Debuff"..frameNum;
                frame = _G[frameName];

                -- Handle cooldowns
                frameCooldown = _G[frameName.."Cooldown"];
                local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(self.unit, spellId, caster)
                if duration == 0 and durationNew then
                    duration = durationNew
                    expirationTime = expirationTimeNew
                end
                CooldownFrame_Set(frameCooldown, expirationTime - duration, duration, duration > 0, true);

                frameNum = frameNum + 1;

                --[[ PORTRAIT AURA ]]
                if defaults.portraitIcon then
                    local rootSpellID, spellType, prio = LibAuraTypes.GetDebuffInfo(spellId)
                    if prio and prio > maxPrio then
                        maxPrio = prio
                        maxPrioIndex = index
                        maxPrioFilter = "HARMFUL"
                    end
                end
            end
        else
            break;
        end
        index = index + 1;
    end

    --[[ PORTRAIT AURA ]]
    if defaults.portraitIcon then
        UpdatePortraitIcon(self.unit, maxPrio, maxPrioIndex, maxPrioFilter)
    end
end

f:RegisterEvent("PLAYER_LOGIN")
function f.PLAYER_LOGIN(self, event)
    LibClassicDurations = LibStub("LibClassicDurations")
    LibClassicDurations:RegisterFrame("ClassicAuraDurations")

    LibAuraTypes = LibStub("LibAuraTypes")
    LibSpellLocks = LibStub("LibSpellLocks")

    LibSpellLocks.RegisterCallback("ClassicAuraDurations", "UPDATE_INTERRUPT", function(event, guid)
        if UnitGUID("target") == guid then
            TargetFrame_UpdateAuras(TargetFrame)
        end
    end)

    local originalPortrait = _G["TargetFramePortrait"];

    local auraCD = CreateFrame("Cooldown", "ClassicAuraDurationsPortraitAura", TargetFrame, "CooldownFrameTemplate")
    auraCD:SetFrameStrata("BACKGROUND")
    auraCD:SetDrawEdge(false);
    -- auraCD:SetHideCountdownNumbers(true);
    auraCD:SetReverse(true)
    auraCD:SetSwipeTexture("Interface\\CHARACTERFRAME\\TempPortraitAlphaMaskSmall")
    auraCD:SetAllPoints(originalPortrait)
    TargetFrame.CADPortraitFrame = auraCD
    auraCD.originalPortrait = originalPortrait

    local auraIconTexture = auraCD:CreateTexture(nil, "BORDER", nil, 2)
    auraIconTexture:SetAllPoints(originalPortrait)
    -- auraIconTexture:Hide()
    -- SetPortraitToTexture(auraIconTexture, 136039)
    auraCD.texture = auraIconTexture
    auraCD:Hide()

    if defaults.hookTargetFrame then
        if defaults.enemyBuffs then
            hooksecurefunc("TargetFrame_UpdateAuras", f.EnemyBuffsTargetFrameHook)
            LibClassicDurations.RegisterCallback("ClassicAuraDurations", "UNIT_BUFF", function(event, unit)
                TargetFrame_UpdateAuras(TargetFrame)
            end)
        else
            hooksecurefunc("TargetFrame_UpdateAuras", f.SimpleTargetFrameHook)
        end
    end

    hooksecurefunc("CompactUnitFrame_UtilSetBuff", function(buffFrame, unit, index, filter)
        local name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, _, spellId, canApplyAura = UnitBuff(unit, index, filter);
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

    hooksecurefunc("CompactUnitFrame_UtilSetDebuff", function(debuffFrame, unit, index, filter, isBossAura, isBossBuff)
        local name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, _, spellId;
        if (isBossBuff) then
            name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, _, spellId = UnitBuff(unit, index, filter);
        else
            name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, _, spellId = UnitDebuff(unit, index, filter);
        end

        local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(unit, spellId, unitCaster)
        if duration == 0 and durationNew then
            duration = durationNew
            expirationTime = expirationTimeNew
        end

        local enabled = expirationTime and expirationTime ~= 0;
        if enabled then
            local startTime = expirationTime - duration;
            CooldownFrame_Set(debuffFrame.cooldown, startTime, duration, true);
        else
            CooldownFrame_Clear(debuffFrame.cooldown);
        end
    end)
end

f.EnemyBuffsTargetFrameHook = function(self)
    local frame, frameName;
    local frameIcon, frameCount, frameCooldown;
    local numBuffs = 0;
    local playerIsTarget = UnitIsUnit(PlayerFrame.unit, self.unit);
    local selfName = self:GetName();
    local canAssist = UnitCanAssist("player", self.unit);


    local unit = self.unit
    --[[ PORTRAIT AURA ]]
    local maxPrio = 0
    local maxPrioFilter
    local maxPrioIndex = 1

    for i = 1, MAX_TARGET_BUFFS do
        local buffName, icon, count, debuffType, duration, expirationTime, caster, canStealOrPurge, _ , spellId, _, _, casterIsPlayer, nameplateShowAll = LibClassicDurations:UnitAura(self.unit, i, "HELPFUL");
        if (buffName) then
            frameName = selfName.."Buff"..(i);
            frame = _G[frameName];
            if ( not frame ) then
                if ( not icon ) then
                    break;
                else
                    frame = CreateFrame("Button", frameName, self, "TargetBuffFrameTemplate");
                    frame.unit = self.unit;
                end
            end
            if ( icon and ( not self.maxBuffs or i <= self.maxBuffs ) ) then
                frame:SetID(i);

                -- set the icon
                frameIcon = _G[frameName.."Icon"];
                frameIcon:SetTexture(icon);

                -- set the count
                frameCount = _G[frameName.."Count"];
                if ( count > 1 and self.showAuraCount ) then
                    frameCount:SetText(count);
                    frameCount:Show();
                else
                    frameCount:Hide();
                end

                -- Handle cooldowns
                frameCooldown = _G[frameName.."Cooldown"];
                local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(self.unit, spellId, caster)
                if duration == 0 and durationNew then
                    duration = durationNew
                    expirationTime = expirationTimeNew
                end
                CooldownFrame_Set(frameCooldown, expirationTime - duration, duration, duration > 0, true);

                --[[ PORTRAIT AURA ]]
                if defaults.portraitIcon then
                    local rootSpellID, spellType, prio = LibAuraTypes.GetDebuffInfo(spellId)
                    if prio and prio > maxPrio then
                        maxPrio = prio
                        maxPrioIndex = i
                        maxPrioFilter = "HELPFUL"
                    end
                end

                -- Show stealable frame if the target is not the current player and the buff is stealable.
                local frameStealable = _G[frameName.."Stealable"];
                if ( not playerIsTarget and canStealOrPurge ) then
                    frameStealable:Show();
                else
                    frameStealable:Hide();
                end

                -- set the buff to be big if the buff is cast by the player or his pet
                numBuffs = numBuffs + 1;
                largeBuffList[numBuffs] = ShouldAuraBeLarge(caster);

                frame:ClearAllPoints();
                frame:Show();
            else
                frame:Hide();
            end
        else
            break;
        end
    end

    for i = numBuffs + 1, MAX_TARGET_BUFFS do
        local frame = _G[selfName.."Buff"..i];
        if ( frame ) then
            frame:Hide();
        else
            break;
        end
    end

    local color;
    local frameBorder;
    local numDebuffs = 0;

    local frameNum = 1;
    local index = 1;

    local maxDebuffs = self.maxDebuffs or MAX_TARGET_DEBUFFS;
    while ( frameNum <= maxDebuffs and index <= maxDebuffs ) do
        local debuffName, icon, count, debuffType, duration, expirationTime, caster, _, _, spellId, _, _, casterIsPlayer, nameplateShowAll = UnitDebuff(self.unit, index, "INCLUDE_NAME_PLATE_ONLY");
        if ( debuffName ) then
            if ( TargetFrame_ShouldShowDebuffs(self.unit, caster, nameplateShowAll, casterIsPlayer) ) then
                frameName = selfName.."Debuff"..frameNum;
                frame = _G[frameName];
                if ( icon ) then
                    if ( not frame ) then
                        frame = CreateFrame("Button", frameName, self, "TargetDebuffFrameTemplate");
                        frame.unit = self.unit;
                    end
                    frame:SetID(index);

                    -- set the icon
                    frameIcon = _G[frameName.."Icon"];
                    frameIcon:SetTexture(icon);

                    -- set the count
                    frameCount = _G[frameName.."Count"];
                    if ( count > 1 and self.showAuraCount ) then
                        frameCount:SetText(count);
                        frameCount:Show();
                    else
                        frameCount:Hide();
                    end

                    -- Handle cooldowns
                    frameCooldown = _G[frameName.."Cooldown"];
                    local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(self.unit, spellId, caster)
                    if duration == 0 and durationNew then
                        duration = durationNew
                        expirationTime = expirationTimeNew
                    end
                    CooldownFrame_Set(frameCooldown, expirationTime - duration, duration, duration > 0, true);

                    --[[ PORTRAIT AURA ]]
                    if defaults.portraitIcon then
                        local rootSpellID, spellType, prio = LibAuraTypes.GetDebuffInfo(spellId)
                        if prio and prio > maxPrio then
                            maxPrio = prio
                            maxPrioIndex = index
                            maxPrioFilter = "HARMFUL"
                        end
                    end

                    -- set debuff type color
                    if ( debuffType ) then
                        color = DebuffTypeColor[debuffType];
                    else
                        color = DebuffTypeColor["none"];
                    end
                    frameBorder = _G[frameName.."Border"];
                    frameBorder:SetVertexColor(color.r, color.g, color.b);

                    -- set the debuff to be big if the buff is cast by the player or his pet
                    numDebuffs = numDebuffs + 1;
                    largeDebuffList[numDebuffs] = ShouldAuraBeLarge(caster);

                    frame:ClearAllPoints();
                    frame:Show();

                    frameNum = frameNum + 1;
                end
            end
        else
            break;
        end
        index = index + 1;
    end

    for i = frameNum, MAX_TARGET_DEBUFFS do
        local frame = _G[selfName.."Debuff"..i];
        if ( frame ) then
            frame:Hide();
        else
            break;
        end
    end

    self.auraRows = 0;

    local mirrorAurasVertically = false;
    if ( self.buffsOnTop ) then
        mirrorAurasVertically = true;
    end
    local haveTargetofTarget;
    if ( self.totFrame ) then
        haveTargetofTarget = self.totFrame:IsShown();
    end
    self.spellbarAnchor = nil;
    local maxRowWidth;
    -- update buff positions
    maxRowWidth = ( haveTargetofTarget and self.TOT_AURA_ROW_WIDTH ) or AURA_ROW_WIDTH;
    TargetFrame_UpdateAuraPositions(self, selfName.."Buff", numBuffs, numDebuffs, largeBuffList, TargetFrame_UpdateBuffAnchor, maxRowWidth, 3, mirrorAurasVertically);
    -- update debuff positions
    maxRowWidth = ( haveTargetofTarget and self.auraRows < NUM_TOT_AURA_ROWS and self.TOT_AURA_ROW_WIDTH ) or AURA_ROW_WIDTH;
    TargetFrame_UpdateAuraPositions(self, selfName.."Debuff", numDebuffs, numBuffs, largeDebuffList, TargetFrame_UpdateDebuffAnchor, maxRowWidth, 3, mirrorAurasVertically);
    -- update the spell bar position
    if ( self.spellbar ) then
        Target_Spellbar_AdjustPosition(self.spellbar);
    end

    --[[ PORTRAIT AURA ]]
    if defaults.portraitIcon then
        UpdatePortraitIcon(self.unit, maxPrio, maxPrioIndex, maxPrioFilter)
    end
end
