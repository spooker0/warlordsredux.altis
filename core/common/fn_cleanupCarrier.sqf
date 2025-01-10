params ["_sector", ["_start", false]];

private _statics = allMissionObjects "Static";
private _sectorArea = _sector getVariable "objectAreaComplete";
private _props = _statics select {
    !(_x isKindOf "HouseBase") &&  _x inArea _sectorArea;
};

if (_start) then {
    private _carrier = ((8 allObjects 0) select {
        _x isKindOf "Land_Carrier_01_hull_base_F" && _x inArea _sectorMarker;
    }) # 0;

    {
        _x attachTo [_carrier];
    } forEach _props;
} else {
    {
        deleteVehicle _x;
        // _x hideObject true;
    } forEach _props;
};