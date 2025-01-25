params ["_taskId", ["_init", false]];

private _taskCompletion = profileNamespace getVariable ["WLT_TaskCompletionStatuses", createHashMap];
private _tasks = missionNamespace getVariable ["WLT_tasks", createHashMap];

if (_init) then {
    {
        _y params ["_taskName", "_taskDesc", "_descArgs", "_prereqs", "_parentTask"];
        private _taskCompleted = _taskCompletion getOrDefault [_x, false];
        if (_taskCompleted) then {
            private _category = [_parentTask] call WLT_fnc_handleParentTask;

            private _task = player createSimpleTask [_taskName, _category];
            private _compiledArgs = [_taskDesc];
            {
                _compiledArgs pushBack (call compile _x);
            } forEach _descArgs;
            _task setSimpleTaskDescription [
                format _compiledArgs,
                _taskName,
                ""
            ];
            _task setTaskState "Succeeded";
        };
    } forEach _tasks;
} else {
    private _taskFromId = _tasks getOrDefault [_taskId, []];
    private _findTask = (simpleTasks player) select {
        taskName _x == _taskFromId # 0 && !taskCompleted _x
    };
    if (count _findTask > 0) then {
        private _task = _findTask # 0;
        _task setTaskState "Succeeded";
        ["TaskSucceeded", ["", taskName _task]] call BIS_fnc_showNotification;

        private _reward = _taskFromId # 6;
        if (_reward > 0) then {
            private _uid = getPlayerUID player;
            private _newScore = (WLC_Scores getOrDefault [_uid, 0]) + _reward;
            if (typeName _newScore == "scalar") then {
                [_uid, _newScore] call WLC_fnc_setScore;
            };
        };

        _taskCompletion set [_taskId, true];
        profileNamespace setVariable ["WLT_TaskCompletionStatuses", _taskCompletion];
    };
};

{
    private _eligible = [_x] call WLT_fnc_taskEligible;
    if (_eligible) then {
        [_x] call WLT_fnc_taskStart;
    };
} forEach _tasks;

// clean up parent tasks
{
    private _taskDescription = taskDescription _x;
    if (_taskDescription # 0 == "") then {
        private _children = taskChildren _x;
        private _allComplete = true;
        {
            if (taskState _x != "Succeeded") then {
                _allComplete = false;
            };
        } forEach _children;
        if (_allComplete) then {
            _x setTaskState "Succeeded";
        };
    };
} forEach (simpleTasks player);