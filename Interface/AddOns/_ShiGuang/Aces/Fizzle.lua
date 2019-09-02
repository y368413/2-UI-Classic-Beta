--## Author: phyber
-- Create the addon
Fizzle = LibStub("AceAddon-3.0"):NewAddon("Fizzle", "AceEvent-3.0", "AceBucket-3.0", "AceHook-3.0", "AceConsole-3.0")
local self, Fizzle = Fizzle, Fizzle
local defaults = {
        Percent = true,
        Border = true,
        Invert = false,
        HideText = false,
        DisplayWhenFull = false,
        modules = {
            ["Inspect"] = true,
        },
        inspectiLevel = false,
    }

local fontSize = 12
local _G = _G
local sformat = string.format
local ipairs = ipairs
--local db -- We'll put our saved vars here later

-- Make some of the inventory functions more local (ordered by string length!)
local GetAddOnMetadata = GetAddOnMetadata
local GetItemQualityColor = GetItemQualityColor
local GetInventorySlotInfo = GetInventorySlotInfo
local GetInventoryItemQuality = GetInventoryItemQuality
local GetInventoryItemDurability = GetInventoryItemDurability

-- Flag to check if the borders were created or not
local bordersCreated = false
local items, nditems -- our item slot tables

-- Return an options table full of goodies!

function Fizzle:OnEnable()
    Fizzle:SecureHookScript(CharacterFrame, "OnShow", "CharacterFrame_OnShow")
    Fizzle:SecureHookScript(CharacterFrame, "OnHide", "CharacterFrame_OnHide")

    if not bordersCreated then
        Fizzle:MakeTypeTable()
    end
end

function Fizzle:OnDisable()
    for _, item in ipairs(items) do
        _G[item .. "FizzleS"]:SetText("")
    end

    Fizzle:HideBorders()
end

function Fizzle:CreateBorder(slottype, slot, name, hasText)
    local gslot = _G[slottype..slot.."Slot"]
    local height = 68
    local width = 68

    -- Ammo slot is smaller than the rest.
    if slot == "Ammo" then
        height = 58
        width = 58
    end

    if gslot then
        -- Create border
        local border = gslot:CreateTexture(slot .. name .. "B", "OVERLAY")
        border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
        border:SetBlendMode("ADD")
        border:SetAlpha(0.75)
        border:SetHeight(height)
        border:SetWidth(width)
        border:SetPoint("CENTER", gslot, "CENTER", 0, 1)
        border:Hide()

        -- Check if we need a text field creating
        if hasText then
            local str = gslot:CreateFontString(slot .. name .. "S", "OVERLAY")
            local font, _, flags = NumberFontNormal:GetFont()
            str:SetFont(font, fontSize, flags)
            str:SetPoint("CENTER", gslot, "BOTTOM", 0, 8)
        end

        -- Strings for iLevels
        local iLevelStr = gslot:CreateFontString(slot .. name .. "iLevel", "OVERLAY")
        local font, _, flags = NumberFontNormal:GetFont()
        iLevelStr:SetFont(font, fontSize, flags)
        iLevelStr:SetPoint("CENTER", gslot, "TOP", 0, -5)
    end
end

function Fizzle:MakeTypeTable()
    -- Table of item types and slots.  Thanks Tekkub.
    items = {
        "Head",
        "Shoulder",
        "Chest",
        "Waist",
        "Legs",
        "Feet",
        "Wrist",
        "Hands",
        "MainHand",
        "SecondaryHand",
    }

    -- Items without durability but with some quality, needed for border colouring.
    nditems = {
        "Ammo",
        "Neck",
        "Back",
        "Finger0",
        "Finger1",
        "Trinket0",
        "Trinket1",
        "Relic",
        "Tabard",
        "Shirt",
    }

    for _, item in ipairs(items) do
        Fizzle:CreateBorder("Character", item, "Fizzle", true)
    end

    -- Same again, but for ND items, and only creating a border
    for _, nditem in ipairs(nditems) do
        Fizzle:CreateBorder("Character", nditem, "Fizzle", false)
    end
end

