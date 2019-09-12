--	Player class colors.
function whoaUnitClass(healthbar, unit)
	if UnitIsPlayer(unit) and UnitIsConnected(unit) and UnitClass(unit) then
		_, class = UnitClass(unit);
		local c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class];
		healthbar:SetStatusBarColor(c.r, c.g, c.b);
	elseif UnitIsPlayer(unit) and (not UnitIsConnected(unit)) then
		healthbar:SetStatusBarColor(0.5,0.5,0.5);
	else
		healthbar:SetStatusBarColor(0,0.9,0);
	end
end
hooksecurefunc("UnitFrameHealthBar_Update", whoaUnitClass)
hooksecurefunc("HealthBar_OnValueChanged", function(self) whoaUnitClass(self, self.unit) end)

--	Unit faction colors.
function whoaUnitReaction(healthbar, unit)
	if UnitExists(unit) and (not UnitIsPlayer(unit)) then
		if (UnitIsTapDenied(unit)) and not UnitPlayerControlled(unit) then
			healthbar:SetStatusBarColor(0.5, 0.5, 0.5)
		elseif (not UnitIsTapDenied(unit)) then
			local reaction = FACTION_BAR_COLORS[UnitReaction(unit,"player")];
			if reaction then
				healthbar:SetStatusBarColor(reaction.r, reaction.g, reaction.b);
			else
				healthbar:SetStatusBarColor(0,0.6,0.1)
			end
		end
	end
end
hooksecurefunc("TargetFrame_CheckFaction", whoaUnitReaction)
hooksecurefunc("UnitFrameHealthBar_Update", whoaUnitReaction)
hooksecurefunc("HealthBar_OnValueChanged", function(self) whoaUnitReaction(self, self.unit) end)

