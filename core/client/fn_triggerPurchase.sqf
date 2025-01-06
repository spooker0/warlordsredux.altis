#include "..\warlords_constants.inc"

params [
    "_className",
    "_requirements",
    "_displayName",
    "_picture",
    "_text",
    "_offset",
    "_cost",
    "_category"
];

if (typeName _offset == "STRING") then {
    _offset = call compile _offset;
};
if (typeName _requirements == "STRING") then {
    _requirements = call compile _requirements;
};
switch (_className) do {
    case "Arsenal": {if (isNull (findDisplay 602)) then {"RequestMenu_close" call WL2_fnc_setupUI; [player, "orderArsenal"] remoteExec ["WL2_fnc_handleClientRequest", 2]} else {playSound "AddItemFailed"}};
    case "LastLoadout": {"RequestMenu_close" call WL2_fnc_setupUI; [player, "lastLoadout"] remoteExec ["WL2_fnc_handleClientRequest", 2]};
    case "SaveLoadout": {"save" call WL2_fnc_orderSavedLoadout};
    case "SavedLoadout": {"RequestMenu_close" call WL2_fnc_setupUI; [player, "savedLoadout"] remoteExec ["WL2_fnc_handleClientRequest", 2]};
    case "Scan": {0 spawn WL2_fnc_orderSectorScan};
    case "FTSeized": {false spawn WL2_fnc_orderFastTravel};
    case "FTConflict": {true spawn WL2_fnc_orderFastTravel};
    case "FTSquadLeader": {
        ["ftSquadLeader"] spawn SQD_fnc_client;
        private _ftNextUseVar = format ["BIS_WL_FTSLNextUse_%1", getPlayerUID player];
        missionNamespace setVariable [_ftNextUseVar, serverTime + WL_FAST_TRAVEL_SQUAD_LEADER_RATE];
    };
    case "FundsTransfer": {call WL2_fnc_orderFundsTransfer; [player, "fundsTransferBill"] remoteExec ["WL2_fnc_handleClientRequest", 2]};
    case "TargetReset": {"RequestMenu_close" call WL2_fnc_setupUI; [player, "targetReset"] remoteExec ["WL2_fnc_handleClientRequest", 2]};
    case "forfeitVote": {0 spawn WL2_fnc_orderForfeit};
    case "LockVehicles": {
        {
            _x setVariable ["WL2_accessControl", 6, true];
        } forEach ((missionNamespace getVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID player], []]) select {alive _x && {(!(typeOf _x == "B_Truck_01_medical_F")) && {!(typeOf _x == "O_Truck_03_medical_F") && {!(typeOf _x == "B_Slingload_01_Medevac_F") && {!(typeOf _x == "Land_Pod_Heli_Transport_04_medevac_F")}}}}});
        [toUpper localize "STR_A3_WL_feature_lock_all_msg"] spawn WL2_fnc_smoothText;
    };
    case "UnlockVehicles": {
        {
            _x setVariable ["WL2_accessControl", 1, true];
        } forEach ((missionNamespace getVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID player], []]) select {alive _x});
        [toUpper localize "STR_A3_WL_feature_unlock_all_msg"] spawn WL2_fnc_smoothText;
    };
    case "clearVehicles": {
        private _playerAssets = missionNamespace getVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID player], []];
        private _eligibleAssets = _playerAssets select {
            alive _x && ((getPosATL _x) # 2) < 10
        };
        {
            private _unwantedPassengers = (crew _x) select {
                _x != player &&
                getPlayerUID player != (_x getVariable ["BIS_WL_ownerAsset", "123"])
            };
            {
                moveOut _x;
            } forEach _unwantedPassengers;
        } forEach _eligibleAssets;
    };
    case "resetVehicle": {
        private _vehicle = cursorObject;
        if (isNull _vehicle) exitWith {};
        "RequestMenu_close" call WL2_fnc_setupUI;
        [_vehicle] spawn {
            params ["_vehicle"];
            private _class = typeOf _vehicle;
            private _orderedClass = _vehicle getVariable ["WL2_orderedClass", _class];
            private _distanceToVehicle = player distance2D _vehicle;
            private _offset = [0, _distanceToVehicle, 0];

            private _deploymentResult = [_class, _orderedClass, _offset, 10, true] call WL2_fnc_deployment;

            if (_deploymentResult # 0) then {
                private _position =  _deploymentResult # 1;
                private _direction = direction player;
                private _uid = getPlayerUID player;
                private _nearbyEntities = [_class, ATLToASL _position, _direction, _uid, []] call WL2_fnc_grieferCheck;
                if (count _nearbyEntities > 0) then {
                    private _nearbyObject = _nearbyEntities # 0;
                    private _nearbyObjectName = [_nearbyObject] call WL2_fnc_getAssetTypeName;
                    private _nearbyObjectPosition = getPosASL _nearbyObject;
		            playSound3D ["a3\3den\data\sound\cfgsound\notificationwarning.wss", objNull, false, _nearbyObjectPosition, 5];
		            systemChat format ["Too close to another %1!", _nearbyObjectName];
                } else {
                    playSound "assemble_target";
                    [player, "resetVehicle", _vehicle, _position, _direction] remoteExec ["WL2_fnc_handleClientRequest", 2];
                };
            } else {
                playSound "AddItemFailed";
            };
        };
    };
    case "pruneAssets": {
        "RequestMenu_close" call WL2_fnc_setupUI;

        0 spawn {
            private _ownedVehicleVariable = format ["BIS_WL_ownedVehicles_%1", getPlayerUID player];
            private _allAssets = (missionNamespace getVariable [_ownedVehicleVariable, []]) select { alive _x };

            private _listText = "Your assets<br/>";
            {
                private _asset = _x;

                private _displayName = [_asset] call WL2_fnc_getAssetTypeName;
                private _assetSector = BIS_WL_allSectors select { _asset inArea (_x getVariable "objectAreaComplete") };
                private _assetLocation = if (count _assetSector > 0) then {
                    (_assetSector # 0) getVariable ["BIS_WL_name", str (mapGridPosition _asset)];
                } else {
                    mapGridPosition _asset;
                };
                _listText = _listText + format ["%1 @ %2<br/>", _displayName, _assetLocation];
            } forEach _allAssets;
            _listText = _listText + "Would you like to go through and delete some of them?";

            private _result = [_listText, "Asset List", "Yes", "Cancel"] call BIS_fnc_guiMessage;

            if (_result) then {
                {
                    sleep 0.2;
                    private _asset = _x;
                    _asset call WL2_fnc_deleteAssetFromMap;
                } forEach _allAssets;
            };
        };
    };
    case "RemoveUnits": {
        {
            deleteVehicle _x;
        } forEach ((groupSelectedUnits player) select {_x != player && {_x getVariable ["BIS_WL_ownerAsset", "123"] == getPlayerUID player}});
        false spawn WL2_fnc_refreshOSD;
    };
    case "wipeMap": {
        {
            if ("_USER_DEFINED #" in _x) then {
                deleteMarkerLocal _x;
            };
        } forEach allMapMarkers;
    };
    case "RespawnVic": {"RequestMenu_close" call WL2_fnc_setupUI; [player, "orderFTVehicle"] remoteExec ["WL2_fnc_handleClientRequest", 2]};
    case "RespawnVicFT": {0 spawn WL2_fnc_orderFTVehicleFT};
    case "RespawnPod" : {"RequestMenu_close" call WL2_fnc_setupUI; [player, "orderFTPod"] remoteExec ["WL2_fnc_handleClientRequest", 2]};
    case "RespawnPodFT" : {0 spawn WL2_fnc_orderFTPodFT};
    case "welcomeScreen": {0 spawn WL2_fnc_welcome};
    case "switchToGreen": {
        private _greenUnits = allUnits select {
            (_x getVariable ["WL2_isPlayableGreen", false]) && !isPlayer _x;
        };
        if (count _greenUnits == 0) exitWith {};

        private _newUnit = _greenUnits # 0;
        selectPlayer _newUnit;

        0 spawn {
            sleep 3;
            BIS_WL_playerSide = independent;
            player setVariable ["BIS_WL_ownerAssetSide", independent, true];

            ["client", true] call WL2_fnc_updateSectorArrays;
            {
                [_x, _x getVariable "BIS_WL_owner", []] call WL2_fnc_sectorMarkerUpdate;
            } forEach BIS_WL_allSectors;

            createMarkerLocal ["respawn_guerrila", ([independent] call WL2_fnc_getSideBase)];
            call WL2_fnc_playerEventHandlers;

            independent call WL2_fnc_parsePurchaseList;

            forceRespawn player;
            player allowDamage true;
        };
    };
    default {[_className, _cost, _category, _requirements, _offset] call WL2_fnc_requestPurchase};
};