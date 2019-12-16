if select(2, UnitClass("player")) ~= "ROGUE" then return end
local ConROC_Rogue, ids = ...;

--General
	ids.Racial = {
		Berserking = 20554,
		Shadowmeld = 20580,
	}
	ids.Spec = {
		Assassination = 1,
		Combat = 2,
		Subtlety = 3,
	}	
--Assassination
	ids.Ass_Ability = {
		AmbushRank1 = 8676,
		AmbushRank2 = 8724,
		AmbushRank3 = 8725,
		AmbushRank4 = 11267,
		AmbushRank5 = 11268,
		AmbushRank6 = 11269,
		CheapShot = 1833,
		ColdBlood = 213981,
		EviscerateRank1 = 2098,
		EviscerateRank2 = 6760,
		EviscerateRank3 = 6761,
		EviscerateRank4 = 6762,
		EviscerateRank5 = 8623,
		EviscerateRank6 = 8624,
		EviscerateRank7 = 11299,
		EviscerateRank8 = 11300,
		ExposeArmorRank1 = 8647,
		ExposeArmorRank2 = 8649,
		ExposeArmorRank3 = 8650,
		ExposeArmorRank4 = 11197,
		ExposeArmorRank5 = 11198,
		GarroteRank1 = 703,
		GarroteRank2 = 8631,
		GarroteRank3 = 8632,
		GarroteRank4 = 8633,
		GarroteRank5 = 11289,
		GarroteRank6 = 11290,
		KidneyShotRank1 = 408,
		KidneyShotRank2 = 8643,
		RuptureRank1 = 1943,
		RuptureRank2 = 8639,
		RuptureRank3 = 8640,
		RuptureRank4 = 11273,
		RuptureRank5 = 11274,
		RuptureRank6 = 11275,
		SliceandDiceRank1 = 5171,
		SliceandDiceRank2 = 6774,
	}
	ids.Ass_Talent = {
		ImprovedEviscerate = 1,
		RemorselessAttacks = 2,
		Malice = 3,
		 
		Ruthlessness = 4,
		Murder = 5,
		ImprovedSliceandDice = 6,
		 
		RelentlessStrikes = 7,
		ImprovedExposeArmor = 8,
		Lethality = 9,
		 
		VilePoisons = 10,
		ImprovedPoisons = 11,
		 
		ColdBlood = 12,
		ImprovedKidneyShot = 13,
		 
		SealFate = 14,
		 
		Vigor = 15,
	}
--Combat
	ids.Com_Ability = {
		AdrenalineRush = 13750,
		BackstabRank1 = 53,
		BackstabRank2 = 2589,
		BackstabRank3 = 2590,
		BackstabRank4 = 2591,
		BackstabRank5 = 8721,
		BackstabRank6 = 11279,
		BackstabRank7 = 11280,
		BackstabRank8 = 11281,
		BladeFlurry = 13877,
		Evasion = 5277,
		FeintRank1 = 1966,
		FeintRank2 = 6768,
		FeintRank3 = 8637,
		FeintRank4 = 11303,
		GougeRank1 = 1776,
		GougeRank2 = 1777,
		GougeRank3 = 8629,
		GougeRank4 = 11285,
		GougeRank5 = 11286,
		KickRank1 = 1766,
		KickRank2 = 1767,
		KickRank3 = 1768,
		KickRank4 = 1769,
		Riposte = 14251,
		SinisterStrikeRank1 = 1752,
		SinisterStrikeRank2 = 1757,
		SinisterStrikeRank3 = 1758,
		SinisterStrikeRank4 = 1759,
		SinisterStrikeRank5 = 1760,
		SinisterStrikeRank6 = 8621,
		SinisterStrikeRank7 = 11293,
		SinisterStrikeRank8 = 11294,
		SprintRank1 = 2983,
		SprintRank2 = 8696,
		SprintRank3 = 11305,
	}
	ids.Com_Talent = {
		ImprovedGouge = 1,
		ImprovedSinisterStrike = 2,
		LightningReflexes = 3,
		 
		ImprovedBackstab = 4,
		Deflection = 5,
		Precision = 6,
		 
		Endurance = 7,
		Riposte = 8,
		ImprovedSprint = 9,
		 
		ImprovedKick = 10,
		DaggerSpecialization = 11,
		DualWieldSpecialization = 12,
		 
		MaceSpecialization = 13,
		BladeFlurry = 14,
		SwordSpecialization = 15,
		FistWeaponSpecialization = 16,
		 
		WeaponExpertise = 17,
		Aggression = 18,
		 
		AdrenalineRush = 19,
	}
--Subtlety
	ids.Sub_Ability = {
		Blind = 2094,
		DetectTraps = 2836,
		DisarmTrap = 1842,
		Distract = 1725,
		GhostlyStrike = 14278,
		HemorrhageRank1 = 16511,
		HemorrhageRank2 = 17347,
		HemorrhageRank3 = 17348,
		PickPocket = 921,
		Premeditation = 14183,
		Preparation = 14185,
		SapRank1 = 6770,
		SapRank2 = 2070,
		SapRank3 = 11297,
		StealthRank1 = 1784,
		StealthRank2 = 1785,
		StealthRank3 = 1786,
		StealthRank4 = 1787,
		VanishRank1 = 1856,
		VanishRank2 = 1857,
	}
	ids.Sub_Talent = {
		MasterofDeception = 1,
		Opportunity = 2,
		 
		SleightofHand = 3,
		Elusiveness = 4,
		Camouflage = 5,
		 
		Initiative = 6,
		GhostlyStrike = 7,
		ImprovedAmbush = 8,
		 
		Setup = 9,
		ImprovedSap = 10,
		SerratedBlades = 11,
		 
		HeightenedSenses = 12,
		Preparation = 13,
		DirtyDeeds = 14,
		Hemorrhage = 15,
		 
		Deadliness = 16,
		  
		Premeditation = 17,
	}
--Poisons
	ids.Poisons = {
		BlindingPowder = 5530,
		CripplingPoisonRank1 = 3420,
		CripplingPoisonRank2 = 3421,
		CripplingPoison = 3775,
		CripplingPoisonII = 3776,		
		DeadlyPoisonRank1 = 2835,
		DeadlyPoisonRank2 = 2837,
		DeadlyPoisonRank3 = 11357,
		DeadlyPoisonRank4 = 11358,
		DeadlyPoisonRank5 = 25347,
		DeadlyPoison = 2892,
		DeadlyPoisonII = 2893,
		DeadlyPoisonIII = 8984,
		DeadlyPoisonIV = 8985,
		DeadlyPoisonV = 20844,
		InstantPoisonRank1 = 8681,
		InstantPoisonRank2 = 8687,
		InstantPoisonRank3 = 8691,
		InstantPoisonRank4 = 11341,
		InstantPoisonRank5 = 11342,
		InstantPoisonRank6 = 11343,
		InstantPoison = 6947,
		InstantPoisonII = 6949,
		InstantPoisonIII = 6950,
		InstantPoisonIV = 8926,
		InstantPoisonV = 8927,
		InstantPoisonVI = 8928,		
		MindnumbingPoisonRank1 = 5763,
		MindnumbingPoisonRank2 = 8694,
		MindnumbingPoisonRank3 = 11400,
		MindnumbingPoison = 5237,
		MindnumbingPoisonII = 6951,
		MindnumbingPoisonIII = 9186,		
		WoundPoisonRank1 = 13220,
		WoundPoisonRank2 = 13228,
		WoundPoisonRank3 = 13229,
		WoundPoisonRank4 = 13230,
		WoundPoison = 10918,
		WoundPoisonII = 10920,
		WoundPoisonIII = 10921,
		WoundPoisonIV = 10922,	
	}
-- Auras
	ids.Player_Buff = {
	
	}
	ids.Player_Debuff = {

	}
	ids.Target_Debuff = {
	
	}

local lastFrame = 0;
local lastPoison = 0;
local lastDebuff = 0;
local lastStun = 0;

local plvl = UnitLevel('player');

local defaults = {
	["ConROC_SM_Role_Melee"] = true,

	["ConROC_Melee_PoisonMH_None"] = true,
	["ConROC_Melee_PoisonOH_None"] = true,
	["ConROC_Melee_Debuff_SliceandDice"] = true,	
	["ConROC_Melee_Debuff_Garrote"] = true,
	["ConROC_Melee_Debuff_Hemorrhage"] = true,
}

ConROCRogueSpells = ConROCRogueSpells or defaults;

