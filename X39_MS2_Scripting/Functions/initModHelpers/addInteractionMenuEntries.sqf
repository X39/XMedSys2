#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *
 *	ArrayStructure:
 *		0+ STRING		- displayed text
 *		1+ STRING		- limitation name
 *		2+ BOOL			- allow usage inside of a vehicle
 *		3+ CODE			- condition to display option
 *		4+ STRING/CODE	- code to execute when action is performed
 *		5- STRING/CODE	- "UpdateCode" see http://x39software.unitedtacticalforces.de/wiki/index.php?title=ArmA3_XActionUI_ActionsArray
 *		6- ARRAY		- "SubActions" see http://x39software.unitedtacticalforces.de/wiki/index.php?title=ArmA3_XActionUI_ActionsArray
 *	
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
[
	localize "STR_X39_MS2_Scripting_InteractionMenu_openMedicalMenu",
	"DUMMY",
	true, 
	{X39_MS2_var_Internal_Dialog_IsSelfInteracton},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		[X39_MS2_var_Internal_DialogCommunication_IM_Executor] call X39_MS2_fnc_MedicalActionMenu_createDialog;
	}
] call X39_MS2_fnc_registerInteraction;
[
	localize "STR_X39_MS2_Scripting_InteractionMenu_openMedicalMenu",
	"DUMMY",
	true,
	{!X39_MS2_var_Internal_Dialog_IsSelfInteracton},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		if(isNull X39_MS2_var_Internal_DialogCommunication_IM_Target) exitWith {false};
		[X39_MS2_var_Internal_DialogCommunication_IM_Target] call X39_MS2_fnc_MedicalActionMenu_createDialog;
	}
] call X39_MS2_fnc_registerInteraction;
[
	localize "STR_X39_MS2_Scripting_InteractionMenu_putEarplugs",
	"DUMMY",
	true,
	{((items X39_MS2_var_Internal_DialogCommunication_IM_Target) find "x39_xms2_earplugs" != -1) && !(X39_MS2_var_Internal_DialogCommunication_IM_Target getVariable ["X39_MS2_var_hasEarplugs", false])},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		X39_MS2_var_Internal_DialogCommunication_IM_Target setVariable ["X39_MS2_var_hasEarplugs", true];
		X39_MS2_var_Internal_DialogCommunication_IM_Target removeItem "x39_xms2_earplugs";
	}
] call X39_MS2_fnc_registerInteraction;
[
	localize "STR_X39_MS2_Scripting_InteractionMenu_removeEarplugs",
	"DUMMY",
	true,
	{(X39_MS2_var_Internal_DialogCommunication_IM_Target getVariable ["X39_MS2_var_hasEarplugs", false])},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		X39_MS2_var_Internal_DialogCommunication_IM_Target setVariable ["X39_MS2_var_hasEarplugs", false];
		X39_MS2_var_Internal_DialogCommunication_IM_Target addItem "x39_xms2_earplugs";
	}
] call X39_MS2_fnc_registerInteraction;
[
	localize "STR_X39_MS2_Scripting_InteractionMenu_putEarplugs",
	"DUMMY",
	true,
	{(((items X39_MS2_var_Internal_DialogCommunication_IM_Executor) find "X39_MS2_var_hasTourniquet" != -1) || ((items X39_MS2_var_Internal_DialogCommunication_IM_Target) find "X39_MS2_var_hasTourniquet" != -1)) && !(X39_MS2_var_Internal_DialogCommunication_IM_Target getVariable ["X39_MS2_var_hasTourniquet", false])},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		X39_MS2_var_Internal_DialogCommunication_IM_Target setVariable ["X39_MS2_var_hasTourniquet", true];
		if("X39_MS2_var_hasTourniquet" in (items X39_MS2_var_Internal_DialogCommunication_IM_Target) then
		{
			X39_MS2_var_Internal_DialogCommunication_IM_Target removeItem "X39_MS2_var_hasTourniquet";
		}
		else
		{
			X39_MS2_var_Internal_DialogCommunication_IM_Executor removeItem "X39_MS2_var_hasTourniquet";
		};
	}
] call X39_MS2_fnc_registerInteraction;
[
	localize "STR_X39_MS2_Scripting_InteractionMenu_removeEarplugs",
	"DUMMY",
	true,
	{(X39_MS2_var_Internal_DialogCommunication_IM_Target getVariable ["X39_MS2_var_hasTourniquet", false])},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		X39_MS2_var_Internal_DialogCommunication_IM_Target setVariable ["X39_MS2_var_hasTourniquet", false];
		X39_MS2_var_Internal_DialogCommunication_IM_Executor addItem "X39_MS2_var_hasTourniquet";
	}
] call X39_MS2_fnc_registerInteraction;
[
	localize "STR_X39_MS2_Scripting_InteractionMenu_useDefibrillator",
	"DUMMY",
	false,
	{	 !X39_MS2_var_Internal_Dialog_IsSelfInteracton &&
		{(((items X39_MS2_var_Internal_DialogCommunication_IM_Target) find "x39_xms2_defibrillator") != -1 || {((items X39_MS2_var_Internal_DialogCommunication_IM_Executor) find "x39_xms2_defibrillator") != -1}) &&
		{X39_MS2_var_Internal_DialogCommunication_IM_TargetBlackOutStage >= 3}}},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		[X39_MS2_var_Internal_DialogCommunication_IM_Executor, X39_MS2_var_Internal_DialogCommunication_IM_Target] call X39_ActionUI_fnc_MA_defibrillate;
	}
] call X39_MS2_fnc_registerInteraction;
[
	localize "STR_X39_MS2_Scripting_InteractionMenu_useNaloxone",
	"DUMMY",
	false,
	{!X39_MS2_var_Internal_Dialog_IsSelfInteracton &&
	{((((items X39_MS2_var_Internal_DialogCommunication_IM_Target) find "x39_xms2_naloxone") != -1) || {(((items X39_MS2_var_Internal_DialogCommunication_IM_Executor) find "x39_xms2_naloxone") != -1)}) &&
	{X39_MS2_var_Internal_DialogCommunication_IM_TargetBlackOutStage >= 1 && X39_MS2_var_Internal_DialogCommunication_IM_TargetBlackOutStage < 3}}},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		if((items X39_MS2_var_Internal_DialogCommunication_IM_Target) find "x39_xms2_naloxone" != -1) then
		{
			X39_MS2_var_Internal_DialogCommunication_IM_Executor removeItem "x39_xms2_naloxone";
		}
		else
		{
			X39_MS2_var_Internal_DialogCommunication_IM_Target removeItem "x39_xms2_naloxone";
		};
		[X39_MS2_var_Internal_DialogCommunication_IM_Target, 0, -1, ""] call X39_MS2_fnc_blackOutUnit;
	}
] call X39_MS2_fnc_registerInteraction;
[
	"Add 2000 blood to body",
	"DUMMY",
	false,
	{!X39_MS2_var_Internal_Dialog_IsSelfInteracton},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		[X39_MS2_var_Internal_DialogCommunication_IM_Target, 2000] call X39_MS2_fnc_addBlood;
		systemChat "THIS IS A DUMMY IMPLEMENTATION! So please don't expect something will happen now ... ^^";
		systemChat "((for sure ... the target now has 2000 blood added))";
	}
] call X39_MS2_fnc_registerInteraction;