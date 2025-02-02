params ["_projectile"];

if !(_projectile isKindOf "MissileCore") exitWith {};

while { alive _projectile } do {
    private _target = missileTarget _projectile;
    _projectile setVariable ["APS_missileState", (missileState _projectile) # 1, owner _target];
    sleep 0.1;
};