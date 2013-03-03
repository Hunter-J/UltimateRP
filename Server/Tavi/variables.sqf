//By OneShot.J
isAdmin		= true;
AdminMode	= false;

copcount = 0;
publicvariable "copcount";

wanted_array = [];
publicvariable "wanted_array";

station1money = 500;
publicvariable "station1money";
station2money = 500;
publicvariable "station2money";
station8money = 500;
publicvariable "station8money";
station4money = 500;
publicvariable "station4money";
station7money = 500;
publicvariable "station7money";
station13money = 500;
publicvariable "station13money";

bodynum = 0;
publicvariable "bodynum";

pharmmoney = 500;
publicvariable "pharmmoney";

barmoney = 500;
publicvariable "barmoney";

canUseBank = true;
publicvariable "canUseBank";

RedPoints = 0;
publicvariable "RedPoints";

BluePoints = 0;
publicvariable "BluePoints";

redready = 0;
publicvariable "redready";
		
blueready = 0;
publicvariable "blueready";

publicVariable "INV_ItemTypenArray";
publicvariable "INV_itemstocks";

_Houses = [House1, House2, House3, House4, House5, House6];

{
	_x setVariable ["Owner", "None", true];
	_x setVariable ["FLock", "Locked", true];
	_x setVariable ["BLock", "Locked", true];
} forEach _Houses;

"Broadcast" addPublicVariableEventHandler {
	server globalChat (_this select 1);
};