// By Ultimate-RP Dev Team: http://ultimate-rp.com

_Item = _this select 0;

if (getPosATL player select 2 > 0.8) exitWith {
	player commandChat "You must be at terrain level to place this object";
};

[_Item, 1] call RPM_Cfg_Inv_DelItemAmount;	
_pos = [(position player select 0) + (sin(getdir player)*2), (position player select 1) + (cos(getdir player)*2), (position player select 2)];
_obj = _class createvehicle [0, 0, 0];
_obj setdir getdir player;
_obj setpos _pos;
if (_Item == "MethLab") exitwith {
	_obj setvehicleinit 'this setVariable ["inUse", "False", true]';
	processinitcommands;
};
if (_Item == "StorageBox") exitwith {
	_obj setvehicleinit 'this setVariable ["IsStorage", "True", true]; this setVariable ["Owner", name player, true]; clearWeaponCargo this; clearMagazineCargo this;';
	processinitcommands;
};