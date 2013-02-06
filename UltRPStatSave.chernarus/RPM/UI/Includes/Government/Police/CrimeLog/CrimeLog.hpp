class CrimeLogDialog: RscGroup
{
	idd = 101;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		CrimeLogFrame,
		CrimeLogTitleLabel,
		CrimeLogTitleListBox,
		CrimeLogTypeLabel,
		CrimeLogTypeListBox,
		CrimeLogReadButton,
		CrimeLogNewButton,
		CrimeLogDeleteButton,
		CrimeLogCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.3125;
		y = 0.225;
		w = 0.40625;
		h = 0.55;
	};
	class CrimeLogFrame: RscFrame
	{
		idc = -1;
		text = "Crime Log";
		x = 0.3125;
		y = 0.225;
		w = 0.40625;
		h = 0.55;
		moving = 1;
	};
	class CrimeLogTitleLabel: RscText
	{
		idc = -1;
		text = "Title";
		x = 0.34375;
		y = 0.25;
		w = 0.078125;
		h = 0.05;
	};
	class CrimeLogTitleListBox: RscListbox
	{
		idc = 104;
		x = 0.34375;
		y = 0.3;
		w = 0.21875;
		h = 0.375;
		color[] = {1,1,1,0};
	};
	class CrimeLogTypeLabel: RscText
	{
		idc = -1;
		text = "Type";
		x = 0.5625;
		y = 0.25;
		w = 0.078125;
		h = 0.05;
	};
	class CrimeLogTypeListBox: RscListbox
	{
		idc = 105;
		x = 0.5625;
		y = 0.3;
		w = 0.125;
		h = 0.375;
		color[] = {1,1,1,0};
	};
	class CrimeLogReadButton: RscButton
	{
		idc = 106;
		text = "Read";
		x = 0.328125;
		y = 0.7;
		w = 0.078125;
		h = 0.05;
		default = 0;
	};
	class CrimeLogNewButton: RscButton
	{
		idc = 107;
		text = "New";
		x = 0.421875;
		y = 0.7;
		w = 0.078125;
		h = 0.05;
		default = 0;
	};
	class CrimeLogDeleteButton: RscButton
	{
		idc = 108;
		text = "Delete";
		x = 0.53125;
		y = 0.7;
		w = 0.078125;
		h = 0.05;
		default = 0;
	};
	class CrimeLogCloseButton: RscButton
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
