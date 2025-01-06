class AirDefense {
    class I_E_Radar_System_01_F {
        description = "Long range radar system, capable of detecting and tracking vehicles within line of sight at up to 16km.";
        cost = 1000;
        requirements[] = {};
        offset[] = {0, 7, 0};
        killReward = 350;
        loadable[] = {0, 0, 1};
    };  // "AN/MPQ-105 Radar"

    class I_E_SAM_System_03_F {
        description = "Long range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: >10km.";
        cost = 8000;
        requirements[] = {};
        offset[] = {0, 6, 0};
        rearm = 450;
        killReward = 500;
        loadable[] = {0, 0, 1};
    };  // "MIM-145 Defender"
};