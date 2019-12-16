if select(2, UnitClass("player")) ~= "PALADIN" then return end
local ConROC_Paladin, ids = ...;

--General
	ids.Racial = {
		Perception = 20600,
	}
	ids.Spec = {
		Holy = 1,
		Protection = 2,
		Retribution = 3,
	}
--Holy
	ids.Holy_Ability = {
		BlessingofLightRank1 = 19977,
		BlessingofLightRank2 = 19978,
		BlessingofLightRank3 = 19979,
		BlessingofWisdomRank1 = 19742,
		BlessingofWisdomRank2 = 19850,
		BlessingofWisdomRank3 = 19852,
		BlessingofWisdomRank4 = 19853,
		BlessingofWisdomRank5 = 19854,
		Cleanse = 4987,
		ConsecrationRank1 = 26573,
		ConsecrationRank2 = 20116,
		ConsecrationRank3 = 20922,
		ConsecrationRank4 = 20923,
		ConsecrationRank5 = 20924,
		ExorcismRank1 = 879,
		ExorcismRank2 = 5614,
		ExorcismRank3 = 5615,
		ExorcismRank4 = 10312,
		ExorcismRank5 = 10313,
		ExorcismRank6 = 10314,
		FlashofLightRank1 = 19750,
		FlashofLightRank2 = 19939,
		FlashofLightRank3 = 19940,
		FlashofLightRank4 = 19941,
		FlashofLightRank5 = 19942,
		FlashofLightRank6 = 19943,
		GreaterBlessingofLightRank1 = 25890,
		GreaterBlessingofWisdomRank1 = 25894,
		GreaterBlessingofWisdomRank2 = 25918,
		HammerofWrathRank1 = 24275,
		HammerofWrathRank2 = 24274,
		HammerofWrathRank3 = 24239,
		HolyLightRank1 = 635,
		HolyLightRank2 = 639,
		HolyLightRank3 = 647,
		HolyLightRank4 = 1026,
		HolyLightRank5 = 1042,
		HolyLightRank6 = 3472,
		HolyLightRank7 = 10328,
		HolyLightRank8 = 10329,
		HolyShockRank1 = 20473,
		HolyShockRank2 = 20929,
		HolyShockRank3 = 20930,
		HolyWrathRank1 = 2812,
		HolyWrathRank2 = 10318,
		LayonHandsRank1 = 633,
		LayonHandsRank2 = 2800,
		LayonHandsRank3 = 10310,
		Purify = 1152,
		RedemptionRank1 = 7328,
		RedemptionRank2 = 10322,
		RedemptionRank3 = 10324,
		RedemptionRank4 = 20772,
		RedemptionRank5 = 20773,
		SealofLightRank1 = 20165,
		SealofLightRank2 = 20347,
		SealofLightRank3 = 20348,
		SealofLightRank4 = 20349,
		SealofRighteousnessRank0 = 20154,
		SealofRighteousnessRank1 = 21084,
		SealofRighteousnessRank2 = 20287,
		SealofRighteousnessRank3 = 20288,
		SealofRighteousnessRank4 = 20289,
		SealofRighteousnessRank5 = 20290,
		SealofRighteousnessRank6 = 20291,
		SealofRighteousnessRank7 = 20292,
		SealofRighteousnessRank8 = 20293,
		SealofWisdomRank1 = 20166,
		SealofWisdomRank2 = 20356,
		SealofWisdomRank3 = 20357,
		SenseUndead = 5502,
		TurnUndeadRank1 = 2878,
		TurnUndeadRank2 = 5627,
		TurnUndeadRank3 = 10326,
	}
	ids.Holy_Talent = {
		DivineStrength = 1,
		DivineIntellect = 2,
		
		SpiritualFocus = 3,
		ImprovedSealofRighteousness = 4,
		
		HealingLight = 5,
		Consecration = 6,
		ImprovedLayonHands = 7,
		UnyieldingFaith = 8,
		
		Illumination = 9,
		ImprovedBlessingofWisdom = 10,
		
		DivineFavor = 11,
		LastingJudgement = 12,
		
		HolyPower = 13,
		
		HolyShock = 14,
	}	
--Protection
	ids.Prot_Ability = {
		BlessingofFreedom = 1044,
		BlessingofKings = 20217,
		BlessingofProtectionRank1 = 1022,
		BlessingofProtectionRank2 = 5599,
		BlessingofProtectionRank3 = 10278,
		BlessingofSacrificeRank1 = 6940,
		BlessingofSacrificeRank2 = 20729,
		BlessingofSalvation = 1038,
		BlessingofSanctuaryRank1 = 20911,
		BlessingofSanctuaryRank2 = 20912,
		BlessingofSanctuaryRank3 = 20913,
		BlessingofSanctuaryRank4 = 20914,
		ConcentrationAura = 19746,
		DevotionAuraRank1 = 465,
		DevotionAuraRank2 = 10290,
		DevotionAuraRank3 = 643,
		DevotionAuraRank4 = 10291,
		DevotionAuraRank5 = 1032,
		DevotionAuraRank6 = 10292,
		DevotionAuraRank7 = 10293,
		DivineIntervention = 19752,
		DivineProtectionRank1 = 498,
		DivineProtectionRank2 = 5573,
		DivineShieldRank1 = 642,
		DivineShieldRank2 = 1020,
		FireResistanceAuraRank1 = 19891,
		FireResistanceAuraRank2 = 19899,
		FireResistanceAuraRank3 = 19900,
		FrostResistanceAuraRank1 = 19888,
		FrostResistanceAuraRank2 = 19897,
		FrostResistanceAuraRank3 = 19898,
		GreaterBlessingofKings = 25898,
		GreaterBlessingofSalvation = 25895,
		GreaterBlessingofSanctuaryRank1 = 25899,
		HammerofJusticeRank1 = 853,
		HammerofJusticeRank2 = 5588,
		HammerofJusticeRank3 = 5589,
		HammerofJusticeRank4 = 10308,
		HolyShieldRank1 = 20925,
		HolyShieldRank2 = 20927,
		HolyShieldRank3 = 20928,
		RighteousFury = 25780,
		SealofJustice = 20164,
		ShadowResistanceAuraRank1 = 19876,
		ShadowResistanceAuraRank2 = 19875,
		ShadowResistanceAuraRank3 = 19896,
	}
	ids.Prot_Talent = {
		ImprovedDevotionAura = 1,
		Redoubt = 2,
		
		Precision = 3,
		GuardiansFavor = 4,
		Toughness = 5,
		
		BlessingofKings = 6,
		ImprovedRightouesFury = 7,
		ShieldSpecialization = 8,
		Anticipation = 9,
		
		ImprovedHammerofJustice = 10,
		ImprovedConcentrationAura = 11,
		
		BlessingofSanctuary = 12,
		Reckoning = 13,
		
		OneHandedWeaponSpecialization = 14,
		
		HolyShield = 15,
	}
--Retribution
	ids.Ret_Ability = {
		BlessingofMightRank1 = 19740,
		BlessingofMightRank2 = 19834,
		BlessingofMightRank3 = 19835,
		BlessingofMightRank4 = 19836,
		BlessingofMightRank5 = 19837,
		BlessingofMightRank6 = 19838,
		GreaterBlessingofMightRank1 = 25782,
		GreaterBlessingofMightRank2 = 25916,
		Judgement = 20271,
		Repentance = 20066,
		RetributionAuraRank1 = 7294,
		RetributionAuraRank2 = 10298,
		RetributionAuraRank3 = 10299,
		RetributionAuraRank4 = 10300,
		RetributionAuraRank5 = 10301,
		SanctityAura = 20218,
		SealofCommandRank1 = 20375,
		SealofCommandRank2 = 20915,
		SealofCommandRank3 = 20918,
		SealofCommandRank4 = 20919,
		SealofCommandRank5 = 20920,
		SealoftheCrusaderRank1 = 21082,
		SealoftheCrusaderRank2 = 20162,
		SealoftheCrusaderRank3 = 20305,
		SealoftheCrusaderRank4 = 20306,
		SealoftheCrusaderRank5 = 20307,
		SealoftheCrusaderRank6 = 20308,
	}
	ids.Ret_Talent = {
		ImprovedBlessingofMight = 1,
		Benediction = 2,
		
		ImprovedJudgement = 3,
		ImprovedSealoftheCrusader = 4,
		Deflection = 5,
		
		Vindication = 6,
		Conviction = 7,
		SealofCommand = 8,
		PursuitofJustice = 9,
		
		EyeforanEye = 10,
		ImprovedRetributionAura = 11,
		
		TwoHandedWeaponSpecialization = 12,
		SanctityAura = 13,
		
		Vengeance = 14,
		
		Repentance = 15,
	}
-- Auras
	ids.Player_Buff = {
	
	}
	ids.Player_Debuff = {
		Forbearance = 25771,	
	}
	ids.Target_Debuff = {
		JudgementoftheCrusaderRank1 = 21183,	
		JudgementoftheCrusaderRank2 = 20188,
		JudgementoftheCrusaderRank3 = 20300,
		JudgementoftheCrusaderRank4 = 20301,
		JudgementoftheCrusaderRank5 = 20302,
		JudgementoftheCrusaderRank6 = 20303,
		JudgementofJustice = 20184,
		JudgementofLightRank1 = 20185,
		JudgementofLightRank2 = 20344,
		JudgementofLightRank3 = 20345,
		JudgementofLightRank4 = 20346,
		JudgementofWisdomRank1 = 20186,
		JudgementofWisdomRank2 = 20354,
		JudgementofWisdomRank3 = 20355,
	}

local lastFrame = 0;
local lastAura = 0;
local lastJudge = 0;
local lastSeal = 0;
local lastBless = 0;
local lastStun = 0;

local plvl = UnitLevel('player');

local defaults = {
	["ConROC_SM_Role_Melee"] = true,
	
	["ConROC_SM_Aura_Devotion"] = true,
	["ConROC_SM_Judgement_Crusader"] = true,
	["ConROC_SM_Seal_Righteousness"] = true,
	["ConROC_SM_Bless_Might"] = true,
}


ConROCPaladinSpells = ConROCPaladinSpells or defaults;

function ConROC:SpellmenuClass()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCSpellmenuClass", ConROCSpellmenuFrame2)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 30) --30 with Roles turned on. 1 when off.
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCSpellmenuFrame_Title", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)
		
	--Tank
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Role_Tank", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(radio1, "ARTWORK", "GameFontRedSmall");
			radio1:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -10);
			radio1:SetChecked(ConROCPaladinSpells.ConROC_SM_Role_Tank);
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Role_Tank:SetChecked(true);
					ConROC_SM_Role_Melee:SetChecked(false);
					ConROC_SM_Role_Healer:SetChecked(false);
					ConROC_SM_Role_PvP:SetChecked(false);
					ConROCPaladinSpells.ConROC_SM_Role_Tank = ConROC_SM_Role_Tank:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_Healer = ConROC_SM_Role_Healer:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile()
				end
			);
			radio1text:SetText("Tank");				
		local r1t = radio1.texture;
			if not r1t then
				r1t = radio1:CreateTexture('Spellmenu_radio1_Texture', 'ARTWORK');
				r1t:SetTexture('Interface\\AddOns\\ConROC\\images\\shield2');
				r1t:SetBlendMode('BLEND');
				local color = ConROC.db.profile.defenseOverlayColor;
				r1t:SetVertexColor(color.r, color.g, color.b);				
				radio1.texture = r1t;
			end			
			r1t:SetScale(0.2);
			r1t:SetPoint("CENTER", radio1, "CENTER", 0, 0);
			radio1text:SetPoint("BOTTOM", radio1, "TOP", 0, 5);
		
	--Melee
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Role_Melee", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(radio2, "ARTWORK", "GameFontRedSmall");		
			radio2:SetPoint("LEFT", radio1, "RIGHT", 18, 0);
			radio2:SetChecked(ConROCPaladinSpells.ConROC_SM_Role_Melee);
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Role_Tank:SetChecked(false);
					ConROC_SM_Role_Melee:SetChecked(true);
					ConROC_SM_Role_Healer:SetChecked(false);
					ConROC_SM_Role_PvP:SetChecked(false);
					ConROCPaladinSpells.ConROC_SM_Role_Tank = ConROC_SM_Role_Tank:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_Healer = ConROC_SM_Role_Healer:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile()
				end
			);
			radio2text:SetText("Melee");					
		local r2t = radio2.texture; 
			if not r2t then
				r2t = radio2:CreateTexture('Spellmenu_radio2_Texture', 'ARTWORK');
				r2t:SetTexture('Interface\\AddOns\\ConROC\\images\\bigskull');
				r2t:SetBlendMode('BLEND');
				radio2.texture = r2t;
			end			
			r2t:SetScale(0.2);
			r2t:SetPoint("CENTER", radio2, "CENTER", 0, 0);
			radio2text:SetPoint("BOTTOM", radio2, "TOP", 0, 5);
		
	--Healer
		local radio3 = CreateFrame("CheckButton", "ConROC_SM_Role_Healer", frame, "UIRadioButtonTemplate");
		local radio3text = frame:CreateFontString(radio3, "ARTWORK", "GameFontRedSmall");
			radio3:SetPoint("LEFT", radio2, "RIGHT", 18, 0);
			radio3:SetChecked(ConROCPaladinSpells.ConROC_SM_Role_Healer);
			radio3:SetScript("OnClick", 
			  function()
					ConROC_SM_Role_Melee:SetChecked(false);
					ConROC_SM_Role_Tank:SetChecked(false);
					ConROC_SM_Role_Healer:SetChecked(true);
					ConROC_SM_Role_PvP:SetChecked(false);
					ConROCPaladinSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_Tank = ConROC_SM_Role_Tank:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_Healer = ConROC_SM_Role_Healer:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile()
				end
			);
			radio3text:SetText("Heal");					
		local r3t = radio3.texture;

			if not r3t then
				r3t = radio3:CreateTexture('Spellmenu_radio3_Texture', 'ARTWORK');
				r3t:SetTexture('Interface\\AddOns\\ConROC\\images\\plus');
				r3t:SetBlendMode('BLEND');
				local color = ConROC.db.profile.raidbuffsOverlayColor;
				r3t:SetVertexColor(color.r, color.g, color.b);				
				radio3.texture = r3t;
			end			
			r3t:SetScale(0.2);
			r3t:SetPoint("CENTER", radio3, "CENTER", 0, 0);
			radio3text:SetPoint("BOTTOM", radio3, "TOP", 0, 5);

	--PvP
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Role_PvP", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(radio4, "ARTWORK", "GameFontRedSmall");
			radio4:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -15, -10);
			radio4:SetChecked(ConROCPaladinSpells.ConROC_SM_Role_PvP);
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Role_Melee:SetChecked(false);
					ConROC_SM_Role_Tank:SetChecked(false);
					ConROC_SM_Role_Healer:SetChecked(false);
					ConROC_SM_Role_PvP:SetChecked(true);
					ConROCPaladinSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_Tank = ConROC_SM_Role_Tank:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_Healer = ConROC_SM_Role_Healer:GetChecked();
					ConROCPaladinSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile()
				end
			);
			radio4text:SetText("PvP");					
		local r4t = radio4.texture;

			if not r4t then
				r4t = radio4:CreateTexture('Spellmenu_radio4_Texture', 'ARTWORK');
				r4t:SetTexture('Interface\\AddOns\\ConROC\\images\\lightning-interrupt');
				r4t:SetBlendMode('BLEND');				
				radio4.texture = r4t;
			end			
			r4t:SetScale(0.2);
			r4t:SetPoint("CENTER", radio4, "CENTER", 0, 0);
			radio4text:SetPoint("BOTTOM", radio4, "TOP", 0, 5);
			

		frame:Hide()
		lastFrame = frame;
	
	ConROC:RadioHeader1();
	ConROC:RadioHeader2();
	ConROC:RadioHeader3();
	ConROC:RadioHeader4();
	ConROC:CheckHeader1();
