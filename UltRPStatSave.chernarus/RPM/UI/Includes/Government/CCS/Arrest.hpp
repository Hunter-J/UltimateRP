class ArrestDialog: RscGroup
{
	idd = 15;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		ArrestFrame,
		ArrestCrimeLbl,
		ArrestChoseLbl,
		ArrestCmb1,
		ArrestCmb2,
		ArrestCmb3,
		ArrestJailTimeLbl,
		ArrestJailTimeValEdt,
		ArrestSubmitBtn,
		ArrestClsBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.25;
		y = 0.2;
		w = 0.5;
		h = 0.6;
	};
	class ArrestFrame: RscFrame
	{
		idc = -1;
		text = "Arrest";
		x = 0.25;
		y = 0.2;
		w = 0.5;
		h = 0.6;
		moving = 1;
	};
	class ArrestCrimeLbl: RscText
	{
		idc = -1;
		text = "Player can only be jailed for 3 crimes.";
		x = 0.359375;
		y = 0.25;
		w = 0.46875;
		h = 0.05;
	};
	class ArrestChoseLbl: RscText
	{
		idc = -1;
		text = "Choose only major crimes involved.";
		x = 0.375;
		y = 0.3;
		w = 0.390625;
		h = 0.05;
	};
	class ArrestCmb1: RscCombo
	{
		idc = 152;
		x = 0.34375;
		y = 0.375;
		w = 0.3125;
		h = 0.05;
	};
	class ArrestCmb2: RscCombo
	{
		idc = 153;
		x = 0.34375;
		y = 0.45;
		w = 0.3125;
		h = 0.05;
	};
	class ArrestCmb3: RscCombo
	{
		idc = 154;
		x = 0.34375;
		y = 0.525;
		w = 0.3125;
		h = 0.05;
	};
	class ArrestJailTimeLbl: RscText
	{
		idc = -1;
		text = "Total Jail Time:";
		x = 0.40625;
		y = 0.625;
		w = 0.1875;
		h = 0.05;
	};
	class ArrestJailTimeValEdt: RscEdit
	{
		idc = 155;
		text = "1";
		x = 0.53125;
		y = 0.625;
		w = 0.0625;
		h = 0.05;
	};
	class ArrestSubmitBtn: RscButton
	{
		idc = 156;
		text = "Submit";
		x = 0.265625;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		default = 1;
	};
	class ArrestClsBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.640625;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 0;
	};
};
