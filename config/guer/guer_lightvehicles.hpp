class LightVehicles {
    class I_Quadbike_01_F {
        cost = 20;
        requirements[] = {};
        killReward = 20;
        capValue = 1;
    }; // "Quad Bike"

    class I_G_Offroad_01_armed_F {
        cost = 150;
        requirements[] = {};
        rearm = 120;
        killReward = 150;
        capValue = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {};
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow",
                "100Rnd_127x99_mag_Tracer_Yellow"
            };
            addWeapons[] = {};
        };
    }; // "Offroad (HMG)"

    class I_C_Offroad_02_LMG_F {
        cost = 200;
        requirements[] = {};
        rearm = 120;
        killReward = 150;
        capValue = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {};
            addMagazines[] = {
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_F"
            };
            addWeapons[] = {};
        };
    }; // "MB 4WD (LMG)"

    class I_MRAP_03_F {
        cost = 300;
        requirements[] = {};
        killReward = 70;
        capValue = 1;
    }; // "Strider"

    class B_Truck_01_flatbed_F {
        cost = 500;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "HEMTT Flatbed"

    class I_C_Offroad_02_AT_F {
        cost = 500;
        requirements[] = {};
        rearm = 180;
        killReward = 180;
        capValue = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {};
            addMagazines[] = {
                "12Rnd_SPG9_HEAT"
            };
            addWeapons[] = {};
        };
    }; // "MB 4WD (AT)"

    class I_MRAP_03_hmg_F {
        cost = 900;
        requirements[] = {};
        rearm = 300;

        killReward = 250;
        capValue = 3;
        vehicleSpawn = 1;
        aps = 1;
    };

    class I_MRAP_03_gmg_F {
        cost = 1200;
        requirements[] = {};
        rearm = 300;

        killReward = 250;
        capValue = 3;
        vehicleSpawn = 1;
        aps = 1;
    };
};