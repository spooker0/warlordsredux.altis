#include "..\..\warlords_constants.inc"

private _ftNextUseVar = format ["BIS_WL_FTSLNextUse_%1", getPlayerUID player];
private _ftNextUse = missionNamespace getVariable [_ftNextUseVar, 0];
if (serverTime < _ftNextUse) then {
    private _cooldownText = localize "STR_SQUADS_cooldown";
    private _timeoutDisplay = [_ftNextUse - serverTime, "MM:SS"] call BIS_fnc_secondsToString;
    [false, format [_cooldownText, _timeoutDisplay]];
} else {
    [true, ""];
};