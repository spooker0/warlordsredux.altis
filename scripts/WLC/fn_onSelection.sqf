#include "constants.inc"

params ["_control", "_lbCurSel", "_type"];

private _display = findDisplay WLC_DISPLAY;

if (isNull _display) exitWith {};
if (_lbCurSel <= 0) exitWith {
    profileNamespace setVariable [format ["WLC_%1", _type], ""];
};

private _selectedValue = _control lbValue _lbCurSel;
private _score = WLC_Scores getOrDefault [getPlayerUID player, 0];
private _level = floor (_score / 1000);
if (_selectedValue > _level) then {
    private _customizationData = profileNamespace getVariable [format ["WLC_%1", _type], ""];
    if (_customizationData != "") then {
        for "_index" from 0 to lbSize _control - 1 do {
            if (_control lbData _index == _customizationData) then {
                _control lbSetCurSel _index;
                break;
            };
        };
    } else {
        _control lbSetCurSel 0;
    };
} else {
    private _customizationData = _control lbData _lbCurSel;
    profileNamespace setVariable [format ["WLC_%1", _type], _customizationData];
};

// Refresh cost
private _side = BIS_WL_playerSide;
private _sumCost = 0;
{
    private _select = _display displayCtrl (_x # 0);
    private _type = _x # 1;
    private _customizationList = missionNamespace getVariable [format ["WLC_%1_%2", _type, _side], createHashMap];

    private _lbCurSelForType = lbCurSel _select;
    private _customizationData = _select lbData _lbCurSelForType;
    private _customization = _customizationList getOrDefault [_customizationData, createHashMap];
    private _cost = _customization getOrDefault ["cost", 0];

    _sumCost = _sumCost + _cost;
} forEach [
    [WLC_PRIMARY_SELECT, "Primary"],
    [WLC_SECONDARY_SELECT, "Secondary"],
    [WLC_LAUNCHER_SELECT, "Launcher"],
    [WLC_UNIFORM_SELECT, "Uniform"],
    [WLC_VEST_SELECT, "Vest"],
    [WLC_HELMET_SELECT, "Helmet"]
];

private _moneySign = [_side] call WL2_fnc_getMoneySign;
private _funds = (missionNamespace getVariable "fundsDatabaseClients") getOrDefault [getPlayerUID player, 0];
private _affordColor = if (_funds >= _sumCost) then {
    "#FFFFFF";
} else {
    "#FF0000";
};
private _costDisplay = _display displayCtrl WLC_COST_TEXT;
_costDisplay ctrlSetStructuredText parseText format ["<t align='right'>Total Cost: <t color='%1'>%2%3</t></t>", _affordColor, _moneySign, _sumCost];