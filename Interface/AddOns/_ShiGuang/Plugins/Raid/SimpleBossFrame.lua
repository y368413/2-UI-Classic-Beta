----## Version: 8.0.5 ## Author: lteke
local SimpleBossFrame = {}

-- initialize addon table
SimpleBossFrame.events = SimpleBossFrame.events or {}
SimpleBossFrame.commands = SimpleBossFrame.commands or {}

local BF = {
	scale = 0.825,
	scale_delta = 0.005,
	space = 26, -- vertical space
	backdrop = {
--		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],	-- Dialog style
		edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],		-- Tooltip style
		edgeSize = 16,
		tile = true
	},
	bordercolor = {1, 1, 0.3, 1}, -- Red, Green, Blue, Alpha (0.0-1.0)
	texture = "Otravi", -- Name of texture of Health and Mana in Shared Media.
	raidicon = {
		pos = "Left",
		anchors = {
			Top = {"CENTER", nil, "TOP", 0, 3},	-- Top
			Left = {"CENTER", nil, "LEFT", -3, 0},	-- Left
			Right = {"CENTER", nil, "TOPRIGHT", 20, -2},	-- Right
			Bottom = {"CENTER", nil, "BOTTOM", 0, -3}-- Bottom
		}
	},
	percent = {
		enabled = true, -- If true, Percent Frame is displayed.
		pos = "Right", -- Position of Percent Frame. This should be one of the following anchors.
		anchors = {
			Top = {"BOTTOM", nil, "TOP", 10, -5},	-- Top
			Left = {"CENTER", nil, "LEFT", -21, 0},	-- Left
			Right = {"LEFT", nil, "RIGHT", -3, 0},	-- Right
			Bottom = {"TOP", nil, "BOTTOM", 15, 3}	-- Bottom
		},
		textcolor = {
			{0.4, 0.8, 1},	-- boss1
			{1, 0.75, 0.3},	-- boss2
			{0.75, 1, 0.3},	-- boss3
			{1, 1, 1},	-- boss4
			{0.9, 0.5, 0.9}	-- boss5
		}
	},
	buff = {
		-- enabled = true,
		offset = {x = 0, y = 0},
		size = {W = 26, H = 18},
		borderSize = 1,
		filterEnemy = "HARMFUL|PLAYER",
		filterFriendly = "HELPFUL|RAID",
	},
}

local updateFunc = {}
do
	local ceil = math.ceil
	local value, temp

	function updateFunc:Health()
		value = SimpleBossFrame.testMode and self.HealthBar:GetValue() or self.HealthBar.currValue
		temp = self.hmax > 0 and ceil(value / self.hmax * 100) or 0
		if self.value ~= temp then
			self.value = temp
			self.text:SetText(self.value)  --.."%"
		end
	end

	function updateFunc:Power()
		value = SimpleBossFrame.testMode and self.ManaBar:GetValue() or self.ManaBar.currValue
		temp = self.pmax > 0 and value or nil
		if self.value ~= temp then
			self.value = temp
			self.text:SetText(self.value)
		end
	end

	function updateFunc:Mana()
		value = SimpleBossFrame.testMode and self.ManaBar:GetValue() or self.ManaBar.currValue
		temp = self.pmax > 0 and ceil(value / self.pmax * 100) or 0
		if self.value ~= temp then
			self.value = temp
			self.text:SetText(self.value.."%")
		end
	end
end

SimpleBossFrame.anchorFrame = SimpleBossFrame.anchorFrame or CreateFrame("Frame", nil, _G.UIParent)

local events = SimpleBossFrame.events
local commands = SimpleBossFrame.commands
local anchorFrame = SimpleBossFrame.anchorFrame
local frames = {}

local buff_prototype = {}
local buff_MT = {__index = buff_prototype}

local function BossFrameSpellBar_OnSetPoint(self)
	if self.boss then
		self:SetPoint("TOPLEFT", self:GetParent(), "BOTTOMLEFT", 5.5, 26.5)
	end
end

local function Text_Refresh(frame)
	frame.hmin, frame.hmax = frame.HealthBar:GetMinMaxValues()
	frame.pmin, frame.pmax = frame.ManaBar:GetMinMaxValues()
	if not frame.mode then
		frame.mode = "Health"
	end
	frame.Update = updateFunc[frame.mode]
	frame.value = nil
	frame:Update()
	frame.elapsed = 0
end