---------------------------------------------------------------------------------	Aura positioning constants.
local LARGE_AURA_SIZE, SMALL_AURA_SIZE, AURA_OFFSET_Y, AURA_ROW_WIDTH, NUM_TOT_AURA_ROWS = 21, 16, 1, 128, 2   -- Set aura size.
hooksecurefunc("TargetFrame_UpdateAuraPositions", function(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX, mirrorAurasVertically)
	local offsetY = AURA_OFFSET_Y;
	local rowWidth = 0;
	local firstBuffOnRow = 1;
	for i=1, numAuras do
		if ( largeAuraList[i] ) then
			size = LARGE_AURA_SIZE;
			offsetY = AURA_OFFSET_Y + AURA_OFFSET_Y;
		else
			size = SMALL_AURA_SIZE;
		end
		if ( i == 1 ) then
			rowWidth = size;
			self.auraRows = self.auraRows + 1;
		else
			rowWidth = rowWidth + size + offsetX;
		end
		if ( rowWidth > maxRowWidth ) then
			updateFunc(self, auraName, i, numOppositeAuras, firstBuffOnRow, size, offsetX, offsetY, mirrorAurasVertically);
			rowWidth = size;
			self.auraRows = self.auraRows + 1;
			firstBuffOnRow = i;
			offsetY = AURA_OFFSET_Y;
			if ( self.auraRows > NUM_TOT_AURA_ROWS ) then
				maxRowWidth = AURA_ROW_WIDTH;
			end
		else
			updateFunc(self, auraName, i, numOppositeAuras, i - 1, size, offsetX, offsetY, mirrorAurasVertically);
		end
	end
end)
-- NOTE: Blizzards API will return targets current and max healh as a percentage instead of exact value (ex. 100/100).
function whoaTextFormat(statusFrame, textString, value, valueMin, valueMax)
	if ( ( tonumber(valueMax) ~= valueMax or valueMax > 0 ) and not ( statusFrame.pauseUpdates ) ) then
		local valueDisplay = value;
		local valueMaxDisplay = valueMax;
		local k,m=1e3
		local m=k*k
		local textDisplay = GetCVar("statusTextDisplay");
		if ( value and valueMax > 0 and ( (textDisplay ~= "NUMERIC" and textDisplay ~= "NONE") or statusFrame.showPercentage ) and not statusFrame.showNumeric) then
			if ( value == 0 and statusFrame.zeroText ) then
				textString:SetText(statusFrame.zeroText);
				statusFrame.isZero = 1;
				textString:Show();
			elseif ( textDisplay == "BOTH" and not statusFrame.showPercentage) then
				if( statusFrame.LeftText and statusFrame.RightText ) then
					if(not statusFrame.powerToken or statusFrame.powerToken == "MANA") then
						statusFrame.LeftText:SetText(math.ceil((value / valueMax) * 100) .. "%");
						statusFrame.LeftText:Show();
					end
					if (value < 1e3) then
						valueDisplay = format(valueDisplay);
					elseif (value >= 1e3) and (value < 1e5) then
						valueDisplay = format("%1.3f",value/k);
					elseif (value >= 1e5) and (value < 1e6) then
						valueDisplay = format("%1.0f K",value/k);
					elseif (value >= 1e6) then
						valueDisplay = format("%1.1f M",value/m);
					end
					if (value == 0) then
						statusFrame.RightText:SetText("");
					elseif (value ~= 0) then
						statusFrame.RightText:SetText(valueDisplay);
					end
					statusFrame.RightText:Show();
					textString:Hide();
				else
					valueDisplay = "(" .. math.ceil((value / valueMax) * 100) .. "%) " .. valueDisplay .. " / " .. valueMaxDisplay;
				end
				textString:SetText(valueDisplay);
			else
				if (value == 0) then
					valueDisplay = ("");
				elseif (value ~= 0) then
					valueDisplay = math.ceil((value / valueMax) * 100) .. "%";
				end
				if ( statusFrame.prefix and (statusFrame.alwaysPrefix or not (statusFrame.cvar and GetCVar(statusFrame.cvar) == "1" and statusFrame.textLockable) ) ) then
					textString:SetText(statusFrame.prefix .. " " .. valueDisplay);
				else
					textString:SetText(valueDisplay);
				end
			end
		elseif ( value == 0 and statusFrame.zeroText ) then
			textString:SetText(statusFrame.zeroText);
			statusFrame.isZero = 1;
			textString:Show();
			return;
		else
			statusFrame.isZero = nil;
			if ( statusFrame.prefix and (statusFrame.alwaysPrefix or not (statusFrame.cvar and GetCVar(statusFrame.cvar) == "1" and statusFrame.textLockable) ) ) then
				if (value < 1e3) then
					valueDisplay = format(valueDisplay);
				elseif (value >= 1e3) and (value < 1e5) then
					valueDisplay = format("%1.3f",value/k);
				elseif (value >= 1e5) and (value < 1e6) then
					valueDisplay = format("%1.0f K",value/k);
				elseif (value >= 1e6) then
					valueDisplay = format("%1.1f M",value/m);
				end
				if (valueMax < 1e3) then
					valueMaxDisplay = format(valueMaxDisplay);
				elseif (valueMax >= 1e3) and (valueMax < 1e5) then
					valueMaxDisplay = format("%1.3f",valueMaxDisplay/k);
				elseif (valueMax >= 1e5) and (valueMax < 1e6) then
					valueMaxDisplay = format("%1.0f K",valueMaxDisplay/k);
				elseif (valueMax >= 1e6) then
					valueMaxDisplay = format("%1.1f M",valueMaxDisplay/m);
				end
				if (value == 0) then
					textString:SetText("");
				elseif (value ~= 0) then
					textString:SetText(statusFrame.prefix.." "..valueDisplay.." / "..valueMaxDisplay);
				end
			else
				if (value < 1e3) then
					valueDisplay = format(valueDisplay);
				elseif (value >= 1e3) and (value < 1e5) then
					valueDisplay = format("%1.3f",value/k);
				elseif (value >= 1e5) and (value < 1e6) then
					valueDisplay = format("%1.0f K",value/k);
				elseif (value >= 1e6) then
					valueDisplay = format("%1.1f M",value/m);
				end
				if (valueMax < 1e3) then
					valueMaxDisplay = format(valueMaxDisplay);
				elseif (valueMax >= 1e3) and (valueMax < 1e5) then
					valueMaxDisplay = format("%1.3f",valueMaxDisplay/k);
				elseif (valueMax >= 1e5) and (valueMax < 1e6) then
					valueMaxDisplay = format("%1.0f K",valueMaxDisplay/k);
				elseif (valueMax >= 1e6) then
					valueMaxDisplay = format("%1.1f M",valueMaxDisplay/m);
				end
				if (value == 0) then
					textString:SetText("");
				elseif (value ~= 0) then
					textString:SetText(valueDisplay.." / "..valueMaxDisplay);
				end
			end
		end
	else
		textString:Hide();
		textString:SetText("");
		if ( not statusFrame.alwaysShow ) then
			statusFrame:Hide();
		else
			statusFrame:SetValue(0);
		end
	end
