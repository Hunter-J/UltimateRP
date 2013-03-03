UltRP_FireLoop = {
	[] spawn {
		_firepositions = [firepos1,firepos2,firepos3,firepos4,firepos5];
		while {true} do	{
			player commandChat "Loop";
			if (!isNull serverfire) then {
			_random = (ceil (random 10));
			if (_random < 5) then {_Intensity = 8};
			if (_random >= 5 && _random < 8) then {_Intensity = 9};
			if (_random == 10) then {_Intensity = 10};
				
			_sleeptime = [12000,15000,18000] call BIS_fnc_selectRandom;
			_firePos = _firepositions select (ceil (random (count _firepositions)));
				
				sleep _sleeptime;
				[_firePos, _Intensity, false, false, false] spawn BIS_Effects_Burn;
				player commandChat format ["%1 fire spawned", _type];
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