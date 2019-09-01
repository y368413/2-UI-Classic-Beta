local _, ns = ...
local M, R, U, I = unpack(ns)
----------------------------------------------------------------------------------------
--	Collect minimap buttons in one line
----------------------------------------------------------------------------------------
local BlackList = {
	["QueueStatusMinimapButton"] = true,
	["MiniMapTracking"] = true,
	["MiniMapMailFrame"] = true,
	["HelpOpenTicketButton"] = true,
	["GameTimeFrame"] = true,
}
local hideBorder = function(...)
	for i = 1, select('#', ...) do
		local region = select(i, ...)
		if region.GetTexture then
			local texture = region:GetTexture()
			if texture and strfind(strlower(texture), 'border') then
				region:Hide()
			end
		end
	end
end

local buttons = {}
local button = CreateFrame("Frame", "ButtonCollectFrame", UIParent)
--local line = math.ceil(310 / 21)
local function PositionAndStyle()
	button:SetSize(21, 12)
	button:SetPoint("TOPRIGHT", Minimap, "BOTTOMRIGHT", -3, -3)
	for i = 1, #buttons do
		buttons[i]:ClearAllPoints()
		--hideBorder(buttons[i]:GetRegions())
		if i == 1 then
			buttons[i]:SetPoint("TOP", button, "TOP", 0, 0)
		--elseif i == line then
			--buttons[i]:SetPoint("TOPRIGHT", buttons[1], "TOPLEFT", -1, 0)
		else
			buttons[i]:SetPoint("RIGHT", buttons[i-1], "LEFT", 0, 0)
		end
		buttons[i].ClearAllPoints = M.dummy
		buttons[i].SetPoint = M.dummy
		--buttons[i]:SetAlpha(0)
		--buttons[i]:HookScript("OnEnter", function()
			--UIFrameFadeIn(buttons[i], 0.4, buttons[i]:GetAlpha(), 1)
		--end)
		--buttons[i]:HookScript("OnLeave", function()
			--UIFrameFadeOut(buttons[i], 0.8, buttons[i]:GetAlpha(), 0)
		--end)
	end
end

local collect = CreateFrame("Frame")
collect:RegisterEvent("PLAYER_ENTERING_WORLD")
collect:SetScript("OnEvent", function(self)
	for _, child in ipairs({Minimap:GetChildren()}) do
		if not BlackList[child:GetName()] then
			if child:GetObjectType() == "Button" and child:GetNumRegions() >= 3 and child:IsShown() then
				child:SetParent(button)
				tinsert(buttons, child)
			end
		end
	end
	if #buttons == 0 then
		button:Hide()
	end
	PositionAndStyle()
end)