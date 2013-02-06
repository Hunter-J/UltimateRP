class WantedDialog: RscGroup {
	idd = 105;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		WantedDialogFrame,
		WantedDialogPlayerLabel,
		WantedDialogListBox,
		WantedDialogUnwantButton,
		WantedDialogCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.34375;
		y = 0.2;
		w = 0.3125;
		h = 0.6;
	};
	class WantedDialogFrame: RscFrame
	{
		idc = -1;
		text = "Police - Wanted";
		x = 0.34375;
		y = 0.2;
		w = 0.3125;
		h = 0.6;
		moving = 1;
	};
	class WantedDialogPlayerLabel: RscText
	{
		idc = -1;
		text = "Player:";
		x = 0.359375;
		y = 0.225;
		w = 0.09375;
		h = 0.05;
	};
	class WantedDialogListBox: RscListbox
	{
		idc = 183;
		x = 0.359375;
		y = 0.275;
		w = 0.265625;
		h = 0.425;
	};
	class WantedDialogUnwantButton: RscButton
	{
		idc = 184;
		text = "Want";
		x = 0.359375;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		default = 1;
	};
	class WantedDialogCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.546875;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		default = 0;
		action = "closeDialog 0;";
	};
};
