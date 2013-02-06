// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Licensing
RPM_Cfg_Inv_InitLicense = {
    private ["_license","_price","_str","_ret"];
    _ret = false;
    _license = _this select 0;
    _price = _this select 1;
    _str = _this select 2;
    if (!(_license call RPM_Cfg_Inv_HasLicense)) then {
        if ([_license, _price, _str] call RPM_Cfg_Inv_BuyLicense) then {
            _ret = true;
        };
    } else {
        hint format[localize "v33", _str];
    };
    _ret;
};
RPM_Cfg_Inv_BuyLicense = {
    private ["_ret","_license","_price","_str"];
    _ret = false;
    _license = _this select 0;
    _price = _this select 1;
    _str = _this select 2;
    if (([521] call RPM_Cfg_Inv_GetItemAmount) < _price) then {
        hint format[localize "v4"];
    } else {
        if ([521, _price] call RPM_Cfg_Inv_DelItemAmount) then {
            if (_license call RPM_Cfg_Inv_AddLicense) then {
                hint format[localize "v213", _str, _price];
                _ret = true;
            } else {
                [_price] call RPM_Cfg_Inv_AddItemAmount;
            };
        };
    };
    _ret;
};
RPM_Cfg_Inv_HasLicense = {
    private ["_ret"];
    _ret = false;
    if (_this in a22) then {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Inv_HasLicenseStr = {
    private ["_ret"];
    _ret = "";
    if (_this call RPM_Cfg_Inv_HasLicense) then {
        _ret = "Yes";
    } else {
        _ret = "No";
    };
    _ret;
};
RPM_Cfg_Inv_AddLicense = {
    private ["_ret","_license"];
    _ret = false;
    _license = _this;
    if (!(_license call RPM_Cfg_Inv_HasLicense)) then {
        a22 set[count(a22), _license];
        if (_license call RPM_Cfg_Inv_HasLicense) then {
            if (!(RPM_Saving_Saving)) then {
                ["a22", a22] call RPM_Saving_C_Save;
                a22 call RPM_Saving_SaveLicenses_C
            };
            if (RPM_Diagnostics) then {
                [format["RPM(Licenses)|Added|%1|%2", name RPM_Role, _license], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            call RPM_Cfg_Inv_CompileStatsArray;
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Inv_RemoveLicense = {
    private ["_i","_ret","_license","_found"];
    _ret = false;
    _license = _this;
    _found = -1;
    for [{_i = 0}, {_i < count(a22)}, {_i = _i + 1}] do {
        if ((a22 select _i) == _license) then {
            _found = _i;
        };
    };
    if (_found != -1) then {
        a22 set[_found, -1];
        a22 = a22 - [-1];
        if (!(_license call RPM_Cfg_Inv_HasLicense)) then {
            if (!(RPM_Saving_Saving)) then {
                ["a22", a22] call RPM_Saving_C_Save;
                call RPM_Saving_SaveLicenses_C
            };
            if (RPM_Diagnostics) then {
                [format["RPM(Licenses)|Removed|%1|%2", name RPM_Role, _license], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            call RPM_Cfg_Inv_CompileStatsArray;
            _ret = true;
        };
    };
    _ret;
};
