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
		x = 0.0625;
		y = 0.1;
		w = 0.875;
		h = 0.8;
	};
	class InventoryFrame: RscFrame
	{
		idc = -1;
		text = "Inventory";
		x = 0.0625;
		y = 0.1;
		w = 0.875;
		h = 0.8;
		moving = 1;
	};
	class InventoryItemsFrame: RscFrame
	{
		idc = -1;
		text = "Items:";
		x = 0.21875;
		y = 0.125;
		w = 0.515625;
		h = 0.75;
	};
	class InventoryOwnWeightLabel: RscText
	{
		idc = 2;
		text = "Weight: 0kg/62kg";
		x = 0.7615;
		y = 0.125;
		w = 0.2175;
		h = 0.05;
	};
	class InventoryTargetLabel: RscText
	{
		idc = -1;
		text = "Target:";
		x = 0.78125;
		y = 0.175;
		w = 0.09375;
		h = 0.05;
	};
	class InventoryTargetCombo: RscCombo
	{
		idc = 3;
		x = 0.75;
		y = 0.225;
		w = 0.171875;
		h = 0.05;
	};
	class InventoryAmountLabel: RscText
	{
		idc = -1;
		text = "Amount:";
		x = 0.75;
		y = 0.3;
		w = 0.09375;
		h = 0.05;
	};
	class InventoryAmountEdit: RscEdit
	{
		idc = 4;
		text = "1";
		x = 0.859375;
		y = 0.3;
		w = 0.0625;
		h = 0.05;
	};
	class InventoryItemLBLabel: RscText
	{
		idc = -1;
		text = "Item (Weight, Amount)";
		x = 0.234375;
		y = 0.15;
		w = 0.265625;
		h = 0.05;
	};
	class InventoryItemListBox: RscListbox
	{
		idc = 5;
		x = 0.234375;
		y = 0.2;
		w = 0.484375;
		h = 0.65;
	};
	class InventoryPoliceButton: RscButton
	{
		idc = 8;
		text = "Police";
		x = 0.078125;
		y = 0.225;
		w = 0.125;
		h = 0.05;
		default = 0;
		action = "call RPM_Cfg_Police_GUI;";
	};
	class InventoryAnimationButton: RscButton
	{
		idc = -1;
		text = "Animation";
		x = 0.796875;
		y = 0.675;
		w = 0.125;
		h = 0.05;
		action = "call RPM_Cfg_Inv_Animations_GUI;";
		default = 0;
	};
	class InventoryUseButton: RscButton
	{
		idc = 9;
		text = "Use";
		x = 0.796875;
		y = 0.375;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class InventoryGiveButton: RscButton
	{
		idc = 10;
		text = "Give";
		x = 0.796875;
		y = 0.525;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class InventoryDropButton: RscButton
	{
		idc = 11;
		text = "Drop";
		x = 0.796875;
		y = 0.45;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class InventoryKeychainButton: RscButton
	{
		idc = -1;
		text = "Keychain";
		x = 0.796875;
		y = 0.6;
		w = 0.125;
		h = 0.05;
		action = "[lbCurSel 3] call RPM_Cfg_Keychain_GUI;";
		default = 0;
	};
	class InventorySettingsButton: RscButton
	{
		idc = -1;
		text = "Settings";
		x = 0.078125;
		y = 0.75;
		w = 0.125;
		h = 0.05;
		action = "closeDialog 0; call RPM_Cfg_Inv_Settings_GUI;";
		default = 0;
	};
	class InventoryStatsButton: RscButton
	{
		idc = -1;
		text = "Stats";
		x = 0.078125;
		y = 0.15;
		w = 0.125;
		h = 0.05;
		action = "call RPM_Cfg_Inv_Stats_GUI;";
		default = 0;
	};
	class InventoryCLogButton: RscButton
	{
		idc = 12;
		text = "Crime Log";
		x = 0.078125;
		y = 0.675;
		w = 0.125;
		h = 0.05;
		action = "[""crimelog""] call RPM_Cfg_Inv_Crimelog_GUI;";
		default = 0;
	};
	class InventorySkillsButton: RscButton
	{
		idc = 178;
		text = "Skills";
		x = 0.796875;
		y = 0.75;
		w = 0.125;
		h = 0.05;
		action = "call RPM_Cfg_Skills_GUI;";
		default = 0;
	};
	class InventoryRulesButton: RscButton
	{
		idc = 180;
		text = "Rules";
		x = 0.078125;
		y = 0.825;
		w = 0.125;
		h = 0.05;
		default = 0;
	};
	class InventoryCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.796875;
		y = 0.825;
		w = 0.125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 1;
	};
};
