if select(2, UnitClass("player")) ~= "WARLOCK" then return end
local ConROC_Warlock, ids = ...;

--General
	ids.Racial = {
		Berserking = 26297,
		EscapeArtist = 20589,
	}
	ids.Spec = {
		Affliction = 1,
		Demonology = 2,
		Destruction = 3,
	}
	ids.Caster = {
		Shoot = 5019,
	}
--Affliction
	ids.Aff_Ability = {
		AmplifyCurse = 18288,
		CorruptionRank1 = 172,
		CorruptionRank2 = 6222,
		CorruptionRank3 = 6223,
		CorruptionRank4 = 7648,
		CorruptionRank5 = 11671,
		CorruptionRank6 = 11672,
		CurseofAgonyRank1 = 980,
		CurseofAgonyRank2 = 1014,
		CurseofAgonyRank3 = 6217,
		CurseofAgonyRank4 = 11711,
		CurseofAgonyRank5 = 11712,
		CurseofAgonyRank6 = 11713,
		CurseofDoom = 603,
		CurseofExhaustion = 18223,
		CurseofRecklessnessRank1 = 704,
		CurseofRecklessnessRank2 = 7658,
		CurseofRecklessnessRank3 = 7659,
		CurseofRecklessnessRank4 = 11717,
		CurseofShadowRank1 = 17862,
		CurseofShadowRank2 = 17937,
		CurseofTonguesRank1 = 1714,
		CurseofTonguesRank2 = 11719,
		CurseoftheElementsRank1 = 1490,
		CurseoftheElementsRank2 = 11721,
		CurseoftheElementsRank3 = 11722,
		CurseofWeaknessRank1 = 702,
		CurseofWeaknessRank2 = 1108,
		CurseofWeaknessRank3 = 6205,
		CurseofWeaknessRank4 = 7646,
		CurseofWeaknessRank5 = 11707,
		CurseofWeaknessRank6 = 11708,
		DarkPactRank1 = 18220,
		DarkPactRank2 = 18937,
		DarkPactRank3 = 18938,
		DeathCoilRank1 = 6789,
		DeathCoilRank2 = 17925,
		DeathCoilRank3 = 17926,
		DrainLifeRank1 = 689,
		DrainLifeRank2 = 699,
		DrainLifeRank3 = 709,
		DrainLifeRank4 = 7651,
		DrainLifeRank5 = 11699,
		DrainLifeRank6 = 11700,
		DrainManaRank1 = 5138,
		DrainManaRank2 = 6226,
		DrainManaRank3 = 11703,
		DrainManaRank4 = 11704,
		DrainSoulRank1 = 1120,
		DrainSoulRank2 = 8288,
		DrainSoulRank3 = 8289,
		DrainSoulRank4 = 11675,
		FearRank1 = 5782,
		FearRank2 = 6213,
		FearRank3 = 6215,
		HowlofTerrorRank1 = 5484,
		HowlofTerrorRank2 = 17928,
		LifeTapRank1 = 1454,
		LifeTapRank2 = 1455,
		LifeTapRank3 = 1456,
		LifeTapRank4 = 11687,
		LifeTapRank5 = 11688,
		LifeTapRank6 = 11689,
		SiphonLifeRank1 = 18265,
		SiphonLifeRank2 = 18879,
		SiphonLifeRank3 = 18880,
		SiphonLifeRank4 = 18881,
	}
	ids.Aff_Talent = {
		Suppression = 1,
		ImprovedCorruption = 2,
		 
		ImprovedCurseofWeakness = 3,
		ImprovedDrainSoul = 4,
		ImprovedLifeTap = 5,
		ImprovedDrainLife = 6,
		 
		ImprovedCurseofAgony = 7,
		FelConcentration = 8,
		AmplifyCurse = 9,
		 
		GrimReach = 10,
		Nightfall = 11,
		ImprovedDrainMana = 12,
		 
		SiphonLife = 13,
		CurseofExhaustion = 14,
		ImprovedCurseofExhaustion = 15,
		 
		ShadowMastery = 16,
		 
		DarkPact = 17,
	}		
--Demonology
	ids.Demo_Ability = {
		BanishRank1 = 710,
		BanishRank2 = 18647,
		CreateFirestoneLesser = 6366,
		CreateFirestone = 17951,
		CreateFirestoneGreater = 17952,
		CreateFirestoneMajor = 17953,
		CreateHealthstoneMinor = 6201,
		CreateHealthstoneLesser = 6202,
		CreateHealthstone = 5699,
		CreateHealthstoneGreater = 11729,
		CreateHealthstoneMajor = 11730,
		CreateSoulstoneMinor = 693,
		CreateSoulstoneLesser = 20752,
		CreateSoulstone = 20755,
		CreateSoulstoneGreater = 20756,
		CreateSoulstoneMajor = 20757,		
		CreateSpellstone = 2362,
		CreateSpellstoneGreater = 17727,
		CreateSpellstoneMajor = 17728,
		DemonSkinRank1 = 687, --Just Demon Armor earlier ranks.
		DemonSkinRank2 = 696,
		DemonArmorRank1 = 706,
		DemonArmorRank2 = 1086,
		DemonArmorRank3 = 11733,
		DemonArmorRank4 = 11734,
		DemonArmorRank5 = 11735,
		DemonicSacrifice = 18788,
		DetectLesserInvisibility = 132,
		DetectInvisibility = 2970,
		DetectGreaterInvisibility = 11743,
		EnslaveDemonRank1 = 1098,
		EnslaveDemonRank2 = 11725,
		EnslaveDemonRank3 = 11726,
		EyeofKilrogg = 126,
		FelDomination = 18708,
		HealthFunnelRank1 = 755,
		HealthFunnelRank2 = 3698,
		HealthFunnelRank3 = 3699,
		HealthFunnelRank4 = 3700,
		HealthFunnelRank5 = 11693,
		HealthFunnelRank6 = 11684,
		HealthFunnelRank7 = 11685,
		Inferno = 1122,
		RitualofDoom = 18540,
		RitualofSummoning = 698,
		ShadowWardRank1 = 6229,
		ShadowWardRank2 = 11739,
		ShadowWardRank3 = 11740,
		SenseDemons = 5500,
		SoulLink = 19028,
		SummonFelhunter = 691,
		SummonImp = 688,
		SummonSuccubus = 712,
		SummonVoidwalker = 697,
		UnendingBreath = 5697,
	}
	ids.Demo_Talent = {
		ImprovedHealthstone = 1,
		ImprovedImp = 2,
		DemonicEmbrace = 3,
		 
		ImprovedHealthFunnel = 4,
		ImprovedVoidwalker = 5,
		FelIntellect = 6,
		 
		ImprovedSuccubus = 7,
		FelDomination = 8,
		FelStamina = 9,
		 
		MasterSummoner = 10,
		UnholyPower = 11,
		 
		ImprovedEnslaveDemon = 12,
		DemonicSacrifice = 13,
		ImprovedFirestone = 14,
		 
		MasterDemonologist = 15,
		 
		SoulLink = 16,
		ImprovedSpellstone = 17,
	}
--Destruction
	ids.Dest_Ability = {
		ConflagrateRank1 = 17962,
		ConflagrateRank2 = 18930,
		ConflagrateRank3 = 18931,
		ConflagrateRank4 = 18932,
		HellfireRank1 = 1949,
		HellfireRank2 = 11683,
		HellfireRank3 = 11684,
		ImmolateRank1 = 348,
		ImmolateRank2 = 707,
		ImmolateRank3 = 1094,
		ImmolateRank4 = 2941,
		ImmolateRank5 = 11665,
		ImmolateRank6 = 11667,
		ImmolateRank7 = 11668,
		RainofFireRank1 = 5740,
		RainofFireRank2 = 6219,
		RainofFireRank3 = 11677,
		RainofFireRank4 = 11678,
		SearingPainRank1 = 5676,
		SearingPainRank2 = 17919,
		SearingPainRank3 = 17920,
		SearingPainRank4 = 17921,
		SearingPainRank5 = 17922,
		SearingPainRank6 = 17923,
		ShadowBoltRank1 = 686,
		ShadowBoltRank2 = 695,
		ShadowBoltRank3 = 705,
		ShadowBoltRank4 = 1088,
		ShadowBoltRank5 = 1106,
		ShadowBoltRank6 = 7641,
		ShadowBoltRank7 = 11659,
		ShadowBoltRank8 = 11660,
		ShadowBoltRank9 = 11661,
		ShadowburnRank1 = 17877,
		ShadowburnRank2 = 18867,
		ShadowburnRank3 = 18868,
		ShadowburnRank4 = 18869,
		ShadowburnRank5 = 18870,
		ShadowburnRank6 = 18871,
		SoulFireRank1 = 6353,
		SoulFireRank2 = 17924,
	}
	ids.Dest_Talent = {
		ImprovedShadowBolt = 1,
		Cataclysm = 2,
		 
		Bane = 3,
		Aftermath = 4,
		 
		ImprovedFirebolt = 5,
		ImprovedLastofPain = 6,
		Devastation = 7,
		Shadowburn = 8,
		 
		Intensity = 9,
		DestructiveReach = 10,
		ImprovedSearingPain = 11,
		 
		Pyroclasm = 12,
		ImprovedImmolate = 13,
		Ruin = 14,
		 
		Emberstorm = 15,
		 
		Conflagrate = 16,
	}
--Pet
	ids.Pet = {

	}
-- Auras
	ids.Player_Buff = {
		BurningWish = 18789,
		FelEnergy = 18792,
		FelStamina = 18790,
		ShadowTrance = 17941,
		TouchofShadow = 18791,
	}
	ids.Player_Debuff = {

	}
	ids.Target_Debuff = {
	
	}

local lastFrame = 0;
local lastDemon = 0;
local lastCurse = 0;
local lastDebuff = 0;
local lastSpell = 0;
local lastOption = 0;

local plvl = UnitLevel('player');

local defaults = {
	["ConROC_SM_Role_Caster"] = true,

	["ConROC_Caster_Demon_Imp"] = true,
	["ConROC_Caster_Curse_Weakness"] = true,
	["ConROC_Caster_Debuff_Immolate"] = true,
	["ConROC_Caster_Debuff_Corruption"] = true,
	["ConROC_Caster_Debuff_SiphonLife"] = true,
	["ConROC_Caster_Spell_ShadowBolt"] = true,
	["ConROC_Caster_Option_SoulShard"] = 5,
	["ConROC_PvP_Option_SoulShard"] = 5,
	["ConROC_Caster_Option_UseWand"] = true,
}


