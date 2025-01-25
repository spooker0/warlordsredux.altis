#include "constants.inc"

sleep 5;

// Task Structure
// Key: Task ID
// Value: [Task Name, Task Description, Prerequisites, Parent Task]

private _taskConfig = missionConfigFile >> "CfgWLTaskConfig";
private _tasksClasses = "'WLTask' in ([_x, true] call BIS_fnc_returnParents)" configClasses _taskConfig;

private _tasks = createHashMap;
{
    _tasks set [configName _x, [
        getText (_x >> "name"),
        getText (_x >> "description"),
        getArray (_x >> "args"),
        getArray (_x >> "prerequisites"),
        getText (_x >> "parentTask"),
        getText (_x >> "onStart"),
        getNumber (_x >> "reward")
    ]];
} forEach _tasksClasses;

missionNamespace setVariable ["WLT_tasks", _tasks];
WLT_stats = createHashMap;

["INIT", true] call WLT_fnc_taskComplete;

0 spawn {
    private _tasks = missionNamespace getVariable ["WLT_tasks", createHashMap];

    while { !BIS_WL_missionEnd } do {
        sleep 1;

        private _engageMission = WLT_stats getOrDefault ["Engage", 0];
        if (_engageMission >= 1) then {
            ["TaskEngageOne"] call WLT_fnc_taskComplete;
        };
        if (_engageMission >= 5) then {
            ["TaskEngageFive"] call WLT_fnc_taskComplete;
        };
        if (_engageMission >= 100) then {
            ["TaskEngageHundred"] call WLT_fnc_taskComplete;
        };

        if ((WLT_stats getOrDefault ["CombinedArmsAPS", 0]) >= 1) then {
            ["TaskCombinedArmsAPS"] call WLT_fnc_taskComplete;
        };

        if ((WLT_stats getOrDefault ["CombinedArmsArmor", 0]) >= 1) then {
            ["TaskCombinedArmsArmor"] call WLT_fnc_taskComplete;
        };

        if ((WLT_stats getOrDefault ["CombinedArmsAir", 0]) >= 1) then {
            ["TaskCombinedArmsAir"] call WLT_fnc_taskComplete;
        };

        {
            private _task = _x;
            {
                private _taskId = _x;
                private _taskData = _y;
                _taskData params ["_taskName", "_taskDesc", "_descArgs", "_prereqs", "_parentTask", "_onStart", "_reward"];

                if (_taskName == taskName _task && !taskCompleted _task) then {
                    private _compiledArgs = [_taskDesc];
                    {
                        _compiledArgs pushBack (call compile _x);
                    } forEach _descArgs;
                    private _descDisplay = (format _compiledArgs) + " Reward: " + str _reward + "XP";
                    _task setSimpleTaskDescription [
                        _descDisplay,
                        _taskName,
                        ""
                    ];
                };
            } forEach _tasks;
        } forEach (simpleTasks player);
    };
};