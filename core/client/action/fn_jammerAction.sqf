params ["_asset"];

private _actionID = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_actionID"];
		[_asset] call WL2_fnc_jammerToggle;
		[_asset, _actionID] call WL2_fnc_jammerUpdate;
	},
	[],
	99,
	false,
	false,
	"",
	"alive _target && {getPlayerUID _this == (_target getVariable ['BIS_WL_ownerAsset', '123'])}",
	30,
	true
];

[_asset, _actionID] spawn {
	params ["_asset", "_actionID"];
	while { alive _asset } do {
		[_asset, _actionID] call WL2_fnc_jammerUpdate;
		sleep 1;
	};
};