class RotaryWing {
    class O_Heli_Transport_04_covered_F {
        cost = 400;
        requirements[] = {"H"};
        offset[] = {0, 10, 0};
        killReward = 100;
    }; // "Mi-290 Taru (Transport)"

    class O_Heli_Transport_04_F {
        cost = 500;
        requirements[] = {"H"};
        offset[] = {0, 10, 0};
        killReward = 100;
    }; // "Mi-290 Taru"

    class O_Heli_Transport_04_medevac_F {
        cost = 500;
        requirements[] = {"H"};
        offset[] = {0, 10, 0};
        killReward = 100;
    }; // "Mi-290 Taru (Medical)"

    class O_Heli_Light_02_unarmed_F {
        cost = 500;
        requirements[] = {"H"};
        offset[] = {0, 10, 0};
        killReward = 125;
        hasHMD = 1;
    }; // "PO-30 Orca (Unarmed)"

    // class O_Heli_Transport_04_recon_F {
    //     name = "Mi-290 Taru (Recon)";
    //     description = "Mi-290 Taru (Recon) is a variant of the Mi-290 Taru with a powerful scanner.";
    //     spawn = "O_Heli_Transport_04_box_F";
    //     cost = 2500;
    //     requirements[] = {"H"};
    //     offset[] = {0, 10, 0};
    //     killReward = 125;
    //     hasHMD = 1;
    //     hasScanner = 1;
    //     class Pilot: WLTurretDefaults {
    //         turret[] = { -1 };
    //         removeMagazines[] = {
    //             "168Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         removeWeapons[] = {
    //             "CMFlareLauncher"
    //         };
    //         addMagazines[] = {
    //             "240Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles"
    //         };
    //     };
    // };

    class O_Heli_Transport_02_AWACS_F {
        name = "CH-49 Mohawk (AWACS)";
        description = "CH-49 Mohawk (AWACS) is a variant of the CH-49 Mohawk with a powerful air radar.";
        spawn = "I_Heli_Transport_02_F";
        cost = 3800;
        requirements[] = {"H"};
        offset[] = {0, 10, 0};
        textures[] = {
            "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_1_DAHOMAN_CO.paa",
            "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_2_DAHOMAN_CO.paa",
            "A3\Air_F_Beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_3_DAHOMAN_CO.paa",
            "A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_int_02_CO.paa"
        };
        killReward = 300;
        hasHMD = 1;
        hasAWACS = 1;
    };

    class O_Heli_Light_02_dynamicLoadout_F {
        cost = 4000;
        requirements[] = {"H"};
        offset[] = {0, 10, 0};
        killReward = 300;
        rearm = 300;
    }; // "PO-30 Orca"

    class O_Heli_Attack_02_dynamicLoadout_F {
        cost = 10000;
        requirements[] = {"H"};
        offset[] = {0, 11, 0};
        rearm = 700;
        killReward = 550;

        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles",
            "PylonMissile_Missile_KH58_INT_x1"
        };
        hasHMD = 1;

        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = { };
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
        };
    }; // "Mi-48 Kajman"

    // class O_Heli_Attack_02_sead_F {
    //     name = "Mi-48 Kajman (SEAD)";
    //     spawn = "O_Heli_Attack_02_dynamicLoadout_F";
    //     cost = 12000;
    //     requirements[] = {"H"};
    //     offset[] = {0, 11, 0};
    //     rearm = 700;
    //     killReward = 550;
    //     variant = 1;

    //     disallowMagazines[] = {
    //         "PylonMissile_1Rnd_LG_scalpel",
    //         "PylonRack_3Rnd_LG_scalpel",
    //         "PylonRack_4Rnd_LG_scalpel",
    //         "PylonWeapon_300Rnd_20mm_shells",
    //         "PylonRack_20Rnd_Rocket_03_HE_F",
    //         "PylonRack_20Rnd_Rocket_03_AP_F",
    //         "PylonRack_19Rnd_Rocket_Skyfire",
    //         "PylonRack_1Rnd_Missile_AA_03_F",
    //         "PylonRack_1Rnd_Missile_AGM_01_F",
    //         "PylonMissile_1Rnd_Bomb_03_F",
    //         "PylonMissile_1Rnd_BombCluster_02_F"
    //     };
    //     hasHMD = 1;

    //     class Pilot: WLTurretDefaults {
    //         turret[] = { -1 };
    //         removeMagazines[] = {
    //             "192Rnd_CMFlare_Chaff_Magazine"
    //         };
    //         removeWeapons[] = {
    //             "CMFlareLauncher"
    //         };
    //         addMagazines[] = {
    //             "240Rnd_CMFlare_Chaff_Magazine",
    //             "240Rnd_CMFlare_Chaff_Magazine",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1",
    //             "magazine_Missile_KH58_x1"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles",
    //             "weapon_KH58Launcher"
    //         };
    //     };
    // };
};