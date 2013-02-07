// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Inventory
// Mug
RPM_Cfg_Inv_Mug = {
    private ["_tgt","_ret"];
    _ret = false;
    _tgt = _this select 0;
    if (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUse) && (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {};
    if (name _tgt == name RPM_Role) exitWith {
        hint format[localize "v173"];
    };
    if (_ret) then {
        if (RPM_Diagnostics) then {
            [format["RPM(Interact)|Mugged|%1|%2|%3,%4|%5", name RPM_Role, name _tgt, 0, 0, 0], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
    };
    _ret;
};
// Debug Actions
CL_AddDebugActions = {
    private ["_i","_actn","_actname","_actscr","_actarg","_actpri","_ret"];
    _ret = false;
    for [{_i = 0}, {_i < count(RPM_Person_DebugActions)}, {_i = _i + 1}] do {
        _actn = ((RPM_Person_DebugActions) select _i) select 1;
        _actname = _actn select 0;
        _actscr = _actn select 1;
        _actarg = _actn select 2;
        _actpri = _actn select 3;
        (RPM_Person_DebugActions select _i) set[0, RPM_Role];
        (((RPM_Person_DebugActions) select _i) select 0) addAction [_actname, _actscr, _actarg, _actpri];
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_HasDrugs = {
    private ["_ret"];
    _ret = false;
    {
        if ([_x] call RPM_Cfg_Inv_GetItemAmount >= 1) then {
            _ret = true;
        };
    } forEach a87;
    _ret;
};
RPM_Person_InteractsRemover = {
    private ["_ret"];
    _ret = false;
    RPM_Person_InteractsAdded = [];
    _ret = true;
    _ret;
};
RPM_Person_InteractsAdder = {
    private ["_i","_actn","_tmp","_c","_found","_anchor","_actname","_ret","_jip","_tveh","_vehs","_tvehs","_veh","_script","_argument","_priority","_condition","_n"];
    _ret = false;
    // Add vehicle inside interacts
    if (RPM_Role != vehicle RPM_Role) then {
        _tveh = vehicle RPM_Role;
        if (_tveh call RPM_Cfg_Vehicles_IsVehicle) then {
            // Remove outside interacts
            for [{_i = 0}, {_i < count(RPM_Vehicle_PersonInteractsAdded)}, {_i = _i + 1}] do {
                if (!(isNull((RPM_Vehicle_PersonInteractsAdded select _i) select 0))) then {
                    ((RPM_Vehicle_PersonInteractsAdded select _i) select 0) removeAction ((RPM_Vehicle_PersonInteractsAdded select _i) select 1);
                };
                //(RPM_Vehicle_Interacts_Person select ((RPM_Vehicle_PersonInteractsAdded select _i) select 2)) set[0, objNull];
                RPM_Vehicle_PersonInteractsAdded set[_i, -1];
                RPM_Vehicle_PersonInteractsAdded = RPM_Vehicle_PersonInteractsAdded - [-1];
            };
            // Remove distant inner actions
            for [{_i = 0}, {_i < count(RPM_Vehicle_VehicleInteractsAdded)}, {_i = _i + 1}] do {
                if (!(isNull((RPM_Vehicle_VehicleInteractsAdded select _i) select 0))) then {
                    if (RPM_Role distance ((RPM_Vehicle_VehicleInteractsAdded select _i) select 0) >= 7) then {
                        ((RPM_Vehicle_VehicleInteractsAdded select _i) select 0) removeAction ((RPM_Vehicle_VehicleInteractsAdded select _i) select 1);
                        RPM_Vehicle_VehicleInteractsAdded set[_i, -1];
                        RPM_Vehicle_VehicleInteractsAdded = RPM_Vehicle_VehicleInteractsAdded - [-1];
                    };
                };
            };
            // Remove distant person actions
            for [{_i = 0}, {_i < count(RPM_Vehicle_PersonInteractsAdded)}, {_i = _i + 1}] do {
                if (!(isNull((RPM_Vehicle_PersonInteractsAdded select _i) select 0))) then {
                    if (RPM_Role distance ((RPM_Vehicle_PersonInteractsAdded select _i) select 0) >= 7) then {
                        ((RPM_Vehicle_PersonInteractsAdded select _i) select 0) removeAction ((RPM_Vehicle_PersonInteractsAdded select _i) select 1);
                        RPM_Vehicle_PersonInteractsAdded set[_i, -1];
                        RPM_Vehicle_PersonInteractsAdded = RPM_Vehicle_PersonInteractsAdded - [-1];
                    };
                };
            };
            // Add inside interacts
            for [{_i = 0}, {_i < count(RPM_Vehicle_Interacts_Vehicle)}, {_i = _i + 1}] do {
                _anchor = (RPM_Vehicle_Interacts_Vehicle select _i) select 0;
                _actname = ((RPM_Vehicle_Interacts_Vehicle select _i) select 1) select 0;
                _script = ((RPM_Vehicle_Interacts_Vehicle select _i) select 1) select 1;
                _argument = ((RPM_Vehicle_Interacts_Vehicle select _i) select 1) select 2;
                _priority = ((RPM_Vehicle_Interacts_Vehicle select _i) select 1) select 3;
                _condition = ((RPM_Vehicle_Interacts_Vehicle select _i) select 1) select 4;
                if (isNull(_anchor)) then {
                    _anchor = _tveh;
                    (RPM_Vehicle_Interacts_Vehicle select _i) set[0, _anchor];
                    _actn = _anchor addAction[_actname, _script, _argument, _priority, false, true, "", _condition];
                    _tmp = [_anchor, _actn, _i];
                    RPM_Vehicle_VehicleInteractsAdded set[_i, _tmp];
                } else {
                    if (_anchor != _tveh) then {
                        ((RPM_Vehicle_VehicleInteractsAdded select _i) select 0) removeAction ((RPM_Vehicle_VehicleInteractsAdded select _i) select 1);
                        (RPM_Vehicle_VehicleInteractsAdded select _i) set[0, _tveh];
                        _actn = _anchor addAction[_actname, _script, _argument, _priority, false, true, "", _condition];
                        (RPM_Vehicle_VehicleInteractsAdded select _i) set[1, _actn];
                    };
                };
            };
        };
    } else {
        // Remove inside interacts
        for [{_i = 0}, {_i < count(RPM_Vehicle_VehicleInteractsAdded)}, {_i = _i + 1}] do {
            if (!(isNull((RPM_Vehicle_VehicleInteractsAdded select _i) select 0))) then {
                ((RPM_Vehicle_VehicleInteractsAdded select _i) select 0) removeAction ((RPM_Vehicle_VehicleInteractsAdded select _i) select 1)
            };
            (RPM_Vehicle_Interacts_Vehicle select ((RPM_Vehicle_VehicleInteractsAdded select _i) select 2)) set[0, objNull];
            RPM_Vehicle_VehicleInteractsAdded set[_i, -1];
            RPM_Vehicle_VehicleInteractsAdded = RPM_Vehicle_VehicleInteractsAdded - [-1];
        };
        // Remove distant inner actions
        for [{_i = 0}, {_i < count(RPM_Vehicle_VehicleInteractsAdded)}, {_i = _i + 1}] do {
            if (!(isNull((RPM_Vehicle_VehicleInteractsAdded select _i) select 0))) then {
                if (RPM_Role distance ((RPM_Vehicle_VehicleInteractsAdded select _i) select 0) >= 7) then {
                    ((RPM_Vehicle_VehicleInteractsAdded select _i) select 0) removeAction ((RPM_Vehicle_VehicleInteractsAdded select _i) select 1);
                    RPM_Vehicle_VehicleInteractsAdded set[_i, -1];
                    RPM_Vehicle_VehicleInteractsAdded = RPM_Vehicle_VehicleInteractsAdded - [-1];
                };
            };
        };
        // Remove distant person actions
        for [{_i = 0}, {_i < count(RPM_Vehicle_PersonInteractsAdded)}, {_i = _i + 1}] do {
            if (!(isNull((RPM_Vehicle_PersonInteractsAdded select _i) select 0))) then {
                if (RPM_Role distance ((RPM_Vehicle_PersonInteractsAdded select _i) select 0) >= 7) then {
                    ((RPM_Vehicle_PersonInteractsAdded select _i) select 0) removeAction ((RPM_Vehicle_PersonInteractsAdded select _i) select 1);
                    RPM_Vehicle_PersonInteractsAdded set[_i, -1];
                    RPM_Vehicle_PersonInteractsAdded = RPM_Vehicle_PersonInteractsAdded - [-1];
                };
            };
        };
        _vehs = [];
        _tvehs = nearestObjects[RPM_Role,["Air", "Ship","Car","Motorcycle","Tank","Truck"], 6];
        {
            if (_x call RPM_Cfg_Vehicles_IsVehicle) then {
                _vehs = _vehs + [_x];
            };
        } forEach _tvehs;
        for [{_c = 0}, {_c < count(_vehs)}, {_c = _c + 1}] do {
            // Select a vehicle
            _veh = _vehs select _c;
            // Add outside interacts
            for [{_i = 0}, {_i < count(RPM_Vehicle_Interacts_Person)}, {_i = _i + 1}] do {
                _found = -1;
                for [{_n = 0}, {_n < count(RPM_Vehicle_PersonInteractsAdded)}, {_n = _n + 1}] do {
                    if (((RPM_Vehicle_PersonInteractsAdded select _n) select 0) == _veh) then {
                        if (((RPM_Vehicle_PersonInteractsAdded select _n) select 2) == _i) then {
                            _found = _n;
                        };
                    };
                };
                if (_found == -1) then {
                    _actname = (RPM_Vehicle_Interacts_Person select _i) select 0;
                    _script = (RPM_Vehicle_Interacts_Person select _i) select 1;
                    _argument = (RPM_Vehicle_Interacts_Person select _i) select 2;
                    _priority = (RPM_Vehicle_Interacts_Person select _i) select 3;
                    _condition = (RPM_Vehicle_Interacts_Person select _i) select 4;
                    _actn = _veh addAction[_actname, _script, _argument, _priority, false, true, "", _condition];
                    _tmp = [_veh, _actn, _i];
                    RPM_Vehicle_PersonInteractsAdded set[count(RPM_Vehicle_PersonInteractsAdded), _tmp];
                };
            };
        };
    };
    // Add player interacts
    for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
        if (!(isNull(RPM_POBJArr select _i))) then {
            _anchor = (RPM_POBJArr) select _i;
            _jip = _anchor getVariable "jip";
            if (!(isNil("_jip"))) then {
                if (!(_jip)) then {
                    if (!(local _anchor)) then {
                        _actname = format["%1%2", _anchor, _i];
                        if (count(RPM_Person_InteractsAdded) == 0) then {  
                            if (RPM_Role distance _anchor <= 8) then {
                                _actn = _anchor addAction[format[localize "v442", format["%1", name _anchor]], "RPM\Global\STD_NoScript.sqf", format["[%1] call RPM_Cfg_Interact_GUI;", _anchor], 4, true, false, ""];
                                _tmp = [_anchor, _actname, _i, _actn];
                                RPM_Person_InteractsAdded set[0, _tmp];
                            };
                        } else {
                            _found = -1;
                            for [{_c = 0}, {_c < count(RPM_Person_InteractsAdded)}, {_c = _c + 1}] do {
                                if (((RPM_Person_InteractsAdded select _c) select 1) == _actname) then {
                                    _found = _c;
                                };
                            };
                            if (_found == -1) then {
                                if (RPM_Role distance _anchor <= 8) then {
                                    _actn = _anchor addAction[format[localize "v442", format["%1", name _anchor]], "RPM\Global\STD_NoScript.sqf", format["[%1] call RPM_Cfg_Interact_GUI;", _anchor], 4, true, false, ""];
                                    _tmp = [_anchor, _actname, _i, _actn];
                                    RPM_Person_InteractsAdded set[count(RPM_Person_InteractsAdded), _tmp];
                                };
                            } else {
                                if (RPM_Role distance _anchor > 8) then {
                                    ((RPM_Person_InteractsAdded select _found) select 0) removeAction ((RPM_Person_InteractsAdded select _found) select 3);
                                    RPM_Person_InteractsAdded set[_found, -1];
                                    RPM_Person_InteractsAdded = RPM_Person_InteractsAdded - [-1];
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    for [{_i = 0}, {_i < count(RPM_Person_InteractsAdded)}, {_i = _i + 1}] do {
        if (isNull((RPM_Person_InteractsAdded select _i) select 0)) then {
            RPM_Person_InteractsAdded set[_i, -1];
            RPM_Person_InteractsAdded = RPM_Person_InteractsAdded - [-1];
        };
    };
    _ret = true;
    _ret;
};
RPM_Person_CivActionsRemover = {
    private ["_ret"];
    _ret = false;
    RPM_Person_CivActionsAdded = [];
    _ret = true;
    _ret;
};
RPM_Person_CivActionsAdder = {
    private ["_i","_anchor","_actname","_string","_script","_argument","_priority","_condition","_self","_marker","_distance","_ret","_add","_actn","_tmp","_c","_found"];
    _ret = false;
    if (RPM_Civ) then {
        for [{_i = 0}, {_i < count(RPM_Person_CivActions)}, {_i = _i + 1}] do {
            _anchor = ((RPM_Person_CivActions) select _i) select 0;
            _actname = format["%1_%2", _anchor, _i];
            _string = (((RPM_Person_CivActions) select _i) select 1) select 0;
            _script = (((RPM_Person_CivActions) select _i) select 1) select 1;
            _argument = (((RPM_Person_CivActions) select _i) select 1) select 2;
            _priority = (((RPM_Person_CivActions) select _i) select 1) select 3;
            _condition = (((RPM_Person_CivActions) select _i) select 1) select 4;
            _self = (((RPM_Person_CivActions) select _i) select 1) select 5;
            _marker = (((RPM_Person_CivActions) select _i) select 1) select 6;
            _distance = (((RPM_Person_CivActions) select _i) select 1) select 7;
            if (count(RPM_Person_CivActionsAdded) == 0) then {
                _add = false;
                if (_self) then {
                    _add = true;
                } else {
                    if (_marker call RPM_str_Length >= 1) then {
                        if ((RPM_Role distance (getMarkerPos _marker)) <= _distance) then {
                            _add = true;
                        };
                    };
                };
                if (_add) then {
                    _actn = _anchor addAction[_string, _script, _argument, _priority, false, true, "", _condition];
                    _tmp = [_anchor, _actname, _i, _actn];
                    RPM_Person_CivActionsAdded set[0, _tmp];
                };
            } else {
                _found = -1;
                for [{_c = 0}, {_c < count(RPM_Person_CivActionsAdded)}, {_c = _c + 1}] do {
                    if (((RPM_Person_CivActionsAdded select _c) select 1) == _actname) then {
                        _found = _c;
                    };
                };
                if (_found == -1) then {
                    _add = false;
                    if (_self) then {
                        _add = true;
                    } else {
                        if (_marker call RPM_str_Length >= 1) then {
                            if ((RPM_Role distance (getMarkerPos _marker)) <= _distance) then {
                                _add = true;
                            };
                        };
                    };
                    if (_add) then {
                        _actn = _anchor addAction[_string, _script, _argument, _priority, false, true, "", _condition];
                        _tmp = [_anchor, _actname, _i, _actn];
                        RPM_Person_CivActionsAdded set[count(RPM_Person_CivActionsAdded), _tmp];
                    };
                } else {
                    if (_marker call RPM_str_Length >= 1) then {
                        if ((RPM_Role distance (getMarkerPos _marker)) > _distance) then {
                            ((RPM_Person_CivActionsAdded select _found) select 0) removeAction ((RPM_Person_CivActionsAdded select _found) select 3);
                            RPM_Person_CivActionsAdded set[_found, -1];
                            RPM_Person_CivActionsAdded = RPM_Person_CivActionsAdded - [-1];
                        };
                    };
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Person_GlobalActionsRemover = {
    private ["_ret"];
    _ret = false;
    RPM_Person_GlobalActionsAdded = [];
    _ret = true;
    _ret;
};
RPM_Person_GlobalActionsAdder = {
    private ["_i","_actn","_tmp","_c","_found","_anchor","_actname","_string","_script","_argument","_priority","_condition","_ret"];
    _ret = false;
    for [{_i = 0}, {_i < count(RPM_Person_GlobalActions)}, {_i = _i + 1}] do {
        _anchor = ((RPM_Person_GlobalActions) select _i) select 0;
        _actname = format["%1_%2", _anchor, _i];
        _string = (((RPM_Person_GlobalActions) select _i) select 1) select 0;
        _script = (((RPM_Person_GlobalActions) select _i) select 1) select 1;
        _argument = (((RPM_Person_GlobalActions) select _i) select 1) select 2;
        _priority = (((RPM_Person_GlobalActions) select _i) select 1) select 3;
        _condition = (((RPM_Person_GlobalActions) select _i) select 1) select 4;
        if (count(RPM_Person_GlobalActionsAdded) == 0) then {
            _actn = _anchor addAction[_string, _script, _argument, _priority, false, true, "", _condition];
            _tmp = [_anchor, _actname, _i, _actn];
            RPM_Person_GlobalActionsAdded set[0, _tmp];
        } else {
            _found = -1;
            for [{_c = 0}, {_c < count(RPM_Person_GlobalActionsAdded)}, {_c = _c + 1}] do {
                if (((RPM_Person_GlobalActionsAdded select _c) select 1) == _actname) then {
                    _found = _c;
                };
            };
            if (_found == -1) then {
                _actn = _anchor addAction[_string, _script, _argument, _priority, false, true, "", _condition];
                _tmp = [_anchor, _actname, _i, _actn];
                RPM_Person_GlobalActionsAdded set[count(RPM_Person_GlobalActionsAdded), _tmp];
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_NPC_GlobalActionsRemover = {
    private ["_i","_ret"];
    _ret = false;
    for [{_i = 0}, {_i < count(RPM_NPC_GlobalActionsAdded)}, {_i = _i + 1}] do {
        ((RPM_NPC_GlobalActionsAdded select _i) select 0) removeAction ((RPM_NPC_GlobalActionsAdded select _i) select 3);
        RPM_NPC_GlobalActionsAdded set[_i, -1];
        RPM_NPC_GlobalActionsAdded = RPM_NPC_GlobalActionsAdded - [-1];
    };
    _ret = true;
    _ret;
};
RPM_NPC_GlobalActionsAdder = {
    private ["_i","_actn","_tmp","_c","_found","_anchor","_actname","_string","_script","_argument","_priority","_condition","_distance","_ret"];
    _ret = false;
    for [{_i = 0}, {_i < count(RPM_NPC_GlobalActions)}, {_i = _i + 1}] do {
        _anchor = ((RPM_NPC_GlobalActions) select _i) select 0;
        _actname = format["%1_%2", _anchor, _i];
        _string = (((RPM_NPC_GlobalActions) select _i) select 1) select 0;
        _script = (((RPM_NPC_GlobalActions) select _i) select 1) select 1;
        _argument = (((RPM_NPC_GlobalActions) select _i) select 1) select 2;
        _priority = (((RPM_NPC_GlobalActions) select _i) select 1) select 3;
        _condition = (((RPM_NPC_GlobalActions) select _i) select 1) select 4;
        _distance = (((RPM_NPC_GlobalActions) select _i) select 1) select 5;
        if (count(RPM_NPC_GlobalActionsAdded) == 0) then {
            if ((RPM_Role distance (getPos _anchor)) <= _distance) then {
                _actn = _anchor addAction[_string, _script, _argument, _priority, false, true, "", _condition];
                _tmp = [_anchor, _actname, _i, _actn];
                RPM_NPC_GlobalActionsAdded set[0, _tmp];
            };
        } else {
            _found = -1;
            for [{_c = 0}, {_c < count(RPM_NPC_GlobalActionsAdded)}, {_c = _c + 1}] do {
                if (((RPM_NPC_GlobalActionsAdded select _c) select 1) == _actname) then {
                    _found = _c;
                };
            };
            if (_found == -1) then {
                if ((RPM_Role distance _anchor) <= _distance) then {
                    _actn = _anchor addAction[_string, _script, _argument, _priority, false, true, "", _condition];
                    _tmp = [_anchor, _actname, _i, _actn];
                    RPM_NPC_GlobalActionsAdded set[count(RPM_NPC_GlobalActionsAdded), _tmp];
                };
            } else {
                if ((RPM_Role distance _anchor) > _distance) then {
                    ((RPM_NPC_GlobalActionsAdded select _found) select 0) removeAction ((RPM_NPC_GlobalActionsAdded select _found) select 3);
                    RPM_NPC_GlobalActionsAdded set[_found, -1];
                    RPM_NPC_GlobalActionsAdded = RPM_NPC_GlobalActionsAdded - [-1];
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_NPC_CivActionsRemover = {
    private ["_i","_ret"];
    _ret = false;
    for [{_i = 0}, {_i < count(RPM_NPC_CivActionsAdded)}, {_i = _i + 1}] do {
        ((RPM_NPC_CivActionsAdded select _i) select 0) removeAction ((RPM_NPC_CivActionsAdded select _i) select 3);
        RPM_NPC_CivActionsAdded set[_i, -1];
        RPM_NPC_CivActionsAdded = RPM_NPC_CivActionsAdded - [-1];
    };
    _ret = true;
    _ret;
};
RPM_NPC_CivActionsAdder = {
    private ["_i","_actn","_tmp","_c","_found","_anchor","_actname","_string","_script","_argument","_priority","_condition","_distance","_ret"];
    _ret = false;
    if (RPM_Civ) then {
        for [{_i = 0}, {_i < count(RPM_NPC_CivActions)}, {_i = _i + 1}] do {
            _anchor = (RPM_NPC_CivActions select _i) select 0;
            _actname = format["%1_%2", _anchor, _i];
            _string = ((RPM_NPC_CivActions select _i) select 1) select 0;
            _script = ((RPM_NPC_CivActions select _i) select 1) select 1;
            _argument = ((RPM_NPC_CivActions select _i) select 1) select 2;
            _priority = ((RPM_NPC_CivActions select _i) select 1) select 3;
            _condition = ((RPM_NPC_CivActions select _i) select 1) select 4;
            _distance = (((RPM_NPC_CivActions) select _i) select 1) select 5;
            if (count(RPM_NPC_CivActionsAdded) == 0) then {
                if ((RPM_Role distance _anchor) <= _distance) then {
                    _actn = _anchor addAction[_string, _script, _argument, _priority, false, true, "", _condition];
                    _tmp = [_anchor, _actname, _i, _actn];
                    RPM_NPC_CivActionsAdded set[0, _tmp];
                };
            } else {
                _found = -1;
                for [{_c = 0}, {_c < count(RPM_NPC_CivActionsAdded)}, {_c = _c + 1}] do {
                    if (((RPM_NPC_CivActionsAdded select _c) select 1) == _actname) then {
                        _found = _c;
                    };
                };
                if (_found == -1) then {
                    if ((RPM_Role distance _anchor) <= _distance) then {
                        _actn = _anchor addAction[_string, _script, _argument, _priority, false, true, "", _condition];
                        _tmp = [_anchor, _actname, _i, _actn];
                        RPM_NPC_CivActionsAdded set[count(RPM_NPC_CivActionsAdded), _tmp];
                    };
                } else {
                    if ((RPM_Role distance _anchor) > _distance) then {
                        ((RPM_NPC_CivActionsAdded select _found) select 0) removeAction ((RPM_NPC_CivActionsAdded select _found) select 3);
                        RPM_NPC_CivActionsAdded set[_found, -1];
                        RPM_NPC_CivActionsAdded = RPM_NPC_CivActionsAdded - [-1];
                    };
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_NPC_CopActionsRemover = {
    private ["_i","_ret"];
    _ret = false;
    for [{_i = 0}, {_i < count(RPM_NPC_CopActionsAdded)}, {_i = _i + 1}] do {
        ((RPM_NPC_CopActionsAdded select _i) select 0) removeAction ((RPM_NPC_CopActionsAdded select _i) select 3);
        RPM_NPC_CopActionsAdded set[_i, -1];
        RPM_NPC_CopActionsAdded = RPM_NPC_CopActionsAdded - [-1];
    };
    _ret;
    _ret;
};
RPM_NPC_CopActionsAdder = {
    private ["_i","_actn","_tmp","_c","_found","_anchor","_actname","_string","_script","_argument","_priority","_condition","_distance","_ret"];
    _ret = false;
    if (RPM_Cop) then {
        for [{_i = 0}, {_i < count(RPM_NPC_CopActions)}, {_i = _i + 1}] do {
            _anchor = (RPM_NPC_CopActions select _i) select 0;
            _actname = format["%1_%2", _anchor, _i];
            _string = ((RPM_NPC_CopActions select _i) select 1) select 0;
            _script = ((RPM_NPC_CopActions select _i) select 1) select 1;
            _argument = ((RPM_NPC_CopActions select _i) select 1) select 2;
            _priority = ((RPM_NPC_CopActions select _i) select 1) select 3;
            _condition = ((RPM_NPC_CopActions select _i) select 1) select 4;
            _distance = (((RPM_NPC_CopActions) select _i) select 1) select 5;
            if (count(RPM_NPC_CopActionsAdded) == 0) then {
                if ((RPM_Role distance _anchor) <= _distance) then {
                    _actn = _anchor addAction[_string, _script, _argument, _priority, false, true, "", _condition];
                    _tmp = [_anchor, _actname, _i, _actn];
                    RPM_NPC_CopActionsAdded set[0, _tmp];
                };
            } else {
                _found = -1;
                for [{_c = 0}, {_c < count(RPM_NPC_CopActionsAdded)}, {_c = _c + 1}] do {
                    if (((RPM_NPC_CopActionsAdded select _c) select 1) == _actname) then {
                        _found = _c;
                    };
                };
                if (_found == -1) then {
                    if ((RPM_Role distance _anchor) <= _distance) then {
                        _actn = _anchor addAction[_string, _script, _argument, _priority, false, true, "", _condition];
                        _tmp = [_anchor, _actname, _i, _actn];
                        RPM_NPC_CopActionsAdded set[count(RPM_NPC_CopActionsAdded), _tmp];
                    };
                } else {
                    if ((RPM_Role distance _anchor) > _distance) then {
                        ((RPM_NPC_CopActionsAdded select _found) select 0) removeAction ((RPM_NPC_CopActionsAdded select _found) select 3);
                        RPM_NPC_CopActionsAdded set[_found, -1];
                        RPM_NPC_CopActionsAdded = RPM_NPC_CopActionsAdded - [-1];
                    };
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_DumpToGround = {
    private ["_i","_tmp","_c","_found","_titemclass","_tweps","_tmags","_ret","_exit","_weapons","_magazines"];
    _ret = false;
    _exit = false;
    if ((isNull(RPM_Role)) || (!(alive(RPM_Role)))) then {
        _exit = true;
    };
    if (!(_exit)) then {
        call compile format['weaponholder%1 = "weaponholder" createVehicle getpos RPM_Role;weaponholder%1 setVehicleInit "this setVehicleVarName ""weaponholder%1"";weaponholder%1 = this;";processInitCommands;', RPM_RoleNumber];
        _tweps = [];
        _tmags = [];
        _weapons = + weapons(RPM_Role);
        for [{_i = 0}, {_i < count(_weapons)}, {_i = _i + 1}] do {
            _titemclass = _weapons select _i;
            if (!(_titemclass in a30)) then {
                RPM_Role removeWeapon _titemclass;
                if (count(_tweps) == 0) then {
                    _tmp = [_titemclass, 1];
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
                        _tmp set[1, 1 + ((_tweps select _found) select 1)];
                        _tweps set[_found, _tmp];
                    } else {
                        _tmp = [_titemclass, 1];
                        _tweps set[count(_tweps), _tmp];
                    };
                };
            };
        };
        _magazines = + magazines(RPM_Role);
        for [{_i = 0}, {_i < count(_magazines)}, {_i = _i + 1}] do {
            _titemclass = _magazines select _i;
            if (!(_titemclass in a30)) then {
                RPM_Role removeMagazine _titemclass;
                if (count(_tmags) == 0) then {
                    _tmp = [_titemclass, 1];
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
                        _tmp set[1, 1 + ((_tmags select _found) select 1)];
                        _tmags set[_found, _tmp];
                    } else {
                        _tmp = [_titemclass, 1];
                        _tmags set[count(_tmags), _tmp];
                    };
                };
            };
        };
        if (!(ARMA2_Vanilla)) then {
            call compile format['for [{_n = 0}, {_n < count(%4)}, {_n = _n + 1}] do {
                _twep = (%4 select _n) select 0;
                _tcount = (%4 select _n) select 1;
                weaponholder%2 addWeaponCargoGlobal[_twep, _tcount];
                weaponholder%2 setpos %3;
            };
            for [{_n = 0}, {_n < count(%5)}, {_n = _n + 1}] do {
                _tmag = (%5 select _n) select 0;
                _tcount = (%5 select _n) select 1;
                weaponholder%2 addMagazineCargoGlobal[_tmag, _tcount];
                weaponholder%2 setpos %3;
            };', RPM_Role, RPM_RoleNumber, (getpos RPM_Role), _tweps, _tmags];
        } else {
            format['for [{_n = 0}, {_n < count(%4)}, {_n = _n + 1}] do {
                _twep = (%4 select _n) select 0;
                _tcount = (%4 select _n) select 1;
                weaponholder%2 addWeaponCargo[_twep, _tcount];
                weaponholder%2 setpos %3;
            };
            for [{_n = 0}, {_n < count(%5)}, {_n = _n + 1}] do {
                _tmag = (%5 select _n) select 0;
                _tcount = (%5 select _n) select 1;
                weaponholder%2 addMagazineCargo[_tmag, _tcount];
                weaponholder%2 setpos %3;
            };', RPM_Role, RPM_RoleNumber, (getpos RPM_Role), _tweps, _tmags] call RPM_Cfg_Network_Broadcast;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_InDMZ = {
    private ["_size","_ret","_player"];
    _ret = [];
    _player = _this;
    {
        _size = getMarkerSize _x;
        if (_player distance (getMarkerPos _x) <= (round((_size select 0) + (_size select 1)) / 2)) then {
            _ret set[count(_ret), _x];
        };
    } forEach RPM_DMZ;
    _ret;
};
RPM_Cfg_Inv_HandleDamage = {
    private ["_ret","_in"];
    _ret = _this select 2;
	_ammo = _this select 4;
	if (_ammo in a44) exitWith
	{
		(_this select 0) setDamage 0;
		(_this select 0) spawn RPM_Cfg_Items_Taser_Stun;
	};
    _in = RPM_Role call RPM_Cfg_Inv_InDMZ;
    if (count(_in) >= 1) then {
        _ret = false;
    };
    _ret;
};
RPM_Cfg_Inv_KilledHandler = {
    private ["_ret","_nvcls","_killer","_player","_playername","_killername"];
    _ret = false;
    _player = _this select 0;
    _killer = _this select 1;
    _playername = _this select 2;
    _killername = "";
    if ((!(isNull(_killer))) && (_killer in RPM_POBJArr)) then {
        _killername = name _killer;
    };
    _nvcls = nearestObjects [getpos _player, ["LandVehicle"], 5];
    if (!(alive(_player))) then {
        [_killer, _killername, _player, _playername, _nvcls] spawn {
            private ["_suicided","_starved","_killer","_killedbyveh","_murdered","_nvcls","_player","_killername","_playername"];
            _killer = _this select 0;
            _killername = _this select 1;
            _player = _this select 2;
            _playername = _this select 3;
            _nvcls = _this select 4;
            if (!(_killer in RPM_POBJArr)) then {
                ["Died", RPM_Role] spawn RPM_Cfg_Logs_AddLog;
            } else {
                _killedbyveh = false;
                _suicided = false;
                _starved = false;
                _murdered = false;
                if (RPM_Role == _killer) then {
                    if (i9 <= 99) then {
                        ["Suicide", RPM_Role] spawn RPM_Cfg_Logs_AddLog;
                        _suicided = true;
                    } else {
                        if (i9 >= 100) then {
                            ["Starved", RPM_Role] spawn RPM_Cfg_Logs_AddLog;
                            _starved = true;
                        };
                    };
                    if ((!(_starved)) && (!(_suicided))) then {
                        {
                            if ((speed _x > 10) and (!(isNull(driver _x)))) then {
                                _killer = driver _x;
                                ["RanDown", RPM_Role, [name _killer]] spawn RPM_Cfg_Logs_AddLog;
                                _killedbyveh = true;
                            };
                        } forEach _nvcls;
                    };
                } else {
                    if ((!(_killedbyveh)) && (!(_suicided)) && (!(_starved))) then {
                        ["Killed", _playername, [_killername]] spawn RPM_Cfg_Logs_AddLog;
                        _murdered = true;
                    };
                };
                (format ["
				if ((%6) && (!(%5))) then {
					[""EmergChat"", [""%3 WAS KILLED AT %9!""]] call CBA_fnc_globalEvent;
				};
				if (%5) then {
					[""EmergChat"", [""%3 WAS HIT BY A VEHICLE AT %9!""]] call CBA_fnc_globalEvent;
				};
				if (%7) then {
					[""EmergChat"", [""%3 STARVED TO DEATH AT %9!""]] call CBA_fnc_globalEvent;
				};
				if (%8) then {
					[""EmergChat"", [""%3 KILLED THEMSELF AT %9!""]] call CBA_fnc_globalEvent;
				};
				", _player, _killer, _playername, _killername, _killedbyveh, _murdered, _starved, _suicided, mapGridPosition player]) call RPM_Cfg_Network_Broadcast;
            };
        };
    };
    _ret;
};

RPM_Cfg_Inv_HandleFired = {
    private ["_ret","_in","_bullet","_target","_go","_i","_tgtin"];
    _ret = true;
    _in = RPM_Role call RPM_Cfg_Inv_InDMZ;
    _bullet = _this select 6;
    _target = cursorTarget;
    _tgtin = _target  call RPM_Cfg_Inv_InDMZ;
    _go = true;
    if ((count(_in) >= 1) || ((count(_target call RPM_Cfg_Inv_InDMZ)) >= 1)) then {
        _go = false;
    } else {
        _go = true;
    };
    if (RPM_Cop) then {
        _go = true;
        for [{_i = 0}, {_i < count(_tgtin)}, {_i = _i + 1}] do {
            if (((_tgtin select _i) != ("marker_police_base")) && (_tgtin select _i != "police_dmz")) then {
                _go = true;
            } else {
                _go = false;
            };
        };
    };
    if (!(_go)) then {
        deleteVehicle _bullet;
        if (i27 >= 3) then {
            hint format[localize "STRM_LostWeaponsInDMZ"];
            call RPM_Cfg_Inv_DumpToGround;
            [RPM_Role, RPM_Role, true] call RPM_Cfg_Items_Taser_Effects;
            i27 = 0;
        } else {
            hint format[localize "STRM_ShootingInDMZ", 3 - i27, 3];
            i27 = i27 + 1;
        };
        _ret = false;
    };
    _ret;
};
RPM_Cfg_Inv_GetLicenseName = {
    private ["_ret","_license"];
    _ret = "";
    _license = _this;
    switch (_license) do {
        case "lic_air": {
            _ret = format[localize "v238"];
        };
        case"lic_boat": {
            _ret = format[localize "v240"];
        };
        case "lic_car": {
            _ret = format[localize "v242"];
        };
        case "lic_pickup": {
            _ret = format[localize "v244"];
        };
        case "lic_truck": {
            _ret = format[localize "v246"];
        };
        case "lic_pistol": {
            _ret = format[localize "v248"];
        };
        case "lic_rifle": {
            _ret = format[localize "v250"];
        };
    };
    _ret;
};
RPM_Cfg_Inv_NPCGetInUse = {
    private ["_ret","_npc","_var","_art"];
    _ret = false;
    _npc = _this select 0;
    _art = _this select 1;
    _var = _npc getVariable (format["inuse%1", _art]);
    if (!(isNil("_var"))) then {
        if ((!(isNull(_var))) && (_var != RPM_Role)) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Inv_NPCGetInUser = {
    private ["_ret","_npc","_var","_art"];
    _ret = objNull;
    _npc = _this select 0;
    _art = _this select 1;
    _var = _npc getVariable (format["inuse%1", _art]);
    if (!(isNil("_var"))) then {
        if (!(isNull(_var))) then {
            _ret = _var;
        };
    };
    _ret;
};
RPM_Cfg_Inv_NPCSetInUse = {
    private ["_var","_ret","_npc","_art","_actor"];
    _ret = false;
    _npc = _this select 0;
    _art = _this select 1;
    _actor = _this select 2;
    if (!(isNull(_npc))) then {
        _npc setVariable[format["inuse%1", _art], _actor, true];
        _var = _npc getVariable (format["inuse%1", _art]);
        if (!(isNull(_actor))) then {
            if (_actor == _var) then {
                _ret = true;
            };
        } else {
            if ((isNull(_actor)) && (isNull(_var))) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Inv_SetDate = {
    private ["_ret"];
    _ret = false;
    [] spawn {
        setDate [i20 select 0, i20 select 1, i20 select 2, i20 select 3, (i20 select 4) + 1];
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_SaveGear = {
    private ["_ret","_i","_weps","_saved1","_mags","_c","_tmparr","_mcount","_class","_found"];
    _ret = false;
    if (!(b39)) then {
        if (!(isNull(RPM_Role))) then {
            if (alive RPM_Role) then {
                if (!(isNil("a79"))) then {
                    _weps = + (weapons RPM_Role);
                    _saved1 = [];
                    for [{_i = 0}, {_i < count(_weps)}, {_i = _i + 1}] do {
                        if (!((_weps select _i) in a32)) then {
                            _saved1 set[count(_saved1), _weps select _i];
                        };
                    };
                    _mags = + (magazines RPM_Role);
                    _tmparr = [];
                    for [{_i = 0}, {_i < count(_mags)}, {_i = _i + 1}] do {
                        if (count(_tmparr) == 0) then {
                            _tmparr set[0, [_mags select _i, 1]];
                        } else {
                            _found = -1;
                            for [{_c = 0}, {_c < count(_tmparr)}, {_c = _c + 1}] do {
                                if (((_tmparr select _c) select 0) == (_mags select _i)) then {
                                    _found = _c;
                                };
                            };
                            if (_found != -1) then {
                                (_tmparr select _found) set[1, ((_tmparr select _found) select 1) + 1];
                            } else {
                                _tmparr set[count(_tmparr), [_mags select _i, 1]];
                            };
                        };
                    };
                    for [{_i = 0}, {_i < count(_tmparr)}, {_i = _i + 1}] do {
                        _class = (_tmparr select _i) select 0;
                        _mcount = 0;
                        if (_class in a25) then {
                            _mcount = 4;
                        };
                        if (_class in a26) then {
                            _mcount = 2;
                        };
                        if (_class in a27) then {
                            _mcount = 12;
                        };
                        if (_class in a28) then {
                            _mcount = 8;
                        };
                        if (((_tmparr select _i) select 1) >= _mcount + 1) then {
                            (_tmparr select _i) set[1, _mcount];
                        };
                    };
                };
                a79 set[0, _saved1];
                a79 set[1, _tmparr];
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_RestoreGear = {
    private ["_ret","_i","_c","_class","_amount","_a79tmp"];
    _ret = false;
    if (!(isNull(RPM_Role))) then {
        if (alive RPM_Role) then {
            if (((count(a79 select 0) >= 1) || (count(a79 select 1) >= 1)) && (RPM_Cop)) then {
                _a79tmp = + (a79);
                removeAllWeapons player;
                for [{_i = 0}, {_i < count(_a79tmp select 1)}, {_i = _i + 1}] do {
                    _class = ((_a79tmp select 1) select _i) select 0;
                    _amount = ((_a79tmp select 1) select _i) select 1;
                    for [{_c = 0}, {_c < _amount}, {_c = _c + 1}] do {
                        RPM_Role addMagazine _class;
                    };
                };
                for [{_i = 0}, {_i < count(_a79tmp select 0)}, {_i = _i + 1}] do {
                    _class = (_a79tmp select 0) select _i;
                    RPM_Role addWeapon _class;
                };
                a79 = [[], []];
            } else {
                removeAllWeapons RPM_Role;
                a79 = [[], []];
            };
        };
    };
    b39 = false;
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_CompilePlayers = {
    private ["_ret"];
    _ret = false;
    [] execVM "RPM\Global\INC_Players.sqf";
    _ret = true;
    _ret;
};
RPM_Cfg_Server_DiagnosticsDumper = {
    private ["_ret","_str","_local"];
    _ret = false;
    if (_this select 0 call RPM_str_Length >= 1) then {
        _str = format["(T:%1) %2", floor(time), _this select 0];
        _local = _this select 1;
        if ((_local) && (RPM_Server)) then {
            diag_log format["%1", _str];
        } else {
            format["if (RPM_Server) then {diag_log ""%1"";};", _str] call RPM_Cfg_Network_Broadcast;
        };
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Vehicle_Delete = {
    private ["_vcl","_delay","_ret"];
    _ret = false;
    _vcl = _this select 0;
    _delay = _this select 1;
    sleep _delay;
    if (!(isNull(_vcl))) then {
        _vcl setVehicleInit "";
        call compile format["%1 = nil;", _vcl];
        _vcl call RPM_Cfg_Vehicles_Del;
        deleteVehicle _vcl;
        if (isNull(_vcl)) then {
            if (RPM_Diagnostics) then {
                [format["RPM(Vehicles)|Despawned|%1", format["%1", _vcl]], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            _ret = true;
        };
    };
    _ret;
};
// Killed
RPM_Cfg_Inv_Killed = {
    private ["_ret"];
    [] spawn {
        private ["_h","_i","_acn","_tmparr1","_tmparr2","_man","_tmparr3"];
        titleText["","Plain down"];
        while {dialog} do {
            closeDialog 0;
        };
        hint "";
        b39 = true;
        waitUntil {alive player};
        b45 = nil;
        [] execVM "RPM\Global\INC_Players.sqf";
        waitUntil {(!(isNil("b45")))};
        b45 = nil;
        _h = call RPM_Cfg_Objects_RecompileArrays;
        waitUntil {_h};
        _h = call RPM_Cfg_Inv_CompileStatsArray;
        waitUntil {_h};
        RPM_Role setVariable ["armor", false, true];
        RPM_Role setVariable ["cuffed", false, true];
        RPM_Role setVariable ["query", objNull, true];
        RPM_Role setVariable ["search", nil, true];
        disableUserInput false;
        if ((name RPM_Role) call RPM_Cfg_Mayor_IsMayor) then {
            "None" call RPM_Cfg_Mayor_SetMayor;
        };
        _h = call RPM_Cfg_Inv_RestoreGear;
        waitUntil {_h};
        if (RPM_Cop) then {
            for [{_i = 0}, {_i < count(a19)}, {_i = _i + 1}] do {
                {
                    if (((a19 select _i) select 0) == _x) then {
                        [(a19 select _i) select 0, (a19 select _i) select 1] call RPM_Cfg_Inv_DelItemAmount;
                    };
                } forEach a2;
            };
        } else {
            a19 = [];
        };
        i9 = 25;
        i27 = 0;
        call RPM_Cfg_Jail_AutoJailAfterConnect;
        //[(name RPM_Role), false] call RPM_Cfg_Crimes_SetJailed;
        //(name RPM_Role) call RPM_Cfg_Crimes_Unwant;
        b50 = false;
        a68 = [[],[]];
        for [{_i = 0}, {_i < count(a68 select 0)}, {_i = _i + 1}] do {
            _man = (a68 select 1) select _i;
            if (!(isNull(_man))) then {
                _acn = (a68 select 2) select _i;
                _man removeAction _acn;
                _tmparr1 = + (a68 select 0);
                _tmparr1 set[_i, -1];
                _tmparr1 = _tmparr1 - [-1];
                _tmparr2 = + (a68 select 1);
                _tmparr2 set[_i, -1];
                _tmparr2 = _tmparr2 - [-1];
                _tmparr3 = + (a68 select 2);
                _tmparr3 set[_i, -1];
                _tmparr3 = _tmparr3 - [-1];
                a68 set[0, _tmparr1];
                a68 set[1, _tmparr2];
                a68 set[2, _tmparr3];
            };
        };
        format["if (!(isDedicated)) then {
            if (!((RPM_Role) == %1)) then {
                call RPM_Cfg_Objects_RecompileArrays;
            };
        };", RPM_Role] call RPM_Cfg_Network_Broadcast;
        [] execVM "RPM\Client\STD_Actions.sqf";
        if (RPM_Debug) then {
            call CL_AddDebugActions;
        };
        // Holster
        [] execVM "RPM\Client\STD_Holster.sqf";
    };
    _ret = true;
    _ret;
};
// Briefing
RPM_Cfg_Inv_Briefing = {
    private ["_ret","_i","_add","_c","_subjecttitle","_subjectmessage","_pagename","_pagetitle","_side","_subjectarr"];
    _ret = false;
    if (!(isNil("RPM_Diary"))) then {
        for [{_i = 0}, {_i < count(RPM_Diary)}, {_i = _i + 1}] do {
            _pagename = (RPM_Diary select _i) select 0;
            _pagetitle = (RPM_Diary select _i) select 1;
            _side = (RPM_Diary select _i) select 2;
            _subjectarr = (RPM_Diary select _i) select 3;
            _add = false;
            if (_side == 0) then {
                _add = true;
            };
            if ((RPM_Civ) && (_side == 1)) then {
                _add = true;
            };
            if ((RPM_Cop) && (_side == 2)) then {
                _add = true;
            };
            if (_add) then {
                player createDiarySubject[_pagename, _pagetitle];
                for [{_c = 0}, {_c < count(_subjectarr)}, {_c = _c + 1}] do {
                    _subjecttitle = (_subjectarr select _c) select 0;
                    _subjectmessage = (_subjectarr select _c) select 1;
                    player createDiaryRecord [_pagename, [_subjecttitle, _subjectmessage]];
                };
            };
        };
        _ret = true;
    };
    _ret;
};
// Settings
RPM_Cfg_Inv_MsgDisable = {
    private ["_newmode","_sel","_actn","_curmode","_msg","_ret","_str"];
    _ret = false;
    _sel = _this select 0;
    _str = (RPM_MessagesArray select _sel) select 0;
    _actn = (RPM_MessagesArray select _sel) select 1;
    _curmode = call compile format["%1", _actn];
    _newmode = false;
    if (!(_curmode)) then {
        _newmode = true;
    } else {
        _newmode = false;
    };
    call compile format["%1 = %2;", _actn, _newmode];
    _msg = "";
    if (_newmode) then {
        _msg = "enabled";
    } else {
        _msg = "disabled";
    };
    hint format[localize "v28", _msg, _str];
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_Settings_Apply = {
    private ["_tg","_vd","_ret"];
    _ret = false;
    _tg = _this select 0;
    _vd = _this select 1;
    setTerrainGrid _tg;
    setViewDistance _vd;
    i5 = _tg;
    i6 = viewDistance;
    if (viewDistance == i6) then {
        _ret = true;
    };
    _ret;
};
// Inventory
RPM_Cfg_Inv_GetHealth = {
    private ["_ret"];
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _ret = 100;
    if (damage RPM_Role != 0) then {
        _ret = 100 - ((damage RPM_Role) * 100);
    } ;
    _ret;
};
RPM_Cfg_Inv_GetItemAmount = {
    private ["_i","_ret","_itemid"];
    _ret = 0;
    _itemid = _this select 0;
    for [{_i = 0}, {_i < count(a19)}, {_i = _i + 1}] do {
        if (((a19 select _i) select 0) == _itemid) then {
            if (((a19 select _i) select 1) <= 0) then {
                a19 set[_i, -1];
                a19 = a19 - [-1];
            } else {
                _ret = (a19 select _i) select 1;
            };
        };
    };
    _ret;
};
RPM_Cfg_Inv_AddItemAmount = {
    private ["_ret","_itemid","_amount","_newamount","_curstock"];
    _ret = false;
    _itemid = _this select 0;
    _amount = _this select 1;
    if (_amount >= 1) then {
        _curstock = [_itemid] call RPM_Cfg_Inv_GetItemAmount;
        _newamount = _curstock + _amount;
        if (!(_newamount >= RPM_MAX_NUMBER)) then {
            if ([_itemid, _newamount] call RPM_Cfg_Inv_SetItemAmount) then {
                if (RPM_Diagnostics) then {
                    [format["RPM(Inventory)|Added|%1|%2,%3|%4", name RPM_Role, _itemid, _amount, _curstock], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Inv_DelItemAmount = {
    private ["_ret","_itemid","_amount","_newamount","_curstock"];
    _ret = false;
    _itemid = _this select 0;
    _amount = _this select 1;
    if (_amount >= 1) then {
        _curstock = [_itemid] call RPM_Cfg_Inv_GetItemAmount;
        _newamount = _curstock - _amount;
        if (!(_newamount >= RPM_MAX_NUMBER)) then {
            if ([_itemid, _newamount] call RPM_Cfg_Inv_SetItemAmount) then {
                if (RPM_Diagnostics) then {
                    [format["RPM(Inventory)|Removed|%1|%2,%3|%4", name RPM_Role, _itemid, _amount, _curstock], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Inv_SetItemAmount = {
    private ["_ret","_i","_itemid","_amount","_exists","_newarr","_curamount","_temparray"];
    _ret = false;
    _itemid = _this select 0;
    _amount = _this select 1;
    _exists = -1;
    for [{_i = 0}, {_i < count(a19)}, {_i = _i + 1}] do {
        if ((((a19) select _i) select 0) == _itemid) then {
            _exists = _i;
        };
    };
    _newarr = + a19;
    if (_exists != -1) then {
        _curamount = [_itemid] call RPM_Cfg_Inv_GetItemAmount;
        (_newarr select _exists) set[1, _amount];
        a19 = _newarr;
        if (_curamount <= 0) then {
            a19 set[_exists, -1];
            a19 = a19 - [-1];
        };
        _ret = true;
    } else {
        _temparray = [_itemid, _amount];
        a19 set[(count a19), _temparray];
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Inv_GetOwnWeight = {
    private ["_i","_item","_amount","_weight","_totalweight","_ret"];
    _ret = 0;
    for [{_i = 0}, {_i < count(a19)}, {_i = _i + 1}] do {
        _item = (a19 select _i) select 0;
        _amount = [_item] call RPM_Cfg_Inv_GetItemAmount;
        _weight = ([_item] call RPM_Cfg_Items_GetWeight) call RPM_str_StrToFloat;
        _totalweight = _amount * _weight;
        _ret = _ret + _totalweight;
    };
    _ret;
};
RPM_Cfg_Inv_Drop = {
    private ["_sel","_itemid","_amount","_curamount","_amountstr","_itemname","_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (vehicle RPM_Role != RPM_Role) exitWith {
        hint format[localize "v165"];
    };
    b1 = true;
    _sel = _this select 0;
    _amount = _this select 1;
    _amountstr = _amount call RPM_str_IntToStr;
    _itemid = (a19 select _sel) select 0;
    _itemname = [_itemid] call RPM_Cfg_Items_GetName;
    _curamount = [_itemid] call RPM_Cfg_Inv_GetItemAmount;
    if (_amount > _curamount) exitWith {
        hint format[localize "v72"];
        b1 = false;
    };
    if ([_itemid, _amount] call RPM_Cfg_Inv_DelItemAmount) then {
        [_sel, _itemid, _itemname, _amountstr] spawn {
            private ["_sel","_itemid","_itemname","_amountstr","_h"];
            _sel = _this select 0;
            _itemid = _this select 1;
            _itemname = _this select 2;
            _amountstr = _this select 3;
            if (([_itemid] call RPM_Cfg_Inv_GetItemAmount) == 0) then {
                lbDelete[5, _sel];
                lbDelete[6, _sel];
                lbDelete[7, _sel];
            };
            format["if (RPM_Role == %1) then {
                [""%2""] call RPM_Cfg_Inv_PlayMove;
            }", RPM_Role, "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"] call RPM_Cfg_Network_Broadcast;
            hint format[localize "v188", _amountstr, _itemname];
            _h = call RPM_Cfg_Inv_RepaintListbox;
            waitUntil {_h};
            b1 = false;
        };
        _ret = true;
    } else {
        b1 = false;
    };
    _ret;
};
RPM_Cfg_Inv_Give = {
    private ["_sel","_itemid","_amount","_tgt","_curamount","_amountstr","_itemname","_ret","_exit"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (vehicle RPM_Role != RPM_Role) exitWith {
        hint format[localize "v165"];
    };
    b1 = true;
    _sel = _this select 0;
    _amount = _this select 1;
    _amountstr = _amount call RPM_str_IntToStr;
    _tgt = _this select 2;
    if (isNull(_tgt)) exitWith {
        b1 = false;
    };
    if (!(alive _tgt)) exitWith {
        b1 = false;
    };
    _itemid = (a19 select _sel) select 0;
    _itemname = [_itemid] call RPM_Cfg_Items_GetName;
    _curamount = [_itemid] call RPM_Cfg_Inv_GetItemAmount;
    _exit = false;
    if (_tgt == RPM_Role) exitWith {
        hint format[localize "v167"];
        b1 = false;
        _exit = true;
    };
    if ((_amount > _curamount + 1) || (_amount > RPM_MAX_NUMBER)) exitWith {
        hint format[localize "v73"];
        b1 = false;
        _exit = true;
    };
    if (RPM_Role distance _tgt > 8) exitWith {
        hint format[localize "v157"];
        b1 = false;
        _exit = true;
    };
    if (([_itemid, _amount] call RPM_Cfg_Inv_DelItemAmount) and (!(_exit))) then {
        [_sel, _itemid, _itemname, _amount, _amountstr, _curamount, _tgt] spawn {
            private ["_curamount","_sel","_itemid","_itemname","_amount","_amountstr","_tgt"];
            _sel = _this select 0;
            _itemid = _this select 1;
            _itemname = _this select 2;
            _amount = _this select 3;
            _amountstr = _this select 4;
            _curamount = _this select 5;
            _tgt = _this select 6;
            if (([_itemid] call RPM_Cfg_Inv_GetItemAmount) == 0) then {
                lbDelete[5, _sel];
                lbDelete[6, _sel];
                lbDelete[7, _sel];
            };
            hint format[localize "v191", _amountstr, _itemname, (name _tgt)];
            format["if (RPM_Role == %1) then {
                [""%2""] call RPM_Cfg_Inv_PlayMove;
            }", RPM_Role, "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"] call RPM_Cfg_Network_Broadcast;
            format["if (RPM_Role == %1) then {
                [%2, %3] call RPM_Cfg_Inv_AddItemAmount;
                hint ""%4"";
            };", _tgt, _itemid, _amount, format[localize "v60", _amountstr, _itemname, name RPM_Role]] call RPM_Cfg_Network_Broadcast;
            if (RPM_Diagnostics) then {
                [format["RPM(Inventory)|Gave|%1|%2,%3|%4", name RPM_Role, name _tgt, _itemid, _amount, _curamount], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            b1 = false;
        };
        _ret = true;
    } else {
        b1 = false;
    };
    _ret;
};
RPM_Cfg_Inv_Use = {
    private ["_sel","_itemid","_amount","_tgt","_curamount","_amountstr","_itemname","_ret","_use","_exit","_curtgt","_nomsg","_roll","_bag","_newcash","_mycash","_h","_noanim","_nodecrement","_go"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (vehicle RPM_Role != RPM_Role) exitWith {
        hint format[localize "v165"];
    };
    _sel = _this select 0;
    _amount = _this select 1;
    _amountstr = _amount call RPM_str_IntToStr;
    _tgt = _this select 2;
    _itemid = (a19 select _sel) select 0;
    b1 = true;
    _itemname = [_itemid] call RPM_Cfg_Items_GetName;
    _curamount = [_itemid] call RPM_Cfg_Inv_GetItemAmount;
    _curtgt = cursorTarget;
    _exit = false;
    _nomsg = false;
    _noanim = false;
    _nodecrement = false;
    if (_amount > _curamount + 1) then {
        hint format[localize "v74"];
        b1 = false;
    };
    _use = true;
    // Rigged check
    if ((_itemid == 267) || (_itemid == 346)) then {
        if (isNull(_curtgt)) then {
            hint format[localize "v204"];
            _use = false;
            _exit = true;
        };
        if (_curtgt call RPM_Cfg_Bombs_IsArmed) then {
            hint format[localize "v129"];
            _use = false;
            b1 = false;
            _exit = true;
        };
    };
    if ((_itemid == 267) || (_itemid == 268) || (_itemid == 269) || (_itemid == 270) || (_itemid == 271) || (_itemid == 272) || (_itemid == 273)  || (_itemid == 346)) then {
        _nomsg = true;
    };
    if (!(_exit)) then {
        switch (_itemid) do {
            //Drugs
			case 499: {
				["Cocaine"] execVM "Ultimate-RP\Drugs\DrugEffects.sqf";
                _use = true;
			};
			case 500: {
				["Marijuana"] execVM "Ultimate-RP\Drugs\DrugEffects.sqf";
                _use = true;
			};
			case 501: {
				["Cocaine"] execVM "Ultimate-RP\Drugs\DrugEffects.sqf";
                _use = true;
			};
			case 505: {
                if (!(_curtgt call RPM_Cfg_Items_RefuelKit)) then {
                    _use = false;
                } else {
                    _nomsg = true;
                    _amount = 1;
                };
            };
            case 506: {
                _nomsg = true;
                if (!(call RPM_Cfg_Items_LockPick)) then {
                    _use = false;
                    b1 = false;
                } else {
                    _amount = 1;
                };
            };
            case 507: {
                if (!([_tgt] call RPM_Cfg_Items_Medikit)) then {
                    _use = false;
                    b1 = false;
                } else {
                    _amount = 1;
                };
            };
            case 508: {
                if (!(call RPM_Cfg_Items_Kevlar)) then {
                    _use = false;
                    b1 = false;
                } else {
                    _amount = 1;
                };
            };
            case 509: {
                if (!(call RPM_Cfg_Items_Kevlar)) then {
                    _use = false;
                    b1 = false;
                } else {
                    _amount = 1;
                };
            };
            case 510: {
                _amount = 1;
                if (!(_curtgt call RPM_Cfg_Items_RepairKit)) then {
                    _use = false;
                } else {
                    _nomsg = true;
                    _amount = 1;
                };
            };
            case 511: {
                hint format[localize "v32"];
                _use = false;
            };
            case 512: {
                hint format[localize "v32"];
                _use = false;
            };
            case 513: {
                hint format[localize "v32"];
                _use = false;
            };
            case 514: {
                hint format[localize "v32"];
                _use = false;
            };
            
			//Food
			case 515: {
                if (!([293] call RPM_Cfg_Items_Food)) then {
                    _use = false;
                    b1 = false;
                };
            };
            case 516: {
                if (!([294] call RPM_Cfg_Items_Food)) then {
                    _use = false;
                    b1 = false;
                };
            };
            case 517: {
                if (!([295] call RPM_Cfg_Items_Food)) then {
                    _use = false;
                    b1 = false;
                };
            };
            case 518: {
                if (!([296] call RPM_Cfg_Items_Food)) then {
                    _use = false;
                    b1 = false;
                };
            };
            case 519: {
                if (!([297] call RPM_Cfg_Items_Food)) then {
                    _use = false;
                    b1 = false;
                };
            };
            case 520: {
                if (!([298] call RPM_Cfg_Items_Food)) then {
                    _use = false;
                    b1 = false;
                };
            };
            
			case 521: {
                _roll = false;
                _bag = false;
                _mycash = [521] call RPM_Cfg_Inv_GetItemAmount;
                switch (_amount) do {
                    case 10000: {
                        if (_mycash >= 10000) then {
                            if (_amount == 10000) then {
                                _roll = true;
                                _nomsg = true;
                                hint format[localize "STRM_Cashroll_Exchange"];
                            } else {
                                _use = false;
                            };
                        } else {
                            _use = false;
                        };
                    };
                    case 100000: {
                        if (_mycash >= 100000) then {
                            if (_amount == 100000) then {
                                _bag = true;
                                _nomsg = true;
                                hint format[localize "STRM_Cashbag_Exchange"];
                            } else {
                                _use = false;
                            };
                        } else {
                            _use = false;
                        };
                    };
                };
                if ((_roll) || (_bag)) then {
                    if (_roll) then {
                        if (_mycash - 10000 <= 0) then {
                            _use = false;
                            _exit = true;
                        } else {
                            [563, 1] call RPM_Cfg_Inv_AddItemAmount;
                            _use = true;
                        };
                    };
                    if (_bag) then {
                        if (_mycash - 100000 <= 0) then {
                            _use = false;
                            _exit = true;
                        } else {
                            [564, 1] call RPM_Cfg_Inv_AddItemAmount;
                            _use = true;
                        };
                    };
                } else {
                    if (_use) then {
                        hint format[localize "v88"];
                        _use = false;
                    };
                };
            };
            case 522: {
                hint format[localize "v32"];
                _use = false;
            };
            case 523: {
                hint format[localize "v32"];
                _use = false;
            };
            case 524: {
                hint format[localize "v32"];
                _use = false;
            };
            case 525: {
                hint format[localize "v32"];
                _use = false;
            };
            case 526: {
                hint format[localize "v32"];
                _use = false;
            };
            case 527: {
                hint format[localize "v32"];
                _use = false;
            };
            case 528: {
                [] spawn {
					_areas = ["FishArea","FishArea2","FishArea3"];
					if ({player distance (getmarkerpos _x) < 25} count _areas == 0) then {
						player commandChat "You must be within 50 feet of a Fishing area to use this.";
					};
					if (typeOf vehicle player != "Fishing_boat") then {
						player commandChat "You must be on a Fishing Boat to use this";
					};

					if ({player distance (getmarkerpos _x) < 25} count _areas > 0) then {
						if (Fishing) then {
							player commandChat "You're still Fishing.";
						};
						if (!Fishing) then {
							Fishing = true;
							titletext ["Fishing...", "PLAIN DOWN", 1];
							sleep 5;
							[518, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You caught a Fish!";
							Fishing = false;
						};
					};
				};
            };
            case 529: {
                hint format[localize "v32"];
                _use = false;
            };
            case 530: {
                hint format[localize "v32"];
                _use = false;
            };
            case 531: {
                hint format[localize "v32"];
                _use = false;
            };
            case 532: {
                hint format[localize "v32"];
                _use = false;
            };
            case 533: {
                hint format[localize "v32"];
                _use = false;
            };
            case 534: {
                hint format[localize "v32"];
                _use = false;
            };
            case 535: {
                hint format[localize "v32"];
                _use = false;
            };
            case 536: {
                hint format[localize "v32"];
                _use = false;
            };
            case 537: {
                hint format[localize "v32"];
                _use = false;
            };
            case 538: {
                hint format[localize "v32"];
                _use = false;
            };
            case 539: {
                hint format[localize "v32"];
                _use = false;
            };
            case 540: {
                hint format[localize "v32"];
                _use = false;
            };
            case 541: {
                hint format[localize "v32"];
                _use = false;
            };
            case 542: {
                hint format[localize "v32"];
                _use = false;
            };
            case 543: {
                hint format[localize "v32"];
                _use = false;
            };
            case 544: {
                hint format[localize "v32"];
                _use = false;
            };
            case 545: {
                hint format[localize "v32"];
                _use = false;
            };
            case 546: {
                hint format[localize "v32"];
                _use = false;
            };
            case 547: {
                hint format[localize "v32"];
                _use = false;
            };
            case 548: {
                hint format[localize "v32"];
                _use = false;
            };
            case 549: {
                hint format[localize "v32"];
                _use = false;
            };
            case 550: {
                [] spawn {
					_areas = ["mine_coal","mine_copper","mine_iron","mine_gold","mine_sulfur"];
					if ({player distance (getmarkerpos _x) < 25} count _areas == 0) then {
						player commandChat "You must be within 25 feet of the Coal, Copper, Iron, Gold or Sulfur mine to use this.";
					};

					//Coal
					if (player distance getmarkerpos "mine_coal" < 25) then {
						if (Mining) then {
							player commandChat "You're still Mining.";
						};
						if (!Mining) then {
							Mining = true;
							format["if (RPM_Role == %1) then {
								[""%2""] call RPM_Cfg_Inv_PlayMove;
							}", RPM_Role, "AinvPknlMstpSlayWrflDnon_medic"] call RPM_Cfg_Network_Broadcast;
							titletext ["Mining...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[530, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You got some Coal!";
							Mining = false;
						};
					};
					//Copper
					if (player distance getmarkerpos "mine_copper" < 25) then {
						if (Mining) then {
							player commandChat "You're still Mining.";
						};
						if (!Mining) then {
							Mining = true;
							format["if (RPM_Role == %1) then {
								[""%2""] call RPM_Cfg_Inv_PlayMove;
							}", RPM_Role, "AinvPknlMstpSlayWrflDnon_medic"] call RPM_Cfg_Network_Broadcast;
							titletext ["Mining...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[532, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You got some Copper!";
							Mining = false;
						};
					};
					//Iron
					if (player distance getmarkerpos "mine_iron" < 25) then {
						if (Mining) then {
							player commandChat "You're still Mining.";
						};
						if (!Mining) then {
							Mining = true;
							format["if (RPM_Role == %1) then {
								[""%2""] call RPM_Cfg_Inv_PlayMove;
							}", RPM_Role, "AinvPknlMstpSlayWrflDnon_medic"] call RPM_Cfg_Network_Broadcast;
							titletext ["Mining...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[538, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You got some Iron!";
							Mining = false;
						};
					};
					//Gold
					if (player distance getmarkerpos "mine_gold" < 25) then {
						if (Mining) then {
							player commandChat "You're still Mining.";
						};
						if (!Mining) then {
							Mining = true;
							format["if (RPM_Role == %1) then {
								[""%2""] call RPM_Cfg_Inv_PlayMove;
							}", RPM_Role, "AinvPknlMstpSlayWrflDnon_medic"] call RPM_Cfg_Network_Broadcast;
							titletext ["Mining...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[536, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You got some Gold!";
							Mining = false;
						};
					};
					//Sulfur
					if (player distance getmarkerpos "mine_sulfur" < 25) then {
						if (Mining) then {
							player commandChat "You're still Mining.";
						};
						if (!Mining) then {
							Mining = true;
							format["if (RPM_Role == %1) then {
								[""%2""] call RPM_Cfg_Inv_PlayMove;
							}", RPM_Role, "AinvPknlMstpSlayWrflDnon_medic"] call RPM_Cfg_Network_Broadcast;
							titletext ["Mining...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[548, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You got some Sulfur!";
							Mining = false;
						};
					};
				};
				_use = false;
            };
            case 551: {
				hint format[localize "v32"];
                _use = false;
            };
            case 552: {
                [] spawn {
					if (player distance getmarkerpos "mine_sand" > 25) then {
						player commandChat "You must be within 25 feet of the Sand area to use this.";
					};

					if (player distance getmarkerpos "mine_sand" < 25) then {
						if (Mining) then {
							player commandChat "You're still Digging.";
						};
						if (!Mining) then {
							format["if (RPM_Role == %1) then {
								[""%2""] call RPM_Cfg_Inv_PlayMove;
							}", RPM_Role, "AinvPknlMstpSlayWrflDnon_medic"] call RPM_Cfg_Network_Broadcast;
							Mining = true;
							titletext ["Digging...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[547, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You got some Sand!";
							Mining = false;
						};
					};
				};
				_use = false;
            };
            case 553: {
                hint format[localize "v32"];
                _use = false;
            };
            case 554: {
				[] spawn {
					if (player distance getmarkerpos "cocainefield" > 25) then {
						_use = false;
						player commandChat "You must be within 25 feet of the Cocaine field to do this.";
					};

					if (player distance getmarkerpos "cocainefield" < 25) then {
						if (Planting) then {
							_use = false;
							player commandChat "You're still planting.";
						};
						if (!Planting) then {
							_use = true;
							Planting = true;
							titletext ["Planting...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[554, 1] call RPM_Cfg_Inv_DelItemAmount;
							[531, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You harveted some Cocaine!";
							Planting = false;
						};
					};
				};
            };
            case 555: {
				[] spawn {
					if (player distance getmarkerpos "field_cotton" > 25) then {
						_use = false;
						player commandChat "You must be within 25 feet of the Cotton field to do this.";
					};

					if (player distance getmarkerpos "field_cotton" < 25) then {
						if (Planting) then {
							_use = false;
							player commandChat "You're still planting.";
						};
						if (!Planting) then {
							_use = true;
							Planting = true;
							titletext ["Planting...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[555, 1] call RPM_Cfg_Inv_DelItemAmount;
							[533, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You harvested some Cotton!";
							Planting = false;
						};
					};
				};
            };
            case 556: {
				[] spawn {
					if (player distance getmarkerpos "field_hops" > 25) then {
						_use = false;
						player commandChat "You must be within 25 feet of the Hops field to do this.";
					};

					if (player distance getmarkerpos "field_hops" < 25) then {
						if (Planting) then {
							_use = false;
							player commandChat "You're still planting.";
						};
						if (!Planting) then {
							_use = true;
							Planting = true;
							titletext ["Planting...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[556, 1] call RPM_Cfg_Inv_DelItemAmount;
							[537, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You harvested some Hops!";
							Planting = false;
						};
					};
				};
            };
            case 557: {
				[] spawn {
					if (player distance getmarkerpos "marijuanafield" > 25) then {
						_use = false;
						player commandChat "You must be within 25 feet of the Marijuana field to do this.";
					};

					if (player distance getmarkerpos "marijuanafield" < 25) then {
						if (Planting) then {
							_use = false;
							player commandChat "You're still planting.";
						};
						if (!Planting) then {
							_use = true;
							Planting = true;
							titletext ["Planting...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[557, 1] call RPM_Cfg_Inv_DelItemAmount;
							[570, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You harveted some Marijuana!";
							Planting = false;
						};
					};
				};
            };
            case 558: {
				[] spawn {
					if (player distance getmarkerpos "field_potatoe" > 25) then {
						_use = false;
						player commandChat "You must be within 25 feet of the Potatoe field to do this.";
					};

					if (player distance getmarkerpos "field_potatoe" < 25) then {
						if (Planting) then {
							_use = false;
							player commandChat "You're still planting.";
						};
						if (!Planting) then {
							_use = true;
							Planting = true;
							titletext ["Planting...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[558, 1] call RPM_Cfg_Inv_DelItemAmount;
							[543, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You harveted some Potatoes!";
							Planting = false;
						};
					};
				};
            };
            case 559: {
				[] spawn {
					if (player distance getmarkerpos "field_rye" > 25) then {
						_use = false;
						player commandChat "You must be within 25 feet of the Rye field to do this.";
					};

					if (player distance getmarkerpos "field_rye" < 25) then {
						if (Planting) then {
							_use = false;
							player commandChat "You're still planting.";
						};
						if (!Planting) then {
							_use = true;
							Planting = true;
							titletext ["Planting...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[559, 1] call RPM_Cfg_Inv_DelItemAmount;
							[544, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You harvested some Rye";
							Planting = false;
						};
					};
				};
            };
            case 560: {
                hint format[localize "v32"];
                _use = true;
            };
            case 561: {
                hint format[localize "v32"];
                _use = true;
            };
            case 562: {
                _noanim = true;
                if (name RPM_Role == name _tgt) then {
                    hint format[localize "v173"];
                    _use = false;
                    b1 = false;
                };
                if (((isNull(_tgt)) || (!(alive(_tgt)))) || (!([_tgt] call RPM_Cfg_Police_UnRestrainUnit)))  then {
                    _use = false;
                    b1 = false;
                };
                _amount = 1;
                if ([281, _amount] call RPM_Cfg_Inv_AddItemAmount) then {
                    hint format[localize "STRM_Uncuffed", _tgt, name _tgt];
                    _nodecrement = true;
                    _nomsg = true;
                };
            };
            case 563: {
                _newcash = _amount * 10000;
                if ((([521] call RPM_Cfg_Inv_GetItemAmount) + _newcash) <= RPM_MAX_NUMBER) then {
                    [521, _newcash] call RPM_Cfg_Inv_AddItemAmount;
                    hint format[localize "v387", _amount, ([521] call UltRP_Cfg_Inv_GetItemAmount) + _newcash];
                    _use = true;
                    _nomsg = true;
                } else {
                    hint format[localize "v389", _amount, _itemname, i0];
                    _use = false;
                    _nomsg = true;
                };
            };
            case 564: {
                _newcash = _amount * 100000;
                if ((([521] call RPM_Cfg_Inv_GetItemAmount) + _newcash) <= RPM_MAX_NUMBER) then {
                    [521, _newcash] call RPM_Cfg_Inv_AddItemAmount;
                    hint format[localize "v388", _amount, ([521] call UltRP_Cfg_Inv_GetItemAmount) + _newcash];
                    _use = true;
                    _nomsg = true;
                } else {
                    hint format[localize "v389", _amount, _itemname, i0];
                    _use = false;
                    _nomsg = true;
                };
            };
			case 565: {
                hint format[localize "v32"];
                _use = false;
            };
			case 566: {
                hint format[localize "v32"];
                _use = false;
            };
			case 567: {
                hint format[localize "v32"];
                _use = false;
            };
			case 568: {
                ["MethLab"] execVM "Ultimate-RP\CreateObject.sqf";
                _use = true;
            };
			case 569: {
                ["StorageBox"] execVM "Ultimate-RP\CreateObject.sqf";
                _use = true;
            };
			case 570: {
                hint format[localize "v32"];
                _use = false;
            };
			case 571: {
                hint format[localize "v32"];
                _use = false;
            };
			case 572: {
                [] spawn {
					if (player distance getmarkerpos "mine_wood" > 25) then {
						player commandChat "You must be within 25 feet of the Logging area to use this.";
					};

					if (player distance getmarkerpos "mine_wood" < 25) then {
						if (Mining) then {
							player commandChat "You're still Chopping.";
						};
						if (!Mining) then {
							Mining = true;
							format["if (RPM_Role == %1) then {
								[""%2""] call RPM_Cfg_Inv_PlayMove;
							}", RPM_Role, "AinvPknlMstpSlayWrflDnon_medic"] call RPM_Cfg_Network_Broadcast;
							titletext ["Chopping...", "PLAIN DOWN", 1];
							sleep 5;
							waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
							[571, 1] call RPM_Cfg_Inv_AddItemAmount;
							player commandChat "You got some Wood!";
							Mining = false;
						};
					};
				};
				_use = false;
            };
        };
    };
    if ((_use) && (!(_exit))) then {
        // Check type for amount allowed to use..
        _go = false;
        if (_nodecrement) then { 
            _go = true;
        } else {
            if ([_itemid, _amount] call RPM_Cfg_Inv_DelItemAmount) then {
                _go = true;
            };
        };
        if (_go) then {
            [_itemname, _amountstr, _nomsg, _noanim] spawn {
                private ["_amountstr","_itemname","_nomsg","_noanim"];
                _itemname = _this select 0;
                _amountstr = _this select 1;
                _nomsg = _this select 2;
                _noanim = _this select 3;
                if (!(_noanim)) then {
                    format["if (RPM_Role == %1) then {
                        [""%2""] call RPM_Cfg_Inv_PlayMove;
                    }", RPM_Role, "AinvPknlMstpSlayWrflDnon_medic"] call RPM_Cfg_Network_Broadcast;
                };
                if (!(_nomsg)) then {
                    //hint format[localize "v225", _amountstr, _itemname];
                };
                b1 = false;
            };
            _h = call RPM_Cfg_Inv_RepaintListbox;
            waitUntil {_h};
        } else {
            b1 = false;
        };
    };
    _ret;
};
RPM_Cfg_Inv_PlayMove = {
    private ["_anim","_cd","_ret"];
    _ret = false;
    _anim = _this select 0;
    _cd = false;
    if (count(_this) > 1) then {
        _cd = _this select 1;
    };
    format["%1 playMove ""%2"";", RPM_Role, _anim] call RPM_Cfg_Network_Broadcast;
    format["if (!(isDedicated)) then {
        if (RPM_Role == %1) then {
            if (%2) then {
                [] spawn {
                    while {dialog} do {
                        closeDialog 0;
                    };
                };
            };
        };
    };", RPM_Role, _cd] call RPM_Cfg_Network_Broadcast;
    _ret = true;
    _ret;
};
RPM_Cfg_Inv_SwitchMove = {
    private ["_anim","_cd","_ret"];
    _ret = false;
    _anim = _this select 0;
    _cd = false;
    if (count(_this) > 1) then {
        _cd = _this select 1;
    };
    format["%1 switchMove ""%2"";", RPM_Role, _anim] call RPM_Cfg_Network_Broadcast;
    format["if (!(isDedicated)) then {
        if (RPM_Role == %1) then {
            if (%2) then {
                [] spawn {
                    while {dialog} do {
                        closeDialog 0;
                    };
                };
            };
        };
    };", RPM_Role, _cd] call RPM_Cfg_Network_Broadcast;
    _ret = true;
    _ret;
};
// Stats
RPM_Cfg_Inv_CompileStatsArray = {
    private ["_ret","_status","_obj","_wanted","_bounty","_jailed","_line","_i","_str","_newstr","_newline","_linestr","_DateStamp","_dpstr","_uid"];
    _ret = false;
    _uid = call RPM_Cfg_Objects_GetUID;
    if (_uid call RPM_str_Length >= 1) then {
        RPM_StatsArray = [RPM_Stats_PersonalArray select 0];
        for [{_i = 1}, {_i < count(RPM_Stats_PersonalArray)}, {_i = _i + 1}] do {
            _str = (RPM_Stats_PersonalArray select _i) select 0;
            switch (_i) do {
                case 1: {
                    _str = _str + format["%1 (%2)", vehicleVarName RPM_Role, name RPM_Role];;
                };
                case 2: {
                    _str = _str + format["%1/100", floor(i9)];
                };
                case 3: {
                    _str = _str + format["%1/100", floor(call RPM_Cfg_Inv_GetHealth)];
                };
                case 4: {
                    _str = _str + format["%1", (name RPM_Role) call RPM_Cfg_Crimes_IsJailedStr];
                };
                case 5: {
                    _str = _str + format["%1", (name RPM_Role) call RPM_Cfg_Crimes_IsWantedStr];
                };
                case 6: {
                    _dpstr = "";
                    if (!(isNull(o0))) then {
                        _dpstr = o0 call RPM_Cfg_Delivery_GetName;
                        //_dpstr = format["%1", o0];
                    } else {
                        _dpstr = format[localize "v419"];
                    };
                    _str = _str + _dpstr;
                };
            };
            _line = [_str];
            RPM_StatsArray = RPM_StatsArray + [_line];
        };
        RPM_StatsArray = RPM_StatsArray + [RPM_Stats_InfoArray select 0];
        for [{_i = 1}, {_i < count(RPM_Stats_InfoArray)}, {_i = _i + 1}] do {
            _str = "";
            switch (_i) do {
                case 1: {
                    _DateStamp = Date;
                    _newstr = format[localize "STRM_Daytime", _DateStamp select 3];
                    (RPM_Stats_InfoArray select _i) set[0, _newstr];
                    _str = (RPM_Stats_InfoArray select _i) select 0;
                };
                case 2: {
                    _newstr = format[localize "STRM_ServerTime", floor(i25)];
                    (RPM_Stats_InfoArray select _i) set[0, _newstr];
                    _str = (RPM_Stats_InfoArray select _i) select 0;
                };
                case 3: {
                    _newstr = format[localize "STRM_LastSave", floor(i26)];
                    (RPM_Stats_InfoArray select _i) set[0, _newstr];
                    _str = (RPM_Stats_InfoArray select _i) select 0;
                };
                case 4: {
                    _newstr = format[localize "STRM_BankAccount"] + ": " + format["$%1", [floor(i4), 1, 0, true] call CBA_fnc_formatNumber];
                    (RPM_Stats_InfoArray select _i) set[0, _newstr];
                    _str = (RPM_Stats_InfoArray select _i) select 0;
                };
                case 5: {
                    if (!(isNil("RPM_Version"))) then {
                        if (typeName(RPM_Version) == "STRING") then {
                            if (RPM_Version call RPM_str_Length >= 1) then {
                                _newstr = format[localize "STRM_SoftwareVersion"] + format["%1", RPM_Version];
                                (RPM_Stats_InfoArray select _i) set[0, _newstr];
                                _str = (RPM_Stats_InfoArray select _i) select 0;
                            };
                        };
                    } else {
                        _str = (RPM_Stats_InfoArray select _i) select 0;
                    };
                };
                case 6: {
                    if (!(isNil("RPM_Revision"))) then {
                        if (typeName(RPM_Revision) == "STRING") then {
                            if (RPM_Revision call RPM_str_Length >= 1) then {
                                _newstr = format[localize "STRM_SoftwareRevision", RPM_Revision];
                                (RPM_Stats_InfoArray select _i) set[0, _newstr];
                                _str = (RPM_Stats_InfoArray select _i) select 0;
                            };
                        };
                    } else {
                        _newstr = format[localize "STRM_SoftwareRevision"] + format[localize "STRM_SoftwareUnrevisioned"];
                        (RPM_Stats_InfoArray select _i) set[0, _newstr];
                        _str = ((RPM_Stats_InfoArray select _i) select 0);
                    };
                };
            };
            _line = [_str];
            RPM_StatsArray = RPM_StatsArray + [_line];
        };
        RPM_StatsArray = RPM_StatsArray + RPM_Stats_LawsArray;
        RPM_StatsArray = RPM_StatsArray + [RPM_Stats_LicensesArray select 0];
        for [{_i = 1}, {_i < count(RPM_Stats_LicensesArray)}, {_i = _i + 1}] do {
            _str = "";
            switch (_i) do {
                case 1: {
                    _str = "lic_air" call RPM_Cfg_Inv_HasLicenseStr;
                };
                case 2: {
                    _str = "lic_boat" call RPM_Cfg_Inv_HasLicenseStr;
                };
                case 3: {
                    _str = "lic_car" call RPM_Cfg_Inv_HasLicenseStr;
                };
                case 4: {
                    _str = "lic_pickup" call RPM_Cfg_Inv_HasLicenseStr;
                };
                case 5: {
                    _str = "lic_truck" call RPM_Cfg_Inv_HasLicenseStr;
                };
                case 6: {
                    _str = "lic_pistol" call RPM_Cfg_Inv_HasLicenseStr;
                };
                case 7: {
                    _str = "lic_rifle" call RPM_Cfg_Inv_HasLicenseStr;
                };
            };
            (RPM_Stats_LicensesArray select _i) set[1, _str];
            _newstr = format[((RPM_Stats_LicensesArray select _i) select 0) + " (" + localize "STRM_Licensed" + "): " + _str];
            _newline = [_newstr];
            RPM_StatsArray = RPM_StatsArray + [_newline];
        };
        if (RPM_Civ) then {
            RPM_StatsArray = RPM_StatsArray + RPM_Stats_FactoryArray;
            for [{_i = 0}, {_i < count(RPM_FactoryArray)}, {_i = _i + 1}] do {
                _linestr = format["%1 (%2): %3", [_i] call RPM_Cfg_Factory_GetFactoryName, localize "STRM_Owned", [_i, _uid] call RPM_Cfg_Factory_IsOwnerStr];
                _line = [_linestr];
                RPM_StatsArray = RPM_StatsArray + [_line];
            };
        };
        RPM_Stats_PlayersArray = [RPM_Stats_PlayersArray select 0];
        for "_i" from 0 to count(RPM_POBJArr) - 1 do {
            if (!(isNull(RPM_POBJArr select _i))) then{
                _obj = RPM_POBJArr select _i;
                _wanted = (name _obj) call RPM_Cfg_Crimes_IsWanted;
                _bounty = (name _obj) call RPM_Cfg_Crimes_GetBounty;
                _jailed = (name _obj) call RPM_Cfg_Crimes_IsJailed;
                _status = "";
                if ((_jailed || _wanted)) then {
                    _status = _status + "- ";
                    if (_wanted) then {
                        _status = _status + format["Wanted ($%1)", _bounty];
                    } else {
                        _status = _status + "Jailed";
                    };
                };
                _line = [format["%1 (%2) %3", _obj, name _obj, _status]];
                RPM_Stats_PlayersArray = RPM_Stats_PlayersArray + [_line];
            };
        };
        RPM_StatsArray = RPM_StatsArray + RPM_Stats_PlayersArray;
        RPM_StatsArray = RPM_StatsArray+ [[format["------------------------"]]];
    };
    _ret = true;
    _ret;
};
