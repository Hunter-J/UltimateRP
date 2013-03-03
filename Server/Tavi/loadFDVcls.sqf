_FDCars = [FDCar1, FDCar2, FDCar3, FDCar4, FDCar5]; 

{
	_x setvariable ["Tuned", "True", true];
	_x allowDamage false;
	_x addEventHandler ["hit", {_x setDammage -4000}]; 
	_x addEventHandler ["dammaged", {_x setDammage -4000}];
	
} forEach _FDCars;