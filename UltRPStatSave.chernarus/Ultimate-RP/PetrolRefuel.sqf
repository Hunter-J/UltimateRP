// By Ultimate-RP Dev Team: http://ultimate-rp.com

_Vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 5] select 0);

_FuelStartPosVcl = getpos _Vcl;
_FuelStartPosPlayer = getpos player;

while {(fuel _Vcl) < 1} do {
	if (vehicle player != player) exitWith {
		player commandChat "Fueling was cancelled because you got in the car.";  
	};
	/*if (_Vcl distance _FuelStartPosVcl > 1) exitWith {
		player commandChat "Fueling was cancelled because your vehicle moved."; 
	};*/
	if (player distance _FuelStartPosPlayer > 1) exitWith {
		player commandChat "Fueling was cancelled because you moved away from the vehicle."; 
	};
	_Vcl setFuel ((fuel _Vcl) + 0.1);
	cutText ["Refuelling vehicle...", "PLAIN DOWN"];
	sleep 1;
};

if ((fuel _Vcl) == 1) then {
	if (isciv) then {
		['geld', -100] call INV_AddInvItem;
	};
	cutText ["Vehicle refuelled!", "PLAIN DOWN"];
};