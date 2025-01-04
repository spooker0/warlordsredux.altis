params ["_class", "_orderedClass", "_offset", "_range"];

private _asset = createSimpleObject [_class, AGLToASL (player modelToWorld _offset), true];

_asset setPhysicsCollisionFlag false;

_asset setDir direction player;

_asset lock 2;

private _textureHashmap = missionNamespace getVariable ["WL2_textures", createHashMap];
private _assetTextures = _textureHashmap getOrDefault [_orderedClass, []];
{
    _asset setObjectTextureGlobal [_forEachIndex, _x];
} forEach _assetTextures;

[player, "assembly"] call WL2_fnc_hintHandle;

BIS_WL_spacePressed = false;
BIS_WL_backspacePressed = false;

private _deployKeyHandle = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    if (_this # 1 == 57) then {
        if !(BIS_WL_backspacePressed) then {
            BIS_WL_spacePressed = true;
        };
    };
    if (_this # 1 == 14) then {
        if !(BIS_WL_spacePressed) then {
            BIS_WL_backspacePressed = true;
        };
    };
}];

uiNamespace setVariable ["BIS_WL_deployKeyHandle", _deployKeyHandle];
private _originalPosition = getPosATL player;

[_asset, _offset] spawn {
    params ["_asset", "_offset"];

    private _boundingBoxHeight = (boundingBoxReal _asset) # 0 # 2;
    while { !(isNull _asset) && !(BIS_WL_spacePressed) && !(BIS_WL_backspacePressed) } do {
        private _assetPos = player modelToWorld _offset;
        private _assetHeight = getTerrainHeightASL [_assetPos # 0, _assetPos # 1];
        private _playerHeight = (getPosASL player) # 2;
        private _offset_tweaked = [_offset # 0, _offset # 1, _assetHeight - _playerHeight - _boundingBoxHeight];
        _asset attachTo [player, _offset_tweaked];
        sleep 1;
    };
};

[_originalPosition, _range] spawn {
    params ["_originalPosition", "_range"];

    waitUntil {
        sleep 0.1;
        BIS_WL_spacePressed ||
        BIS_WL_backspacePressed ||
        [_originalPosition, _range, false] call WL2_fnc_cancelVehicleOrder;
    };

    if !(BIS_WL_spacePressed) then {
        BIS_WL_backspacePressed = true;
    };
};

waitUntil {sleep 0.1; BIS_WL_spacePressed || {BIS_WL_backspacePressed}};

(findDisplay 46) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_WL_deployKeyHandle"];
uiNamespace setVariable ['BIS_WL_deployKeyHandle', nil];
_offset set [1, _asset distance2D player];
detach _asset;
_p = getPosATL _asset;
deleteVehicle _asset;

[player, "assembly", false] call WL2_fnc_hintHandle;

private _canStillOrderVehicle = !([_originalPosition, _range, false] call WL2_fnc_cancelVehicleOrder);

[BIS_WL_spacePressed && _canStillOrderVehicle, _p];