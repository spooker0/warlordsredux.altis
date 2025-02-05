params ["_sender"];

private _serverFps = diag_fps;
private _serverFpsMin = diag_fpsMin;
private _entitiesCount = count entities "";

private _getRunningScripts = {
    diag_activeSQFScripts apply {
        private _filePath = (_x # 1) splitString "\";
        private _filePathCount = count _filePath;
        if (_filePathCount > 3) then {
            _filePath = format [
                "%1/%2/%3",
                _filePath # (_filePathCount - 3),
                _filePath # (_filePathCount - 2),
                _filePath # (_filePathCount - 1)
            ];
        };

        format ["%1: %2", _filePath, _x # 3]
    };
};
private _runningScripts1 = call _getRunningScripts;
sleep 1;
private _runningScripts2 = call _getRunningScripts;
sleep 1;
private _runningScripts3 = call _getRunningScripts;
_runningScripts2 = _runningScripts2 select {
    !(_x in _runningScripts1)
};
_runningScripts3 = _runningScripts3 select {
    !(_x in _runningScripts1)
};

private _message = format [
    "Server FPS: %1\nServer FPS Min: %2\nEntities Count: %3\nScripts[1]: %4\nScripts[2]: %5\nScripts[3]: %6",
    _serverFps,
    _serverFpsMin,
    _entitiesCount,
    _runningScripts1 joinString ", ",
    _runningScripts2 joinString ", ",
    _runningScripts3 joinString ", "
];

[_message] remoteExec ["WL2_fnc_lagMessageDisplay", _sender];