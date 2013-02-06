//By OneShot.J
_hasRespirator = 'respirator' call INV_GetItemAmount >= 1;
_hasMethylamine = 'methylamine' call INV_GetItemAmount >= 1;
_startpos = getpos player;
_methlab = nearestObject [player, "a2l_methlab"];

_Percent = 0;
_methlab setVariable ["inUse", "False", true];
_labInUse = _methlab getVariable "inUse";


if (vehicle player != player) exitwith {};
if (!_hasMethylamine or !_hasRespirator) exitwith {
	player commandChat "You don't have the required items to make Methamphetamine.";
};
if (Working) exitWith {
	player commandChat "You are already producing Methamphetamine.";
};


player commandChat "You are now producing Methamphetamine.";
Working = true;
_methlab setVariable ["inUse", "True", true];
_Smoke = "SmokeShellYellow" createVehicle position player;
_Smoke attachTo [_methlab,[0,0,0]];

while {Working} do {
	while {_Percent < 100} do {
		if (player distance _startpos > 1) exitWith {
			player commandChat "Production cancelled because you moved too far from the meth lab."; 
			deleteVehicle _Smoke;
			_methlab setVariable ["inUse", "False", true];
			Working = false;
		};
		_Percent = _Percent + 10;
		titleText [format ["Production %1 Percent Complete", _Percent], "PLAIN"];
		sleep 3;
	};
	if (_Percent == 100) exitwith {
		titleText ["", "PLAIN"];
		player commandChat "You successfully made Methamphetamine.";
		deleteVehicle _Smoke;
		['methylamine', -1] call INV_AddInvItem;
		['meth', 1] call INV_AddInvItem;
		_methlab setVariable ["inUse", "False", true];
		Working = false;
	};
};