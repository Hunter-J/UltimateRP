// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

RPM_Cfg_Banking_Rob = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (!(RPM_Role call RPM_Cfg_Objects_IsArmed)) exitWith {
        hint format[localize "v375"];
    };
    if (copcount < 3) exitwith {
		player commandChat "There needs to be atleast 3 cops online to rob a Bank.";
	};
	if (!canUseBank) exitwith {
		player commandChat "The Bank is already being robbed!";
	};
	sleep 5;
	PDBase say3D "BankAlarm_PD";
	canUseBank = false;
	publicvariable "canUseBank";
	call RPM_Cfg_Crimes_Bankrob;
	_sex = call compile format ["%1sex", player];
	_description = call compile format ["%1description", player];
	["Dispatch", ["Rob","Bank",_sex,_description]] call CBA_fnc_globalEvent;
    _ret = true;
    _ret;
};
RPM_Cfg_Bank_Transact = {
    private ["_transacted","_ret","_art","_amount","_tgtobj","_exit","_v1var","_v2var","_npc","_balance"];
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _ret = false;
    _npc = _this select 0;
    _exit = false;
    if (_npc == npc_bank) then {
        _v1var = bank_vault1 getVariable "robbed";
        _v2var = bank_vault2 getVariable "robbed";
        if (((_v1var select 0) && (_v1var select 1)) || (_v2var select 0) && (_v2var select 1)) exitWith {
            hint format[localize "v369"];
            _exit = true;
        };
        if (((!(_v1var select 0)) && (_v1var select 1)) || (!(_v2var select 0)) && (_v2var select 1)) exitWith {
            hint format[localize "v427"];
            _exit = true;
        };
    };
    if (!(_exit)) then {
        _art = _this select 1;
        _amount = (_this select 2) call RPM_str_StrToLongInt;
        _tgtobj = _this select 3;
        if (_amount > RPM_MAX_NUMBER) exitWith {
            hint format[localize "v3", RPM_MAX_NUMBER];
        };
        if (_amount < 0) exitWith {
            hint format[localize "STRM_Negative_Number"];
        };
        _balance = i4;
        switch (_art) do {
            case "deposit": {
                if (([521] call RPM_Cfg_Inv_GetItemAmount) < _amount) exitWith {
                    hint format[localize "v4"];
                };
                if (_amount + i4 >RPM_MAX_NUMBER) exitWith {
                    hint format[localize "v3", RPM_MAX_NUMBER];
                };
                if ([521, _amount] call RPM_Cfg_Inv_DelItemAmount) then {
                    i4 = i4 + _amount;
                    hint format[localize "v5", _amount];
                    _transacted = true;
                    if (RPM_Diagnostics) then {
                        [format["RPM(Banking)|Deposited|%1|%2|%3", name RPM_Role, _amount, _balance], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    };
                    ["Deposit", name RPM_Role, [format["%1", _amount]]] spawn RPM_Cfg_Logs_AddLog;
                } else {
                    hint format[localize "v6"];
                };
            };
            case "transfer": {
                if (isNull(_tgtobj)) exitWith {
                    hint format[localize "v93"];
                };
                if (!(alive _tgtobj)) exitWith {};
                if (RPM_Role == _tgtobj) exitWith {
                    hint format[localize "v11"];
                };
                if ((_amount > i4) || (i4 - _amount < 0)) exitWith {
                    hint format[localize "v7"];
                };
                i4 = i4 - _amount;
                hint format[localize "v9", (name _tgtobj), _amount];
                format["if (RPM_Role == %1) then {
                    hint ""%2"";
                    i4 = i4 + %3;
                    [""i4"", i4] call RPM_Saving_C_Save;
                };", _tgtobj, format[localize "v8", name RPM_Role, _amount], _amount] call RPM_Cfg_Network_Broadcast;
                _transacted = true;
                if (RPM_Diagnostics) then {
                    [format["RPM(Banking)|Transferred|%1|%2|%3", name RPM_Role, name _tgtobj, _amount, _balance], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
                ["Transfer", RPM_Role, [[format["%1", _amount], name _tgtobj]]] spawn RPM_Cfg_Logs_AddLog;
                _ret = true;
            };
            case "withdraw": {
                if (_amount > i4) exitWith {
                    hint format[localize "v7"];
                };
                if ((([521] call RPM_Cfg_Inv_GetItemAmount) + _amount) > RPM_MAX_NUMBER) exitWith {
                    hint format[localize "v403", RPM_MAX_NUMBER];
                };
                i4 = i4 - _amount;
                if ([521, _amount] call RPM_Cfg_Inv_AddItemAmount) then {
                    hint format[localize "v10", _amount];
                    _transacted = true;
                    if (RPM_Diagnostics) then {
                        [format["RPM(Banking)|Withdrew|%1|%2|%3", name RPM_Role, _amount, _balance], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    };
                    ["Withdraw", RPM_Role, [format["%1", _amount]]] spawn RPM_Cfg_Logs_AddLog;
                    _ret = true;
                } else {
                    hint format[localize "v6"];
                };
            };
        };
        if (_transacted) then {
            if (!(RPM_Saving_Saving)) then {
                ["i4", i4] call RPM_Saving_C_Save;
                i4 call RPM_Saving_SaveBank_C;
            };
            _ret = true;
        };
    };
    _ret;
};
