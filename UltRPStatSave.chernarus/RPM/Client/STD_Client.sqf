// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

private ["_h","_badname","_narr","_debugfired","_var","_i","_line","_loadedtries","_failedtries","_go","_sarr","_tmp","_loaded","_loading","_cpehdata","_cpeh","_stime","_arr","_gotvars","_c","_found","_vars","_loadtime","_notloaded"];
disableSerialization;
RPM_Client = true;
waitUntil {!(isNull RPM_Role)};
waitUntil {RPM_Role==RPM_Role};
// Bad character check
_badname = false;
_narr = (format["%1", RPM_Role]) call RPM_str_StrToArr;
if (count(_narr) > 16) then {
    _badname = true;
};
{
    if (!(_x call RPM_str_IsAlphaNumeric)) then {
        _badname = true;
    };
} forEach _narr;
{
    if (_x in _narr) then {
        _badname = true;
    };
} forEach RPM_InvalidChars;
if (_badname) exitWith {
    RPM_Role commandChat format[localize "v530"];
};
waitUntil {(!(RPM_JIP))};
RPM_JIP = true;
publicVariable "RPM_JIP";
RPM_Role setVariable ["jip", true, true];
if (RPM_Diagnostics) then {
    [format["UltRP(Players)|Connected|%1|%2", name RPM_Role, side RPM_Role], false] call RPM_Cfg_Server_DiagnosticsDumper;
};
// If admin, debug active
if ((RPM_Role call RPM_Cfg_Objects_IsAdmin) || ((local server) && (RPM_Client))) then {
    RPM_Debug = true;
};
// Event handlers
// Core
RPM_Role setVariable ["BIS_noCoreConversations", true];
// Restrained
RPM_Role setVariable ["cuffed", false, true];
// Armor
RPM_Role setVariable ["armor", false, true];
// Query (Licenses)
RPM_Role setVariable ["query", objNull, true];
RPM_Role addEventHandler ["handleDamage", {
    _this call RPM_Cfg_Inv_HandleDamage;
}];
// Stun
player addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "RPM\Global\Handlers\stun.sqf";}];
player addEventHandler ["handleDamage", {_this call compile preprocessfile "RPM\Global\Handlers\sethit.sqf"}];
// Arrest
arrest = [];
"arrest" addPublicVariableEventHandler {
    _tgt = ((_this select 1) select 0);
    if (RPM_Role == _tgt) then {
        _src = ((_this select 1) select 1);
        _amount = ((_this select 1) select 2);
        _crime1 = ((_this select 1) select 3);
        _crime2 = ((_this select 1) select 4);
        _crime3 = ((_this select 1) select 5);
        [_src, _amount, _crime1, _crime2, _crime3] call RPM_Cfg_Police_Arrested;
    };
};
// Ticket
ticket = [];
"ticket" addPublicVariableEventHandler {
    _tgt = ((_this select 1) select 0);
    _amount = ((_this select 1) select 1);
    _src = ((_this select 1) select 2);
    _crime1 = ((_this select 1) select 3);
    _crime2 = ((_this select 1) select 4);
    _crime3 = ((_this select 1) select 5);
    if (RPM_Role == _tgt) then {
        [_amount, _src, _crime1, _crime2, _crime3] call RPM_Cfg_Police_Ticketed;
    };
};
// Force Save
save = [];
"save" addPublicVariableEventHandler {
    if (!(RPM_Saving_Loading)) then {
        waitUntil {(!(RPM_Saving_Saving))};
        _h = call RPM_Saving_C_ToldToSave;
        waitUntil {_h};
    };
};
// Killed
RPM_Role addEventHandler ["Killed", {
    _this call RPM_Cfg_Inv_Killed;
    [_this select 0, _this select 1, name (_this select 0)] call RPM_Cfg_Inv_KilledHandler;
    hideBody (_this select 0);
    if (!(isNull(_this select 1))) then {
        if ((_this select 0) != (_this select 1)) then {
            if ((_this select 1) != RPM_Role) then {
                if ((side (_this select 1)) == civilian) then {
                    for [{_i = 0}, {_i < count(a78)}, {_i = _i + 1}] do {
                        _markerpos = (a78 select _i) select 0;
                        _distance = (a78 select _i) select 1;
                        if (((_this select 1) distance _markerpos) <= _distance) then {
                            format["if (!(isDedicated)) then {
                                if (RPM_Role == %1) then {
                                    [] spawn {
                                        call RPM_Cfg_Crimes_Autojail;
                                    };
                                };
                            }", _this select 1];
                        };
                    };
                };
            };
        };
    };
    if (RPM_Diagnostics) then {
        [format["UltRP(Players)|Killed|%1|%2", name (_this select 0), name (_this select 1)], false] call RPM_Cfg_Server_DiagnosticsDumper;
    };
}];
// Graphics settings
setTerrainGrid i5;
setViewDistance i6;
// Briefing
_h = [] call RPM_Cfg_Inv_Briefing;
waitUntil {_h};
// Stats
_h = call RPM_Cfg_Inv_CompileStatsArray;
waitUntil {_h};
// Actions
[] execVM "RPM\Client\STD_Actions.sqf";

