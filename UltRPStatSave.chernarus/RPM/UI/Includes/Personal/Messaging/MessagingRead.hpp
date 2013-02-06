class MessagingReadDialog: RscGroup
{
	idd = 121;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		MessagingReadFrm,
		MessagingReadHeaderFrm,
		MessagingReadTitleLbl,
		MessagingReadTitleVal,
		MessagingReadSenderLbl,
		MessagingReadSenderVal,
		MessagingReadReceivedLbl,
		MessagingReadReceivedVal,
		MessagingReadComposeFrm,
		MessagingReadMsgLbl,
		MessagingReadMsgVal,
		MessagingReadReplyBtn,
		MessagingReadDelBtn,
		MessagingReadClsBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.234375;
		y = 0.175;
		w = 0.53125;
		h = 0.65;
	};
	class MessagingReadFrm: RscFrame
	{
		idc = -1;
		text = "Messaging - Read";
		x = 0.234375;
		y = 0.175;
		w = 0.53125;
		h = 0.65;
		moving = 1;
	};
	class MessagingReadHeaderFrm: RscFrame
	{
		idc = -1;
		x = 0.25;
		y = 0.2;
		w = 0.5;
		h = 0.2;
	};
	class MessagingReadTitleLbl: RscText
	{
		idc = -1;
		text = "Title:";
		x = 0.265625;
		y = 0.225;
		w = 0.109375;
		h = 0.05;
	};
	class MessagingReadTitleVal: RscText
	{
		idc = 279;
		text = "Some Title";
		x = 0.390625;
		y = 0.225;
		w = 0.234375;
		h = 0.05;
	};
	class MessagingReadSenderLbl: RscText
	{
		idc = -1;
		text = "Sender:";
		x = 0.265625;
		y = 0.275;
		w = 0.109375;
		h = 0.05;
	};
	class MessagingReadSenderVal: RscText
	{
		idc = 280;
		text = "Some jerkoff 12345";
		x = 0.390625;
		y = 0.275;
		w = 0.234375;
		h = 0.05;
	};
	class MessagingReadReceivedLbl: RscText
	{
		idc = -1;
		text = "Received:";
		x = 0.265625;
		y = 0.325;
		w = 0.109375;
		h = 0.05;
	};
	class MessagingReadReceivedVal: RscText
	{
		idc = 281;
		text = "2012-08-21 00:00:00";
		x = 0.390625;
		y = 0.325;
		w = 0.234375;
		h = 0.05;
	};
	class MessagingReadComposeFrm: RscFrame
	{
		idc = -1;
		x = 0.25;
		y = 0.45;
		w = 0.5;
		h = 0.275;
	};
	class MessagingReadMsgLbl: RscText
	{
		idc = -1;
		text = "Message:";
		x = 0.25;
		y = 0.4;
		w = 0.109375;
		h = 0.05;
	};
	class MessagingReadMsgVal: RscStructuredText
	{
		idc = 282;
		text = "A bunch of shit";
		x = 0.265625;
		y = 0.475;
		w = 0.46875;
		h = 0.225;
	};
	class MessagingReadReplyBtn: RscButton
	{
		idc = 283;
		text = "Reply";
		x = 0.25;
		y = 0.75;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class MessagingReadDelBtn: RscButton
	{
		idc = 284;
		text = "Delete";
		x = 0.359375;
		y = 0.75;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class MessagingReadClsBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.65625;
		y = 0.75;
		w = 0.09375;
		h = 0.05;
		default = 1;
		action = "closeDialog 0;";
	};
};