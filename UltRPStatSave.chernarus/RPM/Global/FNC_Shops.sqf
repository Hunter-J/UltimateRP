// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Shops
RPM_Cfg_Shops_GetIndex = {
    private ["_i","_ret","_shopid"];
    _ret = -1;
    _shopid = _this;
    for [{_i = 0}, {_i < count(RPM_ShopsArray)}, {_i = _i + 1}] do {
        if (_shopid == (RPM_ShopsArray select _i) select 0) then {
            _ret = _i;
        };
    };
    _ret;
};
RPM_Cfg_Shops_GetShopObj = {
    private ["_ret","_shopid","_shopindex"];
    _ret = objNull;
    _shopid = _this;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopindex) select 1) select 1;
    };
    _ret;
};
RPM_Cfg_Shops_GetFreeMarker = {
    private ["_ret","_shopid","_arr","_i","_marker"];
    _ret = "";
    _shopid = _this select 0;
    _arr = [_shopid] call RPM_Cfg_Shops_GetMarkerArray;
    for [{_i = count(_arr)-1}, {_i >= 0}, {_i = _i - 1}] do {
        _marker = _arr select _i;
        if (count(nearestObjects[(getMarkerPos _marker),["Air", "Ship","Car","Motorcycle","Tank","Truck"], 6]) == 0) then {
            _ret = _marker;
        };
    };
    _ret;
};
RPM_Cfg_Shops_GetStocksArr = {
    private ["_ret","_shopid","_shopindex"];
    _ret = [];
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopid) select 1) select 2;
    };
    _ret;
};
RPM_Cfg_Shops_InShop = {
    private ["_ret","_shopid","_itemid","_i","_stocksarr"];
    _ret = false;
    _shopid = _this select 0;
    _itemid = _this select 1;
    _stocksarr = [_shopid] call RPM_Cfg_Shops_GetStocksArr;
    for [{_i = 0}, {_i < count(_stocksarr)}, {_i = _i + 1}] do {
        if (((_stocksarr select _i) select 0) == _itemid) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Shops_BuyItem = {
    private ["_ret","_shopid","_itemid","_amount","_minstock","_curstock","_iswep","_ismag","_isveh","_isitem","_isunit","_type","_box","_price","_class","_itemname","_exit","_i","_purchased","_haspwep","_hasswep","_selection0","_stocks","_spawnpos","_h","_license","_count","_licenses","_lcount","_havestr","_havenarr","_selection1","_uid","_skillstr","_skillarr","_skill","_points","_tskillstr"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (b1) exitWith {};
    _uid = call RPM_Cfg_Objects_GetUID;
    if (_uid call RPM_str_Length >= 1) then {
        b1 = true;
        _exit = false;
        _shopid = _this select 0;
        _selection0 = _this select 1;
        _selection1 = _this select 2;
        _stocks = [_shopid] call RPM_Cfg_Shops_GetStocksArr;
        _itemid = (_stocks select _selection0) select 0;
        _licenses = [_itemid] call RPM_Cfg_Items_GetLicenseArr;
        _lcount = count(_licenses);
        _count = 0;
        _havestr = "";
        _havenarr = [];
        // Are we licensed?
        for [{_i = 0}, {_i < count(_licenses)}, {_i = _i + 1}] do {
            _license = _licenses select _i;
            if ((_licenses select _i) call RPM_Cfg_Inv_HasLicense) then {
                _count = _count + 1;
            } else {
                _havenarr set[count(_havenarr), _license];
            };
            if ((_shopid == 24) || (_shopid == 25)) then {
                _count = count(_licenses);
            };
        };
        for [{_i = 0}, {_i < count(_havenarr)}, {_i = _i + 1}] do {
            _license = _havenarr select _i;
            if (count(_havenarr) == 1) then {
                _havestr = (_license) call RPM_Cfg_Inv_GetLicenseName;
            } else {
                if (count(_havenarr) == 2) then {
                    if (_i == 0) then {
                        _havestr = (_license call RPM_Cfg_Inv_GetLicenseName);
                    } else {
                        _havestr = _havestr + " & " + (_license call RPM_Cfg_Inv_GetLicenseName);
                    };
                } else {
                    if (_i == 0) then {
                        _havestr = (_license call RPM_Cfg_Inv_GetLicenseName);
                    } else {
                        if (_i != count(_havenarr)-1) then {
                            _havestr = _havestr + ", " + (_license call RPM_Cfg_Inv_GetLicenseName);
                        } else {
                            _havestr = _havestr + " & " + (_license call RPM_Cfg_Inv_GetLicenseName);
                        };
                    };
                };
            };
        };
        if (_count != _lcount) exitWith {
            hint format[localize "v532", _havestr];
            b1 = false;
        };
        // Do we have the skills?
        if (!([_uid, _itemid] call RPM_Cfg_Items_HasSkills)) exitWith {
            _skillstr = "";
            _points = 0;
            _skillarr = [_itemid] call RPM_Cfg_Items_GetSkillArr;
            for [{_i = 0}, {_i < count(_skillarr)}, {_i = _i + 1}] do {
                _skill = (_skillarr select _i) select 0;
                _points = (_skillarr select _i) select 1;
                _tskillstr = "";
                switch (_skill) do {
                    // Industry
                    case 0: {
                        _tskillstr = format[localize "STRM_Skills_IndustrySM"];
                    };
                    // Vehicles
                    case 1: {
                        _tskillstr = format[localize "STRM_Skills_VehiclesSM"];
                    };
                    // Weapons
                    case 2: {
                        _tskillstr = format[localize "STRM_Skills_WeaponsSM"];
                    };
                    case 3: {
                        _tskillstr = format[localize "STRM_Skills_CriminalSM"];
                    };
                    case 4: {
                        _tskillstr = format[localize "STRM_Skills_PoliceSM"];
                    };
                };
                _tskillstr = format["%1 %2", _points, _tskillstr];
                if ((_i == 0) && (count(_skillarr) == 1)) then {
                    _skillstr = _tskillstr;
                } else {
                    if ((count(_skillarr) > 1) && (_i+1 != count(_skillarr))) then {
                        _skillstr = _tskillstr + ", ";
                    } else {
                        if (_i+1 == count(_skillarr)) then {
                            _skillstr = _skillstr + _tskillstr;
                        };
                    };
                };
            };
            hint format[localize "STRM_Skills_PurchaseNeed", _skillstr + " " + localize "STRM_Skills_PointsSM"];
            b1 = false;
        };
        _amount = (_this select 3) call RPM_str_StrToLongInt;
        _price = 0;
        if (call RPM_Cfg_Mayor_IsOnline) then {
            _price = ([_itemid] call RPM_Cfg_Items_GetPriceWithTax) * _amount;
        } else {
            _price = ([_itemid] call RPM_Cfg_Items_GetPrice) * _amount;
        };
        if ([521] call RPM_Cfg_Inv_GetItemAmount < _price) exitWith {
            hint format[localize "v4"];
            b1 = false;
            _exit = true;
        };
        _itemname = [_itemid] call RPM_Cfg_Items_GetName;
        _minstock = [_shopid, _itemid] call RPM_Cfg_Shops_GetStockMin;
        _curstock = [_shopid, _itemid] call RPM_Cfg_Shops_GetStockCur;
        if (((_curstock - _amount) < 0) and (_minstock - _amount < 0) and (!(_minstock == -1)) and (!(_exit))) exitWith {
            hint format[localize "v125"];
            b1 = false;
            _exit = true;
        };
        if ((_amount == 0) and (!(_exit))) exitWith {
            hint format[localize "v210"];
            b1 = false;
            _exit = true;
        };
        if (((_amount > _curstock) || (_amount < 0)) and (!(_minstock == -1)) and (!(_exit))) exitWith {
            hint format[localize "v125"];
            b1 = false;
            _exit = true;
        };
        if (!(_exit)) then {
            _type = [_itemid] call RPM_Cfg_Items_GetType;
            _iswep = false;
            _ismag = false;
            _isveh = false;
            _isitem = false;
            _isunit = false;
            switch (_type) do {
                case 0: {
                    _iswep = true;
                };
                case 1: {
                    _ismag = true;
                };
                case 2: {
                    _isveh = true;
                    _amount = 1;
                };
                case 3: {
                    _isitem = true;
                };
                case 4: {
                    _isunit = true;
                };
            };
            if ((!(_exit)) && (_type != 0) && (_type != 1) && (_type != 2) && (_type != 4)) then {
                if (((call RPM_Cfg_Inv_GetOwnWeight) + (((([_itemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * _amount))) > i0) exitWith {
                    hint format[localize "v63", _amount, _itemname, localize "v540", i0];
                    b1 = false;
                    _exit = true;
                };
            };
            if (!(_exit)) then {
                _box = objNull;
                _class = "";
                _spawnpos = [];
                if ((_iswep) || (_ismag)) then {
                    _box = [_shopid] call RPM_Cfg_Shops_GetBox;
                    if (isNull(_box)) exitWith {
                        b1 = false;
                        _exit = true;
                    };
                    _class = [_itemid] call RPM_Cfg_Items_GetClass;
                };
                if ((_isveh) || (_isunit)) then {
                    _spawnpos = getMarkerPos([_shopid] call RPM_Cfg_Shops_GetFreeMarker);
                    if (((_spawnpos select 0) == 0) && ((_spawnpos select 1) == 0) && ((_spawnpos select 1) == 0)) exitWith {
                        hint format[localize "v128"];
                        b1 = false;
                        _exit = true;
                    };
                };
                if (!(_exit)) then {
                    _purchased = true;
                    if ((_iswep) || (_ismag)) then {
                        if (_iswep) then {
                            if (ARMA2_Vanilla) then {
                                _haspwep = false;
                                _hasswep = false;
                                {
                                    if (_x == _class) then {
                                        _haspwep = true;
                                    };
                                } forEach (weapons RPM_Role);
                                if ((_haspwep) || (_hasswep)) exitWith {
                                    hint format[localize "v233"];
                                    _purchased = false;
                                    b1 = false;
                                    _exit = true;
                                };
                            };
                            if (!(_exit)) then {
                                if (ARMA2_Vanilla) then {
                                    _amount = 1;
                                };
                                if (!(ARMA2_Vanilla)) then {
                                    call compile format["%1 addWeaponCargoGlobal[_class, _amount];", _box];
                                } else {
                                    RPM_Role addWeapon _class;
                                };
                            };
                        } else {
                            if (!(_exit)) then {
                                if (!(ARMA2_Vanilla)) then {
                                    call compile format["%1 addMagazineCargoGlobal[_class, _amount];", _box];
                                } else {
                                    for [{_i = 0}, {_i < _amount}, {_i = _i + 1}] do {
                                        RPM_Role addMagazine _class;
                                    };
                                };
                            };
                        };
                    };
                    // Vehicles
                    if (_isveh) exitWith {
                        if (!(_exit)) then {
                            if (([521, _price] call RPM_Cfg_Inv_DelItemAmount) && ([_shopid, _itemid, _amount] call RPM_Cfg_Shops_DelStock)) then {
                                _class = [_itemid] call RPM_Cfg_Items_GetClass;
                                _h = [_class, _spawnpos, 5] call RPM_Cfg_Vehicles_Create;
                                [_h, _shopid, _selection1, _itemname, _price] spawn {
                                    private ["_h","_shopid","_stime","_amount","_itemname","_price","_selection1"];
                                    _amount = 1;
                                    _itemname = _this select 3;
                                    _price = _this select 4;
                                    hint format[localize "v214", _amount, _itemname, _price];
                                    sleep 2;
                                    _h = _this select 0;
                                    waitUntil {((!(b19)) && (_h))};
                                    _shopid = _this select 1;
                                    _selection1 = _this select 2;
                                    _stime = 0;
                                    while {_stime <= 5} do {
                                        hint format[localize "v99", 5 - _stime];
                                        _stime = _stime + 1;
                                        sleep 1;
                                    };
                                    sleep 2;
                                    hint "";
                                    _h = [_shopid, 0, _selection1] call RPM_Cfg_Shops_RepaintListBoxes;
                                    waitUntil {_h};
                                    b1 = false;
                                };
                            };
                        } else {
                            hint format[localize "v103"];
                            b1 = false;
                            _exit = true;
                        };
                        _purchased = false;
                    };
                    // Items
                    if (_isitem) then {
                        if (!([_itemid, _amount] call RPM_Cfg_Inv_AddItemAmount)) then {
                            _purchased = false;
                        };
                    };
                    // Units
                    if (_isunit) exitWith {
                        hint format[localize "v32"];
                        b1 = false;
                        _exit = true;
                    };
                    // Buy stage
                    if ((_purchased) && (!(_exit))) then {
                        [_itemid, _itemname, _amount, _price, _shopid, _selection0, _selection1] spawn {
                            private ["_shopid","_itemid","_itemname","_amount","_price","_selection0","_selection1"];
                            _itemid = _this select 0;
                            _itemname = _this select 1;
                            _amount = _this select 2;
                            _price = _this select 3;
                            _shopid = _this select 4;
                            _selection0 = _this select 5;
                            _selection1 = _this select 6;
                            if ([521, _price] call RPM_Cfg_Inv_DelItemAmount) then {
                                if (!([_shopid, _itemid, _amount] call RPM_Cfg_Shops_DelStock)) exitWith {
                                    hint format[localize "v103"];
                                    b1 = false;
                                };
                                hint format[localize "v214", _amount, _itemname, _price];
                            } else {
                                hint format[localize "v120", _price];
                            };
                            [_shopid, _selection0, _selection1] call RPM_Cfg_Shops_RepaintListBoxes;
                            b1 = false;
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Shops_SellItem = {
    private ["_shopid","_amount","_selection0","_ret","_i","_weps","_order","_mag","_mags","_magstemp","_shopobj","_distance","_vehs","_type","_exit","_found","_sold","_class","_itemid","_itemname","_beforemags","_aftermags","_price","_wepc","_magc","_vehc","_vclobj","_itemc","_selection1"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (b1) exitWith {};
    _shopid = _this select 0;
    _selection0 = _this select 1;
    _selection1 = _this select 2;
    _amount = (_this select 3) call RPM_str_StrToInt;
    _order = [];
    _exit = false;
    _itemid = -1;
    _itemname = "";
    _weps = [];
    _wepc = 0;
    _magc = 0;
    _vehc = 0;
    _itemc = 0;
    // weapons
    _weps = RPM_Role call RPM_Cfg_Objects_GetMyWeapons;
    for [{_i = 0}, {_i < count(_weps)}, {_i = _i + 1}] do {
        _order = _order + ["wep"];
        _wepc = _wepc + 1;
    };
    // Magazines
    _magstemp = RPM_Role call RPM_Cfg_Objects_GetMyMags;
    for [{_i = 0}, {_i < count(_magstemp)}, {_i = _i + 1}] do {
        _order = _order + ["mag"];
        _magc = _magc + 1;
    };
    // Vehicles
    _shopobj = objNull;
    {
        if (RPM_Role distance _x <= 8) then {
            _shopobj = _x;
        };
    } forEach a38;
    _distance = 34;
    if ((_shopid == 1) || (_shopid == 2)) then {
        _distance = 100;
    };
    _vehs = nearestObjects[_shopobj,["Air", "Ship","Car","Motorcycle","Tank","Truck"], _distance];
    for [{_i = 0}, {_i < count(_vehs)}, {_i = _i + 1}] do {
        _order = _order + ["veh"];
        _vehc = _vehc + 1;
    };
    // Inventory
    for [{_i = 0}, {_i < count(a19)}, {_i = _i + 1}] do {
        _order = _order + ["item"];
        _itemc = _itemc + 1;
    };
    _type = _order select _selection1;
    // Sell stage
    _sold = false;
    _price = 0;
    if (_type == "wep") then {
        b1 = true;
        _class = _weps select _selection1;
        _itemid = [_class] call RPM_Cfg_Items_GetIDByClass;
        _itemname = [_itemid] call RPM_Cfg_Items_GetName;
        if ((_class in a32) || (!([_shopid, _itemid] call RPM_Cfg_Shops_InShop))) exitWith {
            hint format[localize "v171"];
            b1 = false;
            _exit = true;
        };
        if (!(_exit)) then {
            RPM_Role removeWeapon _class;
            _found = false;
            for [{_i = 0}, {_i < count(weapons RPM_Role)}, {_i = _i + 1}] do {
                if (((weapons RPM_Role) select _i) == _class) then {
                    _found = true;
                };
            };
            if (!(_found)) then {
                lbDelete[21, _selection1];
                _sold = true;
            };
        };
    };
    if (!(_exit)) then {
        // Magazines
        if (_type == "mag") then {
            b1 = true;
            _class = _magstemp select (_selection1 - _wepc);
            _itemid = [_class] call RPM_Cfg_Items_GetIDByClass;
            _itemname = [_itemid] call RPM_Cfg_Items_GetName;
            if ((_class in a32) || (!([_shopid, _itemid] call RPM_Cfg_Shops_InShop))) exitWith {
                hint format[localize "v171"];
                _exit = true;
                b1 = false;
            };
            if (!(_exit)) then {
                _beforemags = 0;
                for [{_i = 0}, {_i < count(_magstemp)}, {_i = _i + 1}] do {
                    if (((_magstemp select _i) select 0) == _class) then {
                        _beforemags = (_magstemp select _i) select 1;
                    };
                };
                for [{_i = 0}, {_i < _amount}, {_i  =_i + 1}] do {
                    RPM_Role removeMagazine _class;
                };
                _mags = [];
                for[{_i=0}, {_i < count magazines RPM_Role},{_i=_i+1}] do {
                    _mag = magazines RPM_Role select _i;
                    _mags = _mags + [_mag];
                };
                {
                    for [{_i = 0}, {_i < count(_mags)}, {_i = _i + 1}] do {
                        if ((_mags select _i) == _x) then {
                            _mags set[_i, -1];
                        };
                    };
                }  forEach a32;
                _mags = _mags - [-1];
                _magstemp = RPM_Role call RPM_Cfg_Objects_GetMyMags;
                _aftermags = _beforemags - _amount;
                if (_aftermags == ((_magstemp select _selection1) select 1)) then {
                    _sold = true;
                };
            };
        };
    };
    if (!(_exit)) then {
        // Vehicles
        if (_type == "veh") then {
            _vclobj = _vehs select (_selection1 - _wepc - _magc);
            [_shopid, _selection0, _selection1, _amount, _vclobj] spawn {
                private ["_shopobj","_distance","_h","_price","_amount","_selection0","_selection1","_vclobj","_vcl","_class","_itemid","_shopid","_itemname","_stime"];
                _shopid = _this select 0;
                _selection0 = _this select 1;
                _selection1 = _this select 2;
                _amount = _this select 3;
                _vclobj = _this select 4;
                if ((isNull(_vclobj)) || (!(alive(_vclobj)))) exitWith {};
                if (b1) exitWith {};
                b1 = true;
                _vcl = format["%1", _vclobj];
                _class = typeOf(_vclobj);
                _itemid = [_class] call RPM_Cfg_Items_GetIDByClass;
                if (!(([_shopid, _itemid] call RPM_Cfg_Shops_InShop))) exitWith {
                    hint format[localize "v171"];
                    b1 = false;
                };
                _itemname = [_itemid] call RPM_Cfg_Items_GetName;
                _shopobj = objNull;
                {
                    if (RPM_Role distance _x <= 8) then {
                        _shopobj = _x;
                    };
                } forEach a38;
                _distance = 24;
                if ((_shopid == 1) || (_shopid == 2)) then {
                    _distance = 100;
                };
                if (_vclobj distance _shopobj <= _distance) then {
                    _stime = 0;
                    while {_stime <= 5} do {
                        hint format[localize "v99", 5 - _stime];
                        _stime = _stime + 1;
                        sleep 1;
                    };
                    sleep 2;
                    hint "";
                    _h = _vclobj call RPM_Cfg_Vehicle_DumpTrunkToGround;
                    waitUntil {_h};
                    [name RPM_Role, _vcl] call RPM_Cfg_Inv_DelKey;
                    format["if (local server) then {
                        [""%1"", ""%2""] call RPM_Cfg_Inv_DelServerKey;
                    };", name RPM_Role, _vcl] call RPM_Cfg_Network_Broadcast;
                    [_vclobj, 0] spawn RPM_Cfg_Vehicle_Delete;
                    _price = (([_itemid] call RPM_Cfg_Items_GetPrice) * _amount) - (([_itemid] call RPM_Cfg_Items_GetPrice) * _amount) * ([_itemid] call RPM_Cfg_Items_GetDeprecation);
                    if ([521, _price] call RPM_Cfg_Inv_AddItemAmount) then {
                        if ([_shopid, _itemid, _amount] call RPM_Cfg_Shops_AddStock) then {
                            hint format[localize "v220", _amount, _itemname, _price];
                        };
                    } else {
                        hint format[localize "v119", _amount, _itemname];
                    };
                    [_shopid, _selection0, _selection1] call RPM_Cfg_Shops_RepaintListBoxes;
                } else {
                    hint format[localize "v142"];
                };
                b1 = false;
            };
            _exit = true;
        };
    };
    if (!(_exit)) then {
        // Items
        if (_type == "item") then {
            _itemid = a19 select ((_selection1 - (_wepc + _magc + _vehc))) select 0;
            if ((_itemid in a33) || (!([_shopid, _itemid] call RPM_Cfg_Shops_InShop))) exitWith {
                hint format[localize "v171"];
                _exit = true;
                b1 = false;
            };
            _itemname = [_itemid] call RPM_Cfg_Items_GetName;
            if (!(_exit)) then {
                if ([_itemid, _amount] call RPM_Cfg_Inv_DelItemAmount) then {
                    if (([_itemid] call RPM_Cfg_Inv_GetItemAmount) == 0) then {
                        lbDelete[21, _selection1];
                    };
                    _sold = true;
                };
            };
        };
    };
    if ((!(_exit)) && (_sold)) then {
        _price = (([_itemid] call RPM_Cfg_Items_GetPrice) * _amount) - (([_itemid] call RPM_Cfg_Items_GetPrice) * _amount) * ([_itemid] call RPM_Cfg_Items_GetDeprecation);
        if ([521, _price] call RPM_Cfg_Inv_AddItemAmount) then {
            if ([_shopid, _itemid, _amount] call RPM_Cfg_Shops_AddStock) then {
                _ret = true;
                hint format[localize "v220", _amount, _itemname, _price];
            };
        } else {
            hint format[localize "v119", _amount, _itemname];
        };
        [_shopid, _selection0, _selection1] call RPM_Cfg_Shops_RepaintListBoxes;
        b1 = false;
    } else {
        if (_exit) then {
            b1 = false;
        };
    };
    _ret;
};
RPM_Cfg_Shops_GetStockMin = {
    private ["_ret","_shopid","_itemid","_i","_stocksarr"];
    _ret = 0;
    _shopid = _this select 0;
    _itemid = _this select 1;
    _stocksarr = [_shopid] call RPM_Cfg_Shops_GetStocksArr;
    for [{_i = 0}, {_i < count(_stocksarr)}, {_i = _i + 1}] do {
        if (((_stocksarr select _i) select 0) == _itemid) then {
            _ret = (_stocksarr select _i) select 1;
        };
    };
    _ret;
};
RPM_Cfg_Shops_GetStockCur = {
    private ["_ret","_shopid","_itemid","_i","_stocksarr"];
    _ret = 0;
    _shopid = _this select 0;
    _itemid = _this select 1;
    _stocksarr = [_shopid] call RPM_Cfg_Shops_GetStocksArr;
    for [{_i = 0}, {_i < count(_stocksarr)}, {_i = _i + 1}] do {
        if (((_stocksarr select _i) select 0) == _itemid) then {
            _ret = (_stocksarr select _i) select 2;
        };
    };
    _ret;
};
RPM_Cfg_Shops_AddStock = {
    private ["_ret","_shopid","_itemid","_amount","_setstock","_curstock","_setamount"];
    _ret = 0;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _shopid = _this select 0;
    _itemid = _this select 1;
    _amount = _this select 2;
    _curstock = [_shopid, _itemid] call RPM_Cfg_Shops_GetStockCur;
    _setamount = _curstock + _amount;
    if (_setamount < 0) then {
        _setamount = 0;
    };
    _setstock = [_shopid, _itemid, _setamount] call RPM_Cfg_Shops_SetStock;
    if (_setstock) then {
        if (RPM_Diagnostics) then {
            [format["CHRP(Retail)|Added|%1|%2,%3|%4|%5", name RPM_Role, _shopid, _itemid, _amount, _curstock], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Shops_DelStock = {
    private ["_ret","_shopid","_itemid","_amount","_setstock","_curstock","_setamount"];
    _ret = 0;
    _shopid = _this select 0;
    _itemid = _this select 1;
    _amount = _this select 2;
    _curstock = [_shopid, _itemid] call RPM_Cfg_Shops_GetStockCur;
    if (_amount < 0)  then {
        _amount = -1;
    };
    _setamount = _curstock - _amount;
    _setstock = [_shopid, _itemid, _setamount] call RPM_Cfg_Shops_SetStock;
    if (_setstock) then {
        if (RPM_Diagnostics) then {
            [format["CHRP(Retail)|Removed|%1|%2,%3|%4", _shopid, _itemid, _amount, _curstock], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Shops_SetStock = {
    private ["_ret","_shopid","_itemid","_amount","_minstock","_curstock","_maxstock","_inshop","_newarr","_i","_idx","_itemarr"];
    _ret = 0;
    _shopid = _this select 0;
    _itemid = _this select 1;
    _amount = _this select 2;
    _curstock = [_shopid, _itemid] call RPM_Cfg_Shops_GetStockCur;
    if (_amount < 0)  then {
        _amount = _curstock;
    };
    _minstock = [_shopid, _itemid] call RPM_Cfg_Shops_GetStockMin;
    _maxstock = [_shopid, _itemid] call RPM_Cfg_Shops_GetStockMax;
    if (_amount < _minstock) then {
        if (_minstock == -1) then {
            _amount = 1;
        } else {
            _amount = _minstock;
        };
    };
    if (_curstock > _maxstock) then {
        if (_maxstock == -1) then {
            _amount = 100;
        } else {
            _amount = _maxstock;
        };
    };
    if (_curstock < _minstock) then {
        if (_minstock == -1) then {
            _amount = 1;
        } else {
            _amount = _minstock;
        };
    };
    if (_amount > _maxstock) then {
        if (_maxstock == -1) then {
            _amount = 100;
        } else {
            _amount = _maxstock;
        };
    };
    if (_curstock == 0) then {
        format["b17=true"] call RPM_Cfg_Network_Broadcast;
        if (RPM_Diagnostics) then {
            [format["CHRP(Retail)|Ran Out|%1|%2", _shopid, _itemid], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
    };
    _inshop = [_shopid, _itemid] call RPM_Cfg_Shops_InShop;
    if (_inshop) then {
        _newarr = + ((RPM_ShopsArray select _shopid) select 1) select 2;
        _idx = -1;
        for [{_i = 0}, {_i < count(_newarr)}, {_i = _i + 1}] do {
            if (((_newarr select _i) select 0) == _itemid) then {
                _idx = _i;
            };
        };
        _itemarr = (((RPM_ShopsArray select _shopid) select 1) select 2) select _idx;
        _itemarr set[2, _amount];
        format["(((RPM_ShopsArray select %1) select 1) select 2) set [%2, %3]", _shopid, _idx, _itemarr] call RPM_Cfg_Network_Broadcast;
        if ((((((RPM_ShopsArray select _shopid) select 1) select 2) select _idx) select 2) == _amount) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Shops_GetStockMax = {
    private ["_ret","_shopid","_itemid","_i","_stocksarr"];
    _ret = 0;
    _shopid = _this select 0;
    _itemid = _this select 1;
    _stocksarr = [_shopid] call RPM_Cfg_Shops_GetStocksArr;
    for [{_i = 0}, {_i < count(_stocksarr)}, {_i = _i + 1}] do {
        if (((_stocksarr select _i) select 0) == _itemid) then {
            _ret = (_stocksarr select _i) select 3;
        };
    };
    _ret;
};
RPM_Cfg_Shops_IsOwnerNull = {
    private ["_ret","_shopid","_owner"];
    _ret = true;
    _shopid = _this select 0;
    _owner = [_shopid] call RPM_Cfg_Shops_GetOwner;
    if (_owner call RPM_str_Length > 0) then {
        if (!(isNull([_owner] call RPM_Cfg_Misc_GetPlayerObj))) then {
            _ret = false;
        };
    };
    _ret;
};
RPM_Cfg_Misc_GetPlayerObj = {
    private ["_i","_ret","_player"];
    _ret = objNull;
    _player = _this select 0;
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            if ((name (RPM_POBJArr select _i)) == _player) then {
                _ret = RPM_POBJArr select _i;
            };
        };
    };
    _ret;
};
RPM_Cfg_Shops_IsOwner = {
    private ["_ret","_shopid","_player","_owner"];
    _ret = false;
    _shopid = _this select 0;
    _player = _this select 1;
    _owner = [_shopid] call RPM_Cfg_Shops_GetOwner;
    if (!([_shopid] call RPM_Cfg_Shops_IsOwnerNull)) then {
        if (_player == _owner) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Shops_SetOwner = {
    private ["_ret","_shopid","_player","_price","_exit","_shopname"];
    _ret = false;
    _exit = false;
    _player = _this select 0;
    if ((!(alive _player)) || (isNull(_player))) exitWith {};
    _shopid = _this select 1;
    _shopname = [_shopid] call RPM_Cfg_Shops_GetShopName;
    if (!([_shopid, (name _player)] call RPM_Cfg_Shops_IsOwner)) then {
        _price = [_shopid] call RPM_Cfg_Shops_GetShopPrice;
        if (([521] call RPM_Cfg_Inv_GetItemAmount) < _price) exitWith {
            hint format[localize "v35", _shopname, _price];
            _exit = true;
        };
        if ((!([521, _price] call RPM_Cfg_Inv_DelItemAmount)) and (!(_exit))) exitWith {
            _exit = true;
        };
        if (!(_exit)) then {
            format['((RPM_ShopsArray select %1) select 1) set[3, "%2"];', _shopid, (name _player)] call RPM_Cfg_Network_Broadcast;
            if ((([_shopid, (name _player)] call RPM_Cfg_Shops_IsOwner)) and (!([_shopid] call RPM_Cfg_Shops_IsOwnerNull))) then {
                hint format[localize "v213", [_shopid] call RPM_Cfg_Shops_GetShopName, _price];
                format["if (local server) then {
                    server globalChat ""%1"";
                };", format[localize "v382", name _player, [_shopid] call RPM_Cfg_Shops_GetShopName]] call RPM_Cfg_Network_Broadcast;
                ctrlEnable[23, false];
                _ret = true;
            };
        } else {
            if (!([_shopid] call RPM_Cfg_Shops_IsOwnerNull)) then {
                hint format[localize "v383"];
            };
        };
    } else {
        hint format[localize "v150", _shopname];
    };
    _ret;
};
RPM_Cfg_Shops_GetShopName = {
    private ["_ret","_shopid","_strid"];
    _ret = "";
    _shopid = _this select 0;
    switch (_shopid) do {
        case 0: {
            _strid = "v303";
        };
        case 1: {
            _strid = "v304";
        };
        case 2: {
            _strid = "v304";
        };
        case 3: {
            _strid = "v305";
        };
        case 4: {
            _strid = "v306";
        };
        case 5: {
            _strid = "v307";
        };
        case 6: {
            _strid = "v308";
        };
        case 7: {
            _strid = "v309";
        };
        case 8: {
            _strid = "v310";
        };
        case 9: {
            _strid = "v311";
        };
        case 10: {
            _strid = "v312";
        };
        case 11: {
            _strid = "v314";
        };
        case 12: {
            _strid = "v314";
        };
        case 13: {
            _strid = "v315";
        };
        case 14: {
            _strid = "v318";
        };
        case 15: {
            _strid = "v318";
        };
        case 16: {
            _strid = "v318";
        };
        case 17: {
            _strid = "v318";
        };
        case 18: {
            _strid = "v318";
        };
        case 19: {
            _strid = "v318";
        };
        case 20: {
            _strid = "v319";
        };
        case 21: {
            _strid = "v319";
        };
        case 22: {
            _strid = "v319";
        };
        case 23: {
            _strid = "v319";
        };
        case 24: {
            _strid = "v319";
        };
        case 25: {
            _strid = "v319";
        };
    };
    _ret = format[localize _strid];
    _ret;
};
RPM_Cfg_Shops_GetNPC = {
    private ["_ret","_shopid","_shopindex"];
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopindex) select 1) select 1;
    };
    _ret;
};
RPM_Cfg_Shops_GetType = {
    private ["_ret","_shopid","_shopindex"];
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopindex) select 1) select 2;
    };
    _ret;
};
RPM_Cfg_Shops_GetOwner = {
    private ["_ret","_shopid","_shopindex"];
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopindex) select 1) select 3;
    };
    _ret;
};
RPM_Cfg_Shops_GetBox = {
    private ["_ret","_shopid","_shopindex"];
    _ret = objNull;
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopindex) select 1) select 4;
    };
    _ret;
};
RPM_Cfg_Shops_GetMarkerArray = {
    private ["_ret","_shopid","_shopindex"];
    _ret = "";
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopindex) select 1) select 5;
    };
    _ret;
};
RPM_Cfg_Shops_GetShopPrice = {
    private ["_ret","_shopid","_shopindex"];
    _ret = 0;
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopindex) select 1) select 7;
    };
    _ret;
};
RPM_Cfg_Shops_GetBasePay = {
    private ["_ret","_shopid","_shopindex"];
    _ret = 0;
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopindex) select 1) select 8;
    };
    _ret;
};
RPM_Cfg_Shops_GetShopCheckModArray = {
    private ["_ret","_shopid","_shopindex"];
    _ret = 0;
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopindex) select 1) select 9;
    };
    _ret;
};
RPM_Cfg_Shops_GetShopSkillArray = {
    private ["_ret","_shopid","_shopindex"];
    _ret = 0;
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopindex) select 1) select 10;
    };
    _ret;
};
RPM_Cfg_Shops_HasSkills = {
    private ["_ret","_shopid","_shopindex","_i","_skillid","_needpts","_curpts","_uid","_skillarr"];
    _ret = true;
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _uid = _this select 1;
        if (_uid call RPM_str_Length >= 1) then {
            _skillarr = [_shopid] call RPM_Cfg_Shops_GetShopSkillArray;
            for [{_i = 0}, {_i < count(_skillarr)}, {_i = _i + 1}] do {
                _skillid = (_skillarr select _i) select 0;
                _needpts = (_skillarr select _i) select 1;
                _curpts = [_uid, _skillid] call RPM_Cfg_Skills_GetSkillPoints;
                if (_curpts < _needpts) then {
                    _ret = false;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Shops_GetPaycheck = {
    private ["_ret","_shopid","_uid","_i","_skillid","_mod","_curpts","_basepay","_modarr","_curpaid"];
    _ret = 0;
    _shopid = _this select 0;
    _uid = _this select 1;
    if (_uid call RPM_str_Length >= 1) then {
        _basepay = [_shopid] call RPM_Cfg_Shops_GetBasePay;
        _modarr = [_shopid] call RPM_Cfg_Shops_GetShopCheckModArray;
        _curpaid = 0;
        for [{_i = 0}, {_i < count(_modarr)}, {_i = _i + 1}] do {
            _skillid = (_modarr select _i) select 0;
            _mod = (_modarr select _i) select 1;
            _curpts = [_uid, _skillid] call RPM_Cfg_Skills_GetSkillPoints;
            _curpaid = _curpaid + ((_curpts * _mod)*_basepay);
        };
        _ret = (round((_curpaid + _basepay)/2));
    };
    _ret;
};
RPM_Cfg_Shops_GetBankBalance = {
    private ["_ret","_shopid","_shopindex"];
    _ret = 0;
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _ret = ((RPM_ShopsArray select _shopid) select 1) select 11;
    };
    _ret;
};
RPM_Cfg_Shops_AddBankBalance = {
    private ["_ret","_shopid","_amount","_curbalance"];
    _ret = false;
    _shopid = _this select 0;
    _amount = _this select 1;
    if ((_amount >= 1) && (_amount <= RPM_MAX_NUMBER)) then {
        _curbalance = [_shopid] call RPM_Cfg_Shops_GetBankBalance;
        if (_curbalance + _amount <= RPM_MAX_NUMBER) then {
            if ([_shopid, _curbalance + _amount] call RPM_Cfg_Shops_SetBankBalance) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Shops_DelBankBalance = {
    private ["_ret","_shopid","_amount","_curbalance"];
    _ret = false;
    _shopid = _this select 0;
    _amount = _this select 1;
    if ((_amount >= 1) && (_amount <= RPM_MAX_NUMBER)) then {
        _curbalance = [_shopid] call RPM_Cfg_Shops_GetBankBalance;
        if (_curbalance - _amount <= RPM_MAX_NUMBER) then {
            if ([_shopid, _curbalance + _amount] call RPM_Cfg_Shops_DelBankBalance) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Shops_SetBankBalance = {
    private ["_ret","_shopid","_balance","_shopindex"];
    _ret = false;
    _shopid = _this select 0;
    _shopindex = _shopid call RPM_Cfg_Shops_GetIndex;
    if (_shopindex != -1) then {
        _balance = _this select 1;
        if ((_balance >= 1) && (_balance <= RPM_MAX_NUMBER)) then {
            format['((RPM_ShopsArray select %1) select 1) set [11, %2]', _shopid, _balance] call RPM_Cfg_Network_Broadcast;
            if ([_shopid] call RPM_Cfg_Shops_GetBankBalance == _balance) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Shops_GetItemEarnings = {
    private ["_ret","_shopid","_uid","_itemid","_amount"];
    _ret = 0;
    _shopid = _this select 0;
    _uid = _this select 1;
    if (_uid call RPM_str_Length >= 1) then {
        _itemid = _this select 2;
        _amount = _this select 3;
        if ((_amount >= 1) && (_amount <= RPM_MAX_NUMBER)) then {
            
        };
    };
    _ret;
};
RPM_Cfg_Shops_Takeover = {
    private ["_ret"];
    _ret = false;
    _ret = true;
    _ret;
};
RPM_Cfg_Shops_Rob = {
    private ["_ret"];
    _ret = false;
    _ret = true;
    _ret;
};

