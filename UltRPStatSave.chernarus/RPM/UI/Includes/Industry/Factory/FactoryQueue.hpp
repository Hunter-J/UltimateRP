class FactoryQueueDialog: RscGroup {
	idd = 7;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		FactoryQueueFrame,
		FactoryQueueStorageFrame,
		FactoryQueueStorageItemLabel,
		FactoryQueueStorageQtyLabel,
		FactoryQueueINVItemListBox,
		FactoryQueueINVQtyListBox,
		FactoryQueueQueueFrame,
		FactoryQueueQueueItemLabel,
		FactoryQueueQueueQtyLabel,
		FactoryQueueTimeLabel,
		FactoryQueueItemListBox,
		FactoryQueueQuantityListBox,
		FactoryQueueTimeListBox,
		FactoryQueueAmountLabel,
		FactoryQueueAmountEdit,
		FactoryQueueRemoveButton,
		FactoryQueueGoButton,
		FactoryQueueCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.1875;
		y = 0.025;
		w = 0.625;
		h = 0.95;
	};
	class FactoryQueueFrame: RscFrame
	{
		idc = -1;
		text = "Factory";
		x = 0.1875;
		y = 0.025;
		w = 0.625;
		h = 0.95;
		moving = 1;
	};
	class FactoryQueueStorageFrame: RscFrame
	{
		idc = -1;
		text = "Queue";
		x = 0.46875;
		y = 0.05;
		w = 0.328125;
		h = 0.75;
	};
	class FactoryQueueStorageItemLabel: RscText
	{
		idc = -1;
		text = "Item:";
		x = 0.21875;
		y = 0.075;
		w = 0.0625;
		h = 0.05;
		color[] = {1,1,1,0};
	};
	class FactoryQueueStorageQtyLabel: RscText
	{
		idc = -1;
		text = "Qty:";
		x = 0.375;
		y = 0.075;
		w = 0.0625;
		h = 0.05;
		color[] = {1,1,1,0};
	};
	class FactoryQueueINVItemListBox: RscListbox
	{
		idc = 55;
		x = 0.21875;
		y = 0.125;
		w = 0.1575;
		h = 0.65;
		color[] = {1,1,1,0};
	};
	class FactoryQueueINVQtyListBox: RscListbox
	{
		idc = 56;
		x = 0.375;
		y = 0.125;
		w = 0.0625;
		h = 0.65;
		color[] = {1,1,1,0};
	};
	class FactoryQueueQueueFrame: RscFrame
	{
		idc = -1;
		text = "Storage";
		x = 0.203125;
		y = 0.05;
		w = 0.25;
		h = 0.75;
	};
	class FactoryQueueQueueItemLabel: RscText
	{
		idc = -1;
		text = "Item:";
		x = 0.484375;
		y = 0.075;
		w = 0.0625;
		h = 0.05;
	};
	class FactoryQueueQueueQtyLabel: RscText
	{
		idc = -1;
		text = "Qty:";
		x = 0.640625;
		y = 0.075;
		w = 0.0625;
		h = 0.05;
	};
	class FactoryQueueTimeLabel: RscText
	{
		idc = -1;
		text = "Time:";
		x = 0.71875;
		y = 0.075;
		w = 0.0625;
		h = 0.05;
	};
	class FactoryQueueItemListBox: RscListbox
	{
		idc = 52;
		x = 0.484375;
		y = 0.125;
		w = 0.157;
		h = 0.65;
		color[] = {1,1,1,0};
	};
	class FactoryQueueQuantityListBox: RscListbox
	{
		idc = 53;
		x = 0.640625;
		y = 0.125;
		w = 0.0785;
		h = 0.65;
		color[] = {1,1,1,0};
	};
	class FactoryQueueTimeListBox: RscListbox
	{
		idc = 54;
		x = 0.71875;
		y = 0.125;
		w = 0.0625;
		h = 0.65;
		color[] = {1,1,1,0};
	};
	class FactoryQueueAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.203125;
		y = 0.9;
		w = 0.09375;
		h = 0.05;
	};
	class FactoryQueueAmountEdit: RscEdit
	{
		idc = 51;
		text = "1";
		x = 0.28125;
		y = 0.9;
		w = 0.046875;
		h = 0.05;
	};
	class FactoryQueueRemoveButton: RscButton
	{
		idc = 57;
		text = "Remove";
		x = 0.640625;
		y = 0.825;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class FactoryQueueGoButton: RscButton
	{
		idc = 58;
		text = "Go";
		x = 0.75;
		y = 0.825;
		w = 0.046875;
		h = 0.05;
		default = 0;
	};
	class FactoryQueueCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.71875;
		y = 0.9;
		w = 0.078125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
