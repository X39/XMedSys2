#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function
 *
 *	@Param1 - STRING - function suffix
 *	@Param2 - BOOL - generate add/get/set dummies for this
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {};//TODO: give output
_this spawn {
	X39_MS2_var_Internal_DialogCommunication_MA_preventActions = true;
	_this call {
		scopeName "returnOutOfScope";
		private["_fncAdd", "_fncSet", "_fncGet", "_targetToRemoveItemsFrom"];

		DEBUG_CODE(_fnc_scriptName = "X39_MS2_fnc_MedicalActionMenu_btnPerformAction");
		_index = X39_MS2_var_Internal_DialogCommunication_MA_currentItem;
		_suffix = toUpper ([_this, 0, "", [""]] call BIS_fnc_param);
		_usesGetSetAddFunctions =	[_this, 1, true, [true]] call BIS_fnc_param;
		if(X39_MS2_var_Internal_DialogCommunication_MA_currentItem == -1) exitWith {};

		if(_index < 1 || {_index > count X39_MS2_var_Internal_MedicalActions_actionArray}) exitWith {PRINT_WARNING("Requested action is not existing inside of the MAA");};
		_action = X39_MS2_var_Internal_MedicalActions_actionArray select _index;

		if(_suffix == "") exitWith {PRINT_ERROR("No functionSuffix has been provided");};

		if(_usesGetSetAddFunctions) then
		{
			
			_fncAdd = {[_this, format["X39_MS2_fnc_addDamageTo%1", _suffix], (_this select 0), false] call BIS_fnc_MP;};
			_fncSet = {[_this, format["X39_MS2_fnc_setDamageOf%1", _suffix], (_this select 0), false] call BIS_fnc_MP;};
			_fncGet = {[_this, format["X39_MS2_fnc_getDamageOf%1", _suffix], (_this select 0), false] call BIS_fnc_MP;};
			if(isNil "_fncAdd") exitWith {PRINT_ERROR(format["The function %1 has not been found" COMMA format["X39_MS2_fnc_addDamageTo%1" COMMA _suffix]]); breakOut "returnOutOfScope";};
			if(isNil "_fncSet") exitWith {PRINT_ERROR(format["The function %1 has not been found" COMMA format["X39_MS2_fnc_setDamageOf%1" COMMA _suffix]]); breakOut "returnOutOfScope";};
			if(isNil "_fncGet") exitWith {PRINT_ERROR(format["The function %1 has not been found" COMMA format["X39_MS2_fnc_getDamageOf%1" COMMA _suffix]]); breakOut "returnOutOfScope";};
		}
		else
		{
			_fncAdd = {};
			_fncSet = {};
			_fncGet = {};
		};
		DEBUG_LOG_WFn(format["_fncAdd = '%1'" COMMA _fncAdd]);
		DEBUG_LOG_WFn(format["_fncSet = '%1'" COMMA _fncSet]);
		DEBUG_LOG_WFn(format["_fncGet = '%1'" COMMA _fncGet]);
		//Handle action
		//_name =			(	_action select  1 	);
		_fncName =			(	_action select  2 	);
		_limitationName =	(	_action select  3 	); //TODO: Implement new limitation system
		_animation =		(	_action select  4 	);
		_animationTime =	(	_action select  5 	);
		_sound =			(	_action select  6 	);
		_soundTimeout =		(	_action select  7 	);
		_image =			(	_action select  8 	);
		_items =			(	_action select  9 	);
		//_condition =		(	_action select  10 	);
		//_allowSelfUse =	(	_action select  11 	);
		_healingValue =		(	_action select  12 	);
		_workingParts =		(	_action select  13 	);
		_consumesItems =	(	_action select 	14	);

		_efficency = 1; //TODO: Implement new limitation system

		if(ISCHARP(_fncName)) then
		{
			_fncName = missionNamespace getVariable [_fncName, {}];
		};
		if(ISCHARP(_healingValue)) then
		{
			_healingValue = missionNamespace getVariable [_healingValue, ""];
		};

		if(_workingParts find _suffix == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputCannotBeAppliedOnThisPartMessage};

		if(_consumesItems && {count _items > 0}) then
		{
			private["_index", "_i"];
			_targetToRemoveItemsFrom = if({items player find _x != -1} count _items > 0) then { player } else { if({items X39_MS2_var_Internal_DialogCommunication_MA_Target find _x != -1} count _items > 0 ) then { X39_MS2_var_Internal_DialogCommunication_MA_Target } else { objNull}};
			if(isNull _targetToRemoveItemsFrom) exitWith { [_items select (floor (random count _items)), X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_MedicalActionMenu_outputMissingItemsMessage; breakOut "returnOutOfScope"; };
			_index = -1;
			_i = 0;
			while{_index == -1} do
			{
				if(items _targetToRemoveItemsFrom find (_items select 0) != -1) then
				{
					_index = items _targetToRemoveItemsFrom find (_items select 0);
				};
				
				//Make sure we only iterate one time through the entire inventory
				_i = _i + 1;
				if(count items _targetToRemoveItemsFrom == _i && _index == -1) then
				{
					//when through set _index to -2 to indicate that something moved wrong
					_index = -2;
				};
			};
			if(_index == -2) exitWith { PRINT_ERROR(format["btnPerformAction was unable to perform the remove of an item! Please check manually using these values and report: %1" COMMA [_targetToRemoveItemsFrom COMMA items _targetToRemoveItemsFrom COMMA _items]]); breakOut "returnOutOfScope";};
			_targetToRemoveItemsFrom removeItem (_items select 0);
		};

		DEBUG_LOG_WFn(str [_this COMMA _action]);
		_noAnimationPresent = (_animation == "");
		if(_noAnimationPresent) then
		{
			if(vehicle player == player) then
			{
				//Others: MedicStart; Self: Medic
				player playAction "MedicStart";
			};
		}
		else
		{
			if(vehicle player == player) then
			{
				//Commented out as currently unfunctional: http://feedback.arma3.com/view.php?id=15808
				//player playMoveNow _animation; 
				player playAction "MedicStart"; _noAnimationPresent = true;
			};
		};
		_spawnHandle = [_sound, _soundTimeout] spawn {
			if(_this select 0 == "") exitWith {};
			sleep (_this select 1);
			if([player] call X39_MS2_fnc_isBlackedOut) exitWith {};
			playSound3D [_this select 0, player, false, position player, 1, 1, 0];
		};
		sleep _animationTime;
		
		if([player] call X39_MS2_fnc_isBlackedOut) exitWith {X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;};
		if(_noAnimationPresent) then
		{
			if(vehicle player == player) then
			{
				player playAction "MedicStop";
			};
		};
		if(_healingValue > 0) then
		{
			[X39_MS2_var_Internal_DialogCommunication_MA_Target, -(_healingValue * _efficency)] call _fncAdd;
		};
		[player, X39_MS2_var_Internal_DialogCommunication_MA_Target, _efficency, _suffix] call _fncName;
	};
	X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
};