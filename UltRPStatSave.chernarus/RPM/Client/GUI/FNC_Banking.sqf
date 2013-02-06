// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/


// Banking
RPM_Cfg_Banking_GUI = {
    private ["_ret","_v1var","_npc","_exit"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _npc = _this;
    _exit = false;
    if (_npc == npc_bank) then {
        _v1var = bank_vault1 getVariable "robbed";
        if ((_v1var select 0) && (_v1var select 1)) exitWith {
            hint format[localize "v429"];
            _exit = true;
        };
    };
    if (!(_exit)) then {
        _this spawn {
            private ["_i","_obj","_index","_name","_tgtsel"];
            if (!(createDialog "BankDialog")) exitWith{
                hint format[localize "v1"];
            };
            for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
                if (!(isNull(RPM_POBJArr select _i))) then {
                    _obj = RPM_POBJArr select _i;
                    if ([_obj] call RPM_Cfg_Objects_IsUnit) then {
                        _name = format["%1 (%2)", _obj, (name _obj)];
                        _index = lbAdd[69, _name];
                        lbSetData[69, _index, format["%1", _obj]];
                    };
                };
            };
            lbSetCurSel[69, 0];
            while {ctrlVisible 68} do {
                ctrlSetText[73, format["$%1", [521] call RPM_Cfg_Inv_GetItemAmount]];
                ctrlSetText[74, format["$%1", i4]];
                if ((!((ctrlText 68) call RPM_str_IsNumeric)) || ((ctrlText 68) call RPM_str_StrToInt) >= RPM_MAX_NUMBER) then {
                    ctrlSetText[68, "1"];
                };
                if (([521] call RPM_Cfg_Inv_GetItemAmount) >= 1) then {
                    buttonSetAction[70, format["[%1, ""deposit"", ctrlText 68] call RPM_Cfg_Bank_Transact;", _this]];
                    _tgtsel = lbCurSel 69;
                    if (_tgtsel >= 0) then {
                        buttonSetAction[71, format["[%1, ""transfer"", ctrlText 68, %2] call RPM_Cfg_Bank_Transact;", _this, format["%1", lbData[69, lbCurSel 69]]]];
                    } else {
                        buttonSetAction[70, ""];
                        buttonSetAction[71, ""];
                    };
                };
                if (i4 >= 1) then {
                    buttonSetAction[72, format["[%1, ""withdraw"", ctrlText 68] call RPM_Cfg_Bank_Transact;", _this]];
                } else {
                    buttonSetAction[72, ""];
                };
                sleep 1;
            };
        };
    };
    _ret = true;
    _ret;
};
