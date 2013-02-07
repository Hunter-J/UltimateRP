// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/
// Modified by Ultimate-RP Dev Team for Gold Coast

private ["_h","_i","_script","_loaded","init_scripts","_line"];
enableSaving[false, false];

waitUntil {time > 0.1};
player enableSimulation false;

//Initialise Scripts
init_scripts = 
[
    "RPM\Global\INC_Items.sqf",
    "RPM\Global\INC_Farms.sqf",
    "RPM\Global\INC_Factory.sqf",
    "RPM\Global\INC_Shops.sqf",
    "RPM\Global\FNC_Strings.sqf",
    "RPM\Global\KRON_Strings.sqf",
    "RPM\Global\FNC_Bombs.sqf",
    "RPM\Global\FNC_Crimes.sqf",
    "RPM\Global\FNC_Farms.sqf",
    "RPM\Global\FNC_Factory.sqf",
    "RPM\Global\FNC_Groups.sqf",
    "RPM\Global\FNC_Inventory.sqf",
    "RPM\Global\FNC_Items.sqf",
    "RPM\Global\FNC_Logs.sqf",
    "RPM\Global\FNC_Loops.sqf",
    "RPM\Global\FNC_Objects.sqf",
    "RPM\Global\FNC_Police.sqf",
    "RPM\Global\FNC_Saving.sqf",
    "RPM\Global\FNC_Shops.sqf",
	"RPM\Global\FNC_Skills.sqf",
    "RPM\Global\FNC_Storage.sqf",
    "RPM\Global\FNC_Vehicles.sqf",
    "RPM\Client\FNC_Banking.sqf",
    "RPM\Client\FNC_Delivery.sqf",
    "RPM\Client\FNC_Jail.sqf",
    "RPM\Client\FNC_Licenses.sqf",
    "RPM\Client\FNC_Keychain.sqf",
    "RPM\Client\FNC_Politics.sqf",
    "RPM\Client\GUI\FNC_Banking.sqf",
    "RPM\Client\GUI\FNC_Factory.sqf",
    "RPM\Client\GUI\FNC_Groups.sqf",
    "RPM\Client\GUI\FNC_Interact.sqf",
    "RPM\Client\GUI\FNC_Inventory.sqf",
    "RPM\Client\GUI\FNC_Keychain.sqf",
    "RPM\Client\GUI\FNC_Jail.sqf",
    "RPM\Client\GUI\FNC_Logs.sqf",
    "RPM\Client\GUI\FNC_Police.sqf",
    "RPM\Client\GUI\FNC_Politics.sqf",
    "RPM\Client\GUI\FNC_Shops.sqf",
	"RPM\Client\GUI\FNC_Skills.sqf",
    "RPM\Client\GUI\FNC_Storage.sqf",
    "RPM\Client\GUI\FNC_Vehicles.sqf"
];
for [{_i = 0}, {_i < count(init_scripts)}, {_i = _i + 1}] do {
    _script = init_scripts select _i;
    _h = execVM _script;
	waitUntil {scriptDone _h};
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