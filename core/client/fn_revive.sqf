params ["_unit"];

_unit setUnconscious false;
_unit setCaptive false;
_unit setDamage 0.9;
_unit switchMove "AidlPpneMstpSnonWnonDnon_AI";

private _group = group _unit;
if (leader _group != _unit) then {
	[_group, _unit] remoteExec ["selectLeader", groupOwner _group];
};
