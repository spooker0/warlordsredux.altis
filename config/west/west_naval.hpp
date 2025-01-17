class Naval {
    class C_Scooter_Transport_01_F {
        cost = 50;
        requirements[] = {"W"};
        killReward = 20;
    };	// "Water scooter"

    class B_Boat_Transport_01_F {
        cost = 100;
        requirements[] = {"W"};
        killReward = 20;
    };	// "Assault Boat"

    class B_SDV_01_F {
        cost = 250;
        requirements[] = {"W"};
        killReward = 20;
    };	// "SDV"

    class B_Boat_Armed_01_minigun_F {
        cost = 500;
        requirements[] = {"W"};
        rearm = 400;
        killReward = 80;
    };	// "Speedboat Minigun"

    class B_Boat_Armed_01_autocannon_F {
        name = "Riverine Command Boat";
        description = "Riverine Command Boat is an upgraded, heavily-armed variant of the Speedboat.";
        spawn = "B_Boat_Armed_01_minigun_F";
        variant = 1;
        cost = 1000;
        requirements[] = {"W"};
        rearm = 400;
        killReward = 100;

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
                "60Rnd_20mm_AP_shells",
                "5Rnd_GAT_missiles",
                "5Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "cannon_20mm",
                "missiles_titan"
            };
        };
    };
};