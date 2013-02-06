RPM_fWildFireLoop =
{
	private["_firepositions","_random","_firePos","_x","_mrk"];
	_firepositions = [firepos1,firepos2,firepos3,firepos4,firepos5];
	while {true} do
	{
		sleep (15);
		_random = (floor (random 10) + 1);
		if (_random < 5) then {_type = "bc_FireSml";};
		if (_random >= 5 && _random < 8) then {_type = "bc_FireMid";};
		if (_random >= 8) then {_type = "bc_FireBig";};
		_firePos = _firepositions select (floor (random (count _firepositions)));
		serverfire = _type createVehicle (getPos _firePos);
		{
			[nil,_x,"loc",rHINT,"A fire has spawned! Put it out!"] call RE;
		} forEach [civ36,civ37,civ38,civ39,civ40];
		
		_mrk = createMarker ["Fire_Mrk", getPos _firePos];
		_mrk setMarkerShape "ICON";
		_mrk setMarkerType "WARNING";
		_mrk setMarkerSize [0.8,0.8];
		_mrk setMarkerColor "ColorRed";
		_mrk setMarkerText "Wild Fire";
	};
};