//By OneShot.J
_Vcl = nearestObject [player, "LandVehicle"];
_Civ = (crew _Vcl) select 0;

if (locked _Vcl) then {
	player commandChat "The car is locked. This might take a while.";
	sleep 8;
	_Vcl lock false;
} else {
	player commandChat "You're pulling the civ out.";
};

[_Civ,[],"Scripts\Pullout\pullout_civ.sqf"] execVM "CB.sqf";