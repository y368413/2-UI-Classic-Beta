--## Author: Vampyr78  ## Version: 1.4.6
local pairs, gsub = pairs, string.gsub
local statPriorityStats = {}
--WARRIORArms
statPriorityStats[71] = "Haste > Critical Strike > Versatility > Mastery > Strength"
--WARRIORFury
statPriorityStats[72] = "Critical Strike > Mastery > Haste > Versatility > Strength"
--WARRIORProtection
statPriorityStats[73] = "Haste > Versatility > Mastery > Critical Strike > Strength > Armor"
--PALADINHoly
statPriorityStats[65] = "Critical Strike > Haste > Versatility > Mastery > Intellect"
--PALADINProtection
statPriorityStats[66] = "Haste > Mastery > Versatility > Critical Strike"
--PALADINRetribution
statPriorityStats[70] = "Critical Strike > Haste = Versatility = Mastery > Strength"
--HUNTERBeast Mastery
statPriorityStats[253] = "Critical Strike > Versatility > Haste > Mastery"
--HUNTERMarksmanship
statPriorityStats[254] = "Versatility > Mastery > Critical Strike > Haste"
--HUNTERSurvival
statPriorityStats[255] = "Haste > Versatility > Critical Strike > Mastery"
--ROGUEAssassination
statPriorityStats[259] = "Critical Strike > Haste > Mastery > Versatility > Agility"
--ROGUEOutlaw
statPriorityStats[260] = "Critical Strike > Versatility > Haste > Mastery > Agility"
--ROGUESubtlety
statPriorityStats[261] = "Mastery > Critical Strike > Versatility > Haste"
--PRIESTDiscipline
statPriorityStats[256] = "Haste > Critical Strike > Intellect > Versatility > Mastery"
--PRIESTHoly
statPriorityStats[257] = "Critical Strike > Haste > Versatility > Intellect >  Mastery"
--PRIESTShadow
statPriorityStats[258] = "Haste = Critical Strike > Mastery = Versatility > Intellect"
--SHAMANElemental
statPriorityStats[262] = "Intellect > Versatility > Critical Strike > Haste > Mastery"
--SHAMANEnhancement
statPriorityStats[263] = "Mastery > Haste > Critical Strike = Versatility > Agility"
--SHAMANRestoration
statPriorityStats[264] = "Intellect > Critical Strike > Versatility > Haste = Mastery"
--MAGEArcane
statPriorityStats[62] = "Critical Strike > Haste > Mastery > Versatility > Intellect"
--MAGEFire
statPriorityStats[63] = "Mastery > Haste > Versatility > Critical Strike > Intellect"
--MAGEFrost
statPriorityStats[64] = "Mastery > Critical Strike(33.34%) > Haste > Versatility > Intellect"
--WARLOCKAffliction
statPriorityStats[265] = "Haste = Mastery > Critical Strike > Versatility > Intellect"
--WARLOCKDemonology
statPriorityStats[266] = "Critical Strike > Versatility > Mastery > Haste > Intellect"
--WARLOCKDestruction
statPriorityStats[267] = "Mastery  > Haste > Critical Strike > Versatility > Intellect"
--DRUIDBalance
statPriorityStats[102] = "Haste > Versatility = Critical Strike > Mastery > Intellect"
--DRUIDFeral
statPriorityStats[103] = "Critical Strike > Mastery > Versatility > Haste > Agility"
--DRUIDGuardian
statPriorityStats[104] = "Armor = Agility = Stamina > Versatility > Mastery > Haste > Critical Strike"
--DRUIDRestoration
statPriorityStats[105] = "Mastery = Haste > Versatility > Critical Strike > Intellect"
--MONKBrewmaster
statPriorityStats[268] = "Agility > Mastery > Critical Strike = Versatility > Haste"
--MONKMistweaver
statPriorityStats[270] = "Critical Strike > Mastery = Versatility > Intellect > Haste"
statPriorityStats["MONKFistweaver"] = "Critical Strike > Versatility > Haste > Mastery > Intellect"
--MONKWindwalker
statPriorityStats[269] = "Agility > Versatility > Mastery > Critical Strike > Haste"
--DEATHKNIGHTBlood
statPriorityStats[250] = "Strength > Versatility > Haste > Critical Strike > Mastery"
--DEATHKNIGHTFrost
statPriorityStats[251] = "Versatility > Mastery > Critical Strike > Haste"
--DEATHKNIGHTUnholy
statPriorityStats[252] = "Haste > Critical Strike = Versatility > Mastery"
--DEMONHUNTERHavoc
statPriorityStats[577] = "Versatility > Critical Strike = Haste > Agility > Mastery"
--DEMONHUNTERVengeance
statPriorityStats[581] = "Agility > Haste > Versatility > Mastery > Critical Strike"

