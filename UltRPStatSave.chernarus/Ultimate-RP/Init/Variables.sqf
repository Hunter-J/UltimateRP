// By Ultimate-RP Dev Team: http://ultimate-rp.com

if (RPM_Cop or RPM_FF) then {
	player setVariable ["Street", "None", true];
};
player setVariable ["Surrender", "False", true];

Dispatch 		= [];
DispatchTaxi	= [];
	
isAdmin			= false;
AdminMode		= false;
Teleport 		= false;
HasTaser		= false;
HasPistol		= false;
Holster			= false;
HasHouse		= false;
KeySpam			= false;

Planting 		= false;
Mining 			= false;
Fishing 		= false;
Working 		= false;
Drilling 		= false;

INV_shortcuts	= true;

demerits 		= 10;