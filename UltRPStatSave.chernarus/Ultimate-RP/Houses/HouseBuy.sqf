// By Ultimate-RP Dev Team: http://ultimate-rp.com

_House = _this select 3;
_Price = _House getVariable "Price";
_MarkerName = format ["%1House", name player];

if (HasHouse) exitWith {
	player commandChat "You already own a house!";
};

if (('geld' call INV_GetItemAmount) < _Price) exitWith {
	player commandChat "You can't afford this house!";
};

['geld', -(_Price)] call INV_AddInvItem;
player commandChat format ["You bought the house for %1$!", _Price];
_House setVariable ["Owner", name player, True];
HasHouse = true;

_HouseMarker = createMarker [_MarkerName, getpos _House];
_HouseMarker setMarkerShape "ICON";
_HouseMarker setMarkerType "b_motor_inf";
_HouseMarker setMarkerText format ["%1's House", name player];
_HouseMarker setMarkerColor "ColorBlue";