end
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues",whoaTextFormat)

--[[	Player frame dead / ghost text.
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues",function(self)
	local deadText = DEAD;
	local ghostText = "Ghost";
	
	if UnitIsDead("player") or UnitIsGhost("player") then
		PlayerFrameHealthBar.TextString:SetFontObject(GameFontNormalSmall);
		PlayerFrameHealthBar.TextString:SetTextColor(1.0,0.82,0,1);
		for i, v in pairs({	PlayerFrameHealthBar.LeftText, PlayerFrameHealthBar.RightText, PlayerFrameManaBar.LeftText, PlayerFrameManaBar.RightText, PlayerFrameManaBar.TextString, PlayerFrameManaBar }) do v:SetAlpha(0); end
		PlayerFrameHealthBar.TextString:Show();
	else
		PlayerFrameHealthBar.TextString:SetFontObject(SystemFont_Outline_Small);
		PlayerFrameHealthBar.TextString:SetTextColor(1,1,1,1);
		for i, v in pairs({	PlayerFrameHealthBar.LeftText, PlayerFrameHealthBar.RightText, PlayerFrameManaBar.LeftText, PlayerFrameManaBar.RightText, PlayerFrameManaBar.TextString, PlayerFrameManaBar }) do v:SetAlpha(1); end
	end
	if UnitIsDead("player") then
		PlayerFrameHealthBar.TextString:SetText(deadText);
	elseif UnitIsGhost("player") then
		PlayerFrameHealthBar.TextString:SetText(ghostText);
	-- end
	elseif not UnitIsDead("player") and not UnitIsGhost("player") then
		-- PlayerFrameHealthBar.TextString:SetFontObject(SystemFont_Outline_Small);
		-- PlayerFrameHealthBar.TextString:SetTextColor(1,1,1,1);
		-- for i, v in pairs({	PlayerFrameHealthBar.LeftText, PlayerFrameHealthBar.RightText, PlayerFrameManaBar.LeftText, PlayerFrameManaBar.RightText, PlayerFrameManaBar.TextString, PlayerFrameManaBar }) do v:SetAlpha(1); end
	end
	
	if UnitIsDead("target") or UnitIsGhost("target") then
		for i, v in pairs({	TargetFrameHealthBar.LeftText, TargetFrameHealthBar.RightText, TargetFrameHealthBar.TextString, TargetFrameManaBar.LeftText, TargetFrameManaBar.RightText, TargetFrameManaBar.TextString, TargetFrameManaBar }) do v:SetAlpha(0); end
	else
		for i, v in pairs({	TargetFrameHealthBar.LeftText, TargetFrameHealthBar.RightText, TargetFrameHealthBar.TextString, TargetFrameManaBar.LeftText, TargetFrameManaBar.RightText, TargetFrameManaBar.TextString, TargetFrameManaBar }) do v:SetAlpha(1); end
	end
	if UnitIsDead("target") then
		TargetFrame.deadText:SetText(deadText);
	elseif UnitIsGhost("target") then
		TargetFrame.deadText:Show();
		TargetFrame.deadText:SetText(ghostText);
	-- elseif not UnitIsDead("target") and not UnitIsGhost("target") then
		-- PlayerFrameHealthBar.TextString:SetFontObject(SystemFont_Outline_Small);
		-- PlayerFrameHealthBar.TextString:SetTextColor(1,1,1,1);
		-- for i, v in pairs({	PlayerFrameHealthBar.LeftText, PlayerFrameHealthBar.RightText, PlayerFrameManaBar.LeftText, PlayerFrameManaBar.RightText, PlayerFrameManaBar.TextString, PlayerFrameManaBar }) do v:SetAlpha(1); end
	end
end)]]
--	Player frame.
hooksecurefunc("PlayerFrame_ToPlayerArt", function(self)
		PlayerFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame");
		PlayerStatusTexture:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\UFs\\UI-Player-Status");
		PlayerFrameBackground:SetWidth(120);
		self.name:Hide();
		--self.name:ClearAllPoints();
		--self.name:SetPoint("CENTER", PlayerFrame, "CENTER",50.5, 36);
		self.healthbar:SetPoint("TOPLEFT",108,-24);
		self.healthbar:SetHeight(28);
		self.healthbar.LeftText:ClearAllPoints();
		self.healthbar.LeftText:SetPoint("LEFT",self.healthbar,"LEFT",5,0);	
		self.healthbar.RightText:ClearAllPoints();
		self.healthbar.RightText:SetPoint("RIGHT",self.healthbar,"RIGHT",-5,0);
		self.healthbar.TextString:SetPoint("CENTER", self.healthbar, "CENTER", 0, 0);
		self.manabar.LeftText:ClearAllPoints();
		self.manabar.LeftText:SetPoint("LEFT",self.manabar,"LEFT",5,0)		;
		self.manabar.RightText:ClearAllPoints();
		self.manabar.RightText:SetPoint("RIGHT",self.manabar,"RIGHT",-5,0);
		self.manabar.TextString:SetPoint("CENTER",self.manabar,"CENTER",0,0);
		self.healthbar.LeftText:SetFontObject(SystemFont_Outline_Small);
		self.healthbar.RightText:SetFontObject(SystemFont_Outline_Small);
		self.manabar.LeftText:SetFontObject(SystemFont_Outline_Small);
		self.manabar.RightText:SetFontObject(SystemFont_Outline_Small);
		-- self.healthbar.TextString:SetFontObject(SystemFont_Outline_Small);
		-- self.manabar.TextString:SetFontObject(SystemFont_Outline_Small);
		--PlayerFrameGroupIndicatorText:ClearAllPoints();
		--PlayerFrameGroupIndicatorText:SetPoint("BOTTOMLEFT", PlayerFrame,"TOP",0,-20);
		PlayerFrameGroupIndicatorLeft:Hide();
		PlayerFrameGroupIndicatorMiddle:Hide();
		PlayerFrameGroupIndicatorRight:Hide();
end)
--	Player vehicle frame.
hooksecurefunc("PlayerFrame_ToVehicleArt", function(self, vehicleType)
		if ( vehicleType == "Natural" ) then
		PlayerFrameVehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Organic");
		PlayerFrameFlash:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Organic-Flash");
		PlayerFrameFlash:SetTexCoord(-0.02, 1, 0.07, 0.86);
		self.healthbar:SetSize(103,12);
		self.healthbar:SetPoint("TOPLEFT",116,-41);
		self.manabar:SetSize(103,12);
		self.manabar:SetPoint("TOPLEFT",116,-52);
	else
		PlayerFrameVehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame");
		PlayerFrameFlash:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Flash");
		PlayerFrameFlash:SetTexCoord(-0.02, 1, 0.07, 0.86);
		self.healthbar:SetSize(100,12);
		self.healthbar:SetPoint("TOPLEFT",119,-41);
		self.manabar:SetSize(100,12);
		self.manabar:SetPoint("TOPLEFT",119,-52);
	end
	PlayerName:SetPoint("CENTER",50,23);
	PlayerFrameBackground:SetWidth(114);
end)
hooksecurefunc("PlayerFrame_ToPlayerArt", function()
	-- PetFrameHealthBarTextLeft:ClearAllPoints();
	PetFrameHealthBarTextLeft:SetPoint("LEFT",PetFrameHealthBar,"LEFT",0,0);
	-- PetFrameHealthBarTextRight:ClearAllPoints();
	PetFrameHealthBarTextRight:SetPoint("RIGHT",PetFrameHealthBar,"RIGHT",0,0);
	-- PetFrameManaBarTextLeft:ClearAllPoints();
	PetFrameManaBarTextLeft:SetPoint("LEFT",PetFrameManaBar,"LEFT",0,-2);
	-- PetFrameManaBarTextRight:ClearAllPoints();
	PetFrameManaBarTextRight:SetPoint("RIGHT",PetFrameManaBar,"RIGHT",0,-2);
	PetFrameHealthBarTextLeft:SetFontObject(SystemFont_Outline_Small);
	PetFrameHealthBarTextRight:SetFontObject(SystemFont_Outline_Small);
	PetFrameManaBarTextLeft:SetFontObject(SystemFont_Outline_Small);
	PetFrameManaBarTextRight:SetFontObject(SystemFont_Outline_Small);
end)
function whoaPetFrameBg()
	local f = CreateFrame("Frame",nil,PetFrame)
	f:SetFrameStrata("BACKGROUND")
	f:SetSize(70,18);
	local t = f:CreateTexture(nil,"BACKGROUND")
	t:SetColorTexture(0, 0, 0, 0.5)
	t:SetAllPoints(f)
	f.texture = t
	f:SetPoint("CENTER",16,-5);
	f:Show()