end

function ConROC:RadioHeader1()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioHeader1", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontAuras = frame:CreateFontString("ConROC_Spellmenu_RadioHeader1", "ARTWORK", "GameFontGreenSmall");
			fontAuras:SetText("Auras");
			fontAuras:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame1_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontAuras, "RIGHT", 0, 0)
				obutton:SetSize(12, 12)
				obutton:Hide()
				obutton:SetAlpha(1)
				
				obutton:SetText("v")
				obutton:SetNormalFontObject("GameFontHighlightSmall")

			local ohtex = obutton:CreateTexture()
				ohtex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				ohtex:SetTexCoord(0, 0.625, 0, 0.6875)
				ohtex:SetAllPoints()
				obutton:SetHighlightTexture(ohtex)

				obutton:SetScript("OnMouseUp", function (self, obutton, up)
					self:Hide();
					ConROCRadioFrame1:Show();
					ConROC_RadioFrame1_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_RadioFrame1_CloseButton', frame)
				tbutton:SetFrameStrata('MEDIUM')
				tbutton:SetFrameLevel('6')
				tbutton:SetPoint("LEFT", fontAuras, "RIGHT", 0, 0)
				tbutton:SetSize(12, 12)
				tbutton:Show()
				tbutton:SetAlpha(1)
				
				tbutton:SetText("^")
				tbutton:SetNormalFontObject("GameFontHighlightSmall")

			local htex = tbutton:CreateTexture()
				htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				htex:SetTexCoord(0, 0.625, 0, 0.6875)
				htex:SetAllPoints()
				tbutton:SetHighlightTexture(htex)
				
				tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
					self:Hide();
					ConROCRadioFrame1:Hide();
					ConROC_RadioFrame1_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:RadioFrame1();
end

function ConROC:RadioFrame1()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioFrame1", ConROCRadioHeader1)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 5)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCRadioHeader1", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastAura = frame;
		lastFrame = frame;
		
	--Devotion Aura
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Aura_Devotion", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(radio1, "ARTWORK", "GameFontHighlightSmall");
		local r1spellName, _, r1tspell = GetSpellInfo(ids.Prot_Ability.DevotionAuraRank1);
			radio1:SetPoint("TOP", ConROCRadioFrame1, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_Devotion);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_Devotion);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_Devotion);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_Devotion);	
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Aura_Devotion:SetChecked(true);
					ConROC_SM_Aura_Retribution:SetChecked(false);
					ConROC_SM_Aura_Concentration:SetChecked(false);
					ConROC_SM_Aura_Sanctity:SetChecked(false);
					ConROC_SM_Aura_ShadowResistance:SetChecked(false);
					ConROC_SM_Aura_FrostResistance:SetChecked(false);
					ConROC_SM_Aura_FireResistance:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					end
				end
			);
			radio1text:SetText(r1spellName);				
		local r1t = radio1.texture;
			if not r1t then
				r1t = radio1:CreateTexture('RadioFrame1_radio1_Texture', 'ARTWORK');
				r1t:SetTexture(r1tspell);
				r1t:SetBlendMode('BLEND');
				radio1.texture = r1t;
			end			
			r1t:SetScale(0.2);
			r1t:SetPoint("LEFT", radio1, "RIGHT", 8, 0);
			radio1text:SetPoint('LEFT', r1t, 'RIGHT', 5, 0);
		
		lastAura = radio1;
		lastFrame = radio1;
		
	--Retribution Aura
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Aura_Retribution", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(radio2, "ARTWORK", "GameFontHighlightSmall");		
		local r2spellName, _, r2tspell = GetSpellInfo(ids.Ret_Ability.RetributionAuraRank1);
			radio2:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_Retribution);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_Retribution);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_Retribution);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_Retribution);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Aura_Devotion:SetChecked(false);
					ConROC_SM_Aura_Retribution:SetChecked(true);
					ConROC_SM_Aura_Concentration:SetChecked(false);
					ConROC_SM_Aura_Sanctity:SetChecked(false);
					ConROC_SM_Aura_ShadowResistance:SetChecked(false);
					ConROC_SM_Aura_FrostResistance:SetChecked(false);
					ConROC_SM_Aura_FireResistance:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					end
				end
			);
			radio2text:SetText(r2spellName);					
		local r2t = radio2.texture; 
			if not r2t then
				r2t = radio2:CreateTexture('RadioFrame1_radio2_Texture', 'ARTWORK');
				r2t:SetTexture(r2tspell);
				r2t:SetBlendMode('BLEND');
				radio2.texture = r2t;
			end			
			r2t:SetScale(0.2);
			r2t:SetPoint("LEFT", radio2, "RIGHT", 8, 0);
			radio2text:SetPoint('LEFT', r2t, 'RIGHT', 5, 0);

		lastAura = radio2;
		lastFrame = radio2;
		
	--Concentration Aura
		local radio3 = CreateFrame("CheckButton", "ConROC_SM_Aura_Concentration", frame, "UIRadioButtonTemplate");
		local radio3text = frame:CreateFontString(radio3, "ARTWORK", "GameFontHighlightSmall");
		local r3spellName, _, r3tspell = GetSpellInfo(ids.Prot_Ability.ConcentrationAura);
			radio3:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_Concentration);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_Concentration);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_Concentration);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_Concentration);
			end
			radio3:SetScript("OnClick", 
			  function()
					ConROC_SM_Aura_Devotion:SetChecked(false);
					ConROC_SM_Aura_Retribution:SetChecked(false);
					ConROC_SM_Aura_Concentration:SetChecked(true);
					ConROC_SM_Aura_Sanctity:SetChecked(false);
					ConROC_SM_Aura_ShadowResistance:SetChecked(false);
					ConROC_SM_Aura_FrostResistance:SetChecked(false);
					ConROC_SM_Aura_FireResistance:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					end
				end
			);
			radio3text:SetText(r3spellName);					
		local r3t = radio3.texture;

			if not r3t then
				r3t = radio3:CreateTexture('RadioFrame1_radio3_Texture', 'ARTWORK');
				r3t:SetTexture(r3tspell);
				r3t:SetBlendMode('BLEND');
				radio3.texture = r3t;
			end			
			r3t:SetScale(0.2);
			r3t:SetPoint("LEFT", radio3, "RIGHT", 8, 0);
			radio3text:SetPoint('LEFT', r3t, 'RIGHT', 5, 0);

		lastAura = radio3;
		lastFrame = radio3;
		
	--Sanctity Aura
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Aura_Sanctity", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(radio4, "ARTWORK", "GameFontHighlightSmall");		
		local r4spellName, _, r4tspell = GetSpellInfo(ids.Ret_Ability.SanctityAura);
			radio4:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_Sanctity);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_Sanctity);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_Sanctity);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_Sanctity);
			end
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Aura_Devotion:SetChecked(false);
					ConROC_SM_Aura_Retribution:SetChecked(false);
					ConROC_SM_Aura_Concentration:SetChecked(false);
					ConROC_SM_Aura_Sanctity:SetChecked(true);
					ConROC_SM_Aura_ShadowResistance:SetChecked(false);
					ConROC_SM_Aura_FrostResistance:SetChecked(false);
					ConROC_SM_Aura_FireResistance:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					end
				end
			);
			radio4text:SetText(r4spellName);					
		local r4t = radio4.texture;
			if not r4t then
				r4t = radio4:CreateTexture('RadioFrame1_radio4_Texture', 'ARTWORK');
				r4t:SetTexture(r4tspell);
				r4t:SetBlendMode('BLEND');
				radio4.texture = r4t;
			end			
			r4t:SetScale(0.2);
			r4t:SetPoint("LEFT", radio4, "RIGHT", 8, 0);
			radio4text:SetPoint('LEFT', r4t, 'RIGHT', 5, 0);

		lastAura = radio4;		
		lastFrame = radio4;
		
	--Shadow Resistance Aura
		local radio5 = CreateFrame("CheckButton", "ConROC_SM_Aura_ShadowResistance", frame, "UIRadioButtonTemplate");
		local radio5text = frame:CreateFontString(radio5, "ARTWORK", "GameFontHighlightSmall");	
		local r5spellName, _, r5tspell = GetSpellInfo(ids.Prot_Ability.ShadowResistanceAuraRank1); 		
			radio5:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_ShadowResistance);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_ShadowResistance);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_ShadowResistance);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_ShadowResistance);	
			end
			radio5:SetScript("OnClick", 
			  function()
					ConROC_SM_Aura_Devotion:SetChecked(false);
					ConROC_SM_Aura_Retribution:SetChecked(false);
					ConROC_SM_Aura_Concentration:SetChecked(false);
					ConROC_SM_Aura_Sanctity:SetChecked(false);
					ConROC_SM_Aura_ShadowResistance:SetChecked(true);
					ConROC_SM_Aura_FrostResistance:SetChecked(false);
					ConROC_SM_Aura_FireResistance:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					end
				end
			);
			radio5text:SetText(r5spellName);					
		local r5t = radio5.texture;
			if not r5t then
				r5t = radio5:CreateTexture('RadioFrame1_radio5_Texture', 'ARTWORK');
				r5t:SetTexture(r5tspell);
				r5t:SetBlendMode('BLEND');
				radio5.texture = r5t;
			end			
			r5t:SetScale(0.2);
			r5t:SetPoint("LEFT", radio5, "RIGHT", 8, 0);
			radio5text:SetPoint('LEFT', r5t, 'RIGHT', 5, 0);

		lastAura = radio5;		
		lastFrame = radio5;			
		
	--Frost Resistance Aura
		local radio6 = CreateFrame("CheckButton", "ConROC_SM_Aura_FrostResistance", frame, "UIRadioButtonTemplate");
		local radio6text = frame:CreateFontString(radio6, "ARTWORK", "GameFontHighlightSmall");	
		local r6spellName, _, r6tspell = GetSpellInfo(ids.Prot_Ability.FrostResistanceAuraRank1); 		
			radio6:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_FrostResistance);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_FrostResistance);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_FrostResistance);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_FrostResistance);
			end
			radio6:SetScript("OnClick", 
			  function()
					ConROC_SM_Aura_Devotion:SetChecked(false);
					ConROC_SM_Aura_Retribution:SetChecked(false);
					ConROC_SM_Aura_Concentration:SetChecked(false);
					ConROC_SM_Aura_Sanctity:SetChecked(false);
					ConROC_SM_Aura_ShadowResistance:SetChecked(false);
					ConROC_SM_Aura_FrostResistance:SetChecked(true);
					ConROC_SM_Aura_FireResistance:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					end
				end
			);
			radio6text:SetText(r6spellName);					
		local r6t = radio6.texture;
			if not r6t then
				r6t = radio6:CreateTexture('RadioFrame1_radio6_Texture', 'ARTWORK');
				r6t:SetTexture(r6tspell);
				r6t:SetBlendMode('BLEND');
				radio6.texture = r6t;
			end			
			r6t:SetScale(0.2);
			r6t:SetPoint("LEFT", radio6, "RIGHT", 8, 0);
			radio6text:SetPoint('LEFT', r6t, 'RIGHT', 5, 0);

		lastAura = radio6;		
		lastFrame = radio6;		
		
	--Fire Resistance Aura
		local radio7 = CreateFrame("CheckButton", "ConROC_SM_Aura_FireResistance", frame, "UIRadioButtonTemplate");
		local radio7text = frame:CreateFontString(radio7, "ARTWORK", "GameFontHighlightSmall");	
		local r7spellName, _, r7tspell = GetSpellInfo(ids.Prot_Ability.FireResistanceAuraRank1); 		
			radio7:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio7:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_FireResistance);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio7:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_FireResistance);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio7:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_FireResistance);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio7:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_FireResistance);
			end
			radio7:SetScript("OnClick", 
			  function()
					ConROC_SM_Aura_Devotion:SetChecked(false);
					ConROC_SM_Aura_Retribution:SetChecked(false);
					ConROC_SM_Aura_Concentration:SetChecked(false);
					ConROC_SM_Aura_Sanctity:SetChecked(false);
					ConROC_SM_Aura_ShadowResistance:SetChecked(false);
					ConROC_SM_Aura_FrostResistance:SetChecked(false);
					ConROC_SM_Aura_FireResistance:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Aura_Devotion = ConROC_SM_Aura_Devotion:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Retribution = ConROC_SM_Aura_Retribution:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Concentration = ConROC_SM_Aura_Concentration:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_Sanctity = ConROC_SM_Aura_Sanctity:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_ShadowResistance = ConROC_SM_Aura_ShadowResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FrostResistance = ConROC_SM_Aura_FrostResistance:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Aura_FireResistance = ConROC_SM_Aura_FireResistance:GetChecked();
					end
				end
			);
			radio7text:SetText(r7spellName);					
		local r7t = radio7.texture;
			if not r7t then
				r7t = radio7:CreateTexture('RadioFrame1_radio7_Texture', 'ARTWORK');
				r7t:SetTexture(r7tspell);
				r7t:SetBlendMode('BLEND');
				radio7.texture = r7t;
			end			
			r7t:SetScale(0.2);
			r7t:SetPoint("LEFT", radio7, "RIGHT", 8, 0);
			radio7text:SetPoint('LEFT', r7t, 'RIGHT', 5, 0);

		lastAura = radio7;		
		lastFrame = radio7;
		
		frame:Show()
