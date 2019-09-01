local _, ns = ...
local M, R, U, I = unpack(ns)
local TT = M:GetModule("Tooltip")

local strmatch, strsplit, tonumber = string.match, string.split, tonumber

local orig1, orig2, sectionInfo = {}, {}, {}
local linkTypes = {
	item = true,
	enchant = true,
	spell = true,
	quest = true,
	unit = true,
	talent = true,
	achievement = true,
	glyph = true,
	instancelock = true,
	currency = true,
	keystone = true,
	azessence = true,
}

function TT:HyperLink_SetTypes(link)
	GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT", -3, 5)
	GameTooltip:SetHyperlink(link)
	GameTooltip:Show()
end

function TT:HyperLink_OnEnter(link, ...)
	local linkType = strmatch(link, "^([^:]+)")
	if linkType and linkTypes[linkType] then
		TT.HyperLink_SetTypes(self, link)
	end

	if orig1[self] then return orig1[self](self, link, ...) end
end

function TT:HyperLink_OnLeave(_, ...)
	GameTooltip:Hide()

	if orig2[self] then return orig2[self](self, ...) end
end

for i = 1, NUM_CHAT_WINDOWS do
	local frame = _G["ChatFrame"..i]
	orig1[frame] = frame:GetScript("OnHyperlinkEnter")
	frame:SetScript("OnHyperlinkEnter", TT.HyperLink_OnEnter)
	orig2[frame] = frame:GetScript("OnHyperlinkLeave")
	frame:SetScript("OnHyperlinkLeave", TT.HyperLink_OnLeave)
end
