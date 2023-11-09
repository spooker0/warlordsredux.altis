class CfgHints
{
	class common
	{
		displayName = "Common Controls";
		class friendlyFire
		{
			displayName = $STR_A3_WL_FF_Hint_Name;
			displayNameShort = "";
			description = $STR_A3_WL_FF_Hint;
			tip = $STR_A3_WL_FF_Hint_01;
			arguments[] =
			{
				{{"TacticalPing"}},
				"name player",
				"format ['%1', (2 - (count (player getVariable ['BIS_WL_friendlyKillTimestamps', []])))]"
			};
			image = ;
			noImage = true;
		};
	};

	class voiceWarningSystem
	{
		displayName = "Controls";

		class rita
		{
			displayName = "Rita voice warning system";
			displayNameShort = "";
			description = "In your settings you can enable the %3voice warning system: Rita.%4%1%2 It'll give you %3terrain info%4, getting to low to the terrain or diving to fast will trigger alerts.%1%2";
			tip = "";
			image = "A3\ui_f\data\gui\cfg\hints\voice_ca.paa";
			noImage = false;
		};
		class betty
		{
			displayName = "Betty voice warning system";
			displayNameShort = "";
			description = "In your settings you can enable the %3voice warning system: Betty.%4%1%2 It'll give you %3information about new enemies%4 on your sensor or when you lose sight of an enemy.%1%2 It'll also give you %3terrain info%4, getting to low to the terrain or diving to fast will trigger alerts.%1%2";
			tip = "";
			image = "A3\ui_f\data\gui\cfg\hints\voice_ca.paa";
			noImage = false;
		};
	};
};