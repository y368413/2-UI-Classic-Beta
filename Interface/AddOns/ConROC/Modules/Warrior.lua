if select(2, UnitClass("player")) ~= "WARRIOR" then return end
local ConROC_Warrior, ids = ...;

--General
	ids.Racial = {
		Berserking = 20554,
		Perception = 20600,
	}
	ids.Spec = {
		Arms = 1,
		Fury = 2,
		Protection = 3,
	}	
	ids.Stance = {
		Battle = 1,
		Defensive = 2,
		Berserker = 3,	
	}
--Arms
	ids.Arms_Ability = {
		BattleStance = 2457,
		ChargeRank1 = 100,
		ChargeRank2 = 6178,
		ChargeRank3 = 11578,
		HamstringRank1 = 1715,
		HamstringRank2 = 7372,
		HamstringRank3 = 7373,
		HeroicStrikeRank1 = 78,
		HeroicStrikeRank2 = 284,
		HeroicStrikeRank3 = 285,
		HeroicStrikeRank4 = 1608,
		HeroicStrikeRank5 = 11564,
		HeroicStrikeRank6 = 11565,
		HeroicStrikeRank7 = 11566,
		HeroicStrikeRank8 = 11567,
		MockingBlowRank1 = 694,
		MockingBlowRank2 = 7400,
		MockingBlowRank3 = 7402,
		MockingBlowRank4 = 20559,
		MockingBlowRank5 = 20560,
		MortalStrikeRank1 = 12294,
		MortalStrikeRank2 = 21551,
		MortalStrikeRank3 = 21552,
		MortalStrikeRank4 = 21553,
		OverpowerRank1 = 7384,
		OverpowerRank2 = 7887,
		OverpowerRank3 = 11584,
		OverpowerRank4 = 11585,
		SweepingStrikes = 12292,
		RendRank1 = 772,
		RendRank2 = 6546,
		RendRank3 = 6547,
		RendRank4 = 6548,
		RendRank5 = 11572,
		RendRank6 = 11573,
		RendRank7 = 11574,
		Retaliation = 20230,
		ThunderClapRank1 = 6343,
		ThunderClapRank2 = 8198,
		ThunderClapRank3 = 8204,
		ThunderClapRank4 = 8205,
		ThunderClapRank5 = 11580,
		ThunderClapRank6 = 11581,
	}
	ids.Arms_Talent = {
		ImprovedHeroicStrike = 1,
		Defleciton = 2,
		ImprovedRend = 3,
		
		ImprovedCharge = 4,
		TacticalMastery = 5,
		ImprovedThunderClap = 6,
		
		ImprovedOverpower = 7,
		AngerManagement = 8,
		DeepWounds = 9,
		
		TwoHandedWeaponSpecialization = 10,
		Impale = 11,
		
		AxeSpecialization = 12,
		SweepingStrikes = 13,
		MaceSpecialization = 14,
		SwordSpecialization = 15,
		
		PolearmSpecialization = 16,
		ImprovedHamstring = 17,
		
		MortalStrike = 18,
	}		
--Fury
	ids.Fury_Ability = {
		BattleShoutRank1 = 6673,
		BattleShoutRank2 = 5242,
		BattleShoutRank3 = 6192,
		BattleShoutRank4 = 11549,
		BattleShoutRank5 = 11550,
		BattleShoutRank6 = 11551,
		BerserkerRage = 18499,
		BerserkerStance = 2458,
		BloodthirstRank1 = 23881,
		BloodthirstRank2 = 23892,
		BloodthirstRank3 = 23893,
		BloodthirstRank4 = 23894,
		ChallengingShout = 1161,
		CleaveRank1 = 845,
		CleaveRank2 = 7369,
		CleaveRank3 = 11608,
		CleaveRank4 = 11609,
		CleaveRank5 = 20569,
		DeathWish = 12328,
		DemoralizingShoutRank1 = 1160,
		DemoralizingShoutRank2 = 6190,
		DemoralizingShoutRank3 = 11554,
		DemoralizingShoutRank4 = 11555,
		DemoralizingShoutRank5 = 11556,
		ExecuteRank1 = 5308,
		ExecuteRank2 = 20658,
		ExecuteRank3 = 20660,
		ExecuteRank4 = 20661,
		ExecuteRank5 = 20662,
		InterceptRank1 = 20252,
		InterceptRank2 = 20616,
		InterceptRank3 = 20617,
		IntimidatingShout = 5246,
		PiercingHowl = 12323,
		PummelRank1 = 6552,
		PummelRank2 = 6554,
		Recklessness = 1719,
		SlamRank1 = 1464,
		SlamRank2 = 8820,
		SlamRank3 = 11604,
		SlamRank4 = 11605,
		Whirlwind = 1680,
	}
	ids.Fury_Talent = {
		BoomingVoice = 1,
		Cruelty = 2,
		
		ImprovedDemoralizingShout = 3,
		UnbridledWrath = 4,
		
		ImprovedCleave = 5,
		PiercingHowl = 6,
		BloodCraze = 7,
		ImprovedBattleShout = 8,
		
		DualWieldSpecialization = 9,
		ImprovedExecute = 10,
		Enrage = 11,
		
		ImprovedSlam = 12,
		DeathWish = 13,
		ImprovedIntercept = 14,
		
		ImprovedBerserkerRage = 15,
		Flurry = 16,
		
		BloodThirst = 17,
	}
--Protection
	ids.Prot_Ability = {
		Bloodrage = 2687,
		ConcussionBlow = 12809,
		DefensiveStance = 71,
		Disarm = 676,
		LastStand = 12975,
		RevengeRank1 = 6572,
		RevengeRank2 = 6574,
		RevengeRank3 = 7379,
		RevengeRank4 = 11600,
		RevengeRank5 = 11601,
		ShieldBashRank1 = 72,
		ShieldBashRank2 = 1671,
		ShieldBashRank3 = 1672,
		ShieldBlock = 2565,
		ShieldSlamRank1 = 23922,
		ShieldSlamRank2 = 23923,
		ShieldSlamRank3 = 23924,
		ShieldSlamRank4 = 23925,
		ShieldWall = 871,
		SunderArmorRank1 = 7386,
		SunderArmorRank2 = 7405,
		SunderArmorRank3 = 8380,
		SunderArmorRank4 = 11596,
		SunderArmorRank5 = 11597,
		Taunt = 355,
	}
	ids.Prot_Talent = {
		ShieldSpecialization = 1,
		Anticipation = 2,
		 
		ImprovedBloodrage = 3,
		Toughness = 4,
		IronWill = 5,
		 
		LastStand = 6,
		ImprovedShieldBlock = 7,
		ImprovedRevenge = 8,
		Defiance = 9,
		 
		ImprovedSunderArmor = 10,
		ImprovedDisarm = 11,
		ImprovedTaunt = 12,
		 
		ImprovedShieldWall = 13,
		ConcussionBlow = 14,
		ImprovedShieldBash = 15,
		 
		OneHandedWeaponSpecialization = 16,
		 
		ShieldSlam = 17,
	}
-- Auras
	ids.Player_Buff = {
	
	}
	ids.Player_Debuff = {

	}
	ids.Target_Debuff = {
	
	}

local lastFrame = 0;
local lastDebuff = 0;
local lastRage = 0;
local lastStun = 0;

local plvl = UnitLevel('player');

local defaults = {
	["ConROC_SM_Role_Melee"] = true,

	["ConROC_Melee_Shout_BattleShout"] = true,
	["ConROC_Melee_Debuff_Rend"] = true,
	["ConROC_Melee_Debuff_ThunderClap"] = true,
	["ConROC_Melee_Debuff_SunderArmor"] = true,
	["ConROC_Tank_Debuff_SunderArmorCount"] = 5,
	["ConROC_Melee_Debuff_SunderArmorCount"] = 5,
	["ConROC_PvP_Debuff_SunderArmorCount"] = 5,
	["ConROC_Melee_Shout_DemoralizingShout"] = true,
	
	["ConROC_Melee_Rage_HeroicStrike"] = true,
	["ConROC_Melee_Rage_Cleave"] = true,
	["ConROC_Melee_Rage_Slam"] = true,
		
}


