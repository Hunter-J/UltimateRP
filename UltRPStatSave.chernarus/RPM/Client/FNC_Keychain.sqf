// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Keychain
RPM_Cfg_Inv_RetrieveKeys = {
    private ["_i","_idx","_add","_ret","_vcl","_uid"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _uid = call RPM_Cfg_Objects_GetUID;
    if (count(a37) > 0) then {
        _idx = -1;
        for [{_i = 0}, {_i < count(a37)}, {_i = _i + 1}] do {
            if (((a37 select _i) select 0) == _uid) then {
                _idx = _i;
            };
        };
        if (_idx != -1) then {
            _add = true;
            if (_add) then {
                for [{_i = 0}, {_i< count((a37 select _idx) select 1)}, {_i = _i + 1}] do {
                    _vcl = ((a37 select _idx) select 1) select _i;
                    if (!(_vcl in a20)) then {
                        a20 = a20 + [_vcl];
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Inv_AddKey = {
    private ["_ret","_vcl","_playerobj","_unitname"];
    _ret = false;
    _unitname = _this select 0;
    _playerobj = call compile _unitname;
    if (!(isNull(_playerobj))) then {
        _vcl = _this select 1;
        format["if (!(isDedicated)) then {
            if (RPM_Role == %1) then {
                if (!(""%2"" in a20)) then {
                    a20 set[count(a20), ""%2""];
                };
            };
        };", _playerobj, _vcl] call RPM_Cfg_Network_Broadcast;
        if (RPM_Diagnostics) then {
            [format["RPM(Keychain)|Added|%1|%2", _unitname, _vcl], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_DelKey = {
    private ["_ret","_vcl","_player","_playerobj"];
    _ret = false;
    _player = _this select 0;
    _playerobj = [_player] call RPM_Cfg_Objects_GetObject;
    if (!(isNull(_playerobj))) then {
        _vcl = _this select 1;
        format["if (!(isDedicated)) then {
            if (RPM_Role == %1) then {
                if (""%2"" in a20) then {
                    a20 = a20 - [""%2""];
                };
            };
        };", _playerobj, _vcl] call RPM_Cfg_Network_Broadcast;
        if (RPM_Diagnostics) then {
            [format["RPM(Keychain)|Removed|%1|%2", _player, _vcl], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_Dropkey = {
    private ["_key","_veh","_vehobj","_ret"];
    _ret = false;
    _key = ((a20) select (_this select 0));
    _vehobj = call compile _key;
    _veh = typeOf(_vehobj);
    if ([name RPM_Role, _key] call RPM_Cfg_Inv_DelKey) then {
        if (!(_key in a20)) then {
            format["if (local server) then {
                [""%1"", ""%2""] call RPM_Cfg_Inv_DelServerKey;
            };", name RPM_Role, _key] call RPM_Cfg_Network_Broadcast;
            lbDelete [16 , (_this select 0)];
            hint format[localize "v189", _veh];
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Inv_Givekey = {
    private ["_key","_ret","_tgtnum","_tgt"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _key = ((a20) select (_this select 0));
    _tgtnum = _this select 1;
    _tgt = RPM_POBJArr select _tgtnum;
    if ((!(alive _tgt)) || (isNull(_tgt))) exitWith {};
    if (_tgt == RPM_Role) exitWith {
        hint format[localize "v399"];
    };
    if (RPM_Role distance _tgt >= 9)  exitWith {
        hint format[localize "v155"];
    };
    [name _tgt, _key] call RPM_Cfg_Inv_AddKey;
    format["if (RPM_Role == %1) then {
        if (ctrlVisible 13) then {
            closeDialog 0;
        };
        hint ""%2"";
    };", _tgt, format[localize "v215", _key]] call RPM_Cfg_Network_Broadcast;
    [name RPM_Role, _key] call RPM_Cfg_Inv_DelKey;
    if (!(_key in a20)) then {
        lbDelete [16 , (_this select 0)];
        hint format[localize "v192", _key, _tgt, name _tgt];
        _ret = true;
    };
    if (RPM_Diagnostics) then {
        [format["RPM(Keychain)|Gave|%1|%2|%3", name RPM_Role, name _tgt, _key], false] call RPM_Cfg_Server_DiagnosticsDumper;
    };
    _ret;
};
RPM_Cfg_Inv_Dupekey = {
    private ["_key","_target","_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _key = ((a20) select (_this select 0));
    _target = _this select 1;
    if ((!(alive _target)) || (isNull(_target))) exitWith {};
    if (_target == RPM_Role) exitWith {
        hint format[localize "v399"];
    };
    if (RPM_Role distance _target >= 9)  exitWith {
        hint format[localize "v155"];
    };
    [name _target, _key] call RPM_Cfg_Inv_AddKey;
    format["if (RPM_RoleString == %1) then {
        if (ctrlVisible 13) then {
            closeDialog 0;
            [lbCurSel 3] call RPM_Cfg_Keychain_GUI;
        };
        hint ""%3"";
    };", _target, _key, format[localize "v215", _key]] call RPM_Cfg_Network_Broadcast;
    hint format[localize "v190", _key, _target, name _target];
    if (RPM_Diagnostics) then {
        [format["RPM(Keychain)|Duplicated|%1|%2|%3", name RPM_Role, name _target, _key], false] call RPM_Cfg_Server_DiagnosticsDumper;
    };
    _ret = true;
    _ret;
};