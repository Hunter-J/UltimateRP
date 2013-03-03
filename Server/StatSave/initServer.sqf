// By Ultimate-RP Dev Team: http://ultimate-rp.com

execVM "Server\StatSave\Variables.sqf";
execVM "Server\StatSave\CivDescriptions.sqf";
//execVM "Server\StatSave\setposition.sqf";
execVM "Server\StatSave\serverloop.sqf";

ServerLoaded = true;
publicvariable "ServerLoaded";