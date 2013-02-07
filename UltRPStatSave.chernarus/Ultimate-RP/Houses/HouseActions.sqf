// By Ultimate-RP Dev Team: http://ultimate-rp.com

//House1
House1DoorBellAction = player addaction ["Door Bell","Scripts\Houses\HouseDoorBell.sqf","House1",1,false,true,"",'player distance getMarkerPos "House1DoorF" <= 2'];

House1BuyAction = player addaction [format["Buy House ($%1)", House1 getVariable "Price"],"Scripts\Houses\HouseBuy.sqf",House1,1,false,true,"",'_House1Owner = House1 getVariable "Owner"; (_House1Owner == "None" and _House1Owner != name player) and (player distance getMarkerPos "House1DoorF" <= 2)'];
House1SellAction = player addaction [format["Sell House ($%1)", House1 getVariable "Price"],"Scripts\Houses\HouseSell.sqf",House1,1,false,true,"",'_House1Owner = House1 getVariable "Owner"; _House1Owner == name player and (player distance getMarkerPos "House1DoorF" <= 2)'];

House1DoorFOAction = player addaction ["Open Door","Scripts\Houses\HouseDoors.sqf","House1DoorFO",1,false,true,"",'_House1DoorF = House1 getVariable "FLock"; _House1DoorF == "Unlocked" and (player distance getMarkerPos "House1DoorF" <= 2) and (House1 animationPhase "FrontDoor" == 0)'];
House1DoorFCAction = player addaction ["Close Door","Scripts\Houses\HouseDoors.sqf","House1DoorFC",1,false,true,"",'_House1DoorF = House1 getVariable "FLock"; _House1DoorF == "Unlocked" and (player distance getMarkerPos "House1DoorF" <= 2) and (House1 animationPhase "FrontDoor" != 0)'];

House1DoorBOAction = player addaction ["Open Door","Scripts\Houses\HouseDoors.sqf","House1DoorBO",1,false,true,"",'_House1DoorB = House1 getVariable "BLock"; _House1DoorB == "Unlocked" and (player distance getMarkerPos "House1DoorB" <= 2) and (House1 animationPhase "BackDoor" == 0)'];
House1DoorBCAction = player addaction ["Close Door","Scripts\Houses\HouseDoors.sqf","House1DoorBC",1,false,true,"",'_House1DoorB = House1 getVariable "BLock"; _House1DoorB == "Unlocked" and (player distance getMarkerPos "House1DoorB" <= 2) and (House1 animationPhase "BackDoor" != 0)'];

House1DoorFLAction = player addaction ["Lock Door","Scripts\Houses\HouseDoors.sqf","House1DoorFL",1,false,true,"",'_House1Owner = House1 getVariable "Owner"; _House1DoorF = House1 getVariable "FLock"; _House1Owner == name player and _House1DoorF == "Unlocked" and (player distance getMarkerPos "House1DoorF" <= 2) and (House1 animationPhase "FrontDoor" == 0)'];
House1DoorFULAction = player addaction ["Unlock Door","Scripts\Houses\HouseDoors.sqf","House1DoorFUL",1,false,true,"",'_House1Owner = House1 getVariable "Owner"; _House1DoorF = House1 getVariable "FLock"; _House1Owner == name player and _House1DoorF == "Locked" and (player distance getMarkerPos "House1DoorF" <= 2) and (House1 animationPhase "FrontDoor" == 0)'];

House1DoorBLAction = player addaction ["Lock Door","Scripts\Houses\HouseDoors.sqf","House1DoorBL",1,false,true,"",'_House1Owner = House1 getVariable "Owner"; _House1DoorB = House1 getVariable "BLock"; _House1Owner == name player and _House1DoorB == "Unlocked" and (player distance getMarkerPos "House1DoorB" <= 2) and (House1 animationPhase "BackDoor" == 0)'];
House1DoorBULAction = player addaction ["Unlock Door","Scripts\Houses\HouseDoors.sqf","House1DoorBUL",1,false,true,"",'_House1Owner = House1 getVariable "Owner"; _House1DoorB = House1 getVariable "BLock"; _House1Owner == name player and _House1DoorB == "Locked" and (player distance getMarkerPos "House1DoorB" <= 2) and (House1 animationPhase "BackDoor" == 0)'];



//House2
House2DoorBellAction = player addaction ["Door Bell","Scripts\Houses\HouseDoorBell.sqf","House2",1,false,true,"",'player distance getMarkerPos "House2DoorF" <= 2'];

