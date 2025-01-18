#include "..\..\warlords_constants.inc"

params ["_sector"];

private _servicesInSector = _sector getVariable ["BIS_WL_services", []];
if !("H" in _servicesInSector || "A" in _servicesInSector) then {
    [false, "Must be in an airfield/helipad sector."];
} else {
    [true, ""];
};