class TaskFastTravelSeized: WLTaskTutorialFastTravel {
    name = "Fast Travel";
    description = "Fast travel to an owned sector by using the asset buy menu (Hold %1 key) -> Fast Travel -> Fast Travel to Seized Sector.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {};
    reward = 100;
};

class TaskFastTravelConflict: WLTaskTutorialFastTravel {
    name = "Head to the Frontline";
    description = "Fast travel to a sector in conflict by using the asset buy menu (Hold %1 key) -> Fast Travel -> Fast Travel to Contested Sector.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskFastTravelSeized"
    };
    reward = 100;
};

class TaskFastTravelFTVehicle: WLTaskTutorialFastTravel {
    name = "Use Spawn Truck";
    description = "Fast travel to a spawn truck by using the asset buy menu (Hold %1 key) -> Fast Travel -> Fast Travel to Spawn Truck. If one does not exist on your team, you may need to purchase one first.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskFastTravelConflict"
    };
    reward = 100;
};

class TaskFastTravelFTPod: WLTaskTutorialFastTravel {
    name = "Use Medical Pod";
    description = "Fast travel to a medical pod by using the asset buy menu (Hold %1 key) -> Fast Travel -> Fast Travel to Medical Pod. If one does not exist on your team, you may need to purchase one first.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskFastTravelFTVehicle"
    };
    reward = 100;
};

class TaskBuyTent: WLTaskTutorialFastTravel {
    name = "Tents!";
    description = "Purchase a fast travel tent by using the asset buy menu (Hold %1 key) -> Fast Travel -> Purchase Fast Travel Tent. Keep in mind that this tent is one use only, and you'll need to buy another if you lose it.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskFastTravelFTPod"
    };
    reward = 50;
};

class TaskPlaceTent: WLTaskTutorialFastTravel {
    name = "Deploy Tent";
    description = "Once you have purchased a fast travel tent, you can place it by using your scroll wheel menu and selecting the Place Fast Travel Tent option.";
    prerequisites[] = {
        "TaskBuyTent"
    };
    reward = 50;
};

class TaskFastTravelTent: WLTaskTutorialFastTravel {
    name = "Go Camping";
    description = "Fast travel to a fast travel tent by using the asset buy menu (Hold %1 key) -> Fast Travel -> Fast Travel to Fast Travel Tent. This consumes the fast travel tent.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskPlaceTent"
    };
    reward = 100;
};

class TaskAirAssault: WLTaskTutorialFastTravel {
    name = "Airborne";
    description = "Air assault to a sector by using the asset buy menu (Hold %1 key) -> Fast Travel -> Fast Travel Air Assault. You are expected to participate, not to survive.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskFastTravelTent"
    };
    reward = 200;
};

class TaskVehicleParadrop: WLTaskTutorialFastTravel {
    name = "Vehicle Paradrop";
    description = "Paradrop a vehicle by using the asset buy menu (Hold %1 key) -> Fast Travel -> Fast Travel Vehicle Paradrop. It is advisable to pick a sector with flat, empty terrain and no enemies nearby.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskAirAssault"
    };
    reward = 500;
};