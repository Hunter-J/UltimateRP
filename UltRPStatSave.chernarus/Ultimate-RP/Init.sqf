waituntil {alive player};

//Process Funcs for later use
player commandChat "Processing Ultimate-RP Functions...";
_h = execVM "Ultimate-RP\Init\Funcs.sqf";
waitUntil {scriptDone _h};
preprocessFile "Ultimate-RP\Init\Funcs.sqf";
sleep 2;

onKeyPress = compile preprocessFile "Ultimate-RP\Actions\onKeyPress.sqf";
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call onKeyPress"];

//Load Scripts
player commandChat "Loading Ultimate-RP Scripts...";
_scripts = [
	"Ultimate-RP\Init\whitelist.sqf",
	"Ultimate-RP\Actions\actions.sqf",
    "Ultimate-RP\Init\CreateMarkers.sqf",
	"Ultimate-RP\Init\loadcopVeh.sqf",
	"Ultimate-RP\Init\HideObjects.sqf",
	"Ultimate-RP\Init\DisablePumps.sqf",
	"Ultimate-RP\Houses\HouseActions.sqf",
	"Ultimate-RP\Bank\DoorActions.sqf",
	"Ultimate-RP\Init\CivDescriptions.sqf"
	//"Ultimate-RP\net.sqf",
	//"Ultimate-RP\monitor.sqf"
];
if (RPM_K9Dog) then {
	_scripts = _scripts + ["Ultimate-RP\Init\initDogVision.sqf"];
};
if (RPM_Cop) then {
	_scripts = _scripts + ["Ultimate-RP\Init\CopCount.sqf"];
};
_loaded = 0;
for [{_i = 0}, {_i < count(_scripts)}, {_i = _i + 1}] do {
    _line = format["Loading UltRP Script %1 of %2", _i + 1, count(_scripts)];
    if (isDedicated or isServer) then {
        diag_log _line;
    } else {
        2 cutText [_line,"PLAIN",2];
    };
    _script = _scripts select _i;
    _h = execVM _script;
    waitUntil {scriptDone _h};
    _loaded = _loaded + 1;
};

removeAllWeapons player;
if (!RPM_K9Dog) then {
	player addWeapon "ItemGPS";
};
["Intro"] call UltRP_UI;
player commandChat "Ultimate RP 1.1 Initialized!";
execVM "Ultimate-RP\ClientLoop.sqf";