end
whoaPetFrameBg();

--	Target frame
hooksecurefunc("TargetFrame_CheckClassification", function(self, forceNormalTexture)
	local classification = UnitClassification(self.unit);
	--self.highLevelTexture:ClearAllPoints();
	--self.highLevelTexture:SetPoint("CENTER", self.levelText, "CENTER", 1,0);
	self.deadText:SetFont(STANDARD_TEXT_FONT,21,"OUTLINE")
	self.deadText:SetPoint("TOPLEFT", self.healthbar, "TOPRIGHT", 12, -8)
	self.nameBackground:Hide();
	-- self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
	self.name:SetPoint("LEFT", self, 15, 36);
	self.healthbar:SetSize(119, 28);
	self.healthbar:SetPoint("TOPLEFT", 5, -24);
	self.healthbar.LeftText:SetPoint("LEFT", self.healthbar, "LEFT", 5, 0);
	self.healthbar.RightText:SetPoint("RIGHT", self.healthbar, "RIGHT", -3, 0);
	self.healthbar.TextString:SetPoint("CENTER", self.healthbar, "CENTER", 0, 0);
	self.manabar.LeftText:SetPoint("LEFT", self.manabar, "LEFT", 3, 0);	
	self.manabar.RightText:ClearAllPoints();
	self.manabar.RightText:SetPoint("RIGHT", self.manabar, "RIGHT", -3, 0);
	self.manabar.TextString:SetPoint("CENTER", self.manabar, "CENTER", 0, 0);
	self.healthbar.LeftText:SetFontObject(SystemFont_Outline_Small);
	self.healthbar.RightText:SetFontObject(SystemFont_Outline_Small);
	self.manabar.LeftText:SetFontObject(SystemFont_Outline_Small);
	self.manabar.RightText:SetFontObject(SystemFont_Outline_Small);
	self.healthbar.TextString:SetFontObject(SystemFont_Outline_Small);
		self.manabar.TextString:SetFontObject(SystemFont_Outline_Small);
	-- TargetFrame.threatNumericIndicator:SetPoint("BOTTOM", PlayerFrame, "TOP", 72, -21);
	-- FocusFrame.threatNumericIndicator:SetAlpha(0);
	if ( forceNormalTexture ) then
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
	elseif ( classification == "minus" ) then
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus");
		forceNormalTexture = true;
	elseif ( classification == "worldboss" or classification == "elite" ) then
		self.borderTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Elite");
	elseif ( classification == "rareelite" ) then
		self.borderTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Rare-Elite");
	elseif ( classification == "rare" ) then
		self.borderTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Rare");
	else
		self.borderTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame");
		forceNormalTexture = true;
	end
	if ( forceNormalTexture ) then
		self.haveElite = nil;
		if ( classification == "minus" ) then
			self.Background:SetSize(119,12);
			self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 47);
			self.name:SetPoint("LEFT", self, 16, 19);
			self.healthbar:ClearAllPoints();
			self.healthbar:SetPoint("LEFT", 5, 3);
			self.healthbar:SetHeight(12);
			self.healthbar.LeftText:SetPoint("LEFT", self.healthbar, "LEFT", 3, 0);
			self.healthbar.RightText:SetPoint("RIGHT", self.healthbar, "RIGHT", -2, 0);
		else
			self.Background:SetSize(119,42);
			self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
		end
		if ( self.threatIndicator ) then
			if ( classification == "minus" ) then
				self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus-Flash");
				self.threatIndicator:SetTexCoord(0, 1, 0, 1);
				self.threatIndicator:SetWidth(256);
				self.threatIndicator:SetHeight(128);
				self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
			else
				self.threatIndicator:SetTexCoord(0, 0.9453125, 0, 0.181640625);
				self.threatIndicator:SetWidth(242);
				self.threatIndicator:SetHeight(93);
				self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
			end
		end	
	else
		self.haveElite = true;
		self.Background:SetSize(119,42);
		if ( self.threatIndicator ) then
			self.threatIndicator:SetTexCoord(0, 0.9453125, 0.181640625, 0.400390625);
			self.threatIndicator:SetWidth(242);
			self.threatIndicator:SetHeight(112);
		end		
	end
	self.healthbar.lockColor = true;
