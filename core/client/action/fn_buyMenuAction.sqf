private _buyMenuActionText = format ["<t color='#00FF00'>Buy Menu (Hold %1)</t>", actionKeysNames "gear"];
private _buyMenuActionId = player addAction [_buyMenuActionText, {
    params ["_asset", "_caller", "_actionId"];
    "RequestMenu_open" call WL2_fnc_setupUI;
    player removeAction _actionId;
}, [], -98, false, false, "", ""];
player setUserActionText [_buyMenuActionId, _buyMenuActionText, "<img size='3' image='\a3\ui_f\data\igui\cfg\simpletasks\types\Radio_ca.paa'/>"];