function ConROC:SpellmenuClass()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCSpellmenuClass", ConROCSpellmenuFrame2)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 30)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCSpellmenuFrame_Title", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)
		
	--Melee
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Role_Melee", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(nil, "ARTWORK", "GameFontRedSmall");
			radio1:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -10);
			radio1:SetChecked(ConROCRogueSpells.ConROC_SM_Role_Melee);
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Role_Melee:SetChecked(true);
					ConROC_SM_Role_PvP:SetChecked(false);
					ConROCRogueSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCRogueSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile()
				end
			);
			radio1text:SetText("Melee");
		local r1t = radio1.texture;
			if not r1t then
				r1t = radio1:CreateTexture('Spellmenu_radio1_Texture', 'ARTWORK');
				r1t:SetTexture('Interface\\AddOns\\ConROC\\images\\bigskull');
				r1t:SetBlendMode('BLEND');
				local color = ConROC.db.profile.damageOverlayColor;
				r1t:SetVertexColor(color.r, color.g, color.b);				
				radio1.texture = r1t;
			end			
			r1t:SetScale(0.2);
			r1t:SetPoint("CENTER", radio1, "CENTER", 0, 0);
			radio1text:SetPoint("BOTTOM", radio1, "TOP", 0, 5);
		
	--PvP
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Role_PvP", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(nil, "ARTWORK", "GameFontRedSmall");
			radio4:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -15, -10);
			radio4:SetChecked(ConROCRogueSpells.ConROC_SM_Role_PvP);
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Role_Melee:SetChecked(false);
					ConROC_SM_Role_PvP:SetChecked(true);
					ConROCRogueSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCRogueSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
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
	ConROC:CheckHeader1();
	ConROC:CheckHeader2();
end

function ConROC:RadioHeader1()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioHeader1", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 1)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontTitle = frame:CreateFontString("ConROC_Spellmenu_RadioHeader1", "ARTWORK", "GameFontGreenSmall");
			fontTitle:SetText("Poisons MH");
			fontTitle:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame1_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontTitle, "RIGHT", 0, 0)
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
				tbutton:SetPoint("LEFT", fontTitle, "RIGHT", 0, 0)
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
		
		frame:SetPoint("TOP", "ConROCRadioHeader1", "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastPoison = frame;
		lastFrame = frame;
		
	--Instant Poison
		local r1tspellName, _, r1tspell = GetSpellInfo(ids.Poisons.InstantPoisonRank1);
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_PoisonMH_Instant", frame, "UIRadioButtonTemplate");
		local radio1text = radio1:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio1:SetPoint("TOP", ConROCRadioFrame1, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio1:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_Instant);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_Instant);	
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_PoisonMH_Instant:SetChecked(true);
					ConROC_SM_PoisonMH_Crippling:SetChecked(false);
					ConROC_SM_PoisonMH_Mindnumbing:SetChecked(false);
					ConROC_SM_PoisonMH_Deadly:SetChecked(false);
					ConROC_SM_PoisonMH_Wound:SetChecked(false);
					ConROC_SM_PoisonMH_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					end
				end
			);
			radio1text:SetText(r1tspellName);
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
		
		lastPoison = radio1;
		lastFrame = radio1;
		
	--Crippling Poison
		local r2tspellName, _, r2tspell = GetSpellInfo(ids.Poisons.CripplingPoisonRank1);
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_PoisonMH_Crippling", frame, "UIRadioButtonTemplate");
		local radio2text = radio2:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			radio2:SetPoint("TOP", lastPoison, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio2:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_Crippling);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_Crippling);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_PoisonMH_Instant:SetChecked(false);
					ConROC_SM_PoisonMH_Crippling:SetChecked(true);
					ConROC_SM_PoisonMH_Mindnumbing:SetChecked(false);
					ConROC_SM_PoisonMH_Deadly:SetChecked(false);
					ConROC_SM_PoisonMH_Wound:SetChecked(false);
					ConROC_SM_PoisonMH_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					end
				end
			);
			radio2text:SetText(r2tspellName);					
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

		lastPoison = radio2;
		lastFrame = radio2;
		
	--Mindnumbing Poison
		local r3tspellName, _, r3tspell = GetSpellInfo(ids.Poisons.MindnumbingPoisonRank1);
		local radio3 = CreateFrame("CheckButton", "ConROC_SM_PoisonMH_Mindnumbing", frame, "UIRadioButtonTemplate");
		local radio3text = radio3:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio3:SetPoint("TOP", lastPoison, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio3:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_Mindnumbing);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio3:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_Mindnumbing);
			end
			radio3:SetScript("OnClick", 
			  function()
					ConROC_SM_PoisonMH_Instant:SetChecked(false);
					ConROC_SM_PoisonMH_Crippling:SetChecked(false);
					ConROC_SM_PoisonMH_Mindnumbing:SetChecked(true);
					ConROC_SM_PoisonMH_Deadly:SetChecked(false);
					ConROC_SM_PoisonMH_Wound:SetChecked(false);
					ConROC_SM_PoisonMH_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					end
				end
			);
			radio3text:SetText(r3tspellName);					
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

		lastPoison = radio3;
		lastFrame = radio3;
		
	--Deadly Poison
		local r4tspellName, _, r4tspell = GetSpellInfo(ids.Poisons.DeadlyPoisonRank1);	
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_PoisonMH_Deadly", frame, "UIRadioButtonTemplate");
		local radio4text = radio4:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");	
			radio4:SetPoint("TOP", lastPoison, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio4:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_Deadly);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio4:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_Deadly);
			end
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_PoisonMH_Instant:SetChecked(false);
					ConROC_SM_PoisonMH_Crippling:SetChecked(false);
					ConROC_SM_PoisonMH_Mindnumbing:SetChecked(false);
					ConROC_SM_PoisonMH_Deadly:SetChecked(true);
					ConROC_SM_PoisonMH_Wound:SetChecked(false);
					ConROC_SM_PoisonMH_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					end
				end
			);
			radio4text:SetText(r4tspellName);
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

		lastPoison = radio4;		
		lastFrame = radio4;

	--Wound Poison
		local r5tspellName, _, r5tspell = GetSpellInfo(ids.Poisons.WoundPoisonRank1);	
		local radio5 = CreateFrame("CheckButton", "ConROC_SM_PoisonMH_Wound", frame, "UIRadioButtonTemplate");
		local radio5text = radio5:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio5:SetPoint("TOP", lastPoison, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio5:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_Wound);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio5:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_Wound);
			end
			radio5:SetScript("OnClick", 
			  function()
					ConROC_SM_PoisonMH_Instant:SetChecked(false);
					ConROC_SM_PoisonMH_Crippling:SetChecked(false);
					ConROC_SM_PoisonMH_Mindnumbing:SetChecked(false);
					ConROC_SM_PoisonMH_Deadly:SetChecked(false);
					ConROC_SM_PoisonMH_Wound:SetChecked(true);
					ConROC_SM_PoisonMH_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					end
				end
			);
			radio5text:SetText(r5tspellName);
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

		lastPoison = radio5;		
		lastFrame = radio5;

	--None
		local radio6 = CreateFrame("CheckButton", "ConROC_SM_PoisonMH_None", frame, "UIRadioButtonTemplate");
		local radio6text = radio6:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			radio6:SetPoint("TOP", lastPoison, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio6:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_None);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio6:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_None);
			end
			radio6:SetScript("OnClick", 
			  function()
					ConROC_SM_PoisonMH_Instant:SetChecked(false);
					ConROC_SM_PoisonMH_Crippling:SetChecked(false);
					ConROC_SM_PoisonMH_Mindnumbing:SetChecked(false);
					ConROC_SM_PoisonMH_Deadly:SetChecked(false);
					ConROC_SM_PoisonMH_Wound:SetChecked(false);
					ConROC_SM_PoisonMH_None:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Instant = ConROC_SM_PoisonMH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Crippling = ConROC_SM_PoisonMH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Mindnumbing = ConROC_SM_PoisonMH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Deadly = ConROC_SM_PoisonMH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_Wound = ConROC_SM_PoisonMH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonMH_None = ConROC_SM_PoisonMH_None:GetChecked();
					end
				end
			);
			radio6text:SetText("None");
			radio6text:SetPoint('LEFT', radio6, 'RIGHT', 20, 0);

		lastPoison = radio6;		
		lastFrame = radio6;
		
		frame:Show()
end

