#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		_ppeDynamicBlur				- range 0 - 1 | amount of blur over entire screen
 *		_ppeRadialBlur				- range 0 - 1 | amount of blur (needs _ppeFocus to actually work)
 *		_ppeFocus						- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs _ppeRadialBlur to actually work)
 *		_ppeFilmGrain					- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		_ppeChromAberration			- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		_ppeGreyScreen				- range 0 - 1 | 0 means normal 1 means totally grey
 *		_ppeWetDisort_LeftStrength	- range ? - ? | something unknown magic
 *		_ppeWetDisort_RightStrength	- range ? - ? | something unknown magic
 *	
 *		_cfnDisableFatigue			- range 0 - n | >0 will disable fatigue
 *		_cfnForceWalk					- range 0 - n | >0 will force walk
 *
 *		_blackOutStage				- get variable! Contains blackOutStage at the beginning of the tickCircle
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
private["_unit", "_currentRespiratory", "_changeRespiratory"];
_unit = _this select 0;
_currentRespiratory = [_unit] call X39_MS2_fnc_getRespiratory;

_changeRespiratory = X39_MS2_var_Respiratory_NormalChangePerTick;
if(_blackOutStage >= 1 && {!([_unit] call X39_MS2_fnc_getBagvalveMask) || ([_unit] call X39_MS2_fnc_getArrestPresent) || ([_unit] call X39_MS2_fnc_getToungeBlocking)}) then
{
	_changeRespiratory = X39_MS2_var_Respiratory_NoBeathingChangePerTick;
};


if(_currentRespiratory <= X39_MS2_var_Respiratory_RespiratoryArrestPointP * X39_MS2_var_Respiratory_maxValue) then
{
	if(_currentRespiratory <= X39_MS2_var_Respiratory_FlatLinePointP * X39_MS2_var_Respiratory_maxValue) then
	{
		[_unit, time] call X39_MS2_fnc_setFlatLine;
	}
	else
	{
		[_unit, true] call X39_MS2_fnc_setArrestPresent;
	};
};

if(_changeRespiratory != 0) then
{
	[_unit, _changeRespiratory] call X39_MS2_fnc_addRespiratory;
};