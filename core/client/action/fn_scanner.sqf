#include "..\..\warlords_constants.inc"

params ["_asset", "_actionId"];

private _scannerOn = _asset getVariable ["WL_scannerOn", false];

private _actionColor = if (_scannerOn) then {
    "#4bff58";
} else {
    "#ff4b4b";
};

private _actionText = if (_scannerOn) then {
    "SCANNER: ON";
} else {
    "SCANNER: OFF";
};

_asset setUserActionText [_actionId, format ["<t color = '%1'>%2 [%3]</t>", _actionColor, _actionText, actionKeysNames "ActiveSensorsToggle"]];

if (!_scannerOn) exitWith {
    _asset setVariable ["WL_scannedObjects", []];
};
if (!isEngineOn _asset) exitWith {
    _asset setVariable ["WL_scannedObjects", []];
};

private _assetSide = [_asset] call WL2_fnc_getAssetSide;

if (_assetSide != side group player) exitWith {};

private _assetPos = _asset modelToWorldVisual [0, 0, 0];
private _assetHeight = _assetPos # 2;
if (_assetHeight > 2000) exitWith {
    _asset setVariable ["WL_scannedObjects", []];
};

private _scanRadius = ((_assetHeight * 2) min 1000) max 100;
private _vehiclesInRadius = (vehicles + allUnits) select {
    private _vehiclePos = _x modelToWorldVisual [0, 0, 0];
    (_x getVariable ["WL_spawnedAsset", false] || isPlayer _x) &&
    _vehiclePos # 2 < _assetHeight &&
    _vehiclePos distance2D _assetPos < _scanRadius &&
    alive _x &&
    isNull objectParent _x;
};
private _enemyVehicles = _vehiclesInRadius select {
    private _vehicleSide = [_x] call WL2_fnc_getAssetSide;
    _vehicleSide != _assetSide;
};

{
    _assetSide reportRemoteTarget [_x, 10];
} forEach _enemyVehicles;

if (getConnectedUAV player == _asset || vehicle player == _asset) then {
    playSoundUI ["radarTargetLost"];
};

_asset setVariable ["WL_scannedObjects", _enemyVehicles];