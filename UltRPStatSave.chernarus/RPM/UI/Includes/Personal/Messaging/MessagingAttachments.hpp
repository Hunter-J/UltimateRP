class MessagingAttachmentsDialog: RscGroup
{
	idd = 123;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		MessagingAttachmentsFrm,
		MessagingAttachmentsAttFrm,
		MessagingAttachmentsAttItemLbl,
		MessagingAttachmentsAttLb,
		MessagingAttachmentsInvFrm,
		MessagingAttachmentsItemLbl,
		MessagingAttachmentsInvLb,
		MessagingAttachmentsAddBtn,
		MessagingAttachmentsDelBtn,
		MessagingAttachmentsClsBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.234375;
		y = 0;
		w = 0.53125;
		h = 1;
	};
	class MessagingAttachmentsFrm: RscFrame
	{
		idc = -1;
		text = "Messaging - Attachments";
		x = 0.234375;
		y = 0;
		w = 0.53125;
		h = 1;
		moving = 1;
	};
	class MessagingAttachmentsAttFrm: RscFrame
	{
		idc = -1;
		text = "Attachments (Added):";
		x = 0.25;
		y = 0.025;
		w = 0.5;
		h = 0.425;
	};
	class MessagingAttachmentsAttItemLbl: RscText
	{
		idc = -1;
		text = "Item (Quantity):";
		x = 0.265625;
		y = 0.05;
		w = 0.34375;
		h = 0.05;
	};
	class MessagingAttachmentsAttLb: RscListBox
	{
		idc = 291;
		x = 0.265625;
		y = 0.1;
		w = 0.46875;
		h = 0.325;
	};
	class MessagingAttachmentsInvFrm: RscFrame
	{
		idc = -1;
		text = "Inventory:";
		x = 0.25;
		y = 0.475;
		w = 0.5;
		h = 0.425;
	};
	class MessagingAttachmentsItemLbl: RscText
	{
		idc = -1;
		text = "Item (Quantity):";
		x = 0.265625;
		y = 0.5;
		w = 0.34375;
		h = 0.05;
	};
	class MessagingAttachmentsInvLb: RscListBox
	{
		idc = 292;
		x = 0.265625;
		y = 0.55;
		w = 0.46875;
		h = 0.325;
	};
	class MessagingAttachmentsAddBtn: RscButton
	{
		idc = 293;
		text = "Add";
		x = 0.25;
		y = 0.925;
		w = 0.0625;
		h = 0.05;
		default = 0;
	};
	class MessagingAttachmentsDelBtn: RscButton
	{
		idc = 294;
		text = "Remove";
		x = 0.328125;
		y = 0.925;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class MessagingAttachmentsClsBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.65625;
		y = 0.925;
		w = 0.09375;
		h = 0.05;
		default = 1;
		action = "closeDialog 0;";
	};
};
