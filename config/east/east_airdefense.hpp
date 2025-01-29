class AirDefense {
    class O_static_AA_F {
        cost = 300;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 300;
        killReward = 100;
        loadable[] = {0, -2.5, 0.2};

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "missiles_titan_static"
            };
            addMagazines[] = {
                "1Rnd_GAA_missiles",
                "1Rnd_GAA_missiles",
                "1Rnd_GAA_missiles",
                "1Rnd_GAA_missiles",
                "1Rnd_GAA_missiles",
                "1Rnd_GAA_missiles"
            };
            addWeapons[] = {
                "missiles_titan_static"
            };
        };
    };  // "Static Titan Launcher (AA) [CSAT]"

    class O_Radar_System_02_F {
        description = "Long range radar system, capable of detecting and tracking vehicles within line of sight at up to 16km.";
        cost = 1000;
        requirements[] = {};
        offset[] = {0, 7, 0};
        killReward = 350;
        loadable[] = {0, 0, 1};
    };  // "R-750 Cronus Radar"

    class O_AAA_System_01_F {
        name = "Praetorian 1C";
        description = "Short range air defense artillery with a high rate of fire. Effective range: 3km.";
        spawn = "B_AAA_System_01_F";
        cost = 3500;
        requirements[] = {};
        textures[] = {
            "a3\static_f_jets\aaa_system_01\data\aaa_system_01_olive_co.paa",
            "a3\static_f_jets\aaa_system_01\data\aaa_system_02_olive_co.paa"
        };
        offset[] = {0, 5.3, 0};
        rearm = 300;
        killReward = 400;
        loadable[] = {0, -1, 1.7};
    };

    class O_APC_Tracked_02_AA_E_F {
        name = "ZSU-38 Yangtze";
        description = "ZSU-38 Yangtze is a variant of the ZSU-39 Tigris armed with SAAMI missiles.";
        spawn = "O_APC_Tracked_02_AA_F";
        variant = 1;
        cost = 4500;
        requirements[] = {};
        rearm = 450;
        killReward = 600;
        capValue = 4;
        aps = 2;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles_O",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            addMagazines[] = {
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "missiles_SAAMI"
            };
        };
    };

    class O_APC_Tracked_02_AA_F {
        cost = 5000;
        requirements[] = {};
        rearm = 500;
        killReward = 350;
        capValue = 4;
        aps = 2;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles_O",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            addMagazines[] = {
                "4Rnd_GAA_missiles",
                "4Rnd_GAA_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "missiles_titan_AA"
            };
        };
    }; // "ZSU-39 Tigris"

    class O_SAM_System_04_F {
        description = "Long range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: >10km.";
        cost = 8000;
        requirements[] = {};
        offset[] = {0, 6, 0};
        rearm = 450;
        killReward = 500;
        loadable[] = {0, 0, 1};
    };  // "S-750 Rhea"

    class O_APC_Tracked_02_AA_M_F {
        name = "ZSU-49 Euphrates";
        description = "ZSU-49 Euphrates is a variant of the ZSU-39 Tigris armed with Rhea missiles.";
        spawn = "O_APC_Tracked_02_AA_F";
        variant = 1;
        cost = 9000;
        requirements[] = {};
        rearm = 450;
        killReward = 600;
        capValue = 4;
        aps = 2;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles_O"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            addMagazines[] = {
                "magazine_Missile_s750_x4",
                "680Rnd_35mm_AA_shells_Tracer_Green"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "weapon_s750Launcher"
            };
        };
    };

    class O_SAM_System_01_F {
        name = "Mk49 Spartan";
        description = "Short range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: 4km.";
        spawn = "B_SAM_System_01_F";
        cost = 10000;
        requirements[] = {};
        textures[] = {
            "A3\Static_F_Jets\SAM_System_01\Data\SAM_system_01_olive_co.paa"
        };
        offset[] = {0, 5.3, 0};
        rearm = 600;
        killReward = 500;
        loadable[] = {0, -2, 0.8};
    };

    class O_SAM_System_02_F {
        name = "Mk21 Centurion";
        description = "Medium range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: ~10km.";
        spawn = "B_SAM_System_02_F";
        cost = 15000;
        requirements[] = {};
        textures[] = {
            "A3\Static_F_Jets\SAM_System_02\Data\SAM_system_02_olive_co.paa"
        };
        offset[] = {0, 5.3, 0};
        rearm = 600;
        killReward = 600;
        loadable[] = {0, -2, 1};
    };
};