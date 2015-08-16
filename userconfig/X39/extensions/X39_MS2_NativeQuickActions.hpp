class X39_MS2_NativeQuickActions : extensionBase
{
	authors[] = {"X39"};
	requiredExtensions[] =  {"X39_MS2_NativeMedicalActions"};
	version = "1.0";
	files[] = {
				"\userconfig\X39\extensions\X39_MS2_NativeQuickActions\ACE3_GiveSaline.sqf",
				"\userconfig\X39\extensions\X39_MS2_NativeQuickActions\ACE3_Heatpack.sqf",
				"\userconfig\X39\extensions\X39_MS2_NativeQuickActions\ACE3_TakeNasopharyngeal.sqf",
				"\userconfig\X39\extensions\X39_MS2_NativeQuickActions\ACE3_PutNasopharyngeal.sqf",
				"\userconfig\X39\extensions\X39_MS2_NativeQuickActions\bandageAll.sqf",
				"\userconfig\X39\extensions\X39_MS2_NativeQuickActions\dropTourniquetAll.sqf",
				"\userconfig\X39\extensions\X39_MS2_NativeQuickActions\putTourniquetAll.sqf"
			  };
	serverOnly = 0;
};