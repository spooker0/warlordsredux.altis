params ["_asset", "_caller"];

private _assetOwner = _asset getVariable ["BIS_WL_ownerAsset", "123"];
private _callerUID = getPlayerUID _caller;
private _callerID = getPlayerID _caller;
private _loadedItem = _asset getVariable ["WL2_loadedItem", objNull];
private _hasLoadedItem = !isNull _loadedItem;

private _nearLoadableEntities = (_asset nearEntities 30) select {isNull attachedTo _x};
private _loadableHashmap = missionNamespace getVariable ["WL2_loadable", createHashMap];
private _nearLoadable = _nearLoadableEntities select {
    private _ownerUID = _x getVariable ["BIS_WL_ownerUavAsset", "123"];
    private _owner = _ownerUID call BIS_fnc_getUnitByUid;
    private _ownerID = getPlayerID _owner;

    private _areInSquad = ["areInSquad", [_callerID, _ownerID]] call SQD_fnc_client;
    private _isLockedFromSquad = _x getVariable ["BIS_WL_lockedFromSquad", false];
    private _assetActualType = _x getVariable ["WL2_orderedClass", typeOf _x];

    _assetActualType in _loadableHashmap && (_ownerID == _callerID || (_areInSquad && !_isLockedFromSquad));
};
private _hasNearLoadable = count _nearLoadable > 0;

_assetOwner == _callerUID && alive _asset && (_hasLoadedItem || _hasNearLoadable)