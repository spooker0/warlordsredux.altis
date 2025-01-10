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

// private _isCarrierSector = count (WL_TARGET_FRIENDLY getVariable ["WL_aircraftCarrier", []]) > 0;
if (_toContested) then {
	private _fastTravelConflict = call WL2_fnc_fastTravelConflictMarker;
	_marker = _fastTravelConflict # 0;
	_markerText = _fastTravelConflict # 1;
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

private _isCarrierSector = count (BIS_WL_targetSector getVariable ["WL_aircraftCarrier", []]) > 0;
[_toContested, _marker, _isCarrierSector] call WL2_fnc_executeFastTravel;

deleteMarkerLocal _marker;
deleteMarkerLocal _markerText;

if (BIS_WL_currentSelection in [WL_ID_SELECTION_FAST_TRAVEL, WL_ID_SELECTION_FAST_TRAVEL_CONTESTED]) then {
	BIS_WL_currentSelection = _selectionBefore;
};

sleep 1;
WL_MapBusy = WL_MapBusy - ["orderFastTravel"];