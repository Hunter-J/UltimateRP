// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Vehicles
RPM_Cfg_Vehicles_AddIdleMarker = {
    private ["_ret","_veh","_temp","_markername","_marker"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (_veh call RPM_Cfg_Vehicles_IsVehicle) then {
            if (!(_veh call RPM_Cfg_Vehicles_HasIdleMarker)) then {
                _temp = [_veh, ""];
                _markername = format["%1_idle", _veh];
                _marker = createMarker[_markername, position _veh];
                _marker setMarkerDir (direction _veh);
                _marker setMarkerType "mil_pickup";
                _marker setMarkerShape "ICON";
                _marker setMarkerSize[1, 1];
                _marker setMarkerColor "ColorWhite";
                _temp set[1, _markername];
                RPM_VehicleIdleMarkers set[count(RPM_VehicleIdleMarkers), _temp];
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_DelIdleMarker = {
    private ["_ret","_veh","_found"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (_veh call RPM_Cfg_Vehicles_IsVehicle) then {
            if (_veh call RPM_Cfg_Vehicles_HasIdleMarker) then {
                _found = call RPM_Cfg_Vehicles_GetIdleMarkerIdx;
                if (_found != -1) then {
                    deleteMarker ((RPM_VehicleIdleMarkers select _found) select 1);
                    RPM_VehicleIdleMarkers set[_found, -1];
                    RPM_VehicleIdleMarkers = RPM_VehicleIdleMarkers - [-1];
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_GetIdleMarkerIdx = {
    private ["_ret","_veh","_i"];
    _ret = -1;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (_veh call RPM_Cfg_Vehicles_IsVehicle) then {
            for [{_i = 0}, {_i < count(RPM_VehicleIdleMarkers)}, {_i = _i + 1}] do {
                if (((RPM_VehicleIdleMarkers select _i) select 0) == _veh) then {
                    _ret = _i;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_HasIdleMarker = {
    private ["_ret","_found","_veh"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (_veh call RPM_Cfg_Vehicles_IsVehicle) then {
            _found = _veh call RPM_Cfg_Vehicles_GetIdleMarkerIdx;
            if (_found != -1) then {
                _ret = true;
            }
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_IdleLoop = {
    // Start monitoring the vehicle
    private ["_ret"];
    _ret = false;
    if (!(RPM_Server)) exitWith {};
    [] spawn {
        // Define variables
        private ["_deserted","_deadtime","_timeout","_dead","_run","_unit","_respawns"];
        _unit = _this select 0;
        _deadtime = 0;
        _deserted = 0;
        _respawns = 3;
        _run = true;
        if (_deserted < 0) then {
            _deserted = 0
        };
        _dead = false;
        // Start monitoring the vehicle
        while {_run} do {	
            sleep (2 + random 10);
            // Check if the vehicle is deserted.
            if ((count(units(_unit)) == 0) && (isNull(driver(_unit))) && (getDammage(_unit) <= 0.8)) then {
                _timeout = time + (round(RPM_VehicleIdleTime/_respawns));
                sleep 0.1;
                waitUntil {((_timeout < time) || (!(alive(_unit))) or {alive _x} count crew _unit > 0)};
                if ({alive _x} count crew _unit > 0) then {
                    _deserted = 0;
                    _deadtime = 0;
                }; 
                if ({alive _x} count crew _unit == 0) then {
                    _deserted = _deserted + 1;
                }; 
                if (!(alive(_unit))) then {
                    _deserted = _deserted + 1;
                };
                if (_deserted != 0) then {
                    _deadtime = _deadtime + (round(RPM_VehicleIdleTime/_respawns));
                };
            } else {
                _deserted = 0;
            };
            if (_deadtime >= RPM_VehicleIdleTime) then {
                _dead = true;
            } else {
                _dead = false;
            };
            // Respawn vehicle
            if (_dead) then {
                sleep 0.1;
                if (!(_unit call RPM_Cfg_Vehicles_IsIdle)) then {
                    if (!(_unit call RPM_Cfg_Vehicles_HasIdleMarker)) then {
                        _unit call RPM_Cfg_Vehicles_AddIdleMarker;
                    };
                    [_unit, true] call RPM_Cfg_Vehicles_SetIdle;
                };
            } else {
                if (_unit call RPM_Cfg_Vehicles_IsIdle) then {
                    if (_unit call RPM_Cfg_Vehicles_HasIdleMarker) then {
                        _unit call RPM_Cfg_Vehicles_DelIdleMarker;
                    };
                    [_unit, false] call RPM_Cfg_Vehicles_SetIdle;
                };
            };
            if ((isNull(_unit)) || (!(alive(_unit))) || (!(_unit call RPM_Cfg_Vehicles_IsVehicle))) then {
                _run = false;
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Vehicles_IsScrappable = {
    private ["_ret","_veh"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (_veh call RPM_Cfg_Vehicles_IsVehicle) then {
            if ((!(alive(_veh))) || (_veh call RPM_Cfg_Vehicles_IsIdle)) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_Scrap = {
    private ["_ret","_veh","_itemid","_classification","_tiermod","_price","_itemname","_payout"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (_veh call RPM_Cfg_Vehicles_IsVehicle) then {
            if (_veh call RPM_Cfg_Vehicles_IsScrappable) then {
                _tiermod = 0;
                _itemid = [typeOf(_veh)] call RPM_Cfg_Items_GetIDByClass;
                _itemname = [_itemid] call RPM_Cfg_Items_GetName;
                _price = [_itemid] call RPM_Cfg_Items_GetPrice;
                _classification = [_itemid] call RPM_Cfg_Items_GetClassification;
                switch (_classification) do {
                    // Air
                    case 0: {
                        _tiermod = 0.35;
                    };
                    // Armored
                    case 1: {
                        _tiermod = 0.30;
                    };
                    // Boat
                    case 2: {
                        _tiermod = 0.25;
                    };
                    // Bikes
                    case 3: {
                        _tiermod = 0.15;
                    };
                    // Cars
                    case 4: {
                        _tiermod = 0.2;
                    };
                    // Motos
                    case 5: {
                        _tiermod = 0.2;
                    };
                    // Trucks
                    case 6: {
                        _tiermod = 0.25;
                    };
                };
                _payout = round(_price * _tiermod);
                if ([521, _payout] call RPM_Cfg_Inv_AddItemAmount) then {
                    if (_veh call RPM_Cfg_Vehicles_HasIdleMarker) then {
                        _veh call RPM_Cfg_Vehicles_DelIdleMarker;
                    };
                    call RPM_Cfg_Inv_DelKeyAll;
                    format['%1 call RPM_Cfg_Vehicles_DelVehicle', _veh] call RPM_Cfg_Network_Broadcast;
                    [_veh] call RPM_Cfg_Vehicle_Delete;
                    if (!(_veh call RPM_Cfg_Vehicles_IsVehicle)) then {
                        hint format[localize "STRM_VehicleScrapped", _itemname, _payout];
                    };
                    _ret = true;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_IsIdle = {
    private ["_ret","_veh","_idle"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (_veh call RPM_Cfg_Vehicles_IsVehicle) then {
            _idle = _veh getVariable "idle";
            if (!(isNil("_idle"))) then {
                _ret = _idle;
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_SetIdle = {
    private ["_ret","_veh","_mode","_idle"];
    _ret = false;
    _veh = _this select 0;;
    if (!(isNull(_veh))) then {
        if (_veh call RPM_Cfg_Vehicles_IsVehicle) then {
            _mode = _this select 1;
            _idle = _veh getVariable "idle";
            if (!(isNil("_idle"))) then {
                _veh setVariable["idle", _mode, true];
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_IsVehicle = {
    private ["_ret","_veh"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (_veh in RPM_Vehicles_Array) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_IsMyVehicle = {
    private ["_ret","_veh"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (_veh call RPM_Cfg_Vehicles_IsVehicle) then {
            if (format["%1", _veh] in a20) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_AddVehicle = {
    private ["_ret","_veh"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (!(_veh in RPM_Vehicles_Array)) then {
            RPM_Vehicles_Array = RPM_Vehicles_Array + [_veh];
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_DelVehicle = {
    private ["_ret","_veh"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        if (_veh in RPM_Vehicles_Array) then {
            RPM_Vehicles_Array = RPM_Vehicles_Array - [_veh];
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_GetInUser = {
    private ["_ret","_var","_veh"];
    _ret = objNull;
    _veh = _this;
    if (!(isNull(_veh))) then {
        _var = _veh getVariable "inuse";
        if (!(isNull(_var))) then {
            _ret = _var;
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_GetInUse = {
    private ["_ret","_var","_veh"];
    _ret = false;
    _veh = _this;
    if (!(isNull(_veh))) then {
        _var = _veh getVariable "inuse";
        if (!(isNull(_var))) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_SetInUse = {
    private ["_ret","_var","_veh","_actor"];
    _ret = false;
    _veh = _this select 0;
    _actor = _this select 1;
    if (!(isNull(_veh))) then {
        _var = _veh getVariable "inuse";
        if (isNil("_var")) then {
            _veh setVariable["inuse", objNull];
        };
        if (!(isNull(_actor))) then {
            _veh setVariable["inuse", _actor, true];
            if (_veh call RPM_Cfg_Vehicles_GetInUse) then {
                _ret = true;
            };
        } else {
            _veh setVariable["inuse", objNull, true];
            if (!(_veh call RPM_Cfg_Vehicles_GetInUse)) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicle_DumpTrunkToGround = {
    private ["_i","_tmp","_c","_found","_titemid","_tiitemtype","_titemclass","_tiitemamount","_tiitems","_trunkarr","_vcl","_tweps","_tmags","_tvehs","_ret","_exit","_uid","_wep","_count","_mcargo","_wcargo","_mag"];
    _ret = false;
    _vcl = _this;
    _exit = false;
    if ((isNull(_vcl)) || (!(alive(_vcl))) || (isNull(RPM_Role)) || (!(alive(RPM_Role)))) then {
        _exit = true;
    };
    if (!(_exit)) then {
        _uid = call RPM_Cfg_Objects_GetUID;
        if (_uid call RPM_str_Length >= 1) then {
            _mcargo = getMagazineCargo _vcl;
            _wcargo = getWeaponCargo _vcl;
            if (isNil("_mcargo")) then {
                _mcargo = [];
            };
            if (isNil("_wcargo")) then {
                _wcargo = [];
            };
            _trunkarr = ["Trunk_Storage", _vcl, _uid] call RPM_Cfg_Storage_GetArray;
            if ((count(_mcargo) == 0) && (count(_wcargo) == 0) && (count(_trunkarr) == 0)) then {
                _exit = true;
            };
            if (!(_exit)) then {
                call compile format['weaponholder%1 = "weaponholder" createVehicle getpos %2;weaponholder%1 setVehicleInit "this setVehicleVarName ""weaponholder%1"";weaponholder%1 = this;";processInitCommands;', RPM_RoleNumber, _vcl];
                _tweps = [];
                _tmags = [];
                _tiitems = [];
                _tvehs = [];
                for [{_i = 0}, {_i < count(_wcargo)}, {_i = _i + 1}] do {
                    if (_i != count(_wcargo)) then {
                        _wep = (_wcargo select _i) select 0;
                        _count = (_wcargo select _i + 1) select 0;
                        if (count(_tweps) == 0) then {
                            _tmp = [_wep, _count];
                            _tweps set[0, _tmp];
                        } else {
                            _found = -1;
                            for [{_c = 0}, {_c < count(_tweps)}, {_c = _c + 1}] do {
                                if (((_tweps select _c) select 0) == _wep) then {
                                    _found = _c;
                                };
                            };
                            if (_found != -1) then {
                                _tmp = + (_tweps select _found);
                                _tmp set[1, _count + ((_tweps select _found) select 1)];
                                _tweps set[_found, _tmp];
                            } else {
                                _tmp = [_wep, _count];
                                _tweps set[count(_tweps), _tmp];
                            };
                        };
                        _i = _i + 1;
                    };
                };
                for [{_i = 0}, {_i < count(_mcargo)}, {_i = _i + 1}] do {
                    if (_i != count(_mcargo)) then {
                        _mag = (_mcargo select _i) select 0;
                        _count = (_mcargo select _i + 1) select 0;
                        if (count(_tmags) == 0) then {
                            _tmp = [_mag, _count];
                            _tmags set[0, _tmp];
                        } else {
                            _found = -1;
                            for [{_c = 0}, {_c < count(_tmags)}, {_c = _c + 1}] do {
                                if (((_tmags select _c) select 0) == _mag) then {
                                    _found = _c;
                                };
                            };
                            if (_found != -1) then {
                                _tmp = + (_tmags select _found);
                                _tmp set[1, _count + ((_tmags select _found) select 1)];
                                _tmags set[_found, _tmp];
                            } else {
                                _tmp = [_mag, _count];
                                _tmags set[count(_tmags), _tmp];
                            };
                        };
                        _i = _i + 1;
                    };
                };
                if (ARMA2_Vanilla) then {
                    format["clearWeaponCargo %1", _vcl] call RPM_Cfg_Network_Broadcast;
                } else {
                    call compile format["clearWeaponCargoGlobal %1;", _vcl];
                };
                for [{_i = 0}, {_i < count(_trunkarr)}, {_i = _i + 1}] do {
                    _titemid = (_trunkarr select _i) select 0;
                    _tiitemtype = [_titemid] call RPM_Cfg_Items_GetType;
                    _titemclass = [_titemid] call RPM_Cfg_Items_GetClass;
                    _tiitemamount = (_trunkarr select _i) select 1;
                    if ((_tiitemtype == 0) || (_tiitemtype == 1)) then {
                        if (_tiitemtype == 0) then {
                            if (count(_tweps) == 0) then {
                                _tmp = [_titemclass, _tiitemamount];
                                _tweps set[0, _tmp];
                            } else {
                                _found = -1;
                                for [{_c = 0}, {_c < count(_tweps)}, {_c = _c + 1}] do {
                                    if (((_tweps select _c) select 0) == _titemclass) then {
                                        _found = _c;
                                    };
                                };
                                if (_found != -1) then {
                                    _tmp = + (_tweps select _found);
                                    _tmp set[1, _tiitemamount + ((_tweps select _found) select 1)];
                                    _tweps set[_found, _tmp];
                                } else {
                                    _tmp = [_titemclass, _tiitemamount];
                                    _tweps set[count(_tweps), _tmp];
                                };
                            };
                        } else {
                            if (count(_tmags) == 0) then {
                                _tmp = [_titemclass, _tiitemamount];
                                _tmags set[0, _tmp];
                            } else {
                                _found = -1;
                                for [{_c = 0}, {_c < count(_tmags)}, {_c = _c + 1}] do {
                                    if (((_tmags select _c) select 0) == _titemclass) then {
                                        _found = _c;
                                    };
                                };
                                if (_found != -1) then {
                                    _tmp = + (_tmags select _found);
                                    _tmp set[1, _tiitemamount + ((_tmags select _found) select 1)];
                                    _tmags set[_found, _tmp];
                                } else {
                                    _tmp = [_titemclass, _tiitemamount];
                                    _tmags set[count(_tmags), _tmp];
                                };
                            };
                        };
                    } else {
                        if (_tiitemtype == 2) then {
                            if (count(_tvehs) == 0) then {
                                _tmp = [_titemclass, _tiitemamount];
                                _tvehs set[0, _tmp];
                            } else {
                                _found = -1;
                                for [{_c = 0}, {_c < count(_tvehs)}, {_c = _c + 1}] do {
                                    if (((_tvehs select _c) select 0) == _titemclass) then {
                                        _found = _c;
                                    };
                                };
                                if (_found != -1) then {
                                    _tmp = + (_tvehs select _found);
                                    _tmp set[1, _tiitemamount + ((_tvehs select _found) select 1)];
                                    _tvehs set[_found, _tmp];
                                } else {
                                    _tmp = [_titemclass, _tiitemamount];
                                    _tvehs set[count(_tvehs), _tmp];
                                };
                            };
                        };
                        if (_tiitemtype == 3) then {
                            if (count(_tiitems) == 0) then {
                                _tmp = [_titemid, _tiitemamount];
                                _tiitems set[0, _tmp];
                            } else {
                                _found = -1;
                                for [{_c = 0}, {_c < count(_tiitems)}, {_c = _c + 1}] do {
                                    if (((_tiitems select _c) select 0) == _titemid) then {
                                        _found = _c;
                                    };
                                };
                                if (_found != -1) then {
                                    _tmp = + (_tiitems select _found);
                                    _tmp set[1, _tiitemamount + ((_tiitems select _found) select 1)];
                                    _tiitems set[_found, _tmp];
                                } else {
                                    _tmp = [_titemid, _tiitemamount];
                                    _tiitems set[count(_tiitems), _tmp];
                                };
                            };
                        };
                    };
                };
                if (!(ARMA2_Vanilla)) then {
                    call compile format['for [{_n = 0}, {_n < count(_tweps)}, {_n = _n + 1}] do {
                        _twep = (_tweps select _n) select 0;
                        _tcount = (_tweps select _n) select 1;
                        weaponholder%2 addWeaponCargoGlobal[_twep, _tcount];
                        weaponholder%2 setpos %3;
                    };
                    for [{_n = 0}, {_n < count(_tmags)}, {_n = _n + 1}] do {
                        _tmag = (_tmags select _n) select 0;
                        _tcount = (_tmags select _n) select 1;
                        weaponholder%2 addMagazineCargoGlobal[_tmag, _tcount];
                        weaponholder%2 setpos %3;
                    };', RPM_Role, RPM_RoleNumber, (getpos _vcl), _tweps, _tmags];
                } else {
                    format['for [{_n = 0}, {_n < count(_tweps)}, {_n = _n + 1}] do {
                        _twep = (_tweps select _n) select 0;
                        _tcount = (_tweps select _n) select 1;
                        weaponholder%2 addWeaponCargo[_twep, _tcount];
                        weaponholder%2 setpos %3;
                    };
                    for [{_n = 0}, {_n < count(_tmags)}, {_n = _n + 1}] do {
                        _tmag = (_tmags select _n) select 0;
                        _tcount = (_tmags select _n) select 1;
                        weaponholder%2 addMagazineCargo[_tmag, _tcount];
                        weaponholder%2 setpos %3;
                    };', RPM_Role, RPM_RoleNumber, (getpos _vcl)] call RPM_Cfg_Network_Broadcast;
                };
            };
        };
    };
    _ret = true;
    _ret;
};
// Vehicle unflip script
// February 2009 - norrin (norrin@iinet.net.au)
// thanks to alef for some code for this script
RPM_Cfg_Vehicles_Unflip = {
    private ["_vcl","_dir","_pos"];
    private ["_vcl","_dir","_pos","_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _vcl = _this select 0;
    if (vehicle RPM_Role != RPM_Role) exitWith {
        hint parseText format["<t color='#FF3B3E'>You Must Do This From Outside The Vehicle</t> ",12];
    };
    _dir = getDir _vcl;
    _pos = getPos _vcl;
    _vcl setDir _dir;
    _vcl setVectorUp [0,0,0]; 
    _vcl setPos _pos; 
    _vcl setvelocity [0,0,1];
    _vcl setDir _dir;
    _ret = true;
    _ret;
};
RPM_Cfg_Vehicles_Lock = {
    private ["_vcl","_locked","_ret"];
    _ret = false;
    _vcl = call RPM_Cfg_Objects_GetVehicle;
    if (!(isNull(_vcl))) then {
        _locked = locked _vcl;
        if (_locked) then {
            format["%1 lock false;", _vcl] call RPM_Cfg_Network_Broadcast;
			hint parseText format["<t color='#FF3B3E'>Vehicle Unlocked</t> ",12];
        } else {
            format["%1 lock true;", _vcl] call RPM_Cfg_Network_Broadcast;
            hint parseText format["<t color='#FF3B3E'>Vehicle Locked</t> ",12];
        };
        _ret = true;
    };
    _ret;
};

RPM_Cfg_Vehicles_Impound_GetFreeMarker = {
    private ["_ret","_i","_marker"];
    _ret = "";
    for [{_i = 0}, {_i < count(a16)}, {_i = _i + 1}] do {
        _marker = a16 select _i;
        if (count(nearestObjects[(getMarkerPos _marker),["Air", "Ship","Car","Motorcycle","Tank","Truck"], 6]) == 0) then {
            _ret = _marker;
        };
    };
    _ret;
};

RPM_Cfg_Vehicles_ReleaseVeh = {
    private ["_ret","_selection","_i","_c","_aveh","_vehs","_owners","_avehs","_aovehs","_spawnpos","_veh","_classes","_aclass","_class","_released","_price","_h","_spawnmarker","_auid","_uid"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _selection = _this;
    b1 = true;
    _owners = [];
    _vehs = [];
    _classes = [];
    for [{_i = 0}, {_i < count(a39)}, {_i = _i + 1}] do {
        _auid = (a39 select _i) select 0;
        _aovehs = (a39 select _i) select 1;
        for [{_c = 0}, {_c < count(_aovehs)}, {_c = _c + 1}] do {
            _avehs = _aovehs select _c;
            _aveh = _avehs select 0;
            _aclass = _avehs select 1;
            _vehs set[count(_vehs), _aveh];
            _owners set[count(_owners), _auid];
            _classes set[count(_classes), _aclass];
        };
    };
    _spawnmarker = call RPM_Cfg_Vehicles_Impound_GetFreeMarker;
    if (_spawnmarker call RPM_str_Length == 0) exitWith {
        hint format[localize "v446"];
        b1 = false;
    };
    _spawnpos = getMarkerPos(_spawnmarker);
    _veh = _vehs select _selection;
    _uid = _owners select _selection;
    _class = _classes select _selection;
    _released = false;
    _price = 0;
    if (RPM_Civ) then {
        _price = round([[_class] call RPM_Cfg_Items_GetIDByClass] call RPM_Cfg_Items_GetPrice) * 0.20;
        if (([521] call RPM_Cfg_Inv_GetItemAmount) < _price) exitWith {
            hint format[localize "v444", _price];
            b1 = false;
        };
        if ([521, _price] call RPM_Cfg_Inv_DelItemAmount) then {
            _released = true;
        };
    } else {
        _released = true;
    };
    if (_released) then {
        _h = [_class, _spawnpos, _veh, 5] call RPM_Cfg_Vehicles_CreateImpound;
        [_h, _selection, _uid, _veh, _class, _price] spawn {
            private ["_stime","_selection","_uid","_class","_veh","_price","_ownerobj","_vehobj"];
            waitUntil {_this select 0};
            _selection = _this select 1;
            _uid = _this select 2;
            _ownerobj = [_uid] call RPM_Cfg_Objects_GetPlayerByUID;
            _veh = _this select 3;
            _class = _this select 4;
            _price = _this select 5;
            _stime = 0;
            while {_stime <= 5} do {
                hint format[localize "v99", 5 - _stime];
                _stime = _stime + 1;
                sleep 1;
            };
            hint "";
            sleep 1;
            if ([_uid, _veh, _class] call RPM_Cfg_Vehicles_DelImpounded) then {
                _vehobj = call compile _veh;
                format['if (!(%1 in RPM_Vehicles_Array)) then {
                    RPM_Vehicles_Array = RPM_Vehicles_Array + [%1];
                };', _vehobj] call RPM_Cfg_Network_Broadcast;
                if (RPM_Civ) then {
                    hint format[localize "v445", _price];
                } else {
                    if (RPM_Role != _ownerobj) then {
                        format["if (!(isDedicated)) then {
                            if (RPM_Role == %1) then {
                                hint ""%2"";
                            };
                        };", _ownerobj, format[localize "v48", format["%1", RPM_Role], format["%1", name RPM_Role], [[_class] call RPM_Cfg_Items_GetIDByClass] call RPM_Cfg_Items_GetName, _veh]] call RPM_Cfg_Network_Broadcast;
                    } else {
                        hint format[localize "v537", [[_class] call RPM_Cfg_Items_GetIDByClass] call RPM_Cfg_Items_GetName, _veh];
                    };
                };
                if (RPM_Diagnostics) then {
                    [format["RPM(Vehicles)|Released|%1|%2|%3", name RPM_Role, name RPM_Role, _veh], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
                lbDelete[185, _selection];
            };
            b1 = false;
        };
        _ret = true;
    };
    b1 = false;
    _ret;
};

RPM_Cfg_Vehicles_ImpoundVeh = {
    private ["_ret","_veh","_impounded"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (b1) exitWith {};
    _veh = _this select 0;
    if (!(isNull(_veh))) then {
        _impounded = _veh getVariable "impounded";
        if (_impounded) exitWith {};
        _veh spawn {
            private ["_stime","_avehobj","_veh","_aownerobj","_aveh","_class","_i","_c","_vehs","_h","_uid"];
            b1 = true;
            _veh = _this;
            if (!(isNull(_veh))) then {
                _class = typeOf(_veh);
                for [{_i = 0}, {_i < count(a37)}, {_i = _i +1}] do {
                    _uid = (a37 select _i) select 0;
                    _aownerobj = _uid call RPM_Cfg_Objects_GetObjectByUID;
                    _vehs = (a37 select _i) select 1;
                    for [{_c = 0}, {_c < count(_vehs)}, {_c = _c + 1}] do {
                        _aveh = _vehs select _c;
                        _avehobj = call compile _aveh;
                        if (!(isNull(_avehobj))) then {
                            if (_veh == _avehobj) then {
                                if (_aownerobj == RPM_Role) exitWith {
                                    hint format[localize "v438"];
                                    b1 = false;
                                };
                                _veh setVariable["impounded", true, true];
                                _stime = 0;
                                while {_stime <= 5} do {
                                    hint format[localize "v99", 5 - _stime];
                                    _stime = _stime + 1;
                                    sleep 1;
                                };
                                sleep 2;
                                hint "";
                                if ([format["%1", _uid], format["%1", _aveh], format["%1", _class]] call RPM_Cfg_Vehicles_AddImpounded) then {
                                    hint format[localize "v195", _uid, [[typeOf(_avehobj)] call RPM_Cfg_Items_GetIDByClass] call RPM_Cfg_Items_GetName, vehicleVarName _avehobj];
                                    if (!(isNull(driver _veh))) then {
                                        if (isPlayer(driver _veh)) then {
                                            (driver _veh) action["eject", vehicle (driver _veh)];
                                        };
                                    };
                                    _h = _avehobj call RPM_Cfg_Vehicle_DumpTrunkToGround;
                                    waitUntil {_h};
                                    format["if (!(isDedicated)) then {
                                        if (RPM_Role == %1) then {
                                            hint ""%2"";
                                        };
                                    };", _aownerobj, format[localize "v47", format["%1", RPM_Role], format["%1", name RPM_Role], [[_class] call RPM_Cfg_Items_GetIDByClass] call RPM_Cfg_Items_GetName, _veh]] call RPM_Cfg_Network_Broadcast;
                                    // Remove server key, player keys and from vehicles array
                                    format["if (local server) then {
                                        [""%1"", ""%2""] call RPM_Cfg_Inv_DelServerKey;
                                    };
                                    [""%1"", %2] call RPM_Cfg_Inv_DelKey;
                                    RPM_Vehicles_Array = RPM_Vehicles_Array - [%2];
                                    ", name RPM_Role, _avehobj] call RPM_Cfg_Network_Broadcast;
                                    [_avehobj, 0] spawn RPM_Cfg_Vehicle_Delete;
                                    if (isNull(_avehobj)) then {
                                        format["call RPM_Cfg_Inv_SaveKeyOwners;"] call RPM_Cfg_Network_Broadcast;
                                        if (RPM_Diagnostics) then {
                                            [format["RPM(Vehicles)|Impounded|%1|%2|%3", name RPM_Role, _uid, _aveh], false] call RPM_Cfg_Server_DiagnosticsDumper;
                                        };
                                        publicVariable "a39";
                                    };
                                    closeDialog 0;
                                };
                                b1 = false;
                            };
                        };
                    };
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Vehicles_AddImpounded = {
    private ["_ret","_owner","_plate","_class","_i","_found","_arr","_aowner","_tmparr","_newarr"];
    _ret = false;
    _owner = _this select 0;
    _plate = _this select 1;
    _class = _this select 2;
    if (!([_owner, _plate, _class] call RPM_Cfg_Vehicles_IsImpounded)) then {
        _found = -1;
        for [{_i = 0}, {_i < count(a39)}, {_i = _i + 1}] do {
            _arr = a39 select _i;
            _aowner = _arr select 0;
            if (_owner == _aowner) then {
                _found = _i;
            };
        };
        if (_found != -1) then {
            _tmparr = + (a39 select _found) select 1;
            _newarr = [_plate, _class];
            _tmparr set[count(_tmparr), _newarr];
            format["(a39 select %1) set[1, %2];", _found, _tmparr] call RPM_Cfg_Network_Broadcast;
        } else {
            _tmparr = [_owner, [[_plate, _class]]];
            format["a39 set[count(a39), %1];", _tmparr] call RPM_Cfg_Network_Broadcast;
        };
        if ([_owner, _plate, _class] call RPM_Cfg_Vehicles_IsImpounded) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_DelImpounded = {
    private ["_ret","_owner","_plate","_class","_i","_found","_arr","_aowner","_tmparr","_aplate","_aclass"];
    _ret = false;
    _owner = _this select 0;
    _plate = _this select 1;
    _class = _this select 2;
    if ([_owner, _plate, _class] call RPM_Cfg_Vehicles_IsImpounded) then {
        _found = -1;
        for [{_i = 0}, {_i < count(a39)}, {_i = _i + 1}] do {
            _arr = a39 select _i;
            _aowner = _arr select 0;
            if (_owner == _aowner) then {
                _found = _i;
            };
        };
        if (_found != -1) then {
            _tmparr = + (a39 select _found) select 1;
            for [{_i = 0}, {_i < count(_tmparr)}, {_i = _i + 1}] do {
                _aplate = (_tmparr select _i) select 0;
                _aclass = (_tmparr select _i) select 1;
                if ((_plate == _aplate) && (_class == _aclass)) then {
                    _tmparr set[_i, -1];
                    _tmparr = _tmparr - [-1];
                    if (count(_tmparr) == 0) then {
                        format["a39 set[%1, -1];
                        a39 = a39 - [-1];
                        ", _found] call RPM_Cfg_Network_Broadcast;
                    } else {
                        format["(a39 select %1) set[1, %2];", _found, _tmparr] call RPM_Cfg_Network_Broadcast;
                    };
                    if (!([_owner, _plate, _class] call RPM_Cfg_Vehicles_IsImpounded)) then {
                        _ret = true;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicles_IsImpounded = {
    private ["_i","_c","_aplate","_aclass","_arr","_aowner","_avehs","_ret","_owner","_plate","_class"];
    _ret = false;
    _owner = _this select 0;
    _plate = _this select 1;
    _class = _this select 2;
    for [{_i = 0}, {_i < count(a39)}, {_i = _i + 1}] do {
        _arr = a39 select _i;
        _aowner = _arr select 0;
        if (_owner == _aowner) then {
            _avehs = _arr select 1;
            for [{_c = 0}, {_c < count(_avehs)}, {_c = _c + 1}] do {
                _aplate = (_avehs select _c) select 0;
                _aclass = (_avehs select _c) select 1;
                if ((_plate == _aplate) && (_class == _aclass)) then {
                    _ret = true;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Vehicle_GetObject = {
    private ["_ret"];
    _ret = objNull;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (vehicle RPM_Role == RPM_Role) then {
        _ret  = (nearestObjects[RPM_Role,["Air", "Ship","Car","Motorcycle","Tank","Truck"], 6]) select 0;
    } else {
        _ret = vehicle RPM_Role;
    };
    _ret;
};

RPM_Cfg_Vehicle_FillUp = {
};

RPM_Cfg_Vehicle_Siren = {
};

RPM_Cfg_Vehicle_Stats = {
    private ["_vehicle","_thedriver","_state","_vel","_gas","_crew","_register","_thecrew","_driver","_vcl"];
    _vcl = _this select 0;
    if (isNull(_vcl)) exitWith {};
    _vehicle = (typeOf _vcl) call RPM_Cfg_Vehicle_GetName;
    _driver = driver _vcl;
    _thedriver = format["%1", _driver];
    if (isNull(_driver)) then {
        _thedriver = format[localize "v419"];
    };
    _state = getDammage _vcl * 100;
    _vel = ceil(speed _vcl);
    if ((_vel >= 0) and (_vel <= 1)) then {
        _vel = 0;
    };
    _gas = floor (fuel _vcl * 100);
    _register = format["%1", _vcl];
    _crew = crew _vcl;
    _thecrew = "";
    if (count(_crew) == 0) then {
        _thecrew = format[localize "v419"];
    } else {
        {
            if (count(_crew) > 1) then {
                _thecrew = _thecrew + format["%1, ", _x];
            } else {
                _thecrew = format[localize "v419"];
            };
        } forEach _crew;
    };
    _register = vehicleVarName _vcl;
    hint format[localize "v384", _thedriver, _vehicle, _state, _vel, _gas, _register, _thecrew];
};
RPM_Cfg_Vehicles_Create = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_class","_position","_time","_delay","_diffx","_diffy","_civposition","_pposx","_pposy","_cposx","_cposy"];
        _class = _this select 0;
        _position = + (_this select 1);
        _civposition = RPM_Role modelToWorld [0,3,0];
        _pposx = _position select 0;
        _pposy = _position select 1;
        _cposx = _civposition select 0;
        _cposy = _civposition select 1;
        _diffx = 0;
        _diffy = 0;
        if (_pposx > _cposx) then {
            _diffx = _pposx - _cposx;
        } else {
            _diffx = _cposx - _pposx;
        };
        if (_pposy > _cposy) then {
            _diffy = _pposy - _cposy;
        } else {
            _diffy = _cposy - _pposy;
        };
        if ((_diffx < 3) || (_diffy < 3)) then {
            if (_diffx < 3) then {
                _position set[0, (_position select 0) + 2];
            };
            if (_diffy < 3) then {
                _position set[1, (_position select 1) + 2];
            };
        };
        _delay = 0;
        if (count(_this) >= 3) then {
            _delay = _this select 2;
        };
        sleep _delay;
        _time = round(time);
        waitUntil {(!(b19))};
        format["[""%1"", %2, ""%3"", %4] call RPM_Cfg_Inv_CreateVehicleServer;", _class, _position, name RPM_Role, _time] call RPM_Cfg_Network_Broadcast;
        waitUntil {(!(b19))};
        format["call RPM_Cfg_Inv_SaveKeyOwners;"] call RPM_Cfg_Network_Broadcast;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Vehicles_CreateImpound = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_class","_position","_delay","_plate"];
        _class = _this select 0;
        _position = _this select 1;
        _plate = _this select 2;
        _delay = 0;
        if (count(_this) >= 4) then {
            _delay = _this select 3;
        };
        sleep _delay;
        waitUntil {(!(b19))};
        format["[""%1"", %2, ""%3"", ""%4""] call RPM_Cfg_Inv_CreateImpoundVehicleServer;", _class, _position, name RPM_Role, _plate] call RPM_Cfg_Network_Broadcast;
        waitUntil {(!(b19))};
        format["call RPM_Cfg_Inv_SaveKeyOwners;"] call RPM_Cfg_Network_Broadcast;
    };
    _ret = true;
    _ret;
};