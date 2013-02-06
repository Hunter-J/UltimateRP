// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

RPM_Cfg_Jail_Bail_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        if (name RPM_Role call RPM_Cfg_Crimes_GetBounty == 0) exitWith {
            hint format[localize "v417"];
        };
        if (!(createDialog "BailDialog")) exitWith {
            hint format[localize "v1"];
        };
        while {ctrlVisible 173} do {
            ctrlSetText[173, format["%1", name RPM_Role call RPM_Cfg_Crimes_GetBounty]];
            ctrlSetText[174, format["%1", i4]];
            if ((!((ctrlText 175) call RPM_str_IsNumeric)) || ((ctrlText 175) call RPM_str_StrToInt) >= RPM_MAX_NUMBER) then {
                ctrlSetText[175, "1"];
            };
            buttonSetAction[176, format["[""%1"", %2] call RPM_Cfg_Jail_PayBail;", name RPM_Role, (ctrlText 175) call RPM_str_StrToInt]];
            sleep 0.001;
        };
    };
    _ret = true;
    _ret;
};
