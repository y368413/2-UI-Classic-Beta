---------------## Author: mpstark, Justwait ## Version: 1.2
-- LIBEASING --
---------------

local MAJOR, MINOR = "LibEasing-1.0", 1;
local LibEasing = LibStub:NewLibrary(MAJOR, MINOR);

if (not LibEasing) then
    return;
end

LibEasing.frame = LibEasing.frame or CreateFrame("Frame");

-- For all easing functions:
-- t = elapsed time
-- b = begin
-- c = change == ending - beginning
-- d = duration (total time)

local pow = math.pow
local sin = math.sin
local cos = math.cos
local pi = math.pi
local sqrt = math.sqrt
local abs = math.abs
local asin  = math.asin

local function linear(t, b, c, d)
  return c * t / d + b
end

local function inQuad(t, b, c, d)
  t = t / d
  return c * pow(t, 2) + b
end

local function outQuad(t, b, c, d)
  t = t / d
  return -c * t * (t - 2) + b
end

local function inOutQuad(t, b, c, d)
  t = t / d * 2
  if t < 1 then
    return c / 2 * pow(t, 2) + b
  else
    return -c / 2 * ((t - 1) * (t - 3) - 1) + b
  end
end

local function outInQuad(t, b, c, d)
  if t < d / 2 then
    return outQuad (t * 2, b, c / 2, d)
  else
    return inQuad((t * 2) - d, b + c / 2, c / 2, d)
  end
end

local function inCubic(t, b, c, d)
  t = t / d
  return c * pow(t, 3) + b
end

local function outCubic(t, b, c, d)
  t = t / d - 1
  return c * (pow(t, 3) + 1) + b
end

local function inOutCubic(t, b, c, d)
  t = t / d * 2
  if t < 1 then
    return c / 2 * t * t * t + b
  else
    t = t - 2
    return c / 2 * (t * t * t + 2) + b
  end
end

local function outInCubic(t, b, c, d)
  if t < d / 2 then
    return outCubic(t * 2, b, c / 2, d)
  else
    return inCubic((t * 2) - d, b + c / 2, c / 2, d)
  end
end

local function inQuart(t, b, c, d)
  t = t / d
  return c * pow(t, 4) + b
end

local function outQuart(t, b, c, d)
  t = t / d - 1
  return -c * (pow(t, 4) - 1) + b
end

local function inOutQuart(t, b, c, d)
  t = t / d * 2
  if t < 1 then
    return c / 2 * pow(t, 4) + b
  else
    t = t - 2
    return -c / 2 * (pow(t, 4) - 2) + b
  end
end

local function outInQuart(t, b, c, d)
  if t < d / 2 then
    return outQuart(t * 2, b, c / 2, d)
  else
    return inQuart((t * 2) - d, b + c / 2, c / 2, d)
  end
end

local function inQuint(t, b, c, d)
  t = t / d
  return c * pow(t, 5) + b
end

local function outQuint(t, b, c, d)
  t = t / d - 1
  return c * (pow(t, 5) + 1) + b
end

local function inOutQuint(t, b, c, d)
  t = t / d * 2
  if t < 1 then
    return c / 2 * pow(t, 5) + b
  else
    t = t - 2
    return c / 2 * (pow(t, 5) + 2) + b
  end
end

local function outInQuint(t, b, c, d)
  if t < d / 2 then
    return outQuint(t * 2, b, c / 2, d)
  else
    return inQuint((t * 2) - d, b + c / 2, c / 2, d)
  end
end

local function inSine(t, b, c, d)
  return -c * cos(t / d * (pi / 2)) + c + b
end

local function outSine(t, b, c, d)
  return c * sin(t / d * (pi / 2)) + b
end

local function inOutSine(t, b, c, d)
  return -c / 2 * (cos(pi * t / d) - 1) + b
end

local function outInSine(t, b, c, d)
  if t < d / 2 then
    return outSine(t * 2, b, c / 2, d)
  else
    return inSine((t * 2) -d, b + c / 2, c / 2, d)
  end
end

local function inExpo(t, b, c, d)
  if t == 0 then
    return b
  else
    return c * pow(2, 10 * (t / d - 1)) + b - c * 0.001
  end
end

local function outExpo(t, b, c, d)
  if t == d then
    return b + c
  else
    return c * 1.001 * (-pow(2, -10 * t / d) + 1) + b
  end
end

local function inOutExpo(t, b, c, d)
  if t == 0 then return b end
  if t == d then return b + c end
  t = t / d * 2
  if t < 1 then
    return c / 2 * pow(2, 10 * (t - 1)) + b - c * 0.0005
  else
    t = t - 1
    return c / 2 * 1.0005 * (-pow(2, -10 * t) + 2) + b
  end
end

local function outInExpo(t, b, c, d)
  if t < d / 2 then
    return outExpo(t * 2, b, c / 2, d)
  else
    return inExpo((t * 2) - d, b + c / 2, c / 2, d)
  end
end

local function inCirc(t, b, c, d)
  t = t / d
  return(-c * (sqrt(1 - pow(t, 2)) - 1) + b)
end

local function outCirc(t, b, c, d)
  t = t / d - 1
  return(c * sqrt(1 - pow(t, 2)) + b)
end

local function inOutCirc(t, b, c, d)
  t = t / d * 2
  if t < 1 then
    return -c / 2 * (sqrt(1 - t * t) - 1) + b
  else
    t = t - 2
    return c / 2 * (sqrt(1 - t * t) + 1) + b
  end
end

local function outInCirc(t, b, c, d)
  if t < d / 2 then
    return outCirc(t * 2, b, c / 2, d)
  else
    return inCirc((t * 2) - d, b + c / 2, c / 2, d)
  end
end

local function inElastic(t, b, c, d, a, p)
  if t == 0 then return b end

  t = t / d

  if t == 1  then return b + c end

  if not p then p = d * 0.3 end

  local s

  if not a or a < abs(c) then
    a = c
    s = p / 4
  else
    s = p / (2 * pi) * asin(c/a)
  end

  t = t - 1

  return -(a * pow(2, 10 * t) * sin((t * d - s) * (2 * pi) / p)) + b
end

-- a: amplitud
-- p: period
local function outElastic(t, b, c, d, a, p)
  if t == 0 then return b end

  t = t / d

  if t == 1 then return b + c end

  if not p then p = d * 0.3 end

  local s

  if not a or a < abs(c) then
    a = c
    s = p / 4
  else
    s = p / (2 * pi) * asin(c/a)
  end

  return a * pow(2, -10 * t) * sin((t * d - s) * (2 * pi) / p) + c + b
end

-- p = period
-- a = amplitud
local function inOutElastic(t, b, c, d, a, p)
  if t == 0 then return b end

  t = t / d * 2

  if t == 2 then return b + c end

  if not p then p = d * (0.3 * 1.5) end
  if not a then a = 0 end

  local s

  if not a or a < abs(c) then
    a = c
    s = p / 4
  else
    s = p / (2 * pi) * asin(c / a)
  end

  if t < 1 then
    t = t - 1
    return -0.5 * (a * pow(2, 10 * t) * sin((t * d - s) * (2 * pi) / p)) + b
  else
    t = t - 1
    return a * pow(2, -10 * t) * sin((t * d - s) * (2 * pi) / p ) * 0.5 + c + b
  end
end

-- a: amplitud
-- p: period
local function outInElastic(t, b, c, d, a, p)
  if t < d / 2 then
    return outElastic(t * 2, b, c / 2, d, a, p)
  else
    return inElastic((t * 2) - d, b + c / 2, c / 2, d, a, p)
  end
