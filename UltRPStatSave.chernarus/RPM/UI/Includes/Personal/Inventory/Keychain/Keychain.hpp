class KeychainDialog: RscGroup {
	idd = 2;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		KeychainFrame,
		KeychainCloseButton,
		KeychainDuplicateButton,
		KeychainGiveButton,
		KeychainDropButton,
		KeychainKeyListbox
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.328125;
		y = 0.125;
		w = 0.34375;
		h = 0.75;
	};
	class KeychainFrame: RscFrame
	{
		idc = -1;
		text = "Keychain";
		x = 0.328125;
		y = 0.125;
		w = 0.34375;
		h = 0.75;
		moving = 1;
	};
	class KeychainCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.4375;
		y = 0.8;
		w = 0.125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
	class KeychainGiveButton: RscButton
	{
		idc = 13;
		text = "Give";
		x = 0.4375;
		y = 0.65;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class KeychainDuplicateButton: RscButton
	{
		idc = 14";
		text = "Duplicate";
		x = 0.4375;
		y = 0.575;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class KeychainDropButton: RscButton
	{
		idc = 15;
		text = "Drop";
		x = 0.4375;
		y = 0.725;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class KeychainKeyListbox: RscListBox
	{
		idc = 16;
		x = 0.34375;
		y = 0.15;
		w = 0.3125;
		h = 0.4;
	};
};
