//By OneShot.J

_Array = _this select 3;
_Dest  = _Array select 0;
_Cost = _Array select 1;

if (('geld' call INV_GetItemAmount) < _Cost) exitwith {
	player commandChat "You cannot afford this trip!";
};

['geld', - _Cost] call INV_AddInvItem;
titleText ["","BLACK OUT",1];
sleep 1;

if (_Dest == "Sabina") then {
	player setpos [getMarkerPos "sabina" select 0, getMarkerPos "sabina" select 1, 0];
	player setDir (getDir Sabina);
};
if (_Dest == "NovyBor") then {
	player setpos [getMarkerPos "novybor" select 0, getMarkerPos "novybor" select 1, 0];
	player setDir (getDir NovyBor);
};
if (_Dest == "Solibor") then {
	player setpos [getMarkerPos "solibor" select 0, getMarkerPos "solibor" select 1, 0];
	player setDir (getDir Solibor);
};
if (_Dest == "Kustik") then {
	player setpos [getMarkerPos "kustik" select 0, getMarkerPos "kustik" select 1, 1];
	player setDir (getDir Kustik);
};
if (_Dest == "Lyepestok") then {
	player setpos [getMarkerPos "lyepestok" select 0, getMarkerPos "lyepestok" select 1, 1];
	player setDir (getDir Lypestok);
};

sleep 2;
titleText ["","BLACK IN",1];