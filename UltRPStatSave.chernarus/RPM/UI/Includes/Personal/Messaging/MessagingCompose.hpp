class MessagingComposeDialog: RscGroup
{
	idd = 122;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		MessagingComposeFrm,
		MessagingComposeHeaderFrm,
		MessagingComposeTitleLbl,
		MessagingComposeTitleEdt,
		MessagingComposeTgtLbl,
		MessagingComposeTgtCmb,
		MessagingComposeAttFrm,
		MessagingComposeAttLb,
		MessagingComposeMsgFrm,
		MessagingComposeMsgVal,
		MessagingComposeSendBtn,
		MessagingComposeAttBtn,
		MessagingComposeClsBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.265625;
		y = 0;
		w = 0.468751;
		h = 1;
	};
	class MessagingComposeFrm: RscFrame
	{
		idc = -1;
		text = "Messaging - Compose";
		x = 0.265625;
		y = 0;
		w = 0.468751;
		h = 1;
		moving = 1;
	};
	class MessagingComposeHeaderFrm: RscFrame
	{
		idc = -1;
		x = 0.28125;
		y = 0.025;
		w = 0.4375;
		h = 0.175;
	};
	class MessagingComposeTitleLbl: RscText
	{
		idc = -1;
		text = "Title:";
		x = 0.296875;
		y = 0.05;
		w = 0.09375;
		h = 0.05;
	};
	class MessagingComposeTitleEdt: RscEdit
	{
		idc = 285;
		text = "Some Title 12345678";
		x = 0.40625;
		y = 0.05;
		w = 0.25;
		h = 0.05;
	};
	class MessagingComposeTgtLbl: RscText
	{
		idc = -1;
		text = "Target:";
		x = 0.296875;
		y = 0.125;
		w = 0.09375;
		h = 0.05;
	};
	class MessagingComposeTgtCmb: RscCombo
	{
		idc = 286;
		x = 0.40625;
		y = 0.125;
		w = 0.25;
		h = 0.05;
	};
	class MessagingComposeAttFrm: RscFrame
	{
		idc = -1;
		text = "Attachments:";
		x = 0.28125;
		y = 0.2;
		w = 0.4375;
		h = 0.275;
	};
	class MessagingComposeAttLb: RscListBox
	{
		idc = 287;
		x = 0.296875;
		y = 0.225;
		w = 0.40625;
		h = 0.225;
	};
	class MessagingComposeMsgFrm: RscFrame
	{
		idc = -1;
		text = "Message:";
		x = 0.28125;
		y = 0.475;
		w = 0.4375;
		h = 0.425;
	};
	class MessagingComposeMsgVal: RscStructuredText
	{
		idc = 288;
		text = "Some random shit here";
		x = 0.296875;
		y = 0.5;
		w = 0.40625;
		h = 0.375;
	};
	class MessagingComposeSendBtn: RscButton
	{
		idc = 289;
		text = "Send";
		x = 0.28125;
		y = 0.925;
		w = 0.078125;
		h = 0.05;
		default = 0;
	};
	class MessagingComposeAttBtn: RscButton
	{
		idc = 290;
		text = "Attachments";
		x = 0.375;
		y = 0.925;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class MessagingComposeClsBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.640625;
		y = 0.925;
		w = 0.078125;
		h = 0.05;
		default = 1;
		action = "closeDialog 0;";
	};
};
