// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

// Core Variables
RPM_Client = false;
RPM_Server = false;
RPM_JIP = false;
RPM_RoleNumber = 0;
CivsCount = 40;
CopsCount = 20;
PlayerCount = 60;
RPM_Civ = false;
RPM_Cop = false;
// Enables big bank balance, Teleport and file launching
RPM_Debug = false; // CHANGE BEFORE RELEASE
// Used by server for session saving
RPM_LastSave = 0;
RPM_Saving_C_LoopActive = false;
RPM_Saving_S_LoopActive = false;
// Is save debug on?
RPM_Saving_Debug = true;
// Was banking saved?
RPM_Saving_BankSaved = false;
// Was licenses saved?
RPM_Saving_LicensesSaved = false;
// Was storage saved?
RPM_Saving_StorageSaved = false;
// Was skills saved?
RPM_Saving_SkillsSaved = false;
// Are we loading (Server)?
RPM_Saving_Loading = false;
// Are we loaded (Client)?
RPM_Saving_Loaded = false;
// Are we loaded (Client)?
RPM_Saving_LoadedClient = false;
// Are we loading (Client)?
RPM_Saving_LoadingClient = false;
// Are we saving?
RPM_Saving_Saving = false;
// Time between each save loop (300 seconds)
RPM_Saving_Interval = 300;
// Shall we use new stats?
RPM_Saving_NewStatsActive = true;
// 0 = Pipes, 1 = ARMA2Net
RPM_Saving_System = 1;
// Used for web statistics and administrators (Console log)
RPM_Diagnostics = true;
// Bank (Cash balance)
i4 = 500;
// Current time (Local)
i20 = date;
// Server time (Current time, broadcasted)
i25 = 0;
// Last statsave time (Seconds) - For client stats gui
i26 = 0;
// Max vehicle idle time (Seconds)
RPM_VehicleIdleTime = 180;
// Vehicle idle marker array
RPM_VehicleIdleMarkers = [];
// Skills array (Don't touch!)
RPM_SkillsArray = [];
// Maximum skill points
RPM_SkillPointsLimit = 300;

