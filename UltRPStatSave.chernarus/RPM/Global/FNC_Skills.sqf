// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Skills
RPM_Cfg_Skills_GetSkill = {
    private ["_ret","_uid","_i","_skills","_skill"];
    _ret = [];
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        _skill = _this select 1;
        if ((_skill >= 0) && (_skill <= 4)) then {
            _skills = _uid call RPM_Cfg_Skills_GetSkills;
            if (count(_skills) >= 1) then {
                for [{_i = 0}, {_i < count(_skills)}, {_i = _i + 1}] do {
                    if (((_skills select _i) select 0) == _skill) then {
                        _ret = _skills select _i;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Skills_GetSkills = {
    private ["_ret","_uid","_index"];
    _ret = [];
    _uid = _this;
    if (_uid call RPM_str_Length >= 1) then {
        _index = _uid call RPM_Cfg_Skills_GetPlayerIndex;
        if (_index != -1) then {
            _ret = (RPM_SkillsArray select _index) select 1;
        };
    };
    _ret;
};
RPM_Cfg_Skills_GetPlayerIndex = {
    private ["_i","_ret","_uid"];
    _ret = -1;
    _uid = _this;
    if (_uid call RPM_str_Length >= 1) then {
        for [{_i = 0}, {_i < count(RPM_SkillsArray)}, {_i = _i + 1}] do {
            if (((RPM_SkillsArray select _i) select 0) == _uid) then {
                _ret = _i;
            };
        };
    };
    _ret;
};
RPM_Cfg_Skills_GetSkillIndex = {
    private ["_i","_ret","_uid","_c","_skill"];
    _ret = -1;
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        _skill = _this select 1;
        if ((_skill >= 0) && (_skill <= 4)) then {
            for [{_i = 0}, {_i < count(RPM_SkillsArray)}, {_i = _i + 1}] do {
                if (((RPM_SkillsArray select _i) select 0) == _uid) then {
                    for [{_c = 0}, {_c < count((RPM_SkillsArray select _i) select 1)}, {_c = _c + 1}] do {
                        if (((((RPM_SkillsArray select _i) select 1) select _c) select 0) == _skill) then {
                            _ret = _c;
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Skills_GetSkillPoints = {
    private ["_ret","_uid","_skillarr","_skill"];
    _ret = 0;
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        _skill = _this select 1;
        if ((_skill >= 0) && (_skill <= 4)) then {
            _skillarr = [_uid, _skill] call RPM_Cfg_Skills_GetSkill;
            if (count(_skillarr) == 2) then {
                _ret = _skillarr select 1;
            };
        };
    };
    _ret;
};
RPM_Cfg_Skills_AddSkillPoints = {
    private ["_ret","_uid","_points","_skill","_newpoints"];
    _ret = false;
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        _skill = _this select 1;
        if ((_skill >= 0) && (_skill <= 4)) then {
            _points = _this select 2;
            if ((_points >= 1) && (_points <= 100)) then {
                _newpoints = ([_uid, _skill] call RPM_Cfg_Skills_GetSkillPoints)+_points;
                if ((_newpoints >= 1) && (_newpoints <= 100)) then {
                    if ([_uid, _skill, _newpoints] call RPM_Cfg_Skills_SetSkillPoints) then {
                        _ret = true;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Skills_DelSkillPoints = {
    private ["_ret","_uid","_points","_skill","_newpoints"];
    _ret = false;
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        _skill = _this select 1;
        if ((_skill >= 0) && (_skill <= 4)) then {
            _points = _this select 2;
            if ((_points >= 1) && (_points <= 100)) then {
                _newpoints = ([_uid, _skill] call RPM_Cfg_Skills_GetSkillPoints)-_points;
                if ((_newpoints >= 0) && (_newpoints <= 100)) then {
                    if ([_uid, _skill, _newpoints] call RPM_Cfg_Skills_SetSkillPoints) then {
                        _ret = true;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Skills_SetSkillPoints = {
    private ["_ret","_uid","_points","_skill","_tmp","_pindex","_sindex","_sarr"];
    _ret = false;
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        _skill = _this select 1;
        if ((_skill >= 0) && (_skill <= 4)) then {
            _points = _this select 2;
            if ((_points >= 1) && (_points <= 100)) then {
                _pindex = _uid call RPM_Cfg_Skills_GetPlayerIndex;
                if (_pindex != -1) then {
                    // Player exists in skills array
                    _sindex = [_uid, _skill] call RPM_Cfg_Skills_GetSkillIndex;
                    if (_sindex != -1) then {
                        // Found skill in player skills array
                        (((RPM_SkillsArray select _pindex) select 1) select _sindex) set[1, _points];
                    } else {
                        // Didn't find skill in player skills array
                        _tmp = + ((RPM_SkillsArray select _pindex) select 1);
                        _sarr = [_skill, _points];
                        _tmp set[count(_tmp), _sarr];
                        (RPM_SkillsArray select _pindex) set [1, _tmp];
                    };  
                } else {
                    // Player doesn't exist at all
                    _tmp = [_uid, [[_skill, _points]]];
                    RPM_SkillsArray set[count(RPM_SkillsArray), _tmp];
                };
                if (([_uid, _skill] call RPM_Cfg_Skills_GetSkillPoints) == _points) then {
                    _ret = true;
                };
            } else {
                // Remove the skill array
                if (_points == 0) then {
                    _pindex = _uid call RPM_Cfg_Skills_GetPlayerIndex;
                    if (_pindex != -1) then {
                        // Player exists in skills array
                        _sindex = [_uid, _skill] call RPM_Cfg_Skills_GetSkillIndex;
                        if (_sindex != -1) then {
                            _tmp = + (RPM_SkillsArray select _pindex) select 1;
                            _tmp set[_sindex, -1];
                            _tmp = _tmp - [-1];
                            if (count(_tmp) != 0) then {
                                // Remove the skill array
                                (RPM_SkillsArray select _pindex) set[1, _tmp];
                                _sindex = [_uid, _skill] call RPM_Cfg_Skills_GetSkillIndex;
                                if (_sindex == -1) then {
                                    _ret = true;
                                };
                            } else {
                                // Remove the player array
                                RPM_SkillsArray set[_pindex, -1];
                                RPM_SkillsArray = RPM_SkillsArray - [-1];
                                _pindex = _uid call RPM_Cfg_Skills_GetPlayerIndex;
                                if (_pindex == -1) then {
                                    _ret = true;
                                };
                            };
                        };
                    };
                };
            };
            if (_ret) then {
                ["RPM_SkillsArray", (RPM_SkillsArray select 0) select 1] call RPM_Saving_C_Save;
                RPM_SkillsArray call RPM_Saving_SaveSkills_C;
            };
        };
    };
    _ret;
};
RPM_Cfg_Skills_HasSkillPoints = {
    private ["_ret","_uid","_skill"];
    _ret = true;
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        _skill = _this select 1;
        if ((_skill >= 0) && (_skill <= 4)) then {
            if (([_uid, _skill] call RPM_Cfg_Skills_GetSkillPoints) == 0) then {
                _ret = false;
            };
        };
    };
    _ret;
};
RPM_Cfg_Skills_GetTotalPoints = {
    private ["_industrypts","_vehiclespts","_weaponspts","_unallocatedpts","_ret","_uid"];
    _ret = 0;
    _uid = _this;
    if (_uid call RPM_str_Length >= 1) then {
        _industrypts = [_uid, 1] call RPM_Cfg_Skills_GetSkillPoints;
        _vehiclespts = [_uid, 2] call RPM_Cfg_Skills_GetSkillPoints;
        _weaponspts = [_uid, 3] call RPM_Cfg_Skills_GetSkillPoints;
        _unallocatedpts = [_uid, 0] call RPM_Cfg_Skills_GetSkillPoints;
        _ret = _industrypts + _vehiclespts + _weaponspts + _unallocatedpts;
    };
    _ret;
};
RPM_Cfg_Skills_GetPointCost = {
    private ["_ret","_points","_totalpoints","_uid","_totalcost","_basecost"];
    _ret = 0;
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        _points = _this select 1;
        if ((_points >= 1) && (_points <= 100)) then {
            _totalpoints = _uid call RPM_Cfg_Skills_GetTotalPoints;
            if (_totalpoints == 0) then {
                _totalpoints = 1;
            };
            _basecost = 33.33331;
            _totalcost = round(((_basecost * _points) + ((_basecost * _totalpoints))) * _points);
            _ret = _totalcost;
        };
    };
    _ret;
};
RPM_Cfg_Skills_BuyPoints = {
    private ["_uid","_ret","_points","_totalcost","_skill","_curpts","_skillstr"];
    _ret = false;
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        _skill = _this select 1;
        if ((_skill >= 0) && (_skill <= 4)) then {
            _skillstr = "";
            switch (_skill) do {
                case 0: {
                    _skillstr = format[localize "STRM_Skills_Industry"];
                };
                case 1: {
                    _skillstr = format[localize "STRM_Skills_Vehicles"];
                };
                case 2: {
                    _skillstr = format[localize "STRM_Skills_Weapons"];
                };
                case 3: {
                    _skillstr = format[localize "STRM_Skills_Criminal"];
                };
                case 4: {
                    _skillstr = format[localize "STRM_Skills_Police"];
                };
            };
            _points = _this select 2;
            if ((_points >= 1) && (_points <= 100)) then {
                _totalcost = _this select 3;
                if ((_totalcost >= 1) && (_totalcost <= RPM_MAX_NUMBER)) then {
                    _curpts = [_uid, _skill] call RPM_Cfg_Skills_GetSkillPoints;
                    if ((((_uid call RPM_Cfg_Skills_GetTotalPoints)+_points) > RPM_SkillPointsLimit) || (_curpts + _points > RPM_SkillPointsLimit)) exitWith {
                        hint format[localize "STRM_Skills_MaxedOut", _points, RPM_SkillPointsLimit];
                    };
                    if ([521] call RPM_Cfg_Inv_GetItemAmount < _totalcost) exitWith {
                        hint format[localize "STRM_Skills_NotEnoughCash"];
                    };
                    if ([521, _totalcost] call RPM_Cfg_Inv_DelItemAmount) then {
                        hint format[localize "STRM_Skills_Purchased", _points, _skillstr, _totalcost];
                        if (!([_uid, _skill, _points] call RPM_Cfg_Skills_AddSkillPoints)) then {
                            if ([521, _totalcost] call RPM_Cfg_Inv_AddItemAmount) exitWith {
                                hint format[localize "STRM_System_Error"];
                            };
                        };
                        _ret = true;
                        // Reset gui
                        if (ctrlVisible 295) then {
                            ctrlSetText[306, format["1"]];
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Skills_Reset = {
    player commandChat format["%1", _this];
};
