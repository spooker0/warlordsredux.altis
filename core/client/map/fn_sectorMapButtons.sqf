#include "..\..\warlords_constants.inc"

private _dialog = findDisplay 46 createDisplay "RscDisplayEmpty";

getMousePosition params ["_mouseX", "_mouseY"];

private _offsetX = _mouseX + 0.03;
private _offsetY = _mouseY + 0.04;

private _menuButtons = [];

WL2_TargetButtonSetup = [_dialog, _menuButtons, _offsetX, _offsetY];

private _sector = WL_SectorActionTarget;
WL_ActionTarget = WL_SectorActionTarget;

private _titleBar = _dialog ctrlCreate ["RscStructuredText", -1];
_titleBar ctrlSetPosition [_offsetX, _offsetY - 0.05, 0.4, 0.05];
_titleBar ctrlSetBackgroundColor [0.3, 0.3, 0.3, 1];
_titleBar ctrlSetTextColor [0.7, 0.7, 1, 1];
private _sectorName = _sector getVariable ["BIS_WL_name", "Sector"];
_titleBar ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", toUpper _sectorName];
_titleBar ctrlCommit 0;

// Fast Travel Seized Button
private _fastTravelSeizedCondition = {
    params ["_sector"];
    private _eligibleSectors = (BIS_WL_sectorsArray # 2) select {
        (_x getVariable ["BIS_WL_owner", independent]) == (side (group player))
    };
    _sector in _eligibleSectors;
};
private _fastTravelSeizedExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;
    [0, ""] spawn WL2_fnc_executeFastTravel;
};
[
    "FAST TRAVEL",
    _fastTravelSeizedExecute,
    true,
    _fastTravelSeizedCondition,
    [
        0,
        "FTSeized",
        "Strategy"
    ]
] call WL2_fnc_addTargetMapButton;

// Fast Travel Conflict Button
private _fastTravelConflictCondition = {
    params ["_sector"];
    _sector == WL_TARGET_FRIENDLY;
};
private _fastTravelConflictExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;

    private _fastTravelConflictCall = 1 call WL2_fnc_fastTravelConflictMarker;
    private _marker = _fastTravelConflictCall # 0;
    [1, _marker] call WL2_fnc_executeFastTravel;
    deleteMarkerLocal _marker;

    private _markerText = _fastTravelConflictCall # 1;
    deleteMarkerLocal _markerText;
};
[
    "FAST TRAVEL CONTESTED",
    _fastTravelConflictExecute,
    true,
    _fastTravelConflictCondition,
    [
        getMissionConfigValue ["BIS_WL_fastTravelCostContested", 200],
        "FTConflict",
        "Strategy"
    ]
] call WL2_fnc_addTargetMapButton;

// Air Assault Button
private _airAssaultCondition = {
    params ["_sector"];
    _sector == WL_TARGET_FRIENDLY;
};
private _airAssaultExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;

    private _fastTravelConflictCall = 2 call WL2_fnc_fastTravelConflictMarker;
    private _marker = _fastTravelConflictCall # 0;
    [2, _marker] call WL2_fnc_executeFastTravel;
    deleteMarkerLocal _marker;

    private _markerText = _fastTravelConflictCall # 1;
    deleteMarkerLocal _markerText;
};
[
    "AIR ASSAULT",
    _airAssaultExecute,
    true,
    _airAssaultCondition,
    [
        getMissionConfigValue ["WL_airAssaultCost", 100],
        "FTAirAssault",
        "Strategy"
    ]
] call WL2_fnc_addTargetMapButton;

// Vehicle Air Assault Button
private _vehicleAirAssaultCondition = {
    params ["_sector"];
    _sector == WL_TARGET_FRIENDLY;
};
private _vehicleAirAssaultExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;

    private _fastTravelConflictCall = 3 call WL2_fnc_fastTravelConflictMarker;
    private _marker = _fastTravelConflictCall # 0;
    [3, _marker] call WL2_fnc_executeFastTravel;
    deleteMarkerLocal _marker;

    private _markerText = _fastTravelConflictCall # 1;
    deleteMarkerLocal _markerText;
};
[
    "VEHICLE AIR ASSAULT",
    _vehicleAirAssaultExecute,
    true,
    _vehicleAirAssaultCondition,
    [
        getMissionConfigValue ["WL_vehicleAirAssaultCost", 1000],
        "FTAirAssaultVehicle",
        "Strategy"
    ]
] call WL2_fnc_addTargetMapButton;

// Scan Button
private _scanCondition = {
    params ["_sector"];
    private _allScannableSectors = BIS_WL_sectorsArray # 3;
    private _lastScanEligible = serverTime - (getMissionConfigValue ["BIS_WL_scanCooldown", 300]);
    private _availableSectors = _allScannableSectors select {
        _x getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999] < _lastScanEligible
    };
    _sector in _availableSectors;
};
private _scanExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;
    [player, "scan", [], _sector] remoteExec ["WL2_fnc_handleClientRequest", 2];
};
[
    "SECTOR SCAN",
    _scanExecute,
    true,
    _scanCondition,
    [
        getMissionConfigValue ["BIS_WL_scanCost", 750],
        "Scan",
        "Strategy"
    ]
] call WL2_fnc_addTargetMapButton;

[_dialog, _offsetX, _offsetY, _menuButtons] spawn {
    params ["_dialog", "_originalMouseX", "_originalMouseY", "_menuButtons"];
    private _keepDialog = true;
    private _menuHeight = (count _menuButtons) * 0.05;
    private _startTime = serverTime;
    waitUntil {
        sleep 0.1;
        !visibleMap || inputMouse 0 == 0 || serverTime - _startTime > 1;
    };
    while { visibleMap && _keepDialog} do {
        getMousePosition params ["_mouseX", "_mouseY"];

        private _deltaX = _mouseX - _originalMouseX;
        private _deltaY = _mouseY - _originalMouseY;

        if (_deltaX < 0 || _deltaX > 0.4 || _deltaY < -0.05 || _deltaY > _menuHeight) then {
            _keepDialog = inputMouse 0 == 0 && inputMouse 1 == 0;
        };
    };

    WL_AssetActionTarget = objNull;
    _dialog closeDisplay 1;
};

if (count _menuButtons == 0) then {
    _dialog closeDisplay 1;
};

WL2_TargetButtonSetup = [obNull, [], 0, 0];