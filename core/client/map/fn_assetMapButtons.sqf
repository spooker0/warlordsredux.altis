private _dialog = findDisplay 46 createDisplay "RscDisplayEmpty";

getMousePosition params ["_mouseX", "_mouseY"];

private _offsetX = _mouseX + 0.03;
private _offsetY = _mouseY + 0.04;

private _menuButtons = [];

WL2_TargetButtonSetup = [_dialog, _menuButtons, _offsetX, _offsetY];

private _asset = WL_AssetActionTarget;
WL_ActionTarget = WL_AssetActionTarget;

private _titleBar = _dialog ctrlCreate ["RscStructuredText", -1];
_titleBar ctrlSetPosition [_offsetX, _offsetY - 0.05, 0.4, 0.05];
_titleBar ctrlSetBackgroundColor [0.3, 0.3, 0.3, 1];
_titleBar ctrlSetTextColor [0.7, 0.7, 1, 1];
private _assetName = [WL_AssetActionTarget] call WL2_fnc_getAssetTypeName;
_titleBar ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", toUpper _assetName];
_titleBar ctrlCommit 0;

if !(isPlayer _asset) then {
    ["DELETE", {
        params ["_asset"];
        _asset spawn WL2_fnc_deleteAssetFromMap;
    }, true] call WL2_fnc_addTargetMapButton;
};

private _accessControl = _asset getVariable ["WL2_accessControl", -1];
if (_accessControl != -1 && !(isPlayer _asset)) then {
    private _lockText = [_accessControl] call WL2_fnc_assetButtonAccessControl;

    [_lockText, {
        params ["_asset"];
        private _accessControl = _asset getVariable ["WL2_accessControl", 0];
        private _newAccess = (_accessControl + 1) % 8;
        _asset setVariable ["WL2_accessControl", _newAccess, true];
        playSound3D ["a3\sounds_f\sfx\objects\upload_terminal\terminal_lock_close.wss", _asset, false, getPosASL _asset, 1, 1, 0, 0];

        // return
        [_newAccess] call WL2_fnc_assetButtonAccessControl;
    }, false] call WL2_fnc_addTargetMapButton;
};

