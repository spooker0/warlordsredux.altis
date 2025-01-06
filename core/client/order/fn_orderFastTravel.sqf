#include "..\..\warlords_constants.inc"

params ["_toContested"];

"Destination" call WL2_fnc_announcer;
[toUpper localize "STR_A3_WL_popup_destination"] spawn WL2_fnc_smoothText;

"RequestMenu_close" call WL2_fnc_setupUI;
if !(visibleMap) then {
	processDiaryLink createDiaryLink ["Map", player, ""];
	if (_toContested) then {
		WL_CONTROL_MAP ctrlMapAnimAdd [0, BIS_WL_mapSizeIndex / 75, WL_TARGET_FRIENDLY];
	} else {
		WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.3, player];
	};
	ctrlMapAnimCommit WL_CONTROL_MAP;
};
BIS_WL_targetSector = objNull;
private _selectionBefore = BIS_WL_currentSelection;
BIS_WL_currentSelection = if (_toContested) then {WL_ID_SELECTION_FAST_TRAVEL_CONTESTED} else {WL_ID_SELECTION_FAST_TRAVEL};
WL_MapBusy pushBack "orderFastTravel";
private _action = if (_toContested) then {"travelling_contested"} else {"travelling"};
private _marker = "";
private _markerText = "";

if (_toContested) then {
	private _startArr = (synchronizedObjects WL_TARGET_FRIENDLY) select {(_x getVariable "BIS_WL_owner") == BIS_WL_playerSide};
	_startArr = _startArr apply {[_x distance2D player, _x]};
	_startArr sort true;
	private _start = (_startArr # 0) # 1;
	private _area = WL_TARGET_FRIENDLY getVariable "objectArea";
	private _size = (if (_area # 3) then {
		sqrt (((_area # 0) ^ 2) + ((_area # 1) ^ 2));
	} else {
		(_area # 0) max (_area # 1);
	});
	_marker = createMarkerLocal ["localMarker", [WL_TARGET_FRIENDLY, _size + WL_FAST_TRAVEL_OFFSET, WL_TARGET_FRIENDLY getDir _start] call BIS_fnc_relPos];
	_marker setMarkerShapeLocal "RECTANGLE";
	_marker setMarkerColorLocal BIS_WL_colorMarkerFriendly;
	_marker setMarkerDirLocal (WL_TARGET_FRIENDLY getDir _start);
	_marker setMarkerSizeLocal [_size, WL_FAST_TRAVEL_RANGE_AXIS];
	_markerText = createMarkerLocal ["localMarkerText", markerPos _marker];
	_markerText setMarkerColorLocal BIS_WL_colorMarkerFriendly;
	_markerText setMarkerSizeLocal [0, 0];
	_markerText setMarkerTypeLocal "mil_dot";
	_markerText setMarkerTextLocal localize "STR_A3_cfgvehicles_moduletasksetdestination_f_arguments_destination_0";
};

sleep WL_TIMEOUT_SHORT;

waitUntil {
	sleep WL_TIMEOUT_MIN;
	!isNull BIS_WL_targetSector || !visibleMap || !alive player || lifeState player == "INCAPACITATED"
};

if (isNull BIS_WL_targetSector) exitWith {
	if (BIS_WL_currentSelection in [WL_ID_SELECTION_FAST_TRAVEL, WL_ID_SELECTION_FAST_TRAVEL_CONTESTED]) then {
		BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
	};
	"Canceled" call WL2_fnc_announcer;
	[toUpper localize "STR_A3_WL_menu_fasttravel_canceled"] spawn WL2_fnc_smoothText;
	deleteMarkerLocal _marker;
	deleteMarkerLocal _markerText;

	sleep 1;
	WL_MapBusy = WL_MapBusy - ["orderFastTravel"];
};

[_toContested, _marker] call WL2_fnc_executeFastTravel;

deleteMarkerLocal _marker;
deleteMarkerLocal _markerText;

if (BIS_WL_currentSelection in [WL_ID_SELECTION_FAST_TRAVEL, WL_ID_SELECTION_FAST_TRAVEL_CONTESTED]) then {
	BIS_WL_currentSelection = _selectionBefore;
};

sleep 1;
WL_MapBusy = WL_MapBusy - ["orderFastTravel"];