end

function ConROC:RadioHeader2()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioHeader2", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontAuras = frame:CreateFontString("ConROC_Spellmenu_RadioHeader2", "ARTWORK", "GameFontGreenSmall");
			fontAuras:SetText("Judgements");
			fontAuras:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame2_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontAuras, "RIGHT", 0, 0)
				obutton:SetSize(12, 12)
				obutton:Hide()
				obutton:SetAlpha(1)
				
				obutton:SetText("v")
				obutton:SetNormalFontObject("GameFontHighlightSmall")

			local ohtex = obutton:CreateTexture()
				ohtex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				ohtex:SetTexCoord(0, 0.625, 0, 0.6875)
				ohtex:SetAllPoints()
				obutton:SetHighlightTexture(ohtex)

				obutton:SetScript("OnMouseUp", function (self, obutton, up)
					self:Hide();
					ConROCRadioFrame2:Show();
					ConROC_RadioFrame2_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_RadioFrame2_CloseButton', frame)
				tbutton:SetFrameStrata('MEDIUM')
				tbutton:SetFrameLevel('6')
				tbutton:SetPoint("LEFT", fontAuras, "RIGHT", 0, 0)
				tbutton:SetSize(12, 12)
				tbutton:Show()
				tbutton:SetAlpha(1)
				
				tbutton:SetText("^")
				tbutton:SetNormalFontObject("GameFontHighlightSmall")

			local htex = tbutton:CreateTexture()
				htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				htex:SetTexCoord(0, 0.625, 0, 0.6875)
				htex:SetAllPoints()
				tbutton:SetHighlightTexture(htex)
				
				tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
					self:Hide();
					ConROCRadioFrame2:Hide();
					ConROC_RadioFrame2_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:RadioFrame2();
end

function ConROC:RadioFrame2()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioFrame2", ConROCRadioHeader2)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 5)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCRadioHeader2", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastAura = frame;
		lastFrame = frame;
		
	--Judgement of the Crusader
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Judgement_Crusader", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(radio1, "ARTWORK", "GameFontHighlightSmall");
		local r1spellName, _, r1tspell = GetSpellInfo(ids.Ret_Ability.SealoftheCrusaderRank1);
			radio1:SetPoint("TOP", ConROCRadioFrame2, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Tank_Judgement_Crusader);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Melee_Judgement_Crusader);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Healer_Judgement_Crusader);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_PvP_Judgement_Crusader);	
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Judgement_Crusader:SetChecked(true);
					ConROC_SM_Judgement_Justice:SetChecked(false);
					ConROC_SM_Judgement_Light:SetChecked(false);
					ConROC_SM_Judgement_Wisdom:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					end
				end
			);
			radio1text:SetText(r1spellName);				
		local r1t = radio1.texture;
			if not r1t then
				r1t = radio1:CreateTexture('RadioFrame2_radio1_Texture', 'ARTWORK');
				r1t:SetTexture(r1tspell);
				r1t:SetBlendMode('BLEND');
				radio1.texture = r1t;
			end			
			r1t:SetScale(0.2);
			r1t:SetPoint("LEFT", radio1, "RIGHT", 8, 0);
			radio1text:SetPoint('LEFT', r1t, 'RIGHT', 5, 0);
		
		lastAura = radio1;
		lastFrame = radio1;
		
	--Judgement of Justice
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Judgement_Justice", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(radio2, "ARTWORK", "GameFontHighlightSmall");		
		local r2spellName, _, r2tspell = GetSpellInfo(ids.Prot_Ability.SealofJustice);
			radio2:SetPoint("TOP", lastJudge, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Tank_Judgement_Justice);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Melee_Judgement_Justice);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Healer_Judgement_Justice);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_PvP_Judgement_Justice);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Judgement_Crusader:SetChecked(false);
					ConROC_SM_Judgement_Justice:SetChecked(true);
					ConROC_SM_Judgement_Light:SetChecked(false);
					ConROC_SM_Judgement_Wisdom:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					end
				end
			);
			radio2text:SetText(r2spellName);
		local r2t = radio2.texture; 
			if not r2t then
				r2t = radio2:CreateTexture('RadioFrame2_radio2_Texture', 'ARTWORK');
				r2t:SetTexture(r2tspell);
				r2t:SetBlendMode('BLEND');
				radio2.texture = r2t;
			end			
			r2t:SetScale(0.2);
			r2t:SetPoint("LEFT", radio2, "RIGHT", 8, 0);
			radio2text:SetPoint('LEFT', r2t, 'RIGHT', 5, 0);

		lastJudge = radio2;
		lastFrame = radio2;
		
	--Judgement of Light
		local radio3 = CreateFrame("CheckButton", "ConROC_SM_Judgement_Light", frame, "UIRadioButtonTemplate");
		local radio3text = frame:CreateFontString(radio3, "ARTWORK", "GameFontHighlightSmall");
		local r3spellName, _, r3tspell = GetSpellInfo(ids.Holy_Ability.SealofLightRank1);
			radio3:SetPoint("TOP", lastJudge, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Tank_Judgement_Light);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Melee_Judgement_Light);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Healer_Judgement_Light);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_PvP_Judgement_Light);
			end
			radio3:SetScript("OnClick", 
			  function()
					ConROC_SM_Judgement_Crusader:SetChecked(false);
					ConROC_SM_Judgement_Justice:SetChecked(false);
					ConROC_SM_Judgement_Light:SetChecked(true);
					ConROC_SM_Judgement_Wisdom:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					end
				end
			);
			radio3text:SetText(r3spellName);					
		local r3t = radio3.texture;

			if not r3t then
				r3t = radio3:CreateTexture('RadioFrame2_radio3_Texture', 'ARTWORK');
				r3t:SetTexture(r3tspell);
				r3t:SetBlendMode('BLEND');
				radio3.texture = r3t;
			end			
			r3t:SetScale(0.2);
			r3t:SetPoint("LEFT", radio3, "RIGHT", 8, 0);
			radio3text:SetPoint('LEFT', r3t, 'RIGHT', 5, 0);

		lastJudge = radio3;
		lastFrame = radio3;
		
	--Judgement of Wisdom
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Judgement_Wisdom", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(radio4, "ARTWORK", "GameFontHighlightSmall");		
		local r4spellName, _, r4tspell = GetSpellInfo(ids.Holy_Ability.SealofWisdomRank1);
			radio4:SetPoint("TOP", lastJudge, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Tank_Judgement_Wisdom);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Melee_Judgement_Wisdom);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Healer_Judgement_Wisdom);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_PvP_Judgement_Wisdom);	
			end
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Judgement_Crusader:SetChecked(false);
					ConROC_SM_Judgement_Justice:SetChecked(false);
					ConROC_SM_Judgement_Light:SetChecked(false);
					ConROC_SM_Judgement_Wisdom:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Judgement_Crusader = ConROC_SM_Judgement_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Justice = ConROC_SM_Judgement_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Light = ConROC_SM_Judgement_Light:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Judgement_Wisdom = ConROC_SM_Judgement_Wisdom:GetChecked();
					end
				end
			);
			radio4text:SetText(r4spellName);					
		local r4t = radio4.texture;
			if not r4t then
				r4t = radio4:CreateTexture('RadioFrame2_radio4_Texture', 'ARTWORK');
				r4t:SetTexture(r4tspell);
				r4t:SetBlendMode('BLEND');
				radio4.texture = r4t;
			end			
			r4t:SetScale(0.2);
			r4t:SetPoint("LEFT", radio4, "RIGHT", 8, 0);
			radio4text:SetPoint('LEFT', r4t, 'RIGHT', 5, 0);

		lastJudge = radio4;		
		lastFrame = radio4;
		
		frame:Show()
end

