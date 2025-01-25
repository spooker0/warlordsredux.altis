params ["_taskId"];

private _tasks = missionNamespace getVariable ["WLT_tasks", createHashMap];
private _taskData = _tasks getOrDefault [_taskId, []];

private _alreadyExists = (simpleTasks player) select {
    taskName _x == (_taskData # 0)
};
if (count _alreadyExists > 0) exitWith { false };

private _eligible = true;
{
    private _prereq = _x;

    private _prereqData = _tasks getOrDefault [_prereq, []];
    _prereqData params ["_prereqReadableName"];
    if (isNil "_prereqReadableName") then {
        systemChat _prereq;
    };

    private _findPrereq = (simpleTasks player) select {
        taskName _x == _prereqReadableName
    };
    if (count _findPrereq == 0) then {
        _eligible = false;
    };

    private _incompletePrereq = _findPrereq select {
        !taskCompleted _x
    };
    if (count _incompletePrereq > 0) then {
        _eligible = false;
    };
} forEach (_taskData # 3);

_eligible;