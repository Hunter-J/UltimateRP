// By Ultimate-RP Dev Team: http://ultimate-rp.com

UltRP_Actions_Add = {
	[] spawn {
		if (RPM_Civ) then {
			CivAction1 = player addaction ["Take boar meat","noscript.sqf",'_no = ceil(random 7);if (((call INV_GetOwnWeight) + ("boarmeat" call INV_getitemTypeKg)*_no) > INV_Tragfaehigkeit)exitwith{player commandChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["wildboar"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["wildboar"],  3] select 0);["boarmeat", _no] call INV_AddInvItem;player commandChat format["you got %1 boar meat", _no];',1,false,true,"",'_w = (nearestobjects [getpos player, ["wildboar"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["wildboar"],  3] select 0) <= 5 and !alive (nearestobjects [getpos player, ["wildboar"],  3] select 0)'];
			CivAction2 = player addaction ["Take cow meat","noscript.sqf",'_no = ceil(random 7);if (((call INV_GetOwnWeight) + ("cowmeat" call INV_getitemTypeKg)*_no) > INV_Tragfaehigkeit)exitwith{player commandChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["cow01"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["cow01"],  3] select 0);["cowmeat", _no] call INV_AddInvItem;player commandChat format["you got %1 cow meat", _no];',1,false,true,"",'_w = (nearestobjects [getpos player, ["cow01"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["cow01"],  3] select 0) <= 5 and !alive (nearestobjects [getpos player, ["cow01"],  3] select 0)'];

			CivAction3 = player addaction ["Process Oil","itemprocess.sqf",["Oil", "OilBarrel", "oil"],1,false,true,"","_hasOil = ('Oil' call INV_GetItemAmount) >= 4; player distance OilDealer <= 5 and _hasOil"];
			CivAction4 = player addaction ["<t color=""#FF0000"">" +"Produce Meth","Scripts\makemeth.sqf",[],1,false,true,"",'_methlab = nearestObject [player, "a2l_methlab"]; player distance _methlab <=5 and _methlab getVariable "inUse" != "True"'];

			CivAction5 = player addaction ["<t color=""#FFFF00"">" +"Refuel Vehicle ($100)","petrolrefuel.sqf","",1,false,true,"",'_Pumps = nearestobjects [getpos player, ["Land_A_Fuelstation_Feed", "cl_police_fuel_point"], 5]; _Pump1 = _Pumps select 0; _Pump2 = _Pumps select 1; _Car = nearestObject [player, "LandVehicle"]; (vehicle player == player) and (player distance _Car <= 3) and (_Car distance _Pump1 <= 5 or _Car distance _Pump2 <= 5) and (Fuel _Car <= .9)'];

			CivAction6 = player addaction ["<t color=""#FF0000"">" +"Rob Pub","robpub.sqf",[],1,false,true,"",'player distance pub1 <= 3 and call INV_isArmed'];

			CivAction7 = player addaction ["<t color=""#FF0000"">" +"Rob Gas Station","robthestations.sqf","1",1,false,true,"","call INV_isArmed and station1money >= 500 and player distance fuelshop1 <= 3"];
			CivAction8 = player addaction ["<t color=""#FF0000"">" +"Rob Gas Station","robthestations.sqf","2",1,false,true,"","call INV_isArmed and station2money >= 500 and player distance fuelshop2 <= 3"];
			CivAction9 = player addaction ["<t color=""#FF0000"">" +"Rob Gas Station","robthestations.sqf","8",1,false,true,"","call INV_isArmed and station8money >= 500 and player distance fuelshop8 <= 3"];

			CivAction10 = player addaction ["<t color=""#FF0000"">" +"Rob Gas Station","robthestations.sqf","4",1,false,true,"","call INV_isArmed and station4money >= 500 and player distance fuelshop4 <= 3"];
			CivAction11 = player addaction ["<t color=""#FF0000"">" +"Rob Gas Station","robthestations.sqf","7",1,false,true,"","call INV_isArmed and station7money >= 500 and player distance fuelshop7 <= 3"];
			CivAction12 = player addaction ["<t color=""#FF0000"">" +"Rob Gas Station","robthestations.sqf","14",1,false,true,"","call INV_isArmed and station13money >= 500 and player distance fuelshop13 <= 3"];

			CivAction13 = player addaction ["<t color=""#FF0000"">" +"Rob Bank","robbank.sqf",["Rob"],1,false,true,"",'player distance mainbank <= 3 and canUseBank and call INV_isArmed'];

			CivAction14 = player addaction ["<t color=""#FF0000"">" +"Take Cash","robbank.sqf",["Take", cashpile1],1,false,true,"",'_tgt = cursorTarget; player distance cashpile1 <= 2 and _tgt == cashpile1 and !canUseBank'];
			CivAction15 = player addaction ["<t color=""#FF0000"">" +"Take Cash","robbank.sqf",["Take", cashpile2],1,false,true,"",'_tgt = cursorTarget; player distance cashpile2 <= 2 and _tgt == cashpile2 and !canUseBank'];
			CivAction16 = player addaction ["<t color=""#FF0000"">" +"Take Cash","robbank.sqf",["Take", cashpile3],1,false,true,"",'_tgt = cursorTarget; player distance cashpile3 <= 2 and _tgt == cashpile3 and !canUseBank'];
			CivAction17 = player addaction ["<t color=""#FF0000"">" +"Take Cash","robbank.sqf",["Take", cashpile4],1,false,true,"",'_tgt = cursorTarget; player distance cashpile4 <= 2 and _tgt == cashpile4 and !canUseBank'];
			CivAction18 = player addaction ["<t color=""#FF0000"">" +"Take Cash","robbank.sqf",["Take", cashpile5],1,false,true,"",'_tgt = cursorTarget; player distance cashpile5 <= 2 and _tgt == cashpile5 and !canUseBank'];
			CivAction19 = player addaction ["<t color=""#FF0000"">" +"Take Cash","robbank.sqf",["Take", cashpile6],1,false,true,"",'_tgt = cursorTarget; player distance cashpile6 <= 2 and _tgt == cashpile6 and !canUseBank'];
			CivAction20 = player addaction ["<t color=""#FF0000"">" +"Take Cash","robbank.sqf",["Take", cashpile7],1,false,true,"",'_tgt = cursorTarget; player distance cashpile7 <= 2 and _tgt == cashpile7 and !canUseBank'];
			CivAction21 = player addaction ["<t color=""#FF0000"">" +"Take Cash","robbank.sqf",["Take", cashpile8],1,false,true,"",'_tgt = cursorTarget; player distance cashpile8 <= 2 and _tgt == cashpile8 and !canUseBank'];

			//Sabina
			TrainAction1 = player addaction ["Novy Bor (Costs $25)","Scripts\Train.sqf",["NovyBor", 25],1,false,true,"",'player distance Sabina <= 3'];
			TrainAction2 = player addaction ["Solibor (Costs $50)","Scripts\Train.sqf",["Solibor", 50],1,false,true,"",'player distance Sabina <= 3'];
			TrainAction3 = player addaction ["Kustik (Costs $75)","Scripts\Train.sqf",["Kustik", 75],1,false,true,"",'player distance Sabina <= 3'];
			TrainAction4 = player addaction ["Lyepestok (Costs $100)","Scripts\Train.sqf",["Lyepestok", 100],1,false,true,"",'player distance Sabina <= 3'];

			//Novy Bor
			TrainAction5 = player addaction ["Sabina (Costs $25)","Scripts\Train.sqf",["Sabina", 25],1,false,true,"",'player distance NovyBor <= 3'];
			TrainAction6 = player addaction ["Solibor (Costs $25)","Scripts\Train.sqf",["Solibor", 25],1,false,true,"",'player distance NovyBor <= 3'];
			TrainAction7 = player addaction ["Kustik (Costs $50)","Scripts\Train.sqf",["Kustik", 50],1,false,true,"",'player distance NovyBor <= 3'];
			TrainAction8 = player addaction ["Lyepestok (Costs $75)","Scripts\Train.sqf",["Lyepestok", 75],1,false,true,"",'player distance NovyBor <= 3'];

			//Solibor
			TrainAction9 = player addaction ["Lyepestok (Costs $50)","Scripts\Train.sqf",["Lyepestok", 50],1,false,true,"",'player distance Solibor <= 3'];
			TrainAction10 = player addaction ["Kustik (Costs $25)","Scripts\Train.sqf",["Kustik", 25],1,false,true,"",'player distance Solibor <= 3'];
			TrainAction11 = player addaction ["Novy Bor (Costs $25)","Scripts\Train.sqf",["NovyBor", 25],1,false,true,"",'player distance Solibor <= 3'];
			TrainAction12 = player addaction ["Sabina (Costs $50)","Scripts\Train.sqf",["Sabina", 50],1,false,true,"",'player distance Solibor <= 3'];

			//Kustik
			TrainAction13 = player addaction ["Lyepestok (Costs $25)","Scripts\Train.sqf",["Lyepestok", 25],1,false,true,"",'player distance Kustik <= 3'];
			TrainAction14 = player addaction ["Solibor (Costs $25)","Scripts\Train.sqf",["Solibor", 25],1,false,true,"",'player distance Kustik <= 3'];
			TrainAction15 = player addaction ["Novy Bor (Costs $50)","Scripts\Train.sqf",["NovyBor", 50],1,false,true,"",'player distance Kustik <= 3'];
			TrainAction16 = player addaction ["Sabina (Costs $75)","Scripts\Train.sqf",["Sabina", 75],1,false,true,"",'player distance Kustik <= 3'];

			//Lyepestok
			TrainAction17 = player addaction ["Kustik (Costs $25)","Scripts\Train.sqf",["Kustik", 25],1,false,true,"",'player distance Lyepestok <= 3'];
			TrainAction18 = player addaction ["Solibor (Costs $50)","Scripts\Train.sqf",["Solibor", 50],1,false,true,"",'player distance Lyepestok <= 3'];
			TrainAction19 = player addaction ["Novy Bor (Costs $75)","Scripts\Train.sqf",["NovyBor", 75],1,false,true,"",'player distance Lyepestok <= 3'];
			TrainAction20 = player addaction ["Sabina (Costs $100)","Scripts\Train.sqf",["Sabina", 100],1,false,true,"",'player distance Lyepestok <= 3'];
		};


		if (RPM_Cop or RPM_FF) then {
			EmergAction1 = player addaction ["Take Road Cone","Scripts\deleteVehicle.sqf",["roadcone", "Land_coneLight"],1,false,true,"",'player distance (nearestobjects [getpos player, ["Land_coneLight"],  3] select 0) <= 5'];
			EmergAction2 = player addaction ["<t color=""#FFFF00"">" +"Refuel Vehicle","petrolrefuel.sqf","",1,false,true,"",'_Pumps = nearestobjects [getpos player, ["Land_A_Fuelstation_Feed", "cl_police_fuel_point"], 5]; _Pump1 = _Pumps select 0; _Pump2 = _Pumps select 1; _Car = nearestObject [player, "LandVehicle"]; _tgt = cursorTarget; _tgt == _car and (vehicle player == player) and (player distance _Car <= 3) and (_Car distance _Pump1 <= 5 or _Car distance _Pump2 <= 5) and (Fuel _Car <= .9)'];
		};



		if (RPM_Cop) then {
			CopAction1 = player addaction ["<t color=""#0000FF"">" +"Reset Bank","robbank.sqf",["Reset"],1,false,true,"",'player distance mainbank <= 3 and !canUseBank'];

			CopAction2 = player addaction ["<t color=""#0000FF"">" +"Take Evidense","noscript.sqf",'player commandChat "evidence removed."; {deletevehicle _x} foreach (nearestobjects [getpos player, ["weaponholder"], 3])',1,false,true,"",'_briefcase = (nearestobjects [getpos player, ["weaponholder"], 3] select 0); player distance _briefcase <= 5'];

			CopAction3 = player addaction ["<t color=""#0000FF"">" +"Take Spike Strip","Scripts\deleteVehicle.sqf",["spikestrip", "spikestrip"],1,false,true,"",'player distance (nearestobjects [getpos player, ["spikestrip"],  5] select 0) <= 5'];
			CopAction4 = player addaction ["<t color=""#0000FF"">" +"Take Stop Sign","Scripts\deleteVehicle.sqf",["glt_roadsign_octagon", "glt_roadsign_octagon"],1,false,true,"",'player distance (nearestobjects [getpos player, ["glt_roadsign_octagon"],  5] select 0) <= 5'];
			CopAction5 = player addaction ["<t color=""#0000FF"">" +"Take Searchlight","Scripts\deleteVehicle.sqf",["SearchLight_UN_EP1", "SearchLight_UN_EP1"],1,false,true,"",'player distance (nearestobjects [getpos player, ["SearchLight_UN_EP1"],  5] select 0) <= 5'];
			CopAction6 = player addaction ["<t color=""#0000FF"">" +"Take Roadblock","Scripts\deleteVehicle.sqf",["roadblock", "Land_CncBlock_Stripes"],1,false,true,"",'player distance (nearestobjects [getpos player, ["Land_CncBlock_Stripes"],  5] select 0) <= 5'];
			CopAction7 = player addaction ["<t color=""#0000FF"">" +"Take Bar Gate","Scripts\deleteVehicle.sqf",["bargate", "ZavoraAnim"],1,false,true,"",'player distance Bargate > 5 and player distance (nearestobjects [getpos player, ["ZavoraAnim"],  5] select 0) <= 5'];

			CopAction8 = player addaction ["<t color=""#0000FF"">" +localize "STRS_addaction_trunk_see","noscript.sqf",'_vcl = nearestObject [player, "LandVehicle"];_str = format["%1_storage", _vcl];[_str] execVM "vehiclecheck.sqf";',1,false,true,"",'_vcl = nearestObject [player, "LandVehicle"];player distance _vcl <= 5 and !(_vcl in INV_VehicleArray) and _vcl in INV_ServerVclArray'];
			CopAction9 = player addaction ["<t color=""#0000FF"">" +localize "STRS_addaction_trunk_check","noscript.sqf",'_vcl = nearestObject [player, "LandVehicle"];_str = format["%1_storage", _vcl];if([_vcl,_str] call INV_RemoveIllegalStorage)then{call compile format["publicvariable ""%1"";", _str]};',1,false,true,"",'_vcl = nearestObject [player, "LandVehicle"];player distance _vcl <= 5 and !(_vcl in INV_VehicleArray) and _vcl in INV_ServerVclArray'];
			CopAction10 = player addaction ["<t color=""#0000FF"">" +"Impound Vehicle","scripts\impound.sqf",[],1,false,true,"",'_vcl = nearestObject [player, "LandVehicle"]; player distance _vcl <= 5 and count crew _vcl == 0 and _vcl in INV_ServerVclArray'];
			CopAction11 = player addaction ["<t color=""#0000FF"">" +"Pull civ out","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) execVM "pullout.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 5] select 0); player distance _vcl <= 5 and count (crew _vcl) > 0'];
			CopAction12 = player addaction ["<t color=""#0000FF"">" +"Put civ in","preArrest.sqf",nearestObject [player, "LandVehicle"],1,true,true,"",'_civ = nearestobjects [player, ["Man"], 5] - [player] select 0; _vcl = nearestObject [player, "LandVehicle"]; player distance _vcl <= 5 and !(isNull _civ) and (_civ in civarray)'];


			if (RPM_K9) then {
				K9Action1 = player addaction ["<t color=""#0000FF"">" +"Load K9","Scripts\LoadK9.sqf","Load",1,false,true,"",'_Car = nearestObject [player, "suburban_pd_k9"]; _K9 = nearestObject [player, "Pastor"]; player distance _Car <= 5 and _K9 distance _Car <= 5 and _Car getVariable "HasK9" == "False"'];
				K9Action2 = player addaction ["<t color=""#0000FF"">" +"Unload K9","Scripts\LoadK9.sqf","Unload",1,false,true,"",'_Car = nearestObject [player, "suburban_pd_k9"]; _K9 = nearestObject [player, "Pastor"]; player distance _Car <= 5 and _K9 distance _Car <= 5 and _Car getVariable "HasK9" == "True"'];
			};
		};



		AnyAction1 = player addaction ["Take Meth Lab","Scripts\deleteVehicle.sqf",["methlab", "a2l_methlab"],1,false,true,"",'player distance (nearestobjects [getpos player, ["a2l_methlab"],  3] select 0) <= 5'];
		AnyAction2 = player addaction ["Take Storage Box","Scripts\deleteVehicle.sqf",["storagebox", "UNBasicAmmunitionBox_EP1"],1,false,true,"",'_Box = nearestObject [player, "UNBasicAmmunitionBox_EP1"]; _Owner = _Box getVariable "Owner"; _Owner == name player and player distance _Box <= 2'];
		AnyAction3 = player addaction ["<t color=""#FFFF00"">" +"Attach Vehicle","Scripts\tow.sqf","Attach",1,false,true,"",'_TowTruck = nearestObject [player, "il_towtruck"]; _TowTruck getVariable "Towing" == "False" and (vehicle player == player) and (player distance _TowTruck <= 5)'];
		AnyAction4 = player addaction ["<t color=""#FFFF00"">" +"Detach Vehicle","Scripts\tow.sqf","Detach",1,false,true,"",'_TowTruck = nearestObject [player, "il_towtruck"]; _TowTruck getVariable "Towing" == "True" and (vehicle player == player) and (player distance _TowTruck <= 5)'];
	};
};


