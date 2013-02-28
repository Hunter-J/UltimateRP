// String, Script, Argument, Priority, Condition
RPM_Person_CivActions = [
    // Anchor, String, Script, Argument, Priority, Condition, Self, Marker, Distance
    [RPM_Role, [format[localize "STRM_Act_Delivery_Cancel"], "RPM\Global\STD_NoScript.sqf", "0 call RPM_Cfg_Delivery_Cancel;", 4, "((!(isNull(o0))) || ((a51 select 0) != -1) && ((a51 select 1) != -1) || (b3))", true, "", 2]]
];

RPM_Person_GlobalActions = [
    //[RPM_Role, ["Open File", "\dta\file.sqf", "", 5, "((RPM_Debug) || (RPM_Role call RPM_Cfg_Objects_IsAdmin))"]],
    [RPM_Role, [format["<t size='1.1' color='#FFFF00' align='left'>%1</t>", format[localize "v357"]], "RPM\Global\STD_NoScript.sqf", "call RPM_Cfg_Inv_GUI;", 6, "((vehicle RPM_Role == RPM_Role) && (!(b50)))"]],
    [RPM_Role, [format["<t size='1.1' color='#FFFF00' align='left'>%1</t>", format[localize "v365"]], "RPM\Global\STD_NoScript.sqf", "call RPM_Cfg_Inv_Animations_GUI;", 6, "(vehicle RPM_Role == RPM_Role)"]]
];

RPM_Person_DebugActions = [
    [RPM_Role, [format[localize "STRM_Act_Teleport_S"], "RPM\Global\STD_NoScript.sqf", "[""On""] call UltRP_Debug_Teleport;", 0, "((vehicle RPM_Role == RPM_Role) && (RPM_Debug)) && !Teleport"]],
    [RPM_Role, [format[localize "STRM_Act_Teleport_E"], "RPM\Global\STD_NoScript.sqf", "[""Off""] call UltRP_Debug_Teleport;", 0, "((vehicle RPM_Role == RPM_Role) && (RPM_Debug)) && Teleport"]]
];