end

local function inBack(t, b, c, d, s)
  if not s then s = 1.70158 end
  t = t / d
  return c * t * t * ((s + 1) * t - s) + b
end

local function outBack(t, b, c, d, s)
  if not s then s = 1.70158 end
  t = t / d - 1
  return c * (t * t * ((s + 1) * t + s) + 1) + b
end

local function inOutBack(t, b, c, d, s)
  if not s then s = 1.70158 end
  s = s * 1.525
  t = t / d * 2
  if t < 1 then
    return c / 2 * (t * t * ((s + 1) * t - s)) + b
  else
    t = t - 2
    return c / 2 * (t * t * ((s + 1) * t + s) + 2) + b
  end
end

local function outInBack(t, b, c, d, s)
  if t < d / 2 then
    return outBack(t * 2, b, c / 2, d, s)
  else
    return inBack((t * 2) - d, b + c / 2, c / 2, d, s)
  end
end

local function outBounce(t, b, c, d)
  t = t / d
  if t < 1 / 2.75 then
    return c * (7.5625 * t * t) + b
  elseif t < 2 / 2.75 then
    t = t - (1.5 / 2.75)
    return c * (7.5625 * t * t + 0.75) + b
  elseif t < 2.5 / 2.75 then
    t = t - (2.25 / 2.75)
    return c * (7.5625 * t * t + 0.9375) + b
  else
    t = t - (2.625 / 2.75)
    return c * (7.5625 * t * t + 0.984375) + b
  end
end

local function inBounce(t, b, c, d)
  return c - outBounce(d - t, 0, c, d) + b
end

local function inOutBounce(t, b, c, d)
  if t < d / 2 then
    return inBounce(t * 2, 0, c, d) * 0.5 + b
  else
    return outBounce(t * 2 - d, 0, c, d) * 0.5 + c * .5 + b
  end
end

local function outInBounce(t, b, c, d)
  if t < d / 2 then
    return outBounce(t * 2, b, c / 2, d)
  else
    return inBounce((t * 2) - d, b + c / 2, c / 2, d)
  end
end

-- expose the functions into the library
LibEasing.Linear = linear;
LibEasing.InQuad = inQuad;
LibEasing.OutQuad = outQuad;
LibEasing.InOutQuad = inOutQuad;
LibEasing.OutInQuad = outInQuad;
LibEasing.InCubic  = inCubic;
LibEasing.OutCubic = outCubic;
LibEasing.InOutCubic = inOutCubic;
LibEasing.OutInCubic = outInCubic;
LibEasing.InQuart = inQuart;
LibEasing.OutQuart = outQuart;
LibEasing.InOutQuart = inOutQuart;
LibEasing.OutInQuart = outInQuart;
LibEasing.InQuint = inQuint;
LibEasing.OutQuint = outQuint;
LibEasing.InOutQuint = inOutQuint;
LibEasing.OutInQuint = outInQuint;
LibEasing.InSine = inSine;
LibEasing.OutSine = outSine;
LibEasing.InOutSine = inOutSine;
LibEasing.OutInSine = outInSine;
LibEasing.InExpo = inExpo;
LibEasing.OutExpo = outExpo;
LibEasing.InOutExpo = inOutExpo;
LibEasing.OutInExpo = outInExpo;
LibEasing.InCirc = inCirc;
LibEasing.OutCirc = outCirc;
LibEasing.InOutCirc = inOutCirc;
LibEasing.OutInCirc = outInCirc;
LibEasing.InElastic = inElastic;
LibEasing.OutElastic = outElastic;
LibEasing.InOutElastic = inOutElastic;
LibEasing.OutInElastic = outInElastic;
LibEasing.InBack = inBack;
LibEasing.OutBack = outBack;
LibEasing.InOutBack = inOutBack;
LibEasing.OutInBack = outInBack;
LibEasing.InBounce = inBounce;
LibEasing.OutBounce = outBounce;
LibEasing.InOutBounce = inOutBounce;
LibEasing.OutInBounce = outInBounce;


--------------
-- ONUPDATE --
--------------
local onUpdateFunc = {};
local lastUpdate;
local MAX_UPDATE_TIME = 1.0/120.0;
local function FrameOnUpdate(self, time)
    if (not lastUpdate or (lastUpdate + MAX_UPDATE_TIME) < GetTime()) then
        for k,func in pairs(onUpdateFunc) do
            -- run the function, if it returns nil, remove it
            if (func() == nil) then
                onUpdateFunc[k] = nil;
            end
        end

        lastUpdate = GetTime();
    end

    -- remove onupdate if there isn't anything to check
    if (next(onUpdateFunc) == nil) then
        LibEasing.frame:SetScript("OnUpdate", nil);
    end
end

local function SetupOnUpdate()
    -- if we have checks to do and there isn't an OnUpdate on the frame, set it up
    if (next(onUpdateFunc) ~= nil and LibEasing.frame:GetScript("OnUpdate") == nil) then
        LibEasing.frame:SetScript("OnUpdate", FrameOnUpdate);

        -- force the next update to happen on the NEXT frame
        lastUpdate = GetTime();
    end
end

local function RegisterOnUpdateFunc(func)
    -- add to the list
    onUpdateFunc[func] = func;

    -- make sure that an OnUpdate script is on our frame
    SetupOnUpdate();
end

local function CancelOnUpdateFunc(func)
    if (onUpdateFunc[func]) then
        -- remove from the list
        onUpdateFunc[func] = nil;
    end
end


------------------------
-- EASING CONVIENENCE --
------------------------
local handleCounter = 1;
local currentlyEasing = {};
function LibEasing:Ease(func, beginValue, endValue, duration, easingFunc, callback)
    -- assume inOutQuad if not provided
    if (not easingFunc) then
        easingFunc = inOutQuad;
    end

    -- get a handle
    local handle = handleCounter;
    handleCounter = handleCounter + 1;

    local change = endValue - beginValue;
    local beginTime = GetTime();

    local closure = function()
        local currentTime = GetTime();

        if (beginTime + duration > currentTime) then
            func(easingFunc(currentTime - beginTime, beginValue, change, duration));
            return true;
        else
            func(endValue);
            currentlyEasing[handle] = nil;

            -- call the callback if provided
            if (callback) then callback() end;

            return nil;
        end
    end

    -- register OnUpdate, to call every frame until done
    RegisterOnUpdateFunc(closure);
    currentlyEasing[handle] = closure;
    return handle;
end

function LibEasing:StopEasing(handle)
    -- need to cancel easing this particular handle
    if (handle and currentlyEasing[handle]) then
        CancelOnUpdateFunc(currentlyEasing[handle]);
        currentlyEasing[handle] = nil;
        return true;
    end

    return false;
end


---------------
-- LIBRARIES --
---------------
local AceAddon = LibStub("AceAddon-3.0");
local LibEasing = LibStub("LibEasing-1.0");
local SharedMedia = LibStub("LibSharedMedia-3.0");

NameplateSCT = AceAddon:NewAddon("NameplateSCT", "AceConsole-3.0", "AceEvent-3.0");
NameplateSCT.frame = CreateFrame("Frame", nil, UIParent);


------------
-- LOCALS --
------------
local _;
local animating = {};

local playerGUID;
local unitToGuid = {};
local guidToUnit = {};

local targetFrames = {};
for level = 1, 3 do
    targetFrames[level] = CreateFrame("Frame", nil, UIParent);
end

local offTargetFrames = {};
for level = 1, 3 do
    offTargetFrames[level] = CreateFrame("Frame", nil, UIParent);
end


