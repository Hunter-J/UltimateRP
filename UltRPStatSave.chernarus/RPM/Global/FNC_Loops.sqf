// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Loops
RPM_Cfg_Loops_Markers = {
    if ((b52) || (RPM_Cop)) exitWith {};
    [] spawn {
        b52 = true;
        while {b52} do {
            {
                if (call RPM_Cfg_Inv_HasDrugs) then {
                    if (markerAlpha _x == 0) then {
                        _x setMarkerAlpha 1;
                    };
                } else {
                    if (markerAlpha _x != 0) then {
                        _x setMarkerAlpha 0;
                    };
                };
            } forEach a52;
            sleep 0.1;
        };
        b52 = false;
        call RPM_Cfg_Loops_Markers;
    };
};
RPM_Cfg_Loops_InitClient = {
    private ["_ret"];
    _ret = false;
    if (RPM_Client) then {
        if (!(b2)) then {
            [] spawn {
                b2 = true;
                // Encumberance Loop
                call RPM_Cfg_Loops_Encumbered;
                // Restrained Loop
                call RPM_Cfg_Loops_Restrained;
                // Marker loops
                call RPM_Cfg_Loops_Markers;
                //call RPM_Cfg_Loops_MarkersPlayer;
                call RPM_Cfg_Loops_Hunger;
                call RPM_Cfg_Loops_Salary;
                call RPM_Cfg_Loops_Taxes;
                // JIP/Etc
                call RPM_Saving_Init;
            };
            b2 = false;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Loops_InitServer = {
    private ["_ret"];
    _ret = false;
    if ((isServer) || (isDedicated) || (local server)) then {
        RPM_Server = true;
    };
    if (RPM_Server) then {
        [] spawn {
            private ["_stime","_h"];
            call RPM_Cfg_Loops_Bodies;
            call RPM_Cfg_Loops_Server;
            call RPM_Cfg_Loops_ServerRob;
            // Time
            call RPM_Cfg_Loops_Time;
            // JIP/Etc
            call RPM_Cfg_Vehicles_Loop;
            call RPM_Saving_Init;
            if (RPM_Saving_System != -1) then {
                _stime = time;
                _h = call RPM_Saving_Loader;
                waitUntil {_h};
                if (RPM_Diagnostics) then {
                    [format["UltRP(Server)|Stats|Stats loaded in %1 seconds!", time - _stime], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
            };
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Loops_DrugSell = {
    private ["_ret"];
    _ret = false;
    if (!(b28)) then {
        [] spawn {
            private ["_i","_price","_amount","_itemname"];
            b28 = true;
            for[{_i = 0}, {_i < count(a53)}, {_i = _i + 1}] do {
                _itemname = [a53 select _i] call RPM_Cfg_Items_GetName;
                if (([a53 select _i] call RPM_Cfg_Inv_GetItemAmount) >= 1) then {
                    _amount = (round((random(3)) + (1)));
                    _price = ([(a53 select _i)] call RPM_Cfg_Items_GetPrice);
                    switch (a52 select _i) do {
                        case 274: {
                            _price = round((_price * 1.75) + _price);
                        };
                        case 275: {
                            _price = round((_price * 1.50) + _price);  
                        };
                        case 276: {
                            _price = round((_price * 1.25) + _price);
                        };
                        case 277: {
                            _price = round((_price * 1.35) + _price);
                        };
                        case 278: {
                            _price = round((_price * 1.6) + _price);
                        };
                        case 279: {
                            _price = round((_price * 1.5) + _price);
                        };
                    };
                    if (([a53 select _i] call RPM_Cfg_Inv_GetItemAmount) >= _amount) then {
                        [(a53 select _i), _amount] call RPM_Cfg_Inv_DelItemAmount;
                        [521, (_amount*_price)] call RPM_Cfg_Inv_AddItemAmount;
                        cutText [format[localize "v220", _amount, _itemname, _amount * _price],"PLAIN", 1.5];
                        sleep (round(((random(3)) + (1.5))));
                        cutText ["", "PLAIN", 0.001];
                    };
                };
            };
            b28 = false;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Loops_Time = {
    private ["_ret"];
    _ret = false;
    //**** ALL CREDITS TO MIKE MELVIN, CREATOR OF
    //WARFARE, I NEEDED TO SEE HOW TO SYNC TIME. ****
    if (isServer) then {
        [] spawn {
            while {true} do {
                if (!(b26)) then {
                    b26 = true;
                    publicVariable "b26";
                    publicVariable "i20";
                    i25 = time;
                    publicVariable "i25";
                    format["if (!(isServer)) then {
                        call RPM_Cfg_Inv_SetDate;
                    }"] call RPM_Cfg_Network_Broadcast;
                    b26 = false;
                    publicVariable "b26";
                };
                sleep 60;
            };
            call RPM_Cfg_Loops_Time;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Loops_Hunger = {
    private ["_ret"];
    _ret = true;
    if (!(b7)) then {
        b7 = true;
        [] spawn {
            while {alive RPM_Role} do {
                i9 = i9 + ceil(random 3);
                if ((i9 >= 50) && (i9 <= 75)) then {
                   _name= format["<t size='1.1' color='#00FF00' align='left'>%1</t>, You Could Do With A Bit To Eat", name RPM_Role];
				   _txt = composeText [parsetext _name];
                };
                if ((i9 >= 76) && (i9 < 100)) then {
                    _name= format["<t size='1.1' color='#00FF00' align='left'>%1</t>, You Are Starving!", name RPM_Role];
					_txt = composeText [parsetext _name];
                    RPM_Role setDammage (0.2 + ceil(random .3))
                };
                if (i9 >= 100) exitWith {
                    RPM_Role setDammage 1;
                };
                sleep 180;
            };
            waitUntil {alive RPM_Role};
            b7 = false;
            i9 = 0;
            call RPM_Cfg_Loops_Hunger;
        };
    };
    _ret;
};
RPM_Cfg_Loops_Taxes = {
    private ["_ret"];
    _ret = true;
    if (!(b33)) then {
        b33 = true;
        [] spawn {
            private ["_i","_percentage","_bracket","_tval","_bracketstr","_finaltaxes"];
            while {alive RPM_Role} do {
                if (time > 276) then {
                    if (i4 >= 1) then {
                        _bracket = -1;
                        _bracketstr = "";
                        _percentage = 0;
                        // Income Taxes
                        if (call RPM_Cfg_Mayor_IsOnline) then {
                            _bracket = -1;
                            _bracketstr = "";
                            _percentage = 0;
                            if (i30 >= 1) then {
                                for [{_i = count(a61)-1}, {_i > 0}, {_i = _i - 1}] do {
                                    _tval = (a61 select _i) select 0;
                                    if (i30 >= _tval) then {
                                        _bracket = _i;
                                        _bracketstr = (a61 select _i) select 2;
                                        _percentage = (a61 select _i) select 4;
                                        _i = 0;
                                    } else {
                                        if (i30 <= (a61 select 0) select 0) then {
                                            _bracket = 0;
                                            _bracketstr = (a61 select 0) select 2;
                                            _percentage = (a61 select 0) select 4;
                                            _i = 0;
                                        };
                                    };
                                };
                                if (_bracket >= 1) then { 
                                    _finaltaxes = round(((i30 * _percentage)+(i30 * (a45 select 2)))/6);
                                    if (i4 >= i30) then {
                                        i4 = i4 - i30;
                                        format["if (isServer) then {
                                            i21 = i21 + %1;
                                        }", _finaltaxes] call RPM_Cfg_Network_Broadcast;
                                        i30 = 0;
                                        _bracketstr = _bracketstr + format[": %1 Percent", format["%1", round(_percentage*100)]];
                                        hint (parseText format["%1", format[localize "v401", _finaltaxes, _bracketstr]]);
                                    } else {
                                        [(name RPM_Role), round(((name RPM_Role) call RPM_Cfg_Crimes_GetBounty) + ((a62 select 14) select 1))] call RPM_Cfg_Crimes_SetBounty;
                                        format["if (local server) then {
                                            server globalChat ""%1"";
                                        };", format[localize "v500", (name RPM_Role), ((a62 select 14) select 0)]] call RPM_Cfg_Network_Broadcast;
                                        hint (parseText format["%1", format[localize "v499", i30]]);
                                    };
                                    ["i4", i4] call RPM_Saving_C_Save;
                                } else {
                                    _bracketstr = _bracketstr + format[": %1 Percent", _percentage];
                                    hint (parseText format["%1", format[localize "v402", _bracketstr]]);
                                };
                            };
                        };
                    };
                };
                sleep 276;
            };
            waitUntil {alive RPM_Role};
            b33 = false;
            call RPM_Cfg_Loops_Taxes;
        };
    };
    _ret;
};
RPM_Cfg_Loops_Salary = {
    private ["_ret"];
    _ret = true;
    if (!(b15)) then {
        b15 = true;
        [] spawn {
            private ["_cop_pay","_civ_pay","_name","_txt","_i","_wppay","_facincome","_mineincome","_payout","_shoppay"];
            _payout = 0;
            while {(alive RPM_Role) && (time > 1800)} do {
                _cop_pay = 3200;
                _civ_pay = 50;
                _wppay = 0;
                _facincome = 0;
                _mineincome = 0;
                if (RPM_Civ) then {
                    for[{_i = 0}, {_i < count(a50)}, {_i = _i + 1}] do {
                        if (RPM_Role distance (getMarkerPos (a50 select _i)) <= 100) then {
                            hint format[localize "v368", 40];
                            _wppay = _wppay + 40;
                        };
                    };
                    // Factories
                    for [{_i = 0}, {_i < count(RPM_FactoryArray)}, {_i = _i + 1}] do {
                        if ((_i != 4) && (_i != 11)) then {
                            if ([_i, name RPM_Role] call RPM_Cfg_Factory_IsOwner) then {
                                if ([_i] call RPM_Cfg_Factory_IsOwner) then {
                                    _facincome = round(([_i] call RPM_Cfg_Factory_GetPrice) * 0.10) + _facincome;
                                };
                            };
                        };
                    };
                    // Farms
                    for [{_i = 0}, {_i < count(RPM_FarmsArray)}, {_i = _i + 1}] do {
                        if ((_i >= 10) && (_i <= 16)) then {
                            if ([_i, name RPM_Role] call RPM_Cfg_Farms_IsOwner) then {
                                _mineincome = round(([_i] call RPM_Cfg_Farms_GetPrice) * 0.10) + _mineincome;
                            };
                        };
                    };
                };
                _name= format["<t size='1.1' color='#00FF00' align='left'>%1</t>, Your paycheck arrives in 4 minutes", name RPM_Role];
                _txt = composeText [parsetext _name];
                if (b12) then {
                    hint _txt;
                };
                sleep 90;
                // Workplaces
                if (RPM_Civ) then {
                    for[{_i = 0}, {_i < count(a50)}, {_i = _i + 1}] do {
                        if (RPM_Role distance (getMarkerPos (a50 select _i)) <= 100) then {
                            hint format[localize "v368", 30];
                            _wppay = _wppay + 30;
                        };
                    };
                };
                _name= format["<t size='1.1' color='#00FF00' align='left'>%1</t>, Your paycheck arrives in 2 minutes", name RPM_Role];
                _txt = composeText [parsetext _name];
                if (b12) then {
                    hint _txt;
                };
                sleep 40;
                if (RPM_Civ) then {
                    for[{_i = 0}, {_i < count(a50)}, {_i = _i + 1}] do {
                        if (RPM_Role distance (getMarkerPos (a50 select _i)) <= 100) then {
                            hint format[localize "v368", 30];
                            _wppay = _wppay + 30;
                        };
                    };
                };
                _name= format["<t size='1.1' color='#00FF00' align='left'>%1</t>, Your paycheck arrives in 1 minute", name RPM_Role];
                _txt = composeText [parsetext _name];
                if (b12) then {
                    hint _txt;
                };
                sleep 40;
                if (RPM_Cop) then {
					if (i4 + _cop_pay <= RPM_MAX_NUMBER) then {
                        i4 = i4 + _cop_pay;
                        _payout = _cop_pay;
                        hint format[localize "v378", name RPM_Role, _cop_pay call RPM_str_intToStr, i4 call RPM_str_IntToStr];
                    } else {
                        hint format["%1 %2", format[localize "v379"], format[localize "v380", _cop_pay]];
                    };
                } else {
                    _shoppay = 0;
                    for [{_i = 0}, {_i < count(RPM_ShopsArray)}, {_i = _i + 1}] do {
                        if ([_i] call RPM_Cfg_Shops_IsOwner) then {
                            _shoppay = _shoppay + ([_i, call RPM_cfg_Objects_GetUID] call RPM_Cfg_Shops_GetPaycheck);
                        };
                    };
                    if (i4 + _civ_pay + _wppay + _facincome + _mineincome + _shoppay <= RPM_MAX_NUMBER) then {
                        i4 = i4 + _civ_pay + _wppay + _facincome + _mineincome + _shoppay;
                        _payout = _civ_pay + _wppay + _facincome + _mineincome + _shoppay;
                        hint format[localize "v378", name RPM_Role, _civ_pay call RPM_str_intToStr, i4 call RPM_str_IntToStr];
                    } else {
                        hint format["%1 %2", format[localize "v379"], format[localize "v380", _civ_pay + _wppay + _facincome + _mineincome]];
                    };
                };
                if (RPM_Cop) then {
                    i30 = i30 + _payout;
                } else {
                    i30 = i30 + _payout;
                };
                ["Paycheck", RPM_Role, [format["%1", _payout]]] spawn RPM_Cfg_Logs_AddLog;
                if (RPM_Diagnostics) then {
                    [format["RPM(Paycheck)|%1|%2", name RPM_Role, _payout], false] call RPM_Cfg_Server_DiagnosticsDumper;
                };
                ["i4", i4] call RPM_Saving_C_Save;
                sleep 15;
            };
            waitUntil {alive RPM_Role};
            b15 = false;
            call RPM_Cfg_Loops_Salary;
        };
    };
    _ret;
};
RPM_Cfg_Loops_Encumbered = {
    private ["_ret"];
    _ret = true;
    if (!(b4)) then {
        b4 = true;
        b25 = false;
        [] spawn {            
            private ["_idleanims","_runanims"];
            while {alive RPM_Role} do {
                if (((call RPM_Cfg_Inv_GetOwnWeight) > (round((i0 * 0.25) + i0))) && (!(b6))) then {
                    b25 = true;
                } else {
                    b25 = false;
                };
                RPM_Encumbered_Anim = false;
                if (b25) then {
                    if (vehicle RPM_Role != RPM_Role) then {
                        hint format[localize "v236"];
                        RPM_Role action["eject", vehicle RPM_Role];
                    };
                    if (vehicle RPM_Role == RPM_Role) then {
                        if (animationState RPM_Role != "amovpercmwlksnonwnondf") then {
                            _idleanims = [
                                "aidlpercmstpsnonwnondnon_player_idlesteady01",
                                "aidlpercmstpsnonwnondnon_player_idlesteady02",
                                "aidlpercmstpsnonwnondnon_player_idlesteady03",
                                "aidlpercmstpsnonwnondnon_player_idlesteady04"
                            ];
                            _runanims = [
                                "amovpercmrunsnonwnondf",
                                "amovpercmevasnonwnondf"
                            ];
                            if (!(animationState RPM_Role in _idleanims)) then {
                                if (animationState RPM_Role in _runanims) then {
                                    [] spawn {
                                        if (!(RPM_Encumbered_Anim)) then {
                                            RPM_Encumbered_Anim = true;
                                            while {b25} do {
                                                cutText ["","BLACK OUT"];
                                                cutText [format[localize "STRM_Overweight"],"PLAIN",2];
                                                sleep 2;
                                            };
                                        };
                                    };
                                    format["if (RPM_Role == %1) then {
                                        [""amovpercmwlksnonwnondf""] call RPM_Cfg_Inv_PlayMove;
                                    }", RPM_Role] call RPM_Cfg_Network_Broadcast;
                                    sleep 0.05;
                                };
                            };
                        };
                    };
                } else {
                    if (RPM_Encumbered_Anim) then {
                        cutText ["","BLACK OUT"];
                        RPM_Encumbered_Anim = false;
                    };
                };
                sleep 0.05;
            };
            waitUntil {alive RPM_Role};
            b4 = false;
            b25 = false;
            call RPM_Cfg_Loops_Encumbered;
        };
    };
    _ret;
};
RPM_Cfg_Loops_MarkersPlayer = {
    private ["_ret"];
    _ret = true;
    if (!(b9)) then {
        b9 = true;
        [] spawn {
            private ["_color","_marker","_markerpos","_position"];
            while {alive RPM_Role} do {
                _position = getPos RPM_Role;
                if ((s1 call RPM_str_Length) == 0) then {
                    _marker = createMarkerLocal["s1", _position];
                    _marker setMarkerShapeLocal "ICON";
                    _marker setMarkerTypeLocal "DOT";
                    _color = "";
                    if (RPM_Cop) then {
                        //_color = "ColorBlue";
                    } else {
                        _color = "ColorWhite";
                    };
                    if (b21) then {
                        _color = "ColorRed";
                    };
                    _marker setMarkerColorLocal _color;
                    s1 = _marker;
                } else {
                    _markerpos = getMarkerPos s1;
                    if ((_markerpos select 0) != (_position select 0) || (_markerpos select 1) != (_position select 1)) then {
                        s1 setMarkerPosLocal _position;
                    };
                };	
                sleep 0.5;
            };
            waitUntil {alive RPM_Role};
            b9 = false;
            call RPM_Cfg_Loops_MarkersPlayer;
        };
    };
    _ret;
};
RPM_Cfg_Loops_Restrained = {
    private ["_ret"];
    _ret = true;
    if (!(b14)) then {
        b14 = true;
        [] spawn {
            private ["_cuffed"];
            while {(alive RPM_Role)} do {
                _cuffed = RPM_Role getVariable "cuffed";
                if (!(isNil("_cuffed"))) then {
                    if (_cuffed) then {
                        if (animationState RPM_Role != "civillying01") then {
                            format["if (RPM_Role == %1) then {
                                [""%2""] call RPM_Cfg_Inv_SwitchMove;
                            }", RPM_Role, "civillying01"] call RPM_Cfg_Network_Broadcast;
                        };
                    };
                };
                sleep 0.5;
            };
            waitUntil {alive RPM_Role};
            RPM_Role setVariable ["cuffed", false, true];
            b14 = false;
            call RPM_Cfg_Loops_Restrained;
        };
    };
    _ret;
};
RPM_Cfg_Loops_Bodies = {
    private ["_ret"];
    _ret = true;
    if (!(b0)) then {
        b0 = true;
        [] spawn {
            private ["_i","_player","_bodies"];
            while {true} do {
                RPM_POBJArrCiv = [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, civ21, civ22, civ23, civ24, civ25, civ26, civ27, civ28, civ29, civ30, civ31, civ32, civ33, civ34, civ35, civ36, civ37, civ38, civ39, civ40];
                RPM_POBJArrCop = [cop1, cop2, cop3, cop4, cop5, cop6, cop7, cop8, cop9, cop10, cop11, cop12, cop13, cop14, swat1, swat2, swat3, swat4, swat5, swat6, pilot1, pilot2, pilot3, pilot4];
                RPM_POBJArr = [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, civ21, civ22, civ23, civ24, civ25, civ26, civ27, civ28, civ29, civ30, civ31, civ32, civ33, civ34, civ35, civ36, civ37, civ38, civ39, civ40, cop1, cop2, cop3, cop4, cop5, cop6, cop7, cop8, cop9, cop10, cop11, cop12, cop13, cop14, swat1, swat2, swat3, swat4, swat5, swat6, pilot1, pilot2, pilot3, pilot4];
                for [{_i=0}, {_i < (count RPM_POBJArr)}, {_i=_i+1}] do {
                    _player = (RPM_POBJArr select _i);
                    if ((!(isNull(_player))) and isNull(call compile format["oldciv%1", (_i + 1)]) and (!(isPlayer _player))) then {
                        [_player, 0] spawn RPM_Cfg_Vehicle_Delete;
                    };
                };
                _bodies = nearestObjects[getMarkerPos "respawn_civilian", ["Men"], 20];
                if (count _bodies > 0)then {
                    {
                        if (!(isPlayer(_x))) then {
                            [_x, 0] spawn RPM_Cfg_Vehicle_Delete;
                        };
                    } foreach _bodies;
                };
                _bodies = nearestObjects[getMarkerPos "respawn_west", ["Men"], 20];
                if(count _bodies > 0)then {
                    {
                        if (!(isPlayer(_x))) then {
                            [_x, 0] spawn RPM_Cfg_Vehicle_Delete;
                        };
                    } foreach _bodies;
                };
                _bodies = nearestObjects[getMarkerPos "respawn_CIVrila", ["Men"], 20];
                if(count _bodies > 0)then {
                    {
                        if (!(isPlayer(_x))) then {
                            [_x, 0] spawn RPM_Cfg_Vehicle_Delete;
                        };
                    } foreach _bodies;
                };
                sleep 1;
            };
            b0 = false;
            call RPM_Cfg_Loops_Bodies;
        };
    };
    _ret;
};
RPM_Cfg_Loops_Server = {
    private ["_ret"];
    _ret = true;
    if (!(b16)) then {
        b16 = true;
        [] spawn {
            private ["_i","_group"];
            while {true} do {
                if (!(b20)) then {
                    [] spawn {
                        private ["_h"];
                        if (time > 300) then {
                            if (((i1 == 0) || ((time - i1) > call RPM_Cfg_Politics_GetFrequency))) then {
                                b20 = true;
                                i1 = time;
                                b8 = true;
                                publicVariable "b8";
                                format["if (local server) then {
                                    server globalChat ""%1"";
                                };", format[localize "v456"]] call RPM_Cfg_Network_Broadcast;
                                sleep (round((call RPM_Cfg_Politics_GetFrequency) * 60));
                                b8 = false;
                                publicVariable "b8";
                                format["if (local server) then {
                                    server globalChat ""%1"";
                                };", format[localize "v457"]] call RPM_Cfg_Network_Broadcast;
                                sleep 10;
                                _h = call RPM_Cfg_Politics_Cycle;
                                waitUntil {_h};
                                sleep (round((call RPM_Cfg_Politics_GetFrequency) * 60));
                                b20 = false;
                            };
                        };
                    };
                };
                // Group assignment fix
                for [{_i = 0}, {_i < count(a15)}, {_i = _i + 1}] do {
                    _group = (a15 select _i) select 0;
                    [_group] call RPM_Cfg_Groups_ReassignLeader;
                };
                sleep 5;
            };
            b16 = false;
            call RPM_Cfg_Loops_Server;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Loops_ServerRob = {
    private ["_ret"];
    _ret = false;
    if (!(b27)) then {
        [] spawn {
            private ["_npc1","_robbed1","_cleared"];
            b27 = true;
            while {true} do {
                sleep 440;
                _npc1 = bank_vault1;
                _robbed1 = _npc1 getVariable "robbed";
                _cleared = false;
                if ((!(_robbed1 select 1)) && (_robbed1 select 0)) then {
                    bank_vault1 setVariable ["robbed", [false, false, 10000, 0, ""], true];
                    _cleared = true;
                };
                if (_cleared) then {
                    format["server globalChat ""%1"";", format[localize "v377"]] call RPM_Cfg_Network_Broadcast;
                };
                sleep 440;
            };
            b27 = false;
            call RPM_Cfg_Loops_ServerRob;
        };
    };
    _ret = true;
    _ret;
};
