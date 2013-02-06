class InteractDialog: RscGroup {
	idd = 13;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		InteractFrame,
		InteractTargetLabel,
		InteractMugButton,
		InteractRestrainButton,
		InteractStunButton,
		InteractSearchButton,
		InteractScreenButton,
		InteractArrestButton,
		InteractQueryButton,
		InteractCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.3125;
		y = 0.275;
		w = 0.359375;
		h = 0.4;
	};
	class InteractFrame: RscFrame
	{
		idc = -1;
		text = "Interact";
		x = 0.3125;
		y = 0.275;
		w = 0.359375;
		h = 0.4;
		moving = 1;
	};
	class InteractTargetLabel: RscText
	{
		idc = 71;
		x = 0.328125;
		y = 0.3;
		w = 0.328125;
		h = 0.05;
	};
	class InteractMugButton: RscButton
	{
		idc = 72;
		text = "Mug";
		x = 0.546875;
		y = 0.525;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class InteractRestrainButton: RscButton
	{
		idc = 73;
		text = "Restrain";
		x = 0.34375;
		y = 0.375;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class InteractStunButton: RscButton
	{
		idc = 74;
		text = "Stun";
		x = 0.546875;
		y = 0.375;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class InteractSearchButton: RscButton
	{
		idc = 75;
		text = "Search";
		x = 0.34375;
		y = 0.45;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class InteractScreenButton: RscButton
	{
		idc = 76;
		text = "Screen";
		x = 0.546875;
		y = 0.45;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class InteractArrestButton: RscButton
	{
		idc = 173;
		text = "Arrest";
		x = 0.34375;
		y = 0.525;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class InteractQueryButton: RscButton
	{
		idc = 241;
		text = "Licences";
		x = 0.34375;
		y = 0.6;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class InteractCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.546875;
		y = 0.6;
		w = 0.09375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