--------
-- DB --
--------
local defaultFont = "Friz Quadrata TT";
if (SharedMedia:IsValid("font", "Bazooka")) then
    defaultFont = "Bazooka";
end

local defaults = {
    global = {
        enabled = true,
        xOffset = 0,
        yOffset = 0,
        xOffsetPersonal = 0,
        yOffsetPersonal = -100,

        font = defaultFont,
        fontFlag = "OUTLINE",
        fontShadow = false,
        damageColor = true,
        defaultColor = "ffff00",

        truncate = true,
        truncateLetter = true,
        commaSeperate = true,

        sizing = {
            crits = true,
            critsScale = 1.5,

            miss = false,
            missScale = 1.5,

            smallHits = true,
            smallHitsScale = 0.66,
            smallHitsHide = false,
            autoattackcritsizing = true,
        },

        animations = {
            ability = "fountain",
            crit = "verticalUp",
            miss = "verticalUp",
            autoattack = "fountain",
            autoattackcrit = "verticalUp",
        },

        animationsPersonal = {
            normal = "rainfall",
            crit = "verticalUp",
            miss = "verticalUp",
        },

        formatting = {
            size = 20,
            icon = "right",
            alpha = 1,
        },

        useOffTarget = true,
        offTargetFormatting = {
            size = 15,
            icon = "right",
            alpha = 0.5,
        },
    },
};


---------------------
-- LOCAL CONSTANTS --
---------------------
local SMALL_HIT_EXPIRY_WINDOW = 30;
local SMALL_HIT_MULTIPIER = 0.5;

local ANIMATION_VERTICAL_DISTANCE = 75;

local ANIMATION_ARC_X_MIN = 50;
local ANIMATION_ARC_X_MAX = 150;
local ANIMATION_ARC_Y_TOP_MIN = 10;
local ANIMATION_ARC_Y_TOP_MAX = 50;
local ANIMATION_ARC_Y_BOTTOM_MIN = 10;
local ANIMATION_ARC_Y_BOTTOM_MAX = 50;

-- local ANIMATION_SHAKE_DEFLECTION = 15;
-- local ANIMATION_SHAKE_NUM_SHAKES = 4;

local ANIMATION_RAINFALL_X_MAX = 75;
local ANIMATION_RAINFALL_Y_MIN = 50;
local ANIMATION_RAINFALL_Y_MAX = 100;
local ANIMATION_RAINFALL_Y_START_MIN = 5
local ANIMATION_RAINFALL_Y_START_MAX = 15;

local ANIMATION_LENGTH = 1;

local DAMAGE_TYPE_COLORS = {
    [SCHOOL_MASK_PHYSICAL] = "FFFF00",
    [SCHOOL_MASK_HOLY] = "FFE680",
    [SCHOOL_MASK_FIRE] = "FF8000",
    [SCHOOL_MASK_NATURE] = "4DFF4D",
    [SCHOOL_MASK_FROST] = "80FFFF",
    [SCHOOL_MASK_SHADOW] = "8080FF",
    [SCHOOL_MASK_ARCANE] = "FF80FF",
	[SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW] = "A330C9", -- Chromatic
	[SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW + SCHOOL_MASK_HOLY] = "A330C9", -- Magic
	[SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW + SCHOOL_MASK_HOLY] = "A330C9", -- Chaos
	["melee"] = "FFFFFF",
	["pet"] = "CC8400"
};

local MISS_EVENT_STRINGS = {
    ["ABSORB"] = "Absorbed",
    ["BLOCK"] = "Blocked",
    ["DEFLECT"] = "Deflected",
    ["DODGE"] = "Dodged",
    ["EVADE"] = "Evaded",
    ["IMMUNE"] = "Immune",
    ["MISS"] = "Missed",
    ["PARRY"] = "Parried",
    ["REFLECT"] = "Reflected",
    ["RESIST"] = "Resisted",
};

local FRAME_LEVEL_OVERLAY = 3;
local FRAME_LEVEL_ABOVE = 2;
local FRAME_LEVEL_BELOW = 1;


----------------
-- FONTSTRING --
----------------
local function getFontPath(fontName)
    local fontPath = SharedMedia:Fetch("font", fontName);

    if (fontPath == nil) then
        fontPath = "Fonts\\FRIZQT__.TTF";
    end

    return fontPath;
end

local fontStringCache = {};
local function getFontString()
    local fontString;

    if (next(fontStringCache)) then
        fontString = table.remove(fontStringCache);
    else
        fontString = NameplateSCT.frame:CreateFontString();
    end

    fontString:SetParent(NameplateSCT.frame);
    fontString:SetFont(getFontPath(NameplateSCT.db.global.font), 15, NameplateSCT.db.global.fontFlag);
    if NameplateSCT.db.global.textShadow then fontString:SetShadowOffset(1,-1) end
    fontString:SetAlpha(1);
    fontString:SetDrawLayer("OVERLAY");
    fontString:SetText("");
    fontString:Show();

    return fontString;
end

local function recycleFontString(fontString)
    fontString:SetAlpha(0);
    fontString:Hide();

    animating[fontString] = nil;

    fontString.distance = nil;
    fontString.arcTop = nil;
    fontString.arcBottom = nil;
    fontString.arcXDist = nil;
    fontString.deflection = nil;
    fontString.numShakes = nil;
    fontString.animation = nil;
    fontString.animatingDuration = nil;
    fontString.animatingStartTime = nil;
    fontString.anchorFrame = nil;

    fontString.unit = nil;
    fontString.guid = nil;

    fontString.pow = nil;
    fontString.startHeight = nil;
    fontString.NSCTFontSize = nil;
    fontString:SetFont(getFontPath(NameplateSCT.db.global.font), 15, NameplateSCT.db.global.fontFlag);
    if NameplateSCT.db.global.textShadow then fontString:SetShadowOffset(1,-1) end
    fontString:SetParent(NameplateSCT.frame);
	fontString:ClearAllPoints();

    table.insert(fontStringCache, fontString);
end


----------------
-- NAMEPLATES --
----------------

local function setNameplateFrameLevels()
    for _, frame in pairs(targetFrames) do
        frame:SetFrameStrata("LOW");
    end
    targetFrames[FRAME_LEVEL_OVERLAY]:SetFrameLevel(1001);
    targetFrames[FRAME_LEVEL_ABOVE]:SetFrameLevel(1000);
    targetFrames[FRAME_LEVEL_BELOW]:SetFrameLevel(999);

    for _, frame in pairs(offTargetFrames) do
        frame:SetFrameStrata("LOW");
    end
    offTargetFrames[FRAME_LEVEL_OVERLAY]:SetFrameLevel(901);
    offTargetFrames[FRAME_LEVEL_ABOVE]:SetFrameLevel(900);
    offTargetFrames[FRAME_LEVEL_BELOW]:SetFrameLevel(899);
end

----------
-- CORE --
----------
function NameplateSCT:OnInitialize()
    -- setup db
    self.db = LibStub("AceDB-3.0"):New("NameplateSCTDB", defaults, true);

    -- setup chat commands
    self:RegisterChatCommand("nsct", "OpenMenu");

    -- setup menu
    self:RegisterMenu();

    setNameplateFrameLevels();

    -- if the addon is turned off in db, turn it off
    if (self.db.global.enabled == false) then
        self:Disable();
    end
end

function NameplateSCT:OnEnable()
    playerGUID = UnitGUID("player");

    self:RegisterEvent("NAME_PLATE_UNIT_ADDED");
    self:RegisterEvent("NAME_PLATE_UNIT_REMOVED");
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");

    self.db.global.enabled = true;
end

