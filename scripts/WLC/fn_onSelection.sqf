#include "constants.inc"

params ["_control", "_lbCurSel", "_type"];

private _display = findDisplay WLC_DISPLAY;
if (isNull _display) exitWith {};

private _fullDisplayBg = _display displayCtrl WLC_FULL_DISPLAY_BG;
private _weaponDisplayBg = _display displayCtrl WLC_WEAPON_DISPLAY_BG;
private _weaponDisplayTooltip = _display displayCtrl WLC_WEAPON_DISPLAY_TOOLTIP_HELPER;

private _weaponDisplay = _display displayCtrl WLC_WEAPON_DISPLAY;
private _fullDisplay = _display displayCtrl WLC_FULL_DISPLAY;
private _attachmentDisplay = _display displayCtrl WLC_ATTACHMENT_DISPLAY;
private _magDisplay = _display displayCtrl WLC_MAGAZINE_DISPLAY;
private _itemCostDisplay = _display displayCtrl WLC_COST_DISPLAY;
private _massDisplay = _display displayCtrl WLC_MASS_DISPLAY;

{
    ctrlDelete _x;
} forEach (allControls _attachmentDisplay);
{
    ctrlDelete _x;
} forEach (allControls _magDisplay);

_fullDisplayBg ctrlShow false;
_fullDisplay ctrlShow false;
_massDisplay ctrlShow false;
_weaponDisplayBg ctrlShow false;
_weaponDisplay ctrlShow false;
_weaponDisplayTooltip ctrlShow false;
_attachmentDisplay ctrlShow false;
_magDisplay ctrlShow false;

if (_lbCurSel <= 0) exitWith {
    profileNamespace setVariable [format ["WLC_%1", _type], ""];
};

private _moneySign = [BIS_WL_playerSide] call WL2_fnc_getMoneySign;

private _getItemTooltip = {
    params ["_item"];
    private _itemName = [_item] call WLM_fnc_getMagazineTooltip;

    private _protections = "true" configClasses (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "HitpointsProtectionInfo");
    private _protectionArr = _protections apply {
        private _protectionName = configName _x;
        private _protectionArmor = getNumber (_x >> "armor");
        private _protectionPassThrough = getNumber (_x >> "passThrough");
        format ["[%1]\nArmor: %2\nPassthrough: %3", _protectionName, _protectionArmor, _protectionPassThrough];
    };
    private _protectionText = _protectionArr joinString "\n\n";

    if (_protectionText == "") then {
        _itemName;
    } else {
        format ["%1\n\n%2", _itemName, _protectionText];
    };
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

    private _customizationList = missionNamespace getVariable [format ["WLC_%1_%2", _type, BIS_WL_playerSide], createHashMap];
    private _customization = _customizationList getOrDefault [_customizationData, createHashMap];
    private _actualClass = _customization getOrDefault ["item", _customizationData];

    if (_type in ["Primary", "Secondary", "Launcher"]) then {
        _weaponDisplayBg ctrlShow true;

        _weaponDisplay ctrlShow true;
        _weaponDisplay ctrlSetText (getText (configFile >> "CfgWeapons" >> _actualClass >> "picture"));

        _weaponDisplayTooltip ctrlShow true;
        _weaponDisplayTooltip ctrlSetTooltip ([_actualClass] call WLM_fnc_getMagazineTooltip);

        private _attachments = _customization getOrDefault ["attachments", []];
        {
            private _itemPosition = [_forEachIndex * (0.1 + 0.01), 0, 0.1, 0.1 * 4 / 3];

            private _attachmentPicBg = _display ctrlCreate ["WLCAttachmentPicBg", -1, _attachmentDisplay];
            _attachmentPicBg ctrlSetPosition _itemPosition;
            _attachmentPicBg ctrlSetText "";
            _attachmentPicBg ctrlCommit 0;

            private _attachmentPic = _display ctrlCreate ["WLCAttachmentPic", -1, _attachmentDisplay];
            _attachmentPic ctrlSetPosition _itemPosition;
            _attachmentPic ctrlSetText (getText (configFile >> "CfgWeapons" >> _x >> "picture"));
            _attachmentPic ctrlSetTooltip ([_x] call WLM_fnc_getMagazineTooltip);
            _attachmentPic ctrlCommit 0;
        } forEach _attachments;
        _attachmentDisplay ctrlShow true;

        private _magazines = _customization getOrDefault ["magazines", []];
        {
            private _row = floor (_forEachIndex / 5);
            private _col = _forEachIndex % 5;
            private _itemPosition = [_col * (0.07 + 0.01), _row * (0.07 + 0.03), 0.07, 0.07 * 4 / 3];

            private _magPicBg = _display ctrlCreate ["WLCAttachmentPicBg", -1, _magDisplay];
            _magPicBg ctrlSetPosition _itemPosition;
            _magPicBg ctrlSetText "";
            _magPicBg ctrlCommit 0;

            private _magPic = _display ctrlCreate ["WLCAttachmentPic", -1, _magDisplay];
            _magPic ctrlSetPosition _itemPosition;
            _magPic ctrlSetText (getText (configFile >> "CfgMagazines" >> _x >> "picture"));
            _magPic ctrlSetTooltip ([_x] call WLM_fnc_getMagazineTooltip);
            _magPic ctrlCommit 0;
        } forEach _magazines;
        _magDisplay ctrlShow true;
    };

    if (_type in ["Uniform", "Vest", "Helmet"]) then {
        _fullDisplayBg ctrlShow true;
        _fullDisplay ctrlShow true;

        _fullDisplay ctrlSetText (getText (configFile >> "CfgWeapons" >> _actualClass >> "picture"));
        _fullDisplay ctrlSetTooltip ([_actualClass] call _getItemTooltip);

        _massDisplay ctrlShow true;
        private _mass = getNumber (configFile >> "CfgWeapons" >> _actualClass >> "ItemInfo" >> "mass");
        _massDisplay ctrlSetStructuredText parseText format ["<t size='1.2'>Mass: %1 kg</t>", _mass];
    };

    private _level = _customization getOrDefault ["level", 0];
    private _levelText = format ["Unlock: Level %1", _level];
    private _cost = _customization getOrDefault ["cost", 0];
    private _costText = if (_cost > 0) then {
        format ["Cost: %1%2", _moneySign, _cost];
    } else {
        "";
    };
    _itemCostDisplay ctrlSetStructuredText parseText format ["<t size='1.2'>%1<br/>%2</t>", _levelText, _costText];
};

// Refresh cost
private _sumCost = 0;
{
    private _select = _display displayCtrl (_x # 0);
    private _thisType = _x # 1;
    private _customizationList = missionNamespace getVariable [format ["WLC_%1_%2", _thisType, BIS_WL_playerSide], createHashMap];

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

private _funds = (missionNamespace getVariable "fundsDatabaseClients") getOrDefault [getPlayerUID player, 0];
private _affordColor = if (_funds >= _sumCost) then {
    "#FFFFFF";
} else {
    "#FF0000";
};
private _costDisplay = _display displayCtrl WLC_COST_TEXT;
_costDisplay ctrlSetStructuredText parseText format ["<t align='right'>Total Cost: <t color='%1'>%2%3</t></t>", _affordColor, _moneySign, _sumCost];