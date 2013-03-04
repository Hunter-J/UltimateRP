class BankDialog: RscGroup {
	idd = 10;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		BankFrame,
		BankAccountLabel,
		BankCashLabel,
		BankTargetLabel,
		BankAmountLabel,
		BankCashValue,
		BankAccountValue,
		BankAmountEdit,
		BankTargetCombo,
		BankDepositButton,
		BankTransferButton,
		BankWithdrawButton,
		BankCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.284334 * safezoneW + safezoneX;
		y = 0.365 * safezoneH + safezoneY;
		w = 0.478734 * safezoneW;
		h = 0.2575 * safezoneH;
	};
	class BankFrame: RscFrame
	{
		idc = -1;
		text = "Bank";
		x = 0.284334 * safezoneW + safezoneX;
		y = 0.365 * safezoneH + safezoneY;
		w = 0.478734 * safezoneW;
		h = 0.2575 * safezoneH;
		moving = 1;
	};
	class BankDepositButton: RscShortcutButton
	{
		idc = 70;
		text = "Deposit";
		x = 0.610175 * safezoneW + safezoneX;
		y = 0.3725 * safezoneH + safezoneY;
		w = 0.100539 * safezoneW;
		h = 0.08 * safezoneH;
	};
	class BankWithdrawButton: RscShortcutButton
	{
		idc = 72;
		text = "Withdraw";
		x = 0.608615 * safezoneW + safezoneX;
		y = 0.43 * safezoneH + safezoneY;
		w = 0.113042 * safezoneW;
		h = 0.08 * safezoneH;
		default = 0;
	};
	class BankAccountLabel: RscText
	{
		idc = -1;
		text = "Account:";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.395 * safezoneH + safezoneY;
		w = 0.0614698 * safezoneW;
		h = 0.03375 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 0, 5, 0, 1 };
	};
	class BankAccountValue: RscText
	{
		idc = 74;
		text = "$0";
		x = 0.373153 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.17103 * safezoneW;
		h = 0.0294455 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 0, 5, 0, 1 };
	};
	class BankCashLabel: RscText
	{
		idc = -1;
		text = "Cash:";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.4475 * safezoneH + safezoneY;
		w = 0.0372466 * safezoneW;
		h = 0.0325 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 0, 5, 0, 1 };
	};
	class BankTargetLabel: RscText
	{
		idc = -1;
		text = "Target:";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.5575 * safezoneH + safezoneY;
		w = 0.0536558 * safezoneW;
		h = 0.03625 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 5, 0, 0, 1 };
	};
	class BankAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.0638139 * safezoneW;
		h = 0.035 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 0, 5, 0, 1 };
	};
	class BankTargetCombo: RscCombo
	{
		idc = 69;
		x = 0.370809 * safezoneW + safezoneX;
		y = 0.55875 * safezoneH + safezoneY;
		w = 0.204464 * safezoneW;
		h = 0.03375 * safezoneH;
	};
	class BankTransferButton: RscShortcutButton
	{
		idc = 71;
		text = "Transfer";
		x = 0.60627 * safezoneW + safezoneX;
		y = 0.4875 * safezoneH + safezoneY;
		w = 0.108354 * safezoneW;
		h = 0.08 * safezoneH;
		default = 0;
	};
	class BankCloseButton: RscShortcutButton
	{
		idc = -1;
		text = "Close";
		x = 0.660967 * safezoneW + safezoneX;
		y = 0.55875 * safezoneH + safezoneY;
		w = 0.0974139 * safezoneW;
		h = 0.08 * safezoneH;
		action = "closeDialog 0";
	};
	class BankCashValue: RscText
	{
		idc = 73;
		text = "$0";
		x = 0.372372 * safezoneW + safezoneX;
		y = 0.4475 * safezoneH + safezoneY;
		w = 0.17103 * safezoneW;
		h = 0.0294455 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 0, 5, 0, 1 };
	};
	class BankAmountEdit: RscEdit
	{
		idc = 68;
		text = "0";
		x = 0.371069 * safezoneW + safezoneX;
		y = 0.505 * safezoneH + safezoneY;
		w = 0.17103 * safezoneW;
		h = 0.0294455 * safezoneH;
		sizeEx = 0.035;
	};
};





