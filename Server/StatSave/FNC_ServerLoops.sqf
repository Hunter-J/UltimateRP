UltRP_FireLoop = {
	[] spawn {
		_firepositions = [firepos1,firepos2,firepos3,firepos4,firepos5];
		while {true} do	{
			player commandChat "Loop";
			if (!isNull serverfire) then {
			_random = (ceil (random 10));
			_sleeptime = [12000,15000,18000] call BIS_fnc_selectRandom;
			_firePos = _firepositions select (ceil (random (count _firepositions)));
				
				sleep _sleeptime;
		
				if (_random < 5) then {_type = "[_firepositions,5,time,false,false] spawn BIS_Effects_Burn"};
				if (_random >= 5 && _random < 8) then {_type = "[_firepositions,7,time,false,false] spawn BIS_Effects_Burn"};
				if (_random >= 8) then {_type = "[_firepositions,10,time,false,false] spawn BIS_Effects_Burn"};
		
				serverfire = _type createVehicle (getPos _firePos);
				player commandChat format ["%1 fire spawned", _spawn];
				_mrk = createMarker ["Fire_Mrk", getPos _firePos];
				_mrk setMarkerShape "ICON";
				_mrk setMarkerType "WARNING";
				_mrk setMarkerSize [0.8,0.8];
				_mrk setMarkerColor "ColorRed";
				_mrk setMarkerText "FIRE";
				//Broadcast FD Dispatch
				player commandChat "Marker Created";
			} else {
				FireExistTime = 0;
				FireExistTIme = FireExistTime + 1;
				sleep 1;
				
				if (FireExistTime == 600) then {
					//Destroy Building
				};
			};
		};
	};
};