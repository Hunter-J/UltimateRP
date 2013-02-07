UltRP_Rob_Bank = {
	[] spawn {
		_Sel  = _this select 0;

		if (_Sel == "Reset") then {
			canUseBank = true;
			publicvariable "canUseBank";
			if (cashpile1 getVariable "IsHidden" == "True") then {
				[nil, cashpile1, rHideObject, false] call RE;
				cashpile1 setVariable ["IsHidden", "False", true];
			};
			if (cashpile2 getVariable "IsHidden" == "True") then {
				[nil, cashpile2, rHideObject, false] call RE;
				cashpile2 setVariable ["IsHidden", "False", true];
			};
			if (cashpile3 getVariable "IsHidden" == "True") then {
				[nil, cashpile3, rHideObject, false] call RE;
				cashpile3 setVariable ["IsHidden", "False", true];
			};
			if (cashpile4 getVariable "IsHidden" == "True") then {
				[nil, cashpile4, rHideObject, false] call RE;
				cashpile4 setVariable ["IsHidden", "False", true];
			};
			if (cashpile5 getVariable "IsHidden" == "True") then {
				[nil, cashpile5, rHideObject, false] call RE;
				cashpile5 setVariable ["IsHidden", "False", true];
			};
			if (cashpile6 getVariable "IsHidden" == "True") then {
				[nil, cashpile6, rHideObject, false] call RE;
				cashpile6 setVariable ["IsHidden", "False", true];
			};
			if (cashpile7 getVariable "IsHidden" == "True") then {
				[nil, cashpile7, rHideObject, false] call RE;
				cashpile7 setVariable ["IsHidden", "False", true];
			};
			if (cashpile8 getVariable "IsHidden" == "True") then {
				[nil, cashpile8, rHideObject, false] call RE;
				cashpile8 setVariable ["IsHidden", "False", true];
			};
		};

		if (_Sel == "Rob") then {
			if (copcount < 3 and !isAdmin) exitwith {
				player commandChat "There needs to be atleast 3 cops online to rob a Bank.";
			};
			if (!canUseBank) exitwith {
				player commandChat "The Bank is already being robbed!";
			};
			
			canUseBank = false;
			publicvariable "canUseBank";
			sleep 5;
			("PDBase say3D ""BankAlarm_PD""") call broadcast;
			_sex = call compile format ["%1sex", player];
			_description = call compile format ["%1description", player];
			["Dispatch_Rob", ["Bank",_sex,_description]] call CBA_fnc_globalEvent;
		};

		if (_Sel == "Take") then {
		_newamount = ('geld' call INV_GetItemAmount) + 50000;
		_Pile  = _Array select 1;
			[nil, _Pile, rHideObject, true] call RE;
			_Pile setVariable ["IsHidden", "True", true];
			format["if (RPM_Role == %1) then {
				[""%2""] call RPM_Cfg_Inv_PlayMove;
			}", RPM_Role, "AinvPknlMstpSlayWrflDnon_medic"] call RPM_Cfg_Network_Broadcast;
			sleep 4;	
			['geld', 50000] call INV_AddInvItem;
			player commandChat "+ $50,000";
		};
	};
};


UltRP_Rob_LiquorStore = {
_stolenamount = 100 * (ceil (random 5));
_canRob = true;
	[] spawn {
		if (copcount < 2) exitwith {
			player commandChat "There needs to be atleast 2 cops online to rob a pub.";
		};
		if (!_canRob) exitwith {
			player commandChat "You are already robbing a gas station!";
		};

		_canRob = false;
		_newamount = ('geld' call INV_GetItemAmount) + _stolenamount;
		['geld', _stolenamount] call INV_AddInvItem;
		player commandChat format ["You stole $%1", _stolenamount];
		sleep 5;
		_sex = call compile format ["%1sex", player];
		_description = call compile format ["%1description", player];
		["Dispatch_Rob", ["Pub",_sex,_description]] call CBA_fnc_globalEvent;
		_canRob = true;
	};
};


UltRP_Rob_LiquorStore = {
_selection = _this select 3;
_StolenAmount = floor (random 4 + 1) * 100;
_newamount = ('geld' call INV_GetItemAmount) + _StolenAmount;
_sex = call compile format ["%1sex", player];
_description = call compile format ["%1description", player];
	[] spawn {
		if (copcount < 2) exitwith {
			player commandChat "There needs to be atleast 2 cops online to rob a pub.";
		};
		if (!_canRob) exitwith {
			player commandChat "You are already robbing a gas station!";
		};

		_canRob = false;
		['geld', _StolenAmount] call INV_AddInvItem;
		if (_selection == "1") then {
			station1money = station1money - _StolenAmount;
			player commandChat format ["You stole $%1!", _StolenAmount];
			sleep 5;
		};
		if (_selection == "2") then {
			station2money = station2money - _StolenAmount;
			player commandChat format ["You stole $%1!", _StolenAmount];
			sleep 5;
		};
		if (_selection == "3") then {
			station3money = station7money - _StolenAmount;
			player commandChat format ["You stole $%1!", _StolenAmount];
			sleep 5;
		};
		if (_selection == "4") then {
			station4money = station4money - _StolenAmount;
			player commandChat format ["You stole $%1!", _StolenAmount];
			sleep 5;
		};
		if (_selection == "5") then {
			station7money = station7money - _StolenAmount;
			player commandChat format ["You stole $%1!", _StolenAmount];
			sleep 5;
		};
		if (_selection == "6") then {
			station14money = station14money - _StolenAmount;
			player commandChat format ["You stole $%1!", _StolenAmount];
			sleep 5;
		};
		["Dispatch_Rob",["Station",_selectioon,_sex,_description]] call CBA_fnc_globalEvent;
		_canRob = true;
	};
};