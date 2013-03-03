UltRP_DebugLoop = {
	[] spawn {
		while {true} do {
		_tgt = typeOf cursorTarget;
		_path = (getText (configFile >> "CfgVehicles" >> _tgt >> "model"));
			//hint format ["%1", _tgt];
			//hint format ["%1", _path];
			sleep .5;
		};
	};
};

UltRP_BroadcastLoop = {
	[] spawn {
	_Message1 = ["Remember to check out our forums at: http://www.ultimate-rp.com!"];
	_Message2 = ["Our Stat Save mission is nearing completion! More info at: http://www.ultimate-rp.com!"];
	_Message3 = ["Have you tried the Go-Kart track? You can find it in Shtangrad!"];
	_Message4 = ["Have you tried the Paint Ball Arena? You can find it in Lyepestok! (6 players required)"];
	_Message5 = ["Houses can be purchased south of the American Dealer! (6 in total)"];
	_Message6 = ["2 cops must be online to rob gas stations and pubs, but 3 must be online to rob the bank. 3 cops must also be online to take hostages or perform jail breaks."];
	_Message7 = ["Car too slow? Buy a speed upgrade from the performance shop in lyepestok!"];
	_Message8 = ["Hunting, Fishing and mining are all legitimate ways to earn income!"];\
	_Message9 = ["Death Matching is a bannable offense, don't do it!"];
	_Message10 = ["Report bugs!"];
	_Message11 = ["The bridge makes a great drag strip..."];
	_Message12 = ["You can refuel your car at any gas station, but only the 6 gas stations in Sabina and Lyepestok have shops and can be robbed."];
	_Message13 = ["Feeling lonely? Start a gang! (They're free to make)"];
	_Message14 = ["Don't forget to eat once in a while! (You might die otherwise..)"];
	_Message15 = ["TAKING GEAR FROM PD CARS OR LOCKED CARS IS NOT ALLOWED!"];
	_Message16 = ["USE OF STUN WEAPONS BY CIVILIANS IS NOT ALLOWED!"];
	_Message17 = ["Admins have final say!"];
	_Message18 = ["Being in a gang does not exempt you from the Death Matching rule! Do not kill police officers unless ABSOLUTELY NECESSARY for your ROLEPLAY!"];
	_Messages = _Message1 + _Message2 + _Message3 + _Message4 + _Message5 + _Message6 + _Message7 + _Message8 + _Message9 + _Message10 + _Message11 + _Message12 + _Message13 + _Message14 + _Message15 + _Message16 + _Message17 + _Message18;
	_Random = _Messages call BIS_fnc_selectRandom;
		while {true} do {
			sleep 1800;
			Broadcast = _Random;
			publicVariable "Broadcast";
		};
	};
};