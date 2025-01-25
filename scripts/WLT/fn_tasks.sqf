// Task Structure
// Key: Task ID
// Value: [Task Name, Task Description, Prerequisites]

private _taskConfig = missionConfigFile >> "CfgWLTaskConfig";
private _tasksClasses = "inheritsFrom _x == (missionConfigFile >> 'WLTask')" configClasses _taskConfig;

private _tasks = createHashMap;
{
    private _description = getText (_x >> "description");
    private _arguments = getArray (_x >> "args");
    private _compiledArgs = [_description];
    {
        _compiledArgs pushBack (call compile _x);
    } forEach _arguments;
    _tasks set [configName _x, [
        getText (_x >> "name"),
        format _compiledArgs,
        getArray (_x >> "prerequisites"),
        getText (_x >> "parentTask")
    ]];
} forEach _tasksClasses;

_tasks;