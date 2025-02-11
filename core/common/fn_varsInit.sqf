params ["_locality"];

switch (_locality) do {
	case "common": {
		BIS_WL_sidesArray = [west, east, resistance];
		BIS_WL_competingSides = [west, east];
		BIS_WL_missionEnd = FALSE;
		BIS_WL_mapSize = getNumber (configFile >> "cfgWorlds" >> worldName >> "mapSize");
		if (BIS_WL_mapSize == 0) then {BIS_WL_mapSize = getNumber (configFile >> "cfgWorlds" >> worldName >> "Grid" >> "OffsetY")};
		BIS_WL_mapAreaArray = [[BIS_WL_mapSize / 2, BIS_WL_mapSize / 2], BIS_WL_mapSize / 2, BIS_WL_mapSize / 2, 0, TRUE];
		BIS_WL_purchaseListTemplate = call compile "['A3ReduxAll']";
	};
	case "client": {
		BIS_WL_playerSide = side group player;
		BIS_WL_enemySide = (BIS_WL_competingSides - [BIS_WL_playerSide]) # 0;
		BIS_WL_mapSizeIndex = BIS_WL_mapSize / 8192;
		BIS_WL_colorMarkerFriendly = ["colorBLUFOR", "colorOPFOR", "colorIndependent"] # (BIS_WL_sidesArray find BIS_WL_playerSide);
		BIS_WL_colorMarkerEnemy = ["colorBLUFOR", "colorOPFOR", "colorIndependent"] # (BIS_WL_sidesArray find BIS_WL_enemySide);
		BIS_WL_targetVote = objNull;
		BIS_WL_terminateOSDEvent_voting = FALSE;
		BIS_WL_terminateOSDEvent_seizing = FALSE;
		BIS_WL_terminateOSDEvent_trespassing = FALSE;
		BIS_WL_terminateOSDEvent_seizingDisabled = FALSE;
		BIS_WL_resetTargetSelection_client = FALSE;
		BIS_WL_localized_m = localize "STR_A3_rscdisplayarcademap_meters";
		BIS_WL_localized_km = localize "STR_A3_WL_unit_km";
		BIS_WL_gearKeyPressed = FALSE;
		BIS_WL_currentSelection = 0;
		BIS_WL_matesAvailable = 0;
		BIS_WL_lastLoadout = [];
		BIS_WL_savedLoadout = [];
		BIS_WL_loadoutApplied = FALSE;
		BIS_WL_selectionMapManager = [];
		BIS_WL_currentlyScannedSectors = [];
		BIS_WL_currentTargetData = [
			"\A3\ui_f\data\map\markers\nato\b_hq.paa",
			[0, 0, 0, 0],
			[0, 0, 0]
		];
		BIS_WL_colorsArray = [
			[profileNamespace getVariable ["Map_BLUFOR_R", 0], profileNamespace getVariable ["Map_BLUFOR_G", 1], profileNamespace getVariable ["Map_BLUFOR_B", 1], profileNamespace getVariable ["Map_BLUFOR_A", 0.8]],
			[profileNamespace getVariable ["Map_OPFOR_R", 0], profileNamespace getVariable ["Map_OPFOR_G", 1], profileNamespace getVariable ["Map_OPFOR_B", 1], profileNamespace getVariable ["Map_OPFOR_A", 0.8]],
			[profileNamespace getVariable ["Map_Independent_R", 0], profileNamespace getVariable ["Map_Independent_G", 1], profileNamespace getVariable ["Map_Independent_B", 1], profileNamespace getVariable ["Map_Independent_A", 0.8]],
			[profileNamespace getVariable ["Map_Unknown_R", 0], profileNamespace getVariable ["Map_Unknown_G", 1], profileNamespace getVariable ["Map_Unknown_B", 1], profileNamespace getVariable ["Map_Unknown_A", 0.8]]
		];
		BIS_WL_sectorIconsArray = [
			"\A3\ui_f\data\map\markers\nato\b_installation.paa",
			"\A3\ui_f\data\map\markers\nato\o_installation.paa",
			"\A3\ui_f\data\map\markers\nato\n_installation.paa"
		];
		BIS_WL_colorFriendly = BIS_WL_colorsArray # (BIS_WL_sidesArray find BIS_WL_playerSide);
		WL_AssetActionTarget = objNull;
		WL_SectorActionTarget = objNull;
		WL_SectorActionTargetActive = false;
		WL_MapBusy = [];
		WL_GEAR_BUY_MENU = false;
		WL_TEMP_BUY_MENU = false;
		WL_VotePhase = 0;
		WL_linkSectorMarkers = createHashmap;
		WL_HelmetInterface = false;
		WL_ScannerUnits = [];
		WL_SpectrumInterface = false;
	};
};