function ConROC:RadioHeader2()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioHeader2", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 1)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontTitle = frame:CreateFontString("ConROC_Spellmenu_RadioHeader2", "ARTWORK", "GameFontGreenSmall");
			fontTitle:SetText("Poisons OH");
			fontTitle:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame2_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontTitle, "RIGHT", 0, 0)
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
				tbutton:SetPoint("LEFT", fontTitle, "RIGHT", 0, 0)
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
		
		frame:SetPoint("TOP", "ConROCRadioHeader2", "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastPoisonOH = frame;
		lastFrame = frame;
		
	--Instant Poison
		local r1tspellName, _, r1tspell = GetSpellInfo(ids.Poisons.InstantPoisonRank1);
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_PoisonOH_Instant", frame, "UIRadioButtonTemplate");
		local radio1text = radio1:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio1:SetPoint("TOP", ConROCRadioFrame2, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio1:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_Instant);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_Instant);	
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_PoisonOH_Instant:SetChecked(true);
					ConROC_SM_PoisonOH_Crippling:SetChecked(false);
					ConROC_SM_PoisonOH_Mindnumbing:SetChecked(false);
					ConROC_SM_PoisonOH_Deadly:SetChecked(false);
					ConROC_SM_PoisonOH_Wound:SetChecked(false);
					ConROC_SM_PoisonOH_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					end
				end
			);
			radio1text:SetText(r1tspellName);
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
		
		lastPoisonOH = radio1;
		lastFrame = radio1;
		
	--Crippling Poison
		local r2tspellName, _, r2tspell = GetSpellInfo(ids.Poisons.CripplingPoisonRank1);
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_PoisonOH_Crippling", frame, "UIRadioButtonTemplate");
		local radio2text = radio2:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			radio2:SetPoint("TOP", lastPoisonOH, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio2:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_Crippling);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_Crippling);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_PoisonOH_Instant:SetChecked(false);
					ConROC_SM_PoisonOH_Crippling:SetChecked(true);
					ConROC_SM_PoisonOH_Mindnumbing:SetChecked(false);
					ConROC_SM_PoisonOH_Deadly:SetChecked(false);
					ConROC_SM_PoisonOH_Wound:SetChecked(false);
					ConROC_SM_PoisonOH_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					end
				end
			);
			radio2text:SetText(r2tspellName);					
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

		lastPoisonOH = radio2;
		lastFrame = radio2;
		
	--Mindnumbing Poison
		local r3tspellName, _, r3tspell = GetSpellInfo(ids.Poisons.MindnumbingPoisonRank1);
		local radio3 = CreateFrame("CheckButton", "ConROC_SM_PoisonOH_Mindnumbing", frame, "UIRadioButtonTemplate");
		local radio3text = radio3:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio3:SetPoint("TOP", lastPoisonOH, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio3:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_Mindnumbing);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio3:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_Mindnumbing);
			end
			radio3:SetScript("OnClick", 
			  function()
					ConROC_SM_PoisonOH_Instant:SetChecked(false);
					ConROC_SM_PoisonOH_Crippling:SetChecked(false);
					ConROC_SM_PoisonOH_Mindnumbing:SetChecked(true);
					ConROC_SM_PoisonOH_Deadly:SetChecked(false);
					ConROC_SM_PoisonOH_Wound:SetChecked(false);
					ConROC_SM_PoisonOH_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					end
				end
			);
			radio3text:SetText(r3tspellName);					
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

		lastPoisonOH = radio3;
		lastFrame = radio3;
		
	--Deadly Poison
		local r4tspellName, _, r4tspell = GetSpellInfo(ids.Poisons.DeadlyPoisonRank1);	
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_PoisonOH_Deadly", frame, "UIRadioButtonTemplate");
		local radio4text = radio4:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");	
			radio4:SetPoint("TOP", lastPoisonOH, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio4:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_Deadly);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio4:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_Deadly);
			end
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_PoisonOH_Instant:SetChecked(false);
					ConROC_SM_PoisonOH_Crippling:SetChecked(false);
					ConROC_SM_PoisonOH_Mindnumbing:SetChecked(false);
					ConROC_SM_PoisonOH_Deadly:SetChecked(true);
					ConROC_SM_PoisonOH_Wound:SetChecked(false);
					ConROC_SM_PoisonOH_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					end
				end
			);
			radio4text:SetText(r4tspellName);
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

		lastPoisonOH = radio4;		
		lastFrame = radio4;

	--Wound Poison
		local r5tspellName, _, r5tspell = GetSpellInfo(ids.Poisons.WoundPoisonRank1);	
		local radio5 = CreateFrame("CheckButton", "ConROC_SM_PoisonOH_Wound", frame, "UIRadioButtonTemplate");
		local radio5text = radio5:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio5:SetPoint("TOP", lastPoisonOH, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio5:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_Wound);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio5:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_Wound);
			end
			radio5:SetScript("OnClick", 
			  function()
					ConROC_SM_PoisonOH_Instant:SetChecked(false);
					ConROC_SM_PoisonOH_Crippling:SetChecked(false);
					ConROC_SM_PoisonOH_Mindnumbing:SetChecked(false);
					ConROC_SM_PoisonOH_Deadly:SetChecked(false);
					ConROC_SM_PoisonOH_Wound:SetChecked(true);
					ConROC_SM_PoisonOH_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					end
				end
			);
			radio5text:SetText(r5tspellName);
		local r5t = radio5.texture;

			if not r5t then
				r5t = radio5:CreateTexture('RadioFrame2_radio5_Texture', 'ARTWORK');
				r5t:SetTexture(r5tspell);
				r5t:SetBlendMode('BLEND');
				radio5.texture = r5t;
			end			
			r5t:SetScale(0.2);			
			r5t:SetPoint("LEFT", radio5, "RIGHT", 8, 0);
			radio5text:SetPoint('LEFT', r5t, 'RIGHT', 5, 0);

		lastPoisonOH = radio5;		
		lastFrame = radio5;

	--None
		local radio6 = CreateFrame("CheckButton", "ConROC_SM_PoisonOH_None", frame, "UIRadioButtonTemplate");
		local radio6text = radio6:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			radio6:SetPoint("TOP", lastPoisonOH, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio6:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_None);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio6:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_None);
			end
			radio6:SetScript("OnClick", 
			  function()
					ConROC_SM_PoisonOH_Instant:SetChecked(false);
					ConROC_SM_PoisonOH_Crippling:SetChecked(false);
					ConROC_SM_PoisonOH_Mindnumbing:SetChecked(false);
					ConROC_SM_PoisonOH_Deadly:SetChecked(false);
					ConROC_SM_PoisonOH_Wound:SetChecked(false);
					ConROC_SM_PoisonOH_None:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_Melee_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Instant = ConROC_SM_PoisonOH_Instant:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Crippling = ConROC_SM_PoisonOH_Crippling:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Mindnumbing = ConROC_SM_PoisonOH_Mindnumbing:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Deadly = ConROC_SM_PoisonOH_Deadly:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_Wound = ConROC_SM_PoisonOH_Wound:GetChecked();
						ConROCRogueSpells.ConROC_PvP_PoisonOH_None = ConROC_SM_PoisonOH_None:GetChecked();
					end
				end
			);
			radio6text:SetText("None");
			radio6text:SetPoint('LEFT', radio6, 'RIGHT', 20, 0);

		lastPoisonOH = radio6;		
		lastFrame = radio6;
		
		frame:Show()
end

function ConROC:CheckHeader1()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckHeader1", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 1)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontDemons = frame:CreateFontString("ConROC_Spellmenu_CheckHeader1", "ARTWORK", "GameFontGreenSmall");
			fontDemons:SetText("Debuffs");
			fontDemons:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_CheckFrame1_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontDemons, "RIGHT", 0, 0)
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
				tbutton:SetPoint("LEFT", fontDemons, "RIGHT", 0, 0)
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
		
		frame:SetPoint("TOP", "ConROCCheckHeader1", "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastDebuff = frame;
		lastFrame = frame;

	--SliceandDice
		local c0tspellName, _, c0tspell = GetSpellInfo(ids.Ass_Ability.SliceandDiceRank1); 
		local check0 = CreateFrame("CheckButton", "ConROC_SM_Debuff_SliceandDice", frame, "UICheckButtonTemplate");
		local check0text = check0:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check0:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
			check0:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check0:SetChecked(ConROCRogueSpells.ConROC_Melee_Debuff_SliceandDice);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check0:SetChecked(ConROCRogueSpells.ConROC_PvP_Debuff_SliceandDice);
			end
			check0:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_Debuff_SliceandDice = ConROC_SM_Debuff_SliceandDice:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_Debuff_SliceandDice = ConROC_SM_Debuff_SliceandDice:GetChecked();
					end
				end);
			check0text:SetText(c0tspellName);
			check0text:SetScale(2);
		local c0t = check0.texture;
			if not c0t then
				c0t = check0:CreateTexture('CheckFrame1_check0_Texture', 'ARTWORK');
				c0t:SetTexture(c0tspell);
				c0t:SetBlendMode('BLEND');
				check0.texture = c0t;
			end			
			c0t:SetScale(0.4);
			c0t:SetPoint("LEFT", check0, "RIGHT", 8, 0);
			check0text:SetPoint('LEFT', c0t, 'RIGHT', 5, 0);
			
		lastDebuff = check0;
		lastFrame = check0;
		
	--Garrote
		local c1tspellName, _, c1tspell = GetSpellInfo(ids.Ass_Ability.GarroteRank1); 
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Debuff_Garrote", frame, "UICheckButtonTemplate");
		local check1text = check1:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check1:SetChecked(ConROCRogueSpells.ConROC_Melee_Debuff_Garrote);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCRogueSpells.ConROC_PvP_Debuff_Garrote);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_Debuff_Garrote = ConROC_SM_Debuff_Garrote:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_Debuff_Garrote = ConROC_SM_Debuff_Garrote:GetChecked();
					end
				end);
			check1text:SetText(c1tspellName);
			check1text:SetScale(2);
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
			
		lastDebuff = check1;
		lastFrame = check1;

	--Expose Armor
		local c2tspellName, _, c2tspell = GetSpellInfo(ids.Ass_Ability.ExposeArmorRank1); 
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Debuff_ExposeArmor", frame, "UICheckButtonTemplate");
		local check2text = check2:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check2:SetChecked(ConROCRogueSpells.ConROC_Melee_Debuff_ExposeArmor);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCRogueSpells.ConROC_PvP_Debuff_ExposeArmor);
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_Debuff_ExposeArmor = ConROC_SM_Debuff_ExposeArmor:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_Debuff_ExposeArmor = ConROC_SM_Debuff_ExposeArmor:GetChecked();
					end
				end);
			check2text:SetText(c2tspellName);	
			check2text:SetScale(2);
		local c2t = check2.texture;
			if not c2t then
				c2t = check2:CreateTexture('CheckFrame1_check2_Texture', 'ARTWORK');
				c2t:SetTexture(c2tspell);
				c2t:SetBlendMode('BLEND');
				check2.texture = c2t;
			end			
			c2t:SetScale(0.4);
			c2t:SetPoint("LEFT", check2, "RIGHT", 8, 0);
			check2text:SetPoint('LEFT', c2t, 'RIGHT', 5, 0);
			
		lastDebuff = check2;
		lastFrame = check2;

	--Rupture
		local c3tspellName, _, c3tspell = GetSpellInfo(ids.Ass_Ability.RuptureRank1); 
		local check3 = CreateFrame("CheckButton", "ConROC_SM_Debuff_Rupture", frame, "UICheckButtonTemplate");
		local check3text = check3:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check3:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			check3:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check3:SetChecked(ConROCRogueSpells.ConROC_Melee_Debuff_Rupture);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check3:SetChecked(ConROCRogueSpells.ConROC_PvP_Debuff_Rupture);
			end
			check3:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_Debuff_Rupture = ConROC_SM_Debuff_Rupture:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_Debuff_Rupture = ConROC_SM_Debuff_Rupture:GetChecked();
					end
				end);
			check3text:SetText(c3tspellName);
			check3text:SetScale(2);
		local c3t = check3.texture;
			if not c3t then
				c3t = check3:CreateTexture('CheckFrame1_check3_Texture', 'ARTWORK');
				c3t:SetTexture(c3tspell);
				c3t:SetBlendMode('BLEND');
				check3.texture = c3t;
			end			
			c3t:SetScale(0.4);
			c3t:SetPoint("LEFT", check3, "RIGHT", 8, 0);
			check3text:SetPoint('LEFT', c3t, 'RIGHT', 5, 0);
			
		lastDebuff = check3;
		lastFrame = check3;
		
	--Hemorrhage
		local c4tspellName, _, c4tspell = GetSpellInfo(ids.Sub_Ability.HemorrhageRank1); 
		local check4 = CreateFrame("CheckButton", "ConROC_SM_Debuff_Hemorrhage", frame, "UICheckButtonTemplate");
		local check4text = check4:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check4:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			check4:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check4:SetChecked(ConROCRogueSpells.ConROC_Melee_Debuff_Hemorrhage);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check4:SetChecked(ConROCRogueSpells.ConROC_PvP_Debuff_Hemorrhage);
			end
			check4:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_Debuff_Hemorrhage = ConROC_SM_Debuff_Hemorrhage:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_Debuff_Hemorrhage = ConROC_SM_Debuff_Hemorrhage:GetChecked();
					end
				end);
			check4text:SetText(c4tspellName);
			check4text:SetScale(2);
		local c4t = check4.texture;
			if not c4t then
				c4t = check4:CreateTexture('CheckFrame1_check4_Texture', 'ARTWORK');
				c4t:SetTexture(c4tspell);
				c4t:SetBlendMode('BLEND');
				check4.texture = c4t;
			end			
			c4t:SetScale(0.4);
			c4t:SetPoint("LEFT", check4, "RIGHT", 8, 0);
			check4text:SetPoint('LEFT', c4t, 'RIGHT', 5, 0);
			
		lastDebuff = check4;
		lastFrame = check4;
		
		frame:Show()
