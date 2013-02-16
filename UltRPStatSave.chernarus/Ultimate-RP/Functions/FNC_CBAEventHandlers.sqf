// By Ultimate-RP Dev Team: http://ultimate-rp.com

["AdminTele", { player commandChat "Admin teleport detected!"; }] call CBA_fnc_addEventHandler;
["Dispatch_Rob", { [_this select 0, _this select 1, _this select 2, _this select 3] call UltRP_Dispatch_Rob }] call CBA_fnc_addEventHandler;
["Dispatch_Train", { [_this select 0, _this select 1] call UltRP_Dispatch_Rob }] call CBA_fnc_addEventHandler;
["CallTaxi", { [_this select 0, _this select 1, _this select 2, _this select 3] call UltRP_Taxi }] call CBA_fnc_addEventHandler;