_Selection = _this select 3;

//House1
//Open/Close
if (_Selection == "House1DoorFO") then {
	House1 animate ["FrontDoor",1];
	[House1, 'FrontDoor_AP', 'MBG_B3_OpenDoor',4,(House1)] execvm 'MBG_Buildings_3\MPSound.sqf';
};
if (_Selection == "House1DoorFC") then {
	House1 animate ["FrontDoor",0];
	[House1, 'CloseDoor_AP', 'MBG_B3_CloseDoor',4,(House1)] execvm 'MBG_Buildings_3\MPSound.sqf';
};

if (_Selection == "House1DoorBO") then {
	House1 animate ["BackDoor",1];
	[House1, 'BackDoor_AP', 'MBG_B3_OpenDoor',4,(House1)] execvm 'MBG_Buildings_3\MPSound.sqf';
};
if (_Selection == "House1DoorBC") then {
	House1 animate ["BackDoor",0];
	[House1, 'CloseDoor_AP', 'MBG_B3_CloseDoor',4,(House1)] execvm 'MBG_Buildings_3\MPSound.sqf';
};


//Lock
if (_Selection == "House1DoorFL") then {
	House1 setVariable ["FLock", "Locked", true];
};
if (_Selection == "House1DoorFUL") then {
	House1 setVariable ["FLock", "Unlocked", true];
};

if (_Selection == "House1DoorBL") then {
	House1 setVariable ["BLock", "Locked", true];
};
if (_Selection == "House1DoorBUL") then {
	House1 setVariable ["BLock", "Unlocked", true];
};



//House2
//Open/Close
if (_Selection == "House2DoorFO") then {
	House2 animate ["FrontDoor",1];
	[House2, 'FrontDoor_AP', 'MBG_B3_OpenDoor',4,(House2)] execvm 'MBG_Buildings_3\MPSound.sqf';
};
if (_Selection == "House2DoorFC") then {
	House2 animate ["FrontDoor",0];
	[House2, 'CloseDoor_AP', 'MBG_B3_CloseDoor',4,(House2)] execvm 'MBG_Buildings_3\MPSound.sqf';
};

//Lock
if (_Selection == "House2DoorFL") then {
	House2 setVariable ["FLock", "Locked", true];
};
if (_Selection == "House2DoorFUL") then {
	House2 setVariable ["FLock", "Unlocked", true];
};



//House3
//Open/Close
if (_Selection == "House3DoorFO") then {
	House3 animate ["FrontDoor",1];
	[House3, 'FrontDoor_AP', 'MBG_B3_OpenDoor',4,(House3)] execvm 'MBG_Buildings_3\MPSound.sqf';
};
if (_Selection == "House3DoorFC") then {
	House3 animate ["FrontDoor",0];
	[House3, 'CloseDoor_AP', 'MBG_B3_CloseDoor',4,(House3)] execvm 'MBG_Buildings_3\MPSound.sqf';
};

//Lock
if (_Selection == "House3DoorFL") then {
	House3 setVariable ["FLock", "Locked", true];
};
if (_Selection == "House3DoorFUL") then {
	House3 setVariable ["FLock", "Unlocked", true];
};



//House4
//Open/Close
if (_Selection == "House4DoorFO") then {
	House4 animate ["FrontDoor",1];
	[House4, 'FrontDoor_AP', 'MBG_B3_OpenDoor',4,(House4)] execvm 'MBG_Buildings_3\MPSound.sqf';
};
if (_Selection == "House4DoorFC") then {
	House4 animate ["FrontDoor",0];
	[House4, 'CloseDoor_AP', 'MBG_B3_CloseDoor',4,(House4)] execvm 'MBG_Buildings_3\MPSound.sqf';
};

//Lock
if (_Selection == "House4DoorFL") then {
	House4 setVariable ["FLock", "Locked", true];
};
if (_Selection == "House4DoorFUL") then {
	House4 setVariable ["FLock", "Unlocked", true];
};



//House5
//Open/Close
if (_Selection == "House5DoorFO") then {
	House5 animate ["FrontDoor",1];
	[House5, 'FrontDoor_AP', 'MBG_B3_OpenDoor',4,(House5)] execvm 'MBG_Buildings_3\MPSound.sqf';
};
if (_Selection == "House5DoorFC") then {
	House5 animate ["FrontDoor",0];
	[House5, 'CloseDoor_AP', 'MBG_B3_CloseDoor',4,(House5)] execvm 'MBG_Buildings_3\MPSound.sqf';
};

//Lock
if (_Selection == "House5DoorFL") then {
	House5 setVariable ["FLock", "Locked", true];
};
if (_Selection == "House5DoorFUL") then {
	House5 setVariable ["FLock", "Unlocked", true];
};



//House6
//Open/Close
if (_Selection == "House6DoorFO") then {
	House6 animate ["FrontDoor",1];
	[House6, 'FrontDoor_AP', 'MBG_B3_OpenDoor',4,(House6)] execvm 'MBG_Buildings_3\MPSound.sqf';
};
if (_Selection == "House6DoorFC") then {
	House6 animate ["FrontDoor",0];
	[House6, 'CloseDoor_AP', 'MBG_B3_CloseDoor',4,(House6)] execvm 'MBG_Buildings_3\MPSound.sqf';
};

if (_Selection == "House6DoorBO") then {
	House6 animate ["BackDoor",1];
	[House6, 'BackDoor_AP', 'MBG_B3_OpenDoor',4,(House6)] execvm 'MBG_Buildings_3\MPSound.sqf';
};
if (_Selection == "House6DoorBC") then {
	House6 animate ["BackDoor",0];
	[House6, 'CloseDoor_AP', 'MBG_B3_CloseDoor',4,(House6)] execvm 'MBG_Buildings_3\MPSound.sqf';
};


//Lock
if (_Selection == "House6DoorFL") then {
	House6 setVariable ["FLock", "Locked", true];
};
if (_Selection == "House6DoorFUL") then {
	House6 setVariable ["FLock", "Unlocked", true];
};

if (_Selection == "House6DoorBL") then {
	House6 setVariable ["BLock", "Locked", true];
};
if (_Selection == "House6DoorBUL") then {
	House6 setVariable ["BLock", "Unlocked", true];
};