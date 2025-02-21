#include "..\..\warlords_constants.inc"

params ["_asset"];

[
    _asset,
    "<t color='#ff0000'>Begin Demolition</t>",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",
    "speed player < 1 && _target getVariable ['WL_demolishTime', -1] < 0",
    "speed player < 1 && _target getVariable ['WL_demolishTime', -1] < 0",
    {},
    {
        params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];
        if (_frame % 4 == 0) then {
            playSound3D ["\a3\sounds_f\arsenal\tools\minedetector_beep_01.wss", _target, false, getPosASL _target, 2, 1, 200];
        };
    },
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["WL_demolishTime", serverTime, true];
        _target setVariable ["WL_demolisher", _caller, true];
    },
    {},
    [],
    5,
    100,
    false,
    false
] call BIS_fnc_holdActionAdd;

[
    _asset,
    "<t color='#00ff00'>Stop Demolition</t>",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",
    "speed player < 1 && _target getVariable ['WL_demolishTime', -1] > 0",
    "speed player < 1 && _target getVariable ['WL_demolishTime', -1] > 0",
    {},
    {},
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["WL_demolishTime", -1, true];
        _target setVariable ["WL_demolisher", objNull, true];
    },
    {},
    [],
    10,
    100,
    false,
    false
] call BIS_fnc_holdActionAdd;

private _lightToggle = false;
private _lightPos = getPosASL _asset;
_lightPos set [2, _lightPos # 2 + 3];
private _lightPoint = "#lightpoint" createVehicle _lightPos;
_lightPoint setLightAttenuation [1, 0, 0, 0, 0, 50];
_lightPoint setLightDayLight true;
_lightPoint setLightFlareMaxDistance 500;
_lightPoint setLightColor[1, 0, 0];
_lightPoint setLightAmbient[1, 0, 0];
_lightPoint setLightIntensity 0;

while { alive _asset } do {
    private _sleepTime = 0.5;
    private _demolishTime = _asset getVariable ["WL_demolishTime", -1];
    private _demolishing = _demolishTime > 0;

    if (_demolishing) then {
        if (_lightToggle) then {
            _lightPoint setLightIntensity 250000;
        } else {
            _lightPoint setLightIntensity 0;
        };
        _lightToggle = !_lightToggle;

        // play sound locally
        playSound3D ["\a3\sounds_f\arsenal\tools\minedetector_beep_01.wss", _asset, false, getPosASL _asset, 2, 1, 200, 0, true];

        private _timeRemaining = (_demolishTime + WL_DEMOLISH_TIME) - serverTime;
        if (_timeRemaining <= 0) then {
            private _demolisher = _asset getVariable ["WL_demolisher", objNull];
            if (local _demolisher) then {
                [_asset, _demolisher] remoteExec ["WL2_fnc_killRewardHandle", 2];
                createVehicle ["SmallSecondary", getPosATL _asset, [], 0, "FLY"];
                // don't call FF script, this prevents runway griefing
                _asset setDamage [1, true, _demolisher];
            };
            deleteVehicle _lightPoint;
            sleep 3;
            deleteVehicle _asset;
            playSound3D ["a3\sounds_f\sfx\special_sfx\building_destroy_01.wss", objNull, false, _lightPos, 2, 1, 200, 0, true];
        } else {
            _sleepTime = (_timeRemaining / WL_DEMOLISH_TIME) max 0.1;
        };
    } else {
        _lightPoint setLightIntensity 0;
    };

    sleep _sleepTime;
};