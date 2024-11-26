class Vehicles {
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

    class I_Truck_02_transport_F {
        cost = 200;
        requirements[] = {};
        killReward = 80;
        capValue = 1;
    }; // "Zamak Transport"

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

    class I_LT_01_AT_F {
        cost = 750;
        requirements[] = {};
        rearm = 200;
        killReward = 240;
        aps = 1;
        capValue = 4;

        vehicleSpawn = 1;
    }; // "AWC Nyx (AT)"

    class B_MRAP_01_hmg_F {
        cost = 900;
        requirements[] = {};
        rearm = 300;
        killReward = 250;
        capValue = 2;
        aps = 1;
    }; // "Hunter HMG"

    class I_MRAP_03_hmg_F {
        killReward = 130;
        capValue = 3;
        vehicleSpawn = 1;
        aps = 1;
    };

    class I_MRAP_03_gmg_F {
        killReward = 130;
        capValue = 3;
        vehicleSpawn = 1;
        aps = 1;
    };

    class I_E_SAM_System_03_F {
        killReward = 300;
    };

    class I_LT_01_scout_F {
        killReward = 240;
        vehicleSpawn = 1;
        capValue = 4;
    };

    class I_LT_01_AA_F {
        killReward = 240;
        capValue = 4;
        vehicleSpawn = 1;
        aps = 1;
    };

    class I_LT_01_cannon_F {
        killReward = 240;
        capValue = 4;
        vehicleSpawn = 1;
        aps = 1;
    };

    class I_MBT_03_cannon_F {
        killReward = 400;
        capValue = 5;
        vehicleSpawn = 1;
        aps = 3;
    };

    class I_APC_Wheeled_03_cannon_F {
        killReward = 400;
        capValue = 5;
        vehicleSpawn = 1;
        aps = 2;
    };

    class I_APC_tracked_03_cannon_F {
        killReward = 400;
        capValue = 5;
        vehicleSpawn = 1;
        aps = 3;
    };
};