// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Police
RPM_Cfg_Police_SearchVehicle_GUI = {
    private ["_ret","_vcl"];
    _ret = false;
    if (b1) exitWith {};
    _vcl = _this;
    if ((isNull(_vcl)) || (!(alive(_vcl))) || (isNull(RPM_Role)) || (!(alive(RPM_Role)))) exitWith {};
    if (format["%1", _vcl] in a20) exitWith {
        hint format[localize "v538"];
    };
    _this spawn {
        private ["_vcl","_exit","_h"];
        _vcl = _this;
        b1 = true;
        if (!(createDialog "SearchDialog")) exitWith {
            hint format[localize "v1"];
            b1 = false;
        };
        disableSerialization;
        // Disable destroy
        ctrlShow[193, false];
        // Move close
        ((findDisplay 107) displayCtrl 192) ctrlSetPosition [(((ctrlPosition((findDisplay 107) displayCtrl 192)) select 0) + ((ctrlPosition((findDisplay 107) displayCtrl 193)) select 0)) / 2, ((((ctrlPosition((findDisplay 107) displayCtrl 192)) select 1) + ((ctrlPosition((findDisplay 107) displayCtrl 193)) select 1)) / 2)  + 0.0425];
        ((findDisplay 107) displayCtrl 192) ctrlCommit 0.001;
        ctrlShow[189, false];
        ctrlShow[191, false];
        ctrlSetText[188, format["%1 (%2)", format["%1", [[typeOf(_vcl)] call RPM_Cfg_Items_GetIDByClass] call RPM_Cfg_Items_GetName], _vcl]];
        _h = [_vcl, 0] call RPM_Cfg_Police_SearchVehicle_RepaintListBox;
        waitUntil {_h};
        _exit = false;
        while {(!(_exit))} do {
            if ((isNull(_vcl)) || (!(alive _vcl)) || (_vcl distance RPM_Role >= 9) || (isNull(RPM_Role)) || (!(alive(RPM_Role)))) then {
                [] spawn {
                    while {dialog} do {
                        closeDialog 0;
                    };
                };
                b1 = false;
                _exit = true;
            };
            if (!(ctrlVisible 188)) then {
                _exit = true;
            };
            sleep 0.001;
        };
        b1 = false;
    };
    _ret;
};
RPM_Cfg_Police_SearchVehicle_RepaintListBox = {
    private ["_i","_line","_itemid","_itemname","_weightstr","_amountstr","_index0","_ret","_vcl","_selection","_storagearray"];
    _ret = false;
    _vcl = _this select 0;
    if ((!(isNull(_vcl))) && (alive(_vcl))) then {
        _selection = _this select 1;
        _storagearray = ["Trunk_Storage", _vcl, -1] call RPM_Cfg_Storage_GetArray;
        for [{_i = 0}, {_i < count(_storagearray)}, {_i = _i + 1}] do {
            // Item
            _line = "";
            _itemid = (_storagearray select _i) select 0;
            _itemname = [_itemid] call RPM_Cfg_Items_GetName;
            // Weight
            _weightstr = format["%1kg", (([_itemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * ((_storagearray select _i) select 1)];
            // Qty
            _amountstr = format["%1", (_storagearray select _i) select 1];
            _line = _line + _itemname + " (" + _weightstr + ", " + _amountstr + ")";
            _index0 = lbAdd[190, _line];
            lbSetData[190, _index0, _line];
        };
        lbSetCurSel[190, _selection];
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Police_QueryLicenses_GUI = {
    private ["_ret","_tgt","_query"];
    _ret = false;
    if (b1) exitWith {};
    _tgt = _this;
    if ((isNull(_tgt)) || (!(alive(_tgt))) || (isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (_tgt == RPM_Role) exitWith {
        hint format[localize "v525"];
    };
    _query = _tgt getVariable "query";
    if ((!(isNull(_query))) || (!(alive(_query)))) then {
        _tgt setVariable["query", objNull, true];
    };
    if ((!(isNull(_query))) && (_query != RPM_Role)) exitWith {
        hint format[localize "v524"];
    };
    if (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUse) && (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {};
    _tgt spawn {
        private ["_stime","_i","_str2","_haslics","_strarr1","_str1","_tgt","_sldrsel2","_sldrsel3","_sldrsel4","_sldrsel5","_sldrsel6","_sldrsel7","_sldrsel1","_exit"];
        _tgt = _this;
        if ((isNull(_tgt)) || (!(alive(_tgt))) || (isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
        b1 = true;
        _tgt setVariable ["query", RPM_Role, true];
        // Get licenses over network
        format["if (RPM_Role == %1) then {
            [%1, %2] call RPM_Cfg_Licenses_Broadcast;
        };", _tgt, RPM_Role] call RPM_Cfg_Network_Broadcast;
        _stime = 0;
        // Wait for them!
        while {((_stime <= 4) && (!(b53)))} do {
            _stime = _stime + 1;
            sleep 1;
        };
        b53 = false;
        _haslics = _tgt getVariable "haslics";
        if (RPM_Diagnostics) then {
            [format["RPM(Police)|Queried|%1|%2", _tgt, RPM_Role], true] call RPM_Cfg_Server_DiagnosticsDumper;
        };
        // Set GUI defaults
        buttonSetAction[264, ""];
        if (!(createDialog "QueryLicensesDialog")) exitWith {
            hint format[localize "v1"];
            b1 = false;
        };
        sliderSetRange[257, 1, 2];
        sliderSetRange[258, 1, 2];
        sliderSetRange[259, 1, 2];
        sliderSetRange[260, 1, 2];
        sliderSetRange[261, 1, 2];
        sliderSetRange[262, 1, 2];
        sliderSetRange[263, 1, 2];
        _strarr1 = (format[localize "v522", _tgt, name _tgt]) call RPM_str_StrToArr;
        for [{_i = 0}, {_i < count(_strarr1)}, {_i = _i + 1}] do {
            ctrlSetText[242, (ctrlText 242) + (_strarr1 select _i)];
            sleep 0.05;
        };
        // Air
        _str1 = (format[localize "v512"]) call RPM_str_StrToArr;
        _str2 = [];
        if ("lic_air" in _haslics) then {
            _str2 = (format[localize "v424"]) call RPM_str_StrToArr;
            ctrlEnable[257, true];
        } else {
            _str2 = (format[localize "v425"]) call RPM_str_StrToArr;
            sliderSetRange[257, 0, 0];
            ctrlEnable[257, false];
        };
        for [{_i = 0}, {_i < count(_str1)}, {_i = _i + 1}] do {
            ctrlSetText[243, (ctrlText 243) + (_str1 select _i)];
            sleep 0.05;
        };
        for [{_i = 0}, {_i < count(_str2)}, {_i = _i + 1}] do {
            ctrlSetText[250, (ctrlText 250) + (_str2 select _i)];
            sleep 0.05;
        };
        // Boat
        _str1 = (format[localize "v513"]) call RPM_str_StrToArr;
        _str2 = [];
        if ("lic_boat" in _haslics) then {
            _str2 = (format[localize "v424"]) call RPM_str_StrToArr;
            ctrlEnable[258, true];
        } else {
            _str2 = (format[localize "v425"]) call RPM_str_StrToArr;
            sliderSetRange[258, 0, 0];
            ctrlEnable[258, false];
        };
        for [{_i = 0}, {_i < count(_str1)}, {_i = _i + 1}] do {
            ctrlSetText[244, (ctrlText 244) + (_str1 select _i)];
            sleep 0.05;
        };
        for [{_i = 0}, {_i < count(_str2)}, {_i = _i + 1}] do {
            ctrlSetText[251, (ctrlText 251) + (_str2 select _i)];
            sleep 0.05;
        };
        // Car
        _str1 = (format[localize "v514"]) call RPM_str_StrToArr;
        _str2 = [];
        if ("lic_car" in _haslics) then {
            _str2 = (format[localize "v424"]) call RPM_str_StrToArr;
            ctrlEnable[259, true];
        } else {
            _str2 = (format[localize "v425"]) call RPM_str_StrToArr;
            sliderSetRange[259, 0, 0];
            ctrlEnable[259, false];
        };
        for [{_i = 0}, {_i < count(_str1)}, {_i = _i + 1}] do {
            ctrlSetText[245, (ctrlText 245) + (_str1 select _i)];
            sleep 0.05;
        };
        for [{_i = 0}, {_i < count(_str2)}, {_i = _i + 1}] do {
            ctrlSetText[252, (ctrlText 252) + (_str2 select _i)];
            sleep 0.05;
        };
        // Pickup
        _str1 = (format[localize "v515"]) call RPM_str_StrToArr;
        _str2 = [];
        if ("lic_pickup" in _haslics) then {
            _str2 = (format[localize "v424"]) call RPM_str_StrToArr;
            ctrlEnable[260, true];
        } else {
            _str2 = (format[localize "v425"]) call RPM_str_StrToArr;
            sliderSetRange[260, 0, 0];
            ctrlEnable[260, false];
        };
        for [{_i = 0}, {_i < count(_str1)}, {_i = _i + 1}] do {
            ctrlSetText[246, (ctrlText 246) + (_str1 select _i)];
            sleep 0.05;
        };
        for [{_i = 0}, {_i < count(_str2)}, {_i = _i + 1}] do {
            ctrlSetText[253, (ctrlText 253) + (_str2 select _i)];
            sleep 0.05;
        };
        // Truck
        _str1 = (format[localize "v516"]) call RPM_str_StrToArr;
        _str2 = [];
        if ("lic_truck" in _haslics) then {
            _str2 = (format[localize "v424"]) call RPM_str_StrToArr;
            ctrlEnable[261, true];
        } else {
            _str2 = (format[localize "v425"]) call RPM_str_StrToArr;
            sliderSetRange[261, 0, 0];
            ctrlEnable[261, false];
        };
        for [{_i = 0}, {_i < count(_str1)}, {_i = _i + 1}] do {
            ctrlSetText[247, (ctrlText 247) + (_str1 select _i)];
            sleep 0.05;
        };
        for [{_i = 0}, {_i < count(_str2)}, {_i = _i + 1}] do {
            ctrlSetText[254, (ctrlText 254) + (_str2 select _i)];
            sleep 0.05;
        };
        // Pistol
        _str1 = (format[localize "v517"]) call RPM_str_StrToArr;
        _str2 = [];
        if ("lic_pistol" in _haslics) then {
            _str2 = (format[localize "v424"]) call RPM_str_StrToArr;
            ctrlEnable[261, true];
        } else {
            _str2 = (format[localize "v425"]) call RPM_str_StrToArr;
            sliderSetRange[262, 0, 0];
            ctrlEnable[262, false];
        };
        for [{_i = 0}, {_i < count(_str1)}, {_i = _i + 1}] do {
            ctrlSetText[248, (ctrlText 248) + (_str1 select _i)];
            sleep 0.05;
        };
        for [{_i = 0}, {_i < count(_str2)}, {_i = _i + 1}] do {
            ctrlSetText[255, (ctrlText 255) + (_str2 select _i)];
            sleep 0.05;
        };
        // Rifle
        _str1 = (format[localize "v518"]) call RPM_str_StrToArr;
        _str2 = [];
        if ("lic_rifle" in _haslics) then {
            _str2 = (format[localize "v424"]) call RPM_str_StrToArr;
            ctrlEnable[263, true];
        } else {
            _str2 = (format[localize "v425"]) call RPM_str_StrToArr;
            sliderSetRange[263, 0, 0];
            ctrlEnable[263, false];
        };
        for [{_i = 0}, {_i < count(_str1)}, {_i = _i + 1}] do {
            ctrlSetText[249, (ctrlText 249) + (_str1 select _i)];
            sleep 0.05;
        };
        for [{_i = 0}, {_i < count(_str2)}, {_i = _i + 1}] do {
            ctrlSetText[256, (ctrlText 256) + (_str2 select _i)];
            sleep 0.05;
        };
        // Get selection and set button action
        _exit = false;
        while {(!(_exit))} do {
            if ((!(ctrlVisible 242)) || (isNull(_tgt)) || (!(alive _tgt)) || (_tgt distance RPM_Role >= 9) || (isNull(RPM_Role)) || (!(alive(RPM_Role)))) then {
                [] spawn {
                    while {dialog} do {
                        closeDialog 0;
                    };
                };
                b1 = false;
                _exit = true;
            };
            _sldrsel1 = floor(sliderPosition 257);
            _sldrsel2 = floor(sliderPosition 258);
            _sldrsel3 = floor(sliderPosition 259);
            _sldrsel4 = floor(sliderPosition 260);
            _sldrsel5 = floor(sliderPosition 261);
            _sldrsel6 = floor(sliderPosition 262);
            _sldrsel7 = floor(sliderPosition 263);
            if ((_sldrsel1 <= 1) && (_sldrsel2 <= 1) && (_sldrsel3 <= 1) && (_sldrsel4 <= 1) && (_sldrsel5 <= 1) && (_sldrsel6 <= 1) && (_sldrsel7 <= 1)) then {
                buttonSetAction[264, format["hint format[localize ""v519""];"]];
            } else {
                buttonSetAction[264, format["[%1, %2, %3, %4, %5, %6, %7, %8, %9] call RPM_Cfg_Licenses_Revoke;", _tgt, RPM_Role, _sldrsel1, _sldrsel2, _sldrsel3, _sldrsel4, _sldrsel5, _sldrsel6, _sldrsel7]];
            };
            sleep 0.001;
        };
        _tgt setVariable ["query", objNull, true];
        b1 = false;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Police_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private [];
        if (!(createDialog "PoliceDialog")) exitWith {
            hint format[localize "v1"];
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Police_Release_GUI = {
    private ["_ret"];
    _ret = false;
    if (b1) exitWith {};
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_i","_index","_sel","_player","_pobj","_jailed","_exit"];
        if (!(createDialog "ReleaseDialog")) exitWith {
            hint format[localize "v1"];
        };
        if (b1) exitWith {};
        b1 = true;
        _jailed = [];
        for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
            if (!(isNull(RPM_POBJArr select _i))) then {
                _player = RPM_POBJArr select _i;
                if (alive _player) then {
                    if ((name _player) call RPM_Cfg_Crimes_IsJailed) then {
                        _jailed = _jailed + [_player];
                    };
                };
            };
        };
        for [{_i = 0}, {_i < count(_jailed)}, {_i = _i + 1}] do {
            _player = _jailed select _i;
            _index = lbAdd[181, format["%1", name _player]];
            lbSetData[181, _index, format["%1", name _player]];
        };
        lbSetCurSel[181, 0];
        _exit = false;
        while {(!(_exit))} do {
            if ((!(ctrlVisible 181)) || (isNull(RPM_Role)) || (!(alive(RPM_Role)))) then {
                [] spawn {
                    while {dialog} do {
                        closeDialog 0;
                    };
                };
                b1 = false;
                _exit = true;
            };
            _sel = lbCurSel 181;
            if (_sel >= 0) then {
                _pobj = _jailed select _sel;
                buttonSetAction[182, format["[%1, %2] call RPM_Cfg_Jail_Release;", _pobj, _sel]];
            } else {
                buttonSetAction[182, ""];
            };
        };
        b1 = false;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Police_Want_GUI = {
    private ["_ret","_tgt"];
    _ret = false;
    if (b1) exitWith {};
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _tgt = _this;
    if ((isNull(_tgt)) || (!(alive(_tgt)))) exitWith {
        hint format[localize "v2"];
        closeDialog 0;
    };
    if (_tgt == RPM_Role) exitWith {
        hint format[localize "v480"];
        closeDialog 0;
    };
    if ((name _tgt) call RPM_Cfg_Crimes_IsJailed) exitWith {
        hint format[localize "v404", name _tgt];
        closeDialog 0;
    };
    _this spawn {
        private ["_i","_type","_index3","_index4","_index5","_ttime","_sel0time","_sel1time","_sel2time","_tgt","_sel0","_sel1","_sel2","_time","_index0","_index1","_index2","_sel0cost","_sel1cost","_sel2cost","_totcost","_exit"];
        if (!(createDialog "WantDialog")) exitWith {
            hint format[localize "v1"];
        };
        if (b1) exitWith {};
        b1 = true;
        _tgt = _this;
        _index0 = lbAdd[233, format[localize "v419"]];
        lbSetData[233, _index0, format[localize "v419"]];
        _index1 = lbAdd[234, format[localize "v419"]];
        lbSetData[234, _index1, format[localize "v419"]];
        _index2 = lbAdd[235, format[localize "v419"]];
        lbSetData[235, _index2, format[localize "v419"]];
        for [{_i = 0}, {_i < count(a62)}, {_i = _i + 1}] do {
            _type = format["%1 (%2)", ((a62 select _i) select 0), round(((a62 select _i) select 2) / 60)];
            _index3 = lbAdd[233, _type];
            lbSetData[233, _index3, _type];
            _index4 = lbAdd[234, _type];
            lbSetData[234, _index4, _type];
            _index5 = lbAdd[235, _type];
            lbSetData[235, _index5, _type];
        };
        lbSetCurSel[233, 0];
        lbSetCurSel[234, 0];
        lbSetCurSel[235, 0];
        ctrlSetText[239, format["%1 (%2)", _tgt, name _tgt]];
        _exit = false;
        while {(!(_exit))} do {
            if (!(ctrlVisible 233)) then {
                b1 = false;
                _exit = true;
            };
            if ((!((ctrlText 236) call RPM_str_IsNumeric)) || ((ctrlText 236) call RPM_str_StrToInt) >= 61) then {
                ctrlSetText[236, "1"];
            };
            _sel0 = lbCurSel 233;
            _sel1 = lbCurSel 234;
            _sel2 = lbCurSel 235;
            _time = ((ctrlText 236) call RPM_str_StrToInt);
            if ((_sel0 >= 1) || (_sel1 >= 1) || (_sel2 >= 1)) then {
                if (_time == 0) then {
                    ctrlSetText[236, "1"];
                };
                if (((ctrlText 236) call RPM_str_Length) > 2) then {
                    _ttime = [(_time call RPM_str_IntToStr), 0, 2] call RPM_str_SubString;
                    ctrlSetText[236, format["%1", _ttime]];
                };
                _ttime = 0;
                _sel0time = 0;
                _sel1time = 0;
                _sel2time = 0;
                _sel0cost = 0;
                _sel1cost = 0;
                _sel2cost = 0;
                if (_sel0 >= 1) then {
                    _sel0time = ((a62 select (_sel0 - 1))) select 2;
                    _sel0cost = ((a62 select (_sel0 - 1))) select 1;
                };
                if (_sel1 >= 1) then {
                    _sel1time = ((a62 select (_sel1 - 1))) select 2;
                    _sel1cost = ((a62 select (_sel1 - 1))) select 1;
                };
                if (_sel2 >= 1) then {
                    _sel2time = ((a62 select (_sel2 - 1))) select 2;
                    _sel2cost = ((a62 select (_sel2 - 1))) select 1;
                };
                _totcost = format["%1", _sel0cost + _sel1cost + _sel2cost];
                if (ctrlText 240 != _totcost) then {
                    ctrlSetText[240, _totcost];
                };
                _ttime = round((_sel0time + _sel1time + _sel2time) / 60);
                ctrlSetText[236, format["%1", _ttime]];
                if (!(b1)) then {
                    buttonSetAction[237, format["[%1, %2, %3, lbCurSel 233, lbCurSel 234, lbCurSel 235] call RPM_Cfg_Crimes_Want;", _tgt, RPM_Role, (ctrlText 236 call RPM_str_strToInt) * 60]];
                } else {
                    buttonSetAction[237, ""];
                };
            } else {
                if (_time > 0) then {
                    ctrlSetText[236, "0"];
                };
                buttonSetAction[237, format["if (%1) then {
                    hint format[localize ""v386""];
                };", (_sel0 == 0) && (_sel1 == 0) && (_sel2 == 0)]];
            };
            sleep 0.001;
        };
        b1 = false;
    };
    _ret;
};
RPM_Cfg_Police_Wanted_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_sel","_pobj","_wanted","_h","_exit"];
        if (!(createDialog "WantedDialog")) exitWith {
            hint format[localize "v1"];
        };
        _h = call RPM_Cfg_Police_Wanted_RepaintListBox;
        waitUntil {_h};
        _exit = false;
        while {(!(_exit))} do {
            _wanted = call RPM_Cfg_Objects_GetWanted;
            _sel = lbCurSel 183;
            if (ctrlVisible 183) then {
                if (lbSize 183 == 0) then {
                    _h = call RPM_Cfg_Police_Wanted_RepaintListBox;
                    waitUntil {_h};
                };
                if ((_sel >= 0) && (!(b1))) then {
                    _pobj = [lbData[183, _sel]] call RPM_Cfg_Objects_GetObject;
                    if (!(isNull(_pobj))) then {
                        if (!(_pobj in _wanted)) then {
                            if (ctrlText 184 != "Want") then {
                                ctrlSetText[184, "Want"];
                            };
                            buttonSetAction[184, format["%1 call RPM_Cfg_Police_Want_GUI;", _pobj]];
                        } else {
                            if (ctrlText 184 != "Unwant") then {
                                ctrlSetText[184, "Unwant"];
                            };
                            buttonSetAction[184, format["%1 call RPM_Cfg_Crimes_Unwanted;", [_pobj, _sel]]];
                        };
                    } else {
                        _h = call RPM_Cfg_Police_Wanted_RepaintListBox;
                        waitUntil {_h};
                        buttonSetAction[184, ""];
                    };
                } else {
                    buttonSetAction[184, ""];
                };
            };
            sleep 0.001;
            if (((!(ctrlVisible 183)) && (!(ctrlVisible 233))) || ((isNull(RPM_Role)) || (!(alive(RPM_Role)))))  then {
                b1 = false;
                _exit = true;
            };
        };
        b1 = false;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Police_Wanted_RepaintListBox = {
    private ["_i","_player","_index","_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    lbClear 183;
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            _player = RPM_POBJArr select _i;
            _index = lbAdd[183, format["%1 (%2)", _player, name _player]];
            lbSetData[183, _index, format["%1", name _player]];
        };
    };
    lbSetCurSel[183, 0];
    _ret = true;
    _ret;
};
RPM_Cfg_Police_Arrest = {
    private ["_ret","_tgt"];
    _ret = false;
    if (b1) exitWith {};
    _tgt = _this select 0;
    if ((isNull(_tgt)) || (!(alive(_tgt))) || (isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {
        closeDialog 0;
    };
    if (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUse) && (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {};
    if (_tgt == RPM_Role) exitWith {
        hint format[localize "v479"];
        closeDialog 0;
    };
    if ((name _tgt) call RPM_Cfg_Crimes_IsJailed) exitWith {
        hint format[localize "v404", name _tgt];
        closeDialog 0;
    };
    _tgt spawn {
        private ["_i","_type","_index0","_index1","_index2","_sel0","_sel1","_sel2","_index3","_index4","_index5","_time","_ttime","_tgt","_sel0time","_sel1time","_sel2time","_exit"];
        _tgt = _this;
        if (!(createDialog "ArrestDialog")) exitWith {
            hint format[localize "v1"];
        };
        b1 = true;
        _index0 = lbAdd[152, format[localize "v419"]];
        lbSetData[152, _index0, format[localize "v419"]];
        _index1 = lbAdd[153, format[localize "v419"]];
        lbSetData[153, _index1, format[localize "v419"]];
        _index2 = lbAdd[154, format[localize "v419"]];
        lbSetData[154, _index2, format[localize "v419"]];
        for [{_i = 0}, {_i < count(a62)}, {_i = _i + 1}] do {
            _type = format["%1 (%2)", ((a62 select _i) select 0), round(((a62 select _i) select 2) / 60)];
            _index3 = lbAdd[152, _type];
            lbSetData[152, _index3, _type];
            _index4 = lbAdd[153, _type];
            lbSetData[153, _index4, _type];
            _index5 = lbAdd[154, _type];
            lbSetData[154, _index5, _type];
        };
        lbSetCurSel[152, 0];
        lbSetCurSel[153, 0];
        lbSetCurSel[154, 0];
        _exit = false;
        while {(!(_exit))} do {
            if ((!(ctrlVisible 152)) || (isNull(_tgt)) || (!(alive _tgt)) || (_tgt distance RPM_Role >= 9) || (isNull(RPM_Role)) || (!(alive(RPM_Role)))) then {
                [] spawn {
                    while {dialog} do {
                        closeDialog 0;
                    };
                };
                b1 = false;
                _exit = true;
            };
            if ((!((ctrlText 155) call RPM_str_IsNumeric)) || ((ctrlText 155) call RPM_str_StrToInt) >= 61) then {
                ctrlSetText[155, "1"];
            };
            _sel0 = lbCurSel 152;
            _sel1 = lbCurSel 153;
            _sel2 = lbCurSel 154;
            _time = ((ctrlText 155) call RPM_str_StrToInt);
            if ((_sel0 >= 1) || (_sel1 >= 1) || (_sel2 >= 1)) then {
                if (_time == 0) then {
                    ctrlSetText[155, "1"];
                };
                if (((ctrlText 155) call RPM_str_Length) > 2) then {
                    _ttime = [(_time call RPM_str_IntToStr), 0, 2] call RPM_str_SubString;
                    ctrlSetText[155, format["%1", _ttime]];
                };
                _ttime = 0;
                _sel0time = 0;
                _sel1time = 0;
                _sel2time = 0;
                if (_sel0 >= 1) then {
                    _sel0time = ((a62 select (_sel0 - 1))) select 2;
                };
                if (_sel1 >= 1) then {
                    _sel1time = ((a62 select (_sel1 - 1))) select 2;
                };
                if (_sel2 >= 1) then {
                    _sel2time = ((a62 select (_sel2 - 1))) select 2;
                };
                _ttime = round((_sel0time + _sel1time + _sel2time) / 60);
                ctrlSetText[155, format["%1", _ttime]];
                buttonSetAction[156, format["[%1, %2, %3, lbCurSel 152, lbCurSel 153, lbCurSel 154] call RPM_Cfg_Police_ArrestCiv;", _tgt, RPM_Role, (ctrlText 155 call RPM_str_strToInt) * 60]];
            } else {
                if (_time > 0) then {
                    ctrlSetText[155, "0"];
                };
                buttonSetAction[156, format["if (%1) then {
                    hint format[localize ""v386""];
                };", (_sel0 == 0) && (_sel1 == 0) && (_sel2 == 0)]];
            };
            sleep 0.001;
        };
        b1 = false;
    };
    _ret;
};
RPM_Cfg_Police_Ticket = {
    private ["_ret","_tgt"];
    _ret = false;
    if (b1) exitWith {};
    _tgt = _this select 0;
    if ((isNull(_tgt)) || (!(alive _tgt)) || (isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUse) && (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {};
    if (_tgt == RPM_Role) exitWith {
        hint format[localize "v478"];
        closeDialog 0;
    };
    if ((name _tgt) call RPM_Cfg_Crimes_IsJailed) exitWith {
        hint format[localize "v416", name _tgt];
        closeDialog 0;
    };
    _tgt spawn {
        private ["_i","_type","_index0","_index1","_index2","_sel0","_sel1","_sel2","_sel0cost","_sel1cost","_sel2cost","_tcost","_cost","_tgt","_exit"];
        if (!(createDialog "TicketIssueDialog")) exitWith {
            hint format[localize "v1"];
        };
        b1 = true;
        _tgt = _this;
        if ((isNull(_tgt)) || (!(alive _tgt)) || (isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
        _index0 = lbAdd[157, format[localize "v419"]];
        lbSetData[157, _index0, format[localize "v419"]];
        _index1 = lbAdd[158, format[localize "v419"]];
        lbSetData[158, _index0, format[localize "v419"]];
        _index2 = lbAdd[159, format[localize "v419"]];
        lbSetData[159, _index0, format[localize "v419"]];
        for [{_i = 0}, {_i < count(a59)}, {_i = _i + 1}] do {
            _type = format["%1 ($%2)", ((a59 select _i) select 0), ((a59 select _i) select 1)];
            _index0 = lbAdd[157, _type];
            lbSetData[157, _index0, _type];
            _index1 = lbAdd[158, _type];
            lbSetData[158, _index1, _type];
            _index2 = lbAdd[159, _type];
            lbSetData[159, _index2, _type];
        };
        lbSetCurSel[157, 0];
        lbSetCurSel[158, 0];
        lbSetCurSel[159, 0];
        _exit = false;
        while {(!(_exit))} do {
            if ((!(ctrlVisible 157)) || (isNull(_tgt)) || (!(alive _tgt)) || (_tgt distance RPM_Role >= 9) || (isNull(RPM_Role)) || (!(alive(RPM_Role)))) then {
                [] spawn {
                    while {dialog} do {
                        closeDialog 0;
                    };
                };
                b1 = false;
                _exit = true;
            };
            if ((!((ctrlText 160) call RPM_str_IsNumeric)) || ((ctrlText 160) call RPM_str_StrToInt) >= RPM_MAX_NUMBER) then {
                ctrlSetText[160, "1"];
            };
            _sel0 = lbCurSel 157;
            _sel1 = lbCurSel 158;
            _sel2 = lbCurSel 159;
            _cost = ((ctrlText 160) call RPM_str_StrToInt);
            if ((_sel0 >= 1) || (_sel1 >= 1) || (_sel2 >= 1)) then {
                if (_cost == 0) then {
                    ctrlSetText[160, "1"];
                };
                if (((ctrlText 160) call RPM_str_Length) > 2) then {
                    _tcost = [(160 call RPM_str_IntToStr), 0, 2] call RPM_str_SubString;
                    ctrlSetText[160, format["%1", _tcost]];
                };
                _tcost = 0;
                _sel0cost = 0;
                _sel1cost = 0;
                _sel2cost = 0;
                if (_sel0 >= 1) then {
                    _sel0cost = ((a59 select (_sel0 - 1))) select 1;
                };
                if (_sel1 >= 1) then {
                    _sel1cost = ((a59 select (_sel1 - 1))) select 1;
                };
                if (_sel2 >= 1) then {
                    _sel2cost = ((a59 select (_sel2 - 1))) select 1;
                };
                _tcost = round(_sel0cost + _sel1cost + _sel2cost);
                ctrlSetText[160, format["%1", _tcost]];
                buttonSetAction[161, format["[%1, %2, %3, lbCurSel 157, lbCurSel 158, lbCurSel 159] call RPM_Cfg_Police_TicketCiv;", _this, RPM_Role, _tcost]];
            } else {
                if (_cost > 0) then {
                    ctrlSetText[160, "0"];
                };
                buttonSetAction[161, format["if (%1) then {
                    hint format[localize ""v386""];
                };", (_sel0 == 0) && (_sel1 == 0) && (_sel2 == 0)]];
            };
            sleep 0.001;
        };
        b1 = false;
    };
    _ret;
};
RPM_Cfg_Police_Ticketed = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_crimes1","_crimes2","_crimes3","_exit","_crime1","_crime2","_crime3","_amount","_src","_bounty","_playername","_paid","_nocash"];
        if (!(b32)) then {
            b32 = true;
            if (!(createDialog "TicketReceiveDialog")) exitWith {
                hint format[localize "v1"];
                b32 = false;
            };
            _src = _this select 0;
            _amount = _this select 1;
            _crime1 = _this select 2;
            _crime2 = _this select 3;
            _crime3 = _this select 4;
            if (_crime1 >= 1) then {
                _crimes1 = (a59 select _crime1-1) select 0;
                ctrlSetText[168, format["1.) %1", _crimes1]];
            };
            if (_crime2 >= 1) then {
                _crimes2 = (a59 select _crime2-1) select 0;
                ctrlSetText[169, format["1.) %1", _crimes2]];
            };
            if (_crime3 >= 1) then {
                _crimes3 = (a59 select _crime3-1) select 0;
                ctrlSetText[170, format["1.) %1", _crimes3]];
            };
            ctrlSetText[167, format["%1", _amount]];
            buttonSetAction[171, format["a54=[1];"]];
            buttonSetAction[172, format["a54=[2];"]];
            _exit = false;
            _paid = false;
            _nocash = false;
            while {(!(_exit))} do {
                if ((isNull(RPM_Role)) || (!(alive(RPM_Role)))) then {
                    a54 = [];
                    b32 = false;
                    _exit = true;
                };
                if (a54 select 0 == 2) then {
                    hint format[localize "v390"];
                    format["if (RPM_Role == %1) then {
                        hint ""%2"";
                    }", _src, format[localize "v391", name RPM_Role]] call RPM_Cfg_Network_Broadcast;
                    _playername = name RPM_Role;
                    _bounty = _playername call RPM_Cfg_Crimes_GetBounty;
                    if (i21 > 100) then {
                        _bounty = round(_bounty + 100);
                        format["if (i21 - 100 >= 0) then {
                            if (i21 >= 100) then {
                                i21 = i21 - 100;
                            } else {
                                i21 = 0;
                            };
                        };"] call RPM_Cfg_Network_Broadcast;
                    };
                    [_playername, _bounty, round((_playername call RPM_Cfg_Crimes_GetTime) + ((a62 select 7) select 1)), false] call RPM_Cfg_Crimes_SetWanted;
                    a54 = [];
                    b32 = false;
                    closeDialog 0;
                    _exit = true;
                };
                if (a54 select 0 == 1) then {
                    if (([521] call RPM_Cfg_Inv_GetItemAmount) < _amount) then {
                        hint format["The ticket is $%1!"];
                        format["if (RPM_Role == %1) then {
                            hint ""%2"";
                        }", _src, format[localize "v392", name RPM_Role]] call RPM_Cfg_Network_Broadcast;
                        a54 = [];
                        b32 = false;
                        closeDialog 0;
                        _paid = true;
                        _nocash = true;
                        _exit = true;
                    } else {
                        if ([521, _amount] call RPM_Cfg_Inv_DelItemAmount) then {
                            hint format[localize "v394", _src, name _src, _amount];
                            format["if (%3 > 1) then {
                                i21 = i21 + %3;
                            };
                            if (RPM_Role == %1) then {
                                hint ""%2"";
                                [521, %3] call RPM_Cfg_Inv_AddItemAmount;
                            }", _src, format[localize "v393", name RPM_Role], round(_amount * 0.5)] call RPM_Cfg_Network_Broadcast;
                            a54 = [];
                            b32 = false;
                            closeDialog 0;
                            _paid = true;
                            _exit = true;
                        };
                    }
                };
                if ((!(_exit)) && (!(ctrlVisible 168))) then {
                    hint format[localize "v390"];
                    if ((!(_paid)) && (!(_nocash))) then {
                        format["if (RPM_Role == %1) then {
                            hint ""%2"";
                        }", _src, format[localize "v391", name RPM_Role]] call RPM_Cfg_Network_Broadcast;
                        a54 = [];
                        b32 = false;
                        closeDialog 0;
						["Ticketed", RPM_Role, [format["%1", _amount], name _src]] spawn RPM_Cfg_Logs_AddLog;
                        _exit = true;
                    };
                };
                sleep 0.001;
            };
            a54 = [];
            b32 = false;
        };
    };
    _ret;
};
RPM_Cfg_Crimes_RepaintListBoxes = {
    private ["_i","_title","_type","_index0","_index1","_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    lbClear 104;
    lbClear 105;
    if (count(a7) == 0) then {
        _index0 = lbAdd[104, format[localize "v419"]];
        lbSetData[104, _index0, format[localize "v419"]];
        _index1 = lbAdd[105, "N/A"];
        lbSetData[105, _index1, "N/A"];
        _ret = true;
    } else {
        for [{_i = 0}, {_i < count(a7)}, {_i = _i + 1}] do {
            _title = (a7 select _i) select 0;
            _type = a8 select ((a7 select _i) select 1);
            _index0 = lbAdd[104, _title];
            lbSetData[104, _index0, _title];
            _index1 = lbAdd[105, _type];
            lbSetData[105, _index1, _type];
        };
    };
    if (lbSize 104 > 0) then {
        lbSetCurSel[104, 0];
        lbSetCurSel[105, 0];
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Screen_Police = {
    private ["_ret","_tgt"];
    _ret = false;
    if (b1) exitWith {};
    _tgt = _this select 0;
    if ((isNull(_tgt)) || (!(alive _tgt)) || (isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUse) && (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {};
    if (_tgt == RPM_Role) exitWith {
        hint format[localize "v170"];
    };
    b1 = true;
    hint format[localize "v32"];
    b1 = false;
    _ret = true;
    _ret;
};
RPM_Cfg_Search_Police = {
    private ["_ret","_tgt","_exit","_var"];
    _ret = false;
    if (b1) exitWith {};
    _tgt = _this select 0;
    if ((isNull(_tgt)) || (!(alive _tgt)) || (isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUse) && (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {};
    if (_tgt == RPM_Role) exitWith {
        hint format[localize "v170"];
    };
    if (!((animationState RPM_Role) in RPM_SearchAnims)) exitWith {
        hint format[localize "STRM_Search_Valid", name _tgt];
    };
    if ((!((animationState _tgt) in a43)) && ((animationState _tgt) != "amovpercmstpssurwnondnon")) exitWith {
        hint format[localize "v531", _tgt, name _tgt];
    };
    _exit = false;
    b1 = true;
    _var = _tgt getVariable "search";
    if (!(isNil("_var"))) then {
        hint format[localize "v38", _tgt];
        b1 = false;
        _exit = true;
    };
    if (!(_exit)) then {
        format["if (!(isDedicated)) then {
            if (RPM_Role == %1) then {
                call RPM_Cfg_Search_SetSearchArr;
            };
        }; ", _tgt] call RPM_Cfg_Network_Broadcast;
    };
    if (!(_exit)) then {
        _tgt spawn {
            private ["_vararr","_gotvar","_var","_tgt","_sel0","_sel1","_sel2","_h","_exit"];
            _tgt = _this;
            _gotvar = false;
            _vararr = [];
            if ((isNull(_tgt)) || (!(alive _tgt))) exitWith {
                b1 = false;
            };
            if (RPM_Diagnostics) then {
                [format["RPM(Police)|Searched|%1|%2", _tgt, RPM_Role], true] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            _exit = false;
            while {(!(_exit))} do {
                _var = _tgt getVariable "search";
                if (!(isNil("_var"))) then {
                    _vararr = + (_var);
                    _gotvar = true;
                    b1 = false;
                    _exit = true;
                };
            };
            if (_gotvar) then {
                _tgt setVariable ["search", nil, true];
                RPM_InvTmpArr = [];
                RPM_InvTmpArr = [_tgt, _vararr] call RPM_Cfg_Search_CompileInvArr;
                if (count(RPM_InvTmpArr) == 0) exitWith {
                    hint format[localize "v118", _tgt, name _tgt];
                    b1 = false;
                };
                if (!(createDialog "SearchDialog")) exitWith {
                    hint format[localize "v1"];
                    b1 = false;
                };
                ctrlShow[189, true];
                ctrlShow[191, true];
                ctrlShow[193, true];
                ctrlSetText[188, format["%1 (%2)", format["%1", _tgt], name _tgt]];
                _h = [0] call RPM_Cfg_Search_RepaintListBox;
                waitUntil {_h};
                _exit = false;
                while {(!(_exit))} do {
                    if (((!((animationState _tgt) in a43)) && ((animationState _tgt) != "amovpercmstpssurwnondnon")) || (isNull(_tgt)) || (!(alive _tgt)) || (_tgt distance RPM_Role >= 9) || (isNull(RPM_Role)) || (!(alive(RPM_Role)))) then {
                        [] spawn {
                            while {dialog} do {
                                closeDialog 0;
                            };
                        };
                        b1 = false;
                        _exit = true;
                    };
                    if (!(_exit)) then {
                        if ((!(ctrlVisible 188))) then {
                            b1 = false;
                            _exit = true;
                        };
                    };
                    if (!(_exit)) then {
                        if ((!((ctrlText 189) call RPM_str_IsNumeric)) || ((ctrlText 189) call RPM_str_StrToInt) >= RPM_MAX_NUMBER) then {
                            ctrlSetText[189, "1"];
                        };
                        _sel0 = lbCurSel 190;
                        _sel1 = lbCurSel 191;
                        _sel2 = lbCurSel 192;
                        if ((_sel1 != _sel0) || (_sel2 != _sel0)) then {
                            lbSetCurSel[190, _sel0];
                            lbSetCurSel[191, _sel0];
                            lbSetCurSel[192, _sel0];
                        };
                        if (_sel0 >= 0) then {
                            buttonSetAction[193, format["[%1, %2, %3] call RPM_Cfg_Search_Destroy;", _sel0, ctrlText 189, _tgt]];
                        } else {
                            buttonSetAction[193, ""];
                        };
                    };
                    sleep 0.001;
                };
                RPM_InvTmpArr = [];
                b1 = false;
            };
            b1 = false;
        };
    };
    _ret;
};
RPM_Cfg_Search_RepaintListBox = {
    private ["_sel","_i","_itemid","_itemname","_index0","_ret","_tmparr","_c","_idx","_curamount","_newamount","_wep","_tgtweps","_invwepsarr","_line","_weightstr","_amountstr"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _sel = _this select 0;
    lbClear 190;
    if (count(RPM_InvTmpArr) >= 1) then {
        for [{_i = 0}, {_i < count(RPM_InvTmpArr)}, {_i = _i + 1}] do {
            // Item
            _line = "";
            _itemid = (RPM_InvTmpArr select _i) select 0;
            _itemname = [_itemid] call RPM_Cfg_Items_GetName;
            _itemname = format["%1", [([_itemid] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetName];
            // Weight
            _weightstr = format["%1kg", (([([_itemid] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * ((RPM_InvTmpArr select _i) select 1)];
            // Qty
            _amountstr = format["%1", (RPM_InvTmpArr select _i) select 1];
            _line = _line + _itemname + " (" + _weightstr + ", " + _amountstr + ")";
            _index0 = lbAdd[190, _line];
            lbSetData[190, _index0, _line];
            
        };
        lbSetCurSel[190, _sel];
        _tgtweps = +(weapons RPM_Role) + +(magazines RPM_Role);
        {
            for [{_i = 0}, {_i < count(_tgtweps)}, {_i = _i + 1}] do {
                if (_x == (_tgtweps select _i)) then {
                    _tgtweps set[_i, -1];
                    _tgtweps = _tgtweps - [-1];
                };
            };
        } forEach a30;
        for [{_i = 0}, {_i < count(_tgtweps)}, {_i = _i + 1}] do {
            _wep = _tgtweps select _i;
            if (isNil("_invwepsarr")) then {
                _tmparr = [_wep, 1];
                _invwepsarr = [];
                _invwepsarr set[0, _tmparr];
            } else {
                _idx = -1;
                for [{_c = 0}, {_c < count(_invwepsarr)}, {_c = _c + 1}] do {
                    if (((_invwepsarr select _c) select 0) == _wep) then {
                        _idx = _c;
                    };
                };
                if (_idx != -1) then {
                    _curamount = (_invwepsarr select _idx) select 1;
                    _newamount = _curamount + 1;
                    _tmparr = [_wep, _newamount];
                    _invwepsarr set[_idx, _tmparr];
                } else {
                    _tmparr = [_wep, 1];
                    _invwepsarr set[count(_invwepsarr), _tmparr];
                };
            };
        };
    };
    _ret = true;
    _ret;
};
