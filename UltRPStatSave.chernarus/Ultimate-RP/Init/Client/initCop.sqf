// By Ultimate-RP Dev Team: http://ultimate-rp.com
_PatrolCars = [PDCar1, PDCar2, PDCar3, PDCar4, PDCar5, PDCar6, PDCar7, PDCar8, PDCar9, PDCar10, PDCar11]; 
_UCCars = [UCCar1, UCCar2, UCCar3, UCCar4, UCCar5, UCCar6, UCCar7, UCCar8, UCCar9];
_PDBikes = [PDBike1, PDBike2, PDBike3];
_PDHeles = [PDHele1];

_PDVcls = _PatrolCars + _PatrolCars + _UCCars + _PDBikes;
_K9Vcls = [K9Car1, K9Car2]; 

if (!RPM_Pilot) then {
	{player addMagazine _x} forEach CopStartGear_Mags;
	{player addWeapon _x} forEach CopStartGear_Weap;
};

if (RPM_Pilot) then {
	a20 = a20 + _PDHeles;
} else {
	if (RPM_K9) then {
		a20 = a20 + _K9Cars;
	} else {
		a20 = a20 + _PDVcls;
	};
};

player addMPEventHandler ["MPRespawn",{["Add"] call UltRP_CopCount}];  
player addMPEventHandler ["MPKilled",{["Sub"] call UltRP_CopCount}];