local function Text_OnUpdate(frame, elapsed)
	frame.elapsed = frame.elapsed + elapsed
	if frame.elapsed > 0.07 then
		frame.elapsed = 0
		frame:Update()
	end
end

local function HealthBar_OnMinMaxChanged(self, min, max)
	Text_Refresh(frames[self:GetParent():GetID()])
end

local function ManaBar_OnMinMaxChanged(self, min, max)
	Text_Refresh(frames[self:GetParent():GetID()])
end

local function FrameBorder_OnUpdate(self)
	self:SetScript("OnUpdate", nil)
	self.highlight:SetShown(UnitIsUnit("target", self.unit))
	if self.buffs then
		for i = 1, #self.buffs do
				self.buffs[i]:SetStyle()
		end
	end
end

local UpdateBuffs do

	local function ShouldShowBuff(id, nameplate, caster, isBoss, duration)
		return id and (caster == "player" and duration <= 40 or isBoss)
	end

	local function ShouldShowDebuff(id, nameplate, caster, isBoss, duration)
		return id and duration ~= 0 and (nameplate or isBoss)
	end

	local BUFF_MAX_DISPLAY, CooldownFrame_Set = BUFF_MAX_DISPLAY, CooldownFrame_Set
	local _, filter, ShouldShowFunc, unit, index, buff, name, texture, count, duration, expire, caster, nameplatePersonal, spellID, isBoss, nameplateAll

	UpdateBuffs = function(frame)
		unit = frame.unit
		if frame.reaction <= 4 then
			filter = BF.buff.filterEnemy
			ShouldShowFunc = ShouldShowDebuff
		else
			filter = BF.buff.filterFriendly
			ShouldShowFunc = ShouldShowBuff
		end
		-- unit = "player"
		-- filter = "HELPFUL"
		index = 1
		if not ShiGuangPerDB.SimpleBossFrameauras then
			for i = 1, BUFF_MAX_DISPLAY do
				name, texture, count, _, duration, expire, caster, _, nameplatePersonal, spellID, _, isBoss, _, nameplateAll = UnitAura(unit, i, filter)
				if ShouldShowFunc(spellID, nameplatePersonal or nameplateAll, caster, isBoss, duration) then
					if not frame.buffs[index] then
						frame.buffs[index] = buff_prototype:New(frame, index)
					end
					buff = frame.buffs[index]
					if buff.spellID ~= spellID or buff.expire ~= expire or buff.count ~= count or buff.duration ~= duration then
						buff.spellID = spellID
						buff.expire = expire
						buff.count = count
						buff.duration = duration
						buff:SetIcon(texture)
						buff:SetCount(count)
						CooldownFrame_Set(buff.cooldown, expire - duration, duration, true, true)
					end
					buff:Show()
					index = index + 1
					if index > 5 then break end
				end
			end
		end
		for i = index, #frame.buffs do
			frame.buffs[i]:Hide()
		end
	end
end

local function FrameBorder_OnEvent(self, event)
	if event == "PLAYER_TARGET_CHANGED" then
		FrameBorder_OnUpdate(self)
	elseif event == "UNIT_AURA" then
		UpdateBuffs(self)
	elseif event == "UNIT_FACTION" then
		self.reaction = UnitReaction(self.unit, "player") or 0
	elseif self:IsVisible() then
		if not ShiGuangPerDB.SimpleBossFrameauras then
			self:RegisterUnitEvent("UNIT_AURA", self.unit)
		end
		self:SetScript("OnUpdate", FrameBorder_OnUpdate)
		self.reaction = UnitReaction(self.unit, "player") or 0
		UpdateBuffs(self)
	else
		self:UnregisterEvent("UNIT_AURA")
		self.reaction = 0
	end
end