ConROCWarlockSpells = ConROCWarlockSpells or defaults;

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
		
	--Caster
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Role_Caster", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(nil, "ARTWORK", "GameFontRedSmall");
			radio1:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -10);
			radio1:SetChecked(ConROCWarlockSpells.ConROC_SM_Role_Caster);
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Role_Caster:SetChecked(true);
					ConROC_SM_Role_PvP:SetChecked(false);
					ConROCWarlockSpells.ConROC_SM_Role_Caster = ConROC_SM_Role_Caster:GetChecked();
					ConROCWarlockSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile()
				end
			);
			radio1text:SetText("Caster");
		local r1t = radio1.texture;
			if not r1t then
				r1t = radio1:CreateTexture('Spellmenu_radio1_Texture', 'ARTWORK');
				r1t:SetTexture('Interface\\AddOns\\ConROC\\images\\magiccircle');
				r1t:SetBlendMode('BLEND');
				local color = ConROC.db.profile.purgeOverlayColor;
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
			radio4:SetChecked(ConROCWarlockSpells.ConROC_SM_Role_PvP);
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Role_Caster:SetChecked(false);
					ConROC_SM_Role_PvP:SetChecked(true);
					ConROCWarlockSpells.ConROC_SM_Role_Caster = ConROC_SM_Role_Caster:GetChecked();
					ConROCWarlockSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
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
	ConROC:RadioHeader3();
	ConROC:CheckHeader2();
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

		local fontDemons = frame:CreateFontString("ConROC_Spellmenu_RadioHeader1", "ARTWORK", "GameFontGreenSmall");
			fontDemons:SetText("Demons");
			fontDemons:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame1_OpenButton', frame)
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
					ConROCRadioFrame1:Show();
					ConROC_RadioFrame1_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_RadioFrame1_CloseButton', frame)
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

		lastDemon = frame;
		lastFrame = frame;
		
	--Imp
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Demon_Imp", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		local r1spellName, _, r1tspell = GetSpellInfo(ids.Demo_Ability.SummonImp);
			radio1:SetPoint("TOP", ConROCRadioFrame1, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio1:SetChecked(ConROCWarlockSpells.ConROC_Caster_Demon_Imp);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCWarlockSpells.ConROC_PvP_Demon_Imp);	
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Demon_Imp:SetChecked(true);
					ConROC_SM_Demon_Voidwalker:SetChecked(false);
					ConROC_SM_Demon_Succubus:SetChecked(false);
					ConROC_SM_Demon_Felhunter:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Demon_Imp = ConROC_SM_Demon_Imp:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Voidwalker = ConROC_SM_Demon_Voidwalker:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Succubus = ConROC_SM_Demon_Succubus:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Felhunter = ConROC_SM_Demon_Felhunter:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Demon_Imp = ConROC_SM_Demon_Imp:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Voidwalker = ConROC_SM_Demon_Voidwalker:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Succubus = ConROC_SM_Demon_Succubus:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Felhunter = ConROC_SM_Demon_Felhunter:GetChecked();
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
		
		lastDemon = radio1;
		lastFrame = radio1;
		
	--Voidwalker
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Demon_Voidwalker", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
		local r2spellName, _, r2tspell = GetSpellInfo(ids.Demo_Ability.SummonVoidwalker);
			radio2:SetPoint("TOP", lastDemon, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio2:SetChecked(ConROCWarlockSpells.ConROC_Caster_Demon_Voidwalker);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCWarlockSpells.ConROC_PvP_Demon_Voidwalker);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Demon_Imp:SetChecked(false);
					ConROC_SM_Demon_Voidwalker:SetChecked(true);
					ConROC_SM_Demon_Succubus:SetChecked(false);
					ConROC_SM_Demon_Felhunter:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Demon_Imp = ConROC_SM_Demon_Imp:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Voidwalker = ConROC_SM_Demon_Voidwalker:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Succubus = ConROC_SM_Demon_Succubus:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Felhunter = ConROC_SM_Demon_Felhunter:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Demon_Imp = ConROC_SM_Demon_Imp:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Voidwalker = ConROC_SM_Demon_Voidwalker:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Succubus = ConROC_SM_Demon_Succubus:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Felhunter = ConROC_SM_Demon_Felhunter:GetChecked();
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

		lastDemon = radio2;
		lastFrame = radio2;
		
	--Succubus
		local radio3 = CreateFrame("CheckButton", "ConROC_SM_Demon_Succubus", frame, "UIRadioButtonTemplate");
		local radio3text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		local r3spellName, _, r3tspell = GetSpellInfo(ids.Demo_Ability.SummonSuccubus);
			radio3:SetPoint("TOP", lastDemon, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio3:SetChecked(ConROCWarlockSpells.ConROC_Caster_Demon_Succubus);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio3:SetChecked(ConROCWarlockSpells.ConROC_PvP_Demon_Succubus);
			end
			radio3:SetScript("OnClick", 
			  function()
					ConROC_SM_Demon_Imp:SetChecked(false);
					ConROC_SM_Demon_Voidwalker:SetChecked(false);
					ConROC_SM_Demon_Succubus:SetChecked(true);
					ConROC_SM_Demon_Felhunter:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Demon_Imp = ConROC_SM_Demon_Imp:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Voidwalker = ConROC_SM_Demon_Voidwalker:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Succubus = ConROC_SM_Demon_Succubus:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Felhunter = ConROC_SM_Demon_Felhunter:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Demon_Imp = ConROC_SM_Demon_Imp:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Voidwalker = ConROC_SM_Demon_Voidwalker:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Succubus = ConROC_SM_Demon_Succubus:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Felhunter = ConROC_SM_Demon_Felhunter:GetChecked();
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

		lastDemon = radio3;
		lastFrame = radio3;
		
	--Felhunter
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Demon_Felhunter", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");	
		local r4spellName, _, r4tspell = GetSpellInfo(ids.Demo_Ability.SummonFelhunter);
			radio4:SetPoint("TOP", lastDemon, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio4:SetChecked(ConROCWarlockSpells.ConROC_Caster_Demon_Felhunter);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio4:SetChecked(ConROCWarlockSpells.ConROC_PvP_Demon_Felhunter);
			end
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Demon_Imp:SetChecked(false);
					ConROC_SM_Demon_Voidwalker:SetChecked(false);
					ConROC_SM_Demon_Succubus:SetChecked(false);
					ConROC_SM_Demon_Felhunter:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Demon_Imp = ConROC_SM_Demon_Imp:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Voidwalker = ConROC_SM_Demon_Voidwalker:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Succubus = ConROC_SM_Demon_Succubus:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Demon_Felhunter = ConROC_SM_Demon_Felhunter:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Demon_Imp = ConROC_SM_Demon_Imp:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Voidwalker = ConROC_SM_Demon_Voidwalker:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Succubus = ConROC_SM_Demon_Succubus:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Demon_Felhunter = ConROC_SM_Demon_Felhunter:GetChecked();
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

		lastDemon = radio4;		
		lastFrame = radio4;

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

		local fontCurses = frame:CreateFontString("ConROC_Spellmenu_RadioHeader2", "ARTWORK", "GameFontGreenSmall");
			fontCurses:SetText("Curses");
			fontCurses:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame2_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontCurses, "RIGHT", 0, 0)
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
				tbutton:SetPoint("LEFT", fontCurses, "RIGHT", 0, 0)
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

		lastCurse = frame;
		lastFrame = frame;
		
	--Curse of Weakness
		local radio0 = CreateFrame("CheckButton", "ConROC_SM_Curse_Weakness", frame, "UIRadioButtonTemplate");
		local radio0text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		local r0tspellName, _, r0tspell = GetSpellInfo(ids.Aff_Ability.CurseofWeaknessRank1);
			radio0:SetPoint("TOP", ConROCRadioFrame2, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio0:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Weakness);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio0:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Weakness);	
			end
			radio0:SetScript("OnClick",
				function()
					ConROC_SM_Curse_Weakness:SetChecked(true);
					ConROC_SM_Curse_Agony:SetChecked(false);
					ConROC_SM_Curse_Recklessness:SetChecked(false);
					ConROC_SM_Curse_Tongues:SetChecked(false);
					ConROC_SM_Curse_Exhaustion:SetChecked(false);
					ConROC_SM_Curse_Elements:SetChecked(false);
					ConROC_SM_Curse_Shadow:SetChecked(false);
					ConROC_SM_Curse_Doom:SetChecked(false);
					ConROC_SM_Curse_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_None = ConROC_SM_Curse_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_None = ConROC_SM_Curse_None:GetChecked();
					end
				end
			);
			radio0text:SetText(r0tspellName);				
		local r0t = radio0.texture;
			if not r0t then
				r0t = radio0:CreateTexture('RadioFrame2_radio0_Texture', 'ARTWORK');
				r0t:SetTexture(r0tspell);
				r0t:SetBlendMode('BLEND');
				radio0.texture = r0t;
			end			
			r0t:SetScale(0.2);
			r0t:SetPoint("LEFT", radio0, "RIGHT", 8, 0);
			radio0text:SetPoint('LEFT', r0t, 'RIGHT', 5, 0);
		
		lastCurse = radio0;
		lastFrame = radio0;
		
	--Curse of Agony
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Curse_Agony", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		local r1tspellName, _, r1tspell = GetSpellInfo(ids.Aff_Ability.CurseofAgonyRank1);
			radio1:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio1:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Agony);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Agony);	
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Curse_Weakness:SetChecked(false);
					ConROC_SM_Curse_Agony:SetChecked(true);
					ConROC_SM_Curse_Recklessness:SetChecked(false);
					ConROC_SM_Curse_Tongues:SetChecked(false);
					ConROC_SM_Curse_Exhaustion:SetChecked(false);
					ConROC_SM_Curse_Elements:SetChecked(false);
					ConROC_SM_Curse_Shadow:SetChecked(false);
					ConROC_SM_Curse_Doom:SetChecked(false);
					ConROC_SM_Curse_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_None = ConROC_SM_Curse_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_None = ConROC_SM_Curse_None:GetChecked();
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
		
		lastCurse = radio1;
		lastFrame = radio1;
		
	--Curse of Recklessness
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Curse_Recklessness", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
		local r2tspellName, _, r2tspell = GetSpellInfo(ids.Aff_Ability.CurseofRecklessnessRank1);
			radio2:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio2:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Curse_Weakness:SetChecked(false);
					ConROC_SM_Curse_Agony:SetChecked(false);
					ConROC_SM_Curse_Recklessness:SetChecked(true);
					ConROC_SM_Curse_Tongues:SetChecked(false);
					ConROC_SM_Curse_Exhaustion:SetChecked(false);
					ConROC_SM_Curse_Elements:SetChecked(false);
					ConROC_SM_Curse_Shadow:SetChecked(false);
					ConROC_SM_Curse_Doom:SetChecked(false);
					ConROC_SM_Curse_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_None = ConROC_SM_Curse_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_None = ConROC_SM_Curse_None:GetChecked();
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

		lastCurse = radio2;
		lastFrame = radio2;
		
	--Curse of Tongues
		local radio3 = CreateFrame("CheckButton", "ConROC_SM_Curse_Tongues", frame, "UIRadioButtonTemplate");
		local radio3text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		local r3tspellName, _, r3tspell = GetSpellInfo(ids.Aff_Ability.CurseofTonguesRank1);
			radio3:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio3:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Tongues);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio3:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Tongues);
			end
			radio3:SetScript("OnClick", 
			  function()
					ConROC_SM_Curse_Weakness:SetChecked(false);
					ConROC_SM_Curse_Agony:SetChecked(false);
					ConROC_SM_Curse_Recklessness:SetChecked(false);
					ConROC_SM_Curse_Tongues:SetChecked(true);
					ConROC_SM_Curse_Exhaustion:SetChecked(false);
					ConROC_SM_Curse_Elements:SetChecked(false);
					ConROC_SM_Curse_Shadow:SetChecked(false);
					ConROC_SM_Curse_Doom:SetChecked(false);
					ConROC_SM_Curse_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_None = ConROC_SM_Curse_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_None = ConROC_SM_Curse_None:GetChecked();
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

		lastCurse = radio3;
		lastFrame = radio3;
		
	--Curse of Exhaustion
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Curse_Exhaustion", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");	
		local r4tspellName, _, r4tspell = GetSpellInfo(ids.Aff_Ability.CurseofExhaustion);
			radio4:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio4:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio4:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion);
			end
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Curse_Weakness:SetChecked(false);
					ConROC_SM_Curse_Agony:SetChecked(false);
					ConROC_SM_Curse_Recklessness:SetChecked(false);
					ConROC_SM_Curse_Tongues:SetChecked(false);
					ConROC_SM_Curse_Exhaustion:SetChecked(true);
					ConROC_SM_Curse_Elements:SetChecked(false);
					ConROC_SM_Curse_Shadow:SetChecked(false);
					ConROC_SM_Curse_Doom:SetChecked(false);
					ConROC_SM_Curse_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_None = ConROC_SM_Curse_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_None = ConROC_SM_Curse_None:GetChecked();
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

		lastCurse = radio4;		
		lastFrame = radio4;

	--Curse of the Elements
		local radio5 = CreateFrame("CheckButton", "ConROC_SM_Curse_Elements", frame, "UIRadioButtonTemplate");
		local radio5text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");	
		local r5tspellName, _, r5tspell = GetSpellInfo(ids.Aff_Ability.CurseoftheElementsRank1);
			radio5:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio5:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Elements);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio5:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Elements);
			end
			radio5:SetScript("OnClick", 
			  function()
					ConROC_SM_Curse_Weakness:SetChecked(false);
					ConROC_SM_Curse_Agony:SetChecked(false);
					ConROC_SM_Curse_Recklessness:SetChecked(false);
					ConROC_SM_Curse_Tongues:SetChecked(false);
					ConROC_SM_Curse_Exhaustion:SetChecked(false);
					ConROC_SM_Curse_Elements:SetChecked(true);
					ConROC_SM_Curse_Shadow:SetChecked(false);
					ConROC_SM_Curse_Doom:SetChecked(false);
					ConROC_SM_Curse_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_None = ConROC_SM_Curse_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_None = ConROC_SM_Curse_None:GetChecked();
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

		lastCurse = radio5;		
		lastFrame = radio5;

	--Curse of Shadow
		local radio6 = CreateFrame("CheckButton", "ConROC_SM_Curse_Shadow", frame, "UIRadioButtonTemplate");
		local radio6text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");	
		local r6tspellName, _, r6tspell = GetSpellInfo(ids.Aff_Ability.CurseofShadowRank1);
			radio6:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio6:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Shadow);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio6:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Shadow);
			end
			radio6:SetScript("OnClick", 
			  function()
					ConROC_SM_Curse_Weakness:SetChecked(false);
					ConROC_SM_Curse_Agony:SetChecked(false);
					ConROC_SM_Curse_Recklessness:SetChecked(false);
					ConROC_SM_Curse_Tongues:SetChecked(false);
					ConROC_SM_Curse_Exhaustion:SetChecked(false);
					ConROC_SM_Curse_Elements:SetChecked(false);
					ConROC_SM_Curse_Shadow:SetChecked(true);
					ConROC_SM_Curse_Doom:SetChecked(false);
					ConROC_SM_Curse_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_None = ConROC_SM_Curse_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_None = ConROC_SM_Curse_None:GetChecked();
					end
				end
			);
			radio6text:SetText(r6tspellName);
		local r6t = radio6.texture;

			if not r6t then
				r6t = radio6:CreateTexture('RadioFrame2_radio6_Texture', 'ARTWORK');
				r6t:SetTexture(r6tspell);
				r6t:SetBlendMode('BLEND');
				radio6.texture = r6t;
			end			
			r6t:SetScale(0.2);			
			r6t:SetPoint("LEFT", radio6, "RIGHT", 8, 0);
			radio6text:SetPoint('LEFT', r6t, 'RIGHT', 5, 0);

		lastCurse = radio6;		
		lastFrame = radio6;

	--Curse of Doom
		local radio7 = CreateFrame("CheckButton", "ConROC_SM_Curse_Doom", frame, "UIRadioButtonTemplate");
		local radio7text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");	
		local r7tspellName, _, r7tspell = GetSpellInfo(ids.Aff_Ability.CurseofDoom);
			radio7:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio7:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Doom);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio7:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Doom);
			end
			radio7:SetScript("OnClick", 
			  function()
					ConROC_SM_Curse_Weakness:SetChecked(false);
					ConROC_SM_Curse_Agony:SetChecked(false);
					ConROC_SM_Curse_Recklessness:SetChecked(false);
					ConROC_SM_Curse_Tongues:SetChecked(false);
					ConROC_SM_Curse_Exhaustion:SetChecked(false);
					ConROC_SM_Curse_Elements:SetChecked(false);
					ConROC_SM_Curse_Shadow:SetChecked(false);
					ConROC_SM_Curse_Doom:SetChecked(true);
					ConROC_SM_Curse_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_None = ConROC_SM_Curse_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_None = ConROC_SM_Curse_None:GetChecked();
					end
				end
			);
			radio7text:SetText(r7tspellName);
		local r7t = radio7.texture;

			if not r7t then
				r7t = radio7:CreateTexture('RadioFrame2_radio7_Texture', 'ARTWORK');
				r7t:SetTexture(r7tspell);
				r7t:SetBlendMode('BLEND');
				radio7.texture = r7t;
			end			
			r7t:SetScale(0.2);			
			r7t:SetPoint("LEFT", radio7, "RIGHT", 8, 0);
			radio7text:SetPoint('LEFT', r7t, 'RIGHT', 5, 0);

		lastCurse = radio7;		
		lastFrame = radio7;

	--None
		local radio8 = CreateFrame("CheckButton", "ConROC_SM_Curse_None", frame, "UIRadioButtonTemplate");
		local radio8text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			radio8:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio8:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_None);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio8:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_None);
			end
			radio8:SetScript("OnClick", 
			  function()
					ConROC_SM_Curse_Weakness:SetChecked(false);
					ConROC_SM_Curse_Agony:SetChecked(false);
					ConROC_SM_Curse_Recklessness:SetChecked(false);
					ConROC_SM_Curse_Tongues:SetChecked(false);
					ConROC_SM_Curse_Exhaustion:SetChecked(false);
					ConROC_SM_Curse_Elements:SetChecked(false);
					ConROC_SM_Curse_Shadow:SetChecked(false);
					ConROC_SM_Curse_Doom:SetChecked(false);
					ConROC_SM_Curse_None:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Curse_None = ConROC_SM_Curse_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Curse_Weakness = ConROC_SM_Curse_Weakness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Agony = ConROC_SM_Curse_Agony:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness = ConROC_SM_Curse_Recklessness:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Tongues = ConROC_SM_Curse_Tongues:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion = ConROC_SM_Curse_Exhaustion:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_theElements = ConROC_SM_Curse_Elements:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Shadow = ConROC_SM_Curse_Shadow:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_Doom = ConROC_SM_Curse_Doom:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Curse_None = ConROC_SM_Curse_None:GetChecked();
					end
				end
			);
			radio8text:SetText("None");
			radio8text:SetPoint('LEFT', radio8, 'RIGHT', 20, 0);

		lastSting = radio8;		
		lastFrame = radio8;
		
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

		local fontDemons = frame:CreateFontString("ConROC_Spellmenu_CheckHeader1", "ARTWORK", "GameFontGreenSmall");
			fontDemons:SetText("Dots");
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
		
		frame:SetPoint("TOP", "ConROCCheckHeader1", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastDebuff = frame;
		lastFrame = frame;
		
	--Immolate
		local c1tspellName, _, c1tspell = GetSpellInfo(ids.Dest_Ability.ImmolateRank1); 
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Debuff_Immolate", frame, "UICheckButtonTemplate");
		local check1text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				check1:SetChecked(ConROCWarlockSpells.ConROC_Caster_Debuff_Immolate);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCWarlockSpells.ConROC_PvP_Debuff_Immolate);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Debuff_Immolate = ConROC_SM_Debuff_Immolate:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Debuff_Immolate = ConROC_SM_Debuff_Immolate:GetChecked();
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
			
		lastDebuff = check1;
		lastFrame = check1;

	--Corruption
		local c2tspellName, _, c2tspell = GetSpellInfo(ids.Aff_Ability.CorruptionRank1); 
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Debuff_Corruption", frame, "UICheckButtonTemplate");
		local check2text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				check2:SetChecked(ConROCWarlockSpells.ConROC_Caster_Debuff_Corruption);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCWarlockSpells.ConROC_PvP_Debuff_Corruption);
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Debuff_Corruption = ConROC_SM_Debuff_Corruption:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Debuff_Corruption = ConROC_SM_Debuff_Corruption:GetChecked();
					end
				end);
			check2text:SetText(c2tspellName);				
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

	--Siphon Life
		local c3tspellName, _, c3tspell = GetSpellInfo(ids.Aff_Ability.SiphonLifeRank1); 
		local check3 = CreateFrame("CheckButton", "ConROC_SM_Debuff_SiphonLife", frame, "UICheckButtonTemplate");
		local check3text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check3:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			check3:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				check3:SetChecked(ConROCWarlockSpells.ConROC_Caster_Debuff_SiphonLife);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check3:SetChecked(ConROCWarlockSpells.ConROC_PvP_Debuff_SiphonLife);
			end
			check3:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Debuff_SiphonLife = ConROC_SM_Debuff_SiphonLife:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Debuff_SiphonLife = ConROC_SM_Debuff_SiphonLife:GetChecked();
					end
				end);
			check3text:SetText(c3tspellName);				
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

		local fontSpells = frame:CreateFontString("ConROC_Spellmenu_RadioHeader3", "ARTWORK", "GameFontGreenSmall");
			fontSpells:SetText("Fillers");
			fontSpells:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame3_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontSpells, "RIGHT", 0, 0)
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
				tbutton:SetPoint("LEFT", fontSpells, "RIGHT", 0, 0)
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

		lastSpell = frame;
		lastFrame = frame;
		
	--Shadow Bolt
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Spell_ShadowBolt", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		local r1spellName, _, r1tspell = GetSpellInfo(ids.Dest_Ability.ShadowBoltRank1);
			radio1:SetPoint("TOP", ConROCRadioFrame3, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio1:SetChecked(ConROCWarlockSpells.ConROC_Caster_Spell_ShadowBolt);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCWarlockSpells.ConROC_PvP_Spell_ShadowBolt);	
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Spell_ShadowBolt:SetChecked(true);
					ConROC_SM_Spell_SearingPain:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Spell_ShadowBolt = ConROC_SM_Spell_ShadowBolt:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Spell_SearingPain = ConROC_SM_Spell_SearingPain:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Spell_ShadowBolt = ConROC_SM_Spell_ShadowBolt:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Spell_SearingPain = ConROC_SM_Spell_SearingPain:GetChecked();
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
		
		lastSpell = radio1;
		lastFrame = radio1;
		
	--Searing Pain
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Spell_SearingPain", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
		local r2spellName, _, r2tspell = GetSpellInfo(ids.Dest_Ability.SearingPainRank1);
			radio2:SetPoint("TOP", lastSpell, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio2:SetChecked(ConROCWarlockSpells.ConROC_Caster_Spell_SearingPain);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCWarlockSpells.ConROC_PvP_Spell_SearingPain);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Spell_ShadowBolt:SetChecked(false);
					ConROC_SM_Spell_SearingPain:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Spell_ShadowBolt = ConROC_SM_Spell_ShadowBolt:GetChecked();
						ConROCWarlockSpells.ConROC_Caster_Spell_SearingPain = ConROC_SM_Spell_SearingPain:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Spell_ShadowBolt = ConROC_SM_Spell_ShadowBolt:GetChecked();
						ConROCWarlockSpells.ConROC_PvP_Spell_SearingPain = ConROC_SM_Spell_SearingPain:GetChecked();
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

		lastSpell = radio2;
		lastFrame = radio2;
		
		frame:Show()
