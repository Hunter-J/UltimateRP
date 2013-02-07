player addMPEventHandler ["MPRespawn",{["Add"] call UltRP_CopCount}];  
player addMPEventHandler ["MPKilled",{["Sub"] call UltRP_CopCount}];