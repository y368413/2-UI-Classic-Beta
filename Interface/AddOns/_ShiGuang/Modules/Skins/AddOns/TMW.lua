local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")

local function ReskinTMW()
	TMW.Classes.Icon:PostHookMethod("OnNewInstance", function(self)
		M.CreateSD(self, 2, 2)
	end)

	TMW.Classes.IconModule_Texture:PostHookMethod("OnNewInstance", function(self)
		self.texture:SetTexCoord(unpack(I.TexCoord))
	end)
end

S:LoadWithAddOn("TellMeWhen", "TMW", ReskinTMW)