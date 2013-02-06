class MessagingDialog: RscGroup
{
	idd = 120;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		MessagingFrm,
		MessagingHeaderFrm,
		MessagingLb,
		MessagingTitleLbl,
		MessagingReadLabel,
		MessagingUnreadLabel,
		MessagingReadVal,
		MessagingUnreadVal,
		MessagingComposeBtn,
		MessagingReadBtn,
		MessagingDelBtn,
		MessagingCloseBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0;
		y = 0;
		w = 1;
		h = 1;
	};
	class MessagingFrm: RscFrame
	{
		idc = -1;
		text = "Messaging";
		x = 0;
		y = 0;
		w = 1;
		h = 1;
		moving = 1;
	};
	class MessagingHeaderFrm: RscFrame
	{
		idc = -1;
		x = 0.015625;
		y = 0.025;
		w = 0.96875;
		h = 0.8;
	};
	class MessagingLb: RscListBox
	{
		idc = 273;
		x = 0.03125;
		y = 0.1;
		w = 0.9375;
		h = 0.7;
	};
	class MessagingTitleLbl: RscText
	{
		idc = -1;
		text = "Title (Sender, Received, Read)";
		x = 0.03125;
		y = 0.05;
		w = 0.453125;
		h = 0.05;
	};
	class MessagingReadLabel: RscText
	{
		idc = -1;
		text = "# Read:";
		x = 0.40625;
		y = 0.85;
		w = 0.1875;
		h = 0.05;
	};
	class MessagingUnreadLabel: RscText
	{
		idc = -1;
		text = "# Unread:";
		x = 0.40625;
		y = 0.925;
		w = 0.21875;
		h = 0.05;
	};
	class MessagingReadVal: RscText
	{
		idc = 274;
		text = "100/100";
		x = 0.53125;
		y = 0.85;
		w = 0.09375;
		h = 0.05;
	};
	class MessagingUnreadVal: RscText
	{
		idc = 275;
		text = "100/100";
		x = 0.53125;
		y = 0.925;
		w = 0.09375;
		h = 0.05;
	};
	class MessagingComposeBtn: RscButton
	{
		idc = 276;
		text = "Compose";
		x = 0.015625;
		y = 0.85;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class MessagingReadBtn: RscButton
	{
		idc = 277;
		text = "Read";
		x = 0.140625;
		y = 0.85;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class MessagingDelBtn: RscButton
	{
		idc = 278;
		text = "Delete";
		x = 0.015625;
		y = 0.925;
		w = 0.109375;
		h = 0.05;
		default = 0;
	};
	class MessagingCloseBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.875;
		y = 0.925;
		w = 0.109375;
		h = 0.05;
		default = 1;
		action = "closeDialog 0;";
	};
};