#include "constants.inc"

params ["_uid", "_score"];

if (!WLC_ENABLED) exitWith {};
if !(isServer) exitWith {};

private _player = ((call BIS_fnc_listPlayers) select {
    getPlayerUID _x == _uid
}) # 0;

private _previousLevel = ["getLevel", _player] call WLC_fnc_getLevelInfo;
WLC_Scores set [_uid, _score];
publicVariable "WLC_Scores";
private _newLevel = ["getLevel", _player] call WLC_fnc_getLevelInfo;

if (_newLevel > _previousLevel) then {
    [_newLevel] remoteExec ["WLC_fnc_levelUp", _player];
};