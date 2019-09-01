-- Author      : 塞弗斯的咪咪@太阳之井
-- Create Date : 7/7/2019 00:07:52 AM
--------------------------------------------------
--local variable
--------------------------------------------------
local frame = CreateFrame("Frame") 
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED") 
local interrupteds = {}

--------------------------------------------------
--function
--------------------------------------------------

function CombatLogEventHandler(self,event,...)
	local timestamp,subEvent,hideCaster,sourceGUID,sourceName,sourceFlags,sourceRaidFlags,destGUID,destName,destFlags,destRaidFlags = CombatLogGetCurrentEventInfo()
	if (subEvent == "SPELL_INTERRUPT") and (interrupteds[destGUID] ~= nil) then	
		local castingName = strsplit("-",(sourceName or ""))
		local nameColor = GetNameColorByGUID(sourceGUID,sourceFlags)
		interrupteds[destGUID].Text:SetText(INTERRUPTED .. "(|c".. nameColor .. castingName.."|r)")
		interrupteds[destGUID] = nil
	end 
end

function CastingBarEventHandler(self,event,...)
	if event == "UNIT_SPELLCAST_INTERRUPTED" then
		local interruptedUnitID = ... --NamePlateX or target
		local interruptedNamePlate = C_NamePlate.GetNamePlateForUnit(interruptedUnitID)
		local interrupterdUnitCastBar = {}
		if interruptedNamePlate == nil then --Nameplate too far no display
			local interruptedGUID = UnitGUID(interruptedUnitID)
			interrupterdUnitCastBar = TargetFrameSpellBar --TargetFrame
			interrupteds[interruptedGUID] = interrupterdUnitCastBar
		else
			--local interruptedGUID = UnitGUID(interruptedUnitID)
			--interrupterdUnitCastBar = _G[C_NamePlate.GetNamePlateForUnit(interruptedUnitID):GetName().."UnitFrame"].castBar
			--interrupteds[interruptedGUID] = interrupterdUnitCastBar
		end
	elseif event == "UNIT_SPELLCAST_START" then
		local interruptedUnit = ...
		local castingTarget = interruptedUnit .. "target"
		local _, text = UnitCastingInfo(interruptedUnit)
		if self.Text then
			if UnitName(castingTarget) == UnitName("player") then
				self.Text:SetText(text .. "->|c" .. GetNameColorByUnitID(castingTarget) .. "你|r")
			else
				self.Text:SetText(text .. "->|c" .. GetNameColorByUnitID(castingTarget) .. (UnitName(castingTarget) or "").."|r")
			end
		end
	end
end

function GetNameColorByGUID(GUID,Flags)
	local className = ""
	local colorStr = ""
	if bit.band(Flags,COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
		local className, classId, raceName, raceId, gender, name, realm = GetPlayerInfoByGUID(GUID)
		colorStr = RAID_CLASS_COLORS[classId].colorStr
	else
		colorStr = "ff888888"
	end
	return colorStr
end

function GetNameColorByUnitID(UnitID)
	local colorStr = ""
	if UnitIsPlayer(UnitID) then
		local className, classFilename, classID = UnitClass(UnitID)
		local colorStr = RAID_CLASS_COLORS[classFilename].colorStr
		return colorStr
	else
		colorStr = "ff888888"
		return colorStr
	end
end



---------------------------------------------
--hook
---------------------------------------------
frame:SetScript("OnEvent",CombatLogEventHandler) --Show interrupter name in this function
hooksecurefunc("CastingBarFrame_OnEvent",CastingBarEventHandler) 