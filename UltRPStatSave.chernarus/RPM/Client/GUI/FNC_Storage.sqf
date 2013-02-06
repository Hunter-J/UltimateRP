// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

RPM_Cfg_Groups_GetDrugIndexes = {
    private ["_ret","_npc","_uid","_storage","_i"];
    _ret = [];
    _npc = _this select 0;
    _uid = _this select 1;
    _storage = ["Group_Storage", _npc, _uid] call RPM_Cfg_Storage_GetArray;
    for [{_i = 0}, {_i < count(_storage)}, {_i = _i + 1}] do {
        if (((_storage select _i) select 0) in a75) then {
            if (!(_i in _ret)) then {
                _ret set[count(_ret), _i];
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_GUI = {
    private ["_ret"];
    _ret = false;
    if (b1) exitWith {};
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if ((_this select 0) == "Trunk_Storage") then {
        if (((_this select 1) call RPM_Cfg_Vehicles_GetInUse) && (((_this select 1) call RPM_Cfg_Vehicles_GetInUser) != RPM_Role)) exitWith {
            hint format[localize "v30"];
        };
    };
    _this spawn {
        private ["_h","_weight","_capstr","_source","_selection0","_selection1","_extra","_title","_amount","_uid","_drugindexes"];
        if (!(createDialog "StorageDialog")) exitWith {
            hint format[localize "v1"];
        };
        _source = _this select 0;
        _extra = _this select 1;
        _uid = call RPM_Cfg_Objects_GetUID;
        _title = ctrlText 89;
        switch (_source) do {
            case "Factory_Storage": {
                _title = "Factory Storage";
            };
            case "Trunk_Storage": {
                _title = "Trunk";
            };
        };
        if (ctrlText 89 != _title) then {
            ctrlSetText[89, _title];
        };
        _h = [_source, _extra, _uid, 0, 0] call RPM_Cfg_Storage_RepaintListBoxes;
        waitUntil {_h};
        // Get drug indexes for reprocessing
        _drugindexes = [];
        if (_source == "Group_Storage") then {
            _drugindexes = [_extra, _uid] call RPM_Cfg_Groups_GetDrugIndexes;
        };
        while {true} do {
            if (ctrlVisible 33) then {
                if ((!((ctrlText 33) call RPM_str_isInteger)) || ((ctrlText 33) call RPM_str_StrToInt) >= RPM_MAX_NUMBER) then {
                    ctrlSetText[33, "1"];
                };
                _weight = [_source, _extra, _uid] call RPM_Cfg_Storage_GetWeight;
                if (_weight >= RPM_MAX_NUMBER) then {
                    _weight = format["%1kg",  [_source, _extra, _uid] call RPM_Cfg_Storage_GetCapacity];
                };
                _capstr = format["%1kg/%2kg", _weight, [_source, _extra, _uid] call RPM_Cfg_Storage_GetCapacity];
                if (ctrlText 177 != _capstr) then {
                    ctrlSetText[177, _capstr];
                };
                _selection0 = lbCurSel 34;
                _selection1 = lbCurSel 37;
                _amount = (ctrlText 33) call RPM_str_StrToInt;
                
                if (_source == "Group_Storage") then {
                    if (b35) then {
                        if (_selection0 in _drugindexes) then {
                            buttonSetAction[40, format['hint "%1";', format[localize "STRM_Reprocess_Active"]]];
                        } else {
                            buttonSetAction[40, format["[""%1"", %2, ""%3"", %4, %5, %6] call RPM_Cfg_Storage_Take;", _source, _extra, _uid, _selection0, _selection1, _amount]];
                        };
                    };
                } else {
                    if ((_selection0 >= 0)  && (!(b1))) then {
                        buttonSetAction[40, format["[""%1"", %2, ""%3"", %4, %5, %6] call RPM_Cfg_Storage_Take;", _source, _extra, _uid, _selection0, _selection1, _amount]];
                    } else {
                        buttonSetAction[40, ""];
                    };
                };
                if ((_selection1 >= 0) && (!(b1))) then {
                    buttonSetAction[41, format["[""%1"", %2, ""%3"", %4, %5, %6] call RPM_Cfg_Storage_Drop;", _source, _extra, _uid, _selection0, _selection1, _amount]];
                } else {
                    buttonSetAction[41, ""];
                };
                sleep 0.001;
            };
            if (!(ctrlVisible 33)) exitWith {};
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Storage_RepaintListBoxes = {
    private ["_ret","_source","_selection0","_selection1","_extra","_i","_line","_weightstr","_amountstr","_index0","_wep","_wepname","_mag","_magcount","_magname","_vcl","_vclstr","_vehname","_invitemid","_invitemname","_npc","_storagearray","_weps","_magstemp","_vcls","_itemid","_itemname","_uid"];
    _ret = false;
    _source = _this select 0;
    _extra = _this select 1;
    _uid = _this select 2;
    _selection0 = _this select 3;
    _selection1 = _this select 4;
    _npc = [_source, _extra, _uid] call RPM_Cfg_Storage_GetNPC;
    lbClear 34;
    _storagearray = [_source, _extra, _uid] call RPM_Cfg_Storage_GetArray;
    for [{_i = 0}, {_i < count(_storagearray)}, {_i = _i + 1}] do {
        // Item
        _line = "";
        _itemid = (_storagearray select _i) select 0;
        _itemname = [_itemid] call RPM_Cfg_Items_GetName;
        // Weight
        _weightstr = format["%1kg", (([_itemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * ([_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount)];
        // Qty
        _amountstr = format["%1", ([_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount)];
        _line = _line + _itemname + " (" + _weightstr + ", " + _amountstr + ")";
        _index0 = lbAdd[34, _line];
        lbSetData[34, _index0, _line];
    };
    lbSetCurSel[34, _selection0];
    lbClear 37;
    // Weapons
    _weps = RPM_Role call RPM_Cfg_Objects_GetMyWeapons;
    for [{_i = 0}, {_i < count(_weps)}, {_i = _i + 1}] do {
        // Item
        _line = "";
        _wep = _weps select _i;
        _wepname = format["%1", [([_wep] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetName];
        // Weight
        _weightstr = format["%1kg", (([([_wep] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat)];
        _line = _line + _wepname + " (" + _weightstr + ", " + "1" + ")";
        _index0 = lbAdd[37, _line];
        lbSetData[37, _index0, _line];
    };
    _magstemp = RPM_Role call RPM_Cfg_Objects_GetMyMags;
    for [{_i = 0}, {_i < count(_magstemp)}, {_i = _i + 1}] do {
        // Item
        _line = "";
        _mag = (_magstemp select _i) select 0;
        _magcount = (_magstemp select _i) select 1;
        _magname = format["%1", [([_mag] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetName];
        // Weight
        _weightstr = format["%1kg", (([([_mag] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * _magcount];
        // Qty
        _amountstr = format["%1", _magcount];
        _line = _line + _magname + " (" + _weightstr + ", " + _amountstr + ")";
        _index0 = lbAdd[37, _line];
        lbSetData[37, _index0, _line];
    };
    // Vehicles
    _vcls = [_npc, 50] call RPM_Cfg_Objects_GetMyVCLS;
    for [{_i = 0}, {_i < count(_vcls)}, {_i = _i + 1}] do {
        // Item
        _line = "";
        _vcl = _vcls select _i;
        _vclstr = format["%1", _vcl];
        _vehname = format["%1 (ID: %2)", [([(typeOf(_vcl))] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetName, [_vclstr, format["vcl_%1_", name RPM_Role], ""] call KRON_Replace];
        // Weight
        _weightstr = format["%1kg", [([(typeOf(_vcl))] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetWeight];
        _line = _line + _vehname + " (" + _weightstr + ", " + "1" + ")";
        _index0 = lbAdd[37, _line];
        lbSetData[37, _index0, _line];
    };
    // Inventory
    for [{_i = 0}, {_i < count(a19)}, {_i = _i + 1}] do {
        // Item
        _line = "";
        _invitemid = (a19 select _i) select 0;
        _invitemname = [_invitemid] call RPM_Cfg_Items_GetName;
        // Weight
        _weightstr = format["%1kg", (([_invitemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * ((a19 select _i) select 1)];
        // Qty
        _amountstr = format["%1", (a19 select _i) select 1];
        _line = _line + _invitemname + " (" + _weightstr + ", " + _amountstr + ")";
        _index0 = lbAdd[37, _line];
        lbSetData[37, _index0, _line];
    };
    lbSetCurSel[37, _selection1];
    _ret = true;
    _ret;
};
