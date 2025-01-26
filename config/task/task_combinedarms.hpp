class TaskCombinedArmsAPS: WLTaskCombinedArms {
    name = "Active Protection System";
    description = "Armored vehicles have active protection systems that protect against a limited number of incoming munitions. Lighter vehicles have APS that protect against fewer types of munitions and have less charges. Heavy tanks can have up to 6 APS charges that protect against almost all rockets and missiles. For this task, trigger the active protection system of any enemy armored vehicle.";
    prerequisites[] = {
        "TaskEngageFive"
    };
    reward = 100;
    class APSTracker: WLProgressTracker {
        id = "Trigger APS";
        threshold = 1;
    };
};

class TaskCombinedArmsArmor: WLTaskCombinedArms {
    name = "Destroy Enemy Armor";
    description = "Armored vehicles with active protection systems are not invincible. They can be depleted by firing multiple missiles at the same target. Medium APS systems can be depleted with four munitions. Alternatively, they can be bypassed with kinetic munitions like tank or cannon shells, or by getting very close to the enemy (within 30M). For this task, destroy an enemy armored vehicle that carries a medium or heavier APS.";
    prerequisites[] = {
        "TaskCombinedArmsAPS"
    };
    reward = 200;
    class ArmorKillsTracker: WLProgressTracker {
        id = "Armor Kills";
        threshold = 1;
    };
};

class TaskCombinedArmsAir: WLTaskCombinedArms {
    name = "Destroy Enemy Air";
    description = "Enemy helicopters and planes are a threat to ground forces. They can be effectively destroyed with anti-air missiles or autocannons.";
    prerequisites[] = {
        "TaskCombinedArmsArmor"
    };
    reward = 500;
    class AirKillsTracker: WLProgressTracker {
        id = "Air Vehicle Kills";
        threshold = 1;
    };
};

class TaskCombinedArmsOperation: WLTaskCombinedArms {
    name = "Combined Arms Offensive";
    description = "Destroy an assortment of enemies and vehicles to complete this task.";
    prerequisites[] = {
        "TaskCombinedArmsAir"
    };
    reward = 1000;
    class KillsTracker: WLProgressTracker {
        id = "Kills";
        threshold = 10;
    };
    class LightVehicleKillsTracker: WLProgressTracker {
        id = "Light Vehicle Kills";
        threshold = 3;
    };
    class ArmorKillsTracker: WLProgressTracker {
        id = "Armor Kills";
        threshold = 1;
    };
    class AirKillsTracker: WLProgressTracker {
        id = "Air Vehicle Kills";
        threshold = 1;
    };
};

class TaskCombinedArmsCampaign: WLTaskCombinedArms {
    name = "Combined Arms Campaign";
    description = "Destroy a large assortment of enemies and vehicles to complete this task.";
    prerequisites[] = {
        "TaskCombinedArmsOperation"
    };
    reward = 5000;

    class KillsTracker: WLProgressTracker {
        id = "Kills";
        threshold = 50;
    };
    class LightVehicleKillsTracker: WLProgressTracker {
        id = "Light Vehicle Kills";
        threshold = 5;
    };
    class ArmorKillsTracker: WLProgressTracker {
        id = "Armor Kills";
        threshold = 5;
    };
    class AirKillsTracker: WLProgressTracker {
        id = "Air Vehicle Kills";
        threshold = 3;
    };
};