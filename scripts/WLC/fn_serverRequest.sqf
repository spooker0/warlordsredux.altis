#include "constants.inc"

params ["_data", "_side", "_sender"];

{
    private _type = _x;
    private _customizationData = _y;

    private _customizationMap = missionNamespace getVariable [format ["WLC_%1_%2", _type, _side], createHashMap];
    private _customization = _customizationMap getOrDefault [_customizationData, createHashMap];

    private _cost = _customization getOrDefault ["cost", 0];
    private _item = _customization getOrDefault ["item", ""];
    private _level = _customization getOrDefault ["level", 0];
    private _playerLevel = ["getLevel", player] call WLC_fnc_getLevelInfo;

    if (_level <= _playerLevel && _cost >= 0 && playerFunds >= _cost && _item != "") then {
        private _uid = getPlayerUID _sender;
        (-_cost) call WL2_fnc_fundsDatabaseWrite;
        [_type, _customization] remoteExec ["WLC_fnc_clientEquip", _sender];
    };
} forEach _data;