function NameplateSCT:OnDisable()
    self:UnregisterAllEvents();

    for fontString, _ in pairs(animating) do
        recycleFontString(fontString);
    end

    self.db.global.enabled = false;
end


---------------
-- ANIMATION --
---------------
local function verticalPath(elapsed, duration, distance)
    return 0, LibEasing.InQuad(elapsed, 0, distance, duration);
end

local function arcPath(elapsed, duration, xDist, yStart, yTop, yBottom)
    local x, y;
    local progress = elapsed/duration;

    x = progress * xDist;

    -- progress 0 to 1
    -- at progress 0, y = yStart
    -- at progress 0.5 y = yTop
    -- at progress 1 y = yBottom

    -- -0.25a + .5b + yStart = yTop
    -- -a + b + yStart = yBottom

    -- -0.25a + .5b + yStart = yTop
    -- .5b + yStart - yTop = 0.25a
    -- 2b + 4yStart - 4yTop = a

    -- -(2b + 4yStart - 4yTop) + b + yStart = yBottom
    -- -2b - 4yStart + 4yTop + b + yStart = yBottom
    -- -b - 3yStart + 4yTop = yBottom

    -- -3yStart + 4yTop - yBottom = b

    -- 2(-3yStart + 4yTop - yBottom) + 4yStart - 4yTop = a
    -- -6yStart + 8yTop - 2yBottom + 4yStart - 4yTop = a
    -- -2yStart + 4yTop - 2yBottom = a

    -- -3yStart + 4yTop - yBottom = b
    -- -2yStart + 4yTop - 2yBottom = a

    local a = -2 * yStart + 4 * yTop - 2 * yBottom;
    local b = -3 * yStart + 4 * yTop - yBottom;

    y = -a * math.pow(progress, 2) + b * progress + yStart;

    return x, y;
end

local function powSizing(elapsed, duration, start, middle, finish)
    local size = finish;
    if (elapsed < duration) then
        if (elapsed/duration < 0.5) then
            size = LibEasing.OutQuint(elapsed, start, middle - start, duration/2);
        else
            size = LibEasing.InQuint(elapsed - elapsed/2, middle, finish - middle, duration/2);
        end
    end
    return size;
end

local function AnimationOnUpdate()
    if (next(animating)) then
        -- setNameplateFrameLevels();

        for fontString, _ in pairs(animating) do
            local elapsed = GetTime() - fontString.animatingStartTime;
            if (elapsed > fontString.animatingDuration) then
                -- the animation is over
                recycleFontString(fontString);
            else
                local isTarget = false
                if fontString.unit then
                  isTarget = UnitIsUnit(fontString.unit, "target");
                else
                  fontString.unit = "player"
                end
                -- frame level
                if (fontString.frameLevel) then
                    if (isTarget) then
                        if (fontString:GetParent() ~= targetFrames[fontString.frameLevel]) then
                            fontString:SetParent(targetFrames[fontString.frameLevel])
                        end
                    else
                        if (fontString:GetParent() ~= offTargetFrames[fontString.frameLevel]) then
                            fontString:SetParent(offTargetFrames[fontString.frameLevel])
                        end
                    end
                end

                -- alpha
                local startAlpha = NameplateSCT.db.global.formatting.alpha;
                if (NameplateSCT.db.global.useOffTarget and not isTarget and fontString.unit ~= "player") then
                    startAlpha = NameplateSCT.db.global.offTargetFormatting.alpha;
                end

                local alpha = LibEasing.InExpo(elapsed, startAlpha, -startAlpha, fontString.animatingDuration);
                fontString:SetAlpha(alpha);

                -- sizing
                if (fontString.pow) then
                    if (elapsed < fontString.animatingDuration/6) then
                        fontString:SetText(fontString.NSCTTextWithoutIcons);

                        local size = powSizing(elapsed, fontString.animatingDuration/6, fontString.startHeight/2, fontString.startHeight*2, fontString.startHeight);
                        fontString:SetTextHeight(size);
                    else
                        fontString.pow = nil;
                        fontString:SetTextHeight(fontString.startHeight);
                        fontString:SetFont(getFontPath(NameplateSCT.db.global.font), fontString.NSCTFontSize, NameplateSCT.db.global.fontFlag);
                        if NameplateSCT.db.global.textShadow then fontString:SetShadowOffset(1,-1) end
                        fontString:SetText(fontString.NSCTText);
                    end
                end

                -- position
                local xOffset, yOffset = 0, 0;
                if (fontString.animation == "verticalUp") then
                    xOffset, yOffset = verticalPath(elapsed, fontString.animatingDuration, fontString.distance);
                elseif (fontString.animation == "verticalDown") then
                    xOffset, yOffset = verticalPath(elapsed, fontString.animatingDuration, -fontString.distance);
                elseif (fontString.animation == "fountain") then
                    xOffset, yOffset = arcPath(elapsed, fontString.animatingDuration, fontString.arcXDist, 0, fontString.arcTop, fontString.arcBottom);
                elseif (fontString.animation == "rainfall") then
                    _, yOffset = verticalPath(elapsed, fontString.animatingDuration, -fontString.distance);
                    xOffset = fontString.rainfallX;
                    yOffset = yOffset + fontString.rainfallStartY;
                -- elseif (fontString.animation == "shake") then
                    -- TODO
                end

                if (not UnitIsDead(fontString.unit) and fontString.anchorFrame and fontString.anchorFrame:IsShown()) then
                    if fontString.unit == "player" then -- player frame
                      fontString:SetPoint("CENTER", fontString.anchorFrame, "CENTER", NameplateSCT.db.global.xOffsetPersonal + xOffset, NameplateSCT.db.global.yOffsetPersonal + yOffset); -- Only allows for adjusting vertical offset
                    else -- nameplate frames
                      fontString:SetPoint("CENTER", fontString.anchorFrame, "CENTER", NameplateSCT.db.global.xOffset + xOffset, NameplateSCT.db.global.yOffset + yOffset);
                    end
				else
                    recycleFontString(fontString);
                end
            end
        end
    else
        -- nothing in the animation list, so just kill the onupdate
        NameplateSCT.frame:SetScript("OnUpdate", nil);
    end
end

-- NameplateSCT.AnimationOnUpdate = AnimationOnUpdate;

local arcDirection = 1;
function NameplateSCT:Animate(fontString, anchorFrame, duration, animation)
    animation = animation or "verticalUp";

    fontString.animation = animation;
    fontString.animatingDuration = duration;
    fontString.animatingStartTime = GetTime();
    fontString.anchorFrame = anchorFrame == player and UIParent or anchorFrame;

    if (animation == "verticalUp") then
        fontString.distance = ANIMATION_VERTICAL_DISTANCE;
    elseif (animation == "verticalDown") then
        fontString.distance = ANIMATION_VERTICAL_DISTANCE;
    elseif (animation == "fountain") then
        fontString.arcTop = math.random(ANIMATION_ARC_Y_TOP_MIN, ANIMATION_ARC_Y_TOP_MAX);
        fontString.arcBottom = -math.random(ANIMATION_ARC_Y_BOTTOM_MIN, ANIMATION_ARC_Y_BOTTOM_MAX);
        fontString.arcXDist = arcDirection * math.random(ANIMATION_ARC_X_MIN, ANIMATION_ARC_X_MAX);

        arcDirection = arcDirection * -1;
    elseif (animation == "rainfall") then
        fontString.distance = math.random(ANIMATION_RAINFALL_Y_MIN, ANIMATION_RAINFALL_Y_MAX);
        fontString.rainfallX = math.random(-ANIMATION_RAINFALL_X_MAX, ANIMATION_RAINFALL_X_MAX);
        fontString.rainfallStartY = -math.random(ANIMATION_RAINFALL_Y_START_MIN, ANIMATION_RAINFALL_Y_START_MAX);
    -- elseif (animation == "shake") then
    --     fontString.deflection = ANIMATION_SHAKE_DEFLECTION;
    --     fontString.numShakes = ANIMATION_SHAKE_NUM_SHAKES;
    end

    animating[fontString] = true;

    -- start onupdate if it's not already running
    if (NameplateSCT.frame:GetScript("OnUpdate") == nil) then
        NameplateSCT.frame:SetScript("OnUpdate", AnimationOnUpdate);
    end
