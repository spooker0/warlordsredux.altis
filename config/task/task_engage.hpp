class TaskEngageOne: WLTaskEngage {
    name = "Kill an Enemy Soldier";
    description = "Good luck.";
    prerequisites[] = {
        "TaskBuyQuad"
    };
    reward = 100;

    class KillsTracker: WLProgressTracker {
        id = "Kills";
        threshold = 1;
    };
};

class TaskEngageFive: WLTaskEngage {
    name = "Kill 5 Enemy Soldiers";
    description = "Friendlies do not count.";
    prerequisites[] = {
        "TaskEngageOne"
    };
    reward = 200;

    class KillsTracker: WLProgressTracker {
        id = "Kills";
        threshold = 5;
    };
};

class TaskEngageThirty: WLTaskEngage {
    name = "Kill 30 Enemy Soldiers";
    description = "Progress not saved between rounds.";
    prerequisites[] = {
        "TaskEngageFive"
    };
    reward = 1000;

    class KillsTracker: WLProgressTracker {
        id = "Kills";
        threshold = 30;
    };
};

class TaskEngageOfficer: WLTaskEngage {
    name = "Decapitation Strike";
    description = "Kill an officer.";
    prerequisites[] = {
        "TaskEngageThirty"
    };
    reward = 500;

    class DestroyTracker: WLProgressTracker {
        id = "Kill: Officer";
        threshold = 1;
    };
};

class TaskEngageSniper: WLTaskEngage {
    name = "Eagle Eye";
    description = "Kill 3 snipers.";
    prerequisites[] = {
        "TaskEngageOfficer"
    };
    reward = 500;

    class DestroyTracker: WLProgressTracker {
        id = "Kill: Sniper";
        threshold = 3;
    };
};

class TaskEngageAT: WLTaskEngage {
    name = "Protect the Tanks";
    description = "Kill 3 AT missile specialists.";
    prerequisites[] = {
        "TaskEngageSniper"
    };
    reward = 500;

    class DestroyTracker: WLProgressTracker {
        id = "Kill: Missile Specialist (AT)";
        threshold = 3;
    };
};

class TaskEngageAA: WLTaskEngage {
    name = "Clear the Skies";
    description = "Kill 3 AA missile specialists.";
    prerequisites[] = {
        "TaskEngageSniper"
    };
    reward = 1000;

    class DestroyTracker: WLProgressTracker {
        id = "Kill: Missile Specialist (AA)";
        threshold = 3;
    };
};