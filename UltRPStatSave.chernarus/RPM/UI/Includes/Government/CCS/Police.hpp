class PoliceDialog: RscGroup {
	idd = 103;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		PoliceDialogFrame,
		PoliceDialogReleaseButton,
		PoliceDialogWantedButton,
		PoliceDialogCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.375;
		y = 0.4;
		w = 0.25;
		h = 0.2;
	};
	class PoliceDialogFrame: RscFrame
	{
		idc = -1;
		text = "Police";
		x = 0.375;
		y = 0.4;
		w = 0.25;
		h = 0.2;
		moving = 1;
	};
	class PoliceDialogReleaseButton: RscButton
	{
		idc = -1;
		text = "Release";
		x = 0.390625;
		y = 0.45;
		w = 0.09375;
		h = 0.05;
		default = 1;
		action = "call RPM_Cfg_Police_Release_GUI;";
	};
	class PoliceDialogWantedButton: RscButton
	{
		idc = -1;
		text = "Wanted";
		x = 0.515625;
		y = 0.45;
		w = 0.09375;
		h = 0.05;
		action = "call RPM_Cfg_Police_Wanted_GUI;";
	};
	class PoliceDialogCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.515625;
		y = 0.525;
		w = 0.09375;
		h = 0.05;
		default = 0;
		action = "closeDialog 0;";
	};
};
