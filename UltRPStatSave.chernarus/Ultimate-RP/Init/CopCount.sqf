// By Ultimate-RP Dev Team: http://ultimate-rp.com
_Cops = [cop3,cop4,cop5,cop6,cop7,cop8,cop9,cop10,cop11,cop12,cop13];

{
	_x addMPEventHandler ["MPRespawn",{copcount = copcount + 1}];  
	_x addMPEventHandler ["MPKilled",{copcount = copcount - 1}];
} forEach _Cops;