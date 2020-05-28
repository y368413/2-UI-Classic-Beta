local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:GetModule("Misc")

local pairs, select, next, wipe = pairs, select, next, wipe
local UnitGUID, GetItemInfo = UnitGUID, GetItemInfo
local GetInventoryItemLink = GetInventoryItemLink

local inspectSlots = {
	"Head", "Neck", "Shoulder", "Shirt", "Chest", "Waist", "Legs", "Feet", "Wrist", "Hands", "Finger0", "Finger1", "Trinket0", "Trinket1", "Back", "MainHand", "SecondaryHand", "Ranged",
}

function MISC:GetSlotAnchor(index)
	if not index then return end
	if index <= 5 or index == 9 or index == 15 then
		return "BOTTOMLEFT", 40, 20
	elseif index == 16 then
		return "BOTTOMRIGHT", -40, 2
	elseif index == 17 then
		return "BOTTOMLEFT", 40, 2
	else
		return "BOTTOMRIGHT", -40, 20
	end
end

function MISC:CreateItemTexture(slot, relF, x, y)
	local icon = slot:CreateTexture()
	icon:SetPoint(relF, x, y)
	icon:SetSize(14, 14)
	icon.bg = M.ReskinIcon(icon)
	icon.bg:SetFrameLevel(3)
	icon.bg:Hide()

	return icon
end

function MISC:CreateColorBorder()
	local frame = CreateFrame("Frame", nil, self)
	frame:SetAllPoints()
	self.colorBG = M.CreateSD(frame, 4, true)
	self.colorBG:SetFrameLevel(5)
end

function MISC:CreateItemString(frame, strType)
	if frame.fontCreated then return end

	for index, slot in pairs(inspectSlots) do
		if index ~= 4 then
			local slotFrame = _G[strType..slot.."Slot"]
			slotFrame.iLvlText = M.CreateFS(slotFrame, I.Font[2]+3)
			slotFrame.iLvlText:ClearAllPoints()
			slotFrame.iLvlText:SetPoint("TOPLEFT", slotFrame, x, y)
			local relF, x, y = MISC:GetSlotAnchor(index)
			slotFrame.enchantText = M.CreateFS(slotFrame, I.Font[2]-3)
			slotFrame.enchantText:ClearAllPoints()
			slotFrame.enchantText:SetPoint(relF, slotFrame, x-1, y-16)
			slotFrame.enchantText:SetTextColor(0, 1, 0)
			for i = 1, 5 do
				local offset = (i-1)*18 + 5
				local iconX = x > 0 and x+offset or x-offset
				local iconY = index > 15 and 20 or 2
				slotFrame["textureIcon"..i] = MISC:CreateItemTexture(slotFrame, relF, iconX, iconY)
			end
			MISC.CreateColorBorder(slotFrame)
		end
	end

	frame.fontCreated = true
end

function MISC:ItemBorderSetColor(slotFrame, r, g, b)
	if slotFrame.colorBG then
		slotFrame.colorBG:SetBackdropBorderColor(r, g, b)
	end
	if slotFrame.bg then
		slotFrame.bg:SetBackdropBorderColor(r, g, b)
	end
end

local pending = {}
function MISC:RefreshButtonInfo()
	if InspectFrame and InspectFrame.unit then
		for index, slotFrame in pairs(pending) do
			local link = GetInventoryItemLink(InspectFrame.unit, index)
			if link then
				local quality, level = select(3, GetItemInfo(link))
				if quality then
					local color = I.QualityColors[quality]
					MISC:ItemBorderSetColor(slotFrame, color.r, color.g, color.b)
					if MaoRUIPerDB["Misc"]["ShowItemLevel"] and level and level > 1 and quality > 1 then
						slotFrame.iLvlText:SetText(level)
						slotFrame.iLvlText:SetTextColor(1, 0.8, 0)  --color.r, color.g, color.b
					end
					pending[index] = nil
				end
			end
		end

		if not next(pending) then
			self:Hide()
			return
		end
	else
		wipe(pending)
		self:Hide()
	end
end

function MISC:ItemLevel_SetupLevel(frame, strType, unit)
	if not UnitExists(unit) then return end

	MISC:CreateItemString(frame, strType)

	for index, slot in pairs(inspectSlots) do
		if index ~= 4 then
			local slotFrame = _G[strType..slot.."Slot"]
			slotFrame.iLvlText:SetText("")
			slotFrame.enchantText:SetText("")
			for i = 1, 5 do
				local texture = slotFrame["textureIcon"..i]
				texture:SetTexture(nil)
				texture.bg:Hide()
			end
			MISC:ItemBorderSetColor(slotFrame, 0, 0, 0)

			local itemTexture = GetInventoryItemTexture(unit, index)
			if itemTexture then
				local link = GetInventoryItemLink(unit, index)
				if link then
					local quality, level = select(3, GetItemInfo(link))
					if quality then
						local color = I.QualityColors[quality]
						MISC:ItemBorderSetColor(slotFrame, color.r, color.g, color.b)
						if MaoRUIPerDB["Misc"]["ShowItemLevel"] and level and level > 1 and quality > 1 then
							slotFrame.iLvlText:SetText(level)
					slotFrame.iLvlText:SetTextColor(1, 0.8, 0)  --color.r, color.g, color.b
						end
					else
						pending[index] = slotFrame
						MISC.QualityUpdater:Show()
					end
				else
					pending[index] = slotFrame
					MISC.QualityUpdater:Show()
				end
			end
		end
	end
end

function MISC:ItemLevel_UpdatePlayer()
	MISC:ItemLevel_SetupLevel(CharacterFrame, "Character", "player")
end

function MISC:ItemLevel_UpdateInspect(...)
	local guid = ...
	if InspectFrame and InspectFrame.unit and UnitGUID(InspectFrame.unit) == guid then
		MISC:ItemLevel_SetupLevel(InspectFrame, "Inspect", InspectFrame.unit)
	end
end

function MISC:ShowItemLevel()
	if not MaoRUIPerDB["Misc"]["ItemLevel"] then return end

	-- iLvl on CharacterFrame
	CharacterFrame:HookScript("OnShow", MISC.ItemLevel_UpdatePlayer)
	M:RegisterEvent("PLAYER_EQUIPMENT_CHANGED", MISC.ItemLevel_UpdatePlayer)

	-- iLvl on InspectFrame
	M:RegisterEvent("INSPECT_READY", MISC.ItemLevel_UpdateInspect)

	-- Update item quality
	MISC.QualityUpdater = CreateFrame("Frame")
	MISC.QualityUpdater:Hide()
	MISC.QualityUpdater:SetScript("OnUpdate", MISC.RefreshButtonInfo)
end
MISC:RegisterMisc("GearInfo", MISC.ShowItemLevel)