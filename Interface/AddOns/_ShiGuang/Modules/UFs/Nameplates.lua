local _, ns = ...
local M, R, U, I = unpack(ns)
local UF = M:GetModule("UnitFrames")

local _G = getfenv(0)
local strmatch, tonumber, pairs, unpack, rad = string.match, tonumber, pairs, unpack, math.rad
local UnitThreatSituation, UnitIsTapDenied, UnitPlayerControlled, UnitIsUnit = UnitThreatSituation, UnitIsTapDenied, UnitPlayerControlled, UnitIsUnit
local UnitReaction, UnitIsConnected, UnitIsPlayer, UnitSelectionColor = UnitReaction, UnitIsConnected, UnitIsPlayer, UnitSelectionColor
local UnitClassification, UnitExists, InCombatLockdown = UnitClassification, UnitExists, InCombatLockdown
local UnitGUID, GetPlayerInfoByGUID, Ambiguate, UnitName = UnitGUID, GetPlayerInfoByGUID, Ambiguate, UnitName
local SetCVar, UIFrameFadeIn, UIFrameFadeOut = SetCVar, UIFrameFadeIn, UIFrameFadeOut
local C_NamePlate_GetNamePlateForUnit = C_NamePlate.GetNamePlateForUnit
local INTERRUPTED = INTERRUPTED

-- Init
function UF:UpdatePlateScale()
	SetCVar("namePlateMinScale", MaoRUIPerDB["Nameplate"]["MinScale"])
	SetCVar("namePlateMaxScale", MaoRUIPerDB["Nameplate"]["MinScale"])
end

function UF:UpdatePlateAlpha()
	SetCVar("nameplateMinAlpha", GetCVarDefault("nameplateMinAlpha"))
	SetCVar("nameplateMaxAlpha", GetCVarDefault("nameplateMaxAlpha"))
end

function UF:UpdatePlateRange()
	SetCVar("nameplateMaxDistance", GetCVarDefault("nameplateMaxDistance"))
end

function UF:UpdatePlateSpacing()
	SetCVar("nameplateOverlapV", MaoRUIPerDB["Nameplate"]["VerticalSpacing"])
end

function UF:SetupCVars()
	SetCVar("nameplateOverlapH", .8)
	UF:UpdatePlateSpacing()
	UF:UpdatePlateRange()
	UF:UpdatePlateAlpha()
	SetCVar("nameplateSelectedAlpha", 1)

	UF:UpdatePlateScale()
	--SetCVar("nameplateSelectedScale", 1.25)
	--SetCVar("nameplateLargerScale", 1.1)
end

function UF:BlockAddons()
	if not DBM or not DBM.Nameplate then return end

	function DBM.Nameplate:SupportedNPMod()
		return true
	end

	local function showAurasForDBM(_, _, _, spellID)
		if not tonumber(spellID) then return end
		if not R.WhiteList[spellID] then
			R.WhiteList[spellID] = true
		end
	end
	hooksecurefunc(DBM.Nameplate, "Show", showAurasForDBM)
end

-- Elements
local customUnits = {}
function UF:CreateUnitTable()
	wipe(customUnits)
	if not MaoRUIPerDB["Nameplate"]["CustomUnitColor"] then return end
	M.CopyTable(R.CustomUnits, customUnits)
	M.SplitList(customUnits, MaoRUIPerDB["Nameplate"]["UnitList"])
end

local showPowerList = {}
function UF:CreatePowerUnitTable()
	wipe(showPowerList)
	M.CopyTable(R.ShowPowerList, showPowerList)
	M.SplitList(showPowerList, MaoRUIPerDB["Nameplate"]["ShowPowerList"])
end

function UF:UpdateUnitPower()
	local unitName = self.unitName
	local npcID = self.npcID
	local shouldShowPower = showPowerList[unitName] or showPowerList[npcID]
	if shouldShowPower then
		self.powerText:Show()
	else
		self.powerText:Hide()
	end
end

