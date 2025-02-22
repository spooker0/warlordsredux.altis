#include "..\warlords_constants.inc"

params ["_killer", "_event", ["_show", true]];

if (_event == "init") then {
	{
		_varName = format ["BIS_WL_showHint_%1", _x];

		if (isNil _varName) then {
			missionNamespace setVariable [_varName, false]
		};
	} forEach ["assembly", "placeCharge", "maintenance", "targetResetVoting", "forfeitVoting"];

	_hintText = "";
	_lastHint = "";
	while {!BIS_WL_missionEnd} do {
		_hintText = "";

		if (BIS_WL_showHint_assembly) then {
			private _assembleText = format ["<t align = 'left'>[ %1 ]</t><t align = 'right' color = '#4bff58'>%2</t>", localize "STR_dik_space", localize "STR_A3_assemble"];
			private _lockPositionText = format ["<t align = 'left'>[ %1 ]</t><t align = 'right' color = '#4bff58'>%2</t>", (actionKeysNames "lockTarget") regexReplace ["""", ""], "Lock Position"];
			private _rotateCounterClockwiseText = format ["<t align = 'left'>[ %1 ]</t><t align = 'right' color = '#4bff58'>%2</t>", (actionKeysNames "prevAction") regexReplace ["""", ""], "Rotate Left"];
			private _rotateClockwiseText = format ["<t align = 'left'>[ %1 ]</t><t align = 'right' color = '#4bff58'>%2</t>", (actionKeysNames "nextAction") regexReplace ["""", ""], "Rotate Right"];
			private _cancelText = format ["<t align = 'left'>[ %1 ]</t><t align = 'right' color = '#ff4b4b'>%2</t>", localize "STR_dik_back", localize "STR_ca_cancel"];
			_hintText = _hintText + format ["<t size = '1.2' shadow = '0'>%1<br/>%2<br/>%3<br/>%4<br/>%5<br/></t>", _assembleText, _lockPositionText, _rotateCounterClockwiseText, _rotateClockwiseText, _cancelText];
		};

		if (BIS_WL_showHint_placeCharge) then {
			private _placeChargeText = format ["<t align = 'left'>[ %1 ]</t><t align = 'right' color = '#4bff58'>%2</t>", localize "STR_dik_space", "Place Charge"];
			private _cancelText = format ["<t align = 'left'>[ %1 ]</t><t align = 'right' color = '#ff4b4b'>%2</t>", localize "STR_dik_back", localize "STR_ca_cancel"];
			_hintText = _hintText + format ["<t size = '1.2' shadow = '0'>%1<br/>%2</t>", _placeChargeText, _cancelText];
		};

		if (BIS_WL_showHint_targetResetVoting) then {
			_varNameVoting = format ["BIS_WL_targetResetVotingSince_%1", BIS_WL_playerSide];
			_warlords = allPlayers select {side group _x == BIS_WL_playerSide};
			_hintText = _hintText + format [
				"%8<t shadow = '0'><t align = 'center' size = '1.3'>%1</t><br/><t size = '1.2'><t align = 'left'>[ %2 + %3 ]</t><t align = 'right' color = '#4bff58'>%4</t><br/><t align = 'left'>[ %2 + %5 ]</t><t align = 'right' color = '#ff4b4b'>%6</t></t><t size = '1'><br/><br/><t align = 'center'>- %7 -</t></t></t>",
				toUpper localize "STR_A3_WL_target_reset_info",
				localize "str_dik_lcontrol",
				localize "str_dik_y",
				toUpper localize "str_lib_info_yes",
				localize "str_dik_n",
				toUpper localize "str_lib_info_no",
				0 max ceil (((missionNamespace getVariable [_varNameVoting, -1]) + WL_TARGET_RESET_VOTING_TIME) - serverTime),
				if (_hintText == "") then {""} else {"<br/><br/>"}
			];
		};

		if (BIS_WL_showHint_forfeitVoting) then {
			_varNameVoting = format ["BIS_WL_forfeitVotingSince_%1", BIS_WL_playerSide];
			_warlords = allPlayers select {side group _x == BIS_WL_playerSide};
			_hintText = _hintText + format [
				"%8<t shadow = '0'><t align = 'center' size = '1.3'>%1</t><br/><t size = '1.2'><t align = 'left'>[ %2 + %3 ]</t><t align = 'right' color = '#4bff58'>%4</t><br/><t align = 'left'>[ %2 + %5 ]</t><t align = 'right' color = '#ff4b4b'>%6</t></t><t size = '1'><br/><br/><t align = 'center'>- %7 -</t></t></t>",
				toUpper "Surrender vote activated",
				localize "str_dik_lcontrol",
				localize "str_dik_y",
				toUpper localize "str_lib_info_yes",
				localize "str_dik_n",
				toUpper localize "str_lib_info_no",
				0 max ceil (((missionNamespace getVariable [_varNameVoting, -1]) + 60) - serverTime),
				if (_hintText == "") then {""} else {"<br/><br/>"}
			];
		};

		if((_hintText != "" ) or ( _lastHint != "")) then {
			hintSilent parseText _hintText;
			_lastHint = _hintText;
		};
		sleep WL_TIMEOUT_MEDIUM;
	};
} else {
	_varName = format ["BIS_WL_showHint_%1", _event];

	if (_show isEqualType true) then {
		missionNamespace setVariable [_varName, _show];
	} else {
		[_varName, _show] spawn {
			params ["_varName", "_show"];
			while {!BIS_WL_missionEnd} do {
				missionNamespace setVariable [_varName, call _show];
				if (_varName == "BIS_WL_showHint_maintenance") then {
					false spawn WL2_fnc_refreshOSD;
				};
				sleep WL_TIMEOUT_STANDARD;
			};
		};
	};
};