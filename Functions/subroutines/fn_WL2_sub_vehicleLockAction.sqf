params ["_asset"];

private _lockActionId = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		[_asset, true] remoteExec ["BIS_fnc_WL2_vehicleLock", _asset];
	},
	[],
	-100,
	true,
	false,
	"",
	"alive _target && {getPlayerUID _this == (_target getVariable ['BIS_WL_ownerAsset', '123'])}",
	50,
	true
];

[_asset, _lockActionId] spawn {
    params ["_asset", "_lockActionId"];
    while { alive _asset } do {
		private _locked = if (unitIsUAV _asset) then {
			_asset getVariable ["BIS_WL_lockedFromSquad", false]
		} else {
			(locked _asset) == 2
		};
		_asset setUserActionText [_lockActionId, format ["<t color = '%1'>%2</t>", (if (_locked) then {"#4bff58"} else {"#ff4b4b"}), (if (_locked) then {localize "STR_A3_cfgvehicles_miscunlock_f_0"} else {localize "STR_A3_cfgvehicles_misclock_f_0"})], format ["<img size='2' image='%1'/>", if (_locked) then {'a3\modules_f\data\iconunlock_ca.paa'} else {'a3\modules_f\data\iconlock_ca.paa'}]];
        sleep 1;
    };
};