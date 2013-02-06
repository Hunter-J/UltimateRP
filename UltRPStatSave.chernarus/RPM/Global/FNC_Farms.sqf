// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Farms
RPM_Cfg_Farms_GetID = {
    private ["_i","_ret","_loc","_floc"];
    _ret = -1;
    _loc = _this select 0;
    for [{_i = 0}, {_i < count(RPM_FarmsArray)}, {_i = _i + 1}] do {
        _floc = (RPM_FarmsArray select _i) select 2;
        if (_floc == _loc) then {
            _ret = _i;
        };
    };
    _ret;
};
RPM_Cfg_Farms_GetName = {
    private ["_ret","_farmid","_strid"];
    _ret = "Unassigned";
    _farmid = _this select 0;
    _strid = "";
    switch (_farmid) do {
        case 0: {
            _strid = "v287";
        };
        case 1: {
            _strid = "v288";
        };
        case 2: {
            _strid = "v292";
        };
        case 3: {
            _strid = "v293";
        };
        case 4: {
            _strid = "v294";
        };
        case 5: {
            _strid = "v294";
        };
        case 6: {
            _strid = "v294";
        };
        case 7: {
            _strid = "v286";
        };
        case 8: {
            _strid = "v290";
        };
        case 9: {
            _strid = "v291";
        };
        case 10: {
            _strid = "v296";
        };
        case 11: {
            _strid = "v297";
        };
        case 12: {
            _strid = "v298";
        };
        case 13: {
            _strid = "v299";
        };
        case 14: {
            _strid = "v300";
        };
        case 15: {
            _strid = "v301";
        };
        case 16: {
            _strid = "v302";
        };
        case 17: {
            _strid = "v295";
        };
        case 18: {
            _strid = "v295";
        };
    };
    _ret = format[localize _strid];
    _ret;
};
RPM_Cfg_Farms_GetType = {
    private ["_ret","_farmid"];
    _ret = -1;
    _farmid = _this select 0;
    _ret = (RPM_FarmsArray select _farmid) select 1;
    _ret;
};
RPM_Cfg_Farms_GetMarker = {
    private ["_ret","_farmid"];
    _ret = -1;
    _farmid = _this select 0;
    _ret = (RPM_FarmsArray select _farmid) select 2;
    _ret;
};
RPM_Cfg_Farms_GetDistance = {
    private ["_ret","_farmid","_marker"];
    _ret = -1;
    _farmid = _this select 0;
    _marker = [_farmid] call RPM_Cfg_Farms_GetMarker;
    if (_marker call RPM_str_Length >= 1) then {
        _ret = ((getMarkerSize _marker) select 0)*pi;
    };
    _ret;
};
RPM_Cfg_Farms_GetEquipment = {
    private ["_ret","_farmid"];
    _farmid = _this select 0;
    _ret = (RPM_FarmsArray select _farmid) select 4;
    _ret;
};
RPM_Cfg_Farms_HasEquipment = {
    private ["_ret","_farmid","_equipment","_i","_etype","_pvcl","_mystock","_ekind"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _farmid = _this select 0;
    _equipment = [_farmid] call RPM_Cfg_Farms_GetEquipment;
    if (count(_equipment) == 0) then {
        _ret = true;
    } else {
        for [{_i = 0}, {_i < count(_equipment)}, {_i = _i + 1}] do {
            _etype = (_equipment select _i) select 0;
            _ekind = (_equipment select _i) select 1;
            if (_etype == 2) then {
                _pvcl = typeOf(vehicle RPM_Role);
                if (_pvcl == _ekind) then {
                    _ret = true;
                } else {
                    _ret = false;
                };
            };
            if (_etype == 3) then {
                _mystock = [_ekind] call RPM_Cfg_Inv_GetItemAmount;
                if (_mystock >= 1) then {
                    _ret = true;
                } else {
                    _ret = false;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Farms_GetFarmSeedReq = {
    private ["_ret","_farmid","_type"];
    _ret = -1;
    _farmid = _this select 0;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 0) then {
        _ret = ((RPM_FarmsArray select _farmid) select 5) select 0;
    };
    _ret;
};
RPM_Cfg_Farms_GetFarmSeedCur = {
    private ["_ret","_farmid","_type"];
    _ret = -1;
    _farmid = _this select 0;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 0) then {
        _ret = ((RPM_FarmsArray select _farmid) select 5) select 1;
    };
    _ret;
};
RPM_Cfg_Farms_GetFarmSeedMax = {
    private ["_ret","_farmid","_type"];
    _ret = -1;
    _farmid = _this select 0;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 0) then {
        _ret = ((RPM_FarmsArray select _farmid) select 5) select 2;
    };
    _ret;
};
RPM_Cfg_Farms_GetCapacity = {
    private ["_ret","_farmid","_type"];
    _ret = -1;
    _farmid = _this select 0;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 0) then {
        _ret = (RPM_FarmsArray select _farmid) select 6;
    };
    if (_type == 1) then {
        _ret = (RPM_FarmsArray select _farmid) select 5;
    };
    _ret;
};
RPM_Cfg_Farms_AddCapacity = {
    private ["_ret","_farmid","_amount","_set"];
    _ret = false;
    _farmid = _this select 0;
    _amount = ([_farmid] call RPM_Cfg_Farms_GetCapacity) + (_this select 1);
    _set = [_farmid, _amount] call RPM_Cfg_Farms_SetCapacity;
    if (_set) then {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Farms_DelCapacity = {
    private ["_ret","_farmid","_amount","_set"];
    _ret = false;
    _farmid = _this select 0;
    _amount = ([_farmid] call RPM_Cfg_Farms_GetCapacity) - (_this select 1);
    _set = [_farmid, _amount] call RPM_Cfg_Farms_SetCapacity;
    if (_set) then {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Farms_SetCapacity = {
    private ["_ret","_farmid","_amount","_type","_arr"];
    _ret = false;
    _farmid = _this select 0;
    _amount = _this select 1;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    _arr = + (RPM_FarmsArray select _farmid);
    if (_type == 0) then {
        _arr set[6, _amount];
    };
    if (_type == 1) then {
        _arr set[5, _amount];
    };
    format["RPM_FarmsArray set[%1, %2]", _farmid, _arr] call RPM_Cfg_Network_Broadcast;
    _ret = true;
    _ret;
};
RPM_Cfg_Farms_AddFarmSeed = {
    private ["_ret","_farmid","_amount","_curseed","_newseed","_setseed"];
    _ret = false;
    _farmid = _this select 0;
    _amount = _this select 1;
    _curseed = [_farmid] call RPM_Cfg_Farms_GetFarmSeedCur;
    _newseed = _curseed + _amount;
    _setseed = [_farmid, _newseed] call RPM_Cfg_Farms_SetFarmSeed;
    if (_setseed) then {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Farms_DelFarmSeed = {
    private ["_ret","_farmid","_amount","_curseed","_newseed","_setseed"];
    _ret = false;
    _farmid = _this select 0;
    _amount = _this select 1;
    _curseed = [_farmid] call RPM_Cfg_Farms_GetFarmSeedCur;
    _newseed = _curseed - _amount;
    _setseed = [_farmid, _newseed] call RPM_Cfg_Farms_SetFarmSeed;
    if (_setseed) then {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Farms_SetFarmSeed = {
    private ["_ret","_farmid","_amount","_arr"];
    _ret = false;
    _farmid = _this select 0;
    _amount = _this select 1;
    _arr = + (RPM_FarmsArray select _farmid) select 5;
    _arr set[1, _amount];
    format['(RPM_FarmsArray select %1) set[5, %2];', _farmid, _arr] call RPM_Cfg_Network_Broadcast;
    _ret = true;
    _ret;
};
RPM_Cfg_Farms_GetFarmSeedArr = {
    private ["_ret","_seedid","_i"];
    _ret = [];
    _seedid = _this select 0;
    for [{_i = 0}, {_i < count(a48)}, {_i = _i + 1}] do {
        if (((a48 select _i) select 0) == _seedid) then {
            _ret = a48 select _i;
        };
    };
    _ret;
};
RPM_Cfg_Farms_GetFarmSeedTime = {
    private ["_ret","_seedid","_arr"];
    _ret = 0;
    _seedid = _this select 0;
    _arr = [_seedid] call RPM_Cfg_Farms_GetFarmSeedArr;
    _ret = _arr select 4;
    _ret = 1;
    _ret;
};
RPM_Cfg_Farms_GetFarmYieldMin = {
    private ["_ret","_seedid"];
    _ret = -1;
    _seedid = _this select 0;
    _ret = ([_seedid] call RPM_Cfg_Farms_GetFarmSeedArr) select 1;
    _ret;
};
RPM_Cfg_Farms_GetFarmYieldMax = {
    private ["_ret","_seedid"];
    _ret = -1;
    _seedid = _this select 0;
    _ret = ([_seedid] call RPM_Cfg_Farms_GetFarmSeedArr) select 2;
    _ret;
};
RPM_Cfg_Farms_GetFarmSeedRand = {
    private ["_ret","_seedid","_seedloss","_myseeds","_rand"];
    _ret = -1;
    _seedid = _this select 0;
    _seedloss = ([_seedid] call RPM_Cfg_Farms_GetFarmSeedArr) select 3;
    _myseeds = [_seedid] call RPM_Cfg_Inv_GetItemAmount;
    _rand = round((random(_myseeds))/3);
    _ret = ceil((_rand * _seedloss) + _rand);
    _ret;
};
RPM_Cfg_Farms_GetFarmYieldID = {
    private ["_ret","_seedid"];
    _ret = -1;
    _seedid = _this select 0;
    _ret = ([_seedid] call RPM_Cfg_Farms_GetFarmSeedArr) select 5;
    _ret;
};
RPM_Cfg_Farms_GetFarmYieldRand = {
    private ["_ret","_seedid","_min","_max"];
    _ret = -1;
    _seedid = _this select 0;
    _min = [_seedid] call RPM_Cfg_Farms_GetFarmYieldMin;
    _max = [_seedid] call RPM_Cfg_Farms_GetFarmYieldMax;
    _ret = ceil((random(_max)) / (random(_min)));
    _ret;
};
RPM_Cfg_Farms_GetPrice = {
    private ["_ret","_farmid","_type"];
    _ret = 0;
    _farmid = _this select 0;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        _ret = (RPM_FarmsArray select _farmid) select 9;
    };
    _ret;
};
RPM_Cfg_Farms_GetMineYieldID = {
    private ["_ret","_farmid","_type"];
    _ret = -1;
    _farmid = _this select 0;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        switch (_farmid) do {
            case 7:  {_ret = 309;};
            case 8:  {_ret = 276;};
            case 9:  {_ret = 321;};
            case 10: {_ret = 308;};
            case 11: {_ret = 310;};
            case 12: {_ret = 316;};
            case 13: {_ret = 317;};
            case 14: {_ret = 326;};
            case 15: {_ret = 327;};
            case 16: {_ret = 318;};
            case 17: {_ret = 328;};
            case 18: {_ret = 324;};
        };
    };
    _ret;
};
RPM_Cfg_Farms_GetMineYieldRand = {
    private ["_ret","_farmid","_type"];
    _ret = -1;
    _farmid = _this select 0;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        switch (_farmid) do {
            case 7: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 8: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 9: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 10: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 11: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 12: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 13: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 14: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 15: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 16: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 17: {_ret = 2 + ceil((random(3)) + (random(2)))};
            case 18: {_ret = 2 + ceil((random(3)) + (random(2)))};
        };
    };
    _ret;
};
RPM_Cfg_Farms_Buymine = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_mycash","_owner","_mineid","_minename","_minetype","_price"];
        _mineid = _this select 0;
        if ((_mineid <= 9) || (_mineid >= 20)) exitWith {};
        _minename = [_mineid] call RPM_Cfg_Farms_GetName;
        _minetype = [_mineid] call RPM_Cfg_Farms_GetType;
        _price = [_mineid] call RPM_Cfg_Farms_GetPrice;
        if (_minetype == 1) then {
            _owner = name RPM_Role;
            if (!([_mineid,_owner] call RPM_Cfg_Farms_IsOwner)) then {
                _mycash = [521] call RPM_Cfg_Inv_GetItemAmount;
                if (_mycash < _price) exitWith {
                    format[localize "v4"];
                };
                if ([521, _price] call RPM_Cfg_Inv_DelItemAmount) then {
                    if ([_mineid, _owner] call RPM_Cfg_Farms_IsWorker) then {
                        [_mineid, _owner] call RPM_Cfg_Farms_DelWorker;
                    };
                    if ([_mineid, _owner] call RPM_Cfg_Farms_SetOwner) then {
                        hint format[localize "v154", _minename];
                        if (RPM_Diagnostics) then {
                            [format["RPM(Mines)|Purchased|%1|%2", _mineid, name RPM_Role], false] call RPM_Cfg_Server_DiagnosticsDumper;
                        };
                    };
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Farms_TakeoverMine = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_i","_ownerobj","_exit","_ownerloc","_stime","_mycash","_curowner","_marker","_distance","_mineid","_minename","_minetype","_price"];
        _mineid = _this select 0;
        _minename = [_mineid] call RPM_Cfg_Farms_GetName;
        _minetype = [_mineid] call RPM_Cfg_Farms_GetType;
        _price = [_mineid] call RPM_Cfg_Farms_GetPrice;
        if (_minetype == 1) then {
            _mycash = [521] call RPM_Cfg_Inv_GetItemAmount;
            if (_mycash < _price) exitWith {
                format[localize "v4"];
            };
            _ownerobj = objNull;
            _curowner = [_mineid] call RPM_Cfg_Farms_GetOwner;
            _marker = [_mineid] call RPM_Cfg_Farms_GetMarker;
            _distance = [_mineid] call RPM_Cfg_Farms_GetDistance;
            _stime = 0;
            _exit = false;
            for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
                if (!(isNull(RPM_POBJArr select _i))) then {
                    if (name (RPM_POBJArr select _i) == _curowner) then {
                        _ownerobj = RPM_POBJArr select _i;
                    };
                };
            };
            if (isNull(_ownerobj)) then {
                if ([521, _price] call RPM_Cfg_Inv_DelItemAmount) then {
                    [_mineid, name RPM_Role] call RPM_Cfg_Farms_SetOwner;
                    hint format[localize "v154", _minename];
                };
                _exit = true;
            };
            while {(!(_exit))} do {
                if (!(alive RPM_Role)) then {
                    _exit = true;
                };
                if (RPM_Role distance (getMarkerPos _marker) > _distance) then {
                    hint format[localize "v156"];
                    _exit = true;
                };
                if (!(_exit)) then {
                    _ownerloc = position _ownerobj;
                    if (_ownerloc distance (getMarkerPos _marker) < _distance) then {
                        hint format[localize "v90"];
                        _exit = true;
                    };
                };
                if (!(_exit)) then {
                    if (_stime >= 10) then {
                        if ([521, _price] call RPM_Cfg_Inv_DelItemAmount) then {
                            hint format[localize "v197", format["%1", _curowner], _minename, _price];
                            format["if (RPM_Role == %1) then {hint ""%2"";};", _ownerobj, format[localize "v226", _minename]] call RPM_Cfg_Network_Broadcast;
                            [_mineid, "None"] call RPM_Cfg_Farms_SetOwner;
                            if (RPM_Diagnostics) then {
                                [format["RPM(Mines)|Captured|%1|%2|%3", _mineid, name RPM_Role, [_mineid] call RPM_Cfg_Farms_GetOwner], false] call RPM_Cfg_Server_DiagnosticsDumper;
                            };
                        };
                        _exit = true;
                    };
                };
                if (!(_exit)) then {
                    cutText [format["Please wait %1 seconds...", (10 - _stime)],"PLAIN",1.5];
                    sleep 1.5;
                    cutText ["","PLAIN",0.1];
                    _stime = _stime + 1;
                    sleep 1;
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Farms_GetOwner = {
    private ["_ret","_farmid","_type"];
    _ret = "";
    _farmid = _this select 0;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        _ret = (RPM_FarmsArray select _farmid) select 7;
    };
    _ret;
};
RPM_Cfg_Farms_IsOwnerNull = {
    private ["_ret","_farmid","_type","_owner","_i","_member","_obj"];
    _ret = true;
    _farmid = _this select 0;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        _owner = [_farmid] call RPM_Cfg_Farms_GetOwner;
        if ((_owner call RPM_str_Length != 0) || (_owner != "None")) then {
            for [{_i = 0}, {_i < count (RPM_PObjArr)}, {_i = _i + 1}] do {
                _obj = (RPM_PObjArr select _i);
                if (!(isNull(_obj))) then {
                    _member = name _obj;
                    if (_member == _owner) then {
                        _ret = false;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Farms_IsOwner = {
    private ["_ret","_farmid","_owner","_type","_arrowner"];
    _ret = false;
    _farmid = _this select 0;
    _owner = _this select 1;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        _arrowner = [_farmid] call RPM_Cfg_Farms_GetOwner;
        if (_owner == _arrowner) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Farms_SetOwner = {
    private ["_ret","_farmid","_type","_arr","_owner"];
    _ret = false;
    _farmid = _this select 0;
    _owner = _this select 1;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        if (!([_farmid, _owner] call RPM_Cfg_Farms_IsOwner)) then {
            _arr = + (RPM_FarmsArray select _farmid);
            _arr set[7, _owner];
            format["RPM_FarmsArray set[%1, %2];", _farmid, _arr] call RPM_Cfg_Network_Broadcast;
            "call RPM_Cfg_Inv_CompileStatsArray;" call RPM_Cfg_Network_ExecPstr;
            if (((RPM_FarmsArray select _farmid) select 7) == _owner) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Farms_GetWorkers = {
    private ["_ret","_farmid","_type"];
    _ret = "";
    _farmid = _this select 0;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        _ret = (RPM_FarmsArray select _farmid) select 8;
    };
    _ret;
};
RPM_Cfg_Farms_IsWorker = {
    private ["_ret","_farmid","_i","_workers","_type","_worker","_isworkernull"];
    _ret = false;
    _farmid = _this select 0;
    _worker = _this select 1;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        _isworkernull = [_farmid, _worker] call RPM_Cfg_Farms_IsWorkerNull;
        if (!(_isworkernull)) then {
            _workers = [_farmid] call RPM_Cfg_Farms_GetWorkers;
            for [{_i = 0}, {_i < count(_workers)}, {_i = _i + 1}] do {
                if ((_workers select _i) == _worker) then {
                    _ret = true;
                };
            };
        };
    };
    _ret;  
};
RPM_Cfg_Farms_IsWorkerNull = {
    private ["_ret","_farmid","_type","_i","_member","_obj","_worker"];
    _ret = true;
    _farmid = _this select 0;
    _worker = _this select 1;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        for [{_i = 0}, {_i < count (RPM_PObjArr)}, {_i = _i + 1}] do {
            _obj = RPM_PObjArr select _i;
            if (!(isNull(_obj))) then {
                _member = name _obj;
                if (_member == _worker) then {
                    _ret = false;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Farms_AddWorker = {
    private ["_ret","_farmid","_type","_worker","_isworker","_arr"];
    _ret = false;
    _farmid = _this select 0;
    _worker = _this select 1;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        _isworker = [_farmid, _worker] call RPM_Cfg_Farms_IsWorker;
        if (!(_isworker)) then {
            _arr = [_farmid] call RPM_Cfg_Farms_GetWorkers;
            _arr set[count(_arr), _worker];
            format["(RPM_FarmsArray select %1) set[8, %2];", _farmid, _arr] call RPM_Cfg_Network_Broadcast;
            "call RPM_Cfg_Inv_CompileStatsArray;" call RPM_Cfg_Network_ExecPstr;
            if ([_farmid, _worker] call RPM_Cfg_Farms_IsWorker) then {
                if (RPM_Diagnostics) then {
                    [format["RPM(Farms)|Worker Added|%1|%2", _farmid, _worker], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Farms_DelWorker = {
    private ["_ret","_farmid","_type","_isworker","_worker","_i","_idx","_arr","_workers","_arr2"];
    _ret = false;
    _farmid = _this select 0;
    _worker = _this select 1;
    _type = [_farmid] call RPM_Cfg_Farms_GetType;
    if (_type == 1) then {
        _isworker = [_farmid, _worker] call RPM_Cfg_Farms_IsWorker;
        if (_isworker) then {
            _workers = [_farmid] call RPM_Cfg_Farms_GetWorkers;
            _idx = -1;
            for [{_i = 0}, {_i < count(_workers)}, {_i = _i + 1}] do {
                if ((_workers select _i) == _worker) then {
                    _idx = _i;
                };
            };
            if (_idx != -1) then {
                _arr = + (RPM_FarmsArray select _farmid);
                _arr2 = [];
                if (count(_arr select 8) == 1) then {
                    _arr2 = [];
                } else {
                    _arr2 = (_arr select 8) set[_idx, -1];
                };
                _arr set[8, _arr2];
                format["RPM_FarmsArray set[%1, %2];", _farmid, _arr] call RPM_Cfg_Network_Broadcast;
                "call RPM_Cfg_Inv_CompileStatsArray;" call RPM_Cfg_Network_ExecPstr;
                if (!([_farmid, _worker] call RPM_Cfg_Farms_IsWorker)) then {
                    if (RPM_Diagnostics) then {
                        [format["RPM(Farms)|Worker Removed|%1|%2", _farmid, _worker], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    };
                    _ret = true;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Farms_Logic = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_loc","_art","_farmid","_type","_exit","_seedid","_seedname","_farmseedcur","_farmseedmax","_capacity","_seedrand","_yieldrand","_hasequipment","_myseeds","_distance","_marker","_seedtime","_i","_item","_eqstring","_eq","_anim","_yieldname","_setseedcur","_setfarmcapacity","_addseed","_addfarmcapacity","_delfarmseeds","_addinv","_yieldid","_delfarmcapacity","_addworker","_rand","_delseed","_ismember","_nyields","_itemname","_equipment","_inveh"];
        _loc = _this select 0;
        _art = _this select 1;
        _farmid = [_loc] call RPM_Cfg_Farms_GetID;
        _type = [_farmid] call RPM_Cfg_Farms_GetType;
        _eqstring = "";
        _exit = false;
        if (_art) then {
            // Variable collection
            _marker = [_farmid] call RPM_Cfg_Farms_GetMarker;
            _distance = [_farmid] call RPM_Cfg_Farms_GetDistance;
            _hasequipment = [_farmid] call RPM_Cfg_Farms_HasEquipment;
            _yieldid = -1;
            _yieldname = "";
            _yieldrand = -1;
            // Alive check
            if (!(alive RPM_Role)) then {
                _exit = true;
            };
            // Distance check
            if (((vehicle RPM_Role) distance (getMarkerPos _marker) > _distance) and (!(_exit))) then {
                hint format[localize "v29"];
                _exit = true;
            };
            // Equipment check
            if ((!(_hasequipment)) and (!(_exit))) then {
                _equipment = [_farmid] call RPM_Cfg_Farms_GetEquipment;
                for [{_i = 0}, {_i < count(_equipment)}, {_i = _i + 1}] do {
                    _itemname = "";
                    if (((_equipment select _i) select 0) == 3) then {
                        _itemname = [((_equipment select _i) select 1)] call RPM_Cfg_Items_GetName;
                    };
                    if (((_equipment select _i) select 0) == 2) then {
                        _itemname = (_equipment select _i) select 1;
                    };
                    _eqstring = _eqstring + format["%1", _itemname];
                    if (count(_equipment) >= 2) then {
                        if (_i != count(_equipment)-1) then {
                            _eqstring = _eqstring + ", ";
                        };
                    };
                };
                hint format[localize "v14", format["(%1)", _eqstring]];
                _exit = true;
            };
            if (!(_exit)) then {
                _anim = "AinvPknlMstpSlayWrflDnon";
                _eq = [_farmid] call RPM_Cfg_Farms_GetEquipment;
                if (count(_eq) >= 1) then {
                    _item = -1;
                    _eqstring = "";
                    for [{_i = 0}, {_i < count(_eq)}, {_i = _i + 1}] do {
                        if (((_eq select _i) select 0) == 3) then {
                            _item = (_eq select _i) select 1;
                            _eqstring = [_item] call RPM_Cfg_Items_GetName;
                        };
                    };
                    switch (_item) do {
                        case 331: {
                            _anim = "AinvPknlMstpSlayWrflDnon";
                        };
                        case 332: {
                            _anim = "AinvPknlMstpSlayWrflDnon_medic";
                        };
                        case 333: {
                            _anim = "AinvPknlMstpSlayWrflDnon_medic";
                        };
                        case 334: {
                            _anim = "AinvPknlMstpSlayWrflDnon_medic";
                        };
                        case 335: {
                            _anim = "AinvPknlMstpSlayWrflDnon_medic";
                        };
                    };
                } else {
                    _anim = "AinvPknlMstpSlayWrflDnon_medic";
                };
            };
            if ((_type == 0) and (!(_exit))) then {
                // Active routine check
                if (b13) then {
                    hint format[localize "v17"];
                    _exit = true;
                };
                if ((b18) and (!(_exit))) then {
                    hint format[localize "v18"];
                    _exit = true;
                };
                if ((b6) and (!(_exit))) then {
                    hint format[localize "v16"];
                    _exit = true;
                };
                if ((b6 and b18) ||(b6 and b13) || (b13 and b18) and (!(_exit))) then {
                    b6 = false;
                    b13 = false;
                    b18 = false;
                    _exit = true;
                };
            };
            // Variable collection
            if ((_type == 0) and (!(_exit))) then {
                _seedid = [_farmid] call RPM_Cfg_Farms_GetFarmSeedReq;
                _myseeds = [_seedid] call RPM_Cfg_Inv_GetItemAmount;
                _seedname = [_seedid] call RPM_Cfg_Items_GetName;
                _farmseedcur = [_farmid] call RPM_Cfg_Farms_GetFarmSeedCur;
                _farmseedmax = [_farmid] call RPM_Cfg_Farms_GetFarmSeedMax;
                _seedrand = [_seedid] call RPM_Cfg_Farms_GetFarmSeedRand;
                _seedtime = [_seedid] call RPM_Cfg_Farms_GetFarmSeedTime;
                _yieldid = [_seedid] call RPM_Cfg_Farms_GetFarmYieldID;
                _yieldrand = [_seedid] call RPM_Cfg_Farms_GetFarmYieldRand;
            };
            if ((_type == 1) and (!(_exit))) then {
                _yieldid = [_farmid] call RPM_Cfg_Farms_GetMineYieldID;
                _yieldrand = [_farmid] call RPM_Cfg_Farms_GetMineYieldRand;
            };
            if (!(_exit)) then {
                _yieldname = [_yieldid] call RPM_Cfg_Items_GetName;
                _capacity = [_farmid] call RPM_Cfg_Farms_GetCapacity;
            };
            if ((_type == 0) and (!(_exit))) then {
                // Stock checks
                if (_farmseedcur < 0) then {
                    _setseedcur = [_farmid, 0] call RPM_Cfg_Farms_SetFarmSeed;
                    if (!(_setseedcur)) then {
                        _exit = true;
                    };
                };
            };
            if ((_capacity < 0) and (!(_exit))) then {
                _setfarmcapacity = [_farmid, 0] call RPM_Cfg_Farms_SetCapacity;
                if (!(_setfarmcapacity)) then {
                    _exit = true;
                };
            };
            if ((_type == 0) and (!(_exit))) then {
                if (_farmseedcur >= _farmseedmax) then {
                    if ((!(b13)) and (!(b18))) then {
                        b6 = true;
                    };
                    if ((!(b6)) and (!(b18))) then {
                        b13 = true;
                    };
                    if ((!(b6)) and (!(b13))) then {
                        b18 = true;
                    };
                } else {
                    if ((!(b6)) and (!(b18))) then {
                        b13 = true;
                    };
                };
                if (_myseeds < _seedrand) then {
                    hint format[localize "v21"];
                    _exit = true;
                };
            };
            if ((_type == 1) and (!(_exit))) then {
                b11 = true;
            };
            if (RPM_Diagnostics) then {
                [format["RPM(Farms)|Started|%1|%2", _farmid, name RPM_Role], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            _inveh = false;
            if ((vehicle RPM_Role) != RPM_Role) then {
                _inveh = true;
            };
            // Big routine
            while {((!(_exit)) and ((b6) || (b11) || (b13) || (b18)))} do {
                // Variable collection
                _distance = [_farmid] call RPM_Cfg_Farms_GetDistance;
                _hasequipment = [_farmid] call RPM_Cfg_Farms_HasEquipment;
                _capacity = [_farmid] call RPM_Cfg_Farms_GetCapacity;
                if (_type == 0) then {
                    _myseeds = [_seedid] call RPM_Cfg_Inv_GetItemAmount;
                    _farmseedcur = [_farmid] call RPM_Cfg_Farms_GetFarmSeedCur;
                    _seedrand = [_seedid] call RPM_Cfg_Farms_GetFarmSeedRand;
                    _yieldrand = [_seedid] call RPM_Cfg_Farms_GetFarmYieldRand;
                    // Fix math bugs
                    if (_seedrand == 0) then {
                        _seedrand = 1;
                    };
                };
                if (_yieldrand == 0) then {
                    _yieldrand = 1;
                };
                // Entry/exit of vehicle should stop the process
                if (_inveh) then {
                    if (vehicle RPM_Role == RPM_Role) then {
                        _exit = true;
                    };
                } else {
                    if (vehicle RPM_Role != RPM_Role) then {
                        _exit = true;
                    };
                };
                // Alive check
                if ((!(alive RPM_Role)) and (!(_exit))) then {
                    _exit = true;
                };
                // Distance check
                if (((vehicle RPM_Role) distance (getMarkerPos _marker) > _distance) and (!(_exit))) then {
                    hint format[localize "v29"];
                    _exit = true;
                };
                // Equipment check
                if ((!(_hasequipment)) and (!(_exit))) then {
                    hint format[localize "v14", format["(%1)", _eqstring]];
                    _exit = true;
                };
                // Stock checks
                if (_type == 0) then {
                    if (((!(b13)) and (!(b18))) and (!(_exit))) then {
                        if (_capacity >= _farmseedmax) then {
                            b6 = true;
                            b13 = false;
                            b18 = false;
                        };
                    };
                    if (((!(b6)) and (!(b13))) and (!(_exit))) then {
                        if (_capacity >= _farmseedmax) then {
                            b6 = false;
                            b13 = false;
                            b18 = true;
                        };
                    };
                    if (((!(b6)) and (!(b18))) and (!(_exit))) then {
                        if (_capacity < _farmseedmax) then {
                            b6 = false;
                            b13 = true;
                            b18 = false;
                        };
                    };
                    // Plot condition
                    if ((b13) and (!(_exit))) then {
                        // Add seed
                        _addseed = [_farmid, _seedrand] call RPM_Cfg_Farms_AddFarmSeed;
                        if (!(_addseed)) then {
                            _exit = true;
                        };
                        _delseed = [_seedid, _seedrand] call RPM_Cfg_Inv_DelItemAmount;
                        if (!(_delseed)) then {
                            _exit = true;
                        };
                        if (!(_exit)) then {
                            // Stock check
                            if ((!(_myseeds > _seedrand)) and (!(_exit))) then {
                                hint format[localize "v21"];
                                _exit = true;
                            };
                            if ((_farmseedcur >= _farmseedmax) and (!(_exit))) then {
                                b13 = false;
                                b18 = true;
                                format["if (RPM_Role == %1) then {
                                    [""""] call RPM_Cfg_Inv_SwitchMove;
                                }", RPM_Role] call RPM_Cfg_Network_Broadcast;
                            };
                            if (!(_exit)) then {
                                // Plot effects
                                cutText [format["You planted %1 units of %2!", _seedrand, _seedname],"PLAIN",1.5];
                                if (vehicle RPM_Role == RPM_Role) then {
                                    format["if (RPM_Role == %1) then {
                                        [""%2""] call RPM_Cfg_Inv_PlayMove;
                                    }", RPM_Role, _anim] call RPM_Cfg_Network_Broadcast;
                                    waitUntil {animationState RPM_Role != _anim}; 
                                    format["if (RPM_Role == %1) then {
                                        [""""] call RPM_Cfg_Inv_SwitchMove;
                                    }", RPM_Role, _anim] call RPM_Cfg_Network_Broadcast;
                                };
                                sleep 1.5;
                                cutText ["","PLAIN",0.1];
                            };
                            if ((!(_exit)) and (!(b6)) and (b13) and (!(b18))) then {
                                // Force variables to false
                                b6 = false;
                                b18 = false;
                            };
                        };
                    };
                    // Sow condition
                    if ((!(b6)) and (!(b13)) and (b18) and (!(_exit))) then {
                        // Stock check
                        if (_farmseedcur <= -1) then {
                            [_farmid, 0] call RPM_Cfg_Farms_SetFarmSeed;
                            _exit = true;
                        };
                        if (!(_exit)) then {
                            if (_capacity >= _farmseedmax) then {
                                b6 = true;
                                b18 = false;
                            };
                            // Yield method
                            _delfarmseeds = [_farmid, _yieldrand] call RPM_Cfg_Farms_DelFarmSeed;
                            if (!(_delfarmseeds)) then {
                                _exit = true;
                            };
                            if (!(_exit)) then {
                                _addfarmcapacity = [_farmid, _yieldrand] call RPM_Cfg_Farms_AddCapacity;
                                if (!(_addfarmcapacity)) then {
                                    _exit = true;
                                };
                            };
                            if (!(_exit)) then {
                                // Sow effects
                                cutText ["Farm is busy sowing!","PLAIN",1.5];
                                if ((animationState RPM_Role != "aidlpknlmstpslowwrfldnon_idlesteady02") and (animationState RPM_Role != "ainvpknlmstpsnonwnondnon_3")) then {
                                    format["if (RPM_Role == %1) then {
                                        [""%2""] call RPM_Cfg_Inv_SwitchMove;
                                    }", RPM_Role, "aidlpknlmstpslowwrfldnon_idlesteady02"] call RPM_Cfg_Network_Broadcast;
                                };
                                sleep _seedtime;
                                cutText ["","PLAIN",0.1];
                                if ((!(_exit)) and (!(b6)) and (!(b13)) and (b18)) then {
                                    // Force variables to false
                                    b6 = false;
                                    b13 = false;
                                };
                            };
                        };
                    };
                    // Harvest condition
                    if ((b6) and (!(_exit))) then {
                        if (b25) exitWith {
                            b6 = false;
                        };
                        // Stock check
                        if (_capacity <= -1) then {
                            hint format[localize "v19"];
                            [_farmid, 0] call RPM_Cfg_Farms_SetFarmSeed;
                            [_farmid, 0] call RPM_Cfg_Farms_SetCapacity;
                            _exit = true;
                        };
                        if (!(_exit)) then {
                            // Yield method
                            _delfarmcapacity = [_farmid, _yieldrand] call RPM_Cfg_Farms_DelCapacity;
                            if (!(_delfarmcapacity)) then {
                                _exit = true;
                            };
                            if (!(_exit)) then {
                                _addinv = [_yieldid, _yieldid] call RPM_Cfg_Inv_AddItemAmount;
                                if (!(_addinv)) then {
                                    _exit = true;
                                };
                            };
                        };
                        if (!(_exit)) then {
                            // Harvest effects
                            cutText [format["You harvested %1 units of %2!", _yieldrand, _yieldname],"PLAIN",1.5];
                            if (vehicle RPM_Role == RPM_Role) then {
                                format["if (RPM_Role == %1) then {
                                    [""%2""] call RPM_Cfg_Inv_PlayMove;
                                }", RPM_Role, _anim] call RPM_Cfg_Network_Broadcast;
                                waitUntil {animationState RPM_Role != _anim}; 
                                format["if (RPM_Role == %1) then {
                                    [""""] call RPM_Cfg_Inv_SwitchMove;
                                }", RPM_Role] call RPM_Cfg_Network_Broadcast;
                            };
                            sleep 1.5;
                            cutText ["","PLAIN",0.1];
                            if ((!(_exit)) and (b6) and (!(b13)) and (!(b18))) then {
                                // Force variables to false
                                b13 = false;
                                b18 = false;
                            };
                        };
                    };
                };
                if ((b6) || (b11) || (b13) and (!(_exit))) then {
                    i14 = i14 + 1;
                    if (count(a21) == 0) then {
                        a21 = position RPM_Role;
                    };
                    _nyields = 3;
                    if (_farmid >= 6) then {
                        _nyields = 10;
                    };
                    if (i14 >= _nyields) then {
                        _rand = round((random(2)) * (3));
                        if ((a21 distance (position RPM_Role)) <= _rand) then {
                            hint format[localize "v27"];
                            b6 = false;
                            b13 = false;
                            b11 = false;
                            //a21 = [];
                            //i14 = 0;
                            _exit = true;
                        };
                    };
                };
                // Mines
                if (!(_exit)) then {
                    if (_type == 1) then {
                        if (_type == 1) then {
                            _addworker = false;
                            if (_farmid >= 7) then {
                                if (!([_farmid, name RPM_Role] call RPM_Cfg_Farms_IsWorker)) then {
                                    if (!([_farmid, name RPM_Role] call RPM_Cfg_Farms_IsOwner)) then {
                                        _addworker = [_farmid, name RPM_Role] call RPM_Cfg_Farms_AddWorker;
                                        if ((!(_addworker)) and (!([_farmid, name RPM_Role] call RPM_Cfg_Farms_IsWorker))) then {_exit = true;};
                                    };
                                };
                            };
                            _ismember = false;
                            if ((_farmid >= 10) and (!(_exit))) then {
                                if (([_farmid, name RPM_Role] call RPM_Cfg_Farms_IsWorker) || ([_farmid, name RPM_Role] call RPM_Cfg_Farms_IsOwner)) then {
                                    _ismember = true;
                                };
                            } else {
                                if (!(_exit)) then {
                                    _ismember = true;
                                };
                            };
                            if (_ismember) then {
                                if ((_capacity <= 0) && (_farmid != 7) && (_farmid != 8) && (_farmid != 9)) then {
                                    if (_capacity < 0) then {
                                        [_farmid, 0] call RPM_Cfg_Farms_SetCapacity;
                                    };
                                    hint format[localize "v20"];
                                    if (RPM_Diagnostics) then {
                                        [format["RPM(Mines)|Ran Out|%1", _farmid], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                    };
                                    _exit = true;
                                };
                                if (!(_exit)) then {
                                    if (b25) exitWith {
                                        hint format[localize "v236"];
                                        b11 = false;
                                        _exit = true;
                                    };
                                    if (!(_exit)) then {
                                        _delfarmcapacity = [_farmid, _yieldrand] call RPM_Cfg_Farms_DelCapacity;
                                        if (!(_delfarmcapacity)) then {
                                            _exit = true
                                        };
                                        if (!(_exit)) then {
                                            _addinv = [_yieldid, _yieldrand] call RPM_Cfg_Inv_AddItemAmount;
                                            if (!(_addinv)) then {_exit = true;};
                                            if (!(_exit)) then {
                                                if (_farmid >= 7) then {
                                                    cutText [format[localize "v381", _yieldrand, _yieldname],"PLAIN",1.5];
                                                    if (vehicle RPM_Role == RPM_Role) then {
                                                        format["if (RPM_Role == %1) then {
                                                            [""%2""] call RPM_Cfg_Inv_PlayMove;
                                                        }", RPM_Role, _anim] call RPM_Cfg_Network_Broadcast;
                                                        waitUntil {animationState RPM_Role != _anim};
                                                        format["if (RPM_Role == %1) then {
                                                            [""""] call RPM_Cfg_Inv_SwitchMove;
                                                        }", RPM_Role] call RPM_Cfg_Network_Broadcast;
                                                    };
                                                } else {
                                                    cutText [format[localize "v381", _yieldrand, _yieldname],"PLAIN",1.5];
                                                };
                                                sleep random(5);
                                                cutText ["","PLAIN",0.1];
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                // Sleep
                if (!(_exit)) then {
                    if ((_type == 0) and (_farmid <= 7)) then {
                        if (!(b18)) then {
                            sleep random(7);
                        } else {
                            sleep (_seedtime) + random(3);
                        };
                    };
                    if (_type == 1) then {
                        sleep (1) + random(3);
                    };
                };
            };
            // Exit loop
            if (_exit) then {
                if ((_type == 1) and (_farmid >= 10)) then {
                    if ([_farmid, name RPM_Role] call RPM_Cfg_Farms_IsWorker) then {
                        if (!([_farmid, name RPM_Role] call RPM_Cfg_Farms_IsOwner)) then {
                            [_farmid, name RPM_Role] call RPM_Cfg_Farms_DelWorker;
                        };
                    };
                };
                if (_type == 0) then {
                    b6 = false;
                    b13 = false;
                    b18 = false;
                };
                if (_type == 1) then {
                    b11 = false;
                };
            };
        } else {
            if (_type == 0) then {
                if (!(b18)) then {
                    b6 = false;
                    b13 = false;
                };
            };
            if (_type == 1) then {
                b11 = false;
                if (_farmid >= 7) then {
                    if ([_farmid, name RPM_Role] call RPM_Cfg_Farms_IsWorker) then {
                        if (!([_farmid, name RPM_Role] call RPM_Cfg_Farms_IsOwner)) then {
                            [_farmid, name RPM_Role] call RPM_Cfg_Farms_DelWorker;
                        };
                    };
                };
            };
        };
        if (RPM_Diagnostics) then {
            [format["RPM(Farms)|Stopped|%1|%2", _farmid, name RPM_Role], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
    };
    _ret = true;
    _ret;
};
