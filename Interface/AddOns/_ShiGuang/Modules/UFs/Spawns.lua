local _, ns = ...
local M, R, U, I = unpack(ns)

local oUF = ns.oUF or oUF
local UF = M:GetModule("UnitFrames")
local format, tostring = string.format, tostring

-- Units
local function CreatePlayerStyle(self)
	self.mystyle = "player"
	self:SetSize(MaoRUIPerDB["UFs"]["PlayerWidth"], MaoRUIPerDB["UFs"]["PlayerHeight"])

	UF:CreateHeader(self)
	UF:CreateHealthBar(self)
	UF:CreateHealthText(self)
	UF:CreatePowerBar(self)
	UF:CreatePowerText(self)
	UF:CreatePortrait(self)
	UF:CreateCastBar(self)
	UF:CreateRaidMark(self)
	UF:CreateIcons(self)
	UF:CreatePrediction(self)
	UF:CreateFCT(self)
	UF:CreateAddPower(self)

	if not MaoRUIPerDB["Nameplate"]["ShowPlayerPlate"] or MaoRUIPerDB["Nameplate"]["ClassPowerOnly"] then
		UF:CreateEneryTicker(self)
	end
	if MaoRUIPerDB["UFs"]["Castbars"] then
		UF:ReskinMirrorBars()
		--UF:ReskinTimerTrakcer(self)
	end
	if MaoRUIPerDB["UFs"]["ClassPower"] and not MaoRUIPerDB["Nameplate"]["ShowPlayerPlate"] then
		UF:CreateClassPower(self)
		UF:StaggerBar(self)
	end
	if not MaoRUIPerDB["Misc"]["ExpRep"] then UF:CreateExpRepBar(self) end
	if MaoRUIPerDB["UFs"]["PlayerDebuff"] then UF:CreateDebuffs(self) end
	if MaoRUIPerDB["UFs"]["SwingBar"] then UF:CreateSwing(self) end
end

local function CreateTargetStyle(self)
	self.mystyle = "target"
	self:SetSize(MaoRUIPerDB["UFs"]["PlayerWidth"], MaoRUIPerDB["UFs"]["PlayerHeight"])

	UF:CreateHeader(self)
	UF:CreateHealthBar(self)
	UF:CreateHealthText(self)
	UF:CreatePowerBar(self)
	UF:CreatePowerText(self)
	UF:CreatePortrait(self)
	UF:CreateCastBar(self)
	UF:CreateRaidMark(self)
	UF:CreateIcons(self)
	UF:CreatePrediction(self)
	UF:CreateFCT(self)
	UF:CreateAuras(self)
end

local function CreateToTStyle(self)
	self.mystyle = "tot"
	self:SetSize(MaoRUIPerDB["UFs"]["PetWidth"], MaoRUIPerDB["UFs"]["PetHeight"])

	UF:CreateHeader(self)
	UF:CreateHealthBar(self)
	UF:CreateHealthText(self)
	UF:CreatePowerBar(self)
	UF:CreateRaidMark(self)

	if MaoRUIPerDB["UFs"]["ToTAuras"] then UF:CreateAuras(self) end
end

local function CreatePetStyle(self)
	self.mystyle = "pet"
	self:SetSize(MaoRUIPerDB["UFs"]["PetWidth"], MaoRUIPerDB["UFs"]["PetHeight"])

	UF:CreateHeader(self)
	UF:CreateHealthBar(self)
	UF:CreateHealthText(self)
	UF:CreatePowerBar(self)
	UF:CreateRaidMark(self)
end

local function CreateRaidStyle(self)
	self.mystyle = "raid"
	self.Range = {
		insideAlpha = 1, outsideAlpha = .4,
	}

	UF:CreateHeader(self)
	UF:CreateHealthBar(self)
	UF:CreateHealthText(self)
	UF:CreatePowerBar(self)
	UF:CreateRaidMark(self)
	UF:CreateIcons(self)
	UF:CreateTargetBorder(self)
	UF:CreateRaidIcons(self)
	UF:CreatePrediction(self)
	UF:CreateClickSets(self)
	UF:CreateRaidDebuffs(self)
	UF:CreateThreatBorder(self)
	UF:CreateAuras(self)
	UF:CreateBuffIndicator(self)
end

local function CreatePartyStyle(self)
	self.isPartyFrame = true
	CreateRaidStyle(self)
end

