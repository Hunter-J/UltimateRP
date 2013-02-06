// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

private ["_i","_varName"];
RPM_pub_varCount = _this select 0;
RPM_pub_varNum = _this select 1;
RPM_pub_varName = format["RPM_pub_Pstr_%1", RPM_pub_varNum];
for [{_i=0}, {_i <= (RPM_pub_varCount)}, {_i=_i+1}] do {
    _varName = format["RPM_pub_Pstr_%1", _i];
    call compile format['%1 = " ";', _varName];
    _varName addPublicVariableEventHandler {call compile (_this select 1);};
};
RPM_Cfg_Network_Broadcast = {
    if ((TypeName _this) == "STRING") then {
        call compile format['%1 = ''%2'';', RPM_pub_varName, _this];
        publicVariable RPM_pub_varName;
        call compile _this;
        //RPM_Role commandChat str _this;
    } else {
        hint "Public Error: expecting String.";
    };
};
RPM_Cfg_Network_ExecPstr = {
    if ((TypeName _this) == "STRING") then {
        call compile format['%1 = ''%2'';', RPM_pub_varName, _this];
        publicVariable RPM_pub_varName;
        call compile _this;
    } else {
        hint "Public Error: expecting String.";
    };
};
RPM_Cfg_Network_ExecStr = {
    if ((TypeName _this) == "STRING") then {
        call compile _this;	
    } else {
        hint "Public Error: expecting String.";	
    };
};
b46 = true;
