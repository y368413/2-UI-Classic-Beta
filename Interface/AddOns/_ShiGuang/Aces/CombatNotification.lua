-- by ElvUI
E = {
	SendDefault = true,				-- 只自己能看到	
	HideCombat = true,				-- 开关 进战, 脱战
	lfgnoti = true,						-- 开关 随机奖励包
	wgtimenoti = true,				-- 开关 冬拥湖, 托巴拉德
	Feasts = true,					-- 开关 大餐, 宴席, 法师召唤餐桌
	Soulwell = true,					-- 开关 灵魂之井(术士糖锅)
	SummonRitual = true,			-- 开关 召唤仪式(术士拉人的门)
	Portals = true,					-- 开关 法师传送门, 烈酒遥控器
	Bots = true,						-- 开关 修理机器人, 布林顿4000&5000, 随身邮箱
	Toys = true,						-- 开关 玩具火车, 火鸡的羽毛, 自动跳舞信号发射器(跳舞手雷)
	ItemsPrompt = true,			-- 进副本提醒是否需要更换装备.
	Epos = {"CENTER",UIParent,0,210},	-- 动态提示位置
  Fontsize = 30,						-- 动态提示字号
}

IDtable = {
	Portals = {
		-- Alliance联盟
		[10059] = true,		-- Stormwind暴风城
		[11416] = true,		-- Ironforge铁炉堡
		[11419] = true,		-- Darnassus达纳苏斯
		[32266] = true,		-- Exodar埃索达
		[49360] = true,		-- Theramore塞拉摩
		[33691] = true,		-- Shattrath沙塔斯
		[88345] = true,		-- Tol Barad托尔巴拉德
		[132620] = true,	-- Vale of Eternal Blossoms 锦绣谷
		[176246] = true,	-- 暴風之盾
		-- Horde部落
		[11417] = true,		-- Orgrimmar奥格瑞玛
		[11420] = true,		-- Thunder Bluff雷霆崖
		[11418] = true,		-- Undercity幽暗城
		[32267] = true,		-- Silvermoon银月城
		[49361] = true,		-- Stonard斯通纳德
		[35717] = true,		-- Shattrath沙塔斯
		[88346] = true,		-- Tol Barad托尔巴拉德
		[132626] = true,	-- Vale of Eternal Blossoms 锦绣谷
		[176244] = true,	-- 战争之矛
		-- Alliance/Horde
		[53142] = true,		-- Dalaran 达拉然
        [120146] = true,	-- 远古达拉然
		[49844] = true,		-- Direbrew Remote 烈酒遥控器
		--[73324] = true,		-- 达拉然 (橙斧奖励)
	},
	Bots = {
		[22700] = true,		-- 修理机器人74A型
		[44389] = true,		-- 战地修理机器人110G
		[54711] = true,		-- 废物贩卖机器人
		[67826] = true,		-- 基维斯
		[126459] = true,	-- 布林顿4000
		[157066] = true,	-- 沃尔特
		[161414] = true,	-- 布林顿5000
		[199109] = true,	-- 自動鐵錘
	    [226241] = true,	-- 靜心寶典
	},
	Flask = {		
		--156080,	-- 德拉诺强效力量合剂
		--156064,	-- 德拉诺强效敏捷合剂
		--156079,	-- 德拉诺强效智力合剂
		--156084,	-- 德拉诺强效耐力合剂
		--188031,	-- 1300智力-- 耳语契约
		--188033,	-- 1300敏捷-- 第七恶魔
		--188034,	-- 1300力量-- 千万战痕
		--188035,	-- 1950耐力-- 无尽大军
		188116, -- flask from cauldron
		251836,-- agility
		251837,-- intellect
		251838,-- 357 stamina
		251839,-- strength
	},
	Food = {
		104280,	-- Well Fed 充分进食
		104273, -- 充分进食
		--188534, -- 魔口狂鱼
	},
	Rune = {     -- 符文
		224001,
		270058,
	},
}

