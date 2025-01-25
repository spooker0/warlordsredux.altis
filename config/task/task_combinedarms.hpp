class TaskCombinedArmsAPS: WLTaskCombinedArms {
    name = "Attack Armored Vehicle APS";
    description = "Attack an armored vehicle, triggering its APS in the progress. Progress: %1/1";
    args[] = {
        "WLT_stats getOrDefault ['CombinedArmsAPS', 0]"
    };
    onStart = "WLT_stats set ['CombinedArmsAPS', 0]";
    prerequisites[] = {
        "TaskEngageFive"
    };
    reward = 100;
};

class TaskCombinedArmsArmor: WLTaskCombinedArms {
    name = "Destroy Enemy Armor";
    description = "Destroy an enemy armored vehicle (with medium APS or above). Progress: %1/1";
    args[] = {
        "WLT_stats getOrDefault ['CombinedArmsArmor', 0]"
    };
    onStart = "WLT_stats set ['CombinedArmsArmor', 0]";
    prerequisites[] = {
        "TaskCombinedArmsAPS"
    };
    reward = 200;
};

class TaskCombinedArmsAir: WLTaskCombinedArms {
    name = "Destroy Enemy Air";
    description = "Destroy an enemy air vehicle. Progress: %1/1";
    args[] = {
        "WLT_stats getOrDefault ['CombinedArmsAir', 0]"
    };
    onStart = "WLT_stats set ['CombinedArmsAir', 0]";
    prerequisites[] = {
        "TaskCombinedArmsArmor"
    };
    reward = 500;
};