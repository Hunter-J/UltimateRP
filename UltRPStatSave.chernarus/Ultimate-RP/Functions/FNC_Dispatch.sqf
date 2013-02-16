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
			cutText [format["911 Dispatch: Robbery reported at Gas Station %1! Suspect is a %2 wearing %3", _Station, _Sex, _Description], "PLAIN DOWN"];
		};
	};
};


UltRP_Dispatch_Train = {
_Name = _this select 0;
_Town = _this select 1;
	cutText [format ["911 Dispatch: Someone matching the description of wanted criminal %1 was spotted at the %2 train station!", _Name, _Town], "PLAIN DOWN"];
};