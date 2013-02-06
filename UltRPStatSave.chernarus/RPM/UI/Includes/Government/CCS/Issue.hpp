class TicketIssueDialog: RscGroup
{
	idd = 16;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		TicketFrame,
		TicketCrimeLbl,
		TicketChoseLbl,
		TicketCmb1,
		TicketCmb2,
		TicketCmb3,
		TicketFineLbl,
		TicketFineEdt,
		TicketSubmitBtn,
		TicketClsBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.25;
		y = 0.2;
		w = 0.5;
		h = 0.6;
	};
	class TicketFrame: RscFrame
	{
		idc = -1;
		text = "Issue Ticket";
		x = 0.25;
		y = 0.2;
		w = 0.5;
		h = 0.6;
		moving = 1;
	};
	class TicketCrimeLbl: RscText
	{
		idc = -1;
		text = "A Ticket May Have Up To 3 Crimes";
		x = 0.375;
		y = 0.25;
		w = 0.40625;
		h = 0.05;
	};
	class TicketChoseLbl: RscText
	{
		idc = -1;
		text = "Choose Major Crimes Involved";
		x = 0.375;
		y = 0.3;
		w = 0.40625;
		h = 0.05;
	};
	class TicketCmb1: RscCombo
	{
		idc = 157;
		x = 0.34375;
		y = 0.375;
		w = 0.3125;
		h = 0.05;
	};
	class TicketCmb2: RscCombo
	{
		idc = 158;
		x = 0.34375;
		y = 0.45;
		w = 0.3125;
		h = 0.05;
	};
	class TicketCmb3: RscCombo
	{
		idc = 159;
		x = 0.34375;
		y = 0.525;
		w = 0.3125;
		h = 0.05;
	};
	class TicketFineLbl: RscText
	{
		idc = -1;
		text = "Total fine: $";
		x = 0.4;
		y = 0.625;
		w = 0.15625;
		h = 0.05;
	};
	class TicketFineEdt: RscEdit
	{
		idc = 160;
		text = "1";
		x = 0.5;
		y = 0.625;
		w = 0.09375;
		h = 0.05;
	};
	class TicketSubmitBtn: RscButton
	{
		idc = 161;
		text = "Submit";
		x = 0.265625;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		default = 1;
	};
	class TicketClsBtn: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.640625;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		default = 0;
		action = "closeDialog 0;";
	};
};
