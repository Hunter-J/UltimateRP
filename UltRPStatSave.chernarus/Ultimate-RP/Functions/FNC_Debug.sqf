// By Ultimate-RP Dev Team: http://ultimate-rp.com

UltRP_Debug_Teleport = {
_Sel = _this select 0;
	switch (_Sel) do {
		case "On": {
			onMapSingleClick 'vehicle player setPos _pos; ["AdminTele"] call CBA_fnc_globalEvent; true;';
			Teleport = On;
		};
		case "Off": {
			onMapSingleClick "";
			Teleport = Off;
		};
	};
};


UltRP_Debug_Loop = {
	[] spawn {
		while {true} do {
		_path = (getText (configFile >> "CfgVehicles" >> _obj >> "model"));
		_tgt = typeOf cursorTarget;
			//hint format ["%1", _tgt];
			//hint format ["%1", _path];
			//hint format ["Teleport Enabled: %1", Teleport];
			sleep .5;
		};
	};
};