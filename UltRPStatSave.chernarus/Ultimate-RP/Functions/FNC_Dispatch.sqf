// By Ultimate-RP Dev Team: http://ultimate-rp.com
_Type = _this select 0;

if (!iscop) exitwith {};

UltRP_Dispatch_Rob = {
_Sel = _this select 0;
	[] spawn {
		if (_Sel == "Pub") exitwith {
		_Sex = _this select 2;
		_Description = _this select 3;
			cutText [format["911 Dispatch: Robbery reported at Fionas Pub! Suspect is a %1 wearing %2", _Sex, _Description], "PLAIN DOWN"];
			execVM "Scripts\DispatchSound.sqf";
		};
		if (_Sel == "Bank") exitwith {
		_Sex = _this select 2;
		_Description = _this select 3;
			cutText [format["911 Dispatch: Robbery reported at the Bank! Suspect is a %1 wearing %2", _Sex, _Description], "PLAIN DOWN"];
			execVM "Scripts\DispatchSound.sqf";
		};
		if (_Sel == "Station") exitwith {
		_Station = _this select 2;
		_Sex = _this select 3;
		_Description = _this select 4;
			cutText [format["911 Dispatch: Robbery reported at Gas Station %1! Suspect is a %2 wearing %3", _Station, _Sex, _Description], "PLAIN DOWN"];
			execVM "Scripts\DispatchSound.sqf";
		};
	};
};


UltRP_Dispatch_Train = {
_Name = _this select 0;
_Town = _this select 1;
	[] spawn {
		cutText [format ["911 Dispatch: Someone matching the description of wanted criminal %1 was spotted at the %2 train station!", _Name, _Town], "PLAIN DOWN"];
	};
};