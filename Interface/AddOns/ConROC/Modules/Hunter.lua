if select(2, UnitClass("player")) ~= "HUNTER" then return end
local ConROC_Hunter, ids = ...;

--General
	ids.Racial = {
		Shadowmeld = 20580,
	}
	ids.Spec = {
		BeastMastery = 1,
		Marksmanship = 2,
		Survival = 3,
	}
--Beast Mastery
	ids.BM_Ability = {
		AspectoftheBeast = 13161,	
		AspectoftheCheetah = 5118,
		AspectoftheHawkRank1 = 13165,
		AspectoftheHawkRank2 = 14318,
		AspectoftheHawkRank3 = 14319,
		AspectoftheHawkRank4 = 14320,
		AspectoftheHawkRank5 = 14321,
		AspectoftheHawkRank6 = 14322,		
		AspectoftheMonkey = 13163,
		AspectofthePack = 13159,
		AspectoftheWildRank1 = 20043,	
		AspectoftheWildRank2 = 20190,		
		BeastLore = 1462,
		BestialWrath = 19574,
		EagleEye = 6197,
		CallPet = 863,
		FeedPet = 6991,
		EyesoftheBeast = 1002,
		Intimidation = 19577,
		MendPetRank1 = 136,
		MendPetRank2 = 3111,
		MendPetRank3 = 3661,
		MendPetRank4 = 3662,
		MendPetRank5 = 13542,
		MendPetRank6 = 13543,
		MendPetRank7 = 13544,
		ScareBeastRank1 = 1513,
		ScareBeastRank2 = 14326,
		ScareBeastRank3 = 14327,		
	}
	ids.BM_Talent = {
		ImprovedAspectoftheHawk = 1,
		EnduranceTraining = 2,
		
		ImprovedEyesoftheBeast = 3,
		ImprovedAspectoftheMonkey = 4,
		ThickHide = 5,
		ImprovedRevivePet = 6,
		
		Pathfinding = 7,
		BestialSwiftness = 8,
		UnleashedFury = 9,
		
		ImprovedMendPet = 10,
		Ferocity = 11,
		
		SpiritBond = 12,
		Intimidation = 13,
		BestialDiscipline = 14,
		
		Frenzy = 15,
		
		BestialWrath = 16,
	}
--Marksmanship
	ids.MM_Ability = {
		AimedShotRank1 = 19434,
		AimedShotRank2 = 20900,
		AimedShotRank3 = 20901,
		AimedShotRank4 = 20902,
		AimedShotRank5 = 20903,
		AimedShotRank6 = 20904,
		ArcaneShotRank1 = 3044,
		ArcaneShotRank2 = 14281,
		ArcaneShotRank3 = 14282,	
		ArcaneShotRank4 = 14283,
		ArcaneShotRank5 = 14284,
		ArcaneShotRank6 = 14285,
		ArcaneShotRank7 = 14286,
		ArcaneShotRank8 = 14287,		
		AutoShot = 75,
		ConcussiveShot = 5116,
		DistractingShotRank1 = 20736,
		DistractingShotRank2 = 14274,
		DistractingShotRank3 = 15629,
		DistractingShotRank4 = 15630,		
		DistractingShotRank5 = 15631,
		DistractingShotRank6 = 15632,		
		Flare = 1543,
		HuntersMarkRank1 = 1130,
		HuntersMarkRank2 = 14323,	
		HuntersMarkRank3 = 14324,
		HuntersMarkRank4 = 14325,		
		MultiShotRank1 = 2643,
		MultiShotRank2 = 14288,		
		MultiShotRank3 = 14289,	
		MultiShotRank4 = 14290,		
		RapidFire = 3045,
		ScatterShot = 19503,
		ScorpidStingRank1 = 3043,
		ScorpidStingRank2 = 14275,
		ScorpidStingRank3 = 14276,	
		ScorpidStingRank4 = 14277,		
		SerpentStingRank1 = 1978,
		SerpentStingRank2 = 13549,
		SerpentStingRank3 = 13550,
		SerpentStingRank4 = 13551,
		SerpentStingRank5 = 13552,	
		SerpentStingRank6 = 13553,	
		SerpentStingRank7 = 13554,
		SerpentStingRank8 = 13555,
		TrueshotAuraRank1 = 19506,
		TrueshotAuraRank2 = 20905,
		TrueshotAuraRank3 = 20906,
		ViperStingRank1 = 3034,
		ViperStingRank2 = 14279,
		ViperStingRank3 = 14280,
		VolleyRank1 = 1510,
		VolleyRank2 = 14294,
		VolleyRank3 = 14295,
	}
	ids.MM_Talent = {
		ImprovedConcussiveShot = 1,
		Efficiency = 2,
		
		ImprovedHuntersMark = 3,
		LethalShots = 4,
		
		AimedShot = 5,
		ImprovedArcaneShot = 6,
		HawkEye = 7,
		
		ImprovedSerpentSting = 8,
		MortalShots = 9,
		
		ScatterShot = 10,
		Barrage = 11,
		ImprovedScorpidSting = 12,
		
		RangedWeaponSpecialization = 13,
		TrueshotAura = 14,
	}
--Survival
	ids.Surv_Ability = {
		CounterattackRank1 = 19306,
		CounterattackRank2 = 20909,
		CounterattackRank3 = 20910,
		Deterrence = 19263,
		DisengageRank1 = 781,
		DisengageRank2 = 14272,
		DisengageRank3 = 14273,
		ExplosiveTrapRank1 = 13813,
		ExplosiveTrapRank2 = 14316,
		ExplosiveTrapRank3 = 14317,		
		ImmolationTrapRank1 = 13795,
		ImmolationTrapRank2 = 14302,
		ImmolationTrapRank3 = 14303,
		ImmolationTrapRank4 = 14304,
		ImmolationTrapRank5 = 14305,		
		FeignDeath = 5384,
		FreezingTrapRank1 = 1499,
		FreezingTrapRank2 = 14310,	
		FreezingTrapRank3 = 14311,		
		FrostTrap = 13809,
		MongooseBiteRank1 = 1495,
		MongooseBiteRank2 = 14269,
		MongooseBiteRank3 = 14270,	
		MongooseBiteRank4 = 14271,		
		RaptorStrikeRank1 = 2973,
		RaptorStrikeRank2 = 14260,
		RaptorStrikeRank3 = 14261,
		RaptorStrikeRank4 = 14262,
		RaptorStrikeRank5 = 14263,
		RaptorStrikeRank6 = 14264,
		RaptorStrikeRank7 = 14265,
		RaptorStrikeRank8 = 14266,
		RaptorStrikeRank9 = 9,
		TrackBeasts = 1494,
		TrackDemons = 19878,
		TrackDragonkin = 19879,
		TrackElementals = 19880,
		TrackGiants = 19882,
		TrackHidden = 19885,
		TrackHumanoids = 19883,	
		TrackUndead = 19884,
		WingClipRank1 = 2974,
		WingClipRank2 = 14267,		
		WingClipRank3 = 14268,
		WyvernStingRank1 = 19386,
		WyvernStingRank2 = 24132,		
		WyvernStingRank3 = 24133,	
	}
	ids.Surv_Talent = {
		MonsterSlaying = 1,
		HumanoidSlaying = 2,
		Deflection = 3,
		
		Entrapment = 4,
		SavageStrikes = 5,
		ImprovedWingClip = 6,
		
		CleverTraps = 7,
		Survivalist = 8,
		Deterrence = 9,
		
		TrapMastery = 10,
		Surefooted = 11,
		ImprovedFeignDeath = 12,
		
		KillerInstinct = 13,
		Counterattack = 14,
		
		LightningReflexes = 15,
		
		WyvernSting = 16,
	}
--Pet
	ids.Pet = {

	}
-- Auras
	ids.Player_Buff = {
	
	}
	ids.Player_Debuff = {

	}
	ids.Target_Debuff = {
	
	}

local lastFrame = 0;
local lastSting = 0;
local lastAbility = 0;
local lastStun = 0;

local plvl = UnitLevel('player');

local defaults = {
	["ConROC_SM_Role_Ranged"] = true,

	["ConROC_Ranged_Sting_Serpent"] = true,
	["ConROC_Ranged_Ability_HuntersMark"] = true,
	["ConROC_Ranged_Ability_RapidFire"] = true,
	["ConROC_Ranged_Ability_BestialWrath"] = true,
}


