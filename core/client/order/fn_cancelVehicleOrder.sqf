params ["_originalPosition", "_limitDistance", "_ignoreSector"];

private _enemiesNearPlayer = (allPlayers inAreaArray [player, 100, 100]) select {_x != player && BIS_WL_playerSide != side group _x && alive _x};
private _homeBase = BIS_WL_playerSide call WL2_fnc_getSideBase;
private _isInHomeBase = player inArea (_homeBase getVariable "objectAreaComplete");
private _nearbyEnemies = count _enemiesNearPlayer > 0 && !_isInHomeBase;
private _ownedSector = (BIS_WL_sectorsArray # 0) select {
    player inArea (_x getVariable "objectAreaComplete")
};
private _isOutOfSector = count _ownedSector == 0;
private _isInCarrierSector = count (BIS_WL_allSectors select {
    player inArea (_x getVariable "objectAreaComplete") && count (_x getVariable ["WL_aircraftCarrier", []]) > 0
}) > 0;

vehicle player != player ||
!alive player ||
lifeState player == "INCAPACITATED" ||
(_nearbyEnemies && !_ignoreSector) ||
(!_isInCarrierSector && (getPosATL player) select 2 > 1) ||
(_isOutOfSector && !_ignoreSector) ||
(!_isInCarrierSector && (_originalPosition distance2D player) > _limitDistance);
