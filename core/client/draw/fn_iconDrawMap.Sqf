params ["_m"];

private _side = BIS_WL_playerSide;

// Draw white hover selector
if !(isNull BIS_WL_highlightedSector) then {
	_m drawIcon [
		"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
		[1,1,1,0.5],
		BIS_WL_highlightedSector,
		60,
		60,
		(time * 75) % 360
	];
};

// Draw vote selected marker
if !(isNull BIS_WL_targetVote) then {
	_m drawIcon [
		"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
		[0.8, 0.8, 0.8, 1],
		BIS_WL_targetVote,
		60,
		60,
		0
	];
};

// Draw naval selector
if (BIS_WL_currentSelection == 4) then {
	_cursorPos = _m ctrlMapScreenToWorld getMousePosition;
	_isWater = surfaceIsWater _cursorPos;
	_m drawIcon [
		"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
		if (_isWater) then {[1,1,1,0.5]} else {[1,1,1,0.1]},
		_cursorPos,
		60,
		60,
		if (_isWater) then {(time * 75) % 360} else {0}
	];
};

// Draw delete asset selector
if (!isNull WL_AssetActionTarget) then {
	_m drawIcon [
		"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
		call WL2_fnc_iconColor,
		WL_AssetActionTarget,
		40,
		40,
		(time * 75) % 360
	];
};

// Draw sector selector
if (!isNull WL_SectorActionTarget && isNull BIS_WL_highlightedSector && WL_SectorActionTargetActive) then {
	_m drawIcon [
		"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
		call WL2_fnc_iconColor,
		WL_SectorActionTarget,
		50,
		50,
		(time * 75) % 360
	];
};

{
	private _revealTrigger = _x getVariable "BIS_WL_revealTrigger";
	{
		if (!isNull _x) then {
			_size = call WL2_fnc_iconSize;
			_m drawIcon [
				call WL2_fnc_iconType,
				switch (side group _x) do {
					case west: { [0, 0.3, 0.6, 0.9] };
					case east: { [0.5, 0, 0, 0.9] };
					case independent: { [0, 0.6, 0, 0.9] };
					default { [1, 1, 1, 0] };
				},
				call WL2_fnc_getPos,
				_size,
				_size,
				call WL2_fnc_getDir,
				_x call WL2_fnc_iconTextSectorScan,
				1,
				0.043,
				"PuristaBold",
				"right"
			];
		};
	} forEach (((list _revealTrigger) - (missionNamespace getVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID player], []])) select {(side group _x != _side) && {(alive _x) && {((side group _x) in BIS_WL_sidesArray)}}});
} forEach BIS_WL_currentlyScannedSectors;

private _scannerUnits = vehicles select {
	alive _x &&
	isEngineOn _x &&
	(_x getVariable ["WL_scannerOn", false]) &&
	[_x] call WL2_fnc_getAssetSide == _side
};

{
	private _assetPos = _x modelToWorldVisual [0, 0, 0];
    private _assetHeight = _assetPos # 2;
	if (_assetHeight > 2000) then {
		continue;
	};
    private _scanRadius = ((_assetHeight * 2) min 1000) max 100;

	_m drawEllipse [
		_assetPos,
		_scanRadius,
		_scanRadius,
		0,
		[0, 1, 1, 1],
		"#(rgb,8,8,3)color(0,1,1,0.15)"
	];
} forEach _scannerUnits;

private _allScannedObjects = [];
{
	private _scannedObjects = _x getVariable ["WL_scannedObjects", []];
	_allScannedObjects append _scannedObjects;
} forEach _scannerUnits;
_allScannedObjects = _allScannedObjects arrayIntersect _allScannedObjects; // eliminate duplicates

{
	private _size = call WL2_fnc_iconSize;
	_m drawIcon [
		call WL2_fnc_iconType,
		switch ([_x] call WL2_fnc_getAssetSide) do {
			case west: { [0, 0.3, 0.6, 0.9] };
			case east: { [0.5, 0, 0, 0.9] };
			case independent: { [0, 0.6, 0, 0.9] };
			default { [1, 1, 1, 0] };
		},
		call WL2_fnc_getPos,
		_size,
		_size,
		call WL2_fnc_getDir,
		_x call WL2_fnc_iconTextSectorScan,
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach _allScannedObjects;

_control = (findDisplay 12) displayCtrl 51;
_draw = (ctrlMapScale _control) < 0.3;
{
	_m drawIcon [
		"\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa",
		[1, 0, 0, 0.8],
		call WL2_fnc_getPos,
		20,
		20,
		0,
		if (_draw) then {format ["%1 [K.I.A.]", (name _x)]} else {""},
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach (allPlayers select {(!alive _x) && {(side group _x == _side)}});
{
	_size = call WL2_fnc_iconSize;
	if (_x == player) then {
		_m drawIcon [
			'a3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa',
			[1,0,0,1],
			call WL2_fnc_getPos,
			_size,
			_size,
			0,
			"",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	};
	_m drawIcon [
		call WL2_fnc_iconType,
		call WL2_fnc_iconColor,
		call WL2_fnc_getPos,
		_size,
		_size,
		call WL2_fnc_getDir,
		if (_draw) then {name _x} else {""},
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach (allPlayers select {(side group _x == _side) && {(isNull objectParent _x) && {(alive _x)}}});
{
	_size = call WL2_fnc_iconSize;
	_m drawIcon [
		call WL2_fnc_iconType,
		call WL2_fnc_iconColor,
		call WL2_fnc_getPos,
		_size,
		_size,
		call WL2_fnc_getDir,
		if (_draw) then {format ["%1 [AI]", (name _x)]} else {""},
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach ((allUnits) select {(side group (crew _x select 0) == _side) && {(alive _x) && {(isNull objectParent _x) && {typeOf _x != "Logic" && {!(isPlayer _x)}}}}});
{
	_size = call WL2_fnc_iconSize;
	_m drawIcon [
		call WL2_fnc_iconType,
		call WL2_fnc_iconColor,
		call WL2_fnc_getPos,
		_size,
		_size,
		call WL2_fnc_getDir,
		if (_draw) then {if (isPlayer _x) then {name _x} else {format ["%1 [AI]", (name _x)]}} else {""},
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach ((units player) select {(alive _x) && {(isNull objectParent _x) && {_x != player}}});

private _teamVariable = switch (_side) do {
	case west: { "BIS_WL_westOwnedVehicles" };
	case east: { "BIS_WL_eastOwnedVehicles" };
	case independent: { "BIS_WL_guerOwnedVehicles" };
	default { "" };
};
private _sideVehicles = missionNamespace getVariable [_teamVariable, []];
private _vehiclesOnSide = vehicles select { count crew _x > 0 && side _x == _side };
_sideVehicles = _sideVehicles + _vehiclesOnSide;
_sideVehicles = _sideVehicles arrayIntersect _sideVehicles;
{
	_size = call WL2_fnc_iconSize;
	_m drawIcon [
		call WL2_fnc_iconType,
		call WL2_fnc_iconColor,
		call WL2_fnc_getPos,
		_size,
		_size,
		call WL2_fnc_getDir,
		_x call WL2_fnc_iconText,
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach (_sideVehicles select { alive _x });