UltRP_Actions_Remove = {
	[] spawn {
		if (RPM_Civ) then {
			player RemoveAction CivAction1;
			player RemoveAction CivAction2;
			player RemoveAction CivAction3;
			player RemoveAction CivAction4;
			player RemoveAction CivAction5;
			player RemoveAction CivAction6;
			player RemoveAction CivAction7;
			player RemoveAction CivAction8;
			player RemoveAction CivAction9;
			player RemoveAction CivAction10;
			player RemoveAction CivAction11;
			player RemoveAction CivAction12;
			player RemoveAction CivAction13;
			player RemoveAction CivAction14;
			player RemoveAction CivAction15;
			player RemoveAction CivAction16;
			player RemoveAction CivAction17;
			player RemoveAction CivAction18;
			player RemoveAction CivAction19;
			player RemoveAction CivAction20;
			player RemoveAction CivAction21;

			player RemoveAction TrainAction1;
			player RemoveAction TrainAction2;
			player RemoveAction TrainAction3;
			player RemoveAction TrainAction4;

			player RemoveAction TrainAction5;
			player RemoveAction TrainAction6;
			player RemoveAction TrainAction7;
			player RemoveAction TrainAction8;

			player RemoveAction TrainAction9;
			player RemoveAction TrainAction10;
			player RemoveAction TrainAction11;
			player RemoveAction TrainAction12;

			player RemoveAction TrainAction13;
			player RemoveAction TrainAction14;
			player RemoveAction TrainAction15;
			player RemoveAction TrainAction16;

			player RemoveAction TrainAction17;
			player RemoveAction TrainAction18;
			player RemoveAction TrainAction19;
			player RemoveAction TrainAction20;
		};

		if (RPM_Cop or RPM_FF) then {
			player RemoveAction EmergAction1;
			player RemoveAction EmergAction2;
		};

		if (RPM_Cop) then {
			player RemoveAction CopAction1;
			player RemoveAction CopAction2;
			player RemoveAction CopAction3;
			player RemoveAction CopAction4;
			player RemoveAction CopAction5;
			player RemoveAction CopAction6;
			player RemoveAction CopAction7;
			player RemoveAction CopAction8;
			player RemoveAction CopAction9;
			player RemoveAction CopAction10;
			player RemoveAction CopAction11;
			player RemoveAction CopAction12;

			player RemoveAction K9Action14;
			player RemoveAction K9Action15;
		};

		player RemoveAction AnyAction1;
		player RemoveAction AnyAction2;
		player RemoveAction AnyAction3;
		player RemoveAction AnyAction4;
	};
};