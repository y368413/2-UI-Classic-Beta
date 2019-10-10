local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:GetModule("Misc")

--[[
	一个工具条用来替代系统的经验条、声望条、神器经验等等
]]
local format, pairs = string.format, pairs
local min, mod, floor = math.min, mod, math.floor
local MAX_PLAYER_LEVEL = MAX_PLAYER_LEVEL
local MAX_REPUTATION_REACTION = MAX_REPUTATION_REACTION
local FACTION_BAR_COLORS = FACTION_BAR_COLORS
local NUM_FACTIONS_DISPLAYED = NUM_FACTIONS_DISPLAYED
local REPUTATION_PROGRESS_FORMAT = REPUTATION_PROGRESS_FORMAT

function MISC:ExpBar_Update()
	local rest = self.restBar
	if rest then rest:Hide() end

	if UnitLevel("player") < MAX_PLAYER_LEVEL then
		local xp, mxp, rxp = UnitXP("player"), UnitXPMax("player"), GetXPExhaustion()
		self:SetStatusBarColor(0, .7, 1)
		self:SetMinMaxValues(0, mxp)
		self:SetValue(xp)
		self:Show()
		if rxp then
			rest:SetMinMaxValues(0, mxp)
			rest:SetValue(min(xp + rxp, mxp))
			rest:Show()
		end
	elseif GetWatchedFactionInfo() then
		local _, standing, barMin, barMax, value, factionID = GetWatchedFactionInfo()
		if standing == MAX_REPUTATION_REACTION then barMin, barMax, value = 0, 1, 1 end
		self:SetStatusBarColor(FACTION_BAR_COLORS[standing].r, FACTION_BAR_COLORS[standing].g, FACTION_BAR_COLORS[standing].b, .85)
		self:SetMinMaxValues(barMin, barMax)
		self:SetValue(value)
		self:Show()
	else
		self:Hide()
	end
end

function MISC:ExpBar_UpdateTooltip()
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:ClearLines()
	GameTooltip:AddLine(LEVEL.." "..UnitLevel("player"), 0,.6,1)

	if UnitLevel("player") < MAX_PLAYER_LEVEL then
		GameTooltip:AddLine(" ")
		local xp, mxp, rxp = UnitXP("player"), UnitXPMax("player"), GetXPExhaustion()
		GameTooltip:AddDoubleLine(XP..":", xp.." / "..mxp.." ("..floor(xp/mxp*100).."%)", .6,.8,1, 1,1,1)
		if rxp then
			GameTooltip:AddDoubleLine(TUTORIAL_TITLE26..":", "+"..rxp.." ("..floor(rxp/mxp*100).."%)", .6,.8,1, 1,1,1)
		end
	end

	if I.MyClass == "HUNTER" then
		local currXP, nextXP = GetPetExperience()
		if nextXP ~= 0 then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(PET.." Lv"..UnitLevel("pet"), 0,.6,1)
			GameTooltip:AddDoubleLine(XP..":", currXP.." / "..nextXP.." ("..floor(currXP/nextXP*100).."%)", .6,.8,1, 1,1,1)
		end
	end

	if GetWatchedFactionInfo() then
		local name, standing, barMin, barMax, value, factionID = GetWatchedFactionInfo()
		if standing == MAX_REPUTATION_REACTION then
			barMax = barMin + 1e3
			value = barMax - 1
		end
		local standingtext = GetText("FACTION_STANDING_LABEL"..standing, UnitSex("player"))
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(name, 0,.6,1)
		GameTooltip:AddDoubleLine(standingtext, value - barMin.." / "..barMax - barMin.." ("..floor((value - barMin)/(barMax - barMin)*100).."%)", .6,.8,1, 1,1,1)
	end
	GameTooltip:Show()
end

function sendReport(target) 
   if GetXPExhaustion() then perRest = floor(GetXPExhaustion()/UnitXPMax("player")*100) end
   SendChatMessage("当前等级："..UnitLevel("player").."，当前经验值: "..UnitXP("player").."/"..UnitXPMax("player").." ("..floor(UnitXP("player")/UnitXPMax("player")*100).."%)"..(GetXPExhaustion() and (", 双倍经验"..perRest.."%.") or ", 无双倍经验."), target, nil, target == "whisper" and UnitName("target") or nil)
end
function sendReports() 
   if GetNumGroupMembers() > 0 or GetNumSubgroupMembers() > 0 then sendReport("PARTY")
   elseif IsInGuild() then sendReport("guild")
   else sendReport("say") end
   if UnitIsPlayer("target") and not UnitIsEnemy("player", "target") then sendReport("whisper") end
end

function MISC:SetupScript(bar)
	bar.eventList = {
		"PLAYER_XP_UPDATE",
		"PLAYER_LEVEL_UP",
		"UPDATE_EXHAUSTION",
		"PLAYER_ENTERING_WORLD",
		"UPDATE_FACTION",
		"UNIT_INVENTORY_CHANGED",
		"ENABLE_XP_GAIN",
		"DISABLE_XP_GAIN",
	}
	for _, event in pairs(bar.eventList) do
		bar:RegisterEvent(event)
	end
	bar:SetScript("OnEvent", MISC.ExpBar_Update)
	bar:SetScript("OnEnter", MISC.ExpBar_UpdateTooltip)
	bar:SetScript("OnLeave", M.HideTooltip)
	bar:SetScript("OnMouseUp", function(_, btn)
	  if btn == "LeftButton" then
		if HasArtifactEquipped() then
		   if not ArtifactFrame or not ArtifactFrame:IsShown() then SocketInventoryItem(16)
		   else ToggleFrame(ArtifactFrame)
		   end
		end
	  elseif btn == "RightButton" then
        if (UnitLevel("player") ~= MAX_PLAYER_LEVEL) then sendReports() else return end
      end
	end)
end

function MISC:Expbar()
	if not MaoRUISettingDB["Misc"]["ExpRep"] then return end

	local bar = CreateFrame("StatusBar", nil, Minimap)
	bar:SetPoint("TOP", Minimap, "BOTTOM", 0, 0)
	bar:SetSize(Minimap:GetWidth()-2, 3)
	bar:SetHitRectInsets(0, 0, 0, -10)
	M.CreateSB(bar)

	local rest = CreateFrame("StatusBar", nil, bar)
	rest:SetAllPoints()
	rest:SetStatusBarTexture(I.normTex)
	rest:SetStatusBarColor(0, .4, 1, .6)
	rest:SetFrameLevel(bar:GetFrameLevel() - 1)
	bar.restBar = rest

	self:SetupScript(bar)
end
