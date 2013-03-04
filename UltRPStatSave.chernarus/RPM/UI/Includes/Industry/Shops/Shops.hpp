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
		x = 0.208279 * safezoneW + safezoneX;
		y = 0.15 * safezoneH + safezoneY;
		w = 0.583442 * safezoneW;
		h = 0.7 * safezoneH;
	};
	class ShopsFrame: RscFrame
	{
		idc = -1;
		text = "Shop";
		x = 0.208279 * safezoneW + safezoneX;
		y = 0.15 * safezoneH + safezoneY;
		w = 0.583442 * safezoneW;
		h = 0.7 * safezoneH;
		moving = 1;
	};
	class ShopsShopFrame: RscFrame
	{
		idc = -1;
		text = "Shop";
		x = 0.218958 * safezoneW + safezoneX;
		y = 0.17625 * safezoneH + safezoneY;
		w = 0.559218 * safezoneW;
		h = 0.3325 * safezoneH;
	};
	class ShopsInventoryFrame: RscFrame
	{
		idc = -1;
		text = "Inventory";
		x = 0.218958 * safezoneW + safezoneX;
		y = 0.5175 * safezoneH + safezoneY;
		w = 0.56 * safezoneW;
		h = 0.225 * safezoneH;
	};
	class ShopsShopItemListBox: RscListbox
	{
		idc = 17;
		x = 0.224167 * safezoneW + safezoneX;
		y = 0.22625 * safezoneH + safezoneY;
		w = 0.548279 * safezoneW;
		h = 0.27375 * safezoneH;
		color[] = {1,1,1,0};
	};
	class ShopsShopInventoryItemListBox: RscListbox
	{
		idc = 21;
		x = 0.224949 * safezoneW + safezoneX;
		y = 0.5675 * safezoneH + safezoneY;
		w = 0.548279 * safezoneW;
		h = 0.16625 * safezoneH;
		color[] = {1,1,1,0};
	};

	class ShopsCloseButton: RscShortcutButton
	{
		idc = -1;
		text = "Close";
		x = 0.693005 * safezoneW + safezoneX;
		y = 0.785 * safezoneH + safezoneY;
		w = 0.0958512 * safezoneW;
		h = 0.0775001 * safezoneH;
		action = "closeDialog 0;";
		default = 0;
	};
	class ShopsShopBuyButton: RscShortcutButton
	{
		idc = 23;
		text = "Buy Shop";
		x = 0.586734 * safezoneW + safezoneX;
		y = 0.78375 * safezoneH + safezoneY;
		w = 0.106009 * safezoneW;
		h = 0.0800002 * safezoneH;
		default = 0;
	};
	class ShopsBuyButton: RscShortcutButton
	{
		idc = 24;
		text = "Buy";
		x = 0.218698 * safezoneW + safezoneX;
		y = 0.75625 * safezoneH + safezoneY;
		w = 0.0958512 * safezoneW;
		h = 0.0775001 * safezoneH;
		default = 0;
	};
	class ShopsSellButton: RscShortcutButton
	{
		idc = 25;
		text = "Sell";
		x = 0.324186 * safezoneW + safezoneX;
		y = 0.7575 * safezoneH + safezoneY;
		w = 0.0958512 * safezoneW;
		h = 0.0775001 * safezoneH;
		default = 0;
	};
	class ShopsItemLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Stock, Price)";
		x = 0.223387 * safezoneW + safezoneX;
		y = 0.1925 * safezoneH + safezoneY;
		w = 0.185712 * safezoneW;
		h = 0.0275 * safezoneH;
		sizeEx = 0.025;
		colorText[] = { 0, 5, 0, 1 };
	};
	class ShopsInventoryItemLabel: RscText
	{
		idc = -1;
		text = "Item (Amount)";
		x = 0.224167 * safezoneW + safezoneX;
		y = 0.535 * safezoneH + safezoneY;
		w = 0.104447 * safezoneW;
		h = 0.025 * safezoneH;
		sizeEx = 0.025;
		colorText[] = { 0, 5, 0, 1 };
	};
	class ShopsAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.630493 * safezoneW + safezoneX;
		y = 0.75125 * safezoneH + safezoneY;
		w = 0.0645949 * safezoneW;
		h = 0.025 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 5, 0, 0, 1 };
	};
	class ShopsAmountEdit: RscEdit
	{
		idc = 26;
		text = "1";
		x = 0.69613 * safezoneW + safezoneX;
		y = 0.75125 * safezoneH + safezoneY;
		w = 0.0849116 * safezoneW;
		h = 0.0275 * safezoneH;
	};
};