local function BossFrames_SetStyle()
	local p
	for i = 1, MAX_BOSS_FRAMES do
		local boss = _G["Boss"..i.."TargetFrame"]
		boss.textureFrame.texture:SetTexture(nil)
		boss.highLevelTexture:SetTexture(nil)
		boss.threatIndicator:SetTexture(nil)

		local frameBorder = CreateFrame("Frame", nil, boss)
		local borderFrameLevel = frameBorder:GetFrameLevel()
		boss.textureFrame:SetFrameLevel(borderFrameLevel + 1)
		_G["Boss"..i.."TargetFrameDropDown"]:SetFrameLevel(borderFrameLevel + 1)
		frameBorder:SetPoint("TOPLEFT", boss.Background, "TOPLEFT", -4, 3)
		frameBorder:SetPoint("BOTTOMRIGHT", boss.Background, "BOTTOMRIGHT", 4, -5)
		frameBorder:SetBackdrop(BF.backdrop)

		local highlight = frameBorder:CreateTexture(nil, "OVERLAY")
		highlight:SetAtlas("Talent-Highlight")
		highlight:SetPoint("TOPLEFT", -4.5, 5.5)
		highlight:SetPoint("BOTTOMRIGHT", 4.5, -5.5)
		highlight:SetBlendMode("ADD")
		highlight:SetAlpha(0.9)
		frameBorder.highlight = highlight
		frameBorder.unit = "boss"..i
		frameBorder:SetScript("OnEvent", FrameBorder_OnEvent)
		frameBorder:RegisterEvent("PLAYER_TARGET_CHANGED")
		frameBorder:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
		frameBorder:RegisterEvent("ENCOUNTER_START")
		frameBorder:RegisterEvent("PLAYER_REGEN_DISABLED")
		frameBorder:SetScript("OnShow", FrameBorder_OnUpdate)
		FrameBorder_OnUpdate(frameBorder)

		if BF.bordercolor then frameBorder:SetBackdropBorderColor(unpack(BF.bordercolor)) end

		if BF.scale then boss:SetScale(BF.scale) end

		boss.levelText:SetFontObject("SystemFont_Outline_Small")

		boss.name:SetFontObject("SystemFont_Shadow_Small2")
		boss.name:SetWidth(boss.name:GetWidth() * 1.35)
		boss.name:SetHeight(15.5)
		boss.name:SetJustifyV("BOTTOM")

		if BF.space and i > 1 and boss:GetNumPoints() > 0 then
			p = {boss:GetPoint(1)}
			p[5] = BF.space
			boss:ClearAllPoints()
			boss:SetPoint(unpack(p))
		end

		if BF.raidicon.pos then
			p = {unpack(BF.raidicon.anchors[BF.raidicon.pos])}
			boss.raidTargetIcon:ClearAllPoints()
			p[2] = frameBorder
			boss.raidTargetIcon:SetPoint(unpack(p))
		end

		if BF.texturefile then
			boss.healthbar:SetStatusBarTexture(BF.texturefile)
			boss.manabar:SetStatusBarTexture(BF.texturefile)
		end

		if BF.percent.enabled then
			local HealthBar = boss.healthbar
			local ManaBar = boss.manabar
			local frame = CreateFrame("Frame", nil, boss)
			frames[i] = frame
			frame:SetFrameLevel(borderFrameLevel + 2)
			frame:SetSize(50, 30)
			p = {unpack(BF.percent.anchors[BF.percent.pos])}
			p[2] = boss.Background
			frame:SetPoint(unpack(p))
			--frame:SetBackdrop({
				--edgeFile = BF.backdrop.edgeFile,
				--edgeSize = BF.backdrop.edgeSize,
				--tile = BF.backdrop.tile,
				--bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
				--insets = {left = 4, right = 4, top = 4, bottom = 4}
			--})
			frame:SetBackdropColor(0, 0, 0, 0.75)
			if BF.bordercolor then frame:SetBackdropBorderColor(unpack(BF.bordercolor)) end
			frame.HealthBar = HealthBar
			frame.ManaBar = ManaBar
			--frame.mode = "health"

			local text = frame:CreateFontString(nil, "ARTWORK", "SystemFont_Huge1")
			text:SetPoint("CENTER", frame, "CENTER", 1, -0.5)
			text:SetJustifyH("CENTER")
			text:SetJustifyV("MIDDLE")
			text:SetTextColor(unpack(BF.percent.textcolor[i]))
			frame.text = text

			HealthBar:HookScript("OnMinMaxChanged", HealthBar_OnMinMaxChanged)
			ManaBar:HookScript("OnMinMaxChanged", ManaBar_OnMinMaxChanged)
			Text_Refresh(frame)
			frame:SetScript("OnUpdate", Text_OnUpdate)

		end

		frameBorder:RegisterUnitEvent("UNIT_FACTION", frameBorder.unit)
		frameBorder.buffs = {}
	end
	wipe(p)
	hooksecurefunc("Target_Spellbar_AdjustPosition", BossFrameSpellBar_OnSetPoint)
end

