// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

RPM_Cfg_Vehicles_Impound_GUI = {
    private ["_ret"];
    _ret = false;
    if (b1) exitWith {};
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [] spawn {
        private ["_i","_owner","_vehs","_class","_plate","_sel","_player","_avehs","_fee","_line"];
        if (!(createDialog "VehReleaseDialog")) exitWith {
            hint format[localize "v1"];
        };
        _vehs = [];
        if (RPM_Civ) then {
            for [{_i = 0}, {_i < count(a39)}, {_i = _i + 1}] do {
                _owner = (a39 select _i) select 0;
                if (_owner == name RPM_Role) then {
                    _vehs = (a39 select _i) select 1;
                };
            };
        } else {
            for [{_i = 0}, {_i < count(a39)}, {_i = _i + 1}] do {
                _player = a39 select _i;
                _avehs = _player select 1;
                _vehs = _vehs + _avehs;
            };
        };
        for [{_i = 0}, {_i < count(_vehs)}, {_i = _i + 1}] do {
            _line = "";
            _plate = (_vehs select _i) select 0;
            _class = (_vehs select _i) select 1;
            if (RPM_Civ) then {
                _fee = round([[_class] call RPM_Cfg_Items_GetIDByClass] call RPM_Cfg_Items_GetPrice) * 0.20;
                _line = format["%1 (%2) - $%3", [([_class] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetName, _plate, _fee];
            } else {
                _line = format["%1 (%2)", [([_class] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetName, _plate];
            };
            lbAdd[185, _line];
            lbSetData[185, _line];
        };
        lbSetCurSel[185, 0];
        while {ctrlVisible 185} do {
            _sel = lbCurSel 185;
            if ((_sel >= 0) && (!(b1))) then {
                buttonSetAction[186, format["%1 call RPM_Cfg_Vehicles_ReleaseVeh", _sel]];
            } else {
                buttonSetAction[186, ""];
            };
        };
    };
    _ret = true;
    _ret;
};