end

function ConROC:CheckHeader2()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckHeader2", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontDemons = frame:CreateFontString("ConROC_Spellmenu_CheckHeader2", "ARTWORK", "GameFontGreenSmall");
			fontDemons:SetText("Options");
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
	
	frame:SetPoint("TOP", "ConROCCheckHeader2", "BOTTOM", 0, 0)
	frame:SetMovable(false)
	frame:EnableMouse(true)
	frame:SetClampedToScreen(true)

	lastOption = frame;
	lastFrame = frame;


	--Soul Shard Count
		local e1titemName = GetSpellInfo(23464); 
		local _, _, e1titem = GetSpellInfo(23015);
		local edit1 = CreateFrame("Frame", "ConROC_SM_Option_SoulShard_Frame", frame);
		edit1:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", tile = true, tileSize = 16, insets = {left = 0, right = 0, top = 0, bottom = 0},});
		edit1:SetBackdropColor(0, 0, 0);
		edit1:SetPoint("TOP", ConROCCheckFrame2, "BOTTOM", -75, 0);
		edit1:SetSize(15, 15);
		
		local box1 = CreateFrame("EditBox", "ConROC_SM_Option_SoulShard", edit1);	
		box1:SetPoint("TOP", 0, 0);
		box1:SetPoint("BOTTOM", 0, 0);
		box1:SetMultiLine(false);
		box1:SetFontObject(GameFontNormalSmall);
		box1:SetNumeric(true);
		box1:SetAutoFocus(false);
		box1:SetMaxLetters("2");
		box1:SetWidth(20);
		box1:SetTextInsets(3, 0, 0, 0);
		if ConROC:CheckBox(ConROC_SM_Role_Caster) then
			box1:SetNumber(ConROCWarlockSpells.ConROC_Caster_Option_SoulShard);
		elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
			box1:SetNumber(ConROCWarlockSpells.ConROC_PvP_Option_SoulShard);
		end
		box1:SetScript("OnEditFocusLost", 
			function()
				if ConROC:CheckBox(ConROC_SM_Role_Caster) then
					ConROCWarlockSpells.ConROC_Caster_Option_SoulShard = ConROC_SM_Option_SoulShard:GetNumber();
				elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
					ConROCWarlockSpells.ConROC_PvP_Option_SoulShard = ConROC_SM_Option_SoulShard:GetNumber();
				end
				box1:ClearFocus()
			end);
		box1:SetScript("OnEnterPressed", 
			function()
				if ConROC:CheckBox(ConROC_SM_Role_Caster) then
					ConROCWarlockSpells.ConROC_Caster_Option_SoulShard = ConROC_SM_Option_SoulShard:GetNumber();
				elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
					ConROCWarlockSpells.ConROC_PvP_Option_SoulShard = ConROC_SM_Option_SoulShard:GetNumber();
				end
				box1:ClearFocus()
			end);
		box1:SetScript("OnEscapePressed", 
			function()
				if ConROC:CheckBox(ConROC_SM_Role_Caster) then
					ConROCWarlockSpells.ConROC_Caster_Option_SoulShard = ConROC_SM_Option_SoulShard:GetNumber();
				elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
					ConROCWarlockSpells.ConROC_PvP_Option_SoulShard = ConROC_SM_Option_SoulShard:GetNumber();
				end
				box1:ClearFocus()
			end);				

		local e1t = edit1:CreateTexture('CheckFrame2_edit1_Texture', 'ARTWORK');
		e1t:SetTexture(e1titem);
		e1t:SetBlendMode('BLEND');
		e1t:SetScale(0.2);
		e1t:SetPoint("LEFT", edit1, "RIGHT", 20, 0);
		
		local edit1text = edit1:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");	
		edit1text:SetText(e1titemName);	
		edit1text:SetPoint('LEFT', e1t, 'RIGHT', 5, 0);
			
		lastOption = edit1;
		lastFrame = edit1;
		
	--Use Wand
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Option_UseWand", frame, "UICheckButtonTemplate");
		local check1text = check1:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", lastOption, "BOTTOM", 0, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				check1:SetChecked(ConROCWarlockSpells.ConROC_Caster_Option_UseWand);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCWarlockSpells.ConROC_PvP_Option_UseWand);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Option_UseWand = ConROC_SM_Option_UseWand:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Option_UseWand = ConROC_SM_Option_UseWand:GetChecked();
					end
				end);
			check1text:SetText("Use Wand");
			check1text:SetScale(2);
			check1text:SetPoint("LEFT", check1, "RIGHT", 20, 0);
			
		lastOption = check1;
		lastFrame = check1;

	--AoE Toggle Button
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Option_AoE", frame, "UICheckButtonTemplate");
		local check2text = check2:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", lastOption, "BOTTOM", 0, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				check2:SetChecked(ConROCWarlockSpells.ConROC_Caster_Option_AoE);
				if ConROC:CheckBox(ConROC_SM_Option_AoE) then
					ConROCButtonFrame:Show();
					if ConROC.db.profile.unlockWindow then
						ConROCToggleMover:Show();					
					else
						ConROCToggleMover:Hide();					
					end
				else
					ConROCButtonFrame:Hide();
					ConROCToggleMover:Hide();
				end
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCWarlockSpells.ConROC_PvP_Option_AoE);
				if ConROC:CheckBox(ConROC_SM_Option_AoE) then
					ConROCButtonFrame:Show();
					if ConROC.db.profile.unlockWindow then
						ConROCToggleMover:Show();					
					else
						ConROCToggleMover:Hide();					
					end					
				else
					ConROCButtonFrame:Hide();
					ConROCToggleMover:Hide();
				end
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCWarlockSpells.ConROC_Caster_Option_AoE = ConROC_SM_Option_AoE:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarlockSpells.ConROC_PvP_Option_AoE = ConROC_SM_Option_AoE:GetChecked();
					end
					if ConROC:CheckBox(ConROC_SM_Option_AoE) then
						ConROCButtonFrame:Show();
						if ConROC.db.profile.unlockWindow then
							ConROCToggleMover:Show();					
						else
							ConROCToggleMover:Hide();					
						end					
					else
						ConROCButtonFrame:Hide();
						ConROCToggleMover:Hide();
					end
				end);
			check2text:SetText("AoE Toggle Button");
			check2text:SetScale(2);			
			check2text:SetPoint("LEFT", check2, "RIGHT", 20, 0);
			
		lastOption = check2;
		lastFrame = check2;
		
		frame:Show()
