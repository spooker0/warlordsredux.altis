/*
Repository for all CfgVehicle related configurations.

class CfgVehicleClassName {
    name = string;                   // Name override for vehicle in buy menu.
    description = string;            // Description override for vehicle in buy menu.

    cost = number;                   // Cost of the vehicle, not shown in buy menu if 0.
    spawn = text;                    // If the CfgVehicleClassName is a variant, this is the base class to spawn.
    variant = number (0|1);          // If the vehicle is a variant, set this to 1.
    requirements[] = array;          // Requirements for deployment (A = Airport, H = Helipad, W = Harbor).
    offset[] = array;                // Offset for placing the vehicle after buying, only valid for some vehicle types.
    textures[] = array;                  // Skin textures for the vehicle.

    rearm = number;                  // Rearm timer in seconds.
    killReward = number;             // CP reward for destroying the vehicle.
    capValue = number;               // Value of the vehicle for calculating team's sector capture strength.
    aps = number;                    // Active Protection System, 0 = none, 1 = light, 2 = medium, 3 = heavy, 4 = dazzler

    unitSpawn = number (0|1);        // For populating independent sectors, soldier units.
    vehicleSpawn = number (0|1);     // For populating independent sectors, vehicle units.
    aircraftSpawn = number (0|1);    // For populating independent sectors, aircraft units.
    garbageCollect = number (0|1);   // Whether we manually delete the vehicle when it's destroyed. For buildables.
    demolishable = number (0|1);     // Whether the vehicle can be demolished. For buildables.

    loadable = array;                // when set, the vehicle can be loaded into a flatbed. The array is the offset.
    flagOffset = array;              // when set, if the vehicle spawns a flag, its offset will use this.

    disallowMagazines[] = array;     // CfgMagazine classes to disallow in the vehicle.
    allowPylonMagazines[] = array;   // CfgMagazine classes to allow on pylons of aircraft.
    hasHMD = number (0|1);           // Whether the vehicle supports the helmet mounted display system.
    hasScanner = number (0|1);       // Whether the vehicle has a scanner.

    WLTurretDefaults[] = classes;    // Turret defaults allows replacing weapons/ammo from a turret of a vehicle.
};

Turret defaults allows replacing weapons/ammo from a turret of a vehicle.
Note: Multiple turrets can be modified by adding more classes.
Note 2: The order of operation is remove magazines, remove weapons, add magazines, add weapons. This allows for skipping reload.

class NameItAnything: WLTurretDefaults {
    turret[] = { 0 };                // Turret path to modify.
    reloadOverride = number;         // Override the reload time of the vehicle's weapons. Can only be shorter than default, and only single weapon turrets.
    hideTurret = number (0|1);       // Hide the turret.
    removeMagazines[] = {            // CfgMagazine classes to remove.
        "magazine_classname",        // Note: For now, we remove all magazines of this class from the turret.
        ...
    };
    removeWeapons[] = {};            // CfgWeapon classes to remove, same format as above.
    addMagazines[] = {};             // CfgMagazine classes to add, same format as above.
    addWeapons[] = {};               // CfgWeapon classes to add, same format as above.
};

*/

class WLTurretDefaults {};

class CfgWLRequisitionPresets {
    class A3ReduxAll {
        #include "config\west.hpp"
        #include "config\east.hpp"
        #include "config\independent.hpp"
    };
};