private _hasCrew = count ((crew _asset) select {
    !(typeof _x in ["B_UAV_AI", "O_UAV_AI"]) && getPlayerUID player != (_x getVariable ["BIS_WL_ownerAsset", "123"])
}) > 0;
private _isNotFlying = (getPosATL _asset # 2) < 10;
if (_hasCrew && _isNotFlying) then {
    ["KICK", {
        params ["_asset"];
        if ((getPosATL _asset # 2) < 10) then {
            private _unwantedPassengers = (crew _asset) select {
                (_x != player) && getPlayerUID player != (_x getVariable ["BIS_WL_ownerAsset", "123"])
            };
            {
                moveOut _x;
            } forEach _unwantedPassengers;
        };
    }, true] call WL2_fnc_addTargetMapButton;
};

if (typeof _asset in ["O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F"]) then {
    private _dazzlerText = [_asset] call WL2_fnc_assetButtonDazzler;

    [_dazzlerText, {
        params ["_asset"];
        [_asset] call WL2_fnc_dazzlerToggle;
    }, true] call WL2_fnc_addTargetMapButton;
};

if (typeof _asset in ["O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F", "Land_Communication_F"]) then {
    private _jammerText = [_asset] call WL2_fnc_assetButtonJammer;

    [_jammerText, {
        params ["_asset"];
        [_asset] call WL2_fnc_jammerToggle;
    }, true] call WL2_fnc_addTargetMapButton;
};

if (typeof _asset in ["B_Radar_System_01_F", "O_Radar_System_01_F"]) then {
    private _radarRotateText = [_asset] call WL2_fnc_assetButtonRadarRotate;

    [_radarRotateText, {
        params ["_asset"];
        _asset setVariable ["radarRotation", !(_asset getVariable ["radarRotation", false]), true];
        playSoundUI ["AddItemOK"];

        // return
        [_asset] call WL2_fnc_assetButtonRadarRotate;
    }, false] call WL2_fnc_addTargetMapButton;
};

private _crewPosition = (fullCrew [_asset, "", true]) select {!("cargo" in _x)};
private _radarSensor = (listVehicleSensors _asset) select {{"ActiveRadarSensorComponent" in _x} forEach _x};
private _hasRadar = count _radarSensor > 0 && (count _crewPosition > 1 || unitIsUAV _asset);
if (_hasRadar) then {
    private _radarOperateText = [_asset] call WL2_fnc_assetButtonRadarOperate;

    [_radarOperateText, {
        params ["_asset"];
        _asset setVariable ["radarOperation", !(_asset getVariable ["radarOperation", false]), true];
        playSoundUI ["AddItemOK"];

        // return
        [_asset] call WL2_fnc_assetButtonRadarOperate;
    }, false] call WL2_fnc_addTargetMapButton;
};

private _access = [_asset, player, "driver"] call WL2_fnc_accessControl;
if (unitIsUAV _asset && getConnectedUAV player != _asset && _access # 0) then {
    ["CONNECT TO UAV", {
        params ["_asset"];
        _access = [_asset, player, "driver"] call WL2_fnc_accessControl;
        if (_access # 0) then {
            player connectTerminalToUAV _asset;
        };
    }, true] call WL2_fnc_addTargetMapButton;
};

private _fastTravelSLCost = getMissionConfigValue ["BIS_WL_fastTravelCostSquadLeader", 10];
private _eligibleFastTravelSL = (["FTSquadLeader", [], "", "", "", [], _fastTravelSLCost, "Strategy"] call WL2_fnc_purchaseMenuAssetAvailability) # 0;
private _mySquadLeader = ['getMySquadLeader'] call SQD_fnc_client;
private _isMySquadLeader = getPlayerID _asset == _mySquadLeader;
private _moneySign = [BIS_WL_playerSide] call WL2_fnc_getMoneySign;
if (isPlayer _asset && _eligibleFastTravelSL && _isMySquadLeader) then {
    private _fastTravelText = format ["FAST TRAVEL SL (%1%2)", _moneySign, _fastTravelSLCost];
    [_fastTravelText, {
        params ["_asset"];
        private _fastTravelSLCost = getMissionConfigValue ["BIS_WL_fastTravelCostSquadLeader", 10];
        private _eligibleFastTravelSL = (["FTSquadLeader", [], "", "", "", [], _fastTravelSLCost, "Strategy"] call WL2_fnc_purchaseMenuAssetAvailability) # 0;
        private _mySquadLeader = ['getMySquadLeader'] call SQD_fnc_client;
        private _isMySquadLeader = getPlayerID _asset == _mySquadLeader;
        if (isPlayer _asset && _eligibleFastTravelSL && _isMySquadLeader) then {
            ["ftSquadLeader"] spawn SQD_fnc_client;
            private _ftNextUseVar = format ["BIS_WL_FTSLNextUse_%1", getPlayerUID player];
            missionNamespace setVariable [_ftNextUseVar, serverTime + WL_FAST_TRAVEL_SQUAD_LEADER_RATE];
        };
    }, true] call WL2_fnc_addTargetMapButton;
};

[_dialog, _offsetX, _offsetY, _menuButtons] spawn {
    params ["_dialog", "_originalMouseX", "_originalMouseY", "_menuButtons"];
    private _keepDialog = true;
    private _menuHeight = (count _menuButtons) * 0.05;
    private _startTime = serverTime;
    waitUntil {
        sleep 0.1;
        !visibleMap || inputMouse 0 == 0 || serverTime - _startTime > 1;
    };
    while { visibleMap && _keepDialog} do {
        getMousePosition params ["_mouseX", "_mouseY"];

        private _deltaX = _mouseX - _originalMouseX;
        private _deltaY = _mouseY - _originalMouseY;

        if (_deltaX < 0 || _deltaX > 0.4 || _deltaY < -0.05 || _deltaY > _menuHeight) then {
            _keepDialog = inputMouse 0 == 0 && inputMouse 1 == 0;
        };
    };

    WL_ActionTarget = objNull;
    _dialog closeDisplay 1;
};

if (count _menuButtons == 0) then {
    _dialog closeDisplay 1;
};

WL2_TargetButtonSetup = [obNull, [], 0, 0];