_PatrolCars = [PDCar1, PDCar2, PDCar3, PDCar4, PDCar5, PDCar6, PDCar7, PDCar8, PDCar9, PDCar10, PDCar11]; 
_K9Cars = [K9Car1, K9Car2]; 
_UCCars = [UCCar1, UCCar2, UCCar3, UCCar4, UCCar5, UCCar6, UCCar7, UCCar8, UCCar9];
_PDCars = _PatrolCars + _K9Cars + _UCCars;

{
	clearWeaponCargo _x;
	clearMagazineCargo _x;

	_x addWeaponCargo ["Binocular",1];
	_x addWeaponCargo ["tcg_remington",1];
	_x addWeaponCargo ["RH_m4",1];
	_x addMagazineCargo ["8Rnd_B_Beneli_74Slug",6];
	_x addMagazineCargo ["30Rnd_556x45_Stanag",6];
	_x setvariable ["Tuned", "True", true];
	
} forEach _PDCars;