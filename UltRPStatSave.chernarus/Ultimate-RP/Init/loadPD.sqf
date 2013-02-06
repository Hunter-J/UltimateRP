_PatrolCars = [PDCar1, PDCar2, PDCar3, PDCar4, PDCar5, PDCar6, PDCar7, PDCar8, PDCar9, PDCar10, PDCar11]; 
_K9Cars = [K9Car1, K9Car2]; 
_UCCars = [UCCar1, UCCar2, UCCar3, UCCar4, UCCar5, UCCar6, UCCar7, UCCar8, UCCar9];
_PDCars = _PatrolCars + _K9Cars + _UCCars;
_PDHeles = [PDHele1];
_PDBikes = [PDBike1, PDBike2, PDBike3];

if (isPilot) then {
	INV_VehicleArray = INV_VehicleArray + _PDHeles;
	INV_LizenzOwner = INV_LizenzOwner + ["air_support_training"];
	["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;
} else {
	INV_VehicleArray = INV_VehicleArray + _PDCars;
	INV_VehicleArray = INV_VehicleArray + _PDBikes;
	INV_LizenzOwner = INV_LizenzOwner + ["patrol_training"];
	["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;
};

if (!isPilot) then {
	{player addMagazine _x} forEach CopStartGear_Mags;
	{player addWeapon _x} forEach CopStartGear_Weap;
};