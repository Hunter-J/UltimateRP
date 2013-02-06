// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Storage
RPM_Cfg_Storage_CanAccessTrunk = {
    private ["_ret","_vcl","_myvcls","_itemid"];
    _ret = false;
    _vcl = _this;
    _myvcls  = [player, 5] call RPM_Cfg_Objects_GetMyVCLS;
    _itemid = [typeOf(_vcl)] call RPM_Cfg_Items_GetIDByClass;
    if ((_itemid in a46) || (_vcl in _myvcls)) then {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Storage_GetFreePosition = {
    private ["_ret","_i","_marker","_npc","_source","_extra","_markers","_uid","_go"];
    _ret = [];
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                _uid = _this select 2;
                if (_uid call RPM_str_Length >= 1) then {
                    _npc = [_source, _extra, _uid] call RPM_Cfg_Storage_GetNPC;
                    if (!(isNull(_npc))) then {
                        _markers = [_source, _extra, _npc] call RPM_Cfg_Storage_GetMarkerArray;
                        if (_source == "Trunk_Storage") then {
                            _ret = _markers;
                        } else {
                            for [{_i = count(_markers)-1}, {_i >= 0}, {_i = _i - 1}] do {
                                _marker = _markers select _i;
                                if (count(nearestObjects[(getMarkerPos _marker),["Air", "Ship","Car","Motorcycle","Tank","Truck"], 6]) == 0) then {
                                    _ret = getMarkerPos(_marker);
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_GetMarkerArray = {
    private ["_ret","_i","_npc","_source","_extra","_go","_y","_pos","_vcls","_loops"];
    _ret = [];
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                if (_source == "Trunk_Storage") then {
                    if (!(isNull(_extra))) then {
                        _loops = 0;
                        _y = 4;
                        while {true} do {
                            if (_loops >= 3) then {false;};
                            _pos = _extra modelToWorld [0,_y,0];
                            _vcls = [_pos, 3] call RPM_Cfg_Objects_GetLocalVCLS;
                            if (count(_vcls) >= 1) then {
                                _y = _y + 1;
                            } else {
                                _ret = _pos;
                                false;
                            };
                            _loops = _loops + 1;
                        };
                        _ret = _pos;
                    };
                } else {
                    _npc = _this select 2;
                    if (!(isNull(_npc))) then {
                        switch (_source) do {
                            case "Group_Storage": {
                                for [{_i = 0}, {_i < count(a4)}, {_i = _i + 1}] do {
                                    if (((a4 select _i) select 0) == _npc) then {
                                        _ret = (a4 select _i) select 6;
                                    };
                                };
                            };
                            case "Factory_Storage": {
                                _ret = ((RPM_FactoryArray select _extra) select 1) select 4;
                            };
                            case "Storage": {
                                for [{_i = 0}, {_i < count(a42)}, {_i = _i + 1}] do {
                                    if (((a42 select _i) select 0) == _npc) then {
                                        _ret = (a42 select _i) select 1;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_GetNPC = {
    private ["_ret","_source","_extra","_uid","_player","_go"];
    _ret = objNull;
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                if ((_source == "Group_Storage") || (_source == "Trunk_Storage")) then {
                    _ret = _extra;
                } else {
                    _uid = _this select 2;
                    if (_uid call RPM_str_Length >= 1) then {
                        _player = [_uid] call RPM_Cfg_Objects_GetPlayerByUID;
                        switch (_source) do {
                            case "Factory_Storage": {
                                _ret = ((RPM_FactoryArray select _extra) select 1) select 0;
                            };
                            case "Storage": {
                                if ((side(_player)) == civilian) then {
                                    _ret = npc_storage_civ;
                                } else {
                                    _ret = npc_storage_cop;
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_GetCapacity = {
    private ["_ret","_i","_source","_extra","_npc","_uid","_go","_m","_vehiclearr","_vehitemid"];
    _ret = 0;
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                if ((_source == "Group_Storage") || (_source == "Trunk_Storage")) then {
                    if (_source == "Group_Storage") then {
                        for [{_i = 0}, {_i < count(a73)}, {_i = _i + 1}] do {
                            if (((a73 select _i) select 0) == _extra) then {
                                _ret = ((a73 select _i) select 1) select 0;
                            };
                        };
                    };
                    if (_source == "Trunk_Storage") then {
                        if (!(isNull(_extra))) then {
                            _vehitemid = [typeOf(_extra)] call RPM_Cfg_Items_GetIDByClass;
                            for [{_i = 0}, {_i < count(a64)}, {_i = _i + 1}] do {
                                _vehiclearr = (a64 select _i) select 1;
                                for [{_m = 0}, {_m < count(_vehiclearr)}, {_m = _m + 1}] do {
                                    if ((_vehiclearr select _m) == _vehitemid) then {
                                        _ret = (a64 select _i) select 0;
                                    };
                                };
                            };
                        };
                    };
                } else {
                    _uid = _this select 2;
                    if (_uid call RPM_str_Length >= 1) then {
                        switch (_source) do {
                            case "Factory_Storage": {
                                for [{_i = 0}, {_i < count(a14)}, {_i = _i + 1}] do {
                                    if (((a14 select _i) select 0) == _extra) then {
                                        _ret = ((a14 select _i) select 1) select 0;
                                    };
                                };
                            };
                            case "Storage": {
                                _npc = [_source, _extra, _uid] call RPM_Cfg_Storage_GetNPC;
                                for [{_i = 0}, {_i < count(a73)}, {_i = _i + 1}] do {
                                    if (((a73 select _i) select 0) == _npc) then {
                                        _ret = ((a73 select _i) select 1) select 0;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_GetArray = {
    private ["_tmp","_ret","_source","_extra","_uid","_pidx","_ftemp","_fidx","_go","_storagearray"];
    _ret = [];
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                if ((_source == "Group_Storage") || (_source == "Trunk_Storage")) then {
                    _storagearray = _extra getVariable "storage";
                    if (isNil("_storagearray")) then {
                        _extra setVariable["storage", []];
                    } else {
                        _ret = _storagearray;
                    };
                } else {
                    _uid = _this select 2;
                    if (_uid call RPM_str_Length >= 1) then {
                        switch (_source) do {
                            case "Factory_Storage": {
                                if (count(a13) == 0) then {
                                    _tmp = [_extra, [[_uid, []]]];
                                    a13 set[count(a13), _tmp];
                                } else {
                                    _pidx = [_source, _extra, _uid] call RPM_Cfg_Storage_GetPlayerIndex;
                                    _fidx = [_extra] call RPM_Cfg_Storage_GetFactoryIndex;
                                    if (_pidx != -1) then {
                                        _ret = (((a13 select _fidx) select 1) select _pidx) select 1;
                                    } else {
                                        if (_fidx != -1) then {
                                            _tmp = [_uid, []];
                                            _ftemp = + ((a13 select _fidx) select 1);
                                            _ftemp set[count(_ftemp), _tmp];
                                            (a13 select _fidx) set[1, _ftemp];
                                        } else {
                                            _tmp = [_extra, [[_uid, []]]];
                                            a13 set[count(a13), _tmp];
                                        };
                                    };
                                };
                            };
                            case "Storage": {
                                if (count(a82) == 0) then {
                                    _tmp = [_uid, []];
                                    a82 set[count(a82), _tmp];
                                } else {
                                    _pidx = [_source, _extra, _uid] call RPM_Cfg_Storage_GetPlayerIndex;
                                    if (_pidx != -1) then {
                                        _ret = (a82 select _pidx) select 1;
                                    } else {
                                        _tmp = [_uid, []];
                                        a82 set[count(a82), _tmp];
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_GetItemIndex = {
    private ["_ret","_source","_extra","_uid","_itemid","_storagearray","_go","_i"];
    _ret = -1;
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                _uid = _this select 2;
                if (_uid call RPM_str_Length >= 1) then {
                    _itemid = _this select 3;
                    if (typeName(_itemid) == "SCALAR") then {
                        if (_itemid >= 0) then {
                            _storagearray = [_source, _extra, _uid] call RPM_Cfg_Storage_GetArray;
                            for [{_i = 0}, {_i < count(_storagearray)}, {_i = _i + 1}] do {
                                if (((_storagearray select _i) select 0) == _itemid) then {
                                    _ret = _i;
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_GetItemAmount = {
    private ["_i","_ret","_source","_extra","_itemid","_storagearray","_uid","_go"];
    _ret = 0;
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                _uid = _this select 2;
                if (_uid call RPM_str_Length >= 1) then {
                    _itemid = _this select 3;
                    _storagearray = [_source, _extra, _uid] call RPM_Cfg_Storage_GetArray;
                    for [{_i = 0}, {_i < count(_storagearray)}, {_i = _i + 1}] do {
                        if (((_storagearray select _i) select 0) == _itemid) then {
                            _ret = (_storagearray select _i) select 1;
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_AddItemAmount = {
    private ["_ret","_source","_extra","_itemid","_amount","_newamount","_uid","_go","_player","_curamount"];
    _ret = false;
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                _uid = _this select 2;
                if (_uid call RPM_str_Length >= 1) then {
                    _itemid = _this select 3;
                    if (typeName(_itemid) == "SCALAR") then {
                        if (_itemid >= 0) then {
                            _amount = _this select 4;
                            if (typeName(_amount) == "SCALAR") then {
                                if (_amount >= 1) then {
                                    _curamount = [_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount;
                                    _newamount = _curamount + _amount;
                                    if ([_source, _extra, _uid, _itemid, _newamount] call RPM_Cfg_Storage_SetItemAmount) then {
                                        _player = [_uid] call RPM_Cfg_Objects_GetPlayerByUID;
                                        [format["RPM(%1)|Storage Added|%2|%3|%4,%5|%6", _source, _extra, name _player, _itemid, _amount, _curamount], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                        _ret = true;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_DelItemAmount = {
    private ["_ret","_source","_extra","_itemid","_amount","_newamount","_uid","_go","_player","_curamount"];
    _ret = false;
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                _uid = _this select 2;
                if (_uid call RPM_str_Length >= 1) then {
                    _itemid = _this select 3;
                    if (typeName(_itemid) == "SCALAR") then {
                        if (_itemid >= 0) then {
                            _amount = _this select 4;
                            if (typeName(_amount) == "SCALAR") then {
                                if (_amount >= 1) then {
                                    _curamount = [_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount;
                                    _newamount = _curamount - _amount;
                                    if ([_source, _extra, _uid, _itemid, _newamount] call RPM_Cfg_Storage_SetItemAmount) then {
                                        _player = [_uid] call RPM_Cfg_Objects_GetPlayerByUID;
                                        [format["RPM(%1)|Storage Removed|%2|%3|%4,%5|%6", _source, _extra, name _player, _itemid, _amount, _curamount], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                        _ret = true;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_SetItemAmount = {
    private ["_ret","_source","_extra","_itemid","_amount","_storagearray","_fidx","_uid","_playeridx","_go","_tmp","_itemidx","_ftmp","_player","_storagetemp","_a82"];
    _ret = false;
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                _uid = _this select 2;
                if (_uid call RPM_str_Length >= 1) then {
                    _player = [_uid] call RPM_Cfg_Objects_GetPlayerByUID;
                    if (!(isNull(_player))) then {
                        _itemid = _this select 3;
                        if (typeName(_itemid) == "SCALAR") then {
                            if (_itemid >= 0) then {
                                _amount = _this select 4;
                                if (typeName(_amount) == "SCALAR") then {
                                    _storagearray = + ([_source, _extra, _uid] call RPM_Cfg_Storage_GetArray);
                                    if ((_source == "Group_Storage") || (_source == "Trunk_Storage")) then {
                                        _itemidx = [_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemIndex;
                                        if (_itemidx == -1) then {
                                            if (_amount >= 1) then {
                                                _tmp = [_itemid, _amount];
                                                _storagearray set[count(_storagearray), _tmp];
                                            };
                                        } else {
                                            if (_amount >= 1) then {
                                                (_storagearray select _itemidx) set[1, _amount];
                                            } else {
                                                _storagearray set[_itemidx, -1];
                                                _storagearray = _storagearray - [-1];
                                            };
                                        };
                                        _extra setVariable["storage", _storagearray, true];
                                        if (([_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount) == _amount) then {
                                            _ret = true;
                                        };
                                    } else {
                                        _playeridx = [_source, _extra, _uid] call RPM_Cfg_Storage_GetPlayerIndex;
                                        if (_playeridx != -1) then {
                                            _itemidx = [_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemIndex;
                                            switch (_source) do {
                                                case "Factory_Storage": {
                                                    _fidx = [_extra, _uid] call RPM_Cfg_Storage_GetFactoryIndex;
                                                    if (_fidx != -1) then {
                                                        if (_itemidx == -1) then {
                                                            if (_amount >= 1) then {
                                                                _tmp = [_itemid, _amount];
                                                                _storagearray set[count(_storagearray), _tmp];
                                                                (((a13 select _fidx) select 1) select _playeridx) set[1, _storagearray];
                                                            };
                                                            if (([_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount) == _amount) then {
                                                                _ret = true;
                                                            };
                                                        } else {
                                                            _tmp = + ((((a13 select _fidx) select 1) select _playeridx) select 1);
                                                            if (_amount >= 1) then {
                                                                (_tmp select _itemidx) set[1, _amount];
                                                            } else {
                                                                _tmp set[_itemidx, -1];
                                                                _tmp = _tmp - [-1];
                                                            };
                                                            (((a13 select _fidx) select 1) select _playeridx) set[1, _tmp];
                                                            if (([_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount) == _amount) then {
                                                                _ret = true;
                                                            };
                                                        };
                                                    } else {
                                                        _tmp = [_extra, [[_uid, [[_itemid, _amount]]]]];
                                                        a13 set[count(a13), _tmp];
                                                        if (([_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount) == _amount) then {
                                                            _ret = true;
                                                        };
                                                    };
                                                };
                                                case "Storage": {
                                                    _storagetemp = + _storagearray;
                                                    if (_itemidx == -1) then {
                                                        if (_amount >= 1) then {
                                                            _tmp = [_itemid, _amount];
                                                            _storagearray set[count(_storagearray), _tmp];
                                                        };
                                                        _tmp = [_itemid, _amount];
                                                        _storagetemp set[count(_storagetemp), _tmp];
                                                    } else {
                                                        if (_amount >= 1) then {
                                                            (_storagearray select _itemidx) set[1, _amount];
                                                        } else {
                                                            _storagearray set[_itemidx, -1];
                                                            _storagearray = _storagearray - [-1];
                                                        };
                                                        (_storagetemp select _itemidx) set[1, _amount];
                                                    };
                                                    // Save this storage array before removing
                                                    _a82 = + a82;
                                                    (_a82 select _playeridx) set[1, _storagetemp];
                                                    _a82 spawn {
                                                        private ["_a82"];
                                                        _a82 = _this;
                                                        waitUntil {(!(RPM_Saving_Saving))};
                                                        _a82 call RPM_Saving_SaveStorage_C;
                                                    };
                                                    (a82 select _playeridx) set[1, _storagearray];
                                                    ["a82", (a82 select 0) select 1] call RPM_Saving_C_Save;
                                                    if (([_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount) == _amount) then {
                                                        _ret = true;
                                                    };
                                                };
                                            };
                                        }  else {
                                            if (_amount >= 1) then {
                                                _tmp = [_uid, [[_itemid, _amount]]];
                                                switch (_source) do {
                                                    case "Factory_Storage": {
                                                        _fidx = [_extra, _uid] call RPM_Cfg_Storage_GetFactoryIndex;
                                                        if (_fidx != -1) then {
                                                            _ftmp = + ((a13 select _fidx) select 1);
                                                            _ftmp set[count(_ftmp), _tmp];
                                                            (a13 select _fidx) set[1, _ftmp];
                                                        };
                                                    };
                                                    case "Storage": {
                                                        _tmp = + (a82);
                                                        a82 set[count(a82), _tmp];
                                                    };
                                                };
                                                if (([_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount) == _amount) then {
                                                    _ret = true;
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_GetPlayerIndex = {
    private ["_ret","_factoryidx","_source","_extra","_uid","_i","_go"];
    _ret = -1;
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                if ((_source == "Group_Storage") || (_source == "Trunk_Storage")) then {
                    _ret = 0;
                } else {
                    _uid = _this select 2;
                    if (_uid call RPM_str_Length >= 1) then {
                        switch (_source) do {
                            case "Factory_Storage": {
                                _factoryidx = [_extra] call RPM_Cfg_Storage_GetFactoryIndex;
                                if (_factoryidx != -1) then {
                                    for [{_i = 0}, {_i < count((a13 select _factoryidx) select 1)}, {_i = _i + 1}] do {
                                        if (((((a13 select _factoryidx) select 1) select _i) select 0) == _uid) then {
                                            _ret = _i;
                                        };
                                    };
                                };
                            };
                            case "Storage": {
                                if (count(a82) >= 1) then {
                                    for [{_i = 0}, {_i < count(a82)}, {_i = _i + 1}] do {
                                        if (((a82 select _i) select 0) == _uid) then {
                                            _ret = _i;
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_GetFactoryIndex = {
    private ["_i","_ret","_factoryid"];
    _ret = -1;
    _factoryid = _this select 0;
    for [{_i = 0}, {_i < count(a13)}, {_i = _i + 1}] do {
        if (((a13 select _i) select 0) == _factoryid) then {
            _ret = _i;
        };
    };
    _ret;
};
RPM_Cfg_Storage_GetWeight = {
    private ["_ret","_i","_itemid","_amount","_source","_extra","_storage","_uid","_go"];
    _ret = 0;
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            _uid = _this select 2;
            if (_uid call RPM_str_Length >= 1) then {
                if (_go) then {
                    _storage = [_source, _extra, _uid] call RPM_Cfg_Storage_GetArray;
                    for [{_i = 0}, {_i < count(_storage)}, {_i = _i + 1}] do {
                        _itemid = (_storage select _i) select 0;
                        _amount = (_storage select _i) select 1;
                        _ret = _ret + ((([_itemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * _amount);
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_Drop = {
    private ["_i","_order","_wepc","_magc","_vclc","_itemc","_ret","_amount","_weps","_magstemp","_vcls","_class","_itemid","_itemname","_selection0","_selection1","_thevcl","_weight","_npc","_source","_extra","_uid","_beforemags","_go","_storagestr","_curcount","_cancel"];
    _ret = false;
    if (b1) exitWith {};
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                _uid = _this select 2;
                if (_uid call RPM_str_Length >= 1) then {
                    _selection0 = _this select 3;
                    _selection1 = _this select 4;
                    _amount = _this select 5;
                    if (_amount >= 1) then {
                        _npc = [_source, _extra, _uid] call RPM_Cfg_Storage_GetNPC;
                        _itemid = -1;
                        _itemname = "";
                        _class = "";
                        _thevcl = objNull;
                        _order = [];
                        _wepc = 0;
                        _magc = 0;
                        _vclc = 0;
                        _itemc = 0;
                        _weight = 0;
                        // Weapons
                        _weps = RPM_Role call RPM_Cfg_Objects_GetMyWeapons;
                        for[{_i=0}, {_i < count(_weps)},{_i=_i+1}] do {
                            _order = _order + ["wep"];
                            _wepc = _wepc + 1;
                        };
                        // magazines
                        _magstemp = RPM_Role call RPM_Cfg_Objects_GetMyMags;
                        for [{_i = 0}, {_i < count(_magstemp)}, {_i = _i + 1}] do {
                            _order = _order + ["mag"];
                            _magc = _magc + 1;
                        };
                        // Vehicles
                        _vcls = [_npc, 50] call RPM_Cfg_Objects_GetMyVCLS;
                        for [{_i = 0}, {_i < count(_vcls)}, {_i = _i + 1}] do {
                            _order = _order + ["vcl"];
                            _vclc = _vclc + 1;
                        };
                        // Inventory
                        for [{_i = 0}, {_i < count(a19)}, {_i = _i + 1}] do {
                            _order = _order + ["item"];
                            _itemc = _itemc + 1;
                        };
                        _storagestr = localize "v540";
                        switch (_source) do {
                            case "Factory_Storage": {
                                _storagestr = localize "v541" + _storagestr;
                            };
                            case "Group_Storage": {
                                _storagestr = localize "v543" + _storagestr;
                            };
                            case "Trunk_Storage": {
                                _storagestr = localize "v536" + _storagestr;
                            };
                        };
                        switch (_order select (_selection1)) do {
                            case "wep": {
                                if (_amount != 1)  exitWith {
                                    hint format[localize "v159", "1"];
                                    b1 = false;
                                };
                                _class = (_weps select _selection1);
                                _itemid = [_class] call RPM_Cfg_Items_GetIDByClass;
                                _itemname = [_itemid] call RPM_Cfg_Items_GetName;
                                _weight = ([_itemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat;
                                _ret = true;
                            };
                            case "mag": {
                                _class = (_magstemp) select (_selection1 - _wepc) select 0;
                                _cancel = false;
                                for [{_i = 0}, {_i < count(_magstemp)}, {_i = _i + 1}] do {
                                    if (((_magstemp select _i) select 0) == _class) then {
                                        _curcount = (_magstemp select _i) select 1;
                                        if (_curcount < _amount) exitWith {
                                            b1 = false;
                                            hint format[localize "STRM_Inventory_NotContains"];
                                            _ret = false;
                                            _cancel = true;
                                        };
                                    };
                                };
                                if (!(_cancel)) then {
                                    _itemid = [_class] call RPM_Cfg_Items_GetIDByClass;
                                    _itemname = [_itemid] call RPM_Cfg_Items_GetName;
                                    _weight = (([_itemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * _amount;
                                    _ret = true;
                                };
                            };
                            case "vcl": {
                                if (_amount != 1) exitWith {
                                    hint format[localize "v159", "1"];
                                };
                                _amount = 1;
                                _thevcl = _vcls select (_selection1 - _wepc - _magc);
                                _class = typeOf(_thevcl);
                                _itemid = [_class] call RPM_Cfg_Items_GetIDByClass;
                                _itemname = [_itemid] call RPM_Cfg_Items_GetName;
                                _weight = ([_itemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat;
                                _ret = true;
                            };
                            case "item": {
                                _itemid = a19 select (_selection1 - _wepc - _magc - _vclc) select 0;
                                _itemname = [_itemid] call RPM_Cfg_Items_GetName;
                                _weight = (([_itemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * _amount;
                                _ret = true;
                            };
                        };
                        if (_itemid != -1) then {
                            if (_source == "Trunk_Storage") then {
                                if (([typeOf(_extra)] call RPM_Cfg_Items_GetIDByClass) == _itemid) then {
                                    hint format[localize "v411", localize "v536"];
                                    b1 = false;
                                    _ret = false;
                                };
                            };
                            if (_source == "Factory_Storage") then {
                                for [{_i = 0}, {_i < count(a10)}, {_i = _i + 1}] do {
                                    if (((a10 select _i) select 0) == ([_npc] call RPM_Cfg_Factory_GetFactoryID)) then {
                                        if (!(_itemid in ((a10 select _i) select 1))) exitWith {
                                            hint format[localize "v115", localize "v542"];
                                            b1 = false;
                                            _ret = false;
                                        };
                                    };
                                };
                            };
                            if ((_ret) && (((([_source, _extra, _uid] call RPM_Cfg_Storage_GetWeight) + _weight) > ([_source, _extra, _uid] call RPM_Cfg_Storage_GetCapacity)) || (([_source, _extra, _uid] call RPM_Cfg_Storage_GetWeight) > ([_source, _extra, _uid] call RPM_Cfg_Storage_GetCapacity)))) then {
                                hint format[localize "v63", _amount, _storagestr, _itemname, [_source, _extra, _uid] call RPM_Cfg_Storage_GetCapacity];
                                b1 = false;
                                _ret = false;
                            };
                            if (_ret) then {
                                if ((_order select (_selection1)) == "wep") then {
                                    b1 = true;
                                    if (_amount != 1) exitWith {
                                        hint format[localize "v159", "1"];
                                        b1 = false;
                                    };
                                    RPM_Role removeWeapon _class;
                                    if (!(_class in (RPM_Role call RPM_Cfg_Objects_GetMyWeapons))) then {
                                        _ret = true;
                                    };
                                };
                                if ((_order select (_selection1)) == "mag") then {
                                    b1 = true;
                                    _beforemags = _class call RPM_Cfg_Items_GetMagCount;
                                    for [{_i = 0}, {_i < _amount}, {_i  =_i + 1}] do {
                                        RPM_Role removeMagazine _class;
                                    };
                                    if ((_class call RPM_Cfg_Items_GetMagCount) == (_beforemags - _amount)) then {
                                        _ret = true;
                                    };
                                };
                                if ((_order select (_selection1)) == "vcl") then {
                                    _ret = false;
                                    if (b1) exitWith {};
                                    if (!(isNull(_thevcl))) then {
                                        [_source, _extra, _uid, _thevcl, _itemid, _itemname, _selection0, _selection1] spawn {
                                            private ["_thevcl","_itemid","_itemname","_i","_titemid","_tamount","_tweight","_capacity","_selection0","_selection1","_removed","_source","_extra","_uid","_storagearray","_stime"];
                                            if (b1) exitWith {};
                                            b1 = true;
                                            _source = _this select 0;
                                            _extra = _this select 1;
                                            _uid = _this select 2;
                                            _thevcl = _this select 3;
                                            _itemid = _this select 4;
                                            _itemname = _this select 5;
                                            _selection0 = _this select 6;
                                            _selection1 = _this select 7;
                                            _stime = 0;
                                            while {_stime <= 5} do {
                                                hint format[localize "v99", 5 - _stime];
                                                _stime = _stime + 1;
                                                sleep 1;
                                            };
                                            hint "";
                                            format["if (local server) then {
                                                [""%1"", ""%2""] call RPM_Cfg_Inv_DelServerKey;
                                            };", name RPM_Role, _thevcl] call RPM_Cfg_Network_Broadcast;
                                            if (([name RPM_Role, format["%1", _thevcl]] call RPM_Cfg_Inv_DelKey) && ([_source, _extra, _uid, _itemid, 1] call RPM_Cfg_Storage_AddItemAmount)) then {
                                                if (_source == "Trunk_Storage") then {
                                                    _removed = [];
                                                    _storagearray = [_source, _thevcl, -1] call RPM_Cfg_Storage_GetArray;
                                                    _capacity = [_source, _extra, -1] call RPM_Cfg_Storage_GetCapacity;
                                                    for [{_i = 0}, {_i < count(_storagearray)}, {_i = _i + 1}] do {
                                                        _titemid = (_storagearray select _i) select 0;
                                                        if (!(_titemid in _removed)) then {
                                                            _tamount = (_storagearray select _i) select 1;
                                                            _tweight = ((([_titemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * _tamount);
                                                            if ((_tweight > _capacity) || ((([_source, _extra, -1] call RPM_Cfg_Storage_GetWeight) + _tweight) > _capacity)) then {
                                                                _removed set[count(_removed), _titemid];
                                                            } else {
                                                                if (([_source, _extra, _uid, _titemid, _tamount] call RPM_Cfg_Storage_AddItemAmount) && ([_source, _thevcl, _uid, _titemid, _tamount] call RPM_Cfg_Storage_DelItemAmount)) then {
                                                                    _removed set[count(_removed), _titemid];
                                                                };
                                                            };
                                                        };
                                                    };
                                                };
                                                [_thevcl, 0] spawn RPM_Cfg_Vehicle_Delete;
                                                waitUntil {isNull(_thevcl)};
                                                hint format[localize "v188", 1, _itemname];
                                                [_source, _extra, _uid, _selection0, _selection1] call RPM_Cfg_Storage_RepaintListBoxes;
                                            };
                                            b1 = false;
                                        };
                                    };
                                };
                                if (_order select (_selection1) == "item") then {
                                    b1 = true;
                                    if (([_itemid] call RPM_Cfg_Inv_GetItemAmount) < _amount) exitWith {
                                        hint format[localize "v166", _itemname];
                                        b1 = false;
                                        _ret = false;
                                    };
                                    if (!([_itemid, _amount] call RPM_Cfg_Inv_DelItemAmount)) exitWith {
                                        b1 = false;
                                        _ret = false;
                                    };
                                };
                            };
                            if (_ret) then {
                                if ([_source, _extra, _uid, _itemid, _amount] call RPM_Cfg_Storage_AddItemAmount) then {
                                    hint format[localize "v188", _amount, _itemname];
                                    if (([_itemid] call RPM_Cfg_Inv_GetItemAmount) == 0) then {
                                        lbDelete[37, _selection1];
                                    };
                                    [_source, _extra, _uid, _selection0, _selection1] call RPM_Cfg_Storage_RepaintListBoxes;
                                };
                                b1 = false;
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Storage_Take = {
    private ["_ret","_npc","_selection0","_selection1","_amount","_itemid","_itemname","_class","_storagearray","_type","_box","_add","_nmmags","_nmags","_i","_h","_spawnpos","_weight","_go","_uid","_extra","_source","_storagestr"];
    _ret = false;
    if (b1) exitWith {};
    _go = false;
    _source = _this select 0;
    if (typeName(_source) == "STRING") then {
        if (_source call RPM_str_Length >= 1) then {
            _extra = _this select 1;
            switch (typeName(_extra)) do {
                case "ARRAY": {
                    if (count(_extra) >= 1) then {
                        _go = true;
                    };
                };
                case "OBJECT": {
                    _go = true;
                };
                case "SCALAR": {
                    if (_extra call RPM_str_isInteger) then {
                        _go = true;
                    };
                };
                case "STRING": {
                    _go = true;
                };
            };
            if (_go) then {
                _uid = _this select 2;
                if (_uid call RPM_str_Length >= 1) then {
                    _selection0 = _this select 3;
                    _selection1 = _this select 4;
                    _amount = _this select 5;
                    if (_amount >= 1) then {
                        _npc = [_source, _extra, _uid] call RPM_Cfg_Storage_GetNPC;
                        _storagearray = [_source, _extra, _uid] call RPM_Cfg_Storage_GetArray;
                        _itemid = (_storagearray select _selection0) select 0;
                        _type = [_itemid] call RPM_Cfg_Items_GetType;
                        _class = [_itemid] call RPM_Cfg_Items_GetClass;
                        _itemname = [_itemid] call RPM_Cfg_Items_GetName;
                        _box = objNull;
                        if ((_npc != npc_factory_food)) then {
                            _box = [_npc] call RPM_Cfg_Objects_GetBox;
                            if (isNull(_box)) exitWith {
                                _add = false;
                                b1 = false;
                            };
                        };
                        _add = true;
                        _weight = 0;
                        _storagestr = localize "v540";
                        switch (_source) do {
                            case "Factory_Storage": {
                                _storagestr = localize "v541" + _storagestr;
                            };
                            case "Group_Storage": {
                                _storagestr = localize "v543" + _storagestr;
                            };
                            case "Trunk_Storage": {
                                _storagestr = localize "v536" + _storagestr;
                            };
                        };
                        switch (_type) do {
                            case 0: {
                                if (_amount != 1)  exitWith {
                                    hint format[localize "v162", "1"];
                                    _add = false;
                                    b1 = false;
                                };
                            };
                            case 2: {
                                if (_amount != 1) exitWith {
                                    hint format[localize "v162", "1"];
                                };
                                _amount = 1;
                            };
                        };
                        if ((_type == 1) || (_type == 3)) then {
                            if (_amount > RPM_MAX_NUMBER + 1) exitWith {
                                hint format[localize "v172", _itemname];
                                _add = false;
                                b1 = false;
                            };
                        };
                        if (_type == 3) then {
                            _weight = (([_itemid] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat) * _amount;
                            if ((((call RPM_Cfg_Inv_GetOwnWeight) + _weight) > i0) || (([_source, _extra, _uid] call RPM_Cfg_Storage_GetWeight) > i0)) exitWith {
                                hint format[localize "v63", _amount, _itemname, localize "v540", i0];
                                b1 = false;
                                _ret = false;
                            };
                        };
                        if (_add) then {
                            if (_amount > ((_storagearray select _selection0) select 1)) exitWith {
                                hint format[localize "v172", _itemname];
                                _add = false;
                                b1 = false;
                            };
                            if (_add) then {
                                switch (_type) do {
                                    case 0: {
                                        b1 = true;
                                        if ((ARMA2_Vanilla) || (isNull(_box))) then {
                                            if (!([_source, _extra, _uid, _itemid, _amount] call RPM_Cfg_Storage_DelItemAmount)) exitWith {
                                                _add = false;
                                                b1 = false;
                                            };
                                            if (_add) then {
                                                RPM_Role addWeapon _class;
                                                _ret = true;
                                            };
                                        } else {
                                            if (!([_source, _extra, _uid, _itemid, _amount] call RPM_Cfg_Storage_DelItemAmount)) exitWith {
                                                _add = false;
                                                b1 = false;
                                            };
                                            if (_add) then {
                                                _box addWeaponCargoGlobal[_class, _amount];
                                                _ret = true;
                                            };
                                        };
                                    };
                                    case 1: {
                                        b1 = true;
                                        if ((ARMA2_Vanilla) || (isNull(_box))) then {
                                            _nmags = getNumber(configFile >> "CfgMagazines" >> _class >> "count");
                                            _nmmags = 0;
                                            {
                                                if (_x == _class) then {
                                                    _nmmags = _nmmags + 1;
                                                };
                                            } forEach (magazines RPM_Role);
                                            if (_amount > _nmags)  exitWith {
                                                hint format[localize "v161"];
                                                _add = false;
                                                b1 = false;
                                            };
                                            if (_nmmags + 1 > _nmags) exitWith {
                                                hint format[localize "v122"];
                                                _add = false;
                                                b1 = false;
                                            };
                                            if (!([_source, _extra, _uid, _itemid, _amount] call RPM_Cfg_Storage_DelItemAmount)) exitWith {
                                                _add = false;
                                                b1 = false;
                                            };
                                            if (_add) then {
                                                for [{_i = 1}, {_i < ((_amount) + 1)}, {_i = _i + 1}] do {
                                                    RPM_Role addMagazine _class;
                                                };
                                                _ret = true;
                                            };
                                        } else {
                                            if (!([_source, _extra, _uid, _itemid, _amount] call RPM_Cfg_Storage_DelItemAmount)) exitWith {
                                                _add = false;
                                                b1 = false;
                                            };
                                            if (_add) then {
                                                
                                                _box addMagazineCargoGlobal[_class, _amount];
                                                _ret = true;
                                            };
                                        };
                                    };
                                    case 2: {
                                        _amount = 1;
                                        _spawnpos = [_source, _extra, _uid] call RPM_Cfg_Storage_GetFreePosition;
                                        if (count(_spawnpos) != 3) exitWith {
                                            _add = false;
                                            b1 = false;
                                        };
                                        if (b1) exitWith {};
                                        _add = false;
                                        b1 = true;
                                        _h = [_class, _spawnpos, 5] call RPM_Cfg_Vehicles_Create;
                                        [_h, _source, _extra, _uid, _itemid, _amount, _selection0, _selection1, _storagestr] spawn {
                                            private ["_stime","_itemname","_itemid","_amount","_selection0","_selection1","_h","_source","_extra","_uid","_storagestr"];
                                            waitUntil {_this select 0};
                                            _source = _this select 1;
                                            _extra = _this select 2;
                                            _uid = _this select 3;
                                            _itemid = _this select 4;
                                            _itemname = [_itemid] call RPM_Cfg_Items_GetName;
                                            _amount = _this select 5;
                                            _selection0 = _this select 6;
                                            _selection1 = _this select 7;
                                            _storagestr = _this select 8;
                                            _stime = 0;
                                            while {_stime <= 5} do {
                                                hint format[localize "v99", 5 - _stime];
                                                _stime = _stime + 1;
                                                sleep 1;
                                            };
                                            hint "";
                                            if (!(([_source, _extra, _uid, _itemid, _amount] call RPM_Cfg_Storage_DelItemAmount))) exitWith {
                                                b1 = false;
                                            };
                                            hint format[localize "v222", _amount, _itemname, _storagestr];
                                            _h = [_source, _extra, _uid, _selection0, _selection1] call RPM_Cfg_Storage_RepaintListBoxes;
                                            waitUntil {_h};
                                            b1 = false;
                                        };
                                    };
                                    case 3: {
                                        b1 = true;
                                        if ((!([_itemid, _amount] call RPM_Cfg_Inv_AddItemAmount)) || (!([_source, _extra, _uid, _itemid, _amount] call RPM_Cfg_Storage_DelItemAmount))) then {
                                            _add = false;
                                        };
                                        b1 = false;
                                    };
                                };
                                if (_add) then {
                                    hint format[localize "v222", _amount, _itemname, _storagestr];
                                    if (([_source, _extra, _uid, _itemid] call RPM_Cfg_Storage_GetItemAmount) == 0) then {
                                        lbDelete[34, _selection0];
                                    };
                                    [_source, _extra, _uid, _selection0, _selection1] call RPM_Cfg_Storage_RepaintListBoxes;
                                    b1 = false;
                                    _ret = true;
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    _ret;
};
