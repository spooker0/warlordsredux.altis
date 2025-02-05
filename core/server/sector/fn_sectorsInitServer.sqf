//Use this line to simulate base locations on EU#11, while on test servers. FOR TESTING ONLY.
//private _potBases = BIS_WL_allSectors select {(if (["(EU) #11", serverName] call BIS_fnc_inString) then {"A" in (_x getVariable ["BIS_WL_services", []])} else {(_x getVariable ["BIS_WL_canBeBase", true])}) && {!(_x in (profileNamespace getVariable ["BIS_WL_lastBases", []]))}};
//Use this line to have "only" helipad zones not just airports. FOR TESTING ONLY.
//private _potBases = BIS_WL_allSectors select {(if !(["(EU) #11", serverName] call BIS_fnc_inString) then {"H" in (_x getVariable ["BIS_WL_services", []]) && !("A" in (_x getVariable ["BIS_WL_services", []]))} else {(_x getVariable ["BIS_WL_canBeBase", true])}) && {!(_x in (profileNamespace getVariable ["BIS_WL_lastBases", []]))}};

//Use this line to set starting base based on sector service or default EU#11 ***This is the code for MAIN branch!!!***
private _potBases = BIS_WL_allSectors select {(if !(["(EU) #11", serverName] call BIS_fnc_inString) then {"A" in (_x getVariable ["BIS_WL_services", []])} else {(_x getVariable ["BIS_WL_canBeBase", true])}) && {!(_x in (profileNamespace getVariable ["BIS_WL_lastBases", []]))}};

private _firstBase = selectRandom _potBases;

//_baseDistanceMin is hard coded for altis
//For cross map dynamic scaling see pull request #204, worldsize for scaling
//random but weighted towards _baseDistanceMid, the orginial hard coded value
private _baseDistanceLow = (64000000 * 1); //8000 m^2
private _baseDistanceHigh = (64000000 * 1.4); //max = 11200 m^2
private _baseDistanceMid = 64000000;
private _baseDistanceMin = random [_baseDistanceLow, _baseDistanceMid, _baseDistanceHigh];

_potBases deleteAt (_potBases find _firstBase);
_potBases = (_potBases select {(_x distanceSqr _firstBase) > _baseDistanceMin});
private _secondBase = selectRandom _potBases;

private _presetBase = BIS_WL_allSectors select {
	_x getVariable ["BIS_WL_name", ""] in ["AAC Airfield", "Airbase"];
};

_firstBase = _presetBase # 1;
_secondBase = _presetBase # 0;

missionNamespace setVariable ["BIS_WL_base1", _firstBase, true];
missionNamespace setVariable ["BIS_WL_base2", _secondBase, true];
profileNamespace setVariable ["BIS_WL_lastBases", [_firstBase, _secondBase]];
waitUntil {!isNil "BIS_WL_base1" && {!isNil "BIS_WL_base2"}};

{
	_side = [west, east] # _forEachIndex;
	_base = _x;
	_base setVariable ["BIS_WL_owner", _side, true];
	_base setVariable ["BIS_WL_originalOwner", _side, true];
	_base setVariable ["BIS_WL_previousOwners", [_side], true];
	_base setVariable ["BIS_WL_revealedBy", [_side], true];
	_pos = (position _x) findEmptyPosition [0, 20, "FlagPole_F"];
	_posFinal = if (count _pos == 0) then {
		position _x
	} else {
		_pos
	};
	private _flag = createVehicle ["FlagPole_F", _posFinal, [], 0,"CAN_COLLIDE"];
	if (_side == west) then {
		_flag setFlagTexture "\A3\Data_F\Flags\flag_NATO_CO.paa";
	} else {
		_flag setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
	};
	_flag setFlagSide _side;
	[_flag] remoteExec ["WLC_fnc_action", 0, true];
} forEach [_firstBase, _secondBase];

