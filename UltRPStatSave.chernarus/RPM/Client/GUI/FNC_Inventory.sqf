// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Inventory
RPM_Cfg_Inv_Rules_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_i","_line","_index"];
        if (!(createDialog "RulesDialog")) exitWith {
            hint format[localize "v1"];
        };
        for [{_i = 0}, {_i < count(a66)}, {_i = _i + 1}] do {
            _line = a66 select _i;
            _index = lbAdd[187, format["%1", _line]];
            lbSetData[187, _index, format["%1", _line]];
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_GUI = {
    private ["_ret"];
    _ret = false;
    if (((isNull(RPM_Role)) || (!(alive RPM_Role))) || (b50)) exitWith {};
    [] spawn {
        private ["_i","_ownweight","_index0","_str","_obj","_tgt","_sel0","_h"];
        if (!(createDialog "InventoryDialog")) exitWith {
            hint format[localize "v1"];
        };
        if (RPM_Civ) then {
            ctrlShow[8, false];
        };
        buttonSetAction[180, format["call RPM_Cfg_Inv_Rules_GUI;"]];
        for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
            _obj = RPM_POBJArr select _i;
            if ([_obj] call RPM_Cfg_Objects_IsUnit) then {
                _str = format["%1 (%2)", RPM_PSTRArr select _i, name _obj];
                _index0 = lbAdd[3, _str];
                lbSetData[3, _index0, format["%1", _obj]];
            };
        };
        lbSetCurSel[3, 0];
        _h = call RPM_Cfg_Inv_RepaintListbox;
        waitUntil {_h};
        if (count(a19) != 0) then {
            lbSetCurSel[5, 0];
            lbSetCurSel[6, 0];
            lbSetCurSel[7, 0];
        };
        while {true} do {
            if (ctrlVisible 2) then {
                if ((!((ctrlText 4) call RPM_str_IsNumeric)) || ((ctrlText 4) call RPM_str_StrToInt) >= RPM_MAX_NUMBER) then {
                    ctrlSetText[4, "1"];
                };
                _tgt = lbCurSel 3;
                _sel0 = lbCurSel 5;
                _ownweight = format["Weight: %1kg/%2kg", ((call RPM_Cfg_Inv_GetOwnWeight) call RPM_str_IntToStr), i0];
                ctrlSetText [2, _ownweight];
                if (b1) then {
                    _h = [_sel0] call RPM_Cfg_Inv_RepaintListbox;
                    waitUntil {_h};
                    b1 = false;
                };
                if ((_sel0 >= 0) and (_tgt >= 0)) then {
                    buttonSetAction[9, format['[%1, %2, %3] call RPM_Cfg_Inv_Use', lbCurSel 5, ctrlText 4, format["%1", lbData[3, lbCurSel 3]]]];
                    buttonSetAction[10, format['[%1, %2, %3] call RPM_Cfg_Inv_Give',lbCurSel 5, ctrlText 4, format["%1", lbData[3, lbCurSel 3]]]];
                    buttonSetAction[11, format['[%1, %2, %3] call RPM_Cfg_Inv_Drop',lbCurSel 5, ctrlText 4, format["%1", lbData[3, lbCurSel 3]]]];
                };
            };
            if (!(dialog)) exitWith {};
            sleep 0.001;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_RepaintListbox = {
    private ["_i","_itemname","_ret","_line","_weightstr","_amountstr","_index0"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    lbClear 5;
    for [{_i = 0}, {_i < count(a19)}, {_i = _i + 1}] do {
        // Item
        _line = "";
        if (((a19 select _i) select 1) >= 1) then {
            _itemname = [((a19 select _i) select 0)] call RPM_Cfg_Items_GetName;
            _weightstr = format["%1kg", (([((a19 select _i) select 0)] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * ((a19 select _i) select 1)];
            _amountstr = format["%1", ((a19 select _i) select 1)];
            _line = _line + _itemname + " (" + _weightstr + ", " + _amountstr + ")";
            _index0 = lbAdd[5, _line];
            lbSetValue[5, _index0, _line];
        };
    };
    lbSetCurSel[5, 0];
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_Animations_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (vehicle RPM_Role != RPM_Role) exitWith {
        hint format[localize "v165"];
    };
    [] spawn {
        private ["_i","_name","_anim","_index","_sel","_mode"];
        if (!(createDialog "AnimationsDialog")) exitWith {
            hint format[localize "v1"];
        };
        for [{_i = 0}, {_i < count(a3)}, {_i = _i + 1}] do {
            _name = (a3 select _i) select 0;
            _index = lbAdd[68, _name];
            lbSetData[68, _index, _name];
        };
        lbSetCurSel[68, 0];
        while {ctrlVisible 68} do {
            _sel = lbCurSel 68;
            if (_sel >= 0) then {
                _anim = (a3 select _sel) select 1;
                _mode = (a3 select _sel) select 2;
                if (_mode == 0) then {
                    buttonSetAction[69, format['["%1", %2] call RPM_Cfg_Inv_PlayMove', _anim, true]];
                } else {
                    buttonSetAction[69, format['["%1", %2] call RPM_Cfg_Inv_PlayMove', _anim, true]];
                };
            };
            sleep 0.001;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_Settings_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_pos","_vehi","_currentVD","_i","_string","_index","_msgsel","_currentTG"];
        disableSerialization;
        if (!(createDialog "SettingsDialog")) exitWith {
            hint format[localize "v1"];
        };
        MenuAction = -1;
        SliderSetRange[13003,1,i13];
        SliderSetRange[13002,1,i12];
        SliderSetPosition[13003,i6];
        SliderSetPosition[13002,i5];
        _currentVD = i6;
        _currentTG = i5;
        lbClear 13000;
        for [{_i = 0}, {_i < count(RPM_MessagesArray)}, {_i = _i + 1}] do {
            _string = (RPM_MessagesArray select _i) select 0;
            _index = lbAdd[13000, _string];
            lbSetData[13000, _index, _string];
        };
        lbSetCurSel[13000, 0];
        while {((alive RPM_Role) && (ctrlVisible 13000))} do {
            _currentVD = floor(sliderPosition 13003);
            _currentTG = floor(sliderPosition 13002);
            if (MenuAction == 0) then {
                MenuAction = -1;
                closeDialog 0;
                titleCut["","BLACK FADED",0];
                _pos = position RPM_Role;
                _vehi = "Lada1" createVehicle [0,0,0];
                RPM_Role moveInCargo _vehi;
                [_vehi, 0] spawn RPM_Cfg_Vehicle_Delete;
                RPM_Role setPos _pos;
                titleCut["","BLACK IN",5];
            };
            if (i6 != _currentVD) then {
                [_currentVD] spawn {
                    private [];
                    setViewDistance (_this select 0);
                    i6 = (_this select 0);
                };
            };
            if (i5 != _currentTG) then {
                [_currentTG] spawn {
                    private [];
                    setTerrainGrid (_this select 0);
                    i5 = (_this select 0);
                };
            };
            _msgsel = lbCurSel 13000;
            if (_msgsel >= 0) then {
                buttonSetAction[13001, format["[%1] call RPM_Cfg_Inv_MsgDisable", _msgsel]];
            };
            sleep 0.1;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_Crimelog_Compose_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_i","_index","_playerstr"];
        if (!(createDialog "CrimeLogComposeDialog")) exitWith {
            hint format[localize "v1"];
        };
        for [{_i = 0}, {_i < count(a8)}, {_i = _i + 1}] do {
            if ((_i != 10) && (_i != 11)) then {
                _index = lbAdd[110, a8 select _i];
                lbSetData[110, _index, a8 select _i];
            };
        };
        lbSetCurSel[110, 0];
        _index = lbAdd[111, format[localize "v419"]];
        lbSetData[111, _index, format[localize "v419"]];
        for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
            if (!(isNull(RPM_POBJArr select _i))) then {
                _playerstr = format["%1 (%2)", RPM_POBJArr select _i, name (RPM_POBJArr select _i)];
                _index = lbAdd[111, _playerstr];
                lbSetData[111, _index, _playerstr];
            };
        };
        lbSetCurSel[111, 0];
        while {ctrlVisible 109} do {
            buttonSetAction[113, format["[""%1"", %2, %3, ""%4"", %5, true] call RPM_Cfg_Crimes_AddMessage;", ctrlText 109, lbCurSel 110, lbCurSel 111, ctrlText 112, RPM_Role]];
            sleep 0.001;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_Crimelog_Read_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_sel","_title","_type","_target","_message","_submitter"];
        _sel = _this select 0;
        if (!(createDialog "CrimeLogReadDialog")) exitWith {
            hint format[localize "v1"];
        };
        if ((RPM_Cop) && (!(name RPM_Role call RPM_Cfg_Crimes_IsJailed)) && (!(name RPM_Role call RPM_Cfg_Crimes_IsWanted))) then {
            buttonSetAction[122, format["[%1] call RPM_Cfg_Crimes_DelMessage;", _sel]];
        } else {
            ctrlShow[121, false];
            ctrlShow[122, false];
        };
        if ((count(a7) < _sel)) exitWith {
            hint format[localize "v12"];
            closeDialog 0;
        };
        _title = (a7 select _sel) select 0;
        ctrlSetText[115, _title];
        _type = a8 select ((a7 select _sel) select 1);
        ctrlSetText[116, _type];
        _target = (a7 select _sel) select 2;
        if (_target != format[localize "v419"]) then {
            ctrlSetText[123, _target];
        };
        _message = (a7 select _sel) select 3;
        ctrlSetText[120, _message];
        _submitter = format[localize "v419"];
        if ((((a7 select _sel) select 4) call RPM_str_Length) >= 1) then {
            _submitter = (a7 select _sel) select 4;
        };
        ctrlSetText[118, format["%1", _submitter]];
        if (RPM_Cop) then {
            while {ctrlVisible 115} do {
                if (_submitter == "System") then {
                    buttonSetAction[121, format["hint ""%1"";", format[localize "v405"]]];
                } else {
                    buttonSetAction[121, format["[%1, ""%2""] call RPM_Cfg_Crimes_UpdateMessage", _sel, ctrlText 120]];
                };
                sleep 0.001;
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_Crimelog_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_titlesel","_typesel","_h"];
        if (!(createDialog "CrimeLogDialog")) exitWith {
            hint format[localize "v1"];
        };
        buttonSetAction[106, ""];
        if ((RPM_Civ) || (name RPM_Role call RPM_Cfg_Crimes_IsJailed) || (name RPM_Role call RPM_Cfg_Crimes_IsWanted)) then {
            ctrlShow[107, false];
            ctrlShow[108, false];
        };
        _h = call RPM_Cfg_Crimes_RepaintListBoxes;
        waitUntil {_h};
        while {(true)} do {
            if (lbSize 104 == 0) then {
                buttonSetAction[108, ""];
            };
            if ((ctrlVisible 104) && (!(ctrlVisible 110)) && (!(ctrlVisible 114))) then {
                _titlesel = lbCurSel 104;
                _typesel = lbCurSel 105;
                if (_typesel != _titlesel) then {
                    lbSetCurSel[104, _titlesel];
                    lbSetCurSel[105, _titlesel];
                };
                if (lbSize 104 == 0) then {
                    buttonSetAction[106, ""];
                };
                if (RPM_Cop) then {
                    buttonSetAction[107, format["call RPM_Cfg_Inv_Crimelog_Compose_GUI;"]];
                } else {
                    ctrlShow[107, false];
                    ctrlShow[108, false];
                };
                if (_titlesel >=0) then {
                    if (lbSize 104 == 0) then {
                        buttonSetAction[106, ""];
                    } else {
                        if ((lbText[104, 0] != format[localize "v419"]) and (lbText[105, 0] != "N/A")) then {
                            buttonSetAction[106, format["[%1] call RPM_Cfg_Inv_Crimelog_Read_GUI;", _titlesel]];
                        } else {
                            buttonSetAction[106, ""];
                        };
                    };
                    if (RPM_Cop) then {
                        if ((lbText[104, 0] != format[localize "v419"]) and (lbText[105, 0] != "N/A")) then {
                            buttonSetAction[108, format["[%1] call RPM_Cfg_Crimes_DelMessage;", _titlesel]];
                        } else {
                            buttonSetAction[108, ""];
                        };
                    };
                };
            };
            sleep 0.001;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_Stats_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_i","_line","_index","_h","_hu","_he","_add"];
        if (!(createDialog "StatsDialog")) exitWith {
            hint format[localize "v1"];
        };
        _h = call RPM_Cfg_Inv_CompileStatsArray;
        waitUntil {_h};
        lbClear 70;
        for [{_i = 0}, {_i < count(RPM_StatsArray)}, {_i = _i + 1}] do {
            _add = true;
            if (RPM_Cop) then {
                if (_i == 6) then {
                    _add = false;
                };
            };
            if (_add) then {
                _line = format["%1", (RPM_StatsArray select _i) select 0];
                _index = lbAdd[70, _line];
                lbSetData[70, _index, _line];
            };
        };
        while {ctrlVisible 70} do {
            i9=i9+0.001;
            _hu = [format["Hunger: %1/100", floor(i9)]];
            _he = [format["Health: %1/100", call RPM_Cfg_Inv_GetHealth]];
            RPM_StatsArray set[2, _he];
            RPM_StatsArray set[3, _hu];
            lbSetData[2, _he];
            lbSetData[2, _hu];
            sleep 0.001;
        };
    };
    _ret = true;
    _ret;
};