ConROCWarriorSpells = ConROCWarriorSpells or defaults;

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
			radio1:SetChecked(ConROCWarriorSpells.ConROC_SM_Role_Tank);
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Role_Tank:SetChecked(true);
					ConROC_SM_Role_Melee:SetChecked(false);
					ConROC_SM_Role_PvP:SetChecked(false);
					ConROCWarriorSpells.ConROC_SM_Role_Tank = ConROC_SM_Role_Tank:GetChecked();
					ConROCWarriorSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCWarriorSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
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
			radio2:SetChecked(ConROCWarriorSpells.ConROC_SM_Role_Melee);
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Role_Tank:SetChecked(false);
					ConROC_SM_Role_Melee:SetChecked(true);
					ConROC_SM_Role_PvP:SetChecked(false);
					ConROCWarriorSpells.ConROC_SM_Role_Tank = ConROC_SM_Role_Tank:GetChecked();
					ConROCWarriorSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCWarriorSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
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

	--PvP
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Role_PvP", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(radio4, "ARTWORK", "GameFontRedSmall");
			radio4:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -15, -10);
			radio4:SetChecked(ConROCWarriorSpells.ConROC_SM_Role_PvP);
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Role_Melee:SetChecked(false);
					ConROC_SM_Role_Tank:SetChecked(false);
					ConROC_SM_Role_PvP:SetChecked(true);
					ConROCWarriorSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCWarriorSpells.ConROC_SM_Role_Tank = ConROC_SM_Role_Tank:GetChecked();
					ConROCWarriorSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
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
	
	ConROC:CheckHeader1();
	ConROC:CheckHeader2();
	ConROC:CheckHeader3();
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
			fontAuras:SetText("Shouts and Debuffs");
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

		lastDebuff = frame;
		lastFrame = frame;
		
	--Battle Shout
		local c1tspellName, _, c1tspell = GetSpellInfo(ids.Fury_Ability.BattleShoutRank1);
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Shout_BattleShout", frame, "UICheckButtonTemplate");
		local check1text = frame:CreateFontString(check1, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check1:SetChecked(ConROCWarriorSpells.ConROC_Tank_Shout_BattleShout);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check1:SetChecked(ConROCWarriorSpells.ConROC_Melee_Shout_BattleShout);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCWarriorSpells.ConROC_PvP_Shout_BattleShout);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCWarriorSpells.ConROC_Tank_Shout_BattleShout = ConROC_SM_Shout_BattleShout:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCWarriorSpells.ConROC_Melee_Shout_BattleShout = ConROC_SM_Shout_BattleShout:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarriorSpells.ConROC_PvP_Shout_BattleShout = ConROC_SM_Shout_BattleShout:GetChecked();
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

	--Rend
		local c2tspellName, _, c2tspell = GetSpellInfo(ids.Arms_Ability.RendRank1);
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Debuff_Rend", frame, "UICheckButtonTemplate");
		local check2text = frame:CreateFontString(check2, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check2:SetChecked(ConROCWarriorSpells.ConROC_Tank_Debuff_Rend);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check2:SetChecked(ConROCWarriorSpells.ConROC_Melee_Debuff_Rend);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCWarriorSpells.ConROC_PvP_Debuff_Rend);
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCWarriorSpells.ConROC_Tank_Debuff_Rend = ConROC_SM_Debuff_Rend:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCWarriorSpells.ConROC_Melee_Debuff_Rend = ConROC_SM_Debuff_Rend:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarriorSpells.ConROC_PvP_Debuff_Rend = ConROC_SM_Debuff_Rend:GetChecked();
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
		
	--Thunder Clap
		local c3tspellName, _, c3tspell = GetSpellInfo(ids.Arms_Ability.ThunderClapRank1);
		local check3 = CreateFrame("CheckButton", "ConROC_SM_Debuff_ThunderClap", frame, "UICheckButtonTemplate");
		local check3text = frame:CreateFontString(check3, "ARTWORK", "GameFontHighlightSmall");		
			check3:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
			check3:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check3:SetChecked(ConROCWarriorSpells.ConROC_Tank_Debuff_ThunderClap);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check3:SetChecked(ConROCWarriorSpells.ConROC_Melee_Debuff_ThunderClap);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check3:SetChecked(ConROCWarriorSpells.ConROC_PvP_Debuff_ThunderClap);
			end
			check3:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCWarriorSpells.ConROC_Tank_Debuff_ThunderClap = ConROC_SM_Debuff_ThunderClap:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCWarriorSpells.ConROC_Melee_Debuff_ThunderClap = ConROC_SM_Debuff_ThunderClap:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarriorSpells.ConROC_PvP_Debuff_ThunderClap = ConROC_SM_Debuff_ThunderClap:GetChecked();
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

	--Sunder Armor
		local c4tspellName, _, c4tspell = GetSpellInfo(ids.Prot_Ability.SunderArmorRank1);
		local check4 = CreateFrame("CheckButton", "ConROC_SM_Debuff_SunderArmor", frame, "UICheckButtonTemplate");
		check4:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
		check4:SetScale(.50);	
		
		if ConROC:CheckBox(ConROC_SM_Role_Tank) then
			check4:SetChecked(ConROCWarriorSpells.ConROC_Tank_Debuff_SunderArmor);
		elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
			check4:SetChecked(ConROCWarriorSpells.ConROC_Melee_Debuff_SunderArmor);
		elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
			check4:SetChecked(ConROCWarriorSpells.ConROC_PvP_Debuff_SunderArmor);
		end
		
		check4:SetScript("OnClick", 
			function()
				if ConROC:CheckBox(ConROC_SM_Role_Tank) then
					ConROCWarriorSpells.ConROC_Tank_Debuff_SunderArmor = ConROC_SM_Debuff_SunderArmor:GetChecked();
				elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
					ConROCWarriorSpells.ConROC_Melee_Debuff_SunderArmor = ConROC_SM_Debuff_SunderArmor:GetChecked();
				elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
					ConROCWarriorSpells.ConROC_PvP_Debuff_SunderArmor = ConROC_SM_Debuff_SunderArmor:GetChecked();
				end
			end);
		
		local c4t = check4:CreateTexture('CheckFrame1_check4_Texture', 'ARTWORK');
		c4t:SetTexture(c4tspell);
		c4t:SetBlendMode('BLEND');
		c4t:SetScale(0.4);
		c4t:SetPoint("LEFT", check4, "RIGHT", 8, 0);

		local check4text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		check4text:SetText(c4tspellName);
		check4text:SetPoint('LEFT', c4t, 'RIGHT', 5, 0);

	--Sunder Armor Count
		local edit1 = CreateFrame("Frame", "ConROC_SM_Debuff_SunderArmorCount_Frame", frame);
		edit1:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", tile = true, tileSize = 16, insets = {left = 0, right = 0, top = 0, bottom = 0},});
		edit1:SetBackdropColor(0, 0, 0);
		edit1:SetPoint("LEFT", check4text, "RIGHT", 8, 0);
		edit1:SetSize(15, 15);
		
		local box1 = CreateFrame("EditBox", "ConROC_SM_Debuff_SunderArmorCount", edit1);	
		box1:SetPoint("TOP", 0, 0);
		box1:SetPoint("BOTTOM", 0, 0);
		box1:SetMultiLine(false);
		box1:SetFontObject(GameFontNormalSmall);
		box1:SetNumeric(true);
		box1:SetAutoFocus(false);
		box1:SetMaxLetters("1");
		box1:SetWidth(20);
		box1:SetTextInsets(3, 0, 0, 0);	
		
		if ConROC:CheckBox(ConROC_SM_Role_Tank) then
			box1:SetNumber(ConROCWarriorSpells.ConROC_Tank_Debuff_SunderArmorCount or 5);
		elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
			box1:SetNumber(ConROCWarriorSpells.ConROC_Melee_Debuff_SunderArmorCount or 5);
		elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
			box1:SetNumber(ConROCWarriorSpells.ConROC_PvP_Debuff_SunderArmorCount or 5);
		end		

		box1:SetScript("OnEditFocusLost", 
			function()
				if ConROC:CheckBox(ConROC_SM_Role_Tank) then
					ConROCWarriorSpells.ConROC_Tank_Debuff_SunderArmorCount = ConROC_SM_Debuff_SunderArmorCount:GetNumber();
				elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
					ConROCWarriorSpells.ConROC_Melee_Debuff_SunderArmorCount = ConROC_SM_Debuff_SunderArmorCount:GetNumber();
				elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
					ConROCWarriorSpells.ConROC_PvP_Debuff_SunderArmorCount = ConROC_SM_Debuff_SunderArmorCount:GetNumber();
				end
				box1:ClearFocus()
			end);
		box1:SetScript("OnEnterPressed", 
			function()
				if ConROC:CheckBox(ConROC_SM_Role_Tank) then
					ConROCWarriorSpells.ConROC_Tank_Debuff_SunderArmorCount = ConROC_SM_Debuff_SunderArmorCount:GetNumber();
				elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
					ConROCWarriorSpells.ConROC_Melee_Debuff_SunderArmorCount = ConROC_SM_Debuff_SunderArmorCount:GetNumber();
				elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
					ConROCWarriorSpells.ConROC_PvP_Debuff_SunderArmorCount = ConROC_SM_Debuff_SunderArmorCount:GetNumber();
				end
				box1:ClearFocus()
			end);
		box1:SetScript("OnEscapePressed", 
			function()
				if ConROC:CheckBox(ConROC_SM_Role_Tank) then
					ConROCWarriorSpells.ConROC_Tank_Debuff_SunderArmorCount = ConROC_SM_Debuff_SunderArmorCount:GetNumber();
				elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
					ConROCWarriorSpells.ConROC_Melee_Debuff_SunderArmorCount = ConROC_SM_Debuff_SunderArmorCount:GetNumber();
				elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
					ConROCWarriorSpells.ConROC_PvP_Debuff_SunderArmorCount = ConROC_SM_Debuff_SunderArmorCount:GetNumber();
				end
				box1:ClearFocus()
			end);

		lastDebuff = check4;
		lastFrame = check4;			
		
	--Demoralizing Shout
		local c5tspellName, _, c5tspell = GetSpellInfo(ids.Fury_Ability.DemoralizingShoutRank1);
		local check5 = CreateFrame("CheckButton", "ConROC_SM_Shout_DemoralizingShout", frame, "UICheckButtonTemplate");
		local check5text = frame:CreateFontString(check5, "ARTWORK", "GameFontHighlightSmall");		
			check5:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
			check5:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check5:SetChecked(ConROCWarriorSpells.ConROC_Tank_Shout_DemoralizingShout);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check5:SetChecked(ConROCWarriorSpells.ConROC_Melee_Shout_DemoralizingShout);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check5:SetChecked(ConROCWarriorSpells.ConROC_PvP_Shout_DemoralizingShout);
			end
			check5:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCWarriorSpells.ConROC_Tank_Shout_DemoralizingShout = ConROC_SM_Shout_DemoralizingShout:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCWarriorSpells.ConROC_Melee_Shout_DemoralizingShout = ConROC_SM_Shout_DemoralizingShout:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarriorSpells.ConROC_PvP_Shout_DemoralizingShout = ConROC_SM_Shout_DemoralizingShout:GetChecked();
					end
				end);
			check5text:SetText(c5tspellName);
		local c5t = check5.texture;
		 
			if not c5t then
				c5t = check5:CreateTexture('CheckFrame1_check5_Texture', 'ARTWORK');
				c5t:SetTexture(c5tspell);
				c5t:SetBlendMode('BLEND');
				check5.texture = c5t;
			end			
			c5t:SetScale(0.4);
			c5t:SetPoint("LEFT", check5, "RIGHT", 8, 0);
			check5text:SetPoint('LEFT', c5t, 'RIGHT', 5, 0);
			
		lastDebuff = check5;
		lastFrame = check5;
		
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

		local fontAuras = frame:CreateFontString("ConROC_Spellmenu_CheckHeader2", "ARTWORK", "GameFontGreenSmall");
			fontAuras:SetText("Rage Dump");
			fontAuras:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_CheckFrame2_OpenButton', frame)
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
					ConROCCheckFrame2:Show();
					ConROC_CheckFrame2_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_CheckFrame2_CloseButton', frame)
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

		lastRage = frame;
		lastFrame = frame;
		
	--Heroic Strike
		local c1tspellName, _, c1tspell = GetSpellInfo(ids.Arms_Ability.HeroicStrikeRank1);
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Rage_HeroicStrike", frame, "UICheckButtonTemplate");
		local check1text = frame:CreateFontString(check1, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", ConROCCheckFrame2, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check1:SetChecked(ConROCWarriorSpells.ConROC_Tank_Rage_HeroicStrike);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check1:SetChecked(ConROCWarriorSpells.ConROC_Melee_Rage_HeroicStrike);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCWarriorSpells.ConROC_PvP_Rage_HeroicStrike);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCWarriorSpells.ConROC_Tank_Rage_HeroicStrike = ConROC_SM_Rage_HeroicStrike:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCWarriorSpells.ConROC_Melee_Rage_HeroicStrike = ConROC_SM_Rage_HeroicStrike:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarriorSpells.ConROC_PvP_Rage_HeroicStrike = ConROC_SM_Rage_HeroicStrike:GetChecked();
					end
				end);
			check1text:SetText(c1tspellName);				
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
			
		lastRage = check1;
		lastFrame = check1;

	--Cleave
		local c2tspellName, _, c2tspell = GetSpellInfo(ids.Fury_Ability.CleaveRank1);
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Rage_Cleave", frame, "UICheckButtonTemplate");
		local check2text = frame:CreateFontString(check2, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", ConROCCheckFrame2, "BOTTOM", -150, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check2:SetChecked(ConROCWarriorSpells.ConROC_Tank_Rage_Cleave);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check2:SetChecked(ConROCWarriorSpells.ConROC_Melee_Rage_Cleave);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCWarriorSpells.ConROC_PvP_Rage_Cleave);
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCWarriorSpells.ConROC_Tank_Rage_Cleave = ConROC_SM_Rage_Cleave:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCWarriorSpells.ConROC_Melee_Rage_Cleave = ConROC_SM_Rage_Cleave:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarriorSpells.ConROC_PvP_Rage_Cleave = ConROC_SM_Rage_Cleave:GetChecked();
					end
				end);
			check2text:SetText(c2tspellName);				
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
			
		lastRage = check2;
		lastFrame = check2;
		
	--Slam
		local c3tspellName, _, c3tspell = GetSpellInfo(ids.Fury_Ability.SlamRank1);
		local check3 = CreateFrame("CheckButton", "ConROC_SM_Rage_Slam", frame, "UICheckButtonTemplate");
		local check3text = frame:CreateFontString(check3, "ARTWORK", "GameFontHighlightSmall");		
			check3:SetPoint("TOP", ConROCCheckFrame2, "BOTTOM", -150, 0);
			check3:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check3:SetChecked(ConROCWarriorSpells.ConROC_Tank_Rage_Slam);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check3:SetChecked(ConROCWarriorSpells.ConROC_Melee_Rage_Slam);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check3:SetChecked(ConROCWarriorSpells.ConROC_PvP_Rage_Slam);
			end
			check3:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCWarriorSpells.ConROC_Tank_Rage_Slam = ConROC_SM_Rage_Slam:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCWarriorSpells.ConROC_Melee_Rage_Slam = ConROC_SM_Rage_Slam:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarriorSpells.ConROC_PvP_Rage_Slam = ConROC_SM_Rage_Slam:GetChecked();
					end
				end);
			check3text:SetText(c3tspellName);				
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
			
		lastRage = check3;
		lastFrame = check3;
		
		frame:Show()