function ConROC:RadioHeader3()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioHeader3", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontAuras = frame:CreateFontString("ConROC_Spellmenu_RadioHeader3", "ARTWORK", "GameFontGreenSmall");
			fontAuras:SetText("Seals");
			fontAuras:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame3_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontAuras, "RIGHT", 0, 0)
				obutton:SetSize(12, 12)
				obutton:Hide()
				obutton:SetAlpha(1)
				
				obutton:SetText("v")
				obutton:SetNormalFontObject("GameFontHighlightSmall")

			local ohtex = obutton:CreateTexture()
				ohtex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				ohtex:SetTexCoord(0, 0.625, 0, 0.6875)
				ohtex:SetAllPoints()
				obutton:SetHighlightTexture(ohtex)

				obutton:SetScript("OnMouseUp", function (self, obutton, up)
					self:Hide();
					ConROCRadioFrame3:Show();
					ConROC_RadioFrame3_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_RadioFrame3_CloseButton', frame)
				tbutton:SetFrameStrata('MEDIUM')
				tbutton:SetFrameLevel('6')
				tbutton:SetPoint("LEFT", fontAuras, "RIGHT", 0, 0)
				tbutton:SetSize(12, 12)
				tbutton:Show()
				tbutton:SetAlpha(1)
				
				tbutton:SetText("^")
				tbutton:SetNormalFontObject("GameFontHighlightSmall")

			local htex = tbutton:CreateTexture()
				htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				htex:SetTexCoord(0, 0.625, 0, 0.6875)
				htex:SetAllPoints()
				tbutton:SetHighlightTexture(htex)
				
				tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
					self:Hide();
					ConROCRadioFrame3:Hide();
					ConROC_RadioFrame3_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:RadioFrame3();
end

function ConROC:RadioFrame3()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioFrame3", ConROCRadioHeader3)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 5)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCRadioHeader3", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastSeal = frame;
		lastFrame = frame;
		
	--Seal of Righteousness
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Seal_Righteousness", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(radio1, "ARTWORK", "GameFontHighlightSmall");
		local r1spellName, _, r1tspell = GetSpellInfo(ids.Holy_Ability.SealofRighteousnessRank1);
			radio1:SetPoint("TOP", ConROCRadioFrame3, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Righteousness);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Righteousness);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Righteousness);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Righteousness);
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Seal_Righteousness:SetChecked(true);
					ConROC_SM_Seal_Crusader:SetChecked(false);
					ConROC_SM_Seal_Command:SetChecked(false);
					ConROC_SM_Seal_Justice:SetChecked(false);
					ConROC_SM_Seal_Light:SetChecked(false);
					ConROC_SM_Seal_Wisdom:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					end
				end
			);
			radio1text:SetText(r1spellName);				
		local r1t = radio1.texture;
			if not r1t then
				r1t = radio1:CreateTexture('RadioFrame3_radio1_Texture', 'ARTWORK');
				r1t:SetTexture(r1tspell);
				r1t:SetBlendMode('BLEND');
				radio1.texture = r1t;
			end			
			r1t:SetScale(0.2);
			r1t:SetPoint("LEFT", radio1, "RIGHT", 8, 0);
			radio1text:SetPoint('LEFT', r1t, 'RIGHT', 5, 0);
		
		lastSeal = radio1;
		lastFrame = radio1;
		
	--Seal of the Crusader
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Seal_Crusader", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(radio2, "ARTWORK", "GameFontHighlightSmall");		
		local r2spellName, _, r2tspell = GetSpellInfo(ids.Ret_Ability.SealoftheCrusaderRank1);
			radio2:SetPoint("TOP", lastSeal, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Crusader);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Crusader);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Crusader);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Crusader);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Seal_Righteousness:SetChecked(false);
					ConROC_SM_Seal_Crusader:SetChecked(true);
					ConROC_SM_Seal_Command:SetChecked(false);
					ConROC_SM_Seal_Justice:SetChecked(false);
					ConROC_SM_Seal_Light:SetChecked(false);
					ConROC_SM_Seal_Wisdom:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					end
				end
			);
			radio2text:SetText(r2spellName);
		local r2t = radio2.texture; 
			if not r2t then
				r2t = radio2:CreateTexture('RadioFrame3_radio2_Texture', 'ARTWORK');
				r2t:SetTexture(r2tspell);
				r2t:SetBlendMode('BLEND');
				radio2.texture = r2t;
			end			
			r2t:SetScale(0.2);
			r2t:SetPoint("LEFT", radio2, "RIGHT", 8, 0);
			radio2text:SetPoint('LEFT', r2t, 'RIGHT', 5, 0);

		lastSeal = radio2;
		lastFrame = radio2;		

	--Seal of Command
		local radio3 = CreateFrame("CheckButton", "ConROC_SM_Seal_Command", frame, "UIRadioButtonTemplate");
		local radio3text = frame:CreateFontString(radio3, "ARTWORK", "GameFontHighlightSmall");		
		local r3spellName, _, r3tspell = GetSpellInfo(ids.Ret_Ability.SealofCommandRank1);
			radio3:SetPoint("TOP", lastSeal, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Command);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Command);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Command);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Command);
			end
			radio3:SetScript("OnClick", 
				function()
					ConROC_SM_Seal_Righteousness:SetChecked(false);
					ConROC_SM_Seal_Crusader:SetChecked(false);
					ConROC_SM_Seal_Command:SetChecked(true);
					ConROC_SM_Seal_Justice:SetChecked(false);
					ConROC_SM_Seal_Light:SetChecked(false);
					ConROC_SM_Seal_Wisdom:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					end
				end
			);
			radio3text:SetText(r3spellName);
		local r3t = radio3.texture; 
			if not r3t then
				r3t = radio3:CreateTexture('RadioFrame3_radio3_Texture', 'ARTWORK');
				r3t:SetTexture(r3tspell);
				r3t:SetBlendMode('BLEND');
				radio3.texture = r3t;
			end			
			r3t:SetScale(0.2);
			r3t:SetPoint("LEFT", radio3, "RIGHT", 8, 0);
			radio3text:SetPoint('LEFT', r3t, 'RIGHT', 5, 0);

		lastSeal = radio3;
		lastFrame = radio3;
		
	--Seal of Justice
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Seal_Justice", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(radio4, "ARTWORK", "GameFontHighlightSmall");		
		local r4spellName, _, r4tspell = GetSpellInfo(ids.Prot_Ability.SealofJustice);
			radio4:SetPoint("TOP", lastSeal, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Justice);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Justice);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Justice);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Justice);
			end
			radio4:SetScript("OnClick", 
				function()
					ConROC_SM_Seal_Righteousness:SetChecked(false);
					ConROC_SM_Seal_Crusader:SetChecked(false);
					ConROC_SM_Seal_Command:SetChecked(false);
					ConROC_SM_Seal_Justice:SetChecked(true);
					ConROC_SM_Seal_Light:SetChecked(false);
					ConROC_SM_Seal_Wisdom:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					end
				end
			);
			radio4text:SetText(r4spellName);
		local r4t = radio4.texture; 
			if not r4t then
				r4t = radio4:CreateTexture('RadioFrame3_radio4_Texture', 'ARTWORK');
				r4t:SetTexture(r4tspell);
				r4t:SetBlendMode('BLEND');
				radio4.texture = r4t;
			end			
			r4t:SetScale(0.2);
			r4t:SetPoint("LEFT", radio4, "RIGHT", 8, 0);
			radio4text:SetPoint('LEFT', r4t, 'RIGHT', 5, 0);

		lastSeal = radio4;
		lastFrame = radio4;
		
	--Seal of Light
		local radio5 = CreateFrame("CheckButton", "ConROC_SM_Seal_Light", frame, "UIRadioButtonTemplate");
		local radio5text = frame:CreateFontString(radio5, "ARTWORK", "GameFontHighlightSmall");
		local r5spellName, _, r5tspell = GetSpellInfo(ids.Holy_Ability.SealofLightRank1);
			radio5:SetPoint("TOP", lastSeal, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Light);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Light);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Light);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Light);
			end
			radio5:SetScript("OnClick", 
			  function()
					ConROC_SM_Seal_Righteousness:SetChecked(false);
					ConROC_SM_Seal_Crusader:SetChecked(false);
					ConROC_SM_Seal_Command:SetChecked(false);
					ConROC_SM_Seal_Justice:SetChecked(false);
					ConROC_SM_Seal_Light:SetChecked(true);
					ConROC_SM_Seal_Wisdom:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					end
				end
			);
			radio5text:SetText(r5spellName);					
		local r5t = radio5.texture;

			if not r5t then
				r5t = radio5:CreateTexture('RadioFrame3_radio5_Texture', 'ARTWORK');
				r5t:SetTexture(r5tspell);
				r5t:SetBlendMode('BLEND');
				radio5.texture = r5t;
			end			
			r5t:SetScale(0.2);
			r5t:SetPoint("LEFT", radio5, "RIGHT", 8, 0);
			radio5text:SetPoint('LEFT', r5t, 'RIGHT', 5, 0);

		lastSeal = radio5;
		lastFrame = radio5;
		
	--Seal of Wisdom
		local radio6 = CreateFrame("CheckButton", "ConROC_SM_Seal_Wisdom", frame, "UIRadioButtonTemplate");
		local radio6text = frame:CreateFontString(radio6, "ARTWORK", "GameFontHighlightSmall");		
		local r6spellName, _, r6tspell = GetSpellInfo(ids.Holy_Ability.SealofWisdomRank1);
			radio6:SetPoint("TOP", lastSeal, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Wisdom);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Wisdom);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Wisdom);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Wisdom);
			end
			radio6:SetScript("OnClick", 
			  function()
					ConROC_SM_Seal_Righteousness:SetChecked(false);
					ConROC_SM_Seal_Crusader:SetChecked(false);
					ConROC_SM_Seal_Command:SetChecked(false);
					ConROC_SM_Seal_Justice:SetChecked(false);
					ConROC_SM_Seal_Light:SetChecked(false);
					ConROC_SM_Seal_Wisdom:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Seal_Righteousness = ConROC_SM_Seal_Righteousness:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Crusader = ConROC_SM_Seal_Crusader:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Command = ConROC_SM_Seal_Command:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Justice = ConROC_SM_Seal_Justice:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Light = ConROC_SM_Seal_Light:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Seal_Wisdom = ConROC_SM_Seal_Wisdom:GetChecked();
					end
				end
			);
			radio6text:SetText(r6spellName);					
		local r6t = radio6.texture;
			if not r6t then
				r6t = radio6:CreateTexture('RadioFrame3_radio6_Texture', 'ARTWORK');
				r6t:SetTexture(r6tspell);
				r6t:SetBlendMode('BLEND');
				radio6.texture = r6t;
			end			
			r6t:SetScale(0.2);
			r6t:SetPoint("LEFT", radio6, "RIGHT", 8, 0);
			radio6text:SetPoint('LEFT', r6t, 'RIGHT', 5, 0);

		lastSeal = radio6;		
		lastFrame = radio6;
		
		frame:Show()
end

