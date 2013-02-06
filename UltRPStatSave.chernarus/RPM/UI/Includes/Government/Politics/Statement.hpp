class PoliticsStatementDialog: RscGroup {
	idd = 112;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		PoliticsStatementFrame,
		PoliticsStatementBalanceLabel,
		PoliticsStatementBalanceValLabel,
		PoliticsStatementIncomeFrame,
		PoliticsStatement5MinsLabel,
		PoliticsStatementDollarLabel1,
		PoliticsStatement5MinsValLabel,
		PoliticsStatement30MinsLabel,
		PoliticsStatementDollarLabel2,
		PoliticsStatement30MinsValLabel,
		PoliticsStatementTotalLabel,
		PoliticsStatementDollarLabel3,
		PoliticsStatementTotalValLabel,
		PoliticsStatementTransactionsFrame,
		PoliticsStatementListbox,
		PoliticsStatementListLabel,
		PoliticsStatementCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.1875;
		y = 0.125;
		w = 0.625;
		h = 0.75;
	};
	class PoliticsStatementFrame: RscFrame
	{
		idc = -1;
		text = "Politics - Statement";
		x = 0.1875;
		y = 0.125;
		w = 0.625;
		h = 0.75;
		moving = 1;
	};
	class PoliticsStatementBalanceLabel: RscText
	{
		idc = -1;
		text = "Balance: $";
		x = 0.203125;
		y = 0.8;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsStatementBalanceValLabel: RscText
	{
		idc = 212;
		text = "12345678";
		x = 0.28125;
		y = 0.8;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsStatementIncomeFrame: RscFrame
	{
		idc = -1;
		text = "Income";
		x = 0.203125;
		y = 0.15;
		w = 0.328125;
		h = 0.175;
	};
	class PoliticsStatement5MinsLabel: RscText
	{
		idc = -1;
		text = "5 minutes:";
		x = 0.21875;
		y = 0.175;
		w = 0.15625;
		h = 0.05;
	};
	class PoliticsStatementDollarLabel1: RscText
	{
		idc = -1;
		text = "$";
		x = 0.375;
		y = 0.175;
		w = 0.03125;
		h = 0.05;
	};
	class PoliticsStatement5MinsValLabel: RscText
	{
		idc = 213;
		text = "12345678";
		x = 0.390625;
		y = 0.175;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsStatement30MinsLabel: RscText
	{
		idc = -1;
		text = "30 minutes:";
		x = 0.21875;
		y = 0.225;
		w = 0.15625;
		h = 0.05;
	};
	class PoliticsStatementDollarLabel2: RscText
	{
		idc = -1;
		text = "$";
		x = 0.375;
		y = 0.225;
		w = 0.03125;
		h = 0.05;
	};
	class PoliticsStatement30MinsValLabel: RscText
	{
		idc = 214;
		text = "12345678";
		x = 0.390625;
		y = 0.225;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsStatementTotalLabel: RscText
	{
		idc = -1;
		text = "Total:";
		x = 0.21875;
		y = 0.275;
		w = 0.15625;
		h = 0.05;
	};
	class PoliticsStatementDollarLabel3: RscText
	{
		idc = -1;
		text = "$";
		x = 0.375;
		y = 0.275;
		w = 0.03125;
		h = 0.05;
	};
	class PoliticsStatementTotalValLabel: RscText
	{
		idc = 215;
		text = "12345678";
		x = 0.390625;
		y = 0.275;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsStatementTransactionsFrame: RscFrame
	{
		idc = -1;
		text = "Transactions";
		x = 0.203125;
		y = 0.325;
		w = 0.59375;
		h = 0.45;
	};
	class PoliticsStatementListbox: RscListbox
	{
		idc = 216;
		x = 0.21875;
		y = 0.4;
		w = 0.5625;
		h = 0.35;
	};
	class PoliticsStatementListLabel: RscText
	{
		idc = -1;
		text = "Player, Type, Amount, Target";
		x = 0.21875;
		y = 0.35;
		w = 0.359375;
		h = 0.05;
	};
	class PoliticsStatementCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.6875;
		y = 0.8;
		w = 0.078125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
