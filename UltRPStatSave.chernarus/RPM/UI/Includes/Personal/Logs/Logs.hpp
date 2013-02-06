class LogsDialog: RscGroup
{
	idd = 124;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		LogsFrame,
		LogsLbLbl,
		LogsTypeLbl,
		LogsCmb,
		LogsLb,
		LogsClsBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0;
		y = 0;
		w = 1;
		h = 1;
	};
	class LogsFrame: RscFrame
	{
		idc = -1;
		text = "Logs";
		x = 0;
		y = 0;
		w = 1;
		h = 1;
		moving = 1;
	};
	class LogsLbLbl: RscText
	{
		idc = -1;
		text = "Player, Text, Mission Date, Server Time";
		x = 0.015625;
		y = 0.025;
		w = 0.359375;
		h = 0.05;
	};
	class LogsTypeLbl: RscText
	{
		idc = -1;
		text = "Type:";
		x = 0.71875;
		y = 0.025;
		w = 0.0625;
		h = 0.05;
	};
	class LogsCmb: RscCombo
	{
		idc = 295;
		x = 0.796875;
		y = 0.025;
		w = 0.1875;
		h = 0.05;
	};
	class LogsLb: RscListbox
	{
		idc = 296;
		x = 0.015625;
		y = 0.1;
		w = 0.96875;
		h = 0.8;
	};
	class LogsClsBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.890625;
		y = 0.925;
		w = 0.09375;
		h = 0.05;
		default = 1;
		action = "closeDialog 0;";
	};
};
