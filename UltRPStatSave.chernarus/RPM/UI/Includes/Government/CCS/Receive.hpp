class TicketReceiveDialog: RscGroup
{
	idd = 18;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		TicketFrame,
		TicketCrimeLbl,
		TicketFineLbl,
		TicketFineAmntLbl,
		TicketLbl1,
		TicketLbl2,
		TicketLbl3,
		TicketPayBtn,
		TicketRefuseBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.28125;
		y = 0.25;
		w = 0.4375;
		h = 0.5;
	};
	class TicketFrame: RscFrame
	{
		idc = -1;
		text = "Ticket";
		x = 0.28125;
		y = 0.25;
		w = 0.4375;
		h = 0.5;
		moving = 1;
	};
	class TicketCrimeLbl: RscText
	{
		idc = -1;
		text = "You have received a ticket for:";
		x = 0.375;
		y = 0.275;
		w = 0.375;
		h = 0.05;
	};
	class TicketFineLbl: RscText
	{
		idc = -1;
		text = "Total fine: $";
		x = 0.4375;
		y = 0.575;
		w = 0.15625;
		h = 0.05;
	};
	class TicketFineAmntLbl: RscText
	{
		idc = 167;
		text = "1";
		x = 0.53125;
		y = 0.575;
		w = 0.09375;
		h = 0.05;
	};
	class TicketLbl1: RscText
	{
		idc = 168;
		text = "1.) None - $0";
		x = 0.40625;
		y = 0.35;
		w = 0.375;
		h = 0.05;
	};
	class TicketLbl2: RscText
	{
		idc = 169;
		text = "2.) None - $0";
		x = 0.40625;
		y = 0.425;
		w = 0.375;
		h = 0.05;
	};
	class TicketLbl3: RscText
	{
		idc = 170;
		text = "3.) None - $0";
		x = 0.40625;
		y = 0.5;
		w = 0.375;
		h = 0.05;
	};
	class TicketPayBtn: RscButton
	{
		idc = 171;
		text = "Pay";
		x = 0.296875;
		y = 0.675;
		w = 0.09375;
		h = 0.05;
		default = 1;
	};
	class TicketRefuseBtn: RscButton
	{
		idc = 172;
		text = "Refuse";
		x = 0.609375;
		y = 0.675;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
};
