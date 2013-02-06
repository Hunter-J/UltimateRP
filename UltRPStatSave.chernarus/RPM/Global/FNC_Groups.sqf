// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Groups
RPM_Cfg_Groups_HasDrugs = {
    private ["_ret","_npc","_uid"];
    _ret = false;
    _npc = _this;
    if (!(isNull(_npc))) then {
        _uid = call RPM_Cfg_Objects_GetUID;
        if (_uid call RPM_str_Length >= 1) then {
            {
                if ((["Group_Storage", _npc, _uid, _x] call RPM_Cfg_Storage_GetItemAmount) >= 1) then {
                    _ret = true;
                };
            } forEach a75;
        };
    };
    _ret;
};
RPM_Cfg_Groups_Reprocess = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (b35) exitWith {
        hint format[localize "STRM_Reprocess_Already"];
    };
    _this spawn {
        private ["_nitemid","_nitemamount","_stime","_added","_text","_nitemname","_randtime","_itemname","_mamount","_amount","_npc","_iters","_uid"];
        b35 = true;
        _npc = _this;
        _uid = call RPM_Cfg_Objects_GetUID;
        if (_uid call RPM_str_Length >= 1) then {
            {
                _amount = ["Group_Storage", _npc, _uid, _x] call RPM_Cfg_Storage_GetItemAmount;
                if (_amount >= 1) then {
                    _stime = 0;
                    _randtime = round(random(3)) * _amount;
                    _itemname = [_x] call RPM_Cfg_Items_GetName;
                    _mamount = 2;
                    _nitemid = -1;
                    _nitemamount = 0;
                    switch (_x) do {
                        case 278: {
                            _nitemid = 275;
                            _nitemamount = 1;
                        };
                        case 309: {
                            _nitemid = 274;
                            _nitemamount = 1;
                        };
                        case 321: {
                            _nitemid = 278;
                            _nitemamount = 1;
                        };
                    };
                    if (_nitemid != -1) then {
                        _nitemname = [_nitemid] call RPM_Cfg_Items_GetName;
                        if (_amount < 2) exitWith {
                            hint format[localize "STRM_Reprocess_Not", _mamount, _itemname, _nitemname];
                            b35 = false;
                        };
                        _added = false;
                        _iters = 0;
                        while {((_stime < _randtime) && ((["Group_Storage", _npc, _uid, _x] call RPM_Cfg_Storage_GetItemAmount) >= 2))} do {
                            _iters = _iters + 1;
                            if (RPM_Role distance _npc > 8) exitWith {
                                hint format[localize "v29"];
                                cutText ["", "PLAIN", 0.001];
                                b35 = false;
                            };
                            if ((["Group_Storage", _npc, _uid, _x] call RPM_Cfg_Storage_GetItemAmount) < 2) exitWith {
                                cutText ["", "PLAIN", 0.001];
                                b35 = false;
                            };
                            if (["Group_Storage", _npc, _uid, _x, 2] call RPM_Cfg_Storage_DelItemAmount) then {
                                if (["Group_Storage", _npc, _uid, _nitemid, 1] call RPM_Cfg_Storage_AddItemAmount) then {
                                    _added = true;
                                    if (_iters > 1) then {
                                        sleep round(_randtime/1.5);
                                    };
                                    cutText ["", "PLAIN", 0.001];
                                    _text = format[localize "STRM_Reprocess", _mamount, _itemname, _nitemamount, _nitemname];
                                    cutText[_text, "PLAIN", 1.5];
                                    if (_iters > 1) then {
                                        sleep round(_randtime/1.5);
                                    };
                                };
                            };
                            _stime = _stime + 1.5;
                        };
                        cutText ["", "PLAIN", 0.1];
                        if (_added) then {
                            if (ctrlVisible 88) then {
                                [_npc, _uid] spawn {
                                    private ["_npc","_uid"];
                                    _npc = _this select 0;
                                    _uid = _this select 1;
                                    ["Group_Storage", _npc, _uid, 0, 0] call RPM_Cfg_Storage_RepaintListBoxes;
                                };
                            };
                            hint format[localize "STRM_Reprocess_Made"];
                            sleep 1;
                            hint "";
                        };
                    };
                };
            } forEach a75;
            b35 = false;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Groups_Takeover = {
    private ["_ret"];
    _ret = true;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (!(RPM_Role call RPM_Cfg_Objects_IsArmed)) exitWith {
        hint format[localize "v375"];
    };
    [_this select 0] spawn {
        private ["_exit","_stime","_area","_idx","_distance","_marker","_group","_ingroup","_ownergroup","_spammed"];
        _area = (_this select 0);
        _idx = [_area] call RPM_Cfg_Groups_GetIDX;
        _distance = [_idx] call RPM_Cfg_Groups_GetDistance;
        _marker = [_idx] call RPM_Cfg_Areas_GetMarker;
        _exit = false;
        _group = [name RPM_Role] call RPM_Cfg_Groups_InGroup;
        if ((_group call RPM_str_Length) == 0) exitWith {
            hint format[localize "v203"];
            _exit = true;
        };
        _ownergroup = [_idx] call RPM_Cfg_Areas_GetOwner;
        if ((_ownergroup == _group) and (!(_exit))) exitWith {
            hint format[localize "v147"];
            _exit = true;
        };
        if ((!(isNull([_idx] call RPM_Cfg_Areas_GetActive))) && ([_idx] call RPM_Cfg_Areas_GetActive != RPM_Role)) exitWith {
            hint format[localize "v132"];
            _exit = true;
        };
        if (!(_exit)) then {
            if ([_idx, RPM_Role] call RPM_Cfg_Areas_SetActive) then {
                b49 = true;
                _stime = 0;
                _exit = false;
                _spammed = false;
                _ingroup = ([_ownergroup] call RPM_Cfg_Groups_GetMembers) + [[_ownergroup] call RPM_Cfg_Groups_GetOwner];
                while {true} do {
                    if ((!(_exit)) && (!(_spammed))) then {
                        format["if (((!(isServer))) || (!(isDedicated))) then {
                            _ingroup = %1;
                            if ((name RPM_Role) in _ingroup) then {
                                hint ""%2"";
                            };
                        };", _ingroup, format[localize "v544", _idx+1]] call RPM_Cfg_Network_Broadcast;
                        _spammed = true;
                    };
                    if ((!(_exit)) && (i18 - _stime <= 0)) exitWith {
                        hint format[localize "v232"];
                        [_idx, _group] call RPM_Cfg_Areas_SetOwner;
                        format["if (((!(isServer))) || (!(isDedicated))) then {
                            _ingroup = %1;
                            if ((name RPM_Role) in _ingroup)then {
                                hint ""%2"";
                            };
                            if (RPM_Cop) then {
                                hint ""%3"";
                            };
                        };", _ingroup, format[localize "v545", _idx+1], format[localize "v546"]] call RPM_Cfg_Network_Broadcast;
                        if (RPM_Diagnostics) then {
                            [format["RPM(Areas)|Captured|%1|%2|%3", _idx, name RPM_Role, _group], false] call RPM_Cfg_Server_DiagnosticsDumper;
                        };
                        _exit = true;
                    };
                    if (!(b49)) exitWith {
                        hint format[localize "STRM_Areas_Aborted"];
                        _exit = true;
                    };
                    if ((!(_exit)) && (!(RPM_Role call RPM_Cfg_Objects_IsArmed))) then {
                        hint format[localize "v375"];
                        _exit = true;
                    };
                    if ((!(_exit)) && ((RPM_Role distance (getMarkerPos _marker) >= _distance))) then {
                        hint format[localize "v156"];
                        _exit = true;
                    };
                    if (!(_exit)) then {
                        hint format[localize "v99", round(i18 - _stime)];
                    };
                    if (_exit) exitWith {
                        [_idx, objNull] call RPM_Cfg_Areas_SetActive;
                        b49 = false;
                        false;
                    };
                    _stime = _stime + 1;
                    sleep 1;
                };
                b49 = false;
                [_idx, objNull] call RPM_Cfg_Areas_SetActive;
            };
        };
    };
    _ret;
};
RPM_Cfg_Groups_GetFreeMarker = {
    private ["_ret","_arr","_i","_marker","_npc"];
    _ret = "";
    _npc = _this select 0;
    _arr = [_npc] call RPM_Cfg_Groups_GetMarkerArray;
    for [{_i = 0}, {_i < count(_arr)}, {_i = _i + 1}] do {
        _marker = _arr select _i;
        if (count(nearestObjects[(getMarkerPos _marker),["Air", "Ship","Car","Motorcycle","Tank","Truck"], 6]) == 0) then {
            _ret = _marker;
        };
    };
    _ret;
};
RPM_Cfg_Groups_GetMarkerArray = {
    private ["_ret","_i","_npc"];
    _ret = [];
    _npc = _this select 0;
    for [{_i = 0}, {_i < count(a4)}, {_i = _i + 1}] do {
        if (((a4 select _i) select 0) == _npc) then {
            _ret = (a4 select _i) select 6;
        };
    };
    _ret;
};
RPM_Cfg_Groups_ReassignLeader = {
    private ["_i","_newowner","_member","_memberobj","_members","_ownerobj","_group","_owner","_ret","_newownername","_oldgrp","_newgrp"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _group = _this select 0;
    _owner = [_group] call RPM_Cfg_Groups_GetOwner;
    if ((_owner call RPM_str_Length) != 0) then {
        _ownerobj = [_owner] call RPM_Cfg_Objects_GetObject;
        if (isNull(_ownerobj)) then {
            _members = [_group] call RPM_Cfg_Groups_GetMembers;
            _newowner = objNull;
            for [{_i = count(_members)}, {_i >= 0}, {_i = _i - 1}] do {
                _member = _members select _i;
                _memberobj = [_member] call RPM_Cfg_Objects_GetObject;
                if (!(isNull(_memberobj))) then {
                    _newowner = _memberobj;
                };
            };
            if (!(isNull(_newowner))) then {
                _newownername = (name _newowner);
                if ([_group, _newownername] call RPM_Cfg_Groups_DeleteMember) then {
                    if ([_group, _newownername] call RPM_Cfg_Groups_SetOwner) then {
                        _oldgrp = group _newowner;
                        _newgrp = createGroup civilian;
                        [_newowner] join _newgrp;
                        _newgrp selectLeader _newowner;
                        deleteGroup _oldgrp;
                        if ([_group, _owner] call RPM_Cfg_Groups_JoinGroup) then {
                            if ([_group, _newownername] call RPM_Cfg_Groups_IsOwner) then {
                                _members = [_group] call RPM_Cfg_Groups_GetMembers;
                                for [{_i = count(_members)}, {_i >= 0}, {_i = _i - 1}] do {
                                    _member = _members select _i;
                                    if ([_group, _member] call RPM_Cfg_Groups_DeleteMember) then {
                                        if ([_group, _member] call RPM_Cfg_Groups_JoinGroup) then {
                                            _memberobj = [_member] call RPM_Cfg_Objects_GetObject;
                                            if (!(isNull(_memberobj))) then {
                                                format["if (name RPM_Role == %1) then {
                                                    hint ""%2"";
                                                };", _member, format[localize "v51", _newownername, _group]];
                                            };
                                        };
                                    };
                                };
                                format["if (RPM_Role == %1) then {
                                    hint ""%2"";
                                };", _newowner, format[localize "v153, _group"]] call RPM_Cfg_Network_Broadcast;
                                _ret = true;
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Groups_GetInUse = {
    private ["_ret","_var"];
    _ret = false;
    _var = npc_government getVariable "inuse";
    if (!(isNil("_var"))) then {
        if (isNull(_var)) then {
            _ret = false;
        } else {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Groups_CreateGroup = {
    private ["_ret"];
    _ret = false;
    if (b1) exitWith {};
    _this spawn {
        b1 = true;
        private ["_joinable","_idx","_index","_groupobj","_group","_player","_playername","_fee","_ingroup"];
        _group = _this select 0;
        _player = _this select 1;
        if ((!(alive _player)) || (isNull(_player))) exitWith {};
        _playername = name _player;
        if ([521] call RPM_Cfg_Inv_GetItemAmount < i22) exitWith {
            hint format[localize "v472", i22];
        };
        _joinable = false;
        if ((_this select 2) == 0) then {
            _joinable = true;
        };
        _fee = (_this select 3) call RPM_str_StrToInt;
        _ingroup = [_playername] call RPM_Cfg_Groups_InGroup;
        if ((_ingroup call RPM_str_Length) == 0) then {
            if (!([_group] call RPM_Cfg_Groups_IsGroup)) then {
                _groupobj = createGroup civilian;
                if (!(isNull(_groupobj))) then {
                    if ([_group, _playername, _joinable, _fee] call RPM_Cfg_Groups_AddGroup) then {
                        hint format[localize "v471", i22];
                        sleep 1.5;
                        hint format[localize "v178", _group];
                        [_player] join _groupobj;
                        _groupobj selectLeader _player;
                        _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
                        _index = lbAdd[73, (a15 select _idx) select 0];
                        lbSetData[73, _index, (a15 select _idx) select 0];
                        lbSetCurSel[73, _idx + 1];
                    };
                };
            } else {
                hint format[localize "v40", _group];
            };
        } else {
            hint format[localize "v151", _ingroup];
        };
        b1 = false;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Groups_AddGroup = {
    private ["_ret","_joinable","_fee","_tmparr","_player","_exit","_group"];
    _ret = false;
    _exit = false;
    _group = _this select 0;
    if ((_group call RPM_str_Length) >= 17) then {
        hint format[localize "v98"];
        _exit = true;
    };
    if (!(_exit)) then {
        _player = _this select 1;
        _joinable = _this select 2;
        _fee = _this select 3;
        _tmparr = [_group, _player, _fee, _joinable, []];
        a15 set[count(a15), _tmparr];
        format["a15 = %1;", a15] call RPM_Cfg_Network_Broadcast;
        if ([_group, _player] call RPM_Cfg_Groups_IsOwner) then {
            if (RPM_Diagnostics) then {
                [format["RPM(Groups)|Created|%1|%2|%3|%4", _group, _player, _joinable, _fee], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Groups_DeleteGroup = {
    private ["_ret","_group","_idx","_player","_fee","_joinable"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _group = _this select 0;
    _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
    _player = [_group] call RPM_Cfg_Groups_GetOwner;
    _fee = [_group] call RPM_Cfg_Groups_GetFee;
    _joinable = [_group] call RPM_Cfg_Groups_IsJoinable;
    if (_idx != -1) then {
        a15 set[_idx, -1];
        a15 = a15 - [-1];
        format["a15 = %1;", a15] call RPM_Cfg_Network_Broadcast;
        if (!([_group] call RPM_Cfg_Groups_IsGroup)) then {
            deleteGroup (group RPM_Role);
            if (RPM_Diagnostics) then {
                [format["RPM(Groups)|Deleted|%1|%2|%3|%4", _group, _player, _fee, _joinable], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Groups_IsGroup = {
    private ["_ret","_group","_idx"];
    _ret = false;
    _group = _this select 0;
    _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
    if (_idx != -1) then {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Groups_GetOwner = {
    private ["_ret","_i","_group"];
    _ret = "";
    _group = _this select 0;
    for [{_i = 0}, {_i < count(a15)}, {_i = _i + 1}] do {
        if (((a15 select _i) select 0) == _group) then {
            _ret = (a15 select _i) select 1;
        };
    };
    _ret;
};
RPM_Cfg_Groups_SetOwner = {
    private ["_ret","_grouparr","_group","_owner","_idx"];
    _ret = false;
    _group = _this select 0;
    _owner = _this select 1;
    _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
    if (_idx != -1) then {
        _grouparr = + (a15 select _idx);
        _grouparr set[1, _owner];
        format["a15 set[%1, %2];", _idx, _grouparr] call RPM_Cfg_Network_Broadcast;
        if ([_group, _owner] call RPM_Cfg_Groups_IsOwner) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Groups_IsOwner = {
    private ["_ret","_group","_player"];
    _ret = false;
    _group = _this select 0;
    _player = _this select 1;
    if (([_group] call RPM_Cfg_Groups_GetOwner) == _player) then {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Groups_GetMembers = {
    private ["_ret","_group","_idx"];
    _ret = [];
    _group = _this select 0;
    _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
    if (_idx != -1) then {
        _ret = (a15 select _idx) select 4;
    };
    _ret;
};
RPM_Cfg_Groups_IsMember = {
    private ["_ret","_i","_group","_members","_player"];
    _ret = false;
    _group = _this select 0;
    _player = _this select 1;
    _members = [_group] call RPM_Cfg_Groups_GetMembers;
    for [{_i = 0}, {_i < count(_members)}, {_i = _i + 1}] do {
        if ((_members select _i) == _player) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Groups_DeleteMember = {
    private ["_ret","_group","_player","_i","_members","_idx"];
    _ret = false;
    _group = _this select 0;
    _player = _this select 1;
    _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
    if (_idx != -1) then {
        _members = + ([_group] call RPM_Cfg_Groups_GetMembers);
        for [{_i = 0}, {_i < count(_members)}, {_i = _i + 1}] do {
            if ((_members select _i) == _player) then {
                _members set[_i, -1];
                _members = _members - [-1];
                format["(a15 select %1) set[4, %2];", _idx, _members] call RPM_Cfg_Network_Broadcast;
                if (!([_group, _player] call RPM_Cfg_Groups_IsMember)) then {
                    _ret = true;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Groups_InGroup = {
    private ["_i","_group","_ret","_player"];
    _ret = "";
    _player = _this select 0;
    for [{_i = 0}, {_i < count(a15)}, {_i = _i + 1}] do {
        _group = (a15 select _i) select 0;
        if (([_group, _player] call RPM_Cfg_Groups_IsOwner) || ([_group, _player] call RPM_Cfg_Groups_IsMember)) then {
            _ret = (a15 select _i) select 0;
        };
    };
    _ret;
};
RPM_Cfg_Groups_IsJoinable = {
    private ["_ret","_group","_idx"];
    _ret = false;
    _group = _this select 0;
    _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
    if (_idx != -1) then {
        _ret = (a15 select _idx) select 3;
    };
    _ret;
};
RPM_Cfg_Groups_IsJoinableStr = {
    private ["_ret","_group"];
    _ret = "";
    _group = _this select 0;
    if ([_group] call RPM_Cfg_Groups_IsJoinable) then {
        _ret = "Yes";
    } else {
        _ret = "No";
    };
    _ret;
};
RPM_Cfg_Groups_GetGroupIndex = {
    private ["_i","_ret","_group"];
    _ret = -1;
    _group = _this select 0;
    for [{_i = 0}, {_i < count(a15)}, {_i = _i + 1}] do {
        if (((a15 select _i) select 0) == _group) then {
            _ret = _i;
        };
    };
    _ret;
};
RPM_Cfg_Groups_JoinLeaveGroup = {
    private ["_ret","_player","_group","_thegroup","_idx","_owner","_i","_name","_members","_joincost","_mycash","_playerobj","_ownerobj","_ownergroup","_nameobj"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _thegroup = _this select 0;
    if (!(isNull(_this select 1))) then {
        _player = (name(_this select 1));
        _group = [_player] call RPM_Cfg_Groups_InGroup;
        if ((_group call RPM_str_Length) == 0) then {
            if ([_thegroup] call RPM_Cfg_Groups_IsJoinable) then {
                _idx = [_thegroup] call RPM_Cfg_Groups_GetGroupIndex;
                if (_idx != -1) then {
                    _joincost = [_thegroup] call RPM_Cfg_Groups_GetFee;
                    _mycash = [521] call RPM_Cfg_Inv_GetItemAmount;
                    if (_mycash < _joincost) exitWith {
                        hint format[localize "v42", _thegroup, _joincost];
                        b1 = false;
                    };
                    if ([521, _joincost] call RPM_Cfg_Inv_DelItemAmount) then {
                        if ([_thegroup, _player] call RPM_Cfg_Groups_JoinGroup) then {
                            hint format[localize "v196", _thegroup, _joincost];
                            _owner = [_thegroup] call RPM_Cfg_Groups_GetOwner;
                            _ownerobj = [_owner] call RPM_Cfg_Objects_GetObject;
                            _members = [_thegroup] call RPM_Cfg_Groups_GetMembers;
                            format["if (!(isDedicated)) then {
                                if (RPM_Role == %1) then {
                                    hint ""%2"";
                                };
                            };", _ownerobj, format[localize "v52", _player, _thegroup]] call RPM_Cfg_Network_Broadcast;
                            for [{_i = 0}, {_i < count(_members)}, {_i = _i + 1}] do {
                                _name = _members select _i;
                                _nameobj = [_name] call RPM_Cfg_Objects_GetObject;
                                if (_name != _player) then {
                                    format["if (!(isDedicated)) then {
                                        if (RPM_Role == %1) then {
                                            hint ""%2"";
                                        };
                                    };", _nameobj, format[localize "v52", _player, _thegroup]] call RPM_Cfg_Network_Broadcast;
                                };
                            };
                            _ret = true;
                        };
                    };
                };
            } else {
                hint format[localize "v41", _thegroup];
            };
        } else {
            if (_group == _thegroup) then {
                if (!([_thegroup, _player] call RPM_Cfg_Groups_IsOwner)) then {
                    _idx = [_thegroup] call RPM_Cfg_Groups_GetGroupIndex;
                    if (_idx != -1) then {
                        if ([_thegroup, _player] call RPM_Cfg_Groups_LeaveGroup) then {
                            hint format[localize "v199", _thegroup];
                            _owner = [_thegroup] call RPM_Cfg_Groups_GetOwner;
                            _ownerobj = [_owner] call RPM_Cfg_Objects_GetObject;
                            _members = [_thegroup] call RPM_Cfg_Groups_GetMembers;
                            format["if (!(isDedicated)) then {
                                if (RPM_Role == %1) then {
                                    hint ""%2"";
                                };
                            };", _ownerobj, format[localize "v53", _player, _thegroup]] call RPM_Cfg_Network_Broadcast;
                            for [{_i = 0}, {_i < count(_members)}, {_i = _i + 1}] do {
                                _name = _members select _i;
                                _nameobj = [_name] call RPM_Cfg_Objects_GetObject;
                                if (_name != _player) then {
                                    format["if (!(isDedicated)) then {
                                        if (RPM_Role == %1) then {
                                            hint ""%2"";
                                        };
                                    };", _nameobj, format[localize "v53", _player, _thegroup]] call RPM_Cfg_Network_Broadcast;
                                };
                            };
                            _playerobj = [_player] call RPM_Cfg_Objects_GetObject;
                            if (!(isNull(_playerobj))) then {
                                [_playerobj] join grpNull;
                            };
                            _ret = true;
                        };
                    };
                } else {
                    _idx = [_thegroup] call RPM_Cfg_Groups_GetGroupIndex;
                    if (_idx != -1) then {
                        _owner = [_thegroup] call RPM_Cfg_Groups_GetOwner;
                        _members = [_thegroup] call RPM_Cfg_Groups_GetMembers;
                        if ([_thegroup] call RPM_Cfg_Groups_DeleteGroup) then {
                            hint format[localize "v181", _thegroup];
                            for [{_i = 0}, {_i < count(_members)}, {_i = _i + 1}] do {
                                _name = _members select _i;
                                if (_name != _player) then {
                                    _nameobj = [_name] call RPM_Cfg_Objects_GetObject;
                                    format["if (!(isDedicated)) then {
                                        if (RPM_Role == %1) then {
                                            hint ""%2"";
                                        };
                                    };", _nameobj, format[localize "v49", _thegroup]] call RPM_Cfg_Network_Broadcast;
                                    _playerobj = [_name] call RPM_Cfg_Objects_GetObject;
                                    if (!(isNUll(_playerobj))) then {
                                        [_playerobj] join grpNull;
                                    };
                                };
                            };
                            _ownerobj = [_owner] call RPM_Cfg_Objects_GetObject;
                            if (!(isNUll(_ownerobj))) then {
                                _ownergroup = group _ownerobj;
                                [_ownerobj] join grpNull;
                                deleteGroup _ownergroup;
                            };
                            lbDelete[73, _idx+1];
                            lbSetCurSel[73, 0];
                        };
                    };
                };
            } else {
                hint format[localize "v96", _group, _thegroup];
            };
        };
    };
    _ret;
};
RPM_Cfg_Groups_JoinGroup = {
    private ["_ret","_group","_player","_tmparr","_tmpmemberarr","_idx","_owner","_ownerobj","_playerobj","_newgrp"];
    _ret = false;
    _group = _this select 0;
    _player = _this select 1;
    _playerobj = [_player] call RPM_Cfg_Objects_GetObject;
    if (!(alive _playerobj)) exitWith {};
    _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
    if (_idx != -1) then {
        _owner = [_group] call RPM_Cfg_Groups_GetOwner;
        _ownerobj = [_owner] call RPM_Cfg_Objects_GetObject;
        if (isNull(_ownerobj)) then {
            if ([_group, _player] call RPM_Cfg_Groups_SetOwner) then {
                if ([_group, _player] call RPM_Cfg_Groups_IsOwner) then {
                    if (!(isNull(_playerobj))) then {
                        _newgrp = createGroup civilian;
                        [_playerobj] join _newgrp;
                        _ret = true;
                    } else {
                        _ret = true;
                    };
                };
            };
        } else {
            _tmparr = + (a15 select _idx);
            _tmpmemberarr = _tmparr select 4;
            _tmpmemberarr set[count(_tmpmemberarr), _player];
            format["a15 set[%1, %2];", _idx, _tmparr] call RPM_Cfg_Network_Broadcast;
            if (([_group, _player] call RPM_Cfg_Groups_IsMember) and (!(isNUll(_ownerobj))) and (!(isNull(_playerobj)))) then {
                if (!(isNull(_playerobj))) then {
                    [_playerobj] join (group _ownerobj);
                    _ret = true;
                } else {
                    _ret = true;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Groups_LeaveGroup = {
    private ["_ret","_group","_player","_tmparr","_tmpmemberarr","_c","_idx"];
    _ret = false;
    _group = _this select 0;
    _player = _this select 1;
    if (([_group, _player] call RPM_Cfg_Groups_IsMember) || ([_group, _player] call RPM_Cfg_Groups_IsOwner)) then {
        _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
        if (_idx != -1) then {
            _tmparr = + (a15 select _idx);
            _tmpmemberarr = _tmparr select 4;
            for [{_c = 0}, {_c < count(_tmpmemberarr)}, {_c = _c + 1}] do {
                if ((_tmpmemberarr select _c)== _player) then {
                    _tmpmemberarr set[_c, -1];
                    _tmpmemberarr = _tmpmemberarr - [-1];
                    _tmparr set[4, _tmpmemberarr];
                    format["a15 set[%1, %2]", _idx, _tmparr] call RPM_Cfg_Network_Broadcast;
                    if (!([_group, _player] call RPM_Cfg_Groups_IsMember)) then {
                        _ret = true;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Groups_KickMember = {
    private ["_ret","_group","_player","_selection","_members","_playerobj"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _group = _this select 0;
    _selection = _this select 1;
    _members = [_group] call RPM_Cfg_Groups_GetMembers;
    if (_selection >= 1) then {
        _player = (_members select _selection - 1);
        _playerobj = [_player] call RPM_Cfg_Objects_GetObject;
        if (!(isNull(_playerobj))) then {
            if ([_group, _player] call RPM_Cfg_Groups_IsMember) then {
                if ([_group, _player] call RPM_Cfg_Groups_DeleteMember) then {
                    format["if (!(isDedicated)) then {
                        if (RPM_Role == %1) then {
                            hint ""%2"";
                        };
                    };", _playerobj, format[localize "v226", _group]] call RPM_Cfg_Network_Broadcast;
                    hint format[localize "v198", _player, _group];
                    [_playerobj] join grpNull;
                    [_group] call RPM_Cfg_Groups_RepaintMembersListBox;
                };
            };
        };
    } else {
        hint format[localize "v168"];
    };
    _ret;
};
RPM_Cfg_Groups_LockUnlock = {
    private ["_ret","_group","_tmparr","_idx","_leader","_oldfee","_oldjoinable"];
    _ret = false;
    _group = _this select 0;
    _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
    _leader = [_group] call RPM_Cfg_Groups_GetOwner;
    _oldfee = [_group] call RPM_Cfg_Groups_GetFee;
    _oldjoinable = [_group] call RPM_Cfg_Groups_IsJoinable;
    if (_idx != -1) then {
        _tmparr = + (a15 select _idx);
        if (_tmparr select 3) then {
            _tmparr set[3, false];
        } else {
            _tmparr set[3, true];
        };
        format["a15 set[%1, %2]", _idx, _tmparr] call RPM_Cfg_Network_Broadcast;
        if ((a15 select _idx) select 3) then {
            hint format[localize "v224", _group];
        } else {
            hint format[localize "v201", _group];
        };
        if (RPM_Diagnostics) then {
            [format["RPM(Groups)|Changed|%1|%2|%3|%4|%5|%6", _group, _leader, (a15 select _idx) select 3, _oldjoinable, ((a15) select _idx) select 2, _oldfee], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Groups_GetFee = {
    private ["_ret","_group","_idx"];
    _ret = 0;
    _group = _this select 0;
    _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
    if (_idx != -1) then {
        _ret = ((a15) select _idx) select 2;
    };
    _ret;
};
RPM_Cfg_Groups_SetFee = {
    private ["_ret","_group","_tmparr","_idx","_fee","_curfee","_leader","_joinable"];
    _ret = false;
    _group = _this select 0;
    _fee = _this select  1;
    if (_fee <= 999) exitWith {
        hint format[localize "v116", i23];
    };
    _leader = [_group] call RPM_Cfg_Groups_GetOwner;
    _curfee = [_group] call RPM_Cfg_Groups_GetFee;
    _joinable = [_group] call RPM_Cfg_Groups_IsJoinable;
    if (_curfee != _fee) then {
        _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
        if (_idx != -1) then {
            _tmparr = + (a15 select _idx);
            _tmparr set[2, _fee];
            format["a15 set[%1, %2];", _idx, _tmparr] call RPM_Cfg_Network_Broadcast;
            if (([_group] call RPM_Cfg_Groups_GetFee) == _fee) then {
                hint format[localize "v140", _group, _fee];
                closeDialog 0;
                if (RPM_Diagnostics) then {
                    [format["RPM(Groups)|Changed|%1|%2|%3|%4|%5", _group, _leader, _joinable, _fee, _curfee], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
                _ret = true;
            };
        };
    } else {
        hint format[localize "v113"];
    };
    _ret;
};
RPM_Cfg_Groups_GetNPC = {
    private ["_ret","_idx"];
    _ret = "";
    _idx = _this select 0;
    if (_idx >= 0) then {
        _ret = (a4 select _idx) select 0;
    };
    _ret;
};
RPM_Cfg_Groups_GetNearNPC = {
    private ["_i","_ret"];
    _ret = objNull;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    for [{_i = 0}, {_i < count(a4)}, {_i = _i + 1}] do {
        if (RPM_Role distance ((a4 select _i) select 0) <= 8) then {
            _ret = (a4 select _i) select 0;
        };
    };
    _ret;
};
RPM_Cfg_Groups_GetIDX = {
    private ["_ret","_i","_npc"];
    _ret = -1;
    _npc = _this select 0;
    for [{_i = 0}, {_i < count(a4)}, {_i = _i + 1}] do {
        if (((a4 select _i) select 0) == _npc) then {
            _ret = _i;
        };
    };
    _ret;
};
RPM_Cfg_Groups_GetAnchorMarker = {
    private ["_ret","_idx"];
    _ret = "";
    _idx = _this;
    if (_idx >= 0) then {
        _ret = (a4 select _idx) select 1;
    };
    _ret;
};
RPM_Cfg_Groups_GetDistance = {
    private ["_ret","_idx","_marker"];
    _ret = -1;
    _idx = _this select 0;
    if (_idx >= 0) then {
        _marker = _idx call RPM_Cfg_Groups_GetAnchorMarker;
        if (_marker call RPM_str_Length >= 1) then {
            _ret = ((getMarkerSize _marker) select 0)*pi;
        };
    };
    _ret;
};
RPM_Cfg_Areas_GetOwner = {
    private ["_ret","_idx"];
    _ret = "";
    _idx = _this select 0;
    if (_idx >= 0) then {
        _ret = (a4 select _idx) select 2;
    };
    _ret;
};
RPM_Cfg_Areas_SetOwner = {
    private ["_ret","_tmparr","_idx","_group"];
    _ret = false;
    _idx = _this select 0;
    if (_idx >= 0) then {
        _group = _this select 1;
        _tmparr = + (a4 select _idx);
        _tmparr set[2, _group];
        format["a4 set[%1, %2];", _idx, _tmparr] call RPM_Cfg_Network_Broadcast;
        if (([_idx] call RPM_Cfg_Areas_GetOwner) == _group) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Areas_GetActive = {
    private ["_ret","_idx"];
    _ret = false;
    _idx = _this select 0;
    if (_idx >= 0) then {
        _ret = (a4 select _idx) select 3;
    };
    _ret;
};
RPM_Cfg_Areas_SetActive = {
    private ["_ret","_tmparr","_idx","_object"];
    _ret = false;
    _idx = _this select 0;
    _object = _this select 1;
    if (_idx >= 0) then {
        if (!(isNull(_object))) then {
            _tmparr = + (a4 select _idx);
            _tmparr set[3, _object];
            format["a4 set[%1, %2];", _idx, _tmparr] call RPM_Cfg_Network_Broadcast;
            if (!(isNull([_idx] call RPM_Cfg_Areas_GetActive))) then {
                _ret = true;
            };
        } else {
            format["_tmparr = + (a4 select %1);_tmparr set[3, objNull];a4 set[%1, _tmparr];", _idx] call RPM_Cfg_Network_Broadcast;
            if (isNull([_idx] call RPM_Cfg_Areas_GetActive)) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Areas_GetMarker = {
    private ["_ret","_idx"];
    _ret = false;
    _idx = _this select 0;
    if (_idx >= 0) then {
        _ret = (a4 select _idx) select 4;
    };
    _ret;
};
RPM_Cfg_Areas_GetAggressor = {
    private ["_ret","_idx"];
    _ret = false;
    _idx = _this select 0;
    if (_idx >= 0) then {
        _ret = (a4 select _idx) select 5;
    };
    _ret;
};
RPM_Cfg_Areas_SetAggressor = {
    private ["_ret","_idx","_tmparr","_aggressor"];
    _ret = false;
    _idx = _this select 0;
    _aggressor = _this select 1;
    if (_idx >= 0) then {
        _tmparr = + ((a4) select _idx);
        _tmparr set[5, _aggressor];
        format["a4 set[%1, %2];", _idx, _tmparr] call RPM_Cfg_Network_Broadcast;
        if (([_idx] call RPM_Cfg_Areas_GetAggressor) == _aggressor) then {
            _ret = true;
        };
    };
    _ret;
};