end


------------
-- EVENTS --
------------

function NameplateSCT:NAME_PLATE_UNIT_ADDED(event, unitID)
    local guid = UnitGUID(unitID);

    unitToGuid[unitID] = guid;
    guidToUnit[guid] = unitID;
end

function NameplateSCT:NAME_PLATE_UNIT_REMOVED(event, unitID)
    local guid = unitToGuid[unitID];

    unitToGuid[unitID] = nil;
    guidToUnit[guid] = nil;

	-- clear any fontStrings attachedk to this unit
	for fontString, _ in pairs(animating) do
		if fontString.unit == unitID then
			recycleFontString(fontString);
		end
    end
end

function NameplateSCT:CombatFilter(_, clue, _, sourceGUID, _, sourceFlags, _, destGUID, _, _, _, ...)
	if playerGUID == sourceGUID or (NameplateSCT.db.global.personal and playerGUID == destGUID) then -- Player events
		local destUnit = guidToUnit[destGUID];
		if (destUnit) or (destGUID == playerGUID and NameplateSCT.db.global.personal) then
			if (string.find(clue, "_DAMAGE")) then
				local spellID, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand;
				if (string.find(clue, "SWING")) then
					spellName, amount, overkill, school_ignore, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = "melee", ...;
				elseif (string.find(clue, "ENVIRONMENTAL")) then
					spellName, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing = ...;
				else
					spellID, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = ...;
				end
				self:DamageEvent(destGUID, nil, amount, school, critical, spellName);
			elseif(string.find(clue, "_MISSED")) then
				local spellID, spellName, spellSchool, missType, isOffHand, amountMissed;

				if (string.find(clue, "SWING")) then
					if destGUID == playerGUID then
					  missType, isOffHand, amountMissed = ...;
					else
					  missType, isOffHand, amountMissed = "melee", ...;
					end
				else
					spellID, spellName, spellSchool, missType, isOffHand, amountMissed = ...;
				end
				self:MissEvent(destGUID, nil, missType);
			end
		end
	elseif (bit.band(sourceFlags, COMBATLOG_OBJECT_TYPE_GUARDIAN) > 0 or bit.band(sourceFlags, COMBATLOG_OBJECT_TYPE_PET) > 0)	and bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then -- Pet/Guardian events
		local destUnit = guidToUnit[destGUID];
		if (destUnit) or (destGUID == playerGUID and NameplateSCT.db.global.personal) then
			if (string.find(clue, "_DAMAGE")) then
				local spellID, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand;
				if (string.find(clue, "SWING")) then
					spellName, amount, overkill, school_ignore, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = "pet", ...;
				elseif (string.find(clue, "ENVIRONMENTAL")) then
					spellName, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing = ...;
				else
					spellID, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = ...;
				end
				self:DamageEvent(destGUID, nil, amount, "pet", critical, spellName);
			-- elseif(string.find(clue, "_MISSED")) then -- Don't show pet MISS events for now.
				-- local spellID, spellName, spellSchool, missType, isOffHand, amountMissed;

				-- if (string.find(clue, "SWING")) then
					-- if destGUID == playerGUID then
					  -- missType, isOffHand, amountMissed = ...;
					-- else
					  -- missType, isOffHand, amountMissed = "pet", ...;
					-- end
				-- else
					-- spellID, spellName, spellSchool, missType, isOffHand, amountMissed = ...;
				-- end
				-- self:MissEvent(destGUID, spellID, missType);
			end
		end
	end
end

function NameplateSCT:COMBAT_LOG_EVENT_UNFILTERED ()
	return NameplateSCT:CombatFilter(CombatLogGetCurrentEventInfo())
end

-------------
-- DISPLAY --
-------------
local function commaSeperate(number)
    -- https://stackoverflow.com/questions/10989788/lua-format-integer
    local _, _, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)');
    int = int:reverse():gsub("(%d%d%d)", "%1,");
    return minus..int:reverse():gsub("^,", "")..fraction;
end

local numDamageEvents = 0;
local lastDamageEventTime;
local runningAverageDamageEvents = 0;
function NameplateSCT:DamageEvent(guid, spellID, amount, school, crit, spellName)
    local text, textWithoutIcons, animation, pow, size, icon, alpha;
    local frameLevel = FRAME_LEVEL_ABOVE;
    local autoattack = not spellID;

    -- select an animation
    if (autoattack and crit) then
        frameLevel = FRAME_LEVEL_OVERLAY;
        animation = guid ~= playerGUID and self.db.global.animations.autoattackcrit or self.db.global.animationsPersonal.crit;
        pow = true;
    elseif (autoattack) then
        animation = guid ~= playerGUID and self.db.global.animations.autoattack or self.db.global.animationsPersonal.normal;
        pow = false;
    elseif (crit) then
        frameLevel = FRAME_LEVEL_OVERLAY;
        animation = guid ~= playerGUID and self.db.global.animations.crit or self.db.global.animationsPersonal.crit;
        pow = true;
    elseif (not autoattack and not crit) then
        animation = guid ~= playerGUID and self.db.global.animations.ability or self.db.global.animationsPersonal.normal;
        pow = false;
    end

    -- skip if this damage event is disabled
    if (animation == "disabled") then
        return;
    end;

    local unit = guidToUnit[guid];
    local isTarget = unit and UnitIsUnit(unit, "target");

    if (self.db.global.useOffTarget and not isTarget and playerGUID ~= guid) then
        size = self.db.global.offTargetFormatting.size;
        icon = self.db.global.offTargetFormatting.icon;
        alpha = self.db.global.offTargetFormatting.alpha;
    else
        size = self.db.global.formatting.size;
        icon = self.db.global.formatting.icon;
        alpha = self.db.global.formatting.alpha;
    end

    if (icon ~= "only") then
        -- truncate
        if (self.db.global.truncate and amount >= 1000000 and self.db.global.truncateLetter) then
            text = string.format("%.1fM", amount / 1000000);
		elseif (self.db.global.truncate and amount >= 10000) then
            text = string.format("%.0f", amount / 1000);

            if (self.db.global.truncateLetter) then
                text = text.."k";
            end
        elseif (self.db.global.truncate and amount >= 1000) then
            text = string.format("%.1f", amount / 1000);

            if (self.db.global.truncateLetter) then
                text = text.."k";
            end
        else
            if (self.db.global.commaSeperate) then
                text = commaSeperate(amount);
            else
                text = tostring(amount);
            end
        end

        -- color text
        if self.db.global.damageColor and school and DAMAGE_TYPE_COLORS[school] then
            text = "|Cff"..DAMAGE_TYPE_COLORS[school]..text.."|r";
        elseif self.db.global.damageColor and spellName == "melee" and DAMAGE_TYPE_COLORS[spellName] then
            text = "|Cff"..DAMAGE_TYPE_COLORS[spellName]..text.."|r";
		else
            text = "|Cff"..self.db.global.defaultColor..text.."|r";
        end

        -- add icons
        textWithoutIcons = text;
        if (icon ~= "none" and spellID and GetSpellTexture(spellID)) then
			local iconText = "|T"..GetSpellTexture(spellID)..":0|t";

			if (icon == "both") then
				text = iconText..text..iconText;
			elseif (icon == "left") then
				text = iconText..text;
			elseif (icon == "right") then
				text = text..iconText;
			end
        end
    else
        -- showing only icons
        if (not spellID) then
            return;
        end

        text = "|T"..GetSpellTexture(spellID)..":0|t";
        textWithoutIcons = text; -- since the icon is by itself, the fontString won't have the strange scaling bug
    end

    -- shrink small hits
    if (self.db.global.sizing.smallHits or self.db.global.sizing.smallHitsHide) and playerGUID ~= guid then
        if (not lastDamageEventTime or (lastDamageEventTime + SMALL_HIT_EXPIRY_WINDOW < GetTime())) then
            numDamageEvents = 0;
            runningAverageDamageEvents = 0;
        end

        runningAverageDamageEvents = ((runningAverageDamageEvents*numDamageEvents) + amount)/(numDamageEvents + 1);
        numDamageEvents = numDamageEvents + 1;
        lastDamageEventTime = GetTime();

        if ((not crit and amount < SMALL_HIT_MULTIPIER*runningAverageDamageEvents)
            or (crit and amount/2 < SMALL_HIT_MULTIPIER*runningAverageDamageEvents)) then
            if (self.db.global.sizing.smallHitsHide) then
                -- skip this damage event, it's too small
                return;
            else
                size = size * self.db.global.sizing.smallHitsScale;
            end
        end
    end

    -- embiggen crit's size
    if (self.db.global.sizing.crits and crit) and playerGUID ~= guid then
        if (autoattack and not self.db.global.sizing.autoattackcritsizing) then
            -- don't embiggen autoattacks
            pow = false;
        else
            size = size * self.db.global.sizing.critsScale;
        end
    end

    -- make sure that size is larger than 5
    if (size < 5) then
        size = 5;
    end
    self:DisplayText(guid, text, textWithoutIcons, size, animation, frameLevel, pow);
