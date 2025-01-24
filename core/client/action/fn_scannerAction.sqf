#include "..\..\warlords_constants.inc"
params ["_asset"];

private _actionId = _asset addAction [
	"SCANNER: INITIALIZING",
	{
        params ["_asset", "_caller", "_actionId"];
        private _scannerOn = _asset getVariable ["WL_scannerOn", false];
        private _newScannerOn = !_scannerOn;
        _asset setVariable ["WL_scannerOn", _newScannerOn, true];
		private _consumption = if (_asset isKindOf "LandVehicle") then {
			25;
		} else {
			50;
		};
        if (_newScannerOn) then {
			[_asset, _consumption] remoteExec ["setFuelConsumptionCoef", _asset];
        } else {
			[_asset, 1] remoteExec ["setFuelConsumptionCoef", _asset];
        };
		[_asset, _actionId] call WL2_fnc_scanner;
	},
	[],
	99,
	false,
	false,
	"ActiveSensorsToggle",
	"alive _target && ([_target, player, ""driver""] call WL2_fnc_accessControl) # 0",
	30,
	false
];

[_asset, _actionId] spawn {
	params ["_asset", "_actionId"];
	while { alive _asset } do {
        [_asset, _actionId] call WL2_fnc_scanner;
		sleep 2;
	};
};