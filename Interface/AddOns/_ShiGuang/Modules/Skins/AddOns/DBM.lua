local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")
local TT = M:GetModule("Tooltip")

local strfind, strmatch, gsub = string.find, string.match, string.gsub

function S:DBMSkin()
	-- Default notice message
	local RaidNotice_AddMessage_ = RaidNotice_AddMessage
	RaidNotice_AddMessage = function(noticeFrame, textString, colorInfo)
		if strfind(textString, "|T") then
            if strmatch(textString, ":(%d+):(%d+)") then
                local size1, size2 = strmatch(textString, ":(%d+):(%d+)")
                size1, size2 = size1 + 3, size2 + 3
                textString = gsub(textString,":(%d+):(%d+)",":"..size1..":"..size2..":0:0:64:64:5:59:5:59")
            elseif strmatch(textString, ":(%d+)|t") then
                local size = strmatch(textString, ":(%d+)|t")
                size = size + 3
                textString = gsub(textString,":(%d+)|t",":"..size..":"..size..":0:0:64:64:5:59:5:59|t")
            end
		end
		return RaidNotice_AddMessage_(noticeFrame, textString, colorInfo)
	end

	if not IsAddOnLoaded("DBM-Core") then return end
	if not MaoRUISettingDB["Skins"]["DBM"] then return end

	local buttonsize = 24
	local function SkinBars(self)
		for bar in self:GetBarIterator() do
			if not bar.injected then
				local frame		= bar.frame
				local tbar		= _G[frame:GetName().."Bar"]
				local spark		= _G[frame:GetName().."BarSpark"]
				local texture	= _G[frame:GetName().."BarTexture"]
				local icon1		= _G[frame:GetName().."BarIcon1"]
				local icon2		= _G[frame:GetName().."BarIcon2"]
				local name		= _G[frame:GetName().."BarName"]
				local timer		= _G[frame:GetName().."BarTimer"]

				if not (icon1.overlay) then
					icon1.overlay = CreateFrame("Frame", "$parentIcon1Overlay", tbar)
					icon1.overlay:SetSize(buttonsize+2, buttonsize+2)
					icon1.overlay:SetFrameStrata("BACKGROUND")
					icon1.overlay:SetPoint("BOTTOMRIGHT", tbar, "BOTTOMLEFT", -buttonsize/6, -3)
			
					local backdroptex = icon1.overlay:CreateTexture(nil, "BORDER")
					backdroptex:SetTexture([=[Interface\Icons\Spell_Nature_WispSplode]=])
					backdroptex:SetPoint("TOPLEFT", icon1.overlay, "TOPLEFT", 1, -1)
					backdroptex:SetPoint("BOTTOMRIGHT", icon1.overlay, "BOTTOMRIGHT", -1, 1)
					backdroptex:SetTexCoord(unpack(I.TexCoord))
					M.CreateSD(icon1.overlay)
				end

				if not (icon2.overlay) then
					icon2.overlay = CreateFrame("Frame", "$parentIcon2Overlay", tbar)
					icon2.overlay:SetSize(buttonsize+2, buttonsize+2)
					icon2.overlay:SetPoint("BOTTOMLEFT", tbar, "BOTTOMRIGHT", buttonsize/6, -3)
			
					local backdroptex = icon2.overlay:CreateTexture(nil, "BORDER")
					backdroptex:SetTexture([=[Interface\Icons\Spell_Nature_WispSplode]=])
					backdroptex:SetPoint("TOPLEFT", icon2.overlay, "TOPLEFT", 1, -1)
					backdroptex:SetPoint("BOTTOMRIGHT", icon2.overlay, "BOTTOMRIGHT", -1, 1)
					backdroptex:SetTexCoord(unpack(I.TexCoord))		
					M.CreateSD(icon2.overlay)
				end

				if bar.color then
					tbar:SetStatusBarColor(bar.color.r, bar.color.g, bar.color.b)
				else
					tbar:SetStatusBarColor(bar.owner.options.StartColorR, bar.owner.options.StartColorG, bar.owner.options.StartColorB)
				end

				if bar.enlarged then frame:SetWidth(bar.owner.options.HugeWidth) else frame:SetWidth(bar.owner.options.Width) end
				if bar.enlarged then tbar:SetWidth(bar.owner.options.HugeWidth) else tbar:SetWidth(bar.owner.options.Width) end

				if not frame.styled then
					frame:SetScale(1)
					frame.SetScale = M.Dummy
					frame:SetHeight(buttonsize/2)
					frame.SetHeight = M.Dummy
					if not frame.bg then
						frame.bg = CreateFrame("Frame", nil, frame)
						frame.bg:SetAllPoints()
					end
					M.CreateSD(frame.bg, 1, 3)
					M.CreateTex(frame.bg)
					frame.styled = true
				end

				if not spark.killed then
					spark:SetAlpha(0)
					spark:SetTexture(nil)
					spark.killed = true
				end

				if not icon1.styled then
					icon1:SetTexCoord(unpack(I.TexCoord))
					icon1:ClearAllPoints()
					icon1:SetPoint("TOPLEFT", icon1.overlay, 1, -1)
					icon1:SetPoint("BOTTOMRIGHT", icon1.overlay, -1, 1)
					icon1.SetSize = M.Dummy
					icon1.styled = true
				end
		
				if not icon2.styled then
					icon2:SetTexCoord(unpack(I.TexCoord))
					icon2:ClearAllPoints()
					icon2:SetPoint("TOPLEFT", icon2.overlay, 1, -1)
					icon2:SetPoint("BOTTOMRIGHT", icon2.overlay, -1, 1)
					icon2.SetSize = M.Dummy
					icon2.styled = true
				end

				if not texture.styled then
					texture:SetTexture(I.normTex)
					texture.styled = true
				end

				tbar:SetStatusBarTexture(I.normTex)
				if not tbar.styled then
					tbar:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
					tbar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
					tbar.SetPoint = M.Dummy
					tbar.styled = true

					tbar.Spark = tbar:CreateTexture(nil, "OVERLAY")
					tbar.Spark:SetTexture(I.sparkTex)
					tbar.Spark:SetBlendMode("ADD")
					tbar.Spark:SetAlpha(.8)
					tbar.Spark:SetPoint("TOPLEFT", tbar:GetStatusBarTexture(), "TOPRIGHT", -10, 10)
					tbar.Spark:SetPoint("BOTTOMRIGHT", tbar:GetStatusBarTexture(), "BOTTOMRIGHT", 10, -10)
				end

				if not name.styled then
					name:ClearAllPoints()
					name:SetPoint("LEFT", frame, "LEFT", 2, 8)
					name:SetPoint("RIGHT", frame, "LEFT", tbar:GetWidth()*.85, 8)
					name.SetPoint = M.Dummy
					name:SetFont(I.Font[1], 14, "OUTLINE")
					name.SetFont = M.Dummy
					name:SetJustifyH("LEFT")
					name:SetWordWrap(false)
					name:SetShadowColor(0, 0, 0, 0)
					name.styled = true
				end
		
				if not timer.styled then	
					timer:ClearAllPoints()
					timer:SetPoint("RIGHT", frame, "RIGHT", -2, 8)
					timer.SetPoint = M.Dummy
					timer:SetFont(I.Font[1], 14, "OUTLINE")
					timer.SetFont = M.Dummy
					timer:SetJustifyH("RIGHT")
					timer:SetShadowColor(0, 0, 0, 0)
					timer.styled = true
				end

				if bar.owner.options.IconLeft then icon1:Show() icon1.overlay:Show() else icon1:Hide() icon1.overlay:Hide() end
				if bar.owner.options.IconRight then icon2:Show() icon2.overlay:Show() else icon2:Hide() icon2.overlay:Hide() end
				tbar:SetAlpha(1)
				frame:SetAlpha(1)
				texture:SetAlpha(1)
				frame:Show()
				bar:Update(0)
				bar.injected = true
			end
		end
	end
	hooksecurefunc(DBT, "CreateBar", SkinBars)

	local function SkinRange()
		if DBMRangeCheckRadar and not DBMRangeCheckRadar.styled then
			TT.ReskinTooltip(DBMRangeCheckRadar)
			DBMRangeCheckRadar.styled = true
		end

		if DBMRangeCheck and not DBMRangeCheck.styled then
			TT.ReskinTooltip(DBMRangeCheck)
			DBMRangeCheck.styled = true
		end
	end
	hooksecurefunc(DBM.RangeCheck, "Show", SkinRange)

	if DBM.InfoFrame then
		DBM.InfoFrame:Show(5, "test")
		DBM.InfoFrame:Hide()
		DBMInfoFrame:HookScript("OnShow", TT.ReskinTooltip)
	end

	-- Force Settings
	if not DBM_AllSavedOptions["Default"] then DBM_AllSavedOptions["Default"] = {} end
	DBM_AllSavedOptions["Default"]["BlockVersionUpdateNotice"] = true
	DBM_AllSavedOptions["Default"]["EventSoundVictory"] = "None"
	DBT_AllPersistentOptions["Default"]["DBM"].BarYOffset = 12
	DBT_AllPersistentOptions["Default"]["DBM"].HugeBarYOffset = 12
	if IsAddOnLoaded("DBM-VPYike") then
		DBM_AllSavedOptions["Default"]["CountdownVoice"] = "VP:Yike"
		DBM_AllSavedOptions["Default"]["ChosenVoicePack"] = "Yike"
	end
end