House2BuyAction = player addaction [format["Buy House ($%1)", House2 getVariable "Price"],"Scripts\Houses\HouseBuy.sqf",House2,1,false,true,"",'_House2Owner = House2 getVariable "Owner"; (_House2Owner == "None" and _House2Owner != name player) and (player distance getMarkerPos "House2DoorF" <= 2)'];
House2SellAction = player addaction [format["Sell House ($%1)", House2 getVariable "Price"],"Scripts\Houses\HouseSell.sqf",House2,1,false,true,"",'_House2Owner = House2 getVariable "Owner"; _House2Owner == name player and (player distance getMarkerPos "House2DoorF" <= 2)'];

House2DoorFOAction = player addaction ["Open Door","Scripts\Houses\HouseDoors.sqf","House2DoorFO",1,false,true,"",'_House2DoorF = House2 getVariable "FLock"; _House2DoorF == "Unlocked" and (player distance getMarkerPos "House2DoorF" <= 2) and (House2 animationPhase "FrontDoor" == 0)'];
House2DoorFCAction = player addaction ["Close Door","Scripts\Houses\HouseDoors.sqf","House2DoorFC",1,false,true,"",'_House2DoorF = House2 getVariable "FLock"; _House2DoorF == "Unlocked" and (player distance getMarkerPos "House2DoorF" <= 2) and (House2 animationPhase "FrontDoor" != 0)'];

House2DoorFLAction = player addaction ["Lock Door","Scripts\Houses\HouseDoors.sqf","House2DoorFL",1,false,true,"",'_House2Owner = House2 getVariable "Owner"; _House2DoorF = House2 getVariable "FLock"; _House2Owner == name player and _House2DoorF == "Unlocked" and (player distance getMarkerPos "House2DoorF" <= 2) and (House2 animationPhase "FrontDoor" == 0)'];
House2DoorFULAction = player addaction ["Unlock Door","Scripts\Houses\HouseDoors.sqf","House2DoorFUL",1,false,true,"",'_House2Owner = House2 getVariable "Owner"; _House2DoorF = House2 getVariable "FLock"; _House2Owner == name player and _House2DoorF == "Locked" and (player distance getMarkerPos "House2DoorF" <= 2) and (House2 animationPhase "FrontDoor" == 0)'];



//House3
House3DoorBellAction = player addaction ["Door Bell","Scripts\Houses\HouseDoorBell.sqf","House3",1,false,true,"",'player distance getMarkerPos "House3DoorF" <= 2'];

House3BuyAction = player addaction [format["Buy House ($%1)", House3 getVariable "Price"],"Scripts\Houses\HouseBuy.sqf",House3,1,false,true,"",'_House3Owner = House3 getVariable "Owner"; (_House3Owner == "None" and _House3Owner != name player) and (player distance getMarkerPos "House3DoorF" <= 2)'];
House3SellAction = player addaction [format["Sell House ($%1)", House3 getVariable "Price"],"Scripts\Houses\HouseSell.sqf",House3,1,false,true,"",'_House3Owner = House3 getVariable "Owner"; _House3Owner == name player and (player distance getMarkerPos "House3DoorF" <= 2)'];

House3DoorFOAction = player addaction ["Open Door","Scripts\Houses\HouseDoors.sqf","House3DoorFO",1,false,true,"",'_House3DoorF = House3 getVariable "FLock"; _House3DoorF == "Unlocked" and (player distance getMarkerPos "House3DoorF" <= 2) and (House3 animationPhase "FrontDoor" == 0)'];
House3DoorFCAction = player addaction ["Close Door","Scripts\Houses\HouseDoors.sqf","House3DoorFC",1,false,true,"",'_House3DoorF = House3 getVariable "FLock"; _House3DoorF == "Unlocked" and (player distance getMarkerPos "House3DoorF" <= 2) and (House3 animationPhase "FrontDoor" != 0)'];

House3DoorFLAction = player addaction ["Lock Door","Scripts\Houses\HouseDoors.sqf","House3DoorFL",1,false,true,"",'_House3Owner = House3 getVariable "Owner"; _House3DoorF = House3 getVariable "FLock"; _House3Owner == name player and _House3DoorF == "Unlocked" and (player distance getMarkerPos "House3DoorF" <= 2) and (House3 animationPhase "FrontDoor" == 0)'];
House3DoorFULAction = player addaction ["Unlock Door","Scripts\Houses\HouseDoors.sqf","House3DoorFUL",1,false,true,"",'_House3Owner = House3 getVariable "Owner"; _House3DoorF = House3 getVariable "FLock"; _House3Owner == name player and _House3DoorF == "Locked" and (player distance getMarkerPos "House3DoorF" <= 2) and (House3 animationPhase "FrontDoor" == 0)'];



