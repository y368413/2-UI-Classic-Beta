local _, ns = ...
local _, R = unpack(ns)

R.CoolDownData = {
	-- Shaman | ����
	[108280] = 180,		-- ����֮��ͼ��
	[114052] = 180,		-- ����(����)
	[98008] = 180,		-- �������ͼ��
	[192077] = 120,		-- ���ͼ��
	-- Druid | ��³��
	[740] = 180,		-- ����, ���츳120
	[33891] = 180,		-- ��������֮��
	[106898] = 120,		-- ��ŭ��
	-- Monk | ��ɮ
	[198644] = 180,		-- ��׳ྫ
	[115310] = 180,		-- ������
	-- ������
	[1766] = 15, -- Kick (Rogue)
	[2139] = 24, -- Counterspell (Mage)
	[6552] = 15, -- Pummel (Warrior)
	[19647] = 15, -- Spell Lock (Warlock)
	[47528] = 15, -- Mind Freeze (Death Knight)
	[57994] = 12, -- Wind Shear (Shaman)
	[91802] = 12, -- Shambling Rush (Death Knight)
	[96231] = 15, -- Rebuke (Paladin)
	[106839] = 15, -- Skull Bash (Feral)
	[115781] = 15, -- Optical Blast (Warlock)
	[116705] = 15, -- Spear Hand Strike (Monk)
	[132409] = 24, -- Spell Lock (Warlock With Sacrifice)
	[147362] = 24, -- Counter Shot (Hunter)
	[171138] = 24, -- Countershot (Hunter)
	[183752] = 15, -- Disrupt
	[187707] = 15, -- Muzzle
	[212619] = 15, -- Call Felhunter (Warlock)
	[231665] = 15, -- Avengers Shield (Paladin)
	
	--[15487] = 45, -- Silence
	--[78675] = 60, -- Solar Beam
	--[119910] = 24,  -- Spell Lock  (With pet)
	
}

R.RaidSpells = {
	-- Battle resurrection
	[20484] = 600,	-- ����
	[61999] = 600,	-- ��������
	[20707] = 600,	-- Soulstone
	-- Heroism
	[32182] = 300,	-- Ӣ��
	[2825] = 300,	-- ��Ѫ
	[80353] = 300,	-- ʱ��Ť��
	[90355] = 300,	-- Զ�ſ���
	-- Healing ̧Ѫ����
	[633] = 600,	-- Lay on Hands
	[740] = 180,--����
	[115310] = 180,--������
	[64843] = 180,--��ʥ����ʫ
	[108280] = 180,--����֮��ͼ��
	[15286] = 180,--��Ѫ���ӵ��
	[108281] = 120,	-- Ancestral Guidance
	-- Defense
	[88611] = 180,	-- Smoke Bomb
	[116849] = 120,	-- Life Cocoon
	--�������
	[33206] = 180,--ʹ��ѹ��
	[6940] = 120,--����֮��
	[102342] = 60,--��ľ��Ƥ
	[114030] = 120,--����
	[47788] = 180,--�ػ�֮��
	--�Ŷ����˼���	
	[97462] = 180,  -- �����ź�
	[31821] = 180,  -- �Ϲ⻷(NQ)
	[62618] = 180,  -- ������: ��
	[98008] = 180,  -- �������ͼ��
	[196718] = 180, --��Ӱ���(DH)
	[51052] = 120, --��ħ������
	--������
	--	[172106] = 180,  -- ����ػ�
	[106898] = 120,  -- Ⱥ��ŭ��
	[192077] = 120, --[192077] = {120, class = "SHAMAN", talent = 21963}, --Wind Rush Totem (10yd aoe, 15s, +60% movement speed for 5s), talent
	--	[159916] = 120, --ħ����Ч
	--�Ƚ�
	[187616] = 120, --����ķ˹(�������)
	[187617] = 120, --����ͼ˹(̹��)
	[187618] = 120, --��ɪ��³˹(����)
	[187619] = 120, --������˹(�������)
	[187620] = 120, --��³˹(�������)
	--���Ƽ���CD
	[46968] = 40,  --�𵴲�
	[115750]= 90,  --äĿ֮��
	[108199]= 180,  --Ѫħ֮��
	[102359]= 30,  --Ⱥ�����
	[179057]= 60,  --��������
	[119381]= 45,  --ɨ����
	[192058]= 45,  --���籼ӿͼ��
	[109248]= 45,  --�������
	[122]= 30,  --��˪����
	[30283]= 30,  --��Ӱ֮ŭ
	[132469]= 30,  --����
	[78675]= 60,  --�չ���	
	[196932]= 30,  --�׶�ͼ��
	[51485]= 30,  --�ݵ�ͼ��
	[113724]= 45,  --��˪֮��
	[31661]= 20,  --��Ϣ��
	--
	[29166] = 180,	-- ����
}
R.enemy_spells = {
	-- Interrupts and Silences
	[57994] = 12, -- Wind Shear
	[47528] = 15,	 -- Mind Freeze
	[106839] = 15,	-- Skull Bash
	[116705] = 15,	-- Spear Hand Strike
	[96231] = 15,	-- Rebuke
	[1766] = 15,	-- Kick
	[6552] = 15,	-- Pummel
	[147362] = 24,	-- Counter Shot
	[2139] = 24,	-- Counterspell
	[19647] = 24,	-- Spell Lock
	[115781] = 24,	-- Optical Blast
	[15487] = 45,	-- Silence
	[47476] = 60,	-- Strangulate
	[78675] = 60,	-- Solar Beam
	-- Crowd Controls
	[115078] = 15,	-- Paralysis
	[20066] = 15,	-- Repentance
	[187650] = 30,	-- Freezing Trap
	[8122] = 30,	-- Psychic Scream
	[30283] = 30,	-- Shadowfury
	[107570] = 30,	-- Storm Bolt
	[51514] = 30,	-- Hex
	[5484] = 40,	-- Howl of Terror
	[108194] = 45,	-- Asphyxiate
	[19386] = 45,	-- Wyvern Sting
	[113724] = 45,	-- Ring of Frost
	[119381] = 45,	-- Leg Sweep
	[64044] = 45,	-- Psychic Horror
	[6789] = 45,	-- Mortal Coil
	[853] = 60,		-- Hammer of Justice
	-- Defense abilities
	[48707] = 60,	-- Anti-Magic Shell
	[31224] = 90,	-- Cloak of Shadows
	[46924] = 90,	-- Bladestorm
	[287081] = 60,	-- Lichborne
	[213664] = 120,	-- Nimble Brew
	[47585] = 120,	-- Dispersion
	[1856] = 120,	-- Vanish
	[7744] = 120,	-- Will of the Forsaken (Racial)
	[186265] = 180,	-- Aspect of the Turtle
	[33206] = 180,	-- Pain Suppression
}
	
R.pulse_ignored_spells = {
	--GetSpellInfo(spellID),	-- Spell name
}