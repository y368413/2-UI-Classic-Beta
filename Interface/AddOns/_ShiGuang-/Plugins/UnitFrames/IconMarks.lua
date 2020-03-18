--## Version: 0.1.3 ## Author: dabussr@hotmail.com
local x, y
local button
local unit_mark_index
local unit_mark_texture

	for i = 1, 5 do
		unit = "Party"..i
		if i == 5 then
			unit = "Player"
		end
		if unit == "Player" then
			x = -150
			y = 0
			button = CreateFrame("BUTTON", "IconMarksPlayerIcon", GetClickFrame("PlayerFrame"), "SecureActionButtonTemplate")
			button:SetPoint("TOPRIGHT", "PlayerFrame", "TOPRIGHT", x, y)
			button:SetBackdrop({ bgFile = "Interface/BUTTONS/WHITE8X8" })
			button:SetWidth(17)
			button:SetHeight(17)
			button:SetBackdropColor(0.1, 0.1, 0.1, 0)
			button:SetNormalTexture("")
			button:SetFrameLevel(128)
			button:SetScript("OnEvent", IconMarks_OnEvent)
		else	
			x = -96
			y = 6
			button = CreateFrame("BUTTON", "IconMarksParty"..i.."Icon", GetClickFrame("PartyMemberFrame"..i), "SecureActionButtonTemplate")
			button:SetPoint("TOPRIGHT", "PartyMemberFrame"..i, "TOPRIGHT", x, y)
			button:SetBackdrop({ bgFile = "Interface/BUTTONS/WHITE8X8" })
			button:SetWidth(13)
			button:SetHeight(13)
			button:SetBackdropColor(0.1, 0.1, 0.1, 0)
			button:SetNormalTexture("")
			button:SetFrameLevel(128)
		end
	end

local IconMarks_timer = CreateFrame("Frame");
IconMarks_timer:SetScript("OnUpdate", function(self, sinceLastUpdate) IconMarks_timer:onUpdate(sinceLastUpdate); end);
function IconMarks_timer:onUpdate(sinceLastUpdate)
	self.sinceLastUpdate = (self.sinceLastUpdate or 0) + sinceLastUpdate
	if (self.sinceLastUpdate >= 2) then 
	for i = 1, 5 do
		unit = "Party"..i
		if i == 5 then
			unit = "Player"
		end
		if UnitExists(unit) then
			if GetRaidTargetIndex(unit) == nil then unit_mark_index = 0 else unit_mark_index = GetRaidTargetIndex(unit) end
			unit_mark_texture = ""
			
			if unit_mark_index ~= 0 then
				unit_mark_texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_"..unit_mark_index
			else
				unit_mark_texture = ""
			end				
			if unit == "Player" then
				GetClickFrame("IconMarksPlayerIcon"):SetNormalTexture(unit_mark_texture)
			else
				GetClickFrame("IconMarksParty"..i.."Icon"):SetNormalTexture(unit_mark_texture)			
			end				
		end		
	end
		self.sinceLastUpdate = 0;
	end
end
