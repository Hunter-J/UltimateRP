//By OneShot.J

_h = execVM "Server\Tavi\FNC_ServerLoops.sqf";
waitUntil {scriptDone _h};
preprocessFile "Server\Tavi\FNC_ServerLoops.sqf";

execVM "Server\Tavi\variables.sqf";
execVM "Server\Tavi\setposition.sqf";
execVM "Server\Tavi\CivDescriptions.sqf";
execVM "Server\Tavi\loadPDVcls.sqf";
execVM "Server\Tavi\loadFDVcls.sqf";
execVM "Server\Tavi\loadPMCVcls.sqf";
execVM "Server\Tavi\adminActions.sqf";
//execVM "Server\Tavi\RefillPMCBox.sqf";

{_x setVariable ["BIS_noCoreConversations", true, true]} forEach allUnits;

player commandChat "You are an admin. DO NOT abuse your power, or it will be taken from you.";
ServerLoaded = true;
publicvariable "ServerLoaded";