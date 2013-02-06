// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

RPM_Cfg_Logs_AddLog = {
    private ["_extra","_logtext","_logidx","_ret","_logname","_player","_logtime","_logdate"];
    _ret = false;
    _logname = _this select 0;
    _player = _this select 1;
    _extra = [];
    if (count _this > 2) then {
        _extra = _this select 2
    };
    _logtime = round(time);
    _logdate = date;
    _logtext = "";
    _logidx = -1;
    switch (_logname) do {
        case "Arrested": {
            _logtext = format[localize "STRM_Logs_Arrested", name _player, _extra select 0, _extra select 1];
            _logidx = 1;
        };
        case "Bail": {
            _logtext = format[localize "STRM_Logs_Bail", name _player, _extra select 1];
            _logidx = 3;
        };
        case "Bounty": {
            _logtext = format[localize "STRM_Logs_Bounty", name _player, _extra select 1];
            _logidx = 3;
        };
        case "Died": {
            _logtext = format[localize "STRM_Logs_Died", name _player];
            _logidx = 2;
        };
        case "Deposit": {
            _logtext = format[localize "STRM_Logs_Deposit", name _player, _extra select 0];
            _logidx = 0;
        };
        case "Escaped": {
            _logtext = format[localize "STRM_Logs_Escaped", name _player];
            _logidx = 3;
        };
        case "Logs": {
            _logtext = format[localize "STRM_Logs_Accessed", name _player, _player call RPM_Cfg_Objects_GetUIDByObject];
            _logidx = 4;
        };
        case "LogsInvalidCode": {
            _logtext = format[localize "STRM_Logs_FailedCode", name _player, _extra select 0];
            _logidx = 4;
        };
        case "LogsInvalidUID": {
            _logtext = format[localize "STRM_Logs_FailedUID", name _player, _player call RPM_Cfg_Objects_GetUIDByObject];
            _logidx = 4;
        };
        case "Killed": {
            _logtext = format[localize "STRM_Logs_Killed", name _player, _extra select 0];
            _logidx = 5;
        };
        case "Paycheck": {
            _logtext = format[localize "STRM_Logs_Paycheck", name _player, _extra select 0];
            _logidx = 6;
        };
        case "RanDown": {
            _logtext = format[localize "STRM_Logs_RanDown", name _player, _extra select 0];
            _logidx = 5;
        };
        case "Released": {
            _logtext = format[localize "STRM_Logs_Released", name _player, _extra select 0];
            _logidx = 3;
        };
        case "Robbed": {
            _logtext = format[localize "STRM_Logs_Stole", name _player, _extra select 0];
            _logidx = 0;
        };
        case "Starved": {
            _logtext = format[localize "STRM_Logs_Starved", name _player];
            _logidx = 5;
        };
        case "Stunned": {
            _logtext = format[localize "STRM_Logs_Stunned", name _player, _extra select 0];
            _logidx = 1;
        };
        case "Suicide": {
            _logtext = format[localize "STRM_Logs_Suicide", name _player];
            _logidx = 5;
        };
        case "Ticketed": {
            _logtext = format[localize "STRM_Logs_Ticketed", name _player, _extra select 0, _extra select 1];
            _logidx = 1;
        };
        case "Transfer": {
            _logtext = format[localize "STRM_Logs_Transfer", name _player, _extra select 0, _extra select 1];
            _logidx = 0;
        };
        case "Withdraw": {
            _logtext = format[localize "STRM_Logs_Withdraw", name _player, _extra select 0];
            _logidx = 0;
        };
    };
    if (_logidx != -1) then {
        format['
        ((RPM_Logs select %1) select 1) set[count(((RPM_Logs select %1) select 1)), ["%2", "%3", %4, %5]];
        ', _logidx, name _player, _logtext, _logdate, _logtime] call RPM_Cfg_Network_Broadcast;
        _ret = true;
    };
    _ret;
};
