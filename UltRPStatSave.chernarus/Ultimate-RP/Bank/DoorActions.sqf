// By Ultimate-RP Dev Team: http://ultimate-rp.com

BankDoor1Open = player addaction ["Open Door","Scripts\Bank\Doors.sqf",[1, open],1,false,true,"",'(Bank animationPhase "door_1Anim" < 0.01) and (player distance getMarkerPos "bdoor1" <= 2) and !canUseBank'];
BankDoor1Close = player addaction ["Close Door","Scripts\Bank\Doors.sqf",[1, close],1,false,true,"",'(Bank animationPhase "door_1Anim" > 0.99) and (player distance getMarkerPos "bdoor1" <= 2) and !canUseBank'];

BankDoor2Open = player addaction ["Open Door","Scripts\Bank\Doors.sqf",[2, open],1,false,true,"",'(Bank animationPhase "door_6Anim" < 0.01) and (player distance getMarkerPos "bdoor2" <= 2) and !canUseBank'];
BankDoor2Close = player addaction ["Close Door","Scripts\Bank\Doors.sqf",[2, close],1,false,true,"",'(Bank animationPhase "door_6Anim" > 0.99) and (player distance getMarkerPos "bdoor2" <= 2) and !canUseBank'];
