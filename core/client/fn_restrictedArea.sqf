private _soundId = -1;

while { !BIS_WL_missionEnd } do {
    sleep 0.5;

    private _findCurrentSector = (BIS_WL_allSectors - (BIS_WL_sectorsArray # 3)) select {
        player inArea (_x getVariable "objectAreaComplete")
    };

    if (count _findCurrentSector == 0) then {
        "Restrict" cutText ["", "PLAIN"];
        player setVariable ["WL_zoneRestrictKillTime", -1];
        if (_soundId != -1) then {
            stopSound _soundId;
            _soundId = -1;
        };
        continue;
    };

    private _currentSector = _findCurrentSector # 0;
    private _isCarrierSector = count (_currentSector getVariable ["WL_aircraftCarrier", []]) > 0;

    private _alt = if (_isCarrierSector) then {
        getPosASL player # 2;
    } else {
        getPosATL player # 2;
    };

    if (_alt > 50) then {
        "Restrict" cutText ["", "PLAIN"];
        player setVariable ["WL_zoneRestrictKillTime", -1];

        if (_soundId != -1) then {
            stopSound _soundId;
            _soundId = -1;
        };

        continue;
    };

    if (player getVariable ["WL_zoneRestrictKillTime", -1] == -1) then {
        player setVariable ["WL_zoneRestrictKillTime", serverTime + 80];
    };

    if (_soundId == -1 || count (soundParams _soundId) == 0) then {
        _soundId = playSoundUI ["air_raid"];
    };

    private _restrictDisplay = uiNamespace getVariable ["RscWLZoneRestrictionDisplay", displayNull];
    if (isNull _restrictDisplay) then {
        "Restrict" cutRsc ["RscWLZoneRestrictionDisplay", "PLAIN", -1, true, true];
    };

    private _restrictTimer = _restrictDisplay displayCtrl 9000;
    private _timeRemaining = (player getVariable "WL_zoneRestrictKillTime") - serverTime;
    _restrictTimer ctrlSetText format ["%1", round _timeRemaining];

    if (_timeRemaining < 0) then {
        (vehicle player) setDamage 1;
        player setDamage 1;

        if (_soundId != -1) then {
            stopSound _soundId;
            _soundId = -1;
        };

        "Restrict" cutText ["", "PLAIN"];
        player setVariable ["WL_zoneRestrictKillTime", -1];
    };
};