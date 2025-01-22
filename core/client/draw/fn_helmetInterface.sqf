addMissionEventHandler ["Draw3D", {
    if !(WL_HelmetInterface) exitWith {};

    private _side = side group player;
    private _laserTargetSide = switch (_side) do {
        case west: {
            "LaserTargetW"
        };
        case east: {
            "LaserTargetE"
        };
        case independent: {
            "LaserTargetI"
        };
    };
    private _laserTargets = entities _laserTargetSide;
    {
        private _target = _x;
        private _responsiblePlayer = _target getVariable ["WL_laserPlayer", objNull];
        drawIcon3D [
            "\A3\ui_f\data\IGUI\RscCustomInfo\Sensors\Targets\LaserTarget_ca.paa",
            [1, 0, 0, 1],
            _target modelToWorldVisual [0, 0, 0],
            1,
            1,
            45,
            name _responsiblePlayer,
            0,
            0.05,
            "RobotoCondensedBold"
        ];
    } forEach _laserTargets;

    private _vehicle = vehicle player;
    if (_vehicle == player) then {
        _vehicle = getConnectedUAV player;
    };
    if (isNull _vehicle) exitWith {};
    private _sensorTargets = (getSensorTargets _vehicle) apply {
        _x # 0;
    };
    private _remoteTargets = ((listRemoteTargets _side) select {
        _x # 1 > -30;
    }) apply {
        _x # 0;
    };
    private _targets = _sensorTargets + _remoteTargets;
    _targets = _targets arrayIntersect _targets;
    _targets = _targets select {
        alive _x && lifeState _x != "INCAPACITATED" && !(_x isKindOf "Logic");
    };

    {
        private _target = _x;
        private _targetIsInfantry = _target isKindOf "Man";
        private _targetPos = if (_targetIsInfantry) then {
            _target modelToWorldVisual (_target selectionPosition "spine2");
        } else {
            _target modelToWorldVisual (getCenterOfMass _target);
        };
        private _targetSide = [_target] call WL2_fnc_getAssetSide;
        private _targetColor = if (_targetSide == _side) then {
            [0, 0, 1, 1]
        } else {
            if (count crew _target > 0) then {
                [1, 0, 0, 1]
            } else {
                [1, 1, 1, 1]
            };
        };

        private _assetTypeName = if (_targetIsInfantry) then {
            private _screenPos = worldToScreen _targetPos;
            private _isInViewRadius = count _screenPos == 2 && {
                (_screenPos distance2D [0.5, 0.5]) < 0.2
            };
            if (_isInViewRadius) then {
                [_target] call WL2_fnc_getAssetTypeName;
            } else {
                ""
            };
        } else {
            [_target] call WL2_fnc_getAssetTypeName;
        };

        private _assetName = if (_targetSide == _side) then {
            private _ownerPlayer = (_target getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID;
            private _ownerName = name _ownerPlayer;
            format ["%1 (%2)", _assetTypeName, _ownerName];
        } else {
            _assetTypeName;
        };

        private _targetSize = if (_targetIsInfantry) then {
            0.6
        } else {
            0.8
        };
        private _targetTextSize = if (_targetIsInfantry) then {
            0.03
        } else {
            0.035
        };

        drawIcon3D [
            "\A3\ui_f\data\IGUI\RscCustomInfo\Sensors\Targets\MarkedTarget_ca.paa",
            _targetColor,
            _targetPos,
            _targetSize,
            _targetSize,
            0,
            _assetName,
            true,
            _targetTextSize,
            "RobotoCondensedBold"
        ];
    } forEach _targets;

    private _incomingMissiles = _vehicle getVariable ["WL_incomingMissle", []];
    _incomingMissiles = _incomingMissiles select {
        alive _x;
    };
    {
        private _missile = _x;
        private _missilePos = _missile modelToWorldVisual [0, 0, 0];
        private _distance = player distance _missile;
        private _color = switch true do {
            case (_distance > 5000): {
                [1, 1, 1, 1]
            };
            case (_distance > 2500): {
                [1, 1, 0, 1]
            };
            default {
                [1, 0, 0, 1]
            };
        };
        drawIcon3D [
            "\A3\ui_f\data\IGUI\RscCustomInfo\Sensors\Targets\missile_ca.paa",
            _color,
            _missilePos,
            0.8,
            0.8,
            0,
            format ["%1 KM", (round (_distance / 100)) / 10],
            true,
            0.035,
            "RobotoCondensedBold"
        ];
    } forEach _incomingMissiles;
}];

while { !BIS_WL_missionEnd } do {
    sleep 5;

    private _helmet = headgear player;
    private _isPilotHelmet = ["Pilot", _helmet] call BIS_fnc_inString;

    private _vehicle = vehicle player;
    if (_vehicle == player) then {
        _vehicle = vehicle (getConnectedUAVUnit player);
    };

    private _vehicleSensors = listVehicleSensors _vehicle;
    private _inAllowedVehicle = _vehicle isKindOf "Air" || count _vehicleSensors > 0;

    WL_HelmetInterface = _isPilotHelmet && _inAllowedVehicle;
};