------------------------------------------------------------------- 隊友目標框架 ---------
local function PartyTarget_UpdateName(self, unit)
    local color = RAID_CLASS_COLORS[select(2,UnitClass(unit))] or NORMAL_FONT_COLOR
    local fontFile, fontSize, fontFlags = self.Name:GetFont()
    self.Name:SetFont(fontFile, 9, "OUTLINE")
    self.Name:SetText(UnitName(unit))
    self.Name:SetTextColor(color.r, color.g, color.b)
end
--更新HP
local function PartyTarget_UpdateHealth(self, unit)
    if (UnitIsGhost(unit)) then
        self.HealthBar:SetValue(0)
        self.HealthBar.Text:SetText("|cffeed200 *** |r")
        return 
    end
    if (UnitIsDead(unit)) then
        self.HealthBar:SetValue(0)
        self.HealthBar.Text:SetText("|cffeed200  X  |r")
        return 
    end
    local hp = UnitHealth(unit)
    local perc = floor(hp / max((UnitHealthMax(unit) or 1),1) * 100)
    self.HealthBar:SetValue(perc)
    self.HealthBar.Text:SetText(perc .. "%")
end
--更新颜色
local function PartyTarget_UpdateColor(self, unit)
    if UnitIsEnemy("player", unit) then
        self.Border:SetVertexColor(1, 0.2, 0.2, 0.6)
        self.HealthBar:SetStatusBarColor(0.9, 0.55, 0.72)
    elseif UnitIsFriend("player", unit) then
        self.Border:SetVertexColor(0, 1, 0, 0.6)
        self.HealthBar:SetStatusBarColor(0, 0.9, 0)
    else
        self.Border:SetVertexColor(0.9, 0.82, 0, 0.6)
        self.HealthBar:SetStatusBarColor(0.65, 0.9, 0.85)
    end
end

--更新透明度
local function PartyTarget_UpdateAlpha(self, unit)
    if (UnitInRange(unit)) then
        self:SetAlpha(1)
    else
        self:SetAlpha(0.8)
    end
end

--創建隊友目標框架
local function PartyTarget_CreateButton(index)
    local parent = _G["PartyMemberFrame"..index]
    local button = CreateFrame("Button", "PartyTargetFrame"..index, parent, "SecureUnitButtonTemplate")
    button.unit = "party"..index.."target"
    button:SetID(index)
    button:SetFrameStrata("LOW")
    button:SetWidth(43)
    button:SetHeight(21)
    button:SetHitRectInsets(0, 0, -8, -6)
	button:SetAttribute("unit", "party"..index.."target")
	button:SetAttribute("type1", "target")
    button:SetAttribute("type2", "focus")
    button:SetPoint("TOPRIGHT", parent, "TOPLEFT", -8, -8)   --"TOPLEFT", parent, "TOPRIGHT", 21, -6
    button.Name = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	button.Name:SetPoint("TOPRIGHT", button, "TOPRIGHT", 8, 3)
	button.Name:SetTextColor(1, 0.82, 0)
	button.Border = button:CreateTexture(nil, "BORDER")
	button.Border:SetTexture("Interface\\Tooltips\\UI-StatusBar-Border")
	button.Border:SetWidth(46)
	button.Border:SetHeight(24)
	button.Border:SetPoint("TOPLEFT", button, "TOPLEFT", 0, -6)
	button.HealthBar = CreateFrame("STATUSBAR", nil, button)
	button.HealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	button.HealthBar:SetFrameStrata("HIGH")
	button.HealthBar:SetMinMaxValues(0, 100)
	button.HealthBar:SetValue(100)
	button.HealthBar:SetWidth(43)
	button.HealthBar:SetHeight(18)
	button.HealthBar:SetPoint("TOP", button, "TOP", 1, -9)
	button.HealthBar.Text = button.HealthBar:CreateFontString(nil, "ARTWORK", "SystemFont_Outline_Small")
	button.HealthBar.Text:SetPoint("CENTER", button.HealthBar, "CENTER", 3, 1)
	button.HealthBar.Text:SetTextColor(1, 1, 1)
    button.HealthBar.Text:SetFont(SystemFont_Outline_Small:GetFont(), 11, "OUTLINE")
    button:SetAlpha(0)    
    return button
end
for i = 1, MAX_PARTY_MEMBERS do PartyTarget_CreateButton(i) end

--隊友目標框架更新
hooksecurefunc("PartyMemberFrame_OnUpdate", function(self, elapsed)
	self.timer = (self.timer or 0) + elapsed
	if (self.timer >= 0.2) then
        self.timer = 0
        local unit = "party" .. self:GetID() .."target"
        local frame = _G["PartyTargetFrame"..self:GetID()]
		if UnitExists(unit) then
            PartyTarget_UpdateName(frame, unit)
            PartyTarget_UpdateHealth(frame, unit)
            PartyTarget_UpdateColor(frame, unit)
            PartyTarget_UpdateAlpha(frame, unit)
		else
			frame:SetAlpha(0)
		end
	end
end)