{
	_sector = _x;
	_sectorPos = position _sector;
	if ((_sector getVariable ["BIS_WL_owner", sideUnknown]) == sideUnknown) then {
		_sector setVariable ["BIS_WL_owner", resistance, true];
		_sector setVariable ["BIS_WL_previousOwners", [], true];
		[_sector] remoteExec ['WL2_fnc_sectorRevealHandle', [0, -2] select isDedicated];
	};

	_zoneRestrictionTrg1 = createTrigger ["EmptyDetector", _sectorPos, false];
	_zoneRestrictionTrg2 = createTrigger ["EmptyDetector", _sectorPos, false];
	_sector setVariable ["BIS_WL_zoneRestrictionTrgs", [_zoneRestrictionTrg1, _zoneRestrictionTrg2]];
	{
		_handledSide = BIS_WL_competingSides # _forEachIndex;
		if (_handledSide in (_sector getVariable "BIS_WL_previousOwners")) then {
			deleteVehicle _x;
		} else {
			_x enableSimulation false;
			_x setVariable ["BIS_WL_handledSide", _handledSide];
		};
	} forEach [_zoneRestrictionTrg1, _zoneRestrictionTrg2];

	_area = _sector getVariable "objectArea";
	_area set [4, 38];
	_area params ["_a", "_b", "_angle", "_isRectangle"];
	_size = _a * _b * (if (_isRectangle) then {4} else {pi});

	if (_sector in [_firstBase, _secondBase]) then {
		_sector setVariable ["BIS_WL_value", (getMissionConfigValue ["BIS_WL_baseValue", 50])];
	} else {
		_sector setVariable ["BIS_WL_value", round (_size / 13000)];
	};

	_detectionTrg1 = createTrigger ["EmptyDetector", _sectorPos, false];
	_detectionTrg2 = createTrigger ["EmptyDetector", _sectorPos, false];
	_sector setVariable ["BIS_WL_detectionTrgs", [_detectionTrg1, _detectionTrg2]];
	{
		_handledSide = BIS_WL_competingSides # _forEachIndex;
		_x setVariable ["BIS_WL_handledSide", _handledSide];
		_x setVariable ["BIS_WL_sector", _sector];
		_x setTriggerArea _area;
		_x setTriggerActivation [["WEST", "EAST", "GUER"] # (BIS_WL_sidesArray find _handledSide), "PRESENT", false];
		_x setTriggerStatements [format ["this && ((thisTrigger getVariable 'BIS_WL_sector') in ((BIS_WL_sectorsArrays # %1) # 3))", _forEachIndex], format ["[(thisTrigger getVariable 'BIS_WL_sector')] remoteExec ['WL2_fnc_sectorRevealHandle', [0, -2] select isDedicated]; (thisTrigger getVariable 'BIS_WL_sector') setVariable ['BIS_WL_revealedBy', ((thisTrigger getVariable 'BIS_WL_sector') getVariable ['BIS_WL_revealedBy', []]) + [%1], true]", _handledSide], ""];
	} forEach [_detectionTrg1, _detectionTrg2];

	private _sectorVehicles = vehicles inAreaArray (_sector getVariable "objectAreaComplete");
	private _sectorVehiclesArray = [];
	{
		private _vehicle = _x;
		if (_vehicle getVariable ["WL_excludeSectorSpawn", false]) then {
			continue;
		};
		if !(_vehicle isKindOf "AllVehicles") then {
			continue;
		};
		private _group = group effectiveCommander _vehicle;
		private _array = [typeOf _vehicle, position _vehicle, direction _vehicle, locked _vehicle];
		private _waypoints = +(waypoints _group);
		reverse _waypoints;
		_waypoints resize ((count _waypoints) - .5);
		reverse _waypoints;
		_waypoints = _waypoints apply {[waypointPosition _x, waypointType _x, waypointSpeed _x, waypointBehaviour _x, waypointTimeout _x]};
		_array pushBack _waypoints;
		_sectorVehiclesArray pushBack _array;
		{_vehicle deleteVehicleCrew _x} forEach crew _vehicle;
		if (count units _group == 0) then {deleteGroup _group};
		deleteVehicle _vehicle;
	} forEach _sectorVehicles;

	if (count _sectorVehiclesArray > 0) then {
		_sector setVariable ["BIS_WL_vehiclesToSpawn", _sectorVehiclesArray];
	};

	_agentGrp = createGroup CIVILIAN;
	_agent = _agentGrp createUnit ["Logic", _sectorPos, [], 0, "CAN_COLLIDE"];
	_agent enableSimulationGlobal false;
	_sector setVariable ["BIS_WL_agentGrp", _agentGrp, true];
} forEach BIS_WL_allSectors;