local function GetThresholdColour(percent)
    if percent < 0 then
        return 1, 0, 0
    elseif percent <= 0.5 then
        return 1, percent * 2, 0
    elseif percent >= 1 then
        return 0, 1, 0
    else
        return 2 - percent * 2, 1, 0
    end
end

-- Returns: current, max, percent
local function GetDurabilityNumbers(slotId)
    local cur, max = GetInventoryItemDurability(slotId)
    cur, max = tonumber(cur) or 0, tonumber(max) or 0

    local percent = cur / max * 100

    return cur, max, percent
end

function Fizzle:UpdateItems()
    -- Don't update unless the charframe is open.
    -- No point updating what we can't see.
    if CharacterFrame:IsVisible() then
        -- Go and set the durability string for each slot that has an item equipped that has durability.
        -- Thanks Tekkub again for the base of this code.
        for _, item in ipairs(items) do
            local id, _ = GetInventorySlotInfo(item .. "Slot")
            local str = _G[item.."FizzleS"]

            local cur, max, percent = GetDurabilityNumbers(id)

            if (((max ~= 0) and ((percent ~= 100) or defaults.DisplayWhenFull)) and not defaults.HideText) then
                local text

                -- Colour our string depending on current durability percentage
                str:SetTextColor(GetThresholdColour(cur / max))

                if defaults.Invert then
                    cur = max - cur
                    percent = 100 - percent
                end

                -- Are we showing the % or raw cur/max
                if defaults.Percent then
                    text = sformat("%d%%", percent)
                else
                    text = cur.."/"..max
                end

                str:SetText(text)
            else
                -- No durability in slot, so hide the text.
                str:SetText("")
            end

            --Finally, colour the borders
            if defaults.Border then
                Fizzle:ColourBorders(id, item)
            end
        end

        -- Colour the borders of ND items
        if defaults.Border then
            Fizzle:ColourBordersND()
        end
    end
end

function Fizzle:CharacterFrame_OnShow()
    Fizzle:RegisterEvent("UNIT_INVENTORY_CHANGED", "UpdateItems")
    Fizzle:RegisterBucketEvent("UPDATE_INVENTORY_DURABILITY", 0.5, "UpdateItems")
    Fizzle:UpdateItems()
end

function Fizzle:CharacterFrame_OnHide()
    Fizzle:UnregisterEvent("UNIT_INVENTORY_CHANGED")
    Fizzle:UnregisterBucket("UPDATE_INVENTORY_DURABILITY")
end

-- Border colouring split into two functions so I only need to iterate over each table once.
-- Border colouring for items with durability.
function Fizzle:ColourBorders(slotID, rawslot)
    local quality = GetInventoryItemQuality("player", slotID)

    if quality then
        local r, g, b, _ = GetItemQualityColor(quality)
        _G[rawslot.."FizzleB"]:SetVertexColor(r, g, b)
        _G[rawslot.."FizzleB"]:Show()
    else
        _G[rawslot.."FizzleB"]:Hide()
    end
end

-- Border colouring for items without durability
function Fizzle:ColourBordersND()
    for _, nditem in ipairs(nditems) do
        if _G["Character"..nditem.."Slot"] then
            local slotID, _ = GetInventorySlotInfo(nditem .. "Slot")
            local quality = GetInventoryItemQuality("player", slotID)

            if quality then
                local r, g, b, _ = GetItemQualityColor(quality)
                _G[nditem.."FizzleB"]:SetVertexColor(r, g, b)
                _G[nditem.."FizzleB"]:Show()
            else
                _G[nditem.."FizzleB"]:Hide()
            end
        end
    end
end

-- Toggle the border colouring
function Fizzle:BorderToggle()
    if not defaults.Border then
        Fizzle:HideBorders()
    else
        Fizzle:UpdateItems()
    end
end

-- Hide quality borders
function Fizzle:HideBorders()
    for _, item in ipairs(items) do
        local border = _G[item.."FizzleB"]
        if border then
            border:Hide()
        end
    end

    for _, nditem in ipairs(nditems) do
        local border = _G[nditem.."FizzleB"]
        if border then
            border:Hide()
        end
    end
