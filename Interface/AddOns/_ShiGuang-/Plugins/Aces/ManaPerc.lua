--[[---------------------------------------------------------------------------
-  ManaPerc: Originally MyACEPercentage by Instant                            -
-----------------------------------------------------------------------------]]
local ManaPerc = LibStub("AceAddon-3.0"):NewAddon("ManaPerc", "AceHook-3.0", "AceConsole-3.0")
local defaults = {current = false, total = true, colour = true,}  --绿色=现有法力值，黃色=总法力值

-- Some local functions/values
local tonumber, math_huge, UnitPower, UnitPowerMax, BreakUpLargeNumbers, SPELL_POWER_MANA = tonumber, math.huge, UnitPower, UnitPowerMax, BreakUpLargeNumbers, SPELL_POWER_MANA
local MANA_COST, MANA_COST_PATTERN = MANA_COST, MANA_COST:gsub("%%s", "([%%d.,]+)")
local MANA_PERC_FORMAT = "%s%.1f%%]"

function ManaPerc:OnEnable()
    self:HookScript(GameTooltip, "OnTooltipSetSpell", "ProcessOnShow")
end

-- Scan the tooltip for the manacost, since Blizzard removed it from
-- GetSpellInfo() in 6.0
local function getCost(tt)
    local text = GameTooltipTextLeft2:GetText()
    if text then
        local costString = text:match(MANA_COST_PATTERN)
        if costString then
            local costNum = costString:gsub("%D", "")
            return tonumber(costNum)
        end
    end
    return nil
end

-- Work out the percentage vs. the players total mana
local function percentOfTotalMana(cost)
    local maxMana = UnitPowerMax('player', SPELL_POWER_MANA)
    local costPercent = cost / (maxMana / 100)
    local preamble = defaults.colour and "|cFFFFFF00[" or "[t:"
    local cost = costPercent ~= math_huge and costPercent or 0
    return MANA_PERC_FORMAT:format(preamble, cost)
end

-- Work out the percentage vs. the players current mana
local function percentOfCurrentMana(cost)
    local currentMana = UnitPower('player', SPELL_POWER_MANA)
    local costPercent = cost / (currentMana / 100)
    local preamble = defaults.colour and "|cFF00FF00[" or "[c:"
    local cost = costPercent ~= math_huge and costPercent or 0
    return MANA_PERC_FORMAT:format(preamble, cost)
end

--[[---------------------------------------------------------------------------
  Main Processing
-----------------------------------------------------------------------------]]
function ManaPerc:ProcessOnShow(tt, ...)
    local name = tt:GetSpell()
    if name then
        local cost = getCost(tt)
        if cost and cost > 0 then
            local dttext, dctext = "", ""
            if defaults.total then dttext = percentOfTotalMana(cost) end
            if defaults.current then dctext = percentOfCurrentMana(cost) end
            GameTooltipTextLeft2:SetText(MANA_COST:format(BreakUpLargeNumbers(cost))..dctext..dttext)
        end
    end
    self.hooks[GameTooltip]["OnTooltipSetSpell"](tt, ...)
end
