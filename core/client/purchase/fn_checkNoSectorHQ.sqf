#include "..\..\warlords_constants.inc"

private _findCurrentSector = (BIS_WL_sectorsArray # 0) select {
    player inArea (_x getVariable "objectAreaComplete")
};

if (count _findCurrentSector == 0) exitWith {
    [false, localize "STR_A3_WL_menu_arsenal_restr1"];
};

private _currentSector = _findCurrentSector # 0;
private _sectorHQ = _currentSector getVariable ["WL_sectorHQ", objNull];
if (!isNull _sectorHQ) exitWith {
    [false, "Sector already has a sector HQ."];
};

private _sectorBuilding = nearestBuilding (getPosASL player);
private _sectorHQRadius = (boundingBoxReal _sectorBuilding) # 2;
private _distanceToSectorBuilding = player distance _sectorBuilding;
if (_distanceToSectorBuilding > _sectorHQRadius) exitWith {
    [false, "You are not in or near a building that can be a sector HQ."];
};

[true, ""];