end

function ConROC:CheckHeader2()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckHeader2", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 1)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontDemons = frame:CreateFontString("ConROC_Spellmenu_CheckHeader2", "ARTWORK", "GameFontGreenSmall");
			fontDemons:SetText("Stuns");
			fontDemons:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_CheckFrame2_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontDemons, "RIGHT", 0, 0)
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
					ConROCCheckFrame2:Show();
					ConROC_CheckFrame2_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_CheckFrame2_CloseButton', frame)
				tbutton:SetFrameStrata('MEDIUM')
				tbutton:SetFrameLevel('6')
				tbutton:SetPoint("LEFT", fontDemons, "RIGHT", 0, 0)
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
					ConROCCheckFrame2:Hide();
					ConROC_CheckFrame2_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:CheckFrame2();
end

function ConROC:CheckFrame2()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckFrame2", ConROCCheckHeader2)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 5)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCCheckHeader2", "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastStun = frame;
		lastFrame = frame;
		
	--Gouge
		local c1tspellName, _, c1tspell = GetSpellInfo(ids.Com_Ability.GougeRank1); 
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Stun_Gouge", frame, "UICheckButtonTemplate");
		local check1text = check1:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", ConROCCheckFrame2, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check1:SetChecked(ConROCRogueSpells.ConROC_Melee_Stun_Gouge);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCRogueSpells.ConROC_PvP_Stun_Gouge);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_Stun_Gouge = ConROC_SM_Stun_Gouge:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_Stun_Gouge = ConROC_SM_Stun_Gouge:GetChecked();
					end
				end);
			check1text:SetText(c1tspellName);
			check1text:SetScale(2);
		local c1t = check1.texture;
			if not c1t then
				c1t = check1:CreateTexture('CheckFrame2_check1_Texture', 'ARTWORK');
				c1t:SetTexture(c1tspell);
				c1t:SetBlendMode('BLEND');
				check1.texture = c1t;
			end			
			c1t:SetScale(0.4);
			c1t:SetPoint("LEFT", check1, "RIGHT", 8, 0);
			check1text:SetPoint('LEFT', c1t, 'RIGHT', 5, 0);
			
		lastStun = check1;
		lastFrame = check1;

	--Cheap Shot
		local c2tspellName, _, c2tspell = GetSpellInfo(ids.Ass_Ability.CheapShot); 
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Stun_CheapShot", frame, "UICheckButtonTemplate");
		local check2text = check2:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check2:SetChecked(ConROCRogueSpells.ConROC_Melee_Stun_CheapShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCRogueSpells.ConROC_PvP_Stun_CheapShot);
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_Stun_CheapShot = ConROC_SM_Stun_CheapShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_Stun_CheapShot = ConROC_SM_Stun_CheapShot:GetChecked();
					end
				end);
			check2text:SetText(c2tspellName);
			check2text:SetScale(2);
		local c2t = check2.texture;
			if not c2t then
				c2t = check2:CreateTexture('CheckFrame2_check2_Texture', 'ARTWORK');
				c2t:SetTexture(c2tspell);
				c2t:SetBlendMode('BLEND');
				check2.texture = c2t;
			end			
			c2t:SetScale(0.4);
			c2t:SetPoint("LEFT", check2, "RIGHT", 8, 0);
			check2text:SetPoint('LEFT', c2t, 'RIGHT', 5, 0);
			
		lastStun = check2;
		lastFrame = check2;

	--Kidney Shot
		local c3tspellName, _, c3tspell = GetSpellInfo(ids.Ass_Ability.KidneyShotRank1); 
		local check3 = CreateFrame("CheckButton", "ConROC_SM_Stun_KidneyShot", frame, "UICheckButtonTemplate");
		local check3text = check3:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check3:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			check3:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check3:SetChecked(ConROCRogueSpells.ConROC_Melee_Stun_KidneyShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check3:SetChecked(ConROCRogueSpells.ConROC_PvP_Stun_KidneyShot);
			end
			check3:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_Stun_KidneyShot = ConROC_SM_Stun_KidneyShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_Stun_KidneyShot = ConROC_SM_Stun_KidneyShot:GetChecked();
					end
				end);
			check3text:SetText(c3tspellName);
			check3text:SetScale(2);
		local c3t = check3.texture;
			if not c3t then
				c3t = check3:CreateTexture('CheckFrame2_check3_Texture', 'ARTWORK');
				c3t:SetTexture(c3tspell);
				c3t:SetBlendMode('BLEND');
				check3.texture = c3t;
			end			
			c3t:SetScale(0.4);
			c3t:SetPoint("LEFT", check3, "RIGHT", 8, 0);
			check3text:SetPoint('LEFT', c3t, 'RIGHT', 5, 0);
			
		lastStun = check3;
		lastFrame = check3;

	--Blind
		local c4tspellName, _, c4tspell = GetSpellInfo(ids.Sub_Ability.Blind); 
		local check4 = CreateFrame("CheckButton", "ConROC_SM_Stun_Blind", frame, "UICheckButtonTemplate");
		local check4text = check4:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check4:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			check4:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check4:SetChecked(ConROCRogueSpells.ConROC_Melee_Stun_Blind);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check4:SetChecked(ConROCRogueSpells.ConROC_PvP_Stun_Blind);
			end
			check4:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCRogueSpells.ConROC_Melee_Stun_Blind = ConROC_SM_Stun_Blind:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCRogueSpells.ConROC_PvP_Stun_Blind = ConROC_SM_Stun_Blind:GetChecked();
					end
				end);
			check4text:SetText(c4tspellName);
			check4text:SetScale(2);
		local c4t = check4.texture;
			if not c4t then
				c4t = check4:CreateTexture('CheckFrame2_check4_Texture', 'ARTWORK');
				c4t:SetTexture(c4tspell);
				c4t:SetBlendMode('BLEND');
				check4.texture = c4t;
			end			
			c4t:SetScale(0.4);
			c4t:SetPoint("LEFT", check4, "RIGHT", 8, 0);
			check4text:SetPoint('LEFT', c4t, 'RIGHT', 5, 0);
			
		lastStun = check4;
		lastFrame = check4;
		
		frame:Show()
