class VehicleDialog: RscGroup {
	idd = 4;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		VehicleFrame,
		VehicleIDLabel,
		VehicleInformationButton,
		VehicleKickButton,
		VehicleUnflipButton,
		VehicleTrunkButton,
		VehicleImpoundButton,
		VehicleSearchButton,
		VehicleCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.3125;
		y = 0.3;
		w = 0.375;
		h = 0.4;
	};
	class VehicleFrame: RscFrame
	{
		idc = -1;
		text = "Vehicle Interaction";
		x = 0.3125;
		y = 0.3;
		w = 0.375;
		h = 0.4;
		moving = 1;
	};
	class VehicleIDLabel: RscText
	{
		idc = 27;
		text = "Vehicle ID: None";
		x = 0.328125;
		y = 0.325;
		w = 0.34375;
		h = 0.05;
	};
	class VehicleInformationButton: RscButton
	{
		idc = 151;
		text = "Information";
		x = 0.34375;
		y = 0.4;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class VehicleKickButton: RscButton
	{
		idc = 28;
		text = "Kick Out";
		x = 0.34375;
		y = 0.475;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class VehicleUnflipButton: RscButton
	{
		idc = 29;
		text = "Unflip";
		x = 0.34375;
		y = 0.55;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class VehicleTrunkButton: RscButton
	{
		idc = 30;
		text = "Trunk";
		x = 0.53125;
		y = 0.4;
		w = 0.140625;
		h = 0.05;
		//action = "call RPM_Cfg_Trunk_GUI;";
		default = 0;
	};
	class VehicleImpoundButton: RscButton
	{
		idc = 31;
		text = "Impound";
		x = 0.53125;
		y = 0.475;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class VehicleSearchButton: RscButton
	{
		idc = 32;
		text = "Search";
		x = 0.53125;
		y = 0.55;
		w = 0.140625;
		h = 0.05;
		default = 0;
	};
	class VehicleCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.4375;
		y = 0.625;
		w = 0.140625;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
