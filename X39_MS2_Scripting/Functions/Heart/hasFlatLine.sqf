#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will set flatLine value of given unit
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Return - NA
 */
if(((_this select 0) getVariable["X39_MS2_var_Heart_hasFlatLine", 0]) > 0) then
{
	true
}
else
{
	false
}