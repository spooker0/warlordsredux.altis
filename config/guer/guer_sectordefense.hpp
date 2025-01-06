class SectorDefense {
    class Land_Razorwire_F {
        cost = 50;
        requirements[] = {};
        offset[] = {0, 5, 0};
        killReward = 30;
        structure = 1;
    };  // "Razor Wire Fence"

    class Land_BagFence_Round_F {
        cost = 50;
        requirements[] = {};
        offset[] = {0, 2, 0};
        killReward = 30;
        demolishable = 1;
    };  // "Semi Circle Sand bags"

    class Land_DragonsTeeth_01_4x2_new_F {
        cost = 50;
        requirements[] = {};
        offset[] = {0, 5, 0};
        killReward = 30;
        demolishable = 1;
        structure = 1;
    };  // "Tank barrier"

    class Land_HBarrierWall6_F {
        cost = 60;
        requirements[] = {};
        offset[] = {0, 3, 0};
        killReward = 30;
        demolishable = 1;
        structure = 1;
    }; // "H-barrier wall"

    class CamoNet_INDP_big_F {
        cost = 100;
        requirements[] = {};
        offset[] = {0, 6, 0};
        killReward = 30;
        garbageCollect = 1;
        structure = 1;
    };  // "Camouflage Vehicle Cover (Hex)"

    class I_HMG_01_F {
        cost = 150;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 300;
        killReward = 100;
        loadable[] = {0, -2.5, 0.4};

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green"
            };
            addWeapons[] = {
                "HMG_static"
            };
        };
    };  // "Mk30 HMG .50"

    class Land_IRMaskingCover_01_F {
        cost = 200;
        requirements[] = {};
        offset[] = {0, 8, 0};
        killReward = 30;
        garbageCollect = 1;
        structure = 1;
    };  // "IR Masking Tent (Large)"

    class I_HMG_01_high_F {
        cost = 200;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 300;
        killReward = 100;
        loadable[] = {0, -2.5, 0.8};

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green"
            };
            addWeapons[] = {
                "HMG_static"
            };
        };
    };  // "Mk30 HMG .50 (Raised)"

    class I_GMG_01_F {
        cost = 200;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 300;
        killReward = 100;
        loadable[] = {0, -2.5, 0.4};
    };  // "Mk32 GMG 20 mm"

    class I_GMG_01_high_F {
        cost = 250;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 300;
        killReward = 100;
        loadable[] = {0, -2.5, 0.8};
    };  // "Mk32 GMG 20 mm (Raised)"

    class I_static_AA_F {
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
    };  // "Static Titan Launcher (AA) [AAF]"

    class I_static_AT_F {
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
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles",
                "1Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan_static"
            };
        };
    };  // "Static Titan Launcher (AT) [AAF]"

    class I_HMG_01_A_F {
        name = "Mk30 HMG Auto Turret";
        cost = 500;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 300;
        killReward = 150;
        loadable[] = {0, -2.5, 0.4};

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "HMG_static"
            };
            addMagazines[] = {
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green",
                "100Rnd_127x99_mag_Tracer_Green"
            };
            addWeapons[] = {
                "HMG_static"
            };
        };
    };

    class I_static_AT_UP_F {
        name = "Static AT Launcher (UP)";
        description = "Static AT Launcher (UP) is an upgraded variant of the Static AT Launcher.";
        spawn = "I_static_AT_F";
        variant = 1;
        cost = 590;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 300;
        killReward = 200;
        loadable[] = {0, -2.5, 0.2};

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            reloadOverride = 6;
            removeMagazines[] = {
                "1Rnd_GAT_missiles"
            };
            removeWeapons[] = {
                "missiles_titan_static"
            };
            addMagazines[] = {
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles",
                "2Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan"
            };
        };

        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
    };

    class I_static_AA_UP_F {
        name = "Static AA Launcher (UP)";
        description = "Static AA Launcher (UP) is an upgraded variant of the Static AA Launcher.";
        spawn = "I_static_AA_F";
        variant = 1;
        cost = 600;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 300;
        killReward = 200;
        loadable[] = {0, -2.5, 0.2};

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "1Rnd_GAA_missiles"
            };
            removeWeapons[] = {
                "missiles_titan_static"
            };
            addMagazines[] = {
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles",
                "4Rnd_70mm_SAAMI_missiles"
            };
            addWeapons[] = {
                "missiles_SAAMI"
            };
        };
    };

    class I_GMG_01_A_F {
        name = "Mk32 GMG Auto Turret";
        cost = 650;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 300;
        killReward = 150;
        loadable[] = {0, -2.5, 0.4};
    };

    class Land_Communication_F {
        name = "Jamming Tower";
        description = "Jamming Tower can be used to jam enemy autonomous assets. It must be placed outside the home base in an owned sector.";
        cost = 2500;
        requirements[] = {};
        offset[] = {0, 6, 0};
        killReward = 400;
        garbageCollect = 1;
        demolishable = 1;
        structure = 1;
    };

    class I_Mortar_01_F {
        cost = 4000;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 900;
        killReward = 125;
        loadable[] = {0, -2.5, 0};
    };  // "Mortar"
};