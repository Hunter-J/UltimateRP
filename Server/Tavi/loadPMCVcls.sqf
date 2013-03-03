_PMCCars = [PMCCar1, PMCCar2]; 

{
	clearWeaponCargo _x;
	clearMagazineCargo _x;

	_x setvariable ["Tuned", "True", true];
} forEach _PMCCars;

PMCGearbox addWeaponCargoGlobal ["g36c",1];
PMCGearbox addWeaponCargoGlobal ["rh_mp5sd6aim",1];
PMCGearbox addWeaponCargoGlobal ["rh_pdw_aim",1];
PMCGearbox addWeaponCargoGlobal ["rh_p90sdaim",1];
PMCGearbox addWeaponCargoGlobal ["rh_mp7p",1];
PMCGearbox addWeaponCargoGlobal ["rh_p226s",1];
PMCGearbox addWeaponCargoGlobal ["rh_uspm",1];
PMCGearbox addMagazineCargoGlobal ["30Rnd_556x45_g36",12];
PMCGearbox addMagazineCargoGlobal ["30rnd_9x19_mp5sd",12];
PMCGearbox addMagazineCargoGlobal ["rh_30rnd_6x35_pdw",12];
PMCGearbox addMagazineCargoGlobal ["rh_57x28mm_50rnd_sd_mag",12];
PMCGearbox addMagazineCargoGlobal ["rh_46x30mm_40rnd_pmag",8];
PMCGearbox addMagazineCargoGlobal ["rh_15rnd_9x19_usp",8];
PMCGearbox addMagazineCargoGlobal ["rh_12rnd_45cal_usp",8];