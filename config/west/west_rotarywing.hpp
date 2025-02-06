class RotaryWing {
    class B_Heli_Light_01_F {
        cost = 300;
        requirements[] = {"H"};
        killReward = 100;
    }; // "MH-9 Hummingbird"

    class B_Heli_Transport_01_F {
        cost = 800;
        requirements[] = {"H"};
        offset[] = {0, 11, 0};
        killReward = 100;
        rearm = 300;
    }; // "UH-80 Ghost Hawk"

    class B_Heli_Transport_03_F {
        cost = 1000;
        requirements[] = {"H"};
        offset[] = {0, 10, 0};
        killReward = 100;
        rearm = 300;
    }; // "CH-67 Huron"

    class B_Heli_Transport_01_UP_F {
        name = "UH-80 Ghost Hawk UP";
        description = "UH-80 Ghost Hawk UP is a variant of the UH-80 Ghost Hawk armed with 20mm autocannons.";
        spawn = "B_Heli_Transport_01_F";
        variant = 1;
        cost = 2000;
        requirements[] = {"H"};
        offset[] = {0, 11, 0};
        killReward = 200;
        rearm = 300;

        hasHMD = 1;

        class LeftGunner: WLTurretDefaults {
            turret[] = { 1 };
            removeMagazines[] = {
                "2000Rnd_65x39_Belt_Tracer_Red"
            };
            removeWeapons[] = {
                "LMG_Minigun_Transport"
            };
            addMagazines[] = {
                "250Rnd_30mm_HE_shells_Tracer_Green",
                "250Rnd_30mm_HE_shells_Tracer_Green",
                "250Rnd_30mm_APDS_shells_Tracer_Green",
                "250Rnd_30mm_APDS_shells_Tracer_Green"
            };
            addWeapons[] = {
                "gatling_30mm"
            };
        };

        class RightGunner: WLTurretDefaults {
            turret[] = { 2 };
            removeMagazines[] = {
                "2000Rnd_65x39_Belt_Tracer_Red"
            };
            removeWeapons[] = {
                "LMG_Minigun_Transport2"
            };
            addMagazines[] = {
                "250Rnd_30mm_HE_shells_Tracer_Green",
                "250Rnd_30mm_HE_shells_Tracer_Green",
                "250Rnd_30mm_APDS_shells_Tracer_Green",
                "250Rnd_30mm_APDS_shells_Tracer_Green"
            };
            addWeapons[] = {
                "gatling_30mm"
            };
        };
    };

    class B_Heli_Light_01_dynamicLoadout_F {
        cost = 2500;
        requirements[] = {"H"};
        rearm = 300;
        killReward = 200;
    }; // "AH-9 Pawnee"

    class B_Heli_Light_01_hmd_F {
        name = "AH-9 Pawnee Block II";
        description = "AH-9 Pawnee Block II is a variant of the AH-9 Pawnee with advanced avionics.";
        spawn = "B_Heli_Light_01_dynamicLoadout_F";
        cost = 5500;
        variant = 1;
        requirements[] = {"H"};
        textures[] = {
            "A3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_digital_co.paa"
        };
        killReward = 300;
        rearm = 300;
        hasHMD = 1;

        allowPylonMagazines[] = {
            "PylonRack_3Rnd_LG_scalpel"
        };

        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {
                "5000Rnd_762x51_Belt"
            };
            removeWeapons[] = {
                "M134_minigun"
            };
            addMagazines[] = {
                "168Rnd_CMFlare_Chaff_Magazine",
                "PylonWeapon_300Rnd_20mm_shells",
                "PylonWeapon_300Rnd_20mm_shells"
            };
            addWeapons[] = {
                "CMFlareLauncher",
                "Twin_Cannon_20mm_gunpod"
            };
        };
    };

    class B_Heli_light_03_dynamicLoadout_F {
        cost = 5000;
        name = "WY-55 Hellcat";
        description = "WY-55 Hellcat is a light attack helicopter.";
        spawn = "I_Heli_light_03_dynamicLoadout_F";

        hasHMD = 1;

        allowPylonMagazines[] = {
            "PylonRack_Missile_HARM_x1",
            "PylonRack_19Rnd_Rocket_Skyfire"
        };

        requirements[] = {"H"};
        textures[] = {
            "\A3\Air_F_Enoch\Heli_Light_03\data\Heli_Light_03_base_EAF_CO.paa",
            "\a3\Supplies_F_Enoch\Ammoboxes\Data\AmmoBox_EAF_CO.paa",
            "\a3\Supplies_F_Enoch\Ammoboxes\Data\AmmoBox_signs_EAF_CA.paa"
        };
        offset[] = {0, 9, 0};
        rearm = 300;
        killReward = 300;
    };

    class B_Heli_Attack_01_dynamicLoadout_F {
        cost = 13000;
        requirements[] = {"H"};
        offset[] = {0, 10, 0};
        rearm = 700;
        killReward = 550;

        allowPylonMagazines[] = {
            "PylonRack_Missile_HARM_x1"
        };
        hasHMD = 1;

        class Pilot: WLTurretDefaults {
            turret[] = { -1 };
            removeMagazines[] = {};
            removeWeapons[] = {
                "CMFlareLauncher"
            };
            addMagazines[] = {
                "192Rnd_CMFlare_Chaff_Magazine"
            };
            addWeapons[] = {
                "CMFlareLauncher_Singles"
            };
        };
    }; // "AH-99 Blackfoot"

    // class B_Heli_Attack_01_sead_F {
    //     name = "AH-99 Blackfoot (SEAD)";
    //     cost = 14000;
    //     spawn = "B_Heli_Attack_01_dynamicLoadout_F";
    //     requirements[] = {"H"};
    //     offset[] = {0, 10, 0};
    //     rearm = 700;
    //     killReward = 550;
    //     variant = 1;

    //     disallowMagazines[] = {
    //         "PylonMissile_1Rnd_AAA_missiles",
    //         "PylonMissile_1Rnd_LG_scalpel",
    //         "PylonRack_12Rnd_PG_missiles",
    //         "PylonRack_12Rnd_missiles"
    //     };
    //     hasHMD = 1;

    //     class Pilot: WLTurretDefaults {
    //         turret[] = { -1 };
    //         removeMagazines[] = {};
    //         removeWeapons[] = {
    //             "CMFlareLauncher"
    //         };
    //         addMagazines[] = {
    //             "192Rnd_CMFlare_Chaff_Magazine",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1",
    //             "magazine_Missile_HARM_x1"
    //         };
    //         addWeapons[] = {
    //             "CMFlareLauncher_Singles",
    //             "weapon_HARMLauncher"
    //         };
    //     };
    // };
};