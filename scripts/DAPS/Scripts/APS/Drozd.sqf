private["_v","_i","_b","_p","_d","_ex","_a","_wd","_rd","_s","_id","_fire","_c"];
_v=_this select 0;
_i=_this select 1;
if((typeOf _i)in dapsExcludedAmmo)exitWith{};
_a=0;
_s="";
_p=getPos _i;
_d=_v distance _i;
if(_d<30)exitWith{};
sleep .1;
if((_v distance _i)>_d)exitWith{};
if((getNumber(configFile>>"CfgAmmo">>typeOf _i>>"hit"))>dapsHitLimit)exitWith{};
_rd=0;
_fire=FALSE;
_id=getDir _i;
[_v,_id,_p,_i]call DAPS_fnc_React;
while{alive _i}do{
	_rd=[_id,_v]call DAPS_fnc_RelDir2;
	if((_rd<30)OR(_rd>330))exitWith{_fire=TRUE};
	sleep 0.001;
};
if!(_fire)exitWith{};
if(_rd>180)then{_a=_v getVariable"dapsAmmoL"}else{_a=_v getVariable"dapsAmmoR"};
if(_a<1)exitWith{};
_ex=TRUE;
while{TRUE}do{
	if!(alive _i)exitWith{_ex=FALSE};
	if!(alive _v)exitWith{};
	_d=_v distance _i;
	if(_d>201)exitWith{_ex=FALSE};
	if(_d<30)exitWith{};
	sleep 0.0005;
};
if!(alive _v)exitWith{};
if!(_ex)exitWith{};
if!(alive _i)exitWith{};
_p=getPosATL _i;
if(((_p select 2)-((getPosATL _v)select 2))>2)exitWith{};
deleteVehicle _i;
_p call DAPS_fnc_Blast;
if(_rd>180)then{_s="LEFT"}else{_s="RIGHT"};
[_v,_s,_a]call DAPS_fnc_DeductAmmo;
[_v,_s,_rd,TRUE]remoteExec["DAPS_fnc_Report"];