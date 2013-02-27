// By Ultimate-RP Dev Team: http://ultimate-rp.com

//Process Funcs for later use
_scripts = [
	"Ultimate-RP\Functions\FNC_Respawn.sqf",
	"Ultimate-RP\Functions\FNC_ACRE.sqf",
	"Ultimate-RP\Functions\FNC_Actions.sqf",
	"Ultimate-RP\Functions\FNC_CBAEventHandlers.sqf",
	"Ultimate-RP\Functions\FNC_CopCount.sqf",
	"Ultimate-RP\Functions\FNC_Debug.sqf",
	"Ultimate-RP\Functions\FNC_Dispatch.sqf",
	"Ultimate-RP\Functions\FNC_Train.sqf",
	"Ultimate-RP\Functions\FNC_Rob.sqf",
	"Ultimate-RP\Functions\FNC_UI.sqf",
	"Ultimate-RP\Functions\FNC_Taxi.sqf"
];
_loaded = 0;
for [{_i = 0}, {_i < count(_scripts)}, {_i = _i + 1}] do {
    _line = format["Loading script %1 of %2...", _i + 1, count(_scripts)];
    if (isDedicated) then {
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

onKeyPress = compile preprocessFile "Ultimate-RP\onKeyPress.sqf";
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call onKeyPress"];


//Load Scripts
_scripts = [
	"Ultimate-RP\Init\Client\Variables.sqf",
	//"Ultimate-RP\Init\Client\whitelist.sqf",
	"Ultimate-RP\Init\Client\initRespawn.sqf",
    //"Ultimate-RP\Init\Client\CreateMarkers.sqf",
	"Ultimate-RP\Init\Client\DisablePumps.sqf",
	"Ultimate-RP\Houses\HouseActions.sqf",
	"Ultimate-RP\Bank\DoorActions.sqf"
	//"Ultimate-RP\SpeedCams.sqf"
	//"Ultimate-RP\itemactions.sqf"
	//"Ultimate-RP\net.sqf",
	//"Ultimate-RP\monitor.sqf"
];
if (RPM_Cop) then {
	_scripts = _scripts + ["Ultimate-RP\Init\initCop.sqf"];
};
if (RPM_FF) then {
	_scripts = _scripts + ["Ultimate-RP\Init\initFF.sqf"];
};
_loaded = 0;
for [{_i = 0}, {_i < count(_scripts)}, {_i = _i + 1}] do {
_line = format["Loading UltRP script %1 of %2", _i + 1, count(_scripts)];
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
player addWeapon "ItemGPS";
[511, 1] call RPM_Cfg_Inv_AddItemAmount;
["Add"] call UltRP_Actions;
call UltRP_UI_Intro;
player commandChat "Ultimate-RP scripts loaded successfully!";
execVM "Ultimate-RP\ClientLoop.sqf";