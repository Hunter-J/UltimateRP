class CrimeLogReadDialog: RscGroup
{
	idd = 102;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		CrimeLogReadDialogFrame,
		CrimeLogReadDialogTitleLabel,
		CrimeLogReadDialogTitleTextLabel,
		CrimeLogReadDialogTypeLabel,
		CrimeLogReadDialogTypeTextLabel,
		CrimeLogReadDialogSubmitterLabel,
		CrimeLogReadDialogSubmitterTextLabel,
		CrimeLogReadDialogMessageLabel,
		CrimeLogReadDialogMessageEdit,
		CrimeLogReadDialogUpdateButton,
		CrimeLogReadDialogDeleteButton,
		CrimeLogReadDialogTargetLabel,
		CrimeLogReadDialogTargetTextLabel,
		CrimeLogReadDialogCloseDialog
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.3125;
		y = 0.225;
		w = 0.40625;
		h = 0.55;
	};
	class CrimeLogReadDialogFrame: RscFrame
	{
		idc = 114;
		text = "Crime Log - Read";
		x = 0.3125;
		y = 0.225;
		w = 0.40625;
		h = 0.55;
		moving = 1;
	};
	class CrimeLogReadDialogTitleLabel: RscText
	{
		idc = -1;
		text = "Title:";
		x = 0.328125;
		y = 0.25;
		w = 0.125;
		h = 0.05;
	};
	class CrimeLogReadDialogTitleTextLabel: RscText
	{
		idc = 115;
		text = "Titletext";
		x = 0.46875;
		y = 0.25;
		w = 0.234375;
		h = 0.05;
	};
	class CrimeLogReadDialogTypeLabel: RscText
	{
		idc = -1;
		text = "Type:";
		x = 0.328125;
		y = 0.3;
		w = 0.125;
		h = 0.05;
	};
	class CrimeLogReadDialogTypeTextLabel: RscText
	{
		idc = 116;
		text = "Typetext";
		x = 0.46875;
		y = 0.3;
		w = 0.234375;
		h = 0.05;
	};
	class CrimeLogReadDialogSubmitterLabel: RscText
	{
		idc = 117;
		text = "Submitter:";
		x = 0.328125;
		y = 0.35;
		w = 0.125;
		h = 0.05;
	};
	class CrimeLogReadDialogSubmitterTextLabel: RscText
	{
		idc = 118;
		text = "Submittertext";
		x = 0.46875;
		y = 0.35;
		w = 0.234375;
		h = 0.05;
	};
	class CrimeLogReadDialogMessageLabel: RscText
	{
		idc = 119;
		text = "Message:";
		x = 0.328125;
		y = 0.5;
		w = 0.109375;
		h = 0.05;
	};
	class CrimeLogReadDialogMessageEdit: RscEdit
	{
		idc = 120;
		text = "";
		lineSpacing = 0.12;
		htmlControl = true;
		x = 0.328125;
		y = 0.575;
		w = 0.375;
		h = 0.1;
	};
	class CrimeLogReadDialogUpdateButton: RscButton
	{
		idc = 121;
		text = "Update";
		x = 0.421875;
		y = 0.7;
		w = 0.078125;
		h = 0.05;
		default = 0;
	};
	class CrimeLogReadDialogDeleteButton: RscButton
	{
		idc = 122;
		text = "Delete";
		x = 0.328125;
		y = 0.7;
		w = 0.078125;
		h = 0.05;
		default = 0;
	};
	class CrimeLogReadDialogTargetLabel: RscText
	{
		idc = -1;
		text = "Target:";
		x = 0.328125;
		y = 0.4;
		w = 0.125;
		h = 0.05;
	};
	class CrimeLogReadDialogTargetTextLabel: RscText
	{
		idc = 123;
		text = "None";
		x = 0.46875;
		y = 0.4;
		w = 0.234375;
		h = 0.05;
	};
	class CrimeLogReadDialogCloseDialog: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.625;
		y = 0.7;
		w = 0.078125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};