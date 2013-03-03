// By Ultimate-RP Dev Team: http://ultimate-rp.com

_h = execVM "Server\StatSave\FNC_ServerLoops.sqf";
waitUntil {scriptDone _h};
preprocessFile "Server\StatSave\FNC_ServerLoops.sqf";

execVM "Server\StatSave\Variables.sqf";
execVM "Server\StatSave\CivDescriptions.sqf";
//execVM "Server\StatSave\setposition.sqf";
execVM "Server\StatSave\serverloop.sqf";
execVM "Server\StatSave\fire.sqf";