ConROCHunterSpells = ConROCHunterSpells or defaults;

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
		
	--Ranged
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Role_Ranged", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(radio1, "ARTWORK", "GameFontRedSmall");
			radio1:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -10);
			radio1:SetChecked(ConROCHunterSpells.ConROC_SM_Role_Ranged);
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Role_Ranged:SetChecked(true);
					ConROC_SM_Role_Melee:SetChecked(false);
					ConROC_SM_Role_PvP:SetChecked(false);
					ConROCHunterSpells.ConROC_SM_Role_Ranged = ConROC_SM_Role_Ranged:GetChecked();
					ConROCHunterSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCHunterSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile()
				end
			);
			radio1text:SetText("Ranged");				
			radio1text:SetPoint("BOTTOM", radio1, "TOP", 0, 3);
		
	--Melee
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Role_Melee", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(radio2, "ARTWORK", "GameFontRedSmall");		
			radio2:SetPoint("LEFT", radio1, "RIGHT", 25, 0);
			radio2:SetChecked(ConROCHunterSpells.ConROC_SM_Role_Melee);
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Role_Ranged:SetChecked(false);
					ConROC_SM_Role_Melee:SetChecked(true);
					ConROC_SM_Role_PvP:SetChecked(false);
					ConROCHunterSpells.ConROC_SM_Role_Ranged = ConROC_SM_Role_Ranged:GetChecked();
					ConROCHunterSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCHunterSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile()
				end
			);
			radio2text:SetText("Melee");					
			radio2text:SetPoint("BOTTOM", radio2, "TOP", 0, 3);
		
	--PvP
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Role_PvP", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(radio4, "ARTWORK", "GameFontRedSmall");
			radio4:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -15, -10);
			radio4:SetChecked(ConROCHunterSpells.ConROC_SM_Role_PvP);
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Role_Ranged:SetChecked(false);
					ConROC_SM_Role_Melee:SetChecked(false);
					ConROC_SM_Role_PvP:SetChecked(true);
					ConROCHunterSpells.ConROC_SM_Role_Ranged = ConROC_SM_Role_Ranged:GetChecked();
					ConROCHunterSpells.ConROC_SM_Role_Melee = ConROC_SM_Role_Melee:GetChecked();
					ConROCHunterSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile()
				end
			);
			radio4text:SetText("PvP");					
			radio4text:SetPoint("BOTTOM", radio4, "TOP", 0, 3);
			

		frame:Hide()
		lastFrame = frame;
	
	ConROC:RadioHeader1();
	ConROC:CheckHeader1();
	ConROC:CheckHeader3();
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

		local fontStings = frame:CreateFontString("ConROC_Spellmenu_RadioHeader1", "ARTWORK", "GameFontGreenSmall");
			fontStings:SetText("Stings");
			fontStings:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame1_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontStings, "RIGHT", 0, 0)
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
				tbutton:SetPoint("LEFT", fontStings, "RIGHT", 0, 0)
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

		lastSting = frame;
		lastFrame = frame;
		
	--Serpent Sting
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Sting_Serpent", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(radio1, "ARTWORK", "GameFontHighlightSmall");
		local r1spellName, _, r1tspell = GetSpellInfo(ids.MM_Ability.SerpentStingRank1);
			radio1:SetPoint("TOP", ConROCRadioFrame1, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				radio1:SetChecked(ConROCHunterSpells.ConROC_Ranged_Sting_Serpent);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio1:SetChecked(ConROCHunterSpells.ConROC_Melee_Sting_Serpent);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCHunterSpells.ConROC_PvP_Sting_Serpent);	
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Sting_Serpent:SetChecked(true);
					ConROC_SM_Sting_Scorpid:SetChecked(false);
					ConROC_SM_Sting_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Sting_Serpent = ConROC_SM_Sting_Serpent:GetChecked();
						ConROCHunterSpells.ConROC_Ranged_Sting_Scorpid = ConROC_SM_Sting_Scorpid:GetChecked();
						ConROCHunterSpells.ConROC_Ranged_Sting_None = ConROC_SM_Sting_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Sting_Serpent = ConROC_SM_Sting_Serpent:GetChecked();
						ConROCHunterSpells.ConROC_Melee_Sting_Scorpid = ConROC_SM_Sting_Scorpid:GetChecked();
						ConROCHunterSpells.ConROC_Melee_Sting_None = ConROC_SM_Sting_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Sting_Serpent = ConROC_SM_Sting_Serpent:GetChecked();
						ConROCHunterSpells.ConROC_PvP_Sting_Scorpid = ConROC_SM_Sting_Scorpid:GetChecked();
						ConROCHunterSpells.ConROC_PvP_Sting_None = ConROC_SM_Sting_None:GetChecked();
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
		
		lastSting = radio1;
		lastFrame = radio1;
		
	--Scorpid Sting
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Sting_Scorpid", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(radio2, "ARTWORK", "GameFontHighlightSmall");		
		local r2spellName, _, r2tspell = GetSpellInfo(ids.MM_Ability.ScorpidStingRank1);
			radio2:SetPoint("TOP", lastSting, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				radio2:SetChecked(ConROCHunterSpells.ConROC_Ranged_Sting_Scorpid);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio2:SetChecked(ConROCHunterSpells.ConROC_Melee_Sting_Scorpid);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCHunterSpells.ConROC_PvP_Sting_Scorpid);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Sting_Serpent:SetChecked(false);
					ConROC_SM_Sting_Scorpid:SetChecked(true);
					ConROC_SM_Sting_None:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Sting_Serpent = ConROC_SM_Sting_Serpent:GetChecked();
						ConROCHunterSpells.ConROC_Ranged_Sting_Scorpid = ConROC_SM_Sting_Scorpid:GetChecked();
						ConROCHunterSpells.ConROC_Ranged_Sting_None = ConROC_SM_Sting_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Sting_Serpent = ConROC_SM_Sting_Serpent:GetChecked();
						ConROCHunterSpells.ConROC_Melee_Sting_Scorpid = ConROC_SM_Sting_Scorpid:GetChecked();
						ConROCHunterSpells.ConROC_Melee_Sting_None = ConROC_SM_Sting_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Sting_Serpent = ConROC_SM_Sting_Serpent:GetChecked();
						ConROCHunterSpells.ConROC_PvP_Sting_Scorpid = ConROC_SM_Sting_Scorpid:GetChecked();
						ConROCHunterSpells.ConROC_PvP_Sting_None = ConROC_SM_Sting_None:GetChecked();
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

		lastSting = radio2;
		lastFrame = radio2;

	--None
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Sting_None", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(radio4, "ARTWORK", "GameFontHighlightSmall");		
			radio4:SetPoint("TOP", lastSting, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				radio4:SetChecked(ConROCHunterSpells.ConROC_Ranged_Sting_None);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio4:SetChecked(ConROCHunterSpells.ConROC_Melee_Sting_None);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				radio4:SetChecked(ConROCHunterSpells.ConROC_Healer_Sting_None);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio4:SetChecked(ConROCHunterSpells.ConROC_PvP_Sting_None);
			end
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Sting_Serpent:SetChecked(false);
					ConROC_SM_Sting_Scorpid:SetChecked(false);
					ConROC_SM_Sting_None:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Sting_Serpent = ConROC_SM_Sting_Serpent:GetChecked();
						ConROCHunterSpells.ConROC_Ranged_Sting_Scorpid = ConROC_SM_Sting_Scorpid:GetChecked();
						ConROCHunterSpells.ConROC_Ranged_Sting_None = ConROC_SM_Sting_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Sting_Serpent = ConROC_SM_Sting_Serpent:GetChecked();
						ConROCHunterSpells.ConROC_Melee_Sting_Scorpid = ConROC_SM_Sting_Scorpid:GetChecked();
						ConROCHunterSpells.ConROC_Melee_Sting_None = ConROC_SM_Sting_None:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Sting_Serpent = ConROC_SM_Sting_Serpent:GetChecked();
						ConROCHunterSpells.ConROC_PvP_Sting_Scorpid = ConROC_SM_Sting_Scorpid:GetChecked();
						ConROCHunterSpells.ConROC_PvP_Sting_None = ConROC_SM_Sting_None:GetChecked();
					end
				end
			);
			radio4text:SetText("None");
			radio4text:SetPoint('LEFT', radio4, 'RIGHT', 20, 0);

		lastSting = radio4;		
		lastFrame = radio4;
		
	--Viper Sting
		local radio3 = CreateFrame("CheckButton", "ConROC_SM_Sting_Viper", frame, "UICheckButtonTemplate");
		local radio3text = frame:CreateFontString(radio3, "ARTWORK", "GameFontHighlightSmall");
		local r3spellName, _, r3tspell = GetSpellInfo(ids.MM_Ability.ViperStingRank1);
			radio3:SetPoint("TOP", lastSting, "BOTTOM", 0, 0);
			radio3:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				radio3:SetChecked(ConROCHunterSpells.ConROC_Ranged_Sting_Viper);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				radio3:SetChecked(ConROCHunterSpells.ConROC_Melee_Sting_Viper);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio3:SetChecked(ConROCHunterSpells.ConROC_PvP_Sting_Viper);
			end
			radio3:SetScript("OnClick", 
			  function()
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Sting_Viper = ConROC_SM_Sting_Viper:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Sting_Viper = ConROC_SM_Sting_Viper:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Sting_Viper = ConROC_SM_Sting_Viper:GetChecked();
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
			r3t:SetScale(0.4);
			r3t:SetPoint("LEFT", radio3, "RIGHT", 8, 0);
			radio3text:SetPoint('LEFT', r3t, 'RIGHT', 5, 0);

		lastSting = radio3;
		lastFrame = radio3;

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

		local fontStings = frame:CreateFontString("ConROC_Spellmenu_CheckHeader1", "ARTWORK", "GameFontGreenSmall");
			fontStings:SetText("Abilities");
			fontStings:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_CheckFrame1_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontStings, "RIGHT", 0, 0)
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
				tbutton:SetPoint("LEFT", fontStings, "RIGHT", 0, 0)
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

		lastAbility = frame;
		lastFrame = frame;
		
	--Hunters Mark
		local c1tspellName, _, c1tspell = GetSpellInfo(ids.MM_Ability.HuntersMarkRank1); 
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Ability_HuntersMark", frame, "UICheckButtonTemplate");
		local check1text = frame:CreateFontString(check1, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				check1:SetChecked(ConROCHunterSpells.ConROC_Ranged_Ability_HuntersMark);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check1:SetChecked(ConROCHunterSpells.ConROC_Melee_Ability_HuntersMark);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCHunterSpells.ConROC_PvP_Ability_HuntersMark);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Ability_HuntersMark = ConROC_SM_Ability_HuntersMark:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Ability_HuntersMark = ConROC_SM_Ability_HuntersMark:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Ability_HuntersMark = ConROC_SM_Ability_HuntersMark:GetChecked();
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
			
		lastAbility = check1;
		lastFrame = check1;
		
	--Multi Shot
		local c2tspellName, _, c2tspell = GetSpellInfo(ids.MM_Ability.MultiShotRank1); 
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Ability_MultiShot", frame, "UICheckButtonTemplate");
		local check2text = frame:CreateFontString(check2, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", lastAbility, "BOTTOM", 0, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				check2:SetChecked(ConROCHunterSpells.ConROC_Ranged_Ability_MultiShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check2:SetChecked(ConROCHunterSpells.ConROC_Melee_Ability_MultiShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCHunterSpells.ConROC_PvP_Ability_MultiShot);
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Ability_MultiShot = ConROC_SM_Ability_MultiShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Ability_MultiShot = ConROC_SM_Ability_MultiShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Ability_MultiShot = ConROC_SM_Ability_MultiShot:GetChecked();
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
			
		lastAbility = check2;
		lastFrame = check2;
		
	--Aimed Shot
		local c3tspellName, _, c3tspell = GetSpellInfo(ids.MM_Ability.AimedShotRank1); 
		local check3 = CreateFrame("CheckButton", "ConROC_SM_Ability_AimedShot", frame, "UICheckButtonTemplate");
		local check3text = frame:CreateFontString(check3, "ARTWORK", "GameFontHighlightSmall");		
			check3:SetPoint("TOP", lastAbility, "BOTTOM", 0, 0);
			check3:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				check3:SetChecked(ConROCHunterSpells.ConROC_Ranged_Ability_AimedShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check3:SetChecked(ConROCHunterSpells.ConROC_Melee_Ability_AimedShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check3:SetChecked(ConROCHunterSpells.ConROC_PvP_Ability_AimedShot);
			end
			check3:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Ability_AimedShot = ConROC_SM_Ability_AimedShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Ability_AimedShot = ConROC_SM_Ability_AimedShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Ability_AimedShot = ConROC_SM_Ability_AimedShot:GetChecked();
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
			
		lastAbility = check3;
		lastFrame = check3;
		
	--Rapid Fire
		local c4tspellName, _, c4tspell = GetSpellInfo(ids.MM_Ability.RapidFire); 
		local check4 = CreateFrame("CheckButton", "ConROC_SM_Ability_RapidFire", frame, "UICheckButtonTemplate");
		local check4text = frame:CreateFontString(check4, "ARTWORK", "GameFontHighlightSmall");		
			check4:SetPoint("TOP", lastAbility, "BOTTOM", 0, 0);
			check4:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				check4:SetChecked(ConROCHunterSpells.ConROC_Ranged_Ability_RapidFire);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check4:SetChecked(ConROCHunterSpells.ConROC_Melee_Ability_RapidFire);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check4:SetChecked(ConROCHunterSpells.ConROC_PvP_Ability_RapidFire);
			end
			check4:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Ability_RapidFire = ConROC_SM_Ability_RapidFire:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Ability_RapidFire = ConROC_SM_Ability_RapidFire:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Ability_RapidFire = ConROC_SM_Ability_RapidFire:GetChecked();
					end
				end);
			check4text:SetText(c4tspellName);				
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
			
		lastAbility = check4;
		lastFrame = check4;

	--Bestial Wrath
		local c5tspellName, _, c5tspell = GetSpellInfo(ids.BM_Ability.BestialWrath); 
		local check5 = CreateFrame("CheckButton", "ConROC_SM_Ability_BestialWrath", frame, "UICheckButtonTemplate");
		local check5text = frame:CreateFontString(check5, "ARTWORK", "GameFontHighlightSmall");		
			check5:SetPoint("TOP", lastAbility, "BOTTOM", 0, 0);
			check5:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				check5:SetChecked(ConROCHunterSpells.ConROC_Ranged_Ability_BestialWrath);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check5:SetChecked(ConROCHunterSpells.ConROC_Melee_Ability_BestialWrath);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check5:SetChecked(ConROCHunterSpells.ConROC_PvP_Ability_BestialWrath);
			end
			check5:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Ability_BestialWrath = ConROC_SM_Ability_BestialWrath:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Ability_BestialWrath = ConROC_SM_Ability_BestialWrath:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Ability_BestialWrath = ConROC_SM_Ability_BestialWrath:GetChecked();
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
			
		lastAbility = check5;
		lastFrame = check5;
		
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

		local fontStings = frame:CreateFontString("ConROC_Spellmenu_CheckHeader3", "ARTWORK", "GameFontGreenSmall");
			fontStings:SetText("Stuns and Slows");
			fontStings:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_CheckFrame3_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontStings, "RIGHT", 0, 0)
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
				tbutton:SetPoint("LEFT", fontStings, "RIGHT", 0, 0)
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
	local frame = CreateFrame("Frame", "ConROCCheckFrame3", ConROCCheckHeader1)
		
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
		
	--Concussive Shot
		local c1tspellName, _, c1tspell = GetSpellInfo(ids.MM_Ability.ConcussiveShot); 
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Stun_ConcussiveShot", frame, "UICheckButtonTemplate");
		local check1text = frame:CreateFontString(check1, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", ConROCCheckFrame3, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				check1:SetChecked(ConROCHunterSpells.ConROC_Ranged_Stun_ConcussiveShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check1:SetChecked(ConROCHunterSpells.ConROC_Melee_Stun_ConcussiveShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
				check1:SetChecked(ConROCHunterSpells.ConROC_Healer_Stun_ConcussiveShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCHunterSpells.ConROC_PvP_Stun_ConcussiveShot);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Stun_ConcussiveShot = ConROC_SM_Stun_ConcussiveShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Stun_ConcussiveShot = ConROC_SM_Stun_ConcussiveShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Healer) then
						ConROCHunterSpells.ConROC_Healer_Stun_ConcussiveShot = ConROC_SM_Stun_ConcussiveShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Stun_ConcussiveShot = ConROC_SM_Stun_ConcussiveShot:GetChecked();
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

	--Wing Clip
		local c2tspellName, _, c2tspell = GetSpellInfo(ids.Surv_Ability.WingClipRank1); 
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Stun_WingClip", frame, "UICheckButtonTemplate");
		local check2text = frame:CreateFontString(check2, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				check2:SetChecked(ConROCHunterSpells.ConROC_Ranged_Stun_WingClip);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check2:SetChecked(ConROCHunterSpells.ConROC_Melee_Stun_WingClip);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCHunterSpells.ConROC_PvP_Stun_WingClip);
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Stun_WingClip = ConROC_SM_Stun_WingClip:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Stun_WingClip = ConROC_SM_Stun_WingClip:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Stun_WingClip = ConROC_SM_Stun_WingClip:GetChecked();
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

	--Intimidation
		local c3tspellName, _, c3tspell = GetSpellInfo(ids.BM_Ability.Intimidation); 
		local check3 = CreateFrame("CheckButton", "ConROC_SM_Stun_Intimidation", frame, "UICheckButtonTemplate");
		local check3text = frame:CreateFontString(check3, "ARTWORK", "GameFontHighlightSmall");		
			check3:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			check3:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				check3:SetChecked(ConROCHunterSpells.ConROC_Ranged_Stun_Intimidation);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check3:SetChecked(ConROCHunterSpells.ConROC_Melee_Stun_Intimidation);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check3:SetChecked(ConROCHunterSpells.ConROC_PvP_Stun_Intimidation);
			end
			check3:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Stun_Intimidation = ConROC_SM_Stun_Intimidation:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Stun_Intimidation = ConROC_SM_Stun_Intimidation:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Stun_Intimidation = ConROC_SM_Stun_Intimidation:GetChecked();
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

	--Scatter Shot
		local c4tspellName, _, c4tspell = GetSpellInfo(ids.MM_Ability.ScatterShot); 
		local check4 = CreateFrame("CheckButton", "ConROC_SM_Stun_ScatterShot", frame, "UICheckButtonTemplate");
		local check4text = frame:CreateFontString(check4, "ARTWORK", "GameFontHighlightSmall");		
			check4:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			check4:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				check4:SetChecked(ConROCHunterSpells.ConROC_Ranged_Stun_ScatterShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check4:SetChecked(ConROCHunterSpells.ConROC_Melee_Stun_ScatterShot);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check4:SetChecked(ConROCHunterSpells.ConROC_PvP_Stun_ScatterShot);
			end
			check4:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Stun_ScatterShot = ConROC_SM_Stun_ScatterShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Stun_ScatterShot = ConROC_SM_Stun_ScatterShot:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Stun_ScatterShot = ConROC_SM_Stun_ScatterShot:GetChecked();
					end
				end);
			check4text:SetText(c4tspellName);				
		local c4t = check4.texture;
			if not c4t then
				c4t = check4:CreateTexture('CheckFrame3_check4_Texture', 'ARTWORK');
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

	--AoE Toggle Button
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Option_AoE", frame, "UICheckButtonTemplate");
		local check2text = check2:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", ConROCCheckFrame2, "BOTTOM", -150, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
				check2:SetChecked(ConROCHunterSpells.ConROC_Ranged_Option_AoE);
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
			elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
				check2:SetChecked(ConROCHunterSpells.ConROC_Melee_Option_AoE);
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
				check2:SetChecked(ConROCHunterSpells.ConROC_PvP_Option_AoE);
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
					if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
						ConROCHunterSpells.ConROC_Ranged_Option_AoE = ConROC_SM_Option_AoE:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
						ConROCHunterSpells.ConROC_Melee_Option_AoE = ConROC_SM_Option_AoE:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCHunterSpells.ConROC_PvP_Option_AoE = ConROC_SM_Option_AoE:GetChecked();
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
		lastSting = ConROCRadioFrame1;
		
	--Stings
		if plvl >= 4 and IsSpellKnown(ids.MM_Ability.SerpentStingRank1) then 
			ConROC_SM_Sting_Serpent:Show();
			lastSting = ConROC_SM_Sting_Serpent;
		else
			ConROC_SM_Sting_Serpent:Hide();
		end

		if plvl >= 22 and IsSpellKnown(ids.MM_Ability.ScorpidStingRank1) then 
			ConROC_SM_Sting_Scorpid:Show(); 
			ConROC_SM_Sting_Scorpid:SetPoint("TOP", lastSting, "BOTTOM", 0, 0);
			lastSting = ConROC_SM_Sting_Scorpid;
		else
			ConROC_SM_Sting_Scorpid:Hide();
		end

		if plvl >= 4 and IsSpellKnown(ids.MM_Ability.SerpentStingRank1) then
			ConROC_SM_Sting_None:Show(); 
			ConROC_SM_Sting_None:SetPoint("TOP", lastSting, "BOTTOM", 0, 0);
			lastSting = ConROC_SM_Sting_None;
		else
			ConROC_SM_Sting_None:Hide();
		end
		
		if plvl >= 36 and IsSpellKnown(ids.MM_Ability.ViperStingRank1) then 
			ConROC_SM_Sting_Viper:Show(); 
			ConROC_SM_Sting_Viper:SetPoint("TOP", lastSting, "BOTTOM", 0, 5);
			lastSting = ConROC_SM_Sting_Viper;
		else
			ConROC_SM_Sting_Viper:Hide();
		end

		if lastSting == ConROCRadioFrame1 then
			ConROCRadioHeader1:Hide();
			ConROCRadioFrame1:Hide();
		end
		
		if ConROCRadioFrame1:IsVisible() then
			lastFrame = lastSting;
		else
			lastFrame = ConROCRadioHeader1;
		end
	end
		
	if ConROCCheckFrame1 ~= nil then
		if lastFrame == lastSting then
			ConROCCheckHeader1:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader1:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastAbility = ConROCCheckFrame1;
		
	--Ability
		if plvl >= 6 then 
			ConROC_SM_Ability_HuntersMark:Show();
			lastAbility = ConROC_SM_Ability_HuntersMark;
		else
			ConROC_SM_Ability_HuntersMark:Hide();
		end

		if plvl >= 18 and IsSpellKnown(ids.MM_Ability.MultiShotRank1) then 
			ConROC_SM_Ability_MultiShot:Show(); 
			ConROC_SM_Ability_MultiShot:SetPoint("TOP", lastAbility, "BOTTOM", 0, 0);
			lastAbility = ConROC_SM_Ability_MultiShot;
		else
			ConROC_SM_Ability_MultiShot:Hide();
		end		
		
		if plvl >= 20 and IsSpellKnown(ids.MM_Ability.AimedShotRank1) then 
			ConROC_SM_Ability_AimedShot:Show(); 
			ConROC_SM_Ability_AimedShot:SetPoint("TOP", lastAbility, "BOTTOM", 0, 0);
			lastAbility = ConROC_SM_Ability_AimedShot;
		else
			ConROC_SM_Ability_AimedShot:Hide();
		end		
		
		if plvl >= 26 and IsSpellKnown(ids.MM_Ability.RapidFire) then 
			ConROC_SM_Ability_RapidFire:Show(); 
			ConROC_SM_Ability_RapidFire:SetPoint("TOP", lastAbility, "BOTTOM", 0, 0);
			lastAbility = ConROC_SM_Ability_RapidFire;
		else
			ConROC_SM_Ability_RapidFire:Hide();
		end

		if plvl >= 40 and IsSpellKnown(ids.BM_Ability.BestialWrath) then 
			ConROC_SM_Ability_BestialWrath:Show(); 
			ConROC_SM_Ability_BestialWrath:SetPoint("TOP", lastAbility, "BOTTOM", 0, 0);
			lastAbility = ConROC_SM_Ability_BestialWrath;
		else
			ConROC_SM_Ability_BestialWrath:Hide();
		end

		if lastAbility == ConROCCheckFrame1 then
			ConROCCheckHeader1:Hide();
			ConROCCheckFrame1:Hide();
		end
		
		if ConROCCheckFrame1:IsVisible() then
			lastFrame = lastAbility;
		else
			lastFrame = ConROCCheckHeader1;
		end		
	end
	
	if ConROCCheckFrame3 ~= nil then
		if lastFrame == lastSting or lastFrame == lastAbility then
			ConROCCheckHeader3:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader3:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastStun = ConROCCheckFrame3;
		
	--Stuns
		if plvl >= 8 and IsSpellKnown(ids.MM_Ability.ConcussiveShot) then 
			ConROC_SM_Stun_ConcussiveShot:Show();
			lastStun = ConROC_SM_Stun_ConcussiveShot;
		else
			ConROC_SM_Stun_ConcussiveShot:Hide();
		end	

		if plvl >= 12 then 
			ConROC_SM_Stun_WingClip:Show(); 
			ConROC_SM_Stun_WingClip:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			lastStun = ConROC_SM_Stun_WingClip;
		else
			ConROC_SM_Stun_WingClip:Hide();
		end

		if plvl >= 30 and IsSpellKnown(ids.BM_Ability.Intimidation) then 
			ConROC_SM_Stun_Intimidation:Show(); 
			ConROC_SM_Stun_Intimidation:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			lastStun = ConROC_SM_Stun_Intimidation;
		else
			ConROC_SM_Stun_Intimidation:Hide();
		end

		if plvl >= 30 and IsSpellKnown(ids.MM_Ability.ScatterShot) then 
			ConROC_SM_Stun_ScatterShot:Show(); 
			ConROC_SM_Stun_ScatterShot:SetPoint("TOP", lastStun, "BOTTOM", 0, 0);
			lastStun = ConROC_SM_Stun_ScatterShot;
		else
			ConROC_SM_Stun_ScatterShot:Hide();
		end

		if lastStun == ConROCCheckFrame3 then
			ConROCCheckHeader3:Hide();
			ConROCCheckFrame3:Hide();
		end
		
		if ConROCCheckFrame3:IsVisible() then
			lastFrame = lastStun;
		else
			lastFrame = ConROCCheckHeader3;
		end		
	end	
	
	if ConROCCheckFrame2 ~= nil then
		if lastFrame == lastSting or lastFrame == lastAbility or lastFrame == lastStun then
			ConROCCheckHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastOption = ConROCCheckFrame2;
		
	--Options
		if plvl >= 18 then 
			ConROC_SM_Option_AoE:Show(); 
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
	if ConROC:CheckBox(ConROC_SM_Role_Ranged) then
		ConROC_SM_Sting_Serpent:SetChecked(ConROCHunterSpells.ConROC_Ranged_Sting_Serpent);
		ConROC_SM_Sting_Scorpid:SetChecked(ConROCHunterSpells.ConROC_Ranged_Sting_Scorpid);
		ConROC_SM_Sting_Viper:SetChecked(ConROCHunterSpells.ConROC_Ranged_Sting_Viper);
		ConROC_SM_Sting_None:SetChecked(ConROCHunterSpells.ConROC_Ranged_Sting_None);
		
		ConROC_SM_Ability_HuntersMark:SetChecked(ConROCHunterSpells.ConROC_Ranged_Ability_HuntersMark);
		ConROC_SM_Ability_MultiShot:SetChecked(ConROCHunterSpells.ConROC_Ranged_Ability_MultiShot);
		ConROC_SM_Ability_AimedShot:SetChecked(ConROCHunterSpells.ConROC_Ranged_Ability_AimedShot);
		ConROC_SM_Ability_RapidFire:SetChecked(ConROCHunterSpells.ConROC_Ranged_Ability_RapidFire);
		ConROC_SM_Ability_BestialWrath:SetChecked(ConROCHunterSpells.ConROC_Ranged_Ability_BestialWrath);

		ConROC_SM_Stun_ConcussiveShot:SetChecked(ConROCHunterSpells.ConROC_Ranged_Stun_ConcussiveShot);
		ConROC_SM_Stun_WingClip:SetChecked(ConROCHunterSpells.ConROC_Ranged_Stun_WingClip);
		ConROC_SM_Stun_Intimidation:SetChecked(ConROCHunterSpells.ConROC_Ranged_Stun_Intimidation);
		ConROC_SM_Stun_ScatterShot:SetChecked(ConROCHunterSpells.ConROC_Ranged_Stun_ScatterShot);

		ConROC_SM_Option_AoE:SetChecked(ConROCHunterSpells.ConROC_Ranged_Option_AoE);

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
		
	elseif ConROC:CheckBox(ConROC_SM_Role_Melee) then
		ConROC_SM_Sting_Serpent:SetChecked(ConROCHunterSpells.ConROC_Melee_Sting_Serpent);
		ConROC_SM_Sting_Scorpid:SetChecked(ConROCHunterSpells.ConROC_Melee_Sting_Scorpid);
		ConROC_SM_Sting_Viper:SetChecked(ConROCHunterSpells.ConROC_Melee_Sting_Viper);
		ConROC_SM_Sting_None:SetChecked(ConROCHunterSpells.ConROC_Melee_Sting_None);
		
		ConROC_SM_Ability_HuntersMark:SetChecked(ConROCHunterSpells.ConROC_Melee_Ability_HuntersMark);
		ConROC_SM_Ability_MultiShot:SetChecked(ConROCHunterSpells.ConROC_Melee_Ability_MultiShot);
		ConROC_SM_Ability_AimedShot:SetChecked(ConROCHunterSpells.ConROC_Melee_Ability_AimedShot);
		ConROC_SM_Ability_RapidFire:SetChecked(ConROCHunterSpells.ConROC_Melee_Ability_RapidFire);
		ConROC_SM_Ability_BestialWrath:SetChecked(ConROCHunterSpells.ConROC_Melee_Ability_BestialWrath);

		ConROC_SM_Stun_ConcussiveShot:SetChecked(ConROCHunterSpells.ConROC_Melee_Stun_ConcussiveShot);
		ConROC_SM_Stun_WingClip:SetChecked(ConROCHunterSpells.ConROC_Melee_Stun_WingClip);
		ConROC_SM_Stun_Intimidation:SetChecked(ConROCHunterSpells.ConROC_Melee_Stun_Intimidation);
		ConROC_SM_Stun_ScatterShot:SetChecked(ConROCHunterSpells.ConROC_Melee_Stun_ScatterShot);

		ConROC_SM_Option_AoE:SetChecked(ConROCHunterSpells.ConROC_Melee_Option_AoE);

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
		ConROC_SM_Sting_Serpent:SetChecked(ConROCHunterSpells.ConROC_PvP_Sting_Serpent);
		ConROC_SM_Sting_Scorpid:SetChecked(ConROCHunterSpells.ConROC_PvP_Sting_Scorpid);
		ConROC_SM_Sting_Viper:SetChecked(ConROCHunterSpells.ConROC_PvP_Sting_Viper);
		ConROC_SM_Sting_None:SetChecked(ConROCHunterSpells.ConROC_PvP_Sting_None);

		ConROC_SM_Ability_HuntersMark:SetChecked(ConROCHunterSpells.ConROC_PvP_Ability_HuntersMark);
		ConROC_SM_Ability_MultiShot:SetChecked(ConROCHunterSpells.ConROC_PvP_Ability_MultiShot);
		ConROC_SM_Ability_AimedShot:SetChecked(ConROCHunterSpells.ConROC_PvP_Ability_AimedShot);
		ConROC_SM_Ability_RapidFire:SetChecked(ConROCHunterSpells.ConROC_PvP_Ability_RapidFire);
		ConROC_SM_Ability_BestialWrath:SetChecked(ConROCHunterSpells.ConROC_PvP_Ability_BestialWrath);		

		ConROC_SM_Stun_ConcussiveShot:SetChecked(ConROCHunterSpells.ConROC_PvP_Stun_ConcussiveShot);
		ConROC_SM_Stun_WingClip:SetChecked(ConROCHunterSpells.ConROC_PvP_Stun_WingClip);
		ConROC_SM_Stun_Intimidation:SetChecked(ConROCHunterSpells.ConROC_PvP_Stun_Intimidation);
		ConROC_SM_Stun_ScatterShot:SetChecked(ConROCHunterSpells.ConROC_PvP_Stun_ScatterShot);
		
		ConROC_SM_Option_AoE:SetChecked(ConROCHunterSpells.ConROC_PvP_Option_AoE);

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

ConROC.Hunter = {};
	
function ConROC:EnableRotationModule()
	self.Description = 'Hunter';
	self.NextSpell = ConROC.Hunter.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
	
	ConROC:SpellmenuClass();
--	ConROCSpellmenuFrame:Hide();	
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Hunter.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

local Racial, Spec, BM_Ability, BM_Talent, MM_Ability, MM_Talent, Surv_Ability, Surv_Talent, Pet, Player_Buff, Player_Debuff, Target_Debuff = ids.Racial, ids.Spec, ids.BM_Ability, ids.BM_Talent, ids.MM_Ability, ids.MM_Talent, ids.Surv_Ability, ids.Surv_Talent, ids.Pet, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff;

function ConROC.Hunter.Damage(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials
		
--Resources
	local mana												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;

--Ranks
	--Beast Mastery
	local _AspectoftheHawk = BM_Ability.AspectoftheHawkRank1;
	local _ScareBeast = BM_Ability.ScareBeastRank1;

	if IsSpellKnown(BM_Ability.AspectoftheHawkRank6) then _AspectoftheHawk = BM_Ability.AspectoftheHawkRank6;
	elseif IsSpellKnown(BM_Ability.AspectoftheHawkRank5) then _AspectoftheHawk = BM_Ability.AspectoftheHawkRank5;
	elseif IsSpellKnown(BM_Ability.AspectoftheHawkRank4) then _AspectoftheHawk = BM_Ability.AspectoftheHawkRank4;
	elseif IsSpellKnown(BM_Ability.AspectoftheHawkRank3) then _AspectoftheHawk = BM_Ability.AspectoftheHawkRank3;
	elseif IsSpellKnown(BM_Ability.AspectoftheHawkRank2) then _AspectoftheHawk = BM_Ability.AspectoftheHawkRank2; end

	if IsSpellKnown(BM_Ability.ScareBeastRank3) then _ScareBeast = BM_Ability.ScareBeastRank3;
	elseif IsSpellKnown(BM_Ability.ScareBeastRank2) then _ScareBeast = BM_Ability.ScareBeastRank2; end
	
	--Marksmanship
	local _AimedShot = MM_Ability.AimedShotRank1;	
	local _ArcaneShot = MM_Ability.ArcaneShotRank1;
	local _HuntersMark = MM_Ability.HuntersMarkRank1;
	local _MultiShot = MM_Ability.MultiShotRank1;
	local _ScorpidSting = MM_Ability.ScorpidStingRank1;
	local _SerpentSting = MM_Ability.SerpentStingRank1;
	local _TrueshotAura = MM_Ability.TrueshotAuraRank1;
	local _ViperSting = MM_Ability.ViperStingRank1;
	local _Volley = MM_Ability.VolleyRank1;

	if IsSpellKnown(MM_Ability.AimedShotRank6) then _AimedShot = MM_Ability.AimedShotRank6;
	elseif IsSpellKnown(MM_Ability.AimedShotRank5) then _AimedShot = MM_Ability.AimedShotRank5;
	elseif IsSpellKnown(MM_Ability.AimedShotRank4) then _AimedShot = MM_Ability.AimedShotRank4;
	elseif IsSpellKnown(MM_Ability.AimedShotRank3) then _AimedShot = MM_Ability.AimedShotRank3;
	elseif IsSpellKnown(MM_Ability.AimedShotRank2) then _AimedShot = MM_Ability.AimedShotRank2; end
	
	if IsSpellKnown(MM_Ability.ArcaneShotRank8) then _ArcaneShot = MM_Ability.ArcaneShotRank8;
	elseif IsSpellKnown(MM_Ability.ArcaneShotRank7) then _ArcaneShot = MM_Ability.ArcaneShotRank7;
	elseif IsSpellKnown(MM_Ability.ArcaneShotRank6) then _ArcaneShot = MM_Ability.ArcaneShotRank6;
	elseif IsSpellKnown(MM_Ability.ArcaneShotRank5) then _ArcaneShot = MM_Ability.ArcaneShotRank5;
	elseif IsSpellKnown(MM_Ability.ArcaneShotRank4) then _ArcaneShot = MM_Ability.ArcaneShotRank4;
	elseif IsSpellKnown(MM_Ability.ArcaneShotRank3) then _ArcaneShot = MM_Ability.ArcaneShotRank3;
	elseif IsSpellKnown(MM_Ability.ArcaneShotRank2) then _ArcaneShot = MM_Ability.ArcaneShotRank2; end

	if IsSpellKnown(MM_Ability.HuntersMarkRank4) then _HuntersMark = MM_Ability.HuntersMarkRank4;
	elseif IsSpellKnown(MM_Ability.HuntersMarkRank3) then _HuntersMark = MM_Ability.HuntersMarkRank3;
	elseif IsSpellKnown(MM_Ability.HuntersMarkRank2) then _HuntersMark = MM_Ability.HuntersMarkRank2; end
	
	if IsSpellKnown(MM_Ability.MultiShotRank4) then _MultiShot = MM_Ability.MultiShotRank4;
	elseif IsSpellKnown(MM_Ability.MultiShotRank3) then _MultiShot = MM_Ability.MultiShotRank3;
	elseif IsSpellKnown(MM_Ability.MultiShotRank2) then _MultiShot = MM_Ability.MultiShotRank2; end

	if IsSpellKnown(MM_Ability.ScorpidStingRank4) then _ScorpidSting = MM_Ability.ScorpidStingRank4;
	elseif IsSpellKnown(MM_Ability.ScorpidStingRank3) then _ScorpidSting = MM_Ability.ScorpidStingRank3;
	elseif IsSpellKnown(MM_Ability.ScorpidStingRank2) then _ScorpidSting = MM_Ability.ScorpidStingRank2; end
	
	if IsSpellKnown(MM_Ability.SerpentStingRank8) then _SerpentSting = MM_Ability.SerpentStingRank8;
	elseif IsSpellKnown(MM_Ability.SerpentStingRank7) then _SerpentSting = MM_Ability.SerpentStingRank7;
	elseif IsSpellKnown(MM_Ability.SerpentStingRank6) then _SerpentSting = MM_Ability.SerpentStingRank6;
	elseif IsSpellKnown(MM_Ability.SerpentStingRank5) then _SerpentSting = MM_Ability.SerpentStingRank5;
	elseif IsSpellKnown(MM_Ability.SerpentStingRank4) then _SerpentSting = MM_Ability.SerpentStingRank4;
	elseif IsSpellKnown(MM_Ability.SerpentStingRank3) then _SerpentSting = MM_Ability.SerpentStingRank3;
	elseif IsSpellKnown(MM_Ability.SerpentStingRank2) then _SerpentSting = MM_Ability.SerpentStingRank2; end
	
	if IsSpellKnown(MM_Ability.TrueshotAuraRank3) then _TrueshotAura = MM_Ability.TrueshotAuraRank3;
	elseif IsSpellKnown(MM_Ability.TrueshotAuraRank2) then _TrueshotAura = MM_Ability.TrueshotAuraRank2; end
	
	if IsSpellKnown(MM_Ability.ViperStingRank3) then _ViperSting = MM_Ability.ViperStingRank3;
	elseif IsSpellKnown(MM_Ability.ViperStingRank2) then _ViperSting = MM_Ability.ViperStingRank2; end
	
	if IsSpellKnown(MM_Ability.VolleyRank3) then _Volley = MM_Ability.VolleyRank3;
	elseif IsSpellKnown(MM_Ability.VolleyRank2) then _Volley = MM_Ability.VolleyRank2; end
	
	--Survival
	local _Counterattack = Surv_Ability.CounterattackRank1;
	local _ExplosiveTrap = Surv_Ability.ExplosiveTrapRank1;
	local _ImmolationTrap = Surv_Ability.ImmolationTrapRank1;
	local _FreezingTrap = Surv_Ability.FreezingTrapRank1;
	local _MongooseBite = Surv_Ability.MongooseBiteRank1;
	local _RaptorStrike = Surv_Ability.RaptorStrikeRank1;
	local _WingClip = Surv_Ability.WingClipRank1;
	local _WyvernSting = Surv_Ability.WyvernStingRank1;

	if IsSpellKnown(Surv_Ability.CounterattackRank3) then _Counterattack = Surv_Ability.CounterattackRank3;
	elseif IsSpellKnown(Surv_Ability.CounterattackRank2) then _Counterattack = Surv_Ability.CounterattackRank2; end

	if IsSpellKnown(Surv_Ability.ExplosiveTrapRank3) then _ExplosiveTrap = Surv_Ability.ExplosiveTrapRank3;
	elseif IsSpellKnown(Surv_Ability.ExplosiveTrapRank2) then _ExplosiveTrap = Surv_Ability.ExplosiveTrapRank2; end

	if IsSpellKnown(Surv_Ability.ImmolationTrapRank5) then _ImmolationTrap = Surv_Ability.ImmolationTrapRank5;
	elseif IsSpellKnown(Surv_Ability.ImmolationTrapRank4) then _ImmolationTrap = Surv_Ability.ImmolationTrapRank4;
	elseif IsSpellKnown(Surv_Ability.ImmolationTrapRank3) then _ImmolationTrap = Surv_Ability.ImmolationTrapRank3;
	elseif IsSpellKnown(Surv_Ability.ImmolationTrapRank2) then _ImmolationTrap = Surv_Ability.ImmolationTrapRank2; end

	if IsSpellKnown(Surv_Ability.FreezingTrapRank3) then _FreezingTrap = Surv_Ability.FreezingTrapRank3;
	elseif IsSpellKnown(Surv_Ability.FreezingTrapRank2) then _FreezingTrap = Surv_Ability.FreezingTrapRank2; end
	
	if IsSpellKnown(Surv_Ability.MongooseBiteRank4) then _MongooseBite = Surv_Ability.MongooseBiteRank4;
	elseif IsSpellKnown(Surv_Ability.MongooseBiteRank3) then _MongooseBite = Surv_Ability.MongooseBiteRank3;
	elseif IsSpellKnown(Surv_Ability.MongooseBiteRank2) then _MongooseBite = Surv_Ability.MongooseBiteRank2; end

	if IsSpellKnown(Surv_Ability.RaptorStrikeRank9) then _RaptorStrike = Surv_Ability.RaptorStrikeRank9;
	elseif IsSpellKnown(Surv_Ability.RaptorStrikeRank8) then _RaptorStrike = Surv_Ability.RaptorStrikeRank8;
	elseif IsSpellKnown(Surv_Ability.RaptorStrikeRank7) then _RaptorStrike = Surv_Ability.RaptorStrikeRank7;
	elseif IsSpellKnown(Surv_Ability.RaptorStrikeRank6) then _RaptorStrike = Surv_Ability.RaptorStrikeRank6;
	elseif IsSpellKnown(Surv_Ability.RaptorStrikeRank5) then _RaptorStrike = Surv_Ability.RaptorStrikeRank5;
	elseif IsSpellKnown(Surv_Ability.RaptorStrikeRank4) then _RaptorStrike = Surv_Ability.RaptorStrikeRank4;
	elseif IsSpellKnown(Surv_Ability.RaptorStrikeRank3) then _RaptorStrike = Surv_Ability.RaptorStrikeRank3;
	elseif IsSpellKnown(Surv_Ability.RaptorStrikeRank2) then _RaptorStrike = Surv_Ability.RaptorStrikeRank2; end

	if IsSpellKnown(Surv_Ability.WingClipRank3) then _WingClip = Surv_Ability.WingClipRank3;
	elseif IsSpellKnown(Surv_Ability.WingClipRank2) then _WingClip = Surv_Ability.WingClipRank2; end
	
	if IsSpellKnown(Surv_Ability.WyvernStingRank3) then _WyvernSting = Surv_Ability.WyvernStingRank3;
	elseif IsSpellKnown(Surv_Ability.WyvernStingRank2) then _WyvernSting = Surv_Ability.WyvernStingRank2; end
	
--Abilities
	local bWrathRDY											= ConROC:AbilityReady(BM_Ability.BestialWrath, timeShift);	
	local intimRDY											= ConROC:AbilityReady(BM_Ability.Intimidation, timeShift);		
	
	local aimShotRDY	 									= ConROC:AbilityReady(_AimedShot, timeShift);
	local arcShotRDY	 									= ConROC:AbilityReady(_ArcaneShot, timeShift);	
	local autoShot	 										= ConROC:AbilityReady(MM_Ability.AutoShot, timeShift);
	local concusShotRDY										= ConROC:AbilityReady(MM_Ability.ConcussiveShot, timeShift);
	local hMarkRDY		 									= ConROC:AbilityReady(_HuntersMark, timeShift);	
		local hmDEBUFF											= ConROC:DebuffName(_HuntersMark);	
	local multiRDY	 										= ConROC:AbilityReady(_MultiShot, timeShift);
	local rFireRDY											= ConROC:AbilityReady(MM_Ability.RapidFire, timeShift);	
		local rfBUFF											= ConROC:Buff(MM_Ability.RapidFire);	
	local scatterRDY										= ConROC:AbilityReady(MM_Ability.ScatterShot, timeShift);			
	local scStingRDY										= ConROC:AbilityReady(_ScorpidSting, timeShift);
	local sStingRDY											= ConROC:AbilityReady(_SerpentSting, timeShift);
	local tsAuraRDY											= ConROC:AbilityReady(_TrueshotAura, timeShift);
		local tsABUFF											= ConROC:Buff(_TrueshotAura);		
	local vStingRDY											= ConROC:AbilityReady(_ViperSting, timeShift);
	local volleyRDY											= ConROC:AbilityReady(_Volley, timeShift);		
		
	local cAttackRDY										= ConROC:AbilityReady(_Counterattack, timeShift);			
	local exTrapRDY											= ConROC:AbilityReady(_ExplosiveTrap, timeShift);
	local imTrapRDY											= ConROC:AbilityReady(_ImmolationTrap, timeShift);
	local fTrapRDY											= ConROC:AbilityReady(_FreezingTrap, timeShift);
	local frTrapRDY											= ConROC:AbilityReady(Surv_Ability.FrostTrap, timeShift);
	local mBiteRDY											= ConROC:AbilityReady(_MongooseBite, timeShift);		
	local rStrikeRDY										= ConROC:AbilityReady(_RaptorStrike, timeShift);
	local wClipRDY											= ConROC:AbilityReady(_WingClip, timeShift);	
		local wClipDEBUFF										= ConROC:TargetDebuff(_WingClip, timeShift);		
	local wStingRDY											= ConROC:AbilityReady(_WyvernSting, timeShift);
		local wStingDEBUFF										= ConROC:TargetDebuff(_WyvernSting);	
		
	local aotHawk											= ConROC:AbilityReady(_AspectoftheHawk, timeShift);
		local aothForm											= ConROC:Form(_AspectoftheHawk);
	local aotCheetah										= ConROC:AbilityReady(BM_Ability.AspectoftheCheetah, timeShift);
		local aotcForm											= ConROC:Form(BM_Ability.AspectoftheCheetah);
	local aotPack											= ConROC:AbilityReady(BM_Ability.AspectofthePack, timeShift);
		local aotpForm											= ConROC:Form(BM_Ability.AspectofthePack);
		
--Conditions	
	local targetPh 											= ConROC:PercentHealth('target');
	local summoned 											= ConROC:CallPet();
	local isClose 											= CheckInteractDistance('target', 3);
	local moving 											= ConROC:PlayerSpeed();	
	local incombat 											= UnitAffectingCombat('player');
	local inShotRange										= ConROC:IsSpellInRange(MM_Ability.AutoShot, 'target');
	local cPetRDY											= GetCallPetSpellInfo();
	local inMelee											= isClose
	local tarHasMana 										= UnitPower('target', Enum.PowerType.Mana);
	
	if IsSpellKnown(Surv_Ability.WingClipRank1) then
		inMelee												= ConROC:IsSpellInRange(Surv_Ability.WingClipRank1, 'target');
	end

    local stingDEBUFF = {
		scStingDEBUFF										= ConROC:TargetDebuff(_ScorpidSting);
        sStingDEBUFF										= ConROC:TargetDebuff(_SerpentSting);
		vStingDEBUFF										= ConROC:TargetDebuff(_ViperSting);	
    }	

	local stingUp = false;
		for k, v in pairs(stingDEBUFF) do
			if v then
				stingUp = true;
				break
			end
		end
		
--Indicators
	ConROC:AbilityRaidBuffs(_AspectoftheHawk, aotHawk and not aothForm and not inMelee);	
	ConROC:AbilityBurst(BM_Ability.BestialWrath, not ConROC:CheckBox(ConROC_SM_Ability_BestialWrath) and bWrathRDY and incombat and summoned);
	ConROC:AbilityBurst(MM_Ability.RapidFire, not ConROC:CheckBox(ConROC_SM_Ability_RapidFire) and rFireRDY and incombat);
	ConROC:AbilityMovement(BM_Ability.AspectoftheCheetah, aotCheetah and not aotcForm and not incombat);

	ConROC:AbilityRaidBuffs(_TrueshotAura, tsAuraRDY and not tsABUFF);
	
--Warnings
--[[	if cPetRDY and not summoned and incombat then
		UIErrorsFrame:AddMessage("Call your pet!!!", 1.0, 0.0, 0.0, 10);
	end]]

--Rotations
	if ConROC:CheckBox(ConROC_SM_Ability_HuntersMark) and hMarkRDY and not hmDEBUFF and not inMelee then
		return _HuntersMark;
	end	

	if ConROC:CheckBox(ConROC_SM_Stun_Intimidation) and intimRDY and summoned and ConROC:TarYou() then
		return BM_Ability.Intimidation;
	end

	if ConROC:CheckBox(ConROC_SM_Stun_ScatterShot) and scatterRDY and ConROC:IsSpellInRange(MM_Ability.ScatterShot, 'target') and ConROC:TarYou() then
		return MM_Ability.ScatterShot;
	end
		
	if inShotRange then
		if ConROC:CheckBox(ConROC_SM_Stun_ConcussiveShot) and concusShotRDY and ConROC:TarYou() then
			return MM_Ability.ConcussiveShot;
		end
		
		if ConROC:CheckBox(ConROC_SM_Ability_AimedShot) and aimShotRDY and currentSpell ~= _AimedShot then
			return _AimedShot;
		end

		if ConROC:CheckBox(ConROC_SM_Sting_Viper) and vStingRDY and not stingUp and tarHasMana > 0 and ConROC.lastSpellId ~= _ViperSting and not ConROC:CreatureType("Mechanical") and not ConROC:CreatureType("Elemental") then
			return _ViperSting;
		end
		
		if ConROC:CheckBox(ConROC_SM_Sting_Serpent) and sStingRDY and not stingUp and ConROC.lastSpellId ~= _SerpentSting and not ConROC:CreatureType("Mechanical") and not ConROC:CreatureType("Elemental") then
			return _SerpentSting;
		end
		
		if ConROC:CheckBox(ConROC_SM_Sting_Scorpid) and scStingRDY and not stingUp and ConROC.lastSpellId ~= _ScorpidSting and not ConROC:CreatureType("Mechanical") and not ConROC:CreatureType("Elemental") then
			return _ScorpidSting;
		end
		
		if ConROC:CheckBox(ConROC_SM_Ability_BestialWrath) and bWrathRDY and incombat and summoned then
			return BM_Ability.BestialWrath;
		end
		
		if ConROC:CheckBox(ConROC_SM_Ability_RapidFire) and rFireRDY and incombat then
			return MM_Ability.RapidFire;
		end
		
		if (ConROC_AoEButton:IsVisible() or ConROC:CheckBox(ConROC_SM_Ability_MultiShot)) and multiRDY then
			return _MultiShot;
		end
		
		if ConROC_AoEButton:IsVisible() and volleyRDY then
			return _Volley;
		end
		
		if arcShotRDY and currentSpell ~= _AimedShot and ((manaPercent >= 50) or moving or ((targetPh <= 5 and ConROC:Raidmob()) or (targetPh <= 20 and not ConROC:Raidmob()))) then
			return _ArcaneShot;
		end
		
		if autoShot then
			return ids.MM_Ability.AutoShot;
		end
	end

	if inMelee then
		if cAttackRDY then
			return _Counterattack;
		end
	
		if mBiteRDY then
			return _MongooseBite;
		end
		
		if ConROC:CheckBox(ConROC_SM_Stun_WingClip) and wClipRDY and not wClipDEBUFF then
			return _WingClip;
		end
		
		if rStrikeRDY then
			return _RaptorStrike;
		end
	end
	
	return nil;
end

function ConROC.Hunter.Defense(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials
		
--Resources
	local focus 											= UnitPower('player', Enum.PowerType.Focus);
	local focusMax 											= UnitPowerMax('player', Enum.PowerType.Focus);

--Ranks
	--Beast Mastery
	local _AspectoftheWild = BM_Ability.AspectoftheWildRank1;
	local _MendPet = BM_Ability.MendPetRank1;

	if IsSpellKnown(BM_Ability.AspectoftheWildRank2) then _AspectoftheWild = BM_Ability.AspectoftheWildRank2; end

	if IsSpellKnown(BM_Ability.MendPetRank7) then _MendPet = BM_Ability.MendPetRank7;
	elseif IsSpellKnown(BM_Ability.MendPetRank6) then _MendPet = BM_Ability.MendPetRank6;
	elseif IsSpellKnown(BM_Ability.MendPetRank5) then _MendPet = BM_Ability.MendPetRank5;
	elseif IsSpellKnown(BM_Ability.MendPetRank4) then _MendPet = BM_Ability.MendPetRank4;
	elseif IsSpellKnown(BM_Ability.MendPetRank3) then _MendPet = BM_Ability.MendPetRank3;
	elseif IsSpellKnown(BM_Ability.MendPetRank2) then _MendPet = BM_Ability.MendPetRank2; end
	
	--Marksmanship
	local _DistractingShot = MM_Ability.DistractingShotRank1;

	if IsSpellKnown(MM_Ability.DistractingShotRank6) then _DistractingShot = MM_Ability.DistractingShotRank6;
	elseif IsSpellKnown(MM_Ability.DistractingShotRank5) then _DistractingShot = MM_Ability.DistractingShotRank5;
	elseif IsSpellKnown(MM_Ability.DistractingShotRank4) then _DistractingShot = MM_Ability.DistractingShotRank4;
	elseif IsSpellKnown(MM_Ability.DistractingShotRank3) then _DistractingShot = MM_Ability.DistractingShotRank3;
	elseif IsSpellKnown(MM_Ability.DistractingShotRank2) then _DistractingShot = MM_Ability.DistractingShotRank2; end

	--Survival
	local _Disengage = Surv_Ability.DisengageRank1;

	if IsSpellKnown(Surv_Ability.DisengageRank3) then _Disengage = Surv_Ability.DisengageRank3;
	elseif IsSpellKnown(Surv_Ability.DisengageRank2) then _Disengage = Surv_Ability.DisengageRank2; end	
	
--Abilities
	local feedRDY											= ConROC:AbilityReady(BM_Ability.FeedPet, timeShift);
		local happiness 									= GetPetHappiness();
	local mendPetRDY 										= ConROC:AbilityReady(_MendPet, timeShift);
	
	local disShotRDY										= ConROC:AbilityReady(_DistractingShot, timeShift);	

	local deterRDY											= ConROC:AbilityReady(Surv_Ability.Deterrence, timeShift);
	local disenRDY											= ConROC:AbilityReady(_Disengage, timeShift);
	local fDeathRDY											= ConROC:AbilityReady(Surv_Ability.FeignDeath, timeShift);

	local aotMonkey											= ConROC:AbilityReady(BM_Ability.AspectoftheMonkey, timeShift);
		local aotmForm											= ConROC:Form(BM_Ability.AspectoftheMonkey);
	local aotWild											= ConROC:AbilityReady(_AspectoftheWild, timeShift);
		local aotwForm											= ConROC:Form(_AspectoftheWild);
		
--Conditions	
	local playerPh 											= ConROC:PercentHealth('player');
	local summoned 											= ConROC:CallPet();	
	local petPh												= ConROC:PercentHealth('pet');
	local incombat 											= UnitAffectingCombat('player');
	local isClose 											= CheckInteractDistance('target', 3);	
	local inMelee											= isClose
	
	if IsSpellKnown(Surv_Ability.WingClipRank1) then
		inMelee											= ConROC:IsSpellInRange(Surv_Ability.WingClipRank1, 'target');
	end
	
	if happiness == nil then
		happiness = 0;
	end
	
--Indicators
	ConROC:AbilityRaidBuffs(BM_Ability.FeedPet, feedRDY and summoned and not incombat and happiness < 3);
	
--Rotations	
	if disenRDY and inMelee and ConROC:TarYou() then
		return _Disengage;
	end
	
	if aotMonkey and not aotmForm and inMelee and ConROC:TarYou() then
		return BM_Ability.AspectoftheMonkey;
	end
	
	if deterRDY and playerPh <= 30 and ConROC:TarYou() then
		return Surv_Ability.Deterrence;
	end
	
	if fDeathRDY and playerPh <= 30 and ConROC:TarYou() then
		return Surv_Ability.FeignDeath;
	end	
	
	if mendPetRDY and summoned and petPh <= 40 then
		return _MendPet;
	end
	
	return nil;
end