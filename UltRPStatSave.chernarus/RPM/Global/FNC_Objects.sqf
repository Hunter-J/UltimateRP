// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Objects
RPM_Cfg_Objects_GetSideNumber = {
    private ["_ret","_player"];
    _ret = -1;
    _player = _this;
    if (!(isNull(_player))) then {
        if (side _player == WEST) then {
            _ret = 1;
        } else {
            _ret = 0;
        };
    };
    _ret;
};
RPM_Cfg_Objects_IsAdmin = {
    private ["_i","_ret","_uid","_player"];
    _ret = false;
    _player = _this;
    if (!(isNull(_player))) then {
        _uid = _this call RPM_Cfg_Objects_GetUIDByObject;
        if (_uid call RPM_str_Length >= 1) then {
            if (!(isNil("RPM_Admins"))) then {
                for [{_i = 0}, {_i < count(RPM_Admins)}, {_i = _i + 1}] do {
                    if (((RPM_Admins select _i) select 0) == _uid) then {
                        _ret = true;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetObjectByName = {
    private ["_ret","_name","_i","_aname"];
    _ret = objNull;
    _name = _this;
    if (_name call RPM_str_Length >= 1) then {
        for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
            if (!(isNull(RPM_POBJArr select _i))) then {
                _aname = name (RPM_POBJArr select _i);
                if (_aname == _name) then {
                    _ret = RPM_POBJArr select _i;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetObjectByUID = {
    private ["_i","_ret","_auid","_uid"];
    _ret = objNull;
    _uid = _this;
    if (_uid call RPM_str_Length >= 1) then {
        for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
            if (!(isNull(RPM_POBJArr select _i))) then {
                _auid = getPlayerUID (RPM_POBJArr select _i);
                if (_uid == _auid) then {
                    _ret = RPM_POBJArr select _i;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetOnlineUIDs = {
    private ["_i","_uid","_ret"];
    _ret = [];
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            _uid = getPlayerUID (RPM_POBJArr select _i);
            _ret = _ret + [_uid];
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetSlotByString = {
    private ["_i","_tmp","_ret","_arr","_slot"];
    _ret = -1;
    if (!(isNil("_this"))) then {
        if (count(_this) == 1) then {
            _slot = _this select 0;
            if (typeName(_slot) == "STRING") then {
                if (_slot call RPM_str_Length >= 1) then {
                    _tmp = "";
                    _arr = _slot call RPM_str_StrToArr;
                    for [{_i = 0}, {_i < count(_arr)}, {_i = _i + 1}] do {
                        if ((_arr select _i) call RPM_str_IsNumeric) then {
                            _tmp = _tmp + (_arr select _i);
                        };
                    };
                    if (_tmp call RPM_str_Length >= 1) then {
                        _ret = _tmp call RPM_str_StrToInt;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetSlot = {
    private ["_ret","_i","_tmp","_parr","_player","_slot"];
    _ret = -1;
    if (!(isNil("_this"))) then {
        if (count(_this) == 1) then {
            _player = _this select 0;
            if (typeName(_player) == "OBJECT") then {
                if (!(isNull(_player))) then {
                    _tmp = "";
                    // Format player object 'vehicleInit' for unit object name
                    _parr = (format["%1", _player]) call RPM_str_StrToArr;
                    // Concatenate the numerics to determine indice
                    for [{_i = 0}, {_i < count(_parr)}, {_i = _i + 1}] do {
                        if ((_parr select _i) call RPM_str_IsNumeric) then {
                            _tmp = _tmp + (_parr select _i);
                        };
                    };
                    if (_tmp call RPM_str_Length >= 1) then {
                        _slot = _tmp call RPM_str_StrToInt;
                        if (side _player == WEST) then {
                            _ret = _slot + CivsCount;
                        } else {
                            _ret = _slot;
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetUIDByPlayername = {
    private ["_i","_ret","_theuid","_playername"];
    _ret = "";
    _playername = _this select 0;
    if (_playername call RPM_str_Length >= 1) then {
        for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
            if (!(isNull(RPM_POBJArr select _i))) then {
                if ((name(RPM_POBJArr select _i)) == _playername) then {
                    _theuid = str(getPlayerUID(RPM_POBJArr select _i));
                    _ret = [_theuid, 1, (_theuid call RPM_str_Length) - 1] call RPM_str_SubString;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetPlayerByUID = {
    private ["_i","_ret","_uid"];
    _ret = objNull;
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
            if (!(isNull(RPM_POBJArr select _i))) then {
                if ((getPlayerUID(RPM_POBJArr select _i)) == _uid) then {
                    _ret = RPM_POBJArr select _i;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetUIDByObject = {
    private ["_ret","_playerobj","_theuid"];
    _ret = "";
    _playerobj = _this;
    _theuid = str(getPlayerUID _playerobj);
    _ret = [_theuid, 1, (_theuid call RPM_str_Length) - 1] call RPM_str_SubString;
    _ret;
};
RPM_Cfg_Objects_GetUID = {
    private ["_ret","_playerobj","_theuid"];
    _ret = "";
    _playerobj = RPM_Role;
    _theuid = str(getPlayerUID _playerobj);
    _ret = [_theuid, 1, (_theuid call RPM_str_Length) - 1] call RPM_str_SubString;
    _ret;
};
RPM_Cfg_Objects_GetNOnline = {
    private ["_i","_ret"];
    _ret = 0;
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            _ret = _ret + 1;
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetNCivsOnline = {
    private ["_i","_ret"];
    _ret = 0;
    for [{_i = 0}, {_i < count(RPM_POBJArrCiv)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArrCiv select _i))) then {
            _ret = _ret + 1;
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetNCopsOnline = {
    private ["_i","_ret"];
    _ret = 0;
    for [{_i = 0}, {_i < count(RPM_POBJArrCop)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArrCop select _i))) then {
            _ret = _ret + 1;
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetWanted = {
    private ["_i","_ret","_player"];
    _ret = [];
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            _player = RPM_POBJArr select _i;
            if (alive _player) then {
                if (!(_player in _ret)) then {
                    if ((name _player) call RPM_Cfg_Crimes_IsWanted) then {
                        _ret = _ret + [_player];
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetUnit = {
    private ["_i","_ret","_player"];
    _ret = "";
    _player = _this;
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            if (name(RPM_POBJArr select _i) == _player) then {
                _ret = format["%1", (RPM_POBJArr select _i)];
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_IsUnit = {
    private ["_i","_ret","_player"];
    _ret = false;
    _player = _this;
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            if (name(RPM_POBJArr select _i) == _player) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_IsPlayerVCL = {
    private ["_c","_ret","_avcl","_vcl"];
    _ret = false;
    _vcl = _this;
    for [{_c = 0}, {_c < count(a20)}, {_c = _c + 1}] do {
        _avcl = a20 select _c;
        if (_vcl == _avcl) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Objects_IsServerVCL = {
    private ["_c","_n","_ret","_avcl","_ownerarr","_avcls","_vcl"];
    _ret = false;
    _vcl = _this;
    for [{_c = 0}, {_c < count(a37)}, {_c = _c + 1}] do {
        _ownerarr = a37 select _c;
        _avcls = _ownerarr select 1;
        for [{_n = 0}, {_n < count(_avcls)}, {_n = _n + 1}] do {
            _avcl = _avcls select _n;
            if (_avcl == _vcl) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetIdx = {
    private ["_i","_player","_ret"];
    _ret = -1;
    _player = _this;
    for [{_i=0},{_i<count(RPM_POBJArr)},{_i=_i+1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            if ((RPM_POBJArr select _i) == _player) then {
                _ret = _i;
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_RecompileArrays = {
    private ["_i","_ret"];
    _ret = false;
    for [{_i = 0}, {_i < count(RPM_POBJArrCiv)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArrCiv select _i))) then {
            format["RPM_POBJArrCiv set[%1, %2]", _i, (RPM_POBJArrCiv select _i)] call RPM_Cfg_Network_Broadcast;
        };
    };
    for [{_i = 0}, {_i < count(RPM_POBJArrCop)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArrCop select _i))) then {
            format["RPM_POBJArrCop set[%1, %2]", _i, (RPM_POBJArrCop select _i)] call RPM_Cfg_Network_Broadcast;
        };
    };
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            format["RPM_POBJArr set[%1, %2]", _i, (RPM_POBJArr select _i)] call RPM_Cfg_Network_Broadcast;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Objects_GetVehicle = {
    private ["_ret"];
    _ret = objNull;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (vehicle RPM_Role != RPM_Role) then {
        _ret = vehicle RPM_Role;
    } else {
        if (!(isNull(cursorTarget))) then {
            if (!(isPlayer(cursorTarget))) then {
                _ret = cursorTarget;
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetObject = {
    private ["_i","_ret","_player"];
    _ret = objNull;
    _player = _this select 0;
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            if ((name(RPM_POBJArr select _i)) == _player) then {
                _ret = RPM_POBJArr select _i;
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetObjectByUnit = {
    private ["_i","_ret","_unit"];
    _ret = objNull;
    _unit = _this select 0;
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            if ((format["%1", RPM_POBJArr select _i]) == _unit) then {
                _ret = RPM_POBJArr select _i;
            };
        };
    };
    _ret;
};
RPM_Cfg_Objects_IsArmed = {
    private ["_ret","_tgt","_i","_weps"];
    _ret = false;
    _tgt = _this;
    if ((isNull(_tgt)) || (!(alive _tgt))) exitWith {};
    _weps = + (weapons _tgt);
    for [{_i = 0}, {_i < count(_weps)}, {_i = _i + 1}] do {
        {
            if ((_weps select _i) == _x) then {
                _weps = _weps - [_x];
            };
            if ((_weps select _i == "ItemRadio")) then {
                _weps = _weps - ["ItemRadio"];
            };
        } forEach a30;
    };
    if (count(_weps) >= 1) then {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Objects_IsUnit = {
    private ["_ret","_obj"];
    _ret = false;
    _obj = _this select 0;
    if (!(isNull(_obj))) then {
        _ret = true;
    };
    _ret;
};
// Weapons
RPM_Cfg_Objects_GetMyWeapons = {
    private ["_i","_add","_ret","_wep","_tgt","_myweps"];
    _ret = [];
    _tgt = _this;
    _myweps = + (weapons _tgt);
    for[{_i=0}, {_i < count(_myweps)},{_i=_i+1}] do {
        _wep = _myweps select _i;
        _add = true;
        {
            if (_wep == _x) then {
                _add = false;
            };
        }  forEach a32;
        if (_add) then {
            _ret = _ret + [_wep];
        };
    };
    _ret;
};
// Magazines
RPM_Cfg_Objects_GetMyMags = {
    private ["_i","_mags","_temparray","_n","_mamount","_found","_mag","_magstemp","_tgt","_ret"];
    _ret = [];
    _tgt = _this;
    _mags = [];
    _magstemp = [];
    for[{_i=0}, {_i < count(magazines _tgt)},{_i=_i+1}] do {
        _mag = (magazines _tgt) select _i;
        _mags = _mags + [_mag];
    };
    {
        for [{_i = 0}, {_i < count(_mags)}, {_i = _i + 1}] do {
            if ((_mags select _i) == _x) then {
                _mags set[_i, -1];
                _mags = _mags - [-1];
            };
        };
    }  forEach a32;
    for [{_i = 0}, {_i < count(_mags)}, {_i = _i + 1}] do {
        _mag = _mags select _i;
        _temparray = [];
        if (count(_magstemp) == 0) then {
            _temparray = [_mag, 1];
            _magstemp set[0, _temparray];
        } else {
            _found = false;
            for [{_n = 0}, {_n < count(_magstemp)}, {_n = _n + 1}] do {
                if (((_magstemp select _n) select 0) == _mag) then {
                    _mamount = ((_magstemp select _n) select 1) + 1;
                    (_magstemp select _n) set[1, _mamount];
                    _found = true;
                };
            };
            if (!(_found)) then {
                _temparray = [_mag, 1];
                _magstemp set[count(_magstemp), _temparray];
            };
        };
    };
    _ret = _magstemp;
    _ret;
};
// Vehicles
RPM_Cfg_Objects_GetMyVCLS = {
    private ["_ret","_obj","_distance"];
    _ret = [];
    _obj = _this select 0;
    if (!(isNull(_obj))) then {
        _distance = _this select 1;
        if (count(nearestObjects[_obj,["Air", "Ship","Car","Motorcycle","Tank","Truck"], _distance]) > 0) then {
            _ret  = nearestObjects[_obj,["Air", "Ship","Car","Motorcycle","Tank","Truck"], _distance];
            {
                if (!(format["%1", _x] in a20)) then {
                    if (_x in _ret) then {
                        _ret = _ret - [_x];
                    };
                };
            } forEach _ret;
        };
    };
    _ret;
};
RPM_Cfg_Objects_GetLocalVCLS = {
    private ["_ret","_obj","_distance"];
    _ret = [];
    _obj = _this select 0;
    _distance = _this select 1;
    if (count(nearestObjects[_obj,["Air", "Ship","Car","Motorcycle","Tank","Truck"], _distance]) > 0) then {
        _ret  = nearestObjects[_obj,["Air", "Ship","Car","Motorcycle","Tank","Truck"], _distance];
    };
    _ret;
};
RPM_Cfg_Objects_GetBox = {
    private ["_ret","_i","_npc","_distance"];
    _ret = objNull;
    _npc = _this select 0;
    _distance = 8;
    switch (_npc) do {
        case npc_storage_civ: {
            _distance = 14;
        };
        case npc_storage_cop: {
            _distance = 14;
        };
		case npc_storage_air: {
            _distance = 14;
        };
		case npc_storage_boat: {
            _distance = 14;
        };
    };
    for [{_i = 0}, {_i < count(a6)}, {_i = _i + 1}] do {
        if (_npc distance (a6 select _i) <= _distance) then {
            _ret = (a6 select _i);
        };
    };
    _ret;
};