function ConROC:RadioHeader4()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioHeader4", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontAuras = frame:CreateFontString("ConROC_Spellmenu_RadioHeader4", "ARTWORK", "GameFontGreenSmall");
			fontAuras:SetText("Blessings");
			fontAuras:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame4_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontAuras, "RIGHT", 0, 0)
				obutton:SetSize(12, 12)
				obutton:Hide()
				obutton:SetAlpha(1)
				
				obutton:SetText("v")
				obutton:SetNormalFontObject("GameFontHighlightSmall")

			local ohtex = obutton:CreateTexture()
				ohtex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				ohtex:SetTexCoord(0, 0.625, 0, 0.6875)
				ohtex:SetAllPoints()
				obutton:SetHighlightTexture(ohtex)

				obutton:SetScript("OnMouseUp", function (self, obutton, up)
					self:Hide();
					ConROCRadioFrame4:Show();
					ConROC_RadioFrame4_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_RadioFrame4_CloseButton', frame)
				tbutton:SetFrameStrata('MEDIUM')
				tbutton:SetFrameLevel('6')
				tbutton:SetPoint("LEFT", fontAuras, "RIGHT", 0, 0)
				tbutton:SetSize(12, 12)
				tbutton:Show()
				tbutton:SetAlpha(1)
				
				tbutton:SetText("^")
				tbutton:SetNormalFontObject("GameFontHighlightSmall")

			local htex = tbutton:CreateTexture()
				htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				htex:SetTexCoord(0, 0.625, 0, 0.6875)
				htex:SetAllPoints()
				tbutton:SetHighlightTexture(htex)
				
				tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
					self:Hide();
					ConROCRadioFrame4:Hide();
					ConROC_RadioFrame4_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:RadioFrame4();
end

function ConROC:RadioFrame4()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioFrame4", ConROCRadioHeader4)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 5)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCRadioHeader4", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastBless = frame;
		lastFrame = frame;
		
	--Blessing of Might
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Bless_Might", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(radio1, "ARTWORK", "GameFontHighlightSmall");
		local r1spellName, _, r1tspell = GetSpellInfo(ids.Ret_Ability.BlessingofMightRank1);
			radio1:SetPoint("TOP", ConROCRadioFrame4, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Might);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Might);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Might);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Might);
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Bless_Might:SetChecked(true);
					ConROC_SM_Bless_Wisdom:SetChecked(false);
					ConROC_SM_Bless_Kings:SetChecked(false);
					ConROC_SM_Bless_Salvation:SetChecked(false);
					ConROC_SM_Bless_Sanctuary:SetChecked(false);
					ConROC_SM_Bless_Light:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					end
				end
			);
			radio1text:SetText(r1spellName);				
		local r1t = radio1.texture;
			if not r1t then
				r1t = radio1:CreateTexture('RadioFrame4_radio1_Texture', 'ARTWORK');
				r1t:SetTexture(r1tspell);
				r1t:SetBlendMode('BLEND');
				radio1.texture = r1t;
			end			
			r1t:SetScale(0.2);
			r1t:SetPoint("LEFT", radio1, "RIGHT", 8, 0);
			radio1text:SetPoint('LEFT', r1t, 'RIGHT', 5, 0);
		
		lastBless = radio1;
		lastFrame = radio1;
		
	--Blessing of Wisdom
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Bless_Wisdom", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(radio2, "ARTWORK", "GameFontHighlightSmall");		
		local r2spellName, _, r2tspell = GetSpellInfo(ids.Holy_Ability.BlessingofWisdomRank1);
			radio2:SetPoint("TOP", lastBless, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Wisdom);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Wisdom);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Wisdom);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Wisdom);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Bless_Might:SetChecked(false);
					ConROC_SM_Bless_Wisdom:SetChecked(true);
					ConROC_SM_Bless_Kings:SetChecked(false);
					ConROC_SM_Bless_Salvation:SetChecked(false);
					ConROC_SM_Bless_Sanctuary:SetChecked(false);
					ConROC_SM_Bless_Light:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					end
				end
			);
			radio2text:SetText(r2spellName);
		local r2t = radio2.texture; 
			if not r2t then
				r2t = radio2:CreateTexture('RadioFrame4_radio2_Texture', 'ARTWORK');
				r2t:SetTexture(r2tspell);
				r2t:SetBlendMode('BLEND');
				radio2.texture = r2t;
			end			
			r2t:SetScale(0.2);
			r2t:SetPoint("LEFT", radio2, "RIGHT", 8, 0);
			radio2text:SetPoint('LEFT', r2t, 'RIGHT', 5, 0);

		lastBless = radio2;
		lastFrame = radio2;		

	--Blessing of Kings
		local radio3 = CreateFrame("CheckButton", "ConROC_SM_Bless_Kings", frame, "UIRadioButtonTemplate");
		local radio3text = frame:CreateFontString(radio3, "ARTWORK", "GameFontHighlightSmall");		
		local r3spellName, _, r3tspell = GetSpellInfo(ids.Prot_Ability.BlessingofKings);
			radio3:SetPoint("TOP", lastBless, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Kings);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Kings);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Kings);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio3:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Kings);
			end
			radio3:SetScript("OnClick", 
				function()
					ConROC_SM_Bless_Might:SetChecked(false);
					ConROC_SM_Bless_Wisdom:SetChecked(false);
					ConROC_SM_Bless_Kings:SetChecked(true);
					ConROC_SM_Bless_Salvation:SetChecked(false);
					ConROC_SM_Bless_Sanctuary:SetChecked(false);
					ConROC_SM_Bless_Light:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					end
				end
			);
			radio3text:SetText(r3spellName);
		local r3t = radio3.texture; 
			if not r3t then
				r3t = radio3:CreateTexture('RadioFrame4_radio3_Texture', 'ARTWORK');
				r3t:SetTexture(r3tspell);
				r3t:SetBlendMode('BLEND');
				radio3.texture = r3t;
			end			
			r3t:SetScale(0.2);
			r3t:SetPoint("LEFT", radio3, "RIGHT", 8, 0);
			radio3text:SetPoint('LEFT', r3t, 'RIGHT', 5, 0);

		lastBless = radio3;
		lastFrame = radio3;
		
	--Blessing of Justice
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Bless_Salvation", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(radio4, "ARTWORK", "GameFontHighlightSmall");		
		local r4spellName, _, r4tspell = GetSpellInfo(ids.Prot_Ability.BlessingofSalvation);
			radio4:SetPoint("TOP", lastBless, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Salvation);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Salvation);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Salvation);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio4:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Salvation);
			end
			radio4:SetScript("OnClick", 
				function()
					ConROC_SM_Bless_Might:SetChecked(false);
					ConROC_SM_Bless_Wisdom:SetChecked(false);
					ConROC_SM_Bless_Kings:SetChecked(false);
					ConROC_SM_Bless_Salvation:SetChecked(true);
					ConROC_SM_Bless_Sanctuary:SetChecked(false);
					ConROC_SM_Bless_Light:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					end
				end
			);
			radio4text:SetText(r4spellName);
		local r4t = radio4.texture; 
			if not r4t then
				r4t = radio4:CreateTexture('RadioFrame4_radio4_Texture', 'ARTWORK');
				r4t:SetTexture(r4tspell);
				r4t:SetBlendMode('BLEND');
				radio4.texture = r4t;
			end			
			r4t:SetScale(0.2);
			r4t:SetPoint("LEFT", radio4, "RIGHT", 8, 0);
			radio4text:SetPoint('LEFT', r4t, 'RIGHT', 5, 0);

		lastBless = radio4;
		lastFrame = radio4;
		
	--Blessing of Sanctuary
		local radio5 = CreateFrame("CheckButton", "ConROC_SM_Bless_Sanctuary", frame, "UIRadioButtonTemplate");
		local radio5text = frame:CreateFontString(radio5, "ARTWORK", "GameFontHighlightSmall");
		local r5spellName, _, r5tspell = GetSpellInfo(ids.Prot_Ability.BlessingofSanctuaryRank1);
			radio5:SetPoint("TOP", lastBless, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Sanctuary);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Sanctuary);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Sanctuary);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio5:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Sanctuary);
			end
			radio5:SetScript("OnClick", 
			  function()
					ConROC_SM_Bless_Might:SetChecked(false);
					ConROC_SM_Bless_Wisdom:SetChecked(false);
					ConROC_SM_Bless_Kings:SetChecked(false);
					ConROC_SM_Bless_Salvation:SetChecked(false);
					ConROC_SM_Bless_Sanctuary:SetChecked(true);
					ConROC_SM_Bless_Light:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					end
				end
			);
			radio5text:SetText(r5spellName);					
		local r5t = radio5.texture;

			if not r5t then
				r5t = radio5:CreateTexture('RadioFrame4_radio5_Texture', 'ARTWORK');
				r5t:SetTexture(r5tspell);
				r5t:SetBlendMode('BLEND');
				radio5.texture = r5t;
			end			
			r5t:SetScale(0.2);
			r5t:SetPoint("LEFT", radio5, "RIGHT", 8, 0);
			radio5text:SetPoint('LEFT', r5t, 'RIGHT', 5, 0);

		lastBless = radio5;
		lastFrame = radio5;
		
	--Blessing of Light
		local radio6 = CreateFrame("CheckButton", "ConROC_SM_Bless_Light", frame, "UIRadioButtonTemplate");
		local radio6text = frame:CreateFontString(radio6, "ARTWORK", "GameFontHighlightSmall");		
		local r6spellName, _, r6tspell = GetSpellInfo(ids.Holy_Ability.BlessingofLightRank1);
			radio6:SetPoint("TOP", lastBless, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Light);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Light);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Light);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio6:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Light);
			end
			radio6:SetScript("OnClick", 
			  function()
					ConROC_SM_Bless_Might:SetChecked(false);
					ConROC_SM_Bless_Light:SetChecked(false);
					ConROC_SM_Bless_Kings:SetChecked(false);
					ConROC_SM_Bless_Salvation:SetChecked(false);
					ConROC_SM_Bless_Sanctuary:SetChecked(false);
					ConROC_SM_Bless_Light:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Tank_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Melee_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_Healer_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Bless_Might = ConROC_SM_Bless_Might:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Wisdom = ConROC_SM_Bless_Wisdom:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Kings = ConROC_SM_Bless_Kings:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Salvation = ConROC_SM_Bless_Salvation:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Sanctuary = ConROC_SM_Bless_Sanctuary:GetChecked();
						ConROCPaladinSpells.ConROC_PvP_Bless_Light = ConROC_SM_Bless_Light:GetChecked();
					end
				end
			);
			radio6text:SetText(r6spellName);					
		local r6t = radio6.texture;
			if not r6t then
				r6t = radio6:CreateTexture('RadioFrame4_radio6_Texture', 'ARTWORK');
				r6t:SetTexture(r6tspell);
				r6t:SetBlendMode('BLEND');
				radio6.texture = r6t;
			end			
			r6t:SetScale(0.2);
			r6t:SetPoint("LEFT", radio6, "RIGHT", 8, 0);
			radio6text:SetPoint('LEFT', r6t, 'RIGHT', 5, 0);

		lastBless = radio6;		
		lastFrame = radio6;
		
		frame:Show()
end

function ConROC:CheckHeader1()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckHeader1", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontAuras = frame:CreateFontString("ConROC_Spellmenu_CheckHeader1", "ARTWORK", "GameFontGreenSmall");
			fontAuras:SetText("Stuns");
			fontAuras:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_CheckFrame1_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontAuras, "RIGHT", 0, 0)
				obutton:SetSize(12, 12)
				obutton:Hide()
				obutton:SetAlpha(1)
				
				obutton:SetText("v")
				obutton:SetNormalFontObject("GameFontHighlightSmall")

			local ohtex = obutton:CreateTexture()
				ohtex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				ohtex:SetTexCoord(0, 0.625, 0, 0.6875)
				ohtex:SetAllPoints()
				obutton:SetHighlightTexture(ohtex)

				obutton:SetScript("OnMouseUp", function (self, obutton, up)
					self:Hide();
					ConROCCheckFrame1:Show();
					ConROC_CheckFrame1_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_CheckFrame1_CloseButton', frame)
				tbutton:SetFrameStrata('MEDIUM')
				tbutton:SetFrameLevel('6')
				tbutton:SetPoint("LEFT", fontAuras, "RIGHT", 0, 0)
				tbutton:SetSize(12, 12)
				tbutton:Show()
				tbutton:SetAlpha(1)
				
				tbutton:SetText("^")
				tbutton:SetNormalFontObject("GameFontHighlightSmall")

			local htex = tbutton:CreateTexture()
				htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				htex:SetTexCoord(0, 0.625, 0, 0.6875)
				htex:SetAllPoints()
				tbutton:SetHighlightTexture(htex)
				
				tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
					self:Hide();
					ConROCCheckFrame1:Hide();
					ConROC_CheckFrame1_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:CheckFrame1();
end

function ConROC:CheckFrame1()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckFrame1", ConROCCheckHeader1)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 5)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCCheckHeader1", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastStun = frame;
		lastFrame = frame;
		
	--Hammer of Justice
		local c1tspellName, _, c1tspell = GetSpellInfo(ids.Prot_Ability.HammerofJusticeRank1); 
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Stun_HammerofJustice", frame, "UICheckButtonTemplate");
		local check1text = frame:CreateFontString(check1, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check1:SetChecked(ConROCPaladinSpells.ConROC_Tank_Stun_HammerofJustice);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check1:SetChecked(ConROCPaladinSpells.ConROC_Melee_Stun_HammerofJustice);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				check1:SetChecked(ConROCPaladinSpells.ConROC_Healer_Stun_HammerofJustice);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCPaladinSpells.ConROC_PvP_Stun_HammerofJustice);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCPaladinSpells.ConROC_Tank_Stun_HammerofJustice = ConROC_SM_Stun_HammerofJustice:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCPaladinSpells.ConROC_Melee_Stun_HammerofJustice = ConROC_SM_Stun_HammerofJustice:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCPaladinSpells.ConROC_Healer_Stun_HammerofJustice = ConROC_SM_Stun_HammerofJustice:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCPaladinSpells.ConROC_PvP_Stun_HammerofJustice = ConROC_SM_Stun_HammerofJustice:GetChecked();
					end
				end);
			check1text:SetText(c1tspellName);				
		local c1t = check1.texture;
			if not c1t then
				c1t = check1:CreateTexture('CheckFrame1_check1_Texture', 'ARTWORK');
				c1t:SetTexture(c1tspell);
				c1t:SetBlendMode('BLEND');
				check1.texture = c1t;
			end			
			c1t:SetScale(0.4);
			c1t:SetPoint("LEFT", check1, "RIGHT", 8, 0);
			check1text:SetPoint('LEFT', c1t, 'RIGHT', 5, 0);
			
		lastStun = check1;
		lastFrame = check1;

		frame:Show()
end
		
