//By OneShot.J

//Gas Stations & Pub
_NPC = [npc_petrol1, npc_petrol2, npc_petrol3, npc_petrol4, npc_petrol5, npc_petrol6];
{
_Civ = nearestObjects [getpos _x, ["Man"], 15] - [_x] select 0;
	if ((player distance _x>= 25) and (_x getVariable "Surrender" == "True")) then {
		_x switchMove "";
		_x setVariable ["Surrender", "False", true];
	};
} forEach _NPC;

//Bank
_Civ = nearestObjects [getpos npc_bank, ["Man"], 25] - [npc_bank] select 0;
if ((player distance npc_bank >= 25) and (npc_bank getVariable "Surrender" == "True")) then {
	mainbank switchMove "";
	mainbank setVariable ["Surrender", "False", true];
};