local GetNextChar = function(word,num)
	-- 达到的效果就是除了最后一个特殊token之外所有的特殊token都会带上一个字符一起输出
	local specialTokenPattern = {"|cff%w%w%w%w%w%w", "|r", "|Hspell:%d+", "|h", "|Hitem:%d+",":%d+", ":%-%d+"}
	local isFindSpecialToken = false
	local tempNum = num
	-- repeat直到找不到特殊token为止 记录下所有特殊token的长度
	-- 这会将|r|cff123456wtf这样的内容中连续的特殊token一次性找出
	repeat
		isFindSpecialToken = false
		for _, v in pairs(specialTokenPattern) do
			local startIndex, endIndex = word:find(v, tempNum)
			if startIndex == tempNum then
				tempNum = tempNum + (endIndex - startIndex + 1)
				isFindSpecialToken = true
				break
			end
		end
	until not isFindSpecialToken
		local tokenLength = tempNum - num
	local c = word:byte(num + tokenLength)
	local shift
	
	if not c then
		if tokenLength > 0 then
			-- 兼容token是字符串末尾的情况 输出token本身
			-- 不过个人认为字符串末尾的token即使不输出也没有问题 未测试
			return word:sub(num, num + tokenLength - 1), (num + tokenLength)
		else
			return "",num
		end
	end
	
	if (c > 0 and c <= 127) then
		shift = 1
	elseif (c >= 192 and c <= 223) then
		shift = 2
	elseif (c >= 224 and c <= 239) then
		shift = 3
	elseif (c >= 240 and c <= 247) then
		shift = 4
	end
	
	shift = shift + tokenLength
	return word:sub(num, num + shift - 1), (num + shift)
end

local updaterun = CreateFrame("Frame")

local flowingframe = CreateFrame("Frame",nil,UIParent)
	flowingframe:SetFrameStrata("HIGH")
	flowingframe:SetPoint(unpack(E.Epos)) --("CENTER",UIParent,0,140)
	flowingframe:SetHeight(64)
	flowingframe:SetScript("OnUpdate", FadingFrame_OnUpdate)
	flowingframe:Hide()
	flowingframe.fadeInTime = 0
	flowingframe.holdTime = 3
	flowingframe.fadeOutTime = 0.5
	
local flowingtext = flowingframe:CreateFontString(nil,"OVERLAY")
	flowingtext:SetPoint("Left")
	flowingtext:SetFont(GameFontNormal:GetFont(), E.Fontsize, 'OUTLINE')	-- 字体
	flowingtext:SetShadowOffset(0,0)
	flowingtext:SetJustifyH("LEFT")
	
local rightchar = flowingframe:CreateFontString(nil,"OVERLAY")
	rightchar:SetPoint("LEFT",flowingtext,"RIGHT")
	rightchar:SetFont(GameFontNormal:GetFont(), E.Fontsize+20, 'OUTLINE')		-- 动态效果字体(大)
	rightchar:SetShadowOffset(0,0)
	rightchar:SetJustifyH("LEFT")

local count,len,step,word,stringE,a

local speed = .03333

local nextstep = function()
	a,step = GetNextChar (word,step)
	flowingtext:SetText(stringE)
	stringE = stringE..a
	rightchar:SetText(a)
end

local updatestring = function(self,t)
	count = count - t
	if count < 0 then
		if step > len then 
			self:Hide()
			flowingtext:SetText(stringE)
			FadingFrame_Show(flowingframe)
			rightchar:SetText("")
			word = ""
		else 
			nextstep()
			FadingFrame_Show(flowingframe)
			count = speed
		end
	end
end

updaterun:SetScript("OnUpdate",updatestring)
updaterun:Hide()

ElvUIAlertRun = function(f,r,g,b)
	flowingframe:Hide()
	updaterun:Hide()
	
		flowingtext:SetText(f)
		local l = flowingtext:GetWidth()
		
	local color1 = r or 1
	local color2 = g or 1
	local color3 = b or 1
	
	flowingtext:SetTextColor(color1*.95,color2*.95,color3*.95)
	rightchar:SetTextColor(color1,color2,color3)
	
	word = f
	len = f:len()
	step = 1
	count = speed
	stringE = ""
	a = ""
	
		flowingtext:SetText("")
		flowingframe:SetWidth(l)
		
	rightchar:SetText("")
	FadingFrame_Show(flowingframe)
	updaterun:Show()
end

