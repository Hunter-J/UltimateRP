// Made By TomNyeTheScGuy.........
_start = createDialog "CellPhoneMenu";

#define CellPhoneMenu 2119

Options = [
"Call Taxi"
];

{
	lbAdd [CellPhoneMenu, _x];
} forEach Options;