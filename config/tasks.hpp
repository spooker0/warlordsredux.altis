/*
Repository for all WL Task related configurations.

class CfgTaskId {
    name = string;                  // Name of the task.
    description = string;           // Description of the task.
    args[] = string[];              // [Code] Arguments for the task description.
    onStart = string;               // [Code] Code to execute when the task is started.
    prerequisites[] = string[];     // Prerequisite class ids for the task.
    parentTask = string;            // Parent task class id for the task.
    reward = number;                // Reward XP for the task.
};
*/

class WLTask {};

class WLTaskTutorialBasicTransport: WLTask {
    parentTask = "Tutorial: Basic Transport";
};

class WLTaskTutorialFastTravel: WLTask {
    parentTask = "Tutorial: Fast Travel";
};

class WLTaskTutorialServicing: WLTask {
    parentTask = "Tutorial: Servicing";
};

class WLTaskTutorialSquads: WLTask {
    parentTask = "Tutorial: Squad";
};

class WLTaskEngage: WLTask {
    parentTask = "Engage the Enemy";
    args[] = {
        "WLT_stats getOrDefault ['Engage', 0]"
    };
    onStart = "WLT_stats set ['Engage', 0]";
};

class WLTaskCombinedArms: WLTask {
    parentTask = "Combined Arms Warfare";
};

class CfgWLTaskConfig {
    #include "task\task_basictransport.hpp"
    #include "task\task_fasttravel.hpp"
    #include "task\task_servicing.hpp"
    #include "task\task_squads.hpp"
    #include "task\task_engage.hpp"
    #include "task\task_combinedarms.hpp"
};