-- Update unit color
function UF:UpdateColor(_, unit)
	if not unit or self.unit ~= unit then return end

	local element = self.Health
	local name = self.unitName
	local npcID = self.npcID
	local isCustomUnit = customUnits[name] or customUnits[npcID]
	local isPlayer = self.isPlayer
	local isFriendly = self.isFriendly
	local status = UnitThreatSituation("player", unit) or false -- just in case
	local isTargeting = UnitIsUnit(unit.."target", "player")
	local customColor = MaoRUIPerDB["Nameplate"]["CustomColor"]
	local secureColor = MaoRUIPerDB["Nameplate"]["SecureColor"]
	local transColor = MaoRUIPerDB["Nameplate"]["TransColor"]
	local insecureColor = MaoRUIPerDB["Nameplate"]["InsecureColor"]
	local r, g, b

	if not UnitIsConnected(unit) then
		r, g, b = .7, .7, .7
	else
		if isCustomUnit then
			r, g, b = customColor.r, customColor.g, customColor.b
		elseif isPlayer and isFriendly then
			if MaoRUIPerDB["Nameplate"]["FriendlyCC"] then
				r, g, b = M.UnitColor(unit)
			else
				r, g, b = .3, .3, 1
			end
		elseif isPlayer and (not isFriendly) and MaoRUIPerDB["Nameplate"]["HostileCC"] then
			r, g, b = M.UnitColor(unit)
		elseif UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
			r, g, b = .6, .6, .6
		else
			r, g, b = UnitSelectionColor(unit, true)
			if status and MaoRUIPerDB["Nameplate"]["TankMode"] then
				if status == 3 then
					r, g, b = secureColor.r, secureColor.g, secureColor.b
				elseif status == 2 or status == 1 then
					r, g, b = transColor.r, transColor.g, transColor.b
				elseif status == 0 then
					r, g, b = insecureColor.r, insecureColor.g, insecureColor.b
				end
			end
		end
	end

	if r or g or b then
		element:SetStatusBarColor(r, g, b)
	end

	if isCustomUnit or not MaoRUIPerDB["Nameplate"]["TankMode"] then
		if status and status == 3 then
			self.ThreatIndicator:SetBackdropBorderColor(1, 0, 0)
			self.ThreatIndicator:Show()
		elseif status and (status == 2 or status == 1) then
			self.ThreatIndicator:SetBackdropBorderColor(1, 1, 0)
			self.ThreatIndicator:Show()
		else
			self.ThreatIndicator:Hide()
		end
	else
		self.ThreatIndicator:Hide()
	end
end

function UF:UpdateThreatColor(_, unit)
	if unit ~= self.unit then return end

	UF.UpdateColor(self, _, unit)
end

function UF:CreateThreatColor(self)
	local threatIndicator = M.CreateSD(self, 3, true)
	threatIndicator:SetOutside(self.Health.backdrop, 3, 3)
	threatIndicator:Hide()

	self.ThreatIndicator = threatIndicator
	self.ThreatIndicator.Override = UF.UpdateThreatColor
end

-- Target indicator
function UF:UpdateTargetChange()
	local element = self.TargetIndicator
	if MaoRUIPerDB["Nameplate"]["TargetIndicator"] == 1 then return end

	if UnitIsUnit(self.unit, "target") and not UnitIsUnit(self.unit, "player") then
		element:Show()
	else
		element:Hide()
	end
end

function UF:UpdateTargetIndicator()
	local style = MaoRUIPerDB["Nameplate"]["TargetIndicator"]
	local element = self.TargetIndicator
	local isNameOnly = self.isNameOnly
	if style == 1 then
		element:Hide()
	else
		if style == 2 then
			element.TopArrow:Show()
			element.LeftArrow:Hide()
			element.RightArrow:Hide()
			element.Glow:Hide()
			element.nameGlow:Hide()
		elseif style == 3 then
			element.TopArrow:Hide()
			element.LeftArrow:Show()
			element.RightArrow:Show()
			element.Glow:Hide()
			element.nameGlow:Hide()
		elseif style == 4 then
			element.TopArrow:Hide()
			element.LeftArrow:Hide()
			element.RightArrow:Hide()
			if isNameOnly then
				element.Glow:Hide()
				element.nameGlow:Show()
			else
				element.Glow:Show()
				element.nameGlow:Hide()
			end
		elseif style == 5 then
			element.TopArrow:Show()
			element.LeftArrow:Hide()
			element.RightArrow:Hide()
			if isNameOnly then
				element.Glow:Hide()
				element.nameGlow:Show()
			else
				element.Glow:Show()
				element.nameGlow:Hide()
			end
		elseif style == 6 then
			element.TopArrow:Hide()
			element.LeftArrow:Show()
			element.RightArrow:Show()
			if isNameOnly then
				element.Glow:Hide()
				element.nameGlow:Show()
			else
				element.Glow:Show()
				element.nameGlow:Hide()
			end
		end
		element:Show()
	end
end

