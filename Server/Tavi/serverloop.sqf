["serverloop1"] execVM "servermissionfile\commonloop.sqf";
[0, 0, 0, ["serverloop"]] execVM "gangs.sqf";
[] execVM "servermissionfile\hunting.sqf";

[] call UltRP_DebugLoop;
[] call UltRP_BroadcastLoop;