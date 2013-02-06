class PoliticsFrequencyDialog: RscGroup {
	idd = 109;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		PoliticsFrequencyFrame,
		PoliticsFrequencyEveryLabel,
		PoliticsFrequencyMinLabel,
		PoliticsFrequencyMinEdit,
		PoliticsFrequencySubmitButton,
		PoliticsFrequencyCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.359375;
		y = 0.4;
		w = 0.28125;
		h = 0.2;
	};
	class PoliticsFrequencyFrame: RscFrame
	{
		idc = -1;
		text = "Politics - Frequency";
		x = 0.359375;
		y = 0.4;
		w = 0.28125;
		h = 0.2;
		moving = 1;
	};
	class PoliticsFrequencyEveryLabel: RscText
	{
		idc = -1;
		text = "Every:";
		x = 0.375;
		y = 0.425;
		w = 0.078125;
		h = 0.05;
	};
	class PoliticsFrequencyMinLabel: RscText
	{
		idc = -1;
		text = "minute(s)";
		x = 0.515625;
		y = 0.425;
		w = 0.109375;
		h = 0.05;
	};
	class PoliticsFrequencyMinEdit: RscEdit
	{
		idc = 206;
		text = "15";
		x = 0.46875;
		y = 0.425;
		w = 0.046875;
		h = 0.05;
	};
	class PoliticsFrequencySubmitButton: RscButton
	{
		idc = 207;
		text = "Submit";
		x = 0.375;
		y = 0.525;
		w = 0.09375;
		h = 0.05;
		default = 1;
	};
	class PoliticsFrequencyCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.53125;
		y = 0.525;
		w = 0.09375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 0;
	};
};