CheckChat = function(warning)
	if (not IsInGroup(LE_PARTY_CATEGORY_HOME) or not IsInRaid(LE_PARTY_CATEGORY_HOME)) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
		return "INSTANCE_CHAT"
	elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
		if warning and (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") or IsEveryoneAssistant()) then
			return "RAID_WARNING"
		else
			return "RAID"
		end
	elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
		return "PARTY"
	end
	return "SAY"
end

local CombatNotification = CreateFrame ("Frame")
-- 进战/脱战
if E.HideCombat == true then
	--SetCVar("fctCombatState", 0)
	CombatNotification:RegisterEvent("PLAYER_REGEN_ENABLED")
	CombatNotification:RegisterEvent("PLAYER_REGEN_DISABLED")
	CombatNotification:SetScript("OnEvent", function (self,event)
		if (UnitIsDead("player")) then return end
		if event == "PLAYER_REGEN_ENABLED" then
			ElvUIAlertRun(COMBATNOTIFICATIONINFO_combat_leav,0.1,1,0.1)
		elseif event == "PLAYER_REGEN_DISABLED" then
			ElvUIAlertRun(COMBATNOTIFICATIONINFO_combat_enter,1,0.1,0.1)
		end	
	end)
end

-----------
-- 扩展 --
-----------
local Announces = CreateFrame("Frame")
Announces:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
Announces:SetScript("OnEvent", function(self, event, _, subEvent, _, _, srcName, _, _, _, destName, _, _, spellID)
	if not IsInGroup() or InCombatLockdown() or not subEvent or not spellID or not srcName then return end
	if not UnitInRaid(srcName) and not UnitInParty(srcName) then return end

	local srcName = format(srcName:gsub("%-[^|]+", ""))
	if subEvent == "SPELL_CAST_SUCCESS" then
		-- 6.0 德拉诺: 千水鱼宴, 红肉盛宴, 狂野大餐, 
	  if E.Feasts and (spellID == 160914 or spellID == 160740 or spellID == 175215) then
			ElvUIAlertRun(string.format("<%s> → %s", srcName, GetSpellLink(spellID)))
			if E.SendDefault then DEFAULT_CHAT_FRAME:AddMessage(string.format('|cffff3333=>|r·'.. "<%s> → %s", srcName, GetSpellLink(spellID))) end
		-- 法师召唤餐桌
		elseif E.Feasts and spellID == 43987 then			
			ElvUIAlertRun(string.format("<%s> → %s", srcName, GetSpellLink(spellID)))
			if E.SendDefault then DEFAULT_CHAT_FRAME:AddMessage(string.format('|cffff3333=>|r·'.. "<%s> → %s", srcName, GetSpellLink(spellID))) end
		-- 召唤仪式
		elseif E.SummonRitual and spellID == 698 then		
			ElvUIAlertRun(string.format(COMBATNOTIFICATIONINFO_CLICK, srcName, GetSpellLink(spellID)))
			if E.SendDefault then DEFAULT_CHAT_FRAME:AddMessage(string.format('|cffff3333=>|r·'.. COMBATNOTIFICATIONINFO_CLICK, srcName, GetSpellLink(spellID))) end
		end
		
	elseif subEvent == "SPELL_SUMMON" then
		-- Repair Bots 修理机器人, 布林顿4000&5000
		if E.Bots and IDtable.Bots[spellID] then
			ElvUIAlertRun(string.format("<%s> → %s", srcName, GetSpellLink(spellID)))
			if E.SendDefault then DEFAULT_CHAT_FRAME:AddMessage(string.format('|cffff3333=>|r·'.. "<%s> → %s", srcName, GetSpellLink(spellID))) end
		end
		
	elseif subEvent == "SPELL_CREATE" then
		-- Soulwell   灵魂之井
		if E.Soulwell and spellID == 29893 then
			ElvUIAlertRun(string.format("<%s> → %s", srcName, GetSpellLink(spellID)))
			if E.SendDefault then DEFAULT_CHAT_FRAME:AddMessage(string.format('|cffff3333=>|r·'.. "<%s> → %s", srcName, GetSpellLink(spellID))) end
		-- MOLL-E 随身邮箱
		elseif E.Bots and spellID == 54710 then
			ElvUIAlertRun(string.format("<%s> → %s", srcName, GetSpellLink(spellID)))
			if E.SendDefault then DEFAULT_CHAT_FRAME:AddMessage(string.format('|cffff3333=>|r·'.. "<%s> → %s", srcName, GetSpellLink(spellID))) end
		-- Toys 玩具火车
		elseif E.toys and spellID == 61031 then
			ElvUIAlertRun(string.format("<%s> → %s", srcName, GetSpellLink(spellID)))
			if E.SendDefault then DEFAULT_CHAT_FRAME:AddMessage(string.format('|cffff3333=>|r·'.. "<%s> → %s", srcName, GetSpellLink(spellID))) end
		-- Portals 法师传送门,烈酒遥控器
		elseif E.Portals and IDtable.Portals[spellID] then
			ElvUIAlertRun(string.format("<%s> # %s", srcName, GetSpellLink(spellID)))
			if E.SendDefault then DEFAULT_CHAT_FRAME:AddMessage(string.format('|cffff3333=>|r·'.. "<%s> # %s", srcName, GetSpellLink(spellID))) end
		end
		
	elseif subEvent == "SPELL_AURA_APPLIED" then
		-- Turkey Feathers and Party G.R.E.N.A.D.E. 火鸡的羽毛, 自动跳舞信号发射器
		if E.Toys and (spellID == 61781 or ((spellID == 51508 or spellID == 51510) and destName == select(1, UnitName("player")))) then		
			ElvUIAlertRun(string.format("<%s> # %s", srcName, GetSpellLink(spellID)))
			if E.SendDefault then DEFAULT_CHAT_FRAME:AddMessage(string.format('|cffff3333=>|r·'.. "<%s> # %s", srcName, GetSpellLink(spellID))) end
		end
	end
end)