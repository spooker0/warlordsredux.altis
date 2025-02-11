#include "..\warlords_constants.inc"

private _voteLocked = missionNamespace getVariable ["voteLocked", true];
private _start = serverTime + 10;
waitUntil {sleep 0.1; !_voteLocked || (_start < serverTime);};
if (_voteLocked) exitwith {};

"fundsDatabaseClients" addPublicVariableEventHandler {
	false spawn WL2_fnc_refreshOSD;
};

addMissionEventHandler ["GroupIconClick", WL2_fnc_groupIconClickHandle];
addMissionEventHandler ["GroupIconOverEnter", WL2_fnc_groupIconEnterHandle];
addMissionEventHandler ["GroupIconOverLeave", WL2_fnc_groupIconLeaveHandle];

call WL2_fnc_playerEventHandlers;

if ((getPlayerUID player) in (getArray (missionConfigFile >> "adminIDs"))) then {
	addMissionEventHandler ["HandleChatMessage", {
		params ["_channel", "_owner", "_from", "_text", "_person"];
		_text = toLower _text;
		_list = getArray (missionConfigFile >> "adminFilter");
		_return = ((_list findIf {[_x, _text] call BIS_fnc_inString}) != -1);

		if (_owner == clientOwner) then {
			_input = _text splitString " ";
			_command = _input # 0;
			_count = count _input;
			if (_count == 1 && {_command == "!updateZeus"}) then {
				[player, 'updateZeus'] remoteExec ['WL2_fnc_handleClientRequest', 2];
			};
		};
		_senderLocked = _person getVariable ["voteLocked", false];
		if (_senderLocked) then {
			_senderLocked;
		} else {
			_return;
		};
	}];
} else {
	addMissionEventHandler ["HandleChatMessage", {
		params ["_channel", "_owner", "_from", "_text"];
		_text = toLower _text;
		_list = getArray (missionConfigFile >> "adminFilter");
		_return = ((_list findIf {[_x, _text] call BIS_fnc_inString}) != -1);

		_senderLocked = _person getVariable ["voteLocked", false];
		if (_senderLocked) then {
			_senderLocked;
		} else {
			_return;
		};
	}];
};

0 spawn {
	waituntil {sleep 0.1; !isnull (findDisplay 46)};
	private _display = findDisplay 46;
	_display displayAddEventHandler ["KeyUp", {
		_key = _this # 1;
		if (_key in actionKeys "Gear") then {
			BIS_WL_gearKeyPressed = false;
		};
	}];

	_display displayAddEventHandler ["KeyDown", {
		_this call WL2_fnc_handleKeypress;
	}];

	// intentionally separate handler
	_display displayAddEventHandler ["KeyDown", {
		private _key = _this # 1;
		[_key] call WL2_fnc_handleBuyMenuKeypress;
	}];

	while { !BIS_WL_missionEnd } do {
		private _purchaseMenu = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
		if (isNull _purchaseMenu) then {
			WL_GEAR_BUY_MENU = false;
			WL_CONTROL_MAP ctrlEnable true;
		};
		sleep 1;
	};
};

//***Fetch price from requisitions.hpp using "priceHash getOrDefault [typeOf _asset, 200]"***/
priceHash = createHashMap;
_fullList = (missionNamespace getVariable (format ["BIS_WL_purchasable_%1", side player]));
{
	if (_forEachIndex < 7) then {
		_category = _x;
		{
			_x params["_name", "_cost"];
			priceHash set [_name, _cost]
		} forEach _category;
	};
} forEach _fullList;

addMissionEventHandler ["EntityCreated", {
	params ["_entity"];
	if (!local _entity) exitWith {};
	_entityType = (typeOf _entity);
	if (isClass (configFile >> "CfgAmmo" >> _entityType)) then {
		_minesDB = (missionNamespace getVariable [format ["BIS_WL2_minesDB_%1", getPlayerUID player], []]);
		if ((_minesDB getOrdefault [_entityType, 0]) isEqualType []) then {
			_limit = (_minesDB get _entityType) # 0;
			_mines = ((_minesDB get _entityType) # 1) select {alive _x};
			if (count _mines >= _limit) then {
				private _t = _mines find objNull;
				if (_t != -1) then {_mines deleteAt _t;};
					if (count _mines >= _limit) then {
						deleteVehicle _entity;
						missionNameSpace setVariable ["mineDisplayActive", serverTime + 5];
						return;
					} else {
						_mines pushBack _entity;
						_minesDB set [_entityType, [_limit, _mines]];
					};
				} else {
				_mines pushBack _entity;
				_minesDB set [_entityType, [_limit, _mines]];
			};
			missionNameSpace setVariable ["mineDisplayActive", serverTime + 5];
			missionNamespace setVariable [format ["BIS_WL2_minesDB_%1", getPlayerUID player], _minesDB, [2, clientOwner]];
		};
	};
}];

addMissionEventHandler ["EntityRespawned", {
	params ["_newEntity", "_oldEntity"];
	private _wasMan = _oldEntity getEntityInfo 0;
	if (_wasMan) then {
		removeAllActions _oldEntity;
	};
}];

addMissionEventHandler ["HandleChatMessage", {
	params ["_channel", "_owner", "_from", "_text"];
	_text = toLower _text;

	if (_owner == clientOwner) then {
		if (_text == "!lag") then {
			[player] remoteExec ["WL2_fnc_lagMessageHandler", 2];
		};
	};
}];

call POLL_fnc_chatCommand;