class StorageDialog: RscGroup {
	idd = 5;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		StorageDialogFrame,
		StorageFrame,
		InventoryFrame,
		StorageTakeAmountLabel,
		StorageTakeAmountEdit,
		StorageItemLabel,
		StorageItemListBox,
		InventoryItemLabel,
		InventoryItemListBox,
		StorageTakeButton,
		StorageDropButton,
		StorageCloseButton,
		StorageCapacityLbl,
		StorageCapacityValLbl
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.208279 * safezoneW + safezoneX;
		y = 0.15 * safezoneH + safezoneY;
		w = 0.583442 * safezoneW;
		h = 0.7 * safezoneH;
	};
	class StorageDialogFrame: RscFrame
	{
		idc = 88;
		text = "Storage";
		x = 0.208279 * safezoneW + safezoneX;
		y = 0.15 * safezoneH + safezoneY;
		w = 0.583442 * safezoneW;
		h = 0.7 * safezoneH;
		moving = 1;
	};
	class StorageFrame: RscFrame
	{
		idc = 89;
		text = "Storage Unit";
		x = 0.218698 * safezoneW + safezoneX;
		y = 0.1775 * safezoneH + safezoneY;
		w = 0.559739 * safezoneW;
		h = 0.28625 * safezoneH;
	};
	class InventoryFrame: RscFrame
	{
		idc = -1;
		text = "Inventory";
		x = 0.218957 * safezoneW + safezoneX;
		y = 0.575 * safezoneH + safezoneY;
		w = 0.558956 * safezoneW;
		h = 0.23125 * safezoneH;
	};
	class StorageTakeAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.413265 * safezoneW + safezoneX;
		y = 0.5025 * safezoneH + safezoneY;
		w = 0.0614697 * safezoneW;
		h = 0.03125 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 5, 0, 0, 1 };
	};
	class StorageTakeAmountEdit: RscEdit
	{
		idc = 33;
		text = "1";
		x = 0.479684 * safezoneW + safezoneX;
		y = 0.50375 * safezoneH + safezoneY;
		w = 0.0880372 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 5, 0, 0, 1 };
	};
	class StorageItemLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Amount)";
		x = 0.229638 * safezoneW + safezoneX;
		y = 0.19125 * safezoneH + safezoneY;
		w = 0.206809 * safezoneW;
		h = 0.025 * safezoneH;
		sizeEx = 0.025;
		colorText[] = { 0, 5, 0, 1 };
	};
	class StorageItemListBox: RscListbox
	{
		idc = 34;
		x = 0.223386 * safezoneW + safezoneX;
		y = 0.22125 * safezoneH + safezoneY;
		w = 0.548278 * safezoneW;
		h = 0.23375 * safezoneH;
		color[] = {1,1,1,0};
	};
	class InventoryItemLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Amount)";
		x = 0.229637 * safezoneW + safezoneX;
		y = 0.59125 * safezoneH + safezoneY;
		w = 0.206028 * safezoneW;
		h = 0.025 * safezoneH;
		sizeEx = 0.025;
		colorText[] = { 0, 5, 0, 1 };
	};
	class InventoryItemListBox: RscListbox
	{
		idc = 37;
		x = 0.224168 * safezoneW + safezoneX;
		y = 0.625 * safezoneH + safezoneY;
		w = 0.548279 * safezoneW;
		h = 0.16875 * safezoneH;
		color[] = {1,1,1,0};
	};
	class StorageTakeButton: RscShortcutButton
	{
		idc = 40;
		text = "Take";
		x = 0.224167 * safezoneW + safezoneX;
		y = 0.4475 * safezoneH + safezoneY;
		w = 0.0974139 * safezoneW;
		h = 0.07625 * safezoneH;
		default = 0;
	};
	class StorageDropButton: RscShortcutButton
	{
		idc = 41;
		text = "Drop";
		x = 0.223387 * safezoneW + safezoneX;
		y = 0.5125 * safezoneH + safezoneY;
		w = 0.0974139 * safezoneW;
		h = 0.07625 * safezoneH;
		default = 0;
	};
	class StorageCloseButton: RscShortcutButton
	{
		idc = -1;
		text = "Close";
		x = 0.692223 * safezoneW + safezoneX;
		y = 0.79 * safezoneH + safezoneY;
		w = 0.0974139 * safezoneW;
		h = 0.07625 * safezoneH;
		action = "closeDialog 0;";
		default = 1;
	};
	class StorageCapacityLbl: RscText
	{
		idc = -1;
		text = "Capacity:";
		x = 0.627368 * safezoneW + safezoneX;
		y = 0.5025 * safezoneH + safezoneY;
		w = 0.0731907 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 0, 5, 0, 1 };
	};
	class StorageCapacityValLbl: RscText
	{
		idc = 177;
		text = "0KG/0KG";
		x = 0.693786 * safezoneW + safezoneX;
		y = 0.50375 * safezoneH + safezoneY;
		w = 0.0751907 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.035;
		colorText[] = { 0, 5, 0, 1 };
		
	};
};