// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

RPM_Cfg_Logs_Passcode_GUI = {
    private ["_i","_found","_uid","_ret"];
    _ret = false;
    if (isNil("RPM_Admins")) exitWith{
        hint format[localize "STRM_Logs_NoAdmin"];
    };
    _uid = call RPM_Cfg_Objects_GetUID;
    if (_uid call RPM_str_Length >= 1) then {
        _found = -1;
        for [{_i = 0}, {_i < count(RPM_Admins)}, {_i = _i + 1}] do {
            if (((RPM_Admins select _i) select 0) == _uid) then {
                _found = _i;
            };
        };
        if (_found == -1) exitWith {
            hint format[localize "STRM_Logs_InvalidUID"];
            ["LogsInvalidUID", RPM_Role] spawn RPM_Cfg_Logs_AddLog;
        };
        _found spawn {
            private ["_found","_passcode"];
            if (!(createDialog "LogsPasscodeDialog")) exitWith {
                hint format[localize "v1"];
            };
            ctrlSetText[297, call RPM_Cfg_Objects_GetUID];
            _found = _this;
            while {ctrlVisible 297} do {
                _passcode = ctrlText 298;
                if ((_passcode call RPM_str_Length >= 16) || (_passcode call RPM_str_ContainsSymbol)) then {
                    ctrlSetText[298, ""];
                    buttonSetAction[299, format['hint ""%1"";', format[localize "STRM_Logs_Passcode_Invalid"]]];
                } else {
                    buttonSetAction[299, format['[%1, "%2"] call RPM_Cfg_Logs_GUI;closeDialog 0;', _found, _passcode]];
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Logs_GUI = {
    private ["_ret","_found","_passcode"];
    _ret = false;
    if (isNil("RPM_Admins")) exitWith{
        hint format[localize "STRM_Logs_NoAdmin"];
    };
    _found = _this select 0;
    if (_found == -1) exitWith {};
    _passcode = _this select 1;
    if (_passcode != ((RPM_Admins select _found) select 1)) exitWith {
        hint format[localize "STRM_Logs_InvalidCode"];
        ["LogsInvalidCode", RPM_Role, [_passcode]] spawn RPM_Cfg_Logs_AddLog;
    };
    hint format[localize "STRM_Logs_Passcode_Valid"];
    _this spawn {
        private ["_i","_type","_index","_text","_arr","_date","_counter","_displayed","_sel","_added"];
        ["Logs", RPM_Role] spawn RPM_Cfg_Logs_AddLog;
        _added = [];
        for [{_i = 0}, {_i < count(RPM_Logs)}, {_i = _i + 1}] do {
            if ((count((RPM_Logs select _i) select 1)) >= 1) then {
                _added set[count(_added), [_i, (RPM_Logs select _i) select 0]];
            };
        };
        if (count(_added) == 0) exitWith {
            hint format[localize "STRM_Logs_None"];
        };
        if (!(createDialog "LogsDialog")) exitWith {
            hint format[localize "v1"];
        };
        for [{_i = 0}, {_i < count(_added)}, {_i = _i + 1}] do {
            _type = (_added select _i) select 1;
            _index = lbAdd[295, _type];
            lbSetData[295, _index, _type];
        };
        lbSetCurSel[295, 0];
        _displayed = -1;
        while {ctrlVisible 295} do {
            _sel = lbCurSel 295;
            if (_sel >= 0) then {
                if (_displayed == -1) then {
                    _counter = 0;
                    for [{_i = 0}, {_i < count((RPM_Logs select _sel) select 1)}, {_i = _i + 1}] do {
                        _arr = ((RPM_Logs select _sel) select 1) select _i;
                        _date = format["%1:%2:%3 %4:00", (_arr select 2) select 0, (_arr select 2) select 1, (_arr select 2) select 2, (_arr select 2) select 3]; 
                        _text = format["%1, %2, %3, %4", _arr select 0, _arr select 1, _date, _arr select 3];
                        _index = lbAdd[296, _text];
                        lbSetData[296, _index, _text];
                        _counter = _counter + 1;
                    };
                    if (_counter >= 1) then {
                        lbSetCurSel[296, 0];
                    };
                    _displayed = _sel;
                } else {
                    if (_displayed != _sel) then {
                        lbClear 296;
                        _counter = 0;
                        for [{_i = 0}, {_i < count((RPM_Logs select _sel) select 1)}, {_i = _i + 1}] do {
                            _arr = ((RPM_Logs select _sel) select 1) select _i;
                            _date = format["%1:%2:%3 %4:00", (_arr select 2) select 0, (_arr select 2) select 1, (_arr select 2) select 2, (_arr select 2) select 3]; 
                            _text = format["%1, %2, %3, %4", _arr select 0, _arr select 1, _date, _arr select 3];
                            _index = lbAdd[296, _text];
                            lbSetData[296, _index, _text];
                            _counter = _counter + 1;
                        };
                        if (_counter >= 1) then {
                            lbSetCurSel[296, 0];
                        };
                        _displayed = _sel;
                    };
                };
            };
        };
        sleep 0.01;
    };
    _ret = true;
    _ret;
};
