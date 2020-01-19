﻿-- Configure 配置页面
local _, ns = ...
local _, R = unpack(ns)

-- BUFF/DEBUFF相关
R.Auras = {
	IconSize		= 32,											-- BUFF图标大小
	BuffPos			= {"TOPRIGHT", Minimap, "TOPLEFT", -21, -3},		-- BUFF默认位置
	TotemsPos		= {"CENTER", UIParent, "CENTER", 0, -260},		  -- 图腾助手默认位置
	EnergyPos	= {"CENTER", UIParent, "CENTER", 0, -195},		    -- 职业能量条默认位置
	ComboPointPos	= {'BOTTOM', UIParent, "CENTER", 16, -210},
	WarlockPowerPos	= {'BOTTOM', UIParent, "CENTER", 0, -210},
	PaladinPowerPos	= {'BOTTOM', UIParent, "CENTER", 0, -180},
	RunePos	= {'BOTTOM', UIParent, "CENTER", 0, -200},
	MonkHarmonyPos	= {'BOTTOM', UIParent, "CENTER", 90, -190},
	MonkStaggerPos	= {'BOTTOM', UIParent, "CENTER", 0, -190},
	MageArcaneChargesPos	= {'BOTTOM', UIParent, "CENTER", 0, -200},
	
  -- 技能监控各组初始位置
	PlayerAuraPos	= {"RIGHT", UIParent, "CENTER", -360, -160},	    -- 玩家光环分组
	TargetAuraPos   = {"LEFT", UIParent, "CENTER", 240, -155},		    -- 目标光环分组
	SpecialPos		= {"RIGHT", UIParent, "CENTER", -240, -155},	    -- 玩家重要光环分组
	FocusPos	    = {"LEFT", UIParent, "CENTER", 360, -160},		    -- 焦点光环分组
	CDPos		    = {"RIGHT", UIParent, "CENTER", -400, -220},	    -- 冷却计时分组
	EnchantPos		= {"RIGHT", UIParent, "CENTER", -203.5, -152.5},	    -- 附魔及饰品分组
	RaidBuffPos		= {"RIGHT", UIParent, "CENTER", -162, -150.5},		-- 团队增益分组
	RaidDebuffPos	= {"LEFT", UIParent, "CENTER", 162, -150.5},			-- 团队减益分组
	WarningPos		= {"LEFT", UIParent, "CENTER", 203.5, -152.5},		    -- 目标重要光环分组
	InternalPos		= {"RIGHT", UIParent, "CENTER", -450, -250},	        -- 法术内置冷却分组
}

-- 小地图
R.Minimap = {
	Pos				= {"TOPRIGHT", UIParent, "TOPRIGHT", 0, 0},	-- 小地图位置
}

-- 美化及皮肤
R.Skins = {
	MicroMenuPos 	= {"BOTTOMRIGHT", Minimap, "BOTTOMLEFT", 1, -3},			-- 微型菜单默认坐标
	RMPos  			= {"LEFT", UIParent, "BOTTOMLEFT", 3, 210},					-- 团队工具默认坐标
	PMPos  			= {"TOPLEFT", UIParent, "TOPLEFT", 310, -160},					-- 小队默认坐标
}

-- 鼠标提示框
R.Tooltips = {
	TipPos 	= {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -55, 210},		-- 鼠标提示框默认位置
}

-- 信息条
R.Infobar = {
	Location		= true,												-- 区域信息
	LocationPos		= {"TOP", UIParent,"TOP", 0, -3},					-- 区域信息位置
	Spec			= true,												-- 天赋专精
	SpecPos			= {"TOPLEFT", UIParent,"TOPLEFT",0, 0},				-- 天赋专精位置
	Time			= true,												-- 时间信息
	TimePos			= {"TOPLEFT", UIParent, "TOPLEFT", 0, 2},			-- 时间信息位置
	Guild	 		= true,												-- 公会信息
	GuildPos 		= {"TOPLEFT", UIParent, "TOPLEFT", 95, -3},			-- 公会信息位置
	Friends 		= true,												-- 好友模块
	FriendsPos 		= {"TOPLEFT", UIParent, "TOPLEFT", 130, -3},		-- 好友模块位置
	Durability		= true,												-- 耐久度
	DurabilityPos	= {"TOPLEFT", UIParent, "TOPLEFT", 180, -3},		-- 耐久度位置
	System			= true,												-- 帧数/延迟
	SystemPos		= {"TOPLEFT", UIParent, "TOPLEFT", 220, -3},		-- 帧数/延迟位置
	Memory			= true,												-- 内存占用
	MemoryPos		= {"TOPLEFT", UIParent, "TOPLEFT", 320, -3},		-- 内存占用位置
	MaxAddOns		= 21,												-- 插件信息显示数量
	Bags            = true,
	BagsPos         = {"TOPLEFT", UIParent, "TOPLEFT", 370, -3},
	Gold			= true,												-- 金币信息
	GoldPos			= {"TOPLEFT", UIParent, "TOPLEFT", 400, -3}, 	    -- 金币信息位置
	
	Fonts			= {"Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 14, "OUTLINE"},				-- 字体
	TimeFonts       = {"Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 24, "outline"},
	TTFonts         = {STANDARD_TEXT_FONT, 18, "outline"},
	FontSize		= 13,
	AutoAnchor		= true,												-- 自动对齐
}