// By Ultimate-RP Dev Team: http://ultimate-rp.com

UltRP_Rob = {
_Sel  = _this select 0;
	switch (_Sel) do {
		case "Bank": {
			_this spawn {
			_Type = _this select 1;
			_Pile = _this select 2;
				switch (_Type) do {
					case "Reset": {
						canUseBank = true;
						publicvariable "canUseBank";
						_CashPiles = [cashpile1, cashpile2, cashpile3, cashpile4, cashpile5, cashpile6, cashpile7, cashpile8];
						{
							if (_x getVariable "Taken" == "True") then {
								[nil, _x, rHideObject, false] call RE;
								_x setVariable ["Taken", "False", true];
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
						
						_Random = ceil(random 5);
						_Sound = format ["Rob%1", _Random];
						[player, _Sound] call CBA_fnc_globalSay3d;
						sleep 1;
						mainbank playAction "surrender";
						mainbank setVariable ["Surrender", "True", true];
						sleep 3;
						canUseBank = false;
						publicvariable "canUseBank";
						sleep 5;
						_sex = call compile format ["%1sex", player];
						_description = call compile format ["%1description", player];
						Dispatch = format ["911 Dispatch: Robbery reported at the Bank! Suspect is a %1 wearing %2", _Sex, _Description];
					};

					case "Take": {
						sleep 4;
						[nil, _Pile, rHideObject, true] call RE;
						_Pile setVariable ["Taken", "True", true];
						[521, 50000] call RPM_Cfg_Inv_AddItemAmount;
						player commandChat "+ $50,000";
					};
				};
			};
		};
			
		case "Pub": {
			[] spawn {
			_canRob = true;
			_StolenAmount = 100 * (ceil (random 5));
				if (copcount < 2 and !isAdmin) exitwith {
					player commandChat "There needs to be atleast 2 cops online to rob a pub.";
				};
				if (!_canRob) exitwith {
					player commandChat "You are already robbing a gas station!";
				};

				_Random = ceil(random 5);
				_Sound = format ["Rob%1", _Random];
				[player, _Sound] call CBA_fnc_globalSay3d;
				sleep 1;
				pub1 playAction "surrender";
				pub1 setVariable ["Surrender", "True", true];
				sleep 3;
				_canRob = false;
				[521, _StolenAmount] call RPM_Cfg_Inv_AddItemAmount;
				player commandChat format ["You stole $%1", _stolenamount];
				sleep 5;
				_Sex = call compile format ["%1sex", player];
				_Description = call compile format ["%1description", player];
				Dispatch = format ["911 Dispatch: Robbery reported at Fionas Pub! Suspect is a %1 wearing %2", _Sex, _Description];
				_canRob = true;
			};
		};
			
		case "Station": {
			_this spawn {
			_Station = _this select 1;
			_canRob = true;
			_StolenAmount = 100 * (ceil (random 5));
				if (copcount < 2 and !isAdmin) exitwith {
					player commandChat "There needs to be atleast 2 cops online to rob a gas station.";
				};
				if (!_canRob) exitwith {
					player commandChat "You are already robbing a gas station!";
				};
					
				_Random = ceil(random 5);
				_Sound = format ["Rob%1", _Random];
				[player, _Sound] call CBA_fnc_globalSay3d;
				sleep 1;
				_Man = (nearestobjects [player, ["Man"], 5] - [playableUnits] - [player]) select 0;
				_Man playAction "surrender";
				_Man setVariable ["Surrender", "True", true];
				sleep 3;
				_canRob = false;
				[521, _StolenAmount] call RPM_Cfg_Inv_AddItemAmount;
				format ["station%1money = station%1money - _StolenAmount", _Station];
				player commandChat format ["You stole $%1!", _StolenAmount];
				sleep 5;
				_Sex = call compile format ["%1sex", player];
				_Description = call compile format ["%1description", player];
				Dispatch = format ["911 Dispatch: Robbery reported at Gas Station %1! Suspect is a %2 wearing %3", _Station, _Sex, _Description];
				_canRob = true;
			};
		};
	};
	publicVariable "Dispatch";
};	