//By OneShot.J

//Gas Stations & Pub
_NPC = [pub1, fuelshop1, fuelshop2, fuelshop8, fuelshop4, fuelshop7, fuelshop13];
{
_Civ = nearestObjects [getpos _x, ["Man"], 15] - [_x] select 0;
	if ((player distance _x>= 25) and (_x getVariable "Surrender" == "True")) then {
		_x switchMove "";
		_x setVariable ["Surrender", "False", true];
	};
} forEach _NPC;

//Bank
_Civ = nearestObjects [getpos mainbank, ["Man"], 25] - [mainbank] select 0;
if ((player distance mainbank >= 25) and (mainbank getVariable "Surrender" == "True")) then {
	mainbank switchMove "";
	mainbank setVariable ["Surrender", "False", true];
};