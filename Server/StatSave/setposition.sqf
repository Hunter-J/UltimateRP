//By OneShot.J

_PDShops = [
pdtele,
pdtele2,
PDAirShop,
PDCarShop,
PDK9CarShop,
PDUCCarShop,
PDBikeShop,
SwatGearShop
];

_FDShops = [
FDCarShop,
FDAirShop,
FDEquipmentShop,
FDTeleTop
];

_CarShops = [
AmerDealer,
JapDealer,
EuroDealer,
ExecDealer,
UsedDealer,
BicycleShop,
pickupshop1,
truckshop,
GoCartDealer,
BikeDealer,
BikeDealer2,
QuadDealer
];

_AirShops = [
airshop1,
airshop2,
airshop3,
airshop4,
airshop5,
airshop6,
airshop7,
airshop8,
airshop9,
airshop10,
airshop11,
airshop12
];

_BoatShops = [
boatshop1,
boatshop2,
boatshop3,
jetskishop1,
jetskishop2,
jetskishop3
];

_GunShops = [
gundealer1,
gundealer2,
vending2,
paintballs
];

_Misc = [
dmv,
EquipmentShop1,
EquipmentShop2,
FoodShop1,
FoodShop2,
OilDealer,
tuning1,
resourcesell,
shop1,
fuelshop21
];

_DrugDealers = [
mdrugsell,
hdrugsell,
cdrugsell,
methsell,
whalesell
];

_Factories = [
itemfactory,
Vehiclefactory,
Vehiclefactory3,
Vehiclefactory4,
Pistolfactory,
resourcefac,
alcoholfactory,
Autofactory,
Semifactory
];

_Shops = _PDShops + _FDShops + _CarShops + _AirShops + _BoatShops + _GunShops + _Misc + _DrugDealers + _Factories;
//Set shop positions
{
	_x setVariable ["InitPos", getPos _x];
} forEach _Shops;


//Check if a shop is moved
while {true} do {
	{
	_PosVar = _x getVariable "InitPos";
		if ((getPos _x) distance (_x getVariable "InitPos") > 1) then {
			_x setpos _PosVar;
		};
	} forEach _Shops;
	sleep 1;
};