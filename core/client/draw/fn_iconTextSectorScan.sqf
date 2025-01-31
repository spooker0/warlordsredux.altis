params ["_unit"];

if ([_unit] call WL2_fnc_isScannerMunition) exitWith {
	private _originator = getShotParents _unit # 0;
	private _originatorType = [_originator] call WL2_fnc_getAssetTypeName;
	format ["[%1]", toUpper _originatorType];
};

if !(vehicle _unit isKindOf "CAManBase") then {
	[_unit] call WL2_fnc_getAssetTypeName;
} else {
	"";
};