// Arrays
// Are we jailed? (?)
a0 = [false, 0, 0];
// Stun weapons (BIS class strings)
a1 = ["x26"];
// Illegals/non-restorables (Cop) (ItemIDs)
a2 = [267, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 284, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 343, 344, 346];
// Animations (Action name, BIS action string)
a3 = [
    ["Hands Up", "amovpercmstpssurwnondnon", 0],
    ["Normal", "Normal", 1],
    ["Sit and Smoke", "AmovPsitMstpSlowWrflDnon_Smoking", 0],
    ["Check Vehicle", "AmovPercMstpSnonWnonDnon_carCheckWheel", 0],
    ["Push Vehicle", "AmovPercMstpSnonWnonDnon_carCheckPush", 0],
    ["Clean Vehicle", "AmovPercMstpSnonWnonDnon_carCheckWash", 0]
];
// "Control" Areas (NPC, Anchor Marker, Group?, Active, Marker, ?, Spawn(s)
a4 = [
    [npc_ctrlarea1, "ctrlarea1", "", objNull, "marker_ctrlarea1", "", ["ctrlarea1_sp1", "ctrlarea1_sp2", "ctrlarea1_sp3"]],
    [npc_ctrlarea2, "ctrlarea2", "", objNull, "marker_ctrlarea2", "", ["ctrlarea2_sp1", "ctrlarea2_sp2", "ctrlarea2_sp3"]]
];
// Bombs (Don't touch!)
a5 = [];
// Cargo Boxes (For post-init stuff)
a6 = [
    box_shop_blackmarket,
    box_shop_item,
    box_shop_police,
    box_shop_weapons,
    box_ctrlarea1,
    box_ctrlarea2
];
// Crimelog (Don't touch!)
a7 = [];
// Crimelog Types (String)
a8 = [
    "Attempted Murder",
    "Murder",
    "Mass Murder (3+)",
    "Property Damage",
    "Aggravated Property Damage",
    "Drug Dealing/Smuggling",
    "Bank Robbery",
    "Armed Robbery/Car Theft",
    "Jailbreak",
    "Dangerous Driving",
    "Weapon Possession",
    "Evading",
    "Tax Evasion",
    "Other"
];
// Delivery (NPC, Delivery Point(s))
a9 = [
    [npc_getjob1, [[dp1, "mark_dp1", format[localize "STRM_DP1"]], [dp2, "mark_dp2", format[localize "STRM_DP2"]], [dp3, "mark_dp3", format[localize "STRM_DP3"]], [dp4, "mark_dp4", format[localize "STRM_DP4"]]]]
];
// Factory storages "Allow" array (FactoryID, ItemID(s))
a10 = [
    [0, [323, 322, 315, 313, 521]],
    [1, [296, 323, 521]],
    [2, [307, 308, 310, 313, 316, 317, 318, 319, 320, 324, 325, 326, 327, 328, 344, 521]],
    [3, [307, 308, 310, 313, 316, 317, 318, 319, 320, 324, 325, 326, 327, 328, 344, 521]],
    [4, [307, 308, 310, 313, 316, 317, 318, 319, 320, 324, 325, 326, 327, 328, 344, 521]],
    [5, [307, 308, 310, 313, 316, 317, 318, 319, 320, 324, 325, 326, 327, 328, 344, 521]],
    [6, [307, 308, 310, 313, 316, 317, 318, 319, 320, 324, 325, 326, 327, 328, 344, 521]],
    [7, [307, 308, 310, 313, 316, 317, 318, 319, 320, 324, 325, 326, 327, 328, 344, 521]],
    [8, [307, 308, 310, 313, 316, 317, 318, 319, 320, 324, 325, 326, 327, 328, 344, 521]],
    [9, [307, 308, 310, 313, 316, 317, 318, 319, 320, 324, 325, 326, 327, 328, 344, 521]],
    [10, [307, 308, 310, 313, 316, 317, 318, 319, 320, 324, 325, 326, 327, 328, 344, 521]],
    [11, []]		
];
// Factory queue (Don't touch!)
a11 = [];
// ??
a12 = [];
// Factory storage (Don't touch!)
a13 = [];
// Factory storage capacity (FactoryID, Capacity (KG))
a14 = [
    [0,  [10000]],
    [1,  [10000]],
    [2,  [10000]],
    [3,  [100000]],
    [4,  [10000]],
    [5,  [10000]],
    [6,  [10000]],
    [7,  [10000]],
    [8,  [10000]],
    [9,  [10000]],
    [10, [10000]],
    [11, [10000]]
];
// Groups (Don't touch!)
a15 = [];
// Impound Spawns (Where the vehicle goes)
a16 = ["impoundlot_sp1", "impoundlot_sp2", "impoundlot_sp3"];
// Player Bombs (Don't touch)
a18 = [];
// Inventory (Don't touch!)
a19 = [];
// Player Keychain (Don't touch!)
a20 = [];
// Last farm position (Used by farms logic)
a21 = [];
// Licenses (Don't touch!)
a22 = [];
// Big Rounds (BIS class string(s))
a25 = ["MAAWS_HEAT", "MAAWS_HEDP", "6Rnd_HE_M203", "6Rnd_FlareWhite_M203", "6Rnd_FlareGreen_M203", "6Rnd_FlareRed_M203", "6Rnd_FlareYellow_M203", "6Rnd_Smoke_M203", "6Rnd_SmokeRed_M203", "6Rnd_SmokeGreen_M203", "6Rnd_SmokeYellow_M203", "SMAW_HEAA", "SMAW_HEDP", "PG7V", "PG7VL", "PG7VR", "OG7", "100Rnd_556x45_BetaCMag", "100Rnd_556x45_M249", "100Rnd_762x51_M240", "200Rnd_556x45_M249"];
// Launchers (BIS class string(s))
a26 = ["AT13", "Dragon_EP1", "Igla", "Javelin", "M136", "RPG18", "Stinger", "Strela"];
// Rifle Mags (BIS class string(s))
a27 = ["10Rnd_127x99_m107", "10Rnd_762x54_SVD", "10Rnd_9x39_SP5_VSS", "20Rnd_556x45_Stanag", "20Rnd_762x51_DMR", "20Rnd_9x39_SP5_VSS", "30Rnd_556x45_G36", "30Rnd_556x45_G36SD", "30Rnd_556x45_Stanag", "30Rnd_556x45_StanagSD", "5Rnd_127x108_KSVK", "5Rnd_762x51_M24", "5x_22_LR_17_HMR", "8Rnd_B_Beneli_74Slug", "8Rnd_B_Saiga12_74Slug"];
// Small Mags (BIS class string(s))
a28 = ["7Rnd_45ACP_1911", "15Rnd_9x19_M9", "15Rnd_9x19_M9SD", "8Rnd_9x18_Makarov", "8Rnd_9x18_MakarovSD", "20Rnd_B_765x17_Ball", "10Rnd_B_765x17_Ball", "30Rnd_9x19_UZI", "30Rnd_9x19_UZI_SD", "30Rnd_9x19_MP5", "30Rnd_9x19_MP5SD", "17Rnd_9x19_glock17", "6Rnd_45ACP", "1Rnd_HE_M203", "FlareWhite_M203", "FlareGreen_M203", "FlareRed_M203", "FlareYellow_M203", "1Rnd_Smoke_M203", "1Rnd_SmokeRed_M203", "1Rnd_SmokeGreen_M203", "1Rnd_SmokeYellow_M203"];
// Messages that can be disabled in list (Identifier, Variable)
RPM_MessagesArray = [
    ["Paycheck", "RPM_Msg_Paycheck"]
];
// Non-lethals (BIS class string(s))
a30 = ["Binocular", "NVGoggles", "ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS", "8Rnd_B_Beneli_74Slug"];
// Non-motorized Bikes (BIS class string(s))
a31 = ["Old_bike_TK_CIV_EP1", "MMT_Civ", "MMT_USMC"];
// Non-sellable gear (BIS class string(s))
a32 = ["ItemCompass", "ItemMap", "ItemRadio", "ItemWatch"];
// Non-sellable items (ItemIDs)
a33 = [521];
// (Per) Factory queue by-factory "modulation" (FactoryID, (Multiplier, base * value)) (0=Weps,1=Mags,2=Vehs,3=Items,4=Units)
a34 = [
    [0,  [1, 1, 2, 1]],
    [1,  [1, 1, 2, 1]],
    [2,  [1, 1, 2, 1]],
    [3,  [1, 1, 2, 1]],
    [4,  [4, 4, 4, 4]],
    [5,  [1, 1, 2, 1]],
    [6,  [1, 1, 2, 1]],
    [7,  [1, 1, 2, 1]],
    [8,  [3, 1, 2, 1]],
    [9,  [2, 1, 2, 1]],
    [10, [1, 1, 2, 1]],
    [11, [1, 1, 2, 1]]
];
// (Global) Factory queue by-type "modulation" (Multiplier, base * value) (0=Weps,1=Mags,2=Vehs,3=Items,4=Units)
a35 = [1, 1, 2, 3];
// Save array (Unused)
a36 = [];
// Server Keychain (Don't touch!)
a37 = [];
// Shops Objects (For post-init uses)
a38 = [
    npc_market,
	npc_market2,
	
	npc_petrol1,
	npc_petrol2,
	npc_petrol3,
	npc_petrol4,
	npc_petrol5,
	npc_petrol6,
	
	npc_shop_item,
	
	npc_shop_air1,
	npc_shop_air2,
	npc_shop_air3,
	npc_shop_air4,
	npc_shop_air5,
	npc_shop_air6,
	npc_shop_air7,
	npc_shop_air8,
	npc_shop_air9,
	npc_shop_air10,
	npc_shop_air11,
	npc_shop_air12,
	
	npc_shop_boat,
	npc_shop_boat2,
	
	npc_shop_usedcars,
	npc_shop_amercars,
	npc_shop_japcars,
	npc_shop_eurocars,
	npc_shop_execcars,
	
	npc_shop_bike1,
	npc_shop_bike2,
	npc_shop_bike3,
	npc_shop_quad,
	
	npc_shop_pickup,
	npc_shop_truck,
	
	npc_shop_weapons,
	npc_shop_blackmarket,
	npc_shop_hunting,
	
	mdrugsell,
	cdrugsell,
	methsell,
	
	PDGear,
	PDEquipment,
	PDHelis,
	PDBikes,
	PDUCCars,
	PDK9Cars,
	PDCars,
	
	FDEquipment,
	FDCars,
	FDHelis
];
// Impounded Vehicles (Used by loops and gui)
a39 = [];
// Storage Spawns (NPC, Spawnpoint(s))
a42 = [
    [npc_storage_civ, ["storage_civ_sp1", "storage_civ_sp2", "storage_civ_sp3"]],
    [npc_ctrlarea1, ["ctrlarea1_sp1", "ctrlarea1_sp2", "ctrlarea1_sp3"]],
    [npc_ctrlarea2, ["ctrlarea2_sp1", "ctrlarea2_sp2", "ctrlarea2_sp3"]]
];
// (Valid) Stun Animations (BIS string)
a43 = [
    "AdthPercMstpSnonWnonDnon_A1",
    "AdthPercMstpSnonWnonDnon_A2",
    "AdthPercMstpSnonWnonDnon_A3",
    "AdthPercMstpSnonWnonDnon_A4",
    "AdthPercMstpSnonWnonDnon_A5",
    "adthpercmstpsraswrfldnon_r06",
    "adthpercmstpsraswrfldnon_1"
];
// Stun Mag(s) (Class strings)
a44 = ["x26_Mag"];
// Taxes (Goods, Income, Transactions, Vehicles, Weapons)
a45 = [0.05, 0.05, 0.05, 0.05, 0.05];
// Vehicles (Trucks) not needing unlock for trunk interaction
a46 = [225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241];
// ??
a47 = [];
// Farm Seeds (ItemID)
a48 = [
    [336, 1, 4, 0.15, 1, 309],
    [337, 3, 5, 0.10, 1, 311],
    [338, 4, 7, 0.06, 1, 315],
    [339, 2, 4, 0.08, 1, 276],
    [340, 1, 3, 0.12, 1, 321],
    [341, 3, 6, 0.06, 1, 322],
    [342, 4, 8, 0.04, 1, 323],
    [306, 4, 6, 0.10, 1, 296],
    [306, 4, 6, 0.10, 1, 296],
    [306, 4, 6, 0.10, 1, 296]
];
// "Saved" Array (Don't touch!)
a49 = [];
// Workplaces (Markers)
a50 = ["workplace1", "workplace2", "workplace3"];
// Delivery (Unused)
a51 = [-1, -1];
// Drug sale points (Markers)
a52 = [];
// Drug items (ItemIDs)
a53 = [274, 275, 276, 277, 278, 279, 309, 312, 321];
// Pay ticket (Used by publicVariableEventHandler)
a54 = [];
// Refuse ticket (Used by publicVariableEventHandler)
a55 = [];
// Jail spawns (Where we go)
a56 = [];
// Illegal items (ItemIDs)
a57 = [267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 284, 286, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 346];
// Player Interacts (Unused)
a58 = [];
// Ticket types (Crime, Cost)
a59 = [
    ["Speeding (5-10 MPH)", 400],
	["Speeding (11-15 MPH)", 750],
	["Speeding (16-20 MPH)", 1100],
	["Speeding (21-30 MPH)", 2500],
	["Suspended Licence", 1000],
	["Tailgating", 300],
	["Minor Traffic Violation", 500],
	["Parking Violation", 500],
	["Illegal U-Turn", 1000],
	["Failure to Yield to EMS", 5000],
	["$100 Ticket", 100],
	["$200 Ticket", 200],
	["$500 Ticket", 500],
	["$1000 Ticket", 1000],
	["$2000 Ticket", 2000],
	["$5000 Ticket", 5000],
	["$10000 Ticket", 10000],
	["$20000 Ticket", 20000]
];
// Wanted (Unused)
a60 = [];
// Income brackets (Income, Bank Balance, Percentile, Bank Rate)
a61 = [
	[100, 2000, "Poor", 0.25, 0],
	[500, 10000, "Lower Class", 0.20, 0.10],
    [1500, 25000, "Citizen", 0.15, 0.16],
    [2000, 100000, "Middle Class", 0.10, 0.18],
    [2250, 250000, "Rich Man", 0.08, 0.20],
    [2500, 500000, "Magnate", 0.05, 0.22],
    [2700, 750000, "Super Rich", 0, 0.28],
    [3000, 3000000, "Filthy Rich", 0, 0.30]
];
// Wanted (Crime, Cost, Time (Seconds))
a62 = [
	["Aiding and Abetting", 0, 1800],
	["Armed Robbery", 0, 3000], 	
    ["Arms Trafficking", 2000, 2400],
    ["Assault (Vehicular)", 500, 2400],
    ["Assualt / Mugging", 500, 1200],
	["Attempted Murder", 0, 4800],
	["Attempted Suicide", 0, 2400],
	["Driving Under the Influence (DUI)", 500, 1500],
	["Drugs (Possession)", 0, 900],
	["Drugs (Trafficking)", 0, 1800],
	["Failure to Stop", 0, 600],
	["Failure to Comply", 500, 600],
	["Filling False Reports", 500, 300],
	["Hostage taking", 0, 1200],
	["Hit And Run", 0, 1800],
	["Illegal Dealing's", 1000, 1200],
	["Illegal Pistol", 0, 1200],
	["Illegal Rifle", 0, 1800],
	["Jail Break", 0, 1800],
	["Killing A Police Dog", 0, 1800],
	["Manslaughter", 0, 3000],
	["Manslaughter (Vehicular)", 0, 4800],
	["Murder", 0, 9600],
	["Murder 3+", 0, 10800],
	["Resisting Arrest", 0, 600],
	["Theft", 0, 600],
	["Theft (Civ Vehicle)", 0, 600],
	["Theft (Police Vehicle)", 0, 1800],
	["Unholstered Weapon", 0, 900],
	["Bribing Police", 0, 900],
	["Destruction of Property", 0, 600],
	["Dangerous Driving", 0, 300],
	["1 Min.", 0, 60],
	["2 Min.", 0, 120],
	["3 Min.", 0, 180],
	["5 Min.", 0, 300],
	["10 Min.", 0, 600],
	["20 Min.", 0, 1200],
	["30 Min.", 0, 1800],
	["45 Min.", 0, 2700],
	["1 Hr.", 0, 3600],
	["2 Hr.", 0, 7200],
	["3 Hr.", 0, 10800]
];
// Jail release spawns (Where we go)
a63 = ["jail_rsp1", "jail_rsp2", "jail_rsp3"];
// Trunk sizes (Capacity (KG), Vehicle ItemID)
a64 = [
    // 0kg
    [5, [206, 207]],
    // 10kg
    [10, [205, 242, 243, 244]],
    // 200kg
    [200, [208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458]],
    // 300kg
	[300, [426, 427, 428, 429, 430, 431, 459, 460, 461, 462]],
	// 500kg
    [500, [186, 190, 194, 195, 196, 197, 201, 202, 203, 223, 224, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380]],
    // 1000kg
    [1000, [187, 188, 189, 193, 198, 199, 200]],
    // 2000kg
    [2000, [191, 192, 236, 237, 238, 239, 240, 241, 236, 237, 238, 239, 240, 241, 264, 265, 266]],
    // 3000kg
    [3000, [228, 229, 230, 231, 232, 233, 234, 235, 228, 229, 230, 231, 232, 233, 234, 235]],
    // 6000kg
    [6000, [225, 226, 227, 204]]
];
// Rules (Strings)
a66 = [
    "Server Rules and Restrictions.",
    "",
    "General Guidlines:",
    "This is a roleplay mission, all players MUST behave in a role play manner",
    "No new life rule, cops will pursue you after respawn",
    "Rules violations are punished by admins. Laws are enforced by police",
    "No insults in global chat. Roleplay insults in direct chat are alowed",
    "Refunds for losses due to kicks or disconnects are not possible",
    "",	
    "Forbidden:",
    "Deathmatch and spree killing",
    "Safe zone kills, theft and property damage",
    "Killing unarmed and unprovoking players",
    "Non-RP kills and non-RP property damage",
    "Non-RP blocking exits, flags, players",
    "Camping Civ storage and Cop base exits",	
    "Idling for more than 15 mins",
    "Switching sides to get advantages", 
    "Exploiting mission or Arma2 bugs",
    "",	
    "Cop rules:",
    "Commiting illegal actions for cops is strictly forbidden",
    "Stun gun is a must have for all the time",
    "Use lethal only in self defence. Killing unarmed player is strictly forbidden",
    "State the charge, the term and ask for objection before jail",
    "Subtract the time player had spent in handcuffs or other custody from the jail term",
    "Stay away from civ storage unless wanted player is there or en route",
    "Armed vehicles, machine guns and explosives are alowed only to SWAT",
    "Use of armed and armored vehicles is allowed only in response to the use of heavy weapons",
    "It is forbidden to give civilians any cops items, weapons and vehicles",
    "",
    "Laws and Restrictions",
    "Inside storage any weapon is allowed, as well as test shootings",
    "Machine guns, snipers, explosives, armed vehicles are illegal",
    "Weapons silencers are illegal",
    "Driving offroad is not allowed, unless for mining and farming",
    "Civilians may use weapons only in self defence",
    "",
    "Definition of Crimes and Violations:",
    "Murder - killing a player",
    "Mass Murder - killing more than 3 player",
    "Attempted Murder - an attempt to kill a player",
    "Jailbreak - escaping police custody",
    "Property Damage - damaging or destroying other's property",
    "Aggravated Property Damage - damaging or destroying other's property in excess of 100k",
    "Weapon Possession - possession of illegal weapon or with no valid licence",
    "Bank Robbery - robbing a bank or assisting",
    "Car Theft/Robbery - stealing a car or robbing a man",
    "Dangerous Driving - driving dangerously",
    "Disrespecting Cops - chat insults towards cops",
    "Drug Dealing/Smuggling - selling or possessing drugs/weapons",
    "Evading - not stoping at the request of the police (more than 1 minute)",
    "Fleeing - escaping from police officer, failure to pay fine",
    "Terror Camp Entry - entering a terrorists camp",
    "Terrorism - deliberately targeting on police and government force due to political views, more than 3 kills",
    "Other - minor offences"
];
// Welcome/intros (CSV stringname)
a67 = [
    "STRM_Welcome1",
    "STRM_Welcome2",
    "STRM_Welcome3",
    "STRM_Welcome4",
    "STRM_Welcome5",
    "STRM_Welcome6",
    "STRM_Welcome7",
    "STRM_Welcome8"
];
// Storage Capacities ([NPC, [Kilograms]])
a73 = [
    [npc_storage_civ, [100000]],
	[npc_storage_cop, [100000]],
    [npc_ctrlarea1, [10000]],
    [npc_ctrlarea2, [10000]]
];
RPM_Person_CivActionsAdded = [];
RPM_Person_GlobalActionsAdded = [];
RPM_Person_InteractsAdded = [];
RPM_NPC_CivActionsAdded = [];
RPM_NPC_CopActionsAdded = [];
RPM_NPC_GlobalActionsAdded = [];
// Briefing
// [PageName, Page Title, Side (0=Global,1=Civ,2=Cop), [Subject, [Message]]]
RPM_Diary = [
    ["rules", 'Rules', 0, [
        ['READ FIRST!', '<br/>Major Rules:<br/> -Do not kill unarmed players, unless they provoke you;<br/>-Don not kill, rob or destroy vehicles in DMZ areas(Green circles)<br/><br/>A single break of these rules will lead to ban from the server']]
    ],
    ["basicRules", 'Basic Rules', 0, [
        ['Basic Rules', "<br />Don't kill unarmed people intentionally<br />Don't hurt people in any DMZ zone (Green circles)"]]
    ],
    ["guidelines", 'General Guidelines', 0, [
        ['General Guidelines', '<br />Roleplay is your way to play<br />No New Life rule, cops will pursue you after respawn<br />Rules violations are resolved by admins, Laws are enforced by police<br />Please use only English in Global and Side chats<br />Bounty Hunters may hunt only on wanted criminal only if his bounty exceed 5,000<br />Terrorism may be directed only agaisnt cops and armed or provoking civilians<br />Argue with admins only in a private talk<br />Refunds for losses due to kicks or disconnects are impossible']]
    ],
    ["forbidden", 'Strictly Forbidden', 0, [
        ['Strictly Forbidden', 'The following actions are strictly forbidden:<br />-Deathmatch and spree killing<br />-Safe zone kills, theft and property damage<br />-Killing unarmed and unprovoking players<br />-Non-RP kills and non-RP property damage<br />-Non-RP blocking exits, flags, players<br />-Camping Civ storage and Cop base exits<br />-Idling for more than 15 mins<br />-Switching civ-cop sides to get advantages<br />Using cop items as civilian<br />Exploiting mission or Arma2 bugs<br />Insulting others in global chat. Roleplay insults in direct chat are allowed']]
    ],
    ["copRules", 'Cop Rules', 2, [
        ['Cop Rules', '<br />Commiting illegal actions for cops is strictly forbidden<br />Stun gun is a must have for all the time<br />Shoot lethal only in self defence. Killing unarmed player is strictly forbidden<br />State the charge, the term and ask for objection before jail<br />Handcuffing non-wanted player for more than 5 minutes is forbidden<br />Subtract the time player spent in handcuffs or other custody from the jail term<br />Stay away of civ storage unless wanted player is there<br />Play SWAT or Pilot only if you can play these roles appropriately<br />Armed vehicles, machine guns and RPGs are alowed only to SWAT<br />Use of armed and armored vehicles is allowed only in response to the use of heavy weapons or terrorism<br />It is forbidden to give civilians any cops items, weapons and vehicles']]
    ],
    ["laws", 'Laws And Definitions', 0, [
        ['Laws', '<br />Look for current laws under Inventory - Laws'],
        ['Crime Definitions', '<br />Murder - killing a player.<br />Mass Murder - killing more than 3 players<br /><strong>Attempted Murder</strong> - an attempt to murder a player<br /><strong>Jailbreak</strong> - escape or aid in escape<br /><strong>Property Damage</strong> - damaging or destroying other players property<br /><strong>Aggravated Property Damage</strong> - damaging or destroying others property in excess of 50k<br /><strong>Weapon Possession</strong> - possession of illegal weapon or with no valid licence<br /><strong>Bank Robbery</strong> - robbing a bank<br /><strong>Car Theft/Robbery</strong> - stealing a car or armed robbery of another player<br /><strong>Dangerous Driving</strong> - driving dangerously<br /><strong>Disrespecting Cops</strong> - insults towards cops via chat or other means<br /><strong>Drug Dealing/Smuggling</strong> - sale or possession of drugs/weapons<br /><strong>Evading</strong> - not stoping at the request of the police for more than 1 minute, minor offence<br /><strong>Fleeing</strong> - escaping from police officer, failure to pay fine<br /><strong>Terror Camp Entry</strong> - entering a terrorists camp<br /><strong>Terrorism</strong> - deliberately targeting on police and government force, more than 3 kills, regardless of weapons used<br /><strong>Other</strong> - minor offences'],
        ['Basic Definitions', '<br />-&quot;Roleplay&quot; is defined as &quot;Acting as In Real Life&quot;.<br />-<strong>Non-RP action</strong> is an action without a sufficient reason, purpose or sense.<br /><br />-<strong>Safe Zone</strong> - is a green circle area of civilian storage, cop base and jail. Any hostile actions towards players is scrictly forbidden in these areas.<br /><br /><strong>Deathmatch (DM)</strong> - is killing a player or destrucing property without rp reason;<br /><br /><strong>Revenge Kill</strong> - is harming another player or his property in return for doing same to you or your property. It is allowed as long as it doesnt contradict with other rules (eg. killing an unarmed player);<br /><br /><strong>Shoot on Sight</strong> - is a playing behaviour, when player shoots before confirming the target as a proper target, or if there is no reason to shoot lethal at all;<br /><br /><strong>Killing of unarmed player</strong> - is intentional killing of unarmed and unprovoking person;<br /><br /><strong>Safe Camping</strong> - camping storage or cop base in attempt to harm a player or his property on his way in or out of the safe zone; estimate 100m from the zone or untill the first road crossing.<br /><br /><strong>Logging to Avoid</strong> - quitting the game to avoid being arrested, killed or in the middle of RP situation;<br /><br /><strong>Terrorism</strong> - is a series of violent acts against cops, mayor or any other government groups only. Terrorism must be performed in roleplay manner, through game chat.<br /><br /> Terrorism may not be directed agaisnt random civilians or their property. These actions will get you banned.']]
    ],
    ["playingCiv", 'Playing as a Civilian', 1, [
        ['Shops', '<br />*Shop buys from you at 100% basic price <br />*All shops has stock limit - shop will not buy from you if capacity is reached. Stocks are being saved if you reconnect.<br />*Buy shop doesnt do anything yet'],
        ['Production', '<br />1. Gather resources like iron, oil, copper at mines<br />2. Take resources to reprocess factory called &quot;Resource Factory&quot; at Workplace 1 and make materials like Steel, Electronics, Gasoline<br />3. Take materials to Weapon, Vehicles or Item factory and produce desired stuff.<br /><br />*Factory storage content is not saved if you reconnect<br />*Buy factory allows you to use the factory'],
        ['Playing as a Civilian', '<br />TBD'],
        ['Making Money', '<br />*Take a delievery job at any of 3 Workplaces<br />*Make and sell drugs<br />*Rob a bank'],
        ['Group Area', '<br />*Group areas are located around main town. <br />*You need to be in group and have a gun to take control over area.<br />*Group area npc has storage for vehicles and guns<br />*Group area npc is a place to reprocess drugs'],
        ['Drugs', '<br />Drugs are for sell only, they have no use.<br /><br />How drug dealing works:<br />1. Harvest raw drug at drug field;<br />2. Put raw drug into Group Area storage;<br />3. Use action Reprocess Drugs;<br />4. Take drug from Group storage and go to the red spot in town. Drug will be selled automatically.']
    ]],
    ["playingCop", 'Playing as a Cop', 2, [
        ['Playing as a Cop', '<br />TBD']
    ]],
    ["credits", 'Credits', 0, [
        ['Authors', '<br />Created By Hunter.J - - OneShot.J, 2013']
    ]]
];
// Stats
RPM_StatsArray = [];
RPM_Stats_PersonalArray = [
    ["------" + format[localize "STRM_YourStats"] + "------"],
    [localize "STRM_Role"],
    [localize "STRM_Hunger"],
    [localize "STRM_Health"],
    [localize "STRM_Jailed"],
    [localize "STRM_Wanted"],
    [localize "STRM_DeliveryPoint"]
];
RPM_Stats_InfoArray = [
    ["------" + format[localize "STRM_Info"] + "------"],
    [localize "STRM_Daytime", floor(daytime)],
    [localize "STRM_ServerTime", floor(i25)],
    [localize "STRM_LastSave", floor(i26)],
    [(format[localize "STRM_BankAccount"] + ": " + format["$%1", floor(i4)])],
    [format[localize "STRM_SoftwareVersion"] + "1.1"],
    [format[localize "STRM_SoftwareRevision"] + format[localize "STRM_SoftwareUnrevisioned"]]
];
RPM_Stats_PlayersArray = [
    ["------" + format[localize "STRM_Players"] + "------"]
];
RPM_Stats_LawsArray = [
    ["------" + format[localize "STRM_CodeOfLaws"] + "------"],
    [localize "STRM_Law1"],
    [localize "STRM_Law2"],
    [localize "STRM_Law3"],
    [localize "STRM_Law4"],
    [localize "STRM_Law5"],
    [localize "STRM_Law6"],
    [localize "STRM_Law7"],
    [localize "STRM_Law8"],
    [localize "STRM_Law9"],
    [localize "STRM_Law10"]
];
RPM_Stats_LicensesArray = [
    ["------" + format[localize "STRM_Licenses"] + "------"],
    [localize "v238"],
    [localize "v240"],
    [localize "v242"],
    [localize "v244"],
    [localize "v246"],
    [localize "v248"],
    [localize "v250"]
];
RPM_Stats_FactoryArray = [
    ["------" + format[localize "STRM_Factories"] + "------"]
];
// Reprocessable Drugs (Itemids)
a75 = [309, 321, 278, 321];
// "Resources" (Action itemids, debug action)
a76 = [554,555,556,557,558,559];
// Politics [[Chief, [[Candidate, Votes]]],[Mayor, [[Candidate, [Votes]]], [[Transactor, Type, Amount]]]]
a77 = [30, ["None", []], ["None", [], []]];
// Auto-jail Places (Size of marker X/Y)
a78 = [
    [(getMarkerPos "jail"), ((getMarkerSize "jail") select 0)]
];
// Saved gear (Cop) (Gear/Weps) (Used by loop)
a79 = [[], []];
// Civ-only shops (Blocks cops from shop)
a80 = [3, 10, 11];
// Valid search anims (BIS string)
RPM_SearchAnims = [
    "aidlpknlmstpsraswpstdnon_player_idlesteady01",
    "aidlpknlmstpsnonwnondnon_player_idlesteady01",
    "aidlpercmstpsraswpstdnon_player_idlesteady02",
    "aidlpknlmstpsnonwnondnon_player_idlesteady02",
    "aidlpknlmstpsraswpstdnon_player_idlesteady03",
    "aidlpknlmstpsnonwnondnon_player_idlesteady03",
    "amovpknlmstpsnonwnondnon_amovpknlmstpsraswpstdnon_end",
    "aidlpknlmstpsraswpstdnon_player_idlesteady02",
	"civillying01"
];
// Previous delivery points (NPC1/2/3 arrays)
a81 = [[],[],[]];
// "New Storage Array (Local)
a82 = [];
// "New" Storage Array (Civ) (Server)
a83 = [];
// "New" Storage Array (Cop) (Server)
a84 = [];
// Factory Storage Array (Server)
a85 = [];
// Price depreciation (Goods, Vehicles, Weapons)
a86 = [
    0.15, 0.30, 0.10
];
// Sellable drugs (For markers loop)
a87 = [274,275,276,277,278,279];
// DMG zone markers
RPM_DMZ = [
    "jail"
];
RPM_InvalidChars = [" ", "!",  "@", "#", "$", "%", "^", "&", "*", "=", "+", "\", "|", ";", ":", "'", "<", ">", "/", "?"];
// Booleans
// Is body loop active? (For script waiting)
b0 = false;
// Did the button get jammed for our guis (Moron button spam proofing)
b1 = false;
// Is the client loop active? (For script waiting)
b2 = false;
// Am I delivering? (For script waiting)
b3 = false;
// Is the fat loop active? (For script waiting)
b4 = false;
// Are we farming? (For script waiting)
b5 = false;
// Are we harvesting? (For script waiting)
b6 = false;
// Is the hunger loop active? (For script waiting)
b7 = false;
// Can we vote? (For script waiting)
b8 = true;
// Is the markers loop active? (For script waiting)
b9 = false;
// Did a mine run out? (For server loop)
b10 = false;
// Are we mining? (For script waiting)
b11 = false;
// Did we disable paycheck messages? (For settings GUI)
b12 = true;
// Are we plotting? (For script waiting)
b13 = false;
// Is the restrained loop active? (For script waiting)
b14 = false;
// Is the salary loop active? (For script waiting)
b15 = false;
// Is the server loop active? (For script waiting)
b16 = false;
// Did a shop run out of something? (For server loop)
b17 = false;
// Are we sowing? (For script waiting)
b18 = false;
// Is a vehicle spawning? (For script waiting)
b19 = false;
// Are we waiting for next politics vote? (For script waiting)
b20 = false;
// Am I wanted? (For script waiting)
b21 = false;
// Are we working? (For script waiting)
b22 = false;
// Did the factory stop? (For script waiting)
b23 = false;
// Are we fat? (For encumberance)
b25 = false;
// Is the date being remotely set? (For script waiting)
b26 = false;
// Is the bank unlock loop active? (For script waiting)
b27 = false;
// Are we pushing dope? (For script waiting)
b28 = false;
// Are we arrested? (For script waiting)
b29 = false;
// Have we been killed by a DMZ? (For script waiting)
b30 = false;
// Are we ticketed? (For script waiting)
b32 = false;
// Is tax loop active? (For script waiting)
b33 = false;
// Are we processing drugs? (For script waiting)
b35 = false;
// Is the politics cycle active? (For script waiting)
b36 = false;
// Is the gear being saved? (For script waiting)
b37 = false;
// Is the gear being restored? (For script waiting)
b38 = false;
// Are we busy doing something else? (Multi-purpose)
b39 = false;
// Should we exit the restraint loop temporarily?
b40 = false;
// Don't use b42!!
// Don't use b43!!
// Do we run in dedicated-only save mode (Production)
b44 = false;
// Don't use b44!!
// Don't use b45!!
// Don't use b46!!
// Don't use b47!!
// Don't use b48!!
b49 = false;
// Stunned (Prevents inventory)
b50 = false;
// Markers loop active
b52 = false;
// Did we scan for something and get it back?
b53 = false;
// Integers
// Inventory Capacity (KG)
i0 = 32;
// Last Vote (Used by politics loop)
i1 = 0;
// BIS "Clutter" grid (Default/minimum)
i5 = 50;
// BIS "ViewDistance" (Default/minimum)
i6 = 1500;
// Factory queue start time (How long the script waits)
i7 = 10;
// Hunger (Percentage of 100)
i9 = 0;
// Last save (Used by loop)
i10 = 0;
// Required Politics Votes (People)
i11 = 3;
// Max "Clutter" grid (BIS grids)
i12 = 50;
// Max "ViewDistance" (In metres)
i13 = 5000;
// Yields since last move (Tracks harvests in single place)
i14 = 0;
// Save interval (Seconds)
i17 = 900;
// Time to take-over area (Seconds)
i18 = 30;
// Tax fund (The cash collected)
i19 = 0;
// Government funds (Used for bounty and mayoral tasks)
i21 = 50000;
// Group create fee
i22 = 0;
// Group (Minimum) join fee
i23 = 1000;
// Stun time (Seconds)
i24 = 15;
// Shots fired in DMZ
i27 = 0;
// Lockpick chance
i29 = 60;
// Taxes due (At each rolled-over tax loop)
i30 = 0;
// Objects
// (Active) Delivery NPC
o0 = objNull;
// Strings
// My marker (Player marker name)
s1 = "";
// (Active) Delivery marker (Map marker name)
s2 = "";
// Valid Numerics
s3 = "01234567890";
// Valid Alphas
s4 = "abcdefghijklmnopqrstuvwxyz";
// Valid Alphanumerics
s5 = s3 + s4;
// Symbols
RPM_SymbolList = "`~!@#$%^&*()-_=+\|;:',<>/?";
// Actions added to the vehicle while inside
RPM_Vehicle_PersonInteractsAdded = [];
// Actions added to the vehicle while outside
RPM_Vehicle_VehicleInteractsAdded = [];
// Global list of all spawned vehicles
RPM_Vehicles_Array = [];
// Loop boolean for vehicle check loop
RPM_Vehicles_LoopActive = false;
// Vehicle Interacts (Outside)
RPM_Vehicle_Interacts_Person = [
    [format[localize "v440"], "RPM\Global\STD_NoScript.sqf", "call RPM_Cfg_Vehicles_Lock;", 5, "((vehicle RPM_Role == RPM_Role) && (cursorTarget call RPM_Cfg_Vehicles_IsMyVehicle) && (alive(cursorTarget)) && (cursorTarget call RPM_Cfg_Vehicles_IsVehicle))"],
    [format[localize "v439"], "RPM\Global\STD_NoScript.sqf", "cursorTarget call RPM_Cfg_Vehicles_Interact;", 5, "((vehicle RPM_Role == RPM_Role) && (alive(cursorTarget)) && (cursorTarget call RPM_Cfg_Vehicles_IsVehicle))"],
    [format[localize "STRM_RemoveWreck"], "RPM\Global\STD_NoScript.sqf", "cursorTarget call RPM_Cfg_Vehicles_Scrap;", 5, "((vehicle RPM_Role == RPM_Role) && (cursorTarget call RPM_Cfg_Vehicles_IsScrappable))"]
];
// Vehicle Interacts (Inside)
// Object, Action ID, Array
RPM_Vehicle_Interacts_Vehicle = [
    [objNull, [format["<t size='1.1' color='#00ccff' align='left'>%1</t>", format[localize "v357"]], "RPM\Global\STD_NoScript.sqf", "call RPM_Cfg_Inv_GUI;", 6, "(((driver(vehicle RPM_Role)) == RPM_Role) && (!(b50)))"]],
    //[objNull, [format[localize "v550"], "RPM\Global\STD_NoScript.sqf", "call UlRP_Cfg_Cop_Gate;", 5, "((RPM_Cop) && ((driver(vehicle RPM_Role)) == RPM_Role))"]],
	[objNull, ["<t size='1.1' color='#087FF7' >PD [IN] GATE</t>", "Ultimate-RP\Police\PDGateRight.sqf", "", 5, "((RPM_Cop) || (RPM_Role call RPM_Cfg_Objects_IsAdmin))"]],
	[objNull, ["<t size='1.1' color='#087FF7' >PD [OUT] GATE</t>", "Ultimate-RP\Police\PDGateLeft.sqf", "", 5, "((RPM_Cop) || (RPM_Role call RPM_Cfg_Objects_IsAdmin))"]],
    [objNull, [format[localize "v440"], "RPM\Global\STD_NoScript.sqf", "call RPM_Cfg_Vehicles_Lock;", 5, "((driver(vehicle RPM_Role) == RPM_Role) && ((vehicle RPM_Role) call RPM_Cfg_Vehicles_IsMyVehicle))"]],
    [objNull, [format[localize "v439"], "RPM\Global\STD_NoScript.sqf", "(vehicle RPM_Role) call RPM_Cfg_Vehicles_Interact;", 5, ""]]
];
// Vehicle Interacts (Debug)
// Object, Action ID, Array
RPM_Vehicle_Interacts_Debug = [
    [objNull, [format[localize "STRM_Act_Teleport_S"], "RPM\Global\STD_NoScript.sqf", format["hint format[localize ""v69""];onMapSingleClick {vehicle RPM_Role setPos _pos};"], 0, "RPM_Debug"]],
    [objNull, [format[localize "STRM_Act_Teleport_E"], "RPM\Global\STD_NoScript.sqf", "onmapsingleclick {};", 0, "RPM_Debug"]]
];
RPM_Logs = [
    [format[localize "v347"], []],
    [format[localize "STRM_Crimes"], []],
    [format[localize "STRM_Dead"], []],
    [format[localize "STRM_Jail"], []],
    [format[localize "STRM_Logs"], []],
    [format[localize "STRM_Killed"], []],
    [format[localize "STRM_Paycheck"], []]
];
//Admins declaration for logs (We use nil checks, and concat into the file on package, but you don't have to!)
//RPM_Admins = [["123456","mypasscode123"]];
RPM_VehicleClassifications = [
    // Air
    [0,[440,441,442,443,445,446,447,448,449,450,451,452,453,454,456,457,458,459,460,461,462,463,464,465,466,498,479]],
    // Armored
    [1,[]],
    // Boats
    [2,[467,468,469,470,471,472,473,474,475,476,477,478]],
    // Bikes
    [3,[405]],
    // Cars
    [4,[186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,312,313,314,315,316,317,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,477,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497]],
    // Motos
    [5,[406,407,408,409,410,411,412,413,414,415,416,430,431,432,433,434,435,436,437,438,439]],
    // Trucks
    [6,[339,400,401,402,403,404]]
];
//Msg System [NOT IMPLEMENTED]
//RPM_HINTS = RPM_HINTS + ["<t ' size = '1.15' align = 'center' color = '#009BFF'>Ultimate-RP<br/>Messaging System<br/></t>"];