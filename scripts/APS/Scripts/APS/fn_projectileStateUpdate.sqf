params ["_projectile"];

if !(_projectile isKindOf "MissileCore") exitWith {};

private _target = objNull;
private _state = "";
while { alive _projectile } do {
    _target = missileTarget _projectile;

    private _newState = (missileState _projectile) # 1;
    if (_newState != _state) then {
        _state = _newState;
        _projectile setVariable ["APS_missileState", _state, owner _target];
    };

    sleep 0.1;
};