end

function ConROC:CheckHeader3()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckHeader3", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontAuras = frame:CreateFontString("ConROC_Spellmenu_CheckHeader3", "ARTWORK", "GameFontGreenSmall");
			fontAuras:SetText("Stuns and Slows");
			fontAuras:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_CheckFrame3_OpenButton', frame)
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
					ConROCCheckFrame3:Show();
					ConROC_CheckFrame3_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_CheckFrame3_CloseButton', frame)
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
					ConROCCheckFrame3:Hide();
					ConROC_CheckFrame3_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:CheckFrame3();
end

function ConROC:CheckFrame3()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckFrame3", ConROCCheckHeader3)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 5)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCCheckHeader3", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastStun = frame;
		lastFrame = frame;
		
	--Hamstring
		local c1tspellName, _, c1tspell = GetSpellInfo(ids.Arms_Ability.HamstringRank1);
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Stun_Hamstring", frame, "UICheckButtonTemplate");
		local check1text = frame:CreateFontString(check1, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", ConROCCheckFrame3, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check1:SetChecked(ConROCWarriorSpells.ConROC_Tank_Stun_Hamstring);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check1:SetChecked(ConROCWarriorSpells.ConROC_Melee_Stun_Hamstring);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCWarriorSpells.ConROC_PvP_Stun_Hamstring);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCWarriorSpells.ConROC_Tank_Stun_Hamstring = ConROC_SM_Stun_Hamstring:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCWarriorSpells.ConROC_Melee_Stun_Hamstring = ConROC_SM_Stun_Hamstring:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarriorSpells.ConROC_PvP_Stun_Hamstring = ConROC_SM_Stun_Hamstring:GetChecked();
					end
				end);
			check1text:SetText(c1tspellName);				
		local c1t = check1.texture;
		 
			if not c1t then
				c1t = check1:CreateTexture('CheckFrame3_check1_Texture', 'ARTWORK');
				c1t:SetTexture(c1tspell);
				c1t:SetBlendMode('BLEND');
				check1.texture = c1t;
			end			
			c1t:SetScale(0.4);
			c1t:SetPoint("LEFT", check1, "RIGHT", 8, 0);
			check1text:SetPoint('LEFT', c1t, 'RIGHT', 5, 0);
			
		lastStun = check1;
		lastFrame = check1;

	--Piercing Howl
		local c2tspellName, _, c2tspell = GetSpellInfo(ids.Fury_Ability.PiercingHowl);
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Stun_PiercingHowl", frame, "UICheckButtonTemplate");
		local check2text = frame:CreateFontString(check2, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", ConROCCheckFrame3, "BOTTOM", -150, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check2:SetChecked(ConROCWarriorSpells.ConROC_Tank_Stun_PiercingHowl);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check2:SetChecked(ConROCWarriorSpells.ConROC_Melee_Stun_PiercingHowl);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCWarriorSpells.ConROC_PvP_Stun_PiercingHowl);
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCWarriorSpells.ConROC_Tank_Stun_PiercingHowl = ConROC_SM_Stun_PiercingHowl:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCWarriorSpells.ConROC_Melee_Stun_PiercingHowl = ConROC_SM_Stun_PiercingHowl:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarriorSpells.ConROC_PvP_Stun_PiercingHowl = ConROC_SM_Stun_PiercingHowl:GetChecked();
					end
				end);
			check2text:SetText(c2tspellName);				
		local c2t = check2.texture;
		 
			if not c2t then
				c2t = check2:CreateTexture('CheckFrame3_check2_Texture', 'ARTWORK');
				c2t:SetTexture(c2tspell);
				c2t:SetBlendMode('BLEND');
				check2.texture = c2t;
			end			
			c2t:SetScale(0.4);
			c2t:SetPoint("LEFT", check2, "RIGHT", 8, 0);
			check2text:SetPoint('LEFT', c2t, 'RIGHT', 5, 0);
			
		lastStun = check2;
		lastFrame = check2;
		
	--Concussion Blow
		local c3tspellName, _, c3tspell = GetSpellInfo(ids.Prot_Ability.ConcussionBlow);
		local check3 = CreateFrame("CheckButton", "ConROC_SM_Stun_ConcussionBlow", frame, "UICheckButtonTemplate");
		local check3text = frame:CreateFontString(check3, "ARTWORK", "GameFontHighlightSmall");		
			check3:SetPoint("TOP", ConROCCheckFrame3, "BOTTOM", -150, 0);
			check3:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Tank) then
				check3:SetChecked(ConROCWarriorSpells.ConROC_Tank_Stun_ConcussionBlow);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check3:SetChecked(ConROCWarriorSpells.ConROC_Melee_Stun_ConcussionBlow);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check3:SetChecked(ConROCWarriorSpells.ConROC_PvP_Stun_ConcussionBlow);
			end
			check3:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Tank) then
						ConROCWarriorSpells.ConROC_Tank_Stun_ConcussionBlow = ConROC_SM_Stun_ConcussionBlow:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCWarriorSpells.ConROC_Melee_Stun_ConcussionBlow = ConROC_SM_Stun_ConcussionBlow:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCWarriorSpells.ConROC_PvP_Stun_ConcussionBlow = ConROC_SM_Stun_ConcussionBlow:GetChecked();
					end
				end);
			check3text:SetText(c3tspellName);				
		local c3t = check3.texture;
		 
			if not c3t then
				c3t = check3:CreateTexture('CheckFrame3_check3_Texture', 'ARTWORK');
				c3t:SetTexture(c3tspell);
				c3t:SetBlendMode('BLEND');
				check3.texture = c3t;
			end			
			c3t:SetScale(0.4);
			c3t:SetPoint("LEFT", check3, "RIGHT", 8, 0);
			check3text:SetPoint('LEFT', c3t, 'RIGHT', 5, 0);
			
		lastStun = check3;
		lastFrame = check3;
		
		frame:Show()