function UF:AddTargetIndicator(self)
	local frame = CreateFrame("Frame", nil, self)
	frame:SetAllPoints()
	frame:SetFrameLevel(0)
	frame:Hide()

	frame.TopArrow = frame:CreateTexture(nil, "BACKGROUND", nil, -6)
	frame.TopArrow:SetSize(52, 52)
	frame.TopArrow:SetTexture(I.arrowTex)
	frame.TopArrow:SetVertexColor(1, 0, 0, 1)
	frame.TopArrow:SetPoint("BOTTOM", frame, "TOP", 0, 21)
	
	frame.LeftArrow = frame:CreateTexture(nil, "BACKGROUND", nil, -6)
	frame.LeftArrow:SetSize(36, 36)
	frame.LeftArrow:SetTexture(I.arrowTex)
	frame.LeftArrow:SetVertexColor(1, 0, 0, 1)
	frame.LeftArrow:SetPoint("RIGHT", frame, "LEFT", -1, 0)
	frame.LeftArrow:SetRotation(rad(90))
	
	frame.RightArrow = frame:CreateTexture(nil, "BACKGROUND", nil, -6)
	frame.RightArrow:SetSize(36, 36)
	frame.RightArrow:SetTexture(I.arrowTex)
	frame.RightArrow:SetVertexColor(1, 0, 0, 1)
	frame.RightArrow:SetPoint("LEFT", frame, "RIGHT", 1, 0)
	frame.RightArrow:SetRotation(rad(-90))

	frame.Glow = M.CreateSD(frame, 6, true)
	frame.Glow:SetOutside(self.Health.backdrop, 5, 5)
	frame.Glow:SetBackdropBorderColor(1, 1, 1)
	frame.Glow:SetFrameLevel(0)

	frame.nameGlow = frame:CreateTexture(nil, "BACKGROUND", nil, -5)
	frame.nameGlow:SetSize(150, 80)
	frame.nameGlow:SetTexture("Interface\\GLUES\\Models\\UI_Draenei\\GenericGlow64")
	frame.nameGlow:SetVertexColor(0, .6, 1)
	frame.nameGlow:SetBlendMode("ADD")
	frame.nameGlow:SetPoint("CENTER", self, "BOTTOM")

	self.TargetIndicator = frame
	self:RegisterEvent("PLAYER_TARGET_CHANGED", UF.UpdateTargetChange, true)
	UF.UpdateTargetIndicator(self)
end

-- Quest progress
local isInInstance
local function CheckInstanceStatus()
	isInInstance = IsInInstance()
end

function UF:QuestIconCheck()
	if not MaoRUIPerDB["Nameplate"]["QuestIndicator"] then return end

	CheckInstanceStatus()
	M:RegisterEvent("PLAYER_ENTERING_WORLD", CheckInstanceStatus)
end

function UF:UpdateQuestUnit(_, unit)
	if not MaoRUIPerDB["Nameplate"]["QuestIndicator"] then return end
	if isInInstance then
		self.questIcon:Hide()
		self.questCount:SetText("")
		return
	end

	unit = unit or self.unit

	local isLootQuest, questProgress
	M.ScanTip:SetOwner(UIParent, "ANCHOR_NONE")
	M.ScanTip:SetUnit(unit)

	for i = 2, M.ScanTip:NumLines() do
		local textLine = _G["NDui_ScanTooltipTextLeft"..i]
		local text = textLine:GetText()
		if textLine and text then
			local r, g, b = textLine:GetTextColor()
			local unitName, progressText = strmatch(text, "^ ([^ ]-) ?%- (.+)$")
			if r > .99 and g > .82 and b == 0 then
				isLootQuest = true
			elseif unitName and progressText then
				isLootQuest = false
				if unitName == "" or unitName == I.MyName then
					local current, goal = strmatch(progressText, "(%d+)/(%d+)")
					local progress = strmatch(progressText, "([%d%.]+)%%")
					if current and goal then
						if tonumber(current) < tonumber(goal) then
							questProgress = goal - current
							break
						end
					elseif progress then
						progress = tonumber(progress)
						if progress and progress < 100 then
							questProgress = 100 - progress
							break
						end
					else
						isLootQuest = true
						break
					end
				end
			end
		end
	end

	if questProgress then
		self.questCount:SetText(questProgress)
		--self.questIcon:SetTexture("Interface/WorldMap/UI-WorldMap-QuestIcon")		--self.questIcon:SetAtlas(I.objectTex)
		--self.questIcon:SetTexCoord(0, 0.56, 0.5, 1)
		--self.questIcon:Show()
	else
		self.questCount:SetText("")
		if isLootQuest then
			self.questIcon:SetAtlas('Banker')			--self.questIcon:SetAtlas(I.questTex)
			self.questIcon:Show()
		else
			self.questIcon:Hide()
		end
	end
end

