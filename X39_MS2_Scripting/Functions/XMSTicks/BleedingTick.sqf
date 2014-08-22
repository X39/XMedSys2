#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		_ppeDynamicBlur			- range 0 - 1 | ammount of blur over entire screen
 *		_ppeRadialBlur			- range 0 - 1 | ammount of blur (needs _ppeFocus to actually work)
 *		_ppeFocus				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs _ppeRadialBlur to actually work)
 *		_ppeFilmGrain			- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		_ppeChromAberration		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		_ppeGreyScreen			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		_cfnDisableFatigue		- range 0 - n | >0 will disable fatigue
 *		_cfnForceWalk			- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
if(!X39_MS2_var_Feature_EnableBlood) exitWith {};
private["_unit", "_handleID", "_bloodP", "_bloodPresure"];
_unit = _this select 0;
//_handleID = _this select 1;
if(!(_unit getVariable ["X39_MS2_var_hasTourniquet", false])) then
{
	if(X39_MS2_var_Bleeding_BleedingCurePerTick > 0) then
	{
		[_unit, -X39_MS2_var_Bleeding_BleedingCurePerTick] call X39_MS2_fnc_addBleedingToBody;
		[_unit, -X39_MS2_var_Bleeding_BleedingCurePerTick] call X39_MS2_fnc_addBleedingToGeneric;
		[_unit, -X39_MS2_var_Bleeding_BleedingCurePerTick] call X39_MS2_fnc_addBleedingToHands;
		[_unit, -X39_MS2_var_Bleeding_BleedingCurePerTick] call X39_MS2_fnc_addBleedingToHead;
		[_unit, -X39_MS2_var_Bleeding_BleedingCurePerTick] call X39_MS2_fnc_addBleedingToLegs;
	};

	[_unit, -((([_unit] call X39_MS2_fnc_getBleedingOfBody) + ([_unit] call X39_MS2_fnc_getBleedingOfGeneric) + ([_unit] call X39_MS2_fnc_getBleedingOfHands) + ([_unit] call X39_MS2_fnc_getBleedingOfHead) + ([_unit] call X39_MS2_fnc_getBleedingOfLegs)) * (if(_unit getVariable ["X39_MS2_var_Bleeding_AterieDamaged", false]) then {X39_MS2_var_Bleeding_AterialDamageMultiplicator} else {1}))] call X39_MS2_fnc_addBlood;
	if(X39_MS2_var_Bleeding_LowBloodFeatures) then
	{
		_bloodP = ([_unit] call X39_MS2_fnc_getBlood) / X39_MS2_var_Bleeding_maxBloodInEntireBody;
		if(_bloodP <= X39_MS2_var_Bleeding_knockOutAtPBlood) then
		{
			if(_bloodP <= X39_MS2_var_Bleeding_killAtPBlood) then
			{
				DEBUG_LOG_WFn_SC(format["Killing '%1' because ([_bloodP => %2] < [X39_MS2_var_Bleeding_killAtPBlood => %3])" COMMA _unit COMMA _bloodP COMMA X39_MS2_var_Bleeding_killAtPBlood])
				[_unit] call X39_MS2_fnc_killUnit;
			}
			else
			{
				[_unit, 2, -1, localize "STR_X39_MS2_Scripting_XMSTicks_BleedingTick_KnockOutDueLowBlood"] call X39_MS2_fnc_blackOutUnit;
			};
		};
	};
	if(X39_MS2_var_Bleeding_EnableBloodPresureForBleedingTick) then
	{
		_bloodPresure = ([_unit] call X39_MS2_fnc_getBloodPresure) / X39_MS2_var_Bleeding_NaturalMaxOfBloodPresure;
		if(_bloodPresure <= X39_MS2_var_Bleeding_knockOutAtPBloodPresureLowerEnd || _bloodPresure >= X39_MS2_var_Bleeding_knockOutAtPBloodPresureUpperEnd) then
		{
			if(X39_MS2_var_Bleeding_BloodPresureCanKill && {_bloodPresure <= X39_MS2_var_Bleeding_killAtPBloodPresureLowerEnd || _bloodPresure >= X39_MS2_var_Bleeding_killAtPBloodPresureUpperEnd}) then
			{
				DEBUG_LOG_WFn_SC(format["Killing '%1' because ([X39_MS2_var_Bleeding_BloodPresureCanKill == %4] && {[_bloodPresure => %2] <= [X39_MS2_var_Bleeding_killAtPBloodPresureLowerEnd => %3] || [_bloodPresure => %2] >= [X39_MS2_var_Bleeding_killAtPBloodPresureUpperEnd => %5]})" COMMA _unit COMMA _bloodPresure COMMA X39_MS2_var_Bleeding_killAtPBloodPresureLowerEnd COMMA X39_MS2_var_Bleeding_BloodPresureCanKill COMMA X39_MS2_var_Bleeding_killAtPBloodPresureUpperEnd])
				[_unit] call X39_MS2_fnc_killUnit;
			}
			else
			{
				[_unit, 2, -1, localize (if(_bloodPresure <= X39_MS2_var_Bleeding_knockOutAtPBloodPresureLowerEnd) then {"STR_X39_MS2_Scripting_XMSTicks_BleedingTick_KnockOutDueBloodPresureLow"} else {"STR_X39_MS2_Scripting_XMSTicks_BleedingTick_KnockOutDueBloodPresureHigh"})] call X39_MS2_fnc_blackOutUnit;
			};
		};
	};
};