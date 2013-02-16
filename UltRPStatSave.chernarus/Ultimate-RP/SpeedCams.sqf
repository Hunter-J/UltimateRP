while {RPM_Civ} do {
_vcl    = vehicle player;
_speed  = speed _vcl;
_type   = typeof _vcl;

	{
		if ((player == driver _vcl) and (_vcl distance _x < 10) and (_speed >= 95) and !(_vcl iskindof "Air")) then { 
		_info = [_vcl] call RPM_Cfg_Items_GetIDByClass;
		_license = _info call RPM_Cfg_Items_GetLicenseArr;

			titleCut ["","white in",1];

			if (_speed >= 95 and _speed < 110) then {_penalty = 1};
			if (_speed >= 110 and _speed < 130) then {_penalty = 2};
			if (_speed >= 130 and _speed < 150) then {_penalty = 3};
			if (_speed >= 150 and _speed < 170) then {_penalty = 6};
			if (_speed >= 170) then {_penalty = 7};

			player commandChat format["You've been flashed by a speedcam! Limit: 90, Speed: %1)", round _speed];
			sleep 1;

			//Dispatch
			_Sex = call compile format ["%1sex", player];
			_Towns = nearestLocations [player, ["NameVillage","NameCity","NameCityCapital"], 20000]; 
			_Town = text (_Towns select 0);
			if (_speed >= 110) then {
				["Dispatch_SpeedCam", ["Speed",_x,_town,_speed,_sex]] call CBA_fnc_globalEvent;
			};
			if (![_license] call RPM_Cfg_Inv_HasLicenseStr) then {
				["Dispatch_SpeedCam", ["License",_x,_town,_sex]] call CBA_fnc_globalEvent;
			};
			if (player in wanted_array) then {
				["Dispatch_SpeedCam", ["Wanted",_x,_town,name player,_sex]] call CBA_fnc_globalEvent;
			};
			
			if (demerits == 0 and ![_license] call RPM_Cfg_Inv_HasLicenseStr) exitwith {};
			if (demerits == 0 and [_license] call RPM_Cfg_Inv_HasLicenseStr) exitwith {
				RPM_Stats_LicensesArray = RPM_Stats_LicensesArray - [_license];
				player commandChat "You have lost your license!";
			};
			if (demerits != 0) then {
				demerits = demerits - _penalty;
			};
			player commandChat format["Demerit points lost: %1. Demerit points remaining: %2", _penalty, demerits];
		}; 
	} foreach speedcamarray;

	sleep 0.5;
};