function UF:UpdateForQuestie(name)
	local data = name and QuestieTooltips.tooltipLookup["u_"..name]
	if data then
		local foundObjective, progressText
		for _, tooltip in pairs(data) do
			local questID = tooltip.Objective.QuestData.Id
			QuestieQuest:UpdateQuest(questID)
			if qCurrentQuestlog[questID] then
				foundObjective = true
				if tooltip.Objective.Needed then
					progressText = tooltip.Objective.Needed - tooltip.Objective.Collected
					if progressText == 0 then
						foundObjective = nil
					end
					break
				end
			end
		end
		if foundObjective then
			self.questIcon:Show()
			self.questCount:SetText(progressText)
		end
	end
end

function UF:UpdateCodexQuestUnit(name)
	if name and CodexMap.tooltips[name] then
		for _, meta in pairs(CodexMap.tooltips[name]) do
			local questData = meta["quest"]
			local quests = CodexDB.quests.loc

			if questData then
				for questIndex = 1, GetNumQuestLogEntries() do
					local _, _, _, header, _, _, _, questId = GetQuestLogTitle(questIndex)
					if not header and quests[questId] and questData == quests[questId].T then
						local objectives = GetNumQuestLeaderBoards(questIndex)
						local foundObjective, progressText = nil
						if objectives then
							for i = 1, objectives do
								local text, type = GetQuestLogLeaderBoard(i, questIndex)
								if type == "monster" then
									local _, _, monsterName, objNum, objNeeded = strfind(text, Codex:SanitizePattern(QUEST_MONSTERS_KILLED))
									if meta["spawn"] == monsterName then
										progressText = objNeeded - objNum
										foundObjective = true
										break
									end
								elseif table.getn(meta["item"]) > 0 and type == "item" and meta["dropRate"] then
									local _, _, itemName, objNum, objNeeded = strfind(text, Codex:SanitizePattern(QUEST_OBJECTS_FOUND))
									for _, item in pairs(meta["item"]) do
										if item == itemName then
											progressText = objNeeded - objNum
											foundObjective = true
											break
										end
									end
								end
							end
						end

						if foundObjective and progressText > 0 then
							self.questIcon:Show()
							self.questCount:SetText(progressText)
						elseif not foundObjective then
							self.questIcon:Show()
						end
					end
				end
			end
		end
	end
end

function UF:UpdateQuestIndicator()
	if not MaoRUIPerDB["Nameplate"]["QuestIndicator"] then return end

	self.questIcon:Hide()
	self.questCount:SetText("")

	local name = self.unitName
	if CodexMap then
		UF.UpdateCodexQuestUnit(self, name)
	elseif QuestieTooltips then
		UF.UpdateForQuestie(self, name)
	end
end

function UF:AddQuestIcon(self)
	if not MaoRUIPerDB["Nameplate"]["QuestIndicator"] then return end

	local qicon = self:CreateTexture(nil, "OVERLAY", nil, 2)
	qicon:SetPoint("RIGHT", self, "LEFT", 0, 0)
	qicon:SetSize(26, 26)
	--qicon:SetAtlas(I.questTex)
	qicon:SetTexture("Interface/WorldMap/UI-WorldMap-QuestIcon")
	qicon:SetTexCoord(0, 0.56, 0.5, 1)
	qicon:Hide()
	--local count = M.CreateFS(self, 18, "", nil, "LEFT", 0, 0)
	local count = self:CreateFontString(nil, 'OVERLAY')
	count:SetPoint("RIGHT", qicon, "LEFT", 12, 2)
	count:SetShadowOffset(1, -1)
	count:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Infinity.ttf", 16, "OUTLINE")
	count:SetTextColor(1,.82,0)

	self.questIcon = qicon
	self.questCount = count
	--self:RegisterEvent("QUEST_LOG_UPDATE", UF.UpdateQuestUnit, true)
	self:RegisterEvent("QUEST_LOG_UPDATE", UF.UpdateQuestIndicator, true)
end

-- Unit classification
local classify = {
	rare = {"Interface\\MINIMAP\\ObjectIcons", .391, .487, .644, .74},  --rare = {1, 1, 1, true},
	elite = {"Interface\\MINIMAP\\Minimap_skull_elite", 0, 1, 0, 1},	--elite = {1, 1, 1},
	rareelite = {"Interface\\MINIMAP\\ObjectIcons", .754, .875, .624, .749},	--rareelite = {1, .1, .1},
	worldboss = {"Interface\\MINIMAP\\ObjectIcons", .879, 1, .754, .879},	  --worldboss = {0, 1, 0},
}

