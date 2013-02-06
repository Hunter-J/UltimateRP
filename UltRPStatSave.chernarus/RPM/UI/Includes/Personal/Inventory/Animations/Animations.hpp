class AnimationsDialog: RscGroup {
	idd = 9;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		AnimationsFrame,
		AnimationLabel,
		AnimationsListBox,
		AnimationsPerformButton,
		AnimationsCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.328125;
		y = 0.2;
		w = 0.34375;
		h = 0.6;
	};
	class AnimationsFrame: RscFrame
	{
		idc = -1;
		text = "Animations";
		x = 0.328125;
		y = 0.2;
		w = 0.34375;
		h = 0.6;
		moving = 1;
	};
	class AnimationLabel: RscText
	{
		idc = -1;
		text = "Animation:";
		x = 0.34375;
		y = 0.225;
		w = 0.140625;
		h = 0.05;
	};
	class AnimationsListBox: RscListbox
	{
		idc = 68;
		x = 0.34375;
		y = 0.275;
		w = 0.3125;
		h = 0.4;
	};
	class AnimationsPerformButton: RscButton
	{
		idc = 69;
		text = "Perform";
		x = 0.34375;
		y = 0.725;
		w = 0.109375;
		h = 0.05;
		default = 1;
	};
	class AnimationsCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.546875;
		y = 0.725;
		w = 0.109375;
		h = 0.05;
		action = "closeDialog 0;";
		default = 0;
	};
};
