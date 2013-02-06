class PoliticsLawsEditDialog: RscGroup {
	idd = 111;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		PoliticsLawsEditFrame,
		PoliticsLawsEditLawLabel,
		PoliticsLawsEdit,
		PoliticsLawsEditSubmitButton,
		PoliticsLawsEditCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.15625;
		y = 0.4;
		w = 0.6875;
		h = 0.25;
	};
	class PoliticsLawsEditFrame: RscFrame
	{
		idc = -1;
		text = "Politics - Laws - Edit";
		x = 0.15625;
		y = 0.4;
		w = 0.6875;
		h = 0.25;
		moving = 1;
	};
	class PoliticsLawsEditLawLabel: RscText
	{
		idc = -1;
		text = "Law:";
		x = 0.171875;
		y = 0.425;
		w = 0.0625;
		h = 0.05;
	};
	class PoliticsLawsEdit: RscEdit
	{
		idc = 210;
		x = 0.171875;
		y = 0.5;
		w = 0.65625;
		h = 0.05;
	};
	class PoliticsLawsEditSubmitButton: RscButton
	{
		idc = 211;
		text = "Submit";
		x = 0.171875;
		y = 0.575;
		w = 0.09375;
		h = 0.05;
		default = 1;
	};
	class PoliticsLawsEditCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.734375;
		y = 0.575;
		w = 0.09375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 0;
	};
};
