/*
	Author: MrThomasM

	Description: Opens a debug console.
*/
if !(getPlayerUID player in getArray (missionConfigFile >> "adminIDs")) exitWith {};

if (isNull (findDisplay 2000)) then {
	private _d = [4000, 8000, 2000];
	{
		if !(isNull (findDisplay _x)) then {
			(findDisplay _x) closeDisplay 1;
		};
	} forEach _d;
	createDialog "MRTM_debugMenu";
};