--------------------------------------------------------------------------------
-- 感谢原作者 盒子哥
-- Fix and Updata by 冰色之舞、图图 、ShiGuang
--------------------------------------------------------------------------------

local DataVersion = 1.02 --20190528 or 
local LibHuanHuaData, oldminor = LibStub:NewLibrary("LibHuanHuaData-1.1", DataVersion)

LibHuanHuaData.data = HuanhuaItemData;

local FindItemCache = {}
setmetatable(FindItemCache, {__mode = "kv"})

local function tableFind(t, value)
	for i, id in pairs(t) do
		if (id == tonumber(value)) then
			return id;
		end
	end

	return false;
end

function LibHuanHuaData:FindItem(itemID)
	if FindItemCache[itemID] then
		if FindItemCache[itemID] == 'nil' then
			return nil
		else
			local iType, subType, setName = string.match(FindItemCache[itemID], "(.+)|(.+)|(.+)");
			local tmpInfo = self.data[iType][subType][setName];
			return iType, subType, setName, tmpInfo;
		end
	else
		local itemName, itemLink, itemQuality = GetItemInfo(itemID);
		if not itemQuality then return nil; end
		if (itemQuality < 2 or itemQuality>5) then
			FindItemCache[itemID] = 'nil';
			return nil;
		end		

		local iType, subType, setName;
		for t in pairs(self.data) do
			for tt, b in pairs(self.data[t]) do
				for name, ids in pairs(b) do
					local retVal = tableFind(ids, itemID);
					if (retVal) then
						iType, subType, setName = t, tt, name;
					end
				end
			end
		end
		
		if (iType) then			
			FindItemCache[itemID] = string.format("%s|%s|%s", iType, subType, setName);
		else
			FindItemCache[itemID] = "nil";
		end
		
		if iType then
			local tmpInfo = self.data[iType][subType][setName];
			return iType, subType, setName, tmpInfo;
		else
			return nil;
		end
	end
end