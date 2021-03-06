#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Resets ppEffects generated by XMS
 *	((Also resets overlay elements))
 *	
 *	@Return - N/A
 *	@Author - X39
 */
if(!hasInterface) exitWith { PRINT_INFO("ArmA instance has no interface, cannot reset effects"); };
X39_MS2_var_Internal_ppe_radialBlur			ppEffectEnable X39_MS2_var_ppEffect_EnableRadialBlur;
X39_MS2_var_Internal_ppe_chromAberration	ppEffectEnable X39_MS2_var_ppEffect_EnableChromAberration;
X39_MS2_var_Internal_ppe_wetDistortion		ppEffectEnable X39_MS2_var_ppEffect_EnableWetDistortion;
X39_MS2_var_Internal_ppe_colorCorrections	ppEffectEnable X39_MS2_var_ppEffect_EnableColorCorrections;
X39_MS2_var_Internal_ppe_dynamicBlur		ppEffectEnable X39_MS2_var_ppEffect_EnableDynamicBlur;
X39_MS2_var_Internal_ppe_filmGrain			ppEffectEnable X39_MS2_var_ppEffect_EnableFilmGrain;
X39_MS2_var_Internal_ppe_colorInversion		ppEffectEnable X39_MS2_var_ppEffect_EnableColorInversion;

X39_MS2_var_Internal_ppe_radialBlur			ppEffectAdjust [ 0, 0, 0.3, 0.3];
X39_MS2_var_Internal_ppe_chromAberration	ppEffectAdjust [0, 0, true];
X39_MS2_var_Internal_ppe_wetDistortion		ppEffectAdjust [0, 0, 0, 1, 1, 1, 1, 0.1, 0.1, 0.03, 0.03, 0.05, 0.55, 0.75, 0.75];
X39_MS2_var_Internal_ppe_colorCorrections	ppEffectAdjust [1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1.75 * 1, 0, 1, 0.1, 1];
X39_MS2_var_Internal_ppe_dynamicBlur		ppEffectAdjust [0];
X39_MS2_var_Internal_ppe_filmGrain			ppEffectAdjust [0, 1, 1, 0.1, 0.1, false];
X39_MS2_var_Internal_ppe_colorInversion		ppEffectAdjust [0, 0, 0];

X39_MS2_var_Internal_ppe_radialBlur			ppEffectCommit 0;
X39_MS2_var_Internal_ppe_chromAberration	ppEffectCommit 0;
X39_MS2_var_Internal_ppe_wetDistortion		ppEffectCommit 0; 
X39_MS2_var_Internal_ppe_colorCorrections	ppEffectCommit 0;
X39_MS2_var_Internal_ppe_dynamicBlur		ppEffectCommit 0;
X39_MS2_var_Internal_ppe_filmGrain			ppEffectCommit 0;
X39_MS2_var_Internal_ppe_colorInversion		ppEffectCommit 0;

displayCtrl_Overlay(1292) ctrlShow false;
displayCtrl_Overlay(1293) ctrlSetTextColor [1, 1, 1, 0];
displayCtrl_Overlay(1294) ctrlSetTextColor [1, 1, 1, 0];
