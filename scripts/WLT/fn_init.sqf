#include "constants.inc"

sleep 8;

// Task Structure
// Key: Task ID
// Value: [Task Name, Task Description, Prerequisites, Parent Task]

private _taskConfig = missionConfigFile >> "CfgWLTaskConfig";
private _tasksClasses = "'WLTask' in ([_x, true] call BIS_fnc_returnParents)" configClasses _taskConfig;

private _tasks = createHashMap;
{
    private _taskData = createHashMap;
    _taskData set ["name", getText (_x >> "name")];
    _taskData set ["description", getText (_x >> "description")];
    _taskData set ["args", (getArray (_x >> "args")) apply {
        compile _x;
    }];
    _taskData set ["prerequisites", getArray (_x >> "prerequisites")];
    _taskData set ["parentTask", getText (_x >> "parentTask")];
    _taskData set ["onStart", compile (getText (_x >> "onStart"))];
    _taskData set ["reward", getNumber (_x >> "reward")];

    private _progressTrackerClasses = "'WLProgressTracker' in ([_x, true] call BIS_fnc_returnParents)" configClasses _x;
    private _progressTrackers = [];
    {
        private _progressTrackerData = createHashMap;
        _progressTrackerData set ["id", getText (_x >> "id")];
        _progressTrackerData set ["threshold", getNumber (_x >> "threshold")];
        _progressTrackers pushBack _progressTrackerData;
    } forEach _progressTrackerClasses;
    _taskData set ["progressTrackers", _progressTrackers];

    _tasks set [configName _x, _taskData];
} forEach _tasksClasses;

missionNamespace setVariable ["WLT_tasks", _tasks];
WLT_stats = createHashMap;

["INIT", true] call WLT_fnc_taskComplete;

0 spawn {
    private _tasks = missionNamespace getVariable ["WLT_tasks", createHashMap];

    while { !BIS_WL_missionEnd } do {
        sleep 1;

        {
            private _task = _x;
            {
                private _taskId = _x;
                private _taskData = _y;

                private _taskName = _taskData getOrDefault ["name", ""];
                private _taskDesc = _taskData getOrDefault ["description", ""];
                private _descArgs = _taskData getOrDefault ["args", []];
                private _taskReward = _taskData getOrDefault ["reward", 0];

                if (_taskName == taskName _task) then {
                    private _compiledArgs = [_taskDesc];
                    {
                        _compiledArgs pushBack (call _x);
                    } forEach _descArgs;
                    private _descDisplay = format ["%1<br/><br/>Reward: %2XP", format _compiledArgs, _taskReward];

                    private _progressTrackerDisplay = [];
                    private _progressTrackers = _taskData getOrDefault ["progressTrackers", []];
                    private _progressDone = true;
                    {
                        private _trackerId = _x getOrDefault ["id", ""];
                        private _trackerThreshold = _x getOrDefault ["threshold", 0];
                        private _trackerCurrent = WLT_stats getOrDefault [_trackerId, 0];

                        private _trackerDisplay = format ["%1: %2/%3", _trackerId, _trackerCurrent, _trackerThreshold];
                        _progressTrackerDisplay pushBack _trackerDisplay;

                        if (_trackerCurrent < _trackerThreshold) then {
                            _progressDone = false;
                        };
                    } forEach _progressTrackers;
                    if (count _progressTrackers > 0 && _progressDone) then {
                        [_taskId] call WLT_fnc_taskComplete;
                    };

                    if (!taskCompleted _task && count _progressTrackerDisplay > 0) then {
                        _descDisplay = format ["%1<br/><br/>Progress<br/>%2", _descDisplay, _progressTrackerDisplay joinString "<br/>"];
                    };

                    _task setSimpleTaskDescription [_descDisplay, _taskName, ""];
                };
            } forEach _tasks;
        } forEach (simpleTasks player);
    };
};