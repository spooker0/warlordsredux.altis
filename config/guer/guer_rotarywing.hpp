class RotaryWing {
    class I_C_Heli_Light_01_civil_F {
        cost = 300;
        requirements[] = {"H"};
        killReward = 100;
    }; // "M-900"

    class I_Heli_light_03_unarmed_F {
        cost = 500;
        requirements[] = {"H"};
        offset[] = {0, 11, 0};
        rearm = 300;
        killReward = 200;
    };  // "WY-55 Hellcat (Unarmed)"

    class I_Heli_Transport_02_F {
        cost = 500;
        requirements[] = {"H"};
        offset[] = {0, 14, 0};
        rearm = 300;
        killReward = 200;
    };  // "CH-49 Mohawk"

    class I_Heli_light_03_F {
        killReward = 300;
    };  // "WY-55 Hellcat"

    class I_Heli_light_03_dynamicLoadout_F {
        cost = 6000;
        requirements[] = {"H"};
        rearm = 300;

        killReward = 300;
        aircraftSpawn = 1;
    };  // "WY-55 Hellcat"
};