// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

private ["_obj","_pos","_dir","_art"];
_art = _this select 0;
if (_art == "nomove") then {
    if (!(isServer)) exitwith {};
    sleep 10;
    _obj = _this select 1;
    _pos = getposASL _obj;
    _dir = getdir _obj;
    while {true} do {
        if (!(getposASL _obj select 0 in _pos) or (!(getposASL _obj select 1 in _pos))) then {
            _obj setposASL _pos;
            _obj setdir _dir;
        };
        sleep 60;
    };
};
