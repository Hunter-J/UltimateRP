// By Ultimate-RP Dev Team: http://ultimate-rp.com

_Sel = _this select 0;

UltRP_Teleport {
	if (_Sel == "On") then {
		Teleport = true;
		onMapSingleClick 'vehicle player setPos _pos; ["AdminTele"] call CBA_fnc_globalEvent; true;';
	};
	if (_Sel == "Off") then {
		Teleport = false;
		onMapSingleClick "";
	};
};