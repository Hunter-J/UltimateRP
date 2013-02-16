player addEventHandler ["Respawn",{["Alive"] call UltRP_Respawn}];  
player addEventHandler ["Killed",{["Dead"] call UltRP_Respawn}];

//First Spawn
waituntil {alive player};
["Alive"] call UltRP_Respawn;