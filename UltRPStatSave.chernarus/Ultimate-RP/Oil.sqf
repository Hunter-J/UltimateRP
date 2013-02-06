//By OneShot.J
player commandChat "1";
_Pump = nearestObject [player, "Land_Ind_Oil_Pump_EP1"];
if (player != vehicle player) exitwith {};
if (RPM_Cop) exitwith {};
if (Drilling) exitwith {player commandChat "You're still drilling!";
if (_Pump getVariable "inuse" == "True") exitwith {player commandChat "Someone else is using this Oil Pump!";

player commandChat "2";
if (!Drilling) then {
	Drilling = true;
	_Pump setVariable ["inuse", "True", true];
	titletext ["Drilling...", "PLAIN DOWN", 1];
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 5;
	waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
	[540, 1] call RPM_Cfg_Inv_AddItemAmount;
	player commandChat "You Colleted Some Crude Oil!";
	_Pump setVariable ["inuse", "False", true];
	Drilling = false;
};
