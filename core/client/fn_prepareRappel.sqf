Carrier1Boat1 lock true;
Carrier1Boat1 setPhysicsCollisionFlag false;

Carrier1Boat1 addAction [
    "<t color='#0000ff'>Rappel Up</t>",
    {
        params ["_target", "_caller"];
        [_target, _caller] spawn {
            params ["_target", "_caller"];
            private _rope = ropeCreate [Carrier1Boat1, "", Carrier1Rope1, [0, 0, 0], -1];
            playSoundUI ["a3\sounds_f\air\sfx\sl_4hooksunlock.wss"];
            sleep 1;

            private _interval = 0;
            private _startTime = serverTime;
            private _startPos = getPosASL _target,
            private _endPos = (getPosASL Carrier1Rope1) vectorAdd [0, 0, 1.5];

            _caller switchMove "LadderRifleStatic";
            _caller allowDamage false;
            private _sound = playSoundUI ["a3\sounds_f\vehicles\air\noises\wind_open_int.wss", 0.5, 2, true];
            while { alive _caller && _interval < 5 } do
            {
                sleep 0.0001;
                _caller setVelocityTransformation [
                    _startPos,
                    _endPos,
                    [0, 0, 0],
                    [0, 0, 0],
                    [0, 0, 1],
                    [0, 0, 1],
                    [0, 0, 1],
                    [0, 0, 1],
                    _interval / 5
                ];
                _interval = serverTime - _startTime;
            };
            stopSound _sound;
            _caller setVehiclePosition [_endPos, [], 0, "CAN_COLLIDE"];
            _caller switchMove "";
            sleep 1;
            ropeDestroy _rope;
            _caller allowDamage true;
        };
    }
];

Carrier1Rope1 addAction [
    "<t color='#0000ff'>Rappel Down</t>",
    {
        params ["_target", "_caller"];
        [_target, _caller] spawn {
            params ["_target", "_caller"];
            private _rope = ropeCreate [Carrier1Boat1, "", Carrier1Rope1, [0, 0, 0], -1];
            playSoundUI ["a3\sounds_f\air\sfx\sl_4hooksunlock.wss"];
            sleep 1;

            private _interval = 0;
            private _startTime = serverTime;
            private _startPos = getPosASL Carrier1Rope1;
            private _endPos = getPosASL Carrier1Boat1,

            _caller switchMove "LadderRifleStatic";
            _caller allowDamage false;
            private _sound = playSoundUI ["a3\sounds_f\vehicles\air\noises\wind_open_int.wss", 0.5, 2, true];
            while { alive _caller && _interval < 5 } do
            {
                sleep 0.0001;
                _caller setVelocityTransformation [
                    _startPos,
                    _endPos,
                    [0, 0, 0],
                    [0, 0, 0],
                    [0, 0, 1],
                    [0, 0, 1],
                    [0, 0, 1],
                    [0, 0, 1],
                    _interval / 5
                ];
                _interval = serverTime - _startTime;
            };
            stopSound _sound;
            _caller setVehiclePosition [_endPos, [], 0, "CAN_COLLIDE"];
            _caller switchMove "";
            sleep 1;
            ropeDestroy _rope;
            _caller allowDamage true;
        };
    }
];