end

function NameplateSCT:MissEvent(guid, spellID, missType)
    local text, animation, pow, size, icon, alpha;
    local unit = guidToUnit[guid];
    local isTarget = unit and UnitIsUnit(unit, "target");

    if (self.db.global.useOffTarget and not isTarget and playerGUID ~= guid) then
        size = self.db.global.offTargetFormatting.size;
        icon = self.db.global.offTargetFormatting.icon;
        alpha = self.db.global.offTargetFormatting.alpha;
    else
        size = self.db.global.formatting.size;
        icon = self.db.global.formatting.icon;
        alpha = self.db.global.formatting.alpha;
    end

    -- embiggen miss size
    if self.db.global.sizing.miss and playerGUID ~= guid then
        size = size * self.db.global.sizing.missScale;
    end

    if (icon == "only") then
        return;
    end

    animation = playerGUID ~= guid and self.db.global.animations.miss or self.db.global.animationsPersonal.miss;
    pow = true;

    text = MISS_EVENT_STRINGS[missType] or "Missed";
    text = "|Cff"..self.db.global.defaultColor..text.."|r";

    -- add icons
    local textWithoutIcons = text;
    if (icon ~= "none" and spellID) then
        local iconText = "|T"..GetSpellTexture(spellID)..":0|t";

        if (icon == "both") then
            text = iconText..text..iconText;
        elseif (icon == "left") then
            text = iconText..text;
        elseif (icon == "right") then
            text = text..iconText;
        end
    end

    self:DisplayText(guid, text, textWithoutIcons, size, animation, FRAME_LEVEL_ABOVE, pow)
end

function NameplateSCT:DisplayText(guid, text, textWithoutIcons, size, animation, frameLevel, pow)
    local fontString;
    local unit = guidToUnit[guid];
    local nameplate;

    if (unit) then
        nameplate = C_NamePlate.GetNamePlateForUnit(unit);
    end

    -- if there isn't an anchor frame, make sure that there is a guidNameplatePosition cache entry
    if playerGUID == guid and not unit then
          nameplate = player
    elseif (not nameplate) then
        return;
    end

    fontString = getFontString();

    fontString.NSCTText = text;
    fontString.NSCTTextWithoutIcons = textWithoutIcons;
    fontString:SetText(fontString.NSCTText);

    fontString.NSCTFontSize = size;
    fontString:SetFont(getFontPath(NameplateSCT.db.global.font), fontString.NSCTFontSize, NameplateSCT.db.global.fontFlag);
    if NameplateSCT.db.global.textShadow then fontString:SetShadowOffset(1,-1) end
    fontString.startHeight = fontString:GetStringHeight();
    fontString.pow = pow;
    fontString.frameLevel = frameLevel;

    if (fontString.startHeight <= 0) then
        fontString.startHeight = 5;
    end

    fontString.unit = unit;
    fontString.guid = guid;

    -- if there is no nameplate,
    self:Animate(fontString, nameplate, ANIMATION_LENGTH, animation);
end


-------------
-- OPTIONS --
-------------
local function rgbToHex(r, g, b)
    return string.format("%02x%02x%02x", math.floor(255 * r), math.floor(255 * g), math.floor(255 * b));
end

local function hexToRGB(hex)
    return tonumber(hex:sub(1,2), 16)/255, tonumber(hex:sub(3,4), 16)/255, tonumber(hex:sub(5,6), 16)/255, 1;
end

local iconValues = {
    ["none"] = "No Icons",
    ["left"] = "Left Side",
    ["right"] = "Right Side",
    ["both"] = "Both Sides",
    ["only"] = "Icons Only (No Text)",
};

local animationValues = {
    -- ["shake"] = "Shake",
    ["verticalUp"] = "Vertical Up",
    ["verticalDown"] = "Vertical Down",
    ["fountain"] = "Fountain",
    ["rainfall"] = "Rainfall",
    ["disabled"] = "Disabled",
};

local fontFlags = {
    [""] = "None",
    ["OUTLINE"] = "Outline",
    ["THICKOUTLINE"] = "Thick Outline",
    ["nil, MONOCHROME"] = "Monochrome",
    ["OUTLINE , MONOCHROME"] = "Monochrome Outline",
    ["THICKOUTLINE , MONOCHROME"] = "Monochrome Thick Outline",
};

