class GUER {
    #include "guer\guer_infantry.hpp"
    #include "guer\guer_vehicles.hpp"

    class Naval {
        class C_Scooter_Transport_01_F {
            cost = 50;
            requirements[] = {"W"};
            killReward = 20;
        };	// "Water scooter"
    };

    class Gear {
        class Box_NATO_Ammo_F {
            cost = 50;
            requirements[] = {};
            killReward = 40;
        }; // "Basic Ammo [NATO]"
    };

    class Defences {
        class Land_Razorwire_F {
            cost = 50;
            requirements[] = {};
            offset[] = {0, 5, 0};
            killReward = 30;
            structure = 1;
        }; // "Razor Wire Fence"
    };

    class Aircraft {
        class I_Heli_light_03_F {
            killReward = 300;
            cost = 10;
        };

        class I_Plane_Fighter_03_CAS_F {
            killReward = 500;
        };

        class I_Plane_Fighter_03_dynamicLoadout_F {
            killReward = 500;
            aircraftSpawn = 1;
        };

        class I_Heli_light_03_dynamicLoadout_F {
            killReward = 300;
            aircraftSpawn = 1;
        };

        class I_Plane_Fighter_04_F {
            killReward = 500;
            aircraftSpawn = 1;
        };
    };
};