//House4
House4DoorBellAction = player addaction ["Door Bell","Scripts\Houses\HouseDoorBell.sqf","House4",1,false,true,"",'player distance getMarkerPos "House4DoorF" <= 2'];

House4BuyAction = player addaction [format["Buy House ($%1)", House4 getVariable "Price"],"Scripts\Houses\HouseBuy.sqf",House4,1,false,true,"",'_House4Owner = House4 getVariable "Owner"; (_House4Owner == "None" and _House4Owner != name player) and (player distance getMarkerPos "House4DoorF" <= 2)'];
House4SellAction = player addaction [format["Sell House ($%1)", House4 getVariable "Price"],"Scripts\Houses\HouseSell.sqf",House4,1,false,true,"",'_House4Owner = House4 getVariable "Owner"; _House4Owner == name player and (player distance getMarkerPos "House4DoorF" <= 2)'];

House4DoorFOAction = player addaction ["Open Door","Scripts\Houses\HouseDoors.sqf","House4DoorFO",1,false,true,"",'_House4DoorF = House4 getVariable "FLock"; _House4DoorF == "Unlocked" and (player distance getMarkerPos "House4DoorF" <= 2) and (House4 animationPhase "FrontDoor" == 0)'];
House4DoorFCAction = player addaction ["Close Door","Scripts\Houses\HouseDoors.sqf","House4DoorFC",1,false,true,"",'_House4DoorF = House4 getVariable "FLock"; _House4DoorF == "Unlocked" and (player distance getMarkerPos "House4DoorF" <= 2) and (House4 animationPhase "FrontDoor" != 0)'];

House4DoorFLAction = player addaction ["Lock Door","Scripts\Houses\HouseDoors.sqf","House4DoorFL",1,false,true,"",'_House4Owner = House4 getVariable "Owner"; _House4DoorF = House4 getVariable "FLock"; _House4Owner == name player and _House4DoorF == "Unlocked" and (player distance getMarkerPos "House4DoorF" <= 2) and (House4 animationPhase "FrontDoor" == 0)'];
House4DoorFULAction = player addaction ["Unlock Door","Scripts\Houses\HouseDoors.sqf","House4DoorFUL",1,false,true,"",'_House4Owner = House4 getVariable "Owner"; _House4DoorF = House4 getVariable "FLock"; _House4Owner == name player and _House4DoorF == "Locked" and (player distance getMarkerPos "House4DoorF" <= 2) and (House4 animationPhase "FrontDoor" == 0)'];



//House5
House5DoorBellAction = player addaction ["Door Bell","Scripts\Houses\HouseDoorBell.sqf","House5",1,false,true,"",'player distance getMarkerPos "House5DoorF" <= 2'];

House5BuyAction = player addaction [format["Buy House ($%1)", House5 getVariable "Price"],"Scripts\Houses\HouseBuy.sqf",House5,1,false,true,"",'_House5Owner = House5 getVariable "Owner"; (_House5Owner == "None" and _House5Owner != name player) and (player distance getMarkerPos "House5DoorF" <= 2)'];
House5SellAction = player addaction [format["Sell House ($%1)", House5 getVariable "Price"],"Scripts\Houses\HouseSell.sqf",House5,1,false,true,"",'_House5Owner = House5 getVariable "Owner"; _House5Owner == name player and (player distance getMarkerPos "House5DoorF" <= 2)'];

House5DoorFOAction = player addaction ["Open Door","Scripts\Houses\HouseDoors.sqf","House5DoorFO",1,false,true,"",'_House5DoorF = House5 getVariable "FLock"; _House5DoorF == "Unlocked" and (player distance getMarkerPos "House5DoorF" <= 2) and (House5 animationPhase "FrontDoor" == 0)'];
House5DoorFCAction = player addaction ["Close Door","Scripts\Houses\HouseDoors.sqf","House5DoorFC",1,false,true,"",'_House5DoorF = House5 getVariable "FLock"; _House5DoorF == "Unlocked" and (player distance getMarkerPos "House5DoorF" <= 2) and (House5 animationPhase "FrontDoor" != 0)'];