end

function ConROC:SpellMenuUpdate()
lastFrame = ConROCSpellmenuClass;

	--Shouts and Debuffs	
	if ConROCCheckFrame1 ~= nil then
		lastBuff = ConROCCheckFrame1;
		
		if plvl >= 1 then 
			ConROC_SM_Shout_BattleShout:Show();
			lastDebuff = ConROC_SM_Shout_BattleShout;
		else
			ConROC_SM_Shout_BattleShout:Hide();
		end	

		if plvl >= 4 then 
			ConROC_SM_Debuff_Rend:Show(); 
			ConROC_SM_Debuff_Rend:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			lastDebuff = ConROC_SM_Debuff_Rend;
		else
			ConROC_SM_Debuff_Rend:Hide();
		end	

		if plvl >= 6 then 
			ConROC_SM_Debuff_ThunderClap:Show(); 
			ConROC_SM_Debuff_ThunderClap:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			lastDebuff = ConROC_SM_Debuff_ThunderClap;
		else
			ConROC_SM_Debuff_ThunderClap:Hide();
		end	

		if plvl >= 10 then 
			ConROC_SM_Debuff_SunderArmor:Show(); 
			ConROC_SM_Debuff_SunderArmor:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			lastDebuff = ConROC_SM_Debuff_SunderArmor;
		else
			ConROC_SM_Debuff_SunderArmor:Hide();
		end	

		if plvl >= 14 then 
			ConROC_SM_Shout_DemoralizingShout:Show(); 
			ConROC_SM_Shout_DemoralizingShout:SetPoint("TOP", lastDebuff, "BOTTOM", 0, 0);
			lastDebuff = ConROC_SM_Shout_DemoralizingShout;
		else
			ConROC_SM_Shout_DemoralizingShout:Hide();
		end
		
		if ConROCCheckFrame1:IsVisible() then
			lastFrame = lastDebuff;
		else
			lastFrame = ConROCCheckHeader1;
		end	
	end
	
	--Rage Dump
	if ConROCCheckFrame2 ~= nil then
		if lastFrame == lastDebuff then
			ConROCCheckHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastRage = ConROCCheckFrame2;
		
		if plvl >= 1 then 
			ConROC_SM_Rage_HeroicStrike:Show();
			lastRage = ConROC_SM_Rage_HeroicStrike;
		else
			ConROC_SM_Rage_HeroicStrike:Hide();
		end	
		
		if plvl >= 20 then 
			ConROC_SM_Rage_Cleave:Show(); 
			ConROC_SM_Rage_Cleave:SetPoint("TOP", lastRage, "BOTTOM", 0, 0);
			lastRage = ConROC_SM_Rage_Cleave;
		else
			ConROC_SM_Rage_Cleave:Hide();
		end		
		
		if plvl >= 30 then 
			ConROC_SM_Rage_Slam:Show(); 
			ConROC_SM_Rage_Slam:SetPoint("TOP", lastRage, "BOTTOM", 0, 0);
			lastRage = ConROC_SM_Rage_Slam;
		else
			ConROC_SM_Rage_Slam:Hide();
		end

		if ConROCCheckFrame2:IsVisible() then
			lastFrame = lastRage;
		else
			lastFrame = ConROCCheckHeader2;
		end	
	end

	--Stuns and Slows	
	if ConROCCheckFrame3 ~= nil then
		if lastFrame == lastDebuff or lastFrame == lastRage then
			ConROCCheckHeader3:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader3:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastStun = ConROCCheckFrame3;
		
		if plvl >= 8 then 
			ConROC_SM_Stun_Hamstring:Show();
			lastStun = ConROC_SM_Stun_Hamstring;
		else
			ConROC_SM_Stun_Hamstring:Hide();
		end	
		
		if plvl >= 20 and IsSpellKnown(ids.Fury_Ability.PiercingHowl) then 
			ConROC_SM_Stun_PiercingHowl:Show(); 
			ConROC_SM_Stun_PiercingHowl:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			lastStun = ConROC_SM_Stun_PiercingHowl;
		else
			ConROC_SM_Stun_PiercingHowl:Hide();
		end		
		
		if plvl >= 30 and IsSpellKnown(ids.Prot_Ability.ConcussionBlow) then 
			ConROC_SM_Stun_ConcussionBlow:Show(); 
			ConROC_SM_Stun_ConcussionBlow:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			lastStun = ConROC_SM_Stun_ConcussionBlow;
		else
			ConROC_SM_Stun_ConcussionBlow:Hide();
		end

		if ConROCCheckFrame3:IsVisible() then
			lastFrame = lastStun;
		else
			lastFrame = ConROCCheckHeader3;
		end	
	end
