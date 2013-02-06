_Array = _this select 3
_Door = _Array select 0;
_Type = _Array select 1;

if (_Door == 1) then {
	if (_Type == Open) then {
		Bank animate ["door_1Anim",1];
	};
	if (_Type == Close) then {
		Bank animate ["door_1Anim",0];
	};
};

if (_Door == 2) then {
	if (_Type == Open) then {
		Bank animate ["door_6Anim",1];
	};
	if (_Type == Close) then {
		Bank animate ["door_6Anim",0];
	};
};