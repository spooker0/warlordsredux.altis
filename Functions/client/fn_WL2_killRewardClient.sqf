params ["_unit", "_reward", ["_customText", ""], ["_customColor", "#228b22"], ["_unitTypeName", ""]];

disableSerialization;

private _scale = 0.65 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale;

private _displayText = "";
private _displayName = "";

private _side = BIS_WL_playerSide;

if (_customText != "") then {
	_displayText = format ["%1 %2%3", _customText, [_side] call BIS_fnc_WL2_getMoneySign, _reward];
} else {
	if (_unit isKindOf "Man") then {
		_displayText = "Enemy killed %2%3";
	} else {
		private _unitType = if (typeOf _unit == "") then {
			_unitTypeName
		} else {
			typeOf _unit
		};

		private _nameOverrides = missionNamespace getVariable ["WL2_nameOverrides", []];
		private _assetActualType = _unit getVariable ["WL2_orderedClass", _unitType];

		_displayName = _nameOverrides getOrDefault [_assetActualType, getText (configFile >> "CfgVehicles" >> _assetActualType >> "displayName")];


		_displayText = "%1 destroyed %2%3";
	};
	_displayText = format [_displayText, _displayName, [_side] call BIS_fnc_WL2_getMoneySign, _reward];
};

private _killRewardExisting = missionNamespace getVariable ["WL_killReward", []];
private _rewardText = format ["<t size='%1' align='right' color='%2'>%3</t>", _scale, _customColor, _displayText];
_killRewardExisting pushBack [_rewardText, serverTime];
missionNamespace setVariable ["WL_killReward", _killRewardExisting];

WAS_score = true;

if (profileNamespace getVariable ["MRTM_playKillSound", true]) then {
	playSoundUI ["AddItemOK", 1, 1];
};
