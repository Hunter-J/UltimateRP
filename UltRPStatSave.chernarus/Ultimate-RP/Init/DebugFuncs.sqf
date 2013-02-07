// By Ultimate-RP Dev Team: http://ultimate-rp.com
UltRP_Debug_Teleport = {
_Sel = _this select 0;
	if (_Sel == "On") then {
		Teleport = true;
		onMapSingleClick 'vehicle player setPos _pos; ["AdminTele"] call CBA_fnc_globalEvent; true;';
	};
	if (_Sel == "Off") then {
		Teleport = false;
		onMapSingleClick "";
	};
};

UltRP_Debug_Loop = {
	[] spawn {
	_obj = format ["%1", typeOf cursorTarget];
	_path = (getText (configFile >> "CfgVehicles" >> _obj >> "model"));
	_vcl = vehicle player;
		//hint format ["%1", copcount];
		//hint format ["%1", typeOf _vcl];
		//hint format ["%1", _path];
		sleep .5;
	};
};