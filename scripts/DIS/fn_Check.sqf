params ["_asset"];

private _isSAM = false;
private _mags = magazinesAllTurrets _asset;

scopeName "main";
if (_asset isKindOf "StaticWeapon") then {
	{
		private _ammo = getText (configfile >> "CfgMagazines" >> (_x select 0) >> "ammo");
		if (_ammo isKindOf "MissileBase") then {
			private _airlock = getNumber (configfile >> "CfgAmmo" >> _ammo >> "airLock");
			if (_airlock == 2) then {
				_isSAM = true;
				breakTo "main";
			};
		};
	} forEach _mags;
};

if (typeOf _asset == "B_APC_Tracked_01_AA_F") then {
	_isSAM = true;
};
if (typeOf _asset == "O_APC_Tracked_02_AA_F") then {
	_isSAM = true;
};

_isSAM;