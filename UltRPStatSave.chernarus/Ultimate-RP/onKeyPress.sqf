private["_handled", "_faceCP", "_faceVP"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = false;
_keylist = [2,6,8,9,15,17,18,20,21,33,34,38,41,42,57,78,79,80,81];

/*
ESC = 1 
F1 = 59 
F2 = 60 
F3 = 61 
F4 = 62 
F5 = 63 
F6 = 64 
F7 = 65 
F8 = 66 
F9 = 67 
F10 = 68 
F11 = 87 
F12 = 88 
PRINT = 183 
SCROLL = 70 
PAUSE = 197 
` = 41  
1 = 2 
2 = 3 
3 = 4 
4 = 5 
5 = 6 
6 = 7 
7 = 8 
8 = 9 
9 = 10 
0 = 11 
- = 12 
= = 13 
, = 51 
. = 52 
/ = 53
; = 39
' = 40
[ = 26
] = 27
\ = 43
HOME = 199 
TAB = 15 
ENTER = 28 
DELETE = 211 
BACKSPACE = 14 
INSERT = 210 
END = 207 
PAGEUP = 201 
PAGEDOWN = 209 
CAPS = 58 
A = 30 
B = 48 
C = 46 
D = 32 
E = 18 
F = 33 
G = 34 
H = 35 
I = 23 
J = 36 
K = 37 
L = 38 
M = 50 
N = 49 
O = 24 
P = 25 
Q = 16 
R = 19 
S = 31 
T = 20 
U = 22 
V = 47 
W = 17 
X = 45 
Y = 21 
Z = 44 
SHIFTL = 42 
SHIFTR = 54 
UP = 200 
DOWN = 208 
LEFT = 203 
RIGHT = 205 
NUM_0 = 82 
NUM_1 = 79 
NUM_2 = 80 
NUM_3 = 81 
NUM_4 = 75 
NUM_5 = 76 
NUM_6 = 77 
NUM_7 = 71 
NUM_8 = 72 
NUM_9 = 73 
NUM_+ = 78 
NUM = 69 
NUM_/ = 181 
NUM_* = 55 
NUM_- = 74 
NUM_. = 83
NUM_ENTER = 156 
CTRLL = 29 
CTRLR = 157 
WINL = 219 
WINR = 220 
ALTL = 56
ALTR = 184
SPACE = 57 
APP = 221 
*/

if (!(_key in _keylist)) exitWith {};
if (isdog and _key != 57) exitWith {};
if (isstunned) exitwith {};


switch _key do {
	//TAB key
	case 15: {
		if (!_shift) exitwith {};
		if (INV_shortcuts) then {
			INV_shortcuts=false; 
			titletext["Ult-RP keys off", "PLAIN DOWN"];
			["Remove"] call UltRP_Actions;
		} else {
			INV_shortcuts=true; 
			titletext["Ult-RP keys on", "PLAIN DOWN"];
			["Add"] call UltRP_Actions;
		};
		_handled = true;
	};
	
	//Space key
	case 57: {
		if (!INV_shortcuts) exitwith {};
		if (isdog) then {
			["Dog"] execVM "Scripts\BiteCiv.sqf";
		} else {
			player commandChat "Name Tags disabled.";
		};
		_handled = true;
	};
	
	//G key
	case 34: {
	_vcls = nearestobjects [getpos player, ["LandVehicle", "Air", "Ship"], 5];
	_vcl = _vcls select 0;
		if (isdog) exitwith {};
		if (vehicle player == player) then {
			if ((player distance _vcl <= 5) and (!(_vcl in INV_VehicleArray))) exitwith {
				player commandchat "You must be the owner or have a key to access this vehicle's gear.";
			};
			if (locked _vcl) exitwith {
				player commandchat "Vehicle locked!";
			};
		};
	};
	
	//Num+
	case 78: {
		if (!INV_shortcuts) exitwith {};
		if (isAdmin and AdminMode) then {
			player setpos [getpos player select 0, getpos player select 1, (getpos player select 2) + 5];
			_handled = true;
		};
	};
	
	//1 key
	case 2: {
		if (!INV_shortcuts) exitwith {};
		if (!isSwimming) exitwith {};
		if (dialog) exitwith {
			closeDialog 0;
		};		
		call RPM_Cfg_Inv_GUI;
		_handled = true;
	};
	
	//Y key
	case 21: {
		if (!INV_shortcuts) exitwith {};
		if (!isSwimming) exitwith {};
		if (dialog) exitwith {
			closeDialog 0;
		};		
		call RPM_Cfg_Inv_Animations_GUI;
		_handled = true;
	};
	
	
	//L key
	case 38: {
	private ["_vcl","_locked"];
    _vcl = call RPM_Cfg_Objects_GetVehicle;
		if (!(isNull(_vcl))) then {
			_locked = locked _vcl;
			if (_locked) then {
				format["%1 lock false;", _vcl] call RPM_Cfg_Network_Broadcast;
				hint parseText format["<t color='#FF3B3E'>Vehicle Unlocked</t> ",12];
			} else {
				format["%1 lock true;", _vcl] call RPM_Cfg_Network_Broadcast;
				hint parseText format["<t color='#FF3B3E'>Vehicle Locked</t> ",12];
			};
			_handled = true;
		};
	};

	
	//T key
	case 20: {
	private ["_vcl","_locked"];
    _vcl = call RPM_Cfg_Objects_GetVehicle;
		if (!INV_shortcuts) exitwith {};
		if (vehicle player != player) exitwith {
			player commandChat "You must be outside the verhicle to access the trunk";
		};
		ctrlShow[30, true];
		["Trunk_Storage", _vclobj] call RPM_Cfg_Storage_GUI;
		_handled = true;
	};

	//E key
	case 18: {
	private ["_vcl","_locked"];
	_vcl = call RPM_Cfg_Objects_GetVehicle;
	_locked = locked _vcl;
		if (!INV_shortcuts) exitwith {};
		if (!(isNull(_vcl))) then {
			if (vehicle player != player) exitwith {
				if (_locked) exitwith {player commandChat "The vehicle is locked."};
				if (speed _vcl > 30) exitwith {player commandChat "The vehicle is moving too fast"};
				player action ["getOut", _vcl];
				_handled = true;
			};
			if (vehicle player == player) exitwith {
				if (_locked) exitwith {player commandChat "The vehicle is locked."};
				if (_vcl emptyPositions "Driver" > 0) exitwith {player action ["getInDriver", _vcl]};
				if (_vcl emptyPositions "Gunner" > 0) exitwith {player action ["getInGunner", _vcl]};
				if (_vcl emptyPositions "Commander" > 0) exitwith {player action ["getInCommander", _vcl]};
				if (_vcl emptyPositions "Cargo" > 0) exitwith {player action ["getInDriver", _vcl];_vcl spawn {keyblock=true;sleep 0.5;player moveincargo _this; keyblock=false;};};
				_handled = true;
			};
		};
	};

	
	//F key
	case 33: {
	};

	
	//tilde / ~ key
	case 41: {
	};
	
	
	//3 key
	case 4: {
		if (!INV_shortcuts) exitwith {};
		if (!RPM_Civ) exitwith {};
		player playAction "surrender";
		_handled = true;
	};

	
	//5 key
	case 6: {
		if (!INV_shortcuts) exitwith {};
		if (!RPM_Civ) exitwith {};
		npc_politics call RPM_Cfg_Groups_GUI;
		_handled = true;
	};
	
	
	//7 Key
	case 8: {
	_tgt = cursorTarget;
		if (!INV_shortcuts) exitwith {};
		if (dialog) exitwith {
			closeDialog 0;
		};
		if (AdminMode and (_tgt isKindOf "LandVehicle")) then {
			deleteVehicle _tgt;
		};
		_handled = true;
	};
	
	//8 Key
	case 9: {
	_tgt = cursorTarget;
		if (!INV_shortcuts) exitwith {};
		if (dialog) exitwith {
			closeDialog 0;
		};
		if (AdminMode and (_tgt isKindOf "Building")) then {
			deleteVehicle _tgt;
		};
		_handled = true;
	};
	
	//Code Keys
	//num 1 (code 1)
	case 79: {
	_vcl = vehicle player;
	_PatrolCars = ["ilpd_beat_f101","ilpd_slick_b40_pb"];
	_UCCars = ["suburban_pd_black","A2L_Tahoe_Blackuc","A2L_Tahoe_Whiteuc","bcpd_unmarked_black","bcpd_unmarked_white","bcpd_unmarked_grey","bcpd_unmarked_blue","bcpd_unmarked_sandstone","bcpd_unmarked_maroon"];
	_FD = ["a2l_squad","laddertruck","a2l_f350ambo","a2l_suburban_FD"];
	_Emerg = _PatrolCars + _UCCars + ["suburban_pd_k9"] + ["tcg_hrlycop"] + _FD;
		if (!INV_shortcuts) exitwith {};
		if (dialog) exitwith {
			closeDialog 0;
		};
		if (typeOf _vcl in _Emerg) then {
			[] execVM "Scripts\code1.sqf";
		};
		_handled = true;
	};
		
		
	//num 2 key (code 2)
	case 80: {
	_vcl = vehicle player;
	_PatrolCars = ["ilpd_beat_f101","ilpd_slick_b40_pb"];
	_UCCars = ["suburban_pd_black","A2L_Tahoe_Blackuc","A2L_Tahoe_Whiteuc","bcpd_unmarked_black","bcpd_unmarked_white","bcpd_unmarked_grey","bcpd_unmarked_blue","bcpd_unmarked_sandstone","bcpd_unmarked_maroon"];
	_FD = ["a2l_squad","laddertruck","a2l_f350ambo","a2l_suburban_FD"];
	_Emerg = _PatrolCars + _UCCars + ["suburban_pd_k9"] + ["tcg_hrlycop"] + _FD;
		if (!INV_shortcuts) exitwith {};
		if (dialog) exitwith {
			closeDialog 0;
		};
		if (typeOf _vcl in _Emerg) then {
			[] execVM "Scripts\code2.sqf";
		};
		_handled = true;
	};
		
		
	//num 3 Key (code 3)
	case 81: {
	_vcl = vehicle player;
	_PatrolCars = ["ilpd_beat_f101","ilpd_slick_b40_pb"];
	_UCCars = ["suburban_pd_black","A2L_Tahoe_Blackuc","A2L_Tahoe_Whiteuc","bcpd_unmarked_black","bcpd_unmarked_white","bcpd_unmarked_grey","bcpd_unmarked_blue","bcpd_unmarked_sandstone","bcpd_unmarked_maroon"];
	_FD = ["a2l_squad","laddertruck","a2l_f350ambo","a2l_suburban_FD"];
	_Emerg = _PatrolCars + _UCCars + ["suburban_pd_k9"] + ["tcg_hrlycop"] + _FD;
		if (!INV_shortcuts) exitwith {};
		if (dialog) exitwith {
			closeDialog 0;
		};
		if (typeOf _vcl in _Emerg) then {
			[] execVM "Scripts\code3.sqf";
		};
		_handled = true;
	};

	
	//W key
	case 17: {
	_vcl = vehicle player;
	_vel = velocity _vcl;
	_Tuned = _vcl getVariable "Tuned";
		if (_vcl == player) exitwith {};
		if (isEngineOn _vcl and _Tuned == "True" and speed _vcl <= 190) then {
			_vcl setVelocity [(_vel select 0) * 1.005, (_vel select 1) * 1.005, (_vel select 2) * 0.99];
		};
	};
};

_handled;