end

function ConROC:SpellMenuUpdate()
	lastFrame = ConROCSpellmenuClass;
	
	if ConROCRadioHeader1 ~= nil then
		lastPoison = ConROCRadioFrame1;
		
	--Poisons MH
		if plvl >= 20 then 
			ConROC_SM_PoisonMH_Instant:Show();
			lastPoison = ConROC_SM_PoisonMH_Instant;
		else
			ConROC_SM_PoisonMH_Instant:Hide();
		end

		if plvl >= 20 then 
			ConROC_SM_PoisonMH_Crippling:Show(); 
			ConROC_SM_PoisonMH_Crippling:SetPoint("TOP", lastPoison, "BOTTOM", 0, 0);
			lastPoison = ConROC_SM_PoisonMH_Crippling;
		else
			ConROC_SM_PoisonMH_Crippling:Hide();
		end
		
		if plvl >= 24 then 
			ConROC_SM_PoisonMH_Mindnumbing:Show(); 
			ConROC_SM_PoisonMH_Mindnumbing:SetPoint("TOP", lastPoison, "BOTTOM", 0, 0);
			lastPoison = ConROC_SM_PoisonMH_Mindnumbing;
		else
			ConROC_SM_PoisonMH_Mindnumbing:Hide();
		end		
		
		if plvl >= 30 then
			ConROC_SM_PoisonMH_Deadly:Show(); 
			ConROC_SM_PoisonMH_Deadly:SetPoint("TOP", lastPoison, "BOTTOM", 0, 0);
			lastPoison = ConROC_SM_PoisonMH_Deadly;
		else
			ConROC_SM_PoisonMH_Deadly:Hide();
		end

		if plvl >= 32 then 
			ConROC_SM_PoisonMH_Wound:Show(); 
			ConROC_SM_PoisonMH_Wound:SetPoint("TOP", lastPoison, "BOTTOM", 0, 0);
			lastPoison = ConROC_SM_PoisonMH_Wound;
		else
			ConROC_SM_PoisonMH_Wound:Hide();
		end		
		
		if plvl >= 20 then
			ConROC_SM_PoisonMH_None:Show(); 
			ConROC_SM_PoisonMH_None:SetPoint("TOP", lastPoison, "BOTTOM", 0, 0);
			lastPoison = ConROC_SM_PoisonMH_None;
		else
			ConROC_SM_PoisonMH_None:Hide();
		end
		
		if lastPoison == ConROCRadioFrame1 then
			ConROCRadioHeader1:Hide();
			ConROCRadioFrame1:Hide();
		end
		
		if ConROCRadioFrame1:IsVisible() then
			lastFrame = lastPoison;
		else
			lastFrame = ConROCRadioHeader1;
		end
	end

	if ConROCRadioHeader2 ~= nil then
		if lastFrame == lastPoison then
			ConROCRadioHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCRadioHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 0, -10);
		end	

		lastPoisonOH = ConROCRadioFrame2;
		
	--Poisons OH
		if plvl >= 20 then 
			ConROC_SM_PoisonOH_Instant:Show();
			lastPoisonOH = ConROC_SM_PoisonOH_Instant;
		else
			ConROC_SM_PoisonOH_Instant:Hide();
		end

		if plvl >= 20 then 
			ConROC_SM_PoisonOH_Crippling:Show(); 
			ConROC_SM_PoisonOH_Crippling:SetPoint("TOP", lastPoisonOH, "BOTTOM", 0, 0);
			lastPoisonOH = ConROC_SM_PoisonOH_Crippling;
		else
			ConROC_SM_PoisonOH_Crippling:Hide();
		end
		
		if plvl >= 24 then 
			ConROC_SM_PoisonOH_Mindnumbing:Show(); 
			ConROC_SM_PoisonOH_Mindnumbing:SetPoint("TOP", lastPoisonOH, "BOTTOM", 0, 0);
			lastPoisonOH = ConROC_SM_PoisonOH_Mindnumbing;
		else
			ConROC_SM_PoisonOH_Mindnumbing:Hide();
		end		
		
		if plvl >= 30 then
			ConROC_SM_PoisonOH_Deadly:Show(); 
			ConROC_SM_PoisonOH_Deadly:SetPoint("TOP", lastPoisonOH, "BOTTOM", 0, 0);
			lastPoisonOH = ConROC_SM_PoisonOH_Deadly;
		else
			ConROC_SM_PoisonOH_Deadly:Hide();
		end

		if plvl >= 32 then 
			ConROC_SM_PoisonOH_Wound:Show(); 
			ConROC_SM_PoisonOH_Wound:SetPoint("TOP", lastPoisonOH, "BOTTOM", 0, 0);
			lastPoisonOH = ConROC_SM_PoisonOH_Wound;
		else
			ConROC_SM_PoisonOH_Wound:Hide();
		end		
		
		if plvl >= 20 then
			ConROC_SM_PoisonOH_None:Show(); 
			ConROC_SM_PoisonOH_None:SetPoint("TOP", lastPoisonOH, "BOTTOM", 0, 0);
			lastPoisonOH = ConROC_SM_PoisonOH_None;
		else
			ConROC_SM_PoisonOH_None:Hide();
		end

		if lastPoisonOH == ConROCRadioFrame2 then
			ConROCRadioHeader2:Hide();
			ConROCRadioFrame2:Hide();
		end
		
		if ConROCRadioFrame2:IsVisible() then
			lastFrame = lastPoisonOH;
		else
			lastFrame = ConROCRadioHeader2;
		end
	end
	
	if ConROCCheckHeader1 ~= nil then
		if lastFrame == lastPoison or lastFrame == lastPoisonOH then
			ConROCCheckHeader1:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader1:SetPoint("TOP", lastFrame, "BOTTOM", 0, -10);
		end	

		lastDebuff = ConROCCheckFrame1;
		
	--Debuffs
		if plvl >= 10 then 
			ConROC_SM_Debuff_SliceandDice:Show();
			lastDebuff = ConROC_SM_Debuff_SliceandDice;
		else
			ConROC_SM_Debuff_SliceandDice:Hide();
		end		
		
		if plvl >= 14 then 
			ConROC_SM_Debuff_Garrote:Show();
			ConROC_SM_Debuff_Garrote:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			lastDebuff = ConROC_SM_Debuff_Garrote;
		else
			ConROC_SM_Debuff_Garrote:Hide();
		end

		if plvl >= 14 then 
			ConROC_SM_Debuff_ExposeArmor:Show(); 
			ConROC_SM_Debuff_ExposeArmor:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			lastDebuff = ConROC_SM_Debuff_ExposeArmor;
		else
			ConROC_SM_Debuff_ExposeArmor:Hide();
		end
		
		if plvl >= 20 then 
			ConROC_SM_Debuff_Rupture:Show(); 
			ConROC_SM_Debuff_Rupture:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			lastDebuff = ConROC_SM_Debuff_Rupture;
		else
			ConROC_SM_Debuff_Rupture:Hide();
		end		
		
		if plvl >= 30 then
			ConROC_SM_Debuff_Hemorrhage:Show(); 
			ConROC_SM_Debuff_Hemorrhage:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			lastDebuff = ConROC_SM_Debuff_Hemorrhage;
		else
			ConROC_SM_Debuff_Hemorrhage:Hide();
		end

		if lastDebuff == ConROCCheckFrame1 then
			ConROCCheckHeader1:Hide();
			ConROCCheckFrame1:Hide();
		end
		
		if ConROCCheckFrame1:IsVisible() then
			lastFrame = lastDebuff;
		else
			lastFrame = ConROCCheckHeader1;
		end
	end

	if ConROCCheckHeader2 ~= nil then
		if lastFrame == lastPoison or lastFrame == lastPoisonOH or lastFrame == lastDebuff then
			ConROCCheckHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 0, -10);
		end	

		lastStun = ConROCCheckFrame2;
		
	--Stuns
		if plvl >= 6 then 
			ConROC_SM_Stun_Gouge:Show();
			lastStun = ConROC_SM_Stun_Gouge;
		else
			ConROC_SM_Stun_Gouge:Hide();
		end

		if plvl >= 26 and IsSpellKnown(ids.Ass_Ability.CheapShot) then 
			ConROC_SM_Stun_CheapShot:Show(); 
			ConROC_SM_Stun_CheapShot:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			lastStun = ConROC_SM_Stun_CheapShot;
		else
			ConROC_SM_Stun_CheapShot:Hide();
		end
		
		if plvl >= 30 then 
			ConROC_SM_Stun_KidneyShot:Show(); 
			ConROC_SM_Stun_KidneyShot:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			lastStun = ConROC_SM_Stun_KidneyShot;
		else
			ConROC_SM_Stun_KidneyShot:Hide();
		end		
		
		if plvl >= 34 and IsSpellKnown(ids.Sub_Ability.Blind) then
			ConROC_SM_Stun_Blind:Show(); 
			ConROC_SM_Stun_Blind:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			lastStun = ConROC_SM_Stun_Blind;
		else
			ConROC_SM_Stun_Blind:Hide();
		end
		
		if lastStun == ConROCCheckFrame2 then
			ConROCCheckHeader2:Hide();
			ConROCCheckFrame2:Hide();
		end
		
		if ConROCCheckFrame2:IsVisible() then
			lastFrame = lastStun;
		else
			lastFrame = ConROCCheckHeader2;
		end
	end	
