class AirDefense {
    class B_static_AA_F {
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
    }; // "Static Titan Launcher (AA) [NATO]"

    class B_Radar_System_01_F {
        description = "Long range radar system, capable of detecting and tracking vehicles within line of sight at up to 16km.";
        cost = 1000;
        requirements[] = {};
        offset[] = {0, 7, 0};
        killReward = 350;
        loadable[] = {0, 0, 1};
    }; // "AN/MPQ-105 Radar"

    class B_AAA_System_01_F {
        description = "Short range air defense artillery with a high rate of fire. Effective range: 3km.";
        cost = 3500;
        requirements[] = {};
        offset[] = {0, 5.3, 0};
        rearm = 300;
        killReward = 400;
        loadable[] = {0, -1, 1.7};
    }; // "Praetorian 1C"

    class B_APC_Tracked_01_AA_E_F {
        name = "IFV-SAAMI Jaguar";
        description = "IFV-SAAMI Jaguar is a variant of the IFV-6a Cheetah armed with SAAMI missiles.";
        spawn = "B_APC_Tracked_01_AA_F";
        variant = 1;
        cost = 4500;
        requirements[] = {};
        rearm = 450;
        killReward = 300;
        capValue = 4;
        aps = 2;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Red"
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
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "missiles_SAAMI"
            };
        };
    };

    class B_APC_Tracked_01_AA_F {
        cost = 5000;
        requirements[] = {};
        rearm = 500;
        killReward = 350;
        capValue = 4;
        aps = 2;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "4Rnd_Titan_long_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            addMagazines[] = {
                "4Rnd_GAA_missiles",
                "4Rnd_GAA_missiles",
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "missiles_titan_AA"
            };
        };
    }; // "IFV-6a Cheetah"

    class B_SAM_System_03_F {
        description = "Long range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: >10km.";
        cost = 8000;
        requirements[] = {};
        offset[] = {0, 6, 0};
        rearm = 450;
        killReward = 500;
        loadable[] = {0, 0, 1};
    }; // "MIM-145 Defender"

    class B_APC_Tracked_01_AA_UP_F {
        name = "IFV-6X Puma";
        description = "IFV-6X Puma is a variant of the IFV-6a Cheetah armed with Defender missiles.";
        spawn = "B_APC_Tracked_01_AA_F";
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
                "4Rnd_Titan_long_missiles"
            };
            removeWeapons[] = {
                "missiles_titan_AA",
                "autocannon_35mm"
            };
            addMagazines[] = {
                "magazine_Missile_mim145_x4",
                "680Rnd_35mm_AA_shells_Tracer_Red"
            };
            addWeapons[] = {
                "autocannon_35mm",
                "weapon_mim145Launcher"
            };
        };
    };

    class B_SAM_System_01_F {
        description = "Short range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: 4km.";
        cost = 10000;
        requirements[] = {};
        offset[] = {0, 5.3, 0};
        rearm = 600;
        killReward = 500;
        loadable[] = {0, -2, 0.8};
    }; // "Mk49 Spartan"

    class B_SAM_System_02_F {
        description = "Medium range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: ~10km.";
        cost = 15000;
        requirements[] = {};
        offset[] = {0, 5.3, 0};
        rearm = 600;
        killReward = 600;
        loadable[] = {0, -2, 1};
    }; // "Mk21 Centurion"
};