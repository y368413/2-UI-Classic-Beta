ConROC.RaidBuffs = {};

-- Global cooldown spell id
-- GlobalCooldown = 61304;

local INF = 2147483647;

function ConROC:TalentChosen(spec, talent)
	local _, _, _, _, currentRank, maxRank = GetTalentInfo(spec, talent);
	if currentRank >= 1 then
		return true, currentRank, maxRank;
	end
	return false, 0, 0;
end

function ConROC:SpecTally()
	local _, _, classId = UnitClass('player');
	local class = ConROC.Classes[classId];
	local spec1 = 0;
	local spec2 = 0;
	local spec3 = 0;
	for spec = 1, GetNumTalentTabs() do
		for talent = 1, GetNumTalents(spec) do
			local _, _, _, _, currentRank, maxRank = GetTalentInfo(spec, talent);
			if spec == 1 then
				spec1 = spec1 + currentRank;
			elseif spec == 2 then
				spec2 = spec2 + currentRank;
			else
				spec3 = spec3 + currentRank;
			end
		end
	end
	--print(ConROC.Colors[classId] .. ConROC.Description .. "|r  " .. spec1 .. " / " .. spec2 .. " / " .. spec3);
	return spec1, spec2, spec3;
end

function ConROC:PlayerSpeed()
	local speed  = (GetUnitSpeed("player") / 7) * 100;
	local moving = false;
		if speed > 0 then
			moving = true;
		else
			moving = false;
		end	
	return moving;
end

function ConROC:Targets(spellID)
	local inRange = 0
	for i = 1, 40 do
		if UnitExists('nameplate' .. i) and ConROC:IsSpellInRange(GetSpellInfo(spellID), 'nameplate' .. i) then
			inRange = inRange + 1
		end
	end
--	print(inRange)
	return inRange;
end

function ConROC:UnitAura(spellID, timeShift, unit, filter)
	timeShift = timeShift or 0;
	for i=1,16 do
		local _, _, count, _, _, expirationTime, _, _, _, spell = UnitAura(unit, i, filter);
		if spell == spellID then
			if expirationTime ~= nil and (expirationTime - GetTime()) > timeShift then
				local dur = expirationTime - GetTime() - (timeShift or 0);
				return true, count, dur;
			end
		end
	end
	return false, 0, 0;
end

function ConROC:BuffName(spellId, timeShift)
	timeShift = timeShift or 0;
	local spellName = GetSpellInfo(spellId);
	for i=1,16 do
		local name, _, _, _, _, expirationTime, _, _, _, spell = UnitAura('player', i, 'HELPFUL');
		if name == spellName then
			if expirationTime ~= nil and (expirationTime - GetTime()) > timeShift then
				local dur = expirationTime - GetTime() - (timeShift or 0);
				return true, dur;
			end
		end
	end
	return false, 0;
end

function ConROC:DebuffName(spellId)
	local spellName = GetSpellInfo(spellId);
	for i=1,16 do
		local name, _, count, _, _, _, _, _, _, spell = UnitAura('target', i, 'HARMFUL');
		if name == spellName then
			return true, count;
		end
	end
	return false, 0;
end

function ConROC:Form(spellID)
	for i=1,16 do 
		local _, _, count, _, _, _, _, _, _, spell = UnitAura("player", i);
			if spell == spellID then 
				return true, count;
			end
	end
	return false, 0;
end

function ConROC:TargetDebuff(spellID)
	for i=1,16 do 
		local _, _, count, _, _, _, _, _, _, spell = UnitAura("target", i, 'PLAYER|HARMFUL');
			if spell == spellID then 
				return true, count;
			end 
		 
	end
	return false, 0;
end

function ConROC:Buff(spellID, timeShift, filter)
	return self:UnitAura(spellID, timeShift, 'player', filter);
end

function ConROC:Cleansable(spellID)
	local isFriend = UnitIsFriend("player", "target");
	for i=1,16 do 
		local _, _, _, debuffType = UnitAura("target", i, 'HARMFUL');
		if isFriend then 
			return true;
		end
	end
	return false;
end