end

function ConROC:RoleProfile()
	if ConROC:CheckBox(ConROC_SM_Role_Melee) then
		ConROC_SM_PoisonMH_Instant:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_Instant);
		ConROC_SM_PoisonMH_Crippling:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_Crippling);
		ConROC_SM_PoisonMH_Mindnumbing:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_Mindnumbing);
		ConROC_SM_PoisonMH_Deadly:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_Deadly);
		ConROC_SM_PoisonMH_Wound:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_Wound);
		ConROC_SM_PoisonMH_None:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonMH_None);

		ConROC_SM_PoisonOH_Instant:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_Instant);
		ConROC_SM_PoisonOH_Crippling:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_Crippling);
		ConROC_SM_PoisonOH_Mindnumbing:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_Mindnumbing);
		ConROC_SM_PoisonOH_Deadly:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_Deadly);
		ConROC_SM_PoisonOH_Wound:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_Wound);
		ConROC_SM_PoisonOH_None:SetChecked(ConROCRogueSpells.ConROC_Melee_PoisonOH_None);

		ConROC_SM_Debuff_SliceandDice:SetChecked(ConROCRogueSpells.ConROC_Melee_Debuff_SliceandDice);		
		ConROC_SM_Debuff_Garrote:SetChecked(ConROCRogueSpells.ConROC_Melee_Debuff_Garrote);
		ConROC_SM_Debuff_ExposeArmor:SetChecked(ConROCRogueSpells.ConROC_Melee_Debuff_ExposeArmor);
		ConROC_SM_Debuff_Rupture:SetChecked(ConROCRogueSpells.ConROC_Melee_Debuff_Rupture);
		ConROC_SM_Debuff_Hemorrhage:SetChecked(ConROCRogueSpells.ConROC_Melee_Debuff_Hemorrhage);

		ConROC_SM_Stun_Gouge:SetChecked(ConROCRogueSpells.ConROC_Melee_Stun_Gouge);
		ConROC_SM_Stun_CheapShot:SetChecked(ConROCRogueSpells.ConROC_Melee_Stun_CheapShot);
		ConROC_SM_Stun_KidneyShot:SetChecked(ConROCRogueSpells.ConROC_Melee_Stun_KidneyShot);
		ConROC_SM_Stun_Blind:SetChecked(ConROCRogueSpells.ConROC_Melee_Stun_Blind);
		
	elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
		ConROC_SM_PoisonMH_Instant:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_Instant);
		ConROC_SM_PoisonMH_Crippling:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_Crippling);
		ConROC_SM_PoisonMH_Mindnumbing:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_Mindnumbing);
		ConROC_SM_PoisonMH_Deadly:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_Deadly);
		ConROC_SM_PoisonMH_Wound:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_Wound);
		ConROC_SM_PoisonMH_None:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonMH_None);	

		ConROC_SM_PoisonOH_Instant:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_Instant);
		ConROC_SM_PoisonOH_Crippling:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_Crippling);
		ConROC_SM_PoisonOH_Mindnumbing:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_Mindnumbing);
		ConROC_SM_PoisonOH_Deadly:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_Deadly);
		ConROC_SM_PoisonOH_Wound:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_Wound);
		ConROC_SM_PoisonOH_None:SetChecked(ConROCRogueSpells.ConROC_PvP_PoisonOH_None);	

		ConROC_SM_Debuff_SliceandDice:SetChecked(ConROCRogueSpells.ConROC_PvP_Debuff_SliceandDice);		
		ConROC_SM_Debuff_Garrote:SetChecked(ConROCRogueSpells.ConROC_PvP_Debuff_Garrote);
		ConROC_SM_Debuff_ExposeArmor:SetChecked(ConROCRogueSpells.ConROC_PvP_Debuff_ExposeArmor);
		ConROC_SM_Debuff_Rupture:SetChecked(ConROCRogueSpells.ConROC_PvP_Debuff_Rupture);
		ConROC_SM_Debuff_Hemorrhage:SetChecked(ConROCRogueSpells.ConROC_PvP_Debuff_Hemorrhage);

		ConROC_SM_Stun_Gouge:SetChecked(ConROCRogueSpells.ConROC_PvP_Stun_Gouge);
		ConROC_SM_Stun_CheapShot:SetChecked(ConROCRogueSpells.ConROC_PvP_Stun_CheapShot);
		ConROC_SM_Stun_KidneyShot:SetChecked(ConROCRogueSpells.ConROC_PvP_Stun_KidneyShot);
		ConROC_SM_Stun_Blind:SetChecked(ConROCRogueSpells.ConROC_PvP_Stun_Blind);	
	end
end

ConROC.Rogue = {};

function ConROC:EnableRotationModule()
	self.Description = 'Rogue';
	self.NextSpell = ConROC.Rogue.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
	
	ConROC:SpellmenuClass();
--	ConROCSpellmenuFrame:Hide();	
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Rogue.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

	local Racial, Spec, Ass_Ability, Ass_Talent, Com_Ability, Com_Talent, Sub_Ability, Sub_Talent, Poisons, Player_Buff, Player_Debuff, Target_Debuff = ids.Racial, ids.Spec, ids.Ass_Ability, ids.Ass_Talent, ids.Com_Ability, ids.Com_Talent, ids.Sub_Ability, ids.Sub_Talent, ids.Poisons, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff;

	local _Ambush = Ass_Ability.AmbushRank1;
	local _Eviscerate = Ass_Ability.EviscerateRank1;	
	local _ExposeArmor = Ass_Ability.ExposeArmorRank1;	
	local _Garrote = Ass_Ability.GarroteRank1;	
	local _KidneyShot = Ass_Ability.KidneyShotRank1;	
	local _Rupture = Ass_Ability.RuptureRank1;	
	local _SliceandDice = Ass_Ability.SliceandDiceRank1;
	
	local _Backstab = Com_Ability.BackstabRank1;
	local _Feint = Com_Ability.FeintRank1;
	local _Gouge = Com_Ability.GougeRank1;
	local _Kick = Com_Ability.KickRank1;
	local _SinisterStrike = Com_Ability.SinisterStrikeRank1;
	local _Sprint = Com_Ability.SprintRank1;
	
	local _Hemorrhage = Sub_Ability.HemorrhageRank1;
	local _Sap = Sub_Ability.SapRank1;
	local _Stealth = Sub_Ability.StealthRank1;
	local _Vanish = Sub_Ability.VanishRank1;
	
