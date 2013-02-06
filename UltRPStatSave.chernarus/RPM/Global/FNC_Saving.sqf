// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// RPM Saving
RPM_Cfg_Vehicles_Exists = {
    private ["_i","_ret","_veh"];
    _ret = -1;
    if (!(isNil("_this"))) then {
        _veh = _this;
        if (!(isNull(_veh))) then {
            for [{_i = 0}, {_i < count(RPM_Vehicles_Array)}, {_i = _i + 1}] do {
                if ((RPM_Vehicles_Array select _i) == _veh) then {
                    _ret = _i;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_Add = {
    private ["_ret","_veh"];
    _ret = false;
    if (!(isNil("_this"))) then {
        _veh = _this;
        if (!(isNull(_veh))) then {
            if ((_veh call RPM_Cfg_Vehicles_Exists) == -1) then {
                RPM_Vehicles_Array = RPM_Vehicles_Array + [_veh];
                publicVariable "RPM_Vehicles_Array";
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_Del = {
    private ["_ret","_exists","_veh"];
    _ret  = false;
    if (!(isNil("_this"))) then {
        _veh = _this;
        if (!(isNull(_veh))) then {
            _exists = _veh call RPM_Cfg_Vehicles_Exists;
            if (_exists != -1) then {
                RPM_Vehicles_Array set[_exists, -1];
                RPM_Vehicles_Array = RPM_Vehicles_Array - [-1];
                publicVariable "RPM_Vehicles_Array";
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_Loop = {
    private ["_ret"];
    _ret = false;
    if (RPM_Vehicles_LoopActive) exitWith{};
    [] spawn {
        private ["_i","_veh"];
        RPM_Vehicles_LoopActive = true;
        while {RPM_Vehicles_LoopActive} do {
            for [{_i = 0}, {_i < count(RPM_Vehicles_Array)}, {_i = _i + 1}] do {
                _veh = RPM_Vehicles_Array select _i;
                if (isNull(_veh)) then {
                    RPM_Vehicles_Array set[_i, -1];
                    RPM_Vehicles_Array = RPM_Vehicles_Array - [-1];
                    publicVariable "RPM_Vehicles_Array";
                };
            };
            sleep 5;
        };
        RPM_Vehicles_LoopActive = false;
        call RPM_Cfg_Vehicles_Loop;
    };
    _ret = true;
    _ret;
};
RPM_Saving_Loader = {
    private ["_ret"];
    _ret = false;
    if (!(isServer)) exitWith {};
    [] spawn {
        // Reset the array
        RPM_Saving_S_Array = [];
        RPM_Saving_Loading = true;
        if (RPM_Saving_Debug) then {
            if (RPM_Diagnostics) then {
                [format["UltRP(Server)|Stats|Loading statsfile"], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
        };
        publicVariable "RPM_Saving_Loading";
        RPM_Saving_S_Array = nil;
        call compile (loadFile "\a2server\stats.sqf");
        waitUntil {(!(isNil("RPM_Saving_S_Array")))};
        if (RPM_Saving_Debug) then {
            if (RPM_Diagnostics) then {
                [format["UltRP(Server)|Stats|Done loading statsfile"], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
        };
        RPM_Saving_Loading = false;
        publicVariable "RPM_Saving_Loading";
    };
    _ret = true;
    _ret;
};
RPM_Saving_SaveBank_C = {
    private ["_ret","_balance"];
    _ret = false;
    if (!(isNil("_this"))) then {
        _balance = _this;
        if (typeName(_balance) == "SCALAR") then {
            format['if (isServer) then {
                [%1, %2] call RPM_Saving_SaveBank_S;
            };', RPM_Role, _balance] call RPM_Cfg_Network_Broadcast;
            if (RPM_Saving_Debug) then {
                if (RPM_Diagnostics) then {
                    [format["UltRP(Client)|Stats|Sent server bank balance of $%1!", i4], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Saving_SaveBank_S = {
    private ["_ret"];
    _ret = false;
    _this spawn {
        private ["_balance","_player","_uid"];
        _player = _this select 0;
        if (!(isNull(_player))) then {
            _uid = _player call RPM_Cfg_Objects_GetUIDByObject;
            if (_uid call RPM_str_Length >= 1) then {
                _balance = _this select 1;
                waitUntil {(!(RPM_Saving_Saving))};
                RPM_Saving_Saving = true;
                publicVariable "RPM_Saving_Saving";
                // If ARMA2Net
                if (RPM_Saving_System == 1) then {
                    call compile (format['"Arma2Net.Unmanaged" callExtension "CLServer2Lib [Banking_SetBalance, ""%1"", ""%2""]";', _uid, _balance]);
                };
                if (RPM_Saving_Debug) then {
                    if (RPM_Diagnostics) then {
                        [format["UltRP(Server)|Stats|UID %1 sent server bank balance of $%2!", _uid, _balance], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    };
                };
                RPM_Saving_Saving = false;
                publicVariable "RPM_Saving_Saving";
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Saving_SaveLicenses_C = {
    private ["_ret","_licenses"];
    _ret = false;
    if (!(isNil("_this"))) then {
        _licenses = _this;
        if (typeName(_licenses) == "ARRAY") then {
            format['if (isServer) then {
                [%1, %2] call RPM_Saving_SaveLicenses_S;
            };', RPM_Role, _licenses] call RPM_Cfg_Network_Broadcast;
            if (RPM_Saving_Debug) then {
                if (RPM_Diagnostics) then {
                    [format["UltRP(Client)|Stats|Sent server %1 licenses!", count(_licenses)], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Saving_SaveLicenses_S = {
    private ["_ret"];
    _ret = false;
    _this spawn {
        private ["_n","_lic","_uid","_lics","_player","_nlics"];
        _player = _this select 0;
        if (!(isNull(_player))) then {
            _uid = _player call RPM_Cfg_Objects_GetUIDByObject;
            if (_uid call RPM_str_Length >= 1) then {
                _lics = _this select 1;
                waitUntil {(!(RPM_Saving_Saving))};
                RPM_Saving_Saving = true;
                publicVariable "RPM_Saving_Saving";
                _nlics = 0;
                for [{_n = 0}, {_n < count(_lics)}, {_n = _n + 1}] do {
                    _lic = _lics select _n;
                    // If ARMA2Net
                    if (RPM_Saving_System == 1) then {
                        call compile (format['"Arma2Net.Unmanaged" callExtension "CLServer2Lib [Licenses_LicenseAdd, ""%1"", ""%2""]";', _uid, _lic])
                    };
                    _nlics = _nlics + 1;
                };
                if (RPM_Saving_Debug) then {
                    if (RPM_Diagnostics) then {
                        [format["UltRP(Server)|Stats|UID %1 sent server %2 licenses!", _uid, _nlics], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    };
                };
                RPM_Saving_Saving = false;
                publicVariable "RPM_Saving_Saving";
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Saving_SaveStorage_C = {
    private ["_ret","_storage"];
    _ret = false;
    if (!(isNil("_this"))) then {
        _storage = _this;
        if (typeName(_storage) == "ARRAY") then {
            format['if (isServer) then {
                [%1, %2] call RPM_Saving_SaveStorage_S;
            };', RPM_Role, _storage] call RPM_Cfg_Network_Broadcast;
            if (RPM_Saving_Debug) then {
                if (RPM_Diagnostics) then {
                    [format["UltRP(Client)|Stats|Sent server %1 items in storage!", count(_storage)], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Saving_SaveStorage_S = {
    private ["_ret"];
    _ret = false;
    _this spawn {
        private ["_n","_uid","_player","_c","_arr","_itemid","_amount","_pdata","_parr","_storage","_items"];
        _player = _this select 0;
        if (!(isNull(_player))) then {
            _uid = _player call RPM_Cfg_Objects_GetUIDByObject;
            if (_uid call RPM_str_Length >= 1) then {
                _storage = _this select 1;
                waitUntil {(!(RPM_Saving_Saving))};
                RPM_Saving_Saving = true;
                publicVariable "RPM_Saving_Saving";
                _items = 0;
                for [{_c = 0}, {_c < count(_storage)}, {_c = _c + 1}] do {
                    _parr = _storage select _c;
                    _uid = _parr select 0;
                    _pdata = _parr select 1;
                    for [{_n = 0}, {_n < count(_pdata)}, {_n = _n + 1}] do {
                        _arr = _pdata select _n;
                        _itemid = _arr select 0;
                        _amount = _arr select 1;
                        // If ARMA2Net
                        if (RPM_Saving_System == 1) then {
                            call compile (format['"Arma2Net.Unmanaged" callExtension "CLServer2Lib [Storage_SetStorageItemAmount, ""%1"", ""%2"", ""%3""]";', _uid, _itemid, _amount]);
                        };
                        _items = _items + 1;
                    };
                };
                if (RPM_Saving_Debug) then {
                    if (RPM_Diagnostics) then {
                        [format["UltRP(Server)|Stats|UID %1 sent server %2 items for storage!", _uid, _items], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    };
                };
                RPM_Saving_Saving = false;
                publicVariable "RPM_Saving_Saving";
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Saving_SaveSkills_C = {
    private ["_ret","_skills"];
    _ret = false;
    if (!(isNil("_this"))) then {
        _skills = _this;
        if (typeName(_skills) == "ARRAY") then {
            format['if (isServer) then {
                [%1, %2] call RPM_Saving_SaveSkills_S;
            };', RPM_Role, _skills] call RPM_Cfg_Network_Broadcast;
            if (RPM_Saving_Debug) then {
                if (RPM_Diagnostics) then {
                    [format["UltRP(Client)|Stats|Sent server %1 items in skills!", count(_skills)], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Saving_SaveSkills_S = {
    private ["_ret"];
    _ret = false;
    _this spawn {
        private ["_n","_uid","_player","_c","_pdata","_parr","_items","_skills","_arr","_skillid","_points"];
        _player = _this select 0;
        if (!(isNull(_player))) then {
            _uid = _player call RPM_Cfg_Objects_GetUIDByObject;
            if (_uid call RPM_str_Length >= 1) then {
                _skills = _this select 1;
                waitUntil {(!(RPM_Saving_Saving))};
                RPM_Saving_Saving = true;
                publicVariable "RPM_Saving_Saving";
                _items = 0;
                for [{_c = 0}, {_c < count(_skills)}, {_c = _c + 1}] do {
                    _parr = _skills select _c;
                    _uid = _parr select 0;
                    _pdata = _parr select 1;
                    for [{_n = 0}, {_n < count(_pdata)}, {_n = _n + 1}] do {
                        _arr = _pdata select _n;
                        _skillid = _arr select 0;
                        _points = _arr select 1;
                        // If ARMA2Net
                        if (RPM_Saving_System == 1) then {
                            call compile (format['"Arma2Net.Unmanaged" callExtension "CLServer2Lib [Skills_SetSkillPoints, ""%1"", ""%2"", ""%3""]";', _uid, _skillid, _points]);
                        };
                        _items = _items + 1;
                    };
                };
                if (RPM_Saving_Debug) then {
                    if (RPM_Diagnostics) then {
                        [format["UltRP(Server)|Stats|UID %1 sent server %2 items for skills!", _uid, _items], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    };
                };
                RPM_Saving_Saving = false;
                publicVariable "RPM_Saving_Saving";
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Saving_Saver = {
    private ["_i","_varr","_ret"];
    _ret = false;
    if (time >= 15) then {
        for [{_i = 0}, {_i < count(RPM_Saving_S_Array)}, {_i = _i + 1}] do {
            _varr = (RPM_Saving_S_Array select _i);
            switch (_varr select 0) do {
                // Bank
                case "i4": {
                    RPM_Saving_BankSaved = false;
                    _varr spawn {
                        private ["_c","_process","_pdata","_parr","_uid","_sbanktime","_darr","_online"];
                        _sbanktime = time;
                        _darr = _this select 1;
                        _online = call RPM_Cfg_Objects_GetOnlineUIDs;
                        if (count(_online) >= 1) then {
                            _process = false;
                            for [{_c = 0}, {_c < count(_darr)}, {_c = _c + 1}] do {
                                _parr = _darr select _c;
                                _uid = _parr select 0;
                                if (_uid in _online) then {
                                    _pdata = _parr select 1;
                                    // If ARMA2Net
                                    if (RPM_Saving_System == 1) then {
                                        _process = (call compile (format['"Arma2Net.Unmanaged" callExtension "CLServer2Lib [Banking_SetBalance, ""%1"", ""%2""]";', _uid, _pdata])) call RPM_str_strToBool;
                                        if (RPM_Saving_Debug) then {
                                            if (RPM_Saving_Debug) then {
                                                if (RPM_Diagnostics) then {
                                                    [format["RPM(Stats)|Save|%1|%2|%3|%4", _this select 0, _uid, _pdata, _process], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                                };
                                            };
                                        };
                                    };
                                    if (_process) then {
                                        if (RPM_Saving_Debug) then {
                                            if (RPM_Diagnostics) then {
                                                [format["UltRP(Server)|Stats|Set bank balance for UID %1 at index %2 to $%3!", _uid, _c, _pdata], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                            };
                                        };
                                    };
                                };
                            };
                            if (RPM_Saving_Debug) then {
                                if (RPM_Diagnostics) then {
                                    [format["UltRP(Server)|Stats|Bank array saved to MySQL in %1 seconds!",  round(time - _sbanktime)], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                };
                            };
                        };
                        RPM_Saving_BankSaved = true;
                    };
                };
                // Licenses
                case "a22": {
                    RPM_Saving_LicensesSaved = false;
                    _varr spawn {
                        private ["_c","_n","_licenses","_process","_lic","_parr","_uid","_pdata","_darr","_slictime","_online"];
                        _slictime = time;
                        _darr = _this select 1;
                        _online = call RPM_Cfg_Objects_GetOnlineUIDs;
                        if (count(_online) >= 1) then {
                            for [{_c = 0}, {_c < count(_darr)}, {_c = _c + 1}] do {
                                _parr = _darr select _c;
                                _uid = _parr select 0;
                                if (_uid in _online) then {
                                    _pdata = _parr select 1;
                                    _process = false;
                                    _licenses = 0;
                                    for [{_n = 0}, {_n < count(_pdata)}, {_n = _n + 1}] do {
                                        _lic = _pdata select _n;
                                        // If ARMA2Net
                                        if (RPM_Saving_System == 1) then {
                                            _process = (call compile (format['"Arma2Net.Unmanaged" callExtension "CLServer2Lib [Licenses_LicenseAdd, ""%1"", ""%2""]";', _uid, _lic])) call RPM_str_strToBool;
                                            if (RPM_Saving_Debug) then {
                                                if (RPM_Saving_Debug) then {
                                                    if (RPM_Diagnostics) then {
                                                        [format["RPM(Stats)|Save|%1|%2|%3|%4", _this select 0, _uid, _lic, _process], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                                    };
                                                };
                                            };
                                        };
                                        if (_process) then {
                                            _licenses = _licenses + 1;
                                        };
                                    };
                                    if (RPM_Saving_Debug) then {
                                        if (_licenses >= 1) then {
                                            if (RPM_Diagnostics) then {
                                                [format["UltRP(Server)|Stats|Processed %1 licenses at index %2 for UID %3!",  _licenses, _n, _uid], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                            };
                                        };
                                    };
                                };
                            };
                            if (RPM_Saving_Debug) then {
                                if (RPM_Diagnostics) then {
                                    [format["UltRP(Server)|Stats|License array saved to MySQL in %1 seconds!",  round(time - _slictime)], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                };
                            };
                        };
                        RPM_Saving_LicensesSaved = true;
                    };
                };
                // Storage
                case "a82": {
                    RPM_Saving_StorageSaved = false;
                    _varr spawn {
                        private ["_c","_n","_items","_arr","_parr","_uid","_pdata","_darr","_sstortime","_online","_process","_itemid","_amount"];
                        _sstortime = time;
                        _darr = _this select 1;
                        _online = call RPM_Cfg_Objects_GetOnlineUIDs;
                        if (count(_online) >= 1) then {
                            for [{_c = 0}, {_c < count(_darr)}, {_c = _c + 1}] do {
                                _parr = _darr select _c;
                                _uid = _parr select 0;
                                if (_uid in _online) then {
                                    _pdata = _parr select 1;
                                    _process = false;
                                    _items = 0;
                                    for [{_n = 0}, {_n < count(_pdata)}, {_n = _n + 1}] do {
                                        _arr = _pdata select _n;
                                        _itemid = _arr select 0;
                                        _amount = _arr select 1;
                                        // If ARMA2Net
                                        if (RPM_Saving_System == 1) then {
                                            _process = (call compile (format['"Arma2Net.Unmanaged" callExtension "CLServer2Lib [Storage_SetStorageItemAmount, ""%1"", ""%2"", ""%3""]";', _uid, _itemid, _amount])) call RPM_str_strToBool;
                                            if (RPM_Saving_Debug) then {
                                                if (RPM_Saving_Debug) then {
                                                    if (RPM_Diagnostics) then {
                                                        [format["RPM(Stats)|Save|%1|%2|%3|%4|%5", _this select 0, _uid, _itemid, _amount, _process], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                                    };
                                                };
                                            };
                                        };
                                        if (_process) then {
                                            _items = _items + 1;
                                        };
                                    };
                                    if (RPM_Saving_Debug) then {
                                        if (_items >= 1) then {
                                            if (RPM_Diagnostics) then {
                                                [format["UltRP(Server)|Stats|Processed %1 items in storage at index %2 for UID %3!",  _items, _n, _uid], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                            };
                                        };
                                    };
                                };
                                if (RPM_Saving_Debug) then {
                                    if (RPM_Diagnostics) then {
                                        [format["UltRP(Server)|Stats|Storage array saved to MySQL in %1 seconds!",  round(time - _sstortime)], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                    };
                                };
                            };
                            RPM_Saving_StorageSaved = true;
                        };
                    };
                };
                case "RPM_SkillsArray": {
                    RPM_Saving_SkillsSaved = false;
                    _varr spawn {
                        private ["_c","_n","_process","_parr","_uid","_pdata","_darr","_online","_skills","_sskillstime","_skillarr","_skill","_points"];
                        _sskillstime = time;
                        _darr = _this select 1;
                        _online = call RPM_Cfg_Objects_GetOnlineUIDs;
                        if (count(_online) >= 1) then {
                            for [{_c = 0}, {_c < count(_darr)}, {_c = _c + 1}] do {
                                _parr = _darr select _c;
                                _uid = _parr select 0;
                                if (_uid in _online) then {
                                    _pdata = _parr select 1;
                                    _process = false;
                                    _skills = 0;
                                    for [{_n = 0}, {_n < count(_pdata)}, {_n = _n + 1}] do {
                                        _skillarr = _pdata select _n;
                                        _skill = _skillarr select 0;
                                        _points = _skillarr select 1;
                                        // If ARMA2Net
                                        if (RPM_Saving_System == 1) then {
                                            _process = (call compile (format['"Arma2Net.Unmanaged" callExtension "CLServer2Lib [Skills_SetSkillPoints, ""%1"", ""%2"", ""%3""]";', _uid, _skill, _points])) call RPM_str_strToBool;
                                            if (RPM_Saving_Debug) then {
                                                if (RPM_Diagnostics) then {
                                                    [format["RPM(Stats)|Save|%1|%2|%3|%4", _this select 0, _uid, _skill, _process], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                                };
                                            };
                                        };
                                        if (_process) then {
                                            _skills = _skills + 1;
                                        };
                                    };
                                    if (RPM_Saving_Debug) then {
                                        if (_skills >= 1) then {
                                            if (RPM_Diagnostics) then {
                                                [format["UltRP(Server)|Stats|Processed %1 skills at index %2 for UID %3!",  _skills, _n, _uid], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                            };
                                        };
                                    };
                                };
                            };
                            if (RPM_Saving_Debug) then {
                                if (RPM_Diagnostics) then {
                                    [format["UltRP(Server)|Stats|Skills array saved to MySQL in %1 seconds!",  round(time - _sskillstime)], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                };
                            };
                        };
                        RPM_Saving_SkillsSaved = true;
                    };
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Saving_VarIndex = {
    private ["_ret","_arrvar","_arrtemp","_i","_variable"];
    _ret = -1;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 2) then {
                _arrvar = _this select 0;
                if (!(isNil("_arrvar"))) then {
                    _arrtemp = [];
                    switch (typeName(_arrvar)) do {
                        case "ARRAY": {
                            _arrtemp = + _arrvar;
                        };
                        case "STRING": {
                            if (_arrvar call RPM_str_Length >= 1) then {
                                _arrtemp = call compile _arrvar;
                            };
                        };
                    };
                    if (!(isNil("_arrtemp"))) then {
                        _variable = _this select 1;
                        if (!(isNil("_variable"))) then {
                            if (typeName(_variable) == "STRING") then {
                                if (_variable call RPM_str_Length >= 1) then {
                                    // Find the variable in passed array
                                    for [{_i = 0}, {_i < count(_arrtemp)}, {_i = _i + 1}] do {
                                        if (count(_arrtemp select _i) == 2) then {
                                            if (((_arrtemp select _i) select 0) == _variable) then {
                                                _ret = _i;
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_UIDIndex = {
    private ["_ret","_uid","_arrvar","_arrtemp","_variable","_i","_varindex"];
    _ret = -1;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 3) then {
                _arrvar = _this select 0;
                if (!(isNil("_arrvar"))) then {
                    _arrtemp = [];
                    switch (typeName(_arrvar)) do {
                        case "ARRAY": {
                            _arrtemp = + _arrvar;
                        };
                        case "STRING": {
                            if (_arrvar call RPM_str_Length >= 1) then {
                                _arrtemp = call compile _arrvar;
                            };
                        };
                    };
                    if (!(isNil("_arrtemp"))) then {
                        _variable = _this select 1;
                        if (!(isNil("_variable"))) then {
                            if (_variable call RPM_str_Length >= 1) then {
                                _uid = _this select 2;
                                if (!(isNil("_uid"))) then {
                                    if (typeName(_uid) == "STRING") then {
                                        if (_uid call RPM_str_Length >= 1) then {
                                            // Find the variable in passed array
                                            _varindex = [_arrvar, _variable] call RPM_Saving_VarIndex;
                                            if (_varindex != -1) then {
                                                // Find the UID in passed variable array
                                                for [{_i = 0}, {_i < count((_arrtemp select _varindex) select 1)}, {_i = _i + 1}] do {
                                                    if (((((_arrtemp select _varindex) select 1) select _i) select 0) == _uid) then {
                                                        _ret = _i;
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_C_Load = {
    private ["_ret","_variable","_line"];
    _ret = false;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 1) then {
                _variable = _this select 0;
                if (!(isNil("_variable"))) then {
                    if (typeName(_variable) == "STRING") then {
                        if (_variable call RPM_str_Length >= 1) then {
                            if (RPM_Saving_Debug) then {
                                _line = format["(Client) Saving: Request Load %1", _variable];
                                if (isDedicated) then {
                                    diag_log _line;
                                } else {
                                    diag_log _line;
                                    RPM_Role commandChat _line;
                                };
                            };
                            format['if (isServer) then {
                                [%1, "%2"] call RPM_Saving_S_Load;
                            };', RPM_Role, _variable] call RPM_Cfg_Network_Broadcast;
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_S_Load = {
    private ["_ret","_uid","_player","_variable","_uidindex","_varindex","_data","_line","_cpeh"];
    if (!(isServer)) exitWith {};
    _ret = false;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 2) then {
                _player = _this select 0;
                if (!(isNil("_player"))) then {
                    if (typeName(_player) == "OBJECT") then {
                        if (!(isNull(_player))) then {
                            _uid = _player call RPM_Cfg_Objects_GetUIDByObject;
                            if (!(isNil("_uid"))) then {
                                if (_uid call RPM_str_Length >= 1) then {
                                    _variable = _this select 1;
                                    if (!(isNil("_variable"))) then {
                                        if (typeName(_variable) == "STRING") then {
                                            if (RPM_Saving_Debug) then {
                                                _line = format["(Server) Saving: Request Load %1", _variable];
                                                if (isDedicated) then {
                                                    diag_log _line;
                                                } else {
                                                    diag_log _line;
                                                    RPM_Role commandChat _line;
                                                };
                                            };
                                            _varindex = ["RPM_Saving_S_Array", _variable] call RPM_Saving_VarIndex;
                                            if (!(isNil("_varindex"))) then {
                                                if (_varindex != -1) then {
                                                    if (RPM_Saving_Debug) then {
                                                        _line = format["(Server) Saving/Load: Found Variable %1", _variable];
                                                        if (isDedicated) then {
                                                            diag_log _line;
                                                        } else {
                                                            diag_log _line;
                                                            RPM_Role commandChat _line;
                                                        };
                                                    };
                                                    _uidindex = ["RPM_Saving_S_Array", _variable, _uid] call RPM_Saving_UIDIndex;
                                                    if (!(isNil("_uidindex"))) then {
                                                        if (_uidindex != -1) then {
                                                            if (RPM_Saving_Debug) then {
                                                                _line = format["(Server) Saving/Load: Found UID %1 in Variable %2", _uid, _variable];
                                                                if (isDedicated) then {
                                                                    diag_log _line;
                                                                } else {
                                                                    diag_log _line;
                                                                    RPM_Role commandChat _line;
                                                                };
                                                            };
                                                            _data = (((RPM_Saving_S_Array select _varindex) select 1) select _uidindex) select 1;
                                                            if (!(isNil("_data"))) then {
                                                                RPM_Saving_C_Data = [];
                                                                if (RPM_Saving_Debug) then {
                                                                    _line = format["(Server) Saving: Sent Saved Data %1 for %2",_data, _variable];
                                                                    if (isDedicated) then {
                                                                        diag_log _line;
                                                                    } else {
                                                                        diag_log _line;
                                                                        RPM_Role commandChat _line;
                                                                    };
                                                                };
                                                                _cpeh = format["RPM_Saving_Data_%1", _player];
                                                                call compile format["%1 = %2;", _cpeh, [_player, [_data]]];
                                                                publicVariable _cpeh;
                                                                if (isDedicated) then {
                                                                    call compile format["RPM_Saving_Data_%1 = nil;", _player];
                                                                };
                                                            };
                                                        } else {
                                                            if (RPM_Saving_Debug) then {
                                                                _line = format["(Server) Saving/Load: Not Found UID %1 in Variable %2", _uid, _variable];
                                                                if (isDedicated) then {
                                                                    diag_log _line;
                                                                } else {
                                                                    diag_log _line;
                                                                    RPM_Role commandChat _line;
                                                                };
                                                            };
                                                            _cpeh = format["RPM_Saving_Data_%1", _player];
                                                            call compile format["%1 = %2;", _cpeh, [_player, [-1337]]];
                                                            publicVariable _cpeh;
                                                            if (isDedicated) then {
                                                                call compile format["RPM_Saving_Data_%1 = nil;", _player];
                                                            };
                                                        };
                                                    };
                                                } else {
                                                    if (RPM_Saving_Debug) then {
                                                        _line = format["(Server) Saving/Load: Not Found Variable %1", _variable];
                                                        if (isDedicated) then {
                                                            diag_log _line;
                                                        } else {
                                                            diag_log _line;
                                                            RPM_Role commandChat _line;
                                                        };
                                                    };
                                                    _cpeh = format["RPM_Saving_Data_%1", _player];
                                                    call compile format["%1 = %2;", _cpeh, [_player, [-1337]]];
                                                    publicVariable _cpeh;
                                                    if (isDedicated) then {
                                                        call compile format["RPM_Saving_Data_%1 = nil;", _player];
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_C_Save = {
    private ["_ret","_slot","_uid","_variable","_arr","_data","_save","_line"];
    _ret = false;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 2) then {
                _variable = _this select 0;
                if (!(isNil("_variable"))) then {
                    _uid = call RPM_Cfg_Objects_GetUID;
                    if (!(isNil("_uid"))) then {
                        if (typeName(_uid) == "STRING") then {
                            if (_uid call RPM_str_Length >= 1) then {
                                _data = _this select 1;
                                if (!(isNil("_data"))) then {
                                    if (RPM_Saving_Debug) then {
                                        _line = format["(Client) Saving: Request Save from %1 for %2 with Data %3", _uid, _variable, _data];
                                        if (isDedicated) then {
                                            diag_log _line;
                                        } else {
                                            diag_log _line;
                                            RPM_Role commandChat _line;
                                        };
                                    };
                                    // Pass variable, object, and data
                                    _arr = [_variable, RPM_Role, _data];
                                    if (isServer) then {
                                        // For local testing
                                        if (RPM_Saving_Debug) then {
                                            _line = format["(Client) Saving: Sent Save from %1 for %2 and Data %3 to local server", _uid, _variable, _data];
                                            if (isDedicated) then {
                                                diag_log _line;
                                            } else {
                                                diag_log _line;
                                                RPM_Role commandChat _line;
                                            };
                                        };
                                        _save = _arr call RPM_Saving_S_Save;
                                        if (_save) then {
                                            _ret = true;
                                        };
                                    } else {
                                        // For remoting via publicVariable EH
                                        // Find the slot (0-63)
                                        // As this is remoted success cannot be promised as with local call (Could add a client status EH, at cost of desync)
                                        _slot = [RPM_Role] call RPM_Cfg_Objects_GetSlot;
                                        if (_slot != -1) then {
                                            call compile format["RPM_Saving_S_Data%1 = [];", _slot];
                                            call compile format["RPM_Saving_S_Data%1 = %2;", _slot, [_variable, RPM_Role, _data]];
                                            publicVariable format["RPM_Saving_S_Data%1", _slot];
                                            if (RPM_Saving_Debug) then {
                                                _line = format["(Client) Saving: Sent Save from %1 for %2 and Data %3 to server", _uid, _variable, _data];
                                                if (isDedicated) then {
                                                    diag_log _line;
                                                } else {
                                                    diag_log _line;
                                                    RPM_Role commandChat _line;
                                                };
                                            };
                                            call compile format["RPM_Saving_S_Data%1 = [];", _slot];
                                            _ret = true;
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_S_Save = {
    private ["_ret","_uid","_variable","_data","_player","_varindex","_tmp","_uidindex","_temparr","_line"];
    if (!(isServer)) exitWith {};
    _ret = false;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 3) then {
                _variable = _this select 0;
                if (!(isNil("_variable"))) then {
                    _player = _this select 1;
                    if (!(isNil("_player"))) then {
                        if (typeName(_player) == "OBJECT") then {
                            _uid = _player call RPM_Cfg_Objects_GetUIDByObject;
                            if (!(isNil("_uid"))) then {
                                if (typeName(_uid) == "STRING") then {
                                    if (_uid call RPM_str_Length >= 1) then {
                                        _data = _this select 2;
                                        if (!(isNil("_data"))) then {
                                            if (RPM_Saving_Debug) then {
                                                _line = format["(Server) Saving: Save request received from %1 for %2 with data %3 to server", _uid, _variable, _data];
                                                if (isDedicated) then {
                                                    diag_log _line;
                                                } else {
                                                    diag_log _line;
                                                    RPM_Role commandChat _line;
                                                };
                                            };
                                            // Get the variable index
                                            _varindex = ["RPM_Saving_S_Array", _variable] call RPM_Saving_VarIndex;
                                            if (_varindex == -1) then {
                                                if (RPM_Saving_Debug) then {
                                                    _line = format["(Server) Saving: Didn't find the variable %1 in stats",  _variable];
                                                    if (isDedicated) then {
                                                        diag_log _line;
                                                    } else {
                                                        diag_log _line;
                                                        RPM_Role commandChat _line;
                                                    };
                                                };
                                                // Setup the shebang variable with player data initializer
                                                _tmp = [_variable, [[_uid, _data]]];
                                                // Set the next available indice to tmp array
                                                RPM_Saving_S_Array set[count(RPM_Saving_S_Array), _tmp];
                                                // See if the variable is now existant
                                                _varindex = ["RPM_Saving_S_Array", _variable] call RPM_Saving_VarIndex;
                                                if (_varindex != -1) then {
                                                    _line = format["(Server) Saving: Added the variable %1 to stats",  _variable];
                                                    if (isDedicated) then {
                                                        diag_log _line;
                                                    } else {
                                                        diag_log _line;
                                                        RPM_Role commandChat _line;
                                                    };
                                                    _ret = true;
                                                };
                                            } else {
                                                // Get the UID index
                                                _uidindex = ["RPM_Saving_S_Array", _variable, _uid] call RPM_Saving_UIDIndex;
                                                if (_uidindex == -1) then {
                                                    _line = format["(Server) Saving: Didn't find %1 in the variable %2 to stats",  _uid, _variable];
                                                    if (isDedicated) then {
                                                        diag_log _line;
                                                    } else {
                                                        diag_log _line;
                                                        RPM_Role commandChat _line;
                                                    };
                                                    // Didn't find UID in variable array
                                                    _temparr = + ((RPM_Saving_S_Array select _varindex) select 1);
                                                    ((RPM_Saving_S_Array select _varindex) select 1) set[count((RPM_Saving_S_Array select _varindex) select 1), [_uid, _data]];
                                                    _uidindex = ["RPM_Saving_S_Array", _variable, _uid] call RPM_Saving_UIDIndex;
                                                    // See if the UID in-variable is now existant
                                                    if (_uidindex != -1) then {
                                                        _line = format["(Server) Saving: Added %1 to variable %2 in stats with data %3",  _uid, _variable, _data];
                                                        if (isDedicated) then {
                                                            diag_log _line;
                                                        } else {
                                                            diag_log _line;
                                                            RPM_Role commandChat _line;
                                                        };
                                                        _ret = true;
                                                    };
                                                } else {
                                                    // Found UID in variable array
                                                    // Make a copy of variable array due to dimension
                                                    _temparr = + ((RPM_Saving_S_Array select _varindex) select 1) select _uidindex;
                                                    // Manually set the UID found indice data to new version data
                                                    _temparr set[1, _data];
                                                    // Manually set the variable found indice to new version of-copy in array
                                                    ((RPM_Saving_S_Array select _varindex) select 1) set[_uidindex, _temparr];
                                                    if (RPM_Saving_Debug) then {
                                                        _line = format["(Server) Saving: Updated variable %1 in stats for %2 with data %3",  _variable, _uid, _data];
                                                        if (isDedicated) then {
                                                            diag_log _line;
                                                        } else {
                                                            diag_log _line;
                                                            RPM_Role commandChat _line;
                                                        };
                                                    };
                                                    _ret = true;
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    diag_log format["(Server) Saving - Current Array Contents: %1", RPM_Saving_S_Array];
    _ret;
};
RPM_Saving_GetUIDInVarCount = {
    private ["_arrvar","_uid","_ret","_arrtemp","_i","_c"];
    _ret = 0;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 2) then {
                _arrvar = _this select 0;
                if (!(isNil("_arrvar"))) then {
                    _arrtemp = [];
                    switch (typeName(_arrvar)) do {
                        case "ARRAY": {
                            _arrtemp = + _arrvar;
                        };
                        case "STRING": {
                            if (_arrvar call RPM_str_Length >= 1) then {
                                _arrtemp = call compile _arrvar;
                            };
                        };
                    };
                    if (!(isNil("_arrtemp"))) then {
                        _uid = _this select 1;
                        if (!(isNil("_uid"))) then {
                            if (typeName(_uid) == "STRING") then {
                                if (_uid call RPM_str_Length >= 1) then {
                                    for [{_i = 0}, {_i < count(_arrtemp)}, {_i = _i + 1}] do {
                                        if ((count(_arrtemp select _i)) == 2) then {
                                            for [{_c = 0}, {_c < (count((_arrtemp select _i) select 1))}, {_c = _c + 1}] do {
                                                if ((count(((_arrtemp select _i) select 1) select _c)) >= 2) then {
                                                    if (((((_arrtemp select _i) select 1) select _c) select 0) == _uid) then {
                                                        _ret = _ret + 1;
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_C_DeleteAllByUID = {
    private ["_ret","_uid"];
    _ret = false;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 1) then {
                _uid = _this select 0;
                if (!(isNil("_uid"))) then {
                    if (typeName(_uid) == "STRING") then {
                        if (_uid call RPM_str_Length >= 1) then {
                            
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_S_DeleteAllByUID = {
    private ["_ret","_uid","_i","_uidindex","_var","_counted","_tmp","_pvarscount"];
    if (!(isServer)) exitWith {};
    _ret = false;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 1) then {
                _uid = _this select 0;
                if (!(isNil("_uid"))) then {
                    if (typeName(_uid) == "STRING") then {
                        if (_uid call RPM_str_Length >= 1) then {
                            _pvarscount = ["RPM_Saving_S_Array", _uid] call RPM_Saving_GetUIDInVarCount;
                            if (_pvarscount >= 1) then {
                                _counted = 0;
                                for [{_i = 0}, {_i < count(RPM_Saving_S_Array)}, {_i = _i + 1}] do {
                                    if ((count(RPM_Saving_S_Array select _i)) == 2) then {
                                        _var = (RPM_Saving_S_Array select _i) select 0;
                                        _uidindex = ["RPM_Saving_S_Array", _var, _uid] call RPM_Saving_UIDIndex;
                                        if (_uidindex != -1) then {
                                            _tmp = + (RPM_Saving_S_Array select _i);
                                            _tmp set[_uidindex, -1];
                                            _tmp = _tmp - [-1];
                                            RPM_Saving_S_Array set[_i, _tmp];
                                            _uidindex = ["RPM_Saving_S_Array", _var, _uid] call RPM_Saving_UIDIndex;
                                            if (_uidindex == -1) then {
                                                _counted = _counted + 1;
                                            };
                                        };
                                    };
                                };
                                if (_counted == _pvarscount) then {
                                    _ret = true;
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_C_DeleteAllByVariable = {
    private ["_ret","_variable","_index"];
    _ret = false;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 1) then {
                _variable = _this select 0;
                if (!(isNil("_variable"))) then {
                    if (typeName(_variable) == "STRING") then {
                        if (_variable call RPM_str_Length >= 1) then {
                            _index = ["RPM_Saving_C_Array", _variable] call RPM_Saving_VarIndex;
                            if (_index != -1) then {
                                RPM_Saving_C_Array set[_index, -1];
                                RPM_Saving_C_Array = RPM_Saving_C_Array - [-1];
                                _index = ["RPM_Saving_C_Array", _variable] call RPM_Saving_VarIndex;
                                if (_index != -1) then {
                                    _ret = true;
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_S_DeleteAllByVariable = {
    private ["_ret","_variable","_index"];
    if (!(isServer)) exitWith {};
    _ret = false;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 1) then {
                _variable = _this select 0;
                if (!(isNil("_variable"))) then {
                    if (_variable call RPM_str_Length >= 1) then {
                        _index = ["RPM_Saving_S_Array", _variable] call RPM_Saving_VarIndex;
                        if (_index != -1) then {
                            RPM_Saving_S_Array set[_index, -1];
                            RPM_Saving_S_Array = RPM_Saving_S_Array - [-1];
                            _index = ["RPM_Saving_S_Array", _variable] call RPM_Saving_VarIndex;
                            if (_index != -1) then {
                                _ret = true;
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_GetArrayLength = {
    private ["_ret","_arrtemp","_arrvar"];
    _ret = 0;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 1) then {
                _arrvar = _this select 0;
                if (!(isNil("_arrvar"))) then {
                    _arrtemp = [];
                    switch (typeName(_arrvar)) do {
                        case "ARRAY": {
                            _arrtemp = + _arrvar;
                        };
                        case "STRING": {
                            _arrtemp = call compile _arrvar;
                        };
                    };
                    if (!(isNil("_arrtemp"))) then {
                        _ret = (_arrtemp call RPM_str_ArrToStr) call RPM_str_Length;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_GetSavedVariableCount = {
    private ["_ret","_arrtemp","_arrvar"];
    _ret = 0;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 1) then {
                _arrvar = _this select 0;
                if (!(isNil("_arrvar"))) then {
                    _arrtemp = [];
                    switch (typeName(_arrvar)) do {
                        case "ARRAY": {
                            _arrtemp = + _arrvar;
                        };
                        case "STRING": {
                            _arrtemp = call compile _arrvar;
                        };
                    };
                    if (!(isNil("_arrtemp"))) then {
                        _ret = count(_arrtemp);
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Saving_GetSavedVariableLength = {
    private ["_ret","_variable","_arrtemp","_i","_arrvar"];
    _ret = 0;
    if (!(isNil("_this"))) then {
        if (typeName(_this) == "ARRAY") then {
            if (count(_this) == 2) then {
                _arrvar = _this select 0;
                if (!(isNil("_arrvar"))) then {
                    _arrtemp = [];
                    switch (typeName(_arrvar)) do {
                        case "ARRAY": {
                            _arrtemp = + _arrvar;
                        };
                        case "STRING": {
                            _arrtemp = call compile _arrvar;
                        };
                    };
                    if (!(isNil("_arrtemp"))) then {
                        _variable = _this select 1;
                        if (!(isNil("_variable"))) then {
                            if (typeName(_variable) == "STRING") then {
                                if (_variable call RPM_str_Length >= 1) then {
                                    for [{_i = 0}, {_i < count(_arrtemp)}, {_i = _i + 1}] do {
                                        if ((typeName(_arrtemp select _i)) == "ARRAY") then {
                                            if (count(_arrtemp select _i) >= 2) then {
                                                if ((typeName((_arrtemp select _i) select 0)) == "STRING") then {
                                                    if (((_arrtemp select _i) select 0) == _variable) then {
                                                        _ret = (((_arrtemp select _i) select 1) call RPM_str_ArrToStr) call RPM_str_Length;
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
//FORCE SAVE
RPM_Saving_C_ToldToSave = {
    private ["_ret"];
    _ret = false;
    // Save bank
    ["i4", i4] call RPM_Saving_C_Save;
    // Save licenses
    ["a22", a22] call RPM_Saving_C_Save;
    // Save storage
    ["a82", (a82 select 0) select 1] call RPM_Saving_C_Save;
    // Save sklills
    ["RPM_SkillsArray", (RPM_SkillsArray select 0) select 1] call RPM_Saving_C_Save;
    _ret = true;
    _ret;
};
RPM_Saving_S_Loop = {
    private ["_ret"];
    if (!(isServer)) exitWith {};
    _ret = false;
    [] spawn {
        private ["_h","_stime","_etime"];
        if (RPM_Saving_S_LoopActive) exitWith {};
        RPM_Saving_S_LoopActive = true;
        while {RPM_Saving_S_LoopActive} do {
            if (time >= 15) then {
                waitUntil {((!(RPM_Saving_Saving)) && (time - i26 >= RPM_Saving_Interval))};
                RPM_Saving_Saving = true;
                publicVariable "RPM_Saving_Saving";
                format['if (!(isServer)) then {
                    RPM_Role globalChat "%1";
                }', format[localize "v107"]] call RPM_Cfg_Network_Broadcast;
                sleep 1.5;
                _stime = time;
                _h = call RPM_Saving_Saver;
                waitUntil {_h};
                _etime = time;
                i26 = time;
                publicVariable "i26";
                RPM_Saving_Saving = false;
                publicVariable "RPM_Saving_Saving";
                format['if (!(isServer)) then {
                    RPM_ROle globalChat "%1";
                }', format[localize "v106", _etime - _stime]] call RPM_Cfg_Network_Broadcast;
                sleep RPM_Saving_Interval;
            };
        };
        RPM_Saving_S_LoopActive = false;
        call RPM_Saving_S_Loop;
    };
    _ret = true;
    _ret;
};
RPM_Saving_Init = {
    [] spawn {
        private ["_i","_var"];
        // Server
        if ((isServer) || (isDedicated) || (local server)) then {
            [format["UltRP(Server)|SavingInit"], false] call RPM_Cfg_Server_DiagnosticsDumper;
            execVM "RPM\Server\FNC_Inventory.sqf";
            waitUntil {(!(isNil("b40")))};
            // Save functions
            call RPM_Saving_JipLoop;
            bank_vault1 setVariable ["robbed", [false, false, 10000, 0, ""], true];
            bank_vault2 setVariable ["robbed", [false, false, 10000, 0, ""], true];
            CBA_display_ingame_warnings = false;
            publicVariable "CBA_display_ingame_warnings";
            onPlayerConnected {
                publicVariable "CBA_display_ingame_warnings";
                publicVariable "RPM_Saving_Loading";
                publicVariable "RPM_Saving_Saving";
                publicVariable "RPM_JIP";
            };
            RPM_Saving_S_Array = [];
            // Add eventhandlers for each unit
            for [{_i = 0}, {_i < PlayerCount}, {_i = _i + 1}] do {
                _var = format["RPM_Saving_S_Data%1", _i];
                call compile format["RPM_Saving_S_Data%1 = [];", _i];
                _var addPublicVariableEventHandler {
                    _slot = [[_this select 0, 16, ((_this select 0) call RPM_str_Length)-1] call RPM_str_SubString] call RPM_Cfg_Objects_GetSlotByString;
                    if (!(isNil("_slot"))) then {
                        diag_log format["%1 UltRP(Server)|Saving|Received|%2|%3", format["(T:%1)", floor(time)], _slot, _this select 1];
                    };
                    _save = (_this select 1) call RPM_Saving_S_Save;
                    if (_save) then {
                        diag_log format["%1 UltRP(Server)|Saving|Saved|%2", format["(T:%1)", floor(time)], _slot];
                    };
                };
            };
            call RPM_Saving_S_Loop;
            if (RPM_Diagnostics) then {
                [format["UltRP(Server)|Started"], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
        };
        // Client
        if ((local server) || (!(isDedicated))) then {
            RPM_Saving_C_Array = [];
            RPM_Saving_C_Data = [];
            RPM_Saving_C_Received = [];
            "RPM_Saving_C_Data" addPublicVariableEventHandler {
                if (!(isNil("_this"))) then {
                    RPM_Saving_C_Received = _this;
                };
            };
            if (RPM_Diagnostics) then {
                [format["UltRP(Client)|Started"], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
        };
    };
};
RPM_Saving_JipLoop = {
    [] spawn {
        [format["UltRP(Server)|JIPActive"], false] call RPM_Cfg_Server_DiagnosticsDumper;
        while {true} do {
            if (RPM_JIP) then {
                publicVariable "CBA_display_ingame_warnings";
                publicVariable "StaticSeed";
                publicVariable "Saved_Array";
                publicVariable "RPM_ShopsArray";
                publicVariable "RPM_FactoryArray";
                publicVariable "RPM_FarmsArray";
                publicVariable "RPM_Stats_LawsArray";
                publicVariable "RPM_Saving_Loading";
                publicVariable "RPM_Saving_Saving";
                publicVariable "RPM_Vehicles_Array";
                publicVariable "RPM_Logs";
                if (!(isNil("RPM_Admins"))) then {
                    publicVariable "RPM_Admins";
                };
                publicVariable "a4";
                publicVariable "a5";
                publicVariable "a7";
                publicVariable "a15";
                publicVariable "a37";
                publicVariable "b19";
                publicVariable "a39";
                publicVariable "a45";
                publicVariable "a49";
                publicVariable "a60";
                publicVariable "a77";
                publicVariable "b8";
                publicVariable "b24";
                publicVariable "i1";
                publicVariable "i10";
                publicVariable "i20";
                publicVariable "i21";
                publicVariable "i26";
                RPM_JIP = false;
                publicVariable "RPM_JIP";
            };
            sleep 0.1;
        };
    };
};
