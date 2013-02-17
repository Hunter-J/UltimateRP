UltRP_Holster = {
_Sel = _this select 0;
	switch (_Sel) do {
		case "Check": {
		_Pistol = [player] call CBA_fnc_getPistol;
			HasPistol = _Pistol != "";
			if (iscop) then {
				HasTaser = _Pistol == "x26";
			};
			//hint format ["Pistol: %1\nHasPistol: %2\nHolstered: %3", _Pistol, HasPistol, Holster];
		};
		
		case "Holster": {
		_Pistol = [player] call CBA_fnc_getPistol;
			player removeWeapon _Pistol;
			player setVariable ["Pistol", _Pistol, true];
			Holster = true;
		};
		
		case "Unholster": {
		_Pistol = player getVariable "Pistol";
			player addWeapon _Pistol;
			Holster = false;
		};
		
		case "HolsterTaser": {
		_Pistol = [player] call CBA_fnc_getPistol;
			player removeWeapon _Pistol;
			HolsterTaser = true;
		};
		
		case "UnholsterTaser": {
			player addWeapon "x26";
			HolsterTaser = false;
		};
	};
};