function ConROC:Purgable()
	local purgable = false;
	for i=1,16 do 
	local _, _, _, _, _, _, _, isStealable = UnitAura('target', i, 'HELPFUL');
		if isStealable == true then 
			purgable = true;
		end 
	end 
	return purgable;
end

function ConROC:Heroism()
	local _Bloodlust = 2825;
	local _TimeWarp	= 80353;
	local _Heroism = 32182;
	local _AncientHysteria = 90355;
	local _Netherwinds = 160452;
	local _DrumsofFury = 120257;
	local _DrumsofFuryBuff = 178207;
	local _DrumsoftheMountain = 142406;
	local _DrumsoftheMountainBuff = 230935;

	local _Exhaustion = 57723;
	local _Sated = 57724;
	local _TemporalDisplacement = 80354;
	local _Insanity = 95809;
	local _Fatigued = 160455;
	
	local buffed = false;
	local sated = false;
	
		local hasteBuff = {
			bl = ConROC:Aura(_Bloodlust, timeShift);
			tw = ConROC:Aura(_TimeWarp, timeShift);
			hero = ConROC:Aura(_Heroism, timeShift);
			ah = ConROC:Aura(_AncientHysteria, timeShift);
			nw = ConROC:Aura(_Netherwinds, timeShift);
			dof = ConROC:Aura(_DrumsofFuryBuff, timeShift);
			dotm = ConROC:Aura(_DrumsoftheMountainBuff, timeShift);
		}
		local satedDebuff = {
			ex = UnitDebuff('player', _Exhaustion);
			sated = UnitDebuff('player', _Sated);
			td = UnitDebuff('player', _TemporalDisplacement);
			ins = UnitDebuff('player', _Insanity);
			fat = UnitDebuff('player', _Fatigued);
		}
		local hasteCount = 0;
			for k, v in pairs(hasteBuff) do
				if v then
					hasteCount = hasteCount + 1;
				end
			end
				
		if hasteCount > 0 then
			buffed = true;
		end
		
		local satedCount = 0;
			for k, v in pairs(satedDebuff) do
				if v then
					satedCount = satedCount + 1;
				end
			end
				
		if satedCount > 0 then
			sated = true;
		end
			
	return buffed, sated;
end

function ConROC:InRaid()
	local numGroupMembers = GetNumGroupMembers();
	if numGroupMembers >= 5 then
		return true;
	else
		return false;
	end
end

function ConROC:IsSolo()
	local numGroupMembers = GetNumGroupMembers();
	if numGroupMembers <= 1 then
		return true;
	else
		return false;
	end
end

function ConROC:RaidBuff(spellID)
	local selfhasBuff = false;
	local haveBuff = false;
	local buffedRaid = false;

	local numGroupMembers = GetNumGroupMembers();
		if numGroupMembers >= 6 then
			for i = 1, numGroupMembers do -- For each raid member
				local unit = "raid" .. i;
				if UnitExists(unit) then
					for x=1, 40 do
						local spell = select(10, UnitAura(unit, x, 'HELPFUL'));
						if spell == spellID then
							haveBuff = true;
							break;
						end
					end
					if not haveBuff then
						break;
					end
				end
			end
		elseif numGroupMembers >= 1 then
			for i = 1, 4 do -- For each party member
				local unit = "party" .. i;
				if UnitExists(unit) then
					for x=1, 40 do
						local spell = select(10, UnitAura(unit, x, 'HELPFUL'));
						if spell == spellID then
							haveBuff = true;
							break;
						end
					end
					if not haveBuff then
						break;
					end
				end
			end
		end
		if UnitExists('player') then
			for x=1, 40 do
				local spell = select(10, UnitAura('player', x, 'HELPFUL')); 
				if spell == spellID then
					selfhasBuff = true;
					break;
				end
			end
		end
		if numGroupMembers == 0 then
			haveBuff = true;
		end
		if selfhasBuff and haveBuff then
			buffedRaid = true;
		end
--	self:Print(self.Colors.Info .. numGroupMembers);	
	return buffedRaid;
end

