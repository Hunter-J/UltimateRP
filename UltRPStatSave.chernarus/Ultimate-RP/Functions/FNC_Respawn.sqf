//By OneShot.J

UltRP_Respawn = {
_Sel = _this select 0;
	switch (_Sel) do {
		case "Alive": {
			[] spawn {
				waituntil {alive player};
				removeAllWeapons player;
				player addWeapon "ItemGPS";
				if (RPM_Cop) then {
					//PD STUFF
				};
				if (RPM_Civ) then {
					//CIV STUFF
				};
				if (RPM_FF) then {
					//FD STUFF
				};
				titleText ["", "PLAIN"];
			};
		};
			
		case "Dead": {
			[] spawn {
				waituntil {!(alive player)};
				closeDialog 0;
				if (RPM_Civ and !isAdmin) then {
					for [{_i=0}, {_i < (count a19)}, {_i=_i+1}] do {
					_item   = ((a19 select _i) select 0);
					_amount = (_item call INV_GetItemAmount);
						if (_amount > 0 and (_item call INV_getitemDropable)) then {
							if (_item == '521') then {
								_class = "EvMoney"
							} else {
								_class = "Suitcase";
							};
							_object = _class createvehicle position player;
							_object setvariable ["droparray", [_amount, _item], true];
						};
					};
					call INV_InventarLeeren;
				};
				[] execVM "Scripts\createbody.sqf";
				titletext ["YOU ARE DEAD - RESPAWNING", "BLACK", 0];
				sleep 3;
				player setpos (getmarkerpos "deadpos");
				player setDir 180;
				waituntil {player distance (getmarkerpos "deadpos") <= 3};
				hideBody player;
				deleteVehicle player;
			};
		};
	};
};