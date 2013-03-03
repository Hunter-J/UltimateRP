player commandChat "Script spawn";
_firepositions = [firepos1,firepos2,firepos3,firepos4,firepos5];
_random = (ceil (random 10));
_firePos = _firepositions select (ceil (random (count _firepositions)));

if (_random < 5) then {_type = "[_firepositions,5,time,false,false] spawn BIS_Effects_Burn"};
if (_random >= 5 && _random < 8) then {_type = "[_firepositions,7,time,false,false] spawn BIS_Effects_Burn"};
if (_random >= 8) then {_type = "[_firepositions,10,time,false,false] spawn BIS_Effects_Burn"};
        
serverfire = _type createVehicle (getPos _firePos);
player commandChat format ["%1 fire spawned", _type];
_mrk = createMarker ["Fire_Mrk", getPos _firePos];
_mrk setMarkerShape "ICON";
_mrk setMarkerType "WARNING";
_mrk setMarkerSize [0.8,0.8];
_mrk setMarkerColor "ColorRed";
_mrk setMarkerText "FIRE";
player commandChat "Marker Created";

//Broadcast FD Dispatch