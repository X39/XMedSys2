#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *	
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Legs_Low",		[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfLegs) / X39_MS2_var_Bleeding_maxBleedingLegs;		(_value >= 0.1 && _value < 0.3)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Legs_Middle",	[0.5, 0.5, 0, 1],	{_value = ([_this] call X39_MS2_fnc_getBleedingOfLegs) / X39_MS2_var_Bleeding_maxBleedingLegs;		(_value >= 0.3 && _value < 0.6)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Legs_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfLegs) / X39_MS2_var_Bleeding_maxBleedingLegs;		(_value >= 0.6 && _value < 0.7)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Legs_Extreme",	[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfLegs) / X39_MS2_var_Bleeding_maxBleedingLegs;		(_value >= 0.7)					}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Hands_Low",		[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfHands) / X39_MS2_var_Bleeding_maxBleedingHands;	(_value >= 0.1 && _value < 0.3)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Hands_Middle",	[0.5, 0.5, 0, 1],	{_value = ([_this] call X39_MS2_fnc_getBleedingOfHands) / X39_MS2_var_Bleeding_maxBleedingHands;	(_value >= 0.3 && _value < 0.6)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Hands_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfHands) / X39_MS2_var_Bleeding_maxBleedingHands;	(_value >= 0.6 && _value < 0.7)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Hands_Extreme",	[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfHands) / X39_MS2_var_Bleeding_maxBleedingHands;	(_value >= 0.7)					}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Head_Low",		[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfHead) / X39_MS2_var_Bleeding_maxBleedingHead;		(_value >= 0.1 && _value < 0.3)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Head_Middle",	[0.5, 0.5, 0, 1],	{_value = ([_this] call X39_MS2_fnc_getBleedingOfHead) / X39_MS2_var_Bleeding_maxBleedingHead;		(_value >= 0.3 && _value < 0.6)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Head_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfHead) / X39_MS2_var_Bleeding_maxBleedingHead;		(_value >= 0.6 && _value < 0.7)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Head_Extreme",	[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfHead) / X39_MS2_var_Bleeding_maxBleedingHead;		(_value >= 0.7)					}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Generic_Low",	[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfGeneric) / X39_MS2_var_Bleeding_maxBleedingGeneric;(_value >= 0.1 && _value < 0.3)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Generic_Middle",	[0.5, 0.5, 0, 1],	{_value = ([_this] call X39_MS2_fnc_getBleedingOfGeneric) / X39_MS2_var_Bleeding_maxBleedingGeneric;(_value >= 0.3 && _value < 0.6)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Generic_High",	[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfGeneric) / X39_MS2_var_Bleeding_maxBleedingGeneric;(_value >= 0.6 && _value < 0.7)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Generic_Extreme",[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfGeneric) / X39_MS2_var_Bleeding_maxBleedingGeneric;(_value >= 0.7)					}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Body_Low",		[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfBody) / X39_MS2_var_Bleeding_maxBleedingBody;		(_value >= 0.1 && _value < 0.3)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Body_Middle",	[0.5, 0.5, 0, 1],	{_value = ([_this] call X39_MS2_fnc_getBleedingOfBody) / X39_MS2_var_Bleeding_maxBleedingBody;		(_value >= 0.3 && _value < 0.6)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Body_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfBody) / X39_MS2_var_Bleeding_maxBleedingBody;		(_value >= 0.6 && _value < 0.7)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Body_Extreme",	[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getBleedingOfBody) / X39_MS2_var_Bleeding_maxBleedingBody;		(_value >= 0.7)					}]];

X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Legs_Low",			[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfLegs) / X39_MS2_var_Damage_maxDamageLegs;			(_value >= 0.1 && _value < 0.3)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Legs_Middle",		[0.5, 0.5, 0, 1],	{_value = ([_this] call X39_MS2_fnc_getDamageOfLegs) / X39_MS2_var_Damage_maxDamageLegs;			(_value >= 0.3 && _value < 0.6)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Legs_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfLegs) / X39_MS2_var_Damage_maxDamageLegs;			(_value >= 0.6 && _value < 0.7)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Legs_Extreme",		[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfLegs) / X39_MS2_var_Damage_maxDamageLegs;			(_value >= 0.7)					}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Hands_Low",		[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfHands) / X39_MS2_var_Damage_maxDamageHands;			(_value >= 0.1 && _value < 0.3)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Hands_Middle",		[0.5, 0.5, 0, 1],	{_value = ([_this] call X39_MS2_fnc_getDamageOfHands) / X39_MS2_var_Damage_maxDamageHands;			(_value >= 0.3 && _value < 0.6)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Hands_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfHands) / X39_MS2_var_Damage_maxDamageHands;			(_value >= 0.6 && _value < 0.7)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Hands_Extreme",	[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfHands) / X39_MS2_var_Damage_maxDamageHands;			(_value >= 0.7)					}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Head_Low",			[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfHead) / X39_MS2_var_Damage_maxDamageHead;			(_value >= 0.1 && _value < 0.3)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Head_Middle",		[0.5, 0.5, 0, 1],	{_value = ([_this] call X39_MS2_fnc_getDamageOfHead) / X39_MS2_var_Damage_maxDamageHead;			(_value >= 0.3 && _value < 0.6)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Head_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfHead) / X39_MS2_var_Damage_maxDamageHead;			(_value >= 0.6 && _value < 0.7)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Head_Extreme",		[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfHead) / X39_MS2_var_Damage_maxDamageHead;			(_value >= 0.7)					}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Generic_Low",		[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfGeneric) / X39_MS2_var_Damage_maxDamageGeneric;		(_value >= 0.1 && _value < 0.3)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Generic_Middle",	[0.5, 0.5, 0, 1],	{_value = ([_this] call X39_MS2_fnc_getDamageOfGeneric) / X39_MS2_var_Damage_maxDamageGeneric;		(_value >= 0.3 && _value < 0.6)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Generic_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfGeneric) / X39_MS2_var_Damage_maxDamageGeneric;		(_value >= 0.6 && _value < 0.7)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Generic_Extreme",	[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfGeneric) / X39_MS2_var_Damage_maxDamageGeneric;		(_value >= 0.7)					}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Body_Low",			[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfBody) / X39_MS2_var_Damage_maxDamageBody;			(_value >= 0.1 && _value < 0.3)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Body_Middle",		[0.5, 0.5, 0, 1],	{_value = ([_this] call X39_MS2_fnc_getDamageOfBody) / X39_MS2_var_Damage_maxDamageBody;			(_value >= 0.3 && _value < 0.6)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Body_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfBody) / X39_MS2_var_Damage_maxDamageBody;			(_value >= 0.6 && _value < 0.7)	}]];
X39_MS2_var_Internal_MedicalMessages set [count X39_MS2_var_Internal_MedicalMessages, ["STR_X39_MS2_Scripting_MedicalMessages_Damage_Body_Extreme",		[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getDamageOfBody) / X39_MS2_var_Damage_maxDamageBody;			(_value >= 0.7)					}]];