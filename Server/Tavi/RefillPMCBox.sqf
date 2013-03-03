_Weps = [
"G36C",
"RH_mp5sd6aim",
"RH_PDW_AIM",
"RH_p90sdaim",
"RH_mp7p",
"RH_p226s",
"RH_uspm"
];

_Mags = [
"30Rnd_556x45_G36",
"30Rnd_9x19_MP5SD",
"RH_30Rnd_6x35_PDW",
"RH_57x28mm_50RND_SD_Mag"
];

_PMags = [
"RH_46x30mm_40RND_pMag",
"rh_15Rnd_9x19_usp",
"rh_12Rnd_45cal_usp"
];


while {true} do {
_Weps	= (getWeaponCargo PMCGearbox) select 0;
_Mags	= (getMagazineCargo PMCGearBox) select 0;
	//Weapons
	{
		if (!(_x in _Weps)) then {
			PMCGearbox addWeaponCargoGlobal [_x, 1];
		};
	} forEach _Weps;

	//Mags
	{
		if (!(_x in _Mags)) then {
			PMCGearbox addMagazineCargoGlobal [_x, 12];
		};
	} forEach _Mags;

	//Pistol Mags
	{
		if (!(_x in _Mags)) then {
			PMCGearbox addMagazineCargoGlobal [_x, 8];
		};
	} forEach _PMags;
	sleep 2;
};