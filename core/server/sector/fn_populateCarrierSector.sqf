#include "..\..\warlords_constants.inc"

params ["_sector"];

setViewDistance 4500;

ropeCreate [Carrier1Boat1, "", Carrier1Rope1, [0, 0, 0], -1];
Carrier1Boat1 lock true;
Carrier1Boat1 setPhysicsCollisionFlag false;

private _sectorMarker = _sector getVariable "objectAreaComplete";
private _carrier = ((8 allObjects 0) select {
    _x isKindOf "Land_Carrier_01_hull_base_F" && _x inArea _sectorMarker;
}) # 0;

private _airDefenseGroup = createGroup independent;
_airDefenseGroup deleteGroupWhenEmpty true;
private _airDefenses = [];
{
    _x params ["_type", "_pos", "_dir", "_lock", "_waypoints"];
    private _vehicleArray = [[_pos # 0, _pos # 1, _pos # 2 - 50], _dir, _type, independent] call BIS_fnc_spawnVehicle;
    _vehicleArray params ["_vehicle", "_crew", "_group"];

    _vehicle allowDamage false;
    _vehicle setDamage 0;
    _vehicle setVehiclePosition [[_pos # 0, _pos # 1, 10], [], 0, "CAN_COLLIDE"];

    _vehicle setVehicleReportRemoteTargets true;
    _vehicle setVehicleReceiveRemoteTargets true;
    _vehicle setVehicleReportOwnPosition true;

    _vehicle lock true;

    _vehicle call WL2_fnc_newAssetHandle;
    _airDefenses pushBack _vehicle;

    [_vehicle] joinSilent _airDefenseGroup;
    {
        _x call WL2_fnc_newAssetHandle;
        _x setSkill 1;
        [_x] joinSilent _airDefenseGroup;
        _airDefenses pushBack _x;
    } forEach _crew;
} forEach (_sector getVariable ["BIS_WL_vehiclesToSpawn", []]);
_airDefenseGroup setBehaviourStrong "COMBAT";
_airDefenseGroup setCombatMode "RED";

_sector setVariable ["BIS_WL_vehiclesToSpawn", nil];

private _unitsPool = serverNamespace getVariable ["WL2_populateUnitPoolList", []];

private _infantryGroups = [];
private _infantryUnits = [];
private _camoNets = (allMissionObjects "Land_CanvasCover_01_F") select {
    _x distance2D _carrier < 500;
};

private _spawned = 0;
{
    if (_spawned > 50) then {
        break;
    };

    private _net = _x;
    _net hideObject true;

    private _infantryGroup = createGroup independent;
    _infantryGroup deleteGroupWhenEmpty true;
    _infantryGroups pushBack _infantryGroup;

    private _netPosition = getPosATL _net;

    for "_i" from 0 to 8 do {
        private _infantry = _infantryGroup createUnit [selectRandom _unitsPool, _netPosition, [], 0, "NONE"];
        _infantry setVehiclePosition [[_netPosition # 0, _netPosition # 1, 50], [], 5, "CAN_COLLIDE"];

        private _collisions = _airDefenses select {
            _infantry distance _x < 1;
        };
        private _spawnHeight = getPosASL _infantry # 2;
        if (_spawnHeight < 10 || count _collisions > 0) then {
            deleteVehicle _infantry;
        } else {
            _infantry call WL2_fnc_newAssetHandle;
            _spawned = _spawned + 1;
            doStop _infantry;
            _infantryUnits pushBack _infantry;
        };

        sleep 0.001;
    };

    _infantryGroup setBehaviour "COMBAT";

    _net hideObject false;
} forEach (_camoNets call BIS_fnc_arrayShuffle);

[_infantryUnits + _airDefenses, _sector] spawn WL2_fnc_assetRelevanceCheck;

[_sector, _airDefenses, _infantryGroups] spawn {
    params ["_sector", "_airDefenses", "_infantryGroups"];
    while { _sector getVariable ["BIS_WL_owner", sideUnknown] == independent } do {
        sleep 1;
    };

    setViewDistance 1600;
};

[_sector, _airDefenses] spawn {
    params ["_sector", "_airDefenses"];
    while { _sector getVariable ["BIS_WL_owner", sideUnknown] == independent } do {
        {
            [_x, 1] remoteExec ["setVehicleAmmo", _x];
            [_x, 1] remoteExec ["setVehicleRadar", _x];
        } forEach _airDefenses;

        {
            if (getPosATL _x # 2 > 50) then {
                independent reportRemoteTarget [_x, 30];
            };
        } forEach vehicles;

        sleep 15;
    };
};