class TaskEngageOne: WLTaskEngage {
    name = "Kill an Enemy Soldier";
    description = "Good luck. Progress: %1/1";
    prerequisites[] = {
        "TaskBuyQuad"
    };
    reward = 100;
};

class TaskEngageFive: WLTaskEngage {
    name = "Kill 5 Enemy Soldiers";
    description = "Friendlies do not count. Progress: %1/5";
    prerequisites[] = {
        "TaskEngageOne"
    };
    reward = 200;
};

class TaskEngageHundred: WLTaskEngage {
    name = "Kill 100 Enemy Soldiers";
    description = "Progress not saved between rounds. Progress: %1/100";
    prerequisites[] = {
        "TaskEngageFive"
    };
    reward = 1000;
};