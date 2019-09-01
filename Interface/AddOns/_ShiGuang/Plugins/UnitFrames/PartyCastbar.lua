
---------------------------------------- 隊友施法條-- Party casting bar-------------------------------------
--顯示位置
local function PartyCastingBar_OnShow(self)
    local parentFrame = self:GetParent()
    local petFrame = _G[parentFrame:GetName() .. "PetFrame"]
    if (self.PartyId and petFrame:IsShown()) then self:SetPoint("BOTTOM", parentFrame, "BOTTOM", 0, -26)
	  else self:SetPoint("BOTTOM", parentFrame, "BOTTOM", 0, 0) end
end
--事件監聽
local function PartyCastingBar_OnEvent(self, event, ...)
    local arg1 = ...
    if (event == "CVAR_UPDATE") then
		   if (self.casting or self.channeling) then self:Show() else self:Hide() end
		return
	     elseif (event == "GROUP_ROSTER_UPDATE" or event == "PARTY_MEMBER_ENABLE" or event == "PARTY_MEMBER_DISABLE" or event == "PARTY_LEADER_CHANGED") then
        if (GetDisplayedAllyFrames() ~= "party") then return end
		if (UnitChannelInfo(self.unit)) then
			event = "UNIT_SPELLCAST_CHANNEL_START"
			arg1 = self.unit
		elseif (UnitCastingInfo(self.unit)) then
			event = "UNIT_SPELLCAST_START"
			arg1 = self.unit
		else
			self.casting = nil
			self.channeling = nil
			self:SetMinMaxValues(0, 0)
			self:SetValue(0)
			self:Hide()
			return
		end
		PartyCastingBar_OnShow(self)
	end
    CastingBarFrame_OnEvent(self, event, arg1, select(2, ...))
end
-- 創建施法條
local partycastframe, partycastparent
for i = 1, MAX_PARTY_MEMBERS do
	partycastframe = CreateFrame("STATUSBAR", "PartyCastingBar"..i, _G["PartyMemberFrame"..i], "SmallCastingBarFrameTemplate")
    partycastframe.PartyId = i
    partycastframe.Icon:Hide()
    partycastframe:SetScale(0.75)
    partycastframe:SetScript("OnShow", PartyCastingBar_OnShow)
    partycastframe:SetScript("OnEvent", PartyCastingBar_OnEvent)
    --partycastframe:RegisterEvent("GROUP_ROSTER_UPDATE")
	partycastframe:RegisterEvent("PARTY_MEMBER_ENABLE")
	partycastframe:RegisterEvent("PARTY_MEMBER_DISABLE")
	partycastframe:RegisterEvent("PARTY_LEADER_CHANGED")
    partycastframe:RegisterEvent("CVAR_UPDATE")
    CastingBarFrame_OnLoad(partycastframe, "party"..i, false, false)
    CastingBarFrame_SetNonInterruptibleCastColor(partycastframe, 1.0, 0.7, 0)
    local prev = "PartyMemberFrame"..(i-1) .. "PetFrame"
    if (_G[prev]) then _G["PartyMemberFrame"..i]:SetPoint("TOPLEFT", _G[prev], "BOTTOMLEFT", -21, -30) end
    
            
    --partycastparent = _G["PartyMemberFrame"..i]
    --partycastparent.bufftip = CreateFrame("Frame", nil, partycastparent)
    --partycastparent.bufftip:SetSize(36, 36)
    --partycastparent.bufftip:SetPoint("TOPLEFT", 5, -6)
    --partycastparent.bufftip.atonement = partycastparent.bufftip:CreateTexture(nil, "ARTWORK")
    --partycastparent.bufftip.atonement:SetTexture("Interface\\Minimap\\UI-ArchBlob-MinimapRing")
    --partycastparent.bufftip.atonement:SetVertexColor(0, 1, 0)
    --partycastparent.bufftip.atonement:SetSize(36, 36)
    --partycastparent.bufftip.atonement:SetPoint("CENTER")
    --partycastparent.bufftip:SetFrameLevel(86)
    --partycastparent.bufftip:SetAlpha(0)
end