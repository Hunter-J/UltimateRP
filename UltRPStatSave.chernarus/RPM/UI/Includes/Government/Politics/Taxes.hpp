class PoliticsTaxesDialog: RscGroup {
	idd = 113;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		PoliticsTaxesFrame,
		PoliticsTaxesLightLabel,
		PoliticsTaxesJustLabel,
		PoliticsTaxesExorbantLabel,
		PoliticsTaxesGoodsLabel,
		PoliticsTaxesGoodsDescLabel,
		PoliticsTaxesGoodsEdit,
		PoliticsTaxesGoodsSlider,
		PoliticsTaxesIncomeLabel,
		PoliticsTaxesIncomeDescLabel,
		PoliticsTaxesIncomeEdit,
		PoliticsTaxesIncomeSlider,
		PoliticsTaxesTransactionsLabel,
		PoliticsTaxesTransactionsDescLabel,
		PoliticsTaxesTransactionsEdit,
		PoliticsTaxesTransactionsSlider,
		PoliticsTaxesVehiclesLabel,
		PoliticsTaxesVehiclesDescLabel,
		PoliticsTaxesVehiclesEdit,
		PoliticsTaxesVehiclesSlider,
		PoliticsTaxesWeaponsLabel,
		PoliticsTaxesWeaponsDescLabel,
		PoliticsTaxesWeaponsEdit,
		PoliticsTaxesWeaponsSlider,
		PoliticsTaxesSetButton,
		PoliticsTaxesCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0;
		y = 0.225;
		w = 1;
		h = 0.55;
	};
	class PoliticsTaxesFrame: RscFrame
	{
		idc = -1;
		text = "Politics - Taxes";
		x = 0;
		y = 0.225;
		w = 1;
		h = 0.55;
		moving = 1;
	};
	class PoliticsTaxesLightLabel: RscText
	{
		idc = -1;
		text = "Light";
		x = 0.25;
		y = 0.625;
		w = 0.0625;
		h = 0.05;
	};
	class PoliticsTaxesJustLabel: RscText
	{
		idc = -1;
		text = "Just";
		x = 0.359375;
		y = 0.625;
		w = 0.0625;
		h = 0.05;
	};
	class PoliticsTaxesExorbantLabel: RscText
	{
		idc = -1;
		text = "Exorbant";
		x = 0.4375;
		y = 0.625;
		w = 0.109375;
		h = 0.05;
	};
	class PoliticsTaxesGoodsLabel: RscText
	{
		idc = -1;
		text = "Goods:";
		x = 0.015625;
		y = 0.25;
		w = 0.078125;
		h = 0.05;
	};
	class PoliticsTaxesGoodsDescLabel: RscText
	{
		idc = -1;
		text = "(Affects general prices)";
		x = 0.578125;
		y = 0.25;
		w = 0.296875;
		h = 0.05;
	};
	class PoliticsTaxesGoodsEdit: RscEdit
	{
		idc = 219;
		text = "5";
		x = 0.1875;
		y = 0.25;
		w = 0.046875;
		h = 0.05;
	};
	class PoliticsTaxesGoodsSlider: RscSliderH
	{
		idc = 220;
		x = 0.25;
		y = 0.25;
		w = 0.3125;
		h = 0.05;
	};
	class PoliticsTaxesIncomeLabel: RscText
	{
		idc = -1;
		text = "Income:";
		x = 0.015625;
		y = 0.325;
		w = 0.09375;
		h = 0.05;
	};
	class PoliticsTaxesIncomeDescLabel: RscText
	{
		idc = -1;
		text = "(Affects paychecks and property)";
		x = 0.578125;
		y = 0.325;
		w = 0.40625;
		h = 0.05;
	};
	class PoliticsTaxesIncomeEdit: RscEdit
	{
		idc = 221;
		text = "5";
		x = 0.1875;
		y = 0.325;
		w = 0.046875;
		h = 0.05;
	};
	class PoliticsTaxesIncomeSlider: RscSliderH
	{
		idc = 222;
		x = 0.25;
		y = 0.325;
		w = 0.3125;
		h = 0.05;
	};
	class PoliticsTaxesTransactionsLabel: RscText
	{
		idc = -1;
		text = "Transactions:";
		x = 0.015625;
		y = 0.4;
		w = 0.15625;
		h = 0.05;
	};
	class PoliticsTaxesTransactionsDescLabel: RscText
	{
		idc = -1;
		text = "(Affects banking activity)";
		x = 0.578125;
		y = 0.4;
		w = 0.328125;
		h = 0.05;
	};
	class PoliticsTaxesTransactionsEdit: RscEdit
	{
		idc = 223;
		text = "5";
		x = 0.1875;
		y = 0.4;
		w = 0.046875;
		h = 0.05;
	};
	class PoliticsTaxesTransactionsSlider: RscSliderH
	{
		idc = 224;
		x = 0.25;
		y = 0.4;
		w = 0.3125;
		h = 0.05;
	};
	class PoliticsTaxesVehiclesLabel: RscText
	{
		idc = -1;
		text = "Vehicles:";
		x = 0.015625;
		y = 0.475;
		w = 0.109375;
		h = 0.05;
	};
	class PoliticsTaxesVehiclesDescLabel: RscText
	{
		idc = -1;
		text = "(Affects vehicle prices)";
		x = 0.578125;
		y = 0.475;
		w = 0.3125;
		h = 0.05;
	};
	class PoliticsTaxesVehiclesEdit: RscEdit
	{
		idc = 225;
		text = "5";
		x = 0.1875;
		y = 0.475;
		w = 0.046875;
		h = 0.05;
	};
	class PoliticsTaxesVehiclesSlider: RscSliderH
	{
		idc = 226;
		x = 0.25;
		y = 0.475;
		w = 0.3125;
		h = 0.05;
	};
	class PoliticsTaxesWeaponsLabel: RscText
	{
		idc = -1;
		text = "Weapons:";
		x = 0.015625;
		y = 0.55;
		w = 0.125;
		h = 0.05;
	};
	class PoliticsTaxesWeaponsDescLabel: RscText
	{
		idc = -1;
		text = "(Affects mag & weps prices)";
		x = 0.578125;
		y = 0.55;
		w = 0.359375;
		h = 0.05;
	};
	class PoliticsTaxesWeaponsEdit: RscEdit
	{
		idc = 227;
		text = "5";
		x = 0.1875;
		y = 0.55;
		w = 0.046875;
		h = 0.05;
	};
	class PoliticsTaxesWeaponsSlider: RscSliderH
	{
		idc = 228;
		x = 0.25;
		y = 0.55;
		w = 0.3125;
		h = 0.05;
	};
	class PoliticsTaxesSetButton: RscButton
	{
		idc = 229;
		text = "Set";
		x = 0.015625;
		y = 0.7;
		w = 0.078125;
		h = 0.05;
		default = 1;
	};
	class PoliticsTaxesCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.90625;
		y = 0.7;
		w = 0.078125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 0;
	};
	
};
