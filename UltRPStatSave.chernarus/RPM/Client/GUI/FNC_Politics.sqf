// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Politics
RPM_Cfg_Mayor_GUI = {
    private ["_ret","_npc"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _npc = _this;
    _npc spawn {
        private ["_balance","_i","_index","_player","_tgtsel","_name","_obj","_pocket"];
        _player = name RPM_Role;
        if (!(createDialog "PoliticsDialog")) exitWith {
            hint format[localize "v1"];
        };
        //buttonSetAction[199, format["%1 call RPM_Cfg_Mayor_Statement_GUI;", _this]];
        ctrlShow[199, false];
        buttonSetAction[200, format["%1 call RPM_Cfg_Mayor_Taxes_GUI;", _this]];
        buttonSetAction[201, format["%1 call RPM_Cfg_Mayor_Laws_GUI;", _this]];
        buttonSetAction[204, format["[%1, ""%2""] call RPM_Cfg_Office_Rescend;", 1, name RPM_Role]];
        buttonSetAction[205, format["%1 call RPM_Cfg_Mayor_Frequency_GUI;", _this]];
        for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
            if (!(isNull(RPM_POBJArr select _i))) then {
                _obj = RPM_POBJArr select _i;
                if ([_obj] call RPM_Cfg_Objects_IsUnit) then {
                    _name = format["%1 (%2)", _obj, (name _obj)];
                    _index = lbAdd[202, _name];
                    lbSetData[202, _index, format["%1", _obj]];
                };
            };
        };
        lbSetCurSel[202, 0];
        while {ctrlVisible 195} do {
            _pocket = format["%1", [521] call RPM_Cfg_Inv_GetItemAmount];
            if (ctrlText 238 != _pocket) then {
                ctrlSetText[238, _pocket];
            };
            if ((!((ctrlText 203) call RPM_str_IsNumeric)) || ((ctrlText 203) call RPM_str_StrToInt) >= RPM_MAX_NUMBER) then {
                ctrlSetText[203, "1"];
            };
            _balance = format["%1", i21];
            if (ctrlText 195 != _balance) then {
                ctrlSetText[195, _balance];
            };
            if (!(b1)) then {
                buttonSetAction[196, format["[""%1"", 0, 1] call RPM_Cfg_Mayor_Transact;", _player, (ctrlText 203) call RPM_str_StrToInt]];
                _tgtsel = lbCurSel 202;
                if (_tgtsel >= 0) then {
                    buttonSetAction[197, format["[""%1"", 1, %2, ""%3""] call RPM_Cfg_Mayor_Transact;", _player, (ctrlText 203) call RPM_str_StrToInt, lbData[202, lbCurSel(202)]]];
                } else {
                    buttonSetAction[197, ""];
                };
                buttonSetAction[198, format["[""%1"", 2, %2] call RPM_Cfg_Mayor_Transact;", _player,  (ctrlText 203) call RPM_str_StrToInt]];
            } else {
                buttonSetAction[196, ""];
                buttonSetAction[197, ""];
                buttonSetAction[198, ""];
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Mayor_Frequency_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_frequency"];
        if (!(createDialog "PoliticsFrequencyDialog")) exitWith {
            hint format[localize "v1"];
        };
        ctrlSetText[206, format["%1", call RPM_Cfg_Politics_GetFrequency]];
        while {ctrlVisible 206} do {
            _frequency = (ctrlText 206) call RPM_str_StrToInt;
            if (!(_frequency call RPM_str_isInteger)) then {
                ctrlSetText[206, format["%1", call RPM_Cfg_Politics_GetFrequency]];
            };
            if ((_frequency < 5) || (_frequency > 60)) then {
                ctrlSetText[206, format["%1", call RPM_Cfg_Politics_GetFrequency]];
            };
            buttonSetAction[207, format["%1 call RPM_Cfg_Politics_SetFrequency;", _frequency]];
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Mayor_Laws_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_sel","_h"];
        if (!(createDialog "PoliticsLawsDialog")) exitWith {
            hint format[localize "v1"];
        };
        _h = call RPM_Cfg_Mayor_Laws_RepaintListBox;
        waitUntil {_h};
        while {ctrlVisible 208} do {
            _sel = lbCurSel 208;
            if ((_sel >= 0) && (!(b1))) then {
                buttonSetAction[209, format["%1 call RPM_Cfg_Mayor_LawsEdit_GUI", _sel]];
            } else {
                buttonSetAction[209, ""];
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Mayor_Laws_RepaintListBox = {
    private ["_i","_index","_ret"];
    _ret = false;
    lbClear 208;
    for [{_i = 1}, {_i < count(RPM_Stats_LawsArray)-1}, {_i = _i + 1}] do {
        _index = lbAdd[208, (RPM_Stats_LawsArray select _i) select 0];
        lbSetData[208, _index, (RPM_Stats_LawsArray select _i) select 0];
    };
    lbSetCurSel[208, 0];
    _ret = true;
    _ret;
};
RPM_Cfg_Mayor_LawsEdit_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_text","_index","_len"];
        _index = _this;
        if (!(createDialog "PoliticsLawsEditDialog")) exitWith {
            hint format[localize "v1"];
        };
        ctrlSetText[210, (RPM_Stats_LawsArray select _this + 1) select 0];
        while {ctrlVisible 210} do {
            _text = ctrlText 210;
            _len = 8;
            if (_index + 1 >= 10) then {
                _len = 9;
            };
            if (_text call RPM_str_Length < _len) then {
                ctrlSetText[210, (RPM_Stats_LawsArray select _this + 1) select 0];
                buttonSetAction[211, ""];
            } else {
                if (!(b1)) then {
                    buttonSetAction[211, format["[%1, ""%2""] call RPM_Cfg_Mayor_SetLaw;", _index, _text]];
                } else {
                    buttonSetAction[211, ""];
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Mayor_Statement_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        if (!(createDialog "PoliticsStatementDialog")) exitWith {
            hint format[localize "v1"];
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Mayor_Taxes_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_i","_sldvals","_goodsposition","_goodsedt","_goodsedtval","_goodsssldr","_incomeposition","_transactionsposition","_vehiclesposition","_incomeedt","_incomeedtval","_incomesldr","_transactionsedt","_transactionsedtval","_transactionssldr","_vehiclesedt","_vehiclesedtval","_vehiclessldr","_weaponsedt","_weaponsedtval","_weaponsssldr","_weaponsposition"];
        if (!(createDialog "PoliticsTaxesDialog")) exitWith {
            hint format[localize "v1"];
        };
        sliderSetRange[220, 5, 30];
        sliderSetRange[222, 5, 30];
        sliderSetRange[224, 5, 30];
        sliderSetRange[226, 5, 30];
        sliderSetRange[228, 5, 30];
        _sldvals = [5, 10, 15, 20, 25, 30];
        _goodsposition = a45 select 0;
        _incomeposition = a45 select 1;
        _transactionsposition = a45 select 2;
        _vehiclesposition = a45 select 3;
        _weaponsposition = a45 select 4;
        sliderSetPosition[220, _goodsposition];
        sliderSetPosition[222, _incomeposition];
        sliderSetPosition[224, _transactionsposition];
        sliderSetPosition[226, _vehiclesposition];
        sliderSetPosition[228, _weaponsposition];
        while {ctrlVisible 219} do {
            // Goods
            _goodsedt = ctrlText 219;
            _goodsedtval = _goodsedt call RPM_str_StrToInt;
            if (!(_goodsedtval call RPM_str_isInteger)) then {
                ctrlSetText[219, "5"];
            };
            _goodsssldr = sliderPosition 220;
            if ((_goodsssldr < 5) || (_goodsssldr > 30)) then {
                sliderSetPosition[220, 5];
            };
            for [{_i = count(_sldvals)-1}, {_i >= 0}, {_i = _i - 1}] do {
                _goodsposition = _sldvals select (floor(_goodsssldr / 30 * (count(_sldvals)-1)));
            };
            if (_goodsedtval != _goodsposition) then {
                ctrlSetText[219, format["%1", _goodsposition]];
            };
            // Income
            _incomeedt = ctrlText 221;
            _incomeedtval = _incomeedt call RPM_str_StrToInt;
            if (!(_incomeedtval call RPM_str_isInteger)) then {
                ctrlSetText[221, "5"];
            };
            _incomesldr = sliderPosition 222;
            if ((_incomesldr < 5) || (_incomesldr > 30)) then {
                sliderSetPosition[222, 5];
            };
            for [{_i = count(_sldvals)-1}, {_i >= 0}, {_i = _i - 1}] do {
                _incomeposition = _sldvals select (floor(_incomesldr / 30 * (count(_sldvals)-1)));
            };
            if (_incomeedtval != _incomeposition) then {
                ctrlSetText[221, format["%1", _incomeposition]];
            };
            // Transactions
            _transactionsedt = ctrlText 223;
            _transactionsedtval = _transactionsedt call RPM_str_StrToInt;
            if (!(_transactionsedtval call RPM_str_isInteger)) then {
                ctrlSetText[223, "5"];
            };
            _transactionssldr = sliderPosition 224;
            if ((_transactionssldr < 5) || (_transactionssldr > 30)) then {
                sliderSetPosition[224, 5];
            };
            for [{_i = count(_sldvals)-1}, {_i >= 0}, {_i = _i - 1}] do {
                _transactionsposition = _sldvals select (floor(_transactionssldr / 30 * (count(_sldvals)-1)));
            };
            if (_transactionsedtval != _transactionsposition) then {
                ctrlSetText[223, format["%1", _transactionsposition]];
            };
            // Vehicles
            _vehiclesedt = ctrlText 225;
            _vehiclesedtval = _vehiclesedt call RPM_str_StrToInt;
            if (!(_vehiclesedtval call RPM_str_isInteger)) then {
                ctrlSetText[225, "5"];
            };
            _vehiclessldr = sliderPosition 226;
            if ((_vehiclessldr < 5) || (_vehiclessldr > 30)) then {
                sliderSetPosition[226, 5];
            };
            for [{_i = count(_sldvals)-1}, {_i >= 0}, {_i = _i - 1}] do {
                _vehiclesposition = _sldvals select (floor(_vehiclessldr / 30 * (count(_sldvals)-1)));
            };
            if (_vehiclesedtval != _vehiclesposition) then {
                ctrlSetText[225, format["%1", _vehiclesposition]];
            };
            // Weapons
            _weaponsedt = ctrlText 227;
            _weaponsedtval = _weaponsedt call RPM_str_StrToInt;
            if (!(_weaponsedtval call RPM_str_isInteger)) then {
                ctrlSetText[227, "5"];
            };
            _weaponsssldr = sliderPosition 228;
            if ((_weaponsssldr < 5) || (_weaponsssldr > 30)) then {
                sliderSetPosition[228, 5];
            };
            for [{_i = count(_sldvals)-1}, {_i >= 0}, {_i = _i - 1}] do {
                _weaponsposition = _sldvals select (floor(_weaponsssldr / 30 * (count(_sldvals)-1)));
            };
            if (_weaponsedtval != _weaponsposition) then {
                ctrlSetText[227, format["%1", _weaponsposition]];
            };
            if (!(b1)) then {
                buttonSetAction[229, format["[%1, %2, %3, %4, %5] call RPM_Cfg_Mayor_SetTaxes;", _goodsedtval, _incomeedtval, _transactionsedtval, _vehiclesedtval, _weaponsedtval]];
            } else {
                buttonSetAction[229, ""];
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Politics_Vote_GUI = {
    private ["_ret","_npc"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (!(call RPM_Cfg_Politics_CanVote)) exitWith {
        hint format[localize "v455"];
    };
    _npc = _this select 0;
    if (([_npc, 3] call RPM_Cfg_Inv_NPCGetInUse) && (([_npc, 3] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {
        hint format[localize "v511"];
    };
    _this spawn {
        private ["_seat","_sel","_player","_h","_npc"];
        _npc = _this select 0;
        _seat = _this select 1;
        _player = _this select 2;
        [_npc, 3, RPM_Role] call RPM_Cfg_Inv_NPCSetInUse;
        if (!(createDialog "PoliticsVoteDialog")) exitWith {
            hint format[localize "v1"];
            [_npc, 3, objNull] call RPM_Cfg_Inv_NPCSetInUse;
        };
        _h = _seat call RPM_Cfg_Politics_Repaint_CandidatesListBox;
        waitUntil {_h};
        while {ctrlVisible 230} do {
            _sel = lbCurSel 230;
            if ((_sel >= 0) && (!(b1))) then {
                if ((([_seat, _player, _sel] call RPM_Cfg_Politics_GetVote) call RPM_str_Length >= 1) && (([_seat, _player, _sel] call RPM_Cfg_Politics_GetVote) == ([_seat, _sel] call RPM_Cfg_Politics_GetIndexPlayer))) then {
                    buttonSetAction[231, format["[%1, ""%2"", %3] call RPM_Cfg_Politics_DelVote", _seat, _player, _sel]];
                    if (ctrlText 231 != "Unvote") then {
                        ctrlSetText[231, "Unvote"];
                    };
                } else {
                    buttonSetAction[231, format["[%1, ""%2"", %3] call RPM_Cfg_Politics_AddVote", _seat, _player, _sel]];
                    if (ctrlText 231 != "Vote") then {
                        ctrlSetText[231, "Vote"];
                    };
                };
            } else {
                buttonSetAction[231, ""];
            };
            if (lbSize 230 == 0) then {
                if (ctrlText 231 != "Vote") then {
                    ctrlSetText[231, "Vote"];
                };
            };
            if ([_seat, _player] call RPM_Cfg_Politics_IsCandidate) then {
                if (ctrlText 232 != "Rescend") then {
                    ctrlSetText[232, "Rescend"];
                };
                if (!(b1)) then {
                    buttonSetAction[232, format["[%1, ""%2""] call RPM_Cfg_Politics_Rescend", _seat, _player]];
                } else {
                    buttonSetAction[232, ""];
                };
            } else {
                if (ctrlText 232 != "Run") then {
                    ctrlSetText[232, "Run"];
                };
                if (!(b1)) then {
                    buttonSetAction[232, format["[%1, ""%2""] call RPM_Cfg_Politics_Run", _seat, _player]];
                } else {
                    buttonSetAction[232, ""];
                };
            };
            sleep 0.001;
        };
        waitUntil {((isNull(RPM_Role)) || (!(alive RPM_Role)) || ((!(ctrlVisible 230))))};
        [_npc, 3, objNull] call RPM_Cfg_Inv_NPCSetInUse;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Politics_Repaint_CandidatesListBox = {
    private ["_ret","_seat","_candidates","_i","_index","_player","_unit"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _seat = _this;
    lbClear 230;
    _candidates = _seat call RPM_Cfg_Politics_GetCandidates;
    for [{_i = 0}, {_i < count(_candidates)}, {_i = _i + 1}] do {
        _player = (_candidates select _i) select 0;
        _unit = (_candidates select _i) select 1;
        _index = lbAdd[230, format["%1 (%2)", _unit, _player]];
        lbSetData[230, _index, format["%1 (%2)", _unit, _player]];
    };
    lbSetCurSel[230, 0];
    _ret = true;
    _ret;
};
