class Aircraft {
    class B_Heli_Light_01_F {
        cost = 300;
        requirements[] = {"H"};
        killReward = 100;
    }; // "MH-9 Hummingbird"

    class B_Heli_Transport_01_F {
        cost = 800;
        requirements[] = {"H"};
        killReward = 100;
    }; // "UH-80 Ghost Hawk"

    class B_Heli_Transport_03_F {
        cost = 1000;
        requirements[] = {"H"};
        killReward = 100;
    }; // "CH-67 Huron"

    class B_Plane_Caeser_Armed_01_F {
        name = "Caesar BTT (Armed)";
        spawn = "C_Plane_Civil_01_F";
        cost = 1500;

        requirements[] = {"A"};
        killReward = 300;
        class Pilot: WLTurretDefaults {
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
    }; // "Caesar BTT (Armed)"

    class B_Heli_Transport_01_UP_F {
        name = "UH-80 Ghost Hawk UP";
        spawn = "B_Heli_Transport_01_F";
        cost = 2000;
        requirements[] = {"H"};
        killReward = 200;
        rearm = 300;

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
                "250Rnd_30mm_APDS_shells_Tracer_Green"
            };
            addWeapons[] = {
                "gatling_30mm"
            };
        };
    };

    class B_T_VTOL_01_infantry_F {
        cost = 2000;
        requirements[] = {"A"};
        killReward = 300;
    }; // "V-44 X Blackfish (Inf)"

    class B_T_VTOL_01_vehicle_F {
        cost = 2000;
        requirements[] = {"A"};
        killReward = 300;
    }; // "V-44 X Blackfish (Vic)"

    class B_Heli_Light_01_dynamicLoadout_F {
        cost = 2500;
        requirements[] = {"H"};
        rearm = 300;
        killReward = 200;
    }; // "AH-9 Pawnee"

    class I_Heli_light_03_dynamicLoadout_F {
        cost = 6000;
        requirements[] = {"H"};
        rearm = 300;
        killReward = 300;
    }; // "WY-55 Hellcat"

    class B_UAV_02_dynamicLoadout_F {
        cost = 8000;
        requirements[] = {"A"};
        rearm = 300;
        killReward = 600;
    }; // "Greyhawk"

    class B_T_VTOL_01_armed_F {
        cost = 8000;
        requirements[] = {"A"};
        rearm = 500;
        killReward = 350;
    }; // "V-44 X Blackfish (Armed)"

    class B_T_UAV_03_dynamicLoadout_F {
        cost = 11000;
        requirements[] = {"H"};
        rearm = 600;
        killReward = 600;
    }; // "Falcon"

    class B_Heli_Attack_01_dynamicLoadout_F {
        cost = 13000;
        requirements[] = {"H"};
        rearm = 700;
        killReward = 550;

        allowPylonMagazines[] = {
            "PylonMissile_Missile_HARM_x1"
        };
    }; // "AH-99 Blackfoot"

    class B_Plane_CAS_01_dynamicLoadout_F {
        cost = 15000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 800;
    }; // "A-164 Wipeout (CAS)"

    class B_UAV_05_F {
        cost = 25000;
        requirements[] = {"A"};
        rearm = 500;
        killReward = 650;
    }; // "UCAV Sentinel"

    class I_Plane_Fighter_04_F {
        cost = 23000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 600;
    }; // "A-149 Gryphon"

    class B_Plane_Fighter_01_F {
        cost = 30000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 1000;

        allowPylonMagazines[] = {
            "PylonMissile_Missile_HARM_x1"
        };
    }; // "F/A-181 Black Wasp II"

    class B_Plane_Fighter_01_Stealth_F {
        cost = 35000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 1000;

        allowPylonMagazines[] = {
            "PylonMissile_Missile_HARM_x1"
        };
    }; // "F/A-181 Black Wasp II (Stealth)"
};