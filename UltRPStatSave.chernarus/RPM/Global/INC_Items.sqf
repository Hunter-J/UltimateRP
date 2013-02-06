// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/


// ID, Type, Legal, Price, Weight, [Licences], [Skills], [Reqs], Class, String, Script, Description (Undeclared)
RPM_AllWeaponObjects = [
    //Equipment
	[0, [0, TRUE, 500, "1", [], [], [[521,1500]], "NVGoggles", format[localize "STRM_NVGoggles"], ""]],
	
	//Pistol
	[1, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_g17", format[localize "STRM_RH_g17"], ""]],
	[2, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_g19", format[localize "STRM_RH_g19"], ""]],
	[3, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_p38", format[localize "STRM_RH_p38"], ""]],
	[4, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_tt33", format[localize "STRM_RH_tt33"], ""]],
	[5, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_browninghp", format[localize "STRM_RH_tt33"], ""]],
	[6, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_uspm", format[localize "STRM_RH_uspm"], ""]],
	[7, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_usp", format[localize "STRM_RH_usp"], ""]],
	[8, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_mk2", format[localize "STRM_RH_mk2"], ""]],
	[9, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_m9", format[localize "STRM_RH_m9"], ""]],
	[10, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_m9c", format[localize "STRM_RH_m9c"], ""]],
	[11, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_anac", format[localize "STRM_RH_anac"], ""]],
	[12, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_anacg", format[localize "STRM_RH_anacg"], ""]],
	[13, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_python", format[localize "STRM_RH_python"], ""]],
	[14, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_deagle", format[localize "STRM_RH_deagle"], ""]],
	[15, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_deagles", format[localize "STRM_RH_deagles"], ""]],
	[16, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_m1911", format[localize "STRM_RH_m1911"], ""]],
	[17, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_m1911old", format[localize "STRM_RH_m1911old"], ""]],
	[18, [1, TRUE, 1, "1", [], [], [], "", ""]],
	
	//Automatic Pistols + SMGs
	[19, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_g18", format[localize "STRM_RH_g18"], ""]],
	[20, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_m93r", format[localize "STRM_RH_m93r"], ""]],
	[21, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_mp5k", format[localize "STRM_RH_mp5k"], ""]],
	[22, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_mp5kpdw", format[localize "STRM_RH_mp5kpdw"], ""]],
	[23, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_mp5a4", format[localize "STRM_RH_mp5a4"], ""]],
	[24, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_mp7", format[localize "STRM_RH_mp7"], ""]],
	[25, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_mp7aim", format[localize "STRM_RH_mp7"], ""]],
	[26, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_PDW", format[localize "STRM_RH_PDW"], ""]],
	[27, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_PDW_AIM", format[localize "STRM_RH_PDW_AIM"], ""]],
	[28, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_tec9", format[localize "STRM_RH_tec9"], ""]],
	[29, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_muzi", format[localize "STRM_RH_muzi"], ""]],
	[30, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_uzim", format[localize "STRM_RH_uzim"], ""]],
	[31, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_mac10", format[localize "STRM_RH_mac10"], ""]],
	[32, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_kriss", format[localize "STRM_RH_kriss"], ""]],
	[33, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_krissaim", format[localize "STRM_RH_krissaim"], ""]],
	
	//Shotguns
	[34, [0, TRUE, 500, "1", [], [], [[521,1500]], "tcg_combat", format[localize "STRM_tcg_combat"], ""]],
	[35, [0, TRUE, 500, "1", [], [], [[521,1500]], "tcg_remington", format[localize "STRM_tcg_remington"], ""]],
	[36, [0, TRUE, 500, "1", [], [], [[521,1500]], "tcg_mossberg", format[localize "STRM_tcg_mossberg"], ""]],
	[37, [0, TRUE, 500, "1", [], [], [[521,1500]], "AA12_PMC", format[localize "STRM_AA12_PMC"], ""]],
	
	//Semi-Auto Rifles
	[38, [0, TRUE, 500, "1", [], [], [[521,1500]], "LeeEnfield", format[localize "STRM_LeeEnfield"], ""]],
	[39, [0, TRUE, 500, "1", [], [], [[521,1500]], "HuntingRifle", format[localize "STRM_HuntingRifle"], ""]],
	[40, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_ar10", format[localize "STRM_RH_ar10"], ""]],
	[41, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_ar10s", format[localize "STRM_RH_ar10s"], ""]],
	[42, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_svu", format[localize "STRM_RH_svu"], ""]],
	[43, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_svd", format[localize "STRM_RH_svd"], ""]],
	[44, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_svdb", format[localize "STRM_RH_svdb"], ""]],
	[45, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_svdg", format[localize "STRM_RH_svdg"], ""]],
	[46, [0, TRUE, 500, "1", [], [], [[521,1500]], "M24", format[localize "STRM_M24"], ""]],
	[47, [0, TRUE, 500, "1", [], [], [[521,1500]], "DMR", format[localize "STRM_DMR"], ""]],
	
	//Automatic Rifles
	[48, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_m4", format[localize "STRM_RH_m4"], ""]],
	[49, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_m4aim", format[localize "STRM_RH_m4aim"], ""]],
	[50, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_akm", format[localize "STRM_RH_akm"], ""]],
	[51, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_aks74", format[localize "STRM_RH_aks74"], ""]],
	[52, [0, TRUE, 500, "1", [], [], [[521,1500]], "RH_aks74u", format[localize "STRM_RH_aks74u"], ""]]
];

RPM_AllMagazineObjects = [
	//Pistol Mags
	[53, [1, TRUE, 100, "0.25", [], [], [], "RH_17Rnd_9x19_g17", format[localize "STRM_RH_17Rnd_9x19_g17"], ""]],
	[54, [1, TRUE, 100, "0.25", [], [], [], "RH_8Rnd_9x19_p38", format[localize "STRM_RH_8Rnd_9x19_p38"], ""]],
	[55, [1, TRUE, 100, "0.25", [], [], [], "RH_8Rnd_762_tt33", format[localize "STRM_RH_8Rnd_762_tt33"], ""]],
	[56, [1, TRUE, 100, "0.25", [], [], [], "RH_13Rnd_9x19_bhp", format[localize "STRM_RH_13Rnd_9x19_bhp"], ""]],
	[57, [1, TRUE, 100, "0.25", [], [], [], "RH_12Rnd_45cal_usp", format[localize "STRM_RH_12Rnd_45cal_usp"], ""]],
	[58, [1, TRUE, 100, "0.25", [], [], [], "RH_15Rnd_9x19_usp", format[localize "STRM_RH_15Rnd_9x19_usp"], ""]],
	[59, [1, TRUE, 100, "0.25", [], [], [], "RH_10Rnd_22LR_mk2", format[localize "STRM_RH_10Rnd_22LR_mk2"], ""]],
	[60, [1, TRUE, 100, "0.25", [], [], [], "Rnd_9x19_M9", format[localize "STRM_Rnd_9x19_M9"], ""]],
	[61, [1, TRUE, 100, "0.25", [], [], [], "RH_6Rnd_44_Mag", format[localize "STRM_RH_6Rnd_44_Mag"], ""]],
	[62, [1, TRUE, 100, "0.25", [], [], [], "RH_6Rnd_357_Mag", format[localize "STRM_RH_6Rnd_357_Mag"], ""]],
	[63, [1, TRUE, 100, "0.25", [], [], [], "RH_7Rnd_50_AE", format[localize "STRM_RH_7Rnd_50_AE"], ""]],
	[64, [1, TRUE, 100, "0.25", [], [], [], "RH_8Rnd_45cal_m1911", format[localize "STRM_RH_8Rnd_45cal_m1911"], ""]],

    //Automatic Pistol + SMG Mags
	[65, [1, TRUE, 100, "0.25", [], [], [], "RH_19Rnd_9x19_g18", format[localize "STRM_RH_19Rnd_9x19_g18"], ""]],
	[66, [1, TRUE, 100, "0.25", [], [], [], "RH_33Rnd_9x19_g18", format[localize "STRM_RH_33Rnd_9x19_g18"], ""]],
	[67, [1, TRUE, 100, "0.25", [], [], [], "RH_20Rnd_9x19_M93", format[localize "STRM_RH_20Rnd_9x19_M93"], ""]],
	[68, [1, TRUE, 100, "0.25", [], [], [], "Rnd_9x19_MP5", format[localize "STRM_Rnd_9x19_MP5"], ""]],
	[69, [1, TRUE, 100, "0.25", [], [], [], "RH_46x30mm_40RND_Mag", format[localize "STRM_RH_46x30mm_40RND_Mag"], ""]],
	[70, [1, TRUE, 100, "0.25", [], [], [], "RH_30Rnd_6x35_PDW", format[localize "STRM_RH_30Rnd_6x35_PDW"], ""]],
	[71, [1, TRUE, 100, "0.25", [], [], [], "RH_30Rnd_9x19_tec", format[localize "STRM_RH_30Rnd_9x19_tec"], ""]],
	[72, [1, TRUE, 100, "0.25", [], [], [], "RH_32Rnd_9x19_Muzi", format[localize "STRM_RH_32Rnd_9x19_Muzi"], ""]],
	[73, [1, TRUE, 100, "0.25", [], [], [], "RH_9mm_32RND_Mag", format[localize "STRM_RH_9mm_32RND_Mag"], ""]],
	[74, [1, TRUE, 100, "0.25", [], [], [], "RH_45ACP_30RND_Mag", format[localize "STRM_RH_45ACP_30RND_Mag"], ""]],
	
    //Shotgun Mags
    [75, [1, TRUE, 150, "1", [], [], [], "8Rnd_B_Beneli_74Slug", format[localize "STRM_8Rnd_B_Beneli_74Slug"], ""]],
	[76, [1, TRUE, 150, "1", [], [], [], "B_12Gauge_74Slug", format[localize "STRM_B_12Gauge_74Slug"], ""]],
	[77, [1, TRUE, 150, "1", [], [], [], "20Rnd_B_AA12_Pellets", format[localize "STRM_20Rnd_B_AA12_Pellets"], ""]],
	
	//Semi-Auto Rifle Mags
	[78, [1, TRUE, 500, "1", [], [], [[327,175]], "10x_303", format[localize "STRM_10x_303"], ""]],
	[79, [1, TRUE, 500, "1", [], [], [[327,175]], "5x_22_LR_17_HMR", format[localize "STRM_55x_22_LR_17_HMR"], ""]],
	[80, [1, TRUE, 200, "1", [], [], [[327,35]], "20Rnd_556x45_Stanag", format[localize "STRM_20Rnd_556x45_Stanag"], ""]],
	[81, [1, TRUE, 1000, "1", [], [], [[327,250]], "10Rnd_762x54_SVD", format[localize "STRM_10Rnd_762x54_SVD"], ""]],
    [82, [1, TRUE, 500, "1", [], [], [[327,175]], "5Rnd_762x51_M24", format[localize "STRM_5Rnd_762x51_M24"], ""]],
	[83, [1, TRUE, 100, "1", [], [], [[327,225]], "20Rnd_762x51_DMR", format[localize "STRM_20Rnd_762x51_DMR"], ""]],
    
	//Automatic Rifle Mags
    [84, [1, TRUE, 300, "1", [], [], [[327,50]], "30Rnd_556x45_Stanag", format[localize "STRM_30Rnd_556x45_Stanag"], ""]],
    [85, [1, TRUE, 100, "1", [], [], [[327,40]], "30Rnd_545x39_AK", format[localize "STRM_30Rnd_545x39_AK"], ""]],
    [86, [1, TRUE, 200, "1", [], [], [[327,30]], "RH_30Rnd_545x39_AKSU_mag", format[localize "STRM_RH_30Rnd_545x39_AKSU_mag"], ""]],
	
	//Thrown
	[87, [1, TRUE, 1, "1", [], [], [], "F_40mm_Green", ""]],
    [88, [1, TRUE, 1, "1", [], [], [], "F_40mm_Red", ""]],
    [89, [1, TRUE, 1, "1", [], [], [], "F_40mm_White", ""]],
    [90, [1, TRUE, 1, "1", [], [], [], "F_40mm_Yellow", ""]],
	
	[91, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[92, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[93, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[94, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[95, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[96, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[97, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[98, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[99, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[100, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[101, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[102, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[103, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[104, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[105, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[106, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[107, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[108, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[109, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[110, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[111, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[112, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[113, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[114, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[115, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[116, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[117, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[118, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[119, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[120, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[121, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[122, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[123, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[124, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[125, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[126, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[127, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[128, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[129, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[130, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[131, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[132, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[133, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[134, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[135, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[136, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[137, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[138, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[139, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[140, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[141, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[142, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[143, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[144, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[145, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[146, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[147, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[148, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[149, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[150, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[151, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[152, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[153, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[154, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[155, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[156, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[157, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[158, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[159, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[160, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[161, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[162, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[163, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[164, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[165, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[166, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[167, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[168, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[169, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[170, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[171, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[172, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[173, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[174, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[175, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[176, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[177, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[178, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[179, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[180, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[181, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[182, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[183, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[184, [1, TRUE, 1, "1", [], [], [], "", ""]],
	[185, [1, TRUE, 1, "1", [], [], [], "", ""]]
];

RPM_AllVehiclesObjects = [
    //Used Cars
	[186, [2, TRUE, 10000, "1000", ["lic_car"], [[1,0]], [[546, 300]], "civic", format[localize "STRM_civic"], ""]],
	[187, [2, TRUE, 150, "10", [], [], [[316,60]], "Volha_1_TK_CIV_EP1", format[localize "STRM_Volha_1_TK_CIV_EP1"], ""]],
	[188, [2, TRUE, 150, "10", [], [], [[316,60]], "Volha_2_TK_CIV_EP1", format[localize "STRM_Volha_2_TK_CIV_EP1"], ""]],
	[189, [2, TRUE, 150, "10", [], [], [[316,60]], "Lada1_TK_CIV_EP1", format[localize "STRM_Lada1_TK_CIV_EP1"], ""]],
	[190, [2, TRUE, 150, "10", [], [], [[316,60]], "Lada2_TK_CIV_EP1", format[localize "STRM_Lada2_TK_CIV_EP1"], ""]],
	[191, [2, TRUE, 150, "10", [], [], [[316,60]], "S1203_TK_CIV_EP1", format[localize "STRM_S1203_TK_CIV_EP1"], ""]],
	[192, [2, TRUE, 150, "10", [], [], [[316,60]], "Car_hatchback", format[localize "STRM_Car_hatchback"], ""]],
	[193, [2, TRUE, 150, "10", [], [], [[316,60]], "VWGolf", format[localize "STRM_VWGolf"], ""]],
	[194, [2, TRUE, 150, "10", [], [], [[316,60]], "Car_Sedan", format[localize "STRM_Car_Sedan"], ""]],
	[195, [2, TRUE, 150, "10", [], [], [[316,60]], "SkodaBlue", format[localize "STRM_SkodaBlue"], ""]],
	[196, [2, TRUE, 150, "10", [], [], [[316,60]], "SkodaRed", format[localize "STRM_SkodaRed"], ""]],
	[197, [2, TRUE, 150, "10", [], [], [[316,60]], "hilux1_civil_3_open_EP1", format[localize "STRM_hilux1_civil_3_open_EP1"], ""]],
	[198, [2, TRUE, 150, "10", [], [], [[316,60]], "datsun1_civil_3_open", format[localize "STRM_datsun1_civil_3_open"], ""]],
	[199, [2, TRUE, 150, "10", [], [], [[316,60]], "LandRover_TK_CIV_EP1", format[localize "STRM_LandRover_TK_CIV_EP1"], ""]],
	[200, [2, TRUE, 150, "10", [], [], [[316,60]], "UAZ_Unarmed_TK_CIV_EP1", format[localize "STRM_UAZ_Unarmed_TK_CIV_EP1"], ""]],
	[201, [2, TRUE, 150, "10", [], [], [[316,60]], "Tractor", format[localize "STRM_Tractor"], ""]],
	
	//American Cars
	[202, [2, TRUE, 150, "10", [], [], [[316,60]], "hemicuda", format[localize "STRM_hemicuda"], ""]],
	[203, [2, TRUE, 150, "10", [], [], [[316,60]], "cd71hm", format[localize "STRM_cd71hm"], ""]],
	[204, [2, TRUE, 150, "10", [], [], [[316,60]], "440cuda", format[localize "STRM_440cuda"], ""]],
	[205, [2, TRUE, 150, "10", [], [], [[316,60]], "barcuda", format[localize "STRM_barcuda"], ""]],
	[206, [2, TRUE, 150, "10", [], [], [[316,60]], "cuda", format[localize "STRM_cuda"], ""]],
	
	[207, [2, TRUE, 150, "10", [], [], [[316,60]], "roadrunner", format[localize "STRM_roadrunner"], ""]],
	[208, [2, TRUE, 150, "10", [], [], [[316,60]], "roadrunner2", format[localize "STRM_roadrunner2"], ""]],
	
	[209, [2, TRUE, 150, "10", [], [], [[316,60]], "fury", format[localize "STRM_fury"], ""]],
	
	[210, [2, TRUE, 150, "10", [], [], [[316,60]], "CORVETTE_Z06", format[localize "STRM_CORVETTE_Z06"], ""]],
	[211, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_corvettezr1_black", format[localize "STRM_a2l_corvettezr1_black"], ""]],
	
	[212, [2, TRUE, 150, "10", [], [], [[316,60]], "DODGE_VIPER_SRT10", format[localize "STRM_DODGE_VIPER_SRT10"], ""]],
	[213, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_transam_ws6_black", format[localize "STRM_a2l_transam_ws6_black"], ""]],
	[214, [2, TRUE, 150, "10", [], [], [[316,60]], "chevrolet_chevelle", format[localize "STRM_chevrolet_chevelle"], ""]],
	[215, [2, TRUE, 150, "10", [], [], [[316,60]], "CHEVROLET_CAMARO_SS_396", format[localize "STRM_CHEVROLET_CAMARO_SS_396"], ""]],
	
	[216, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_camaro_white", format[localize "STRM_a2l_camaro_white"], ""]],
	[217, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_camaro_black", format[localize "STRM_a2l_camaro_black"], ""]],
	[218, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_camaro_blue", format[localize "STRM_a2l_camaro_blue"], ""]],
	[219, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_camaro_pink", format[localize "STRM_a2l_camaro_pink"], ""]],
	[220, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_camaro_red", format[localize "STRM_a2l_camaro_red"], ""]],
	[221, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_camaro_yellow", format[localize "STRM_a2l_camaro_yellow"], ""]],
	
	[222, [2, TRUE, 150, "10", [], [], [[316,60]], "monaco", format[localize "STRM_monaco"], ""]],
	[223, [2, TRUE, 150, "10", [], [], [[316,60]], "monaco_blue", format[localize "STRM_monaco_blue"], ""]],
	[224, [2, TRUE, 150, "10", [], [], [[316,60]], "monaco_green", format[localize "STRM_monaco_green"], ""]],
	[225, [2, TRUE, 150, "10", [], [], [[316,60]], "monaco_grey", format[localize "STRM_monaco_grey"], ""]],
	[226, [2, TRUE, 150, "10", [], [], [[316,60]], "monaco_orange", format[localize "STRM_monaco_orange"], ""]],
	[227, [2, TRUE, 150, "10", [], [], [[316,60]], "monaco_pink", format[localize "STRM_monaco_pink"], ""]],
	[228, [2, TRUE, 150, "10", [], [], [[316,60]], "monaco_red", format[localize "STRM_monaco_red"], ""]],
	[229, [2, TRUE, 150, "10", [], [], [[316,60]], "monaco_white", format[localize "STRM_monaco_white"], ""]],
	[230, [2, TRUE, 150, "10", [], [], [[316,60]], "monaco_yellow", format[localize "STRM_monaco_yellow"], ""]],
	
	[231, [2, TRUE, 150, "10", [], [], [[316,60]], "il_charger_blue", format[localize "STRM_il_charger_blue"], ""]],
	[232, [2, TRUE, 150, "10", [], [], [[316,60]], "il_charger_black", format[localize "STRM_il_charger_black"], ""]],
	[233, [2, TRUE, 150, "10", [], [], [[316,60]], "il_charger_red", format[localize "STRM_il_charger_red"], ""]],
	[234, [2, TRUE, 150, "10", [], [], [[316,60]], "il_charger_orange", format[localize "STRM_il_charger_orange"], ""]],
	
	[235, [2, TRUE, 150, "10", [], [], [[316,60]], "challenger", format[localize "STRM_challenger"], ""]],
	[236, [2, TRUE, 150, "10", [], [], [[316,60]], "INFINITI_G35", format[localize "STRM_INFINITI_G35"], ""]],
	
	[237, [2, TRUE, 150, "10", [], [], [[316,60]], "FORD_SHELBY_GT", format[localize "STRM_FORD_SHELBY_GT"], ""]],
	
	[238, [2, TRUE, 150, "10", [], [], [[316,60]], "shelby_orange", format[localize "STRM_shelby_orange"], ""]],
	[239, [2, TRUE, 150, "10", [], [], [[316,60]], "shelby_blue", format[localize "STRM_shelby_blue"], ""]],
	[240, [2, TRUE, 150, "10", [], [], [[316,60]], "shelby_black", format[localize "STRM_shelby_black"], ""]],
	[241, [2, TRUE, 150, "10", [], [], [[316,60]], "shelby_white", format[localize "STRM_shelby_white"], ""]],
	
	[242, [2, TRUE, 150, "10", [], [], [[316,60]], "FORD_GT", format[localize "STRM_FORD_GT"], ""]],
	
	[243, [2, TRUE, 150, "10", [], [], [[316,60]], "FORD_MUSTANG_SHELBY_COBRA", format[localize "STRM_FORD_MUSTANG_SHELBY_COBRA"], ""]],
	[244, [2, TRUE, 150, "10", [], [], [[316,60]], "FORD_MUSTANG_SHELBY_COBRA1", format[localize "STRM_FORD_MUSTANG_SHELBY_COBRA1"], ""]],
	[245, [2, TRUE, 150, "10", [], [], [[316,60]], "FORD_MUSTANG_SHELBY_COBRA2", format[localize "STRM_FORD_MUSTANG_SHELBY_COBRA2"], ""]],
	[246, [2, TRUE, 150, "10", [], [], [[316,60]], "FORD_MUSTANG_SHELBY_COBRA3", format[localize "STRM_FORD_MUSTANG_SHELBY_COBRA3"], ""]],
	
	[247, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_taurus_civ1", format[localize "STRM_tcg_taurus_civ1"], ""]],
	[248, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_taurus_civ2", format[localize "STRM_tcg_taurus_civ2"], ""]],
	[249, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_taurus_civ4", format[localize "STRM_tcg_taurus_civ4"], ""]],
	[250, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_taurus_civ5", format[localize "STRM_tcg_taurus_civ5"], ""]],
	[251, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_taurus_civ6", format[localize "STRM_tcg_taurus_civ6"], ""]],
	
	[252, [2, TRUE, 150, "10", [], [], [[316,60]], "il_fordcv_white", format[localize "STRM_il_fordcv_white"], ""]],
	[253, [2, TRUE, 150, "10", [], [], [[316,60]], "il_fordcv_grey", format[localize "STRM_il_fordcv_grey"], ""]],
	[254, [2, TRUE, 150, "10", [], [], [[316,60]], "il_fordcv_black", format[localize "STRM_il_fordcv_black"], ""]],
	[255, [2, TRUE, 150, "10", [], [], [[316,60]], "il_fordcv_darkblue", format[localize "STRM_il_fordcv_darkblue"], ""]],
	[256, [2, TRUE, 150, "10", [], [], [[316,60]], "il_fordcv_maroon", format[localize "STRM_il_fordcv_maroon"], ""]],
	[257, [2, TRUE, 150, "10", [], [], [[316,60]], "il_fordcv_sandstone", format[localize "STRM_il_fordcv_sandstone"], ""]],
	
	//Japanese Cars
	[258, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_axela_blue", format[localize "STRM_a2l_axela_blue"], ""]],
	
	[259, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_GTR_SPECV", format[localize "STRM_NISSAN_GTR_SPECV"], ""]],
	[260, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_GTR_SPECV1", format[localize "STRM_NISSAN_GTR_SPECV1"], ""]],
	[261, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_GTR_SPECV2", format[localize "STRM_NISSAN_GTR_SPECV2"], ""]],
	[262, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_GTR_SPECV3", format[localize "STRM_NISSAN_GTR_SPECV3"], ""]],
	
	[263, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_SKYLINE_GT_R_Z", format[localize "STRM_NISSAN_SKYLINE_GT_R_Z"], ""]],
	[264, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_SKYLINE_GT_R_Z1", format[localize "STRM_NISSAN_SKYLINE_GT_R_Z1"], ""]],
	[265, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_SKYLINE_GT_R_Z2", format[localize "STRM_NISSAN_SKYLINE_GT_R_Z2"], ""]],
	[266, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_SKYLINE_GT_R_Z3", format[localize "STRM_NISSAN_SKYLINE_GT_R_Z3"], ""]],
	
	[267, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_350Z", format[localize "STRM_NISSAN_350Z"], ""]],
	
	[268, [2, TRUE, 150, "10", [], [], [[316,60]], "350z_kiwi", format[localize "STRM_350z_kiwi"], ""]],
	[269, [2, TRUE, 150, "10", [], [], [[316,60]], "350z_black", format[localize "STRM_350z_black"], ""]],
	[270, [2, TRUE, 150, "10", [], [], [[316,60]], "350z_silver", format[localize "STRM_350z_silver"], ""]],
	[271, [2, TRUE, 150, "10", [], [], [[316,60]], "350z_gold", format[localize "STRM_350z_gold"], ""]],
	[272, [2, TRUE, 150, "10", [], [], [[316,60]], "350z_pink", format[localize "STRM_350z_pink"], ""]],
	[273, [2, TRUE, 150, "10", [], [], [[316,60]], "350z_mod", format[localize "STRM_350z_mod"], ""]],
	[274, [2, TRUE, 150, "10", [], [], [[316,60]], "350z_ruben", format[localize "STRM_350z_ruben"], ""]],
	[275, [2, TRUE, 150, "10", [], [], [[316,60]], "350z_v", format[localize "STRM_350z_v"], ""]],
	[276, [2, TRUE, 150, "10", [], [], [[316,60]], "350z_yellow", format[localize "STRM_350z_yellow"], ""]],
	[277, [2, TRUE, 150, "10", [], [], [[316,60]], "350z_blue", format[localize "STRM_350z_blue"], ""]],
	
	[278, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_370Z", format[localize "STRM_NISSAN_370Z"], ""]],
	[279, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_370Z1", format[localize "STRM_NISSAN_370Z1"], ""]],
	[280, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_370Z2", format[localize "STRM_NISSAN_370Z2"], ""]],
	[281, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_370Z3", format[localize "STRM_NISSAN_370Z3"], ""]],
	[282, [2, TRUE, 150, "10", [], [], [[316,60]], "NISSAN_370Z4", format[localize "STRM_NISSAN_370Z4"], ""]],
	
	[283, [2, TRUE, 150, "10", [], [], [[316,60]], "SUBARU_IMPREZA_WRX_STI_AWD", format[localize "STRM_SUBARU_IMPREZA_WRX_STI_AWD"], ""]],
	[284, [2, TRUE, 150, "10", [], [], [[316,60]], "SUBARU_IMPREZA_STI_AWD", format[localize "STRM_SUBARU_IMPREZA_STI_AWD"], ""]],
	
	[285, [2, TRUE, 150, "10", [], [], [[316,60]], "MAZDA_RX_7", format[localize "STRM_MAZDA_RX_7"], ""]],
	[286, [2, TRUE, 150, "10", [], [], [[316,60]], "MAZDA_RX_71", format[localize "STRM_MAZDA_RX_71"], ""]],
	[287, [2, TRUE, 150, "10", [], [], [[316,60]], "MAZDA_RX_72", format[localize "STRM_MAZDA_RX_72"], ""]],
	[288, [2, TRUE, 150, "10", [], [], [[316,60]], "MAZDA_RX_73", format[localize "STRM_MAZDA_RX_73"], ""]],
	[289, [2, TRUE, 150, "10", [], [], [[316,60]], "MAZDA_RX_74", format[localize "STRM_MAZDA_RX_74"], ""]],
	[290, [2, TRUE, 150, "10", [], [], [[316,60]], "MAZDA_RX_75", format[localize "STRM_MAZDA_RX_75"], ""]],
	
	[291, [2, TRUE, 150, "10", [], [], [[316,60]], "MAZDA_MAZDASPEED_3", format[localize "STRM_MAZDA_MAZDASPEED_3"], ""]],
	
	//European Cars
	[292, [2, TRUE, 150, "10", [], [], [[316,60]], "RENAULT_CLIO_SPORT_V6", format[localize "STRM_RENAULT_CLIO_SPORT_V6"], ""]],
	[293, [2, TRUE, 150, "10", [], [], [[316,60]], "FIAT_PUNTO", format[localize "STRM_FIAT_PUNTO"], ""]],
	[294, [2, TRUE, 150, "10", [], [], [[316,60]], "ALFA_ROMEO_BRERA", format[localize "STRM_ALFA_ROMEO_BRERA"], ""]],
	
	[295, [2, TRUE, 150, "10", [], [], [[316,60]], "MERCEDES_BENZ_CLK_500", format[localize "STRM_MERCEDES_BENZ_CLK_500"], ""]],
	[296, [2, TRUE, 150, "10", [], [], [[316,60]], "MERCEDES_BENZ_SL_65_AMG", format[localize "STRM_MERCEDES_BENZ_SL_65_AMG"], ""]],
	
	[297, [2, TRUE, 150, "10", [], [], [[316,60]], "CL_PORSCHE_997", format[localize "STRM_CL_PORSCHE_997"], ""]],
	[298, [2, TRUE, 150, "10", [], [], [[316,60]], "PORSCHE_997_GT3_RSR", format[localize "STRM_PORSCHE_997_GT3_RSR"], ""]],
	[299, [2, TRUE, 150, "10", [], [], [[316,60]], "PORSCHE_911_TURBO", format[localize "STRM_PORSCHE_911_TURBO"], ""]],
	[300, [2, TRUE, 150, "10", [], [], [[316,60]], "PORSCHE_911_GT3_RS", format[localize "STRM_PORSCHE_911_GT3_RS"], ""]],
	
	[301, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_ferrari_458", format[localize "STRM_a2l_ferrari_458"], ""]],
	
	[302, [2, TRUE, 150, "10", [], [], [[316,60]], "CL_LAMBORGHINI_GT3", format[localize "STRM_CL_LAMBORGHINI_GT3"], ""]],
	[303, [2, TRUE, 150, "10", [], [], [[316,60]], "LAMBORGHINI_MURCIELAGO", format[localize "STRM_LAMBORGHINI_MURCIELAGO"], ""]],
	[304, [2, TRUE, 150, "10", [], [], [[316,60]], "LAMBORGHINI_REVENTON", format[localize "STRM_LAMBORGHINI_REVENTON"], ""]],
	[305, [2, TRUE, 150, "10", [], [], [[316,60]], "LAMBORGHINI_GALLARDO", format[localize "STRM_LAMBORGHINI_GALLARDO"], ""]],
	
	[306, [2, TRUE, 150, "10", [], [], [[316,60]], "KOENIGSEGG_CCX", format[localize "STRM_KOENIGSEGG_CCX"], ""]],
	[307, [2, TRUE, 150, "10", [], [], [[316,60]], "KOENIGSEGG_CCX1", format[localize "STRM_KOENIGSEGG_CCX1"], ""]],
	[308, [2, TRUE, 150, "10", [], [], [[316,60]], "KOENIGSEGG_CCX2", format[localize "STRM_KOENIGSEGG_CCX2"], ""]],
	[309, [2, TRUE, 150, "10", [], [], [[316,60]], "KOENIGSEGG_CCX3", format[localize "STRM_KOENIGSEGG_CCX3"], ""]],
	
	[310, [2, TRUE, 150, "10", [], [], [[316,60]], "MASERATI_MC12", format[localize "STRM_MASERATI_MC12"], ""]],
	[311, [2, TRUE, 150, "10", [], [], [[316,60]], "JAGUAR_XK", format[localize "STRM_JAGUAR_XK"], ""]],
	[312, [2, TRUE, 150, "10", [], [], [[316,60]], "BUGATTI_VEYRON", format[localize "STRM_BUGATTI_VEYRON"], ""]],
	
	[313, [2, TRUE, 150, "10", [], [], [[316,60]], "AUDI_TT_QUATTRO_S_LINE", format[localize "STRM_AUDI_TT_QUATTRO_S_LINE"], ""]],
	[314, [2, TRUE, 150, "10", [], [], [[316,60]], "AUDI_FSI_LE_MANS", format[localize "STRM_AUDI_FSI_LE_MANS"], ""]],
	[315, [2, TRUE, 150, "10", [], [], [[316,60]], "PAGANI_ZONDA_F", format[localize "STRM_PAGANI_ZONDA_F"], ""]],
	
	[316, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_bmw_m3", format[localize "STRM_tcg_bmw_m3"], ""]],
	[317, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_bmw_m3_hamwhite", format[localize "STRM_tcg_bmw_m3_hamwhite"], ""]],
	
	[318, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[319, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[320, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[321, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[322, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[323, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[324, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[325, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[326, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[327, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[328, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[329, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[330, [1, TRUE, 150, "10", [], [], [], "", ""]],

	//Executive Cars
	[331, [2, TRUE, 150, "10", [], [], [[316,60]], "SUV_PMC", format[localize "STRM_SUV_PMC"], ""]],
	[332, [2, TRUE, 150, "10", [], [], [[316,60]], "CHRYSLER_300", format[localize "STRM_CHRYSLER_300"], ""]],
	[333, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_taurus_security", format[localize "STRM_tcg_taurus_security"], ""]],
	
	[334, [2, TRUE, 150, "10", [], [], [[316,60]], "CHRYSLER_W_limmo", format[localize "STRM_CHRYSLER_W_limmo"], ""]],
	[335, [2, TRUE, 150, "10", [], [], [[316,60]], "CHRYSLER_B_limmo", format[localize "STRM_CHRYSLER_B_limmo"], ""]],
	
	//Taxi Cars
	[336, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_taurus_taxi", format[localize "STRM_tcg_taurus_taxi"], ""]],
	
	//Pickup Trucks
	[337, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_custom", format[localize "STRM_a2l_suburban_custom"], ""]],
	[338, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_black", format[localize "STRM_a2l_suburban_black"], ""]],
	[339, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_white", format[localize "STRM_a2l_suburban_white"], ""]],
	[340, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_yellow", format[localize "STRM_a2l_suburban_yellow"], ""]],
	[341, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_red", format[localize "STRM_a2l_suburban_red"], ""]],
	[342, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_pink", format[localize "STRM_a2l_suburban_pink"], ""]],
	[343, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_orange", format[localize "STRM_a2l_suburban_orange"], ""]],
	[344, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_grey", format[localize "STRM_a2l_suburban_grey"], ""]],
	[345, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_green", format[localize "STRM_a2l_suburban_green"], ""]],
	[346, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_blue", format[localize "STRM_a2l_suburban_blue"], ""]],
	
	[347, [2, TRUE, 150, "10", [], [], [[316,60]], "suburban_black", format[localize "STRM_suburban_black"], ""]],
	[348, [2, TRUE, 150, "10", [], [], [[316,60]], "suburban_white", format[localize "STRM_suburban_white"], ""]],
	[349, [2, TRUE, 150, "10", [], [], [[316,60]], "suburban_red", format[localize "STRM_suburban_red"], ""]],
	[350, [2, TRUE, 150, "10", [], [], [[316,60]], "suburban_grey", format[localize "STRM_suburban_grey"], ""]],
	[351, [2, TRUE, 150, "10", [], [], [[316,60]], "suburban_green", format[localize "STRM_suburban_green"], ""]],
	[352, [2, TRUE, 150, "10", [], [], [[316,60]], "suburban_blue", format[localize "STRM_suburban_blue"], ""]],
	[353, [2, TRUE, 150, "10", [], [], [[316,60]], "suburban_sandstone", format[localize "STRM_suburban_sandstone"], ""]],
	
	[354, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_black_white", format[localize "STRM_a2l_suburban_black_white"], ""]],
	
	[355, [2, TRUE, 150, "10", [], [], [[316,60]], "il_silverado_selvo", format[localize "STRM_il_silverado_selvo"], ""]],
	[356, [2, TRUE, 150, "10", [], [], [[316,60]], "il_silverado_black", format[localize "STRM_il_silverado_black"], ""]],
	[357, [2, TRUE, 150, "10", [], [], [[316,60]], "il_silverado_white", format[localize "STRM_il_silverado_white"], ""]],
	[358, [2, TRUE, 150, "10", [], [], [[316,60]], "il_silverado_red", format[localize "STRM_il_silverado_red"], ""]],
	[359, [2, TRUE, 150, "10", [], [], [[316,60]], "il_silverado_orange", format[localize "STRM_il_silverado_orange"], ""]],
	
	[360, [2, TRUE, 150, "10", [], [], [[316,60]], "sierra", format[localize "STRM_sierra"], ""]],
	[361, [2, TRUE, 150, "10", [], [], [[316,60]], "sierra_blue", format[localize "STRM_sierra_blue"], ""]],
	[362, [2, TRUE, 150, "10", [], [], [[316,60]], "sierra_green", format[localize "STRM_sierra_green"], ""]],
	[363, [2, TRUE, 150, "10", [], [], [[316,60]], "sierra_grey", format[localize "STRM_sierra_grey"], ""]],
	[364, [2, TRUE, 150, "10", [], [], [[316,60]], "sierra_orange", format[localize "STRM_sierra_orange"], ""]],
	[365, [2, TRUE, 150, "10", [], [], [[316,60]], "sierra_pink", format[localize "STRM_sierra_pink"], ""]],
	[366, [2, TRUE, 150, "10", [], [], [[316,60]], "sierra_red", format[localize "STRM_sierra_red"], ""]],
	[367, [2, TRUE, 150, "10", [], [], [[316,60]], "sierra_white", format[localize "STRM_sierra_white"], ""]],
	[368, [2, TRUE, 150, "10", [], [], [[316,60]], "sierra_yellow", format[localize "STRM_sierra_yellow"], ""]],
	
	[369, [2, TRUE, 150, "10", [], [], [[316,60]], "ram3500", format[localize "STRM_ram3500"], ""]],
	[370, [2, TRUE, 150, "10", [], [], [[316,60]], "ram3500_blue", format[localize "STRM_ram3500_blue"], ""]],
	[371, [2, TRUE, 150, "10", [], [], [[316,60]], "ram3500_green", format[localize "STRM_ram3500_green"], ""]],
	[372, [2, TRUE, 150, "10", [], [], [[316,60]], "ram3500_grey", format[localize "STRM_ram3500_grey"], ""]],
	[373, [2, TRUE, 150, "10", [], [], [[316,60]], "ram3500_orange", format[localize "STRM_ram3500_orange"], ""]],
	[374, [2, TRUE, 150, "10", [], [], [[316,60]], "ram3500_pink", format[localize "STRM_ram3500_pink"], ""]],
	[375, [2, TRUE, 150, "10", [], [], [[316,60]], "ram3500_red", format[localize "STRM_ram3500_red"], ""]],
	[376, [2, TRUE, 150, "10", [], [], [[316,60]], "ram3500_white", format[localize "STRM_ram3500_white"], ""]],
	[377, [2, TRUE, 150, "10", [], [], [[316,60]], "ram3500_yellow", format[localize "STRM_ram3500_yellow"], ""]],
	
	[378, [2, TRUE, 150, "10", [], [], [[316,60]], "f350_black", format[localize "STRM_f350_black"], ""]],
	[379, [2, TRUE, 150, "10", [], [], [[316,60]], "f350_blue", format[localize "STRM_f350_blue"], ""]],
	[380, [2, TRUE, 150, "10", [], [], [[316,60]], "f350_green", format[localize "STRM_f350_green"], ""]],
	[381, [2, TRUE, 150, "10", [], [], [[316,60]], "f350_grey", format[localize "STRM_f350_grey"], ""]],
	[382, [2, TRUE, 150, "10", [], [], [[316,60]], "f350_orange", format[localize "STRM_f350_orange"], ""]],
	[383, [2, TRUE, 150, "10", [], [], [[316,60]], "f350_pink", format[localize "STRM_f350_pink"], ""]],
	[384, [2, TRUE, 150, "10", [], [], [[316,60]], "f350_red", format[localize "STRM_f350_red"], ""]],
	[385, [2, TRUE, 150, "10", [], [], [[316,60]], "f350_white", format[localize "STRM_f350_white"], ""]],
	[386, [2, TRUE, 150, "10", [], [], [[316,60]], "f350_yellow", format[localize "STRM_f350_yellow"], ""]],
	
	[387, [2, TRUE, 150, "10", [], [], [[316,60]], "A2L_Tahoe_Black", format[localize "STRM_A2L_Tahoe_Black"], ""]],
	[388, [2, TRUE, 150, "10", [], [], [[316,60]], "A2L_Tahoe_Blue", format[localize "STRM_A2L_Tahoe_Blue"], ""]],
	[389, [2, TRUE, 150, "10", [], [], [[316,60]], "A2L_Tahoe_Red", format[localize "STRM_A2L_Tahoe_Red"], ""]],
	[390, [2, TRUE, 150, "10", [], [], [[316,60]], "A2L_Tahoe_Tan", format[localize "STRM_A2L_Tahoe_Tan"], ""]],
	[391, [2, TRUE, 150, "10", [], [], [[316,60]], "A2L_Tahoe_White", format[localize "STRM_A2L_Tahoe_White"], ""]],
	[392, [2, TRUE, 150, "10", [], [], [[316,60]], "A2L_Tahoe_Yellow", format[localize "STRM_A2L_Tahoe_Yellow"], ""]],
	
	[393, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[394, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[395, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[396, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[397, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[398, [1, TRUE, 150, "10", [], [], [], "", ""]],
	
	//Trucks
	[339, [2, TRUE, 150, "10", [], [], [[316,60]], "UralOpen_CDF", format[localize "STRM_UralOpen_CDF"], ""]],
	[400, [2, TRUE, 150, "10", [], [], [[316,60]], "Ural_CDF", format[localize "STRM_Ural_CDF"], ""]],
	
	[401, [2, TRUE, 150, "10", [], [], [[316,60]], "V3S_Open_TK_CIV_EP1", format[localize "STRM_V3S_Open_TK_CIV_EP1"], ""]],
	[402, [2, TRUE, 150, "10", [], [], [[316,60]], "V3S_TK_EP1", format[localize "STRM_V3S_TK_EP1"], ""]],
	
	[403, [2, TRUE, 150, "10", [], [], [[316,60]], "KamazOpen", format[localize "STRM_KamazOpen"], ""]],
	[404, [2, TRUE, 150, "10", [], [], [[316,60]], "Kamaz", format[localize "STRM_Kamaz"], ""]],
	
	//Bikes
	[405, [2, TRUE, 150, "10", [], [], [[316,60]], "MMT_Civ", format[localize "STRM_MMT_Civ"], ""]],
	
	[406, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_hrly", format[localize "STRM_tcg_hrly"], ""]],
	[407, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_hrly_orig1", format[localize "STRM_tcg_hrly_orig1"], ""]],
	[408, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_hrly_orig2", format[localize "STRM_tcg_hrly_orig2"], ""]],
	[409, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_hrly_metal", format[localize "STRM_tcg_hrly_metal"], ""]],
	
	[410, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_aprilia_white", format[localize "STRM_tcg_aprilia_white"], ""]],
	[411, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_aprilia_black", format[localize "STRM_tcg_aprilia_black"], ""]],
	[412, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_aprilia_blue", format[localize "STRM_tcg_aprilia_blue"], ""]],
	[413, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_aprilia_red", format[localize "STRM_tcg_aprilia_red"], ""]],
	[414, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_aprilia_yellow", format[localize "STRM_tcg_aprilia_yellow"], ""]],
	[415, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_aprilia_green", format[localize "STRM_tcg_aprilia_green"], ""]],
	[416, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_aprilia_orange", format[localize "STRM_tcg_aprilia_orange"], ""]],
	
	[417, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[418, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[419, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[420, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[421, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[422, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[423, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[424, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[425, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[426, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[427, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[428, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[429, [1, TRUE, 150, "10", [], [], [], "", ""]],
	
	//Quads
	[430, [2, TRUE, 150, "10", [], [], [[316,60]], "ATV_CZ_EP1", format[localize "STRM_ATV_CZ_EP1"], ""]],
	[431, [2, TRUE, 150, "10", [], [], [[316,60]], "cl_quaddescammo", format[localize "STRM_cl_quaddescammo"], ""]],
	[432, [2, TRUE, 150, "10", [], [], [[316,60]], "cl_green", format[localize "STRM_cl_green"], ""]],
	[433, [2, TRUE, 150, "10", [], [], [[316,60]], "cl_quadred", format[localize "STRM_cl_quadred"], ""]],
	[434, [2, TRUE, 150, "10", [], [], [[316,60]], "cl_quadsaftysteel", format[localize "STRM_cl_quadsaftysteel"], ""]],
	[435, [2, TRUE, 150, "10", [], [], [[316,60]], "cl_quadyellow", format[localize "STRM_cl_quadyellow"], ""]],
	[436, [2, TRUE, 150, "10", [], [], [[316,60]], "cl_blue2", format[localize "STRM_cl_blue2"], ""]],
	[437, [2, TRUE, 150, "10", [], [], [[316,60]], "cl_chark", format[localize "STRM_cl_chark"], ""]],
	[438, [2, TRUE, 150, "10", [], [], [[316,60]], "cl_dirtyred", format[localize "STRM_cl_dirtyred"], ""]],
	[439, [2, TRUE, 150, "10", [], [], [[316,60]], "clbuggy", format[localize "STRM_clbuggy"], ""]],
	
	//Air
	[440, [2, TRUE, 150, "10", [], [], [[316,60]], "Mi17_Civilian", format[localize "STRM_Mi17_Civilian"], ""]],
	
	[441, [2, TRUE, 150, "10", [], [], [[316,60]], "ibr_as350_specops", format[localize "STRM_ibr_as350_specops"], ""]],
	[442, [2, TRUE, 150, "10", [], [], [[316,60]], "ibr_as350_jungle", format[localize "STRM_ibr_as350_jungle"], ""]],
	
	[443, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_bell206", format[localize "STRM_tcg_bell206"], ""]],
	[444, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_bell206_1", format[localize "STRM_tcg_bell206_1"], ""]],
	[445, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_bell206_2", format[localize "STRM_tcg_bell206_2"], ""]],
	[446, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_bell206_3", format[localize "STRM_tcg_bell206_3"], ""]],
	[447, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_bell206_4", format[localize "STRM_tcg_bell206_4"], ""]],
	[448, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_bell206_5", format[localize "STRM_tcg_bell206_5"], ""]],
	
	[449, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_Black", format[localize "STRM_UltRP_MH6J_Black"], ""]],
	[450, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_White", format[localize "STRM_UltRP_MH6J_White"], ""]],
	[451, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_Red", format[localize "STRM_UltRP_MH6J_Red"], ""]],
	[452, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_Orange", format[localize "STRM_UltRP_MH6J_Orange"], ""]],
	[453, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_Yellow", format[localize "STRM_UltRP_MH6J_Yellow"], ""]],
	[454, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_Green", format[localize "STRM_UltRP_MH6J_Green"], ""]],
	[455, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_Blue", format[localize "STRM_UltRP_MH6J_Blue"], ""]],
	[456, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_Purple", format[localize "STRM_UltRP_MH6J_Purple"], ""]],
	[457, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_Camo", format[localize "STRM_UltRP_MH6J_Camo"], ""]],
	[458, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_Lightning", format[localize "STRM_UltRP_MH6J_Lightning"], ""]],
	[459, [2, TRUE, 150, "10", [], [], [[316,60]], "UltRP_MH6J_Rasta", format[localize "STRM_UltRP_MH6J_Rasta"], ""]],
	
	[460, [2, TRUE, 150, "10", [], [], [[316,60]], "An2_1_TK_CIV_EP1", format[localize "STRM_An2_1_TK_CIV_EP1"], ""]],
	[461, [2, TRUE, 150, "10", [], [], [[316,60]], "An2_2_TK_CIV_EP1", format[localize "STRM_An2_2_TK_CIV_EP1"], ""]],
	
	[462, [2, TRUE, 150, "10", [], [], [[316,60]], "gnt_piperwii", format[localize "STRM_gnt_piperwii"], ""]],
	
	[463, [2, TRUE, 150, "10", [], [], [[316,60]], "GNT_C185R", format[localize "STRM_GNT_C185R"], ""]],
	[464, [2, TRUE, 150, "10", [], [], [[316,60]], "GNT_C185C", format[localize "STRM_GNT_C185C"], ""]],
	[465, [2, TRUE, 150, "10", [], [], [[316,60]], "GNT_C185", format[localize "STRM_GNT_C185"], ""]],
	
	[466, [2, TRUE, 150, "10", [], [], [[316,60]], "qantas_C130", format[localize "STRM_qantas_C130"], ""]],
	
	//Boats
	[467, [2, TRUE, 150, "10", [], [], [[316,60]], "Fishing_boat", format[localize "STRM_Fishing_boat"], ""]],
	[468, [2, TRUE, 150, "10", [], [], [[316,60]], "PBX", format[localize "STRM_PBX"], ""]],
	[469, [2, TRUE, 150, "10", [], [], [[316,60]], "Zodiac", format[localize "STRM_Zodiac"], ""]],
	[470, [2, TRUE, 150, "10", [], [], [[316,60]], "Smallboat_1", format[localize "STRM_Smallboat_1"], ""]],
	[471, [2, TRUE, 150, "10", [], [], [[316,60]], "Smallboat_2", format[localize "STRM_Smallboat_2"], ""]],
	[472, [2, TRUE, 150, "10", [], [], [[316,60]], "big_boat", format[localize "STRM_big_boat"], ""]],
	
	[473, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_wrun", format[localize "STRM_tcg_wrun"], ""]],
	[474, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_wave_red", format[localize "STRM_tcg_wave_red"], ""]],
	[475, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_wave_black", format[localize "STRM_tcg_wave_black"], ""]],
	[476, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_wave_sky", format[localize "STRM_tcg_wave_sky"], ""]],
	
	[477, [1, TRUE, 150, "10", [], [], [], "", ""]],
	[478, [1, TRUE, 150, "10", [], [], [], "", ""]],
	
	//PD
	[479, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_police_bell206", format[localize "STRM_tcg_police_bell206"], ""]],
	
	[480, [2, TRUE, 150, "10", [], [], [[316,60]], "tcg_hrlycop", format[localize "STRM_tcg_hrlycop"], ""]],
	
	[481, [2, TRUE, 150, "10", [], [], [[316,60]], "ilpd_beat_f101", format[localize "STRM_ilpd_beat_f101"], ""]],
	[482, [2, TRUE, 150, "10", [], [], [[316,60]], "ilpd_slick_b40_pb", format[localize "STRM_tilpd_slick_b40_pb"], ""]],
	
	[483, [2, TRUE, 150, "10", [], [], [[316,60]], "suburban_pd_k9", format[localize "STRM_suburban_pd_k9"], ""]],
	
	[484, [2, TRUE, 150, "10", [], [], [[316,60]], "suburban_pd_black", format[localize "STRM_suburban_pd_black"], ""]],
	[485, [2, TRUE, 150, "10", [], [], [[316,60]], "A2L_Tahoe_Blackuc", format[localize "STRM_A2L_Tahoe_Blackuc"], ""]],
	[486, [2, TRUE, 150, "10", [], [], [[316,60]], "A2L_Tahoe_Whiteuc", format[localize "STRM_A2L_Tahoe_Whiteuc"], ""]],
	
	[487, [2, TRUE, 150, "10", [], [], [[316,60]], "bcpd_unmarked_black", format[localize "STRM_bcpd_unmarked_black"], ""]],
	[488, [2, TRUE, 150, "10", [], [], [[316,60]], "bcpd_unmarked_white", format[localize "STRM_bcpd_unmarked_white"], ""]],
	[489, [2, TRUE, 150, "10", [], [], [[316,60]], "bcpd_unmarked_grey", format[localize "STRM_bcpd_unmarked_grey"], ""]],
	[490, [2, TRUE, 150, "10", [], [], [[316,60]], "bcpd_unmarked_blue", format[localize "STRM_bcpd_unmarked_blue"], ""]],
	[491, [2, TRUE, 150, "10", [], [], [[316,60]], "bcpd_unmarked_sandstone", format[localize "STRM_bcpd_unmarked_sandstone"], ""]],
	[492, [2, TRUE, 150, "10", [], [], [[316,60]], "bcpd_unmarked_maroon", format[localize "STRM_bcpd_unmarked_maroon"], ""]],
	
	//FD
	[493, [2, TRUE, 150, "10", [], [], [[316,60]], "il_towtruck", format[localize "STRM_il_towtruck"], ""]],
	[494, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_f350ambo", format[localize "STRM_a2l_f350ambo"], ""]],
	[495, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_dot_f350_utility", format[localize "STRM_a2l_dot_f350_utility"], ""]],
	[496, [2, TRUE, 150, "10", [], [], [[316,60]], "laddertruck", format[localize "STRM_laddertruck"], ""]],
	[497, [2, TRUE, 150, "10", [], [], [[316,60]], "a2l_suburban_FD", format[localize "STRM_a2l_suburban_FD"], ""]],
	
	[498, [2, TRUE, 150, "10", [], [], [[316,60]], "ibr_as350", format[localize "STRM_ibr_as350"], ""]]
];

RPM_AllItemsArray = [
    [499, [3, TRUE, 100, "1", [], [], [], "drug_cocaine", format[localize "STRM_drug_cocaine"], "RPM\Global\FNC_Inventory.sqf"]],
    [500, [3, TRUE, 100, "1", [], [], [], "drug_marijuana", format[localize "STRM_drug_marijuana"], "RPM\Global\FNC_Inventory.sqf"]],
    [501, [3, TRUE, 100, "1", [], [], [], "drug_meth", format[localize "STRM_drug_meth"], "RPM\Global\FNC_Inventory.sqf"]],
    
	[502, [3, TRUE, 1, "50", [], [], [], "equipment_barrel", format[localize "STRM_equipment_barrel"], "RPM\Global\FNC_Inventory.sqf"]],
    [503, [3, TRUE, 50, "0.2", [], [], [], "equipment_handcuffs", format[localize "STRM_equipment_handcuffs"], "RPM\Global\FNC_Inventory.sqf"]],
    [504, [3, TRUE, 500, "5", [], [], [], "equipment_spikestrip", format[localize "STRM_equipment_spikestrip"], "RPM\Global\FNC_Inventory.sqf"]],
    [505, [3, TRUE, 250, "10", [], [], [[521,100]], "equipment_kit_gascan", format[localize "STRM_equipment_kit_gascan"], "RPM\Global\FNC_Inventory.sqf"]],
    [506, [3, TRUE, 2500, "0.2", [], [], [[521,2500]], "equipment_kit_lockpick", format[localize "STRM_equipment_kit_lockpick"], "RPM\Global\FNC_Inventory.sqf"]],
    [507, [3, TRUE, 500, "3", [], [], [[521,250]], "equipment_kit_medikit", format[localize "STRM_equipment_kit_medikit"], "RPM\Global\FNC_Inventory.sqf"]],
    [508, [3, TRUE, 2000, "5", [], [], [[521,15000]], "equipment_wearable_kevlarsuit", format[localize "STRM_equipment_wearable_kevlarsuit"], "RPM\Global\FNC_Inventory.sqf"]],
    [509, [3, TRUE, 2000, "5", [], [], [], "equipment_wearable_kevlarsuit_cop", format[localize "STRM_equipment_wearable_kevlarsuit_cop"], "RPM\Global\FNC_Inventory.sqf"]],
    [510, [3, TRUE, 250, "5", [], [], [[521,100]], "equipment_kit_repairkit", format[localize "STRM_equipment_kit_repairkit"], "RPM\Global\FNC_Inventory.sqf"]],
    [511, [3, TRUE, 100, "0.2", [], [], [], "equipment_phone", format[localize "STRM_equipment_phone"], "RPM\Global\FNC_Inventory.sqf"]],
    [512, [3, TRUE, 500, "1", [], [], [], "equipment_wearable_bag_weapon", format[localize "STRM_equipment_wearable_bag_weapon"], "RPM\Global\FNC_Inventory.sqf"]],
    [513, [3, TRUE, 1, "1", [], [], [], "equipment_wearable_nightvision", format[localize "STRM_equipment_wearable_nightvision"], "RPM\Global\FNC_Inventory.sqf"]],
    [514, [3, TRUE, 2500, "15", [], [], [[521,1000]], "equipment_wearable_parachute", format[localize "STRM_equipment_wearable_parachute"], "RPM\Global\FNC_Inventory.sqf"]],
    
	[515, [3, TRUE, 100, "0.1", [], [], [], "food_doughnut", format[localize "STRM_food_doughnut"], "RPM\Global\FNC_Inventory.sqf"]],
    [516, [3, TRUE, 100, "0.5", [], [], [[527,4]], "food_drink_beer", format[localize "STRM_food_drink_beer"], "RPM\Global\FNC_Inventory.sqf"]],
    [517, [3, TRUE, 100, "0.5", [], [], [[543,4]], "food_drink_vodka", format[localize "STRM_food_drink_vodka"], "RPM\Global\FNC_Inventory.sqf"]],
    [518, [3, TRUE, 10, "1", [], [], [], "food_fish", format[localize "STRM_food_fish"], "RPM\Global\FNC_Inventory.sqf"]],
    [519, [3, TRUE, 250, "1", [], [], [[323,4],[296,2]], "food_pizza", format[localize "STRM_food_pizza"], "RPM\Global\FNC_Inventory.sqf"]],
    [520, [3, TRUE, 100, "0.2", [], [], [[323,2],[296,2]], "food_sandwich", format[localize "STRM_food_sandwich"], "RPM\Global\FNC_Inventory.sqf"]],
    
	[521, [3, TRUE, 1, "0", [], [], [], "money", format[localize "STRM_money"], "RPM\Global\FNC_Inventory.sqf"]],
   
	[522, [3, TRUE, 1, "10", [], [], [], "delivery_electronics", format[localize "STRM_delivery_electronics"], "RPM\Global\FNC_Inventory.sqf"]],
    [523, [3, TRUE, 1, "10", [], [], [], "delivery_rye", format[localize "STRM_delivery_rye"], "RPM\Global\FNC_Inventory.sqf"]],
    [524, [3, TRUE, 1, "10", [], [], [], "delivery_potatoes", format[localize "STRM_delivery_potatoes"], "RPM\Global\FNC_Inventory.sqf"]],
    [525, [3, TRUE, 1, "10", [], [], [], "delivery_clothes", format[localize "STRM_delivery_clothes"], "RPM\Global\FNC_Inventory.sqf"]],
    [526, [3, TRUE, 1, "10", [], [], [], "delivery_beer", format[localize "STRM_delivery_beer"], "RPM\Global\FNC_Inventory.sqf"]],
    [527, [3, TRUE, 1, "10", [], [], [], "delivery_vodka", format[localize "STRM_delivery_vodka"], "RPM\Global\FNC_Inventory.sqf"]],
    
	[528, [3, TRUE, 25, "1", [], [], [], "equipment_fishingpole", format[localize "STRM_equipment_fishingpole"], "RPM\Global\FNC_Inventory.sqf"]],
    [529, [3, TRUE, 1, "1", [], [], [[330,2],[348,2]], "resource_blackpowder", format[localize "STRM_resource_blackpowder"], "RPM\Global\FNC_Inventory.sqf"]],
    [530, [3, TRUE, 1, "1", [], [], [], "resource_coal", format[localize "STRM_resource_coal"], "RPM\Global\FNC_Inventory.sqf"]],
    [531, [3, TRUE, 1, "1", [], [], [], "resource_coca", format[localize "STRM_resource_coca"], "RPM\Global\FNC_Inventory.sqf"]],
    [532, [3, TRUE, 1, "1", [], [], [], "resource_copper", format[localize "STRM_resource_copper"], "RPM\Global\FNC_Inventory.sqf"]],
    [533, [3, TRUE, 100, "1", [], [], [], "resource_cotton", format[localize "STRM_resource_cotton"], "RPM\Global\FNC_Inventory.sqf"]],
    [534, [3, TRUE, 1, "1", [], [], [], "resource_ergot", format[localize "STRM_resource_ergot"], "RPM\Global\FNC_Inventory.sqf"]],
    [535, [3, TRUE, 1, "1", [], [], [[547,4]], "resource_glass", format[localize "STRM_resource_glass"], "RPM\Global\FNC_Inventory.sqf"]],
    [536, [3, TRUE, 1, "1", [], [], [], "resource_gold", format[localize "STRM_resource_gold"], "RPM\Global\FNC_Inventory.sqf"]],
    [537, [3, TRUE, 1, "1", [], [], [], "resource_hops", format[localize "STRM_resource_hops"], "RPM\Global\FNC_Inventory.sqf"]],
    [538, [3, TRUE, 1, "1", [], [], [], "resource_iron", format[localize "STRM_resource_iron"], "RPM\Global\FNC_Inventory.sqf"]],
    [539, [3, TRUE, 1, "1", [], [], [], "resource_lead", format[localize "STRM_resource_lead"], "RPM\Global\FNC_Inventory.sqf"]],
    [540, [3, TRUE, 1, "1", [], [], [], "resource_oilcrude", format[localize "STRM_resource_oilcrude"], "RPM\Global\FNC_Inventory.sqf"]],
    [541, [3, TRUE, 1, "1", [], [], [[540,4]], "resource_oilrefined", format[localize "STRM_resource_oilrefined"], "RPM\Global\FNC_Inventory.sqf"]],
    [542, [3, TRUE, 1, "1", [], [], [[541,4]], "resource_plastic", format[localize "STRM_resource_plastic"], "RPM\Global\FNC_Inventory.sqf"]],
    [543, [3, TRUE, 100, "1", [], [], [], "resource_potato", format[localize "STRM_resource_potato"], "RPM\Global\FNC_Inventory.sqf"]],
    [544, [3, TRUE, 100, "1", [], [], [], "resource_rye", format[localize "STRM_resource_rye"], "RPM\Global\FNC_Inventory.sqf"]],
    [545, [3, TRUE, 1, "1", [], [], [], "resource_silica", format[localize "STRM_resource_silica"], "RPM\Global\FNC_Inventory.sqf"]],
    [546, [3, TRUE, 1, "1", [], [], [[538,4]], "resource_steel", format[localize "STRM_resource_steel"], "RPM\Global\FNC_Inventory.sqf"]],
    [547, [3, TRUE, 1, "1", [], [], [], "resource_sand", format[localize "STRM_resource_sand"], "RPM\Global\FNC_Inventory.sqf"]],
    [548, [3, TRUE, 1, "1", [], [], [], "resource_sulfur", format[localize "STRM_resource_sulfur"], "RPM\Global\FNC_Inventory.sqf"]],
    
	[549, [3, TRUE, 1, "1", [], [], [], "equipment_keys", format[localize "STRM_equipment_keys"], "RPM\Global\FNC_Inventory.sqf"]],
    [550, [3, TRUE, 1, "1", [], [], [], "equipment_pickaxe", format[localize "STRM_equipment_pickaxe"], "RPM\Global\FNC_Inventory.sqf"]],
    [551, [3, TRUE, 1, "1", [], [], [], "equipment_jackhammer", format[localize "STRM_equipment_jackhammer"], "RPM\Global\FNC_Inventory.sqf"]],
    [552, [3, TRUE, 1, "1", [], [], [], "equipment_shovel", format[localize "STRM_equipment_shovel"], "RPM\Global\FNC_Inventory.sqf"]],
    [553, [3, TRUE, 1, "1", [], [], [], "equipment_siphon", format[localize "STRM_equipment_siphon"], "RPM\Global\FNC_Inventory.sqf"]],
    
	[554, [3, TRUE, 100, "0.1", [], [], [], "seed_coca", "Cocaine Seed", format[localize "STRM_seed_coca"], "RPM\Global\FNC_Inventory.sqf"]],
    [555, [3, TRUE, 100, "0.1", [], [], [], "seed_cotton", format[localize "STRM_seed_cotton"], "RPM\Global\FNC_Inventory.sqf"]],
    [556, [3, TRUE, 100, "0.1", [], [], [], "seed_hops", format[localize "STRM_seed_hops"], "RPM\Global\FNC_Inventory.sqf"]],
    [557, [3, TRUE, 100, "0.1", [], [], [], "seed_marijuana", format[localize "STRM_seed_marijuana"], "RPM\Global\FNC_Inventory.sqf"]],
    [558, [3, TRUE, 100, "0.1", [], [], [], "seed_potato", format[localize "STRM_seed_potato"], "RPM\Global\FNC_Inventory.sqf"]],
    [559, [3, TRUE, 100, "0.1", [], [], [], "seed_rye", format[localize "STRM_seed_rye"], "RPM\Global\FNC_Inventory.sqf"]],
    
	[560, [3, TRUE, 100, "1", [], [], [[322,1],[323,1]], "resource_fertilizer", format[localize "STRM_resource_fertilizer"], "RPM\Global\FNC_Inventory.sqf"]],
    [561, [3, TRUE, 1, "1", [], [], [[320,2],[324,2]], "resource_electronics", format[localize "STRM_resource_electronics"], "RPM\Global\FNC_Inventory.sqf"]],
   
	[562, [3, TRUE, 1, "1", [], [], [], "equipment_hcuffkey", format[localize "STRM_equipment_hcuffkey"], "RPM\Global\FNC_Inventory.sqf"]],
    
	[563, [3, TRUE, 1, "0.5", [], [], [], "cash_roll", format[localize "STRM_cash_roll"], "RPM\Global\FNC_Inventory.sqf"]],
    [564, [3, TRUE, 1, "3", [], [], [], "cash_bag", format[localize "STRM_cash_bag"], "RPM\Global\FNC_Inventory.sqf"]],
	
	[565, [3, TRUE, 1, "3", [], [], [[556,5],[505,2]], "Pseudoephedrine", format[localize "STRM_Pseudoephedrine"], "RPM\Global\FNC_Inventory.sqf"]],
	[566, [3, TRUE, 1, "3", [], [], [], "Cold_Medicine", format[localize "STRM_Cold_Medicine"], "RPM\Global\FNC_Inventory.sqf"]],
	[567, [3, TRUE, 1, "3", [], [], [[542,5]], "Respirator", format[localize "STRM_Respirator"], "RPM\Global\FNC_Inventory.sqf"]],
	[568, [3, TRUE, 1, "3", [], [], [[571,5],[535,5]], "Meth_Lab", format[localize "STRM_Meth_Lab"], "RPM\Global\FNC_Inventory.sqf"]],
	[569, [3, TRUE, 1, "3", [], [], [], "Storage_Box", format[localize "STRM_Storage_Box"], "RPM\Global\FNC_Inventory.sqf"]],
	[570, [3, TRUE, 1, "1", [], [], [], "resource_mari", format[localize "STRM_resource_mari"], "RPM\Global\FNC_Inventory.sqf"]],
	[571, [3, TRUE, 1, "1", [], [], [], "resource_wood", format[localize "STRM_resource_wood"], "RPM\Global\FNC_Inventory.sqf"]],
	[572, [3, TRUE, 1, "1", [], [], [[546,1],[572,2]], "equipment_axe", format[localize "STRM_equipment_axe"], "RPM\Global\FNC_Inventory.sqf"]]
];

RPM_AllUnitsArray = [
    [569, [4, TRUE, 5000, "50", [], [], [], "Citizen1", format[localize "STRM_Citizen1"], ""]],
    [570, [4, TRUE, 5000, "50", [], [], [], "Citizen2_EP1", format[localize "STRM_Citizen2_EP1", ""]]]
];

// Create an Array of Everything
RPM_AllMissionObjects = RPM_AllWeaponObjects + RPM_AllMagazineObjects + RPM_AllVehiclesObjects + RPM_AllItemsArray + RPM_AllUnitsArray;
RPM_ItemTypeArray = [
    ["Weapon"],
    ["Magazine"],
    ["Vehicle"],
    ["Item"],
    ["Unit"]
];