end)
-- Mana texture
hooksecurefunc("UnitFrameManaBar_UpdateType", function(manaBar)
	local powerType, powerToken, altR, altG, altB = UnitPowerType(manaBar.unit);
	local info = PowerBarColor[powerToken];
	if ( info ) then
		if ( not manaBar.lockColor ) then
			if not ( info.atlas ) then
				manaBar:SetStatusBarTexture("Interface\\Addons\\_ShiGuang\\Media\\Skullflower3");
			end
		end
	end
end)

function CreateStatusBarText(name, parentName, parent, point, x, y)
	local fontString = parent:CreateFontString(parentName..name, nil, "TextStatusBarText")
	fontString:SetPoint(point, parent, point, x, y)
	return fontString
end
function whoaStatustextFrame()
	TargetFrameHealthBar.TextString = CreateStatusBarText("Text", "TargetFrameHealthBar", TargetFrameTextureFrame, "CENTER", 0, 0);
	TargetFrameHealthBar.LeftText = CreateStatusBarText("TextLeft", "TargetFrameHealthBar", TargetFrameTextureFrame, "LEFT", 5, 0);
	TargetFrameHealthBar.RightText = CreateStatusBarText("TextRight", "TargetFrameHealthBar", TargetFrameTextureFrame, "RIGHT", -3, 0);
	TargetFrameManaBar.TextString = CreateStatusBarText("Text", "TargetFrameManaBar", TargetFrameTextureFrame, "CENTER", 0, 0);
	TargetFrameManaBar.LeftText = CreateStatusBarText("TextLeft", "TargetFrameManaBar", TargetFrameTextureFrame, "LEFT", 5, 0);
	TargetFrameManaBar.RightText = CreateStatusBarText("TextRight", "TargetFrameManaBar", TargetFrameTextureFrame, "RIGHT", -3, 0);
