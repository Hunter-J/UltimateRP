_FDCars = [FDCar1, FDCar2, FDCar3, FDCar4, FDCar5];

INV_VehicleArray = INV_VehicleArray + _FDCars;
INV_LizenzOwner = INV_LizenzOwner + ["esul"];
["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;

['medikit', 10] call INV_AddInvItem;