#include "..\..\warlords_constants.inc"

private _vehicle = vehicle player;
private _isInVehicle = _vehicle != player;
private _isGroundVehicle = _vehicle isKindOf "LandVehicle";
private _isInDriverSeat = (driver _vehicle) == player;
private _isAttached = isNull attachedTo _vehicle;
if (!_isInVehicle || !_isGroundVehicle || !_isInDriverSeat || !_isAttached) then {
    [false, "You must be in the driver seat of a ground vehicle."];
} else {
    [true, ""];
};