local function BossFrames_SetScale(scale)
	for i = 1, MAX_BOSS_FRAMES do
		_G["Boss"..i.."TargetFrame"]:SetScale(scale)
	end
end

function SimpleBossFrame:Enable()
	BossFrames_SetStyle()

	self.bossFrame = _G["Boss1TargetFrame"]
	self.defaultAnchor = {self.bossFrame:GetPoint(1)}
	self.defaultScale = self.bossFrame:GetScale()
	self.bossFrame.OrgSetPoint = self.bossFrame.SetPoint
	self.bossFrame.SetPoint = function() end
	self.bossFrame:HookScript("OnHide", function() anchorFrame:Hide() end)

	anchorFrame:SetMovable(true)
	anchorFrame:SetScale(self.defaultScale)
	anchorFrame:SetSize(self.bossFrame:GetWidth(), self.bossFrame:GetHeight() * 5 - (BF.space * 4))
	anchorFrame:SetScript("OnMouseDown", anchorFrame.OnMouseDown)
	anchorFrame:SetScript("OnMouseUp", anchorFrame.OnMouseUp)
	anchorFrame:SetScript("OnDragStop", anchorFrame.OnMouseUp)
	anchorFrame:SetScript("OnUpdate", anchorFrame.OnUpdate)
	anchorFrame:SetScript("OnMouseWheel", anchorFrame.OnMouseWheel)
	anchorFrame:SetScript("OnShow", anchorFrame.OnShow)
	anchorFrame:Hide()
	if ShiGuangPerDB.SimpleBossFrameanchor and ShiGuangPerDB.SimpleBossFrameanchor[1] and ShiGuangPerDB.SimpleBossFrameanchor[4] and ShiGuangPerDB.SimpleBossFrameanchor[5] then
		anchorFrame:ClearAllPoints()
		anchorFrame:SetPoint(unpack(ShiGuangPerDB.SimpleBossFrameanchor))
		self.bossFrame:ClearAllPoints()
		self.bossFrame:OrgSetPoint(unpack(ShiGuangPerDB.SimpleBossFrameanchor))
	else
		anchorFrame:ClearAllPoints()
		anchorFrame:SetPoint(unpack(self.defaultAnchor))
	end
	if ShiGuangPerDB.SimpleBossFramescale then
		anchorFrame:SetScale(ShiGuangPerDB.SimpleBossFramescale)
		BossFrames_SetScale(ShiGuangPerDB.SimpleBossFramescale)
	end

	self.testMode = false
end

function SimpleBossFrame:UnregisterEvent(...)
	anchorFrame:UnregisterEvent(...)
end

function SimpleBossFrame:SetMode(mode, index)
	mode = mode or "Health"
	for i = 1, #frames do
		if not index or i == index then
			frames[i].mode = mode
			Text_Refresh(frames[i])
		end
	end
end

function anchorFrame:OnMouseDown(button)
	if button == "LeftButton" then
		self.moving = true
		self:StartMoving()
	end
end

function anchorFrame:OnMouseUp(button)
	if button == "LeftButton" then
		self.moving = false
		self:StopMovingOrSizing()
	end
end

function anchorFrame:OnMouseWheel(delta)
	if delta < 0 then
		commands.scale(SimpleBossFrame, (ShiGuangPerDB.SimpleBossFramescale or SimpleBossFrame.defaultScale) - BF.scale_delta)
	else
		commands.scale(SimpleBossFrame, (ShiGuangPerDB.SimpleBossFramescale or SimpleBossFrame.defaultScale) + BF.scale_delta)
	end
end

function anchorFrame:OnUpdate(elapsed)
	if not InCombatLockdown() and self.moving then
		ShiGuangPerDB.SimpleBossFrameanchor = {self:GetPoint(1)}
		SimpleBossFrame.bossFrame:ClearAllPoints()
		SimpleBossFrame.bossFrame:OrgSetPoint(unpack(ShiGuangPerDB.SimpleBossFrameanchor))
	end
end

function anchorFrame:OnShow()
	if not self.bkgndFrame then
		self.bkgndFrame = CreateFrame("Frame", nil, self)
		self.bkgndFrame:SetFrameStrata("BACKGROUND")
		self.bkgndFrame:SetBackdrop({
			bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
		})
		self.bkgndFrame:SetAllPoints(self)
		self.bkgndFrame:SetBackdropColor(0, 0.75, 0, 0.5)
	end
	self:EnableMouse(true)
	self:EnableMouseWheel(true)
	self:SetBackdrop({
		edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
		tile = true,
		edgeSize = 14,
		tileSize = 16,
		insets = {left = 3, right = 3, top = 3, bottom = 3},
	})
	self:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