end

local mod = Fizzle:NewModule("Inspect", "AceHook-3.0", "AceEvent-3.0")
local _G = _G
local ipairs, smatch, tonumber = ipairs, string.match, tonumber
local slots = {
	"Head",
	"Shoulder",
	"Chest",
	"Waist",
	"Legs",
	"Feet",
	"Wrist",
	"Hands",
	"MainHand",
	"SecondaryHand",
	"Ranged",
	"Ammo",
	"Neck",
	"Back",
	"Finger0",
	"Finger1",
	"Trinket0",
	"Trinket1",
	"Relic",
	"Tabard",
	"Shirt",
}
local booted = false
-- Make some blizz functions more local
local UnitIsPlayer = UnitIsPlayer
local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor
local GetInventoryItemLink = GetInventoryItemLink
mod.modName = "Inspect"


function mod:OnEnable()
	if IsAddOnLoaded("Blizzard_InspectUI") then
		self:SecureHookScript(InspectFrame, "OnShow", "InspectFrame_OnShow")
		self:SecureHookScript(InspectFrame, "OnHide", "InspectFrame_OnHide")
		self:InspectFrame_OnShow()
	else
		self:RegisterEvent("ADDON_LOADED")
	end
end

function mod:OnDisable()
	-- Hide all borders if we get disabled.
	for _, item in ipairs(slots) do
		local border = _G[item .."FizzspectB"]
		if border then
			border:Hide()
		end
	end
end

function mod:CreateBorders()
	for _, item in ipairs(slots) do
		-- Create borders
		Fizzle:CreateBorder("Inspect", item, "Fizzspect", false)
	end
	booted = true
end

local function GetItemID(link)
	return tonumber(smatch(link, "item:(%d+)") or smatch(link, "%d+"))
end

function mod:UpdateBorders()
	if not InspectFrame:IsVisible() then return end
	if not UnitIsPlayer("target") then return end
	-- Now colour the borders.
	for _, item in ipairs(slots) do
		local id
		if _G["Character".. item .."Slot"] then
			id = _G["Character".. item .."Slot"]:GetID()
		end
		if id then
			local link = GetInventoryItemLink("target", id)
			local border = _G[item .."FizzspectB"]
			local iLevelStr = _G[item.."FizzspectiLevel"]
			if link and border then
				local itemID = GetItemID(link)
				local _, _, quality, iLevel = GetItemInfo(itemID)

				if quality then
					local r, g, b = GetItemQualityColor(quality)
					border:SetVertexColor(r, g, b)
					border:Show()
					if defaults.inspectiLevel then
						iLevelStr:SetText(iLevel)
						iLevelStr:Show()
					end
				else
					border:Hide()
					iLevelStr:Hide()
				end
			else
				if border then
					border:Hide()
				end
				if iLevelStr then
					iLevelStr:Hide()
				end
			end
		end
	end
end

function mod:ADDON_LOADED(event, addonname)
	-- If the Blizzard InspectUI is loading, fire up the addon!
	if addonname == "Blizzard_InspectUI" then
		self:SecureHookScript(InspectFrame, "OnShow", "InspectFrame_OnShow")
		self:SecureHookScript(InspectFrame, "OnHide", "InspectFrame_OnHide")
		self:UnregisterEvent("ADDON_LOADED")
	end
end

function mod:InspectFrame_OnShow()
	-- Create the borders if we're just loading.
	if not booted then
		self:CreateBorders()
	end
	-- Update the borders
	self:UpdateBorders()
	-- Watch for inventory changes
	self:RegisterEvent("UNIT_INVENTORY_CHANGED", "UpdateBorders")
	-- Watch for target changes.
	if not self:IsHooked("InspectFrame_UnitChanged") then
		self:SecureHook("InspectFrame_UnitChanged", "UpdateBorders")
	end
end

function mod:InspectFrame_OnHide()
	self:Unhook("InspectFrame_UnitChanged")
	self:UnregisterEvent("UNIT_INVENTORY_CHANGED")
end
