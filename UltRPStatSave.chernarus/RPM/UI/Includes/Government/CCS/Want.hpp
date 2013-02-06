class WantDialog: RscGroup {
	idd = 115;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		WantFrame,
		WantCrimeLbl,
		WantChoseLbl,
		WantCmb1,
		WantCmb2,
		WantCmb3,
		WantJailTimeLbl,
		WantJailTimeValEdt,
		WantTargetLbl,
		WantTargetValLbl,
		WantBountyLbl,
		WantBountyValLbl,
		WantBtn,
		WantClsBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.25;
		y = 0.175;
		w = 0.5;
		h = 0.65;
	};
	class WantFrame: RscFrame
	{
		idc = -1;
		text = "Police - Wanted - Want";
		x = 0.25;
		y = 0.175;
		w = 0.5;
		h = 0.65;
		moving = 1;
	};
	class WantCrimeLbl: RscText
	{
		idc = -1;
		text = "Player can only be wanted for 3 crimes.";
		x = 0.359375;
		y = 0.2;
		w = 0.46875;
		h = 0.05;
	};
	class WantChoseLbl: RscText
	{
		idc = -1;
		text = "Choose only major crimes involved.";
		x = 0.375;
		y = 0.25;
		w = 0.40625;
		h = 0.05;
	};
	class WantCmb1: RscCombo
	{
		idc = 233;
		x = 0.34375;
		y = 0.325;
		w = 0.3125;
		h = 0.05;
	};
	class WantCmb2: RscCombo
	{
		idc = 234;
		x = 0.34375;
		y = 0.4;
		w = 0.3125;
		h = 0.05;
	};
	class WantCmb3: RscCombo
	{
		idc = 235;
		x = 0.34375;
		y = 0.475;
		w = 0.3125;
		h = 0.05;
	};
	class WantJailTimeLbl: RscText
	{
		idc = -1;
		text = "Total jail time:";
		x = 0.40625;
		y = 0.55;
		w = 0.1875;
		h = 0.05;
	};
	class WantJailTimeValEdt: RscEdit
	{
		idc = 236;
		text = "0";
		x = 0.53125;
		y = 0.55;
		w = 0.0625;
		h = 0.05;
	};
	class WantTargetLbl: RscText
	{
		idc = -1;
		text = "Target:";
		x = 0.40625;
		y = 0.6;
		w = 0.09375;
		h = 0.05;
	};
	class WantTargetValLbl: RscText
	{
		idc = 239;
		text = "None";
		x = 0.46875;
		y = 0.6;
		w = 0.28125;
		h = 0.05;
	};
	class WantBountyLbl: RscText
	{
		idc = -1;
		text = "Bounty: $";
		x = 0.40625;
		y = 0.65;
		w = 0.125;
		h = 0.05;
	};
	class WantBountyValLbl: RscText
	{
		idc = 240;
		text = "0";
		x = 0.4775;
		y = 0.65;
		w = 0.09375;
		h = 0.05;
	};
	class WantBtn: RscButton
	{
		idc = 237;
		text = "Want";
		x = 0.265625;
		y = 0.75;
		w = 0.09375;
		h = 0.05;
		default = 1;
	};
	class WantClsBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.640625;
		y = 0.75;
		w = 0.09375;
		h = 0.05;
		default = 0;
		action = "closeDialog 0;";
	};
};
