params ["_asset", "_caller"];

private _assetOwner = _asset getVariable ["BIS_WL_ownerAsset", "123"];
private _callerUID = getPlayerUID _caller;
private _loadedItem = _asset getVariable ["WL2_loadedItem", objNull];
private _hasLoadedItem = !isNull _loadedItem;

private _nearLoadableEntities = (_asset nearEntities 30) select {isNull attachedTo _x};
private _loadableHashmap = missionNamespace getVariable ["WL2_loadable", createHashMap];
private _nearLoadable = _nearLoadableEntities select {typeOf _x in _loadableHashmap};
private _hasNearLoadable = count _nearLoadable > 0;

_assetOwner == _callerUID && alive _asset && (_hasLoadedItem || _hasNearLoadable)