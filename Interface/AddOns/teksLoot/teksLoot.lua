
local myname, ns = ...


local blank = "Interface\\AddOns\\teksLoot\\media\\blank"
local glow = "Interface\\AddOns\\teksLoot\\media\\glow"
local scale = 1

local function CreateBorder(f, r, g, b, a)
	f:SetBackdrop({
		edgeFile = blank, 
		edgeSize = 1,
		insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	f:SetBackdropBorderColor(0,0,0,1)
end

local function CreateShadow(f, t, offset, thickness, texture)
	if f.shadow then return end
		
	local border = CreateFrame("Frame", nil, f)
	border:SetFrameLevel(1)
	border:SetPoint("TOPLEFT", -1, 1)
	border:SetPoint("TOPRIGHT", 1, 1)
	border:SetPoint("BOTTOMRIGHT", 1, -1)
	border:SetPoint("BOTTOMLEFT", -1, -1)
	CreateBorder(border)
	f.border = border

	local shadow = CreateFrame("Frame", nil, border)
	shadow:SetFrameLevel(0)
	shadow:SetPoint("TOPLEFT", -3, 3)
	shadow:SetPoint("TOPRIGHT", 3, 3)
	shadow:SetPoint("BOTTOMRIGHT", 3, -3)
	shadow:SetPoint("BOTTOMLEFT", -3, -3)
	shadow:SetBackdrop( { 
			edgeFile = glow,
			bgFile = blank,
			edgeSize = 4,
			insets = {left = 4, right = 4, top = 4, bottom = 4},
		})
	shadow:SetBackdropColor( 0.05, 0.05, 0.05, 0.6 )
	shadow:SetBackdropBorderColor( 0, 0, 0, 1 )
	f.shadow = shadow
end

local backdrop = {
	bgFile = glow, tile = true, tileSize = 2,
	edgeFile = blank, edgeSize = 2,
	insets = {left = 0, right = 0, top = 0, bottom = 0},
}


local function ClickRoll(frame)
	RollOnLoot(frame.parent.rollid, frame.rolltype)
end


local function HideTip() GameTooltip:Hide() end
local function HideTip2() GameTooltip:Hide(); ResetCursor() end


local rolltypes = {"need", "greed", [0] = "pass"}
local function SetTip(frame)
	GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
	GameTooltip:SetText(frame.tiptext)
	if frame:IsEnabled() == 0 then 
		GameTooltip:AddLine("|cffff3333Cannot roll") 
	end
	for name,roll in pairs(frame.parent.rolls) do if roll == rolltypes[frame.rolltype] then GameTooltip:AddLine(name, 1, 1, 1) end end
	GameTooltip:Show()
end


local function SetItemTip(frame)
	if not frame.link then return end
	GameTooltip:SetOwner(frame, "ANCHOR_TOPLEFT")
	GameTooltip:SetHyperlink(frame.link)
	if IsShiftKeyDown() then GameTooltip_ShowCompareItem() end
	if IsModifiedClick("DRESSUP") then ShowInspectCursor() else ResetCursor() end
end


local function ItemOnUpdate(self)
	if IsShiftKeyDown() then GameTooltip_ShowCompareItem() end
	CursorOnUpdate(self)
end


local function LootClick(frame)
	if IsControlKeyDown() then DressUpItemLink(frame.link)
	elseif IsShiftKeyDown() then ChatEdit_InsertLink(frame.link) end
end


local cancelled_rolls = {}
local function OnEvent(frame, event, rollid)
	cancelled_rolls[rollid] = true
	if frame.rollid ~= rollid then return end

	frame.rollid = nil
	frame.time = nil
	frame:Hide()
end


local function StatusUpdate(frame)
	local t = GetLootRollTimeLeft(frame.parent.rollid)
	local perc = t / frame.parent.time
	frame.spark:SetPoint("CENTER", frame, "LEFT", perc * frame:GetWidth(), 0)
	frame:SetValue(t)
end


local function CreateRollButton(parent, ntex, ptex, htex, rolltype, tiptext, ...)
	local f = CreateFrame("Button", nil, parent)
	f:SetPoint(...)
	f:SetWidth(36)
	f:SetHeight(36)
	f:SetNormalTexture(ntex)
	if ptex then f:SetPushedTexture(ptex) end
	f:SetHighlightTexture(htex)
	f.rolltype = rolltype
	f.parent = parent
	f.tiptext = tiptext
	f:SetScript("OnEnter", SetTip)
	f:SetScript("OnLeave", HideTip)
	f:SetScript("OnClick", ClickRoll)
	f:SetMotionScriptsWhileDisabled(true)
	local txt = f:CreateFontString(nil, nil, "GameFontHighlightSmallOutline")
	txt:SetPoint("CENTER", 0, rolltype == 2 and 1 or rolltype == 0 and -1.2 or 0)
	return f, txt
end


local function CreateRollFrame()
	local frame = CreateFrame("Frame", nil, UIParent)
	frame:SetWidth(366)
	frame:SetHeight(36)
	frame:SetScale(scale)
	frame:SetBackdropColor(0, 0, 0, .9)
	frame:SetScript("OnEvent", OnEvent)
	frame:RegisterEvent("CANCEL_LOOT_ROLL")
	frame:Hide()

	local button = CreateFrame("Button", nil, frame)
	button:SetPoint("BOTTOMLEFT",frame,"BOTTOMLEFT", 0, 0)
	button:SetWidth(36)
	button:SetHeight(36)
	button:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2")
	button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
	button:GetHighlightTexture():SetBlendMode("ADD")
	button:SetScript("OnEnter", SetItemTip)
	button:SetScript("OnLeave", HideTip2)
	button:SetScript("OnUpdate", ItemOnUpdate)
	button:SetScript("OnClick", LootClick)
	CreateShadow(button)				 
	frame.button = button

	local buttonborder = CreateFrame("Frame", nil, button)
	buttonborder:SetWidth(36)
	buttonborder:SetHeight(36)
	buttonborder:SetPoint("CENTER", button, "CENTER")
	buttonborder:SetBackdrop(backdrop)
	buttonborder:SetBackdropColor(0.6, 0.6, 0.6, 0.3)
	frame.buttonborder = buttonborder

	local tfade = frame:CreateTexture(nil, "BORDER")
	tfade:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -4)
	tfade:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -4, 4)
	tfade:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
	tfade:SetBlendMode("ADD")
	tfade:SetGradientAlpha("VERTICAL", .1, .1, .1, 0, .25, .25, .25, 1)

	local status = CreateFrame("StatusBar", nil, frame)
	status:SetWidth(326)
	status:SetHeight(6)
	status:SetPoint("BOTTOMLEFT", button, "BOTTOMRIGHT", 4, 0)
	status:SetScript("OnUpdate", StatusUpdate)
	status:SetFrameLevel(status:GetFrameLevel()-1)
	status:SetStatusBarTexture("Interface\\AddOns\\teksLoot\\media\\statusbar")
	status:SetStatusBarColor(.8, .8, .8, .9)
	CreateShadow(status)		 
	status.parent = frame
	frame.status = status

	local spark = frame:CreateTexture(nil, "OVERLAY")
	spark:SetWidth(14)
	spark:SetHeight(25)
	spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
	spark:SetBlendMode("ADD")
	status.spark = spark

	local need, needtext = CreateRollButton(frame, "Interface\\Buttons\\UI-GroupLoot-Dice-Up", "Interface\\Buttons\\UI-GroupLoot-Dice-Highlight", "Interface\\Buttons\\UI-GroupLoot-Dice-Down", 1, NEED, "BOTTOMLEFT", frame.status, "BOTTOMLEFT", 5, -3)
	local bind = frame:CreateFontString()
	bind:SetPoint("LEFT", need, "RIGHT", 0, -1)
	bind:SetFont(STANDARD_TEXT_FONT, 15, "THINOUTLINE")
	frame.fsbind = bind								  
	local greed, greedtext = CreateRollButton(frame, "Interface\\Buttons\\UI-GroupLoot-Coin-Up", "Interface\\Buttons\\UI-GroupLoot-Coin-Highlight", "Interface\\Buttons\\UI-GroupLoot-Coin-Down", 2, GREED, "LEFT", bind, "RIGHT", 0, 1)
	local pass, passtext = CreateRollButton(frame, "Interface\\Buttons\\UI-GroupLoot-Pass-Up", nil, "Interface\\Buttons\\UI-GroupLoot-Pass-Down", 0, PASS, "BOTTOMLEFT", frame.status, "BOTTOMRIGHT", 5, -3)
	frame.needbutt, frame.greedbutt = need, greed
	frame.need, frame.greed, frame.pass = needtext, greedtext, passtext

	local loot = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	loot:SetFont(STANDARD_TEXT_FONT, 15, "THINOUTLINE")
	loot:SetPoint("LEFT", greed, "RIGHT", 5, -1)
	loot:SetHeight(10)
	loot:SetWidth(200)
	loot:SetJustifyH("LEFT")
	frame.fsloot = loot

	frame.rolls = {}

	return frame
