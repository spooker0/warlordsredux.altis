#include "..\..\warlords_constants.inc"

addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

	private _userMarkerAlpha = if (profileNamespace getVariable ["MRTM_showMarkers", true]) then {
		1;
	} else {
		0;
	};
	{
		if ("_USER_DEFINED #" in _x) then {
			_x setMarkerAlphaLocal _userMarkerAlpha;
		};
	} forEach allMapMarkers;

	if (_mapIsOpened) then {
		MAP_CONTROL = addMissionEventHandler ["EachFrame", {
			private _map = (uiNamespace getVariable ["BIS_WL_mapControl", controlNull]);

			if (visibleMap) then {
				private _ctrlMap = ctrlParent _map;
				private _ctrlAssetInfoBox = _ctrlMap getVariable "BIS_assetInfoBox";

				private _radius = (((ctrlMapScale _map) * 500) min 30) max 3;
				private _pos = _map ctrlMapScreenToWorld getMousePosition;

				private _allTeamVehicles = missionNamespace getVariable [format ["BIS_WL_%1ownedVehicles", side group player], []];
				private _allUnits = allUnits select {
					!(typeOf _x in ["B_UAV_AI", "O_UAV_AI"]) && isNull objectParent _x;
				};
				private _nearbyAssets = (_allUnits + _allTeamVehicles) select {
					getPlayerUID player == (_x getVariable ["BIS_WL_ownerAsset", "123"]) &&
					_x != player &&
					alive _x &&
					(_x distance2D _pos) < _radius
				};
				private _squadLeaderID = ['getMySquadLeader'] call SQD_fnc_client;
				private _squadLeader = _allUnits select {
					isPlayer _x &&
					_x != player &&
					getPlayerID _x == _squadLeaderID &&
					(_x distance2D _pos) < _radius
				};
				_nearbyAssets append _squadLeader;
				_nearbyAssets = [_nearbyAssets, [_pos], { _input0 distance2D _x }, "ASCEND"] call BIS_fnc_sortBy;

				if (count _nearbyAssets > 0) then {
					WL_AssetActionTarget = _nearbyAssets # 0;
					_ctrlAssetInfoBox ctrlSetPosition [(getMousePosition # 0) + safeZoneW / 100, (getMousePosition # 1) + safeZoneH / 50, safeZoneW, safeZoneH];
					_ctrlAssetInfoBox ctrlCommit 0;
					_ctrlAssetInfoBox ctrlSetStructuredText parseText format [
						"<t shadow = '2' size = '%1'>%2</t>",
						1 call WL2_fnc_purchaseMenuGetUIScale,
						format [
							"Click for options:<br/><t color='#ff4b4b'>%1</t>",
							[WL_AssetActionTarget] call WL2_fnc_getAssetTypeName
						]
					];
					_ctrlAssetInfoBox ctrlShow true;
					_ctrlAssetInfoBox ctrlEnable true;
				} else {
					WL_AssetActionTarget = objNull;
					_ctrlAssetInfoBox ctrlShow false;
					_ctrlAssetInfoBox ctrlEnable false;
				};

				if (isNull (findDisplay 160 displayCtrl 51)) then {
					_mapScale = ctrlMapScale WL_CONTROL_MAP;
					_timer = (serverTime % WL_MAP_PULSE_FREQ);
					_timer = if (_timer <= (WL_MAP_PULSE_FREQ / 2)) then {_timer} else {WL_MAP_PULSE_FREQ - _timer};
					_markerSize = linearConversion [0, WL_MAP_PULSE_FREQ / 2, _timer, 1, WL_MAP_PULSE_ICON_SIZE];
					_markerSizeArr = [_markerSize, _markerSize];

					{
						_x setMarkerSizeLocal [WL_CONNECTING_LINE_AXIS * _mapScale * BIS_WL_mapSizeIndex, (markerSize _x) # 1];
					} forEach BIS_WL_sectorLinks;

					{
						if !(_x in BIS_WL_selection_availableSectors) then {
							((_x getVariable "BIS_WL_markers") # 0) setMarkerSizeLocal [1, 1];
						} else {
							if (_x == BIS_WL_targetVote) then {
								((_x getVariable "BIS_WL_markers") # 0) setMarkerSizeLocal [WL_MAP_PULSE_ICON_SIZE, WL_MAP_PULSE_ICON_SIZE];
							} else {
								((_x getVariable "BIS_WL_markers") # 0) setMarkerSizeLocal _markerSizeArr;
							};
						};
					} forEach BIS_WL_allSectors;
				};
			};
		}];
		0 spawn {
			sleep 1;
			MAP_CONTROL_CLICK = addMissionEventHandler ["MapSingleClick", {
				if (count WL_MapBusy > 0) exitWith {};

				if !(isNull WL_AssetActionTarget) then {
					call WL2_fnc_assetMapButtons;
				};

				if !(isNull WL_SectorActionTarget) then {
					call WL2_fnc_sectorMapButtons;
				};
			}];
		};
	} else {
		removeMissionEventHandler ["EachFrame", MAP_CONTROL];
		if !(isNil "MAP_CONTROL_CLICK") then {
			removeMissionEventHandler ["MapSingleClick", MAP_CONTROL_CLICK];
		};
	};
}];