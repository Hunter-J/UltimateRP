// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Crimes
RPM_Cfg_Crimes_Autojail = {
    private ["_ret"];
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_str","_bounty","_playername"];
        if (vehicle RPM_Role != RPM_Role) then {
            RPM_Role action ["eject", vehicle RPM_Role];
        };
        if (RPM_Civ) then {
            _str = "";
            if ("lic_pistol" call RPM_Cfg_Inv_RemoveLicense) then {
                _str = _str + format[localize "v248"];
            };
            if ("lic_rifle" call RPM_Cfg_Inv_RemoveLicense) then {
                if (_str call RPM_str_Length >= 1) then {
                    _str = _str + " & ";
                    _str = _str + format[localize "v250"];
                };
            };
            hint format[localize "v468"];
            sleep 2;
            if (_str call RPM_str_Length >= 1) then {
                hint format["%1 %2", format[localize "v469"], format[localize "v470", _str]];
            };
        };
        RPM_Role setPos (getMarkerPos "jail");
        _playername = name RPM_Role;
        _bounty = _playername call RPM_Cfg_Crimes_GetBounty;
        if (i21 > 500) then {
            _bounty = round(_bounty + 500);
            format["if (i21 - 500 >= 0) then {
                if (i21 >= 500) then {
                    i21 = i21 - 500;
                } else {
                    i21 = 0;
                };
            };"] call RPM_Cfg_Network_Broadcast;
        };
        [_playername, _bounty, round((_playername call RPM_Cfg_Crimes_GetTime) + (20 * 60)), false] call RPM_Cfg_Crimes_SetWanted;
        call RPM_Cfg_Jail_Jailed;
        if (RPM_Diagnostics) then {
            [format["RPM(Crimes)|Autojail|%1|500", _playername], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Crimes_Bankrob = {
    private ["_playername","_ret","_bounty"];
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _playername = name RPM_Role;
    _bounty = _playername call RPM_Cfg_Crimes_GetBounty;
    if (i21 > 750) then {
        _bounty = round(_bounty + 750);
        format["if (i21 - 750 >= 0) then {
            if (i21 >= 750) then {
                i21 = i21 - 750;
            } else {
                i21 = 0;
            };
        };"] call RPM_Cfg_Network_Broadcast;
    };
    [_playername, _bounty, round((_playername call RPM_Cfg_Crimes_GetTime) + (3 * 60)), false] call RPM_Cfg_Crimes_SetWanted;
    if (RPM_Diagnostics) then {
        [format["RPM(Crimes)|Bank Robbery|%1|750", _playername], false] call RPM_Cfg_Server_DiagnosticsDumper;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Crimes_Terrorcamp = {
    private ["_ret"];
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_bounty","_playername"];
        _playername = name RPM_Role;
        if (RPM_Cop) then {
            if (!(b30)) then {
                titleText[format["WARNING!\nIf you proceed you will be harmed!"],"Plain down"];
            };
        } else {
            titleText[format["WARNING!\nYou are entering a restricted area!"],"Plain down"];
            sleep 2;
            titleText[format["WARNING!\nIf you proceed you will become wanted!"],"Plain down"];
        };
        if (RPM_Role distance (getMarkerPos "marker_terror_hideout") <= 150) then {
            if ((RPM_Cop) && (!(b30))) then {
                b30 = true;
            };
            if (RPM_Cop) then {
                RPM_Role setDamage 1;
            };
            if (RPM_Civ) then {
                if (!(b30)) then {
                    _bounty = _playername call RPM_Cfg_Crimes_GetBounty;
                    if (i21 > 2500) then {
                        _bounty = round(_bounty + 2500);
                        format["if (i21 - 2500 >= 0) then {
                            if (i21 >= 2500) then {
                                i21 = i21 - 2500;
                            } else {
                                i21 = 0;
                            };
                        };"] call RPM_Cfg_Network_Broadcast;
                    };
                    [_playername, _bounty, round((_playername call RPM_Cfg_Crimes_GetTime) + (3 * 60)), false] call RPM_Cfg_Crimes_SetWanted;
                    b30 = true;
                    if (RPM_Diagnostics) then {
                        [format["RPM(Crimes)|Terror Camp Entry|%1", _playername], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    };
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Crimes_Jailbreak = {
    private ["_player","_playername","_ret","_bounty"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _player = RPM_Role;
    if ((!(alive _player)) || (isNull(_player))) exitWith {};
    _playername = name _player;
    [_playername, false] call RPM_Cfg_Crimes_SetJailed;
    _bounty = _playername call RPM_Cfg_Crimes_GetBounty;
    if (i21 > 250) then {
        _bounty = round(_bounty + 250);
        format["if (i21 - 250 >= 0) then {
            if (i21 >= 250) then {
                i21 = i21 - 250;
            } else {
                i21 = 0;
            };
        };"] call RPM_Cfg_Network_Broadcast;
    };
    [_playername, _bounty, round((_playername call RPM_Cfg_Crimes_GetTime) + (1 * 60)), false] call RPM_Cfg_Crimes_SetWanted;
    if (RPM_Diagnostics) then {
        [format["RPM(Jail)|Jailbreak|%1", _playername], false] call RPM_Cfg_Server_DiagnosticsDumper;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Crimes_IsJailedStr = {
    private ["_ret","_playername"];
    _ret = format[localize "v425"];
    _playername = _this;
    if (_playername call RPM_Cfg_Crimes_IsJailed) then {
        _ret = format[localize "v424"];
    };
    _ret;  
};
RPM_Cfg_Crimes_IsWantedStr = {
    private ["_ret","_playername"];
    _ret = format[localize "v425"];
    _playername = _this;
    if (_playername call RPM_Cfg_Crimes_IsWanted) then {
        _ret = format[localize "v424"];
    };
    _ret;
};
RPM_Cfg_Crimes_GetBounty = {
    private ["_ret","_playername","_i"];
    _ret = 0;
    _playername = _this;
    if ((_playername call RPM_Cfg_Crimes_IsWanted) || (_playername call RPM_Cfg_Crimes_IsJailed)) then {
        for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
            if (((a60 select _i) select 0) == _playername) then {
                _ret = ((a60 select _i) select 1) select 0;
            };
        };
    };
    _ret;
};
RPM_Cfg_Crimes_SetBounty = {
    private ["_ret","_playername","_i","_tmparr","_bounty"];
    _ret = false;
    _playername = _this select 0;
    _bounty = _this select 1;
    if ((_playername call RPM_Cfg_Crimes_IsWanted) || (_playername call RPM_Cfg_Crimes_IsJailed)) then {
        for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
            if (((a60 select _i) select 0) == _playername) then {
                _tmparr = + ((a60 select _i) select 1);
                _tmparr set[0, _bounty];
                format["(a60 select %1) set [1, %2];", _i, _tmparr] call RPM_Cfg_Network_Broadcast;
				["Bounty", RPM_Role, [format["%1", _bounty]]] spawn RPM_Cfg_Logs_AddLog;
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Crimes_GetTime = {
    private ["_ret","_playername","_i"];
    _ret = 0;
    _playername = _this;
    if ((_playername call RPM_Cfg_Crimes_IsWanted) || (_playername call RPM_Cfg_Crimes_IsJailed)) then {
        for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
            if (((a60 select _i) select 0) == _playername) then {
                _ret = ((a60 select _i) select 1) select 1;
            };
        };
    };
    _ret;
};
RPM_Cfg_Crimes_SetTime = {
    private ["_ret","_playername","_i","_tmparr","_time"];
    _ret = false;
    _playername = _this select 0;
    _time = _this select 1;
    if ((_playername call RPM_Cfg_Crimes_IsWanted) || (_playername call RPM_Cfg_Crimes_IsJailed)) then {
        for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
            if (((a60 select _i) select 0) == _playername) then {
                _tmparr = + ((a60 select _i) select 1);
                _tmparr set[1, _time];
                format["(a60 select %1) set [1, %2];", _i, _tmparr] call RPM_Cfg_Network_Broadcast;
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Crimes_IsJailed = {
    private ["_ret","_playername","_i"];
    _ret = false;
    _playername = _this;
    if (!(_playername call RPM_Cfg_Crimes_IsWanted)) then {
        for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
            if (((a60 select _i) select 0) == _playername) then {
                _ret = ((a60 select _i) select 1) select 2;
            };
        };
    };
    _ret;
};
RPM_Cfg_Crimes_SetJailed = {
    private ["_ret","_playername","_i","_tmparr","_jailed"];
    _ret = false;
    _playername = _this select 0;
    _jailed = _this select 1;
    //if (!(_playername call RPM_Cfg_Crimes_IsWanted)) then {
        //    _bounty = _playername call RPM_Cfg_Crimes_GetBounty;
        //    _time = _playername call RPM_Cfg_Crimes_GetTime;
        //    [(_playername), _bounty, _time, false] call RPM_Cfg_Crimes_SetWanted;
        //};
        for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
            if (((a60 select _i) select 0) == _playername) then {
                _tmparr = + ((a60 select _i) select 1);
                _tmparr set[2, _jailed];
                format["(a60 select %1) set [1, %2];", _i, _tmparr] call RPM_Cfg_Network_Broadcast;
                _ret = true;
            };
        };
        _ret;
    };
    RPM_Cfg_Crimes_IsWanted = {
        private ["_i","_ret","_playername"];
        _ret = false;
        _playername = _this;
        for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
            if ((((a60 select _i) select 0) == _playername) && (!(((a60 select _i) select 1) select 2))) then {
                _ret = true;
            };
        };
        _ret;
    };
    RPM_Cfg_Crimes_SetWanted = {
        private ["_time","_bounty","_ret","_tmparr","_playername","_jailed","_i","_newarr"];
        _ret = false;
        _playername = _this select 0;
        _bounty = 0;
        _time = 0;
        _jailed = false;
        if (count(_this) >= 2) then {
            _bounty = _this select 1;
            if (count(_this) >= 3) then {
                _time = _this select 2;
                if (count(_this) >= 4) then {
                    _jailed = _this select 3;
                };
            };
        };
        if (!(_playername call RPM_Cfg_Crimes_IsWanted)) then {
            _tmparr = [_playername, [_bounty, _time, _jailed]];
            format["a60 set[count(a60), %1];", _tmparr] call RPM_Cfg_Network_Broadcast;
            _ret = true;
        } else {
            for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
                if (((a60 select _i) select 0) == _playername) then {
                    _newarr = [_playername, [_bounty, _time, _jailed]];
                    format["a60 set[%1, %2];", _i, _newarr] call RPM_Cfg_Network_Broadcast;
                    _ret = true;
                };
            };
        };
        _ret;
    };
    RPM_Cfg_Crimes_Unwant = {
        private ["_i","_ret","_playername"];
        _ret = false;
        _playername = _this;
        for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
            if (((a60 select _i) select 0) == _playername) then {
                format["a60 set[%1, -1];a60 = a60 - [-1];", _i] call RPM_Cfg_Network_Broadcast;
                if (!(_playername call RPM_Cfg_Crimes_IsWanted)) then {
                    _ret = true;
                };
            };
        };
        _ret;
    };
    RPM_Cfg_Crimes_GetCrimes = {
        private ["_ret","_playername","_i"];
        _ret = 0;
        _playername = _this;
        if (_playername call RPM_Cfg_Crimes_IsWanted) then {
            for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
                if (((a60 select _i) select 0) == _playername) then {
                    _ret = ((a60 select _i) select 1) select 3;
                };
            };
        };
        _ret;
    };
    RPM_Cfg_Crimes_GetCrimes = {
        private ["_ret","_playername","_i"];
        _ret = 0;
        _playername = _this;
        if (_playername call RPM_Cfg_Crimes_IsWanted) then {
            for [{_i = 0}, {_i < count(a60)}, {_i = _i + 1}] do {
                if (((a60 select _i) select 0) == _playername) then {
                    _ret = ((a60 select _i) select 1) select 0;
                };
            };
        };
        _ret;
    };
    RPM_Cfg_Crimes_AddSystemMsg = {
        private ["_i","_found","_playername","_ret","_player","_msg","_sel","_title","_type"];
        _ret = false;
        _player = _this select 0;
        if ((!(alive _player)) || (isNull(_player))) exitWith {};
        _title = _this select 1;
        _msg = _this select 2;
        _type = _this select 3;
        _sel = _player call RPM_Cfg_Objects_GetIdx;
        if (_sel != -1) then {
            _playername = name _player;
            _found = -1;
            for [{_i = 0}, {_i < count(a7)}, {_i = _i + 1}] do {
                if ((((a7 select _i) select 2) == _playername) && (((a7 select _i) select 4) == "System")) then {
                    _found = _i;
                };
            };
            if (_found == -1) then {
                [_title, _type, _sel, _msg, "System", false] call RPM_Cfg_Crimes_AddMessage;
            };
        };
        _ret;
    };
    RPM_Cfg_Crimes_AddMessage = {
        private ["_i","_add","_clogmsg","_clogtitle","_playerobj","_playername","_tmparr","_ret","_ownername","_title","_type","_playersel","_message","_owner","_declare"];
        _title = _this select 0;
        _type = _this select 1;
        _playersel = _this select 2;
        _message = _this select 3;
        _owner = _this select 4;
        _declare = _this select 5;
        _ownername = format[localize "v419"];
        _playername = format[localize "v419"];
        if (typeName(_owner) == "STRING") then {
            if ((_owner call RPM_str_Length) >= 1) then {
                _ownername = _owner;
            };
        } else {
            if (!(isNull(_owner))) then {
                _ownername = name _owner;
            };
        };
        if (_declare) then {
            if ((_title == format[localize "v419"]) || (_title == format[localize "v420"])) exitWith {
                hint format[localize "v174"];
            };
            if ((_title call RPM_str_Length) < 3) exitWith {
                hint format[localize "v139"];
            };
            if ((_title call RPM_str_Length) > 26) exitWith {
                hint format[localize "v138"];
            };
            if ((_message call RPM_str_Length) < 8) exitWith {
                hint format[localize "v86"];
            };
            if ((_message call RPM_str_Length) > 32) exitWith {
                hint format[localize "v85"];
            };
            if (count(a7) > 64) exitWith {
                hint format[localize "v124"];
            };
        };
        _add = [true, -1];
        for [{_i = 0}, {_i < count(a7)}, {_i = _i + 1}] do {
            _clogtitle = (a7 select _i) select 0;
            if (_title == _clogtitle) then {
                _add = [false, 1];
            };
            if (!(_add select 0)) then {
                _clogmsg = (a7 select _i) select 3;
                if (_message == _clogmsg) then {
                    _add = [false, 0]
                };
            };
        };
        if ((_add select 0) && (_add select 1 == -1)) then {
            if (_playersel >= 0) then {
                _playerobj = objNull;
                if (!(isNull(RPM_POBJArr select _playersel))) then {
                    _playerobj = RPM_POBJArr select _playersel;
                };
                if (!(isNull(_playerobj))) then {
                    _playername = name _playerobj;
                };
            };
            _tmparr = [_title, _type, _playername, _message, _ownername];
            format["a7 set[count(a7), %1];", _tmparr] call RPM_Cfg_Network_Broadcast;
            if (_declare) then {
                hint format[localize "v62", _title];
            };
            closeDialog 0;
            [] spawn {
                private ["_h"];
                waitUntil {(((dialog) && (ctrlVisible 104)) || ((!(ctrlVisible 104)) && (!(ctrlVisible 109))))};
                _h = call RPM_Cfg_Crimes_RepaintListBoxes;
                waitUntil {_h};
            };
            if (RPM_Diagnostics) then {
                [format["RPM(Crimelog)|Created|%1|%2|%3|%4", _owner, _playername, _title, _message], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            _ret = true;
        } else {
            if (_declare) then {
                if (_add select 1 == 0) then {
                    hint format[localize "v78"];
                };
                if (_add select 1 == 1) then {
                    hint format[localize "v77"];
                };
            };
        };
        _ret;
    };
    RPM_Cfg_Crimes_DelMessage = {
        private ["_ret","_sel","_i","_oldtitle","_playername","_message"];
        _ret = false;
        if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
        _sel = _this select 0;
        _oldtitle = (a7 select _sel) select 0;
        format["a7 set[%1, -1];
        a7 = a7 - [-1];
        if (ctrlVisible 104) then {
            call RPM_Cfg_Crimes_RepaintListBoxes;
        };", _sel] call RPM_Cfg_Network_Broadcast;
        _playername = (a7 select _sel) select 2;
        _message = (a7 select _sel) select 3;
        if (ctrlVisible 114) then {
            closeDialog 0;
        };
        [_oldtitle, _playername, _oldtitle, _message] spawn {
            private ["_title","_message","_playername","_h"];
            _playername = _this select 1;
            _title = _this select 2;
            _message = _this select 3;
            hint format[localize "v71", _this select 0];
            if (RPM_Diagnostics) then {
                [format["RPM(Crimelog)|Deleted|%1|%2|%3|%4", name RPM_Role, _playername, _title, _message], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            waitUntil {(((dialog) && (ctrlVisible 104)))};
            _h = call RPM_Cfg_Crimes_RepaintListBoxes;
            waitUntil {_h};
        };
        for [{_i = 0}, {_i < count(a7)}, {_i = _i + 1}] do {
            if (((a7 select _i) select 0) == _oldtitle) then {
                _ret = false;
            };
        };
        _ret = true;
        _ret;
    };
    RPM_Cfg_Crimes_UpdateMessage = {
        private ["_ret","_sel","_message","_title","_oldmessage"];
        _ret = false;
        if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
        _sel = _this select 0;
        _message = _this select 1;
        if (count(a7) < _sel) exitWith {
            hint format[localize "v12"];
        };
        if (((a7 select _sel) select 3) == _message) exitWith {
            hint format[localize "v84"];
        };
        if ((_message call RPM_str_Length) < 8) exitWith {
            hint format[localize "v86"];
        };
        if ((_message call RPM_str_Length) > 32) exitWith {
            hint format[localize "v85"];
        };
        _title = (a7 select _sel) select 0;
        _oldmessage = (a7 select _sel) select 3;
        format["(a7 select %1) set[3, ""%2""];", _sel, _message] call RPM_Cfg_Network_Broadcast;
        if (ctrlVisible 114) then {
            closeDialog 0;
        };
        if (_message != _oldmessage) then {
            if (RPM_Diagnostics) then {
                [format["RPM(Crimelog)|Changed|%1|%2|%3|%4|%5", name RPM_Role, (a7 select _sel) select 2, _title, _message, _oldmessage], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            hint format[localize "v87", _title];
            _ret = true;
        };
        _ret;
    };
    RPM_Cfg_Crimes_RemoveMsgByTitle = {
        private ["_i","_ret","_title","_stitle"];
        _ret = false;
        if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
        for [{_i = 0}, {_i < count(a7)}, {_i = _i + 1}] do {
            _title = (a7 select _i) select 0;
            _stitle = _this;
            if (_title == _stitle) then {
                format["a7 set[%1, -1];a7 = a7 - [-1];", _i] call RPM_Cfg_Network_Broadcast;
                _ret = true;
            };
        };
        _ret;
    };
    