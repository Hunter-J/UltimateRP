waituntil {alive player};
removeAllWeapons player;
if (!RPM_K9Dog) then {
	player addWeapon "ItemGPS";
};

onKeyPress = compile preprocessFile "Ultimate-RP\Actions\onKeyPress.sqf";
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call onKeyPress"];

player commandChat "Loading Ultimate-RP Scripts...";
sleep 2;
_scripts = [
    "Ultimate-RP\Init\Variables.sqf",
	"Ultimate-RP\Init\whitelist.sqf",
	"Ultimate-RP\Actions\actions.sqf",
	"Ultimate-RP\Init\CopCount.sqf",
    "Ultimate-RP\Init\CreateMarkers.sqf",
    "Ultimate-RP\Init\Funcs.sqf",
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

_loaded = 0;
for [{_i = 0}, {_i < count(_scripts)}, {_i = _i + 1}] do {
    _line = format["Loading UltRP Script %1 of %2", _i + 1, count(_scripts)];
    if (isDedicated) then {
        diag_log _line;
    } else {
        2 cutText [_line,"PLAIN",2];
    };
    _script = _scripts select _i;
    _h = execVM _script;
    waitUntil {scriptDone _h};
    _loaded = _loaded + 1;
};

call UltRP_UI_Intro;
player commandChat "Ultimate RP 1.1 Initialized!";
execVM "Ultimate-RP\ClientLoop.sqf";
