while {true} do {
_obj = format ["%1", typeOf cursorTarget];
_path = (getText (configFile >> "CfgVehicles" >> _obj >> "model"));
_vcl = vehicle player;
	//hint format ["%1", copcount];
	//hint format ["%1", typeOf _vcl];
	//hint format ["%1", _path];
	sleep 1;
};