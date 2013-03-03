// By Ultimate-RP Dev Team: http://ultimate-rp.com

if (isServer) then {
	execVM "Server\StatSave\InitServer.sqf";
};

if (!isDedicated) then {
	waituntil {vehicle player == player or !isNull player};
	player enableSimulation false;
	waitUntil {!(isNil "ServerLoaded")};
	
	//Init Functions
	_scripts = [
		"Ultimate-RP\Functions\FNC_ACRE.sqf",
		"Ultimate-RP\Functions\FNC_Actions.sqf",
		"Ultimate-RP\Functions\FNC_CopCount.sqf",
		"Ultimate-RP\Functions\FNC_Debug.sqf",
		"Ultimate-RP\Functions\FNC_Train.sqf",
		"Ultimate-RP\Functions\FNC_Rob.sqf",
		"Ultimate-RP\Functions\FNC_UI.sqf",
		//"Ultimate-RP\Functions\FNC_Taxi.sqf",
		"Ultimate-RP\FD\FD.sqf"
	];
	_loaded = 0;
	for [{_i = 0}, {_i < count(_scripts)}, {_i = _i + 1}] do {
		_line = format["Loading script %1 of %2...", _i + 1, count(_scripts)];
		if (RPM_Debug) then {
			diag_log _line;
		} else {
			//2 cutText [_line,"PLAIN",2];
		};
		_script = _scripts select _i;
		_h = execVM _script;
		waitUntil {scriptDone _h};
		preprocessFile _script;
		_loaded = _loaded + 1;
	};
	player commandChat "Ultimate-RP functions processed successfully!";
	sleep 4;
	
	//Init Scripts
	execVM "Ultimate-RP\Init\Variables.sqf";
	if (!isServer) then {
		_h = execVM "Ultimate-RP\Init\whitelist.sqf";
		waitUntil {scriptDone _h};
	};
	execVM "Ultimate-RP\Init\CreateMarkers.sqf";
	execVM "Ultimate-RP\Init\DisablePumps.sqf";
	execVM "Ultimate-RP\Init\Variables.sqf";
	execVM "Ultimate-RP\Init\InitHandlers.sqf";
	execVM "Ultimate-RP\Houses\HouseActions.sqf";
	execVM "Ultimate-RP\Bank\DoorActions.sqf";
	execVM "Ultimate-RP\SpeedCams.sqf";
	execVM "Ultimate-RP\itemactions.sqf";
	execVM "Ultimate-RP\net.sqf";
	execVM "Ultimate-RP\monitor.sqf";

	BIS_Effects_Burn = compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
	onKeyPress = compile preprocessFile "Ultimate-RP\onKeyPress.sqf";
	waituntil {!(IsNull (findDisplay 46))};
	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call onKeyPress"];
	
	removeAllWeapons player;
	player enableSimulation true;
	[511, 1] call RPM_Cfg_Inv_AddItemAmount;
	["Add"] call UltRP_Actions;
	call UltRP_UI_Intro;
	player commandChat "Ultimate-RP scripts loaded successfully!";
	execVM "Ultimate-RP\ClientLoop.sqf";
};