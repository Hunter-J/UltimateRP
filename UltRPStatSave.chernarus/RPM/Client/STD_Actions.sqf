// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

private ["_h"];
waitUntil {alive player};
waitUntil {RPM_Role == RPM_Role};
_h = execVM "RPM\Client\INC_Actions.sqf";
waitUntil {scriptDone _h};
while {alive RPM_Role} do {
    _h = call RPM_Person_InteractsAdder;
    waitUntil {_h};
    _h = call RPM_Person_GlobalActionsAdder;
    waitUntil {_h};
    _h = call RPM_NPC_GlobalActionsAdder;
    waitUntil {_h};
    if (RPM_Civ) then {
        _h = call RPM_Person_CivActionsAdder;
        waitUntil {_h};
        _h = call RPM_NPC_CivActionsAdder;
        waitUntil {_h};
    } else {
        _h = call RPM_NPC_CopActionsAdder;
        waitUntil {_h};
    };
    _h = call RPM_Cfg_Inv_SaveGear;
    waitUntil {_h};
    if ((!(call RPM_Cfg_Politics_CanVote)) && (ctrlVisible 230)) then {
        closeDialog 0;
        hint format[localize "v455"];
    };
    if (RPM_Civ) then {
        // Drug autoseller
        {
            if (RPM_Role distance (getMarkerPos _x) <= 10) then {
                call RPM_Cfg_Loops_DrugSell;
            };
        } forEach a52;
    } else {
        if (RPM_Role distance (getMarkerPos "tc_dmz2") <= 250) then {
            RPM_Role setDamage 1;
        };
    };
    sleep 0.25;
};
waitUntil {alive RPM_Role};
_h = call RPM_Person_InteractsRemover;
waitUntil {_h};
_h = call RPM_Person_GlobalActionsRemover;
waitUntil {_h};
_h = call RPM_NPC_GlobalActionsRemover;
waitUntil {_h};
if (RPM_Cop) then {
    _h = call RPM_NPC_CopActionsRemover;
    waitUntil {_h};
} else {
    _h = call RPM_Person_CivActionsRemover;
    waitUntil {_h};
    _h = call RPM_NPC_CivActionsRemover;
    waitUntil {_h};
};
execVM "RPM\Client\STD_Actions.sqf";
