// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Delivery
RPM_Cfg_Delivery_GetName = {
    private ["_i","_c","_points","_ret"];
    _ret = "";
    if (!(isNull(_this))) then {
        for [{_i = 0}, {_i < count(a9)}, {_i = _i + 1}] do {
            _points = (a9 select _i) select 1;
            for [{_c = 0}, {_c < count(_points)}, {_c = _c + 1}] do {
                if ((_this == (_points select _c) select 0)) then {
                    _ret = (_points select _c) select 2;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Delivery_Logic = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (!(isNull(o0))) exitWith {
        hint format[localize "v151", o0];
    };
    _this spawn {
        private ["_npc","_i","_nfound","_box","_points","_ncount","_randpoint","_themark","_thebox","_distance","_payout","_someid","_somename","_ramount","_thetext","_tmp","_dstr"];
        _npc = _this;
        _nfound = -1;
        for [{_i = (count(a9) -1)}, {_i >= 0}, {_i = _i -1}] do {
            if (((a9 select _i) select 0) == _npc) then {
                _nfound = _i;
            };
        };
        if (_nfound != -1) then {
            _ncount = count(a81 select _nfound);
            _points = [];
            for [{_i = 0}, {_i < count((a9 select _nfound) select 1)}, {_i = _i + 1}] do {
                _box = (((a9 select _nfound) select 1) select _i) select 0;
                _points set[count(_points), _box];
            };
            if (count(_points) == _ncount) then {
                a81 set[_nfound, []];
            };
            for [{_i = 0}, {_i < count(_points)}, {_i = _i + 1}] do {
                if ((_points select _i) in (a81 select _nfound)) then {
                    _points set[_i, -1];
                    _points = _points - [-1];
                };
            };
            _randpoint = round(random(count(_points)-1));
            _thebox = (((a9 select _nfound) select 1) select _randpoint) select 0;
            _themark = (((a9 select _nfound) select 1) select _randpoint) select 1;
            _thetext = (((a9 select _nfound) select 1) select _randpoint) select 2;
            (a81 select _nfound) set[count(a81 select _nfound), _thebox];
            o0 = _thebox;
            s2 = _themark;
            s2 setMarkerTypeLocal "mil_flag";
            s2 setMarkerColorLocal "ColorRed";
            b3 = true;
            _distance = round(RPM_Role distance (getPos o0));
            _payout = (round(_distance * 0.2));
            _someid = -1;
            while {_someid == -1} do {
                _tmp = 306 - (round(random(6)));
                if ((!(isNil("_tmp"))) && (_tmp >= 300) && (_tmp <= 306)) then {
                    _someid = 306 - (round(random(6)));
                };
            };
            _somename  = [_someid] call RPM_Cfg_Items_GetName;
            _ramount = round(random(3));
            if ([_someid, _ramount] call RPM_Cfg_Inv_AddItemAmount) then {
                a51 = [_someid, _ramount];
                if (RPM_Diagnostics) then {
                    [format["CHRP(Delivery)|Started|%1|%2|%3,%4", name RPM_Role, s2, _someid, _ramount], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
                _dstr = format["%1 %2", _ramount, _somename];
                hint format[localize "v95", _dstr, _thetext];
                waitUntil {((!(alive RPM_Role)) || (RPM_Role distance o0 <= 8) || (isNull(o0)) || (!(b3)))};
                if ((!(alive RPM_Role)) || (isNull(o0)) || (!(b3))) then {
                    1 call RPM_Cfg_Delivery_Cancel;
                } else {
                    if (([_someid] call RPM_Cfg_Inv_GetItemAmount) < (a51 select 1)) then {
                        hint format[localize "v219", _somename];
                    } else {
                        if ([_someid, a51 select 1] call RPM_Cfg_Inv_DelItemAmount) then {
                            if ([521, _payout] call RPM_Cfg_Inv_AddItemAmount) then {
                                hint format[localize "v158", o0, _payout];
                                1 call RPM_Cfg_Delivery_Cancel;
                            };
                        } else {
                            1 call RPM_Cfg_Delivery_Cancel;
                        };
                    };
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Delivery_Cancel = {
    private ["_ret"];
    _ret = false;
    if ((!(isNull(o0))) || ((a51 select 0) != -1) && ((a51 select 1) != -1) || (b3)) then {
        if (_this == 0) then {
            if (alive RPM_Role) then {
                hint format[localize "v175"];
            };
            if (RPM_Diagnostics) then {
                [format["CHRP(Delivery)|Cancelled|%1|%2|%3,%4", name RPM_Role, s2, a51 select 0, a51 select 1], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            if (alive RPM_Role) then {
                [a51 select 0, a51 select 1] call RPM_Cfg_Inv_DelItemAmount;
                if ([a51 select 0] call RPM_Cfg_Inv_GetItemAmount >= a51 select 1) then {
                    [a51 select 0, a51 select 1] call RPM_Cfg_Inv_DelItemAmount;
                };
            };
        } else {
            if (RPM_Diagnostics) then {
                [format["CHRP(Delivery)|Completed|%1|%2|%3,%4", name RPM_Role, s2, a51 select 0, a51 select 1], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
        };
        s2 setMarkerTypeLocal "Empty";
        s2 setMarkerColorLocal "Default";
        a51 = [-1, -1];
        b3 = false;
        o0 = objNull;
        _ret = true;
    };
    _ret;
};
