class FixedWing {
    class O_Plane_Civil_01_F {
        cost = 800;
        description = "Caesar BTT is a light unarmed aircraft.";
        killReward = 200;
        name = "Caesar BTT";
        requirements[] = {"A"};
        spawn = "C_Plane_Civil_01_F";
    };

    // class O_Plane_Caesar_hmggmg_01_F {
    //     cost = 1500;
    //     description = "Caesar BTT (HMG/GMG) is a variant of the Caesar BTT armed with a HMG and GMG.";
    //     killReward = 300;
    //     name = "Caesar BTT (HMG/GMG)";
    //     rearm = 300;
    //     requirements[] = {"A"};
    //     spawn = "C_Plane_Civil_01_F";
    //     variant = 1;
    //
    //     class Gunner: WLTurretDefaults {
    //         addMagazines[] = {
    //             "500Rnd_127x99_mag_Tracer_Yellow",
    //             "500Rnd_127x99_mag_Tracer_Yellow",
    //             "96Rnd_40mm_G_belt",
    //             "96Rnd_40mm_G_belt",
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "HMG_127",
    //             "GMG_40mm",
    //             "CMFlareLauncher"
    //         };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {};
    //         turret[] = { -1 };
    //     };
    // };

    class O_Plane_Caesar_rocket_01_F {
        cost = 1800;
        description = "Caesar BTT (Rocket) is a variant of the Caesar BTT armed with rockets.";
        killReward = 300;
        name = "Caesar BTT (Rocket)";
        rearm = 400;
        requirements[] = {"A"};
        spawn = "C_Plane_Civil_01_F";
        variant = 1;

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "14Rnd_80mm_rockets",
                "14Rnd_80mm_rockets",
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "rockets_Skyfire",
                "CMFlareLauncher"
            };
            removeMagazines[] = {};
            removeWeapons[] = {};
            turret[] = { -1 };
        };
    };

    // class O_Plane_Caesar_bomb_01_F {
    //     cost = 2000;
    //     description = "Caesar BTT (Bomb) is a variant of the Caesar BTT armed with a pair of Mk82 bombs.";
    //     killReward = 300;
    //     name = "Caesar BTT (Bomb)";
    //     rearm = 400;
    //     requirements[] = {"A"};
    //     spawn = "C_Plane_Civil_01_F";
    //     variant = 1;
    //
    //     class Pilot: WLTurretDefaults {
    //         addMagazines[] = {
    //             "2Rnd_Mk82",
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "Mk82BombLauncher",
    //             "CMFlareLauncher"
    //         };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {};
    //         turret[] = { -1 };
    //     };
    // };

    class O_T_VTOL_02_recon_F {
        cost = 3800;
        description = "Y-32 Xi'an (AWACS) is a variant of the Y-32 Xi'an with a powerful air radar.";
        hasAWACS = 1;
        hasHMD = 1;
        killReward = 500;
        name = "Y-32 Xi'an (AWACS)";
        requirements[] = {"A"};
        spawn = "O_T_VTOL_02_infantry_dynamicLoadout_F";

        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {
                "168Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {
                "CMFlareLauncher_Triples"
            };
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
        };

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "250Rnd_30mm_HE_shells_Tracer_Green",
                "250Rnd_30mm_APDS_shells_Tracer_Green"
            };
            removeWeapons[] = {
                "gatling_30mm_VTOL_02"
            };
            addMagazines[] = {};
            addWeapons[] = {};
        };

        disallowMagazines[] = {
            "PylonMissile_1Rnd_LG_scalpel",
            "PylonRack_3Rnd_LG_scalpel",
            "PylonRack_4Rnd_LG_scalpel",
            "PylonWeapon_300Rnd_20mm_shells",
            "PylonRack_20Rnd_Rocket_03_HE_F",
            "PylonRack_20Rnd_Rocket_03_AP_F",
            "PylonRack_19Rnd_Rocket_Skyfire",
            "PylonRack_1Rnd_Missile_AA_03_F",
            "PylonRack_1Rnd_Missile_AGM_01_F",
            "PylonMissile_1Rnd_Bomb_03_F",
            "PylonMissile_1Rnd_BombCluster_02_F"
        };
    };

    class O_T_VTOL_02_infantry_dynamicLoadout_F {
        cost = 14000;
        killReward = 600;
        rearm = 700;
        requirements[] = {"A"};
    }; // "Y-32 Xi'an (Infantry Transport)"

    class O_Plane_Fighter_03_dynamicLoadout_F {
        cost = 15000;
        description = "A-143 Buzzard is a light CAS aircraft.";
        killReward = 600;
        name = "A-143 Buzzard";
        rearm = 900;
        requirements[] = {"A"};
        spawn = "I_Plane_Fighter_03_dynamicLoadout_F";
        textures[] = {
            "\a3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_1_brownhex_CO.paa",
            "\a3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_2_brownhex_CO.paa"
        };

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {};
            removeMagazines[] = {
                "120Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {};
            turret[] = { -1 };
        };
    }; // "A-143 Buzzard"

    class O_Plane_CAS_02_dynamicLoadout_F {
        cost = 20000;
        killReward = 900;
        rearm = 900;
        requirements[] = {"A"};

        class Pilot: WLTurretDefaults {
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {};
            removeMagazines[] = {
                "120Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {};
            turret[] = { -1 };
        };
    }; // "To-199 Neophron (CAS)"

    class O_Plane_Fighter_02_Stealth_F {
        allowPylonMagazines[] = {
            "PylonMissile_Missile_KH58_INT_x1"
        };
        cost = 28000;
        disallowMagazines[] = {
            "PylonMissile_Missile_KH58_x1"
        };
        killReward = 1100;
        rearm = 900;
        requirements[] = {"A"};
    }; // "To-201 Shikra (Stealth)"

    class O_Plane_Fighter_02_F {
        allowPylonMagazines[] = {
            "PylonMissile_Missile_KH58_INT_x1"
        };
        cost = 32000;
        disallowMagazines[] = {
            "PylonMissile_Missile_KH58_x1"
        };
        killReward = 1100;
        rearm = 900;
        requirements[] = {"A"};
    }; // "To-201 Shikra"
};