function ConROC:OneBuff(spellID)
	local selfhasBuff = false;
	local haveBuff = false;
	local someoneHas = false;

	local numGroupMembers = GetNumGroupMembers();
		if numGroupMembers >= 6 then
			for i = 1, numGroupMembers do -- For each raid member
				local unit = "raid" .. i;
				if UnitExists(unit) then
					for x=1, 40 do
						local spell = select(10, UnitAura(unit, x, 'PLAYER|HELPFUL'));
						if spell == spellID then
							haveBuff = true;
							break;
						end
					end
					if haveBuff then
						break;
					end
				end
			end
		elseif numGroupMembers >= 1 and numGroupMembers <= 5 then
			for i = 1, 4 do -- For each party member
				local unit = "party" .. i;
				if UnitExists(unit) then
					for x=1, 40 do
						local spell = select(10, UnitAura(unit, x, 'PLAYER|HELPFUL'));
						if spell == spellID then
							haveBuff = true;
							break;
						end
					end
					if haveBuff then
						break;
					end					
				end
			end
		end
		if UnitExists('player') then
			for x=1, 40 do
				local spell = select(10, UnitAura('player', x, 'PLAYER|HELPFUL')); 
				if spell == spellID then
					selfhasBuff = true;
					break;
				end
			end
		end
		if selfhasBuff or haveBuff then
			someoneHas = true;
		end
--	self:Print(self.Colors.Info .. numGroupMembers);		
	return someoneHas;
end

function ConROC:EndCast(target)
	target = target or 'player';
	local t = GetTime();
	local c = t * 1000;
	local gcd = 0;
	local _, _, _, _, endTime, _, _, _, spellId = CastingInfo('player');

	-- we can only check player global cooldown
	if target == 'player' then
		local gstart, gduration = GetSpellCooldown(29515);
		gcd = gduration - (t - gstart);

		if gcd < 0 then
			gcd = 0;
		end;
	end

	if not endTime then
		return gcd, nil, gcd;
	end

	local timeShift = (endTime - c) / 1000;
	if gcd > timeShift then
		timeShift = gcd;
	end

	return timeShift, spellId, gcd;
end

function ConROC:SameSpell(spell1, spell2)
	local spellName1 = GetSpellInfo(spell1);
	local spellName2 = GetSpellInfo(spell2);
	return spellName1 == spellName2;
end

function ConROC:TarYou()
	local tarYou = false;
	
	local targettarget = UnitName('targettarget');
	local targetplayer = UnitName('player');
	if targettarget == targetplayer then
		tarYou = true;
	end
	return tarYou;
end

function ConROC:TarHostile()
	local isEnemy = UnitReaction("player","target");
	local isDead = UnitIsDead("target");
		if isEnemy ~= nil then
			if isEnemy <= 4 and not isDead then
				return true;
			else
				return false;
			end
		end
	return false;
end

function ConROC:PercentHealth(unit)
	local unit = unit or 'target';
	local health = UnitHealth(unit);
	local healthMax = UnitHealthMax(unit);
	if health <= 0 or healthMax <= 0 then
		return 101;
	end
	return (health/healthMax)*100;
end

ConROC.Spellbook = {};
function ConROC:FindSpellInSpellbook(spellID)
	local spellName = GetSpellInfo(spellID);
	if ConROC.Spellbook[spellName] then
		return ConROC.Spellbook[spellName];
	end

	local _, _, offset, numSpells = GetSpellTabInfo(2);
	local booktype = 'spell';

	for index = offset + 1, numSpells + offset do
		local spellID = select(2, GetSpellBookItemInfo(index, booktype));
		if spellID and spellName == GetSpellBookItemName(index, booktype) then
			ConROC.Spellbook[spellName] = index;
			return index;
		end
	end

	return nil;
end


function ConROC:IsSpellInRange(spell, unit)
	local unit = unit or 'target';
	local range = false;
	local spellName = GetSpellInfo(spell);
	
	local inRange = IsSpellInRange(spellName, unit);
	
	if inRange == 1 then
		range = true;	
	end
	
    return range;
end

