params ["_asset", ["_toggle", true], ["_forceLock", false]];

private _locking = false;
if (_toggle) then {
    if (unitIsUAV _asset) then {
        private _wasLockedBefore = _asset getVariable ["BIS_WL_lockedFromSquad", false];
        _locking = !_wasLockedBefore;
        _asset setVariable ["BIS_WL_lockedFromSquad", _locking, true];
    } else {
        _locking = (locked _asset) != 2;
        _asset lock _locking;
    };
} else {
    _locking = _forceLock;
    if (unitIsUAV _asset) then {
        _asset setVariable ["BIS_WL_lockedFromSquad", _forceLock, true];
    } else {
        _asset lock _forceLock;
    };
};

if (_locking) then {
    playSound3D ["a3\sounds_f\vehicles\air\noises\sl_1hooklock.wss", _asset, false, getPosASL _asset, 1, 1, 0, 0];
} else {
    playSound3D ["a3\sounds_f\vehicles\air\noises\sl_1hookunlock.wss", _asset, false, getPosASL _asset, 1, 1, 0, 0];
};