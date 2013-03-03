// By Ultimate-RP Dev Team: http://ultimate-rp.com

UltRP_Actions = {
_Sel = _this select 0;
	switch (_Sel) do {
		case "Add": {
			if (RPM_Civ) then {
				CivAction1 = player addaction ["Take boar meat","noscript.sqf",'(nearestobjects [getpos player, ["wildboar"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic"; sleep 4; waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"}; DeleteObject (nearestobjects [getpos player, ["wildboar"],  3] select 0); [573, 1] call RPM_Cfg_Inv_AddItemAmount; player commandChat "You got some raw pork";',1,false,true,"",'_w = (nearestobjects [getpos player, ["wildboar"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["wildboar"],  3] select 0) <= 5 and !alive (nearestobjects [getpos player, ["wildboar"],  3] select 0)'];
				CivAction2 = player addaction ["Take cow meat","noscript.sqf",'(nearestobjects [getpos player, ["cow01"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic"; sleep 4; waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"}; DeleteObject (nearestobjects [getpos player, ["cow01"],  3] select 0); [574, 1] call RPM_Cfg_Inv_AddItemAmount; player commandChat "You got some raw beef";',1,false,true,"",'_w = (nearestobjects [getpos player, ["cow01"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["cow01"],  3] select 0) <= 5 and !alive (nearestobjects [getpos player, ["cow01"],  3] select 0)'];

				CivAction3 = player addaction ["<t color=""##FF2424"">" +"Produce Meth","Ultimate-RP\Drugs\MakeMeth.sqf",[],1,false,true,"",'_methlab = nearestObject [player, "a2l_methlab"]; player distance _methlab <=5 and _methlab getVariable "inUse" != "True"'];

				CivAction4 = player addaction ["<t color=""#FF2424"">" +"Refuel Vehicle ($100)","Ultimate-RP\PetrolRefuel.sqf","",1,false,true,"",'_Pumps = nearestobjects [getpos player, ["Land_A_Fuelstation_Feed", "cl_police_fuel_point"], 5]; _Pump1 = _Pumps select 0; _Pump2 = _Pumps select 1; _Car = nearestObject [player, "LandVehicle"]; (vehicle player == player) and (player distance _Car <= 3) and (_Car distance _Pump1 <= 5 or _Car distance _Pump2 <= 5) and (Fuel _Car <= .9)'];

				CivAction5 = pub1 addaction ["<t color=""##FF2424"">" +"Rob Pub","Ultimate-RP\Rob.sqf","Pub",1,false,true,"",'RPM_Role call RPM_Cfg_Objects_IsArmed'];

				CivAction6 = npc_petrol1 addaction ["<t color=""##FF2424"">" +"Rob Gas Station","Ultimate-RP\Rob.sqf",["Station", 1],1,false,true,"","player distance npc_petrol1 <= 5 and RPM_Role call RPM_Cfg_Objects_IsArmed"];
				CivAction7 = npc_petrol2 addaction ["<t color=""##FF2424"">" +"Rob Gas Station","Ultimate-RP\Rob.sqf",["Station", 2],1,false,true,"","player distance npc_petrol2 <= 5 and RPM_Role call RPM_Cfg_Objects_IsArmed"];
				CivAction8 = npc_petrol3 addaction ["<t color=""##FF2424"">" +"Rob Gas Station","Ultimate-RP\Rob.sqf",["Station", 8],1,false,true,"","player distance npc_petrol3 <= 5 and RPM_Role call RPM_Cfg_Objects_IsArmed"];
				CivAction9 = npc_petrol4 addaction ["<t color=""##FF2424"">" +"Rob Gas Station","Ultimate-RP\Rob.sqf",["Station", 4],1,false,true,"","player distance npc_petrol4 <= 5 and RPM_Role call RPM_Cfg_Objects_IsArmed"];
				CivAction10 = npc_petrol5 addaction ["<t color=""##FF2424"">" +"Rob Gas Station","Ultimate-RP\Rob.sqf",["Station", 7],1,false,true,"","player distance npc_petrol5 <= 5 and RPM_Role call RPM_Cfg_Objects_IsArmed"];
				CivAction11 = npc_petrol6 addaction ["<t color=""##FF2424"">" +"Rob Gas Station","Ultimate-RP\Rob.sqf",["Station", 13],1,false,true,"","player distance npc_petrol6 <= 5 and RPM_Role call RPM_Cfg_Objects_IsArmed"];

				CivAction12 = player addaction ["<t color=""##FF2424"">" +"Rob Bank","Ultimate-RP\Rob.sqf",["Bank", "Rob"],1,false,true,"",'player distance mainbank <= 5 and canUseBank and RPM_Role call RPM_Cfg_Objects_IsArmed'];

				CivAction13 = cashpile1 addaction ["<t color=""##FF2424"">" +"Take Cash","Ultimate-RP\Rob.sqf",["Bank", "Take", cashpile1],1,false,true,"",'!canUseBank'];
				CivAction14 = cashpile2 addaction ["<t color=""##FF2424"">" +"Take Cash","Ultimate-RP\Rob.sqf",["Bank", "Take", cashpile2],1,false,true,"",'!canUseBank'];
				CivAction15 = cashpile3 addaction ["<t color=""##FF2424"">" +"Take Cash","Ultimate-RP\Rob.sqf",["Bank", "Take", cashpile3],1,false,true,"",'!canUseBank'];
				CivAction16 = cashpile4 addaction ["<t color=""##FF2424"">" +"Take Cash","Ultimate-RP\Rob.sqf",["Bank", "Take", cashpile4],1,false,true,"",'!canUseBank'];
				CivAction17 = cashpile5 addaction ["<t color=""##FF2424"">" +"Take Cash","Ultimate-RP\Rob.sqf",["Bank", "Take", cashpile5],1,false,true,"",'!canUseBank'];
				CivAction18 = cashpile6 addaction ["<t color=""##FF2424"">" +"Take Cash","Ultimate-RP\Rob.sqf",["Bank", "Take", cashpile6],1,false,true,"",'!canUseBank'];
				CivAction19 = cashpile7 addaction ["<t color=""##FF2424"">" +"Take Cash","Ultimate-RP\Rob.sqf",["Bank", "Take", cashpile7],1,false,true,"",'!canUseBank'];
				CivAction20 = cashpile8 addaction ["<t color=""##FF2424"">" +"Take Cash","Ultimate-RP\Rob.sqf",["Bank", "Take", cashpile8],1,false,true,"",'!canUseBank'];

				//Kamenka
				TrainAction1 = Kamenka addaction ["Komarovo (Costs $25)","Ultimate-RP\Train.sqf",["Komarovo", 25],1,false,true,"",''];
				TrainAction2 = Kamenka addaction ["Balota (Costs $50)","Ultimate-RP\Train.sqf",["Balota", 50],1,false,true,"",''];
				TrainAction3 = Kamenka addaction ["Cherno (Costs $75)","Ultimate-RP\Train.sqf",["Cherno", 75],1,false,true,"",''];
				TrainAction4 = Kamenka addaction ["Prigorodki (Costs $100)","Ultimate-RP\Train.sqf",["Prigorodki", 100],1,false,true,"",''];
				TrainAction5 = Kamenka addaction ["Elektro (Costs $125)","Ultimate-RP\Train.sqf",["Elektro", 125],1,false,true,"",''];
				TrainAction6 = Kamenka addaction ["Kamyshovo (Costs $150)","Ultimate-RP\Train.sqf",["Kamyshovo", 150],1,false,true,"",''];
				TrainAction7 = Kamenka addaction ["Solnichniy (Costs $175)","Ultimate-RP\Train.sqf",["Solnichniy", 175],1,false,true,"",''];
				TrainAction8 = Kamenka addaction ["Nizhnoye (Costs $200)","Ultimate-RP\Train.sqf",["Nizhnoye", 200],1,false,true,"",''];
				TrainAction9 = Kamenka addaction ["Berezino (Costs $225)","Ultimate-RP\Train.sqf",["Berezino", 225],1,false,true,"",''];

				//Komarovo
				TrainAction10 = Komarovo addaction ["Kamenka (Costs $25)","Ultimate-RP\Train.sqf",["Kamenka", 25],1,false,true,"",''];
				TrainAction11 = Komarovo addaction ["Balota (Costs $25)","Ultimate-RP\Train.sqf",["Balota", 25],1,false,true,"",''];
				TrainAction12 = Komarovo addaction ["Cherno (Costs $50)","Ultimate-RP\Train.sqf",["Cherno", 50],1,false,true,"",''];
				TrainAction13 = Komarovo addaction ["Prigorodki (Costs $75)","Ultimate-RP\Train.sqf",["Prigorodki", 75],1,false,true,"",''];
				TrainAction14 = Komarovo addaction ["Elektro (Costs $100)","Ultimate-RP\Train.sqf",["Elektro", 100],1,false,true,"",''];
				TrainAction15 = Komarovo addaction ["Kamyshovo (Costs $125)","Ultimate-RP\Train.sqf",["Kamyshovo", 125],1,false,true,"",''];
				TrainAction16 = Komarovo addaction ["Solnichniy (Costs $150)","Ultimate-RP\Train.sqf",["Solnichniy", 150],1,false,true,"",''];
				TrainAction17 = Komarovo addaction ["Nizhnoye (Costs $175)","Ultimate-RP\Train.sqf",["Nizhnoye", 175],1,false,true,"",''];
				TrainAction18 = Komarovo addaction ["Berezino (Costs $200)","Ultimate-RP\Train.sqf",["Berezino", 200],1,false,true,"",''];

				//Balota
				TrainAction19 = Balota addaction ["Kamenka (Costs $50)","Ultimate-RP\Train.sqf",["Kamenka", 50],1,false,true,"",''];
				TrainAction20 = Balota addaction ["Komarovo (Costs $25)","Ultimate-RP\Train.sqf",["Komarovo", 25],1,false,true,"",''];
				TrainAction21 = Balota addaction ["Cherno (Costs $25)","Ultimate-RP\Train.sqf",["Cherno", 25],1,false,true,"",''];
				TrainAction22 = Balota addaction ["Prigorodki (Costs $50)","Ultimate-RP\Train.sqf",["Prigorodki", 50],1,false,true,"",''];
				TrainAction23 = Balota addaction ["Elektro (Costs $75)","Ultimate-RP\Train.sqf",["Elektro", 75],1,false,true,"",''];
				TrainAction24 = Balota addaction ["Kamyshovo (Costs $100)","Ultimate-RP\Train.sqf",["Kamyshovo", 100],1,false,true,"",''];
				TrainAction25 = Balota addaction ["Solnichniy (Costs $125)","Ultimate-RP\Train.sqf",["Solnichniy", 125],1,false,true,"",''];
				TrainAction26 = Balota addaction ["Nizhnoye (Costs $150)","Ultimate-RP\Train.sqf",["Nizhnoye", 150],1,false,true,"",''];
				TrainAction27 = Balota addaction ["Berezino (Costs $175)","Ultimate-RP\Train.sqf",["Berezino", 175],1,false,true,"",''];

				//Cherno
				TrainAction28 = Cherno addaction ["Kamenka (Costs $75)","Ultimate-RP\Train.sqf",["Kamenka", 75],1,false,true,"",''];
				TrainAction29 = Cherno addaction ["Komarovo (Costs $50)","Ultimate-RP\Train.sqf",["Komarovo", 50],1,false,true,"",''];
				TrainAction30 = Cherno addaction ["Balota (Costs $25)","Ultimate-RP\Train.sqf",["Balota", 25],1,false,true,"",''];
				TrainAction31 = Cherno addaction ["Prigorodki (Costs $25)","Ultimate-RP\Train.sqf",["Prigorodki", 25],1,false,true,"",''];
				TrainAction32 = Cherno addaction ["Elektro (Costs $50)","Ultimate-RP\Train.sqf",["Elektro", 50],1,false,true,"",''];
				TrainAction33 = Cherno addaction ["Kamyshovo (Costs $75)","Ultimate-RP\Train.sqf",["Kamyshovo", 75],1,false,true,"",''];
				TrainAction34 = Cherno addaction ["Solnichniy (Costs $100)","Ultimate-RP\Train.sqf",["Solnichniy", 100],1,false,true,"",''];
				TrainAction35 = Cherno addaction ["Nizhnoye (Costs $125)","Ultimate-RP\Train.sqf",["Nizhnoye", 125],1,false,true,"",''];
				TrainAction36 = Cherno addaction ["Berezino (Costs $150)","Ultimate-RP\Train.sqf",["Berezino", 150],1,false,true,"",''];

				//Prigorodki
				TrainAction28 = Prigorodki addaction ["Kamenka (Costs $100)","Ultimate-RP\Train.sqf",["Kamenka", 100],1,false,true,"",''];
				TrainAction29 = Prigorodki addaction ["Komarovo (Costs $75)","Ultimate-RP\Train.sqf",["Komarovo", 75],1,false,true,"",''];
				TrainAction30 = Prigorodki addaction ["Balota (Costs $50)","Ultimate-RP\Train.sqf",["Balota", 50],1,false,true,"",''];
				TrainAction31 = Prigorodki addaction ["Cherno (Costs $25)","Ultimate-RP\Train.sqf",["Cherno", 25],1,false,true,"",''];
				TrainAction32 = Prigorodki addaction ["Elektro (Costs $25)","Ultimate-RP\Train.sqf",["Elektro", 25],1,false,true,"",''];
				TrainAction33 = Prigorodki addaction ["Kamyshovo (Costs $50)","Ultimate-RP\Train.sqf",["Kamyshovo", 50],1,false,true,"",''];
				TrainAction34 = Prigorodki addaction ["Solnichniy (Costs $75)","Ultimate-RP\Train.sqf",["Solnichniy", 75],1,false,true,"",''];
				TrainAction35 = Prigorodki addaction ["Nizhnoye (Costs $100)","Ultimate-RP\Train.sqf",["Nizhnoye", 100],1,false,true,"",''];
				TrainAction36 = Prigorodki addaction ["Berezino (Costs $125)","Ultimate-RP\Train.sqf",["Berezino", 125],1,false,true,"",''];

				//Elektro
				TrainAction37 = Elektro addaction ["Kamenka (Costs $125)","Ultimate-RP\Train.sqf",["Kamenka", 125],1,false,true,"",''];
				TrainAction38 = Elektro addaction ["Komarovo (Costs $100)","Ultimate-RP\Train.sqf",["Komarovo", 100],1,false,true,"",''];
				TrainAction39 = Elektro addaction ["Balota (Costs $75)","Ultimate-RP\Train.sqf",["Balota", 75],1,false,true,"",''];
				TrainAction40 = Elektro addaction ["Cherno (Costs $50)","Ultimate-RP\Train.sqf",["Cherno", 50],1,false,true,"",''];
				TrainAction31 = Elektro addaction ["Prigorodki (Costs $25)","Ultimate-RP\Train.sqf",["Prigorodki", 25],1,false,true,"",''];
				TrainAction42 = Elektro addaction ["Kamyshovo (Costs $25)","Ultimate-RP\Train.sqf",["Kamyshovo", 25],1,false,true,"",''];
				TrainAction43 = Elektro addaction ["Solnichniy (Costs $50)","Ultimate-RP\Train.sqf",["Solnichniy", 50],1,false,true,"",''];
				TrainAction44 = Elektro addaction ["Nizhnoye (Costs $75)","Ultimate-RP\Train.sqf",["Nizhnoye", 75],1,false,true,"",''];
				TrainAction45 = Elektro addaction ["Berezino (Costs $100)","Ultimate-RP\Train.sqf",["Berezino", 100],1,false,true,"",''];

				//Kamyshovo
				TrainAction46 = Kamyshovo addaction ["Kamenka (Costs $150)","Ultimate-RP\Train.sqf",["Kamenka", 150],1,false,true,"",''];
				TrainAction47 = Kamyshovo addaction ["Komarovo (Costs $125)","Ultimate-RP\Train.sqf",["Komarovo", 125],1,false,true,"",''];
				TrainAction48 = Kamyshovo addaction ["Balota (Costs $100)","Ultimate-RP\Train.sqf",["Balota", 100],1,false,true,"",''];
				TrainAction49 = Kamyshovo addaction ["Cherno (Costs $75)","Ultimate-RP\Train.sqf",["Cherno", 75],1,false,true,"",''];
				TrainAction50 = Kamyshovo addaction ["Prigorodki (Costs $50)","Ultimate-RP\Train.sqf",["Prigorodki", 50],1,false,true,"",''];
				TrainAction51 = Kamyshovo addaction ["Elektro (Costs $25)","Ultimate-RP\Train.sqf",["Elektro", 25],1,false,true,"",''];
				TrainAction52 = Kamyshovo addaction ["Solnichniy (Costs $25)","Ultimate-RP\Train.sqf",["Solnichniy", 25],1,false,true,"",''];
				TrainAction53 = Kamyshovo addaction ["Nizhnoye (Costs $50)","Ultimate-RP\Train.sqf",["Nizhnoye", 50],1,false,true,"",''];
				TrainAction54 = Kamyshovo addaction ["Berezino (Costs $75)","Ultimate-RP\Train.sqf",["Berezino", 75],1,false,true,"",''];

				//Solnichniy
				TrainAction55 = Solnichniy addaction ["Kamenka (Costs $175)","Ultimate-RP\Train.sqf",["Kamenka", 175],1,false,true,"",''];
				TrainAction56 = Solnichniy addaction ["Komarovo (Costs $150)","Ultimate-RP\Train.sqf",["Komarovo", 150],1,false,true,"",''];
				TrainAction57 = Solnichniy addaction ["Balota (Costs $125)","Ultimate-RP\Train.sqf",["Balota", 125],1,false,true,"",''];
				TrainAction58 = Solnichniy addaction ["Cherno (Costs $100)","Ultimate-RP\Train.sqf",["Cherno", 100],1,false,true,"",''];
				TrainAction59 = Solnichniy addaction ["Prigorodki (Costs $75)","Ultimate-RP\Train.sqf",["Prigorodki", 75],1,false,true,"",''];
				TrainAction60 = Solnichniy addaction ["Elektro (Costs $50)","Ultimate-RP\Train.sqf",["Elektro", 50],1,false,true,"",''];
				TrainAction61 = Solnichniy addaction ["Kamyshovo (Costs $25)","Ultimate-RP\Train.sqf",["Kamyshovo", 25],1,false,true,"",''];
				TrainAction63 = Solnichniy addaction ["Nizhnoye (Costs $25)","Ultimate-RP\Train.sqf",["Nizhnoye", 25],1,false,true,"",''];
				TrainAction64 = Solnichniy addaction ["Berezino (Costs $50)","Ultimate-RP\Train.sqf",["Berezino", 50],1,false,true,"",''];
				
				//Nizhnoye
				TrainAction64 = Nizhnoye addaction ["Kamenka (Costs $200)","Ultimate-RP\Train.sqf",["Kamenka", 200],1,false,true,"",''];
				TrainAction66 = Nizhnoye addaction ["Komarovo (Costs $175)","Ultimate-RP\Train.sqf",["Komarovo", 175],1,false,true,"",''];
				TrainAction67 = Nizhnoye addaction ["Balota (Costs $150)","Ultimate-RP\Train.sqf",["Balota", 150],1,false,true,"",''];
				TrainAction68 = Nizhnoye addaction ["Cherno (Costs $125)","Ultimate-RP\Train.sqf",["Cherno", 125],1,false,true,"",''];
				TrainAction69 = Nizhnoye addaction ["Prigorodki (Costs $100)","Ultimate-RP\Train.sqf",["Prigorodki", 100],1,false,true,"",''];
				TrainAction70 = Nizhnoye addaction ["Elektro (Costs $75)","Ultimate-RP\Train.sqf",["Elektro", 75],1,false,true,"",''];
				TrainAction71 = Nizhnoye addaction ["Kamyshovo (Costs $50)","Ultimate-RP\Train.sqf",["Kamyshovo", 50],1,false,true,"",''];
				TrainAction72 = Nizhnoye addaction ["Solnichniy (Costs $25)","Ultimate-RP\Train.sqf",["Solnichniy", 25],1,false,true,"",''];
				TrainAction73 = Nizhnoye addaction ["Berezino (Costs $25)","Ultimate-RP\Train.sqf",["Berezino", 25],1,false,true,"",''];
				
				//Berezino
				TrainAction74 = Berezino addaction ["Kamenka (Costs $220)","Ultimate-RP\Train.sqf",["Kamenka", 220],1,false,true,"",''];
				TrainAction75 = Berezino addaction ["Komarovo (Costs $200)","Ultimate-RP\Train.sqf",["Komarovo", 200],1,false,true,"",''];
				TrainAction76 = Berezino addaction ["Balota (Costs $175)","Ultimate-RP\Train.sqf",["Balota", 175],1,false,true,"",''];
				TrainAction77 = Berezino addaction ["Cherno (Costs $150)","Ultimate-RP\Train.sqf",["Cherno", 150],1,false,true,"",''];
				TrainAction78 = Berezino addaction ["Prigorodki (Costs $125)","Ultimate-RP\Train.sqf",["Prigorodki", 125],1,false,true,"",''];
				TrainAction79 = Berezino addaction ["Elektro (Costs $100)","Ultimate-RP\Train.sqf",["Elektro", 100],1,false,true,"",''];
				TrainAction80 = Berezino addaction ["Kamyshovo (Costs $75)","Ultimate-RP\Train.sqf",["Kamyshovo", 75],1,false,true,"",''];
				TrainAction81 = Berezino addaction ["Solnichniy (Costs $50)","Ultimate-RP\Train.sqf",["Solnichniy", 50],1,false,true,"",''];
				TrainAction82 = Berezino addaction ["Nizhnoye (Costs $25)","Ultimate-RP\Train.sqf",["Berezino", 25],1,false,true,"",''];
			};


			if (RPM_Cop or RPM_FF) then {
				EmergAction1 = player addaction ["Take Road Cone","Ultimate-RP\DeleteObject.sqf",["roadcone", "Land_coneLight"],1,false,true,"",'player distance (nearestobjects [getpos player, ["Land_coneLight"],  3] select 0) <= 5'];
				EmergAction2 = player addaction ["<t color=""#FF2424"">" +"Refuel Vehicle","Ultimate-RP\PetrolRefuel.sqf","",1,false,true,"",'_Pumps = nearestobjects [getpos player, ["Land_A_Fuelstation_Feed", "cl_police_fuel_point"], 5]; _Pump1 = _Pumps select 0; _Pump2 = _Pumps select 1; _Car = nearestObject [player, "LandVehicle"]; _tgt = cursorTarget; _tgt == _car and (vehicle player == player) and (player distance _Car <= 3) and (_Car distance _Pump1 <= 5 or _Car distance _Pump2 <= 5) and (Fuel _Car <= .9)'];
			};



			if (RPM_Cop) then {
				CopAction1 = player addaction ["<t color=""#FF2424"">" +"Reset Bank","robbank.sqf",["Reset"],1,false,true,"",'player distance mainbank <= 3 and !canUseBank'];

				CopAction2 = player addaction ["<t color=""#FF2424"">" +"Take Evidense","noscript.sqf",'player commandChat "evidence removed."; {DeleteObject _x} foreach (nearestobjects [getpos player, ["weaponholder"], 3])',1,false,true,"",'_briefcase = (nearestobjects [getpos player, ["weaponholder"], 3] select 0); player distance _briefcase <= 5'];

				CopAction3 = player addaction ["<t color=""#FF2424"">" +"Take Spike Strip","Ultimate-RP\DeleteObject.sqf",["spikestrip", "spikestrip"],1,false,true,"",'player distance (nearestobjects [getpos player, ["spikestrip"],  5] select 0) <= 5'];
				CopAction4 = player addaction ["<t color=""#FF2424"">" +"Take Stop Sign","Ultimate-RP\DeleteObject.sqf",["glt_roadsign_octagon", "glt_roadsign_octagon"],1,false,true,"",'player distance (nearestobjects [getpos player, ["glt_roadsign_octagon"],  5] select 0) <= 5'];
				CopAction5 = player addaction ["<t color=""#FF2424"">" +"Take Searchlight","Ultimate-RP\DeleteObject.sqf",["SearchLight_UN_EP1", "SearchLight_UN_EP1"],1,false,true,"",'player distance (nearestobjects [getpos player, ["SearchLight_UN_EP1"],  5] select 0) <= 5'];
				CopAction6 = player addaction ["<t color=""#FF2424"">" +"Take Roadblock","Ultimate-RP\DeleteObject.sqf",["roadblock", "Land_CncBlock_Stripes"],1,false,true,"",'player distance (nearestobjects [getpos player, ["Land_CncBlock_Stripes"],  5] select 0) <= 5'];
				CopAction7 = player addaction ["<t color=""#FF2424"">" +"Take Bar Gate","Ultimate-RP\DeleteObject.sqf",["bargate", "ZavoraAnim"],1,false,true,"",'player distance Bargate > 5 and player distance (nearestobjects [getpos player, ["ZavoraAnim"],  5] select 0) <= 5'];
				CopAction8 = player addaction ["<t color=""#FF2424"">" +"Pull Civ Out","Ultimate-RP\Police\Pullout\pullout_cop.sqf","",1,true,true,"",'_Vcl = nearestObject [player, "LandVehicle"]; player distance _Vcl <= 5 and count (crew _Vcl) > 0 and (call INV_isArmed)'];
				CopAction9 = player addaction ["<t color=""#FF2424"">" +"Put Civ In","Ultimate-RP\Police\Putin\putin_cop.sqf","",1,true,true,"",'_civ = nearestobjects [player, ["Man"], 5] - [player] select 0; _vcl = nearestObject [player, "LandVehicle"]; player distance _vcl <= 5 and !(isNull _civ) and (_civ in RPM_POBJArrCiv) and animationstate _civ == "civillying01"'];
	
			};
			
			if (RPM_FF) then {
				FFAction1 = player addaction ["<t color=""#FF2424"">" +"Attach Vehicle","Scripts\tow.sqf","Attach",1,false,true,"",'_TowTruck = nearestObject [player, "il_towtruck"]; _TowTruck getVariable "Towing" == "False" and (vehicle player == player) and (player distance _TowTruck <= 5)'];
				FFAction2 = player addaction ["<t color=""#FF2424"">" +"Detach Vehicle","Scripts\tow.sqf","Detach",1,false,true,"",'_TowTruck = nearestObject [player, "il_towtruck"]; _TowTruck getVariable "Towing" == "True" and (vehicle player == player) and (player distance _TowTruck <= 5)'];

				FFAction3 = FDAirShop addaction ["<t color=""#FF2424"">" +"Go to Helipad","Scripts\FDTele.sqf","To",1,false,true,"",''];
				FFAction4 = FDTeleTop addaction ["<t color=""#FF2424"">" +"Go back down","Scripts\FDTele.sqf","From",1,false,true,"",''];
			};



			AnyAction1 = player addaction ["Take Meth Lab","Ultimate-RP\DeleteObject.sqf",["methlab", "a2l_methlab"],1,false,true,"",'player distance (nearestobjects [getpos player, ["a2l_methlab"],  3] select 0) <= 5'];
			AnyAction2 = player addaction ["Take Storage Box","Ultimate-RP\DeleteObject.sqf",["storagebox", "UNBasicAmmunitionBox_EP1"],1,false,true,"",'_Box = nearestObject [player, "UNBasicAmmunitionBox_EP1"]; _Owner = _Box getVariable "Owner"; _Owner == name player and player distance _Box <= 2'];
		};
	
		case "Remove": {
			if (RPM_Civ) then {
				player RemoveAction CivAction1;
				player RemoveAction CivAction2;
				player RemoveAction CivAction3;
				player RemoveAction CivAction4;
				pub1 RemoveAction CivAction5;
				npc_petrol1 RemoveAction CivAction6;
				npc_petrol2 RemoveAction CivAction7;
				npc_petrol3 RemoveAction CivAction8;
				npc_petrol4 RemoveAction CivAction9;
				npc_petrol5 RemoveAction CivAction10;
				npc_petrol6 RemoveAction CivAction11;
				player RemoveAction CivAction12;
				cashpile1 RemoveAction CivAction13;
				cashpile2 RemoveAction CivAction14;
				cashpile3 RemoveAction CivAction15;
				cashpile4 RemoveAction CivAction16;
				cashpile5 RemoveAction CivAction17;
				cashpile6 RemoveAction CivAction18;
				cashpile7 RemoveAction CivAction19;
				cashpile8 RemoveAction CivAction20;

				Kamenka RemoveAction TrainAction1;
				Kamenka RemoveAction TrainAction2;
				Kamenka RemoveAction TrainAction3;
				Kamenka RemoveAction TrainAction4;
				Kamenka RemoveAction TrainAction5;
				Kamenka RemoveAction TrainAction6;
				Kamenka RemoveAction TrainAction7;
				Kamenka RemoveAction TrainAction8;
				Kamenka RemoveAction TrainAction9;
				
				Komarovo RemoveAction TrainAction10;
				Komarovo RemoveAction TrainAction11;
				Komarovo RemoveAction TrainAction12;
				Komarovo RemoveAction TrainAction13;
				Komarovo RemoveAction TrainAction14;
				Komarovo RemoveAction TrainAction15;
				Komarovo RemoveAction TrainAction16;
				Komarovo RemoveAction TrainAction17;
				Komarovo RemoveAction TrainAction18;
				
				Balota RemoveAction TrainAction19;
				Balota RemoveAction TrainAction20;
				Balota RemoveAction TrainAction21;
				Balota RemoveAction TrainAction22;
				Balota RemoveAction TrainAction23;
				Balota RemoveAction TrainAction24;
				Balota RemoveAction TrainAction25;
				Balota RemoveAction TrainAction26;
				Balota RemoveAction TrainAction27;
				
				Cherno RemoveAction TrainAction28;
				Cherno RemoveAction TrainAction29;
				Cherno RemoveAction TrainAction30;
				Cherno RemoveAction TrainAction31;
				Cherno RemoveAction TrainAction32;
				Cherno RemoveAction TrainAction33;
				Cherno RemoveAction TrainAction34;
				Cherno RemoveAction TrainAction35;
				Cherno RemoveAction TrainAction36;
				
				Prigorodki RemoveAction TrainAction37;
				Prigorodki RemoveAction TrainAction38;
				Prigorodki RemoveAction TrainAction39;
				Prigorodki RemoveAction TrainAction40;
				Prigorodki RemoveAction TrainAction41;
				Prigorodki RemoveAction TrainAction42;
				Prigorodki RemoveAction TrainAction43;
				Prigorodki RemoveAction TrainAction44;
				Prigorodki RemoveAction TrainAction45;
				
				Elektro RemoveAction TrainAction46;
				Elektro RemoveAction TrainAction47;
				Elektro RemoveAction TrainAction48;
				Elektro RemoveAction TrainAction49;
				Elektro RemoveAction TrainAction50;
				Elektro RemoveAction TrainAction51;
				Elektro RemoveAction TrainAction52;
				Elektro RemoveAction TrainAction53;
				Elektro RemoveAction TrainAction54;
				
				Kamyshovo RemoveAction TrainAction55;
				Kamyshovo RemoveAction TrainAction56;
				Kamyshovo RemoveAction TrainAction57;
				Kamyshovo RemoveAction TrainAction58;
				Kamyshovo RemoveAction TrainAction59;
				Kamyshovo RemoveAction TrainAction60;
				Kamyshovo RemoveAction TrainAction61;
				Kamyshovo RemoveAction TrainAction62;
				Kamyshovo RemoveAction TrainAction63;
				
				Solnichniy RemoveAction TrainAction64;
				Solnichniy RemoveAction TrainAction65;
				Solnichniy RemoveAction TrainAction66;
				Solnichniy RemoveAction TrainAction67;
				Solnichniy RemoveAction TrainAction68;
				Solnichniy RemoveAction TrainAction69;
				Solnichniy RemoveAction TrainAction70;
				Solnichniy RemoveAction TrainAction71;
				Solnichniy RemoveAction TrainAction72;
				
				Nizhnoye RemoveAction TrainAction73;
				Nizhnoye RemoveAction TrainAction74;
				Nizhnoye RemoveAction TrainAction75;
				Nizhnoye RemoveAction TrainAction76;
				Nizhnoye RemoveAction TrainAction77;
				Nizhnoye RemoveAction TrainAction78;
				Nizhnoye RemoveAction TrainAction79;
				Nizhnoye RemoveAction TrainAction80;
				Nizhnoye RemoveAction TrainAction81;
				
				Berezino RemoveAction TrainAction82;
				Berezino RemoveAction TrainAction83;
				Berezino RemoveAction TrainAction84;
				Berezino RemoveAction TrainAction85;
				Berezino RemoveAction TrainAction86;
				Berezino RemoveAction TrainAction87;
				Berezino RemoveAction TrainAction88;
				Berezino RemoveAction TrainAction89;
				Berezino RemoveAction TrainAction90;
				
				
				
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
			};
			
			if (RPM_FF) then {
				player RemoveAction FFAction1;
				player RemoveAction FFAction2;
				player RemoveAction FFAction3;
				player RemoveAction FFAction4;
			};

			player RemoveAction AnyAction1;
			player RemoveAction AnyAction2;
		};
	};
};