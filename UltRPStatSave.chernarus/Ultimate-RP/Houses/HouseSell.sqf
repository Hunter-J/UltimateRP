//By OneShot.J

_House = _this select 3;
_Price = _House getVariable "Price";
_MarkerName = format ["%1House", name player];

_newamount = ('geld' call INV_GetItemAmount) + _Price;
if (_newamount > 999999) exitWith {
	player commandChat "You have the maximum amount of cash you can hold.";
};
['geld', +(_Price)] call INV_AddInvItem;
player commandChat "You sold the house!";
_House setVariable ["Owner", "None", True];
HasHouse = false;
deleteMarker _MarkerName;