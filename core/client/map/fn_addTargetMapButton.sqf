params ["_textLabel", "_action", "_actionClose"];

private _dialog = WL2_TargetButtonSetup # 0;
private _menuButtons = WL2_TargetButtonSetup # 1;
private _offsetX = WL2_TargetButtonSetup # 2;
private _offsetY = WL2_TargetButtonSetup # 3;

private _button = _dialog ctrlCreate ["RscButtonMenu", -1];
_button ctrlSetPosition [_offsetX, _offsetY + (count _menuButtons * 0.05), 0.4, 0.05];
_button ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", _textLabel];
_button ctrlCommit 0;
_menuButtons pushBack _button;

_button setVariable ["WL2_targetButtonSetupAction", _action];
_button setVariable ["WL2_targetButtonSetupActionClose", _actionClose];
_button ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];
    private _target = WL_ActionTarget;
    private _targetButtonSetupActionClose = _control getVariable "WL2_targetButtonSetupActionClose";

    if !(isNull _target) then {
        private _targetButtonSetupAction = _control getVariable "WL2_targetButtonSetupAction";
        private _actionResult = [_target] call _targetButtonSetupAction;
        if (!_targetButtonSetupActionClose) then {
            _control ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", _actionResult];
        };
    };

    if (_targetButtonSetupActionClose) then {
        WL_ActionTarget = objNull;
        private _dialog = ctrlParent _control;
        _dialog closeDisplay 1;
    };
}];

WL2_TargetButtonSetup = [_dialog, _menuButtons, _offsetX, _offsetY];