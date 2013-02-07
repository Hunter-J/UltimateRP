// By Ultimate-RP Dev Team: http://ultimate-rp.com
_Item = _this select 0;

if (_Item == "Marijuana") exitwith {
	while {_Percent < 100} do {
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [0.2,0.3,true]; 
		"chromAberration" ppEffectCommit 1;
		_Percent = _Percent + 10;
		sleep 1;
	};
	if (_Percent == 100) exitwith {};
};

if (_Item == "Cocaine") exitwith {
	while {_Percent < 100} do {
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [0.2,0.3,true]; 
		"chromAberration" ppEffectCommit 1;
		_Percent = _Percent + 10;
		sleep 1;
	};
	if (_Percent == 100) exitwith {};
};

if (_Item == "Meth") exitwith {
	while {_Percent < 100} do {
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [0.2,0.3,true]; 
		"chromAberration" ppEffectCommit 1;
		_Percent = _Percent + 10;
		sleep 1;
	};
	if (_Percent == 100) exitwith {};
};