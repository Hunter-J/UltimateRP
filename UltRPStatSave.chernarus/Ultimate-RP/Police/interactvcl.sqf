_car = (nearestobjects [getpos player, ["LandVehicle"],  10] select 0);

_target = (crew _car) select 0;
_array = _this select 3;

RPM_Person_InteractsAdder = {
    private ["_i","_actn","_tmp","_c","_found","_anchor","_actname","_ret","_jip","_tveh","_vehs","_tvehs","_veh","_script","_argument","_priority","_condition","_n"];
    _ret = false;
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