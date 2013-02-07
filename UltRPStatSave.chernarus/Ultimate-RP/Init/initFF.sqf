// By Ultimate-RP Dev Team: http://ultimate-rp.com
_FDCars = [FDCar1, FDCar2, FDCar3, FDCar4, FDCar5];

a20 = a20 + _FDCars;
[507, 3] call RPM_Cfg_Inv_AddItemAmount;
[510, 3] call RPM_Cfg_Inv_AddItemAmount;
[505, 2] call RPM_Cfg_Inv_AddItemAmount;

player allowDamage false;
removeAllWeapons player; 
player addEventHandler ["hit", {player setDammage -4000}]; 
player addEventHandler ["dammaged", {player setDammage -4000}];