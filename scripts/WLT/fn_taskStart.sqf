params ["_taskId"];

private _tasks = missionNamespace getVariable ["WLT_tasks", createHashMap];
private _taskData = _tasks getOrDefault [_taskId, []];
private _findTask = (simpleTasks player) select {
    taskName _x == _taskData # 0
};
if (count _findTask > 0) exitWith {};

_taskData params ["_taskReadableName", "_taskDesc", "_descArgs", "_prereqs", "_parentTask", "_onStart"];

private _category = [_parentTask] call WLT_fnc_handleParentTask;

private _compiledArgs = [_taskDesc];
{
    _compiledArgs pushBack (call compile _x);
} forEach _descArgs;

private _task = player createSimpleTask [_taskReadableName, _category];
_task setSimpleTaskDescription [
    format _compiledArgs,
    _taskReadableName,
    ""
];
_task setTaskState "Assigned";

private _mute = profileNamespace getVariable ["MRTM_muteTaskNotifications", false];
if (!_mute) then {
    ["TaskAssigned", ["", _taskReadableName]] call BIS_fnc_showNotification;
};

if (_onStart != "") then {
    call compile _onStart;
};