--[[	RealMobHealth Localization Module
	by SDPhantom
	https://www.wowinterface.com/forums/member.php?u=34145	]]
------------------------------------------------------------------

select(2,...).Localization=setmetatable({
	enUS={
--		Commands
		Command_NoUnitData="Unit not found.";
		Command_DeletedUnitFormat="Deleted %2$s(%1$s)";--	format(CreatureKey,UnitName)
		Command_HealthWiped="Health data wiped.";

--		Options Panel
		Options_DynamicList={--	Buttom Text, Tooltip Title, Description
--					Tooltip Title = false to use Button Text
			ShowStatusBarTextAdditions={"Show TargetFrame Text",false,"Creates text for TargetFrame's bars."};
			ModifyHealthBarText={"Modify UnitFrame Health",false,"Shows real health values for mobs in default UnitFrames."};
			ShowTooltipText={"Show Tooltip Feedback",false,"Displays if a mob's health is present in Health Cache."};
			ShowTooltipHealthText={"Show Tooltip Health",false,"Shows health on the GameTooltip's StatusBar"};
			ShowNamePlateHealthText={"Show NamePlate Health",false,"Shows health on the left side of NamePlates."};

			EnablePeerCache={"Enable","Enable Peer Cache","Toggles receiving health data from others.\n|cffffff00Note: This addon will still answer queries and broadcast health updates.|r"};
		};
		Options_SetByAddOn="|cffff0000This option has been overridden by another addon.|r";

--		Options Cache Panels
		Options_HealthCachePanel={"Health Cache","Stores health data from mobs encountered."};
		Options_PeerCachePanel={"Peer Cache","Stores health data reported by others."};
		Options_CacheSizeLabel="Cache Size:";

--		Options Clear Cache Buttons
		Options_ClearCacheButtonText="Clear Cache";
		Options_ClearHealthCacheTTText="Clear Health Cache";
		Options_ClearPeerCacheTTText="Clear Peer Cache";
		Options_ClearCacheWarning="|cffff0000Warning! All data in this cache will be lost forever.|r";

--		UITweaks Tooltip Lines
		UITweaksTooltip_Blacklisted="Blacklisted Mob";
		UITweaksTooltip_HealthRecorded="Recorded Health Data";
		UITweaksTooltip_HealthOverride="Health Data Overridden";
		UITweaksTooltip_NoData="Missing Health Data";
	};
},{__index=function(t,k) return t.enUS; end})[GetLocale()];