local menu = {
    name = "NameplateSCT",
    handler = NameplateSCT,
    type = 'group',
    args = {
        enable = {
            type = 'toggle',
            name = "Enable",
            desc = "If the addon is enabled.",
            get = "IsEnabled",
            set = function(_, newValue) if (not newValue) then NameplateSCT:Disable(); else NameplateSCT:Enable(); end end,
            order = 1,
            width = "half",
        },

        disableBlizzardFCT = {
            type = 'toggle',
            name = "Blizzard FCT (Game > Combat > Show Target Damage)",
            get = function(_, newValue) return GetCVar("floatingCombatTextCombatDamage") == "1" end,
            set = function(_, newValue)
                if (newValue) then
                    SetCVar("floatingCombatTextCombatDamage", 1);
                else
                    SetCVar("floatingCombatTextCombatDamage", 0);
                end
            end,
            order = 3,
			disabled = true,
            width = "double",
        },

        personalNameplate = {
            type = 'toggle',
            name = "Personal SCT",
            desc = "Also show numbers when you take damage on your personal nameplate or center screen",
			get = function() return NameplateSCT.db.global.personal; end,
			set = function(_, newValue) NameplateSCT.db.global.personal = newValue; end,
            order = 2,
            disabled = function() return not NameplateSCT.db.global.enabled; end;
        },

        animations = {
            type = 'group',
            name = "Animations",
            order = 30,
            inline = true,
            disabled = function() return not NameplateSCT.db.global.enabled; end;
            args = {
                ability = {
                    type = 'select',
                    name = "Abilities",
                    desc = "",
                    get = function() return NameplateSCT.db.global.animations.ability; end,
                    set = function(_, newValue) NameplateSCT.db.global.animations.ability = newValue; end,
                    values = animationValues,
                    order = 1,
                },
                crit = {
                    type = 'select',
                    name = "Criticals",
                    desc = "",
                    get = function() return NameplateSCT.db.global.animations.crit; end,
                    set = function(_, newValue) NameplateSCT.db.global.animations.crit = newValue; end,
                    values = animationValues,
                    order = 2,
                },
                miss = {
                    type = 'select',
                    name = "Miss/Parry/Dodge/etc",
                    desc = "",
                    get = function() return NameplateSCT.db.global.animations.miss; end,
                    set = function(_, newValue) NameplateSCT.db.global.animations.miss = newValue; end,
                    values = animationValues,
                    order = 3,
                },
                autoattack = {
                    type = 'select',
                    name = "Auto Attacks",
                    desc = "",
                    get = function() return NameplateSCT.db.global.animations.autoattack; end,
                    set = function(_, newValue) NameplateSCT.db.global.animations.autoattack = newValue; end,
                    values = animationValues,
                    order = 4,
                },
                autoattackcrit = {
                    type = 'select',
                    name = "Critical",
                    desc = "Auto attacks that are critical hits",
                    get = function() return NameplateSCT.db.global.animations.autoattackcrit; end,
                    set = function(_, newValue) NameplateSCT.db.global.animations.autoattackcrit = newValue; end,
                    values = animationValues,
                    order = 5,
                },
                autoattackcritsizing = {
                    type = 'toggle',
                    name = "Embiggen Crits",
                    desc = "Embiggen critical auto attacks",
                    get = function() return NameplateSCT.db.global.sizing.autoattackcritsizing; end,
                    set = function(_, newValue) NameplateSCT.db.global.sizing.autoattackcritsizing = newValue; end,
                    order = 6,
                },
            },
        },

        animationsPersonal = {
            type = 'group',
            name = "Personal SCT Animations",
            order = 40,
            inline = true,
            hidden = function() return not NameplateSCT.db.global.personal; end,
            disabled = function() return not NameplateSCT.db.global.enabled; end;
            args = {
                normal = {
                    type = 'select',
                    name = "Default",
                    desc = "",
                    get = function() return NameplateSCT.db.global.animationsPersonal.normal; end,
                    set = function(_, newValue) NameplateSCT.db.global.animationsPersonal.normal = newValue; end,
                    values = animationValues,
                    order = 1,
                },
                crit = {
                    type = 'select',
                    name = "Criticals",
                    desc = "",
                    get = function() return NameplateSCT.db.global.animationsPersonal.crit; end,
                    set = function(_, newValue) NameplateSCT.db.global.animationsPersonal.crit = newValue; end,
                    values = animationValues,
                    order = 2,
                },
                miss = {
                    type = 'select',
                    name = "Miss/Parry/Dodge/etc",
                    desc = "",
                    get = function() return NameplateSCT.db.global.animationsPersonal.miss; end,
                    set = function(_, newValue) NameplateSCT.db.global.animationsPersonal.miss = newValue; end,
                    values = animationValues,
                    order = 3,
                },
            },
        },

        appearance = {
            type = 'group',
            name = "Appearance/Offsets",
            order = 50,
            inline = true,
            disabled = function() return not NameplateSCT.db.global.enabled; end;
            args = {
                font = {
                    type = "select",
                    dialogControl = "LSM30_Font",
                    name = "Font",
                    order = 1,
                    values = AceGUIWidgetLSMlists.font,
                    get = function() return NameplateSCT.db.global.font; end,
                    set = function(_, newValue) NameplateSCT.db.global.font = newValue; end,
                },
                fontFlag = {
                    type = 'select',
                    name = "Font Flags",
                    desc = "",
                    get = function() return NameplateSCT.db.global.fontFlag; end,
                    set = function(_, newValue) NameplateSCT.db.global.fontFlag = newValue; end,
                    values = fontFlags,
                    order = 2,
                },
                fontShadow = {
                    type = 'toggle',
                    name = "Text Shadow",
                    get = function() return NameplateSCT.db.global.textShadow; end,
                    set = function(_, newValue) NameplateSCT.db.global.textShadow = newValue end,
                    order = 3,
                },

                damageColor = {
                    type = 'toggle',
                    name = "Use Damage Type Color",
                    desc = "",
                    get = function() return NameplateSCT.db.global.damageColor; end,
                    set = function(_, newValue) NameplateSCT.db.global.damageColor = newValue; end,
                    order = 4,
                },

                defaultColor = {
                    type = 'color',
                    name = "Default Color",
                    desc = "",
                    disabled = function() return NameplateSCT.db.global.damageColor; end,
                    hasAlpha = false,
                    set = function(_, r, g, b) NameplateSCT.db.global.defaultColor = rgbToHex(r, g, b); end,
                    get = function() return hexToRGB(NameplateSCT.db.global.defaultColor); end,
                    order = 5,
                },

                xOffset = {
                    type = 'range',
                    name = "X Offset",
                    desc = "Has soft max/min, you can type whatever you'd like into the editbox",
                    softMin = -75,
                    softMax = 75,
                    step = 1,
                    get = function() return NameplateSCT.db.global.xOffset; end,
                    set = function(_, newValue) NameplateSCT.db.global.xOffset = newValue; end,
                    order = 10,
                    width = "full",
                },

                yOffset = {
                    type = 'range',
                    name = "Y Offset",
                    desc = "Has soft max/min, you can type whatever you'd like into the editbox",
                    softMin = -75,
                    softMax = 75,
                    step = 1,
                    get = function() return NameplateSCT.db.global.yOffset; end,
                    set = function(_, newValue) NameplateSCT.db.global.yOffset = newValue; end,
                    order = 11,
                    width = "full",
                },

                xOffsetPersonal = {
                    type = 'range',
                    name = "X Offset Personal SCT",
                    hidden = function() return not NameplateSCT.db.global.personal; end,
                    desc = "Only used if Personal Nameplate is Disabled",
                    softMin = -400,
                    softMax = 400,
                    step = 1,
                    get = function() return NameplateSCT.db.global.xOffsetPersonal; end,
                    set = function(_, newValue) NameplateSCT.db.global.xOffsetPersonal = newValue; end,
                    order = 12,
                    width = "full",
                },

                yOffsetPersonal = {
                    type = 'range',
                    name = "Y Offset Personal SCT",
                    hidden = function() return not NameplateSCT.db.global.personal; end,
                    desc = "Only used if Personal Nameplate is Disabled",
                    softMin = -400,
                    softMax = 400,
                    step = 1,
                    get = function() return NameplateSCT.db.global.yOffsetPersonal; end,
                    set = function(_, newValue) NameplateSCT.db.global.yOffsetPersonal = newValue; end,
                    order = 12,
                    width = "full",
                },
            },
        },

        formatting = {
            type = 'group',
            name = "Text Formatting",
            order = 90,
            inline = true,
            disabled = function() return not NameplateSCT.db.global.enabled; end;
            args = {
                truncate = {
                    type = 'toggle',
                    name = "Truncate Number",
                    desc = "",
                    get = function() return NameplateSCT.db.global.truncate; end,
                    set = function(_, newValue) NameplateSCT.db.global.truncate = newValue; end,
                    order = 1,
                },
                truncateLetter = {
                    type = 'toggle',
                    name = "Show Truncated Letter",
                    desc = "",
                    disabled = function() return not NameplateSCT.db.global.enabled or not NameplateSCT.db.global.truncate; end,
                    get = function() return NameplateSCT.db.global.truncateLetter; end,
                    set = function(_, newValue) NameplateSCT.db.global.truncateLetter = newValue; end,
                    order = 2,
                },
                commaSeperate = {
                    type = 'toggle',
                    name = "Comma Seperate",
                    desc = "100000 -> 100,000",
                    disabled = function() return not NameplateSCT.db.global.enabled or NameplateSCT.db.global.truncate; end,
                    get = function() return NameplateSCT.db.global.commaSeperate; end,
                    set = function(_, newValue) NameplateSCT.db.global.commaSeperate = newValue; end,
                    order = 3,
                },

                -- icon = {
                    -- type = 'select',
                    -- name = "Icon",
                    -- desc = "",
                    -- get = function() return NameplateSCT.db.global.formatting.icon; end,
                    -- set = function(_, newValue) NameplateSCT.db.global.formatting.icon = newValue; end,
                    -- values = iconValues,
                    -- order = 51,
                -- },
                size = {
                    type = 'range',
                    name = "Size",
                    desc = "",
                    min = 5,
                    max = 72,
                    step = 1,
                    get = function() return NameplateSCT.db.global.formatting.size; end,
                    set = function(_, newValue) NameplateSCT.db.global.formatting.size = newValue; end,
                    order = 52,
                },
                alpha = {
                    type = 'range',
                    name = "Start Alpha",
                    desc = "",
                    min = 0.1,
                    max = 1,
                    step = .01,
                    get = function() return NameplateSCT.db.global.formatting.alpha; end,
                    set = function(_, newValue) NameplateSCT.db.global.formatting.alpha = newValue; end,
                    order = 53,
                },

                useOffTarget = {
                    type = 'toggle',
                    name = "Use Seperate Off-Target Text Appearance",
                    desc = "",
                    get = function() return NameplateSCT.db.global.useOffTarget; end,
                    set = function(_, newValue) NameplateSCT.db.global.useOffTarget = newValue; end,
                    order = 100,
                    width = "full",
                },
                offTarget = {
                    type = 'group',
                    name = "Off-Target Text Appearance",
                    hidden = function() return not NameplateSCT.db.global.useOffTarget; end,
                    order = 101,
                    inline = true,
                    args = {
                        -- icon = {
                            -- type = 'select',
                            -- name = "Icon",
                            -- desc = "",
                            -- get = function() return NameplateSCT.db.global.offTargetFormatting.icon; end,
                            -- set = function(_, newValue) NameplateSCT.db.global.offTargetFormatting.icon = newValue; end,
                            -- values = iconValues,
                            -- order = 1,
                        -- },
                        size = {
                            type = 'range',
                            name = "Size",
                            desc = "",
                            min = 5,
                            max = 72,
                            step = 1,
                            get = function() return NameplateSCT.db.global.offTargetFormatting.size; end,
                            set = function(_, newValue) NameplateSCT.db.global.offTargetFormatting.size = newValue; end,
                            order = 2,
                        },
                        alpha = {
                            type = 'range',
                            name = "Start Alpha",
                            desc = "",
                            min = 0.1,
                            max = 1,
                            step = .01,
                            get = function() return NameplateSCT.db.global.offTargetFormatting.alpha; end,
                            set = function(_, newValue) NameplateSCT.db.global.offTargetFormatting.alpha = newValue; end,
                            order = 3,
                        },
                    },
                },
            },
        },

        sizing = {
            type = 'group',
            name = "Sizing Modifiers",
            order = 100,
            inline = true,
            disabled = function() return not NameplateSCT.db.global.enabled; end;
            args = {
                crits = {
                    type = 'toggle',
                    name = "Embiggen Crits",
                    desc = "",
                    get = function() return NameplateSCT.db.global.sizing.crits; end,
                    set = function(_, newValue) NameplateSCT.db.global.sizing.crits = newValue; end,
                    order = 1,
                },
                critsScale = {
                    type = 'range',
                    name = "Embiggen Crits Scale",
                    desc = "",
                    disabled = function() return not NameplateSCT.db.global.enabled or not NameplateSCT.db.global.sizing.crits; end,
                    min = 1,
                    max = 3,
                    step = .01,
                    get = function() return NameplateSCT.db.global.sizing.critsScale; end,
                    set = function(_, newValue) NameplateSCT.db.global.sizing.critsScale = newValue; end,
                    order = 2,
                    width = "double",
                },

                miss = {
                    type = 'toggle',
                    name = "Embiggen Miss/Parry/Dodge/etc",
                    desc = "",
                    get = function() return NameplateSCT.db.global.sizing.miss; end,
                    set = function(_, newValue) NameplateSCT.db.global.sizing.miss = newValue; end,
                    order = 10,
                },
                missScale = {
                    type = 'range',
                    name = "Embiggen Miss/Parry/Dodge/etc Scale",
                    desc = "",
                    disabled = function() return not NameplateSCT.db.global.enabled or not NameplateSCT.db.global.sizing.miss; end,
                    min = 1,
                    max = 3,
                    step = .01,
                    get = function() return NameplateSCT.db.global.sizing.missScale; end,
                    set = function(_, newValue) NameplateSCT.db.global.sizing.missScale = newValue; end,
                    order = 11,
                    width = "double",
                },

                smallHits = {
                    type = 'toggle',
                    name = "Scale Down Small Hits",
                    desc = "Scale down hits that are below a running average of your recent damage output",
                    disabled = function() return not NameplateSCT.db.global.enabled or NameplateSCT.db.global.sizing.smallHitsHide; end,
                    get = function() return NameplateSCT.db.global.sizing.smallHits; end,
                    set = function(_, newValue) NameplateSCT.db.global.sizing.smallHits = newValue; end,
                    order = 20,
                },
                smallHitsScale = {
                    type = 'range',
                    name = "Small Hits Scale",
                    desc = "",
                    disabled = function() return not NameplateSCT.db.global.enabled or not NameplateSCT.db.global.sizing.smallHits or NameplateSCT.db.global.sizing.smallHitsHide; end,
                    min = 0.33,
                    max = 1,
                    step = .01,
                    get = function() return NameplateSCT.db.global.sizing.smallHitsScale; end,
                    set = function(_, newValue) NameplateSCT.db.global.sizing.smallHitsScale = newValue; end,
                    order = 21,
                    width = "double",
                },
                smallHitsHide = {
                    type = 'toggle',
                    name = "Hide Small Hits",
                    desc = "Hide hits that are below a running average of your recent damage output",
                    get = function() return NameplateSCT.db.global.sizing.smallHitsHide; end,
                    set = function(_, newValue) NameplateSCT.db.global.sizing.smallHitsHide = newValue; end,
                    order = 22,
                },
            },
        },
    },
};

function NameplateSCT:OpenMenu()
    -- just open to the frame, double call because blizz bug
    InterfaceOptionsFrame_OpenToCategory(self.menu);
    InterfaceOptionsFrame_OpenToCategory(self.menu);
end

function NameplateSCT:RegisterMenu()
    LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("NameplateSCT", menu);
    self.menu = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("NameplateSCT", "NameplateSCT");
end