end

function ConROC:RoleProfile()
	if ConROC:CheckBox(ConROC_SM_Role_Tank) then
		ConROC_SM_Shout_BattleShout:SetChecked(ConROCWarriorSpells.ConROC_Tank_Shout_BattleShout);
		ConROC_SM_Debuff_Rend:SetChecked(ConROCWarriorSpells.ConROC_Tank_Debuff_Rend);
		ConROC_SM_Debuff_ThunderClap:SetChecked(ConROCWarriorSpells.ConROC_Tank_Debuff_ThunderClap);
		ConROC_SM_Debuff_SunderArmor:SetChecked(ConROCWarriorSpells.ConROC_Tank_Debuff_SunderArmor);
		ConROC_SM_Debuff_SunderArmorCount:SetNumber(ConROCWarriorSpells.ConROC_Tank_Debuff_SunderArmorCount or 5);
		ConROC_SM_Shout_DemoralizingShout:SetChecked(ConROCWarriorSpells.ConROC_Tank_Shout_DemoralizingShout);
		
		ConROC_SM_Rage_HeroicStrike:SetChecked(ConROCWarriorSpells.ConROC_Tank_Rage_HeroicStrike);
		ConROC_SM_Rage_Cleave:SetChecked(ConROCWarriorSpells.ConROC_Tank_Rage_Cleave);
		ConROC_SM_Rage_Slam:SetChecked(ConROCWarriorSpells.ConROC_Tank_Rage_Slam);
		
		ConROC_SM_Stun_Hamstring:SetChecked(ConROCWarriorSpells.ConROC_Tank_Stun_Hamstring);
		ConROC_SM_Stun_PiercingHowl:SetChecked(ConROCWarriorSpells.ConROC_Tank_Stun_PiercingHowl);
		ConROC_SM_Stun_ConcussionBlow:SetChecked(ConROCWarriorSpells.ConROC_Tank_Stun_ConcussionBlow);
		
	elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
		ConROC_SM_Shout_BattleShout:SetChecked(ConROCWarriorSpells.ConROC_Melee_Shout_BattleShout);
		ConROC_SM_Debuff_Rend:SetChecked(ConROCWarriorSpells.ConROC_Melee_Debuff_Rend);
		ConROC_SM_Debuff_ThunderClap:SetChecked(ConROCWarriorSpells.ConROC_Melee_Debuff_ThunderClap);
		ConROC_SM_Debuff_SunderArmor:SetChecked(ConROCWarriorSpells.ConROC_Melee_Debuff_SunderArmor);
		ConROC_SM_Debuff_SunderArmorCount:SetNumber(ConROCWarriorSpells.ConROC_Melee_Debuff_SunderArmorCount or 5);
		ConROC_SM_Shout_DemoralizingShout:SetChecked(ConROCWarriorSpells.ConROC_Melee_Shout_DemoralizingShout);

		ConROC_SM_Rage_HeroicStrike:SetChecked(ConROCWarriorSpells.ConROC_Melee_Rage_HeroicStrike);
		ConROC_SM_Rage_Cleave:SetChecked(ConROCWarriorSpells.ConROC_Melee_Rage_Cleave);
		ConROC_SM_Rage_Slam:SetChecked(ConROCWarriorSpells.ConROC_Melee_Rage_Slam);		
	
		ConROC_SM_Stun_Hamstring:SetChecked(ConROCWarriorSpells.ConROC_Melee_Stun_Hamstring);
		ConROC_SM_Stun_PiercingHowl:SetChecked(ConROCWarriorSpells.ConROC_Melee_Stun_PiercingHowl);
		ConROC_SM_Stun_ConcussionBlow:SetChecked(ConROCWarriorSpells.ConROC_Melee_Stun_ConcussionBlow);
		
	elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
		ConROC_SM_Shout_BattleShout:SetChecked(ConROCWarriorSpells.ConROC_PvP_Shout_BattleShout);
		ConROC_SM_Debuff_Rend:SetChecked(ConROCWarriorSpells.ConROC_PvP_Debuff_Rend);
		ConROC_SM_Debuff_ThunderClap:SetChecked(ConROCWarriorSpells.ConROC_PvP_Debuff_ThunderClap);
		ConROC_SM_Debuff_SunderArmor:SetChecked(ConROCWarriorSpells.ConROC_PvP_Debuff_SunderArmor);
		ConROC_SM_Debuff_SunderArmorCount:SetNumber(ConROCWarriorSpells.ConROC_PvP_Debuff_SunderArmorCount or 5);
		ConROC_SM_Shout_DemoralizingShout:SetChecked(ConROCWarriorSpells.ConROC_PvP_Shout_DemoralizingShout);

		ConROC_SM_Rage_HeroicStrike:SetChecked(ConROCWarriorSpells.ConROC_PvP_Rage_HeroicStrike);
		ConROC_SM_Rage_Cleave:SetChecked(ConROCWarriorSpells.ConROC_PvP_Rage_Cleave);
		ConROC_SM_Rage_Slam:SetChecked(ConROCWarriorSpells.ConROC_PvP_Rage_Slam);		
	
		ConROC_SM_Stun_Hamstring:SetChecked(ConROCWarriorSpells.ConROC_PvP_Stun_Hamstring);
		ConROC_SM_Stun_PiercingHowl:SetChecked(ConROCWarriorSpells.ConROC_PvP_Stun_PiercingHowl);
		ConROC_SM_Stun_ConcussionBlow:SetChecked(ConROCWarriorSpells.ConROC_PvP_Stun_ConcussionBlow);
		
	end
end

ConROC.Warrior = {};
function ConROC:EnableRotationModule()
	self.Description = 'Warrior';
	self.NextSpell = ConROC.Warrior.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
	
	ConROC:SpellmenuClass();
--	ConROCSpellmenuFrame:Hide();
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Warrior.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
	
	ConROC:JustSundered(spellID);
