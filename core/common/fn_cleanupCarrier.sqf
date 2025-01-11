#include "..\warlords_constants.inc"

"Carrier1RappelMarker" setMarkerAlpha 0;

private _changeAttackStatus = {
    params ["_carrier"];

    private _sector = _carrier getVariable ["WL_carrierSector", objNull];

    private _statics = WL_carrierProps;
    private _carrierStatics = _statics select {
        _x inArea (_sector getVariable "objectAreaComplete");
    };

    private _isUnderAttack = _carrier getVariable ["WL_carrierUnderAttack", false];
    {
        _x hideObject !_isUnderAttack;
    } forEach _carrierStatics;

    if (_isUnderAttack) then {
        "Carrier1RappelMarker" setMarkerAlpha 1;
    } else {
        "Carrier1RappelMarker" setMarkerAlpha 0;
    };
};

private _carriers = [Carrier1];

{
    private _carrier = _x;
    private _sector = (BIS_WL_allSectors select {
        _x distance2D _carrier < 500;
    }) # 0;
    _carrier setVariable ["WL_carrierSector", _sector];
} forEach _carriers;

while { !BIS_WL_missionEnd } do {
    {
        if (isNil "BIS_WL_currentTarget_west" || isNil "BIS_WL_currentTarget_east") then {
            sleep 5;
            continue;
        };
        private _carrier = _x;

        private _sector = _carrier getVariable ["WL_carrierSector", objNull];
        private _wasUnderAttack = _carrier getVariable ["WL_carrierUnderAttack", false];
        private _isUnderAttack = BIS_WL_currentTarget_west == _sector || BIS_WL_currentTarget_east == _sector;
        if (_wasUnderAttack != _isUnderAttack) then {
            _carrier setVariable ["WL_carrierUnderAttack", _isUnderAttack, true];
            [_carrier] call _changeAttackStatus;
        };
    } forEach _carriers;

    sleep 5;
};

// Ensure sync
[_carriers, _changeAttackStatus] spawn {
    params ["_carriers", "_changeAttackStatus"];

    while { !BIS_WL_missionEnd } do {
        sleep 60;
        {
            private _carrier = _x;
            [_carrier] call _changeAttackStatus;
        } forEach _carriers;
    };
};