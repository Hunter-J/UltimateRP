class ArrestedDialog: RscGroup
{
	idd = 17;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		ArrestFrame,
		ArrestCrimeLbl,
		ArrestTimeLbl,
		ArrestTimeValLbl,
		ArrestCrimeLbl1,
		ArrestCrimeLbl2,
		ArrestCrimeLbl3,
		ArrestMinLbl,
		ArrestTrnsLbl,
		ArrestTrnsValLbl,
		ArrestTrnsSecLbl
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.28125;
		y = 0.3;
		w = 0.4375;
		h = 0.4;
	};
	class ArrestFrame: RscFrame
	{
		idc = -1;
		text = "Arrested";
		x = 0.28125;
		y = 0.3;
		w = 0.4375;
		h = 0.4;
		moving = 1;
	};
	class ArrestCrimeLbl: RscText
	{
		idc = -1;
		text = "You have been arrested for:";
		x = 0.390625;
		y = 0.325;
		w = 0.34375;
		h = 0.05;
	};
	class ArrestTimeLbl: RscText
	{
		idc = -1;
		text = "Total Jail Time:";
		x = 0.390625;
		y = 0.575;
		w = 0.1875;
		h = 0.05;
	};
	class ArrestTimeValLbl: RscText
	{
		idc = 268;
		text = "60";
		x = 0.5;
		y = 0.575;
		w = 0.03125;
		h = 0.05;
	};
	class ArrestCrimeLbl1: RscText
	{
		idc = 269;
		text = "1.) None";
		x = 0.40625;
		y = 0.4;
		w = 0.375;
		h = 0.05;
	};
	class ArrestCrimeLbl2: RscText
	{
		idc = 270;
		text = "2.) None";
		x = 0.40625;
		y = 0.45;
		w = 0.375;
		h = 0.05;
	};
	class ArrestCrimeLbl3: RscText
	{
		idc = 271;
		text = "3.) None";
		x = 0.40625;
		y = 0.5;
		w = 0.375;
		h = 0.05;
	};
	class ArrestMinLbl: RscText
	{
		idc = -1;
		text = "minute(s)";
		x = 0.52;
		y = 0.575;
		w = 0.09375;
		h = 0.05;
	};
	class ArrestTrnsLbl: RscText
	{
		idc = -1;
		text = "";
		x = 0.375;
		y = 0.625;
		w = 0.265625;
		h = 0.05;
	};
	class ArrestTrnsValLbl: RscText
	{
		idc = 272;
		text = "";
		x = 0.535;
		y = 0.625;
		w = 0.03125;
		h = 0.05;
	};
	class ArrestTrnsSecLbl: RscText
	{
		idc = -1;
		text = "";
		x = 0.54725;
		y = 0.625;
		w = 0.109375;
		h = 0.05;
	};
};