//Debugging
[] spawn {
    waitUntil {(!(isNil("RPM_Person_DebugActions")))};
    if (RPM_Debug) then {
		call CL_AddDebugActions;
		execVM "Ultimate-RP\DebugLoop.sqf";
		[521, 10000000] call RPM_Cfg_Inv_AddItemAmount;
		if (!("i4" in _gotvars)) then {
			i4 = 10000000;
		};
	};
};

// Holster
[] execVM "RPM\Client\STD_Holster.sqf";
if (!(RPM_Debug)) then {
    [] spawn {
        private ["_add","_text"];
        {
            _add = false;
            if (RPM_Civ) then {
                if ((_x != "STRM_Welcome7") && (_x != "STRM_Welcome8")) then {
                    _add = true;
                };
            } else {
                if (_x != "STRM_Welcome6") then {
                    _add = true;
                };
            };
            if (_add) then {
                sleep 1.5;
                cutText ["", "PLAIN", 0.001];
                _text = format[localize _x];
                cutText[_text, "PLAIN", 2];
                sleep 2;
            };
        } forEach a67;
        cutText ["", "PLAIN", 0.001];
    };
};
// Stats loader EH
_var = format["RPM_Saving_Data_%1", RPM_Role];
call compile format["%1 = [];", _var];
_var addPublicVariableEventHandler {
    RPM_Role commandChat format["%1", _this];
};
RPM_Saving_LoadingClient = true;
[] spawn {
    private ["_stime"];
    _stime = time;
    waitUntil {((!(RPM_Saving_LoadingClient)) || (time - _stime >= 30))};
	disableUserInput false;
	titleText ["", "PLAIN"];
	player enableSimulation true;
};
_stime = time;
// Variables to get
_vars = [
    ["i4" ,"bank", localize "v347", 0],
    ["a20", "keys", localize "STRM_Keys", -1],
    ["a22" ,"licenses", localize "STRM_LicensesSM", -1],
    ["a82" ,"storage", localize "v355", 1],
    ["RPM_SkillsArray", "skills", localize "STRM_SkillsSM", 2]
];
// Cops use other storage name
if (RPM_Cop) then {
    (_vars select 3) set[2, localize "v356"];
};
// Get the data
_loadtime = time;
_failedtries = 0;
_notloaded = [];
_gotvars = [];
// Iterate the vars
for [{_i = 0}, {_i < count(_vars)}, {_i = _i + 1}] do {
    // Tell the player it's loading
    _line = ("(Client) " + format[localize "STRM_Loading"] + " " + ((_vars select _i) select 2) + " data...");
    if (RPM_Saving_Debug) then {
        diag_log _line;
        RPM_Role groupChat _line;
    } else {
        2 cutText [_line,"PLAIN",2];
    };
    // Check if a pre-inited variable
    _arr = call compile ((_vars select _i) select 0);
    // See if it's a valid variable
    // Check if it ever got loaded
    _loaded = false;
    if (!(isNil("_arr"))) then {
        _loadedtries = 0;
        RPM_Saving_LastMessage = 0;
        while {(!(_loaded))} do {
            ((_vars select _i) select 2) spawn {
                private ["_go","_line"];
                _go = false;
                if ((RPM_Saving_LastMessage == 0) || (time - RPM_Saving_LastMessage >= 4)) then {
                    RPM_Saving_LastMessage = time;
                    _go = true;
                };
                if (_go) then {
                    _line = ("(Client) " + format[localize "STRM_Loading"] + " " + _this + " data...");
                    if (RPM_Saving_Debug) then {
                        diag_log _line;
                        RPM_Role groupChat _line;
                    } else {
                        2 cutText [_line,"PLAIN",2];
                    };
                    RPM_Saving_LastMessage = time;
                };
            };
            if (_loadedtries >= 4) then {
                _line = format["UltRP(Stats)|Timed out|%1 attempts",_loadedtries];
                if (RPM_Saving_Debug) then {
                    diag_log _line;
                    RPM_Role groupChat _line;
                } else {
                    2 cutText [_line,"PLAIN",2];
                };
                _loadedtries = 0;
                _failedtries = _failedtries + 1;
            };
            // Reset cdata
            _cpeh = format["RPM_Saving_Data_%1", RPM_Role];
            call compile format["%1 = [];", _cpeh];
            // Send the data load request
            _var = (_vars select _i) select 0;
            [_var] call RPM_Saving_C_Load;
            _stime = time;
            _loading = true;
            // Loop loading until got something
            while {(((time - _stime <= 20) && (_loading)))} do {
                // Check the length of the array
                _cpehdata = call compile _cpeh;
                if (count(_cpehdata) == 2) then {
                    // Match the object to the sender
                    if (RPM_Role == (_cpehdata select 0)) then {
                        // Tell the player something was loaded
                        _gotvars set[count(_gotvars), (_vars select _i) select 0];
                        _go = true;
                        if (typeName(_cpehdata select 1) == "ARRAY") then {
                            if (count(_cpehdata select 1) == 1) then {
                                if ((typeName((_cpehdata select 1) select 0)) == "SCALAR") then {
                                    if (((_cpehdata select 1) select 0) == -1337) then {
                                        _line = format["(Client) Saving/Load: Got nothing for %1", ((_vars select _i) select 2)];
                                        if (RPM_Saving_Debug) then {
                                            diag_log _line;
                                            RPM_Role commandChat _line;
                                        } else {
                                            2 cutText [_line,"PLAIN",2];
                                        };
                                        _notloaded set[count(_notloaded), (_vars select _i) select 0];
                                        _go = false;
                                    } else {
                                        _line = "(Client) " + (format[localize "STRM_Loaded"] + " " + ((_vars select _i) select 2) + " data...");
                                        if (RPM_Saving_Debug) then {
                                            diag_log _line;
                                            RPM_Role commandChat _line;
                                        } else {
                                            2 cutText [_line,"PLAIN",2];
                                        };
                                    };
                                } else {
                                    if ((typeName((_cpehdata select 1) select 0)) == "ARRAY") then {
                                        if ((count((_cpehdata select 1) select 0)) == 0) then {
                                            _line = format["(Client) Saving/Load: Got nothing for %1", ((_vars select _i) select 2)];
                                            if (RPM_Saving_Debug) then {
                                                diag_log _line;
                                                RPM_Role commandChat _line;
                                            } else {
                                                2 cutText [_line,"PLAIN",2];
                                            };
                                            _notloaded set[count(_notloaded), (_vars select _i) select 0];
                                            _go = false;
                                        };
                                    };
                                };
                            };
                        };
                        if (_go) then {
                            _line = format["(Client) Saving/Load: Got %1 for %2", (_cpehdata select 1) , ((_vars select _i) select 2)];
                            if (RPM_Saving_Debug) then {
                                diag_log _line;
                                RPM_Role commandChat _line;
                            } else {
                                2 cutText [_line,"PLAIN",2];
                            };
                            switch ((_vars select _i) select 3) do {
                                // Licenses/Keys
                                case -1: {
                                    call compile format["%1 = %2;", (_vars select _i) select 0, (_cpehdata select 1) select 0];
                                };
                                // Bank
                                case 0: {
                                    call compile format["%1 = %2;", (_vars select _i) select 0, (_cpehdata select 1) select 0];
                                };
                                // Storage
                                case 1: {
                                    _sarr = call compile format["%1", ((_cpehdata select 1) select 0)];
                                    _tmp = [[call RPM_Cfg_Objects_GetUID,[]]];
                                    (_tmp select 0) set [1, _sarr];
                                    a82 = _tmp;
                                };
                                // Skills
                                case 2: {
                                    _sarr = call compile format["%1", ((_cpehdata select 1) select 0)];
                                    _tmp = [[call RPM_Cfg_Objects_GetUID,[]]];
                                    (_tmp select 0) set [1, _sarr];
                                    RPM_SkillsArray = _tmp;
                                };
                            };
                        };
                        call compile format["%1 = [];", _cpeh];
                        _loaded = true;
                        _loading = false;
                    };
                };
                sleep 1;
            };
            call compile format["%1 = [];", _cpeh];
            _loadedtries = _loadedtries + 1;
            sleep 1;
        };
        RPM_Saving_LastMessage = nil;
    };
};
_line = format["Loaded stats in %1 seconds with %2 failed load attempts!", time - _loadtime, _failedtries];
if (RPM_Saving_Debug) then {
    diag_log _line;
    RPM_Role commandChat _line;
} else {
    2 cutText [_line,"PLAIN",2];
};
{
    if (_x in _notloaded) then {
        _gotvars = _gotvars - [_x];
    };
} forEach _gotvars;
if (count(_gotvars) >= 1) then {
    _line = "(Client) Loaded: ";
    for [{_i = 0}, {_i < count(_gotvars)}, {_i = _i + 1}] do {
        _found = -1;
        for [{_c = 0}, {_c < count(_vars)}, {_c = _c + 1}] do {
            if (((_vars select _c) select 0) == (_gotvars select _i)) then {
                _found = _c;
            };
        };
        if (_found != -1) then {
            _line = _line + ((_vars select _found) select 1);
            if (_i != count(_gotvars)-1) then {
                _line = _line + ", ";
            };
        };
    };
    diag_log _line;
    RPM_Role commandChat _line;
};
RPM_Saving_LoadingClient = false;

RPM_JIP = false;
publicVariable "RPM_JIP";
RPM_Role setVariable ["jip", false, true];
b47 = true;