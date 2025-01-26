class TaskBuyTechnical: WLTaskTutorialServicing {
    name = "Buy Offroad (HMG)";
    description = "Buy an Offroad (HMG) using the asset buy menu (Hold %1 key) -> Light Vehicles -> Offroad (HMG).";
    args[] = {
        "actionKeysNames 'gear'"
    };
    reward = 100;
};

class TaskModifyVehicle: WLTaskTutorialServicing {
    name = "Modify Vehicle";
    description = "This must be done with a fresh, new vehicle! Scroll down on the mouse wheel menu until you find the Modify/Rearm option. Select it, change an ammo type on the vehicle, and press the Apply/Rearm button. If you have consumed any ammo on the vehicle, this will empty ALL the ammo on the vehicle and force you to wait out the rearm timer.";
    prerequisites[] = {
        "TaskBuyTechnical"
    };
    reward = 100;
};

class TaskRepairVehicle: WLTaskTutorialServicing {
    name = "Repair Vehicle";
    description = "Find a repair point (repair vehicle/pod), and repair your vehicle using the Repair option in the scroll down menu. This will put it on a repair cooldown!";
    prerequisites[] = {
        "TaskModifyVehicle"
    };
    reward = 200;
};

class TaskRearmVehicle: WLTaskTutorialServicing {
    name = "Rearm Vehicle";
    description = "Find a rearm point (rearm vehicle/pod/crate). Scroll down on the mouse wheel menu until you find the Modify/Rearm option. Select it, and press the Rearm button. Remember: there is a timer before you can rearm.";
    prerequisites[] = {
        "TaskRepairVehicle"
    };
    reward = 200;
};

class TaskResetVehicle: WLTaskTutorialServicing {
    name = "Reset Vehicle";
    description = "First, point at your vehicle. Then, activate a Vehicle Reset using the asset buy menu (Hold %1 key) -> Strategy -> Reset Vehicle. This can be used when the vehicle is flipped or otherwise put in an unusable position.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskRearmVehicle"
    };
    reward = 200;
};

class TaskRefuelVehicle: WLTaskTutorialServicing {
    name = "Refuel Vehicle";
    description = "Find a refuel point (refuel vehicle/pod/crate or a gas station) and refuel a vehicle.";
    onStart = "addMissionEventHandler ['Service', {['TaskRefuelVehicle'] call WLT_fnc_taskComplete;}];"
    prerequisites[] = {
        "TaskResetVehicle"
    };
    reward = 200;
};