// By Ultimate-RP Dev Team: http://ultimate-rp.com

UltRP_Train = {
_Sel = _this select 0;
_Cost = _this select 1;
	[_Sel, _Cost] spawn {
	_Sel = _this select 0;
	_Cost = _this select 1;
	_Marker = format ["%1Station", _Sel];

		if (([521] call RPM_Cfg_Inv_GetItemAmount) < _Cost) exitwith {
			player commandChat "You cannot afford this trip!";
		};

		if (player in wanted_array) exitwith {
		_Towns = nearestLocations [player, ["NameVillage","NameCity","NameCityCapital"], 20000]; 
		_Town = text (_Towns select 0);
			player commandChat "You can not ride the train when you are wanted!";
			sleep 5;
			["Dispatch_Train",[name player,_Town]] call CBA_fnc_globalEvent;
		};
		
		[521, - _Cost] call RPM_Cfg_Inv_DelItemAmount;
		titleText ["","BLACK OUT",1];
		sleep 1;
		player setpos [getMarkerPos _Marker select 0, getMarkerPos _Marker select 1, getPosATL _Sel select 2];
		player setDir (getDir _Sel);
		sleep 2;
		titleText ["","BLACK IN",1];
	};
};