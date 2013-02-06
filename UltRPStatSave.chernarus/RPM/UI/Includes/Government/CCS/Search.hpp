 class SearchDialog: RscGroup {
	idd = 107;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		SearchDialogFrame,
		SearchFrame,
		SearchDestroyAmountLabel,
		SearchDestroyAmountEdit,
		SearchItemLabel,
		SearchItemListBox,
		SearchDestroyButton,
		SearchCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.28125;
		y = 0.15;
		w = 0.4375;
		h = 0.7;
	};
	class SearchDialogFrame: RscFrame
	{
		idc = -1;
		text = "Search";
		x = 0.28125;
		y = 0.15;
		w = 0.4375;
		h = 0.7;
		moving = 1;
	};
	class SearchFrame: RscFrame
	{
		idc = 188;
		text = "Person";
		x = 0.296875;
		y = 0.175;
		w = 0.40625;
		h = 0.5;
	};
	class SearchDestroyAmountLabel: RscText
	{
		idc = 191;
		text = "Amount:";
		x = 0.390625;
		y = 0.775;
		w = 0.09375;
		h = 0.05;
	};
	class SearchDestroyAmountEdit: RscEdit
	{
		idc = 189;
		text = "1";
		x = 0.5625;
		y = 0.775;
		w = 0.078125;
		h = 0.05;
	};
	class SearchItemLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Amount):";
		x = 0.3125;
		y = 0.2;
		w = 0.265625;
		h = 0.05;
	};
	class SearchItemListBox: RscListbox
	{
		idc = 190;
		x = 0.3125;
		y = 0.25;
		w = 0.375;
		h = 0.4;
		color[] = {1,1,1,0};
	};
	class SearchDestroyButton: RscButton
	{
		idc = 193;
		text = "Destroy";
		x = 0.375;
		y = 0.7;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class SearchCloseButton: RscButton
	{
		idc = 192;
		text = "Close";
		x = 0.515625;
		y = 0.7;
		w = 0.109375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
