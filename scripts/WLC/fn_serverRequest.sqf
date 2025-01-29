#include "constants.inc"

params ["_data", "_side", "_sender", "_lastLoadout"];

private _totalCost = 0;
{
    private _type = _x;
    if !(_x in ["Uniform", "Vest", "Helmet", "Primary", "Secondary", "Launcher"]) then {
        continue;
    };

    private _customizationData = _y;

    private _customizationMap = missionNamespace getVariable [format ["WLC_%1_%2", _type, _side], createHashMap];
    private _customization = _customizationMap getOrDefault [_customizationData, createHashMap];

    private _cost = _customization getOrDefault ["cost", 0];
    private _item = _customization getOrDefault ["item", ""];
    private _level = _customization getOrDefault ["level", 0];
    private _playerLevel = ["getLevel", _sender] call WLC_fnc_getLevelInfo;

    private _custom = +_customization;
    if (_type in ["Primary", "Secondary", "Launcher"]) then {
        private _attachment = _data getOrDefault [_type + "Attachment", ""];
        private _variants = _custom getOrDefault ["variants", createHashMap];
        private _variant = _variants getOrDefault [_attachment, createHashMap];
        private _attachments = _custom getOrDefault ["attachments", []];
        _attachments append (_variant getOrDefault ["attachments", []]);
        _custom set ["attachments", _attachments];
        _cost = _cost + (_variant getOrDefault ["cost", 0]);

        private _ammo = _data getOrDefault [_type + "Ammo", ""];
        private _loadouts = _custom getOrDefault ["loadouts", createHashMap];
        private _loadout = _loadouts getOrDefault [_ammo, createHashMap];
        private _magazines = _custom getOrDefault ["magazines", []];
        _magazines append (_loadout getOrDefault ["magazines", []]);
        _custom set ["magazines", _magazines];
        _cost = _cost + (_loadout getOrDefault ["cost", 0]);
        _level = _level max (_loadout getOrDefault ["level", 0]);
    };

    if (_item in (_lastLoadout # 0)) then {
        _cost = 0;
    };

    if (_level <= _playerLevel && _cost >= 0 && playerFunds >= _cost && _item != "") then {
        private _uid = getPlayerUID _sender;
        (-_cost) call WL2_fnc_fundsDatabaseWrite;
        _totalCost = _totalCost + _cost;
        [_type, _custom, _cost] remoteExec ["WLC_fnc_clientEquip", _sender];
    };
} forEach _data;

private _message = if (_totalCost > 0) then {
    private _moneySign = [_side] call WL2_fnc_getMoneySign;
    format ["Equipment and customizations applied for %1%2.", _moneySign, _totalCost];
} else {
     "Equipment and customizations applied for free.";
};
[_message] remoteExec ["systemChat", _sender];