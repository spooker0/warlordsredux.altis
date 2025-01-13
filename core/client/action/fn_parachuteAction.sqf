params ["_target", "_caller", "_actionId", "_arguments"];

private _callerPos = getPosATL _caller;
private _parachute = createVehicle ["Steerable_Parachute_F", _callerPos, [], 0, "CAN_COLLIDE"];
_parachute allowDamage false;
_caller moveInDriver _parachute;
_parachute setDir (getDir _caller);

_caller removeAction _actionId;