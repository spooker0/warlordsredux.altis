#include "..\..\warlords_constants.inc"

params ["_sector", "_conditionName"];

switch (_conditionName) do {
    case "fastTravelSeized": {
        private _eligibleSectors = (BIS_WL_sectorsArray # 2) select {
            (_x getVariable ["BIS_WL_owner", independent]) == (side (group player))
        };
        _sector in _eligibleSectors;
    };
    case "fastTravelConflict";
    case "airAssault": {
        _sector == WL_TARGET_FRIENDLY;
    };
    case "vehicleParadrop": {
        private _sectorAvailable = _sector in (BIS_WL_sectorsArray # 2);
        private _isCarrierSector = count (_sector getVariable ["WL_aircraftCarrier", []]) > 0;
        _sectorAvailable && !_isCarrierSector;
    };
    case "scan": {
        private _allScannableSectors = BIS_WL_sectorsArray # 3;
        private _lastScanEligible = serverTime - (getMissionConfigValue ["BIS_WL_scanCooldown", 300]);
        private _availableSectors = _allScannableSectors select {
            _x getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999] < _lastScanEligible
        };
        _sector in _availableSectors;
    };
};