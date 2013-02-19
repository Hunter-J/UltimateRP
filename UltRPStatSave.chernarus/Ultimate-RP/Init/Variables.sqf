// By Ultimate-RP Dev Team: http://ultimate-rp.com

//Server Variables
if (isDedicated or isServer) then {
	canUseBank = true;
	publicvariable "canUseBank";

	wanted_array = [];
	publicvariable "wanted_array";

	copcount = 0;
	publicvariable "copcount";
	
	speedcamarray = [speedcam1, speedcam2, speedcam3, speedcam4, speedcam5];
	
	_Houses = [House1, House2, House3, House4, House5, House6];
	{
		_x setVariable ["Owner", "None", true];
		_x setVariable ["FLock", "Locked", true];
		_x setVariable ["BLock", "Locked", true];
	} forEach _Houses;
};

//Client Variables (Can also be used by the server)
isAdmin = false;
Teleport = false;

Planting = false;
Mining = false;
Fishing = false;
Working = false;
Drilling = false;

INV_shortcuts = true;

demerits = 10;