// Anchor, String, Script, Argument, Priority, Condition, Distance
RPM_NPC_CivActions = [
    //Factories
    [npc_distillery, [format[localize "v334"], "RPM\Global\STD_NoScript.sqf", "[0] call RPM_Cfg_Factory_GUI;", 5, "", 4]],
    [npc_factory_food, [format[localize "v335"], "RPM\Global\STD_NoScript.sqf", "[1] call RPM_Cfg_Factory_GUI;", 5, "", 4]],
    [npc_factory_item, [format[localize "v336"], "RPM\Global\STD_NoScript.sqf", "[2] call RPM_Cfg_Factory_GUI;", 5, "", 4]],
    [npc_factory_resource, [format[localize "v337"], "RPM\Global\STD_NoScript.sqf", "[3] call RPM_Cfg_Factory_GUI;", 5, "", 4]],

	//Areas
	//Areas Takeover
    [npc_ctrlarea1, [format[localize "STRM_Act_Areas_Takeover"], "RPM\Global\STD_NoScript.sqf", "[npc_ctrlarea1] call RPM_Cfg_Groups_Takeover;", 5, "((([0] call RPM_Cfg_Areas_GetOwner) != ([name RPM_Role] call RPM_Cfg_Groups_InGroup)) && (!(b49)))", 4]],
    [npc_ctrlarea2, [format[localize "STRM_Act_Areas_Takeover"], "RPM\Global\STD_NoScript.sqf", "[npc_ctrlarea2] call RPM_Cfg_Groups_Takeover;", 5, "((([1] call RPM_Cfg_Areas_GetOwner) != ([name RPM_Role] call RPM_Cfg_Groups_InGroup)) && (!(b49)))", 4]],
    //Areas Storage
    [npc_ctrlarea1, [format[localize "STRM_Act_Areas_Storage"], "RPM\Global\STD_NoScript.sqf", format["[""Group_Storage"", %1] call RPM_Cfg_Storage_GUI;", npc_ctrlarea1], 5, "((([0] call RPM_Cfg_Areas_GetOwner) call RPM_str_Length >= 1) && (isNull([0] call RPM_Cfg_Areas_GetActive)) && (([0] call RPM_Cfg_Areas_GetOwner) == ([name RPM_Role] call RPM_Cfg_Groups_InGroup)))", 4]],
    [npc_ctrlarea2, [format[localize "STRM_Act_Areas_Storage"], "RPM\Global\STD_NoScript.sqf", format["[""Group_Storage"", %1] call RPM_Cfg_Storage_GUI;", npc_ctrlarea2], 5, "((([1] call RPM_Cfg_Areas_GetOwner) call RPM_str_Length >= 1) && (isNull([1] call RPM_Cfg_Areas_GetActive)) && (([1] call RPM_Cfg_Areas_GetOwner) == ([name RPM_Role] call RPM_Cfg_Groups_InGroup)))", 4]],
	//Areas Reprocess
    [npc_ctrlarea1, [format[localize "STRM_Act_Reprocess"], "RPM\Global\STD_NoScript.sqf", "npc_ctrlarea1 call RPM_Cfg_Groups_Reprocess;", 5, "((([0] call RPM_Cfg_Areas_GetOwner) call RPM_str_Length >= 1) && (isNull([0] call RPM_Cfg_Areas_GetActive)) && (([0] call RPM_Cfg_Areas_GetOwner) == ([name RPM_Role] call RPM_Cfg_Groups_InGroup)) && (npc_ctrlarea1 call RPM_Cfg_Groups_HasDrugs) && (!(b35)))", 4]],
    [npc_ctrlarea2, [format[localize "STRM_Act_Reprocess"], "RPM\Global\STD_NoScript.sqf", "npc_ctrlarea2 call RPM_Cfg_Groups_Reprocess;", 5, "((([1] call RPM_Cfg_Areas_GetOwner) call RPM_str_Length >= 1) && (isNull([1] call RPM_Cfg_Areas_GetActive)) && (([1] call RPM_Cfg_Areas_GetOwner) == ([name RPM_Role] call RPM_Cfg_Groups_InGroup)) && (npc_ctrlarea2 call RPM_Cfg_Groups_HasDrugs) && (!(b35)))", 4]],
     
	// Storage
    [npc_storage_civ, [format[localize "v343"], "RPM\Global\STD_NoScript.sqf", format["[""Storage"", 0, 0, %1] call RPM_Cfg_Storage_GUI;", npc_storage_civ], 5, "", 4]],

	//Delivery
    [npc_getjob1, [format[localize "STRM_Act_Delivery_Get"], "RPM\Global\STD_NoScript.sqf", "npc_getjob1 call RPM_Cfg_Delivery_Logic;", 4, "((!(b3)))", 4]],
   
	//Licensing
    [dmv, [format[localize "v239", 25000], "RPM\Global\STD_NoScript.sqf", format["[""lic_air"", 25000, ""%1""] call RPM_Cfg_Inv_InitLicense;", format[localize "v238", 25000]], 4, format['(!("lic_air" call RPM_Cfg_Inv_HasLicense))'], 4]],
    [dmv, [format[localize "v241", 2500], "RPM\Global\STD_NoScript.sqf", format["[""lic_boat"", 2500, ""%1""] call RPM_Cfg_Inv_InitLicense;", format[localize "v240", 2500]], 4, format['(!("lic_boat" call RPM_Cfg_Inv_HasLicense))'], 4]],
    [dmv, [format[localize "v243", 500], "RPM\Global\STD_NoScript.sqf", format["[""lic_car"", 500, ""%1""] call RPM_Cfg_Inv_InitLicense;", format[localize "v242", 500]], 4, format['(!("lic_car" call RPM_Cfg_Inv_HasLicense))'], 4]],
    [dmv, [format[localize "v245", 5000], "RPM\Global\STD_NoScript.sqf", format["[""lic_pickup"", 5000, ""%1""] call RPM_Cfg_Inv_InitLicense;", format[localize "v244", 5000]], 4, format['(!("lic_pickup" call RPM_Cfg_Inv_HasLicense))'], 4]],
    [dmv, [format[localize "v247", 7500], "RPM\Global\STD_NoScript.sqf", format["[""lic_truck"", 7500, ""%1""] call RPM_Cfg_Inv_InitLicense;", format[localize "v246", 7500]], 4, format['(!("lic_truck" call RPM_Cfg_Inv_HasLicense))'], 4]],
    [npc_shop_weapons, [format[localize "v249", 500], "RPM\Global\STD_NoScript.sqf", format["[""lic_pistol"", 500, ""%1""] call RPM_Cfg_Inv_InitLicense;", format[localize "v248", 500]], 4, format['(!("lic_pistol" call RPM_Cfg_Inv_HasLicense))'], 4]],
    [npc_shop_weapons, [format[localize "v251", 4000], "RPM\Global\STD_NoScript.sqf", format["[""lic_rifle"", 4000, ""%1""] call RPM_Cfg_Inv_InitLicense;", format[localize "v250", 4000]], 4, format['(!("lic_rifle" call RPM_Cfg_Inv_HasLicense))'], 4]],
    
	//Shops
    [npc_market, [format[localize "v295"], "RPM\Global\STD_NoScript.sqf", "[0] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_market2, [format[localize "v295"], "RPM\Global\STD_NoScript.sqf", "[1] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    
	[npc_petrol1, [format[localize "v296"], "RPM\Global\STD_NoScript.sqf", "[2] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_petrol2, [format[localize "v296"], "RPM\Global\STD_NoScript.sqf", "[3] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_petrol3, [format[localize "v296"], "RPM\Global\STD_NoScript.sqf", "[4] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_petrol4, [format[localize "v296"], "RPM\Global\STD_NoScript.sqf", "[5] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_petrol5, [format[localize "v296"], "RPM\Global\STD_NoScript.sqf", "[6] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_petrol6, [format[localize "v296"], "RPM\Global\STD_NoScript.sqf", "[7] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    
	[npc_shop_item, [format[localize "v297"], "RPM\Global\STD_NoScript.sqf", "[8] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    
	[npc_shop_air1, [format[localize "v298"], "RPM\Global\STD_NoScript.sqf", "[9] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air2, [format[localize "v299"], "RPM\Global\STD_NoScript.sqf", "[10] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air3, [format[localize "v300"], "RPM\Global\STD_NoScript.sqf", "[11] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air4, [format[localize "v301"], "RPM\Global\STD_NoScript.sqf", "[12] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air5, [format[localize "v298"], "RPM\Global\STD_NoScript.sqf", "[13] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air6, [format[localize "v299"], "RPM\Global\STD_NoScript.sqf", "[14] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air7, [format[localize "v300"], "RPM\Global\STD_NoScript.sqf", "[15] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air8, [format[localize "v301"], "RPM\Global\STD_NoScript.sqf", "[16] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air9, [format[localize "v298"], "RPM\Global\STD_NoScript.sqf", "[17] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air10, [format[localize "v299"], "RPM\Global\STD_NoScript.sqf", "[18] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air11, [format[localize "v300"], "RPM\Global\STD_NoScript.sqf", "[19] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_air12, [format[localize "v301"], "RPM\Global\STD_NoScript.sqf", "[20] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
   
	[npc_shop_boat, [format[localize "v302"], "RPM\Global\STD_NoScript.sqf", "[21] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_boat2, [format[localize "v303"], "RPM\Global\STD_NoScript.sqf", "[22] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
   
	[npc_shop_usedcars, [format[localize "v304"], "RPM\Global\STD_NoScript.sqf", "[23] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_amercars, [format[localize "v305"], "RPM\Global\STD_NoScript.sqf", "[24] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_japcars, [format[localize "v306"], "RPM\Global\STD_NoScript.sqf", "[25] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_eurocars, [format[localize "v307"], "RPM\Global\STD_NoScript.sqf", "[26] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[npc_shop_execcars, [format[localize "v308"], "RPM\Global\STD_NoScript.sqf", "[27] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	
	[npc_shop_bike1, [format[localize "v309"], "RPM\Global\STD_NoScript.sqf", "[28] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[npc_shop_bike2, [format[localize "v310"], "RPM\Global\STD_NoScript.sqf", "[29] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[npc_shop_bike3, [format[localize "v311"], "RPM\Global\STD_NoScript.sqf", "[30] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_quad, [format[localize "v312"], "RPM\Global\STD_NoScript.sqf", "[31] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
   
	[npc_shop_pickup, [format[localize "v313"], "RPM\Global\STD_NoScript.sqf", "[32] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [npc_shop_truck, [format[localize "v314"], "RPM\Global\STD_NoScript.sqf", "[33] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    
	[npc_shop_weapons, [format[localize "v315"], "RPM\Global\STD_NoScript.sqf", "[34] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[npc_shop_blackmarket, [format[localize "v316"], "RPM\Global\STD_NoScript.sqf", "[35] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[npc_shop_hunting, [format[localize "v317"], "RPM\Global\STD_NoScript.sqf", "[36] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	
	[mdrugsell, [format[localize "v318"], "RPM\Global\STD_NoScript.sqf", "[37] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[cdrugsell, [format[localize "v319"], "RPM\Global\STD_NoScript.sqf", "[38] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[methsell, [format[localize "v320"], "RPM\Global\STD_NoScript.sqf", "[39] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	
	[npc_shop_seed, [format[localize "v339"], "RPM\Global\STD_NoScript.sqf", "[50] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[npc_shop_pharm, [format[localize "v340"], "RPM\Global\STD_NoScript.sqf", "[51] call RPM_Cfg_Shops_GUI;", 4, "", 4]]
];


RPM_NPC_CopActions = [
    [PDGear, [format[localize "v321"], "RPM\Global\STD_NoScript.sqf", "[40] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [PDEquipment, [format[localize "v322"], "RPM\Global\STD_NoScript.sqf", "[41] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [PDHelis, [format[localize "v323"], "RPM\Global\STD_NoScript.sqf", "[42] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [PDBikes, [format[localize "v324"], "RPM\Global\STD_NoScript.sqf", "[43] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [PDUCCars, [format[localize "v325"], "RPM\Global\STD_NoScript.sqf", "[44] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[PDK9Cars, [format[localize "v326"], "RPM\Global\STD_NoScript.sqf", "[45] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[PDCars, [format[localize "v327"], "RPM\Global\STD_NoScript.sqf", "[46] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[npc_storage_cop, [format[localize "v356"], "RPM\Global\STD_NoScript.sqf", format["[""Storage"", 0, 0, %1] call RPM_Cfg_Storage_GUI;", npc_storage_cop], 5, "", 4]]
];


RPM_NPC_FFActions = [
    [FDEquipment, [format[localize "v330"], "RPM\Global\STD_NoScript.sqf", "[47] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
	[FDCars, [format[localize "v331"], "RPM\Global\STD_NoScript.sqf", "[48] call RPM_Cfg_Shops_GUI;", 4, "", 4]],
    [FDHelis, [format[localize "v332"], "RPM\Global\STD_NoScript.sqf", "[49] call RPM_Cfg_Shops_GUI;", 4, "", 4]]
];


RPM_NPC_GlobalActions = [
	//ATM/Bank
	[obj_atm2, [format[localize "v344"], "RPM\Global\STD_NoScript.sqf", "obj_atm2 call RPM_Cfg_Banking_GUI;", 4, "", 4]],
    [obj_atm7, [format[localize "v344"], "RPM\Global\STD_NoScript.sqf", "obj_atm7 call RPM_Cfg_Banking_GUI;", 4, "", 4]],
    [obj_atm4, [format[localize "v344"], "RPM\Global\STD_NoScript.sqf", "obj_atm4 call RPM_Cfg_Banking_GUI;", 4, "", 4]],
	[obj_atm1, [format[localize "v344"], "RPM\Global\STD_NoScript.sqf", "obj_atm1 call RPM_Cfg_Banking_GUI;", 4, "", 4]],
    [obj_atm5, [format[localize "v344"], "RPM\Global\STD_NoScript.sqf", "obj_atm5 call RPM_Cfg_Banking_GUI;", 4, "", 4]],
	[npc_bank, [format[localize "v345"], "RPM\Global\STD_NoScript.sqf", "npc_bank call RPM_Cfg_Banking_GUI;", 4, "", 4]]
];