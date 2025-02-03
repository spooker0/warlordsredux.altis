class RemoteControl {
    class B_UGV_02_Demining_F {
        cost = 100;
        requirements[] = {};
        offset[] = {0, 3, 0};
        rearm = 200;
        killReward = 100;
    }; // "UGAS demining"

    class B_UGV_01_F {
        cost = 150;
        requirements[] = {};
        offset[] = {0, 5, 0};
        killReward = 50;
    }; // "UGV Stomper"

    class B_UAV_01_F {
        cost = 500;
        requirements[] = {};
        offset[] = {0, 3, 0};
        killReward = 100;
        hasHMD = 1;
    }; // AR-2

    class B_UGV_01_rcws_F {
        cost = 500;
        requirements[] = {};
        offset[] = {0, 5, 0};
        rearm = 300;
        killReward = 100;
    }; // "UGAS"

    class B_UAV_06_F {
        cost = 1000;
        requirements[] = {};
        offset[] = {0, 3, 0};
        killReward = 200;
    }; // "AR-6"

    class B_UAV_01_UP_F {
        name = "AR-2 Darter UP";
        description = "AR-2 Darter UP is a variant of the AR-2 Darter armed with a 45ACP SMG.";
        spawn = "B_UAV_01_F";
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

    class B_UGV_01_rcws_UP_F {
        name = "UGV Stomper UP";
        description = "UGV Stomper UP is a variant of the UGV Stomper armed with a 30mm autocannon.";
        spawn = "B_UGV_01_rcws_F";
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

    class B_UAV_02_recon_F {
        cost = 2000;
        name = "MQ-4R Greyhawk (Recon)";
        description = "Greyhawk (Recon) is an unarmed variant of the Greyhawk with a powerful scanner.";
        spawn = "B_UAV_02_dynamicLoadout_F";
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
            "PylonMissile_1Rnd_Mk82_F"
        };
    }; // "Greyhawk"

    class B_UAV_02_dynamicLoadout_F {
        cost = 8000;
        requirements[] = {"A"};
        rearm = 300;
        killReward = 600;
        hasHMD = 1;
    }; // "Greyhawk"

    class B_T_UAV_03_dynamicLoadout_F {
        cost = 11000;
        requirements[] = {"H"};
        rearm = 600;
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
    }; // "Falcon"

    class B_UAV_05_F {
        cost = 22500;
        requirements[] = {"A"};
        rearm = 500;
        killReward = 650;
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
    }; // "UCAV Sentinel"
};