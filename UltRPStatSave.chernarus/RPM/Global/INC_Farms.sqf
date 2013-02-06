// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// ID, Type, Marker/Object, Distance, [Equipment], [Seed, Cur, Max], Capacity, In-Use, Owner, Workers, Price
// Equipment ([itemtype, itemid])
RPM_FarmArray0 = [
    [0,  0, "field_cotton",      110, [], [337, 0, 25], 0,     "None"],
    [1,  0, "field_hops",        90, [], [338, 0, 25], 0,     "None"],
    [2,  0, "field_potatoes",    100, [],               [341, 0, 25], 0,     "None"],
    [3,  0, "field_rye",         150, [], [342, 0, 25], 0,     "None"],
    [4,  0, "fishingarea1",      200, [],               [],           50000, "None"],
    [5,  0, "fishingarea2",      200, [],               [],           50000, "None"],
    [6,  0, "fishingarea3",      200, [],               [],           50000, "None"]
];
RPM_FarmArray1 = [
    // Drugs [Replaced With drugs.sqf]
    [7,  1, "field_coca",        24,  [],               -1,       "", "None", [], 0],
    [8,  1, "field_marijuana",   80,  [],               -1,       "", "None", [], 0],
    [9,  1, "field_poppies",     70,  [],               -1,       "", "None", [], 0],
    // Mines
    [10, 1, "mine_coal",         10, [],               500000,   "", "None", [], 100],
    [11, 1, "mine_copper",       10,  [],               500000,   "", "None", [], 100],
    [12, 1, "mine_iron",         10, [],               500000,   "", "None", [], 100],
    [13, 1, "mine_lead",         10,  [],               500000,   "", "None", [], 100],
    [14, 1, "mine_sand",         10, [],               500000,   "", "None", [], 100],
    [15, 1, "mine_sulfur",       10, [],               500000,   "", "None", [], 100],
    [16, 1, "oilwell",           10,  [],               500000,   "", "None", [], 100],
    [17, 1, "woodcutterscamp1",  10, [],               500000,   "", "None", [], 0],
    [18, 1, "woodcutterscamp2",  10, [],               500000,   "", "None", [], 0]
];
RPM_FarmsArray = RPM_FarmArray0 + RPM_FarmArray1;