function ConROC:AbilityReady(spellid, timeShift, pet)
	local cd, maxCooldown = ConROC:Cooldown(spellid, timeShift + 1);
	local known = IsPlayerSpell(spellid);
	local usable, notEnough = IsUsableSpell(spellid);
	local castTimeMilli = select(4, GetSpellInfo(spellid));
	local rdy = false;
		if pet == 'pet' then
			known = IsSpellKnown(spellid, true);
		end
		if known and usable and cd <= 0 and not notEnough then
			rdy = true;
		else
			rdy = false;
		end
		if castTimeMilli ~= nil then
			castTime = castTimeMilli/1000;
		end
	return rdy, cd, maxCooldown, castTime;
end

function ConROC:ItemReady(itemid, timeShift)
	local cd, maxCooldown = ConROC:ItemCooldown(itemid, timeShift);
	local equipped = IsEquippedItem(itemid);
	local rdy = false;
		if equipped and cd <= 0 then
			rdy = true;
		else
			rdy = false;
		end
	return rdy, cd, maxCooldown;
end

function ConROC:SpellCharges(spellid)
	local currentCharges, maxCharges, cooldownStart, maxCooldown = GetSpellCharges(spellid);
	local currentCooldown = 10000;
		if currentCharges ~= nil and currentCharges < maxCharges then
			currentCooldown = (maxCooldown - (GetTime() - cooldownStart));
		end
	return currentCharges, maxCharges, currentCooldown, maxCooldown;
end

function ConROC:Raidmob()
	local classification = UnitClassification("target")
	local tlvl = UnitLevel("target")
	local plvl = UnitLevel("player")
	local strong = false
	
		if classification == "worldboss" or classification == "rareelite" or classification == "elite" then
			strong = true;
		elseif tlvl == -1 or tlvl > plvl + 2 then
			strong = true;
		end
		
	return strong
end

function ConROC:CreatureType(creatureCheck)
	local creatureType = UnitCreatureType("target");
	local locale = GetLocale();
--[[ 	* Beast
		* Dragonkin
		* Demon
		* Elemental
		* Giant
		* Undead
		* Humanoid
		* Critter
		* Mechanical
		* Not specified
		* Totem
		* Non-combat Pet
		* Gas Cloud ]]
	if creatureType ~= nil then
		if locale ~= "enUS" then
			if creatureType == "Wildtier" or creatureType == "Bestia" or creatureType == "Bête" or creatureType == "Fera" or creatureType == "Животное" or creatureType == "야수" or creatureType == "野兽" or creatureType == "野獸" then
				creatureType = "Beast";
			end
			--Critter
			if creatureType == "Dämon" or creatureType == "Demonio" or creatureType == "Démon" or creatureType == "Demone" or creatureType == "Demônio" or creatureType == "Демон" or creatureType == "악마" or creatureType == "恶魔" or creatureType == "惡魔" then
				creatureType = "Demon";
			end
			--Dragonkin
			if creatureType == "Elementar" or creatureType == "Élémentaire" or creatureType == "Elementale" or creatureType == "Элементаль" or creatureType == "정령" or creatureType == "元素生物" or creatureType == "元素生物" then
				creatureType = "Elemental";
			end
			--Giant
			--Humanoid
			if creatureType == "Mechanisch" or creatureType == "Mecánico" or creatureType == "Machine" or creatureType == "Meccanic" or creatureType == "Mecânic" or creatureType == "Механизм" or creatureType == "기계" or creatureType == "机械" or creatureType == "機械" then
				creatureType = "Mechanical";
			end
			if creatureType == "Untoter" or creatureType == "No-muerto" or creatureType == "Mort-vivant" or creatureType == "Non Morto" or creatureType == "Renegado" or creatureType == "Нежить" or creatureType == "언데드" or creatureType == "亡灵" or creatureType == "不死族" then
				creatureType = "Undead";
			end
		end

		if creatureCheck == creatureType then
			return true;
		end
	end
	return false;
end