end

function ConROC:SpellMenuUpdate()
	lastFrame = ConROCSpellmenuClass;
	
	if ConROCRadioHeader1 ~= nil then
		lastDemon = ConROCRadioFrame1;
		
	--Demons
		if plvl >= 2 and IsSpellKnown(ids.Demo_Ability.SummonImp) then 
			ConROC_SM_Demon_Imp:Show();
			lastDemon = ConROC_SM_Demon_Imp;
		else
			ConROC_SM_Demon_Imp:Hide();
		end

		if plvl >= 10 and IsSpellKnown(ids.Demo_Ability.SummonVoidwalker) then 
			ConROC_SM_Demon_Voidwalker:Show(); 
			ConROC_SM_Demon_Voidwalker:SetPoint("TOP", lastDemon, "BOTTOM", 0, 0);
			lastDemon = ConROC_SM_Demon_Voidwalker;
		else
			ConROC_SM_Demon_Voidwalker:Hide();
		end
		
		if plvl >= 20 and IsSpellKnown(ids.Demo_Ability.SummonSuccubus) then 
			ConROC_SM_Demon_Succubus:Show(); 
			ConROC_SM_Demon_Succubus:SetPoint("TOP", lastDemon, "BOTTOM", 0, 0);
			lastDemon = ConROC_SM_Demon_Succubus;
		else
			ConROC_SM_Demon_Succubus:Hide();
		end		
		
		if plvl >= 30 and IsSpellKnown(ids.Demo_Ability.SummonFelhunter) then
			ConROC_SM_Demon_Felhunter:Show(); 
			ConROC_SM_Demon_Felhunter:SetPoint("TOP", lastDemon, "BOTTOM", 0, 0);
			lastDemon = ConROC_SM_Demon_Felhunter;
		else
			ConROC_SM_Demon_Felhunter:Hide();
		end

		if lastDemon == ConROCRadioFrame1 then
			ConROCRadioHeader1:Hide();
			ConROCRadioFrame1:Hide();
		end
		
		if ConROCRadioFrame1:IsVisible() then
			lastFrame = lastDemon;
		else
			lastFrame = ConROCRadioHeader1;
		end
	end

	if ConROCRadioHeader2 ~= nil then
		if lastFrame == lastDemon then
			ConROCRadioHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCRadioHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastCurse = ConROCRadioFrame2;
		
	--Curses
		if plvl >= 4 and IsSpellKnown(ids.Aff_Ability.CurseofWeaknessRank1) then 
			ConROC_SM_Curse_Weakness:Show();
			lastCurse = ConROC_SM_Curse_Weakness;
		else
			ConROC_SM_Curse_Weakness:Hide();
		end

		if plvl >= 8 and IsSpellKnown(ids.Aff_Ability.CurseofAgonyRank1) then 
			ConROC_SM_Curse_Agony:Show(); 
			ConROC_SM_Curse_Agony:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			lastCurse = ConROC_SM_Curse_Agony;
		else
			ConROC_SM_Curse_Agony:Hide();
		end
		
		if plvl >= 14 and IsSpellKnown(ids.Aff_Ability.CurseofRecklessnessRank1) then 
			ConROC_SM_Curse_Recklessness:Show(); 
			ConROC_SM_Curse_Recklessness:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			lastCurse = ConROC_SM_Curse_Recklessness;
		else
			ConROC_SM_Curse_Recklessness:Hide();
		end
		
		if plvl >= 26 and IsSpellKnown(ids.Aff_Ability.CurseofTonguesRank1) then 
			ConROC_SM_Curse_Tongues:Show(); 
			ConROC_SM_Curse_Tongues:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			lastCurse = ConROC_SM_Curse_Tongues;
		else
			ConROC_SM_Curse_Tongues:Hide();
		end		
		
		if plvl >= 30 and IsSpellKnown(ids.Aff_Ability.CurseofExhaustion) then
			ConROC_SM_Curse_Exhaustion:Show(); 
			ConROC_SM_Curse_Exhaustion:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			lastCurse = ConROC_SM_Curse_Exhaustion;
		else
			ConROC_SM_Curse_Exhaustion:Hide();
		end
		
		if plvl >= 32 and IsSpellKnown(ids.Aff_Ability.CurseoftheElementsRank1) then 
			ConROC_SM_Curse_Elements:Show(); 
			ConROC_SM_Curse_Elements:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			lastCurse = ConROC_SM_Curse_Elements;
		else
			ConROC_SM_Curse_Elements:Hide();
		end
		
		if plvl >= 44 and IsSpellKnown(ids.Aff_Ability.CurseofShadowRank1) then 
			ConROC_SM_Curse_Shadow:Show(); 
			ConROC_SM_Curse_Shadow:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			lastCurse = ConROC_SM_Curse_Shadow;
		else
			ConROC_SM_Curse_Shadow:Hide();
		end		
		
		if plvl >= 60 and IsSpellKnown(ids.Aff_Ability.CurseofDoom) then
			ConROC_SM_Curse_Doom:Show(); 
			ConROC_SM_Curse_Doom:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			lastCurse = ConROC_SM_Curse_Doom;
		else
			ConROC_SM_Curse_Doom:Hide();
		end		
		
		if plvl >= 4 and IsSpellKnown(ids.Aff_Ability.CurseofWeaknessRank1) then
			ConROC_SM_Curse_None:Show(); 
			ConROC_SM_Curse_None:SetPoint("TOP", lastCurse, "BOTTOM", 0, 0);
			lastCurse = ConROC_SM_Curse_None;
		else
			ConROC_SM_Curse_None:Hide();
		end

		if lastCurse == ConROCRadioFrame2 then
			ConROCRadioHeader2:Hide();
			ConROCRadioFrame2:Hide();
		end
		
		if ConROCRadioFrame2:IsVisible() then
			lastFrame = lastCurse;
		else
			lastFrame = ConROCRadioHeader2;
		end
	end
	
	if ConROCCheckFrame1 ~= nil then
		if lastFrame == lastDemon or lastFrame == lastCurse then
			ConROCCheckHeader1:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader1:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastDebuff = ConROCCheckFrame1;
		
	--Debuff
		if plvl >= 1 and IsSpellKnown(ids.Dest_Ability.ImmolateRank1) then 
			ConROC_SM_Debuff_Immolate:Show();
			lastDebuff = ConROC_SM_Debuff_Immolate;
		else
			ConROC_SM_Debuff_Immolate:Hide();
		end
		
		if plvl >= 4 and IsSpellKnown(ids.Aff_Ability.CorruptionRank1) then 
			ConROC_SM_Debuff_Corruption:Show();
			ConROC_SM_Debuff_Corruption:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);			
			lastDebuff = ConROC_SM_Debuff_Corruption;
		else
			ConROC_SM_Debuff_Corruption:Hide();
		end

		if plvl >= 30 and IsSpellKnown(ids.Aff_Ability.SiphonLifeRank1) then 
			ConROC_SM_Debuff_SiphonLife:Show(); 
			ConROC_SM_Debuff_SiphonLife:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			lastDebuff = ConROC_SM_Debuff_SiphonLife;
		else
			ConROC_SM_Debuff_SiphonLife:Hide();
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
	
	if ConROCRadioHeader3 ~= nil then
		if lastFrame == lastDemon or lastFrame == lastCurse or lastFrame == lastDebuff then
			ConROCRadioHeader3:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCRadioHeader3:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	
		
		lastSpell = ConROCRadioFrame3;
		
	--Spells
		if plvl >= 1 and IsSpellKnown(ids.Dest_Ability.ShadowBoltRank1) then 
			ConROC_SM_Spell_ShadowBolt:Show();
			lastSpell = ConROC_SM_Spell_ShadowBolt;
		else
			ConROC_SM_Spell_ShadowBolt:Hide();
		end

		if plvl >= 18 and IsSpellKnown(ids.Dest_Ability.SearingPainRank1) then 
			ConROC_SM_Spell_SearingPain:Show(); 
			ConROC_SM_Spell_SearingPain:SetPoint("TOP", lastSpell, "BOTTOM", 0, 0);
			lastSpell = ConROC_SM_Spell_SearingPain;
		else
			ConROC_SM_Spell_SearingPain:Hide();
		end	
		
		if lastSpell == ConROCRadioFrame3 then
			ConROCRadioHeader3:Hide();
			ConROCRadioFrame3:Hide();
		end
		
		if ConROCRadioFrame3:IsVisible() then
			lastFrame = lastSpell;
		else
			lastFrame = ConROCRadioHeader3;
		end		
	end
	
	if ConROCCheckFrame2 ~= nil then
		if lastFrame == lastDemon or lastFrame == lastCurse or lastFrame == lastDebuff or lastFrame == lastSpell then
			ConROCCheckHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastOption = ConROCCheckFrame2;
		
	--Options
		if plvl >= 1 then 
			ConROC_SM_Option_SoulShard_Frame:Show();
			lastOption = ConROC_SM_Option_SoulShard_Frame;
		else
			ConROC_SM_Option_SoulShard_Frame:Hide();
		end

		if plvl >= 1 and HasWandEquipped() then
			ConROC_SM_Option_UseWand:Show();
			ConROC_SM_Option_UseWand:SetPoint("TOP", lastOption, "BOTTOM", 0, -10);
			lastOption = ConROC_SM_Option_UseWand;
		else
			ConROC_SM_Option_UseWand:Hide();
		end	
		
		if plvl >= 20 then 
			ConROC_SM_Option_AoE:Show(); 
			ConROC_SM_Option_AoE:SetPoint("TOP", lastOption, "BOTTOM", 0, 0);
			lastOption = ConROC_SM_Option_AoE;
		else
			ConROC_SM_Option_AoE:Hide();
		end

		if lastOption == ConROCCheckFrame2 then
			ConROCCheckHeader2:Hide();
			ConROCCheckFrame2:Hide();
		end
		
		if ConROCCheckFrame2:IsVisible() then
			lastFrame = lastOption;
		else
			lastFrame = ConROCCheckHeader2;
		end		
	end
