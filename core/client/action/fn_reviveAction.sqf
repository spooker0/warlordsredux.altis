[
    player,
    "<t color='#00ff00'>Revive<t>",
    "\a3\ui_f\data\igui\cfg\revive\overlayIcons\u100_ca.paa",
    "\a3\ui_f\data\igui\cfg\revive\overlayIcons\u100_ca.paa",
    "isPlayer cursorTarget && lifeState cursorTarget == 'INCAPACITATED' && side group cursorTarget == side group player",
    "isPlayer cursorTarget && lifeState cursorTarget == 'INCAPACITATED' && side group cursorTarget == side group player",
    {},
    {},
    {
		private _unit = cursorTarget;
		[_unit] remoteExec ["WL2_fnc_revive", _unit];
    },
    {},
    [],
    5,
    100,
    false,
    false
] call BIS_fnc_holdActionAdd;

[
    player,
    "<t color='#ff0000'>Respawn</t>",
    "\a3\ui_f\data\igui\cfg\revive\overlayIcons\d100_ca.paa",
    "\a3\ui_f\data\igui\cfg\revive\overlayIcons\d100_ca.paa",
    "lifeState player == 'INCAPACITATED'",
    "lifeState player == 'INCAPACITATED'",
    {},
    {},
    {
		forceRespawn player;
    },
    {},
    [],
    1,
    100,
    false,
    true
] call BIS_fnc_holdActionAdd;