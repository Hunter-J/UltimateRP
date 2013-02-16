// By Ultimate-RP Dev Team: http://ultimate-rp.com

_Array = _this select 3;
_Sel  = _Array select 0;

switch (_Sel) do {
	case "Bank": {
	_Type = _Array select 1;
		if (_Type == "Rob" or _Type == "Reset") then {
			[_Sel, _Type] call UltRP_Rob;
		} else {
		_Pile = _Array select 2;
			[_Sel, _Type, _Pile] call UltRP_Rob;
		};
	};
	
	case "Pub": {
		player commandChat "1";
		[_Sel] call UltRP_Rob;
	};
	
	case "Station": {
	_Station = _Array select 1;
		[_Sel, _Station] call UltRP_Rob;
	};
};