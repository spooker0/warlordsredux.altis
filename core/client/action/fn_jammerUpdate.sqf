params ["_asset", "_actionID"];

private _isActive = _asset getVariable ["BIS_WL_jammerActivated", false] && isEngineOn _asset;
private _isActivating = _asset getVariable ["BIS_WL_jammerActivating", false] && isEngineOn _asset;
private _actionColor = if (_isActive) then {
    "#4b51ff";
} else {
    "#ff4b4b";
};

private _actionText = if (_isActive) then {
    "EW NETWORK: ON";
} else {
    if (_isActivating) then {
        "EW NETWORK: ACTIVATING...";
    } else {
        "EW NETWORK: OFF";
    };
};

private _outerMarkerName = format ["BIS_WL_jammerMarkerOuter_%1", netId _asset];
if (_isActive) then {
    _asset setFuelConsumptionCoef 5;
    _outerMarkerName setMarkerAlphaLocal 1;
} else {
    if (_isActivating) then {
        _asset setFuelConsumptionCoef 5;
        _outerMarkerName setMarkerAlphaLocal 1;
    } else {
        _asset setFuelConsumptionCoef 1;
        _outerMarkerName setMarkerAlphaLocal 0;
    };
};

_asset setUserActionText [_actionID, format ["<t color = '%1'>%2</t>", _actionColor, _actionText]];