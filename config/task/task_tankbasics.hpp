class TaskBuyMBT: WLTaskTankBasics {
    name = "Buy MBT";
    description = "Buy any main battle tank.";
    prerequisites[] = {
        "TaskCombinedArmsArmor"
    };
    reward = 100;
};

class TaskBuyRepair: WLTaskTankBasics {
    name = "Recruit Repair Specialist";
    description = "Buy a repair specialist in the infantry buy menu.";
    prerequisites[] = {
        "TaskBuyMBT"
    };
    reward = 100;
};

class TaskStaffTank: WLTaskTankBasics {
    name = "Hop in";
    description = "Order your infantry to get in your tank. First, select the infantry with the F-keys or with tilde(`). Then, look at the tank and order them to get in.";
    onStart = "group player addEventHandler ['CommandChanged', { if (_this # 1 == 'GET IN') then {['TaskStaffTank'] call WLT_fnc_taskComplete;}; }];";
    prerequisites[] = {
        "TaskBuyRepair"
    };
    reward = 100;
};

class TaskStaffRepair: WLTaskTankBasics {
    name = "Combat Repairs";
    description = "Order your repair specialist to repair your tank. First, order them out of the vehicle. Then, select them and press the 6 key, and order them to repair a damaged vehicle.";
    onStart = "group player addEventHandler ['CommandChanged', { if (_this # 1 == 'REPAIR VEHICLE') then {['TaskStaffRepair'] call WLT_fnc_taskComplete;}; }];";
    prerequisites[] = {
        "TaskStaffTank"
    };
    reward = 100;
};

class TaskTankAce: WLTaskTankBasics {
    name = "Tank Ace";
    description = "Destroy 5 heavy armor.";
    prerequisites[] = {
        "TaskStaffRepair"
    };
    reward = 1000;
    class ArmorKillsTracker: WLProgressTracker {
        id = "Heavy Armor Kills";
        threshold = 5;
    };
};