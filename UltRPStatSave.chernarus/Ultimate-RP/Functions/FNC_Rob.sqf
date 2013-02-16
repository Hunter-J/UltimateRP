//By OneShot.J

UltRP_Rob = {
_Sel  = _this select 0;
_Sex = call compile format ["%1sex", player];
_Description = call compile format ["%1description", player];
	switch (_Sel) do {
		case "Bank": {
		_Type = _this select 1;
			[_Type, _Sex, _Description] spawn {
			_Type = _this select 0;
			_Sex = _this select 1;
			_Description = _this select 2;
				switch (_Type) do {
					case "Reset": {
						canUseBank = true;
						publicvariable "canUseBank";
						_CashPiles = [cashpile1, cashpile2, cashpile3, cashpile4, cashpile5, cashpile6, cashpile7, cashpile8];
						{
							if (_x getVariable "IsHidden" == "True") then {
								[nil, _x, rHideObject, false] call RE;
								_x setVariable ["IsHidden", "False", true];
							};
						} forEach _CashPiles;
					};

					case "Rob": {
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

					case "Take": {
					_newamount = ('geld' call INV_GetItemAmount) + 50000;
					_Pile  = _Array select 1;
						[nil, _Pile, rHideObject, true] call RE;
						_Pile setVariable ["IsHidden", "True", true];
						sleep 4;	
						[564, _StolenAmount] call RPM_Cfg_Inv_AddItemAmount;
						player commandChat "+ $50,000";
					};
				};
			};
		};
			
		case "Pub": {
			[_Sex, _Description] spawn {
			_Sex = _this select 0;
			_Description = _this select 1;
			_canRob = true;
			_StolenAmount = 100 * (ceil (random 5));
				if (copcount < 2) exitwith {
					player commandChat "There needs to be atleast 2 cops online to rob a pub.";
				};
				if (!_canRob) exitwith {
					player commandChat "You are already robbing a gas station!";
				};

				_canRob = false;
				[521, _StolenAmount] call RPM_Cfg_Inv_AddItemAmount;
				player commandChat format ["You stole $%1", _stolenamount];
				sleep 5;
				["Dispatch_Rob", ["Pub",_sex,_description]] call CBA_fnc_globalEvent;
				_canRob = true;
			};
		};
			
		case "Station": {
		_Station = _this select 1;
			[_Station, _Sex, _Description] spawn {
			_Station = _this select 0;
			_Sex = _this select 0;
			_Description = _this select 1;
			_canRob = true;
			_StolenAmount = 100 * (ceil (random 5));
				if (copcount < 2) exitwith {
					player commandChat "There needs to be atleast 2 cops online to rob a gas station.";
				};
				if (!_canRob) exitwith {
					player commandChat "You are already robbing a gas station!";
				};
				
				_canRob = false;
				[521, _StolenAmount] call RPM_Cfg_Inv_AddItemAmount;
				player commandChat format ["You stole $%1!", _StolenAmount];
				sleep 5;
				["Dispatch_Rob",["Station",_Station,_sex,_description]] call CBA_fnc_globalEvent;
				_canRob = true;
			};
		};
	};
};	