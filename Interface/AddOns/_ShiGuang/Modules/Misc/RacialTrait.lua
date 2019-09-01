
--------------------------## Author: Witness
-- 自动生成种族技能宏
-- 法术ID参考：https://cn.wowhead.com/racial-traits?filter=50;2;0
--------------------------

local SpellList = {
    59752,	--人类(自利)
    33702,	--兽人(血性狂怒)
	33697,	--兽人(血性狂怒)
	20572,	--兽人(血性狂怒)
	20594,	--矮人(石像形态)
	58984,	--暗夜精灵(影遁)
	7744,	--亡灵(被遗忘者的意志)
	20549,	--牛头人(战争践踏)
	20589,	--侏儒(逃命专家)
	26297,	--巨魔(狂暴)
	69070,	--地精(火箭跳)
	28730,	--血精灵(奥术洪流)
	25046,	--血精灵(奥术洪流)
	80483,	--血精灵(奥术洪流)
	69179,	--血精灵(奥术洪流)
	50613,	--血精灵(奥术洪流)
	129597,	--血精灵(奥术洪流)
	202719,	--血精灵(奥术洪流)
	155145,	--血精灵(奥术洪流)
	232633,	--血精灵(奥术洪流)
	28880,	--德莱尼(纳鲁的赐福)
	59542,	--德莱尼(纳鲁的赐福)
	59543,	--德莱尼(纳鲁的赐福)
	59544,	--德莱尼(纳鲁的赐福)
	59545,	--德莱尼(纳鲁的赐福)
	59547,	--德莱尼(纳鲁的赐福)
	59548,	--德莱尼(纳鲁的赐福)
	121093,	--德莱尼(纳鲁的赐福)
	68992,	--狼人(疾步夜行)
	107079,	--熊猫人(震山掌)
	260364,	--夜之子(奥术脉冲)
	255654,	--至高岭牛头人(蛮牛冲撞)
	256948,	--虚空精灵(空间裂隙)
	255647,	--光铸德莱尼(圣光裁决者)
	265221,	--黑铁矮人(烈焰之血)
	274738,	--玛格汉兽人(先祖召唤)
	291944,	--赞达拉巨魔(再生！)
	287712,	--库尔提拉斯人(强力一击)
}

local function SpellIDCheck()
	for _, spellID in ipairs(SpellList) do
		if IsSpellKnown(spellID) then
			return spellID
		end
	end
end

local function Macro_Refresh()
    local name = GetMacroInfo("          ")
    local spellID = SpellIDCheck()
    if InCombatLockdown() then return end
    if spellID then
        if not name then
            if GetNumMacros() >= 72 then
                DEFAULT_CHAT_FRAME:AddMessage("RacialTrait：通用宏已达上限.")
            else
                local macroId = CreateMacro("          ", "INV_MISC_QUESTIONMARK", "#showtooltip\n/cast " .. GetSpellInfo(spellID), nil, 1)
                DEFAULT_CHAT_FRAME:AddMessage("RacialTrait：宏已创建.")
            end
        else
            local macroId = EditMacro("          ", nil, "INV_MISC_QUESTIONMARK", "#showtooltip\n/cast " .. GetSpellInfo(spellID))
            --DEFAULT_CHAT_FRAME:AddMessage("RacialTrait：宏已刷新.")
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("RacialTrait：未找到法术ID.")
    end
end

local RacialTrait = CreateFrame("Frame")
RacialTrait:RegisterEvent("PLAYER_ENTERING_WORLD")
RacialTrait:RegisterEvent("LEARNED_SPELL_IN_TAB")
RacialTrait:SetScript("OnEvent", function(self, event)
    --print("|cff64C2F5["..date("%H:%M:%S",GetServerTime()).."]|r ",event)
	if event == "PLAYER_ENTERING_WORLD" then
		Macro_Refresh()
	end
	if event == "LEARNED_SPELL_IN_TAB" then
		local _, instType, _, _, _, _, _, instID = GetInstanceInfo()
		if instType == "raid" and instID == 2070 then
			C_Timer.After(5, function()
				Macro_Refresh()
			end)
		end
	end
end)

SlashCmdList["RACIALTRAIT"] = function()
	Macro_Refresh()
end
SLASH_RACIALTRAIT1 = "/RacialTrait"