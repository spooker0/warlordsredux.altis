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
    class ProgressTrackerId: WLProgressTracker {} // Progress tracker class for the task.
};
*/

class WLTask {};
class WLProgressTracker {
    id = "";                // Unique identifier for the progress tracker.
    threshold = 0;          // Threshold for the progress tracker.
};

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

class WLTaskTutorialUiMechanics: WLTask {
    parentTask = "Tutorial: UI & Mechanics";
};

class WLTaskEngage: WLTask {
    parentTask = "Engage the Enemy";
};

class WLTaskCombinedArms: WLTask {
    parentTask = "Combined Arms Warfare";
};

class WLTaskTankBasics: WLTaskCombinedArms {
    parentTask = "Tank Basics";
};

class WLTaskSearchAndDestroy: WLTask {
    parentTask = "Search and Destroy";
    prerequisites[] = {
        "TaskCombinedArmsArmor"
    };
};

class CfgWLTaskConfig {
    #include "task\task_basictransport.hpp"
    #include "task\task_fasttravel.hpp"
    #include "task\task_servicing.hpp"
    #include "task\task_squads.hpp"
    #include "task\task_uimechanics.hpp"
    #include "task\task_engage.hpp"
    #include "task\task_combinedarms.hpp"
    #include "task\task_tankbasics.hpp"
    #include "task\task_searchanddestroy.hpp"
};