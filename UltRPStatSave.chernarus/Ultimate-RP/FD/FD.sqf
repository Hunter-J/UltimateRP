server globalChat "FD Script Started";
UltRP_FireLoop = {
	[] spawn {
		server globalChat "Line 4";	
		private["_firepositions","_random","_firePos","_x","_mrk"];
		_firepositions = [firepos1,firepos2,firepos3,firepos4,firepos5];
		while {true} do	{
			server globalChat "Line 8";
			sleep 15;
			_random = (floor (random 10) + 1);
			if (_random < 5) then {_type = "[_firepositions,5,time,false,false] spawn BIS_Effects_Burn"};
			if (_random >= 5 && _random < 8) then {_type = "[_firepositions,7,time,false,false] spawn BIS_Effects_Burn"};
			if (_random >= 8) then {_type = "[_firepositions,10,time,false,false] spawn BIS_Effects_Burn"};
			_firePos = _firepositions select (floor (random (count _firepositions)));
			serverfire = _type createVehicle (getPos _firePos);
			server globalChat "Line 16";
			_mrk = createMarker ["Fire_Mrk", getPos _firePos];
			_mrk setMarkerShape "ICON";
			_mrk setMarkerType "WARNING";
			_mrk setMarkerSize [0.8,0.8];
			_mrk setMarkerColor "ColorRed";
			_mrk setMarkerText "FIRE";
			server globalChat "Started Fire";
			sleep 15;
			
		};
	};
};