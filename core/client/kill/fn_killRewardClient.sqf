params ["_unit", "_reward", ["_customText", ""], ["_customColor", "#228b22"], ["_unitTypeName", ""]];

disableSerialization;

private _displayText = "";
private _displayName = "";

private _side = BIS_WL_playerSide;

if (_customText != "") then {
	_displayText = format ["%1", _customText];
} else {
	private _unitType = if (typeOf _unit == "") then {
		_unitTypeName
	} else {
		typeOf _unit
	};

	if (_unitType isKindOf "Man") then {
		_displayText = "Enemy killed";
	} else {
		_displayName = [_unit, _unitType] call WL2_fnc_getAssetTypeName;
		_displayText = "%1 destroyed";
	};
	_displayText = format [_displayText, _displayName];

	// handle WLT
	if (_unitType isKindOf "Man") then {
		WLT_stats set ["Engage", (WLT_stats getOrDefault ["Engage", 0]) + 1];
	};
	if (_unitType isKindOf "Air") then {
		WLT_stats set ["CombinedArmsAir", (WLT_stats getOrDefault ["CombinedArmsAir", 0]) + 1];
	};
	private _vehicleApsMap = missionNamespace getVariable ["WL2_aps", createHashMap];
	private _assetActualType = _unit getVariable ["WL2_orderedClass", _unitType];
	private _apsType = _vehicleApsMap getOrDefault [_assetActualType, -1];
	if (_apsType >= 1) then {
		WLT_stats set ["CombinedArmsArmor", (WLT_stats getOrDefault ["CombinedArmsArmor", 0]) + 1];
	};
};

// handle WLT
if (_customText == "Active protection system") then {	// this might be a problem if server lang is different
	WLT_stats set ["CombinedArmsAPS", (WLT_stats getOrDefault ["CombinedArmsAPS", 0]) + 1];
};

// map: displayText => [repetition, points, customColor, timestamp]
private _killRewardMap = uiNamespace getVariable ["WL_killRewardMap", createHashMap];
private _killRewardEntry = _killRewardMap getOrDefault [_displayText, [0, 0, "", 0]];
private _repetitions = _killRewardEntry # 0;
private _points = _killRewardEntry # 1;
_killRewardMap set [_displayText, [_repetitions + 1, _points + _reward, _customColor, serverTime]];

uiNamespace setVariable ["WL_killRewardMap", _killRewardMap];
[_killRewardMap] call WL2_fnc_updateKillFeed;

WAS_score = true;

if (profileNamespace getVariable ["MRTM_playKillSound", true]) then {
	playSoundUI ["AddItemOK", 1, 1];
};
