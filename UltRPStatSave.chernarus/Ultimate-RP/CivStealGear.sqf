// By Ultimate-RP Dev Team: http://ultimate-rp.com

_vcl = nearestObject [player, "LandVehicle"];
_PatrolCars = ["ilpd_beat_f101","ilpd_slick_b40_pb"];
_UCCars = ["A2L_Tahoe_Blackuc","A2L_Tahoe_Whiteuc","suburban_pd_black","bcpd_unmarked_black","bcpd_unmarked_white","bcpd_unmarked_grey","bcpd_unmarked_blue","bcpd_unmarked_sandstone","bcpd_unmarked_maroon"];
_CopCars = _PatrolCars + _UCCars + ["suburban_pd_k9"];

_hasShotgun = player hasWeapon "tcg_remington";
_hasShotgunMag = "8Rnd_B_Beneli_74Slug" in magazines player;
_shotgunMagCount = {_x == "8Rnd_B_Beneli_74Slug"} count magazines player;

_hasRifle = player hasWeapon "RH_m4";
_hasRifleMag = "30Rnd_556x45_Stanag" in magazines player;
_rifleMagCount = {_x == "30Rnd_556x45_Stanag"} count magazines player;


if (vehicle player == player) then {
	if ((player distance _vcl < 5) and (typeOf _vcl in _CopCars)) then {
		if (_hasShotgun and _hasShotgunMag) then {
			player commandChat "You are not allowed to steal from cop cars.";
			player commandChat "This is against the rules and is punishable by BAN";
			server globalchat format ["%1 Tried to steal from a cop car! Remind them that this is against the rules!", name player];
			player removeWeapon "tcg_remington";
			_vcl addWeaponCargo ["tcg_remington",1];
			_vcl addMagazineCargo ["8Rnd_B_Beneli_74Slug",_shotgunMagCount];
			for "_i" from 0 to _shotgunMagCount do {player removeMagazine "8Rnd_B_Beneli_74Slug"};
		};
		if (!_hasShotgun and _hasShotgunMag) then {
			player commandChat "You are not allowed to steal from cop cars.";
			player commandChat "this is against the rules and is punishable by BAN";
			server globalchat format ["%1 Tried to steal from a cop car! Remind them that this is against the rules!", name player];
			_vcl addMagazineCargo ["8Rnd_B_Beneli_74Slug",_shotgunMagCount];
			for "_i" from 0 to _shotgunMagCount do {player removeMagazine "8Rnd_B_Beneli_74Slug"};
		};
		
		if (_hasRifle and _hasRifleMag) then {
			player commandChat "You are not allowed to steal from cop cars.";
			player commandchat "This is against the rules and is punishable by BAN";
			server globalchat format ["%1 Tried to steal from a cop car! Remind them that this is against the rules!", name player];
			player removeWeapon "RH_m4";
			_vcl addWeaponCargo ["RH_m4",1];
			_vcl addMagazineCargo ["30Rnd_556x45_Stanag",_rifleMagCount];
			for "_i" from 0 to _rifleMagCount do {player removeMagazine "30Rnd_556x45_Stanag"};
		};
		if (!_hasRifle and _hasRifleMag) then {
			player commandChat "You are not allowed to steal from cop cars.";
			player commandChat "this is against the rules and is punishable by BAN";
			server globalchat format ["%1 Tried to steal from a cop car! Remind them that this is against the rules!", name player];
			_vcl addMagazineCargo ["30Rnd_556x45_Stanag",_rifleMagCount];
			for "_i" from 0 to _rifleMagCount do {player removeMagazine "30Rnd_556x45_Stanag"};
		};
	};
};