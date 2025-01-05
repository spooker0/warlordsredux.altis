params ["_asset"];

private _dazzlerActivated = _asset getVariable ["BIS_WL_dazzlerActivated", false];
private _dazzlerColor = if (_dazzlerActivated) then {
    "#4bff58"
} else {
    "#ff4b4b"
};
private _dazzlerText = if (_dazzlerActivated) then {
    "ON"
} else {
    "OFF"
};
private _buttonText = format ["DAZZLER: <t color='%1'>%2</t>", _dazzlerColor, _dazzlerText];
_buttonText;