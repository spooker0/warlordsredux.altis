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

private _moneySign = [BIS_WL_playerSide] call WL2_fnc_getMoneySign;

private _eligibleFastTravel = (["FTSeized", [], "", "", "", [], 0, "Strategy"] call WL2_fnc_purchaseMenuAssetAvailability) # 0;
private _eligibleSectors = (BIS_WL_sectorsArray # 0) select {
    (_x getVariable ["BIS_WL_owner", independent]) == (side (group player))
};
if (_eligibleFastTravel && _sector in _eligibleSectors) then {
    ["FAST TRAVEL (FREE)", {
        params ["_sector"];
        BIS_WL_targetSector = _sector;
        private _eligibleFastTravel = (["FTSeized", [], "", "", "", [], 0, "Strategy"] call WL2_fnc_purchaseMenuAssetAvailability) # 0;
        private _eligibleSectors = (BIS_WL_sectorsArray # 0) select {
            (_x getVariable ["BIS_WL_owner", independent]) == (side (group player))
        };
        if (_eligibleFastTravel && _sector in _eligibleSectors) then {
            [false, ""] spawn WL2_fnc_executeFastTravel;
        } else {
            playSoundUI "AddItemFailed";
        };
    }, true] call WL2_fnc_addTargetMapButton;
};

private _fastTravelConflictCost = getMissionConfigValue ["BIS_WL_fastTravelCostContested", 200];
private _eligibleFastTravelConflict = (["FTConflict", [], "", "", "", [], _fastTravelConflictCost, "Strategy"] call WL2_fnc_purchaseMenuAssetAvailability) # 0;
private _sectorIsTarget = _sector == WL_TARGET_FRIENDLY;
if (_eligibleFastTravelConflict && _sectorIsTarget) then {
    private _fastTravelText = format ["FAST TRAVEL CONTESTED (%1%2)", _moneySign, _fastTravelConflictCost];
    [_fastTravelText, {
        params ["_sector"];
        BIS_WL_targetSector = _sector;
        private _eligibleFastTravelConflict = (["FTConflict", [], "", "", "", [], _fastTravelConflictCost, "Strategy"] call WL2_fnc_purchaseMenuAssetAvailability) # 0;
        private _sectorIsTarget = _sector == WL_TARGET_FRIENDLY;
        if (_eligibleFastTravelConflict && _sectorIsTarget) then {
            private _startArr = (synchronizedObjects WL_TARGET_FRIENDLY) select {
                (_x getVariable "BIS_WL_owner") == BIS_WL_playerSide
            };
            _startArr = _startArr apply {
                [_x distance2D player, _x]
            };
            _startArr sort true;

            private _start = (_startArr # 0) # 1;
            private _area = WL_TARGET_FRIENDLY getVariable "objectArea";
            private _size = if (_area # 3) then {
                sqrt (((_area # 0) ^ 2) + ((_area # 1) ^ 2));
            } else {
                (_area # 0) max (_area # 1);
            };

            private _marker = createMarkerLocal ["localMarker", [WL_TARGET_FRIENDLY, _size + WL_FAST_TRAVEL_OFFSET, WL_TARGET_FRIENDLY getDir _start] call BIS_fnc_relPos];
            _marker setMarkerShapeLocal "RECTANGLE";
            _marker setMarkerColorLocal BIS_WL_colorMarkerFriendly;
            _marker setMarkerDirLocal (WL_TARGET_FRIENDLY getDir _start);
            _marker setMarkerSizeLocal [_size, WL_FAST_TRAVEL_RANGE_AXIS];
            [_marker] spawn {
                params ["_marker"];
                [true, _marker] call WL2_fnc_executeFastTravel;
                deleteMarkerLocal _marker;
            };
        } else {
            playSoundUI "AddItemFailed";
        };
    }, true] call WL2_fnc_addTargetMapButton;
};

private _scanCost = getMissionConfigValue ["BIS_WL_scanCost", 750];
private _eligibleScan = (["Scan", [], "", "", "", [], _scanCost, "Strategy"] call WL2_fnc_purchaseMenuAssetAvailability) # 0;
private _allScannableSectors = BIS_WL_sectorsArray # 3;
private _lastScanEligible = serverTime - (getMissionConfigValue ["BIS_WL_scanCooldown", 300]);
private _availableSectors = _allScannableSectors select {
    _x getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999] < _lastScanEligible
};
if (_eligibleScan && _sector in _availableSectors) then {
    private _scanText = format ["SECTOR SCAN (%1%2)", _moneySign, _scanCost];
    [_scanText, {
        params ["_sector"];
        private _eligibleScan = (["Scan", [], "", "", "", [], _scanCost, "Strategy"] call WL2_fnc_purchaseMenuAssetAvailability) # 0;
        private _allScannableSectors = BIS_WL_sectorsArray # 3;
        private _lastScanEligible = serverTime - (getMissionConfigValue ["BIS_WL_scanCooldown", 300]);
        private _availableSectors = _allScannableSectors select {
            _x getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999] < _lastScanEligible
        };
        if (_eligibleScan && _sector in _availableSectors) then {
            [player, "scan", [], _sector] remoteExec ["WL2_fnc_handleClientRequest", 2];
        } else {
            playSoundUI "AddItemFailed";
        };
    }, true] call WL2_fnc_addTargetMapButton;
};

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