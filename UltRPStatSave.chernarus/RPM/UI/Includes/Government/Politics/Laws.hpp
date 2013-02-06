class PoliticsLawsDialog: RscGroup {
	idd = 110;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		PoliticsLawsFrame,
		PoliticsLawsLawLabel,
		PoliticsLawsListbox,
		PoliticsLawsEditButton,
		PoliticsLawsCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.171875;
		y = 0.125;
		w = 0.671875;
		h = 0.75;
	};
	class PoliticsLawsFrame: RscFrame
	{
		idc = -1;
		text = "Politics - Laws";
		x = 0.171875;
		y = 0.125;
		w = 0.671875;
		h = 0.75;
		moving = 1;
	};
	class PoliticsLawsLawLabel: RscText
	{
		idc = -1;
		text = "Law:";
		x = 0.1875;
		y = 0.15;
		w = 0.0625;
		h = 0.05;
	};
	class PoliticsLawsListbox: RscListbox
	{
		idc = 208;
		x = 0.1875;
		y = 0.2;
		w = 0.640625;
		h = 0.575;
	};
	class PoliticsLawsEditButton: RscButton
	{
		idc = 209;
		text = "Edit";
		x = 0.1875;
		y = 0.8;
		w = 0.078125;
		h = 0.05;
		default = 1;
	};
	class PoliticsLawsCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.75;
		y = 0.8;
		w = 0.078125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 0;
	};
};
