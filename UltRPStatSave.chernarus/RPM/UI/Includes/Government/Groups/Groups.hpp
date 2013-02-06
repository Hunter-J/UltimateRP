class GroupDialog: RscGroup
{
	idd = 12;
	movingEnable = true;
	controlsBackground[] = {DialogBackground};
	objects[] = {};		
	controls[] = {
		GroupDialogGroupFrame,
		GroupDialogGroupsFrame,
		GroupDialogCreateFrame,
		GroupDialogMembersFrame,
		GroupDialogTasksFrame,
		GroupDialogGroupListBox,
		GroupDialogCreateNameLabel,
		GroupDialogCreateJoinableLabel,
		GroupDialogCreateFeesLabel,
		GroupDialogGroupFeesLabel,
		GroupDialogGroupFeesAmountLabel,
		GroupDialogNameEdit,
		GroupDialogFeesEdit,
		GroupDialogCreateJoinableCombo,
		GroupDialogMembersCombo,
		GroupDialogJoinLeaveButton,
		GroupDialogFeesButton,
		GroupDialogLockUnlockButton,
		GroupDialogKickButton,
		GroupDialogCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.203125;
		y = 0.125;
		w = 0.625;
		h = 0.75;
	};
	class GroupDialogGroupFrame: RscFrame
	{
		idc = -1;
		text = "Group Menu";
		x = 0.203125;
		y = 0.125;
		w = 0.625;
		h = 0.75;
		moving = 1;
	};
	class GroupDialogGroupsFrame: RscFrame
	{
		idc = -1;
		text = "Group";
		x = 0.203125;
		y = 0.15;
		w = 0.234375;
		h = 0.625;
	};
	class GroupDialogCreateFrame: RscFrame
	{
		idc = 71;
		text = "Create";
		x = 0.4375;
		y = 0.15;
		w = 0.359375;
		h = 0.25;
	};
	class GroupDialogMembersFrame: RscFrame
	{
		idc = 72;
		text = "Members";
		x = 0.4375;
		y = 0.4;
		w = 0.359375;
		h = 0.1;
	};
	class GroupDialogTasksFrame: RscFrame
	{
		idc = -1;
		text = "Tasks";
		x = 0.4375;
		y = 0.5;
		w = 0.359375;
		h = 0.275;
	};
	class GroupDialogGroupListBox: RscListbox
	{
		idc = 73;
		x = 0.21875;
		y = 0.175;
		w = 0.203125;
		h = 0.575;
		color[] = {1,1,1,0};
	};
	class GroupDialogCreateNameLabel: RscText
	{
		idc = 74;
		text = "Name:";
		x = 0.453125;
		y = 0.175;
		w = 0.078125;
		h = 0.05;
	};
	class GroupDialogCreateJoinableLabel: RscText
	{
		idc = 75;
		text = "Joinable:";
		x = 0.453125;
		y = 0.25;
		w = 0.109375;
		h = 0.05;
	};
	class GroupDialogCreateFeesLabel: RscText
	{
		idc = 76;
		//text = "Fee:           $";
		x = 0.453125;
		y = 0.325;
		w = 0.203125;
		h = 0.05;
	};
	class GroupDialogGroupFeesLabel: RscText
	{
		idc = -1;
		//text = "Fee: $";
		x = 0.21875;
		y = 0.8;
		w = 0.140625;
		h = 0.05;
	};
	class GroupDialogGroupFeesAmountLabel: RscText
	{
		idc = 77;
		//text = "1000";
		x = 0.265625;
		y = 0.8;
		w = 0.078125;
		h = 0.05;
	};
	class GroupDialogNameEdit: RscEdit
	{
		idc = 78;
		text = "A Group";
		x = 0.578125;
		y = 0.175;
		w = 0.203125;
		h = 0.05;
	};
	class GroupDialogFeesEdit: RscEdit
	{
		
		idc = 79;
		//text = "1000";
		x = 0.578125;
		y = 0.325;
		w = 0.078125;
		h = 0.05;
	};
	class GroupDialogCreateJoinableCombo: RscCombo
	{
		idc = 80;
		x = 0.578125;
		y = 0.25;
		w = 0.078125;
		h = 0.05;
	};
	class GroupDialogMembersCombo: RscCombo
	{
		idc = 81;
		x = 0.5;
		y = 0.425;
		w = 0.234375;
		h = 0.05;
	};
	class GroupDialogJoinLeaveButton: RscButton
	{
		idc = 82;
		text = "Join";
		x = 0.453125;
		y = 0.525;
		w = 0.15625;
		h = 0.05;
		default = 0;
	};
	class GroupDialogFeesButton: RscButton
	{
		idc = 83;
		//text = "Fees";
		x = 0.625;
		y = 0.525;
		w = 0.15625;
		h = 0.05;
		default = 0;
	};
	class GroupDialogLockUnlockButton: RscButton
	{
		idc = 84;
		text = "Lock/Unlock";
		x = 0.625;
		y = 0.6;
		w = 0.15625;
		h = 0.05;
		default = 0;
	};
	class GroupDialogKickButton: RscButton
	{
		idc = 85;
		text = "Kick";
		x = 0.625;
		y = 0.675;
		w = 0.15625;
		h = 0.05;
		default = 0;
	};
	class GroupDialogCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.65625;
		y = 0.8;
		w = 0.15625;
		h = 0.05;
		default = 1;
		action = "closeDialog 0;";
	};
};
