// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Factory
RPM_Cfg_Factory_GUI = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    [(_this select 0)] spawn {
        private ["_producables","_factoryid","_itemid","_index0sel","_h","_uid","_repainted"];
        if (!(createDialog "FactoryDialog")) exitWith {
            hint format[localize "v1"];
        };
        _factoryid = _this select 0;
        _uid = call RPM_Cfg_Objects_GetUID;
        if (_uid call RPM_str_Length >= 1) then {
            buttonSetAction[50, format['["Factory_Storage", %1] call RPM_Cfg_Storage_GUI;', _factoryid]];
            _h = [_factoryid] call RPM_Cfg_Factory_RepaintFactoryListBoxes;
            waitUntil {_h};
            if ([_factoryid, _uid] call RPM_Cfg_Factory_IsOwner) then {
                ctrlEnable[47, true];
                ctrlEnable[48, false];
                ctrlEnable[49, true];
                ctrlEnable[50, true];
            } else {
                ctrlEnable[47, false];
                ctrlEnable[48, true];
                ctrlEnable[49, false];
                ctrlEnable[50, false];
                buttonSetAction[48, format["[%1, ""%2""] call RPM_Cfg_Factory_AddOwner", _factoryid, _uid]];
            };
            _producables = [_factoryid] call RPM_Cfg_Factory_GetFactoryProducablesArr;
            _repainted = false;
            while {true} do {
                if (!(ctrlVisible 33)) then {
                    _repainted = false;
                    if ((!((ctrlText 42) call RPM_str_IsNumeric)) || ((ctrlText 42) call RPM_str_StrToInt) >= 5000) then {
                        ctrlSetText[42, "1"];
                    };
                    _index0sel = lbCurSel 43;
                    if (_index0sel >= 0) then {
                        _itemid = (_producables select _index0sel) select 0;
                        buttonSetAction[47, format["[%1, %2, ctrlText 42] call RPM_Cfg_Factory_AddQueueItem;", _factoryid, _itemid]];
                    };
                } else {
                    if (!(_repainted)) then {
                        waitUntil {(!(ctrlVisible 33))};
                        _repainted = true;
                        _h = [_factoryid] call RPM_Cfg_Factory_RepaintFactoryListBoxes;
                        waitUntil {_h};
                    };
                };
                if ((!(ctrlVisible 33)) && (!(ctrlVisible 50))) exitWith {};
                sleep 0.001;
            };
        };
    };
    _ret = true;
    _ret;
};
// Repaint the factory's storage listbox (Main gui)
RPM_Cfg_Factory_RepaintFactoryListBoxes = {
    private ["_ret","_i","_line","_index0","_storagearr","_factoryid","_uid","_reqitemid","_reqamount","_reqitemname","_reqstr","_n","_itemid","_itemname","_reqarray","_producables","_amount"];
    _ret = false;
    _factoryid = _this select 0;
    _uid = call RPM_Cfg_Objects_GetUID;
    if (_uid call RPM_str_Length >= 1) then {
        lbClear 43;
        _producables = [_factoryid] call RPM_Cfg_Factory_GetFactoryProducablesArr;
        for [{_i = 0}, {_i < count(_producables)}, {_i = _i + 1}] do {
            _reqstr = "";
            _itemid = (_producables select _i) select 0;
            _itemname = [_itemid] call RPM_Cfg_Items_GetName;
            _reqarray = [_itemid] call RPM_Cfg_Items_GetProductionArr;
            if (count(_reqarray) == 1) then {
                _reqitemid = (_reqarray select 0) select 0;
                _reqamount = (_reqarray select 0) select 1;
                _reqitemname = format["%1 (%2)", ([_reqitemid] call RPM_Cfg_Items_GetName), _reqamount];
                _reqstr = _reqitemname;
            } else {
                for [{_n = 0}, {_n < count(_reqarray)}, {_n = _n + 1}] do {
                    _reqitemid = (_reqarray select _n) select 0;
                    _reqamount = (_reqarray select _n) select 1;
                    _reqitemname = format["%1 (%2)", ([_reqitemid] call RPM_Cfg_Items_GetName), _reqamount];
                    if (_reqstr call RPM_str_Length == 0) then {
                        _reqstr = _reqitemname;
                    } else {
                        _reqstr = _reqstr + ", " + _reqitemname;
                    };
                };
            };
            _line = "";
            _line = _line + _itemname + " (" + _reqstr + ")";
            _index0 = lbAdd[43, _line];
            lbSetData[43, _index0, _line];
        };
        lbSetCurSel[43, 0];
        lbClear 45;
        _storagearr = ["Factory_Storage", _factoryid, _uid] call RPM_Cfg_Storage_GetArray;
        for [{_i = 0}, {_i < count(_storagearr)}, {_i = _i + 1}] do {
            // Item
            _line = "";
            _itemid = (_storagearr select _i) select 0;
            _itemname = [_itemid] call RPM_Cfg_Items_GetName;
            // Amount
            _amount = (_storagearr select _i) select 1;
            _line = _line + _itemname + " (" + (_amount call RPM_str_IntToStr) + ")";
            _index0 = lbAdd[45, _line];
            lbSetData[45, _index0, _line];
        };
        lbSetCurSel[45, 0];
    };
    _ret = true;
    _ret;
};
