class PoliticsVoteDialog: RscGroup {
	idd = 114;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		PoliticsVoteFrame,
		PoliticsVotePlayerLabel,
		PoliticsVoteListbox,
		PoliticsVoteButton,
		PoliticsVoteCloseButton,
		PoliticsVoteRunButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.3125;
		y = 0.2;
		w = 0.375;
		h = 0.6;
	};
	class PoliticsVoteFrame: RscFrame
	{
		idc = -1;
		text = "Politics - Vote";
		x = 0.3125;
		y = 0.2;
		w = 0.375;
		h = 0.6;
		moving = 1;
	};
	class PoliticsVotePlayerLabel: RscText
	{
		idc = -1;
		text = "Player:";
		x = 0.328125;
		y = 0.225;
		w = 0.09375;
		h = 0.05;
	};
	class PoliticsVoteListbox: RscListbox
	{
		idc = 230;
		x = 0.328125;
		y = 0.275;
		w = 0.34375;
		h = 0.4;
	};
	class PoliticsVoteButton: RscButton
	{
		idc = 231;
		text = "Vote";
		x = 0.328125;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		default = 1;
	};
	class PoliticsVoteCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.578125;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 0;
	};
	class PoliticsVoteRunButton: RscButton
	{
		idc = 232;
		text = "Run";
		x = 0.453125;
		y = 0.725;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
};
