params ["_toContested", "_marker", ["_isCarrierSector", false]];

titleCut ["", "BLACK OUT", 1];
openMap [false, false];

"Fast_travel" call WL2_fnc_announcer;
[toUpper format [localize "STR_A3_WL_popup_travelling", BIS_WL_targetSector getVariable "BIS_WL_name"], nil, 3] spawn WL2_fnc_smoothText;

sleep 1;

private _destination = [];
if (_toContested) then {
	if (_isCarrierSector) then {
		private _randomPos = BIS_WL_targetSector call BIS_fnc_randomPosTrigger;
		_destination = [_randomPos # 0, _randomPos # 1, 100];
	} else {
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
	};

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


private _directionToSector = player getDir BIS_WL_targetSector;
if (_isCarrierSector && _toContested) then {
	{
		_x setPosASL _destination;
		private _parachuteAI = createVehicle ["Steerable_Parachute_F", ASLtoATL _destination, [], 0, "CAN_COLLIDE"];
		_x moveInDriver _parachuteAI;
		_parachuteAI setDir _directionToSector;
	} forEach _tagAlong;

	player setPosASL _destination;
	private _parachute = createVehicle ["Steerable_Parachute_F", ASLtoATL _destination, [], 0, "CAN_COLLIDE"];
	player moveInDriver _parachute;

	_parachute setDir _directionToSector;
} else {
	{
		_x setVehiclePosition [_destination, [], 3, "NONE"];
	} forEach _tagAlong;
	player setVehiclePosition [_destination, [], 0, "NONE"];

	player setDir _directionToSector;
};
sleep 1;

titleCut ["", "BLACK IN", 1];