end

function ConROC:RoleProfile()
	if ConROC:CheckBox(ConROC_SM_Role_Caster) then
		ConROC_SM_Demon_Imp:SetChecked(ConROCWarlockSpells.ConROC_Caster_Demon_Imp);
		ConROC_SM_Demon_Voidwalker:SetChecked(ConROCWarlockSpells.ConROC_Caster_Demon_Voidwalker);
		ConROC_SM_Demon_Succubus:SetChecked(ConROCWarlockSpells.ConROC_Caster_Demon_Succubus);
		ConROC_SM_Demon_Felhunter:SetChecked(ConROCWarlockSpells.ConROC_Caster_Demon_Felhunter);
		
		ConROC_SM_Curse_Weakness:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Weakness);
		ConROC_SM_Curse_Agony:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Agony);
		ConROC_SM_Curse_Recklessness:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Recklessness);
		ConROC_SM_Curse_Tongues:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Tongues);
		ConROC_SM_Curse_Exhaustion:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Exhaustion);
		ConROC_SM_Curse_Elements:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Elements);
		ConROC_SM_Curse_Shadow:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Shadow);
		ConROC_SM_Curse_Doom:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_Doom);
		ConROC_SM_Curse_None:SetChecked(ConROCWarlockSpells.ConROC_Caster_Curse_None);		
		
		ConROC_SM_Debuff_Immolate:SetChecked(ConROCWarlockSpells.ConROC_Caster_Debuff_Immolate);
		ConROC_SM_Debuff_Corruption:SetChecked(ConROCWarlockSpells.ConROC_Caster_Debuff_Corruption);
		ConROC_SM_Debuff_SiphonLife:SetChecked(ConROCWarlockSpells.ConROC_Caster_Debuff_SiphonLife);

		ConROC_SM_Option_SoulShard:SetNumber(ConROCWarlockSpells.ConROC_Caster_Option_SoulShard);
		ConROC_SM_Option_UseWand:SetChecked(ConROCWarlockSpells.ConROC_Caster_Option_UseWand);
		ConROC_SM_Option_AoE:SetChecked(ConROCWarlockSpells.ConROC_Caster_Option_AoE);

		if ConROC:CheckBox(ConROC_SM_Option_AoE) then
			ConROCButtonFrame:Show();
			if ConROC.db.profile.unlockWindow then
				ConROCToggleMover:Show();
			else
				ConROCToggleMover:Hide();
			end					
		else
			ConROCButtonFrame:Hide();
			ConROCToggleMover:Hide();
		end
		
	elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
		ConROC_SM_Demon_Imp:SetChecked(ConROCWarlockSpells.ConROC_PvP_Demon_Imp);
		ConROC_SM_Demon_Voidwalker:SetChecked(ConROCWarlockSpells.ConROC_PvP_Demon_Voidwalker);
		ConROC_SM_Demon_Succubus:SetChecked(ConROCWarlockSpells.ConROC_PvP_Demon_Succubus);
		ConROC_SM_Demon_Felhunter:SetChecked(ConROCWarlockSpells.ConROC_PvP_Demon_Felhunter);

		ConROC_SM_Curse_Weakness:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Weakness);
		ConROC_SM_Curse_Agony:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Agony);
		ConROC_SM_Curse_Recklessness:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Recklessness);
		ConROC_SM_Curse_Tongues:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Tongues);
		ConROC_SM_Curse_Exhaustion:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Exhaustion);
		ConROC_SM_Curse_Elements:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Elements);
		ConROC_SM_Curse_Shadow:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Shadow);
		ConROC_SM_Curse_Doom:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_Doom);
		ConROC_SM_Curse_None:SetChecked(ConROCWarlockSpells.ConROC_PvP_Curse_None);	

		ConROC_SM_Debuff_Immolate:SetChecked(ConROCWarlockSpells.ConROC_PvP_Debuff_Immolate);
		ConROC_SM_Debuff_Corruption:SetChecked(ConROCWarlockSpells.ConROC_PvP_Debuff_Corruption);
		ConROC_SM_Debuff_SiphonLife:SetChecked(ConROCWarlockSpells.ConROC_PvP_Debuff_SiphonLife);
		
		ConROC_SM_Option_SoulShard:SetNumber(ConROCWarlockSpells.ConROC_PvP_Option_SoulShard);
		ConROC_SM_Option_UseWand:SetChecked(ConROCWarlockSpells.ConROC_PvP_Option_UseWand);
		ConROC_SM_Option_AoE:SetChecked(ConROCWarlockSpells.ConROC_PvP_Option_AoE);	
		
		if ConROC:CheckBox(ConROC_SM_Option_AoE) then
			ConROCButtonFrame:Show();
			if ConROC.db.profile.unlockWindow then
				ConROCToggleMover:Show();
			else
				ConROCToggleMover:Hide();
			end					
		else
			ConROCButtonFrame:Hide();
			ConROCToggleMover:Hide();
		end
	end
