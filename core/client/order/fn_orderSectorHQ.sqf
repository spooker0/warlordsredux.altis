"RequestMenu_close" call WL2_fnc_setupUI;

private _findCurrentSector = (BIS_WL_sectorsArray # 0) select {
    player inArea (_x getVariable "objectAreaComplete")
};
private _currentSector = _findCurrentSector # 0;

private _oldSectorBuilding = _currentSector getVariable ["WL_sectorHQ", objNull];
private _hasOldSectorBuilding = !isNull _oldSectorBuilding;

private _buildings = nearestObjects [player, ["House", "Building"], 50, true];
_buildings = _buildings select {
    (_x getVariable ["BIS_WL_ownerAsset", "123"]) == "123"
};

if (count _buildings == 0) exitWith {
    playSoundUI ["AddItemFailed"];
};

private _sectorBuilding = _buildings # 0;

private _sectorName = _currentSector getVariable ["BIS_WL_name", "sector"];
private _sectorBuildingType = getText (configFile >> "CfgVehicles" >> typeOf _sectorBuilding >> "displayName");
private _message = format ["Are you sure you want to create a sector HQ in %1 from: %2?", _sectorName, _sectorBuildingType];
if (_hasOldSectorBuilding) then {
    _message = format ["%1<br/><br/><t color='#ff0000'>This will replace the current sector HQ.</t>", _message];
};
private _result = [_message, "Create Sector HQ", "Create", "Cancel"] call BIS_fnc_guiMessage;

if (!_result) exitWith {
    playSoundUI ["AddItemFailed"];
};

if (_hasOldSectorBuilding) then {
    _oldSectorBuilding allowDamage true;
    deleteMarker (_currentSector getVariable ["WL_sectorHQMarker", ""]);
    deleteMarker (_currentSector getVariable ["WL_sectorHQTextMarker", ""]);
    _currentSector setVariable ["WL_sectorHQ", objNull, true];
    _currentSector setVariable ["WL_sectorHQMarker", ""];
    _currentSector setVariable ["WL_sectorHQTextMarker", ""];
};

_sectorBuilding setDamage 0;
private _hitPoints = getAllHitPointsDamage _sectorBuilding;
private _allHitPointNames = if (count _hitPoints > 0) then {
    _hitPoints # 0;
} else {
    [];
};
private _windowHitPointNames = _allHitPointNames select { "glass" in toLower _x || "window" in toLower _x };
{
    _sectorBuilding setHitPointDamage [_x, 1]
} forEach _windowHitPointNames;

_sectorBuilding allowDamage false;

private _markerName = format ["WL_sectorHQ_%1", _sectorName];
private _markerTextName = format ["WL_sectorHQText_%1", _sectorName];

private _sectorHQRadius = (boundingBoxReal _sectorBuilding) # 2;

private _sectorHQMarker = createMarkerLocal [_markerName, _sectorBuilding];
_sectorHQMarker setMarkerShapeLocal "ELLIPSE";
_sectorHQMarker setMarkerSizeLocal [_sectorHQRadius, _sectorHQRadius];
_sectorHQMarker setMarkerColorLocal "colorCivilian";
_sectorHQMarker setMarkerAlpha 0.3;

private _sectorHQTextMarker = createMarkerLocal [_markerTextName, _sectorBuilding];
_sectorHQTextMarker setMarkerShapeLocal "ICON";
_sectorHQTextMarker setMarkerTypeLocal "loc_Ruin";
_sectorHQTextMarker setMarkerColorLocal "colorCivilian";
_sectorHQTextMarker setMarkerText "HQ";

_currentSector setVariable ["WL_sectorHQ", _sectorBuilding, true];
_currentSector setVariable ["WL_sectorHQMarker", _sectorHQMarker];
_currentSector setVariable ["WL_sectorHQTextMarker", _sectorHQTextMarker];

[player, "buySectorHQ"] remoteExec ["WL2_fnc_handleClientRequest", 2];

for "_i" from 1 to 10 do {
    if (random 1 > 0.5) then {
        continue;
    };

    private _randomFile = round random [1, 6, 12];
    if (_randomFile < 10) then {
        _randomFile = format ["0%1", _randomFile];
    } else {
        _randomFile = str _randomFile;
    };

    playSound3D [format ["a3\sounds_f_orange\arsenal\explosives\debris_%1.wss", _randomFile], _sectorBuilding];
    sleep 0.2;
};
