local _, ns = ...
local M, R, U, I = unpack(ns)
local TT = M:GetModule("Tooltip")

local gsub, unpack = gsub, unpack
local GetItemIcon, GetSpellTexture = GetItemIcon, GetSpellTexture
local newString = "0:0:64:64:5:59:5:59"

function TT:SetupTooltipIcon(icon)
	local title = icon and _G[self:GetName().."TextLeft1"]
	if title then
		title:SetFormattedText("|T%s:16:16:"..newString..":%d|t %s", icon, 16, title:GetText())
	end
	for i = 2, self:NumLines() do
		local line = _G[self:GetName().."TextLeft"..i]
		if not line then break end
		local text = line:GetText() or ""
		if strmatch(text, "|T.-:[%d+:]+|t") then
			line:SetText(gsub(text, "|T(.-):[%d+:]+|t", "|T%1:16:16:"..newString.."|t"))
		end
	end
end

function TT:HookTooltipCleared()
	self.tipModified = false
end

function TT:HookTooltipSetItem()
	if not self.tipModified then
		local _, link = self:GetItem()
		if link then
			TT.SetupTooltipIcon(self, GetItemIcon(link))
		end
		self.tipModified = true
	end
end

function TT:HookTooltipSetSpell()
	if not self.tipModified then
		local _, id = self:GetSpell()
		if id then
			TT.SetupTooltipIcon(self, GetSpellTexture(id))
		end
		self.tipModified = true
	end
end

function TT:HookTooltipMethod()
	self:HookScript("OnTooltipSetItem", TT.HookTooltipSetItem)
	self:HookScript("OnTooltipSetSpell", TT.HookTooltipSetSpell)
	self:HookScript("OnTooltipCleared", TT.HookTooltipCleared)
end

local function updateBackdropColor(self, r, g, b)
	self:GetParent().bg:SetBackdropBorderColor(r, g, b)
end

local function resetBackdropColor(self)
	self:GetParent().bg:SetBackdropBorderColor(0, 0, 0)
end

function TT:ReskinRewardIcon()
	self.Icon:SetTexCoord(unpack(I.TexCoord))
	self.bg = M.CreateBG(self.Icon)
	M.CreateBD(self.bg)
	local iconBorder = self.IconBorder
	iconBorder:SetAlpha(0)
	hooksecurefunc(iconBorder, "SetVertexColor", updateBackdropColor)
	hooksecurefunc(iconBorder, "Hide", resetBackdropColor)
end

function TT:ReskinTooltipIcons()
	TT.HookTooltipMethod(GameTooltip)
	TT.HookTooltipMethod(ItemRefTooltip)
	hooksecurefunc(GameTooltip, "SetUnitAura", function(self)
		TT.SetupTooltipIcon(self)
	end)
	-- Tooltip rewards icon
	TT.ReskinRewardIcon(EmbeddedItemTooltip.ItemTooltip)
end
