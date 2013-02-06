// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Items
RPM_Cfg_Items_GetSkillArr = {
    private ["_ret","_itemid"];
    _ret = [];
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 5;
    };
    _ret;
};
RPM_Cfg_Items_HasSkills = {
    private ["_i","_reqarr","_skill","_points","_curskill","_uid","_ret","_skillarr","_itemid"];
    _ret = true;
    _uid = _this select 0;
    if (_uid call RPM_str_Length >= 1) then {
        _itemid = _this select 1;
        _skillarr = [_itemid] call RPM_Cfg_Items_GetSkillArr;
        for [{_i = 0}, {_i < count(_skillarr)}, {_i = _i + 1}] do {
            _reqarr = _skillarr select _i;
            _skill = _reqarr select 0;
            _points = _reqarr select 1;
            _curskill = [_uid, _skill] call RPM_Cfg_Skills_GetSkillPoints;
            if (_curskill < _points) then {
                _ret = false;
            };
        };
    };
    _ret;
};
RPM_Cfg_Items_GetClassification = {
    private ["_i","_ret","_itemid","_arr"];
    _ret = 0;
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        for [{_i = 0}, {_i < count(RPM_VehicleClassifications)}, {_i = _i + 1}] do {
            _arr = (RPM_VehicleClassifications select _i) select 1;
            if (_itemid in _arr) then {
                _ret =(RPM_VehicleClassifications select _i) select 0;
            };
        };
    };
    _ret;
};
RPM_Cfg_Items_GetID = {
    private ["_ret","_i","_class"];
    _ret = -1;
    _class = _this select 0;
    if (typeName(_class) == "STRING") then {
        for [{_i = 0}, {_i < count(RPM_AllMissionObjects)}, {_i = _i + 1}] do {
            if ((((RPM_AllMissionObjects select _i) select 1) select 7) == _class) then {
                _ret = (RPM_AllMissionObjects select _i) select 0;
            };
        };
    };
    _ret;
};
RPM_Cfg_Items_GetType = {
    private ["_ret","_itemid"];
    _ret = -1;
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 0;
    };
    _ret;
};
RPM_Cfg_Items_GetLegal = {
    private ["_ret","_itemid"];
    _ret = false;
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 1;
    };
    _ret;
};
RPM_Cfg_Items_GetDeprecation = {
    private ["_ret","_type","_itemid"];
    _ret = 0;
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _type = [_itemid] call RPM_Cfg_Items_GetType;
        switch (_type) do {
            case 0: {
                _ret = a86 select 2;
            };
            case 1: {
                _ret = a86 select 2;
            };
            case 2: {
                _ret = a86 select 1;
            };
            case 3: {
                _ret = a86 select 0;
            };
            case 4: {
                _ret = a86 select 1;
            };
        };
    };
    _ret;
};
RPM_Cfg_Items_GetPrice = {
    private ["_ret","_itemid"];
    _ret = 0;
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 2;
    };
    _ret;
};
RPM_Cfg_Items_GetTax = {
    private ["_ret","_itemid","_type"];
    _ret = 0;
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _type = [_itemid] call RPM_Cfg_Items_GetType;
        switch (_type) do {
            case 0: {
                _ret = a45 select 4;
            };
            case 1: {
                _ret = a45 select 4;
            };
            case 2: {
                _ret = a45 select 3;
            };
            case 3: {
                _ret = a45 select 0;
            };
            case 4: {
                _ret = a45 select 3;
            };
        };
    };
    _ret;
};
RPM_Cfg_Items_GetPriceWithTax = {
    private ["_ret","_itemid","_price","_tax"];
    _ret = 0;
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _price = [_itemid] call RPM_Cfg_Items_GetPrice;
        _tax = [_itemid] call RPM_Cfg_Items_GetTax;
        _ret = round((_price * _tax) + _price);
    };
    _ret;
};
RPM_Cfg_Items_GetWeight = {
    private ["_ret","_itemid"];
    _ret = 0;
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 3;
    };
    _ret;
};
RPM_Cfg_Items_GetLicenseArr = {
    private ["_ret","_itemid"];
    _ret = [];
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 4;
    };
    _ret;
};
RPM_Cfg_Items_GetProductionArr = {
    private ["_ret","_itemid"];
    _ret = [];
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 6;
    };
    _ret;
};