function ConROC:SpellMenuUpdate()
	lastFrame = ConROCSpellmenuClass;
	
	if ConROCRadioHeader1 ~= nil then
		lastAura = ConROCRadioFrame1;
		
	--Auras
		if plvl >= 1 then 
			ConROC_SM_Aura_Devotion:Show();
			lastAura = ConROC_SM_Aura_Devotion;
		else
			ConROC_SM_Aura_Devotion:Hide();
		end

		if plvl >= 16 then 
			ConROC_SM_Aura_Retribution:Show(); 
			ConROC_SM_Aura_Retribution:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			lastAura = ConROC_SM_Aura_Retribution;
		else
			ConROC_SM_Aura_Retribution:Hide();
		end
		
		if plvl >= 22 and IsSpellKnown(ids.Prot_Ability.ConcentrationAura) then 
			ConROC_SM_Aura_Concentration:Show(); 
			ConROC_SM_Aura_Concentration:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			lastAura = ConROC_SM_Aura_Concentration;
		else
			ConROC_SM_Aura_Concentration:Hide();
		end		
		
		if ConROC:TalentChosen(ids.Spec.Retribution, ids.Ret_Talent.SanctityAura) then
			ConROC_SM_Aura_Sanctity:Show(); 
			ConROC_SM_Aura_Sanctity:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			lastAura = ConROC_SM_Aura_Sanctity;
		else
			ConROC_SM_Aura_Sanctity:Hide();
		end

		if plvl >= 28 then 
			ConROC_SM_Aura_ShadowResistance:Show(); 
			ConROC_SM_Aura_ShadowResistance:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			lastAura = ConROC_SM_Aura_ShadowResistance;
		else
			ConROC_SM_Aura_ShadowResistance:Hide();
		end

		if plvl >= 32 then 
			ConROC_SM_Aura_FrostResistance:Show(); 
			ConROC_SM_Aura_FrostResistance:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			lastAura = ConROC_SM_Aura_FrostResistance;
		else
			ConROC_SM_Aura_FrostResistance:Hide();
		end
		
		if plvl >= 36 then 
			ConROC_SM_Aura_FireResistance:Show(); 
			ConROC_SM_Aura_FireResistance:SetPoint("TOP", lastAura, "BOTTOM", 0, 0);
			lastAura = ConROC_SM_Aura_FireResistance;
		else
			ConROC_SM_Aura_FireResistance:Hide();
		end		
		
		if ConROCRadioFrame1:IsVisible() then
			lastFrame = lastAura;
		else
			lastFrame = ConROCRadioHeader1;
		end
	end

	if ConROCRadioHeader2 ~= nil then
		if lastFrame == lastAura then
			ConROCRadioHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCRadioHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end

		lastJudge = ConROCRadioFrame2;
		
	--Judgements
		if plvl >= 6 and IsSpellKnown(ids.Ret_Ability.SealoftheCrusaderRank1) then 
			ConROC_SM_Judgement_Crusader:Show();
			lastJudge = ConROC_SM_Judgement_Crusader;
		else
			ConROC_SM_Judgement_Crusader:Hide();
		end

		if plvl >= 22 and IsSpellKnown(ids.Prot_Ability.SealofJustice) then 
			ConROC_SM_Judgement_Justice:Show(); 
			ConROC_SM_Judgement_Justice:SetPoint("TOP", lastJudge, "BOTTOM", 0, 0);
			lastJudge = ConROC_SM_Judgement_Justice;
		else
			ConROC_SM_Judgement_Justice:Hide();
		end
		
		if plvl >= 30 and IsSpellKnown(ids.Holy_Ability.SealofLightRank1) then 
			ConROC_SM_Judgement_Light:Show(); 
			ConROC_SM_Judgement_Light:SetPoint("TOP", lastJudge, "BOTTOM", 0, 0);
			lastJudge = ConROC_SM_Judgement_Light;
		else
			ConROC_SM_Judgement_Light:Hide();
		end		
		
		if plvl >= 38 and IsSpellKnown(ids.Holy_Ability.SealofWisdomRank1) then
			ConROC_SM_Judgement_Wisdom:Show(); 
			ConROC_SM_Judgement_Wisdom:SetPoint("TOP", lastJudge, "BOTTOM", 0, 0);
			lastJudge = ConROC_SM_Judgement_Wisdom;
		else
			ConROC_SM_Judgement_Wisdom:Hide();
		end
		
		if ConROCRadioFrame2:IsVisible() then
			lastFrame = lastJudge;
		else
			lastFrame = ConROCRadioHeader2;
		end
	end
	
	if ConROCRadioHeader3 ~= nil then
		if lastFrame == lastJudge or lastFrame == lastAura then
			ConROCRadioHeader3:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCRadioHeader3:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end
	
		lastSeal = ConROCRadioFrame3;
		
	--Seals
		if plvl >= 1 then 
			ConROC_SM_Seal_Righteousness:Show();
			lastSeal = ConROC_SM_Seal_Righteousness;
		else
			ConROC_SM_Seal_Righteousness:Hide();
		end	
	
		if plvl >= 6 and IsSpellKnown(ids.Ret_Ability.SealoftheCrusaderRank1) then 
			ConROC_SM_Seal_Crusader:Show();
			ConROC_SM_Seal_Crusader:SetPoint("TOP", lastSeal, "BOTTOM", 0, 0);
			lastSeal = ConROC_SM_Seal_Crusader;
		else
			ConROC_SM_Seal_Crusader:Hide();
		end
		
		if plvl >= 20 and IsSpellKnown(ids.Ret_Ability.SealofCommandRank1) then 
			ConROC_SM_Seal_Command:Show();
			ConROC_SM_Seal_Command:SetPoint("TOP", lastSeal, "BOTTOM", 0, 0);
			lastSeal = ConROC_SM_Seal_Command;
		else
			ConROC_SM_Seal_Command:Hide();
		end		

		if plvl >= 22 and IsSpellKnown(ids.Prot_Ability.SealofJustice) then 
			ConROC_SM_Seal_Justice:Show(); 
			ConROC_SM_Seal_Justice:SetPoint("TOP", lastSeal, "BOTTOM", 0, 0);
			lastSeal = ConROC_SM_Seal_Justice;
		else
			ConROC_SM_Seal_Justice:Hide();
		end
		
		if plvl >= 30 and IsSpellKnown(ids.Holy_Ability.SealofLightRank1) then 
			ConROC_SM_Seal_Light:Show(); 
			ConROC_SM_Seal_Light:SetPoint("TOP", lastSeal, "BOTTOM", 0, 0);
			lastSeal = ConROC_SM_Seal_Light;
		else
			ConROC_SM_Seal_Light:Hide();
		end		
		
		if plvl >= 38 and IsSpellKnown(ids.Holy_Ability.SealofWisdomRank1) then
			ConROC_SM_Seal_Wisdom:Show(); 
			ConROC_SM_Seal_Wisdom:SetPoint("TOP", lastSeal, "BOTTOM", 0, 0);
			lastSeal = ConROC_SM_Seal_Wisdom;
		else
			ConROC_SM_Seal_Wisdom:Hide();
		end
		
		if ConROCRadioFrame3:IsVisible() then
			lastFrame = lastSeal;
		else
			lastFrame = ConROCRadioHeader3;
		end
	end
	
	if ConROCRadioHeader4 ~= nil then
		if lastFrame == lastSeal or lastFrame == lastJudge or lastFrame == lastAura then
			ConROCRadioHeader4:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCRadioHeader4:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end
	
		lastBless = ConROCRadioFrame4;
		
	--Blessings
		if plvl >= 4 and IsSpellKnown(ids.Ret_Ability.BlessingofMightRank1) then 
			ConROC_SM_Bless_Might:Show();
			lastBless = ConROC_SM_Bless_Might;
		else
			ConROC_SM_Bless_Might:Hide();
		end	
	
		if plvl >= 14 and IsSpellKnown(ids.Holy_Ability.BlessingofWisdomRank1) then 
			ConROC_SM_Bless_Wisdom:Show();
			ConROC_SM_Bless_Wisdom:SetPoint("TOP", lastBless, "BOTTOM", 0, 0);
			lastBless = ConROC_SM_Bless_Wisdom;
		else
			ConROC_SM_Bless_Wisdom:Hide();
		end
		
		if plvl >= 20 and IsSpellKnown(ids.Prot_Ability.BlessingofKings) then 
			ConROC_SM_Bless_Kings:Show();
			ConROC_SM_Bless_Kings:SetPoint("TOP", lastBless, "BOTTOM", 0, 0);
			lastBless = ConROC_SM_Bless_Kings;
		else
			ConROC_SM_Bless_Kings:Hide();
		end		

		if plvl >= 26 and IsSpellKnown(ids.Prot_Ability.BlessingofSalvation) then 
			ConROC_SM_Bless_Salvation:Show(); 
			ConROC_SM_Bless_Salvation:SetPoint("TOP", lastBless, "BOTTOM", 0, 0);
			lastBless = ConROC_SM_Bless_Salvation;
		else
			ConROC_SM_Bless_Salvation:Hide();
		end
		
		if plvl >= 30 and IsSpellKnown(ids.Prot_Ability.BlessingofSanctuaryRank1) then 
			ConROC_SM_Bless_Sanctuary:Show(); 
			ConROC_SM_Bless_Sanctuary:SetPoint("TOP", lastBless, "BOTTOM", 0, 0);
			lastBless = ConROC_SM_Bless_Sanctuary;
		else
			ConROC_SM_Bless_Sanctuary:Hide();
		end		
		
		if plvl >= 40 and IsSpellKnown(ids.Holy_Ability.BlessingofLightRank1) then
			ConROC_SM_Bless_Light:Show(); 
			ConROC_SM_Bless_Light:SetPoint("TOP", lastBless, "BOTTOM", 0, 0);
			lastBless = ConROC_SM_Bless_Light;
		else
			ConROC_SM_Bless_Light:Hide();
		end
		
		if ConROCRadioFrame4:IsVisible() then
			lastFrame = lastBless;
		else
			lastFrame = ConROCRadioHeader4;
		end
	end
	
	if ConROCCheckFrame1 ~= nil then
		if lastFrame == lastBless or lastFrame == lastSeal or lastFrame == lastJudge or lastFrame == lastAura then
			ConROCCheckHeader1:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader1:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastStun = ConROCCheckFrame1;
		
	--Stuns
		if plvl >= 8 then 
			ConROC_SM_Stun_HammerofJustice:Show();
			lastStun = ConROC_SM_Stun_HammerofJustice;
		else
			ConROC_SM_Stun_HammerofJustice:Hide();
		end	

		if ConROCCheckFrame1:IsVisible() then
			lastFrame = lastStun;
		else
			lastFrame = ConROCCheckHeader1;
		end		
	end
end

function ConROC:RoleProfile()
	if ConROC:CheckBox(ConROC_SM_Role_Tank) then
		ConROC_SM_Aura_Devotion:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_Devotion);
		ConROC_SM_Aura_Retribution:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_Retribution);
		ConROC_SM_Aura_Concentration:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_Concentration);
		ConROC_SM_Aura_Sanctity:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_Sanctity);
		ConROC_SM_Aura_ShadowResistance:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_ShadowResistance);
		ConROC_SM_Aura_FrostResistance:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_FrostResistance);
		ConROC_SM_Aura_FireResistance:SetChecked(ConROCPaladinSpells.ConROC_Tank_Aura_FireResistance);
		
		ConROC_SM_Judgement_Crusader:SetChecked(ConROCPaladinSpells.ConROC_Tank_Judgement_Crusader);
		ConROC_SM_Judgement_Justice:SetChecked(ConROCPaladinSpells.ConROC_Tank_Judgement_Justice);
		ConROC_SM_Judgement_Light:SetChecked(ConROCPaladinSpells.ConROC_Tank_Judgement_Light);
		ConROC_SM_Judgement_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_Tank_Judgement_Wisdom);
						
		ConROC_SM_Seal_Righteousness:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Righteousness);
		ConROC_SM_Seal_Crusader:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Crusader);
		ConROC_SM_Seal_Command:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Command);
		ConROC_SM_Seal_Justice:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Justice);
		ConROC_SM_Seal_Light:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Light);
		ConROC_SM_Seal_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_Tank_Seal_Wisdom);
						
		ConROC_SM_Bless_Might:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Might);
		ConROC_SM_Bless_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Wisdom);
		ConROC_SM_Bless_Kings:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Kings);
		ConROC_SM_Bless_Salvation:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Salvation);
		ConROC_SM_Bless_Sanctuary:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Sanctuary);
		ConROC_SM_Bless_Light:SetChecked(ConROCPaladinSpells.ConROC_Tank_Bless_Light);
						
		ConROC_SM_Stun_HammerofJustice:SetChecked(ConROCPaladinSpells.ConROC_Tank_Stun_HammerofJustice);

	elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
		ConROC_SM_Aura_Devotion:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_Devotion);
		ConROC_SM_Aura_Retribution:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_Retribution);
		ConROC_SM_Aura_Concentration:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_Concentration);
		ConROC_SM_Aura_Sanctity:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_Sanctity);
		ConROC_SM_Aura_ShadowResistance:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_ShadowResistance);
		ConROC_SM_Aura_FrostResistance:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_FrostResistance);
		ConROC_SM_Aura_FireResistance:SetChecked(ConROCPaladinSpells.ConROC_Melee_Aura_FireResistance);
		
		ConROC_SM_Judgement_Crusader:SetChecked(ConROCPaladinSpells.ConROC_Melee_Judgement_Crusader);
		ConROC_SM_Judgement_Justice:SetChecked(ConROCPaladinSpells.ConROC_Melee_Judgement_Justice);
		ConROC_SM_Judgement_Light:SetChecked(ConROCPaladinSpells.ConROC_Melee_Judgement_Light);
		ConROC_SM_Judgement_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_Melee_Judgement_Wisdom);
		
		ConROC_SM_Seal_Righteousness:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Righteousness);
		ConROC_SM_Seal_Crusader:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Crusader);
		ConROC_SM_Seal_Command:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Command);
		ConROC_SM_Seal_Justice:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Justice);
		ConROC_SM_Seal_Light:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Light);
		ConROC_SM_Seal_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_Melee_Seal_Wisdom);
		
		ConROC_SM_Bless_Might:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Might);
		ConROC_SM_Bless_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Wisdom);
		ConROC_SM_Bless_Kings:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Kings);
		ConROC_SM_Bless_Salvation:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Salvation);
		ConROC_SM_Bless_Sanctuary:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Sanctuary);
		ConROC_SM_Bless_Light:SetChecked(ConROCPaladinSpells.ConROC_Melee_Bless_Light);
		
		ConROC_SM_Stun_HammerofJustice:SetChecked(ConROCPaladinSpells.ConROC_Melee_Stun_HammerofJustice);
		
	elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
		ConROC_SM_Aura_Devotion:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_Devotion);
		ConROC_SM_Aura_Retribution:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_Retribution);
		ConROC_SM_Aura_Concentration:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_Concentration);
		ConROC_SM_Aura_Sanctity:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_Sanctity);
		ConROC_SM_Aura_ShadowResistance:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_ShadowResistance);
		ConROC_SM_Aura_FrostResistance:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_FrostResistance);
		ConROC_SM_Aura_FireResistance:SetChecked(ConROCPaladinSpells.ConROC_Healer_Aura_FireResistance);
		
		ConROC_SM_Judgement_Crusader:SetChecked(ConROCPaladinSpells.ConROC_Healer_Judgement_Crusader);
		ConROC_SM_Judgement_Justice:SetChecked(ConROCPaladinSpells.ConROC_Healer_Judgement_Justice);
		ConROC_SM_Judgement_Light:SetChecked(ConROCPaladinSpells.ConROC_Healer_Judgement_Light);
		ConROC_SM_Judgement_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_Healer_Judgement_Wisdom);
		
		ConROC_SM_Seal_Righteousness:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Righteousness);
		ConROC_SM_Seal_Crusader:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Crusader);
		ConROC_SM_Seal_Command:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Command);
		ConROC_SM_Seal_Justice:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Justice);
		ConROC_SM_Seal_Light:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Light);
		ConROC_SM_Seal_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_Healer_Seal_Wisdom);
		
		ConROC_SM_Bless_Might:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Might);
		ConROC_SM_Bless_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Wisdom);
		ConROC_SM_Bless_Kings:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Kings);
		ConROC_SM_Bless_Salvation:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Salvation);
		ConROC_SM_Bless_Sanctuary:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Sanctuary);
		ConROC_SM_Bless_Light:SetChecked(ConROCPaladinSpells.ConROC_Healer_Bless_Light);
		
		ConROC_SM_Stun_HammerofJustice:SetChecked(ConROCPaladinSpells.ConROC_Healer_Stun_HammerofJustice);
		
	elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
		ConROC_SM_Aura_Devotion:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_Devotion);
		ConROC_SM_Aura_Retribution:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_Retribution);
		ConROC_SM_Aura_Concentration:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_Concentration);
		ConROC_SM_Aura_Sanctity:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_Sanctity);
		ConROC_SM_Aura_ShadowResistance:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_ShadowResistance);
		ConROC_SM_Aura_FrostResistance:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_FrostResistance);
		ConROC_SM_Aura_FireResistance:SetChecked(ConROCPaladinSpells.ConROC_PvP_Aura_FireResistance);
		
		ConROC_SM_Judgement_Crusader:SetChecked(ConROCPaladinSpells.ConROC_PvP_Judgement_Crusader);
		ConROC_SM_Judgement_Justice:SetChecked(ConROCPaladinSpells.ConROC_PvP_Judgement_Justice);
		ConROC_SM_Judgement_Light:SetChecked(ConROCPaladinSpells.ConROC_PvP_Judgement_Light);
		ConROC_SM_Judgement_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_PvP_Judgement_Wisdom);
		
		ConROC_SM_Seal_Righteousness:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Righteousness);
		ConROC_SM_Seal_Crusader:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Crusader);
		ConROC_SM_Seal_Command:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Command);
		ConROC_SM_Seal_Justice:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Justice);
		ConROC_SM_Seal_Light:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Light);
		ConROC_SM_Seal_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_PvP_Seal_Wisdom);
		
		ConROC_SM_Bless_Might:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Might);
		ConROC_SM_Bless_Wisdom:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Wisdom);
		ConROC_SM_Bless_Kings:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Kings);
		ConROC_SM_Bless_Salvation:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Salvation);
		ConROC_SM_Bless_Sanctuary:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Sanctuary);
		ConROC_SM_Bless_Light:SetChecked(ConROCPaladinSpells.ConROC_PvP_Bless_Light);
		
		ConROC_SM_Stun_HammerofJustice:SetChecked(ConROCPaladinSpells.ConROC_PvP_Stun_HammerofJustice);
		
	end
