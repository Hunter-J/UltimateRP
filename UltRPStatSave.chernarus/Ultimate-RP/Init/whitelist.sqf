//By OneShot.J

_id = getPlayerUID player;

_Admins = [
"15934726", //OneShot.J
"32388422", //Scott.E
"87740038" //Kratzer
];

_PD = [
"2314432", //Turoczi
"4283968", //LaLa.N
"14941318", //Domo
"32388422", //Scott.E
"243265", //Murdock
"3392128", //Hunter
"87740038", //Kratzer
"77240838", //State Trooper aka J.Moore
"120833", //RockSteel
"36111430", //S2h2h
"61877894" //Anderson
];

_PMC = [
"15934726", //OneShot.J
"2167745" //Potter
];

_FD = [
"10602374", //Shouri
"5700736", //hariot
"192129", //McLean
"78491014", //Cline.M
"4003142", //Mrs. Aqua
"584129" //C.Fraser
];

waitUntil {!isNull player};
waitUntil {(getPlayerUID player) != ""};
waitUntil {((alive player) or (local server))};

if (!(_id in _Admins)) then {
	if (!(_id == "2314432") and player == cop3) then {
		titletext ["THIS SLOT IS RESERVED FOR TUROCZI!", "BLACK", 1];
		player enableSimulation false;
		endMission "LOSER";
	};
	if (!(_id == "32388422") and player == cop4) then {
		titletext ["THIS SLOT IS RESERVED FOR SCOTT.E!", "BLACK", 1];
		player enableSimulation false;
		endMission "LOSER";
	};
	if (!(_id == "78491014") and player == ff1) then {
		titletext ["THIS SLOT IS RESERVED FOR T.McLean!", "BLACK", 1];
		player enableSimulation false;
		endMission "LOSER";
	};

	
	if (!(_id in _PD) and RPM_Cop) then {
		titletext ["YOU ARE NOT ALLOWED TO PLAY ON THIS SIDE (BLUFOR)!", "BLACK", 1];
		player enableSimulation false;
		endMission "LOSER";
	};
	/*if (!(_id in _PMC) and isPMC) then {
		titletext ["YOU ARE NOT ALLOWED TO PLAY ON THIS SIDE (INDEPENDANT)", "BLACK", 1];
		player enableSimulation false;
		endMission "LOSER";
	};*/
	if (!(_id in _FD) and RPM_FF) then {
		titletext ["YOU ARE NOT ALLOWED TO PLAY ON THIS SIDE (OPFOR)", "BLACK", 1];
		player enableSimulation false;
		endMission "LOSER";
	};
	//PD & FD CANNOT GO CIV
	if (_id in _PD) and RPM_Civ) then {
		titletext ["YOU ARE A COP! YOU CANNOT PLAY CIV!", "BLACK", 1];
		player enableSimulation false;
		endMission "LOSER";
	};
	if (_id in _FD) and RPM_Civ) then {
		titletext ["YOU ARE A FIREFIGHTER! YOU CANNOT PLAY CIV!", "BLACK", 1];
		player enableSimulation false;
		endMission "LOSER";
	};
};