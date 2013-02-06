class GroupFeesDialog: RscGroup
{
	idd = 11;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		GroupFeesDialogFrame,
		GroupFeesDialogLabel,
		GroupFeesDialogEdit,
		GroupFeesDialogSubmitButton,
		GroupFeesDialogCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.375;
		y = 0.375;
		w = 0.25;
		h = 0.25;
	};
	class GroupFeesDialogFrame: RscFrame
	{
		idc = -1;
		text = "Group - Fees";
		x = 0.375;
		y = 0.375;
		w = 0.25;
		h = 0.25;
		moving = 1;
	};
	class GroupFeesDialogLabel: RscText
	{
		idc = -1;
		text = "Fees: $";
		x = 0.421875;
		y = 0.45;
		w = 0.078125;
		h = 0.05;
	};
	class GroupFeesDialogEdit: RscEdit
	{
		idc = 86;
		//text = "1000";
		x = 0.5;
		y = 0.45;
		w = 0.078125;
		h = 0.05;
	};
	class GroupFeesDialogSubmitButton: RscButton
	{
		idc = 87;
		text = "Submit";
		x = 0.390625;
		y = 0.55;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class GroupFeesDialogCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.515625;
		y = 0.55;
		w = 0.09375;
		h = 0.05;
		default = 1;
		action = "closeDialog 0;";
	};
};