end

local Racial, Spec, Stance, Arms_Ability, Arms_Talent, Fury_Ability, Fury_Talent, Prot_Ability, Prot_Talent, Player_Buff, Player_Debuff, Target_Debuff = ids.Racial, ids.Spec, ids.Stance, ids.Arms_Ability, ids.Arms_Talent, ids.Fury_Ability, ids.Fury_Talent, ids.Prot_Ability, ids.Prot_Talent, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff;	

--Arms
local _Charge = Arms_Ability.ChargeRank1;
local _Hamstring = Arms_Ability.HamstringRank1;
local _HeroicStrike = Arms_Ability.HeroicStrikeRank1;
local _MortalStrike = Arms_Ability.MortalStrikeRank1;
local _Overpower = Arms_Ability.OverpowerRank1;
local _Rend = Arms_Ability.RendRank1;

--Fury
local _BattleShout = Fury_Ability.BattleShoutRank1;
local _Bloodthirst = Fury_Ability.BloodthirstRank1;
local _Cleave = Fury_Ability.CleaveRank1;
local _Execute = Fury_Ability.ExecuteRank1;
local _Intercept = Fury_Ability.InterceptRank1;
local _Pummel = Fury_Ability.PummelRank1;
local _Slam = Fury_Ability.SlamRank1;

--Protection
local _Revenge = Prot_Ability.RevengeRank1;
local _ShieldBash = Prot_Ability.ShieldBashRank1;
local _ShieldSlam = Prot_Ability.ShieldSlamRank1;
local _SunderArmor = Prot_Ability.SunderArmorRank1;

local sArmorEXP = 0;
	
function ConROC.Warrior.Damage(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials

--Resources	
	local rage 												= UnitPower('player', Enum.PowerType.Rage);
	local rageMax 											= UnitPowerMax('player', Enum.PowerType.Rage);

--Ranks
	--Arms
	if IsSpellKnown(Arms_Ability.ChargeRank3) then _Charge = Arms_Ability.ChargeRank3;
	elseif IsSpellKnown(Arms_Ability.ChargeRank2) then _Charge = Arms_Ability.ChargeRank2; end
	
	if IsSpellKnown(Arms_Ability.HamstringRank3) then _Hamstring = Arms_Ability.HamstringRank3;
	elseif IsSpellKnown(Arms_Ability.HamstringRank2) then _Hamstring = Arms_Ability.HamstringRank2; end	
	
	if IsSpellKnown(Arms_Ability.HeroicStrikeRank8) then _HeroicStrike = Arms_Ability.HeroicStrikeRank8;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank7) then _HeroicStrike = Arms_Ability.HeroicStrikeRank7;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank6) then _HeroicStrike = Arms_Ability.HeroicStrikeRank6;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank5) then _HeroicStrike = Arms_Ability.HeroicStrikeRank5;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank4) then _HeroicStrike = Arms_Ability.HeroicStrikeRank4;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank3) then _HeroicStrike = Arms_Ability.HeroicStrikeRank3;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank2) then _HeroicStrike = Arms_Ability.HeroicStrikeRank2; end
	
	if IsSpellKnown(Arms_Ability.MortalStrikeRank4) then _MortalStrike = Arms_Ability.MortalStrikeRank4;
	elseif IsSpellKnown(Arms_Ability.MortalStrikeRank3) then _MortalStrike = Arms_Ability.MortalStrikeRank3;
	elseif IsSpellKnown(Arms_Ability.MortalStrikeRank2) then _MortalStrike = Arms_Ability.MortalStrikeRank2; end

	if IsSpellKnown(Arms_Ability.OverpowerRank4) then _Overpower = Arms_Ability.OverpowerRank4;
	elseif IsSpellKnown(Arms_Ability.OverpowerRank3) then _Overpower = Arms_Ability.OverpowerRank3;
	elseif IsSpellKnown(Arms_Ability.OverpowerRank2) then _Overpower = Arms_Ability.OverpowerRank2; end
	
	if IsSpellKnown(Arms_Ability.RendRank7) then _Rend = Arms_Ability.RendRank7;
	elseif IsSpellKnown(Arms_Ability.RendRank6) then _Rend = Arms_Ability.RendRank6;
	elseif IsSpellKnown(Arms_Ability.RendRank5) then _Rend = Arms_Ability.RendRank5;
	elseif IsSpellKnown(Arms_Ability.RendRank4) then _Rend = Arms_Ability.RendRank4;
	elseif IsSpellKnown(Arms_Ability.RendRank3) then _Rend = Arms_Ability.RendRank3;
	elseif IsSpellKnown(Arms_Ability.RendRank2) then _Rend = Arms_Ability.RendRank2; end
	
	--Fury
	if IsSpellKnown(Fury_Ability.BattleShoutRank6) then _BattleShout = Fury_Ability.BattleShoutRank6;
	elseif IsSpellKnown(Fury_Ability.BattleShoutRank5) then _BattleShout = Fury_Ability.BattleShoutRank5;
	elseif IsSpellKnown(Fury_Ability.BattleShoutRank4) then _BattleShout = Fury_Ability.BattleShoutRank4;
	elseif IsSpellKnown(Fury_Ability.BattleShoutRank3) then _BattleShout = Fury_Ability.BattleShoutRank3;
	elseif IsSpellKnown(Fury_Ability.BattleShoutRank2) then _BattleShout = Fury_Ability.BattleShoutRank2; end	
	
	if IsSpellKnown(Fury_Ability.BloodthirstRank4) then _Bloodthirst = Fury_Ability.BloodthirstRank4;
	elseif IsSpellKnown(Fury_Ability.BloodthirstRank3) then _Bloodthirst = Fury_Ability.BloodthirstRank3;
	elseif IsSpellKnown(Fury_Ability.BloodthirstRank2) then _Bloodthirst = Fury_Ability.BloodthirstRank2; end	
	
	if IsSpellKnown(Fury_Ability.CleaveRank5) then _Cleave = Fury_Ability.CleaveRank5;
	elseif IsSpellKnown(Fury_Ability.CleaveRank4) then _Cleave = Fury_Ability.CleaveRank4;
	elseif IsSpellKnown(Fury_Ability.CleaveRank3) then _Cleave = Fury_Ability.CleaveRank3;
	elseif IsSpellKnown(Fury_Ability.CleaveRank2) then _Cleave = Fury_Ability.CleaveRank2; end
	
	if IsSpellKnown(Fury_Ability.ExecuteRank5) then _Execute = Fury_Ability.ExecuteRank5;
	elseif IsSpellKnown(Fury_Ability.ExecuteRank4) then _Execute = Fury_Ability.ExecuteRank4;
	elseif IsSpellKnown(Fury_Ability.ExecuteRank3) then _Execute = Fury_Ability.ExecuteRank3;
	elseif IsSpellKnown(Fury_Ability.ExecuteRank2) then _Execute = Fury_Ability.ExecuteRank2; end
	
	if IsSpellKnown(Fury_Ability.InterceptRank3) then _Intercept = Fury_Ability.InterceptRank3;
	elseif IsSpellKnown(Fury_Ability.InterceptRank2) then _Intercept = Fury_Ability.InterceptRank2; end

	if IsSpellKnown(Fury_Ability.PummelRank2) then _Pummel = Fury_Ability.PummelRank2; end

	if IsSpellKnown(Fury_Ability.SlamRank4) then _Slam = Fury_Ability.SlamRank4;
	elseif IsSpellKnown(Fury_Ability.SlamRank3) then _Slam = Fury_Ability.SlamRank3;
	elseif IsSpellKnown(Fury_Ability.SlamRank2) then _Slam = Fury_Ability.SlamRank2; end
	
	--Protection
	if IsSpellKnown(Prot_Ability.RevengeRank5) then _Revenge = Prot_Ability.RevengeRank5;
	elseif IsSpellKnown(Prot_Ability.RevengeRank4) then _Revenge = Prot_Ability.RevengeRank4;
	elseif IsSpellKnown(Prot_Ability.RevengeRank3) then _Revenge = Prot_Ability.RevengeRank3;
	elseif IsSpellKnown(Prot_Ability.RevengeRank2) then _Revenge = Prot_Ability.RevengeRank2; end
	
	if IsSpellKnown(Prot_Ability.ShieldBashRank3) then _ShieldBash = Prot_Ability.ShieldBashRank3;
	elseif IsSpellKnown(Prot_Ability.ShieldBashRank2) then _ShieldBash = Prot_Ability.ShieldBashRank2; end
	
	if IsSpellKnown(Prot_Ability.ShieldSlamRank4) then _ShieldSlam = Prot_Ability.ShieldSlamRank4;
	elseif IsSpellKnown(Prot_Ability.ShieldSlamRank3) then _ShieldSlam = Prot_Ability.ShieldSlamRank3;
	elseif IsSpellKnown(Prot_Ability.ShieldSlamRank2) then _ShieldSlam = Prot_Ability.ShieldSlamRank2; end
	
	if IsSpellKnown(Prot_Ability.SunderArmorRank5) then _SunderArmor = Prot_Ability.SunderArmorRank5;
	elseif IsSpellKnown(Prot_Ability.SunderArmorRank4) then _SunderArmor = Prot_Ability.SunderArmorRank4;
	elseif IsSpellKnown(Prot_Ability.SunderArmorRank3) then _SunderArmor = Prot_Ability.SunderArmorRank3;
	elseif IsSpellKnown(Prot_Ability.SunderArmorRank2) then _SunderArmor = Prot_Ability.SunderArmorRank2; end
	
