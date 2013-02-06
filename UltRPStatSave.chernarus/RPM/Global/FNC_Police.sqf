// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Police
// License revocation
RPM_Cfg_Licenses_Broadcast = {
    private ["_ret"];
    _ret = false;
    if (_this select 0 == RPM_Role) then {
        RPM_Role setVariable ["haslics", a22, true];
        format["if (RPM_Role == %1) then {
            b53 = true;
        };", _this select 1] call RPM_Cfg_Network_Broadcast;
        b53 = false;
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Licenses_Revoked = {
    private ["_ret","_tgt","_src","_licstorm","_rmstr","_i","_rm"];
    _ret = false;
    _tgt = _this select 0;
    if (RPM_Role == _tgt) then {
        _src = _this select 1;
        _licstorm = _this select 2;
        _rmstr = _this select 3;
        for [{_i = 0}, {_i < count(_licstorm)}, {_i = _i + 1}] do {
            _rm = true;
            if (_rm) then {
                if ((_licstorm select _i) in a22) then {
                    a22 = a22 - [(_licstorm select _i)];
                };
            };
        };
        server globalChat format[localize "v520", _src, name _src, name player, _rmstr];
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Licenses_Revoke = {
    private ["_ret","_tgt","_air","_boat","_car","_pickup","_truck","_pistol","_rifle","_src","_licstorm","_licstrs","_i","_rmstr","_rmstro"];
    _ret = false;
    if (isNull(RPM_Role)) exitWith {};
    if (!(alive RPM_Role)) exitWith {};
    if (!(RPM_Cop)) exitWith {};
    _tgt = _this select 0;
    _src = _this select 1;
    if (_tgt == RPM_Role) exitWith {};
    _air = _this select 2;
    _boat = _this select 3;
    _car = _this select 4;
    _pickup = _this select 5;
    _truck = _this select 6;
    _pistol = _this select 7;
    _rifle = _this select 8;
    _licstorm = [];
    _licstrs = [];
    if (_air == 2) then {
        _licstorm = _licstorm + ["lic_air"];
        _licstrs = _licstrs + [format[localize "v512"]];
    };
    if (_boat == 2) then {
        _licstorm = _licstorm + ["lic_boat"];
        _licstrs = _licstrs + [format[localize "v513"]];
    };
    if (_car == 2) then {
        _licstorm = _licstorm + ["lic_car"];
        _licstrs = _licstrs + [format[localize "v514"]];
    };
    if (_pickup == 2) then {
        _licstorm = _licstorm + ["lic_pickup"];
        _licstrs = _licstrs + [format[localize "v515"]];
    };
    if (_truck == 2) then {
        _licstorm = _licstorm + ["lic_truck"];
        _licstrs = _licstrs + [format[localize "v516"]];
    };
    if (_pistol == 2) then {
        _licstorm = _licstorm + ["lic_pistol"];
        _licstrs = _licstrs + [format[localize "v517"]];
    };
    if (_rifle == 2) then {
        _licstorm = _licstorm + ["lic_rifle"];
        _licstrs = _licstrs + [format[localize "v518"]];
    };
    if (count(_licstorm) >= 1) then {
        _rmstr = "";
        for [{_i = 0}, {_i < count(_licstrs)}, {_i = _i + 1}] do {
            if (_i != count(_licstrs)-1) then {
                _rmstr = _rmstr + format["%1 %2, ", _licstrs select _i, format[localize "v523"]];
            } else {
                if (count(_licstrs) <= 2) then {
                    if (count(_licstrs) != 1) then {
                        _rmstr = ([_rmstr, 0, (_rmstr call RPM_str_Length) - 2] call RPM_str_SubString) + " & " + ((_licstrs select _i) + " " + format[localize "v523"]);
                    } else {
                        _rmstr = _rmstr + ((_licstrs select _i) + " " + format[localize "v523"]);
                    };
                } else {
                    _rmstr = [_rmstr, 0, (_rmstr call RPM_str_Length) - 2] call RPM_str_SubString;
                    _rmstr = _rmstr + " & " + ((_licstrs select _i) + " " + format[localize "v523"]);
                };
            };
        };
        format["if (RPM_Role == %1) then {
            [%1, %2, %3, ""%4""] call RPM_Cfg_Licenses_Revoked;
        };", _tgt, _src, _licstorm, _rmstr] call RPM_Cfg_Network_Broadcast;
        _rmstro = "";
        for [{_i = 0}, {_i < count(_licstorm)}, {_i = _i + 1}] do {
            if (_i != count(_licstorm)-1) then {
                _rmstro = _rmstro + (_licstorm select _i) + ", ";
            } else {
                _rmstro = _rmstro + (_licstorm select _i);
            };
        };
        hint format[localize "v521", _tgt, name _tgt, _rmstr];
        if (RPM_Diagnostics) then {
            [format["RPM(Licenses)|Revoked|%1|%2|%3", _tgt, _src, _rmstro], true] call RPM_Cfg_Server_DiagnosticsDumper;
        };
        closeDialog 0;
        _ret = true;
    };
    _ret;
};
// Want
RPM_Cfg_Crimes_Want = {
    private ["_player","_source","_time","_crime1","_crime2","_crime3","_playername","_i","_tmparr","_n","_crime","_crimes","_tmp","_crimestr","_idx","_count1","_count2","_count3","_str1","_str2","_str3","_amount1","_amount2","_amount3","_totamount","_time1","_time2","_time3","_tottime","_bounty","_ret"];
    _ret = false;
    _player = _this select 0;
    _source = _this select 1;
    _time = _this select 2;
    _crime1 = _this select 3;
    _crime2 = _this select 4;
    _crime3 = _this select 5;
    if (isNull(_player)) exitWith {};
    if (!(alive _player)) exitWith {};
    _playername = name _player;
    if (_player != RPM_Role) exitWith {
        hint format[localize "v479"];
    };
    if (_playername call RPM_Cfg_Crimes_IsJailed) exitWith {
        hint format[localize "v404", _playername];
        closeDialog 0;
    };
    if (_source call RPM_str_length == 0) exitWith {};
    if (_time <= 0) exitWith {};
    if ((_crime1 == 0) && (_crime2 == 0) && (_crime3 == 0)) exitWith {};
    b1 = true;
    _crimes = [_crime1, _crime2, _crime3];
    {
        if (_x == 0) then {
            _crimes = _crimes - [_x];
        };
    } forEach _crimes;
    _tmp = [];
    _amount1 = 0;
    _amount2 = 0;
    _amount3 = 0;
    _time1 = 0;
    _time2 = 0;
    _time3 = 0;
    for [{_i = 0}, {_i < count(_crimes)}, {_i = _i + 1}] do {
        _crime = _crimes select _i;
        if (_crime >= 1) then {
            _crime = (_crimes select _i) - 1;
            if (count(_tmp) == 0) then {
                _tmparr = [_crime, 1];
                _tmp set[0, _tmparr];
            } else {
                _idx = -1;
                for [{_n = 0}, {_n < count(_tmp)}, {_n = _n + 1}] do {
                    if (((_tmp select _n) select 0) == _crime) then {
                        _idx = _n;
                    };
                };
            };
            if (_idx == -1) then {
                _tmp set[count(_tmp), [_crime, 1]];
            } else {
                (_tmp select _idx) set[1, ((_tmp select _idx) select 1)+1];
            };
        };
    };
    _crimestr = "";
    if (count(_tmp) == 1) then {
        _str1 = "";
        _crime1 = a62 select ((_tmp select 0) select 0) select 0;
        _count1 = (_tmp select 0) select 1;
        _amount1 = (round(a62 select ((_tmp select 0) select 0) select 1)*_count1);
        _time1 = (floor(a62 select ((_tmp select 0) select 0) select 2)*_count1);
        if (_count1 == 1) then {
            _str1 = _crime1;
        } else {
            _str1 = format["%1 (%2x)", _crime1, _count1];
        };
        _crimestr = _str1;
    } else {
        if (count(_tmp) == 2) then {
            _str1 = "";
            _str2 = "";
            _crime1 = a62 select ((_tmp select 0) select 0) select 0;
            _count1 = (_tmp select 0) select 1;
            _crime2 = a62 select ((_tmp select 1) select 0) select 0;
            _count2 = (_tmp select 1) select 1;
            _amount1 = (round(a62 select ((_tmp select 0) select 0) select 1)*_count1);
            _amount2 = (round(a62 select ((_tmp select 1) select 0) select 1)*_count2);
            _time1 = (floor(a62 select ((_tmp select 0) select 0) select 2)*_count1);
            _time2 = (floor(a62 select ((_tmp select 1) select 0) select 2)*_count2);
            if (_count1 == 1) then {
                _str1 = _crime1;
            } else {
                _str1 = format["%1 (%2x)", _crime1, _count1];
            };
            if (_count2 == 1) then {
                _str2 = _crime2;
            } else {
                _str2 = format["%1 (%2x)", _crime2, _count2];
            };
            _crimestr = format["%1 & %2", _str1, _str2];
        };
        if (count(_tmp) == 3) then {
            _str1 = "";
            _str2 = "";
            _str3 = "";
            _crime1 = a62 select ((_tmp select 0) select 0) select 0;
            _count1 = (_tmp select 0) select 1;
            _crime2 = a62 select ((_tmp select 1) select 0) select 0;
            _count2 = (_tmp select 1) select 1;
            _crime3 = a62 select ((_tmp select 2) select 0) select 0;
            _count3 = (_tmp select 2) select 1;
            _amount1 = (round(a62 select ((_tmp select 0) select 0) select 1)*_count1);
            _amount2 = (round(a62 select ((_tmp select 1) select 0) select 1)*_count2);
            _amount3 = (round(a62 select ((_tmp select 2) select 0) select 1)*_count3);
            _time1 = (floor(a62 select ((_tmp select 0) select 0) select 2)*_count1);
            _time2 = (floor(a62 select ((_tmp select 1) select 0) select 2)*_count1);
            _time3 = (floor(a62 select ((_tmp select 2) select 0) select 2)*_count1);
            if (_count1 == 1) then {
                _str1 = _crime1;
            } else {
                _str1 = format["%1 (%2x)", _crime1, _count1];
            };
            if (_count2 == 1) then {
                _str2 = _crime2;
            } else {
                _str2 = format["%1 (%2x)", _crime2, _count2];
            };
            if (_count3 == 1) then {
                _str3 = _crime3;
            } else {
                _str3 = format["%1 (%2x)", _crime3, _count3];
            };
            _crimestr = format["%1, %2 & %3", _str1, _str2, _str3];
        };
    };
    _totamount = _amount1 + _amount2 + _amount3;
    _tottime = _time1 + _time2 + _time3;
    _playername = name RPM_Role;
    _bounty = _playername call RPM_Cfg_Crimes_GetBounty;
    if (i21 > _totamount) then {
        _bounty = round(_bounty + _totamount);
        format["if (i21 - %1 >= 0) then {
            if (i21 >= %1) then {
                i21 = i21 - %1;
            } else {
                i21 = 0;
            };
        };", _totamount] call RPM_Cfg_Network_Broadcast;
    };
    [_playername, _bounty, round((_playername call RPM_Cfg_Crimes_GetTime) + _tottime), false] call RPM_Cfg_Crimes_SetWanted;
    format["if (local server) then {
        server globalChat ""%1"";
    };", format[localize "v483", RPM_Role, name RPM_Role, _totamount, _playername, _crimestr]] call RPM_Cfg_Network_Broadcast;
    if (RPM_Diagnostics) then {
        [format["RPM(Crimes)|Wanted|%1|%2|%3|%4|%5|%6|%7", _playername, name RPM_Role, _tottime, _totamount, _crime1, _crime2, _crime3], false] call RPM_Cfg_Server_DiagnosticsDumper;
    };
    closeDialog 0;
    b1 = false;
    _ret = true;
    _ret;
};
// Search
RPM_Cfg_Search_CompileInvArr = {
    private ["_i","_tgtweps","_tmparr","_newarr","_c","_idx","_curamount","_newamount","_wepinvarr","_wep","_itemid","_tgt","_vararr","_ret"];
    _ret = [];
    _tgt = _this select 0;
    if ((isNull(_tgt)) || (!(alive _tgt))) exitWith {};
    _vararr = _this select 1;
    _tgtweps = + (weapons _tgt);
    if (count(_tgtweps) >= 1) then {
        {
            for [{_i = 0}, {_i < count(_tgtweps)}, {_i = _i + 1}] do {
                if (_x == (_tgtweps select _i)) then {
                    _tgtweps = _tgtweps - [_x];
                };
            };
        } forEach a30;
    };
    if (count(magazines _tgt) >= 1) then {
        _tgtweps = _tgtweps + (magazines _tgt);
    };
    if ((count(_vararr) == 0) and (count(_tgtweps) == 0)) then {
        hint format[localize "v118", _tgt, name _tgt];
        _ret = [];
    } else {
        _wepinvarr = [];
        for [{_i = 0}, {_i < count(_tgtweps)}, {_i = _i + 1}] do {
            _wep = _tgtweps select _i;
            if (isNil("_newarr")) then {
                _tmparr = [_wep, 1];
                _newarr = [];
                _newarr set[0, _tmparr];
                _wepinvarr = + (_newarr);
            } else {
                _idx = -1;
                for [{_c = 0}, {_c < count(_newarr)}, {_c = _c + 1}] do {
                    if (((_newarr select _c) select 0) == _wep) then {
                        _idx = _c;
                    };
                };
                if (_idx != -1) then {
                    _curamount = (_newarr select _idx) select 1;
                    _newamount = _curamount + 1;
                    _tmparr = [_wep, _newamount];
                    _newarr set[_idx, _tmparr];
                    _wepinvarr = + (_newarr);
                } else {
                    _tmparr = [_wep, 1];
                    _newarr set[count(_newarr), _tmparr];
                    _wepinvarr = + (_newarr);
                };
            };
        };
        for [{_i = 0}, {_i < count(_wepinvarr)}, {_i = _i + 1}] do {
            _wep = (_wepinvarr select _i) select 0;
            _itemid = [_wep] call RPM_Cfg_Items_GetIDByClass;
            _tmparr = + (_wepinvarr select _i);
            _tmparr set[0, _itemid];
            _wepinvarr set[_i, _tmparr];
        };
        RPM_InvTmpArr = _vararr + _wepinvarr;
        _ret = RPM_InvTmpArr;
    };
    _ret;
};
RPM_Cfg_Search_Destroy = {
    private ["_ret","_sel","_amount","_tgt","_itemid","_itemname","_magsidx","_vehsidx","_itemsidx","_unitsidx","_i","_exit","_found","_repaint","_class","_oldcount","_h"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _sel = _this select 0;
    _amount = (_this select 1) call RPM_str_StrToInt;
    _tgt = _this select 2;
    if ((isNull(_tgt)) || (!(alive _tgt))) exitWith {};
    _itemid = (RPM_InvTmpArr select _sel) select 0;
    _exit = false;
    if ((!(isPlayer cursorTarget)) || (_tgt != cursorTarget)) exitWith {
        hint format[localize "v206"];
        _exit = true;
    };
    if (!(_exit)) then {
        for [{_i = 0}, {_i < count(RPM_InvTmpArr)}, {_i = _i + 1}] do {
            if (((RPM_InvTmpArr select _i) select 0) == _itemid) then {
                if ((((RPM_InvTmpArr select _i) select 1) - _amount) < 0) exitWith {
                    hint format[localize "v164"];
                    _exit = true;
                };
            };
        };
        _itemname = [_itemid] call RPM_Cfg_Items_GetName;
        _magsidx = count(RPM_AllWeaponObjects);
        _vehsidx = (count(RPM_AllWeaponObjects) + count(RPM_AllMagazineObjects));
        _itemsidx = (count(RPM_AllWeaponObjects) + count(RPM_AllMagazineObjects) + count(RPM_AllVehiclesObjects));
        _unitsidx = (count(RPM_AllWeaponObjects) + count(RPM_AllMagazineObjects) + count(RPM_AllVehiclesObjects) + count(RPM_AllItemsArray));
        if (!(_exit)) then {
            _repaint = false;
            _class = "";
            if ((_itemid < _magsidx) || (_itemid >= _magsidx) && (_itemid < _vehsidx)) then {
                _class = [_itemid] call RPM_Cfg_Items_GetClass;
            };
            if (_itemid < _magsidx) then {
                hint format[localize "v180", _itemname, _tgt, name _tgt];
                format["if (!(isDedicated)) then {
                    if (RPM_Role == %1) then {
                        RPM_Role removeWeapon ""%2"";
                        hint ""%3"";
                    };
                };", _tgt, _class, format[localize "v55", RPM_Role, name RPM_Role, _amount, [_itemid] call RPM_Cfg_Items_GetName]] call RPM_Cfg_Network_Broadcast;
                _found = false;
                {
                    if (_x == _class) then {
                        _found = true;
                    };
                } forEach (weapons _tgt);
                if (!(_found)) then {
                    _repaint = true;
                };
            };
            if (!(_exit)) then {
                if ((_itemid >= _magsidx) && (_itemid < _vehsidx)) then {
                    _oldcount = count(magazines(_tgt));
                    hint format[localize "v179", _amount, _itemname, _tgt, name _tgt];
                    format["if (!(isDedicated)) then {
                        if (RPM_Role == %1) then {
                            for [{_i = 1}, {_i <= _amount}, {_i = _i + 1}] do {
                                RPM_Role removeMagazine ""%2"";
                            };
                        };
                    };", _tgt, _class] call RPM_Cfg_Network_Broadcast;  
                    format["if (!(isDedicated)) then {
                        if (RPM_Role == %1) then {
                            hint ""%2"";
                        };
                    };", _tgt, format[localize "v58", RPM_Role, name RPM_Role, _amount, _itemname]] call RPM_Cfg_Network_Broadcast;
                    _found = false;
                    {
                        if (_x == _class) then {
                            _found = true;
                        };
                    } forEach (magazines _tgt);
                    if ((!(_found)) || (_oldcount != (count(magazines _tgt)))) then {
                        _repaint = true;
                    };
                };
                if ((_itemid >= _vehsidx) && (_itemid < _itemsidx) && (!(_exit))) then {};
                if ((_itemid >= _itemsidx) && (_itemid < _unitsidx) && (!(_exit))) then {
                    hint format[localize "v179", _amount, _itemname, _tgt, name _tgt];
                    format["if (!(isDedicated)) then {
                        if (RPM_Role == %1) then {
                            [%2, %3] call RPM_Cfg_Inv_DelItemAmount;
                            hint ""%4"";
                        };
                    };", _tgt, _itemid, _amount, format[localize "v58", RPM_Role, name RPM_Role, _amount, _itemname]] call RPM_Cfg_Network_Broadcast;
                    _repaint = true;
                };
                if ((_itemid >= _unitsidx) && (_itemid <= count(RPM_AllMissionObjects)) && (!(_exit))) then {};
                if (!(_exit)) then {
                    RPM_InvTmpArr = + ([RPM_InvTmpArr, _itemid, _amount] call RPM_Cfg_Search_SubtractInvArr);
                    if (_repaint) then {
                        _h = [_sel] call RPM_Cfg_Search_RepaintListBox;
                        waitUntil {_h};
                    };
                };
            };
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Search_SubtractInvArr = {
    private ["_i","_itemid","_amount","_tmparr","_curamount","_newamount","_ret"];
    _ret = [];
    if (count(_this) >= 3) then {
        _ret = + (_this select 0);
        _itemid = _this select 1;
        _amount = _this select 2;
        if ((!(isNil("_ret"))) && (!(isNil("_ret")))) then {
            for [{_i = 0}, {_i < count(_ret)}, {_i = _i + 1}] do {
                if (((_ret select _i) select 0) == _itemid) then {
                    _curamount = (_ret select _i) select 1;
                    _tmparr = + (_ret select _i);
                    _newamount = _curamount - _amount;
                    if (_newamount <= 0) then {
                        _ret set[_i, -1];
                        _ret = _ret - [-1];
                    } else {
                        _tmparr set[1, _newamount];
                        _ret set[_i, _tmparr];
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Search_SetSearchArr = {
    private ["_ret","_tmparr","_i"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _tmparr = [];
    for [{_i = 0}, {_i < count(a19)}, {_i = _i + 1}] do {
        if (((a19 select _i) select 0) in a57) then {
            _tmparr set[count(_tmparr), a19 select _i];
        };
    };
    RPM_Role setVariable ["search", _tmparr, true];
    _ret;
};
RPM_Cfg_Police_TicketCiv = {
    private ["_tgt","_amount","_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _tgt = _this select 0;
	if (side _tgt == WEST) exitWith {
		hint format[localize "STRM_Ticket_Cops"];
	};
    _amount = _this select 3;
    closeDialog 0;
    if (local _tgt) then {
        _this spawn {
            while {dialog} do {
                closeDialog 0;
            };
            [_this select 1, _this select 2, _this select 3, _this select 4, _this select 5] call RPM_Cfg_Police_Ticketed;
        };
    } else {
        _amount = _this select 2;
        ticket = _this;
        publicvariable "ticket";
    };
    if (RPM_Diagnostics) then {
        [[format["RPM(Police)|Ticketed|%1|%2|%3|%4|%5|%6|%7", name RPM_Role, name _tgt, _this select 2, _this select 3, _this select 4, _this select 5], false], false] call RPM_Cfg_Server_DiagnosticsDumper;
    };
    hint format[localize "v395", _tgt, _amount];
    [] spawn {
        while {dialog} do {
            closeDialog 0;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Police_Arrested = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_crimes1","_crimes2","_crimes3","_i","_mag","_marker","_stime","_src","_amount","_crime1","_crime2","_crime3"];
        disableUserInput true;
        if (b29) then {
            b29 = false;
        };
        if (!(createDialog "ArrestedDialog")) exitWith {
            hint format[localize "v1"];
            disableUserInput false;
        };
        _src = _this select 0;
        _amount = _this select 2;
        _crime1 = _this select 3;
        _crime2 = _this select 4;
        _crime3 = _this select 5;
        hint format[localize "v397", _src, (name _src)];
        if (_crime1 >= 1) then {
            _crimes1 = (a62 select _crime1-1) select 0;
            ctrlSetText[269, format["1.) %1", _crimes1]];
        };
        if (_crime2 >= 1) then {
            _crimes2 = (a62 select _crime2-1) select 0;
            ctrlSetText[270, format["1.) %1", _crimes2]];
        };
        if (_crime3 >= 1) then {
            _crimes3 = (a62 select _crime3-1) select 0;
            ctrlSetText[271, format["1.) %1", _crimes3]];
        };
        ctrlSetText[162, format["%1", round(_amount / 60)]];
        _stime = 0;
        while {true} do {
            if (_stime >= 9) exitWith {
                closeDialog 0;
                removeAllWeapons RPM_Role;
                for [{_i=0},{_i<count(magazines RPM_Role)},{_i=_i+1}] do {
                    _mag = (magazines RPM_Role) select _i;
                    RPM_Role removeMagazines _mag;
                };
                call RPM_Cfg_Items_RemoveIllegals;
                _marker = call RPM_Cfg_Jail_GetFreeMarker;
                RPM_Role setPosATL [(getMarkerPos _marker) select 0, (getMarkerPos _marker) select 1, 0];
                disableUserInput false;
                a0 = [true, round(_amount), time];
                call RPM_Cfg_Jail_Jailed;
                call RPM_Cfg_Inv_CompileStatsArray;
                closeDialog 0;
                if (RPM_Diagnostics) then {
                    [format["RPM(Jail)|Jailed|%1", name RPM_Role], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
				["Arrested", RPM_Role, [format["%1", _amount], name _src]] spawn RPM_Cfg_Logs_AddLog;
                false;
            };
            ctrlSetText[272, format["%1", 9 - _stime]];
            _stime = _stime + 1;
            sleep 1;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Police_ArrestCiv = {
    private ["_ret","_anim"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _anim = animationState (_this select 0);
    if ((!(_anim in a43)) && (_anim != "amovpercmstpssurwnondnon") && (_anim != "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon")) exitWith {
        hint format[localize "v531", _this select 0, name (_this select 0)];
        [] spawn {
            while {dialog} do {
                closeDialog 0;
            };
        };
    };
    _this spawn {
        private ["_cost","_tgt","_tgtname","_src","_amount","_crime1","_crime2","_crime3","_b1","_b2","_b3","_bounty","_take"];
        _tgt = _this select 0;
        if ((!(alive _tgt)) || (isNull(_tgt))) exitWith {};
        _tgtname = name _tgt;
        if ((_tgtname) call RPM_Cfg_Crimes_IsJailed) exitWith {
            hint format[localize "v404", name _tgt];
        };
        _src = _this select 1;
        _amount = round(_this select 2);
        _crime1 = _this select 3;
        _crime2 = _this select 4;
        _crime3 = _this select 5;
        _b1 = (a62 select _crime1) select 1;
        _b2 = (a62 select _crime2) select 1;
        _b3 = (a62 select _crime3) select 1;
        _cost = _b1 + _b2 + _b3;
        _bounty = _tgtname call RPM_Cfg_Crimes_GetBounty;
        if (_bounty >= 0) then {
            _take = round(_bounty/0.5);
            if (_take >= 1) then {
                hint format[localize "v448", _tgtname, _take];
                [521, _take] call RPM_Cfg_Inv_AddItemAmount;
                format["i21 = i21 + %1;", _take] call RPM_Cfg_Network_Broadcast;
            };
            sleep 2;
        };
        closeDialog 0;
        if (local _tgt) then {
            _this spawn {
                private ["_tgt","_amount","_src","_crime1","_crime2","_crime3"];
                _tgt = _this select 1;
                _src = _this select 2;
                _amount = _this select 3;
                _crime1 = _this select 4;
                _crime2 = _this select 5;
                _crime3 = _this select 6;
                while {dialog} do {
                    closeDialog 0;
                };
                [_tgt, _src, _amount, _crime1, _crime2, _crime3]  call RPM_Cfg_Police_Arrested;
            };
        } else {
            arrest = [_tgt, _src, _amount, _crime1, _crime2, _crime3];
            publicvariable "arrest";
        };
        [name _tgt, _cost, _amount, true] call RPM_Cfg_Crimes_SetWanted;
        hint format[localize "v396", _tgt, round (_amount / 60)];
        sleep 2;
        hint format[localize "v447", (name _tgt)];
        format["if (local server) then {
            server globalChat ""%3"";
        };", RPM_Role, _tgt, format[localize "v426", _tgt, RPM_Role, name RPM_Role]] call RPM_Cfg_Network_Broadcast;
        [] spawn {
            while {dialog} do {
                closeDialog 0;
            };
        };
        if (RPM_Diagnostics) then {
            [format["RPM(Police)|Arrested|%1|%2|%3|%4|%5|%6", name RPM_Role, name _tgt, _crime1, _crime2, _crime3, _amount], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Police_RestrainUnit = {
    private ["_ret","_tgt","_src","_curAnim"];
    _ret = false;
    _tgt = _this select 0;
    if ((isNull(_tgt)) || (!(alive _tgt)) || (isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUse) && (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {};
    _src = _this select 1;
    if ((isNull(_tgt)) || (!(alive _tgt))) exitWith {};
	
	if (animationState _tgt == "adthpercmstpsraswrfldnon_1" || animationState _tgt == "amovpercmstpssurwnondnon") then
	{
		if (animationState _tgt == "civillying01") then
		{
			[nil,_tgt,rSWITCHMOVE,""] call RE;
			hintSilent format ["%1 Unrestrained!", name _tgt];
			_ret = true;
		} else {
			[nil,_tgt,rSWITCHMOVE,"civillying01"] call RE;
			hintSilent format ["%1 Restrained!", name _tgt];
			_ret = true;
		};
	} else {
		hintSilent "You cannot restrain this person!";
	};
	_ret;
};
RPM_Cfg_Police_UnRestrainUnit = {
    private ["_ret","_cuffed","_tgt"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _tgt = _this select 0;
    if ((!(alive _tgt)) || (isNull(_tgt))) exitWith {};
    if (_tgt == RPM_Role) exitWith {
        hint format[localize "v173"];
    };
    _cuffed = _tgt getVariable "cuffed";
    if (!(isNil("_cuffed"))) then {
        if (_cuffed) then {
            _tgt setVariable ["cuffed", false, true];
            format["if (RPM_Role == %1) then {
                hint ""%2"";
            };", _tgt, format[localize "v227", name RPM_Role]] call RPM_Cfg_Network_Broadcast;
            format["if (RPM_Role == %1) then {
                [""%2""] call RPM_Cfg_Inv_SwitchMove;
            }", RPM_Role, "Normal"] call RPM_Cfg_Network_Broadcast;
            hint format[localize "v217", _tgt];
            _ret = true;
        } else {
            hint format[localize "v94"];
        };
    };
    _ret;
};
RPM_Cfg_Crimes_Unwanted = {
    private ["_player","_sel","_ret"];
    _ret = false;
    b1 = true;
    if (!(alive RPM_Role)) exitWith {
        b1 = false;
    };
    _player = _this select 0;
    if (isNull(_player)) exitWith {
        hint format[localize "v2"];
        b1 = false;
    };
    if (!(alive _player)) exitWith {
        b1 = false;
    };
    if (name _player == name RPM_Role) exitWith {
        hint format[localize "v435"];
        b1 = false;
    };
    _sel = _this select 1;
    if (!((name _player) call RPM_Cfg_Crimes_IsWanted)) exitWith {
        hint format[localize "v437", name _player];
        closeDialog 0;
        b1 = false;
    };
    hint format[localize "v432", name _player];
    [name _player, 0] call RPM_Cfg_Crimes_SetBounty;
    (name _player) call RPM_Cfg_Crimes_Unwant;
    format["if (!(isDedicated)) then {
        if (RPM_Role == %1) then {
            hint ""%2"";
            call RPM_Cfg_Inv_CompileStatsArray;
        };
    }", _player, format[localize "v433", name RPM_Role]] call RPM_Cfg_Network_Broadcast;
    if (!((name _player) call RPM_Cfg_Crimes_IsWanted)) then {
        lbDelete[183, _sel];
    };
    b1 = false;
    _ret;
};
