class PoliticsDialog: RscGroup {
	idd = 108;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		PoliticsFrame,
		PoliticsBalanceLabel,
		PoliticsBalanceValLabel,
		PoliticsPocketLabel,
		PoliticsPocketValLabel,
		PoliticsFinancesFrame,
		PoliticsFundingFrame,
		PoliticsTentureFrame,
		PoliticsLegalFrame,
		PoliticsDepositButton,
		PoliticsTransferButton,
		PoliticsWithdrawButton,
		PoliticsStatementButton,
		PoliticsTaxesButton,
		PoliticsLawsButton,
		PoliticsTargetLabel,
		PoliticsTargetCombo,
		PoliticsAmountLabel,
		PoliticsAmountEdit,
		PoliticsRescendButton,
		PoliticsFrequencyButton,
		PoliticsCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.265625;
		y = 0.15;
		w = 0.484375;
		h = 0.675;
	};
	class PoliticsFrame: RscFrame
	{
		idc = -1;
		text = "Politics";
		x = 0.265625;
		y = 0.15;
		w = 0.484375;
		h = 0.675;
		moving = 1;
	};
	class PoliticsBalanceLabel: RscText
	{
		idc = -1;
		text = "Balance: $";
		x = 0.28125;
		y = 0.7;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsBalanceValLabel: RscText
	{
		idc = 195;
		text = "0";
		x = 0.359375;
		y = 0.7;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsPocketLabel: RscText
	{
		idc = -1;
		text = "Pocket:  $";
		x = 0.28125;
		y = 0.75;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsPocketValLabel: RscText
	{
		idc = 238;
		text = "0";
		x = 0.359375;
		y = 0.75;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsFinancesFrame: RscFrame
	{
		idc = -1;
		text = "Finances";
		x = 0.28125;
		y = 0.175;
		w = 0.453125;
		h = 0.375;
	};
	class PoliticsFundingFrame: RscFrame
	{
		idc = -1;
		text = "Funding";
		x = 0.296875;
		y = 0.2;
		w = 0.421875;
		h = 0.25;
	};
	class PoliticsTentureFrame: RscFrame
	{
		idc = -1;
		text = "Tenture";
		x = 0.28125;
		y = 0.575;
		w = 0.296875;
		h = 0.1;
	};
	class PoliticsLegalFrame: RscFrame
	{
		idc = -1;
		text = "Legal";
		x = 0.59375;
		y = 0.575;
		w = 0.140625;
		h = 0.1;
	};
	class PoliticsDepositButton: RscButton
	{
		idc = 196;
		text = "Deposit";
		x = 0.3125;
		y = 0.375;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class PoliticsTransferButton: RscButton
	{
		idc = 197;
		text = "Transfer";
		x = 0.453125;
		y = 0.375;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class PoliticsWithdrawButton: RscButton
	{
		idc = 198;
		text = "Withdraw";
		x = 0.59375;
		y = 0.375;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class PoliticsStatementButton: RscButton
	{
		idc = 199;
		text = "Statement";
		x = 0.296875;
		y = 0.475;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class PoliticsTaxesButton: RscButton
	{
		idc = 200;
		text = "Taxes";
		x = 0.59375;
		y = 0.475;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class PoliticsLawsButton: RscButton
	{
		idc = 201;
		text = "Laws";
		x = 0.609375;
		y = 0.6;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class PoliticsTargetLabel: RscText
	{
		idc = -1;
		text = "Target:";
		x = 0.3125;
		y = 0.225;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsTargetCombo: RscCombo
	{
		idc = 202;
		x = 0.453125;
		y = 0.225;
		w = 0.25;
		h = 0.05;
	};
	class PoliticsAmountLabel: RscText
	{
		idc = -1;
		text = "Amount: $";
		x = 0.3125;
		y = 0.3;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsAmountEdit: RscEdit
	{
		idc = 203;
		text = "1";
		x = 0.453125;
		y = 0.3;
		w = 0.09375;
		h = 0.05;
	};
	class PoliticsRescendButton: RscButton
	{
		idc = 204;
		text = "Rescend";
		x = 0.4375;
		y = 0.6;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class PoliticsFrequencyButton: RscButton
	{
		idc = 205;
		text = "Frequency";
		x = 0.296875;
		y = 0.6;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class PoliticsCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.625;
		y = 0.75;
		w = 0.109375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
