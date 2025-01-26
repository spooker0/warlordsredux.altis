class TaskCreateSquad: WLTaskTutorialSquads {
    name = "Create Squad";
    description = "Use the scroll wheel menu to find Squads. Press the Create Squad button. You must not already be in a squad to create one.";
    reward = 100;
};

class TaskLeaveSquad: WLTaskTutorialSquads {
    name = "Leave Squad";
    description = "Use the scroll wheel menu to find Squads. Press the Leave Squad button. You must be in a squad to leave it.";
    prerequisites[] = {
        "TaskCreateSquad"
    };
    reward = 100;
};

class TaskJoinSquad: WLTaskTutorialSquads {
    name = "Join Squad";
    description = "Ask a squad leader to invite you to their squad, then accept their invite. Squad members can see each other from further away and being in an active, well-performing squad increases your passive income.";
    prerequisites[] = {
        "TaskLeaveSquad"
    };
    reward = 500;
};

class TaskFastTravelSquad: WLTaskTutorialSquads {
    name = "Fast Travel to Squad Leader";
    description = "Fast travel to your squad leader by using the asset buy menu (Hold %1 key) -> Fast Travel -> Fast Travel to Squad Leader.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskJoinSquad",
        "TaskFastTravelSeized"
    };
    reward = 100;
};