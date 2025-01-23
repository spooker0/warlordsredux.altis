class CfgFunctions {
	class MRTM {
		class Default {
			file = "scripts\MRTM";
			class onChar {};
			class onSliderChanged {};
			class openMenu {};
			class settingsInit {};
			class settingsMenu {};
			class updateSettings {};
			class updateViewDistance {};
		};
		class Debug {
			file = "scripts\MRTMDebug";
			class execCode {};
			class openDebugMenu {};
			class setReturnValue {};
		};
	};
	class GFE {
		class Default {
			file = "scripts\GF_Earplugs";
			class credits {};
			class earplugs {};
		};
	};
	class APS {
		class Default {
			file = "scripts\APS\Scripts";
			class defineVehicles {};
		};
		class APS {
			file = "scripts\APS\Scripts\APS";
			class setupProjectiles {};
			class firedProjectile {};
			class serverHandleAPS {};
		};
		class Management {
			file = "scripts\APS\Scripts\Management";
			class rearmAPS {};
			class registerVehicle {};
		};
		class Misc {
			file = "scripts\APS\Scripts\Misc";
			class active {};
			class getDirection {};
			class hasCharges {};
			class misguideMissile {};
			class relDir2 {};
			class getMaxAmmo {};
		};
		class Report {
			file = "scripts\APS\Scripts\Report";
			class report {};
		};
	};
	class DIS {
		class SAM {
			file = "scripts\DIS";
			class check {};
			class frag {};
			class maneuver {};
			class missileCamera {};
			class onSamFired {};
			class registerLauncher {};
			class startMissileCamera {};
		};
	};
	class Fxr {
		class Default {
			file = "scripts\Fxr";
			class openReportMenu {};
			class closeReportMenu {};
		};
	};
	class SQD {
		class Default {
			file = "scripts\Squads";
			class client {};
			class initClient {};
			class initServer {};
			class menu {};
			class playerSelectionChanged {};
			class server {};
			class treeSelectionChanged {};
			class voice {};
		};
	};
	class WL2 {
		class Client {
			file = "core\client";
			class airburst {};
			class announcer {};
			class avTerminal {};
			class betty {};
			class clientEH {};
			class cpBalance {};
			class factionBasedClientInit {};
			class forfeitHandle {};
			class handleBuyMenuKeypress {};
			class handleKeypress {};
			class hintHandle {};
			class initClient {};
			class interceptAction {};
			class mineLimitHint {};
			class onPause {};
			class pingFix {};
			class pingFixInit {};
			class playerEventHandlers {};
			class prepareRappel {};
			class prompt {};
			class rappel {};
			class repackMagazines {};
			class revive {};
			class rita {};
			class scanner {};
			class sideToFaction {};
			class spectrumAction {};
			class teammatesAvailability {};
			class timer {};
			class triggerPurchase {};
			class wasMain {};
			class welcome {};
			class zoneRestrictionHandleClient {};
		};
		class ClientAction {
			file = "core\client\action";
			class arsenalSetup {};
			class attachVehicle {};
			class buyMenuAction {};
			class catapultAction {};
			class catapultActionEligibility {};
			class claimAction {};
			class claimEligibility {};
			class dazzlerAction {};
			class dazzlerToggle {};
			class dazzlerUpdate {};
			class demolish {};
			class deployableAddAction {};
			class deployableEligibility {};
			class jammerAction {};
			class jammerToggle {};
			class jammerUpdate {};
			class logisticsAddAction {};
			class parachuteAction {};
			class parachuteSetup {};
			class radarOperateAction {};
			class radarOperateUpdate {};
			class radarRotateAction {};
			class radarRotateUpdate {};
			class rearmAction {};
			class removeAction {};
			class repairAction {};
			class repairActionEligibility {};
			class respawnBagAction {};
			class reviveAction {};
			class slingAddAction {};
			class stabilizeBoatAction {};
			class vehicleLockAction {};
			class vehicleLockUpdate {};
		};
		class ClientDraw {
			file = "core\client\draw";
			class drawJammerCircle {};
			class getDir {};
			class getPos {};
			class helmetInterface {};
			class iconColor {};
			class iconDrawGPS {};
			class iconDrawMap {};
			class iconSize {};
			class iconText {};
			class iconTextSectorScan {};
			class iconType {};
			class mapIcons {};
			class refreshCurrentTargetData {};
			class refreshOSD {};
			class sceneDrawHandle {};
			class setOSDEvent {};
			class setupUI {};
			class smoothText {};
			class uavJammer {};
			class updateJammerMarkers {};
		};
		class ClientKill {
			file = "core\client\kill";
			class askForgiveness {};
			class deathInfo {};
			class friendlyFireHandleClient {};
			class handleKillFeedUpdate {};
			class killRewardClient {};
			class updateKillFeed {};
		};
		class ClientMap {
			file = "core\client\map";
			class addTargetMapButton {};
			class assetButtonAccessControl {};
			class assetButtonDazzler {};
			class assetButtonJammer {};
			class assetButtonRadarOperate {};
			class assetButtonRadarRotate {};
			class assetMapButtons {};
			class assetMapControl {};
			class captureList {};
			class deleteAssetFromMap {};
			class getRespawnMarkers {};
			class getSideBase {};
			class groupIconClickHandle {};
			class groupIconEnterHandle {};
			class groupIconLeaveHandle {};
			class handleEnemyCapture {};
			class handleSelectionState {};
			class mapButtonConditions {};
			class mapControlHandle {};
			class sectorCaptureStatus {};
			class sectorMapButtons {};
			class sectorMarkerUpdate {};
			class sectorOwnershipHandleClient {};
			class sectorRevealHandle {};
			class sectorScanHandle {};
			class sectorsInitClient {};
			class sectorVoteClient {};
			class sectorVoteDisplay {};
			class selectedTargetsHandle {};
			class targetResetHandle {};
			class targetResetHandleVote {};
			class targetSelected {};
			class updateSelectionState {};
		};
		class ClientOrder {
			file = "core\client\order";
			class cancelVehicleOrder {};
			class deployment {};
			class executeFastTravel {};
			class fastTravelConflictMarker {};
			class orderAircraft {};
			class orderArsenal {};
			class orderFastTravel {};
			class orderForfeit {};
			class orderFTPodFT {};
			class orderFTVehicleFT {};
			class orderFundsTransfer {};
			class orderLastLoadout {};
			class orderNaval {};
			class orderSavedLoadout {};
			class orderSectorScan {};
			class orderVehicle {};
			class requestPurchase {};
		};
		class ClientPurchase {
			file = "core\client\purchase";
			class checkAlliedPlayers {};
			class checkAssetLimit {};
			class checkBuyRespawn {};
			class checkCarrierHeavy {};
			class checkCommTower {};
			class checkDead {};
			class checkFastTravelRespawn {};
			class checkFastTravelSL {};
			class checkFunds {};
			class checkGreenSwitch {};
			class checkGroundVehicleDriver {};
			class checkIndependents {};
			class checkInfantryAvailable {};
			class checkInFriendlySector {};
			class checkInventoryOpen {};
			class checkIsOrdering {};
			class checkLastLoadout {};
			class checkNearbyEnemies {};
			class checkParadropCooldown {};
			class checkPlayerInVehicle {};
			class checkRequirements {};
			class checkResetSectorTimer {};
			class checkResetVehicle {};
			class checkSavedLoadout {};
			class checkSelectedUnits {};
			class checkSurrender {};
			class checkTargetEnemyBase {};
			class checkTargetSelected {};
			class checkTargetUnlinked {};
			class checkTent {};
			class checkTentAction {};
			class checkUAVLimit {};
			class purchaseMenuAssetAvailability {};
			class purchaseMenuGetUIScale {};
			class purchaseMenuHandleDLC {};
			class purchaseMenuRefresh {};
			class purchaseMenuSetAssetDetails {};
			class purchaseMenuSetItemsList {};
		};
		class Common {
			file = "core\common";
			class accessControl {};
			class cleanupCarrier {};
			class findSpawnPositions {};
			class getAssetSide {};
			class getAssetTypeName {};
			class getMagazineName {};
			class getMoneySign {};
			class getVehicleWeapons {};
			class grieferCheck {};
			class handleInstigator {};
			class handleRespawnMarkers {};
			class income {};
			class initCommon {};
			class lastHitHandler {};
			class missionEndHandle {};
			class newAssetHandle {};
			class parsePurchaseList {};
			class reloadOverride {};
			class slingloadInit {};
			class sortSectorArrays {};
			class tablesSetUp {};
			class uavConnectRefresh {};
			class updateSectorArrays {};
			class varsInit {};
		};
		class Server {
			file = "core\server";
			class assetRelevanceCheck {};
			class attachDetach {};
			class calcImbalance {};
			class changeSectorOwnership {};
			class createUAVCrew {};
			class createVehicleCorrectly {};
			class dazzlerOn {};
			class detectNewPlayers {};
			class forfeitHandleServer {};
			class forgiveTeamkill {};
			class friendlyFireHandleServer {};
			class fundsDatabaseUpdate {};
			class fundsDatabaseWrite {};
			class garbageCollector {};
			class handleClientRequest {};
			class handleEntityRemoval {};
			class incomePayoff {};
			class initServer {};
			class killRewardHandle {};
			class processRunways {};
			class selectTarget {};
			class serverEHs {};
			class setupNewWarlord {};
			class targetResetHandleServer {};
			class targetSelectionHandleServer {};
			class updateVehicleList {};
			class WLAC {};
			class zoneRestrictionHandleServer {};
		};
		class ServerSector {
			file = "core\server\sector";
			class getCapValues {};
			class populateSector {};
			class populateCarrierSector {};
			class sectorCaptureHandle {};
			class sectorsInitServer {};
		};
		class ServerOrder {
			file = "core\server\order";
			class orderAir {};
			class orderGround {};
			class orderWater {};
			class processOrder {};
		};
	};
	class WLC {
		class Default {
			file = "scripts\WLC";
			class action {};
			class buildAmmo {};
			class buildAttachments {};
			class buildMenu {};
			class clientEquip {};
			class getLevelInfo {};
			class init {};
			class levelUp {};
			class onButtonSelect {};
			class onRespawn {};
			class onSelection {};
			class serverRequest {};
			class setScore {};
			class updateItemCost {};
		};
	};
	class WLM {
		class WLM {
			file = "Scripts\WLM\functions";
			class applyCustomization {};
			class applyLoadoutAircraft {};
			class applyLoadoutVehicle {};
			class applyTexture {};
			class applyPylon {};
			class applyVehicle {};
			class calculateFreeRearmEligibility {};
			class changeHorn {};
			class constructAircraftPylons {};
			class constructPresetMenu {};
			class constructVehicleMagazine {};
			class getMagazineTooltip {};
			class initMenu {};
			class menuTextOverrides {};
			class moveSmokes {};
			class rearmAircraft {};
			class rearmVehicle {};
			class saveLoadout {};
			class selectLoadout {};
			class startRearmVehicle {};
			class switchUser {};
			class textureLists {};
			class textureSlots {};
			class wipePylonSaves {};
		};
	};
};