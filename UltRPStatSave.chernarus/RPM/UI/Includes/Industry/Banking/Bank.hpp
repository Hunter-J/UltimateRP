class BankDialog: RscGroup {
	idd = 10;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		BankFrame,
		BankAccountLabel,
		BankPocketLabel,
		BankTargetLabel,
		BankAmountLabel,
		BankPocketValue,
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
		x = 0.234375;
		y = 0.35;
		w = 0.53125;
		h = 0.3;
	};
	class BankFrame: RscFrame
	{
		idc = -1;
		text = "Bank";
		x = 0.234375;
		y = 0.35;
		w = 0.53125;
		h = 0.3;
		moving = 1;
	};
	class BankAccountLabel: RscText
	{
		idc = -1;
		text = "Account:";
		x = 0.25;
		y = 0.425;
		w = 0.09375;
		h = 0.05;
	};
	class BankPocketLabel: RscText
	{
		idc = -1;
		text = "Pocket:";
		x = 0.25;
		y = 0.375;
		w = 0.09375;
		h = 0.05;
	};
	class BankTargetLabel: RscText
	{
		idc = -1;
		text = "Target:";
		x = 0.671875;
		y = 0.375;
		w = 0.078125;
		h = 0.05;
	};
	class BankAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.25;
		y = 0.475;
		w = 0.09375;
		h = 0.05;
	};
	class BankPocketValue: RscText
	{
		idc = 73;
		text = "$0";
		x = 0.359375;
		y = 0.375;
		w = 0.09375;
		h = 0.05;
	};
	class BankAccountValue: RscText
	{
		idc = 74;
		text = "$0";
		x = 0.359375;
		y = 0.425;
		w = 0.125;
		h = 0.05;
	};
	class BankAmountEdit: RscEdit
	{
		idc = 68;
		text = "1";
		x = 0.359375;
		y = 0.475;
		w = 0.09375;
		h = 0.05;
	};
	class BankTargetCombo: RscCombo
	{
		idc = 69;
		x = 0.53125;
		y = 0.425;
		w = 0.21875;
		h = 0.05;
	};
	class BankDepositButton: RscButton
	{
		idc = 70;
		text = "Deposit";
		x = 0.25;
		y = 0.575;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class BankTransferButton: RscButton
	{
		idc = 71;
		text = "Transfer";
		x = 0.5;
		y = 0.575;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class BankWithdrawButton: RscButton
	{
		idc = 72;
		text = "Withdraw";
		x = 0.375;
		y = 0.575;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class BankCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.640625;
		y = 0.575;
		w = 0.109375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