end

ConROC.Paladin = {};

function ConROC:EnableRotationModule()
	self.Description = "Paladin";
	self.NextSpell = ConROC.Paladin.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;

	ConROC:SpellmenuClass();
--	ConROCSpellmenuFrame:Hide();
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Paladin.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

local Racial, Spec, Holy_Ability, Holy_Talent, Prot_Ability, Prot_Talent, Ret_Ability, Ret_Talent, Player_Buff, Player_Debuff, Target_Debuff = ids.Racial, ids.Spec, ids.Holy_Ability, ids.Holy_Talent, ids.Prot_Ability, ids.Prot_Talent, ids.Ret_Ability, ids.Ret_Talent, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff;
		
function ConROC.Paladin.Damage(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);

--Ranks
	--Holy
	local _BlessingofLight = Holy_Ability.BlessingofLightRank1;
	local _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank1;
	local _Consecration = Holy_Ability.ConsecrationRank1;
	local _Exorcism = Holy_Ability.ExorcismRank1;
	local _FlashofLight = Holy_Ability.FlashofLightRank1;
	local _HammerofWrath = Holy_Ability.HammerofWrathRank1;
	local _HolyLight = Holy_Ability.HolyLightRank1;
	local _HolyShock = Holy_Ability.HolyShockRank1;	
	local _HolyWrath = Holy_Ability.HolyWrathRank1;
	local _LayonHands = Holy_Ability.LayonHandsRank1;
	local _Redemption = Holy_Ability.RedemptionRank1;
	local _SealofLight = Holy_Ability.SealofLightRank1;	
		local _JudgementofLight = Target_Debuff.JudgementofLightRank1;
	local _SealofRighteousness = Holy_Ability.SealofRighteousnessRank0;
	local _SealofWisdom = Holy_Ability.SealofWisdomRank1;
		local _JudgementofWisdom = Target_Debuff.JudgementofWisdomRank1;
	local _TurnUndead = Holy_Ability.TurnUndeadRank1;

	if IsSpellKnown(Holy_Ability.BlessingofLightRank3) then _BlessingofLight = Holy_Ability.BlessingofLightRank3;	
	elseif IsSpellKnown(Holy_Ability.BlessingofLightRank2) then _BlessingofLight = Holy_Ability.BlessingofLightRank2; end
	
	if IsSpellKnown(Holy_Ability.BlessingofWisdomRank5) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank5;
	elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank4) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank4;
	elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank3) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank3;	
	elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank2) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank2; end
	
	if IsSpellKnown(Holy_Ability.ConsecrationRank5) then _Consecration = Holy_Ability.ConsecrationRank5;
	elseif IsSpellKnown(Holy_Ability.ConsecrationRank4) then _Consecration = Holy_Ability.ConsecrationRank4;
	elseif IsSpellKnown(Holy_Ability.ConsecrationRank3) then _Consecration = Holy_Ability.ConsecrationRank3;	
	elseif IsSpellKnown(Holy_Ability.ConsecrationRank2) then _Consecration = Holy_Ability.ConsecrationRank2; end
	
	if IsSpellKnown(Holy_Ability.ExorcismRank6) then _Exorcism = Holy_Ability.ExorcismRank6;
	elseif IsSpellKnown(Holy_Ability.ExorcismRank5) then _Exorcism = Holy_Ability.ExorcismRank5;
	elseif IsSpellKnown(Holy_Ability.ExorcismRank4) then _Exorcism = Holy_Ability.ExorcismRank4;
	elseif IsSpellKnown(Holy_Ability.ExorcismRank3) then _Exorcism = Holy_Ability.ExorcismRank3;
	elseif IsSpellKnown(Holy_Ability.ExorcismRank2) then _Exorcism = Holy_Ability.ExorcismRank2; end
	
	if IsSpellKnown(Holy_Ability.FlashofLightRank6) then _FlashofLight = Holy_Ability.FlashofLightRank6;
	elseif IsSpellKnown(Holy_Ability.FlashofLightRank5) then _FlashofLight = Holy_Ability.FlashofLightRank5;
	elseif IsSpellKnown(Holy_Ability.FlashofLightRank4) then _FlashofLight = Holy_Ability.FlashofLightRank4;
	elseif IsSpellKnown(Holy_Ability.FlashofLightRank3) then _FlashofLight = Holy_Ability.FlashofLightRank3;
	elseif IsSpellKnown(Holy_Ability.FlashofLightRank2) then _FlashofLight = Holy_Ability.FlashofLightRank2; end	

	if IsSpellKnown(Holy_Ability.HammerofWrathRank3) then _HammerofWrath = Holy_Ability.HammerofWrathRank3;
	elseif IsSpellKnown(Holy_Ability.HammerofWrathRank2) then _HammerofWrath = Holy_Ability.HammerofWrathRank2; end

	if IsSpellKnown(Holy_Ability.HolyLightRank8) then _HolyLight = Holy_Ability.HolyLightRank8;
	elseif IsSpellKnown(Holy_Ability.HolyLightRank7) then _HolyLight = Holy_Ability.HolyLightRank7;
	elseif IsSpellKnown(Holy_Ability.HolyLightRank6) then _HolyLight = Holy_Ability.HolyLightRank6;
	elseif IsSpellKnown(Holy_Ability.HolyLightRank5) then _HolyLight = Holy_Ability.HolyLightRank5;
	elseif IsSpellKnown(Holy_Ability.HolyLightRank4) then _HolyLight = Holy_Ability.HolyLightRank4;
	elseif IsSpellKnown(Holy_Ability.HolyLightRank3) then _HolyLight = Holy_Ability.HolyLightRank3;
	elseif IsSpellKnown(Holy_Ability.HolyLightRank2) then _HolyLight = Holy_Ability.HolyLightRank2; end

	if IsSpellKnown(Holy_Ability.HolyShockRank3) then _HolyShock = Holy_Ability.HolyShockRank3;	
	elseif IsSpellKnown(Holy_Ability.HolyShockRank2) then _HolyShock = Holy_Ability.HolyShockRank2; end	

	if IsSpellKnown(Holy_Ability.HolyWrathRank2) then _HolyWrath = Holy_Ability.HolyWrathRank2; end

	if IsSpellKnown(Holy_Ability.SealofLightRank4) then _SealofLight = Holy_Ability.SealofLightRank4; _JudgementofLight = Target_Debuff.JudgementofLightRank4;
	elseif IsSpellKnown(Holy_Ability.SealofLightRank3) then _SealofLight = Holy_Ability.SealofLightRank3; _JudgementofLight = Target_Debuff.JudgementofLightRank3;
	elseif IsSpellKnown(Holy_Ability.SealofLightRank2) then _SealofLight = Holy_Ability.SealofLightRank2; _JudgementofLight = Target_Debuff.JudgementofLightRank2; end

	if IsSpellKnown(Holy_Ability.SealofRighteousnessRank8) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank8;
	elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank7) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank7;
	elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank6) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank6;
	elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank5) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank5;
	elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank4) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank4;
	elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank3) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank3;
	elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank2) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank2;
	elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank1) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank1; end

	if IsSpellKnown(Holy_Ability.SealofWisdomRank3) then _SealofWisdom = Holy_Ability.SealofWisdomRank3; _JudgementofWisdom = Target_Debuff.JudgementofWisdomRank3;
	elseif IsSpellKnown(Holy_Ability.SealofWisdomRank2) then _SealofWisdom = Holy_Ability.SealofWisdomRank2; _JudgementofWisdom = Target_Debuff.JudgementofWisdomRank2; end

	--Protection
	local _BlessingofProtection = Prot_Ability.BlessingofProtectionRank1;
	local _BlessingofSacrifice = Prot_Ability.BlessingofSacrificeRank1;
	local _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank1;
	local _DivineProtection = Prot_Ability.DivineProtectionRank1;	
	local _DivineShield = Prot_Ability.DivineShieldRank1;
	local _HammerofJustice = Prot_Ability.HammerofJusticeRank1;
	local _HolyShield = Prot_Ability.HolyShieldRank1;

	if IsSpellKnown(Prot_Ability.BlessingofProtectionRank3) then _BlessingofProtection = Prot_Ability.BlessingofProtectionRank3;	
	elseif IsSpellKnown(Prot_Ability.BlessingofProtectionRank2) then _BlessingofProtection = Prot_Ability.BlessingofProtectionRank2; end

	if IsSpellKnown(Prot_Ability.BlessingofSacrificeRank2) then _BlessingofSacrifice = Prot_Ability.BlessingofSacrificeRank2; end
	
	if IsSpellKnown(Prot_Ability.BlessingofSanctuaryRank4) then _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank4;
	elseif IsSpellKnown(Prot_Ability.BlessingofSanctuaryRank3) then _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank3;	
	elseif IsSpellKnown(Prot_Ability.BlessingofSanctuaryRank2) then _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank2; end

	if IsSpellKnown(Prot_Ability.DivineProtectionRank2) then _DivineProtection = Prot_Ability.DivineProtectionRank2; end

	if IsSpellKnown(Prot_Ability.DivineShieldRank2) then _DivineShield = Prot_Ability.DivineShieldRank2; end
	
	if IsSpellKnown(Prot_Ability.HammerofJusticeRank4) then _HammerofJustice = Prot_Ability.HammerofJusticeRank4;
	elseif IsSpellKnown(Prot_Ability.HammerofJusticeRank3) then _HammerofJustice = Prot_Ability.HammerofJusticeRank3;
	elseif IsSpellKnown(Prot_Ability.HammerofJusticeRank2) then _HammerofJustice = Prot_Ability.HammerofJusticeRank2; end

	if IsSpellKnown(Prot_Ability.HolyShieldRank3) then _HolyShield = Prot_Ability.HolyShieldRank3;	
	elseif IsSpellKnown(Prot_Ability.HolyShieldRank2) then _HolyShield = Prot_Ability.HolyShieldRank2; end
	
	--Retribution
	local _BlessingofMight = Ret_Ability.BlessingofMightRank1;
	local _SealofCommand = Ret_Ability.SealofCommandRank1;	
	local _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank1;
		local _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank1;	

	if IsSpellKnown(Ret_Ability.BlessingofMightRank6) then _BlessingofMight = Ret_Ability.BlessingofMightRank6;
	elseif IsSpellKnown(Ret_Ability.BlessingofMightRank5) then _BlessingofMight = Ret_Ability.BlessingofMightRank5;
	elseif IsSpellKnown(Ret_Ability.BlessingofMightRank4) then _BlessingofMight = Ret_Ability.BlessingofMightRank4;
	elseif IsSpellKnown(Ret_Ability.BlessingofMightRank3) then _BlessingofMight = Ret_Ability.BlessingofMightRank3;	
	elseif IsSpellKnown(Ret_Ability.BlessingofMightRank2) then _BlessingofMight = Ret_Ability.BlessingofMightRank2; end
	
	if IsSpellKnown(Ret_Ability.SealofCommandRank5) then _SealofCommand = Ret_Ability.SealofCommandRank5;
	elseif IsSpellKnown(Ret_Ability.SealofCommandRank4) then _SealofCommand = Ret_Ability.SealofCommandRank4;
	elseif IsSpellKnown(Ret_Ability.SealofCommandRank3) then _SealofCommand = Ret_Ability.SealofCommandRank3;	
	elseif IsSpellKnown(Ret_Ability.SealofCommandRank2) then _SealofCommand = Ret_Ability.SealofCommandRank2; end
	
	if IsSpellKnown(Ret_Ability.SealoftheCrusaderRank6) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank6; _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank6;
	elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank5) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank5; _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank5;
	elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank4) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank4; _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank4;
	elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank3) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank3; _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank3;	
	elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank2) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank2; _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank2; end
		