function UF:AddCreatureIcon(self)
	local iconFrame = CreateFrame("Frame", nil, self)
	iconFrame:SetAllPoints()
	iconFrame:SetFrameLevel(self:GetFrameLevel() + 2)

	local icon = iconFrame:CreateTexture(nil, "ARTWORK")
	--icon:SetAtlas("VignetteKill")
	icon:SetPoint("BOTTOM", self, "LEFT", -3, -1)
	icon:SetSize(26, 26)
	icon:Hide()

	self.ClassifyIndicator = icon
end

function UF:UpdateUnitClassify(unit)
	if self.ClassifyIndicator then
		local class = UnitClassification(unit)
	  local level = UnitLevel(unit)
		if (not self.isNameOnly) and class and classify[class] then
			local tex, r, g, b, desature = unpack(classify[class])
			--self.ClassifyIndicator:SetVertexColor(r, g, b)
			--self.ClassifyIndicator:SetDesaturated(desature)
			
			if level and level < UnitLevel("player") then  -- or level == -1
			    if class == elite then
			        self.ClassifyIndicator:Hide()
			    end
			else    
			    self.ClassifyIndicator:SetTexture(tex)
		      self.ClassifyIndicator:SetTexCoord(r, g, b, desature)
		      self.ClassifyIndicator:Show()
			end
		else
			self.ClassifyIndicator:Hide()
		end
	end
end

-- Mouseover indicator
function UF:IsMouseoverUnit()
	if not self or not self.unit then return end

	if self:IsVisible() and UnitExists("mouseover") then
		return UnitIsUnit("mouseover", self.unit)
	end
	return false
end

function UF:UpdateMouseoverShown()
	if not self or not self.unit then return end

	if self:IsShown() and UnitIsUnit("mouseover", self.unit) then
		self.HighlightIndicator:Show()
		self.HighlightUpdater:Show()
	else
		self.HighlightUpdater:Hide()
	end
end

function UF:MouseoverIndicator(self)
	local highlight = CreateFrame("Frame", nil, self.Health)
	highlight:SetAllPoints(self)
	highlight:Hide()
	local texture = highlight:CreateTexture(nil, "ARTWORK")
	texture:SetPoint("BOTTOM", self, "BOTTOM", 0, 0)
	texture:SetSize(MaoRUIPerDB["Nameplate"]["PlateWidth"]+8, MaoRUIPerDB["Nameplate"]["PlateHeight"]+8)
	texture:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\UFs\\hlglow")
	texture:SetTexCoord(0, 1, 1, 0)
	texture:SetVertexColor(1, 1, 0)

	self:RegisterEvent("UPDATE_MOUSEOVER_UNIT", UF.UpdateMouseoverShown, true)

	local f = CreateFrame("Frame", nil, self)
	f:SetScript("OnUpdate", function(_, elapsed)
		f.elapsed = (f.elapsed or 0) + elapsed
		if f.elapsed > .1 then
			if not UF.IsMouseoverUnit(self) then
				f:Hide()
			end
			f.elapsed = 0
		end
	end)
	f:HookScript("OnHide", function()
		highlight:Hide()
	end)

	self.HighlightIndicator = highlight
	self.HighlightUpdater = f
end

-- Interrupt info on castbars
local guidToPlate = {}
function UF:UpdateCastbarInterrupt(...)
	local _, eventType, _, sourceGUID, sourceName, _, _, destGUID = ...
	if eventType == "SPELL_INTERRUPT" and destGUID and sourceName and sourceName ~= "" then
		local nameplate = guidToPlate[destGUID]
		if nameplate and nameplate.Castbar then
			local _, class = GetPlayerInfoByGUID(sourceGUID)
			local r, g, b = M.ClassColor(class)
			local color = M.HexRGB(r, g, b)
			local sourceName = Ambiguate(sourceName, "short")
			nameplate.Castbar.Text:SetText(INTERRUPTED.." > "..color..sourceName)
			nameplate.Castbar.Time:SetText("")
		end
	end
end

function UF:AddInterruptInfo()
	M:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", self.UpdateCastbarInterrupt)
end

