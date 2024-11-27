class RotaryWing {
    class O_Heli_Transport_04_covered_F {
        cost = 400;
        requirements[] = {"H"};
        killReward = 100;
    }; // "Mi-290 Taru (Transport)"

    class O_Heli_Transport_04_F {
        cost = 500;
        requirements[] = {"H"};
        killReward = 100;
    }; // "Mi-290 Taru"

    class O_Heli_Transport_04_medevac_F {
        cost = 500;
        requirements[] = {"H"};
        killReward = 100;
    }; // "Mi-290 Taru (Medical)"

    class O_Heli_Light_02_unarmed_F {
        cost = 500;
        requirements[] = {"H"};
        killReward = 125;
    }; // "PO-30 Orca (Unarmed)"

    class O_Heli_Light_02_dynamicLoadout_F {
        cost = 4000;
        requirements[] = {"H"};
        killReward = 300;
    }; // "PO-30 Orca"

    class O_Heli_Attack_02_dynamicLoadout_F {
        cost = 10000;
        requirements[] = {"H"};
        rearm = 700;
        killReward = 550;

        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles",
            "PylonMissile_Missile_KH58_x1"
        };
    }; // "Mi-48 Kajman"
};