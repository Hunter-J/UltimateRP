// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Keychain
RPM_Cfg_Keychain_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_i","_key","_index","_tgtnum","_tgt","_sel"];
        _tgtnum = _this select 0;
        _tgt = RPM_POBJArr select _tgtnum;
        if ((!(alive _tgt)) || (isNull(_tgt))) exitWith {};
        if (!(createDialog "KeychainDialog")) exitWith {
            hint format[localize "v1"];
        };
        for [{_i = 0}, {_i < count (a20)}, {_i = _i + 1}] do {
            _key = format["%1", a20 select _i];
            _index = lbAdd[16, _key];
            lbSetData[16, _index, _key];
        };
        lbSetCurSel[16, 0];
        while {(ctrlVisible 13) and (!(ctrlVisible 2))} do {
            _sel = lbCurSel 16;
            if (_sel >= 0) then {
                buttonSetAction[13, format['[%1, %2] call RPM_Cfg_Inv_Givekey;', _sel, _tgtnum]];
                buttonSetAction[14, format['[%1, %2] call RPM_Cfg_Inv_Dupekey;', _sel, _tgtnum]];
                buttonSetAction[15, format['[%1] call RPM_Cfg_Inv_Dropkey;', _tgtnum]];
            };
        };
    };
    _ret = true;
    _ret
};
