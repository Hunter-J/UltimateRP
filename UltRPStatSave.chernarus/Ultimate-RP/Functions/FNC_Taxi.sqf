// By Ultimate-RP Dev Team: http://ultimate-rp.com

UltRP_Taxi_Send = {
	[] spawn {
		_Towns = nearestLocations [player, ["NameVillage","NameCity","NameCityCapital"], 20000]; 
		_Town = text (_Towns select 0);
			
		player commandChat "A taxi has been dispatched to your location";
		sleep 5;
		["CallTaxi", [name player, _Town, mapGridPosition player]] call CBA_fnc_globalEvent;
	};
};


UltRP_Taxi_Receive = {
	[] spawn {
		_vcl = vehicle player;

		_player = _this select 0;
		_town = _this select 1;
		_pos = _this select 2;

		if ((typeOf _vcl == "tcg_taurus_taxi") and (_vcl emptyPositions "Cargo" == 5)) then {
			hint format ["%1 called for a taxi from %2 at %3", _player, _town, _pos];
		};
	};
};