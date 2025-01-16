_magazineTypes = [
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeOrange_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell",
	"1Rnd_Smoke_Grenade_shell",
	"SmokeShellOrange",
	"SmokeShellBlue",
	"SmokeShellYellow",
	"SmokeShellGreen",
	"SmokeShell",
	"SmokeShellRed",
	"Chemlight_green",
	"Chemlight_red"
];

if (side player == west) then {
	player linkItem "B_UavTerminal";
};
if (side player == east) then {
	player linkItem "O_UavTerminal";
};
if (side player == independent) then {
	player linkItem "I_UavTerminal";
};

{
	player removeMagazines _x;
} forEach _magazineTypes;

player linkItem "Integrated_NVG_TI_0_F";
player addPrimaryWeaponItem "muzzle_snds_H";
player addPrimaryWeaponItem "muzzle_snds_M";
player addMagazines ["SmokeShell", 1];