class BailDialog: RscGroup
{
	idd = 19;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		BailFrame,
		BailText,
		BailLabel,
		BailDollarLabel,
		BailValLabel,
		BailAccountLabel,
		BailAccountDollarLabel,
		BailAccountValLabel,
		BailAmountLabel,
		BailAmountDollarLabel,
		BailAmountEdit,
		BailPayButton,
		BailCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.28125;
		y = 0.2;
		w = 0.4375;
		h = 0.6;
	};
	class BailFrame: RscFrame
	{
		idc = -1;
		text = "Bail";
		x = 0.28125;
		y = 0.2;
		w = 0.4375;
		h = 0.6;
		moving = 1;
	};
	class BailText: RscStructuredText
	{
		idc = -1;
		text = "Bail reduces the time you must serve.  Some crimes will require you to serve a minimal sentence, regardless of if you've paid your debt.  Bail money can only come from your bank account.";
		x = 0.296875;
		y = 0.25;
		w = 0.40625;
		h = 0.275;
	};
	class BailLabel: RscText
	{
		idc = -1;
		text = "Bail:";
		x = 0.296875;
		y = 0.6;
		w = 0.109375;
		h = 0.05;
	};
	class BailDollarLabel: RscText
	{
		idc = -1;
		text = "$";
		x = 0.40625;
		y = 0.6;
		w = 0.03125;
		h = 0.05;
	};
	class BailValLabel: RscText
	{
		idc = 173;
		text = "0";
		x = 0.4375;
		y = 0.6;
		w = 0.09375;
		h = 0.05;
	};
	class BailAccountLabel: RscText
	{
		idc = -1;
		text = "Account:";
		x = 0.296875;
		y = 0.55;
		w = 0.109375;
		h = 0.05;
	};
	class BailAccountDollarLabel: RscText
	{
		idc = -1;
		text = "$";
		x = 0.40625;
		y = 0.55;
		w = 0.03125;
		h = 0.05;
	};
	class BailAccountValLabel: RscText
	{
		idc = 174;
		text = "0";
		x = 0.4375;
		y = 0.55;
		w = 0.09375;
		h = 0.05;
	};
	class BailAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.296875;
		y = 0.65;
		w = 0.109375;
		h = 0.05;
	};
	class BailAmountDollarLabel: RscText
	{
		idc = -1;
		text = "$";
		x = 0.40625;
		y = 0.65;
		w = 0.03125;
		h = 0.05;
	};
	class BailAmountEdit: RscEdit
	{
		idc = 175;
		text = "1";
		x = 0.4375;
		y = 0.65;
		w = 0.09375;
		h = 0.05;
	};
	class BailPayButton: RscButton
	{
		idc = 176;
		text = "Pay";
		x = 0.296875;
		y = 0.725;
		w = 0.078125;
		h = 0.05;
		default = 1;
	};
	class BailCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.625;
		y = 0.725;
		w = 0.078125;
		h = 0.05;
		default = 0;
		action = "closeDialog 0;";
	};
};
