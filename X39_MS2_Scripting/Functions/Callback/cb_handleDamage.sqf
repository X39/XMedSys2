#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Callback function for HandleDamage eventHandler
 *	@Param1 - OBJECT - Object the event handler is assigned to.
 *	@Param2 - STRING - Name of the selection where the unit was damaged. "" for over-all structural damage, "?" for unknown selections.
 *	@Param3 - SCALAR - Resulting level of damage for the selection.
 *	@Param4 - OBJECT - The source unit that caused the damage.
 *	@Param5 - STRING - Classname of the projectile that caused inflicted the damage. ("" for unknown, such as falling damage.)
 *	@Return - SCALAR - New damage value (always 0)
 */

private ['_unit', '_lvlOfDmg'];

_unit = _this select 0;
_lvlOfDmg = _this select 3;

hint "Test!":

//This will check if the player getting fall damag
systemChat "Called!"
systemChat format ["%1", _unit];
systemChat format ["%1", _lvlOfDmg];

//Keep player at 0 ArmA damage to make custom damage system handling possible
0