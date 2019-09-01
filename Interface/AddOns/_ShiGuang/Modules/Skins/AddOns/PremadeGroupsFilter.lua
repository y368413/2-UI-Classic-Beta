local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")
local TT = M:GetModule("Tooltip")

function S:PGFSkin()
	if not MaoRUISettingDB["Skins"]["PGFSkin"] then return end
	if not IsAddOnLoaded("PremadeGroupsFilter") then return end

	local tipStyled
	hooksecurefunc(PremadeGroupsFilter.Debug, "PopupMenu_Initialize", function()
		if tipStyled then return end
		for i = 1, 15 do
			local child = select(i, PremadeGroupsFilterDialog:GetChildren())
			if child and child.Shadow then
				TT.ReskinTooltip(child)
				tipStyled = true
				break
			end
		end
	end)

	hooksecurefunc(PremadeGroupsFilterDialog, "SetPoint", function(self, _, parent)
		if parent ~= LFGListFrame then
			self:ClearAllPoints()
			self:SetPoint("TOPLEFT", LFGListFrame, "TOPRIGHT", 5, 1)
		end
	end)

end