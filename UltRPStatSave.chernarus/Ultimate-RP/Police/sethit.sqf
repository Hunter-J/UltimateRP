if(!alive player)exitwith{};

_vehicle	= _this select 0;
_selection	= _this select 1;
_damage		= _this select 2;
_shooter	= _this select 3;
_ammo		= _this select 4;
_nvcls		= nearestObjects [getpos _vehicle, ["LandVehicle"], 5];

if(player == _vehicle and (_ammo == "B_12Gauge_74Slug" or _ammo == "stuncartridge")) exitwith {["hit", _shooter, _selection, _damage] execVM "stun.sqf";};
if(player == _vehicle and (_ammo == "cal68_fieldpaint" or _ammo == "cal68_propaint1" or _ammo == "cal68_propaint2" or _ammo == "cal68_specpaint1" or _ammo == "cal68_specpaint2" or _ammo == "cal68_propaint")) exitwith {["pball", _shooter, _selection, _damage] execVM "stun.sqf";};

[_selection,_damage,_shooter, _nvcls] Spawn 

	{

	_selection	= _this select 0;
	_damage		= _this select 1;
	_shooter	= _this select 2;
	_nvcls		= _this select 3; 
	
	player SetHit [_selection, _damage];

	if(_selection == "" and _damage >= 1 and !isnull _shooter)then{player setdamage 1;};

	if(alive player)exitwith{};
	
	[_shooter, _nvcls] execVM "victim.sqf";
	
	};

false;