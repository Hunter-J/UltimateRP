// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Factory
RPM_Cfg_Factory_GetOwnersPlayer = {
    private ["_i","_ret","_uid","_fowners","_tmp","_factoryid","_owners"];
    _ret = [];
    _uid = _this;
    _fowners = call RPM_Cfg_Factory_GetOwners;
    if (count(_fowners) >= 1) then {
        for [{_i = 0}, {_i < count(_fowners)}, {_i = _i + 1}] do {
            _tmp = [];
            _factoryid = (_fowners select _i) select 0;
            _owners = (_fowners select _i) select 1;
            if (_uid in _owners) then {
                _tmp = [_factoryid, [_uid]];
                _ret set[count(_ret), _tmp];
            };
        };
    };
    _ret;
};
RPM_Cfg_Factory_GetOwners = {
    private ["_i","_tmp","_c","_fidx","_n","_ntmp","_factoryid","_fowners","_ret"];
    _ret = [];
    for [{_i = 0}, {_i < count(RPM_FactoryArray)}, {_i = _i + 1}] do {
        _factoryid = (RPM_FactoryArray select _i) select 0;
        _fowners = ((RPM_FactoryArray select _i) select 1) select 2;
        if (count(_fowners) >= 1) then {
            if (count(_ret) == 0) then {
                _tmp = [_factoryid, _fowners];
                _ret set[0, _tmp];
            } else {
                _fidx = -1;
                for [{_c = 0}, {_c < count(_ret)}, {_c = _c + 1}] do {
                    if (((_ret select _c) select 0) == _factoryid) then {
                        _fidx = _c;
                    };
                };
                if (_fidx == -1) then {
                    _tmp = [_factoryid, _fowners];
                    _ret set[count(_ret), _tmp];
                } else {
                    _tmp = + ((_ret select _fidx) select 1);
                    for [{_n = 0}, {_n < count(_fowners)}, {_n = _n + 1}] do {
                        for [{_c = 0}, {_c < count(_tmp)}, {_c = _c + 1}] do {
                            if (_tmp == _ret select _n) then {
                                _tmp set[_c, -1];
                                _tmp = _tmp - [-1];
                            };
                        };
                        if (count(_tmp) >= 1) then {
                            _ntmp = [_factoryid, _tmp];
                            _ret set[count(_ret), _ntmp];
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Factory_GetNPC = {
    private ["_i","_ret","_factoryid"];
    _ret = objNull;
    _factoryid = _this select 0;
    for [{_i = 0}, {_i < count(RPM_FactoryArray)}, {_i = _i + 1}] do {
        if (((RPM_FactoryArray select _i) select 0) == _factoryid) then {
            _ret = ((RPM_FactoryArray select _i) select 1) select 0;
        };
    };
    _ret;
};
// Queue
RPM_Cfg_Factory_AddQueueItem = {
    private ["_factoryid","_itemid","_amount","_i","_qfactoryid","_qitemid","_qitemname","_itemname","_tmparr","_qfactoryname"];
    _factoryid = _this select 0;
    _itemid = _this select 1;
    _amount = (_this select 2) call RPM_str_StrToInt;
    if (_amount <= 0) exitWith {
        hint format[localize "209"];
    };
    if (_amount > RPM_MAX_NUMBER) exitWith {
        hint format[localize "v169"];
    };
    _itemname = [_itemid] call RPM_Cfg_Items_GetName;
    if (count(a11) == 0) then {
        _tmparr = [_factoryid, [_itemid, _amount]];
        a11 set[count(a11), _tmparr];
        _factoryid call RPM_Cfg_Factory_Produce;
    } else {
        if (ctrlText 47 == "Stop Production") then {
            hint format[localize "v108"];
            b23 = true;
        } else {
            for [{_i = 0}, {_i < count(a11)}, {_i = _i + 1}] do {
                _qfactoryid = (a11 select _i) select 0;
                _qfactoryname = [_qfactoryid] call RPM_Cfg_Factory_GetFactoryName;
                _qitemid = ((a11 select _i) select 1) select 0;
                _qitemname = [_qitemid] call RPM_Cfg_Items_GetName;
                if (_qfactoryid ==_factoryid) then {
                    if (_qitemid == _itemid) then {
                        hint format[localize "v39", _qitemname];
                    } else {
                        hint format[localize "v34", _itemname, _qitemname];
                    };
                } else {
                    hint format[localize "v37", _qitemname, _qfactoryname];
                };
            };
        };
    };
};
// Get queue going
RPM_Cfg_Factory_Produce = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_ret","_i","_qitemid","_qitemamount","_qitemtype","_qitemname","_qitemmod","_qfacmod","_produced","_stime","_prodtime","_factoryid","_h","_uid","_player"];
        _factoryid = _this;
        _uid = call RPM_Cfg_Objects_GetUID;
        if (_uid call RPM_str_Length >= 1) then {
            _player = [_uid] call RPM_Cfg_Objects_GetPlayerByUID;
            if (!(isNull(_player))) then {
                _ret = true;
                if (!(b23)) then {
                    if (!([_factoryid] call RPM_Cfg_Factory_HasReqs)) then {
                        hint format[localize "v183"];
                        _ret = false;
                    };
                    if (_ret) then {
                        if (!([_factoryid] call RPM_Cfg_Factory_DelReqs)) then {
                            _ret = false;
                        } else {
                            _ret = true;
                        };
                    };
                    if (_ret) then {
                        _qitemid = -1;
                        _qitemamount = -1;
                        _qitemname = "";
                        _qitemtype = -1;
                        for [{_i = 0}, {_i < count(a11)}, {_i = _i + 1}] do {
                            _qitemid = ((a11 select _i) select 1) select 0;
                            _qitemamount = ((a11 select _i) select 1) select 1;
                            _qitemtype = [_qitemid] call RPM_Cfg_Items_GetType;
                        };
                        _qitemmod = -1;
                        _qfacmod = -1;
                        if ((_factoryid != -1) && (_qitemid != -1) && (_qitemamount != -1) && (_qitemtype != -1)) then {
                            _qitemname = [_qitemid] call RPM_Cfg_Items_GetName;
                            _qitemmod = a35 select _qitemtype;
                            _qfacmod = ((a34 select _factoryid) select 1) select _qitemtype;
                        };
                        if ((_qitemmod != -1) && (_qfacmod != -1)) then {
                            if ((round((_qitemamount) / (100))) >= 10) then {
                                _qitemmod = round(_qitemmod / 1.75);
                            };
                            if ((round((_qitemamount) / (100))) >= 25) then {
                                _qitemmod = round(_qitemmod / 1.5);
                            };
                            if ((round((_qitemamount) / (100))) >= 50) then {
                                _qitemmod = round(_qitemmod / 2);
                            };
                            _prodtime = round(i7 * _qitemmod * _qfacmod * _qitemamount);
                            hint format[localize "v44", _qitemamount, _qitemname, _prodtime];
                            _stime = 0;
                            _produced = false;
                            if (ctrlText 47 != "Stop Production") then {
                                ctrlSetText[47, "Stop Production"];
                            };
                            RPM_Role commandChat format[localize "v535", _prodtime];
                            while {true} do {
                                if (b23) exitWith {
                                    false;
                                };
                                if (_stime >= _prodtime) exitWith {
                                    _produced = true;
                                    false;
                                };
                                sleep 1;
                                _stime = _stime + 1;
                            };
                            if (ctrlText 47 != "Produce Selected Item") then {
                                ctrlSetText[47, "Produce Selected Item"];
                            };
                            if (_produced) then {
                                if (["Factory_Storage", _factoryid, _uid, _qitemid, _qitemamount] call RPM_Cfg_Storage_AddItemAmount) then {
                                    _h = [_factoryid] call RPM_Cfg_Factory_RepaintFactoryListBoxes;
                                    waitUntil {_h};
                                    hint format[localize "v70", _qitemamount, _qitemname];
                                    if (RPM_Diagnostics) then {
                                        [format["CHRP(Factory)|Item Produced|%1|%2|%3|%4", _factoryid, name RPM_Role, _qitemid, _qitemamount], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                    };
                                    _ret = true;
                                };
                            } else {
                                _ret = false;
                            };
                        };
                    };
                };
            };
            b23 = false;
            a11 = [];
        };
    };
    _ret;
};
// Does the player have the requirements in his storage?
RPM_Cfg_Factory_HasReqs = {
    private ["_i","_ret","_qitemid","_qamount","_reqarray","_c","_ramount","_ritemid","_factoryid","_storagearr","_uid"];
    _ret = true;
    _factoryid = _this select 0;
    _uid = call RPM_Cfg_Objects_GetUID;
    if (_uid call RPM_str_Length >= 1) then {
        if (count(a11) >= 1) then {
            for [{_i = 0}, {_i < count(a11)}, {_i = _i + 1}] do {
                if (_ret) then {
                    _qitemid = (((a11) select _i) select 1) select 0;
                    _qamount = (((a11) select _i) select 1) select 1;
                    _reqarray = [_qitemid] call RPM_Cfg_Items_GetProductionArr;
                    if (count(_reqarray) >= 1) then {
                        for [{_c = 0}, {_c < count(_reqarray)}, {_c = _c + 1}] do {
                            _ritemid = (_reqarray select _c) select 0;
                            _ramount = (_reqarray select _c) select 1;
                            _storagearr = ["Factory_Storage", _factoryid, _uid] call RPM_Cfg_Storage_GetArray;
                            if (count(_storagearr) >= 1) then {
                                if ((["Factory_Storage", _factoryid, _uid, _ritemid] call RPM_Cfg_Storage_GetItemAmount) < (_ramount * _qamount)) then {
                                    _ret = false;
                                };
                            } else {
                                _ret = false;
                            };
                        };
                    } else {
                        _ret = true;
                    };
                };
            };
        } else {
            _ret = false;
        };
    };
    _ret;
};
// Remove the required resources from player's storage
RPM_Cfg_Factory_DelReqs = {
    private ["_i","_ret","_qitemid","_qamount","_reqarray","_c","_ramount","_delamount","_ritemid","_factoryid","_uid"];
    _ret = true;
    _factoryid = _this select 0;
    _uid = call RPM_Cfg_Objects_GetUID;
    if (_uid call RPM_str_Length >= 1) then {
        for [{_i = 0}, {_i < count(a11)}, {_i = _i + 1}] do {
            _qitemid = (((a11) select _i) select 1) select 0;
            _qamount = (((a11) select _i) select 1) select 1;
            _reqarray = [_qitemid] call RPM_Cfg_Items_GetProductionArr;
            for [{_c = 0}, {_c < count(_reqarray)}, {_c = _c + 1}] do {
                _ritemid = (_reqarray select _c) select 0;
                _ramount = (_reqarray select _c) select 1;
                _delamount = _ramount * _qamount;
                if (["Factory_Storage", _factoryid, _uid, _ritemid, _delamount] call RPM_Cfg_Storage_DelItemAmount) then {
                    _ret = true;
                } else {
                    _ret = false;
                };
            };
        };
    };
    _ret;
};
// Get the factory ID
RPM_Cfg_Factory_GetFactoryID = {
    private ["_i","_ret","_fobj","_obj"];
    _ret = -1;
    _obj = _this select 0;
    if (!(isNull(_obj))) then {
        for [{_i = 0}, {_i < count(RPM_FactoryArray)}, {_i = _i + 1}] do {
            _fobj = ((RPM_FactoryArray select _i) select 1) select 0;
            if (_obj == _fobj) then {
                _ret = (RPM_FactoryArray select _i) select 0;
            };
        };
    };
    _ret;
};
// Get the products that are allowed to be produced for this factory
RPM_Cfg_Factory_GetFactoryProducablesArr = {
    private ["_factoryid","_ret"];
    _factoryid = _this select 0;
    _ret = ((RPM_FactoryArray select _factoryid) select 1) select 1;
    _ret;
};
// Get the factorys weapons box
RPM_Cfg_Factory_GetFactoryBox = {
    private ["_factoryid","_ret"];
    _factoryid = _this select 0;
    _ret = ((RPM_FactoryArray select _factoryid) select 1) select 3;
    _ret;
};
// Get the factory's name from its stringid
RPM_Cfg_Factory_GetFactoryName = {
    private ["_ret","_factoryid"];
    _factoryid = _this select 0;
    _ret = format[localize (((RPM_FactoryArray select _factoryid) select 1) select 12)];
    _ret;
};
// Get the price of the factory
RPM_Cfg_Factory_GetPrice = {
    private ["_factoryid","_ret"];
    _factoryid = _this select 0;
    _ret = ((RPM_FactoryArray select _factoryid) select 1) select 6;
    _ret;
};
// Get the owner array
RPM_Cfg_Factory_GetOwnerArr = {
    private ["_factoryid","_ret"];
    _factoryid = _this select 0;
    _ret = ((RPM_FactoryArray select _factoryid) select 1) select 2;
    _ret;
};
// Is the player an owner?
RPM_Cfg_Factory_IsOwner = {
    private ["_i","_ret","_factoryid","_ownerarr","_uid"];
    _ret = false;
    _factoryid = _this select 0;
    _uid = _this select 1;
    _ownerarr = [_factoryid] call RPM_Cfg_Factory_GetOwnerArr;
    for [{_i = 0}, {_i < count(_ownerarr)}, {_i = _i + 1}] do {
        if ((_ownerarr select _i) == _uid) then {
            _ret = true;
        };
    };
    _ret;
};
// Get the ownership boolean as string for stats
RPM_Cfg_Factory_IsOwnerStr = {
    private ["_ret","_factoryid","_uid"];
    _ret = "";
    _factoryid = _this select 0;
    _uid = _this select 1;
    if ([_factoryid, _uid] call RPM_Cfg_Factory_IsOwner) then {
        _ret = "Yes";
    } else {
        _ret = "No";
    };
    _ret;
};
// Add an owner to the factory
RPM_Cfg_Factory_AddOwner = {
    private ["_ret","_factoryid","_temparray","_factoryname","_factoryprice","_mycash","_uid"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _factoryid = _this select 0;
    _factoryname = [_factoryid] call RPM_Cfg_Factory_GetFactoryName;
    _factoryprice = [_factoryid] call RPM_Cfg_Factory_GetPrice;
    _mycash = [521] call RPM_Cfg_Inv_GetItemAmount;
    if (_mycash < _factoryprice) exitWith {
        hint format[localize "v211", _factoryprice, _factoryname];
    };
    _uid = _this select 1;
    if (!([_factoryid, _uid] call RPM_Cfg_Factory_IsOwner)) then {
        if ([521, _factoryprice] call RPM_Cfg_Inv_DelItemAmount) then {
            _temparray = + ((RPM_FactoryArray select _factoryid) select 1) select 2;
            _temparray set[count(_temparray), _uid];
            format["((RPM_FactoryArray select %1) select 1) set[2, %2]", _factoryid, _temparray] call RPM_Cfg_Network_Broadcast;
            if ([_factoryid, _uid] call RPM_Cfg_Factory_IsOwner) then {
                hint format[localize "v213", _factoryname, _factoryprice];
                call RPM_Cfg_Inv_CompileStatsArray;
                ctrlEnable[47, true];
                ctrlEnable[48, false];
                ctrlEnable[49, true];
                ctrlEnable[50, true];
                if (RPM_Diagnostics) then {
                    [format["CHRP(Factory)|Purchased|%1|%2", _factoryid, name RPM_Role], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
                _ret = true;
            };
        };
    } else {
        hint format[localize "v150"];
    };
    _ret;
};
// Remove an owner from the factory
RPM_Cfg_Factory_DelOwner = {
    private ["_ret","_factoryid","_i","_ownerarr","_uid"];
    _ret = false;
    _factoryid = _this select 0;
    _uid = _this select 1;
    _ownerarr = + ([_factoryid] call RPM_Cfg_Factory_GetOwnerArr);
    if ([_factoryid, _uid] call RPM_Cfg_Factory_IsOwner) then {
        for [{_i = 0}, {_i < count(_ownerarr)}, {_i = _i + 1}] do {
            if ((_ownerarr select _i) == _uid) then {
                _ownerarr set[_i, -1];
                _ownerarr = _ownerarr - [-1];
                format["((RPM_FactoryArray select %1) select 1) set[2, %2]", _factoryid, _ownerarr] call RPM_Cfg_Network_Broadcast;
                if (!([_factoryid, _uid] call RPM_Cfg_Factory_IsOwner)) then {
                    call RPM_Cfg_Inv_CompileStatsArray;
                    ctrlEnable[47, false];
                    ctrlEnable[48, true];
                    ctrlEnable[49, false];
                    ctrlEnable[50, false];
                    _ret = true;
                };
            };
        };
    };
    _ret;
};
// Get the required equipment for this factory
RPM_Cfg_Factory_GetEquipment = {
    private ["_factoryid","_ret"];
    _factoryid = _this select 0;
    _ret = ((RPM_FactoryArray select _factoryid) select 1) select 7;
    _ret;
};
// Get the required licenses for this factory
RPM_Cfg_Factory_GetLicenses = {
    private ["_factoryid","_ret"];
    _factoryid = _this select 0;
    _ret = ((RPM_FactoryArray select _factoryid) select 1) select 8;
    _ret;
};
// Get the required skills for this factory
RPM_Cfg_Factory_GetSkills = {
    private ["_factoryid","_ret"];
    _factoryid = _this select 0;
    _ret = ((RPM_FactoryArray select _factoryid) select 1) select 9;
    _ret;
};
