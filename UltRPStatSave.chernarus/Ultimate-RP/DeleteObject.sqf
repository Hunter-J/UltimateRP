// By Ultimate-RP Dev Team: http://ultimate-rp.com

_Array = _this select 3;
_Item  = _Array select 0;
_Object  = _Array select 1;
_ItemWeight = ((call INV_GetOwnWeight) + (_Item call INV_getitemTypeKg));

if (_ItemWeight > INV_Tragfaehigkeit) exitwith {
	player commandChat localize "STRS_inv_buyitems_maxgewicht"
};

deletevehicle (nearestobjects [getpos player, [_Object],  5] select 0);
[_item, 1] call INV_AddInvItem;
player commandChat format ["you picked up a %1", _Item];