--Abilities	
	local boMight											= ConROC:AbilityReady(_BlessingofMight, timeShift);
		local bomBuff											= ConROC:Buff(_BlessingofMight, timeShift);	
	local boWisdom											= ConROC:AbilityReady(_BlessingofWisdom, timeShift);
		local bowBuff											= ConROC:Buff(_BlessingofWisdom, timeShift);	
	local boKings											= ConROC:AbilityReady(Prot_Ability.BlessingofKings, timeShift);
		local bokBuff											= ConROC:Buff(Prot_Ability.BlessingofKings, timeShift);	
	local boSalv											= ConROC:AbilityReady(Prot_Ability.BlessingofSalvation, timeShift);
		local bosBuff											= ConROC:Buff(Prot_Ability.BlessingofSalvation, timeShift);	
	local boSanc											= ConROC:AbilityReady(_BlessingofSanctuary, timeShift);
		local bosaBuff											= ConROC:Buff(_BlessingofSanctuary, timeShift);	
	local boLight											= ConROC:AbilityReady(_BlessingofLight, timeShift);
		local bolBuff											= ConROC:Buff(_BlessingofLight, timeShift);			
	local judgement, judgeCD, judgeMCD						= ConROC:AbilityReady(Ret_Ability.Judgement, timeShift);	
	local soCrusader										= ConROC:AbilityReady(_SealoftheCrusader, timeShift);
		local socBuff											= ConROC:Buff(_SealoftheCrusader, timeShift);
	local soJustice											= ConROC:AbilityReady(Prot_Ability.SealofJustice, timeShift);
		local sojBuff											= ConROC:Buff(Prot_Ability.SealofJustice, timeShift);
	local soLight											= ConROC:AbilityReady(_SealofLight, timeShift);
		local solBuff											= ConROC:Buff(_SealofLight, timeShift);
	local soWisdom											= ConROC:AbilityReady(_SealofWisdom, timeShift);
		local sowBuff											= ConROC:Buff(_SealofWisdom, timeShift);
	local soRighteousness									= ConROC:AbilityReady(_SealofRighteousness, timeShift);
		local sorBuff											= ConROC:Buff(_SealofRighteousness, timeShift);	
	local soCommand											= ConROC:AbilityReady(_SealofCommand, timeShift);
		local socomBuff											= ConROC:Buff(_SealofCommand, timeShift);
	local exorcism											= ConROC:AbilityReady(_Exorcism, timeShift);
	local hoJustice											= ConROC:AbilityReady(_HammerofJustice, timeShift);
		local hojDebuff											= ConROC:TargetDebuff(_HammerofJustice, timeShift);
	
    local judgeDebuff = {
		joc													= ConROC:TargetDebuff(_JudgementoftheCrusader, timeShift);
        joj													= ConROC:TargetDebuff(Target_Debuff.JudgementofJustice, timeShift);
		jol													= ConROC:TargetDebuff(_JudgementofLight, timeShift);
        jow													= ConROC:TargetDebuff(_JudgementofWisdom, timeShift);
    }	

	local judgeUp = false;
		for k, v in pairs(judgeDebuff) do
			if v then
				judgeUp = true;
				break
			end
		end
		
--Conditions	
	local isEnemy 											= ConROC:TarHostile();
	local Close 											= CheckInteractDistance("target", 3);
	
--Indicators	
	ConROC:AbilityRaidBuffs(_BlessingofMight, ConROC:CheckBox(ConROC_SM_Bless_Might) and boMight and not bomBuff);	
	ConROC:AbilityRaidBuffs(_BlessingofWisdom, ConROC:CheckBox(ConROC_SM_Bless_Wisdom) and boWisdom and not bowBuff);	
	ConROC:AbilityRaidBuffs(Prot_Ability.BlessingofKings, ConROC:CheckBox(ConROC_SM_Bless_Kings) and boKings and not bokBuff);	
	ConROC:AbilityRaidBuffs(Prot_Ability.BlessingofSalvation, ConROC:CheckBox(ConROC_SM_Bless_Salvation) and boSalv and not bosBuff);	
	ConROC:AbilityRaidBuffs(_BlessingofSanctuary, ConROC:CheckBox(ConROC_SM_Bless_Sanctuary) and boSanc and not bosaBuff);	
	ConROC:AbilityRaidBuffs(_BlessingofLight, ConROC:CheckBox(ConROC_SM_Bless_Light) and boLight and not bolBuff);
	
--Warnings
	
--Rotations
	if (ConROC:CheckBox(ConROC_SM_Role_Healer) and ConROC:TarHostile()) or not ConROC:CheckBox(ConROC_SM_Role_Healer) then
		if ConROC:CheckBox(ConROC_SM_Judgement_Crusader) and soCrusader and not socBuff and not judgeDebuff.joc and (judgeCD >= judgeMCD - 1) then
			return _SealoftheCrusader;
		end
		
		if ConROC:CheckBox(ConROC_SM_Judgement_Justice) and soJustice and not sojBuff and not judgeDebuff.joj and (judgeCD >= judgeMCD - 1) then
			return Prot_Ability.SealofJustice;
		end
		
		if ConROC:CheckBox(ConROC_SM_Judgement_Light) and soLight and not solBuff and not judgeDebuff.jol and (judgeCD >= judgeMCD - 1) then
			return _SealofLight;
		end	
		
		if ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) and soWisdom and not sowBuff and not judgeDebuff.jow and (judgeCD >= judgeMCD - 1) then
			return _SealofWisdom;
		end	
		
		if judgement and not judgeUp then
			return Ret_Ability.Judgement;
		end	

		if ConROC:CheckBox(ConROC_SM_Seal_Righteousness) and soRighteousness and not sorBuff then
			return _SealofRighteousness;
		end
		
		if ConROC:CheckBox(ConROC_SM_Seal_Crusader) and soCrusader and not socBuff then
			return _SealoftheCrusader;
		end

		if ConROC:CheckBox(ConROC_SM_Seal_Command) and soCommand and not socomBuff then
			return _SealofCommand;
		end	
			
		if ConROC:CheckBox(ConROC_SM_Seal_Justice) and soJustice and not sojBuff then
			return Prot_Ability.SealofJustice;
		end
		
		if ConROC:CheckBox(ConROC_SM_Seal_Light) and soLight and not solBuff then
			return _SealofLight;
		end	
		
		if ConROC:CheckBox(ConROC_SM_Seal_Wisdom) and soWisdom and not sowBuff then
			return _SealofWisdom;
		end	
		
		if ConROC:CheckBox(ConROC_SM_Stun_HammerofJustice) and hoJustice and judgement then
			return _HammerofJustice;
		end

		if judgement and (socomBuff or sorBuff) then
			return Ret_Ability.Judgement;
		end
		
		if exorcism and (ConROC:CreatureType("Undead") or ConROC:CreatureType("Demon")) then
			return _Exorcism;
		end
	end
	return nil;
end

function ConROC.Paladin.Defense(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);

--Ranks
	--Holy
	
	--Protection
	local _DevotionAura = Prot_Ability.DevotionAuraRank1;
	local _FireResistanceAura = Prot_Ability.FireResistanceAuraRank1;
	local _FrostResistanceAura = Prot_Ability.FrostResistanceAuraRank1;	
	local _ShadowResistanceAura = Prot_Ability.ShadowResistanceAuraRank1;

	if IsSpellKnown(Prot_Ability.DevotionAuraRank7) then _DevotionAura = Prot_Ability.DevotionAuraRank7;
	elseif IsSpellKnown(Prot_Ability.DevotionAuraRank6) then _DevotionAura = Prot_Ability.DevotionAuraRank6;
	elseif IsSpellKnown(Prot_Ability.DevotionAuraRank5) then _DevotionAura = Prot_Ability.DevotionAuraRank5;
	elseif IsSpellKnown(Prot_Ability.DevotionAuraRank4) then _DevotionAura = Prot_Ability.DevotionAuraRank4;
	elseif IsSpellKnown(Prot_Ability.DevotionAuraRank3) then _DevotionAura = Prot_Ability.DevotionAuraRank3;	
	elseif IsSpellKnown(Prot_Ability.DevotionAuraRank2) then _DevotionAura = Prot_Ability.DevotionAuraRank2; end

	if IsSpellKnown(Prot_Ability.FireResistanceAuraRank3) then _FireResistanceAura = Prot_Ability.FireResistanceAuraRank3;	
	elseif IsSpellKnown(Prot_Ability.FireResistanceAuraRank2) then _FireResistanceAura = Prot_Ability.FireResistanceAuraRank2; end

	if IsSpellKnown(Prot_Ability.FrostResistanceAuraRank3) then _FrostResistanceAura = Prot_Ability.FrostResistanceAuraRank3;	
	elseif IsSpellKnown(Prot_Ability.FrostResistanceAuraRank2) then _FrostResistanceAura = Prot_Ability.FrostResistanceAuraRank2; end

	if IsSpellKnown(Prot_Ability.ShadowResistanceAuraRank3) then _ShadowResistanceAura = Prot_Ability.ShadowResistanceAuraRank3;	
	elseif IsSpellKnown(Prot_Ability.ShadowResistanceAuraRank2) then _ShadowResistanceAura = Prot_Ability.ShadowResistanceAuraRank2; end	
	
	--Retribution
	local _RetributionAura = Ret_Ability.RetributionAuraRank1;	

	if IsSpellKnown(Ret_Ability.RetributionAuraRank5) then _RetributionAura = Ret_Ability.RetributionAuraRank5;
	elseif IsSpellKnown(Ret_Ability.RetributionAuraRank4) then _RetributionAura = Ret_Ability.RetributionAuraRank4;
	elseif IsSpellKnown(Ret_Ability.RetributionAuraRank3) then _RetributionAura = Ret_Ability.RetributionAuraRank3;	
	elseif IsSpellKnown(Ret_Ability.RetributionAuraRank2) then _RetributionAura = Ret_Ability.RetributionAuraRank2; end	
	
--Abilities	
	local dAura												= ConROC:AbilityReady(_DevotionAura, timeShift);
		local daBuff											= ConROC:Form(_DevotionAura);
	local rAura												= ConROC:AbilityReady(_RetributionAura, timeShift);
		local raBuff											= ConROC:Form(_RetributionAura);
	local cAura												= ConROC:AbilityReady(Prot_Ability.ConcentrationAura, timeShift);
		local caBuff											= ConROC:Form(Prot_Ability.ConcentrationAura);
	local sAura												= ConROC:AbilityReady(Ret_Ability.SanctityAura, timeShift);
		local saBuff											= ConROC:Form(Ret_Ability.SanctityAura);
	local fRAura											= ConROC:AbilityReady(_FireResistanceAura, timeShift);
		local fRBuff											= ConROC:Form(_FireResistanceAura);
	local frRAura											= ConROC:AbilityReady(_FrostResistanceAura, timeShift);
		local frRBuff											= ConROC:Form(_FrostResistanceAura);
	local shaAura											= ConROC:AbilityReady(_ShadowResistanceAura, timeShift);
		local shaBuff											= ConROC:Form(_ShadowResistanceAura);
		
--Conditions
	local playerPh 											= ConROC:PercentHealth('player');

--Rotations
	if dAura and not daBuff and ConROC:CheckBox(ConROC_SM_Aura_Devotion) then
		return _DevotionAura;
	end
	
	if rAura and not raBuff and ConROC:CheckBox(ConROC_SM_Aura_Retribution) then
		return _RetributionAura;
	end
	
	if cAura and not caBuff and ConROC:CheckBox(ConROC_SM_Aura_Concentration) then
		return Prot_Ability.ConcentrationAura;
	end

	if sAura and not saBuff and ConROC:CheckBox(ConROC_SM_Aura_Sanctity) then
		return Ret_Ability.SanctityAura;
	end
	
	if fRAura and not fRBuff and ConROC:CheckBox(ConROC_SM_Aura_FireResistance) then
		return _FireResistanceAura;
	end
	
	if frRAura and not frRBuff and ConROC:CheckBox(ConROC_SM_Aura_FrostResistance) then
		return _FrostResistanceAura;
	end
	
	if shaAura and not shaBuff and ConROC:CheckBox(ConROC_SM_Aura_ShadowResistance) then
		return _ShadowResistanceAura;
	end
	
	return nil;
end