House5DoorFLAction = player addaction ["Lock Door","Scripts\Houses\HouseDoors.sqf","House5DoorFL",1,false,true,"",'_House5Owner = House5 getVariable "Owner"; _House5DoorF = House5 getVariable "FLock"; _House5Owner == name player and _House5DoorF == "Unlocked" and (player distance getMarkerPos "House5DoorF" <= 2) and (House5 animationPhase "FrontDoor" == 0)'];
House5DoorFULAction = player addaction ["Unlock Door","Scripts\Houses\HouseDoors.sqf","House5DoorFUL",1,false,true,"",'_House5Owner = House5 getVariable "Owner"; _House5DoorF = House5 getVariable "FLock"; _House5Owner == name player and _House5DoorF == "Locked" and (player distance getMarkerPos "House5DoorF" <= 2) and (House5 animationPhase "FrontDoor" == 0)'];



//House6
House6DoorBellAction = player addaction ["Door Bell","Scripts\Houses\HouseDoorBell.sqf","House6",1,false,true,"",'player distance getMarkerPos "House6DoorF" <= 2'];

House6BuyAction = player addaction [format["Buy House ($%1)", House6 getVariable "Price"],"Scripts\Houses\HouseBuy.sqf",House6,1,false,true,"",'_House6Owner = House6 getVariable "Owner"; (_House6Owner == "None" and _House6Owner != name player) and (player distance getMarkerPos "House6DoorF" <= 2)'];
House6SellAction = player addaction [format["Sell House ($%1)", House6 getVariable "Price"],"Scripts\Houses\HouseSell.sqf",House6,1,false,true,"",'_House6Owner = House6 getVariable "Owner"; _House6Owner == name player and (player distance getMarkerPos "House6DoorF" <= 2)'];

House6DoorFOAction = player addaction ["Open Door","Scripts\Houses\HouseDoors.sqf","House6DoorFO",1,false,true,"",'_House6DoorF = House6 getVariable "FLock"; _House6DoorF == "Unlocked" and (player distance getMarkerPos "House6DoorF" <= 2) and (House6 animationPhase "FrontDoor" == 0)'];
House6DoorFCAction = player addaction ["Close Door","Scripts\Houses\HouseDoors.sqf","House6DoorFC",1,false,true,"",'_House6DoorF = House6 getVariable "FLock"; _House6DoorF == "Unlocked" and (player distance getMarkerPos "House6DoorF" <= 2) and (House6 animationPhase "FrontDoor" != 0)'];

House6DoorBOAction = player addaction ["Open Door","Scripts\Houses\HouseDoors.sqf","House6DoorBO",1,false,true,"",'_House6DoorB = House6 getVariable "BLock"; _House6DoorB == "Unlocked" and (player distance getMarkerPos "House6DoorB" <= 2) and (House6 animationPhase "BackDoor" == 0)'];
House6DoorBCAction = player addaction ["Close Door","Scripts\Houses\HouseDoors.sqf","House6DoorBC",1,false,true,"",'_House6DoorB = House6 getVariable "BLock"; _House6DoorB == "Unlocked" and (player distance getMarkerPos "House6DoorB" <= 2) and (House6 animationPhase "BackDoor" != 0)'];

House6DoorFLAction = player addaction ["Lock Door","Scripts\Houses\HouseDoors.sqf","House6DoorFL",1,false,true,"",'_House6Owner = House6 getVariable "Owner"; _House6DoorF = House6 getVariable "FLock"; _House6Owner == name player and _House6DoorF == "Unlocked" and (player distance getMarkerPos "House6DoorF" <= 2) and (House6 animationPhase "FrontDoor" == 0)'];
House6DoorFULAction = player addaction ["Unlock Door","Scripts\Houses\HouseDoors.sqf","House6DoorFUL",1,false,true,"",'_House6Owner = House6 getVariable "Owner"; _House6DoorF = House6 getVariable "FLock"; _House6Owner == name player and _House6DoorF == "Locked" and (player distance getMarkerPos "House6DoorF" <= 2) and (House6 animationPhase "FrontDoor" == 0)'];

House6DoorBLAction = player addaction ["Lock Door","Scripts\Houses\HouseDoors.sqf","House6DoorBL",1,false,true,"",'_House6Owner = House6 getVariable "Owner"; _House6DoorB = House6 getVariable "BLock"; _House6Owner == name player and _House6DoorB == "Unlocked" and (player distance getMarkerPos "House6DoorB" <= 2) and (House6 animationPhase "BackDoor" == 0)'];
House6DoorBULAction = player addaction ["Unlock Door","Scripts\Houses\HouseDoors.sqf","House6DoorBUL",1,false,true,"",'_House6Owner = House6 getVariable "Owner"; _House6DoorB = House6 getVariable "BLock"; _House6Owner == name player and _House6DoorB == "Locked" and (player distance getMarkerPos "House6DoorB" <= 2) and (House6 animationPhase "BackDoor" == 0)'];