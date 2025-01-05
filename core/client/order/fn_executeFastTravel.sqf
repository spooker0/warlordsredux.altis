params ["_toContested", "_marker"];

titleCut ["", "BLACK OUT", 1];
openMap [false, false];

"Fast_travel" call WL2_fnc_announcer;
[toUpper format [localize "STR_A3_WL_popup_travelling", BIS_WL_targetSector getVariable "BIS_WL_name"], nil, 3] spawn WL2_fnc_smoothText;

sleep 1;

private _destination = [];
if (_toContested) then {
	_destination = ([_marker, 0, true] call WL2_fnc_findSpawnPositions) select {
		private _pos = _x;
		BIS_WL_allSectors findIf {
			_pos inArea ((_x getVariable "BIS_WL_markers") # 2)
		} == -1
	};
	_destination = if (count _destination > 0) then {
		selectRandom _destination;
	} else {
		markerPos _marker;
	};

	player setDir (player getDir BIS_WL_targetSector);
	[player, "fastTravelContested", _destination] remoteExec ["WL2_fnc_handleClientRequest", 2];
} else {
	_destination = selectRandom ([BIS_WL_targetSector, 0, true] call WL2_fnc_findSpawnPositions);
};

private _tagAlong = (units player) select {
	(_x distance2D player <= 100) &&
	(isNull objectParent _x) &&
	(alive _x) &&
	(_x != player) &&
	_x getVariable ["BIS_WL_ownerAsset", "123"] == getPlayerUID player
};

{
	_x setVehiclePosition [_destination, [], 3, "NONE"];
} forEach _tagAlong;
player setVehiclePosition [_destination, [], 0, "NONE"];

sleep 1;

titleCut ["", "BLACK IN", 1];