local function CreatePartyPetStyle(self)
	self.mystyle = "partypet"
	self.Range = {
		insideAlpha = 1, outsideAlpha = .4,
	}

	UF:CreateHeader(self)
	UF:CreateHealthBar(self)
	UF:CreateHealthText(self)
	UF:CreatePowerBar(self)
	UF:CreateRaidMark(self)
	UF:CreateTargetBorder(self)
	UF:CreatePrediction(self)
	UF:CreateClickSets(self)
	UF:CreateThreatBorder(self)
end

-- Spawns
function UF:OnLogin()
	local horizonRaid = MaoRUIPerDB["UFs"]["HorizonRaid"]
	local horizonParty = MaoRUIPerDB["UFs"]["HorizonParty"]
	local numGroups = MaoRUIPerDB["UFs"]["NumGroups"]
	local scale = MaoRUIPerDB["UFs"]["SimpleRaidScale"]/10
	local raidWidth, raidHeight = MaoRUIPerDB["UFs"]["RaidWidth"], MaoRUIPerDB["UFs"]["RaidHeight"]
	local raidPowerHeight = MaoRUIPerDB["UFs"]["RaidPowerHeight"]
	local showPartyFrame = MaoRUIPerDB["UFs"]["PartyFrame"]
	local partyWidth, partyHeight = MaoRUIPerDB["UFs"]["PartyWidth"], MaoRUIPerDB["UFs"]["PartyHeight"]
	local showPartyPetFrame = MaoRUIPerDB["UFs"]["PartyPetFrame"]
	local petWidth, petHeight = MaoRUIPerDB["UFs"]["PartyPetWidth"], MaoRUIPerDB["UFs"]["PartyPetHeight"]

	if MaoRUIPerDB["Nameplate"]["Enable"] then
		self:SetupCVars()
		self:BlockAddons()
		self:CreateUnitTable()
		self:CreatePowerUnitTable()
		self:AddInterruptInfo()
		self:QuestIconCheck()

		oUF:RegisterStyle("Nameplates", UF.CreatePlates)
		oUF:SetActiveStyle("Nameplates")
		oUF:SpawnNamePlates("oUF_NPs", UF.PostUpdatePlates)
	end

	if MaoRUIPerDB["Nameplate"]["ShowPlayerPlate"] then
		oUF:RegisterStyle("PlayerPlate", UF.CreatePlayerPlate)
		oUF:SetActiveStyle("PlayerPlate")
		local plate = oUF:Spawn("player", "oUF_PlayerPlate", true)
		M.Mover(plate, U["PlayerNP"], "PlayerPlate", R.UFs.PlayerPlate, plate:GetWidth(), 20)

		UF:TogglePlayerPlateElements()
	end

	-- Default Clicksets for RaidFrame
	self:DefaultClickSets()

	if MaoRUIPerDB["UFs"]["Enable"] then
		-- Register
		oUF:RegisterStyle("Player", CreatePlayerStyle)
		oUF:RegisterStyle("Target", CreateTargetStyle)
		oUF:RegisterStyle("ToT", CreateToTStyle)
		oUF:RegisterStyle("Pet", CreatePetStyle)

		-- Loader
		oUF:SetActiveStyle("Player")
		local player = oUF:Spawn("player", "oUF_Player")
		M.Mover(player, U["PlayerUF"], "PlayerUF", R.UFs.PlayerPos)

		oUF:SetActiveStyle("Target")
		local target = oUF:Spawn("target", "oUF_Target")
		M.Mover(target, U["TargetUF"], "TargetUF", R.UFs.TargetPos)

		oUF:SetActiveStyle("ToT")
		local targettarget = oUF:Spawn("targettarget", "oUF_ToT")
		M.Mover(targettarget, U["TotUF"], "TotUF", R.UFs.ToTPos)

		oUF:SetActiveStyle("Pet")
		local pet = oUF:Spawn("pet", "oUF_Pet")
		M.Mover(pet, U["PetUF"], "PetUF", R.UFs.PetPos)

		UF:UpdateTextScale()
	end

	if MaoRUIPerDB["UFs"]["RaidFrame"] then
		UF:AddClickSetsListener()

		-- Hide Default RaidFrame
		if CompactRaidFrameManager_SetSetting then
			CompactRaidFrameManager_SetSetting("IsShown", "0")
			UIParent:UnregisterEvent("GROUP_ROSTER_UPDATE")
			CompactRaidFrameManager:UnregisterAllEvents()
			CompactRaidFrameManager:SetParent(M.HiddenFrame)
		end

		-- Group Styles
		if showPartyFrame then
			oUF:RegisterStyle("Party", CreatePartyStyle)
			oUF:SetActiveStyle("Party")

			local xOffset, yOffset = 5, 10
			local moverWidth = horizonParty and (partyWidth*5+xOffset*4) or partyWidth
			local moverHeight = horizonParty and partyHeight or (partyHeight*5+yOffset*4)
			local groupingOrder = horizonParty and "TANK,HEALER,DAMAGER,NONE" or "NONE,DAMAGER,HEALER,TANK"

			local party = oUF:SpawnHeader("oUF_Party", nil, "solo,party",
			"showPlayer", true,
			"showSolo", false,
			"showParty", true,
			"showRaid", false,
			"xoffset", xOffset,
			"yOffset", yOffset,
			"groupingOrder", groupingOrder,
			"groupBy", "ASSIGNEDROLE",
			"sortMethod", "NAME",
			"point", horizonParty and "LEFT" or "BOTTOM",
			"columnAnchorPoint", "LEFT",
			"oUF-initialConfigFunction", ([[
			self:SetWidth(%d)
			self:SetHeight(%d)
			]]):format(partyWidth, partyHeight))

			local partyMover = M.Mover(party, U["PartyFrame"], "PartyFrame", {"LEFT", UIParent, 350, 0}, moverWidth, moverHeight)
			party:ClearAllPoints()
			party:SetPoint("BOTTOMLEFT", partyMover)

			if showPartyPetFrame then
				oUF:RegisterStyle("PartyPet", CreatePartyPetStyle)
				oUF:SetActiveStyle("PartyPet")

				local petMoverWidth = horizonParty and (petWidth*5+xOffset*4) or petWidth
				local petMoverHeight = horizonParty and petHeight or (petHeight*5+yOffset*4)

				local partyPet = oUF:SpawnHeader("oUF_PartyPet", nil, "solo,party",
				"showPlayer", true,
				"showSolo", false,
				"showParty", true,
				"showRaid", false,
				"xoffset", xOffset,
				"yOffset", yOffset,
				"point", horizonParty and "LEFT" or "BOTTOM",
				"columnAnchorPoint", "LEFT",
				"oUF-initialConfigFunction", ([[
				self:SetWidth(%d)
				self:SetHeight(%d)
				self:SetAttribute("unitsuffix", "pet")
				]]):format(petWidth, petHeight))

				local moverAnchor = horizonParty and {"TOPLEFT", partyMover, "BOTTOMLEFT", 0, -20} or {"BOTTOMRIGHT", partyMover, "BOTTOMLEFT", -10, 0}
				local petMover = M.Mover(partyPet, U["PartyPetFrame"], "PartyPetFrame", moverAnchor, petMoverWidth, petMoverHeight)
				partyPet:ClearAllPoints()
				partyPet:SetPoint("BOTTOMLEFT", petMover)
			end
		end

		oUF:RegisterStyle("Raid", CreateRaidStyle)
		oUF:SetActiveStyle("Raid")

		local raidMover
		if MaoRUIPerDB["UFs"]["SimpleMode"] then
			local groupingOrder, groupBy, sortMethod = "1,2,3,4,5,6,7,8", "GROUP", "INDEX"
			if MaoRUIPerDB["UFs"]["SimpleModeSortByRole"] then
				groupingOrder, groupBy, sortMethod = "TANK,HEALER,DAMAGER,NONE", "ASSIGNEDROLE", "NAME"
			end

			local function CreateGroup(name, i)
				local group = oUF:SpawnHeader(name, nil, "solo,party,raid",
				"showPlayer", true,
				"showSolo", false,
				"showParty", not showPartyFrame,
				"showRaid", true,
				"xoffset", 5,
				"yOffset", -10,
				"groupFilter", tostring(i),
				"groupingOrder", groupingOrder,
				"groupBy", groupBy,
				"sortMethod", sortMethod,
				"maxColumns", 2,
				"unitsPerColumn", 20,
				"columnSpacing", 5,
				"point", "TOP",
				"columnAnchorPoint", "LEFT",
				"oUF-initialConfigFunction", ([[
				self:SetWidth(%d)
				self:SetHeight(%d)
				]]):format(100*scale, 20*scale))
				return group
			end

			local groupFilter
			if numGroups == 4 then
				groupFilter = "1,2,3,4"
			elseif numGroups == 5 then
				groupFilter = "1,2,3,4,5"
			elseif numGroups == 6 then
				groupFilter = "1,2,3,4,5,6"
			elseif numGroups == 7 then
				groupFilter = "1,2,3,4,5,6,7"
			elseif numGroups == 8 then
				groupFilter = "1,2,3,4,5,6,7,8"
			end

			local group = CreateGroup("oUF_Raid", groupFilter)
			local moverWidth = numGroups > 4 and (100*scale*2 + 5) or 100
			local moverHeight = 20*scale*20 + 10*19
			raidMover = M.Mover(group, U["RaidFrame"], "RaidFrame", {"TOPLEFT", UIParent, 35, -50}, moverWidth, moverHeight)
		else
			local function CreateGroup(name, i)
				local group = oUF:SpawnHeader(name, nil, "solo,party,raid",
				"showPlayer", true,
				"showSolo", false,
				"showParty", not showPartyFrame,
				"showRaid", true,
				"xoffset", 5,
				"yOffset", -10,
				"groupFilter", tostring(i),
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"groupBy", "GROUP",
				"sortMethod", "INDEX",
				"maxColumns", 1,
				"unitsPerColumn", 5,
				"columnSpacing", 5,
				"point", horizonRaid and "LEFT" or "TOP",
				"columnAnchorPoint", "LEFT",
				"oUF-initialConfigFunction", ([[
				self:SetWidth(%d)
				self:SetHeight(%d)
				]]):format(raidWidth, raidHeight))
				return group
			end

			local groups = {}
			for i = 1, numGroups do
				groups[i] = CreateGroup("oUF_Raid"..i, i)
				if i == 1 then
					if horizonRaid then
						groups[i].mover = M.Mover(groups[i], U["RaidFrame"]..i, "RaidFrame"..i, {"TOPLEFT", UIParent, 35, -50}, (raidWidth+5)*5, raidHeight + raidPowerHeight + 3)
					else
						groups[i].mover = M.Mover(groups[i], U["RaidFrame"]..i, "RaidFrame"..i, {"TOPLEFT", UIParent, 35, -50}, raidWidth, (raidHeight + raidPowerHeight + 3)*5)
					end
				else
					if horizonRaid then
						groups[i].mover = M.Mover(groups[i], U["RaidFrame"]..i, "RaidFrame"..i, {"TOPLEFT", groups[i-1], "BOTTOMLEFT", 0, MaoRUIPerDB["UFs"]["ShowTeamIndex"] and -25 or -15}, (raidWidth+5)*5, raidHeight + raidPowerHeight + 3)
					else
						groups[i].mover = M.Mover(groups[i], U["RaidFrame"]..i, "RaidFrame"..i, {"TOPLEFT", groups[i-1], "TOPRIGHT", 5, 0}, raidWidth, (raidHeight + raidPowerHeight + 3)*5)
					end
				end

				if MaoRUIPerDB["UFs"]["ShowTeamIndex"] then
					local parent = _G["oUF_Raid"..i.."UnitButton1"]
					local teamIndex = M.CreateFS(parent, 12, format(GROUP_NUMBER, i))
					teamIndex:ClearAllPoints()
					teamIndex:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", 0, 5)
					teamIndex:SetTextColor(.6, .8, 1)
				end
			end
		end

		if raidMover then
			if I.isClassic then return end
			if not MaoRUIPerDB["UFs"]["SpecRaidPos"] then return end

			local function UpdateSpecPos(event, ...)
				local unit, _, spellID = ...
				if (event == "UNIT_SPELLCAST_SUCCEEDED" and unit == "player" and spellID == 200749) or event == "PLAYER_ENTERING_WORLD" then
					if not GetSpecialization() then return end
					local specIndex = GetSpecialization()
					if not MaoRUIPerDB["Mover"]["RaidPos"..specIndex] then
						MaoRUIPerDB["Mover"]["RaidPos"..specIndex] = {"TOPLEFT", "UIParent", "TOPLEFT", 35, -50}
					end
					raidMover:ClearAllPoints()
					raidMover:SetPoint(unpack(MaoRUIPerDB["Mover"]["RaidPos"..specIndex]))
				end
			end
			M:RegisterEvent("PLAYER_ENTERING_WORLD", UpdateSpecPos)
			M:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", UpdateSpecPos)

			raidMover:HookScript("OnDragStop", function()
				if not GetSpecialization() then return end
				local specIndex = GetSpecialization()
				MaoRUIPerDB["Mover"]["RaidPos"..specIndex] = MaoRUIPerDB["Mover"]["RaidFrame"]
			end)
		end
	end
end