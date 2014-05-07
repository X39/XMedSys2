#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current Bleeding value of given unit for the HEAD hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current Bleeding of the unit
 */
if(X39_MS2_var_Bleeding_EnableHitzoneHead) then
{
	(_this select 0) getVariable ["X39_MS2_var_Bleeding_Head", -1]
}
else
{
	0
};