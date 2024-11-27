class FixedWing {
    class B_Plane_Caeser_Armed_01_F {
        name = "Caesar BTT (Armed)";
        description = "Caesar BTT (Armed) is a variant of the Caesar BTT armed with a HMG, GMG, and countermeasures.<br/>Armament: 500Rnd 12.7mm x2, 96Rnd 40mm x2, 240Rnd Countermeasures";
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

    class B_T_VTOL_01_armed_F {
        cost = 8000;
        requirements[] = {"A"};
        rearm = 500;
        killReward = 350;
    }; // "V-44 X Blackfish (Armed)"

    class B_Plane_CAS_01_dynamicLoadout_F {
        cost = 15000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 800;
    }; // "A-164 Wipeout (CAS)"

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