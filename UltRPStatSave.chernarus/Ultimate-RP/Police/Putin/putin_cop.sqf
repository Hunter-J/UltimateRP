//By OneShot.J
_Vcl = nearestObject [player, "LandVehicle"];
_Civ = nearestobjects [player, ["Man"], 5] - [player] select 0;

if (locked _Vcl) exitwith {player commandChat "The car is locked.";};

[_Civ,[],"Scripts\Putin\putin_civ.sqf"] execVM "CB.sqf";