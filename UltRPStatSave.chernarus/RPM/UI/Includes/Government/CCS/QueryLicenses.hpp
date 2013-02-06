class QueryLicensesDialog: RscGroup {
	idd = 141;
	movingEnable = true;											
	controlsBackground[] = {DialogBackground};
	objects[] = {};
	controls[] = {
		QLicensesFrame,
		QLicensesRevokeLabel,
		QLicensesYNLabel,
		QLicensesQueryLabel,
		QLicensesLicLabel1,
		QLicensesLicLabel2,
		QLicensesLicLabel3,
		QLicensesLicLabel4,
		QLicensesLicLabel5,
		QLicensesLicLabel6,
		QLicensesLicLabel7,
		QLicensesHasLabel1,
		QLicensesHasLabel2,
		QLicensesHasLabel3,
		QLicensesHasLabel4,
		QLicensesHasLabel5,
		QLicensesHasLabel6,
		QLicensesHasLabel7,
		QLicensesSLDR1,
		QLicensesSLDR2,
		QLicensesSLDR3,
		QLicensesSLDR4,
		QLicensesSLDR5,
		QLicensesSLDR6,
		QLicensesSLDR7,
		QLicensesRevokeButton,
		QLicensesCloseButton
	};
	class DialogBackground: RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		x = 0.15625;
		y = 0.2;
		w = 0.6875;
		h = 0.6;
	};
	class QLicensesFrame: RscFrame
	{
		idc = -1;
		text = "Police - Licenses";
		x = 0.15625;
		y = 0.2;
		w = 0.6875;
		h = 0.6;
		moving = 1;
	};
	class QLicensesRevokeLabel: RscTextMed
	{
		idc = -1;
		text = "Revoke:";
		x = 0.734375;
		y = 0.225;
		w = 0.09375;
		h = 0.05;
	};
	class QLicensesYNLabel: RscTextMed
	{
		idc = -1;
		text = "No/Yes";
		x = 0.734375;
		y = 0.275;
		w = 0.09375;
		h = 0.05;
	};
	class QLicensesQueryLabel: RscTextBig
	{
		idc = 242;
		x = 0.1875;
		y = 0.25;
		w = 0.53125;
		h = 0.05;
	};
	class QLicensesLicLabel1: RscTextMed
	{
		idc = 243;
		x = 0.171875;
		y = 0.35;
		w = 0.09375;
		h = 0.05;
	};
	class QLicensesLicLabel2: RscTextMed
	{
		idc = 244;
		x = 0.171875;
		y = 0.4;
		w = 0.09375;
		h = 0.05;
	};
	class QLicensesLicLabel3: RscTextMed
	{
		idc = 245;
		x = 0.171875;
		y = 0.45;
		w = 0.09375;
		h = 0.05;
	};
	class QLicensesLicLabel4: RscTextMed
	{
		idc = 246;
		x = 0.171875;
		y = 0.5;
		w = 0.09375;
		h = 0.05;
	};
	class QLicensesLicLabel5: RscTextMed
	{
		idc = 247;
		x = 0.171875;
		y = 0.55;
		w = 0.09375;
		h = 0.05;
	};
	class QLicensesLicLabel6: RscTextMed
	{
		idc = 248;
		x = 0.171875;
		y = 0.6;
		w = 0.09375;
		h = 0.05;
	};
	class QLicensesLicLabel7: RscTextMed
	{
		idc = 249;
		x = 0.171875;
		y = 0.65;
		w = 0.09375;
		h = 0.05;
	};
	class QLicensesHasLabel1: RscTextMed
	{
		idc = 250;
		x = 0.65625;
		y = 0.35;
		w = 0.0625;
		h = 0.05;
	};
	class QLicensesHasLabel2: RscTextMed
	{
		idc = 251;
		x = 0.65625;
		y = 0.4;
		w = 0.0625;
		h = 0.05;
	};
	class QLicensesHasLabel3: RscTextMed
	{
		idc = 252;
		x = 0.65625;
		y = 0.45;
		w = 0.0625;
		h = 0.05;
	};
	class QLicensesHasLabel4: RscTextMed
	{
		idc = 253;
		x = 0.65625;
		y = 0.5;
		w = 0.0625;
		h = 0.05;
	};
	class QLicensesHasLabel5: RscTextMed
	{
		idc = 254;
		x = 0.65625;
		y = 0.55;
		w = 0.0625;
		h = 0.05;
	};
	class QLicensesHasLabel6: RscTextMed
	{
		idc = 255;
		x = 0.65625;
		y = 0.6;
		w = 0.0625;
		h = 0.05;
	};
	class QLicensesHasLabel7: RscTextMed
	{
		idc = 256;
		x = 0.65625;
		y = 0.65;
		w = 0.0625;
		h = 0.05;
	};
	class QLicensesSLDR1: RscSliderH
	{
		idc = 257;
		x = 0.734375;
		y = 0.35;
		w = 0.078125;
		h = 0.05;
	};
	class QLicensesSLDR2: RscSliderH
	{
		idc = 258;
		x = 0.734375;
		y = 0.4;
		w = 0.078125;
		h = 0.05;
	};
	class QLicensesSLDR3: RscSliderH
	{
		idc = 259;
		x = 0.734375;
		y = 0.45;
		w = 0.078125;
		h = 0.05;
	};
	class QLicensesSLDR4: RscSliderH
	{
		idc = 260;
		x = 0.734375;
		y = 0.5;
		w = 0.078125;
		h = 0.05;
	};
	class QLicensesSLDR5: RscSliderH
	{
		idc = 261;
		x = 0.734375;
		y = 0.55;
		w = 0.078125;
		h = 0.05;
	};
	class QLicensesSLDR6: RscSliderH
	{
		idc = 262;
		x = 0.734375;
		y = 0.6;
		w = 0.078125;
		h = 0.05;
	};
	class QLicensesSLDR7: RscSliderH
	{
		idc = 263;
		x = 0.734375;
		y = 0.65;
		w = 0.078125;
		h = 0.05;
	};
	class QLicensesRevokeButton: RscButton
	{
		idc = 264;
		text = "Revoke";
		x = 0.171875;
		y = 0.725;
		w = 0.078125;
		h = 0.05;
		default = 1;
	};
	class QLicensesCloseButton: RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.75;
		y = 0.725;
		w = 0.078125;
		h = 0.05;
		action = "closeDialog 0;";
		default = 0;
	};
};