end


local anchor = CreateFrame("Button", nil, UIParent)
anchor:SetWidth(366)
anchor:SetHeight(20)
CreateShadow(anchor,"Background")

local label = anchor:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
label:SetAllPoints(anchor)
label:SetText("teksLoot")

anchor:SetScript("OnClick", anchor.Hide)
anchor:SetScript("OnDragStart", anchor.StartMoving)
anchor:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	self.db.x, self.db.y = self:GetCenter()
end)
anchor:SetMovable(true)
anchor:EnableMouse(true)
anchor:RegisterForDrag("LeftButton")
anchor:RegisterForClicks("RightButtonUp")
anchor:Hide()

local frames = {}

local f = CreateRollFrame() -- Create one for good measure
f:SetPoint("TOPLEFT", next(frames) and frames[#frames] or anchor, "BOTTOMLEFT", 0, -4)
table.insert(frames, f)

local function GetFrame()
	for i,f in ipairs(frames) do
		if not f.rollid then return f end
	end

	local f = CreateRollFrame()
	f:SetPoint("TOPLEFT", next(frames) and frames[#frames] or anchor, "BOTTOMLEFT", 0, -4)
	table.insert(frames, f)
	return f
end


local function START_LOOT_ROLL(rollid, time)
	if cancelled_rolls[rollid] then return end

	local f = GetFrame()
	f.rollid = rollid
	f.time = time
	for i in pairs(f.rolls) do f.rolls[i] = nil end
	f.need:SetText(0)
	f.greed:SetText(0)
	f.pass:SetText(0)

	local texture, name, count, quality, bop, canNeed, canGreed = GetLootRollItemInfo(rollid)
	f.button:SetNormalTexture(texture)
	f.button.link = GetLootRollItemLink(rollid)

--	if canNeed then f.needbutt:Enable() else f.needbutt:Disable() end
--	if canGreed then f.greedbutt:Enable() else f.greedbutt:Disable() end
--	if canDisenchant then f.disenchantbutt:Enable() else f.disenchantbutt:Disable() end
--	if canNeed then f.needbutt:Enable() else f.needbutt:SetAlpha(0.5) end
--	if canGreed then f.greedbutt:Enable() else f.greedbutt:SetAlpha(0.5) end
--	if canDisenchant then f.disenchantbutt:Enable() else f.disenchantbutt:SetAlpha(0.5) end
	if canNeed then GroupLootFrame_EnableLootButton(f.needbutt) else GroupLootFrame_DisableLootButton(f.needbutt) end
	if canGreed then GroupLootFrame_EnableLootButton(f.greedbutt) else GroupLootFrame_DisableLootButton(f.greedbutt) end
	--if canDisenchant then GroupLootFrame_EnableLootButton(f.disenchantbutt) else GroupLootFrame_DisableLootButton(f.disenchantbutt) end


	SetDesaturation(f.needbutt:GetNormalTexture(), not canNeed)
	SetDesaturation(f.greedbutt:GetNormalTexture(), not canGreed)
	--SetDesaturation(f.disenchantbutt:GetNormalTexture(), not canDisenchant)


	f.fsbind:SetText(bop and "拾绑" or "装绑")
	f.fsbind:SetVertexColor(bop and 1 or .3, bop and .3 or 1, bop and .1 or .3)

	local color = ITEM_QUALITY_COLORS[quality]
	f.fsloot:SetVertexColor(color.r, color.g, color.b)
	f.fsloot:SetText(name)

	f:SetBackdropBorderColor(color.r, color.g, color.b, 1)
	f.buttonborder:SetBackdropBorderColor(color.r, color.g, color.b, 1)
	f.status:SetStatusBarColor(color.r, color.g, color.b, .7)

	f.status:SetMinMaxValues(0, time)
	f.status:SetValue(time)

	f:SetPoint("CENTER", WorldFrame, "CENTER")
	f:Show()
end


local function ParseRollChoice(msg)
	for i,v in pairs(ns.rollpairs) do
		local _, _, playername, itemname = string.find(msg, i)
		if playername and itemname and playername ~= "Everyone" then return playername, itemname, v end
	end
end


local in_soviet_russia = (GetLocale() == "ruRU")
local function CHAT_MSG_LOOT(msg)
	local playername, itemname, rolltype = ParseRollChoice(msg)
	if playername and itemname and rolltype then
		if in_soviet_russia and rolltype ~= "pass" then itemname, playername = playername, itemname end
		for _,f in ipairs(frames) do
			if f.rollid and f.button.link == itemname and not f.rolls[playername] then
				f.rolls[playername] = rolltype
				f[rolltype]:SetText(tonumber(f[rolltype]:GetText()) + 1)
				return
			end
		end
	end
end


anchor:RegisterEvent("ADDON_LOADED")
anchor:SetScript("OnEvent", function(frame, event, addon)
	if addon ~= "teksLoot" then return end

	anchor:UnregisterEvent("ADDON_LOADED")
	anchor:RegisterEvent("START_LOOT_ROLL")
	anchor:RegisterEvent("CHAT_MSG_LOOT")
	UIParent:UnregisterEvent("START_LOOT_ROLL")
	UIParent:UnregisterEvent("CANCEL_LOOT_ROLL")

	anchor:SetScript("OnEvent", function(frame, event, ...) if event == "CHAT_MSG_LOOT" then return CHAT_MSG_LOOT(...) else return START_LOOT_ROLL(...) end end)


	if not teksLootDB then teksLootDB = {} end
	anchor.db = teksLootDB
	anchor:SetPoint("CENTER", UIParent, anchor.db.x and "BOTTOMLEFT" or "BOTTOM", anchor.db.x or 0, anchor.db.y or 221)
end)


SlashCmdList["TEKSLOOT"] = function() if anchor:IsVisible() then anchor:Hide() else anchor:Show() end end
SLASH_TEKSLOOT1 = "/teksloot"

