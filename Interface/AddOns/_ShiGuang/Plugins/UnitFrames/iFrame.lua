----------------------------------- iFrame  -----------------------------------------
hooksecurefunc("TextStatusBar_UpdateTextString", function(bar)   ----	  血量百分比数字 
	local value = bar:GetValue()
	local _, max = bar:GetMinMaxValues()
	if bar.pctText then
		bar.pctText:SetText(value==0 and "" or tostring(math.ceil((value / max) * 100)))  --(value==0 and "" or tostring(math.ceil((value / max) * 100)) .. "%")
		if not MaoRUIDB["UFs"]["UFPctText"] or value == max then bar.pctText:Hide()
		elseif GetCVarBool("statusTextPercentage") and ( bar.unit == PlayerFrame.unit or bar.unit == "target" or bar.unit == "focus" ) then bar.pctText:Hide()
		else bar.pctText:Show()
		end
	end
end)
local function colorHPBar(bar, unit)
	if bar and not bar.lockValues and unit == bar.unit then
		local min, max = bar:GetMinMaxValues()
		local value = bar:GetValue()
		if max > min then value = (value - min) / (max - min) else value = 0 end
		if value > 0.5 then r, g, b = 2*(1-value), 1, 0 else r, g, b = 1, 2*value, 0 end
			--if UnitIsPlayer(unit) and UnitClass(unit) then  --按职业着色
				--local color = RAID_CLASS_COLORS[select(2, UnitClass(unit))]
				--bar:SetStatusBarColor(color.r, color.g, color.b)
			--else
				--bar:SetStatusBarColor(r, g, b)
			--end
		if bar.pctText then	bar.pctText:SetTextColor(r, g, b) end
	end
end
hooksecurefunc("UnitFrameHealthBar_Update", colorHPBar)
hooksecurefunc("HealthBar_OnValueChanged", function(self) colorHPBar(self, self.unit) end)

hooksecurefunc("UnitFrame_Update", function(self)
	if self.name and self.unit then
		local color = RAID_CLASS_COLORS[select(2, UnitClass(self.unit))] or NORMAL_FONT_COLOR
	  if self.name then
	    if UnitIsPlayer(self.unit) then 
		   self.name:SetTextColor(color.r, color.g, color.b)
		elseif UnitIsEnemy("player", "target") then 
		   self.name:SetTextColor(1,0,0) 
		elseif UnitIsFriend("player", "target") then 
		   self.name:SetTextColor(0,1,0)  
		else
		   self.name:SetTextColor(1,1,0) 
		end
	end
		if string.len(self:GetName()) == 16 and string.find(self:GetName(), "PartyMemberFrame") then
			self.name:SetText(GetUnitName(self.unit))							-- 不显示队友姓名中的服务器名
		end
	end
end)

local function PartyLevelText_Update(self)
	local level = ""
	if self.unit and UnitLevel(self.unit) and UnitLevel(self.unit) >= 1 then
		level = UnitLevel(self.unit)
	end
	if not self.levelText then
		self.levelText = _G[self:GetName()]:CreateFontString(nil, "OVERLAY", "NumberFontNormalLargeYellow")
		self.levelText:ClearAllPoints();
		self.levelText:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 12, -6)
	end
	self.levelText:SetText(level)
end

hooksecurefunc("PartyMemberFrame_UpdateMember", function(self)
	local unit = "party"..self:GetID()
	if UnitExists(unit) then
		PartyLevelText_Update(self)
		--CastingBarFrame_SetUnit(self.castBar, unit, false, true)
	end
end)

local iFrame = CreateFrame("Frame")
iFrame:RegisterEvent("UNIT_LEVEL")
iFrame:SetScript("OnEvent", function(self, event, ...)
	local arg1 = ...
	if event == "UNIT_LEVEL" then
		for i = 1, 4 do
			if arg1 == "party"..i then
				PartyLevelText_Update(_G["PartyMemberFrame"..i])
			end
		end
	end
end)
--------------------------------------------------------------------------------------iFrame end