-- Create Nameplates
local platesList = {}
function UF:CreatePlates()
	self.mystyle = "nameplate"
	self:SetSize(MaoRUIPerDB["Nameplate"]["PlateWidth"], MaoRUIPerDB["Nameplate"]["PlateHeight"])
	self:SetPoint("CENTER")
	self:SetScale(MaoRUIDB["UIScale"])

	local health = CreateFrame("StatusBar", nil, self)
	health:SetAllPoints()
	health:SetStatusBarTexture(I.normTex)
	health.backdrop = M.CreateBDFrame(health, nil, true) -- don't mess up with libs
	M:SmoothBar(health)

	self.Health = health
	self.Health.frequentUpdates = true
	self.Health.UpdateColor = UF.UpdateColor

	local title = M.CreateFS(self, MaoRUIPerDB["Nameplate"]["NameTextSize"]-1)
	title:ClearAllPoints()
	title:SetPoint("TOP", self, "BOTTOM", 0, -10)
	title:Hide()
	self:Tag(title, "[npctitle]")
	self.npcTitle = title

	UF:CreateHealthText(self)
	UF:CreateCastBar(self)
	UF:CreateRaidMark(self)
	UF:CreatePrediction(self)
	UF:CreateAuras(self)
	UF:CreateThreatColor(self)

	self.powerText = M.CreateFS(self, 16)
	self.powerText:ClearAllPoints()
	self.powerText:SetPoint("TOP", self.Castbar, "BOTTOM", 0, -3)
	self:Tag(self.powerText, "[nppp]")

	UF:MouseoverIndicator(self)
	UF:AddTargetIndicator(self)
	UF:AddCreatureIcon(self)
	UF:AddQuestIcon(self)

	platesList[self] = self:GetName()
end

-- Classpower on target nameplate
local isTargetClassPower
function UF:UpdateClassPowerAnchor()
	if not isTargetClassPower then return end

	local bar = _G.oUF_ClassPowerBar
	local nameplate = C_NamePlate_GetNamePlateForUnit("target")
	if nameplate then
		bar:SetParent(nameplate.unitFrame)
		bar:SetScale(.75)
		bar:ClearAllPoints()
		bar:SetPoint("TOP", nameplate.unitFrame, "BOTTOM", 0, 1)
		bar:Show()
	else
		bar:Hide()
	end
end

function UF:UpdateTargetClassPower()
	local bar = _G.oUF_ClassPowerBar
	local playerPlate = _G.oUF_PlayerPlate
	if not bar or not playerPlate then return end

	if MaoRUIPerDB["Nameplate"]["NameplateClassPower"] then
		isTargetClassPower = true
		UF:UpdateClassPowerAnchor()
	else
		isTargetClassPower = false
		if MaoRUIPerDB["Nameplate"]["ClassPowerOnly"] then
			bar:SetParent(UIParent)
		else
			bar:SetParent(playerPlate.Health)
		end
		bar:ClearAllPoints()
		bar:SetPoint("BOTTOMLEFT", playerPlate.Health, "TOPLEFT", 0, 3)
		bar:Show()
	end
end

function UF:UpdateNameplateAuras()
	local element = self.Auras
	if MaoRUIPerDB["Nameplate"]["ShowPlayerPlate"] and MaoRUIPerDB["Nameplate"]["NameplateClassPower"] then
		element:SetPoint("BOTTOMLEFT", self.nameText, "TOPLEFT", 0, 10 + _G.oUF_ClassPowerBar:GetHeight())
	else
		element:SetPoint("BOTTOMLEFT", self.nameText, "TOPLEFT", 0, 5)
	end
	element.numTotal = MaoRUIPerDB["Nameplate"]["maxAuras"]
	element.size = MaoRUIPerDB["Nameplate"]["AuraSize"]
	element.showDebuffType = MaoRUIPerDB["Nameplate"]["ColorBorder"]
	element:SetWidth(self:GetWidth())
	element:SetHeight((element.size + element.spacing) * 2)
	element:ForceUpdate()
end

function UF:RefreshNameplats()
	for nameplate in pairs(platesList) do
		nameplate:SetSize(MaoRUIPerDB["Nameplate"]["PlateWidth"], MaoRUIPerDB["Nameplate"]["PlateHeight"])
		nameplate.nameText:SetFont(I.Font[1], MaoRUIPerDB["Nameplate"]["NameTextSize"], I.Font[3])
		nameplate.npcTitle:SetFont(I.Font[1], MaoRUIPerDB["Nameplate"]["NameTextSize"]-1, I.Font[3])
		nameplate.Castbar.Time:SetFont(I.Font[1], MaoRUIPerDB["Nameplate"]["NameTextSize"], I.Font[3])
		nameplate.Castbar.Text:SetFont(I.Font[1], MaoRUIPerDB["Nameplate"]["NameTextSize"], I.Font[3])
		nameplate.healthValue:SetFont(I.Font[1], MaoRUIPerDB["Nameplate"]["HealthTextSize"], I.Font[3])
		nameplate.healthValue:UpdateTag()
		UF.UpdateNameplateAuras(nameplate)
		UF.UpdateTargetIndicator(nameplate)
		UF.UpdateTargetChange(nameplate)
	end
end

function UF:RefreshAllPlates()
	if MaoRUIPerDB["Nameplate"]["ShowPlayerPlate"] then
		UF:ResizePlayerPlate()
	end
	UF:RefreshNameplats()
end