function ConROC.Rogue.Damage(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');

--Racials

--Resources
	local energy 											= UnitPower('player', Enum.PowerType.Energy);
	local energyMax 										= UnitPowerMax('player', Enum.PowerType.Energy);
	local energyPercent 									= math.max(0, energy) / math.max(1, energyMax) * 100;	
    local combo 											= UnitPower('player', Enum.PowerType.ComboPoints);
	local comboMax 											= UnitPowerMax('player', Enum.PowerType.ComboPoints);

--Ranks
	if IsSpellKnown(Ass_Ability.AmbushRank6) then _Ambush = Ass_Ability.AmbushRank6;
	elseif IsSpellKnown(Ass_Ability.AmbushRank5) then _Ambush = Ass_Ability.AmbushRank5;
	elseif IsSpellKnown(Ass_Ability.AmbushRank4) then _Ambush = Ass_Ability.AmbushRank4;
	elseif IsSpellKnown(Ass_Ability.AmbushRank3) then _Ambush = Ass_Ability.AmbushRank3;
	elseif IsSpellKnown(Ass_Ability.AmbushRank2) then _Ambush = Ass_Ability.AmbushRank2; end

	if IsSpellKnown(Ass_Ability.EviscerateRank8) then _Eviscerate = Ass_Ability.EviscerateRank8;
	elseif IsSpellKnown(Ass_Ability.EviscerateRank7) then _Eviscerate = Ass_Ability.EviscerateRank7;
	elseif IsSpellKnown(Ass_Ability.EviscerateRank6) then _Eviscerate = Ass_Ability.EviscerateRank6;
	elseif IsSpellKnown(Ass_Ability.EviscerateRank5) then _Eviscerate = Ass_Ability.EviscerateRank5;
	elseif IsSpellKnown(Ass_Ability.EviscerateRank4) then _Eviscerate = Ass_Ability.EviscerateRank4;
	elseif IsSpellKnown(Ass_Ability.EviscerateRank3) then _Eviscerate = Ass_Ability.EviscerateRank3;
	elseif IsSpellKnown(Ass_Ability.EviscerateRank2) then _Eviscerate = Ass_Ability.EviscerateRank2; end

	if IsSpellKnown(Ass_Ability.ExposeArmorRank5) then _ExposeArmor = Ass_Ability.ExposeArmorRank5;
	elseif IsSpellKnown(Ass_Ability.ExposeArmorRank4) then _ExposeArmor = Ass_Ability.ExposeArmorRank4;
	elseif IsSpellKnown(Ass_Ability.ExposeArmorRank3) then _ExposeArmor = Ass_Ability.ExposeArmorRank3;
	elseif IsSpellKnown(Ass_Ability.ExposeArmorRank2) then _ExposeArmor = Ass_Ability.ExposeArmorRank2; end

	if IsSpellKnown(Ass_Ability.GarroteRank6) then _Garrote = Ass_Ability.GarroteRank6;
	elseif IsSpellKnown(Ass_Ability.GarroteRank5) then _Garrote = Ass_Ability.GarroteRank5;
	elseif IsSpellKnown(Ass_Ability.GarroteRank4) then _Garrote = Ass_Ability.GarroteRank4;
	elseif IsSpellKnown(Ass_Ability.GarroteRank3) then _Garrote = Ass_Ability.GarroteRank3;
	elseif IsSpellKnown(Ass_Ability.GarroteRank2) then _Garrote = Ass_Ability.GarroteRank2; end
	
	if IsSpellKnown(Ass_Ability.KidneyShotRank2) then _KidneyShot = Ass_Ability.KidneyShotRank2; end
	
	if IsSpellKnown(Ass_Ability.RuptureRank6) then _Rupture = Ass_Ability.RuptureRank6;
	elseif IsSpellKnown(Ass_Ability.RuptureRank5) then _Rupture = Ass_Ability.RuptureRank5;
	elseif IsSpellKnown(Ass_Ability.RuptureRank4) then _Rupture = Ass_Ability.RuptureRank4;
	elseif IsSpellKnown(Ass_Ability.RuptureRank3) then _Rupture = Ass_Ability.RuptureRank3;
	elseif IsSpellKnown(Ass_Ability.RuptureRank2) then _Rupture = Ass_Ability.RuptureRank2; end	
	
	if IsSpellKnown(Ass_Ability.SliceandDiceRank2) then _SliceandDice = Ass_Ability.SliceandDiceRank2; end	
	
	if IsSpellKnown(Com_Ability.BackstabRank8) then _Backstab = Com_Ability.BackstabRank8;
	elseif IsSpellKnown(Com_Ability.BackstabRank7) then _Backstab = Com_Ability.BackstabRank7;
	elseif IsSpellKnown(Com_Ability.BackstabRank6) then _Backstab = Com_Ability.BackstabRank6;
	elseif IsSpellKnown(Com_Ability.BackstabRank5) then _Backstab = Com_Ability.BackstabRank5;
	elseif IsSpellKnown(Com_Ability.BackstabRank4) then _Backstab = Com_Ability.BackstabRank4;
	elseif IsSpellKnown(Com_Ability.BackstabRank3) then _Backstab = Com_Ability.BackstabRank3;
	elseif IsSpellKnown(Com_Ability.BackstabRank2) then _Backstab = Com_Ability.BackstabRank2; end
	
	if IsSpellKnown(Com_Ability.FeintRank4) then _Feint = Com_Ability.FeintRank4;
	elseif IsSpellKnown(Com_Ability.FeintRank3) then _Feint = Com_Ability.FeintRank3;
	elseif IsSpellKnown(Com_Ability.FeintRank2) then _Feint = Com_Ability.FeintRank2; end		

	if IsSpellKnown(Com_Ability.GougeRank5) then _Gouge = Com_Ability.GougeRank5;
	elseif IsSpellKnown(Com_Ability.GougeRank4) then _Gouge = Com_Ability.GougeRank4;
	elseif IsSpellKnown(Com_Ability.GougeRank3) then _Gouge = Com_Ability.GougeRank3;
	elseif IsSpellKnown(Com_Ability.GougeRank2) then _Gouge = Com_Ability.GougeRank2; end

	if IsSpellKnown(Com_Ability.KickRank4) then _Kick = Com_Ability.KickRank4;
	elseif IsSpellKnown(Com_Ability.KickRank3) then _Kick = Com_Ability.KickRank3;
	elseif IsSpellKnown(Com_Ability.KickRank2) then _Kick = Com_Ability.KickRank2; end

	if IsSpellKnown(Com_Ability.SinisterStrikeRank8) then _SinisterStrike = Com_Ability.SinisterStrikeRank8;
	elseif IsSpellKnown(Com_Ability.SinisterStrikeRank7) then _SinisterStrike = Com_Ability.SinisterStrikeRank7;
	elseif IsSpellKnown(Com_Ability.SinisterStrikeRank6) then _SinisterStrike = Com_Ability.SinisterStrikeRank6;
	elseif IsSpellKnown(Com_Ability.SinisterStrikeRank5) then _SinisterStrike = Com_Ability.SinisterStrikeRank5;
	elseif IsSpellKnown(Com_Ability.SinisterStrikeRank4) then _SinisterStrike = Com_Ability.SinisterStrikeRank4;
	elseif IsSpellKnown(Com_Ability.SinisterStrikeRank3) then _SinisterStrike = Com_Ability.SinisterStrikeRank3;
	elseif IsSpellKnown(Com_Ability.SinisterStrikeRank2) then _SinisterStrike = Com_Ability.SinisterStrikeRank2; end

	if IsSpellKnown(Com_Ability.SprintRank3) then _Sprint = Com_Ability.SprintRank3;
	elseif IsSpellKnown(Com_Ability.SprintRank2) then _Sprint = Com_Ability.SprintRank2; end

	if IsSpellKnown(Sub_Ability.HemorrhageRank3) then _Hemorrhage = Sub_Ability.HemorrhageRank3;
	elseif IsSpellKnown(Sub_Ability.HemorrhageRank2) then _Hemorrhage = Sub_Ability.HemorrhageRank2; end

	if IsSpellKnown(Sub_Ability.SapRank3) then _Sap = Sub_Ability.SapRank3;
	elseif IsSpellKnown(Sub_Ability.SapRank2) then _Sap = Sub_Ability.SapRank2; end

	if IsSpellKnown(Sub_Ability.VanishRank2) then _Vanish = Sub_Ability.VanishRank2; end

	if IsSpellKnown(Poisons.CripplingPoisonRank2) then _CripplingPoison = Poisons.CripplingPoisonRank2; end

	if IsSpellKnown(Poisons.DeadlyPoisonRank4) then _DeadlyPoison = Poisons.DeadlyPoisonRank4;
	elseif IsSpellKnown(Poisons.DeadlyPoisonRank3) then _DeadlyPoison = Poisons.DeadlyPoisonRank3;
	elseif IsSpellKnown(Poisons.DeadlyPoisonRank2) then _DeadlyPoison = Poisons.DeadlyPoisonRank2; end
	
	if IsSpellKnown(Poisons.InstantPoisonRank6) then _InstantPoison = Poisons.InstantPoisonRank6;
	elseif IsSpellKnown(Poisons.InstantPoisonRank5) then _InstantPoison = Poisons.InstantPoisonRank5;
	elseif IsSpellKnown(Poisons.InstantPoisonRank4) then _InstantPoison = Poisons.InstantPoisonRank4;
	elseif IsSpellKnown(Poisons.InstantPoisonRank3) then _InstantPoison = Poisons.InstantPoisonRank3;
	elseif IsSpellKnown(Poisons.InstantPoisonRank2) then _InstantPoison = Poisons.InstantPoisonRank2; end
	
	if IsSpellKnown(Poisons.MindnumbingPoisonRank3) then _MindnumbingPoison = Poisons.MindnumbingPoisonRank3;
	elseif IsSpellKnown(Poisons.MindnumbingPoisonRank2) then _MindnumbingPoison = Poisons.MindnumbingPoisonRank2; end	
	
	if IsSpellKnown(Poisons.WoundPoisonRank4) then _WoundPoison = Poisons.WoundPoisonRank4;
	elseif IsSpellKnown(Poisons.WoundPoisonRank3) then _WoundPoison = Poisons.WoundPoisonRank3;
	elseif IsSpellKnown(Poisons.WoundPoisonRank2) then _WoundPoison = Poisons.WoundPoisonRank2; end
	
--Abilities
	local ambushRDY											= ConROC:AbilityReady(_Ambush, timeShift);
	local cShotRDY											= ConROC:AbilityReady(Ass_Ability.CheapShot, timeShift);
	local kShotRDY											= ConROC:AbilityReady(_KidneyShot, timeShift);	
	local evisRDY											= ConROC:AbilityReady(_Eviscerate, timeShift);
	local cBloodRDY											= ConROC:AbilityReady(Ass_Ability.ColdBlood, timeShift);
		local cBloodBUFF										= ConROC:Buff(Ass_Ability.ColdBlood, timeShift);
	local exArmorRDY										= ConROC:AbilityReady(_ExposeArmor, timeShift);
		local exArmorDEBUFF										= ConROC:TargetDebuff(_ExposeArmor, timeShift);	
	local garRDY											= ConROC:AbilityReady(_Garrote, timeShift);
		local garDEBUFF											= ConROC:TargetDebuff(_Garrote, timeShift);
	local rupRDY											= ConROC:AbilityReady(_Rupture, timeShift);
		local rupDEBUFF											= ConROC:TargetDebuff(_Rupture, timeShift);
	local sndRDY											= ConROC:AbilityReady(_SliceandDice, timeShift);
		local sndBUFF, _, sndDUR								= ConROC:Buff(_SliceandDice, timeShift);
	local aRushRDY											= ConROC:AbilityReady(Com_Ability.AdrenalineRush, timeShift);
		local aRushBUFF											= ConROC:Buff(Com_Ability.AdrenalineRush, timeShift);
	local bStabRDY											= ConROC:AbilityReady(_Backstab, timeShift);
	local bFlurryRDY										= ConROC:AbilityReady(Com_Ability.BladeFlurry, timeShift);
	local gougeRDY											= ConROC:AbilityReady(_Gouge, timeShift);
	local kickRDY											= ConROC:AbilityReady(_Kick, timeShift);
	local sStrikeRDY										= ConROC:AbilityReady(_SinisterStrike, timeShift);
	local sprintRDY											= ConROC:AbilityReady(_Sprint, timeShift);
	local gStrikeRDY										= ConROC:AbilityReady(Sub_Ability.GhostlyStrike, timeShift);
	local hemoRDY											= ConROC:AbilityReady(_Hemorrhage, timeShift);
		local hemoDEBUFF										= ConROC:TargetDebuff(_Hemorrhage, timeShift);
	local premRDY											= ConROC:AbilityReady(Sub_Ability.Premeditation, timeShift);
	local prepRDY											= ConROC:AbilityReady(Sub_Ability.Preparation, timeShift);
	local vanishRDY											= ConROC:AbilityReady(_Vanish, timeShift);
	local ripRDY											= ConROC:AbilityReady(Com_Ability.Riposte, timeShift);
	local blindRDY											= ConROC:AbilityReady(Sub_Ability.Blind, timeShift);
	
--Conditions
	local incombat 											= UnitAffectingCombat('player');
	local stealthed											= IsStealthed();
	local resting 											= IsResting();
	local mounted 											= IsMounted();
	local targetPh 											= ConROC:PercentHealth('target');	
	local toClose 											= CheckInteractDistance("target", 3);
	local hasDagger											= ConROC:Equipped('Daggers', "MAINHANDSLOT");
	local tarInMelee										= ConROC:Targets(_SinisterStrike);
	local poisonMH, _, _, _, poisonOH						= GetWeaponEnchantInfo();
	
--Indicators		
	ConROC:AbilityBurst(Com_Ability.AdrenalineRush, aRushRDY and incombat and energyPercent <= 40);
	ConROC:AbilityBurst(Ass_Ability.ColdBlood, cBloodRDY and ((stealthed and hasDagger) or combo == comboMax));	
--	ConROC:AbilityBurst(Sub_Ability.Preparation, prepRDY and incombat);
	ConROC:AbilityBurst(_Gouge, ConROC:CheckBox(ConROC_SM_Stun_Gouge) and gougeRDY and not rupDEBUFF and not garDEBUFF and incombat and ConROC:TarYou());
	ConROC:AbilityBurst(Sub_Ability.Blind, ConROC:CheckBox(ConROC_SM_Stun_Blind) and blindRDY and not rupDEBUFF and not garDEBUFF and incombat and ConROC:TarYou());
	
--Warnings	
	if ConROC:CheckBox(ConROC_SM_PoisonMH_Instant) and not poisonMH and not mounted and (not resting or stealthed) then
		UIErrorsFrame:AddMessage("Put Instant Poison on your mainhand weapon!!!", 1.0, 0.0, 0.0, 53, 5);
	end

	if ConROC:CheckBox(ConROC_SM_PoisonMH_Crippling) and not poisonMH and not mounted and (not resting or stealthed) then
		UIErrorsFrame:AddMessage("Put Crippling Poison on your mainhand weapon!!!", 1.0, 0.0, 0.0, 53, 5);
	end

	if ConROC:CheckBox(ConROC_SM_PoisonMH_Mindnumbing) and not poisonMH and not mounted and (not resting or stealthed) then
		UIErrorsFrame:AddMessage("Put Mind-numbing Poison on your mainhand weapon!!!", 1.0, 0.0, 0.0, 53, 5);
	end

	if ConROC:CheckBox(ConROC_SM_PoisonMH_Deadly) and not poisonMH and not mounted and (not resting or stealthed) then
		UIErrorsFrame:AddMessage("Put Deadly Poison on your mainhand weapon!!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
	if ConROC:CheckBox(ConROC_SM_PoisonMH_Wound) and not poisonMH and not mounted and (not resting or stealthed) then
		UIErrorsFrame:AddMessage("Put Wound Poison on your mainhand weapon!!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
	if ConROC:CheckBox(ConROC_SM_PoisonOH_Instant) and not poisonOH and not mounted and (not resting or stealthed) then
		UIErrorsFrame:AddMessage("Put Instant Poison on your offhand weapon!!!", 1.0, 0.0, 0.0, 53, 5);
	end

	if ConROC:CheckBox(ConROC_SM_PoisonOH_Crippling) and not poisonOH and not mounted and (not resting or stealthed) then
		UIErrorsFrame:AddMessage("Put Crippling Poison on your offhand weapon!!!", 1.0, 0.0, 0.0, 53, 5);
	end

	if ConROC:CheckBox(ConROC_SM_PoisonOH_Mindnumbing) and not poisonOH and not mounted and (not resting or stealthed) then
		UIErrorsFrame:AddMessage("Put Mind-numbing Poison on your offhand weapon!!!", 1.0, 0.0, 0.0, 53, 5);
	end

	if ConROC:CheckBox(ConROC_SM_PoisonOH_Deadly) and not poisonOH and not mounted and (not resting or stealthed) then
		UIErrorsFrame:AddMessage("Put Deadly Poison on your offhand weapon!!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
	if ConROC:CheckBox(ConROC_SM_PoisonOH_Wound) and not poisonOH and not mounted and (not resting or stealthed) then
		UIErrorsFrame:AddMessage("Put Wound Poison on your offhand weapon!!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
--Rotations	
	if stealthed then
		if premRDY then
			return Sub_Ability.Premeditation;
		end

		if ConROC:CheckBox(ConROC_SM_Stun_CheapShot) and cShotRDY and not cBloodBUFF then
			return Ass_Ability.CheapShot;
		end
		
		if ambushRDY and hasDagger then
			return _Ambush;
		end
		
		if ConROC:CheckBox(ConROC_SM_Debuff_Garrote) and garRDY and not garDEBUFF then
			return _Garrote;
		end

		if bStabRDY and hasDagger and not ConROC:TarYou() then
			return _Backstab;
		end
	
		if sStrikeRDY and not hasDagger then
			return _SinisterStrike;
		end
	end
	
	if ripRDY then
		return Com_Ability.Riposte;
	end

	if ConROC:CheckBox(ConROC_SM_Stun_KidneyShot) and kShotRDY and combo == comboMax then
		return _KidneyShot;
	end
	
	if ConROC:CheckBox(ConROC_SM_Debuff_SliceandDice) and sndRDY and ((combo >= 1 and not sndBUFF) or (combo == comboMax and ((sndDUR <= 10 and not aRushBUFF) or (aRushBUFF and sndDUR <= 5)))) then
		return _SliceandDice;
	end
	
	if ConROC:CheckBox(ConROC_SM_Debuff_ExposeArmor) and exArmorRDY and not exArmorDEBUFF and combo == comboMax and targetPh >= 20 then
		return _ExposeArmor;
	end
	
	if ConROC:CheckBox(ConROC_SM_Debuff_Rupture) and rupRDY and not rupDEBUFF and combo == comboMax and targetPh >= 15 then
		return _Rupture;
	end
	
	if bFlurryRDY and tarInMelee >= 2 then
		return Com_Ability.BladeFlurry;
	end
	
	if evisRDY and (combo == comboMax or (combo >= 1 and ((targetPh <= 5 and ConROC:Raidmob()) or (targetPh <= 20 and not ConROC:Raidmob())))) then
		return _Eviscerate;
	end
	
	if ConROC:CheckBox(ConROC_SM_Debuff_Hemorrhage) and hemoRDY and not hemoDEBUFF then
		return _Hemorrhage;
	end
	
	if bStabRDY and hasDagger and not ConROC:TarYou() and incombat then
		return _Backstab;
	end
	
	if gStrikeRDY and ConROC:TarYou() then
		return Sub_Ability.GhostlyStrike;
	end

	if sStrikeRDY and (not hasDagger or ConROC:TarYou()) then
		return _SinisterStrike;
	end

	return nil;
end

function ConROC.Rogue.Defense(_, timeShift, currentSpell, gcd)

--Ranks
	if IsSpellKnown(Sub_Ability.StealthRank4) then _Stealth = Sub_Ability.StealthRank4;
	elseif IsSpellKnown(Sub_Ability.StealthRank3) then _Stealth = Sub_Ability.StealthRank3;
	elseif IsSpellKnown(Sub_Ability.StealthRank2) then _Stealth = Sub_Ability.StealthRank2; end
	
--Abilities	
	local stealthRDY										= ConROC:AbilityReady(_Stealth, timeShift);
	local evasionRDY										= ConROC:AbilityReady(Com_Ability.Evasion, timeShift);
	
--Conditions	
	local ph 												= ConROC:PercentHealth('player');
	local stealthed											= IsStealthed();
	local incombat 											= UnitAffectingCombat('player');
	
--Rotations	
	if stealthRDY and not stealthed and not incombat then
		return _Stealth;
	end
	
	if evasionRDY and incombat and ConROC:TarYou() and ph <= 75 then
		return Com_Ability.Evasion;
	end	
	
	return nil;
end
