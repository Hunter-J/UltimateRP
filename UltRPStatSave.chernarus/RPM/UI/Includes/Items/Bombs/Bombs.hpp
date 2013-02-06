class BombDialog: RscGroup
{
	idd = 140;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		BombFrame,
		BombIDLabel,
		BombIDTargetLabel,
		BombTimeLabel,
		BombTimeSlider,
		BombTimeSLabel,
		BombSpeedLabel,
		BombSpeedSlider,
		BombSpeedKPHLabel,
		BombCodeLabel,
		BombCodeEdit,
		BombArmButton,
		BombCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.328125;
		y = 0.25;
		w = 0.34375;
		h = 0.45;
	};
	class BombFrame: RscFrame
	{
		idc = 150;
		text = "Bomb";
		x = 0.328125;
		y = 0.25;
		w = 0.34375;
		h = 0.45;
		moving = 1;
	};
	class BombIDLabel: RscText
	{
		idc = -1;
		text = "Bomb ID:";
		x = 0.34375;
		y = 0.275;
		w = 0.109375;
		h = 0.05;
	};
	class BombIDTargetLabel: RscText
	{
		idc = 140;
		text = "Civ1_1234";
		x = 0.4125;
		y = 0.275;
		w = 0.125;
		h = 0.05;
	};
	class BombTimeLabel: RscText
	{
		idc = 141;
		text = "Time:";
		x = 0.34375;
		y = 0.35;
		w = 0.078125;
		h = 0.05;
	};
	class BombTimeSlider: RscSliderH
	{
		idc = 142;
		x = 0.4375;
		y = 0.475;
		w = 0.21875;
		h = 0.05;
	};
	class BombTimeSLabel: RscText
	{
		idc = 143;
		text = "10 | 20 | 30 | 60 | 120";
		x = 0.456;
		y = 0.4075;
		w = 0.296875;
		h = 0.025;
	};
	class BombSpeedLabel: RscText
	{
		idc = 144;
		text = "Speed:";
		x = 0.34375;
		y = 0.475;
		w = 0.078125;
		h = 0.05;
	};
	class BombSpeedSlider: RscSliderH
	{
		idc = 145;
		x = 0.4375;
		y = 0.35;
		w = 0.21875;
		h = 0.05;
	};
	class BombSpeedKPHLabel: RscText
	{
		idc = 146;
		text = "10 | 25 | 55 | 70 | 90";
		x = 0.457;
		y = 0.5325;
		w = 0.296875;
		h = 0.025;
	};
	class BombCodeLabel: RscText
	{
		idc = 147;
		text = "Code:";
		x = 0.46875;
		y = 0.575;
		w = 0.078125;
		h = 0.05;
	};
	class BombCodeEdit: RscEdit
	{
		idc = 148;
		text = "1";
		x = 0.453125;
		y = 0.625;
		w = 0.09375;
		h = 0.05;
	};
	class BombArmButton: RscButton
	{
		idc = 149;
		text = "Arm";
		x = 0.34375;
		y = 0.625;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class BombCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.5625;
		y = 0.625;
		w = 0.09375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};