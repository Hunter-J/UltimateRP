// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Interact
RPM_Cfg_Interact_GUI = {
    private ["_ret","_tgt"];
    _ret = false;
    if (b1) exitWith {};
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _tgt = _this select 0;
    if ((isNull(_tgt)) || (!(alive(_tgt))) || (isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUse) && (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {
        hint format[localize "v539", _tgt, name _tgt];
    };
    _tgt spawn {
        private ["_display","_mugctrl","_tgt","_tgtstr","_searchctrl","_exit"];
        _tgt = _this;
        if ((isNull(RPM_Role)) || (!(alive(RPM_Role))) || (!(alive(_tgt))) || (isNull(_tgt))) exitWith {};
        if (!(createDialog "InteractDialog")) exitWith {
            hint format[localize "v1"];
        };
        [_tgt, 2, RPM_Role] call RPM_Cfg_Inv_NPCSetInUse;
        disableSerialization;
        _tgtstr = "";
        if (RPM_Civ) then {
            _tgtstr = format["Target: %1 (%2)", format["%1", _tgt], (name _tgt)];
            _display = findDisplay 13;
            _searchctrl = _display displayCtrl 75;
            _mugctrl = _display displayCtrl 72;
            _mugctrl ctrlSetPosition (ctrlPosition _searchctrl);
            _mugctrl ctrlCommit 0.001;
            ctrlShow[72, false];
            ctrlShow[75, false];
            ctrlShow[76, false];
            ctrlShow[173, false];
            ctrlShow[241, false];
        } else {
            // Disable screen (Unimplemented)
            ctrlShow[76, false];
            if (((name _tgt) call RPM_Cfg_Crimes_IsWanted) && (!((name _tgt) call RPM_Cfg_Crimes_IsJailed))) then {
                _tgtstr = format["Target: %1 (%2) - Wanted", format["%1", _tgt], (name _tgt)];
            } else {
                if ((name _tgt) call RPM_Cfg_Crimes_IsJailed) then {
                    _tgtstr = format["Target: %1 (%2) - Jailed", format["%1", _tgt], (name _tgt)];
                } else {
                    _tgtstr = format["Target: %1 (%2)", format["%1", _tgt], (name _tgt)];
                };
            };
            ctrlSetText[72, "Ticket"];
        };
        ctrlSetText[71, _tgtstr];
        _exit = false;
        while {(!(_exit))} do {
            if (((!(ctrlVisible 71)) && (!(ctrlVisible 152)) && (!(ctrlVisible 157)) && (!(ctrlVisible 188)) || ((isNull(RPM_Role)) || (!(alive(RPM_Role))))) || ((isNull(_tgt)) || (!(alive(_tgt))))) then {
                [] spawn {
                    while {dialog} do {
                        closeDialog 0;
                    };
                };
                b1 = false;
                _exit = true;
            };
            if (b1) then {
                buttonSetAction[73, ""];
                buttonSetAction[74, ""];
            } else {
                buttonSetAction[73, format["[%1, 0] call RPM_Cfg_Police_RestrainUnit;", _tgt]];
                buttonSetAction[74, format["%1 call RPM_Cfg_Items_StunUnit;", _tgt]];
            };
            if (RPM_Civ) then {
                //buttonSetAction[72, format["[%1] call RPM_Cfg_Inv_Mug;", _tgt]];
            } else {
                if (b1) then {
                    buttonSetAction[72, ""];
                    buttonSetAction[75, ""];
                    buttonSetAction[76, ""];
                    buttonSetAction[173, ""];
                    buttonSetAction[241, ""];
                } else {
                    buttonSetAction[72, format["[%1] call RPM_Cfg_Police_Ticket;", _tgt]];
                    buttonSetAction[75, format["[%1] call RPM_Cfg_Search_Police;", _tgt]];
                    buttonSetAction[76, format["[%1] call RPM_Cfg_Screen_Police;", _tgt]];
                    buttonSetAction[173, format["[%1] call RPM_Cfg_Police_Arrest;", _tgt]];
                    buttonSetAction[241, format["%1 call RPM_Cfg_Police_QueryLicenses_GUI;", _tgt]];
                };
            };
            sleep 0.001;
        };
        [_tgt, 2, objNull] call RPM_Cfg_Inv_NPCSetInUse;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Vehicles_Interact = {
    private ["_ret","_vcl"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _vcl = _this;
    if (!(isNull(_vcl))) then {
        if ((_vcl call RPM_Cfg_Vehicles_GetInUse) && ((_vcl call RPM_Cfg_Vehicles_GetInUser) != RPM_Role)) exitWith {
            hint format[localize "v539", [[typeOf(_this)] call RPM_Cfg_Items_GetIDByCLass] call RPM_Cfg_Items_GetName, _this];
        };
        _vcl spawn {
            private ["_vclobj","_vclstr"];
            if (!(createDialog "VehicleDialog")) exitWith {
                hint format[localize "v1"];
            };
            _vclobj = _this;
            if (isNull(_vclobj)) exitWith {};
            [_vclobj, RPM_Role] call RPM_Cfg_Vehicles_SetInUse;
            _vclstr = format["%1", _vclobj];
            // Set vehicle label
            ctrlSetText[27, format["Vehicle ID: %1", _vclstr]];
            // Kick out (Disabled)
            ctrlShow[28, false];
            if (!(alive(_vclobj))) then {
                // Disable flip
                ctrlShow[29, false];
                // Disable trunk
                ctrlShow[30, false];
                // Disable vehicle infos
                ctrlShow[151, false];
                // Disable search
                ctrlShow[32, false];
                ctrlShow[31, false];
            } else {
                // Enable flip
                ctrlShow[29, true];
                // Enable trunk
                ctrlShow[30, true];
                // Disable impound
                ctrlShow[31, false];
                // Enable vehicle infos
                ctrlShow[151, true];
                buttonSetAction[151, format["[%1] call RPM_Cfg_Vehicle_Stats;", _vclobj]];
                if (vehicle RPM_Role == RPM_Role) then {
                    buttonSetAction[29, format["[%1] call RPM_Cfg_Vehicles_Unflip;", _vclobj]];
                    if (!(_vclobj call RPM_Cfg_Storage_CanAccessTrunk)) then {
                        ctrlShow[30, false];
                    } else {
                        ctrlShow[30, true];
                        if ((locked _vclobj) && (!(([typeOf(_vclobj)] call RPM_Cfg_Items_GetIDByClass) in a46))) then {
                            buttonSetAction[30, format["hint ""%1"";", format[localize "v237", localize "v536"]]];
                        } else {
                            buttonSetAction[30, format["[""Trunk_Storage"", %1] call RPM_Cfg_Storage_GUI;", _vclobj]];
                        };
                    };
                } else {
                    buttonSetAction[29, format["hint localize ""v207"";"]];
                    buttonSetAction[30, format["hint localize ""v207"";"]];
                };
                if (RPM_Cop) then {
                    ctrlShow[31, true];
                    ctrlSetText[31, "Impound"];
                    if (vehicle RPM_Role == RPM_Role) then {
                        buttonSetAction[31, format["[%1] call RPM_Cfg_Vehicles_ImpoundVeh;", _vclobj]];
                    } else {
                        buttonSetAction[31, format["hint localize ""v207"";"]];
                    };
                    // Enable search
                    ctrlShow[32, true];
                    buttonSetAction[32, format["%1 call RPM_Cfg_Police_SearchVehicle_GUI;", _vclobj]];
                } else {
                    ctrlShow[31, false];
                    // Disable carjack
                    //ctrlSetText[31, "Carjack"];
                    ctrlShow[32, false];
                };
            };
            [_vclobj, objNull] call RPM_Cfg_Vehicles_SetInUse;
        };
    };
    _ret = true;
    _ret;
};
