class RemoteControl {
    class O_UGV_02_Demining_F {
        cost = 100;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 200;
        killReward = 100;
    };  // "UGAS demining"

    class O_UGV_01_F {
        cost = 150;
        requirements[] = {};
        offset[] = {0, 5, 0};
        killReward = 50;
    };  // "UGV Stomper"

    class O_UAV_01_F {
        cost = 500;
        requirements[] = {};
        offset[] = {0, 3, 0};
        killReward = 100;
        hasHMD = 1;
    };  // "AR-2"

    class O_UGV_01_rcws_F {
        cost = 500;
        requirements[] = {};
        offset[] = {0, 5, 0};
        rearm = 300;
        killReward = 100;
    };  // "UGAV rcws"

    class O_UAV_06_F {
        cost = 1000;
        requirements[] = {};
        offset[] = {0, 3, 0};
        killReward = 200;
    };  // "AR-6"

    class O_UAV_01_UP_F {
        name = "AR-2 Darter UP";
        description = "AR-2 Darter UP is a variant of the AR-2 Darter armed with a 45ACP SMG.";
        spawn = "O_UAV_01_F";
        variant = 1;
        cost = 1200;
        requirements[] = {};
        offset[] = {0, 3, 0};
        killReward = 200;
        rearm = 300;

        hasHMD = 1;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {};
            removeWeapons[] = {};
            addMagazines[] = {
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow"
            };
            addWeapons[] = {
                "SMG_01_F"
            };
        };
    };

    class O_UGV_01_rcws_up_F {
        name = "UGV Stomper UP";
        description = "UGV Stomper UP is a variant of the UGV Stomper armed with a 30mm autocannon.";
        spawn = "O_UGV_01_rcws_F";
        variant = 1;
        cost = 1200;
        requirements[] = {};
        offset[] = {0, 5, 0};
        rearm = 300;
        killReward = 300;

        class Gunner: WLTurretDefaults {
            turret[] = { 0 };
            removeMagazines[] = {
                "96Rnd_40mm_G_belt"
            };
            removeWeapons[] = {
                "GMG_40mm"
            };
            addMagazines[] = {
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_AP_shells",
                "60Rnd_20mm_AP_shells"
            };
            addWeapons[] = {
                "cannon_20mm"
            };
        };
    };

    class O_UAV_02_recon_F {
        cost = 2000;
        name = "K40R (Recon)";
        description = "K40R (Recon) is an unarmed variant of the K40 Ababil-3 with a powerful scanner.";
        spawn = "O_UAV_02_dynamicLoadout_F";
        requirements[] = {"A"};
        rearm = 300;
        killReward = 400;
        hasHMD = 1;
        hasScanner = 1;

        disallowMagazines[] = {
            "PylonRack_12Rnd_PG_missiles",
            "PylonRack_1Rnd_Missile_AA_04_F",
            "PylonRack_1Rnd_AAA_missiles",
            "PylonRack_1Rnd_LG_scalpel",
            "PylonRack_3Rnd_LG_scalpel",
            "PylonRack_7Rnd_Rocket_04_HE_F",
            "PylonRack_7Rnd_Rocket_04_AP_F",
            "PylonRack_12Rnd_missiles",
            "PylonMissile_1Rnd_Bomb_04_F",
            "PylonMissile_1Rnd_Mk82_F",
            "PylonRack_20Rnd_Rocket_03_HE_F",
            "PylonRack_20Rnd_Rocket_03_AP_F",
            "PylonMissile_1Rnd_LG_scalpel",
            "PylonRack_19Rnd_Rocket_Skyfire",
            "PylonMissile_1Rnd_Bomb_03_F",
            "PylonRack_1Rnd_Missile_AA_03_F"
        };
    };

    class O_T_UAV_04_CAS_F {
        cost = 6000;
        requirements[] = {"A"};
        rearm = 300;
        killReward = 600;

        hasHMD = 1;

        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {
                "120Rnd_CMFlare_Chaff_Magazine"
            };
            removeWeapons[] = {};
            addMagazines[] = {
                "240Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {};
        };
    }; // "KH-3A Fenghuang"

    class O_UAV_02_dynamicLoadout_F {
        cost = 8000;
        requirements[] = {"A"};
        rearm = 300;
        killReward = 600;

        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles"
        };
        hasHMD = 1;
    }; // "K40 Ababil-3"

    // class B_Ship_MRLS_01_F {
    //     cost = 30000;
    //     requirements[] = {};
    //     offset[] = {0, 7, 0};
    //     rearm = 2700;
    //     killReward = 700;
    // };  // "Mk41 VLS"
};