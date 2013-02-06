_K9Cars = [K9Car1, K9Car2];

INV_VehicleArray = INV_VehicleArray + _K9Cars;
INV_LizenzOwner = INV_LizenzOwner + ["patrol_training"];
["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;

{player addMagazine _x} forEach CopStartGear_Mags;
{player addWeapon _x} forEach CopStartGear_Weap;