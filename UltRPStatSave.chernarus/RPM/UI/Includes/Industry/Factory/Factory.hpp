class FactoryDialog: RscGroup {
	idd = 6;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		FactoryFrame,
		FactoryProductionFrame,
		FactoryStorageFrame,
		FactoryProductionItemLabel,
		FactoryStorageItemLabel,
		FactoryAmountLabel,
		FactoryAmountEdit,
		FactoryProductionListBox,
		FactoryStorageItemListBox,
		FactoryProduceButton,
		FactoryBuyButton,
		FactoryCloseButton,
		FactoryStorageButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0;
		y = 0;
		w = 1;
		h = 1;
	};
	class FactoryFrame: RscFrame
	{
		idc = -1;
		text = "Factory";
		x = 0;
		y = 0;
		w = 1;
		h = 1;
		moving = 1;
	};
	class FactoryProductionFrame: RscFrame
	{
		idc = -1;
		text = "Production";
		x = 0.015625;
		y = 0.025;
		w = 0.703125;
		h = 0.8;
	};
	class FactoryStorageFrame: RscFrame
	{
		idc = -1;
		text = "Storage";
		x = 0.734375;
		y = 0.025;
		w = 0.25;
		h = 0.8;
	};
	class FactoryProductionItemLabel: RscText
	{
		idc = -1;
		text = "Item (Requirements):";
		x = 0.03125;
		y = 0.05;
		w = 0.25;
		h = 0.05;
	};
	class FactoryStorageItemLabel: RscText
	{
		idc = -1;
		text = "Item (Qty):";
		x = 0.75;
		y = 0.05;
		w = 0.140625;
		h = 0.05;
	};
	class FactoryAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.015625;
		y = 0.925;
		w = 0.09375;
		h = 0.05;
	};
	class FactoryAmountEdit: RscEdit
	{
		idc = 42;
		text = "1";
		x = 0.125;
		y = 0.925;
		w = 0.046875;
		h = 0.05;
	};
	class FactoryProductionListBox: RscListbox
	{
		idc = 43;
		x = 0.03125;
		y = 0.1;
		w = 0.671875;
		h = 0.7;
	};
	class FactoryStorageItemListBox: RscListbox
	{
		idc = 45;
		x = 0.75;
		y = 0.1;
		w = 0.21875;
		h = 0.7;
		color[] = {1,1,1,0};
	};
	class FactoryProduceButton: RscButton
	{
		idc = 47;
		text = "Produce Selected Item";
		x = 0.015625;
		y = 0.85;
		w = 0.265625;
		h = 0.05;
		default = 0;
	};
	class FactoryBuyButton: RscButton
	{
		idc = 48;
		text = "Buy Factory";
		x = 0.75;
		y = 0.925;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class FactoryStorageButton: RscButton
	{
		idc = 50;
		text = "Storage";
		x = 0.890625;
		y = 0.85;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class FactoryCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.90625;
		y = 0.925;
		w = 0.078125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
