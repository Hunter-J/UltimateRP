class FactoryStorageDialog: RscGroup {
	idd = 8;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		FactoryStorageFrame,
		FactoryFactoryFrame,
		FactoryInventoryFrame,
		FactoryStorageItemLabel,
		FactoryStorageQtyLabel,
		FactoryStorageWeightLabel,
		FactoryInventoryItemLabel,
		FactoryInventoryQtyLabel,
		FactoryInventoryWeightLabel,
		FactoryStorageAmountLabel,
		FactoryStorageAmountEdit,
		FactoryStorageItemListBox,
		FactoryStorageWeightListbox,
		FactoryStorageQtyListBox,
		FactoryInventoryItemListBox,
		FactoryInventoryWeightListBox,
		FactoryInventoryQtyListBox,
		FactoryTakeButton,
		FactoryDropButton,
		FactoryCloseButton,
		FactoryCapacityLabel,
		FactoryCapacityKgLabel
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0;
		y = 0;
		w = 1;
		h = 1;
	};
	class FactoryStorageFrame: RscFrame
	{
		idc = -1;
		text = "Storage";
		x = 0;
		y = 0;
		w = 1;
		h = 1;
		moving = 1;
	};
	class FactoryFactoryFrame: RscFrame
	{
		idc = -1;
		text = "Factory";
		x = 0.015625;
		y = 0.025;
		w = 0.46875;
		h = 0.8;
	};
	class FactoryInventoryFrame: RscFrame
	{
		idc = -1;
		text = "Inventory";
		x = 0.5;
		y = 0.025;
		w = 0.46875;
		h = 0.8;
	};
	class FactoryStorageItemLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Qty):";
		x = 0.03125;
		y = 0.05;
		w = 0.234375;
		h = 0.05;
	};
	class FactoryInventoryItemLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Qty):";
		x = 0.515625;
		y = 0.05;
		w = 0.234375;
		h = 0.05;
	};
	class FactoryStorageAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.421875;
		y = 0.85;
		w = 0.09375;
		h = 0.05;
	};
	class FactoryStorageAmountEdit: RscEdit
	{
		idc = 59;
		text = "1";
		x = 0.5;
		y = 0.85;
		w = 0.0625;
		h = 0.05;
	};
	class FactoryStorageItemListBox: RscListbox
	{
		idc = 60;
		x = 0.03125;
		y = 0.1;
		w = 0.4375;
		h = 0.7;
		color[] = {1,1,1,0};
	};
	class FactoryInventoryItemListBox: RscListbox
	{
		idc = 63;
		x = 0.515625;
		y = 0.1;
		w = 0.4375;
		h = 0.7;
		color[] = {1,1,1,0};
	};
	class FactoryTakeButton: RscButton
	{
		idc = 66;
		text = "Take";
		x = 0.40625;
		y = 0.925;
		w = 0.078125;
		h = 0.05;
		default = 0;
	};
	class FactoryDropButton: RscButton
	{
		idc = 67;
		text = "Drop";
		x = 0.515625;
		y = 0.925;
		w = 0.078125;
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
	class FactoryCapacityLabel: RscText
	{
		idc = -1;
		text = "Capacity:";
		x = 0;
		y = 0.95;
		w = 0.109375;
		h = 0.05;
	};
	class FactoryCapacityKgLabel: RscText
	{
		idc = 124;
		text = "0kg/0kg";
		x = 0.065;
		y = 0.95;
		w = 0.21875;
		h = 0.05;
	};
};
