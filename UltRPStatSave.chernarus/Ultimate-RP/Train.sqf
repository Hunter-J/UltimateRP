//By OneShot.J

_Array = _this select 3;
_Dest  = _Array select 0;
_Cost = _Array select 1;

private["_Wanted"];

if (('geld' call INV_GetItemAmount) < _Cost) exitwith {
	player commandChat "You cannot afford this trip!";
};

if (player in wanted_array) then {
_Towns = nearestLocations [player, ["NameVillage","NameCity","NameCityCapital"], 20000]; 
_Town = text (_Towns select 0);
	player commandChat "You can not ride the train when you are wanted!";
	_Wanted = true;
	sleep 5;
	["Dispatch_Train",[name player,_Town]] call CBA_fnc_globalEvent;
} else {
	['geld', - _Cost] call INV_AddInvItem;
	titleText ["","BLACK OUT",1];
	sleep 1;
	_Wanted = false;
};


if (_Dest == "Sabina") exitwith {
	if (_Wanted) exitwith {};
	player setpos [getMarkerPos "sabina" select 0, getMarkerPos "sabina" select 1, 0];
	player setDir (getDir Sabina);
};
if (_Dest == "NovyBor") exitwith {
	if (_Wanted) exitwith {};
	player setpos [getMarkerPos "novybor" select 0, getMarkerPos "novybor" select 1, 0];
	player setDir (getDir NovyBor);
};
if (_Dest == "Solibor") exitwith {
	if (_Wanted) exitwith {};
	player setpos [getMarkerPos "solibor" select 0, getMarkerPos "solibor" select 1, 0];
	player setDir (getDir Solibor);
};
if (_Dest == "Kustik") exitwith {
	if (_Wanted) exitwith {};
	player setpos [getMarkerPos "kustik" select 0, getMarkerPos "kustik" select 1, 1];
	player setDir (getDir Kustik);
};
if (_Dest == "Lyepestok") exitwith {
	if (_Wanted) exitwith {};
	player setpos [getMarkerPos "lyepestok" select 0, getMarkerPos "lyepestok" select 1, 1];
	player setDir (getDir Lypestok);
};

sleep 2;
titleText ["","BLACK IN",1];