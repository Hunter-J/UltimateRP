//By OneShot.J
_Type = _this select 0;
_BodyMarker = format ["BodyMarker%1", bodynum];

_Body = "body" createVehicle (position player);
sleep 1;
_Body setVariable ["Num", bodynum, true];

createMarker [_BodyMarker, position player];
_BodyMarker setMarkerShape "ICON";
_BodyMarker setMarkerType "Warning";
_BodyMarker setMarkerText "Dead Body";
_BodyMarker setMarkerColor "ColorYellow";
["DeleteMarker"] call CBA_fnc_globalEvent;

bodynum = bodynum + 1;
publicvariable "bodynum";

if (_Type == "DeleteMarker") then {
	if (isciv) then {
		deleteMarkerLocal _BodyMarker; 
	};
};