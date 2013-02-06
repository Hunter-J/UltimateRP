// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Politics
// Chief/Mayor rescend
RPM_Cfg_Office_Rescend = {
    private ["_ret","_seat","_player"];
    _ret = false;
    b1 = true;
    _seat = _this select 0;
    _player = _this select 1;
    if ("None" call RPM_Cfg_Mayor_SetMayor) then {
        if ([_seat, _player] call RPM_Cfg_Politics_IsCandidate) then {
            if ([_seat, _player] call RPM_Cfg_Politics_DelCandidate) then {
                hint format[localize "v487"];
                format["if (local server) then {
                    server globalChat ""%1"";
                };", format[localize "v486", _player]] call RPM_Cfg_Network_Broadcast;
                [format["RPM(Candidate)|Recended|%1", _player], false] call RPM_Cfg_Server_DiagnosticsDumper;
                closeDialog 0;
            };
        };
    };
    b1 = false;
    _ret = true;
    _ret;
};
// Cycle
RPM_Cfg_Politics_Cycle = {
    private ["_ret"];
    _ret = false;
    if (!(b36)) then {
        [] spawn {
            private ["_winner","_i","_mayorcandidates","_player","_playerobj","_chiefcandidates"];
            if (call RPM_Cfg_Objects_GetNOnline >= 2) then {
                b36 = true;
                // Remove null candidates and votes
                _chiefcandidates = 0 call RPM_Cfg_Politics_GetCandidates;
                for [{_i = 0}, {_i < count(_chiefcandidates)}, {_i = _i + 1}] do {
                    _player = ((_chiefcandidates) select _i) select 0;
                    _playerobj = [_player] call RPM_Cfg_Objects_GetObject;
                    if (isNull(_playerobj)) then {
                        [0, _player] call RPM_Cfg_Politics_DelCandidate;
                    };
                };
                _mayorcandidates = 1 call RPM_Cfg_Politics_GetCandidates;
                for [{_i = 0}, {_i < count(_mayorcandidates)}, {_i = _i + 1}] do {
                    _player = ((_mayorcandidates) select _i) select 0;
                    _playerobj = [_player] call RPM_Cfg_Objects_GetObject;
                    if (isNull(_playerobj)) then {
                        [1, _player] call RPM_Cfg_Politics_DelCandidate;
                    };
                };
                sleep 1;
                if (call RPM_Cfg_Objects_GetNCopsOnline >= 2) then {
                    // Police Chief Winner
                    _winner = 0 call RPM_Cfg_Politics_GetWinner;
                    if (_winner call RPM_str_Length >= 1) then {
                        if (!(_winner call RPM_Cfg_Politics_IsChief)) then {
                            format["if (local server) then {
                                server globalChat ""%1"";
                            };", format[localize "v465", _winner, format[localize "v460"]]] call RPM_Cfg_Network_Broadcast;
                            [format["RPM(Chief)|Elected|%1", _winner], false] call RPM_Cfg_Server_DiagnosticsDumper;
                            _winner call RPM_Cfg_Mayor_SetChief;
                        };
                    } else {
                        if (((a77 select 1) select 0) == "None") then {
                            format["if (local server) then {
                                server globalChat ""%1"";
                            };", format[localize "v495"]] call RPM_Cfg_Network_Broadcast;
                        };
                    };
                    sleep 2;
                };
                // Mayor Winner
                _winner = 1 call RPM_Cfg_Politics_GetWinner;
                if (_winner call RPM_str_Length >= 1) then {
                    if (!(_winner call RPM_Cfg_Mayor_IsMayor)) then {
                        format["if (local server) then {
                            server globalChat ""%1"";
                        };", format[localize "v465", _winner, format[localize "v461"]]] call RPM_Cfg_Network_Broadcast;
                        [format["RPM(Mayor)|Elected|%1", _winner], false] call RPM_Cfg_Server_DiagnosticsDumper;
                        _winner call RPM_Cfg_Mayor_SetMayor;
                    };
                } else {
                    if (((a77 select 2) select 0) != "None") then {
                        format["if (local server) then {
                            server globalChat ""%1"";
                        };", format[localize "v496"]] call RPM_Cfg_Network_Broadcast;
                    };
                };
                b36 = false;
            };
        };
    };
    _ret = true;
    _ret;
};
// Finances
RPM_Cfg_Mayor_GetBalance = {
    private ["_ret"];
    _ret = round(i4 * 0.50);
    _ret;
};
RPM_Cfg_Mayor_Transact = {
    private ["_ret","_transacted","_tgt","_tgtobj","_mode","_amount","_balance","_player"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _player = _this select 0;
    if (_player call RPM_str_Length >= 1) then {
        b1 = true;
        _mode = _this select 1;
        _amount = (_this select 2) call RPM_str_StrToLongInt;
        _transacted = false;
        if (_amount > RPM_MAX_NUMBER) exitWith {
            hint format[localize "v3", RPM_MAX_NUMBER];
            b1 = false;
        };
        _balance = round(i21*0.50);
        _tgtobj = objNull;
        switch (_mode) do {
            case 0: {
                if (([521] call RPM_Cfg_Inv_GetItemAmount) < _amount) exitWith {
                    hint format[localize "v4"];
                    b1 = false;
                };
                if (_amount + i21 >RPM_MAX_NUMBER) exitWith {
                    hint format[localize "v3", RPM_MAX_NUMBER];
                    b1 = false;
                };
                if ([521, _amount] call RPM_Cfg_Inv_DelItemAmount) then {
                    format["i21 = i21 + %1", _amount] call RPM_Cfg_Network_Broadcast;
                    hint format[localize "v5", _amount];
                    if (RPM_Diagnostics) then {
                        [format["RPM(Government_Banking)|Deposited|%1|%2|%3", name RPM_Role, _amount, _balance], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    };
                    _transacted = true;
                } else {
                    hint format[localize "v6"];
                };
            };
            case 1: {
                _tgt = _this select 3;
                _tgtobj = [_tgt] call RPM_Cfg_Objects_GetObjectByUnit;
                if (isNull(_tgtobj)) exitWith {
                    hint format[localize "v93"];
                    b1 = false;
                };
                if (RPM_Role == _tgtobj) exitWith {
                    hint format[localize "v11"];
                    b1 = false;
                };
                if (_amount > i21) exitWith {
                    hint format[localize "v7"];
                    b1 = false;
                };
                if (isNull(_tgtobj)) exitWith {
                    b1 = false;
                };
                if (!(alive _tgtobj)) exitWith {
                    b1 = false;
                };
                if (i21 - _amount >= 0) then {
                    hint format[localize "v9", (name _tgtobj), _amount];
                    format["i21 = i21 - %1", _amount] call RPM_Cfg_Network_Broadcast;
                    format["if (RPM_Role == %1) then {
                        hint ""%2"";
                        i4 = i4 + %3;
                    };", _tgtobj, format[localize "v8", name RPM_Role, _amount], _amount] call RPM_Cfg_Network_Broadcast;
                    if (RPM_Diagnostics) then {
                        [format["RPM(Government_Banking)|Transferred|%1|%2|%3|%4", name RPM_Role, name _tgtobj, _amount, _balance], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    };
                    _transacted = true;
                } else {
                    hint format[localize "v6"];
                };
            };
            case 2: {
                if (_amount > i21) exitWith {
                    hint format[localize "v7"];
                    b1 = false;
                };
                if ((([521] call RPM_Cfg_Inv_GetItemAmount) + _amount) > RPM_MAX_NUMBER) exitWith {
                    hint format[localize "v403", RPM_MAX_NUMBER];
                    b1 = false;
                };
                if (i21 - _amount >= 0) then {
                    if ([521, _amount] call RPM_Cfg_Inv_AddItemAmount) then {
                        hint format[localize "v10", _amount];
                        format["i21 = i21 - %1", _amount] call RPM_Cfg_Network_Broadcast;
                        if (RPM_Diagnostics) then {
                            [format["RPM(Government_Banking)|Withdrew|%1|%2|%3", name RPM_Role, _amount, _balance], false] call RPM_Cfg_Server_DiagnosticsDumper;
                        };
                        _transacted = true;
                    };
                } else {
                    hint format[localize "v6"];
                };
            };
        };
        if (_transacted) then {
            _ret = true;
        };
        b1 = false;
    };
    _ret;
};
// Politicians
RPM_Cfg_Politics_IsChief = {
    private ["_ret","_player"];
    _ret = false;
    _player = _this;
    if (_player call RPM_str_Length >= 1) then {
        if (((a77 select 1) select 0) == _player) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Mayor_SetChief = {
    private ["_ret","_player"];
    _ret = false;
    _player = _this;
    if (_player call RPM_str_Length >= 1) then {
        format["(a77 select 1) set[0, ""%1""]", _player] call RPM_Cfg_Network_Broadcast;
        if (_player call RPM_Cfg_Politics_IsChief) then {
            _ret = true;
        };
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Mayor_IsMayor = {
    private ["_ret","_player"];
    _ret = false;
    _player = _this;
    if (_player call RPM_str_Length >= 1) then {
        if (((a77 select 2) select 0) == _player) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Mayor_IsOnline = {
    private ["_i","_ret","_mayor"];
    _ret = false;
    _mayor = call RPM_Cfg_Mayor_GetMayor;
    if (_mayor call RPM_str_Length >= 1) then {
        for [{_i = 0}, {_i < count(RPM_POBJArr)}, {_i = _i + 1}] do {
            if (!(isNull(RPM_POBJArr select _i))) then {
                if ((name (RPM_POBJArr select _i)) == _mayor) then {
                    _ret = true;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Mayor_GetMayor = {
    private ["_ret"];
    _ret = (a77 select 2) select 0;
    _ret;
};
RPM_Cfg_Mayor_SetMayor = {
    private ["_ret","_player"];
    _ret = false;
    _player = _this;
    if (_player call RPM_str_Length >= 1) then {
        format["(a77 select 2) set[0, ""%1""]", _player] call RPM_Cfg_Network_Broadcast;
        if (_player call RPM_Cfg_Mayor_IsMayor) then {
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Politics_Run = {
    private ["_ret","_seat","_office","_player","_h"];
    _ret = false;
    b1 = true;
    _seat = _this select 0;
    _player = _this select 1;
    if (_player call RPM_str_Length >= 1) then {
        if (!([_seat, _player] call RPM_Cfg_Politics_IsCandidate)) then {
            if ([_seat, _player] call RPM_Cfg_Politics_AddCandidate) then {
                _office = "";
                switch (_seat) do {
                    case 0: {
                        _office = format[localize "v460"];
                    };
                    case 1: {
                        _office = format[localize "v461"];
                    };
                };
                if ([_seat, _player] call RPM_Cfg_Politics_IsCandidate) then {
                    format["if (local server) then {
                        server globalChat ""%2"";
                    } else {
                        if ((ctrlVisible 230) && (RPM_Role != %1)) then {
                            [] spawn {
                                closeDialog 0;
                                b1 = false;
                            };
                        };
                    };", RPM_Role, format[localize "v459", name RPM_Role, _office]] call RPM_Cfg_Network_Broadcast;
                    [format["RPM(Candidate)|Applied|%1", name RPM_Role], false] call RPM_Cfg_Server_DiagnosticsDumper;
                    _h = _seat call RPM_Cfg_Politics_Repaint_CandidatesListBox;
                    waitUntil {_h};
                    _ret = true;
                };
            };
        };
    };
    b1 = false;
    _ret;
};
// Candidacy recend
RPM_Cfg_Politics_Rescend = {
    private ["_ret","_seat","_office","_player","_h"];
    _ret = false;
    b1 = true;
    _seat = _this select 0;
    _player = _this select 1;
    if (_player call RPM_str_Length >= 1) then {
        if ([_seat, _player] call RPM_Cfg_Politics_IsCandidate) then {
            if ([_seat, _player] call RPM_Cfg_Politics_DelCandidate) then {
                _office = "";
                switch (_seat) do {
                    case 0: {
                        _office = format[localize "v460"];
                    };
                    case 1: {
                        _office = format[localize "v461"];
                    };
                };
                format["if (local server) then {
                    server globalChat ""%2"";
                } else {
                    if ((ctrlVisible 230) && (RPM_Role != %1)) then {
                        [] spawn {
                            closeDialog 0;
                            b1 = false;
                        };
                    };
                };", RPM_Role, format[localize "v458", name RPM_Role, _office]] call RPM_Cfg_Network_Broadcast;
                [format["RPM(Candidate)|Opted Out|%1", name RPM_Role], false] call RPM_Cfg_Server_DiagnosticsDumper;
                _h = _seat call RPM_Cfg_Politics_Repaint_CandidatesListBox;
                waitUntil {_h};
                _ret = true;
            };
        };
    };
    b1 = false;
    _ret;
};
// Laws
RPM_Cfg_Mayor_GetLaw = {
    private ["_ret","_index"];
    _ret = "";
    _index = _this;
    if (_index >= 0) then {
        _ret = (RPM_Stats_LawsArray select _index + 1) select 0;
    };
    _ret;
};
RPM_Cfg_Mayor_SetLaw = {
    private ["_ret","_index","_payload","_oldlaw"];
    _ret = false;
    _index = _this select 0;
    _payload = _this select 1;
    if (_index >= 0) then {
        b1 = true;
        _oldlaw = _index call RPM_Cfg_Mayor_GetLaw;
        if (_oldlaw == _payload) then {
            hint format[localize "v466"];
        } else {
            format["(RPM_Stats_LawsArray select %1) set[0, ""%2""]", _index + 1, _payload] call RPM_Cfg_Network_Broadcast;
            hint format[localize "v467", _index + 1];
            format["if (local server) then {
                server globalChat ""%1"";
            };", format[localize "v484"], RPM_Role] call RPM_Cfg_Network_Broadcast;
            [format["RPM(Mayor)|Set Law|%1|%2|%3", _index, _payload, _oldlaw], false] call RPM_Cfg_Server_DiagnosticsDumper;
            closeDialog 0;
            [] spawn {
                private ["_h"];
                _h = call RPM_Cfg_Mayor_Laws_RepaintListBox;
                waitUntil {_h};
                b1 = false;
            };
            _ret = true;
        };
    };
    _ret;
};
// Schedule
RPM_Cfg_Politics_GetFrequency = {
    private ["_ret"];
    _ret = a77 select 0;
    _ret;
};
RPM_Cfg_Politics_SetFrequency = {
    private ["_ret","_frequency","_oldfrequency"];
    _ret = false;
    _frequency = _this;
    if ((_frequency >= 5) && (_frequency <= 60)) then {
        b1 = true;
        _oldfrequency = call RPM_Cfg_Politics_GetFrequency;
        if (_frequency == _oldfrequency) then {
            hint format[localize "v494"];
            b1 = false;
        } else {
            hint format[localize "v492"];
            format["if (local server) then {
                server globalChat ""%1"";
            };
            a77 set[0, %2];", format[localize "v493"], _frequency] call RPM_Cfg_Network_Broadcast;
            [format["RPM(Mayor)|Set Frequency|%1|%2", _frequency, _oldfrequency], false] call RPM_Cfg_Server_DiagnosticsDumper;
            closeDialog 0;
            _ret = true;
            b1 = false;
        };
    } else {
        hint format[localize "v491"];
        b1 = false;
    };
    _ret;
};
// Voting
RPM_Cfg_Politics_CanVote = {
    private ["_ret"];
    _ret = false;
    if (b8) then {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Politics_GetCandidates = {
    private ["_ret"];
    _ret = [];
    _ret = (a77 select _this + 1) select 1;
    _ret;
};
RPM_Cfg_Politics_IsCandidate = {
    private ["_ret","_seat","_candidates","_player","_i"];
    _ret = false;
    _seat = _this select 0;
    _player = _this select 1;
    if (_player call RPM_str_Length >= 1) then {
        _candidates = _seat call RPM_Cfg_Politics_GetCandidates;
        for [{_i = 0}, {_i < count(_candidates)}, {_i = _i + 1}] do {
            if (((_candidates select _i) select 0) == _player) then {
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Politics_AddCandidate = {
    private ["_ret","_seat","_player","_candidates","_tmparr","_playerobj","_playerunit"];
    _ret = false;
    b1 = true;
    _seat = _this select 0;
    _player = _this select 1;
    if (_player call RPM_str_Length >= 1) then {
        if (!([_seat, _player] call RPM_Cfg_Politics_IsCandidate)) then {
            _playerobj = [_player] call RPM_Cfg_Objects_GetObject;
            if (!(isNull(_playerobj))) then {
                _playerunit = format["%1", _playerobj];
                _candidates = + (_seat call RPM_Cfg_Politics_GetCandidates);
                _tmparr = [_player, _playerunit, []];
                _candidates set[count(_candidates), _tmparr];
                format["(a77 select %1) set[1, %2]", _seat + 1, _candidates] call RPM_Cfg_Network_Broadcast;
                if ([_seat, _player] call RPM_Cfg_Politics_IsCandidate) then {
                    _ret = true;
                };
            };
        };
    };
    b1 = false;
    _ret;
};
RPM_Cfg_Politics_DelCandidate = {
    private ["_ret","_seat","_player","_idx","_candidates"];
    _ret = false;
    b1 = true;
    _seat = _this select 0;
    _player = _this select 1;
    if (_player call RPM_str_Length >= 1) then {
        if ([_seat, _player] call RPM_Cfg_Politics_IsCandidate) then {
            _candidates = + (_seat call RPM_Cfg_Politics_GetCandidates);
            _idx = [_seat, _player] call RPM_Cfg_Politics_GetCandidateIDX;
            if (_idx != -1) then {
                _candidates set[_idx, -1];
                _candidates = _candidates - [-1];
                format["(a77 select %1) set[1, %2]", _seat + 1, _candidates] call RPM_Cfg_Network_Broadcast;
                if (!([_seat, _player] call RPM_Cfg_Politics_IsCandidate)) then {
                    _ret = true;
                };
            };
        };
    };
    b1 = false;
    _ret;
};
RPM_Cfg_Politics_GetCandidateIDX = {
    private ["_i","_ret","_seat","_player","_candidates"];
    _ret = -1;
    _seat = _this select 0;
    _player = _this select 1;
    if (_player call RPM_str_Length >= 1) then {
        _candidates = + (_seat call RPM_Cfg_Politics_GetCandidates);
        for [{_i = 0}, {_i < count(_candidates)}, {_i = _i + 1}] do {
            if (((_candidates select _i) select 0) == _player) then {
                _ret = _i;
            };
        };
    };
    _ret;
};
RPM_Cfg_Politics_GetIndexPlayer = {
    private ["_ret","_seat","_index","_candidates"];
    _ret = "";
    _seat = _this select 0;
    _index = _this select 1;
    if (_index >= 0) then {
        _candidates = _seat call RPM_Cfg_Politics_GetCandidates;
        if ((count(_candidates)-1) >= _index) then {
            _ret = (_candidates select _index) select 0;
        };
    };
    _ret;
};
RPM_Cfg_Politics_GetVote = {
    private ["_ret","_seat","_player","_index","_candidates","_arr","_i","_n"];
    _ret = "";
    _seat = _this select 0;
    _player = _this select 1;
    _index = _this select 2;
    if ((_player call RPM_str_Length >= 1) && (_index >= 0)) then {
        _candidates = _seat call RPM_Cfg_Politics_GetCandidates;
        if ((count(_candidates)-1) >= _index) then {
            for [{_i = 0}, {_i < count(_candidates)}, {_i = _i + 1}] do {
                _arr = (_candidates select _i) select 2;
                for [{_n = 0}, {_n < count(_arr)}, {_n = _n + 1}] do {
                    if ((_arr select _n) == _player) then {
                        _ret = (_candidates select _i) select 0;
                    };
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Politics_GetVoters = {
    private ["_ret","_seat","_index","_candidates"];
    _ret = [];
    _seat = _this select 0;
    _index = _this select 1;
    if (_index >= 0) then {
        _candidates = _seat call RPM_Cfg_Politics_GetCandidates;
        if ((count(_candidates)-1) >= _index) then {
            _ret = (_candidates select _index) select 2;
        };
    };
    _ret;
};
RPM_Cfg_Politics_AddVote = {
    private ["_ret","_seat","_index","_player","_indexplayer","_castvote","_voters"];
    _ret = false;
    b1 = true;
    _seat = _this select 0;
    _player = _this select 1;
    _index = _this select 2;
    if ((_player call RPM_str_Length >= 1) && (_index >= 0)) then {
        _castvote = [_seat, _player, _index] call RPM_Cfg_Politics_GetVote;
        _indexplayer = [_seat, _index] call RPM_Cfg_Politics_GetIndexPlayer;
        if (((_indexplayer call RPM_Cfg_Objects_GetUnit) call RPM_str_Length) >= 1) then {
            if (_castvote call RPM_str_Length >= 1) then {
                if (_castvote != _indexplayer) then {
                    hint format[localize "v462", _castvote];
                };
            } else {
                _voters = + ([_seat, _index] call RPM_Cfg_Politics_GetVoters);
                _voters set[count(_voters), _player];
                format["(((a77 select %1) select 1) select %2) set [2, %3]", _seat + 1, _index, _voters] call RPM_Cfg_Network_Broadcast;
                hint format[localize "v463", _indexplayer];
                _ret = true;
            };
        } else {
            hint format[localize "v93"];
        };
    };
    b1 = false;
    _ret;
};
RPM_Cfg_Politics_DelVote = {
    private ["_ret","_seat","_index","_player","_i","_idx","_voters","_castvote","_indexplayer"];
    _ret = false;
    b1 = true;
    _seat = _this select 0;
    _player = _this select 1;
    _index = _this select 2;
    if ((_player call RPM_str_Length >= 1) && (_index >= 0)) then {
        _castvote = [_seat, _player, _index] call RPM_Cfg_Politics_GetVote;
        _indexplayer = [_seat, _index] call RPM_Cfg_Politics_GetIndexPlayer;
        if (_castvote call RPM_str_Length >= 1) then {
            if (_castvote == _indexplayer) then {
                _voters = + ([_seat, _index] call RPM_Cfg_Politics_GetVoters);
                _idx = 01;
                for [{_i = 0}, {_i < count(_voters)}, {_i = _i + 1}] do {
                    if ((_voters select _i) == _player) then {
                        _idx = _i;
                    };
                };
                if (_idx != -1) then {
                    _voters set[_idx, -1];
                    _voters = _voters - [-1];
                    format["(((a77 select %1) select 1) select %2) set [2, %3]", _seat + 1, _index, _voters] call RPM_Cfg_Network_Broadcast;
                    hint format[localize "v464", _indexplayer];
                    _ret = true;
                };
            };
        };
    };
    b1 = false;
    _ret;
};
RPM_Cfg_Politics_GetNumVotes = {
    private ["_ret","_seat","_index"];
    _ret = 0;
    _seat = _this select 0;
    _index = _this select 1;
    if (_index >= 0) then {
        _ret =  count([_seat, _index] call RPM_Cfg_Politics_GetVoters);
    };
    _ret;
};
RPM_Cfg_Politics_GetWinner = {
    private ["_ret","_seat","_i","_tmparr","_player","_nvotes","_candidates","_potentials","_n","_second","_first"];
    _ret = "";
    _seat = _this;
    _candidates = call RPM_Cfg_Politics_GetCandidates;
    _potentials = [];
    for [{_i = 0}, {_i < count(_candidates)}, {_i = _i  + 1}] do {
        _player = (_candidates select _i) select 0;
        _nvotes = [_seat, _i] call RPM_Cfg_Politics_GetNumVotes;
        if (_nvotes >= i11) then {
            if (!(isNull([_player] call RPM_Cfg_Objects_GetObject))) then {
                _tmparr = [_player, _nvotes];
                _potentials set[count(_potentials), _tmparr];
            };
        };
    };
    _potentials = [_potentials, 1, "DESC", ""] call KRON_ArraySort;
    if (count(_potentials) >= 2) then {
        for [{_i = 0}, {_i < count(_potentials)}, {_i = _i + 1}] do {
            _first = (_potentials select _i) select 1;
            for [{_n = 1}, {_n < count(_potentials)+1}, {_n = _n + 1}] do {
                _second = (_potentials select _i) select 1;
                if (_second != _first) then {
                    _ret = (_potentials select _i) select 0;
                };
            };
        };
    } else {
        if (count(_potentials) == 1) then {
            if (((_potentials select 0) select 1) >= i11) then {
                _ret = (_potentials select 0) select 0;
            };
        };
    };
    _ret;
};
// Taxes
RPM_Cfg_Taxes_Set = {
    private ["_ret","_taxid","_val"];
    _ret = false;
    _taxid = _this select 0;
    _val = _this select 1;
    a45 set[_taxid, _val];
    _ret = true;
    _ret;
};
RPM_Cfg_Mayor_SetTaxes = {
    private ["_ret","_goods","_income","_transactions","_vehicles","_weapons"];
    _ret = false;
    _goods = _this select 0;
    _income = _this select 1;
    _transactions = _this select 2;
    _vehicles = _this select 3;
    _weapons = _this select 4;
    if (((a45 select 0) == _goods) && ((a45 select 1) == _income) && ((a45 select 2) == _transactions) && ((a45 select 3) == _vehicles) && ((a45 select 4) == _weapons)) then {
        hint format[localize "v489"];
    } else {
        hint format[localize "v490"];
        format["if (local server) then {
            server globalChat ""%1"";
        };
        [1, %2] call RPM_Cfg_Taxes_Set;
        [2, %3] call RPM_Cfg_Taxes_Set;
        [3, %4] call RPM_Cfg_Taxes_Set;
        [4, %5] call RPM_Cfg_Taxes_Set;
        [5, %6] call RPM_Cfg_Taxes_Set;", format[localize "v485"], _goods, _income, _transactions, _vehicles, _weapons] call RPM_Cfg_Network_Broadcast;
        closeDialog 0;
    };
    _ret = true;
    _ret;
};