--Abilities
	local chargeRDY		 									= ConROC:AbilityReady(_Charge, timeShift);
		local inChRange 										= ConROC:IsSpellInRange(_Charge, 'target');
	local hstringRDY		 								= ConROC:AbilityReady(_Hamstring, timeShift);
		local hstringDEBUFF		 								= ConROC:DebuffName(_Hamstring, timeShift);	
	local hStrikeRDY		 								= ConROC:AbilityReady(_HeroicStrike, timeShift);
	local mStrikeRDY		 								= ConROC:AbilityReady(_MortalStrike, timeShift);
	local oPowerRDY											= ConROC:AbilityReady(_Overpower, timeShift);	
	local sStrikesRDY										= ConROC:AbilityReady(Arms_Ability.SweepingStrikes, timeShift);	
	local rendRDY											= ConROC:AbilityReady(_Rend, timeShift);
		local rendDEBUFF		 								= ConROC:TargetDebuff(_Rend, timeShift);
		
	local batShoutRDY		 								= ConROC:AbilityReady(_BattleShout, timeShift);	
		local batShoutBUFF		 								= ConROC:BuffName(_BattleShout, timeShift);
	local bThirstRDY										= ConROC:AbilityReady(_Bloodthirst, timeShift);
		local bThirstBUFF										= ConROC:Buff(_Bloodthirst, timeShift);
	local cleaveRDY											= ConROC:AbilityReady(_Cleave, timeShift);
	local dWishRDY											= ConROC:AbilityReady(Fury_Ability.DeathWish, timeShift);
	local exeRDY											= ConROC:AbilityReady(_Execute, timeShift);
	local interRDY											= ConROC:AbilityReady(_Intercept, timeShift);
		local interRange 										= ConROC:IsSpellInRange(_Intercept, 'target');
	local iShoutRDY											= ConROC:AbilityReady(Fury_Ability.IntimidatingShout, timeShift);
	local pHowlRDY											= ConROC:AbilityReady(Fury_Ability.PiercingHowl, timeShift);
		local pHowlDEBUFF		 								= ConROC:DebuffName(Fury_Ability.PiercingHowl, timeShift);	
	local pummelRDY											= ConROC:AbilityReady(_Pummel, timeShift);
	local reckRDY											= ConROC:AbilityReady(Fury_Ability.Recklessness, timeShift);
	local slamRDY											= ConROC:AbilityReady(_Slam, timeShift);
	local wwRDY												= ConROC:AbilityReady(Fury_Ability.Whirlwind, timeShift);
	
	local bRageRDY											= ConROC:AbilityReady(Prot_Ability.Bloodrage, timeShift);
	local cBlowRDY											= ConROC:AbilityReady(Prot_Ability.ConcussionBlow, timeShift);
	local revengeRDY										= ConROC:AbilityReady(_Revenge, timeShift);
	local sBashRDY											= ConROC:AbilityReady(_ShieldBash, timeShift);	
	local sSlamRDY											= ConROC:AbilityReady(_ShieldSlam, timeShift);	
	local sArmorRDY											= ConROC:AbilityReady(_SunderArmor, timeShift);
		local sArmorDEBUFF, sArmorCount							= ConROC:TargetDebuff(_SunderArmor, timeShift);	
		local sArmorDEBUFF2		 								= ConROC:DebuffName(_SunderArmor, timeShift);	
		local sArmorDUR											= sArmorEXP - GetTime();
	local batStanceRDY 										= ConROC:AbilityReady(Arms_Ability.BattleStance, timeShift);
	local defStanceRDY 										= ConROC:AbilityReady(Prot_Ability.DefensiveStance, timeShift);
	local berStanceRDY 										= ConROC:AbilityReady(Fury_Ability.BerserkerStance, timeShift);

--Conditions
	local inStance											= GetShapeshiftForm();
	local incombat 											= UnitAffectingCombat('player');	
	local playerPh 											= ConROC:PercentHealth('player');
	local targetPh 											= ConROC:PercentHealth('target');
	local Close 											= CheckInteractDistance("target", 3);
	local tarInMelee										= 0;
	
	if IsSpellKnown(_Rend) then
		tarInMelee = ConROC:Targets(_Rend);
	end
