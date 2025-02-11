#include "constants.inc"

private _uid = getPlayerUID player;
private _isAdmin = _uid in (getArray (missionConfigFile >> "adminIDs"));
private _isPollster = _uid in (getArray (missionConfigFile >> "pollstersIDs"));

if !(_isAdmin || _isPollster) exitWith {};

// client side
addMissionEventHandler ["HandleChatMessage", {
	params ["_channel", "_owner", "_from", "_text"];

    if (_owner != clientOwner) exitWith {};

    {
        if ([_x, _text, false] call BIS_fnc_inString) then {
            private _existingQuestion = missionNamespace getVariable ["POLL_question", ""];
            if (_existingQuestion != "") exitWith {
                private _message = format ["Can't change options when a poll is already active: %1", _existingQuestion];
                systemChat _message;
            };

            missionNamespace setVariable ["POLL_option" + str (_forEachIndex + 1), _text regexReplace [_x, ""], [2, clientOwner]];
        };
    } forEach [
        "!option1 ",
        "!option2 ",
        "!option3 ",
        "!option4 "
    ];
    if (["!poll ", _text, false] call BIS_fnc_inString) then {
        private _existingQuestion = missionNamespace getVariable ["POLL_question", ""];
        if (_existingQuestion != "") exitWith {
            private _message = format ["A poll is already active: %1", _existingQuestion];
            systemChat _message;
        };

        private _pollText = _text regexReplace ["!poll ", ""];
        private _option1 = missionNamespace getVariable ["POLL_option1", ""];
        private _option2 = missionNamespace getVariable ["POLL_option2", ""];
        private _option3 = missionNamespace getVariable ["POLL_option3", ""];
        private _option4 = missionNamespace getVariable ["POLL_option4", ""];

        if (_option1 == "" || _option2 == "") exitWith {
            private _message = "Poll requires at least two options";
            systemChat _message;
        };

        missionNamespace setVariable ["POLL_question", _pollText, [2, clientOwner]];
        [_pollText, _option1, _option2, _option3, _option4] remoteExec ["POLL_fnc_openPoll", 0];

        nil;
    };
}];