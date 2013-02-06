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
		x = 0;
		y = 0;
		w = 1;
		h = 1;
	};
	class StorageDialogFrame: RscFrame
	{
		idc = 88;
		text = "Storage";
		x = 0;
		y = 0;
		w = 1;
		h = 1;
		moving = 1;
	};
	class StorageFrame: RscFrame
	{
		idc = 89;
		text = "Storage";
		x = 0.015625;
		y = 0.025;
		w = 0.46875;
		h = 0.8;
	};
	class InventoryFrame: RscFrame
	{
		idc = -1;
		text = "Inventory";
		x = 0.515625;
		y = 0.025;
		w = 0.46875;
		h = 0.8;
	};
	class StorageTakeAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.40625;
		y = 0.925;
		w = 0.09375;
		h = 0.05;
	};
	class StorageTakeAmountEdit: RscEdit
	{
		idc = 33;
		text = "1";
		x = 0.515625;
		y = 0.925;
		w = 0.078125;
		h = 0.05;
	};
	class StorageItemLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Amount)";
		x = 0.03125;
		y = 0.05;
		w = 0.265625;
		h = 0.05;
	};
	class StorageItemListBox: RscListbox
	{
		idc = 34;
		x = 0.03125;
		y = 0.1;
		w = 0.4375;
		h = 0.7;
		color[] = {1,1,1,0};
	};
	class InventoryItemLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Amount)";
		x = 0.53125;
		y = 0.05;
		w = 0.265625;
		h = 0.05;
	};
	class InventoryItemListBox: RscListbox
	{
		idc = 37;
		x = 0.53125;
		y = 0.1;
		w = 0.4375;
		h = 0.7;
		color[] = {1,1,1,0};
	};
	class StorageTakeButton: RscButton
	{
		idc = 40;
		text = "Take";
		x = 0.375;
		y = 0.85;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class StorageDropButton: RscButton
	{
		idc = 41;
		text = "Drop";
		x = 0.515625;
		y = 0.85;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class StorageCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.875;
		y = 0.925;
		w = 0.109375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
	class StorageCapacityLbl: RscText
	{
		idc = -1;
		text = "Capacity:";
		x = 0.015625;
		y = 0.925;
		w = 0.109375;
		h = 0.05;
	};
	class StorageCapacityValLbl: RscText
	{
		idc = 177;
		text = "0kg/0kg";
		x = 0.078125;
		y = 0.925;
		w = 0.1875;
		h = 0.05;
	};
};