end

ConROC.Warlock = {};
function ConROC:EnableRotationModule()
	self.Description = 'Warlock';
	self.NextSpell = ConROC.Warlock.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;	
	
	ConROC:SpellmenuClass();
--	ConROCSpellmenuFrame:Hide();
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Warlock.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

local Racial, Spec, Caster, Aff_Ability, Aff_Talent, Demo_Ability, Demo_Talent, Dest_Ability, Dest_Talent, Pet, Player_Buff, Player_Debuff, Target_Debuff = ids.Racial, ids.Spec, ids.Caster, ids.Aff_Ability, ids.Aff_Talent, ids.Demo_Ability, ids.Demo_Talent, ids.Dest_Ability, ids.Dest_Talent, ids.Pet, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff;

function ConROC.Warlock.Damage(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');

--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;
	local soulShards										= GetItemCount(6265);

--Ranks
	--Affliction
	local _Corruption = Aff_Ability.CorruptionRank1;
	local _CurseofAgony = Aff_Ability.CurseofAgonyRank1;
	local _CurseofRecklessness = Aff_Ability.CurseofRecklessnessRank1;
	local _CurseofShadow = Aff_Ability.CurseofShadowRank1;
	local _CurseofTongues = Aff_Ability.CurseofTonguesRank1;
	local _CurseoftheElements = Aff_Ability.CurseoftheElementsRank1;
	local _CurseofWeakness = Aff_Ability.CurseofWeaknessRank1;
	local _DarkPact = Aff_Ability.DarkPactRank1;
	local _DeathCoil = Aff_Ability.DeathCoilRank1;
	local _DrainMana = Aff_Ability.DrainManaRank1;
	local _DrainSoul = Aff_Ability.DrainSoulRank1;
	local _Fear = Aff_Ability.FearRank1;
	local _HowlofTerror = Aff_Ability.HowlofTerrorRank1;
	local _LifeTap = Aff_Ability.LifeTapRank1;
	local _SiphonLife = Aff_Ability.SiphonLifeRank1;
	
	if IsSpellKnown(Aff_Ability.CorruptionRank6) then _Corruption = Aff_Ability.CorruptionRank6;
	elseif IsSpellKnown(Aff_Ability.CorruptionRank5) then _Corruption = Aff_Ability.CorruptionRank5;
	elseif IsSpellKnown(Aff_Ability.CorruptionRank4) then _Corruption = Aff_Ability.CorruptionRank4;
	elseif IsSpellKnown(Aff_Ability.CorruptionRank3) then _Corruption = Aff_Ability.CorruptionRank3;
	elseif IsSpellKnown(Aff_Ability.CorruptionRank2) then _Corruption = Aff_Ability.CorruptionRank2; end

	if IsSpellKnown(Aff_Ability.CurseofAgonyRank6) then _CurseofAgony = Aff_Ability.CurseofAgonyRank6;
	elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank5) then _CurseofAgony = Aff_Ability.CurseofAgonyRank5;
	elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank4) then _CurseofAgony = Aff_Ability.CurseofAgonyRank4;
	elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank3) then _CurseofAgony = Aff_Ability.CurseofAgonyRank3;
	elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank2) then _CurseofAgony = Aff_Ability.CurseofAgonyRank2; end

	if IsSpellKnown(Aff_Ability.CurseofRecklessnessRank4) then _CurseofRecklessness = Aff_Ability.CurseofRecklessnessRank4;
	elseif IsSpellKnown(Aff_Ability.CurseofRecklessnessRank3) then _CurseofRecklessness = Aff_Ability.CurseofRecklessnessRank3;
	elseif IsSpellKnown(Aff_Ability.CurseofRecklessnessRank2) then _CurseofRecklessness = Aff_Ability.CurseofRecklessnessRank2; end

	if IsSpellKnown(Aff_Ability.CurseofShadowRank2) then _CurseofShadow = Aff_Ability.CurseofShadowRank2; end

	if IsSpellKnown(Aff_Ability.CurseofTonguesRank2) then _CurseofTongues = Aff_Ability.CurseofTonguesRank2; end

	if IsSpellKnown(Aff_Ability.CurseoftheElementsRank3) then _CurseoftheElements = Aff_Ability.CurseoftheElementsRank3;
	elseif IsSpellKnown(Aff_Ability.CurseoftheElementsRank2) then _CurseoftheElements = Aff_Ability.CurseoftheElementsRank2; end

	if IsSpellKnown(Aff_Ability.CurseofWeaknessRank6) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank6;
	elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank5) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank5;
	elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank4) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank4;
	elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank3) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank3;
	elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank2) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank2; end
	
	if IsSpellKnown(Aff_Ability.DarkPactRank3) then _DarkPact = Aff_Ability.DarkPactRank3;
	elseif IsSpellKnown(Aff_Ability.DarkPactRank2) then _DarkPact = Aff_Ability.DarkPactRank2; end

	if IsSpellKnown(Aff_Ability.DeathCoilRank3) then _DeathCoil = Aff_Ability.DeathCoilRank3;
	elseif IsSpellKnown(Aff_Ability.DeathCoilRank2) then _DeathCoil = Aff_Ability.DeathCoilRank2; end

	if IsSpellKnown(Aff_Ability.DrainManaRank4) then _DrainMana = Aff_Ability.DrainManaRank4;
	elseif IsSpellKnown(Aff_Ability.DrainManaRank3) then _DrainMana = Aff_Ability.DrainManaRank3;
	elseif IsSpellKnown(Aff_Ability.DrainManaRank2) then _DrainMana = Aff_Ability.DrainManaRank2; end
	
	if IsSpellKnown(Aff_Ability.DrainSoulRank4) then _DrainSoul = Aff_Ability.DrainSoulRank4;
	elseif IsSpellKnown(Aff_Ability.DrainSoulRank3) then _DrainSoul = Aff_Ability.DrainSoulRank3;
	elseif IsSpellKnown(Aff_Ability.DrainSoulRank2) then _DrainSoul = Aff_Ability.DrainSoulRank2; end	
	
	if IsSpellKnown(Aff_Ability.FearRank3) then _Fear = Aff_Ability.FearRank3;
	elseif IsSpellKnown(Aff_Ability.FearRank2) then _Fear = Aff_Ability.FearRank2; end

	if IsSpellKnown(Aff_Ability.HowlofTerrorRank2) then _HowlofTerror = Aff_Ability.HowlofTerrorRank2; end

	if IsSpellKnown(Aff_Ability.LifeTapRank6) then _LifeTap = Aff_Ability.LifeTapRank6;
	elseif IsSpellKnown(Aff_Ability.LifeTapRank5) then _LifeTap = Aff_Ability.LifeTapRank5;
	elseif IsSpellKnown(Aff_Ability.LifeTapRank4) then _LifeTap = Aff_Ability.LifeTapRank4;
	elseif IsSpellKnown(Aff_Ability.LifeTapRank3) then _LifeTap = Aff_Ability.LifeTapRank3;
	elseif IsSpellKnown(Aff_Ability.LifeTapRank2) then _LifeTap = Aff_Ability.LifeTapRank2; end

	if IsSpellKnown(Aff_Ability.SiphonLifeRank4) then _SiphonLife = Aff_Ability.SiphonLifeRank4;
	elseif IsSpellKnown(Aff_Ability.SiphonLifeRank3) then _SiphonLife = Aff_Ability.SiphonLifeRank3;
	elseif IsSpellKnown(Aff_Ability.SiphonLifeRank2) then _SiphonLife = Aff_Ability.SiphonLifeRank2; end

	--Demonology
	local _Banish = Demo_Ability.BanishRank1;
	local _CreateFirestone = Demo_Ability.CreateFirestoneLesser;
	local _CreateHealthstone = Demo_Ability.CreateHealthstoneMinor;
	local _CreateSoulstone = Demo_Ability.CreateSoulstoneMinor;	
	local _CreateSpellstone = Demo_Ability.CreateSpellstone;
	local _DetectInvisibility = Demo_Ability.DetectLesserInvisibility;
	local _EnslaveDemon = Demo_Ability.EnslaveDemonRank1;
	
	if IsSpellKnown(Demo_Ability.BanishRank2) then _Banish = Demo_Ability.BanishRank2; end

	if IsSpellKnown(Demo_Ability.CreateFirestoneMajor) then _CreateFirestone = Demo_Ability.CreateFirestoneMajor;
	elseif IsSpellKnown(Demo_Ability.CreateFirestoneGreater) then _CreateFirestone = Demo_Ability.CreateFirestoneGreater;
	elseif IsSpellKnown(Demo_Ability.CreateFirestone) then _CreateFirestone = Demo_Ability.CreateFirestone; end

	if IsSpellKnown(Demo_Ability.CreateHealthstoneMajor) then _CreateHealthstone = Demo_Ability.CreateHealthstoneMajor;
	elseif IsSpellKnown(Demo_Ability.CreateHealthstoneGreater) then _CreateHealthstone = Demo_Ability.CreateHealthstoneGreater;
	elseif IsSpellKnown(Demo_Ability.CreateHealthstone) then _CreateHealthstone = Demo_Ability.CreateHealthstone;
	elseif IsSpellKnown(Demo_Ability.CreateHealthstoneLesser) then _CreateHealthstone = Demo_Ability.CreateHealthstoneLesser; end

	if IsSpellKnown(Demo_Ability.CreateSoulstoneMajor) then _CreateSoulstone = Demo_Ability.CreateSoulstoneMajor;
	elseif IsSpellKnown(Demo_Ability.CreateSoulstoneGreater) then _CreateSoulstone = Demo_Ability.CreateSoulstoneGreater;
	elseif IsSpellKnown(Demo_Ability.CreateSoulstone) then _CreateSoulstone = Demo_Ability.CreateSoulstone;
	elseif IsSpellKnown(Demo_Ability.CreateSoulstoneLesser) then _CreateSoulstone = Demo_Ability.CreateSoulstoneLesser; end

	if IsSpellKnown(Demo_Ability.CreateSpellstoneMajor) then _CreateSpellstone = Demo_Ability.CreateSpellstoneMajor;
	elseif IsSpellKnown(Demo_Ability.CreateSpellstoneGreater) then _CreateSpellstone = Demo_Ability.CreateSpellstoneGreater; end
	
	if IsSpellKnown(Demo_Ability.DetectGreaterInvisibility) then _DetectInvisibility = Demo_Ability.DetectGreaterInvisibility;
	elseif IsSpellKnown(Demo_Ability.DetectInvisibility) then _DetectInvisibility = Demo_Ability.DetectInvisibility; end
	
	if IsSpellKnown(Demo_Ability.EnslaveDemonRank3) then _EnslaveDemon = Demo_Ability.EnslaveDemonRank3;
	elseif IsSpellKnown(Demo_Ability.EnslaveDemonRank2) then _EnslaveDemon = Demo_Ability.EnslaveDemonRank2; end

	--Destruction
	local _Conflagrate = Dest_Ability.ConflagrateRank1;
	local _Hellfire = Dest_Ability.HellfireRank1;
	local _Immolate = Dest_Ability.ImmolateRank1;
	local _RainofFire = Dest_Ability.RainofFireRank1;
	local _SearingPain = Dest_Ability.SearingPainRank1;
	local _ShadowBolt = Dest_Ability.ShadowBoltRank1;
	local _Shadowburn = Dest_Ability.ShadowburnRank1;
	local _SoulFire = Dest_Ability.SoulFireRank1;
	
	if IsSpellKnown(Dest_Ability.ConflagrateRank4) then _Conflagrate = Dest_Ability.ConflagrateRank4;
	elseif IsSpellKnown(Dest_Ability.ConflagrateRank3) then _Conflagrate = Dest_Ability.ConflagrateRank3;
	elseif IsSpellKnown(Dest_Ability.ConflagrateRank2) then _Conflagrate = Dest_Ability.ConflagrateRank2; end
	
	if IsSpellKnown(Dest_Ability.HellfireRank3) then _Hellfire = Dest_Ability.HellfireRank3;
	elseif IsSpellKnown(Dest_Ability.HellfireRank2) then _Hellfire = Dest_Ability.HellfireRank2; end
	
	if IsSpellKnown(Dest_Ability.ImmolateRank7) then _Immolate = Dest_Ability.ImmolateRank7;	
	elseif IsSpellKnown(Dest_Ability.ImmolateRank6) then _Immolate = Dest_Ability.ImmolateRank6;
	elseif IsSpellKnown(Dest_Ability.ImmolateRank5) then _Immolate = Dest_Ability.ImmolateRank5;
	elseif IsSpellKnown(Dest_Ability.ImmolateRank4) then _Immolate = Dest_Ability.ImmolateRank4;
	elseif IsSpellKnown(Dest_Ability.ImmolateRank3) then _Immolate = Dest_Ability.ImmolateRank3;
	elseif IsSpellKnown(Dest_Ability.ImmolateRank2) then _Immolate = Dest_Ability.ImmolateRank2; end	
	
	if IsSpellKnown(Dest_Ability.RainofFireRank4) then _RainofFire = Dest_Ability.RainofFireRank4;
	elseif IsSpellKnown(Dest_Ability.RainofFireRank3) then _RainofFire = Dest_Ability.RainofFireRank3;
	elseif IsSpellKnown(Dest_Ability.RainofFireRank2) then _RainofFire = Dest_Ability.RainofFireRank2; end	
	
	if IsSpellKnown(Dest_Ability.SearingPainRank6) then _SearingPain = Dest_Ability.SearingPainRank6;
	elseif IsSpellKnown(Dest_Ability.SearingPainRank5) then _SearingPain = Dest_Ability.SearingPainRank5;
	elseif IsSpellKnown(Dest_Ability.SearingPainRank4) then _SearingPain = Dest_Ability.SearingPainRank4;
	elseif IsSpellKnown(Dest_Ability.SearingPainRank3) then _SearingPain = Dest_Ability.SearingPainRank3;
	elseif IsSpellKnown(Dest_Ability.SearingPainRank2) then _SearingPain = Dest_Ability.SearingPainRank2; end
	
	if IsSpellKnown(Dest_Ability.ShadowBoltRank9) then _ShadowBolt = Dest_Ability.ShadowBoltRank9;
	elseif IsSpellKnown(Dest_Ability.ShadowBoltRank8) then _ShadowBolt = Dest_Ability.ShadowBoltRank8;
	elseif IsSpellKnown(Dest_Ability.ShadowBoltRank7) then _ShadowBolt = Dest_Ability.ShadowBoltRank7;	
	elseif IsSpellKnown(Dest_Ability.ShadowBoltRank6) then _ShadowBolt = Dest_Ability.ShadowBoltRank6;
	elseif IsSpellKnown(Dest_Ability.ShadowBoltRank5) then _ShadowBolt = Dest_Ability.ShadowBoltRank5;
	elseif IsSpellKnown(Dest_Ability.ShadowBoltRank4) then _ShadowBolt = Dest_Ability.ShadowBoltRank4;
	elseif IsSpellKnown(Dest_Ability.ShadowBoltRank3) then _ShadowBolt = Dest_Ability.ShadowBoltRank3;
	elseif IsSpellKnown(Dest_Ability.ShadowBoltRank2) then _ShadowBolt = Dest_Ability.ShadowBoltRank2; end

	if IsSpellKnown(Dest_Ability.ShadowburnRank6) then _Shadowburn = Dest_Ability.ShadowburnRank6;
	elseif IsSpellKnown(Dest_Ability.ShadowburnRank5) then _Shadowburn = Dest_Ability.ShadowburnRank5;
	elseif IsSpellKnown(Dest_Ability.ShadowburnRank4) then _Shadowburn = Dest_Ability.ShadowburnRank4;
	elseif IsSpellKnown(Dest_Ability.ShadowburnRank3) then _Shadowburn = Dest_Ability.ShadowburnRank3;
	elseif IsSpellKnown(Dest_Ability.ShadowburnRank2) then _Shadowburn = Dest_Ability.ShadowburnRank2; end

	if IsSpellKnown(Dest_Ability.SoulFireRank2) then _SoulFire = Dest_Ability.SoulFireRank2; end
	
