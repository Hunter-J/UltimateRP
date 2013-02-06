class VehReleaseDialog: RscGroup {
	idd = 106;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		VehReleaseDialogFrame,
		VehReleaseDialogListBox,
		VehReleaseDialogPlayerLabel,
		VehReleaseDialogReleaseButton,
		VehReleaseDialogCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.21875;
		y = 0.2;
		w = 0.5625;
		h = 0.6;
	};
	class VehReleaseDialogFrame: RscFrame
	{
		idc = -1;
		text = "Impound - Release";
		x = 0.21875;
		y = 0.2;
		w = 0.5625;
		h = 0.6;
		moving = 1;
	};
	class VehReleaseDialogListBox: RscListbox
	{
		idc = 185;
		x = 0.234375;
		y = 0.275;
		w = 0.53125;
		h = 0.425;
	};
	class VehReleaseDialogPlayerLabel: RscText
	{
		idc = -1;
		text = "Vehicle:";
		x = 0.234375;
		y = 0.225;
		w = 0.09375;
		h = 0.05;
	};
	class VehReleaseDialogReleaseButton: RscButton
	{
		idc = 186;
		text = "Release";
		x = 0.234375;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		default = 1;
	};
	class VehReleaseDialogCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.671875;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		default = 0;
		action = "closeDialog 0;";
	};
};
