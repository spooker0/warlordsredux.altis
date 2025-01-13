params ["_attach", "_arguments"];

if (_attach) then {
    private _asset = _arguments # 0;
    private _load = _arguments # 1;
    private _offset = _arguments # 2;

    _load attachTo [_asset, _offset];

    _asset setVariable ["WL2_loadingAsset", false, true];
} else {
    private _asset = _arguments # 0;
    private _load = _arguments # 1;
    private _position = _arguments # 2;
    private _direction = _arguments # 3;

    detach _load;
    _load setDir _direction;
    _load setVehiclePosition [_position, [], 0, "CAN_COLLIDE"];

    _asset setVariable ["WL2_loadingAsset", false, true];
};