--Abilities
	local ampCurseRDY										= ConROC:AbilityReady(Aff_Ability.AmplifyCurse, timeShift);
	local corrRDY											= ConROC:AbilityReady(_Corruption, timeShift);
		local corrDEBUFF										= ConROC:TargetDebuff(_Corruption);
	local cofaRDY											= ConROC:AbilityReady(_CurseofAgony, timeShift);
		local cofaDEBUFF										= ConROC:TargetDebuff(_CurseofAgony);
	local cofdRDY											= ConROC:AbilityReady(Aff_Ability.CurseofDoom, timeShift);
		local cofdDEBUFF										= ConROC:TargetDebuff(Aff_Ability.CurseofDoom);		
	local cofeRDY											= ConROC:AbilityReady(Aff_Ability.CurseofExhaustion, timeShift);
		local cofeDEBUFF										= ConROC:TargetDebuff(Aff_Ability.CurseofExhaustion);			
	local cofrRDY											= ConROC:AbilityReady(_CurseofRecklessness, timeShift);
		local cofrDEBUFF										= ConROC:TargetDebuff(_CurseofRecklessness);		
	local cofsRDY											= ConROC:AbilityReady(_CurseofShadow, timeShift);
		local cofsDEBUFF										= ConROC:TargetDebuff(_CurseofShadow);
	local coftRDY											= ConROC:AbilityReady(_CurseofTongues, timeShift);
		local coftDEBUFF										= ConROC:TargetDebuff(_CurseofTongues);		
	local cofteRDY											= ConROC:AbilityReady(_CurseoftheElements, timeShift);
		local cofteDEBUFF										= ConROC:TargetDebuff(_CurseoftheElements);
	local cofwRDY											= ConROC:AbilityReady(_CurseofWeakness, timeShift);
		local cofwDEBUFF										= ConROC:TargetDebuff(_CurseofWeakness);
	local dPactRDY											= ConROC:AbilityReady(_DarkPact, timeShift);
	local dCoilRDY											= ConROC:AbilityReady(_DeathCoil, timeShift);
	local dManaRDY											= ConROC:AbilityReady(_DrainMana, timeShift);
	local dSoulRDY											= ConROC:AbilityReady(_DrainSoul, timeShift);
	local fearRDY											= ConROC:AbilityReady(_Fear, timeShift);	
	local hoftRDY											= ConROC:AbilityReady(_HowlofTerror, timeShift);	
	local lTapRDY											= ConROC:AbilityReady(_LifeTap, timeShift);	
	local slifeRDY											= ConROC:AbilityReady(_SiphonLife, timeShift);
		local slifeDEBUFF										= ConROC:TargetDebuff(_SiphonLife);

	local banishRDY											= ConROC:AbilityReady(_Banish, timeShift);	
	local cFirestoneRDY										= ConROC:AbilityReady(_CreateFirestone, timeShift);	
	local cHealthstoneRDY									= ConROC:AbilityReady(_CreateHealthstone, timeShift);	
	local cSoulstoneRDY										= ConROC:AbilityReady(_CreateSoulstone, timeShift);	
	local cSpellstoneRDY									= ConROC:AbilityReady(_CreateSpellstone, timeShift);	
	local dSacRDY											= ConROC:AbilityReady(Demo_Ability.DemonicSacrifice, timeShift);
	local detInvisRDY										= ConROC:AbilityReady(_DetectInvisibility, timeShift);
	local enDemonRDY										= ConROC:AbilityReady(_EnslaveDemon, timeShift);	
	local felDomRDY											= ConROC:AbilityReady(Demo_Ability.FelDomination, timeShift);
	local sumFelhRDY										= ConROC:AbilityReady(Demo_Ability.SummonFelhunter, timeShift);
	local sumImpRDY											= ConROC:AbilityReady(Demo_Ability.SummonImp, timeShift);
	local sumSucRDY											= ConROC:AbilityReady(Demo_Ability.SummonSuccubus, timeShift);
	local sumVoidRDY										= ConROC:AbilityReady(Demo_Ability.SummonVoidwalker, timeShift);

	local confRDY											= ConROC:AbilityReady(_Conflagrate, timeShift);	
	local hfireRDY											= ConROC:AbilityReady(_Hellfire, timeShift);
	local immoRDY											= ConROC:AbilityReady(_Immolate, timeShift);
		local immoDEBUFF										= ConROC:TargetDebuff(_Immolate);
	local roffireRDY										= ConROC:AbilityReady(_RainofFire, timeShift);
	local sPainRDY											= ConROC:AbilityReady(_SearingPain, timeShift);
	local sBoltRDY											= ConROC:AbilityReady(_ShadowBolt, timeShift);
		local sTranceBUFF										= ConROC:Buff(Player_Buff.ShadowTrance, timeShift);
	local sburnRDY											= ConROC:AbilityReady(_Shadowburn, timeShift);
	local sfireRDY											= ConROC:AbilityReady(_SoulFire, timeShift);
	
