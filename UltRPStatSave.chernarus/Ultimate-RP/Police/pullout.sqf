_target = (crew _this) select 0;
_n 	= 10;
_exitvar = false;

if (locked _this) then {player commandChat "The car is locked. This might take a while."; _n = 16;};
			
player commandChat format ["You're pulling out %1. Stay close to the car!", _target];
format['if(player == %1)then{player commandChat "%2 is pulling you out of the car!"}', _target, player] call broadcast;
	
for [{_i=0}, {_i < _n}, {_i=_i+1}] do {if (player distance _target > 3) exitWith {player commandChat "You are too far away."; _exitvar = true;};sleep 0.3;};

if(_exitvar)exitwith{};
		
_this lock false;

player switchMove "AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow";
sleep 0.4;
format['if(player == %1)then{player action["eject", vehicle player]};', _target] call broadcast;


