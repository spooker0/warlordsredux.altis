params ["_projectile"];

if !(_projectile isKindOf "MissileCore") exitWith {};

while { alive _projectile } do {
    private _currentState = (missileState _projectile) # 1;
    if (_currentState == "LOST") then {
        _projectile setVariable ["APS_missileLost", true, owner (missileTarget _projectile)];
        break;
    };

    sleep 0.1;
};