--print(sArmorDUR); -- Still Testing Sunder Refresh Misses.
--Indicators		
	ConROC:AbilityMovement(_Charge, chargeRDY and inChRange and not incombat and inStance == Stance.Battle);
	ConROC:AbilityMovement(_Intercept, interRDY and interRange and inStance == Stance.Berserker);
	ConROC:AbilityTaunt(_HeroicStrike, ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and hStrikeRDY and rage >= 30 and ((tarInMelee >= 1 and not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or (tarInMelee == 1 and ConROC:CheckBox(ConROC_SM_Rage_Cleave)))); --Felt looks better then Burst.
	ConROC:AbilityTaunt(_Cleave, ConROC:CheckBox(ConROC_SM_Rage_Cleave) and cleaveRDY and rage >= 40 and tarInMelee >= 2);
	
	ConROC:AbilityBurst(Arms_Ability.SweepingStrikes, sStrikesRDY and inStance == Stance.Battle and tarInMelee >= 2);
	ConROC:AbilityBurst(Fury_Ability.DeathWish, dWishRDY and incombat and not ConROC:TarYou());
	ConROC:AbilityBurst(Fury_Ability.Recklessness, reckRDY and incombat and not ConROC:TarYou() and ((not ConROC:TalentChosen(Spec.Fury, Fury_Talent.DeathWish)) or (ConROC:TalentChosen(Spec.Fury, Fury_Talent.DeathWish) and dWishRDY)));
	
--Warnings	
	
--Rotations	
	if ConROC:CheckBox(ConROC_SM_Shout_BattleShout) and batShoutRDY and not batShoutBUFF then
		return _BattleShout;
	end
	
	if bRageRDY and rage <= 75 and playerPh >= 70 and incombat then
		return Prot_Ability.Bloodrage;
	end
	
	if ConROC:CheckBox(ConROC_SM_Debuff_SunderArmor) and sArmorRDY and sArmorDEBUFF and sArmorDUR <= 6 then
		return _SunderArmor;
	end

	if wwRDY and tarInMelee >= 3 and inStance == Stance.Berserker then
		return Fury_Ability.Whirlwind;
	end	
	
	if exeRDY and targetPh <= 20 and inStance == (Stance.Battle or Stance.Berserker) then
		return _Execute;
	end
	
	if oPowerRDY and inStance == Stance.Battle then
		return _Overpower;
	end
	
	if revengeRDY and inStance == Stance.Defensive then
		return _Revenge;
	end	
	
	if bThirstRDY then
		return _Bloodthirst;
	end		
	
	if wwRDY and inStance == Stance.Berserker then
		return Fury_Ability.Whirlwind;
	end	

	if sSlamRDY and ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
		return _ShieldSlam;
	end
	
	if mStrikeRDY then
		return _MortalStrike;
	end
	
	if ConROC:CheckBox(ConROC_SM_Debuff_Rend) and rendRDY and not rendDEBUFF and inStance == (Stance.Battle or Stance.Defensive) and not (ConROC:CreatureType('Mechanical') or ConROC:CreatureType('Elemental') or ConROC:CreatureType('Undead')) then
		return _Rend;
	end
	
	if ConROC:CheckBox(ConROC_SM_Debuff_SunderArmor) and sArmorRDY and (not sArmorDEBUFF2 or sArmorCount < ConROC_SM_Debuff_SunderArmorCount:GetNumber()) and rage >= 30 then
		return _SunderArmor;
	end
	
	if ConROC:CheckBox(ConROC_SM_Stun_PiercingHowl) and pHowlRDY and not pHowlDEBUFF and not hstringDEBUFF and tarInMelee >= 2 then
		return Fury_Ability.PiercingHowl;
	end
	
	if ConROC:CheckBox(ConROC_SM_Stun_Hamstring) and hstringRDY and not hstringDEBUFF and not pHowlDEBUFF and inStance == (Stance.Battle or Stance.Berserker) then
		return _Hamstring;
	end
	
	if ConROC:CheckBox(ConROC_SM_Stun_ConcussionBlow) and cBlowRDY then
		return Prot_Ability.ConcussionBlow;
	end

	if ConROC:CheckBox(ConROC_SM_Rage_Cleave) and cleaveRDY and rage >= 85 and tarInMelee >= 2 then
		return _Cleave;
	end	
	
	if ConROC:CheckBox(ConROC_SM_Rage_Slam) and slamRDY and not ConROC:TarYou() then
		return _Slam;
	end		

	if ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and hStrikeRDY and rage >= 85 and ((tarInMelee >= 1 and not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or (tarInMelee == 1 and ConROC:CheckBox(ConROC_SM_Rage_Cleave))) then
		return _HeroicStrike;
	end	

	return nil;
end

function ConROC.Warrior.Defense(_, timeShift, currentSpell, gcd, tChosen)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials

--Ranks
	--Arms
	local _MockingBlow = Arms_Ability.MockingBlowRank1;
	local _ThunderClap = Arms_Ability.ThunderClapRank1;
	
	if IsSpellKnown(Arms_Ability.MockingBlowRank5) then _MockingBlow = Arms_Ability.MockingBlowRank5;
	elseif IsSpellKnown(Arms_Ability.MockingBlowRank4) then _MockingBlow = Arms_Ability.MockingBlowRank4;
	elseif IsSpellKnown(Arms_Ability.MockingBlowRank3) then _MockingBlow = Arms_Ability.MockingBlowRank3;
	elseif IsSpellKnown(Arms_Ability.MockingBlowRank2) then _MockingBlow = Arms_Ability.MockingBlowRank2; end	

	if IsSpellKnown(Arms_Ability.ThunderClapRank6) then _ThunderClap = Arms_Ability.ThunderClapRank6;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank5) then _ThunderClap = Arms_Ability.ThunderClapRank5;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank4) then _ThunderClap = Arms_Ability.ThunderClapRank4;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank3) then _ThunderClap = Arms_Ability.ThunderClapRank3;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank2) then _ThunderClap = Arms_Ability.ThunderClapRank2; end

	--Fury
	local _DemoralizingShout = Fury_Ability.DemoralizingShoutRank1;

	if IsSpellKnown(Fury_Ability.DemoralizingShoutRank5) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank5;
	elseif IsSpellKnown(Fury_Ability.DemoralizingShoutRank4) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank4;
	elseif IsSpellKnown(Fury_Ability.DemoralizingShoutRank3) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank3;
	elseif IsSpellKnown(Fury_Ability.DemoralizingShoutRank2) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank2; end
	
--Resources	
	local rage 												= UnitPower('player', Enum.PowerType.Rage);
	local rageMax 											= UnitPowerMax('player', Enum.PowerType.Rage);
	
--Abilities	
	local mBlowRDY		 									= ConROC:AbilityReady(_MockingBlow, timeShift);
	local retalRDY											= ConROC:AbilityReady(Arms_Ability.Retaliation, timeShift);
	local tclapRDY											= ConROC:AbilityReady(_ThunderClap, timeShift);	
		local tclapDEBUFF		 								= ConROC:TargetDebuff(_ThunderClap, timeShift);	
		
	local berRageRDY										= ConROC:AbilityReady(Fury_Ability.BerserkerRage, timeShift);
	local cShoutRDY											= ConROC:AbilityReady(Fury_Ability.ChallengingShout, timeShift);
	local dShoutRDY											= ConROC:AbilityReady(_DemoralizingShout, timeShift);
		local dShoutDEBUFF										= ConROC:DebuffName(_DemoralizingShout);
		local dRoarDEBUFF										= ConROC:DebuffName(99); --Demoralizing Roar
		
	local disarmRDY											= ConROC:AbilityReady(Prot_Ability.Disarm, timeShift);
	local lStandRDY											= ConROC:AbilityReady(Prot_Ability.LastStand, timeShift);
	local sBlockRDY											= ConROC:AbilityReady(Prot_Ability.ShieldBlock, timeShift);
		local sBlockBUFF										= ConROC:Buff(Prot_Ability.ShieldBlock, timeShift);
	local sWallRDY											= ConROC:AbilityReady(Prot_Ability.ShieldWall, timeShift);
	local tauntRDY											= ConROC:AbilityReady(Prot_Ability.Taunt, timeShift);
			
--Conditions	
	local playerPh 											= ConROC:PercentHealth('player');
	local inStance											= GetShapeshiftForm();
	local tarInMelee										= 0;
	local incombat 											= UnitAffectingCombat('player');
	
	if IsSpellKnown(Prot_Ability.Taunt) then
		tarInMelee = ConROC:Targets(Prot_Ability.Taunt);
	end
	
--Indicators	
	ConROC:AbilityTaunt(Prot_Ability.Taunt, ConROC:CheckBox(ConROC_SM_Role_Tank) and tauntRDY and inStance == Stance.Defensive and not ConROC:TarYou());
	ConROC:AbilityTaunt(_MockingBlow, ConROC:CheckBox(ConROC_SM_Role_Tank) and mBlowRDY and inStance == Stance.Battle);
	ConROC:AbilityTaunt(Fury_Ability.ChallengingShout, ConROC:CheckBox(ConROC_SM_Role_Tank) and cShoutRDY and tarInMelee >= 3);
	
--Rotations	
	if lStandRDY and incombat and playerPh <= 35 then
		return Prot_Ability.LastStand;
	end

	if sWallRDY and inStance == Stance.Defensive and playerPh <= 25 and ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
		return Prot_Ability.ShieldWall;
	end
	
	if sBlockRDY and not sBlockBUFF and inStance == Stance.Defensive then
		return Prot_Ability.ShieldBlock;
	end
	
	if ConROC:CheckBox(ConROC_SM_Debuff_ThunderClap) and tclapRDY and not tclapDEBUFF and inStance == Stance.Battle then
		return _ThunderClap;
	end

	if berRageRDY and inStance == Stance.Berserker then
		return Fury_Ability.BerserkerRage;
	end
	
	if ConROC:CheckBox(ConROC_SM_Shout_DemoralizingShout) and dShoutRDY and not (dShoutDEBUFF or dRoarDEBUFF) then
		return _DemoralizingShout;
	end
	
	if retalRDY and incombat and inStance == Stance.Battle and not ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
		return Arms_Ability.Retaliation;
	end
	
	return nil;
end

function ConROC:JustSundered(spellID)
	if spellID == _SunderArmor then
		local expTime = GetTime() + 30;
		sArmorEXP = expTime;
	end
end
