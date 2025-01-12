params ["_fastTravelMode", "_marker"];

titleCut ["", "BLACK OUT", 1];
openMap [false, false];

"Fast_travel" call WL2_fnc_announcer;
[toUpper format [localize "STR_A3_WL_popup_travelling", BIS_WL_targetSector getVariable "BIS_WL_name"], nil, 3] spawn WL2_fnc_smoothText;

sleep 1;

private _destination = [];
private _sectorPos = (BIS_WL_targetSector getVariable "objectAreaComplete") # 0;

switch (_fastTravelMode) do {
	case 0: {
		_destination = selectRandom ([BIS_WL_targetSector, 0, true] call WL2_fnc_findSpawnPositions);
	};
	case 1: {
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

		[player, "fastTravelContested", getMissionConfigValue ["BIS_WL_fastTravelCostContested", 200]] remoteExec ["WL2_fnc_handleClientRequest", 2];
	};
	case 2: {
		private _randomPos = _marker call BIS_fnc_randomPosTrigger;
		private _distance = _randomPos distance2D BIS_WL_targetSector;
		private _height = _sectorPos # 2;
		_height = _height max 100;
		_destination = [_randomPos # 0, _randomPos # 1, _height + _distance * 0.5];

		[player, "fastTravelContested", getMissionConfigValue ["WL_airAssaultCost", 100]] remoteExec ["WL2_fnc_handleClientRequest", 2];
	};
};

private _tagAlong = (units player) select {
	(_x distance2D player <= 100) &&
	(isNull objectParent _x) &&
	(alive _x) &&
	(_x != player) &&
	_x getVariable ["BIS_WL_ownerAsset", "123"] == getPlayerUID player
};

private _directionToSector = _destination getDir _sectorPos;
if (_fastTravelMode == 2) then {
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
