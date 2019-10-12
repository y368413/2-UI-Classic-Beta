--[[TidyMinimap 0.8 - Tidy up the buttons around the minimap!--]]

local anchors = {
	topleft	 = 'TOPLEFT#TOPLEFT#3#0',
	topright = 'TOPRIGHT#TOPRIGHT#-3#0',
	left	 = 'RIGHT#LEFT#3#0',
	right	 = 'LEFT#RIGHT#-3#0',
	down	 = 'TOP#BOTTOM#0#3',
	up		 = 'BOTTOM#TOP#0#-3',
}

local notbuttons = {
	['TimeManagerClockButton'] = true,
	['MinimapZoomIn'] = true,
	['MinimapZoomOut'] = true,
	['GameTimeFrame'] = true,
	['MiniMapTrackingButton'] = true,
	['MiniMapTracking'] = true,
	['GarrisonLandingPageMinimapButton'] = false,
	['QueueStatusMinimapButton'] = true,
	['QueueStatusMinimapButtonDropDownButton'] = true,
	['COHCMinimapButton'] = true,
	['BaudErrorFrameMinimapButton'] = true,
	--['LibDBIcon10_BaudErrorFrame'] = true,
}

local TidyMinimap = CreateFrame('Frame', 'TidyMinimap', UIParent)

local isMinimapButton = function(frame)
	if frame and frame:GetObjectType() == 'Button' and frame:GetNumRegions() >= 3 then
		return true
	end
end

local hideBorder = function(...)
	for i = 1, select('#', ...) do
		local region = select(i, ...)
		if region.GetTexture then
			local texture = region:GetTexture()
			if texture and strfind(strlower(texture), 'border') then
				region:Hide()
			end
		end
	end
end

function TidyMinimap:findButtons(frame)
	for i, child in ipairs({frame:GetChildren()}) do
		local name = child:GetName()
		if isMinimapButton(child) and not self.settings.skip[name] and not notbuttons[name] then
			self:addButton(child)
		else
			self:findButtons(child)
		end
	end
end

function TidyMinimap:findSpecialButtons()
	for button, get in pairs(self.settings.special) do
		if getfenv(0)[button] and get == true then
			self:addButton(getfenv(0)[button])
		end
	end
end

function TidyMinimap:addButton(button)
	if button:GetParent() ~= self then
		button:SetParent(self)
	end
end

function TidyMinimap:scan()
	self:findButtons(Minimap)
	self:findSpecialButtons()
	self:updatePositions()
end

-- Delay the scan call with a onupdate handler
local time = 0
local onUpdate = function(self, elapsed)
	time = time + elapsed
	if time > 3 then
		time = 0
		self:scan()
		self:SetScript('OnUpdate', nil)
	end
end

function TidyMinimap:delayedScan()
	self:SetScript('OnUpdate', onUpdate)
end

function TidyMinimap:nudgeMinimap()
	if Minimap:IsVisible() then
		-- Only nudge if the minimap is in it's default pos
		local p1, parent, p2, x, y = Minimap:GetPoint(0)
		if p1 == 'TOPRIGHT' and parent == UIParent and p2 == 'TOPRIGHT' and x == 0 and y ==0 then
			Minimap:ClearAllPoints()
			Minimap:SetPoint(p1, parent, p2, x, y-(self:GetHeight()*self.settings.layout.scale))
		end
	end
end

function TidyMinimap:updatePositions()
	local layout = self.settings.layout
	self:ClearAllPoints()
	self:SetPoint(strsplit('#', layout.pos))
	self:SetWidth(0)
	self:SetHeight(0)
	self:SetScale(layout.scale)

	local prev = self
	for i, button in ipairs({self:GetChildren()}) do
		if button:IsVisible() then

			-- Position the button
			local p1, p2, x, y = strsplit('#', (prev == self and anchors[layout.anchor]) or anchors[layout.grow])
			button:ClearAllPoints()
			button:SetPoint(p1, prev, p2, x, y)

			-- Stop it from being draggable
			button:SetScript('OnDragStart', nil)
			button:SetScript('OnDragStop', nil)

			-- Hide the border
			if not layout.borders then
				hideBorder(button:GetRegions())
			end

			-- Update width and height
			self:SetWidth(self:GetWidth() + button:GetWidth())
			self:SetHeight(((button:GetHeight() > self:GetHeight()) and button:GetHeight()) or self:GetHeight())

			prev = button
		end
	end

	if layout.nudgeminimap then self:nudgeMinimap() end
end


function TidyMinimap:enable(settings)
	self.settings = settings
	self:SetScript('OnEvent', self.delayedScan)
	self:RegisterEvent'PLAYER_LOGIN'
	self:RegisterEvent'ADDON_LOADED'
	self:RegisterEvent'UPDATE_BATTLEFIELD_STATUS'
end

-- TidyMinimap config file

TidyMinimap:enable({
	layout = {
		pos = 'TOPRIGHT#Minimap#BOTTOMRIGHT#26#-6',    --pos = 'TOPRIGHT#GameMenuFrame#BOTTOMRIGHT#30#12',
		--pos = 'TOPRIGHT#Minimap#TOPLEFT#26#26',
		anchor = 'topright',
		grow = 'left',  
		--grow = 'down',
		scale = 0.95,
		borders = true,

		-- Only use this if you need to move the minimap down to make space for the buttons.
		nudgeminimap = false,
	},

	-- Let these buttons stay on the minimap
	skip = {
		['MiniMapWorldMapButton'] = true,
		['MiniMapBattlefieldFrame'] = true,
	},

	-- If a minimap button is not picked
	-- up automagically, add it here
	special = {
		['OutfitterMinimapButton'] = true,
		['BejeweledMinimapIcon'] = true,
		['WIM3MinimapButton'] = true,
	}
})
