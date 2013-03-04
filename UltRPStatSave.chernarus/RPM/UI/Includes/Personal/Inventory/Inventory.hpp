class InventoryDialog: RscGroup {
	idd = 1;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		InventoryFrame,
		InventoryItemsFrame,
		InventoryOwnWeightLabel,
		InventoryTargetLabel,
		InventoryTargetCombo,
		InventoryAmountLabel,
		InventoryAmountEdit,
		InventoryItemLBLabel,
		InventoryItemListBox,
		InventoryPoliceButton,
		InventoryAnimationButton,
		InventoryUseButton,
		InventoryGiveButton,
		InventoryDropButton,
		InventoryKeychainButton,
		InventorySettingsButton,
		InventoryStatsButton,
		InventoryCLogButton,
		InventorySkillsButton,
		InventoryRulesButton,
		InventoryCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.210883 * safezoneW + safezoneX;
		y = 0.155 * safezoneH + safezoneY;
		w = 0.581879 * safezoneW;
		h = 0.69375 * safezoneH;
	};
	class InventoryFrame: RscFrame
	{
		idc = -1;
		text = "Inventory";
		x = 0.210883 * safezoneW + safezoneX;
		y = 0.155 * safezoneH + safezoneY;
		w = 0.581879 * safezoneW;
		h = 0.69375 * safezoneH;
		moving = 1;
	};
	class InventoryItemsFrame: RscFrame
	{
		idc = -1;
		text = "Items:";
		x = 0.222604 * safezoneW + safezoneX;
		y = 0.2025 * safezoneH + safezoneY;
		w = 0.477954 * safezoneW;
		h = 0.39875 * safezoneH;
	};
	class InventoryOwnWeightLabel: RscText
	{
		idc = 2;
		text = "Weight: 0kg/62kg";
		x = 0.218698 * safezoneW + safezoneX;
		y = 0.80625 * safezoneH + safezoneY;
		w = 0.137265 * safezoneW;
		h = 0.0325 * safezoneH;
		colorText[] = { 0, 5, 0, 1 };
		sizeEx = 0.035;
	};
	class InventoryTargetLabel: RscText
	{
		idc = -1;
		text = "Target:";
		x = 0.546884 * safezoneW + safezoneX;
		y = 0.7475 * safezoneH + safezoneY;
		w = 0.0489674 * safezoneW;
		h = 0.02875 * safezoneH;
		colorText[] = { 3, 0, 0, 1 };
		sizeEx = 0.035;
	};
	class InventoryTargetCombo: RscCombo
	{
		idc = 3;
		x = 0.603926 * safezoneW + safezoneX;
		y = 0.74875 * safezoneH + safezoneY;
		w = 0.181805 * safezoneW;
		h = 0.03 * safezoneH;
		colorText[] = { 3, 0, 0, 1 };
	};
	class InventoryAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.703944 * safezoneW + safezoneX;
		y = 0.215 * safezoneH + safezoneY;
		w = 0.0692837 * safezoneW;
		h = 0.025 * safezoneH;
		colorText[] = { 0, 3, 0, 1 };
		sizeEx = 0.032;
	};
	class InventoryAmountEdit: RscEdit
	{
		idc = 4;
		text = "1";
		x = 0.703945 * safezoneW + safezoneX;
		y = 0.25375 * safezoneH + safezoneY;
		w = 0.0770977 * safezoneW;
		h = 0.035 * safezoneH;
		colorText[] = { 0, 3, 0, 1 };
		sizeEx = 0.025;
	};
	class InventoryItemLBLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Amount)";
		x = 0.233544 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.19587 * safezoneW;
		h = 0.0275 * safezoneH;
		colorText[] = { 0, 3, 0, 1 };
		sizeEx = 0.030;
	};
	class InventoryItemListBox: RscListbox
	{
		idc = 5;
		x = 0.228856 * safezoneW + safezoneX;
		y = 0.26125 * safezoneH + safezoneY;
		w = 0.466233 * safezoneW;
		h = 0.3325 * safezoneH;
	};
	class InventoryPoliceButton: RscShortcutButton
	{
		idc = 8;
		text = "Police";
		x = 0.22573 * safezoneW + safezoneX;
		y = 0.69125 * safezoneH + safezoneY;
		w = 0.0903815 * safezoneW;
		h = 0.075 * safezoneH;
		default = 0;
		action = "call RPM_Cfg_Police_GUI;";
	};
	class InventoryAnimationButton: RscShortcutButton
	{
		idc = -1;
		text = "Animations";
		x = 0.328875 * safezoneW + safezoneX;
		y = 0.62 * safezoneH + safezoneY;
		w = 0.121638 * safezoneW;
		h = 0.0774999 * safezoneH;
		action = "call RPM_Cfg_Inv_Animations_GUI;";
		default = 0;
	};
	class InventoryUseButton: RscShortcutButton
	{
		idc = 9;
		text = "Use";
		x = 0.699256 * safezoneW + safezoneX;
		y = 0.3025 * safezoneH + safezoneY;
		w = 0.0935071 * safezoneW;
		h = 0.07625 * safezoneH;
		default = 0;
	};
	class InventoryGiveButton: RscShortcutButton
	{
		idc = 10;
		text = "Give";
		x = 0.698474 * safezoneW + safezoneX;
		y = 0.35125 * safezoneH + safezoneY;
		w = 0.0935071 * safezoneW;
		h = 0.07625 * safezoneH;
		default = 0;
	};
	class InventoryDropButton: RscShortcutButton
	{
		idc = 11;
		text = "Drop";
		x = 0.698475 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.0935071 * safezoneW;
		h = 0.07625 * safezoneH;
		default = 0;
	};
	class InventoryKeychainButton: RscShortcutButton
	{
		idc = -1;
		text = "Keychain";
		x = 0.464055 * safezoneW + safezoneX;
		y = 0.62 * safezoneH + safezoneY;
		w = 0.106791 * safezoneW;
		h = 0.0774999 * safezoneH;
		action = "[lbCurSel 3] call RPM_Cfg_Keychain_GUI;";
		default = 0;
	};
	class InventorySettingsButton: RscShortcutButton
	{
		idc = -1;
		text = "Settings";
		x = 0.392168 * safezoneW + safezoneX;
		y = 0.7875 * safezoneH + safezoneY;
		w = 0.106791 * safezoneW;
		h = 0.0774999 * safezoneH;
		action = "closeDialog 0; call RPM_Cfg_Inv_Settings_GUI;";
		default = 0;
	};
	class InventoryStatsButton: RscShortcutButton
	{
		idc = -1;
		text = "Stats";
		x = 0.22573 * safezoneW + safezoneX;
		y = 0.62125 * safezoneH + safezoneY;
		w = 0.0903815 * safezoneW;
		h = 0.075 * safezoneH;
		action = "call RPM_Cfg_Inv_Stats_GUI;";
		default = 0;
	};
	class InventoryCLogButton: RscShortcutButton
	{
		idc = 12;
		text = "Crime Log";
		x = 0.332 * safezoneW + safezoneX;
		y = 0.68875 * safezoneH + safezoneY;
		w = 0.125544 * safezoneW;
		h = 0.0787499 * safezoneH;
		action = "[""crimelog""] call RPM_Cfg_Inv_Crimelog_GUI;";
		default = 0;
	};
	class InventorySkillsButton: RscShortcutButton
	{
		idc = 178;
		text = "Skills";
		x = 0.575014 * safezoneW + safezoneX;
		y = 0.62 * safezoneH + safezoneY;
		w = 0.0935071 * safezoneW;
		h = 0.0775 * safezoneH;
		action = "call RPM_Cfg_Skills_GUI;";
		default = 0;
	};
	class InventoryRulesButton: RscShortcutButton
	{
		idc = 180;
		text = "Rules";
		x = 0.499218 * safezoneW + safezoneX;
		y = 0.78625 * safezoneH + safezoneY;
		w = 0.0981955 * safezoneW;
		h = 0.08 * safezoneH;
		default = 0;
	};
	class InventoryCloseButton: RscShortcutButton
	{
		idc = -1;
		text = "Close";
		x = 0.695349 * safezoneW + safezoneX;
		y = 0.785 * safezoneH + safezoneY;
		w = 0.0903815 * safezoneW;
		h = 0.075 * safezoneH;
		action = "closeDialog 0;";
		default = 1;
	};
};
