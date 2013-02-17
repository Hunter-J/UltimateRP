// By Ultimate-RP Dev Team: http://ultimate-rp.com
if (!RPM_Cop) exitwith {};

UltRP_Dispatch_Rob = {
_Sel = _this select 0;
	if (_Sel == "Pub" or _Sel == "Bank") then {
		_Sex = _this select 2;
		_Description = _this select 3;
	} else {
		_Sex = _this select 3;
		_Description = _this select 4;
		_Station = _this select 2;
	};
	execVM "Scripts\DispatchSound.sqf";
	switch (_Sel) do {
		case "Pub": {
			cutText [format["911 Dispatch: Robbery reported at Fionas Pub! Suspect is a %1 wearing %2", _Sex, _Description], "PLAIN DOWN"];
		};
		case "Bank": {
			cutText [format["911 Dispatch: Robbery reported at the Bank! Suspect is a %1 wearing %2", _Sex, _Description], "PLAIN DOWN"];
		};
		case "Station": {
		_Marker = format ["npc_petrol%1", _Station];
			[player, getMarkerPos _Marker] spawn fnc_NavTask;
			cutText [format["911 Dispatch: Robbery reported at Gas Station %1! Suspect is a %2 wearing %3", _Station, _Sex, _Description], "PLAIN DOWN"];
		};
	};
};


UltRP_Dispatch_Train = {
_Name = _this select 0;
_Town = _this select 1;
	cutText [format ["911 Dispatch: Someone matching the description of wanted criminal %1 was spotted at the %2 train station!", _Name, _Town], "PLAIN DOWN"];
};


UltRP_Dispatch_SpeedCam = {
_Sel = _this select 0;
_Cam = _this select 1;
_Town = _this select 2;
_Sex = _this select 4;
	switch (_Sel) do {
		case "Speed": {
		_Speed = _this select 3;
			cutText [format ["911 Dispatch: %1 driver in %2 was flashed by %3 with no license", _Sex, _Town, _Cam], "PLAIN DOWN"];
		};
		case "License": {
			cutText [format ["911 Dispatch: %1 driver in %2 was flashed by %3 at a speed of %4", _Sex, _Town, _Cam, _Speed], "PLAIN DOWN"];
		};
		case "Wanted": {
		_Player = _this select 3;
			cutText [format ["911 Dispatch: %1 driver in %2 matching the description of %3 was flashed by %4", _Sex, _Town, _Player, _Cam], "PLAIN DOWN"];
		};
	};
};