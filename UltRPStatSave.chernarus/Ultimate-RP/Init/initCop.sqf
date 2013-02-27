// By Ultimate-RP Dev Team: http://ultimate-rp.com

player addMPEventHandler ["MPRespawn",{["Add"] call UltRP_CopCount}];  
player addMPEventHandler ["MPKilled",{["Sub"] call UltRP_CopCount}];