--Conditions		
	local summoned 											= ConROC:CallPet();
--	local HasVoid											= IsSpellKnown(ids.Aff_PetAbility.ThreateningPresence, true);
	local assist 											= ConROC:PetAssist();
	local moving 											= ConROC:PlayerSpeed();
	local incombat 											= UnitAffectingCombat('player');
	local inmelee											= CheckInteractDistance("target", 3);
	local targetPh 											= ConROC:PercentHealth('target');	
	local playerPh 											= ConROC:PercentHealth('player');	
	local hasWand											= HasWandEquipped();
	local tarHasMana 										= UnitPower('target', Enum.PowerType.Mana);

    local dSacBUFF = {
		fe														= ConROC:Buff(Player_Buff.FelEnergy);
		bw														= ConROC:Buff(Player_Buff.BurningWish);
		tofs													= ConROC:Buff(Player_Buff.TouchofShadow);	
		fs														= ConROC:Buff(Player_Buff.FelStamina);
    }	

	local dSacUp = false;
		for k, v in pairs(dSacBUFF) do
			if v then
				dSacUp = true;
				break
			end
		end
		
--Indicators
	ConROC:AbilityBurst(_SoulFire, sfireRDY);
	ConROC:AbilityBurst(Aff_Ability.AmplifyCurse, ampCurseRDY and (ConROC:CheckBox(ConROC_SM_Curse_Weakness) or ConROC:CheckBox(ConROC_SM_Curse_Agony)));
	
--Warnings
	if not assist and summoned and incombat then
		UIErrorsFrame:AddMessage("Pet is NOT attacking!!!", 1.0, 0.0, 0.0, 53, 5);
	end

--Rotations	
	--Demons--
	if ConROC:CheckBox(ConROC_SM_Demon_Felhunter) and sumFelhRDY and not summoned and not dSacUp then
		return Demo_Ability.SummonFelhunter;
	end

	if ConROC:CheckBox(ConROC_SM_Demon_Imp) and sumImpRDY and not summoned and not dSacUp then
		return Demo_Ability.SummonImp;
	end

	if ConROC:CheckBox(ConROC_SM_Demon_Succubus) and sumSucRDY and not summoned and not dSacUp then
		return Demo_Ability.SummonSuccubus;
	end

	if ConROC:CheckBox(ConROC_SM_Demon_Voidwalker) and sumVoidRDY and not summoned and not dSacUp then
		return Demo_Ability.SummonVoidwalker;
	end
	--
	
	if sBoltRDY and sTranceBUFF then
		return _ShadowBolt;
	end
	
	if confRDY and immoDEBUFF then
		return _Conflagrate;
	end
	
	if sburnRDY and ((ConROC:Raidmob() and targetPh <= 5) or (not ConROC:Raidmob() and targetPh <= 20)) then
		return _Shadowburn;
	end
	
	if dSoulRDY and ConROC:SoulShards() < ConROC_SM_Option_SoulShard:GetNumber() and ((ConROC:Raidmob() and targetPh <= 5) or (not ConROC:Raidmob() and targetPh <= 20)) then --Soul Shard counter needed.
		return _DrainSoul;
	end
	
	if dManaRDY and tarHasMana > 0 and manaPercent < 20 then
		return _DrainMana;
	end
	
	if lTapRDY and manaPercent < 20 and playerPh >= 30 then
		return _LifeTap;
	end

	if ConROC_AoEButton:IsVisible() and hfireRDY and inMelee and playerPh >= 30 then
		return _Hellfire;
	end
	
	if ConROC_AoEButton:IsVisible() and roffireRDY then
		return _RainofFire;
	end
	
	if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and corrRDY and not corrDEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
		return _Corruption;
	end	

	--Curses
	if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and cofwRDY and not cofwDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
		return _CurseofWeakness;
	end
	
	if ConROC:CheckBox(ConROC_SM_Curse_Agony) and cofaRDY and not cofaDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
		return _CurseofAgony;
	end

	if ConROC:CheckBox(ConROC_SM_Curse_Recklessness) and cofrRDY and not cofrDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
		return _CurseofRecklessness;
	end

	if ConROC:CheckBox(ConROC_SM_Curse_Tongues) and coftRDY and not coftDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
		return _CurseofTongues;
	end

	if ConROC:CheckBox(ConROC_SM_Curse_Exhaustion) and cofeRDY and not cofeDEBUFF then 
		return Aff_Ability.CurseofExhaustion;
	end

	if ConROC:CheckBox(ConROC_SM_Curse_Elements) and cofteRDY and not cofteDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
		return _CurseoftheElements;
	end

	if ConROC:CheckBox(ConROC_SM_Curse_Shadow) and cofsRDY and not cofsDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
		return _CurseofShadow;
	end

	if ConROC:CheckBox(ConROC_SM_Curse_Doom) and cofdRDY and not cofdDEBUFF and ((ConROC:Raidmob() and targetPh >= 75) or (not ConROC:Raidmob() and targetPh == 100)) then 
		return Aff_Ability.CurseofDoom;
	end	
	--
	
	if ConROC:CheckBox(ConROC_SM_Debuff_SiphonLife) and slifeRDY and not slifeDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
		return _SiphonLife;
	end		
	
	if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and immoRDY and not immoDEBUFF and currentSpell ~= _Immolate and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
		return _Immolate;
	end

	if ConROC:CheckBox(ConROC_SM_Option_UseWand) and hasWand and (manaPercent <= 20 or targetPh <= 5) then
		return Caster.Shoot;
	end	
	
	if ConROC:CheckBox(ConROC_SM_Spell_ShadowBolt) and sBoltRDY then
		return _ShadowBolt;
	end
	
	if ConROC:CheckBox(ConROC_SM_Spell_SearingPain) and sPainRDY then
		return _SearingPain;
	end

	return nil;
end

function ConROC.Warlock.Defense(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');

--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;
	local soulShards										= GetItemCount(6265);

--Ranks
	--Affliction
	local _DrainLife = Aff_Ability.DrainLifeRank1;

	if IsSpellKnown(Aff_Ability.DrainLifeRank6) then _DrainLife = Aff_Ability.DrainLifeRank6;
	elseif IsSpellKnown(Aff_Ability.DrainLifeRank5) then _DrainLife = Aff_Ability.DrainLifeRank5;
	elseif IsSpellKnown(Aff_Ability.DrainLifeRank4) then _DrainLife = Aff_Ability.DrainLifeRank4;
	elseif IsSpellKnown(Aff_Ability.DrainLifeRank3) then _DrainLife = Aff_Ability.DrainLifeRank3;
	elseif IsSpellKnown(Aff_Ability.DrainLifeRank2) then _DrainLife = Aff_Ability.DrainLifeRank2; end	
	
	--Demonology
	local _DemonArmor = Demo_Ability.DemonSkinRank1;
	local _HealthFunnel = Demo_Ability.HealthFunnelRank1;
	local _ShadowWard = Demo_Ability.ShadowWardRank1;
	
	if IsSpellKnown(Demo_Ability.DemonArmorRank5) then _DemonArmor = Demo_Ability.DemonArmorRank5;
	elseif IsSpellKnown(Demo_Ability.DemonArmorRank4) then _DemonArmor = Demo_Ability.DemonArmorRank4;
	elseif IsSpellKnown(Demo_Ability.DemonArmorRank3) then _DemonArmor = Demo_Ability.DemonArmorRank3;
	elseif IsSpellKnown(Demo_Ability.DemonArmorRank2) then _DemonArmor = Demo_Ability.DemonArmorRank2;
	elseif IsSpellKnown(Demo_Ability.DemonArmorRank1) then _DemonArmor = Demo_Ability.DemonArmorRank1;
	elseif IsSpellKnown(Demo_Ability.DemonSkinRank2) then _DemonArmor = Demo_Ability.DemonSkinRank2; end	

	if IsSpellKnown(Demo_Ability.HealthFunnelRank7) then _HealthFunnel = Demo_Ability.HealthFunnelRank7;
	elseif IsSpellKnown(Demo_Ability.HealthFunnelRank6) then _HealthFunnel = Demo_Ability.HealthFunnelRank6;
	elseif IsSpellKnown(Demo_Ability.HealthFunnelRank5) then _HealthFunnel = Demo_Ability.HealthFunnelRank5;
	elseif IsSpellKnown(Demo_Ability.HealthFunnelRank4) then _HealthFunnel = Demo_Ability.HealthFunnelRank4;
	elseif IsSpellKnown(Demo_Ability.HealthFunnelRank3) then _HealthFunnel = Demo_Ability.HealthFunnelRank3;
	elseif IsSpellKnown(Demo_Ability.HealthFunnelRank2) then _HealthFunnel = Demo_Ability.HealthFunnelRank2; end

	if IsSpellKnown(Demo_Ability.ShadowWardRank3) then _ShadowWard = Demo_Ability.ShadowWardRank3;
	elseif IsSpellKnown(Demo_Ability.ShadowWardRank2) then _ShadowWard = Demo_Ability.ShadowWardRank2; end
	
--Abilities
	local dLifeRDY											= ConROC:AbilityReady(_DrainLife, timeShift);
	
	local dArmorRDY											= ConROC:AbilityReady(_DemonArmor, timeShift);
		local dArmorBUFF, _, dArmorDUR							= ConROC:Buff(_DemonArmor, timeShift);	
	local hFunnelRDY										= ConROC:AbilityReady(_HealthFunnel, timeShift);
	local sWardRDY											= ConROC:AbilityReady(_ShadowWard, timeShift);
		local sWardBUFF											= ConROC:Buff(_ShadowWard, timeShift);	
	local sLinkRDY											= ConROC:AbilityReady(Demo_Ability.SoulLink, timeShift);
		local sLinkBUFF											= ConROC:Buff(Demo_Ability.SoulLink, timeShift);	
		
--Conditions	
	local petPh												= ConROC:PercentHealth('pet');
	local summoned 											= ConROC:CallPet();
	local playerPh 											= ConROC:PercentHealth('player');	
	
--Rotations	
	if dArmorRDY and not dArmorBUFF then
		return _DemonArmor;
	end
	
	if sLinkRDY and not sLinkBUFF then
		return Demo_Ability.SoulLink;
	end	

	if dLifeRDY and playerPh <= 30 then
		return _DrainLife;
	end
	
	if hFunnelRDY and petPh <= 25 and playerPh >= 50 and not ConROC:TarYou() then
		return _HealthFunnel;
	end
	
	return nil;
end

function ConROC:SoulShards()
	local SoulShardItemID = 6265;
	local numShards = 0;
	for bag = 0, 5 do 
		for slot = GetContainerNumSlots(bag), 1, -1 do
			if GetContainerItemID(bag, slot) == SoulShardItemID then
				numShards = numShards + 1;
			end
		end
	end
	return numShards;
end