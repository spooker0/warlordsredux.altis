private _list = serverNamespace getVariable ["garbageCollector", createHashMap];
private _staticsList = serverNamespace getVariable ["WL2_staticsGarbageCollector", createHashMap];
while {!BIS_WL_missionEnd} do {
	{
		if (typeOf _x == "Steerable_Parachute_F") then {
			private _occupied = count (crew _x select {alive _x}) > 0;
			if (!_occupied) then {
				deleteVehicle _x;
			};
		} else {
			deleteVehicle _x;
		};
	} forEach ((allMissionObjects "") select {(_list getOrDefault [typeOf _x, false]) || {_staticsList getOrDefault [typeOf _x, false] && !(alive _x)}});
	sleep 300;
};