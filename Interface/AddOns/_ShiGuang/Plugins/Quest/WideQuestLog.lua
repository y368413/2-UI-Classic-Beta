			-- Make the quest log frame double-wide
			UIPanelWindows["QuestLogFrame"] = {area = "override", pushable = 0, xoffset = -16, yoffset = 12, bottomClampOverride = 140 + 12, width = 724, height = 513, whileDead = 1}

			-- Widen the window (including padding to the right)
			QuestLogFrame:SetWidth(724)
			QuestLogFrame:SetHeight(513)

			-- Adjust quest log title text
			QuestLogTitleText:ClearAllPoints()
			QuestLogTitleText:SetPoint("TOP", QuestLogFrame, "TOP", 0, -18)

			-- Move the detail frame to the right and stretch it to full height
			QuestLogDetailScrollFrame:ClearAllPoints()
			QuestLogDetailScrollFrame:SetPoint("TOPLEFT", QuestLogListScrollFrame, "TOPRIGHT", 41, 0)
			QuestLogDetailScrollFrame:SetHeight(362)

			-- Move No Active Quests text
			QuestLogNoQuestsText:ClearAllPoints()
			QuestLogNoQuestsText:SetPoint("TOP", QuestLogListScrollFrame, 0, -90)

			-- Expand the quest list to full height
			QuestLogListScrollFrame:SetHeight(362)

			-- Create additional quest rows
			local oldQuestsDisplayed = QUESTS_DISPLAYED
			_G.QUESTS_DISPLAYED = _G.QUESTS_DISPLAYED + 17
			for i = oldQuestsDisplayed + 1, QUESTS_DISPLAYED do
				local button = CreateFrame("Button", "QuestLogTitle" .. i, QuestLogFrame, "QuestLogTitleButtonTemplate")
				button:SetID(i)
				button:Hide()
				button:ClearAllPoints()
				button:SetPoint("TOPLEFT", _G["QuestLogTitle" .. (i-1)], "BOTTOMLEFT", 0, 1)
			end

			-- Function to set texture coordinates
			local function SetTexProperties(which, region)
				if which == "TopLeft" then region:SetTexCoord(0.25, 0.5, 0, 0.5)
				elseif which == "TopMiddle" then region:SetTexCoord(0.5, 0.75, 0, 0.5)
				elseif which == "TopRight" then	region:SetTexCoord(0.75, 1, 0, 0.5)
				elseif which == "BotLeft" then region:SetTexCoord(0.25, 0.5, 0.5, 1)
				elseif which == "BotMiddle" then region:SetTexCoord(0.5, 0.75, 0.5, 1)
				elseif which == "BotRight" then	region:SetTexCoord(0.75, 1, 0.5, 1)
				end
			end

			-- Replace the backing textures
			local regions = {QuestLogFrame:GetRegions()}

			-- Align the images with the frame
			local xOffsets = {Left = 3, Middle = 259, Right = 515}
			local yOffsets =  {Top = 0, Bot = -256}
			local textures = {
			TopLeft = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\WideQuestLog.blp", 
			TopMiddle = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\WideQuestLog.blp", 
			TopRight = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\WideQuestLog.blp", 
			BotLeft = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\WideQuestLog.blp", 
			BotMiddle = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\WideQuestLog.blp", 
			BotRight = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\WideQuestLog.blp"}
			local PATTERN = "^Interface\\QuestFrame\\UI%-QuestLog%-(([A-Z][a-z]+)([A-Z][a-z]+))$"
			for void, region in ipairs(regions) do
				if (region:IsObjectType("Texture")) then
					local texturefile = region:GetTexture()
					if texturefile then
						local which, yofs, xofs = texturefile:match(PATTERN)
						xofs = xofs and xOffsets[xofs]
						yofs = yofs and yOffsets[yofs]
						if (xofs and yofs and textures[which]) then
							region:ClearAllPoints()
							region:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", xofs, yofs)
							region:SetTexture(textures[which])
							region:SetWidth(256)
							region:SetHeight(256)
							SetTexProperties(which, region)
							textures[which] = nil
						end
					end
				end
			end

			-- Add new textures
			for name, path in pairs(textures) do
				local yofs, xofs = name:match("^([A-Z][a-z]+)([A-Z][a-z]+)$")
				xofs = xofs and xOffsets[xofs]
				yofs = yofs and yOffsets[yofs]
				if xofs and yofs then
					local region = QuestLogFrame:CreateTexture(nil, "ARTWORK")
					region:ClearAllPoints()
					region:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", xofs, yofs)
					region:SetWidth(256)
					region:SetHeight(256)
					region:SetTexture(path)
					SetTexProperties(name, region)
				end
			end

			-- Empty quest log textures
			local topOfs = 0.37
			local topH = 256 * (1 - topOfs)
			local botCap = 0.83
			local botH = 128 *  botCap
			local xSize = 256 + 64
			local ySize = topH + botH
			local nxSize = QuestLogDetailScrollFrame:GetWidth() + 26
			local nySize = QuestLogDetailScrollFrame:GetHeight() + 8

			local function relocateEmpty(t, w, h, x, y)
				local nx = x / xSize * nxSize - 10
				local ny = y / ySize * nySize + 8
				local nw = w / xSize * nxSize
				local nh = h / ySize * nySize
				t:SetWidth(nw)
				t:SetHeight(nh)
				t:ClearAllPoints()
				t:SetPoint("TOPLEFT", QuestLogDetailScrollFrame, "TOPLEFT", nx, ny)
			end

			local txset = {EmptyQuestLogFrame:GetRegions()}
			for void, t in ipairs(txset) do
				if t:IsObjectType("Texture") then
					local p = t:GetTexture()
					if type(p) == "string" then
						p = p:match("-([^-]+)$")
						if (p) then
							if (p == "TopLeft") then
								t:SetTexCoord(0, 1, topOfs, 1)
								relocateEmpty(t, 256, topH, 0, 0)
							elseif (p == "TopRight") then
								t:SetTexCoord(0, 1, topOfs, 1)
								relocateEmpty(t, 64, topH, 256, 0)
							elseif (p == "BotLeft") then
								t:SetTexCoord(0, 1, 0, botCap)
								relocateEmpty(t, 256, botH, 0, -topH)
							elseif (p == "BotRight") then
								t:SetTexCoord(0, 1, 0, botCap)
								relocateEmpty(t, 64, botH, 256, -topH)
							else
								t:Hide()
							end
						end
					end
				end
			end

			-- Show map button
			local mapButton = CreateFrame("BUTTON", nil, QuestLogFrame)
			mapButton:SetSize(36, 25)
			mapButton:SetPoint("TOPRIGHT", -390, -44)
			mapButton:SetNormalTexture("Interface\\QuestFrame\\UI-QuestMap_Button")
			mapButton:GetNormalTexture():SetTexCoord(0.125, 0.875, 0, 0.5)
			mapButton:SetPushedTexture("Interface\\QuestFrame\\UI-QuestMap_Button")
			mapButton:GetPushedTexture():SetTexCoord(0.125, 0.875, 0.5, 1.0)
			mapButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
			mapButton:SetScript("OnClick", ToggleWorldMap)