end
whoaStatustextFrame()
--	ToT & ToF
function whoaFrameToTF()
	TargetFrameToTTextureFrameDeadText:ClearAllPoints();
	TargetFrameToTTextureFrameDeadText:SetPoint("CENTER", "TargetFrameToTHealthBar","CENTER",1, 0);
	TargetFrameToTTextureFrameName:SetSize(65,10);
	TargetFrameToTTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetofTargetFrame");
	TargetFrameToTHealthBar:ClearAllPoints();
	TargetFrameToTHealthBar:SetPoint("TOPLEFT", 45, -15);
    TargetFrameToTHealthBar:SetHeight(10);
    TargetFrameToTManaBar:ClearAllPoints();
    TargetFrameToTManaBar:SetPoint("TOPLEFT", 45, -25);
    TargetFrameToTManaBar:SetHeight(5);
	TargetFrameToTBackground:SetSize(50,14);
	TargetFrameToTBackground:ClearAllPoints();
	TargetFrameToTBackground:SetPoint("CENTER", "TargetFrameToT","CENTER",20, 0);
end
hooksecurefunc("TargetofTarget_Update", whoaFrameToTF)
hooksecurefunc("TargetFrame_CheckClassification", whoaFrameToTF)

--	Boss target frames.
--[[function whoaBossFrames()
	for i = 1, MAX_BOSS_FRAMES do
		_G["Boss"..i.."TargetFrameTextureFrameDeadText"]:ClearAllPoints();
		_G["Boss"..i.."TargetFrameTextureFrameDeadText"]:SetPoint("CENTER",_G["Boss"..i.."TargetFrameHealthBar"],"CENTER",0,0);
		_G["Boss"..i.."TargetFrameTextureFrameName"]:ClearAllPoints();
		_G["Boss"..i.."TargetFrameTextureFrameName"]:SetPoint("CENTER",_G["Boss"..i.."TargetFrameManaBar"],"CENTER",0,0);
		_G["Boss"..i.."TargetFrameTextureFrameTexture"]:SetTexture("Interface\\Addons\\whoaUnitFrames\\media\\UI-UNITFRAME-BOSS");
		_G["Boss"..i.."TargetFrameNameBackground"]:Hide();
		_G["Boss"..i.."TargetFrameHealthBar"]:SetSize(116,18);
		_G["Boss"..i.."TargetFrameHealthBar"]:ClearAllPoints();
		_G["Boss"..i.."TargetFrameHealthBar"]:SetPoint("CENTER",_G["Boss"..i.."TargetFrame"],"CENTER",-51,18);
		_G["Boss"..i.."TargetFrameManaBar"]:SetSize(116,18);
		_G["Boss"..i.."TargetFrameManaBar"]:ClearAllPoints();
		_G["Boss"..i.."TargetFrameManaBar"]:SetPoint("CENTER",_G["Boss"..i.."TargetFrame"],"CENTER",-51,-3);
		_G["Boss"..i.."TargetFrameTextureFrameHealthBarTextLeft"]:ClearAllPoints();
		_G["Boss"..i.."TargetFrameTextureFrameHealthBarTextLeft"]:SetPoint("LEFT",_G["Boss"..i.."TargetFrameHealthBar"],"LEFT",0,0);
		_G["Boss"..i.."TargetFrameTextureFrameHealthBarTextRight"]:ClearAllPoints();
		_G["Boss"..i.."TargetFrameTextureFrameHealthBarTextRight"]:SetPoint("RIGHT",_G["Boss"..i.."TargetFrameHealthBar"],"RIGHT",0,0);
		_G["Boss"..i.."TargetFrameTextureFrameHealthBarText"]:ClearAllPoints();
		_G["Boss"..i.."TargetFrameTextureFrameHealthBarText"]:SetPoint("CENTER",_G["Boss"..i.."TargetFrameHealthBar"],"CENTER",0,0);
		_G["Boss"..i.."TargetFrameTextureFrameManaBarTextLeft"]:ClearAllPoints();
		_G["Boss"..i.."TargetFrameTextureFrameManaBarTextLeft"]:SetPoint("LEFT",_G["Boss"..i.."TargetFrameManaBar"],"LEFT",0,0);
		_G["Boss"..i.."TargetFrameTextureFrameManaBarTextRight"]:ClearAllPoints();
		_G["Boss"..i.."TargetFrameTextureFrameManaBarTextRight"]:SetPoint("RIGHT",_G["Boss"..i.."TargetFrameManaBar"],"RIGHT",0,0);
		_G["Boss"..i.."TargetFrameTextureFrameManaBarText"]:ClearAllPoints();
		_G["Boss"..i.."TargetFrameTextureFrameManaBarText"]:SetPoint("CENTER",_G["Boss"..i.."TargetFrameManaBar"],"CENTER",0,0);
	end
end
whoaBossFrames();
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", function()
	for i = 1, MAX_BOSS_FRAMES do
		_G["Boss"..i.."TargetFrameTextureFrameManaBarTextLeft"]:SetText(" ");
		_G["Boss"..i.."TargetFrameTextureFrameManaBarTextRight"]:SetText(" ");
		_G["Boss"..i.."TargetFrameTextureFrameManaBarText"]:SetText(" ");
	end
end)]]

