class SettingsDialog: RscGroup {
	idd = 1300;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		SettingsFrame,
		SettingsCloseButton,
		SettingsHeadBugButton,
		SettingsMsgLabel,
		SettingsMsgCombo,
		SettingsMsgDisableButton,
		SettingsTerrainGridLabel,
		SettingsTerrainGridSlider,
		SettingsViewDistanceLabel,
		SettingsViewDistanceSlider,
		SettingsLogsBtn
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.265625;
		y = 0.325;
		w = 0.46875;
		h = 0.35;
	};
	class SettingsFrame: RscFrame
	{
		idc = -1;
		text = "Settings";
		x = 0.265625;
		y = 0.325;
		w = 0.46875;
		h = 0.35;
		moving = 1;
	};
	class SettingsCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.640625;
		y = 0.6;
		w = 0.078125;
		h = 0.05;
		default = 1;
		action = "nul = [(sliderPosition 13002), (sliderPosition 13003)] spawn RPM_Cfg_Inv_Settings_GUI_Apply; closeDialog 0;";
	};
	class SettingsHeadBugButton: RscButton
	{
		idc = -1;
		text = "Fix Headbug";
		x = 0.4375;
		y = 0.6;
		w = 0.140625;
		h = 0.05;
		default = 0;
		action = "MenuAction = 0";
	};
	class SettingsMsgLabel: RscText
	{
		idc = -1;
		text = "Message:";
		x = 0.28125;
		y = 0.475;
		w = 0.109375;
		h = 0.05;
	};
	class SettingsMsgCombo: RscCombo
	{
		idc = 13000;
		x = 0.28125;
		y = 0.525;
		w = 0.171875;
		h = 0.05;
	};
	class SettingsMsgDisableButton: RscButton
	{
		idc = 13001;
		text = "Disable";
		x = 0.28125;
		y = 0.6;
		w = 0.09375;
		h = 0.05;
		default = 0;
	};
	class SettingsTerrainGridLabel: RscText
	{
		idc = -1;
		text = "Terrain Grid:";
		x = 0.28125;
		y = 0.35;
		w = 0.1875;
		h = 0.05;
	};
	class SettingsTerrainGridSlider : RscXSliderH {
		idc = 13002;
		x = 0.46875;
		y = 0.35;
		w = 0.25;
	};
	class SettingsViewDistanceLabel: RscText
	{
		idc = -1;
		text = "View Distance:";
		x = 0.28125;
		y = 0.4;
		w = 0.1875;
		h = 0.05;
	};
	class SettingsViewDistanceSlider : RscXSliderH {
		idc = 13003;
		x = 0.46875;
		y = 0.4;
		w = 0.25;
	};
	class SettingsLogsBtn: RscButton
	{
		idc = 300;
		text = "Logs";
		x = 0.640625;
		y = 0.525;
		w = 0.078125;
		h = 0.05;
		action = "call RPM_Cfg_Logs_Passcode_GUI;";
	};
};
