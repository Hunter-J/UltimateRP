class CrimeLogComposeDialog: RscGroup
{
	idd = 100;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		CrimeLogComposeFrame,
		CrimeLogComposeTitleLabel,
		CrimeLogComposeTitleEdit,
		CrimeLogComposeTypeLabel,
		CrimeLogComposeTypeCombo,
		CrimeLogComposePlayerLabel,
		CrimeLogComposePlayerCombo,
		CrimeLogComposeMessageLabel,
		CrimeLogComposeMessageEdit,
		CrimeLogComposeFileButton,
		CrimeLogComposeCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.3125;
		y = 0.225;
		w = 0.40625;
		h = 0.55;
	};
	class CrimeLogComposeFrame: RscFrame
	{
		idc = -1;
		text = "Crime Log - New";
		x = 0.3125;
		y = 0.225;
		w = 0.40625;
		h = 0.55;
		moving = 1;
	};
	class CrimeLogComposeTitleLabel: RscText
	{
		idc = -1;
		text = "Title:";
		x = 0.328125;
		y = 0.275;
		w = 0.109375;
		h = 0.05;
	};
	class CrimeLogComposeTitleEdit: RscEdit
	{
		idc = 109;
		text = "";
		x = 0.46875;
		y = 0.275;
		w = 0.234375;
		h = 0.05;
	};
	class CrimeLogComposeTypeLabel: RscText
	{
		idc = -1;
		text = "Type:";
		x = 0.328125;
		y = 0.35;
		w = 0.109375;
		h = 0.05;
	};
	class CrimeLogComposeTypeCombo: RscCombo
	{
		idc = 110;
		x = 0.46875;
		y = 0.35;
		w = 0.234375;
		h = 0.05;
	};
	class CrimeLogComposePlayerLabel: RscText
	{
		idc = -1;
		text = "Player:";
		x = 0.328125;
		y = 0.425;
		w = 0.109375;
		h = 0.05;
	};
	class CrimeLogComposePlayerCombo: RscCombo
	{
		idc = 111;
		x = 0.46875;
		y = 0.425;
		w = 0.234375;
		h = 0.05;
	};
	class CrimeLogComposeMessageLabel: RscText
	{
		idc = -1;
		text = "Message:";
		x = 0.328125;
		y = 0.5;
		w = 0.109375;
		h = 0.05;
	};
	class CrimeLogComposeMessageEdit: RscEdit
	{
		idc = 112;
		text = "";
		lineSpacing = 0.12;
		htmlControl = true;
		x = 0.328125;
		y = 0.575;
		w = 0.375;
		h = 0.1;
	};
	class CrimeLogComposeFileButton: RscButton
	{
		idc = 113;
		text = "File";
		x = 0.328125;
		y = 0.7;
		w = 0.078125;
		h = 0.05;
		default = 0;
	};
	class CrimeLogComposeCloseButton: RscButton
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