function statPriorityFrameCreate(frame, text, parent)
	if parent:IsVisible() and UnitLevel("player") >= 55 then
		frame:SetFrameStrata("TOOLTIP")
		frame:SetWidth(parent:GetWidth() - 21)
		frame:SetHeight(21)
		text:ClearAllPoints()
		text:SetAllPoints(frame) 
		text:SetJustifyH("CENTER")
		text:SetJustifyV("CENTER")
		frame:ClearAllPoints()
		frame:SetPoint("BOTTOMRIGHT", parent, "TOPRIGHT",0,0)
		frame:SetParent(parent)
		frame:Show()
		return true
	end
	return false
end

function statPriorityFrameUpdate(frame, frameText, parent, unit)
	if parent ~= nil and statPriorityFrameCreate(frame, frameText, parent) then
        if select(2, UnitClass("player")) == "MONK" and IsSpellKnown(210802) then
			text = statPriorityStats["MONKFistweaver"]
		else
		    text = statPriorityStats[select(1,GetSpecializationInfo(GetSpecialization()))]
		end
	    text = gsub(text,"Strength",STAT_STRENGTH)
        text = gsub(text,"Agility",STAT_AGILITY)
        text = gsub(text,"Intellect",STAT_INTELLECT)
        text = gsub(text,"Versatility",STAT_VERSATILITY)
        text = gsub(text,"Armor",STAT_ARMOR)
        text = gsub(text,"Haste",STAT_HASTE)
        text = gsub(text,"Mastery",STAT_MASTERY)
        text = gsub(text,"Critical Strike",STAT_CRITICALSTRIKE) 
        text = gsub(text,"Stamina",STAT_STAMINA)
	frameText:SetText(text)
	end
end

local statPriorityFrame = CreateFrame("FRAME", nil, UIParent)
statPriorityText = statPriorityFrame:CreateFontString(nil, "OVERLAY", "GameFontWhite")
--statPriorityInspectFrame = CreateFrame("FRAME", nil, UIParent)
--statPriorityInspectText = statPriorityInspectFrame:CreateFontString(nil, "OVERLAY", "GameFontWhite")
statPriorityFrame:RegisterEvent("ADDON_LOADED")
statPriorityFrame:RegisterEvent("SPELLS_CHANGED")
--statPriorityFrame:RegisterEvent("INSPECT_READY");
statPriorityFrame:SetScript("OnEvent", function(self, event)
	if event == "ADDON_LOADED" then
		self:UnregisterEvent("ADDON_LOADED")
		PaperDollFrame:HookScript("OnShow", function() statPriorityFrameUpdate(self, statPriorityText, PaperDollFrame, "player") end)
	elseif event == "SPELLS_CHANGED" then
		statPriorityFrameUpdate(self, statPriorityText, PaperDollFrame, "player")
	--elseif event == "INSPECT_READY" then
		--statPriorityFrameUpdate(statPriorityInspectFrame, statPriorityInspectText, InspectPaperDollFrame, "target")
	end
end)