end

function events:PLAYER_LOGIN(...)
	self:UnregisterEvent("PLAYER_LOGIN")
	self:UnregisterEvent("SPELLS_CHANGED")

	--local SM3 = LibStub and LibStub("LibSharedMedia-3.0", true)
	BF.texturefile = "Interface\\RaidFrame\\Raid-Bar-Hp-Fill" -- BF.texture or and SM3 and SM3:Fetch("statusbar", BF.texture, true)

	self:Enable()
end
events.SPELLS_CHANGED = events.PLAYER_LOGIN

function events:PLAYER_REGEN_DISABLED()
	if anchorFrame:IsShown() then
		anchorFrame:Hide()
		SlashCmdList.SIMPLEBOSS("test")
	end
	SimpleBossFrame.testMode = false
end

function events:INSTANCE_ENCOUNTER_ENGAGE_UNIT()
	events:PLAYER_REGEN_DISABLED()
	for i = 1, #frames do
		frames[i].value = nil
		frames[i].elapsed = 1
	end
end

function buff_prototype:New(parent, index)
	local buff = setmetatable({}, buff_MT)
	buff.index = index
	buff.cooldown = CreateFrame("Cooldown", nil, parent, "CooldownFrameTemplate")
	buff.cooldown:SetHideCountdownNumbers(true)
	buff.cooldown:SetReverse(true)
	buff.cooldown:SetDrawEdge(true)
	buff.cooldown:SetDrawBling(false)
	buff.bg = buff.cooldown:CreateTexture(nil, "BACKGROUND", nil, 2)
	buff.bg:SetColorTexture(0, 0, 0, 1)
	buff.icon = buff.cooldown:CreateTexture(nil, "BACKGROUND", nil, 3)
	buff.icon:SetTexCoord(0.05, 0.95, 0.15, 0.75)
	buff.counter = buff.cooldown:CreateFontString(nil, "ARTWORK", "NumberFontNormalSmall")
	buff.counter:SetJustifyH("RIGHT")
	buff:SetStyle()
	return buff
end

function buff_prototype:SetStyle()
	self.cooldown:SetScale(1 / (ShiGuangPerDB.SimpleBossFramescale or BF.scale))
	self.cooldown:ClearAllPoints()
	self.cooldown:SetPoint("LEFT", self.cooldown:GetParent(), "RIGHT", BF.buff.offset.x + ((BF.percent.enabled and 53 or 0) * (ShiGuangPerDB.SimpleBossFramescale or BF.scale)) + (self.index - 1) * (BF.buff.size.W + 2), BF.buff.offset.y)
	self.cooldown:SetSize(BF.buff.size.W, BF.buff.size.H)
	self.bg:SetAllPoints()
	self.icon:SetPoint("TOPLEFT", BF.buff.borderSize, -BF.buff.borderSize)
	self.icon:SetPoint("BOTTOMRIGHT", -BF.buff.borderSize, BF.buff.borderSize)
	self.counter:SetPoint("BOTTOMRIGHT", 3, -3)
end

function buff_prototype:Hide()
	self.cooldown:Hide()
	self.spellID = nil
	self.expire = nil
	self.count = nil
	self.duration = nil
end

function buff_prototype:Show()
	self.cooldown:Show()
end

function buff_prototype:SetIcon(texture)
	self.icon:SetTexture(texture)
end

function buff_prototype:SetCount(count)
	if count > 1 then
		self.counter:SetText(count)
		self.counter:Show()
	else
		self.counter:Hide()
	end
end

function commands:sb(arg)
	DEFAULT_CHAT_FRAME:AddMessage(
		"Simple Boss Frame 8.0.5" .. "\n" ..
		"  /sb test\n" ..
		"  /sb reset\n" ..
		"  /sb health\n" ..
		"  /sb power\n" ..
		"  /sb mana\n" ..
		"  /sb auras: "..tostring(ShiGuangPerDB.SimpleBossFrameauras and "Disabled" or "Enabled"),
		1, 1, 0
	)
end

