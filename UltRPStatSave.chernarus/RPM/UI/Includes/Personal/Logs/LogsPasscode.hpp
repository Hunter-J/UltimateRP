class LogsPasscodeDialog: RscGroup
{
	idd = 125;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		LogsPasscodeFrm,
		LogsPasscodeWarning,
		LogsPasscodeUIDLbl,
		LogsPasscodeUIDVal,
		LogsPasscodePasscodeLbl,
		LogsPasscodePasscodeVal,
		LogsPasscodeSubmitBtn,
		LogsPasscodeClsBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.3125;
		y = 0.3;
		w = 0.375;
		h = 0.4;
	};
	class LogsPasscodeFrm: RscFrame
	{
		idc = -1;
		text = "Logs - Passcode";
		x = 0.3125;
		y = 0.3;
		w = 0.375;
		h = 0.4;
		moving = 1;
	};
	class LogsPasscodeWarning: RscStructuredText
	{
		idc = -1;
		text = "Warning!  Log Access Is Logged";
		x = 0.328125;
		y = 0.325;
		w = 0.34375;
		h = 0.15;
	};
	class LogsPasscodeUIDLbl: RscText
	{
		idc = -1;
		text = "UID: #";
		x = 0.328125;
		y = 0.475;
		w = 0.078125;
		h = 0.05;
	};
	class LogsPasscodeUIDVal: RscText
	{
		idc = 297;
		text = "";
		x = 0.453125;
		y = 0.475;
		w = 0.203125;
		h = 0.05;
	};
	class LogsPasscodePasscodeLbl: RscText
	{
		idc = -1;
		text = "Passcode:";
		x = 0.328125;
		y = 0.525;
		w = 0.109375;
		h = 0.05;
	};
	class LogsPasscodePasscodeVal: RscEdit
	{
		idc = 298;
		text = "";
		x = 0.453125;
		y = 0.525;
		w = 0.15625;
		h = 0.05;
	};
	class LogsPasscodeSubmitBtn: RscButton
	{
		idc = 299;
		text = "Submit";
		x = 0.328125;
		y = 0.625;
		w = 0.09375;
		h = 0.05;
		default = 1;
	};
	class LogsPasscodeClsBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.578125;
		y = 0.625;
		w = 0.09375;
		h = 0.05;
		default = 0;
		action = "closeDialog 0;";
	};
}
