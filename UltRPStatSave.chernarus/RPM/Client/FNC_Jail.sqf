// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/


RPM_Cfg_Jail_AutoJailAfterConnect = {
    private ["_bounty","_jailed","_ret"];
    _ret = false;
    if ((name RPM_Role) call RPM_Cfg_Crimes_IsJailed) then {
        _bounty = (name RPM_Role) call RPM_Cfg_Crimes_GetBounty;
        _jailed = (name RPM_Role) call RPM_Cfg_Crimes_IsJailed;
        if ((_bounty >= 1) && (_jailed)) then {
            server globalChat format[localize "STRM_AvoidingJail"];
            [name RPM_Role, true] call RPM_Cfg_Crimes_SetJailed;
            RPM_Role setPos (getMarkerPos "jail_sp1");
            call RPM_Cfg_Jail_Jailed;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Jail_GetFreeMarker = {
    private ["_i","_ret","_marker"];
    _ret = "jail_sp1";
    for[{_i = 0},{_i < count(a56)}, {_i = _i + 1}] do {
        _marker = a56 select _i;
        if (count(nearestObjects[(getMarkerPos _marker), ["Man"], 3]) == 0) then {
            _ret = _marker;
        };
    };
    _ret;
};
RPM_Cfg_Jail_GetFreeReleaseMarker = {
    private ["_i","_ret","_marker"];
    _ret = "jail_rsp1";
    for[{_i = 0},{_i < count(a63)}, {_i = _i + 1}] do {
        _marker = a63 select _i;
        if (count(nearestObjects[(getMarkerPos _marker), ["Man"], 3]) == 0) then {
            _ret = _marker;
        };
    };
    _ret;
};
RPM_Cfg_Jail_Jailed = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if ((animationState RPM_Role) in a43) then {
        format["if (RPM_Role == %1) then {
            [""%2""] call RPM_Cfg_Inv_PlayMove;
        }", RPM_Role, "Normal"] call RPM_Cfg_Network_Broadcast;
    };
    [] spawn {
        private ["_oldbounty"];
        sleep 5;
        _oldbounty = name RPM_Role call RPM_Cfg_Crimes_GetBounty;
        while {true} do {
            if (RPM_Role distance getMarkerPos "jailborder" >= 100) exitWith {
                cutText["", "PLAIN", 0];
                sleep 1;
                cutText[format[localize "v410"], "PLAIN", 0];
                format["server globalChat ""%1"";", format[localize "v400", RPM_Role, name RPM_Role]] call RPM_Cfg_Network_Broadcast;
                call RPM_Cfg_Crimes_Jailbreak;
                ["Escaped", RPM_Role] spawn RPM_Cfg_Logs_AddLog;
                b21 = true;
                call RPM_Cfg_Inv_CompileStatsArray;
            };
            if (((name RPM_Role call RPM_Cfg_Crimes_GetTime) <= 0) || ((name RPM_Role call RPM_Cfg_Crimes_GetBounty) <= 0) && (_oldbounty != 0)) exitWith {
                cutText["", "PLAIN", 0];
                [name RPM_Role, false] call RPM_Cfg_Crimes_SetJailed;
                [name RPM_Role, 0] call RPM_Cfg_Crimes_SetBounty;
                (name RPM_Role) call RPM_Cfg_Crimes_Unwant;
                RPM_Role setPos (getMarkerPos (call RPM_Cfg_Jail_GetFreeReleaseMarker));
                hint format[localize "v409"];
                call RPM_Cfg_Inv_CompileStatsArray;
            };
            cutText [format[localize "v408", ((name RPM_Role call RPM_Cfg_Crimes_GetTime) - 1), name RPM_Role call RPM_Cfg_Crimes_GetBounty],"PLAIN", 3];
            if (i9 != 50) then {i9 = 50};
            [name RPM_Role, ((name RPM_Role call RPM_Cfg_Crimes_GetBounty) - (round((name RPM_Role call RPM_Cfg_Crimes_GetBounty) / (name RPM_Role call RPM_Cfg_Crimes_GetTime))))] call RPM_Cfg_Crimes_SetBounty;
            [name RPM_Role, ((name RPM_Role call RPM_Cfg_Crimes_GetTime) - 1)] call RPM_Cfg_Crimes_SetTime;
            sleep 1;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Jail_Release = {
    private ["_player","_sel","_ret"];
    _ret = false;
    _player = _this select 0;
    if ((!(alive _player)) || (isNull(_player))) exitWith {};
    if (name _player == name RPM_Role) exitWith {
        hint format[localize "v434"];
        closeDialog 0;
    };
    _sel = _this select 1;
    if (!((name _player) call RPM_Cfg_Crimes_IsJailed)) exitWith {
        hint format[localize "v436", name _player];
        closeDialog 0;
    };
    hint format[localize "v217", name _player];
    [name _player, 0] call RPM_Cfg_Crimes_SetBounty;
    (name _player) call RPM_Cfg_Crimes_Unwant;
    format["if (!(isDedicated)) then {
        if (RPM_Role == %1) then {
            hint ""%2"";
            call RPM_Cfg_Inv_CompileStatsArray;
        };
    };", _player, format[localize "v227", name RPM_Role]] call RPM_Cfg_Network_Broadcast;
    if (!((name _player) call RPM_Cfg_Crimes_IsWanted)) then {
        if (RPM_Diagnostics) then {
            [format["UltRP(Jail)|Released|%1", name _player], false] call RPM_Cfg_Server_DiagnosticsDumper;
        };
        ["Released", RPM_Role, [name _player]] spawn RPM_Cfg_Logs_AddLog;
        lbDelete[181, _sel];
    };
    _ret;
};
RPM_Cfg_Jail_PayBail = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _this spawn {
        private ["_amount","_newbounty","_released","_playername","_bounty"];
        _playername = _this select 0;
        _amount = _this select 1;
        if ((_amount <= 0) || (_amount > RPM_MAX_NUMBER + 1)) exitWith {};
        if (i4 < _amount) exitWith {
            hint format[localize "v7"];
        };
        _bounty = _playername call RPM_Cfg_Crimes_GetBounty;
        _newbounty = _bounty - _amount;
        _released = false;
        if ((_newbounty <= 0) || ((_bounty - _amount) <= _bounty * 0.25)) then {
            if (_amount > _bounty) then {
                _amount = _bounty;
                _newbounty = _bounty - _amount;
                _released = true;
            };
            if (([name RPM_Role, _newbounty] call RPM_Cfg_Crimes_SetBounty) || (_released)) then {
                i4 = i4 - _amount;
                [name RPM_Role, false] call RPM_Cfg_Crimes_SetJailed;
                name RPM_Role call RPM_Cfg_Crimes_Unwant;
                (format["%1 - Arrested",_playername]) call RPM_Cfg_Crimes_RemoveMsgByTitle;
                hint format[localize "v423"];
                ["Bail", RPM_Role, [format["%1", _amount]]] spawn RPM_Cfg_Logs_AddLog;
            };
        } else {
            if ([name RPM_Role, _newbounty] call RPM_Cfg_Crimes_SetBounty) then {
                i4 = i4 - _amount;
                hint format[localize "v422", _amount, _newbounty]
            };
        };
        closeDialog 0;
    };
    _ret = true;
    _ret;
};
