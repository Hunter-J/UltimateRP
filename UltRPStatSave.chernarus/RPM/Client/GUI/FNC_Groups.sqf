// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/


// Groups
RPM_Cfg_Groups_GUI = {
    private ["_ret","_npc"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _npc = _this;
    if (([_npc, 1] call RPM_Cfg_Inv_NPCGetInUse) && (([_npc, 1] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {
        hint format[localize "v104"];
    };
    _npc spawn {
        private ["_i","_index","_playername","_yn","_selection","_member","_membersarr","_group","_fee","_groupidx","_npc"];
        _npc = _this;
        if (!(createDialog "GroupDialog")) exitWith {
            hint format[localize "v1"];
        };
        [_npc, 1, RPM_Role] call RPM_Cfg_Inv_NPCSetInUse;
        _playername = name RPM_Role;
        _yn = ["Yes", "No"];
        for [{_i = 0}, {_i < 2}, {_i = _i + 1}] do {
            _index = lbAdd[80, format["%1", (_yn select _i)]];
            lbSetData[80, _index, format["%1", (_yn select _i)]];
        };
        lbSetCurSel[80, 0];
        _index = lbAdd[73, format[localize "v419"]];
        lbSetData[73, _index, format[localize "v419"]];
        for [{_i = 0}, {_i < count(a15)}, {_i = _i + 1}] do {
            _index = lbAdd[73, format["%1 (%2)", (a15 select _i) select 0, [((a15 select _i) select 0)] call RPM_Cfg_Groups_IsJoinableStr]];
            lbSetData[73, _index, format["%1", (a15 select _i) select 0, [((a15 select _i) select 0)] call RPM_Cfg_Groups_IsJoinableStr]];
        };
        _groupidx = [([name RPM_Role] call RPM_Cfg_Groups_InGroup)] call RPM_Cfg_Groups_GetGroupIndex;
        if (_groupidx < 0) then {
            groupidx = -1;
        };
        lbSetCurSel[73, _groupidx + 1];
        while {((ctrlVisible 77) || (ctrlVisible 86))} do {
            if ((!((ctrlText 78) call RPM_str_IsAlphaNumeric)) || ((ctrlText 78) call RPM_str_Length) >= 17) then {
                ctrlSetText[78, "A Group"];
            };
            if ((!((ctrlText 79) call RPM_str_IsNumeric)) || ((ctrltext 79) call RPM_str_StrToInt) >= RPM_MAX_NUMBER) then {
                //ctrlSetText[79, "1000"];
            };
            _selection = lbCurSel 73;
            if (_selection <= 0) then {
                if (ctrlText 77 != "0") then {
                    ctrlSetText[77, "0"];
                };
                ctrlShow[72,  false];
                lbClear 81;
                ctrlShow[81, false];
                ctrlShow[71, true];
                ctrlShow[74, true];
                ctrlShow[75, true];
                ctrlShow[76, true];
                ctrlShow[78, true];
                ctrlShow[79, true];
                ctrlShow[80, true];
                ctrlShow[83, false];
                ctrlShow[84, false];
                ctrlShow[85, false];
                if ((ctrlText 82) != "Create") then {
                    ctrlSetText[82, "Create"];
                };
                if (!(b1)) then {
                    buttonSetAction[82, format["[""%1"", %2, %3, ""%4""] call RPM_Cfg_Groups_CreateGroup;", ctrlText 78, RPM_Role, lbCurSel 80, ctrlText 79]];
                } else {
                    buttonSetAction[82, ""];
                };
            } else {
                _group = (a15 select _selection - 1) select 0;
                _fee = format["%1", [_group] call RPM_Cfg_Groups_GetFee];
                if (ctrlText 77 != _fee) then {
                    ctrlSetText[77, _fee];
                };
                ctrlShow[71, false];
                ctrlShow[72, false];
                ctrlShow[74, false];
                ctrlShow[75, false];
                ctrlShow[76, false];
                ctrlShow[78, false];
                ctrlShow[79, false];
                ctrlShow[80, false];
                if ([_group, _playername] call RPM_Cfg_Groups_IsOwner) then {
                    ctrlShow[72, true];
                    ctrlShow[81, true];
                    if ((lbSize 81) == 0) then {
                        _membersarr = [_group] call RPM_Cfg_Groups_GetMembers;
                        _index = lbAdd[81, format["%1 (Owner)", name RPM_Role]];
                        lbSetData[81, _index, format["%1 (Owner)", name RPM_Role]];
                        for [{_i = 0}, {_i < count(_membersarr)}, {_i = _i + 1}] do {
                            _member = _membersarr select _i;
                            _index = lbAdd[81, format["%1", _member]];
                            lbSetData[81, _index, format["%1", _member]];
                        };
                        lbSetCurSel[81, 0];
                    };
                    ctrlShow[83, true];
                    buttonSetAction[83, format["[""%1""] call RPM_Cfg_Groups_Fees_GUI;", _group]];
                    ctrlShow[84, true];
                    buttonSetAction[84, format["[""%1""] call RPM_Cfg_Groups_LockUnlock;", _group]];
                    ctrlShow[85, true];
                    buttonSetAction[85, format["[""%1"", %2] call RPM_Cfg_Groups_KickMember;", _group, lbCurSel 81]];
                    if ((ctrlText 82) != "Disband") then {
                        ctrlSetText[82, "Disband"];
                    };
                    buttonSetAction[82, format["[""%1"", %2] call RPM_Cfg_Groups_JoinLeaveGroup;", _group, RPM_Role]];
                } else {
                    ctrlShow[81, false];
                    ctrlShow[83, false];
                    ctrlShow[84, false];
                    ctrlShow[85, false];
                    if (!([_group, _playername] call RPM_Cfg_Groups_IsMember)) then {
                        if ((ctrlText 82) != "Join") then {
                            ctrlSetText[82, "Join"];
                        };
                        buttonSetAction[82, format["[""%1"", %2] call RPM_Cfg_Groups_JoinLeaveGroup;", _group, RPM_Role]];
                    } else {
                        if ((ctrlText 82) != "Leave") then {
                            ctrlSetText[82, "Leave"];
                        };
                        buttonSetAction[82, format["[""%1"", %2] call RPM_Cfg_Groups_JoinLeaveGroup;", _group, RPM_Role]];
                    };
                };
            };
            sleep 0.001;
        };
        waitUntil {((isNull(RPM_Role)) || (!(alive RPM_Role)) || ((!(ctrlVisible 77)) && (!(ctrlVisible 86))))};
        [_npc, 1, objNull] call RPM_Cfg_Inv_NPCSetInUse;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Groups_Fees_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_feenum","_group"];
        _group = _this select 0;
        if (!(createDialog "GroupFeesDialog")) exitWith {
            hint format[localize "v1"];
        };
        while {ctrlVisible 86} do {
            if ((!((ctrlText 86) call RPM_str_IsNumeric)) || ((ctrlText 86) call RPM_str_StrToInt) >= RPM_MAX_NUMBER) then {
                //ctrlSetText[86, "1000"];
            };
            _feenum = (ctrlText 86) call RPM_str_StrToInt;
            buttonSetAction[87, format["[""%1"", %2] call RPM_Cfg_Groups_SetFee;", _group, _feenum]];
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Groups_SetFee = {
    private ["_ret","_group","_tmparr","_idx","_fee","_curfee"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _group = _this select 0;
    _fee = _this select  1;
    if (_fee <= 999) exitWith {
        hint format[localize "v116", i23];
    };
    if (_fee >= RPM_MAX_NUMBER) exitWith {
        hint format[localize "v474", RPM_MAX_NUMBER];
    };
    _curfee = [_group] call RPM_Cfg_Groups_GetFee;
    if (_curfee != _fee) then {
        _idx = [_group] call RPM_Cfg_Groups_GetGroupIndex;
        if (_idx != -1) then {
            _tmparr = + (a15 select _idx);
            _tmparr set[2, _fee];
            format["a15 set[%1, %2];", _idx, _tmparr] call RPM_Cfg_Network_Broadcast;
            if (([_group] call RPM_Cfg_Groups_GetFee) == _fee) then {
                hint format[localize "v140", _group, _fee];
                closeDialog 0;
                _ret = true;
            };
        };
    } else {
        hint format[localize "v113"];
    };
    _ret;
};
RPM_Cfg_Groups_RepaintMembersListBox = {
    private ["_i","_member","_index","_ret","_membersarr","_group"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _group = _this select 0;
    lbClear 81;
    _membersarr = [_group] call RPM_Cfg_Groups_GetMembers;
    _index = lbAdd[81, format["%1 (Owner)", name RPM_Role]];
    lbSetData[81, _index, format["%1 (Owner)", name RPM_Role]];
    for [{_i = 0}, {_i < count(_membersarr)}, {_i = _i + 1}] do {
        _member = _membersarr select _i;
        _index = lbAdd[81, format["%1", _member]];
        lbSetData[81, _index, format["%1", _member]];
    };
    lbSetCurSel[81, 0];
    if (lbSize 81 >= 1) then {
        _ret = true;
    };
    _ret;
};