--	Party Frames.
function whoaPartyFrames()
	local useCompact = GetCVarBool("useCompactPartyFrames");
	if IsInGroup(player) and (not IsInRaid(player)) and (not useCompact) then 
		for i = 1, 4 do
			_G["PartyMemberFrame"..i.."Name"]:SetSize(80,12);
			_G["PartyMemberFrame"..i.."Name"]:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
			_G["PartyMemberFrame"..i.."Texture"]:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-PartyFrame");
			_G["PartyMemberFrame"..i.."Flash"]:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-PARTYFRAME-FLASH");
			_G["PartyMemberFrame"..i.."HealthBar"]:ClearAllPoints();
			_G["PartyMemberFrame"..i.."HealthBar"]:SetPoint("TOPLEFT", 45, -13);
			_G["PartyMemberFrame"..i.."HealthBar"]:SetHeight(12);
			_G["PartyMemberFrame"..i.."ManaBar"]:ClearAllPoints();
			_G["PartyMemberFrame"..i.."ManaBar"]:SetPoint("TOPLEFT", 45, -26);
			_G["PartyMemberFrame"..i.."ManaBar"]:SetHeight(5);
			--_G["PartyMemberFrame"..i.."HealthBarTextLeft"]:ClearAllPoints();
			--_G["PartyMemberFrame"..i.."HealthBarTextLeft"]:SetPoint("LEFT", _G["PartyMemberFrame"..i.."HealthBar"], "LEFT", 0, 0);
			--_G["PartyMemberFrame"..i.."HealthBarTextRight"]:ClearAllPoints();
			--_G["PartyMemberFrame"..i.."HealthBarTextRight"]:SetPoint("RIGHT", _G["PartyMemberFrame"..i.."HealthBar"], "RIGHT", 0, 0);
			--_G["PartyMemberFrame"..i.."ManaBarTextLeft"]:ClearAllPoints();
			--_G["PartyMemberFrame"..i.."ManaBarTextLeft"]:SetPoint("LEFT", _G["PartyMemberFrame"..i.."ManaBar"], "LEFT", 0, 0);
			--_G["PartyMemberFrame"..i.."ManaBarTextRight"]:ClearAllPoints();
			--_G["PartyMemberFrame"..i.."ManaBarTextRight"]:SetPoint("RIGHT", _G["PartyMemberFrame"..i.."ManaBar"], "RIGHT", 0, 0);
			--_G["PartyMemberFrame"..i.."HealthBarText"]:ClearAllPoints();
			--_G["PartyMemberFrame"..i.."HealthBarText"]:SetPoint("LEFT", _G["PartyMemberFrame"..i.."HealthBar"], "RIGHT", 0, 0);
			--_G["PartyMemberFrame"..i.."ManaBarText"]:ClearAllPoints();
			--_G["PartyMemberFrame"..i.."ManaBarText"]:SetPoint("LEFT", _G["PartyMemberFrame"..i.."ManaBar"], "RIGHT", 0, 0);
		end
	end
end
hooksecurefunc("UnitFrame_Update", whoaPartyFrames)
hooksecurefunc("PartyMemberFrame_ToPlayerArt", whoaPartyFrames)
--------------------------------------------------------------------------------------whoa end