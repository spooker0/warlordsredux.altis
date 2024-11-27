class FixedWing {
    class O_Plane_Caeser_Armed_01_F {
        name = "Caesar BTT (Armed)";
        description = "Caesar BTT (Armed) is a variant of the Caesar BTT armed with a HMG, GMG, and countermeasures.<br/>Armament: 500Rnd 12.7mm x2, 96Rnd 40mm x2, 240Rnd Countermeasures";
        spawn = "C_Plane_Civil_01_F";
        cost = 1500;

        requirements[] = {"A"};
        killReward = 300;
        class Gunner: WLTurretDefaults {
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

    class O_T_VTOL_02_infantry_dynamicLoadout_F {
        cost = 14000;
        requirements[] = {"A"};
        rearm = 700;
        killReward = 600;
    }; // "Y-32 Xi'an (Infantry Transport)"

    class I_Plane_Fighter_03_dynamicLoadout_F {
        cost = 15000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 600;
    }; // "A-143 Buzzard"

    class O_Plane_CAS_02_dynamicLoadout_F {
        cost = 20000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 900;
    }; // "To-199 Neophron (CAS)"

    class O_Plane_Fighter_02_Stealth_F {
        cost = 28000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 1100;

        allowPylonMagazines[] = {
            "PylonMissile_Missile_KH58_x1"
        };
    }; // "To-201 Shikra (Stealth)"

    class O_Plane_Fighter_02_F {
        cost = 32000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 1100;

        allowPylonMagazines[] = {
            "PylonMissile_Missile_KH58_x1"
        };
    }; // "To-201 Shikra"
};