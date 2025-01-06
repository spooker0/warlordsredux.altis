class FixedWing {
    class I_Plane_Civil_01_F {
        name = "Caesar BTT";
        description = "Caesar BTT is a light unarmed aircraft.";
        spawn = "I_C_Plane_Civil_01_F";
        cost = 800;
        requirements[] = {"A"};
        killReward = 200;
    };

    class I_Plane_Caesar_hmggmg_01_F {
        name = "Caesar BTT (HMG/GMG)";
        description = "Caesar BTT (HMG/GMG) is a variant of the Caesar BTT armed with a HMG and GMG.";
        spawn = "I_C_Plane_Civil_01_F";
        variant = 1;
        cost = 1500;
        rearm = 300;

        requirements[] = {"A"};
        killReward = 300;
        class Gunner: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {};
            removeWeapons[] = {};
            addMagazines[] = {
                "500Rnd_127x99_mag_Tracer_Yellow",
                "500Rnd_127x99_mag_Tracer_Yellow",
                "96Rnd_40mm_G_belt",
                "96Rnd_40mm_G_belt",
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "HMG_127",
                "GMG_40mm",
                "CMFlareLauncher"
            };
        };
    };

    class I_Plane_Caesar_rocket_01_F {
        name = "Caesar BTT (Rocket)";
        description = "Caesar BTT (Rocket) is a variant of the Caesar BTT armed with rockets.";
        spawn = "I_C_Plane_Civil_01_F";
        variant = 1;
        cost = 1800;
        rearm = 400;

        requirements[] = {"A"};
        killReward = 300;
        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {};
            removeWeapons[] = {};
            addMagazines[] = {
                "14Rnd_80mm_rockets",
                "14Rnd_80mm_rockets",
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "rockets_Skyfire",
                "CMFlareLauncher"
            };
        };
    };

    class I_Plane_Caesar_bomb_01_F {
        name = "Caesar BTT (Bomb)";
        description = "Caesar BTT (Bomb) is a variant of the Caesar BTT armed with a pair of Mk82 bombs.";
        spawn = "I_C_Plane_Civil_01_F";
        variant = 1;
        cost = 2000;
        rearm = 400;

        requirements[] = {"A"};
        killReward = 300;
        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {};
            removeWeapons[] = {};
            addMagazines[] = {
                "2Rnd_Mk82",
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "Mk82BombLauncher",
                "CMFlareLauncher"
            };
        };
    };

    class I_Plane_Fighter_03_CAS_F {
        killReward = 500;
    };

    class I_Plane_Fighter_03_dynamicLoadout_F {
        cost = 15000;
        requirements[] = {"A"};
        rearm = 900;

        killReward = 500;
        aircraftSpawn = 1;
    };  // "A-143 Buzzard (CAS)"

    class I_Plane_Fighter_04_F {
        cost = 23000;
        requirements[] = {"A"};
        rearm = 900;

        killReward = 500;
        aircraftSpawn = 1;
    };  // "A-149 Gryphon"
};