local DisabledElements = {
	"Health", "Castbar", "HealthPrediction", "ThreatIndicator"
}
function UF:UpdatePlateByType()
	local name = self.nameText
	local hpval = self.healthValue
	local title = self.npcTitle
	local raidtarget = self.RaidTargetIndicator
	local classify = self.ClassifyIndicator
	local questIcon = self.questIcon

	name:ClearAllPoints()
	raidtarget:ClearAllPoints()

	if self.isNameOnly then
		for _, element in pairs(DisabledElements) do
			if self:IsElementEnabled(element) then
				self:DisableElement(element)
			end
		end

		name:SetJustifyH("CENTER")
		self:Tag(name, "[nplevel][color][name]")
		name:UpdateTag()
		name:SetPoint("CENTER", self, "BOTTOM")
		hpval:Hide()
		title:Show()

		raidtarget:SetPoint("TOP", title, "BOTTOM", 0, -5)
		raidtarget:SetParent(self)
		classify:Hide()
		if questIcon then questIcon:SetPoint("LEFT", name, "RIGHT", -1, 0) end
	else
		for _, element in pairs(DisabledElements) do
			if not self:IsElementEnabled(element) then
				self:EnableElement(element)
			end
		end

		name:SetJustifyH("LEFT")
		self:Tag(name, "[nplevel][name]")
		name:UpdateTag()
		name:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
		name:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 0, 5)
		hpval:Show()
		title:Hide()

		raidtarget:SetPoint("RIGHT", self, "LEFT", -3, 0)
		raidtarget:SetParent(self.Health)
		classify:Show()
		if questIcon then questIcon:SetPoint("LEFT", self, "RIGHT", -1, 0) end
	end

	UF.UpdateTargetIndicator(self)
end

function UF:RefreshPlateType(unit)
	self.reaction = UnitReaction(unit, "player")
	self.isFriendly = self.reaction and self.reaction >= 5
	self.isNameOnly = MaoRUIPerDB["Nameplate"]["NameOnlyMode"] and self.isFriendly or false

	if self.previousType == nil or self.previousType ~= self.isNameOnly then
		UF.UpdatePlateByType(self)
		self.previousType = self.isNameOnly
	end
end

function UF:OnUnitFactionChanged(unit)
	local nameplate = C_NamePlate_GetNamePlateForUnit(unit, issecure())
	local unitFrame = nameplate and nameplate.unitFrame
	if unitFrame and unitFrame.unitName then
		UF.RefreshPlateType(unitFrame, unit)
	end
end

function UF:RefreshPlateOnFactionChanged()
	M:RegisterEvent("UNIT_FACTION", UF.OnUnitFactionChanged)
end

function UF:PostUpdatePlates(event, unit)
	if not self then return end

	if event == "NAME_PLATE_UNIT_ADDED" then
		self.unitName = UnitName(unit)
		self.unitGUID = UnitGUID(unit)
		if self.unitGUID then
			guidToPlate[self.unitGUID] = self
		end
		self.npcID = M.GetNPCID(self.unitGUID)
		self.isPlayer = UnitIsPlayer(unit)

		UF.RefreshPlateType(self, unit)
	elseif event == "NAME_PLATE_UNIT_REMOVED" then
		if self.unitGUID then
			guidToPlate[self.unitGUID] = nil
		end
	end

	if event ~= "NAME_PLATE_UNIT_REMOVED" then
		UF.UpdateUnitPower(self)
		UF.UpdateTargetChange(self)
		--UF.UpdateQuestUnit(self, event, unit)
		UF.UpdateQuestIndicator(self)
		UF.UpdateUnitClassify(self, unit)
		UF:UpdateClassPowerAnchor()
	end
end

-- Player Nameplate
local auras = M:GetModule("Auras")

function UF:PlateVisibility(event)
	if (event == "PLAYER_REGEN_DISABLED" or InCombatLockdown()) and UnitIsUnit("player", self.unit) then
		UIFrameFadeIn(self.Health, .3, self.Health:GetAlpha(), 1)
		UIFrameFadeIn(self.Health.bg, .3, self.Health.bg:GetAlpha(), 1)
		UIFrameFadeIn(self.Power, .3, self.Power:GetAlpha(), 1)
		UIFrameFadeIn(self.Power.bg, .3, self.Power.bg:GetAlpha(), 1)
	else
		UIFrameFadeOut(self.Health, 2, self.Health:GetAlpha(), 0)
		UIFrameFadeOut(self.Health.bg, 2, self.Health.bg:GetAlpha(), 0)
		UIFrameFadeOut(self.Power, 2, self.Power:GetAlpha(), 0)
		UIFrameFadeOut(self.Power.bg, 2, self.Power.bg:GetAlpha(), 0)
	end
