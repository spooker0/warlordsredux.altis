private _alreadyAdded = _this getVariable ["APS_fireEventHandlerAdded", false];
if (_alreadyAdded) exitWith {};
_this setVariable ["APS_fireEventHandlerAdded", true];

_this addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

	WAS_fired = true;

	if !(local _projectile) exitWith { true };
	// [_projectile] spawn APS_fnc_lagProtection;
	[_projectile] spawn APS_fnc_projectileStateUpdate;

	if !((typeOf _projectile) in APS_ProjectileMap) exitWith { true };
	_this spawn APS_fnc_firedProjectile;

	if (_ammo == "ammo_Missile_HARM" || _ammo == "ammo_Missile_KH58") then {
		[_projectile, _unit] call DIS_fnc_startMissileCamera;
		if (isNull (missileTarget _projectile)) then {
			// fire on launcher
			private _launcher = _unit getVariable ["WL_incomingLauncherLastKnown", objNull];
			if (alive _launcher) exitWith {
				if (_launcher isKindOf "Man") then {
					_projectile setMissileTarget [_launcher, true];

					[_projectile] spawn {
						params ["_projectile"];
						sleep 2;
						_projectile setMissileTarget objNull;
					};
				} else {
					_projectile setMissileTarget [_launcher, true];
				};
			};

			private _samTargets = [];
			// locking SAMs
			private _sensorThreats = getSensorThreats _unit;
			{
				_x params ["_threat", "_type", "_sensors"];
				private _isInAngle = [getPosATL _projectile, getDir _projectile, 120, getPosATL _threat] call BIS_fnc_inAngleSector;
				if (_isInAngle && _type in ["locked", "marked"] && "radar" in _sensors) then {
					_samTargets pushBack (vehicle _threat);
				};
			} forEach _sensorThreats;
			if (count _samTargets > 0) exitWith {
				private _sortedSamTargets = [_samTargets, [], { _unit distance _x }, "ASCEND"] call BIS_fnc_sortBy;
				_projectile setMissileTarget [_sortedSamTargets # 0, true];
			};

			// radar on sensor
			private _allAssetTargets = getSensorTargets _unit;
			{
				_x params ["_target", "_type", "_relationship", "_detectionSource"];
				private _isInAngle = [getPosATL _projectile, getDir _projectile, 120, getPosATL _target] call BIS_fnc_inAngleSector;
				if (_isInAngle && _type == "ground" && _relationship != "friendly" && "passiveradar" in _detectionSource) then {
					_samTargets pushBack (_x # 0);
				};
			} forEach _allAssetTargets;
			if (count _samTargets > 0) then {
				private _sortedSamTargets = [_samTargets, [], { _unit distance _x }, "ASCEND"] call BIS_fnc_sortBy;
				_projectile setMissileTarget [_sortedSamTargets # 0, true];
			};
		};
	};
}];