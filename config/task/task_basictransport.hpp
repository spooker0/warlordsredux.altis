class TaskBuyQuad: WLTaskTutorialBasicTransport {
    name = "Buy Quad Bike";
    description = "Buy a quad bike using the asset buy menu (Hold %1 key) -> Light Vehicles -> Quad Bike.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {};
    reward = 50;
};

class TaskLockPersonal: WLTaskTutorialBasicTransport {
    name = "Lock Vehicle to Personal";
    description = "Use the scroll wheel menu until you find the Access control option, and lock one of your vehicles to 'Personal'.";
    prerequisites[] = {
        "TaskBuyQuad"
    };
    reward = 50;
};

class TaskDeleteVehicle: WLTaskTutorialBasicTransport {
    name = "Delete Vehicle";
    description = "Use the scroll wheel menu until you find the Remove option, and delete one of your vehicles.";
    prerequisites[] = {
        "TaskLockPersonal"
    };
    reward = 50;
};