end

function UF:ResizePlayerPlate()
	local plate = _G.oUF_PlayerPlate
	if plate then
		local barWidth = MaoRUIPerDB["Nameplate"]["PPWidth"]
		local barHeight = MaoRUIPerDB["Nameplate"]["PPBarHeight"]
		local healthHeight = MaoRUIPerDB["Nameplate"]["PPHealthHeight"]
		local powerHeight = MaoRUIPerDB["Nameplate"]["PPPowerHeight"]

		plate:SetSize(barWidth, healthHeight + powerHeight + R.mult)
		plate.mover:SetSize(barWidth, healthHeight + powerHeight + R.mult)
		plate.Health:SetHeight(healthHeight)
		plate.Power:SetHeight(powerHeight)

		local bars = plate.ClassPower
		if bars then
			local classpowerWidth = MaoRUIPerDB["Nameplate"]["NameplateClassPower"] and MaoRUIPerDB["Nameplate"]["PlateWidth"] or barWidth
			_G.oUF_ClassPowerBar:SetSize(classpowerWidth, barHeight)
			local max = bars.__max
			for i = 1, max do
				bars[i]:SetHeight(barHeight)
				bars[i]:SetWidth((classpowerWidth - (max-1)*R.margin) / max)
			end
		end
	end
end

function UF:TogglePlayerPlateElements()
	if not MaoRUIPerDB["Nameplate"]["ClassPowerOnly"] then return end

	local plate = _G.oUF_PlayerPlate
	if plate then
		plate:DisableElement("Health")
		plate:DisableElement("Power")
	end
end

function UF:CreatePlayerPlate()
	self.mystyle = "PlayerPlate"
	self:EnableMouse(false)
	local healthHeight, powerHeight = MaoRUIPerDB["Nameplate"]["PPHealthHeight"], MaoRUIPerDB["Nameplate"]["PPPowerHeight"]
	self:SetSize(MaoRUIPerDB["Nameplate"]["PPWidth"], healthHeight + powerHeight + R.mult)

	UF:CreateHealthBar(self)
	UF:CreatePowerBar(self)
	UF:CreateClassPower(self)
	if MaoRUIPerDB["Auras"]["ClassAuras"] and not I.isClassic then auras:CreateLumos(self) end
	if not MaoRUIPerDB["Nameplate"]["ClassPowerOnly"] then UF:CreateEneryTicker(self) end

	local textFrame = CreateFrame("Frame", nil, self.Power)
	textFrame:SetAllPoints()
	textFrame:SetFrameLevel(self:GetFrameLevel() + 5)
	self.powerText = M.CreateFS(textFrame, 14)
	self:Tag(self.powerText, "[pppower]")
	UF:TogglePlatePower()

	UF:UpdateTargetClassPower()
	UF:TogglePlateVisibility()

	if MaoRUIPerDB["Nameplate"]["PPFadeout"] and not MaoRUIPerDB["Nameplate"]["ClassPowerOnly"] then
		self:RegisterEvent("PLAYER_REGEN_ENABLED", UF.PlateVisibility, true)
		self:RegisterEvent("PLAYER_REGEN_DISABLED", UF.PlateVisibility, true)
		self:RegisterEvent("PLAYER_ENTERING_WORLD", UF.PlateVisibility, true)
	end
end

function UF:TogglePlatePower()
	local plate = _G.oUF_PlayerPlate
	if not plate then return end

	plate.powerText:SetShown(MaoRUIPerDB["Nameplate"]["PPPowerText"])
end

function UF:TogglePlateVisibility()
	local plate = _G.oUF_PlayerPlate
	if not plate then return end

	if MaoRUIPerDB["Nameplate"]["PPFadeout"] and not MaoRUIPerDB["Nameplate"]["ClassPowerOnly"] then
		plate:RegisterEvent("PLAYER_REGEN_ENABLED", UF.PlateVisibility, true)
		plate:RegisterEvent("PLAYER_REGEN_DISABLED", UF.PlateVisibility, true)
		plate:RegisterEvent("PLAYER_ENTERING_WORLD", UF.PlateVisibility, true)
		UF.PlateVisibility(plate)
	else
		plate:UnregisterEvent("PLAYER_REGEN_ENABLED", UF.PlateVisibility)
		plate:UnregisterEvent("PLAYER_REGEN_DISABLED", UF.PlateVisibility)
		plate:UnregisterEvent("PLAYER_ENTERING_WORLD", UF.PlateVisibility)
		UF.PlateVisibility(plate, "PLAYER_REGEN_DISABLED")
	end
end 