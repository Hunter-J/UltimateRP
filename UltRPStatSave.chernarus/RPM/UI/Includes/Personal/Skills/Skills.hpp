class SkillsDialog: RscGroup
{
	idd = 124;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		SkillsFrm,
		SkillsIndPtsFrm,
		SkillsIndPtsVal,
		SkillsVehPtsFrm,
		SkillsVehPtsVal,
		SkillsWepsPtsFrm,
		SkillsWepsPtsVal,
		SkillsRolePtsFrm,
		SkillsRolePtsVal,
		SkillsTextLine1,
		SkillsTextLine2,
		SkillsTextLine3,
		SkillsSynopsisLbl,
		SkillsTextLine4,
		SkillsSkillCmb,
		SkillsPtsEdt,
		SkillsCostLbl,
		SkillsCostDollarLbl,
		SkillsCostVal,
		SkillsAddBtn,
		SkillsResetBtn,
		SkillsCashLbl,
		SkillsCashVal,
		SkillsCurPtsLbl,
		SkillsCurPtsVal,
		SkillsMaxPtsLbl,
		SkillsMaxPtsVal,
		SkillsCloseBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0;
		y = 0;
		w = 1;
		h = 1;
	};
	class SkillsFrm: RscFrame
	{
		idc = -1;
		text = "Skills";
		x = 0;
		y = 0;
		w = 1;
		h = 1;
		moving = 1;
	};
	class SkillsIndPtsFrm: RscFrame
	{
		idc = -1;
		text = "Industry";
		x = 0.03125;
		y = 0.025;
		w = 0.21875;
		h = 0.125;
	};
	class SkillsIndPtsVal: RscText
	{
		idc = 295;
		text = "0";
		x = 0.109375;
		y = 0.075;
		w = 0.046875;
		h = 0.05;
	};
	class SkillsVehPtsFrm: RscFrame
	{
		idc = -1;
		text = "Vehicles";
		x = 0.28125;
		y = 0.025;
		w = 0.21875;
		h = 0.125;
	};
	class SkillsVehPtsVal: RscText
	{
		idc = 296;
		text = "0";
		x = 0.359375;
		y = 0.075;
		w = 0.046875;
		h = 0.05;
	};
	class SkillsWepsPtsFrm: RscFrame
	{
		idc = -1;
		text = "Weapons";
		x = 0.515625;
		y = 0.025;
		w = 0.21875;
		h = 0.125;
	};
	class SkillsWepsPtsVal: RscText
	{
		idc = 297;
		text = "0";
		x = 0.59375;
		y = 0.075;
		w = 0.046875;
		h = 0.05;
	};
	class SkillsRolePtsFrm: RscFrame
	{
		idc = 298;
		text = "Criminal";
		x = 0.75;
		y = 0.025;
		w = 0.21875;
		h = 0.125;
	};
	class SkillsRolePtsVal: RscText
	{
		idc = 299;
		text = "0";
		x = 0.828125;
		y = 0.075;
		w = 0.046875;
		h = 0.05;
	};
	class SkillsTextLine1: RscText
	{
		idc = 300;
		text = "";
		x = 0.015625;
		y = 0.175;
		w = 0.546875;
		h = 0.05;
	};
	class SkillsTextLine2: RscText
	{
		idc = 301;
		text = "";
		x = 0.015625;
		y = 0.225;
		w = 0.546875;
		h = 0.05;
	};
	class SkillsTextLine3: RscText
	{
		idc = 302;
		text = "";
		x = 0.015625;
		y = 0.275;
		w = 0.546875;
		h = 0.05;
	};
	class SkillsSynopsisLbl: RscStructuredText
	{
		idc = 303;
		text = "";
		x = 0.015625;
		y = 0.45;
		w = 0.71875;
		h = 0.375;
	};
	class SkillsTextLine4: RscText
	{
		idc = 304;
		text = "";
		x = 0.015625;
		y = 0.75;
		w = 0.546875;
		h = 0.05;
	};
	class SkillsSkillCmb: RscCombo
	{
		idc = 305;
		x = 0.765625;
		y = 0.175;
		w = 0.21875;
		h = 0.05;
	};
	class SkillsPtsEdt: RscEdit
	{
		idc = 306;
		text = "1";
		x = 0.765625;
		y = 0.25;
		w = 0.0625;
		h = 0.05;
	};
	class SkillsCostLbl: RscText
	{
		idc = -1;
		text = "Cost:";
		x = 0.84375;
		y = 0.25;
		w = 0.0625;
		h = 0.05;
	};
	class SkillsCostDollarLbl: RscText
	{
		idc = -1;
		text = "$";
		x = 0.84375;
		y = 0.3;
		w = 0.03125;
		h = 0.05;
	};
	class SkillsCostVal: RscText
	{
		idc = 307;
		text = "0";
		x = 0.859375;
		y = 0.3;
		w = 0.09375;
		h = 0.05;
	};
	class SkillsAddBtn: RscButton
	{
		idc = 308;
		text = "Add Points";
		x = 0.84375;
		y = 0.35;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class SkillsResetBtn: RscButton
	{
		idc = 309;
		text = "Reset Points";
		x = 0.84375;
		y = 0.425;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class SkillsCashLbl: RscText
	{
		idc = -1;
		text = "Cash: $";
		x = 0.015625;
		y = 0.825;
		w = 0.09375;
		h = 0.05;
	};
	class SkillsCashVal: RscText
	{
		idc = 310;
		text = "0";
		x = 0.0625;
		y = 0.825;
		w = 0.09375;
		h = 0.05;
	};
	class SkillsCurPtsLbl: RscText
	{
		idc = -1;
		text = "Total Points:";
		x = 0.015625;
		y = 0.875;
		w = 0.15625;
		h = 0.05;
	};
	class SkillsCurPtsVal: RscText
	{
		idc = 311;
		text = "0";
		x = 0.21875;
		y = 0.875;
		w = 0.0625;
		h = 0.05;
	};
	class SkillsMaxPtsLbl: RscText
	{
		idc = -1;
		text = "Maximum Points:";
		x = 0.015625;
		y = 0.925;
		w = 0.1875;
		h = 0.05;
	};
	class SkillsMaxPtsVal: RscText
	{
		idc = 312;
		text = "0";
		x = 0.21875;
		y = 0.925;
		w = 0.0625;
		h = 0.05;
	};
	class SkillsCloseBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.90625;
		y = 0.925;
		w = 0.078125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
