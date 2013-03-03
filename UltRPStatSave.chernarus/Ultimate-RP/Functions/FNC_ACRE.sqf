UltRP_ACRE = {
	_this spawn {
	waitUntil {alive player};
	_Sel = _this select 0;
	_vcl = vehicle player;

	_PatrolCars = ["fs_pd_cvpi","ilpd_slick_b40_pb"];
	_UCCars = ["A2L_Tahoe_Blackuc","A2L_Tahoe_Whiteuc","suburban_pd_black","bcpd_unmarked_black","bcpd_unmarked_white","bcpd_unmarked_grey","bcpd_unmarked_blue","bcpd_unmarked_sandstone","bcpd_unmarked_maroon"];
	_PD = _PatrolCars + _UCCars + ["suburban_pd_k9"] + ["tcg_hrlycop"];
	_FD = ["a2l_f350ambo","a2l_suburban_FD"];
	_Emerg = _PD + _FD;
	
	_DrivingEmerg = typeOf _vcl in _Emerg;

	_has117 = [player, "ACRE_PRC117F"] call acre_api_fnc_hasKindOfRadio;
	_has148 = [player, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio;
	_has343 = [player, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio;

	_Radio = [] call acre_api_fnc_getCurrentRadio;

		execVM "Ultimate-RP\DeleteRadio.sqf";
		
		switch (_Sel) do {
			//Cops & FD
			case "Emerg": {
				if (_DrivingEmerg and _has148) then {
					player removeweapon _Radio;
				};
								
				if (_DrivingEmerg and !_has117) then {
					player addweapon "ACRE_PRC117F";
					/*
					if (RPM_Cop) then {
						[326.525, 20000] call acre_api_fnc_setCurrentRadioState;
					};
					if (RPM_FF) then {
						[331.075, 20000] call acre_api_fnc_setCurrentRadioState;
					};
					*/
				};
									
				if (!_DrivingEmerg and !_has148) then {
					player addweapon "ACRE_PRC148";
					/*
					if (RPM_Cop) then {
						[326.525, 20000] call acre_api_fnc_setCurrentRadioState;
					};
					if (RPM_FF) then {
						[331.075, 20000] call acre_api_fnc_setCurrentRadioState;
					};
					*/
				};
									
				if (!_DrivingEmerg and _has117) then {
					player removeweapon _Radio;
				};
								
				if (!_DrivingEmerg and _has148 and _has343) then {
					player removeweapon _Radio;
				};
			};
				
			case "Civ": {
				if (!_has343) then {
					player addweapon "ACRE_PRC343";
				};
				if (_has148) then {
					player removeweapon _Radio;
					player commandChat "How did you get that?! *Yoink*";
				};
			};
		};
	};
};