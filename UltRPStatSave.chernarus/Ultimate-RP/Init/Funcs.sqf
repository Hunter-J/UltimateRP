// By Ultimate-RP Dev Team: http://ultimate-rp.com

["AdminTele", { player commandChat "Admin teleport detected!"; }] call CBA_fnc_addEventHandler;
["Dispatch", { [_this select 0, _this select 1, _this select 2, _this select 3, _this select 4] execVM "Scripts\Dispatch.sqf" }] call CBA_fnc_addEventHandler;
["CallTaxi", { [_this select 0, _this select 1, _this select 2] execVM "Scripts\CellPhone\calltaxi.sqf" }] call CBA_fnc_addEventHandler;
["DeleteMarker", { ["DeleteMarker"] execVM "Scripts\createbody.sqf" }] call CBA_fnc_addEventHandler;


UltRP_ACRE = {
_Sel = _this select 0;
_vcl = vehicle player;

_PatrolCars = ["fs_pd_cvpi","ilpd_slick_b40_pb"];
_UCCars = ["A2L_Tahoe_Blackuc","A2L_Tahoe_Whiteuc","suburban_pd_black","bcpd_unmarked_black","bcpd_unmarked_white","bcpd_unmarked_grey","bcpd_unmarked_blue","bcpd_unmarked_sandstone","bcpd_unmarked_maroon"];
_PD = _PatrolCars + _UCCars + ["suburban_pd_k9"] + ["tcg_hrlycop"];

_FD = ["laddertruck","a2l_f350ambo","a2l_suburban_FD"];

_Emerg = _PD + _FD;

_has117 = [player, "ACRE_PRC117F"] call acre_api_fnc_hasKindOfRadio;
_has148 = [player, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio;
_has343 = [player, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio;
_DrivingEmerg = typeOf _vcl in _Emerg;
_Radio = [] call acre_api_fnc_getCurrentRadio;
	[] spawn {
		//Cops & FD
		if (_Sel == "Emerg") then {
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
		
		//Civ
		if (_Sel == "Civ") then {
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


UltRP_UI = {
_Sel = _this select 0;
	if (_Sel == "HUD") then {
		[] spawn {
			disableSerialization;
			100 cutRsc ["UltRP_Dlg_ui", "PLAIN"];
			
			_money = [([521] call RPM_Cfg_Inv_GetItemAmount), 1, 0, true] call CBA_fnc_formatNumber;
			_bank = [floor(i4), 1, 0, true] call CBA_fnc_formatNumber;
			_weight = [] call RPM_Cfg_Inv_GetOwnWeight;
			_hunger = floor(i9);
			_health = floor(call RPM_Cfg_Inv_GetHealth);
			_id = getPlayerUID player;
			((UltRP_display_ui select 0) displayCtrl 1) ctrlSetStructuredText parseText format["<t color='#1AE14F'>Cash:</t> <t color='#E2B31A'>$%1</t>  <t color='#1AE14F'>Bank:</t> <t color='#E2B31A'>$%6</t><br/> <t color='#1AE14F'>Weight:</t> <t color='#E2B31A'>%2KG</t>  <t color='#1AE14F'>Health:</t> <t color='#E2B31A'>%3/100</t><br/> <t color='#1AE14F'>Hunger:</t> <t color='#E2B31A'>%5/100</t>  <t color='#1AE14F'>ID: %4</t>", _money, _weight, _health, _id, _hunger, _bank];
		};
	};
	
	if (_Sel == "Intro") then {
		[] spawn {
			waitUntil{!(isNil "BIS_fnc_init")};
			sleep 3;
			[name player, "Welcome To Ultimate-RP"] call BIS_fnc_infoText;
			sleep 1;
			["Ultimate-RP Version 1.1"] call BIS_fnc_infoText;
			sleep 1;
			["Special Thanks To: Hunter.J, OneShot.J, And The Community"] call BIS_fnc_infoText;
			sleep 3;
			server globalChat format ["Welcome %1 To Ulimate-RP", name player];
		};
	};
};


UltRP_CopCount = {
_Sel = _this select 0;
	[] spawn {
		if (_Sel == "Add") then {
			if (copcount == 2) then {
				copcount = copcount + 1;
				server globalchat "3 Cops are online, the Bank can now be robbed!";
			};
			copcount = copcount + 1; 
			publicvariable "copcount";
		};
		if (_Sel == "Sub") then {
			if (copcount == 2) then {
				copcount = copcount - 1; 
				server globalchat "A Cop has gone offline, the Bank can no longer be robbed!";
			};
			copcount = copcount - 1; 
			publicvariable "copcount";
		};
	};
};