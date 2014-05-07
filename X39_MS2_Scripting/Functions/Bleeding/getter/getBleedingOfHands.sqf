#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current Bleeding value of given unit for the HANDS hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current Bleeding of the unit
 */
if(X39_MS2_var_Bleeding_EnableHitzoneHands) then
{
	(_this select 0) getVariable ["X39_MS2_var_Bleeding_Hands", -1]
}
else
{
	0
};