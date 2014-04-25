#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current damage value of given unit for the GENERIC hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current damage of the unit
 */
(_this select 0) getVariable ["X39_MS2_var_Hearing_value", -1];

private["_unit", "_hearingAbility"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_hasEarplugs = _unit getVariable ["X39_MS2_var_hasEarplugs", false];
_hearingAbility = _unit getVariable ["X39_MS2_var_Hearing_value", 0];
if(_hasEarplugs) then
{
	_hearingAbility - X39_MS2_var_Hearing_reductionThroughEarplugs;
};
if(_hearingAbility < 0) then
{
	_hearingAbility = 0;
};
_hearingAbility