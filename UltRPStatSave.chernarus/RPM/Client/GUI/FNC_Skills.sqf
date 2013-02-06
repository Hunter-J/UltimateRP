// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Skills
RPM_Cfg_Skills_GUI = {
    private ["_ret","_uid"];
    _ret = false;
    if (b1) exitWith {};
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _uid = call RPM_Cfg_Objects_GetUID;
    if (_uid call RPM_str_Length >= 1) then {
        _uid spawn {
            private ["_uid","_industrypts","_vehiclespts","_weaponspts","_pointscost","_index","_newpointscost","_buyedt","_skills","_rolepts","_skill","_i","_roleptsidx"];
            if (!(createDialog "SkillsDialog")) exitWith {
                hint format[localize "v1"];
            };
            _uid = _this;
            _skills = [
                format[localize "STRM_Skills_Industry"],
                format[localize "STRM_Skills_Vehicles"],
                format[localize "STRM_Skills_Weapons"],
                format[localize "STRM_Skills_Criminal"]
            ];
            if (RPM_Cop) then {
                _skills set[3, format[localize "STRM_Skills_Police"]];
            };
            // Max points
            ctrlSetText[313, format["%1", RPM_SkillPointsLimit]];
            // Skill selection combo
            {
                _index = lbAdd[305, _x];
                lbSetData[305, _index, _x];
            } forEach _skills;
            lbSetCurSel[305, 0];
            // Reset button
            buttonSetAction[309, format['"%1" call RPM_Cfg_Skills_Reset;', _uid]];
            // Points cost
            _pointscost = [_uid, 1] call RPM_Cfg_Skills_GetPointCost;
            ctrlSetText [307, _pointscost call RPM_str_IntToStr];
            // Role
            if (RPM_Cop) then {
                ctrlSetText[298, format[localize "STRM_Skills_Police"]];
            } else {
                ctrlSetText[298, format[localize "STRM_Skills_Criminal"]];
            };
            _pointscost = [_uid, 1] call RPM_Cfg_Skills_GetPointCost;
            ctrlSetText [307, _pointscost call RPM_str_IntToStr];
            // Current selected skill
            _skill = -1;
            while {ctrlVisible 295} do {
                // Current selected skill
                for [{_i = 0}, {_i < count(_skills)}, {_i = _i + 1}] do {
                    //player commandChat format["%1", _skills select _i];
                    if ((lbData[305, lbCurSel 305]) == (_skills select _i)) then {
                        _skill = _i;
                    };
                };
                // Industry
                _industrypts = [_uid, 0] call RPM_Cfg_Skills_GetSkillPoints;
                ctrlSetText[295, _industrypts call RPM_str_IntToStr];
                // Vehicles
                _vehiclespts = [_uid, 1] call RPM_Cfg_Skills_GetSkillPoints;
                ctrlSetText[296, _vehiclespts call RPM_str_IntToStr];
                // Weapons
                _weaponspts = [_uid, 2] call RPM_Cfg_Skills_GetSkillPoints;
                ctrlSetText[297, _weaponspts call RPM_str_IntToStr];
                // Role
                _roleptsidx = 3;
                if (RPM_Cop) then {
                    _roleptsidx = 4;
                };
                _rolepts = [_uid, _roleptsidx] call RPM_Cfg_Skills_GetSkillPoints;
                ctrlSetText[299, _rolepts call RPM_str_IntToStr];
                // Buy
                _buyedt = ctrlText 306;
                // Points Cost
                if ((((_buyedt) call RPM_str_Length) >= 1) && (_buyedt call RPM_str_IsNumeric) && ((_buyedt call RPM_str_StrToInt) >= 1) && ((_buyedt call RPM_str_StrToInt) <= 100) && (_buyedt call RPM_str_Length < 4) && (!(_buyedt call RPM_str_ContainsSymbol)) && (_skill != -1)) then {
                    if ((RPM_Cop) && (_skill == 3)) then {
                        _skill = 4;
                    };
                    _newpointscost = [_uid, (_buyedt call RPM_str_StrToInt)] call RPM_Cfg_Skills_GetPointCost;
                    if ((ctrlText 307) != (_newpointscost call RPM_str_IntToStr)) then {
                        ctrlSetText [307, _newpointscost call RPM_str_IntToStr];
                    };
                    buttonSetAction[308, format['["%1", %2, %3, %4] call RPM_Cfg_Skills_BuyPoints;', _uid, _skill, _buyedt call RPM_str_StrToInt, _newpointscost]];
                } else {
                    buttonSetAction[308, format['']];
                    ctrlSetText[306, "1"];
                };
                // Set cash
                ctrlSetText[310, format["%1", [521] call RPM_Cfg_Inv_GetItemAmount]];
                // Set total # of points
                ctrlSetText[311, format["%1", _industrypts + _vehiclespts + _weaponspts + _rolepts]];
                sleep 0.01;
            };
        };
    };
    _ret = true;
    _ret;
};
