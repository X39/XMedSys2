#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")			- range 0 - 1 | ammount of blur over entire screen
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")			- range 0 - 1 | ammount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus")				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") to actually work)
 *		X39_MS2_var_Internal_Ticker(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain")			- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration")		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue")		- range 0 - n | >0 will disable fatigue
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk")			- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
MT_START
if(!X39_MS2_var_Heart_enableHeartSimulation) exitWith {};

private["_unit", "_handleID", "_fatigue", "_newPulse", "_stage", "_pulseChange", "_adrenalineChange", "_pulseCurrent", "_adrenalineCurrent", "_speed", "_cprCount"];
_unit = _this select 0;
_handleID = _this select 1;
_pulseChange = 0;
_adrenalineChange = 0;
_pulseCurrent = [_unit] call X39_MS2_fnc_getHeartPulse;
_adrenalineCurrent = [_unit] call X39_MS2_fnc_getAdrenaline;
_fatigue = getFatigue _unit;
_stage = speed _unit;
if(vehicle _unit != _unit) then
{
	_stage = 0;
};


//Simulate Heart
if(!([_unit] call X39_MS2_fnc_hasFlatLine)) then
{
	
	if([_unit] call X39_MS2_fnc_getCprPresent) then
	{
		[_unit, 1] call X39_MS2_fnc_addCprCount;
	}
	else
	{
		[_unit, -1] call X39_MS2_fnc_addCprCount;
	};
	if(floor _pulseCurrent <= 0) then
	{
		if((_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage") < 3) then
		{
			[_unit, time] call X39_MS2_fnc_setFlatLine;
		};
	};
	if(_stage < X39_MS2_var_Heart_pulseSpeedStage0) then
	{
		_stage = 0;
	}
	else
	{
		if(_stage < X39_MS2_var_Heart_pulseSpeedStage1) then
		{
			_stage = 1;
		}
		else
		{
			if(_stage < X39_MS2_var_Heart_pulseSpeedStage2) then
			{
				_stage = 2;
			}
			else
			{
				if(_stage < X39_MS2_var_Heart_pulseSpeedStage3) then
				{
					_stage = 3;
				}
				else
				{
					_stage = 4;
				};
			};
		};
	};
	
	if(_stage == 0) then
	{
		_pulseChange = _pulseChange + (-X39_MS2_var_Heart_basePulseChangePerTick * X39_MS2_var_Heart_pulseReductionMultiplicator);
        _pulseChange = _pulseChange * (((_pulseCurrent / X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond - X39_MS2_var_Heart_GraphMod1) ^ X39_MS2_var_Heart_GraphMod2) * X39_MS2_var_Heart_GraphMod3 + X39_MS2_var_Heart_GraphMod4);
	}
	else
	{
		_pulseChange = _pulseChange + (X39_MS2_var_Heart_basePulseChangePerTick * _stage);
	};
	if(X39_MS2_var_Heart_usePlayerLoad) then
	{
		_normalizedWeight = (loadAbs _unit) / X39_MS2_var_Heart_playerLoad_normalizeBase;
		_pulseChange = _pulseChange * (X39_MS2_var_Heart_playerLoad_effectStrengthMultiplicator * _normalizedWeight)
	};
	if(X39_MS2_var_Drugs_Adrenaline_useForHeartCalculations) then
	{
		_pulseChange = _pulseChange * ((1 + (_adrenalineCurrent / X39_MS2_var_Drugs_Adrenaline_maxAdrenaline)) * 2) * X39_MS2_var_Drugs_Adrenaline_AdrenalinePulseMultiplicator;
	};
	if(X39_MS2_var_Respiratory_UseForHeartCalculations) then
	{
		_val = ([_unit] call X39_MS2_fnc_getRespiratory) / X39_MS2_var_Respiratory_maxValue * X39_MS2_var_Respiratory_MaxPulseChange;
		_val = _val - X39_MS2_var_Respiratory_MaxPulseChange;
	};
	_newPulse = _pulseChange + _pulseCurrent;
	if(_pulseChange != 0) then
	{
		if(_newPulse >= X39_MS2_var_Heart_minHeartPulsePerSecond ||  {(_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage") >= 2}) then
		{
			if(X39_MS2_var_Heart_lowerPulseIfPermaKnockedOut && (_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage") >= 2 && _newPulse < X39_MS2_var_Heart_minHeartPulsePerSecond) then
			{
				_pulseChange = _pulseChange * X39_MS2_var_Heart_BlackedOutPulseModificator;
				_newPulse = _pulseChange + _pulseCurrent;
			};
			
			if(_stage != 0) then
			{
				if(_stage == 1) then
				{
					if(X39_MS2_var_Heart_pulseLimitStage1 != -1 && _newPulse > X39_MS2_var_Heart_pulseLimitStage1) then
					{
						_pulseChange = (-X39_MS2_var_Heart_basePulseChangePerTick * X39_MS2_var_Heart_pulseReductionMultiplicator);
						_newPulse = _pulseChange + _pulseCurrent;
					};
				}
				else
				{
					if(_stage == 2) then
					{
						if(X39_MS2_var_Heart_pulseLimitStage2 != -1 && _newPulse > X39_MS2_var_Heart_pulseLimitStage2) then
						{
							_pulseChange = (-X39_MS2_var_Heart_basePulseChangePerTick * X39_MS2_var_Heart_pulseReductionMultiplicator);
							_newPulse = _pulseChange + _pulseCurrent;
						};
					}
					else
					{
						if(_stage == 3) then
						{
							if(X39_MS2_var_Heart_pulseLimitStage3 != -1 && _newPulse > X39_MS2_var_Heart_pulseLimitStage3) then
							{
								_pulseChange = (-X39_MS2_var_Heart_basePulseChangePerTick * X39_MS2_var_Heart_pulseReductionMultiplicator);
								_newPulse = _pulseChange + _pulseCurrent;
							};
						}
						else
						{
							if(_stage == 4) then
							{
								if(X39_MS2_var_Heart_pulseLimitStage4 != -1 && _newPulse > X39_MS2_var_Heart_pulseLimitStage4) then
								{
									_pulseChange = (-X39_MS2_var_Heart_basePulseChangePerTick * X39_MS2_var_Heart_pulseReductionMultiplicator);
									_newPulse = _pulseChange + _pulseCurrent;
								};
							};
						};
					};
				};
			};
			
			if(_pulseChange != 0) then
			{
				_currentPulse = [_unit, _pulseChange] call X39_MS2_fnc_addHeartPulse;
				if(_currentPulse >= X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond) exitWith
				{
					[_unit, time] call X39_MS2_fnc_setFlatLine;
				};
				if(_currentPulse >= X39_MS2_var_Heart_knockOutUnitAtPulse) exitWith
				{
					[_unit, 1, X39_MS2_var_Heart_temporaryKnockOutBaseTimePulse + (random X39_MS2_var_Heart_temporaryKnockOutRandomTimePulse) - (X39_MS2_var_Heart_temporaryKnockOutRandomTimePulse / 2), localize "STR_X39_MS2_Scripting_Adrenaline_Pulse_TooHigh"] call X39_MS2_fnc_blackOutUnit;
				};			
			};
		};
	};
		/*
		if(_pulseChange + _pulseCurrent >= X39_MS2_var_Heart_minHeartPulsePerSecond || {(_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage") > 2}) then
		{
			if(_pulseChange + _pulseCurrent < X39_MS2_var_Heart_normalMaxHeartPulsePerSecond && {_adrenalineCurrent / X39_MS2_var_Drugs_Adrenaline_maxAdrenaline < X39_MS2_var_Drugs_Adrenaline_AdrenalinePulseRagePointP}) then
			{
				[_unit, _pulseChange] call X39_MS2_fnc_addHeartPulse;
			}
			else
			{
				_unit setVariable["X39_MS2_var_Internal_Ticker_cfnForceWalk", (_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk") + 1];
			};
			[_unit] call X39_MS2_fnc_doHeartPulseDependingActions;
			DEBUG_LOG_WFn("Pulse has been changed");
		}DEBUG_CODE(else{DEBUG_LOG_WFn("No pulse change required (lower min)");});
	}DEBUG_CODE(else{DEBUG_LOG_WFn("No pulse change has been made");});
	*/
	if(X39_MS2_var_Heart_pulseUseFilmGrainForHighPulseIndicator && _newPulse > X39_MS2_var_Heart_pulseFilmGrainKickIn) then
	{
		_val = ((_newPulse - X39_MS2_var_Heart_pulseFilmGrainKickIn) / (X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond - X39_MS2_var_Heart_pulseFilmGrainKickIn));
		if(_val > 0) then
		{
			_unit setVariable["X39_MS2_var_Internal_Ticker_ppeFilmGrain", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain") + _val];
		};
	};
	if(X39_MS2_var_Heart_allowForceWalkByPulse && {_newPulse > X39_MS2_var_Heart_pulseForceWalkAt}) then
	{
		_unit setVariable["X39_MS2_var_Internal_Ticker_cfnForceWalk", (_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk") + 1];
	};
	if(X39_MS2_var_Heart_allowBlurryScreenByPulse && {_newPulse > X39_MS2_var_Heart_pulseBlurryAt}) then
	{
		_val = ((_newPulse - X39_MS2_var_Heart_pulseBlurryAt) / (X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond - X39_MS2_var_Heart_pulseBlurryAt));
		if(_val > 0) then
		{
			_unit setVariable["X39_MS2_var_Internal_Ticker_ppeDynamicBlur", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur") + _val];
		};
	};
	if(X39_MS2_var_Heart_allowCamShakeByPulse && {_newPulse > X39_MS2_var_Heart_pulseCamShakeAt}) then
	{
		_val = ((_newPulse - X39_MS2_var_Heart_pulseCamShakeAt) / (X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond - X39_MS2_var_Heart_pulseCamShakeAt));
		if(_val > 0) then
		{
			addCamShake [_val * X39_MS2_var_Heart_camShakeMultiplicator, 3, 1];
		};
	};
};
MT_END
MT_DEBUG(_times pushBack [_fnc_scriptName COMMA MT_TIME])