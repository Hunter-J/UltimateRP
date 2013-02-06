// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// ID, Object, Producables, Owners, Box, In-Use, Price, Equipment, Licenses, Skills, Capacity, String ID, Markers
// Producables:
//   [itemid, minstock, curstock, maxstock]

RPM_FactoryArray = [
    // Distillery
    [0,[npc_distillery, [
        [516, 1, 100],
		[517, 1, 100]
    ], [], objNull, [], objNull, 1500, [], [], [], 100, 76, "v320"]],
    
	// Food Factory
    [1,[npc_factory_food, [
		[519, 1, 100],
		[520, 1, 100]
    ], [], objNull, [], objNull, 750, [], [], [], 100, 77, "v321"]],
    
	// Item Factory
    [2,[npc_factory_item, [
        [550,0,100],
		[552,0,100],
		[572,0,100],
		[505,0,100],
        [510,0,100],
		[511,1,100],
        [512,1,100],
        [514,1,100],
		[565,1,100],
		[567,1,100],
		[568,1,100]
    ], [], box_factory_item, [], objNull, 1750, [], [], [], 100, 78, "v322"]],
   
   // Resource Factory
    [3,[npc_factory_resource, [
		[529,1,100],
		[525,1,100],
		[541,1,100],
		[542,1,100],
		[545,1,100],
		[546,1,100]
    ], [], objNull, [], objNull, 2000, [], [], [], 100, 79, "v323"]]
];