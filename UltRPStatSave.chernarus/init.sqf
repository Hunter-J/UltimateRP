// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

private ["_h","_i","_script","_loaded","init_scripts","_line"];
enableSaving[false, false];

waitUntil {time > 0.1};
player enableSimulation false;
_h = []execVM "load.sqf";
waitUntil {scriptDone _h};

for [{_i = 0}, {_i < count(init_scripts)}, {_i = _i + 1}] do {
    _script = init_scripts select _i;
    _h = execVM _script;
    preprocessFile _script;
};
sleep 4;

// Version variables
execVM "version.sqf";
waitUntil {(!(isNil("ARMA2_CO")))};

// Arrays
b45 = nil;
[] execVM "RPM\Global\INC_Players.sqf";
waitUntil {(!(isNil("b45")))};
b45 = nil;

// Attach Object EH
b46 = nil;
[32, RPM_RoleNumber] execVM "RPM\Global\FNC_Broadcast.sqf";
waitUntil {(!(isNil("b46")))};
b46 = nil;

_h = call RPM_Cfg_Objects_RecompileArrays;
waitUntil {_h};
format["call RPM_Cfg_Inv_CompilePlayers;"] call RPM_Cfg_Network_Broadcast;

// Server loops
call RPM_Cfg_Loops_InitServer;

// Client settings
if(!(isDedicated)) then {
	//Init Ultimate-RP Scripts
	execVM "Ultimate-RP\Init.sqf";
	
	CBA_display_ingame_warnings = false;
    while {RPM_Saving_Loading} do {
        cutText ["","BLACK OUT"];
        cutText [format[localize "STRM_Saving_Loading"],"PLAIN",3];
        sleep 3;
    };
    b47 = nil;
    execVM "RPM\Client\STD_Client.sqf";
    waitUntil {(!(isNil("b47")))};
    b47 = nil
};
waitUntil {(!(RPM_Saving_Loading))};
// Client loops
call RPM_Cfg_Loops_InitClient;