function commands:reset(arg)
	anchorFrame:SetScale(self.defaultScale)
	BossFrames_SetScale(self.defaultScale)
	ShiGuangPerDB.SimpleBossFramescale = nil
	anchorFrame:ClearAllPoints()
	anchorFrame:SetPoint(unpack(self.defaultAnchor))
	self.bossFrame:ClearAllPoints()
	self.bossFrame:OrgSetPoint(unpack(self.defaultAnchor))
	ShiGuangPerDB.SimpleBossFrameanchor = nil
	ShiGuangPerDB.SimpleBossFrameauras = nil
end

function commands:health(arg)
	local index = tonumber(arg) or nil
	SimpleBossFrame:SetMode("Health", index)
end
commands.hp = commands.health

function commands:power(arg)
	local index = tonumber(arg) or nil
	SimpleBossFrame:SetMode("Power", index)
end
commands.energy = commands.power

function commands:mana(arg)
	local index = tonumber(arg) or nil
	SimpleBossFrame:SetMode("Mana", index)
end
commands.mp = commands.mana

function commands:scale(arg)
	local scale = tonumber(arg) or nil
	if not scale then return end
	if scale < 0.3 then scale = 0.3 end
	if scale > 2 then scale = 2 end
	local anchor = ShiGuangPerDB.SimpleBossFrameanchor or {unpack(self.defaultAnchor)}
	local ratio = anchorFrame:GetScale(scale) / scale
	anchor[4] = anchor[4] * ratio
	anchor[5] = anchor[5] * ratio
	anchorFrame:SetScale(scale)
	BossFrames_SetScale(scale)
	anchorFrame:ClearAllPoints()
	anchorFrame:SetPoint(unpack(anchor))
	self.bossFrame:ClearAllPoints()
	self.bossFrame:OrgSetPoint(unpack(anchor))
	ShiGuangPerDB.SimpleBossFramescale = scale
end

function commands:aura()
	ShiGuangPerDB.SimpleBossFrameauras = not ShiGuangPerDB.SimpleBossFrameauras
end
commands.auras = commands.aura

function commands:hide(arg)
	local index = tonumber(arg) or nil
	for i = 1, #frames do
		if not index or i == index then
			frames[i]:Hide()
		end
	end
end

function commands:show(arg)
	local index = tonumber(arg) or nil
	for i = 1, #frames do
		if not index or i == index then
			frames[i]:Show()
		end
	end
end

local function RandomFactionColor()
	local colors = {
		RED_FONT_COLOR,
		GREEN_FONT_COLOR,
		YELLOW_FONT_COLOR,
		ORANGE_FONT_COLOR
	}
	local c = colors[random(1, 4)]
	return c.r, c.g, c.b
end

function commands:test(arg)
	if InCombatLockdown() then return end
	local shown = anchorFrame:IsShown()
	SimpleBossFrame.testMode = not shown
	for i = 1, MAX_BOSS_FRAMES do
		local b = "Boss"..i.."TargetFrame"
		if shown then
			_G[b]:Hide()
			anchorFrame:Hide()
		else
			_G[b.."TextureFrameName"]:SetText("Boss"..i.."Name")
			_G[b.."NameBackground"]:SetVertexColor(RandomFactionColor())
			_G[b.."HealthBar"]:SetMinMaxValues(1, 99999999)
			_G[b.."HealthBar"]:SetValue(random(11111111, 88888888))
			_G[b.."ManaBar"]:SetMinMaxValues(1, 100)
			_G[b.."ManaBar"]:SetValue(random(15, 85))
			_G[b.."ManaBar"]:SetStatusBarColor(0.2, 0.2, 1)
			_G[b]:Show()
			anchorFrame:Show()
		end
	end
	for i = 1, #frames do
		Text_Refresh(frames[i])
	end
end

do
	SLASH_SIMPLEBOSS1 = "/simpleboss"
	SLASH_SIMPLEBOSS2 = "/sb"
	SlashCmdList.SIMPLEBOSS = function(msg)
		local cmd, arg = msg:match("^(%w*)%s*(.-)$")
		cmd = strlower(cmd)
		if not commands[cmd] then cmd = "sb" end
		commands[cmd](SimpleBossFrame, arg)
	end

	anchorFrame:SetScript("OnEvent", function(self, event, ...)
		events[event](SimpleBossFrame, event, ...)
	end)
	for event, func in pairs(events) do
		if type(func) == "function" then anchorFrame:RegisterEvent(event) end
	end
end
