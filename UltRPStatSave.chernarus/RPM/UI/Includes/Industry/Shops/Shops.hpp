class ShopsDialog: RscGroup {
	idd = 3;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		ShopsFrame,
		ShopsShopFrame,
		ShopsInventoryFrame,
		ShopsShopItemListBox,
		ShopsShopInventoryItemListBox,
		ShopsCloseButton,
		ShopsShopBuyButton,
		ShopsBuyButton,
		ShopsSellButton,
		ShopsItemLabel,
		ShopsInventoryItemLabel,
		ShopsAmountLabel,
		ShopsAmountEdit
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0;
		y = 0;
		w = 1;
		h = 1;
	};
	class ShopsFrame: RscFrame
	{
		idc = -1;
		text = "Shop";
		x = 0;
		y = 0;
		w = 1;
		h = 1;
		moving = 1;
	};
	class ShopsShopFrame: RscFrame
	{
		idc = -1;
		text = "Shop";
		x = 0.015625;
		y = 0.025;
		w = 0.59375;
		h = 0.875;
	};
	class ShopsInventoryFrame: RscFrame
	{
		idc = -1;
		text = "Inventory";
		x = 0.625;
		y = 0.025;
		w = 0.359375;
		h = 0.875;
	};
	class ShopsShopItemListBox: RscListbox
	{
		idc = 17;
		x = 0.03125;
		y = 0.1;
		w = 0.5625;
		h = 0.775;
		color[] = {1,1,1,0};
	};
	class ShopsShopInventoryItemListBox: RscListbox
	{
		idc = 21;
		x = 0.640625;
		y = 0.1;
		w = 0.328125;
		h = 0.775;
		color[] = {1,1,1,0};
	};
	class ShopsCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.84375;
		y = 0.925;
		w = 0.140625;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
	class ShopsShopBuyButton: RscButton
	{
		idc = 23;
		text = "Buy Shop";
		x = 0.6875;
		y = 0.925;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class ShopsBuyButton: RscButton
	{
		idc = 24;
		text = "Buy";
		x = 0.015625;
		y = 0.925;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class ShopsSellButton: RscButton
	{
		idc = 25;
		text = "Sell";
		x = 0.171875;
		y = 0.925;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class ShopsItemLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Stock, Price)";
		x = 0.03125;
		y = 0.05;
		w = 0.3125;
		h = 0.05;
	};
	class ShopsInventoryItemLabel: RscText
	{
		idc = -1;
		text = "Item (Amount)";
		x = 0.640625;
		y = 0.05;
		w = 0.171875;
		h = 0.05;
	};
	class ShopsAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.40625;
		y = 0.925;
		w = 0.09375;
		h = 0.05;
	};
	class ShopsAmountEdit: RscEdit
	{
		idc = 26;
		text = "1";
		x = 0.53125;
		y = 0.925;
		w = 0.0625;
		h = 0.05;
	};
};
