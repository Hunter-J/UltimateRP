// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

RPM_Cfg_Shops_GUI = {
    private ["_ret","_shopid","_npc"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _shopid = _this select 0;
    if ((_shopid in a80) && (RPM_Cop)) exitWith {
        hint format[localize "v482"];
    };
    _npc = _shopid call RPM_Cfg_Shops_GetShopObj;
    if (([_npc, 0] call RPM_Cfg_Inv_NPCGetInUse) && (([_npc, 0] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {
        hint format[localize "v31"];
    };
    [_npc, _shopid] spawn {
        private ["_shopid","_shopsel0","_invsel0","_npc","_h"];
        _npc = _this select 0;
        _shopid = _this select 1;
        if (!(createDialog "ShopsDialog")) exitWith {
            hint format[localize "v1"];
        };
        [_npc, 0, RPM_Role] call RPM_Cfg_Inv_NPCSetInUse;
        if (_shopid == 13) then {
            ctrlShow[23, false];
        } else {
            if ([_shopid, name RPM_Role] call RPM_Cfg_Shops_IsOwner) then {
                ctrlEnable[23, false];
            };
        };
        _h = [_shopid, 0, 0] call RPM_Cfg_Shops_RepaintListBoxes;
        waitUntil {_h};
        buttonSetAction[23, format["[%1, %2] call RPM_Cfg_Shops_SetOwner;", RPM_Role, _shopid]];
        while {ctrlVisible 17} do {
            if ((!((ctrlText 26) call RPM_str_IsNumeric)) || ((ctrlText 26) call RPM_str_StrToInt) >= RPM_MAX_NUMBER) then {
                ctrlSetText[26, "1"];
            };
            _shopsel0 = lbCurSel 17;
            _invsel0 = lbCurSel 21;
            if ((_shopsel0 >= 0) && (!(b1))) then {
                buttonSetAction[24, format["[%1, %2, %3, ctrlText 26] call RPM_Cfg_Shops_BuyItem", _shopid, _shopsel0, _invsel0]];
            } else {
                buttonSetAction[24, ""];
            };
            if ((_invsel0 >= 0) && (!(b1))) then {
                buttonSetAction[25, format["[%1, %2, %3, ctrlText 26] call RPM_Cfg_Shops_SellItem", _shopid, _shopsel0, _invsel0]];
            } else {
                buttonSetAction[25, ""];
            };
            sleep 0.001;
        };
        waitUntil {((isNull(RPM_Role)) || (!(alive RPM_Role)) || (!(ctrlVisible 17)))};
        [_npc, 0, objNull] call RPM_Cfg_Inv_NPCSetInUse;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Shops_RepaintListBoxes = {
    private ["_i","_maxstr","_cur","_max","_itemname","_index0","_pricestr","_weightstr","_weps","_vcls","_vcl","_stocks","_shopid","_magstemp","_curstr","_ret","_distance","_vclstr","_npcobj","_line","_amountstr","_selection0","_selection1"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _shopid = _this select 0;
    _selection0 = _this select 1;
    _selection1 = _this select 2;
    lbClear 17;
    _stocks = [_shopid] call RPM_Cfg_Shops_GetStocksArr;
    for [{_i = 0}, {_i < count(_stocks)}, {_i = _i + 1}] do {
        // items
        _line = "";
        _itemname = [((_stocks select _i) select 0)] call RPM_Cfg_Items_GetName;
        // Price
        _pricestr = "";
        if (call RPM_Cfg_Mayor_IsOnline) then {
            _pricestr = format["$%1", [((_stocks select _i) select 0)] call RPM_Cfg_Items_GetPriceWithTax];
        } else {
            _pricestr = format["$%1", [((_stocks select _i) select 0)] call RPM_Cfg_Items_GetPrice];
        };
        // Weight
        _weightstr = format["%1kg", [((_stocks select _i) select 0)] call RPM_Cfg_Items_GetWeight];
        // Qty
        _cur = [_shopid, ((_stocks select _i) select 0)] call RPM_Cfg_Shops_GetStockCur;
        _max = [_shopid, ((_stocks select _i) select 0)] call RPM_Cfg_Shops_GetStockMax;
        _maxstr = "0";
        if (_max == -1) then {
            _maxstr = "100";
        } else {
            _maxstr = format["%1", _max];
        };
        _curstr = "100";
        if (_cur != -1) then {
            _curstr = format["%1", _cur];
        };
        _amountstr = format["%1/%2", _curstr, _maxstr];
        _line = _line + _itemname + " (" + _weightstr + ", " + _amountstr + ", " + _pricestr + ")";
        _index0 = lbAdd[17, _line];
        lbSetData[17, _index0, _line];
    };
    lbSetCurSel[17, _selection0];
    lbClear 21;
    _weps = RPM_Role call RPM_Cfg_Objects_GetMyWeapons;
    for [{_i = 0}, {_i < count(_weps)}, {_i = _i + 1}] do {
        // items
        _line = "";
        _itemname = [([(_weps select _i)] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetName;
        _line = _line + _itemname + " (" + "1" + ")";
        _index0 = lbAdd[21, _line];
        lbSetData[21, _index0, _line];
    };
    _magstemp = RPM_Role call RPM_Cfg_Objects_GetMyMags;
    for [{_i = 0}, {_i < count(_magstemp)}, {_i = _i + 1}] do {
        // Item
        _line = "";
        _itemname = [([((_magstemp select _i) select 0)] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetName;
        _amountstr = format["%1", (((_magstemp select _i) select 1) call RPM_str_IntToStr)];
        _line = _line + _itemname + " (" + _amountstr + ")";
        _index0 = lbAdd[21, _line];
        lbSetData[21, _index0, _line];
    };
    _npcobj = objNull;
    {
        if (RPM_Role distance _x <= 8) then {
            _npcobj = _x;
        };
    } forEach a38;
    _distance = 30;
    if ((_shopid == 1) || (_shopid == 2)) then {
        _distance = 100;
    };
    _vcls = [_npcobj, _distance] call RPM_Cfg_Objects_GetMyVCLS;
    for [{_i = 0}, {_i < count(_vcls)}, {_i = _i + 1}] do {
        // Item
        _line = "";
        _vcl = _vcls select _i;
        _vclstr = format["%1", _vcl];
        _itemname = format["%1 (ID: %2)", [([(typeOf(_vcl))] call RPM_Cfg_Items_GetIDByClass)] call RPM_Cfg_Items_GetName, [_vclstr, format["vcl_%1_", name RPM_Role], ""] call KRON_Replace];
        _line = _line + _itemname + " (" + "1" + ")";
        _index0 = lbAdd[21, _line];
        lbSetData[21, _index0, _line];
    };
    for [{_i = 0}, {_i < count(a19)}, {_i = _i + 1}] do {
        // Item
        _line = "";
        _itemname = [((a19 select _i) select 0)] call RPM_Cfg_Items_GetName;
        _amountstr = format["%1", (a19 select _i) select 1];
        _line = _line + _itemname + " (" + _amountstr + ")";
        _index0 = lbAdd[21, _line];
        lbSetData[21, _index0, _line];
    };
    lbSetCurSel[21, _selection1];
    _ret = true;
    _ret;
};
RPM_Cfg_Shops_Bank_GUI = {
    private ["_ret"];
    _ret = false;
    _ret = true;
    _ret;
};
