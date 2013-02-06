class StatsDialog: RscGroup {
	idd = 14;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		StatsFrame,
		StatsListBox,
		StatsCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.21875;
		y = 0.175;
		w = 0.5625;
		h = 0.65;
	};
	class StatsFrame: RscFrame
	{
		idc = 179;
		text = "Stats";
		x = 0.21875;
		y = 0.175;
		w = 0.5625;
		h = 0.65;
		moving = 1;
	};
	class StatsListBox: RscListbox
	{
		idc = 70;
		x = 0.234375;
		y = 0.225;
		w = 0.53125;
		h = 0.5;
	};
	class StatsCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.640624;
		y = 0.75;
		w = 0.125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
