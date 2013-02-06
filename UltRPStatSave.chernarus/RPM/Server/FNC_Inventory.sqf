// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Server
RPM_Cfg_Inv_CreateVehicleServer = {
    private ["_ret","_class","_position","_player","_time","_vcl","_vclobj","_unitname"];
    _ret = false;
    _class = _this select 0;
    _position = _this select 1;
    _player = _this select 2;
    _unitname = format["%1", _player call RPM_Cfg_Objects_GetUnit];
    _time = _this select 3;
	_letter1 = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"] call Bis_Fnc_SelectRandom;
	_letter2 = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"] call Bis_Fnc_SelectRandom;
	_letter3 = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"] call Bis_Fnc_SelectRandom;
	_letter4 = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"] call Bis_Fnc_SelectRandom;
	_l1 = _letter1; 
	_l2 = _letter2; 
	_l3 = _letter3;
	_l4 = _letter4;
	_n1 = ceil(random 9) call ISSE_str_IntToStr;
	_n2 = ceil(random 9) call ISSE_str_IntToStr;
	_n3 = ceil(random 9) call ISSE_str_IntToStr;
	_PlateNum = format ["%1%2%3%4-%5%6%7", _l1, _l2, _l3, _l4, _n1, _n2, _n3];
    if (RPM_Server) then {
        format["b19 = true;"] call RPM_Cfg_Network_Broadcast;
        call compile format['
        _newvehobj = _class createVehicle %3;
        _newvehobj setpos %3;
        _newvehobj setVehicleInit "
        this setVehicleVarName ""vcl_%1_%2""; 
        vcl_%1_%2 = this;
        this lock true;
        this setVariable [""impounded"", false, true];
        this setVariable [""inuse"", objNull, true];
        this setVariable [""owner"", ""%1"", true];
        this setVariable [""siren"", false, true];
        this setVariable [""trunk"", [], true];
        this setVariable [""idle"", false, true];
		this setVariable [""plate"", _PlateNum, true];
        clearWeaponCargo this; 
        clearMagazineCargo this;
        "; 
        processInitCommands;
        ', _unitname, _time, _position];
        _vcl = format["vcl_%1_%2", _unitname, _time];
        _vclobj = call compile format["vcl_%1_%2", _unitname, _time];
        if (!(isNull(_vclobj))) then {
            if (RPM_Debug) then {
                _vclobj addEventHandler ["Fired", {
                    if (!(isNull(_this select 6))) then {
                        deleteVehicle (_this select 6);
                    };
                }];
            };
            if ([_unitname, _vcl] call RPM_Cfg_Inv_AddServerKey) then {
                if ([_unitname, _vcl] call RPM_Cfg_Inv_AddKey) then {
                    _vclobj call RPM_Cfg_Vehicles_Add;
                    [_vclobj] call RPM_Cfg_Vehicles_IdleLoop;
                    _ret = true;
                };
            };
        };
        if (RPM_Diagnostics) then {
            [format["RPM(Vehicles)|Spawned|%1|%2", _unitname, _vcl], true] call RPM_Cfg_Server_DiagnosticsDumper;
        };
        format["b19 = false;"] call RPM_Cfg_Network_Broadcast;
    };
    _ret;
};
RPM_Cfg_Inv_CreateImpoundVehicleServer = {
    private ["_ret","_class","_position","_player","_plate","_vclobj","_unitname"];
    _ret = false;
    _class = _this select 0;
    _position = _this select 1;
    _player = _this select 2;
    _unitname = format["%1", _player call RPM_Cfg_Objects_GetUnit];
    _plate = _this select 3;
    _vclobj = objNull;
    if (RPM_Server) then {
        format["b19 = true;"] call RPM_Cfg_Network_Broadcast;
        call compile format['
        _newvehobj = _class createVehicle %2;
        _newvehobj setpos %2;
        _newvehobj setVehicleInit "
        this setVehicleVarName ""%1"";
        call compile format[""%1 = this;"", _vclobj];
        this lock true;
        this setVariable [""impounded"", false, true];
        this setVariable [""inuse"", objNull, true];
        this setVariable [""owner"", ""%1"", true];
        this setVariable [""siren"",  false, true];
        this setVariable [""trunk"",  [], true];
        clearWeaponCargo this; 
        clearMagazineCargo this;
        "; 
        processInitCommands;
        ', _plate, _position];
        _vclobj = call compile _plate;
        if (!(isNull(_vclobj))) then {
            if ([_unitname, _plate] call RPM_Cfg_Inv_AddServerKey) then {
                if ([_unitname, _plate] call RPM_Cfg_Inv_AddKey) then {
                    _vclobj call RPM_Cfg_Vehicles_Add;
                    [_vclobj] call RPM_Cfg_Vehicles_IdleLoop;
                    _ret = true;
                };
            };
        };
        format["b19 = false;"] call RPM_Cfg_Network_Broadcast;
    };
    _ret;
};
RPM_Cfg_Inv_DelServerKey = {
    private ["_i","_idx","_player","_vcl","_ret","_vidx","_del","_tmparr","_uid"];
    _ret = false;
    _player = _this select 0;
    _vcl = _this select 1;
    _uid = [_player] call RPM_Cfg_Objects_GetUIDByPlayername;
    _idx = -1;
    if (count(a37) > 0) then {
        for [{_i = 0}, {_i < count(a37)}, {_i = _i + 1}] do {
            if (((a37 select _i) select 0) == _uid) then {
                _idx = _i;
            };
        };
        if (_idx != -1) then {
            _del = true;
            if (_del) then {
                _vidx = -1;
                for [{_i = 0}, {_i < count((a37 select _idx) select 1)}, {_i = _i + 1}] do {
                    if ((((a37 select _idx) select 1) select _i) == _vcl) then {
                        _vidx = _i;
                    };
                };
                if (_vidx != -1) then {
                    _tmparr = + ((a37 select _idx) select 1);
                    _tmparr set[_vidx, -1];
                    _tmparr = _tmparr - [-1];
                    if (count(_tmparr) == 0) then {
                        a37 set[_idx, -1];
                        a37 = a37 - [-1];
                        _ret = true;
                    } else {
                        (a37 select _idx) set[1, _tmparr];
                        publicVariable "a37";
                        _ret = true;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Inv_AddServerKey = {
    private ["_i","_idx","_unitname","_add","_vcl","_tmparr","_ret","_unit","_tuid","_uid"];
    _ret = false;
    _unitname = _this select 0;
    _unit = call compile _unitname;
    _tuid = str(getPlayerUID _unit);
    _uid = [_tuid, 1, (_tuid call RPM_str_Length) - 1] call RPM_str_SubString;
    _vcl = _this select 1;
    _idx = -1;
    if (count(a37) > 0) then {
        for [{_i = 0}, {_i < count(a37)}, {_i = _i + 1}] do {
            if (((a37 select _i) select 0) == _uid) then {
                _idx = _i;
            };
        };
        if (_idx != -1) then {
            _add = true;
            for [{_i = 0}, {_i < count((a37 select _idx) select 1)}, {_i = _i + 1}] do {
                if ((((a37 select _idx) select 1) select _i) == _vcl) then {
                    _add = false;
                };
            };
            if (_add) then {
                _tmparr = + ((a37 select _idx) select 1);
                _tmparr set[count(_tmparr), _vcl];
                (a37 select _idx) set [1, _tmparr];
                _ret = true;
            };
        } else {
            _tmparr = [_uid, [_vcl]];
            a37 set[count(a37), _tmparr];
            _ret = true;
        };
    } else {
        _tmparr = [_uid, [_vcl]];
        a37 set[0, _tmparr];
        publicVariable "a37";
        _ret = true;
    };
    _ret;
};
b40 = true;
