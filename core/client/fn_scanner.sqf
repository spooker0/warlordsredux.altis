#include "..\warlords_constants.inc"

params ["_asset"];

WL_ScannerUnits = WL_ScannerUnits + [_asset];
while { alive _asset } do {
    private _assetSide = [_asset] call WL2_fnc_getAssetSide;

    if (_assetSide != BIS_WL_playerSide) then {
        sleep 5;
        continue;
    };

    private _assetPos = _asset modelToWorldVisual [0, 0, 0];
    private _assetHeight = _assetPos # 2;
    private _scanRadius = (_assetHeight * 2) min 1000;
    private _vehiclesInRadius = (vehicles + allUnits) select {
        private _vehiclePos = _x modelToWorldVisual [0, 0, 0];
        _x getVariable ["WL_spawnedAsset", false] &&
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

    _asset setVariable ["WL_scannedObjects", _enemyVehicles, true];
    sleep 5;
};