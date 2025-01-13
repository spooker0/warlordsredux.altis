params ["_op", "_player"];

private _ret = 0;

if (isNil "WLC_ScoreTable") then {
    private _levelRequirements = [];
    for "_i" from 1 to 5 do {
        for "_j" from 1 to 10 do {
            _levelRequirements pushBack (_i * 1000);
        };
    };
    WLC_ScoreTable = _levelRequirements;
};

switch (_op) do {
    case "getScore": {
        private _score = WLC_Scores getOrDefault [getPlayerUID _player, 0];
        _ret = _score;
    };
    case "getLevel": {
        private _score = ["getScore", _player] call WLC_fnc_getLevelInfo;
        private _level = 0;
        while { _score > 0 } do {
            private _nextLevelReq = if (_level < count WLC_ScoreTable) then {
                WLC_ScoreTable # _level;
            } else {
                5000;
            };
            _score = _score - _nextLevelReq;
            if (_score >= 0) then {
                _level = _level + 1;
            };
        };
        _ret = _level;
    };
    case "getNextLevelScore": {
        private _level = ["getLevel", _player] call WLC_fnc_getLevelInfo;
        private _score = 0;
        for "_i" from 0 to _level do {
            private _nextLevelReq = if (_i < count WLC_ScoreTable) then {
                WLC_ScoreTable # _i;
            } else {
                5000;
            };
            _score = _score + _nextLevelReq;
        };
        _ret = _score;
    };
};

_ret;