function ConROC:ExtractTooltip(spell, pattern)
	local _pattern = gsub(pattern, "%%s", "([%%d%.,]+)");

	if not TDSpellTooltip then
		CreateFrame('GameTooltip', 'TDSpellTooltip', UIParent, 'GameTooltipTemplate');
		TDSpellTooltip:SetOwner(UIParent, "ANCHOR_NONE")
	end
	TDSpellTooltip:SetSpellByID(spell);

	for i = 2, 4 do
		local line = _G['TDSpellTooltipTextLeft' .. i];
		local text = line:GetText();

		if text then
			local cost = strmatch(text, _pattern);
			if cost then
				cost = cost and tonumber((gsub(cost, "%D", "")));
				return cost;
			end
		end
	end

	return 0;
end

function ConROC:GlobalCooldown()
	local _, duration, enabled = GetSpellCooldown(29515);
		return duration;
end

function ConROC:Cooldown(spellid, timeShift)
	local start, maxCooldown, enabled = GetSpellCooldown(spellid);
	if enabled and maxCooldown == 0 and start == 0 then
		return 0, maxCooldown;
	elseif enabled then
		return (maxCooldown - (GetTime() - start) - (timeShift or 0)), maxCooldown;
	else
		return 100000, maxCooldown;
	end;
end

function ConROC:ItemCooldown(itemid, timeShift)
	local start, maxCooldown, enabled = GetItemCooldown(itemid);
	if enabled and maxCooldown == 0 and start == 0 then
		return 0, maxCooldown;
	elseif enabled then
		return (maxCooldown - (GetTime() - start) - (timeShift or 0)), maxCooldown;
	else
		return 100000, maxCooldown;
	end;
end

--[[function ConROC:Interrupt()				--Classic Broke
	if UnitCanAttack ('player', 'target') then
		local tarchan, _, _, _, _, _, cnotInterruptible = UnitChannelInfo("target");
		local tarcast, _, _, _, _, _, _, notInterruptible = UnitCastingInfo("target");
		
		if tarcast and not notInterruptible then
			return true;
		elseif tarchan and not cnotInterruptible then
			return true;
		else
			return false;
		end
	end
end]]

function ConROC:CallPet()
	local petout = IsPetActive();
	local mounted = IsMounted();
	local summoned = true;
		if not petout and not mounted then
			summoned = false;
		end
	return summoned;
end
	
function ConROC:PetAssist()
	local mounted = IsMounted();
	local affectingCombat = IsPetAttackActive();
	local attackstate = true;
	local passive = false;
		for i = 1, 24 do
			local name, _, _, isActive = GetPetActionInfo(i)
			if name == 'PET_MODE_PASSIVE' and isActive then
				passive = true;
			end
		end
		if not affectingCombat and passive and not mounted then
			attackstate = false;
		end
	return attackstate;
end

function ConROC:Equipped(itemType, slotName)
	local slotID = GetInventorySlotInfo(slotName);
	local itemID = GetInventoryItemID("player", slotID);
		if itemID ~= nil then
			local _, _, _, _, _, _, equippedType = GetItemInfo(itemID);
				if itemType == equippedType then
					return true;
				end
		end
	return false;
end

function ConROC:CheckBox(checkBox)
	local boxChecked = false;
		if checkBox ~= nil then
			boxChecked = checkBox:GetChecked();
		end
	return boxChecked;
end

function ConROC:FormatTime(left)
	local seconds = left >= 0        and math.floor((left % 60)    / 1   ) or 0;
	local minutes = left >= 60       and math.floor((left % 3600)  / 60  ) or 0;
	local hours   = left >= 3600     and math.floor((left % 86400) / 3600) or 0;
	local days    = left >= 86400    and math.floor((left % 31536000) / 86400) or 0;
	local years   = left >= 31536000 and math.floor( left / 31536000) or 0;

	if years > 0 then
		return string.format("%d [Y] %d [D] %d:%d:%d [H]", years, days, hours, minutes, seconds);
	elseif days > 0 then
		return string.format("%d [D] %d:%d:%d [H]", days, hours, minutes, seconds);
	elseif hours > 0 then
		return string.format("%d:%d:%d [H]", hours, minutes, seconds);
	elseif minutes > 0 then
		return string.format("%d:%d [M]", minutes, seconds);
	else
		return string.format("%d [S]", seconds);
	end
end