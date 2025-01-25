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
    description = "Ask a squad leader to invite you to their squad, then accept their invite.";
    prerequisites[] = {
        "TaskLeaveSquad"
    };
    reward = 500;
};