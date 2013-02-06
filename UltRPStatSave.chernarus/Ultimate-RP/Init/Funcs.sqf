//By OneShot.J

["AdminTele", { player commandChat "Admin teleport detected!"; }] call CBA_fnc_addEventHandler;

["Dispatch", { [_this select 0, _this select 1, _this select 2, _this select 3, _this select 4] execVM "Scripts\Dispatch.sqf" }] call CBA_fnc_addEventHandler;

["CallTaxi", { [_this select 0, _this select 1, _this select 2] execVM "Scripts\CellPhone\calltaxi.sqf" }] call CBA_fnc_addEventHandler;

["DeleteMarker", { ["DeleteMarker"] execVM "Scripts\createbody.sqf" }] call CBA_fnc_addEventHandler;