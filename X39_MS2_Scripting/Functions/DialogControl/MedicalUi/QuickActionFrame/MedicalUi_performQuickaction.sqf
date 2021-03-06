#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function
 *	
 *	@Param1 - SCALAR - QuickAction index
 *	@Param2 - OBJECT - executingObject
 *	@Param3 - OBJECT - targetObject
 *	@Return - N/A
 *	@Author - X39
 */
FORCELOCAL(_this select 1);
if(!scriptDone X39_MS2_var_Internal_Handles_QuickActionHandle) exitWith {};
X39_MS2_var_Internal_Handles_QuickActionHandle = _this spawn
{
	params[["_qaIndex", -1, [1]], ["_executor", objNull, [objNull]], ["_target", objNull, [objNull]]];
	if(_qaIndex < 0) exitWith {PRINT_WARNING("_qaIndex < 0, exiting QuickAction perform");};
	_qa = X39_MS2_var_Internal_MedicalUi_QuickActions select _qaIndex;
	if(!([_target, _executor, _qa select 6] call (_qa select 4))) exitWith {DEBUG_LOG_SC("QuickAction condition != true")};
	_timeout = [_qa select 6, _target, _executor] call (_qa select 3);
	if(_timeout == 0) exitWith {};
	//Start the medic animation if not in vehicle
	if(vehicle _executor == _executor) then { _executor playAction "MedicStart"; };
	
	//Start progress bar animation
	[_timeout] call X39_MS2_fnc_setProgressBarTimeout;
	
	//set animation lock to abort the execution if the user moves "unexpected" (or dies, or ...)
	[
		_executor,
		MEDIC_ANIM_ONGOING,
		MEDIC_ANIM_END,
		{
			terminate X39_MS2_var_Internal_Handles_QuickActionHandle;
			X39_MS2_var_Internal_Handles_QuickActionHandle = scriptNull;
			[] call X39_MS2_fnc_clearProgressBarTimeout;
			[] call X39_MS2_fnc_clearAnimationLock;
		},
		{},
		[_executor, _target]
	] call X39_MS2_fnc_setAnimationLock;
	
	uiSleep _timeout;
	
	//Stop the medic animation if not in vehicle
	if(vehicle _executor == _executor) then { _executor playAction "MedicStop"; };
	if(_qa select 8) then
	{
		[_target, format["_this call ((X39_MS2_var_Internal_MedicalUi_QuickActions select %1) select 5)", _qaIndex], [_qa select 6, _target, _executor]] call X39_XLib_fnc_executeLocalToUnit;
	}
	else
	{
		[_qa select 6, _target, _executor] call  (_qa select 5)
	};
};