RPM_Cfg_Items_GetIDByClass = {
    private ["_ret","_i","_arrclass","_arr","_class"];
    _ret = -1;
    _class = _this select 0;
    if (typeName(_class) == "STRING") then {
        _arr = RPM_AllMissionObjects;
        for [{_i = 0}, {_i < count(_arr)}, {_i = _i + 1}] do {
            _arrclass = [_i] call RPM_Cfg_Items_GetClass;
            if (_arrclass == _class) then {
                _ret = (_arr select _i) select 0;
            };
        };
    };
    _ret;
};
RPM_Cfg_Items_GetClass = {
    private ["_ret","_itemid"];
    _ret = "";
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 7;
    };
    _ret;
};

RPM_Cfg_Items_GetString = {
    private ["_ret","_itemid"];
    _ret = "";
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 8;
    };
    _ret;
};

RPM_Cfg_Items_GetName = {
    private ["_ret","_itemid"];
    _ret = "";
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = [_itemid] call RPM_Cfg_Items_GetString;
    };
    _ret;
};

RPM_Cfg_Items_GetScript = {
    private ["_ret","_itemid"];
    _ret = "";
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 9;
    };
    _ret;
};
RPM_Cfg_Items_GetDesc = {
    private ["_ret","_itemid"];
    _ret = "";
    _itemid = _this select 0;
    if (typeName(_itemid) == "SCALAR") then {
        _ret = (((RPM_AllMissionObjects) select _itemid) select 1) select 10;
    };
    _ret;
};
RPM_Cfg_WeaponInfo = {
    private["_cfg", "_name", "_DescShort", "_DescLong", "_Pic", "_Type"];
    _name = _this;
    _cfg = (configFile >> "CfgWeapons" >> _name);
    _DescShort = if (isText(_cfg >> "displayName")) then {
        getText(_cfg >> "displayName")
    } else {"/"};
    _DescLong = if (isText(_cfg >> "Library" >> "libTextDesc")) then {
        getText(_cfg >> "Library" >> "libTextDesc")
    } else {"/"};
    _Pic = if (isText(_cfg >> "picture")) then {
        getText (_cfg >> "picture")
    } else {"/"};
    _Type = if (isText(_cfg >> "type")) then {
        parseNumber (getText(_cfg >> "type"))
    } else {
        getNumber(_cfg >> "type")
    };
    [_DescShort, _DescLong, _Type, _Pic]
};
RPM_Cfg_MagazineInfo = {
    private ["_cfg","_name","_DescShort","_DescLong","_Type","_Count","_Pic"];
    _name = _this;
    _cfg = (configFile >> "CfgMagazines" >> _name);
    _DescShort = if (isText(_cfg >> "displayName")) then {
        getText(_cfg >> "displayName")
    } else {"/"};
    _DescLong = if (isText(_cfg >> "Library" >> "libTextDesc")) then {
        getText(_cfg >> "Library" >> "libTextDesc")
    } else {"/"};
    _Pic = if (isText(_cfg >> "picture")) then {
        getText(_cfg >> "picture")
    } else {"/"};
    _Type = if (isText(_cfg >> "type")) then {
        parseNumber(getText(_cfg >> "type"))
    } else {
        getNumber(_cfg >> "type")
    };
    _Count = if (isText(_cfg >> "count")) then {
        parseNumber(getText(_cfg >> "count"))
    } else {
        getNumber(_cfg >> "count")
    };
    [_DescShort, _DescLong, _Type, _Count, _Pic]
};
RPM_Cfg_VehicleInfo = {
    private ["_cfg","_name","_DescShort","_DescLong","_Type","_MaxSpeed","_MaxFuel","_Pic"];
    _name = _this;
    _cfg = (configFile >> "CfgVehicles" >> _name);
    _DescShort = if (isText(_cfg >> "displayName")) then {
        getText(_cfg >> "displayName")
    } else {"/"};
    _DescLong = if (isText(_cfg >> "Library" >> "libTextDesc")) then {
        getText(_cfg >> "Library" >> "libTextDesc")
    } else {"/"};
    _Pic = if (isText(_cfg >> "picture")) then {
        getText(_cfg >> "picture")
    } else {"/"};
    _Type = if (isText(_cfg >> "type")) then {
        parseNumber(getText(_cfg >> "type"))
    } else {
        getNumber(_cfg >> "type")
    };
    _MaxSpeed = if (isText(_cfg >> "maxSpeed")) then {
        parseNumber(getText(_cfg >> "maxSpeed"))
    } else {
        getNumber(_cfg >> "maxSpeed")
    };
    _MaxFuel = if (isText(_cfg >> "fuelCapacity")) then {
        parseNumber(getText(_cfg >> "fuelCapacity"))
    } else {
        getNumber(_cfg >> "fuelCapacity")
    };
    [_DescShort, _DescLong, _Type, _Pic, _MaxSpeed, _MaxFuel]
};
RPM_Cfg_Weapons_GetName = {
    (_this call RPM_Cfg_WeaponInfo) select 0
};
RPM_Cfg_Weapons_GetDesc = {
    (_this call RPM_Cfg_WeaponInfo) select 1
};
RPM_Cfg_Weapons_GetType = {
    (_this call RPM_Cfg_WeaponInfo) select 2
};
RPM_Cfg_Weapons_GetPic = {
    (_this call RPM_Cfg_WeaponInfo) select 3
};
RPM_Cfg_Magazine_GetName = {
    (_this call RPM_Cfg_MagazineInfo) select 0
};
RPM_Cfg_Magazine_GetDesc = {
    (_this call RPM_Cfg_MagazineInfo) select 1
};
RPM_Cfg_Magazine_GetType = {
    (_this call RPM_Cfg_MagazineInfo) select 2
};
RPM_Cfg_Magazine_GetCount = {
    (_this call RPM_Cfg_MagazineInfo) select 3
};
RPM_Cfg_Magazine_GetPic = {
    (_this call RPM_Cfg_MagazineInfo) select 4
};
RPM_Cfg_Vehicle_GetName = {
    (_this call RPM_Cfg_VehicleInfo) select 0
};
RPM_Cfg_Vehicle_GetDesc = {
    (_this call RPM_Cfg_VehicleInfo) select 1
};
RPM_Cfg_Vehicle_GetType = {
    (_this call RPM_Cfg_VehicleInfo) select 2
};
RPM_Cfg_Vehicle_GetPic = {
    (_this call RPM_Cfg_VehicleInfo) select 3
};
RPM_Cfg_Vehicle_GetSpeed = {
    (_this call RPM_Cfg_VehicleInfo) select 4
};
RPM_Cfg_Vehicle_GetFuel = {
    (_this call RPM_Cfg_VehicleInfo) select 5
};
RPM_Cfg_Items_GetMagSlots = {
    private ["_ret","_class"];
    _ret = -1;
    _class = _this select 0;
    {
        if (_x == _class) then {
            _ret = 12;
        };
    } forEach a28;
    {
        if (_x == _class) then {
            _ret = 8;
        };
    } forEach a27;
    {
        if (_x == _class) then {
            _ret = 6;
        };
    } forEach a25;
    {
        if (_x == _class) then {
            _ret = 2;
        };
    } forEach a26;
    _ret;
};
RPM_Cfg_Items_Nitro = {
    private ["_ret","_veh","_var"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (count(nearestObjects[RPM_Role,["Air", "Ship","Car","Motorcycle","Tank","Truck"], 8]) >= 1) then {
        _veh = (nearestObjects[RPM_Role,["Air", "Ship","Car","Motorcycle","Tank","Truck"], 8]) select 0;
        _var = _veh getVariable "nitro";
        if (isNil("_var")) then {
            _veh setVariable ["nitro", true];
            _ret = true;
        } else {
            hint format[localize "v136"];
        };
    } else {
        hint format[localize "v89"];
    };
    _ret;
};
RPM_Cfg_Items_Food = {
    private ["_ret","_val","_itemid","_itemname"];
    _ret = false;
    _itemid = _this select 0;
    _itemname = [_itemid] call RPM_Cfg_Items_GetName;
    _val = -1;
    switch (_itemid) do {
        case 293: {
            _val = 20;
        };
        case 294: {
            hint format[localize "v32"];
        };
        case 295: {
            hint format[localize "v32"];
        };
        case 296: {
            _val = 10;
        };
        case 297: {
            _val = 50;
        };
        case 298: {
            _val = 30;
        };
    };
    if ((_itemid != 294) and (_itemid != 295)) then {
        if (_val != -1) then {
            if ((i9 - _val) <= 9) then {
                hint format[localize "v230"];
            } else {
                i9 = i9 - _val;
                if (i9 < 0) then {
                    i9 = 0;
                };
                hint format[localize "v43", _itemname, _val];
                _ret = true;
            };
        };
    };
    _ret;
};
RPM_Cfg_Items_Kevlar = {
    private ["_ret"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    if (!(RPM_Role getVariable "armor")) then {
        hint format[localize "v231"];
        RPM_Role setVariable ["armor", true, true];
        _ret = true;
    } else {
        hint format[localize "v148"];
    };
    _ret;
};
RPM_Cfg_Items_Armor = {
    private ["_tgt","_part","_mag","_disallowhit","_disallowlist","_hasarmor","_ret","_i","_n","_nhits","_themag","_thepart"];
    _ret = false;
    _tgt = _this select 0;
    if ((isNull(_tgt)) || (!(alive _tgt))) exitWith {};
    _part = _this select 1;
    _mag = _this select 4;
    _disallowhit = [
        "body",
        "hands",
        "legs"
    ];
    _disallowlist = [
        "10Rnd_B_765x17_Ball",
        "15Rnd_9x19_M9",
        "15Rnd_9x19_M9SD",
        "17Rnd_9x19_glock17",
        "20Rnd_B_765x17_Ball",
        "30Rnd_9x19_MP5",
        "30Rnd_9x19_MP5SD",
        "30Rnd_9x19_UZI",
        "30Rnd_9x19_UZI_SD",
        "6Rnd_45ACP",
        "7Rnd_45ACP_1911",
        "8Rnd_9x18_Makarov",
        "8Rnd_9x18_MakarovSD",
        "B_9x19_Ball"
    ];
    _hasarmor = _tgt getVariable "armor";
    if (_hasarmor) then {
        for [{_i = 0}, {_i < count(_disallowhit)}, {_i = _i + 1}] do {
            _thepart = _disallowhit select _i;
            if (_part == _thepart) then {
                for [{_n = 0}, {_n < count(_disallowlist)}, {_n = _n + 1}] do {
                    _themag = _disallowlist select _n;
                    if (_mag == _themag) then {
                        _nhits = _tgt getVariable "nhits";
                        if (isNil("_nhits")) then {
                            _tgt setVariable ["nhits", 1, true];
                        } else {
                            _nhits = _nhits + 1;
                            _tgt setVariable ["nhits", _nhits, true];
                            if (_nhits >= 5) then {
                                hint format[localize "v367"];
                                _tgt setVariable ["armor", false, true];
                            };
                        };
                    };
                };
            };
        };
    } else {
        _ret = true;
    };
    _ret;
};
RPM_Cfg_Items_LockPick = {
    private ["_veh","_ret","_rand"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _veh = cursorTarget;
    if (!(isNull(_veh))) then {
        if (!(format["%1", _veh] in a20)) then {
            _rand = random 100;
            if (_rand >= i29) then {
                if ([name RPM_Role, _veh] call RPM_Cfg_Inv_AddKey) then {
                    ["a20", a20] call RPM_Saving_C_Save;
                    hint format[localize "v200", [[typeOf(_veh)] call RPM_Cfg_Items_GetIDByClass] call RPM_Cfg_Items_GetName];
                    if (locked _veh) then {
                        _veh lock false;
                    };
                };
                _ret = true;
            } else {
                hint format[localize "v66"];
                _ret = true;
            };
        } else {
            hint format[localize "v145"];
        };
    } else {
        hint format[localize "v123"];
    };
    _ret;
};
RPM_Cfg_Items_Medikit = {
    private ["_tgt","_ret","_val"];
    _ret = false;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _tgt = _this select 0;
    if ((isNull(_tgt)) || (!(alive _tgt))) exitWith {};
    _val = 0.32;
    if (damage _tgt >= 0.33) then {
        if (RPM_Role == _tgt) then {
            hint format[localize "v194"];
            RPM_Role setDamage (damage RPM_Role) - _val;
        } else {
            hint format[localize "v193", (name _tgt)];
            format["if (RPM_Role == %1) then {
                hint ""%2""
            }", _tgt, format[localize "v50", name RPM_Role]];
            _tgt setDamage (damage _tgt) - _val;
        };
        _ret = true;
    } else {
        hint format[localize "v92"];
    };
    _ret;
};
RPM_Cfg_Items_RefuelKit = {
    private ["_ret","_tgt","_nouse"];
    _ret = false;
    _tgt = _this;
    b1 = true;
    if (b39) then {
        hint format[localize "v505"];
        b1 = false;
    } else {
        _nouse = false;
        if (isNull(_tgt)) then {
            _nouse = true;
        } else {
            if ((typeOf(_tgt) call RPM_Cfg_Vehicle_GetType == -1) || (RPM_Role distance _tgt > 8)) then {
                _nouse = true;
            };
        };
        if (_nouse) then {
            hint format[localize "v506", format[localize "v507"]];
            b1 = false;
        } else {
            if (typeOf(_tgt) in a31) then {
                hint format[localize "v510", format[localize "v507"]];
            } else {
                if (fuel _tgt >= 0.7) then {
                    hint format[localize "v509", format[localize "v507"]];
                    b1 = false;
                } else {
                    _tgt spawn {
                        hint format[localize "v501", format[localize "v503"]];
                        sleep (round(random(6)*2)+2);
                        _this setFuel 1;
                        hint format[localize "v502", format[localize "v507"]];
                        b1 = false;
                    };
                    _ret = true;
                };
            };
        };
    };
    _ret;
};
RPM_Cfg_Items_RepairKit = {
    private ["_ret","_tgt","_nouse"];
    _ret = false;
    _tgt = _this;
    b1 = true;
    if (b39) then {
        hint format[localize "v505"];
        b1 = false;
    } else {
        _nouse = false;
        if (isNull(_tgt)) then {
            _nouse = true;
        } else {
            if ((typeOf(_tgt) call RPM_Cfg_Vehicle_GetType == -1) || (RPM_Role distance _tgt > 8)) then {
                _nouse = true;
            };
        };
        if (_nouse) then {
            hint format[localize "v506", format[localize "v508"]];
            b1 = false;
        } else {
            _tgt spawn {
                hint format[localize "v501", format[localize "v504"]];
                sleep (round(random(6)*2)+2);
                _this setDamage 0;
                hint format[localize "v502", format[localize "v508"]];
                b1 = false;
            };
            _ret = true;
        };
    };
    _ret;
};
RPM_Cfg_Items_StunUnit = {
    private ["_ret","_weapons","_i","_hasmag","_has","_tgt"];
    _ret = false;
    _tgt = _this;
    if ((isNull(_tgt)) || (!(alive(_tgt))) || (isNull(RPM_Role)) || (!(alive(RPM_Role)))) exitWith {};
    if (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUse) && (([_tgt, 2] call RPM_Cfg_Inv_NPCGetInUser) != RPM_Role)) exitWith {};
    if (_tgt == RPM_Role) exitWith {
        hint format[localize "v173"];
    };
    _has = false;
    _weapons = + (weapons RPM_Role);
    {
        if (_x in a30) then {
            _weapons = _weapons - [_x];
        };
        if (_x in a1) then {
            _has = true;
        };
    } forEach _weapons;
    if (!(_has)) exitWith {
        hint format[localize "v475"];
    };
    _hasmag = [-1, false];
    _has = false;
    if (count(magazines RPM_Role) >= 1) then {
        {
            if (_x in a44) then {
                _has = true;
            };
            for [{_i = 0}, {_i < count(a44)}, {_i = _i + 1}] do {
                if (_x == (a44 select _i)) then {
                    _hasmag set[0, _i];
                    _hasmag set[1, true];
                };
            };
        } forEach (magazines RPM_Role);
    };
    if (!(_has)) exitWith {
        hint format[localize "v476"];
    };
    if ((_hasmag select 0 != -1) and (_hasmag select 1)) then {
        if ((isPlayer cursorTarget) and (_tgt == cursorTarget)) then {
            if (RPM_Role distance _tgt > 25) exitwith {
                hint format[localize "v29"]
            };
            RPM_Role removeMagazine ((magazines RPM_Role) select (_hasmag select 0));
            [RPM_Role, _tgt] spawn RPM_Cfg_Items_Taser_Effects;
            _ret = true;
        } else {
            hint format[localize "v202"];
        };
    } else {
        hint format[localize "v182"];
    };
    _ret;
};
// Taser by DaChevs (Credit: OFPEC)
RPM_Cfg_Items_Taser_Stun = {
    private ["_ret"];
    _ret = false;
    if (RPM_Cop) exitWith {};
    _this spawn {
        if (isNull(_this)) exitWith {};
        if (!(isPlayer _this)) exitWith {};
        if (!(alive _this)) exitWith {};
        if (local _this) then {
            disableUserInput true;
			[nil,_this,rSWITCHMOVE,"adthpercmstpsraswrfldnon_1"] call RE;
            sleep 15;
            disableUserInput false;
			if (animationState _this != "civillying01") then
			{
				[nil,_this,rSWITCHMOVE,""] call RE;
			};
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Items_Taser_Target = {
    private ["_ret","_target"];
    _ret = false;
    _target = _this select 1;
    if (local _target) then {
        if (RPM_Cop) exitWith {};
        _this spawn {
            private ["_source","_target","_external"];
            _source = _this select 0;
            _target = _this select 1;
            
            _external = _this select 2;
            format["if (RPM_Role == %1) then {
                call RPM_Cfg_Inv_DumpToGround;
                [""%2""] call RPM_Cfg_Inv_PlayMove;
            }", _target, "AdthPercMstpSnonWnonDnon_A1"] call RPM_Cfg_Network_Broadcast;
            if (!(_external)) then {
                RPM_Role commandChat format[localize "v229", _source, name _source];
            } else {
                RPM_Role commandChat format[localize "STRM_RecoverInDMZ"];
            };
            _target spawn RPM_Cfg_Items_Taser_Stun;
            b50 = true;
            if (RPM_Diagnostics) then {
                [format["CHRP(Items)|Stun|%1|%2", name RPM_Role, _source], false] call RPM_Cfg_Server_DiagnosticsDumper;
            };
            ["Stunned", RPM_Role, [name _source]] spawn RPM_Cfg_Logs_AddLog;
            disableUserInput true;
            sleep i24;
            if ((animationState RPM_Role) in a43) then {
                format["if (RPM_Role == %1) then {
                    [""%2""] call RPM_Cfg_Inv_PlayMove;
                }", RPM_Role, "Normal"] call RPM_Cfg_Network_Broadcast;
            };
            b50 = false;
            disableUserInput false;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Items_Taser_Effects = {
    private ["_ret"];
    _ret = false;
    _this spawn {
        private ["_source","_target","_external","_realtarget"];
        _source = _this select 0;
        _target = _this select 1;
        _external = false;
        if (count(_this) >= 3) then {
            _external = _this select 2;
        };
        if (isNull(_source)) exitWith {};
        if (isNull(_target)) exitWith {};
        if (!(alive _target)) exitWith {};
        if (!((driver(vehicle _target)) == _target)) then {
            _realtarget = driver(vehicle _target);
            _realtarget action["eject", _target];
            _target = _realtarget;
        };
        if (!(isNull(_target))) then {
            if (isPlayer _target) then {
                format["if (RPM_Role == %2) then {
                    [%1, %2, %3] call RPM_Cfg_Items_Taser_Target;
                }", _source, _target, _external] call RPM_Cfg_Network_Broadcast;
                if (local _source) then {
                    if (!(_external)) then {
                        if (!(isNull(_target))) then {
                            hint format[localize "v221", _target, name _target];
                        };
                    };
                };
            };
            sleep i24;
        };
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Items_Taser_Track = {
    private ["_ret"];
    _ret = false;
    _this spawn {
        private ["_source","_ammo","_bullet","_target","_wep","_tgthealth"];
        _source = _this select 0;
        _wep = _this select 1;
        _ammo = _this select 5;
        if ((!(_wep in a1)) && (!(_ammo in a44))) exitWith {};
        switch (_wep) do {
            case "M9SD": {
                if (_ammo != "15Rnd_9x19_M9SD") exitWith {};
            };
            case "MakarovSD": {
                if (_ammo != "8Rnd_9x18_MakarovSD") exitWith {};
            };
        };
        _bullet = nearestObject [_source, _ammo];
        _target = cursorTarget;
        if (isNull(_target)) exitWith {};
        if (!(alive _target)) exitWith {};
        // Remove the full magazine per stun
        RPM_Role removeMagazine (_this select 5);
        deleteVehicle _bullet;
        _tgthealth = damage _target;
        _target setDamage _tgthealth;
        if (_source distance _target > 25) exitwith {
            if (!(isNull(_bullet))) then {
                deleteVehicle _bullet;
            };
        };
        [_source, _target] spawn RPM_Cfg_Items_Taser_Effects;
        taserData = [_source, _target];
        publicVariable "taserData";
    };
    _ret = true;
    _ret;
};
// Remove Illegal Items
RPM_Cfg_Items_RemoveIllegals = {
    private ["_i","_itemid","_amount","_ret"];
    _ret = false;
    for [{_i=0},{_i<count(a19)},{_i=_i+1}] do {
        _itemid = (a19 select _i) select 0;
        _amount = (a19 select _i) select 1;
        {
            if (_x == _itemid) then {
                [_x, _amount] call RPM_Cfg_Inv_DelItemAmount;
            };
        } forEach a57;
    };
    _ret = true;
    _ret;
};
RPM_Cfg_Items_GetMagCount = {
    private ["_i","_class","_ret","_magstemp"];
    _ret = 0;
    if ((isNull(RPM_Role)) || (!(alive RPM_Role))) exitWith {};
    _class = _this;
    _magstemp = RPM_Role call RPM_Cfg_Objects_GetMyMags;
    for [{_i = 0}, {_i < count(_magstemp)}, {_i = _i + 1}] do {
        if (((_magstemp select _i) select 0) == _class) then {
            _ret = (_magstemp select _i) select 1;
        };
    };
    _ret;
};
