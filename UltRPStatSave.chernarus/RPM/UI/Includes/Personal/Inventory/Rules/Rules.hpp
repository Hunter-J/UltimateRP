class RulesDialog: RscGroup {
	idd = 108;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		RulesFrame,
		RulesListBox,
		RulesCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.0625;
		y = 0.175;
		w = 0.875;
		h = 0.65;
	};
	class RulesFrame: RscFrame
	{
		idc = -1;
		text = "Rules";
		x = 0.0625;
		y = 0.175;
		w = 0.875;
		h = 0.65;
		moving = 1;
	};
	class RulesListBox: RscListbox
	{
		idc = 187;
		x = 0.078125;
		y = 0.225;
		w = 0.84375;
		h = 0.5;
	};
	class RulesCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.796875;
		y = 0.75;
		w = 0.125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
