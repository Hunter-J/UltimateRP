//By OneShot.J
_holder = nearestObject [player, "weaponholder"];

if (!isNull _holder) then {
	if (!IsNull (FindDisplay 106)) exitwith {};
	_holderRadio = ((getWeaponCargo _holder) select 0) select 0;
	_Split = [_holderRadio, "_"] call CBA_fnc_split;
	_Radios = ["PRC117F", "PRC148", "PRC343"];

	{
		if (_x in _Split) then {
			deletevehicle _holder;
		};
	} forEach _Radios;
};