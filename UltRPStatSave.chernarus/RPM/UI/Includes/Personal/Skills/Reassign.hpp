class ResetSkillsDialog: RscGroup
{
	idd = 125;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		ResetSkillsFrm,
		ResetSkillsConfirmBtn,
		ResetSkillsClsBtn,
		ResetSkillsInfoLbl,
		ResetSkillsAllocLbl,
		ResetSkillsAllocVal,
		ResetSkillsIndLbl,
		ResetSkillsIndEdt,
		ResetSkillsVehLbl,
		ResetSkillsVehEdt,
		ResetSkillsWepLbl,
		ResetSkillsWepEdt,
		ResetSkillsRoleLbl,
		ResetSkillsRoleVal,
		ResetSkillsCostLbl,
		ResetSkillsCostVal
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0;
		y = 0;
		w = 1;
		h = 1;
	};
	class ResetSkillsFrm: RscFrame
	{
		idc = -1;
		text = "Reset Skills";
		x = 0.203125;
		y = 0.15;
		w = 0.640625;
		h = 0.7;
	};
	class ResetSkillsConfirmBtn: RscButton
	{
		idc = 313;
		text = "Confirm";
		x = 0.21875;
		y = 0.775;
		w = 0.109375;
		h = 0.05;
	};
	class ResetSkillsClsBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.71875;
		y = 0.775;
		w = 0.109375;
		h = 0.05;
		action = "closeDialog 0";
	};
	class ResetSkillsInfoLbl: RscStructuredText
	{
		idc = 314;
		text = "By doing a reset you will lose all allocated points, and must reassign them here to the skill type you desire.";
		x = 0.21875;
		y = 0.2;
		w = 0.59375;
		h = 0.175;
	};
	class ResetSkillsAllocLbl: RscText
	{
		idc = -1;
		text = "Allocated Points:";
		x = 0.21875;
		y = 0.4;
		w = 0.203125;
		h = 0.05;
	};
	class ResetSkillsAllocVal: RscText
	{
		idc = 315;
		text = "9999";
		x = 0.421875;
		y = 0.4;
		w = 0.0625;
		h = 0.05;
	};
	class ResetSkillsIndLbl: RscText
	{
		idc = -1;
		text = "Industry:";
		x = 0.21875;
		y = 0.475;
		w = 0.109375;
		h = 0.05;
	};
	class ResetSkillsIndEdt: RscEdit
	{
		idc = 316;
		text = "999";
		x = 0.421875;
		y = 0.475;
		w = 0.0625;
		h = 0.05;
	};
	class ResetSkillsVehLbl: RscText
	{
		idc = -1;
		text = "Vehicles:";
		x = 0.21875;
		y = 0.55;
		w = 0.109375;
		h = 0.05;
	};
	class ResetSkillsVehEdt: RscEdit
	{
		idc = 317;
		text = "999";
		x = 0.421875;
		y = 0.55;
		w = 0.0625;
		h = 0.05;
	};
	class ResetSkillsWepLbl: RscText
	{
		idc = -1;
		text = "Weapons:";
		x = 0.21875;
		y = 0.625;
		w = 0.109375;
		h = 0.05;
	};
	class ResetSkillsWepEdt: RscEdit
	{
		idc = 318;
		text = "999";
		x = 0.421875;
		y = 0.625;
		w = 0.0625;
		h = 0.05;
	};
	class ResetSkillsRoleLbl: RscText
	{
		idc = -1;
		text = "Criminal:";
		x = 0.21875;
		y = 0.7;
		w = 0.109375;
		h = 0.05;
	};
	class ResetSkillsRoleVal: RscEdit
	{
		idc = 319;
		text = "999";
		x = 0.421875;
		y = 0.7;
		w = 0.0625;
		h = 0.05;
	};
	class ResetSkillsCostLbl: RscText
	{
		idc = -1;
		text = "Cost: $";
		x = 0.453125;
		y = 0.775;
		w = 0.09375;
		h = 0.05;
	};
	class ResetSkillsCostVal: RscText
	{
		idc = 320;
		text = "999999";
		x = 0.515625;
		y = 0.775;
		w = 0.09375;
		h = 0.05;
	};
};
