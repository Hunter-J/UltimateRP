// By Ultimate-RP Dev Team: http://ultimate-rp.com

_Array = _this select 3;
_Item  = _Array select 0;
_Object  = _Array select 1;

if (_Object == "body") then {
_Body = nearestObject [player, "body"];
_BodyMarker = format ["BodyMarker%1", _Body getVariable "Num"];
	deleteMarker _BodyMarker;
} else {
	[_item, 1] call RPM_Cfg_Inv_AddItemAmount;
	player commandChat format ["you picked up a %1", _Item];
};
deletevehicle (nearestobjects [getpos player, [_Object],  5] select 0);