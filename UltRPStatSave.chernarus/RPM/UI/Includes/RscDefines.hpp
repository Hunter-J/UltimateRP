#define FontM 			"TahomaB"
#define FontHTML 		"TahomaB"
#define CT_STATIC 		0
#define CT_BUTTON		1
#define CT_EDIT			2
#define CT_SLIDER		3
#define CT_COMBO		4
#define CT_LISTBOX		5
#define CT_LIST_N_BOX   102
#define CT_TOOLBOX 		6
#define CT_CHECKBOXES 		7
#define CT_PROGRESS 		8
#define CT_HTML 		9
#define CT_STATIC_SKEW 		10
#define CT_ACTIVETEXT		11
#define CT_TREE 		12
#define CT_STRUCTURED_TEXT 	13
#define CT_CONTEXT_MENU 	14
#define CT_CONTROLS_GROUP 	15
#define CT_XKEYDESC 		40
#define CT_XBUTTON 		41
#define CT_XLISTBOX 		42
#define CT_XSLIDER 		43
#define CT_XCOMBO 		44
#define CT_ANIMATED_TEXTURE	45
#define CT_OBJECT 		80
#define CT_OBJECT_ZOOM 		81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_LINEBREAK		98
#define CT_USER			99
#define CT_MAP 			100
#define CT_MAP_MAIN		101
#define ST_LEFT			0
#define ST_RIGHT		1
#define ST_CENTER		2
#define ST_MULTI		16
#define ST_PICTURE		48
#define ST_FRAME		64
#define ST_SHADOW		256
#define ST_NO_RECT		512

class RscGroup
{
	type = 15;
	idc = -1;
	style = 0;
	class RscText
	{
		type              = CT_STATIC;
		idc               = -1;
		style             = ST_LEFT;
		colorBackground[] = {0, 0, 0, 0};
		colorText[]       = {1, 1, 1, 1};
		font              = FontM;
		sizeEx            = 0.02;
		text              = "";
	};
	class RscTextMed
	{
		type              = CT_STATIC;
		idc               = -1;
		style             = ST_LEFT;
		colorBackground[] = {0, 0, 0, 0};
		colorText[]       = {1, 1, 1, 1};
		font              = FontM;
		sizeEx            = 0.03;
		text              = "";
	};
	class RscTextBig
	{
		type              = CT_STATIC;
		idc               = -1;
		style             = ST_LEFT;
		colorBackground[] = {0, 0, 0, 0};
		colorText[]       = {1, 1, 1, 1};
		font              = FontM;
		sizeEx            = 0.04;
		text              = "";
	};
	class RscStructuredText: RscText
	{
		idc               = -1;
		type              = CT_STRUCTURED_TEXT;
		style             = ST_CENTER;
		size              = 0.02;
		class Attributes {
			font = "TahomaB";
			color = "#FFFFFF";
			align = "center";
			valign = "middle";
			shadow = false;
			shadowColor = "#ff0000";
			size = "2";
		};
	};
	class RscFrame
	{
		type              = CT_STATIC;
		idc               = -1;
		style             = ST_FRAME;
		colorBackground[] = {0, 0, 0, 0.88};
		colorText[]       = {1, 1, 1, 1};
		font              = FontM;
		SizeEX            = 0.025;
		text              = "";
	};
	class RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.88};
		colorText[]       = {1, 1, 1, 1};
		text              = "";
		type              = CT_STATIC;
		idc               = -1;
		style             = ST_LEFT;
		font              = FontM;
		sizeEx            = 0.04;
	};
	class RscPicture
	{
		type              = CT_STATIC;
		idc               =  -1;
		style             = ST_PICTURE;
		colorBackground[] = {0, 0, 0, 0.88};
		colorText[]       = {1, 1, 1, 1};
		font              = FontM;
		sizeEx            = 0.02;
		text              = "";
	};
	class RscBackgroundPicture
	{
		type              = CT_STATIC;
		idc               =  -1;
		style             = ST_PICTURE;
		colorBackground[] = {0, 0, 0, 0.88};
		colorText[]       = {1, 1, 1, 1};
		font              = FontM;
		sizeEx            = 0.02;
		text              = "";
	};
	class RscShortcutButton {
		type = 16;
		idc = -1;
		style = 0;
		default = 0;
		w = 0.183825;
		h = 0.104575;
		color[] = {0.543, 0.5742, 0.4102, 1.0};
		color2[] = {0.95, 0.95, 0.95, 1};
		colorBackground[] = {1, 1, 1, 1};
		colorbackground2[] = {1, 1, 1, 0.4};
		colorDisabled[] = {1, 1, 1, 0.25};
		periodFocus = 1.2;
		periodOver = 0.8;

		class HitZone {
			left = 0.004;
			top = 0.029;
			right = 0.004;
			bottom = 0.029;
		};

		class ShortcutPos {
			left = 0.004;
			top = 0.026;
			w = 0.0392157;
			h = 0.0522876;
		};

		class TextPos {
			left = 0.05;
			top = 0.034;
			right = 0.005;
			bottom = 0.005;
		};
		animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
		animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
		animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
		animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
		animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
		animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
		textureNoShortcut = "";
		period = 0.4;
		font = "Zeppelin32";
		size = 0.03521;
		sizeEx = 0.03521;
		text = "";
		soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
		soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
		soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
		soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
		action = "";

		class Attributes {
			font = "Zeppelin32";
			color = "#E5E5E5";
			align = "left";
			shadow = "true";
		};

		class AttributesImage {
			font = "Zeppelin32";
			color = "#E5E5E5";
			align = "left";
		};
	};
	class RscIGUIShortcutButton : RscShortcutButton {
		w = 0.183825;
		h = 0.0522876;
		style = 2;
		color[] = {1, 1, 1, 1};
		color2[] = {1, 1, 1, 0.85};
		colorBackground[] = {1, 1, 1, 1};
		colorbackground2[] = {1, 1, 1, 0.85};
		colorDisabled[] = {1, 1, 1, 0.4};

		class HitZone {
			left = 0.002;
			top = 0.003;
			right = 0.002;
			bottom = 0.016;
		};

		class ShortcutPos {
			left = -0.006;
			top = -0.007;
			w = 0.0392157;
			h = 0.0522876;
		};

		class TextPos {
			left = 0.02;
			top = 0.0;
			right = 0.002;
			bottom = 0.016;
		};
		animTextureNormal = "\ca\ui\data\igui_button_normal_ca.paa";
		animTextureDisabled = "\ca\ui\data\igui_button_disabled_ca.paa";
		animTextureOver = "\ca\ui\data\igui_button_over_ca.paa";
		animTextureFocused = "\ca\ui\data\igui_button_focus_ca.paa";
		animTexturePressed = "\ca\ui\data\igui_button_down_ca.paa";
		animTextureDefault = "\ca\ui\data\igui_button_normal_ca.paa";

		class Attributes {
			font = "Zeppelin32";
			color = "#E5E5E5";
			align = "center";
			shadow = "true";
		};
	};
	class RscShortcutButtonMain: RscShortcutButton {
		w = 0.313726;
		h = 0.104575;
		color[] = {0.543, 0.5742, 0.4102, 1.0};
		colorDisabled[] = {1, 1, 1, 0.25};

		class HitZone {
			left = 0.0;
			top = 0.0;
			right = 0.0;
			bottom = 0.0;
		};

		class ShortcutPos {
			left = 0.0204;
			top = 0.026;
			w = 0.0392157;
			h = 0.0522876;
		};

		class TextPos {
			left = 0.08;
			top = 0.034;
			right = 0.005;
			bottom = 0.005;
		};
		animTextureNormal = "\ca\ui\data\ui_button_main_normal_ca.paa";
		animTextureDisabled = "\ca\ui\data\ui_button_main_disabled_ca.paa";
		animTextureOver = "\ca\ui\data\ui_button_main_over_ca.paa";
		animTextureFocused = "\ca\ui\data\ui_button_main_focus_ca.paa";
		animTexturePressed = "\ca\ui\data\ui_button_main_down_ca.paa";
		animTextureDefault = "\ca\ui\data\ui_button_main_normal_ca.paa";
		period = 0.5;
		font = "Zeppelin32";
		size = 0.03921;
		sizeEx = 0.03921;
		text = "";
		soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
		soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
		soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
		soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
		action = "";

		class Attributes {
			font = "Zeppelin32";
			color = "#E5E5E5";
			align = "left";
			shadow = "false";
		};

		class AttributesImage {
			font = "Zeppelin32";
			color = "#E5E5E5";
			align = "false";
		};
	};
	class RscButton {
		type                      = CT_BUTTON;
		idc                       = -1;
		style                     = ST_CENTER;
		colorText[]               = {1, 1, 1, 1};
		font                      = FontHTML;
		sizeEx                    = 0.025;
		soundPush[]               = {, 0.2, 1};
		soundClick[]              = {"", 0.2, 1};
		soundEscape[]             = {"", 0.2, 1};
		default                   = false;
		text                      = "";
		action                    = "";
		colorActive[]             = {0.188, 0.188, 0.188, 1};
		colorDisabled[]           = {1, 1, 1, 0.3};
		colorBackground[]         = {0.0128, 0.0128, 0.0128, 1};
		colorBackgroundActive[]   = {0.188, 0.188, 0.188, 1};
		colorBackgroundDisabled[] = {0, 0, 0, 0.1};
		colorFocused[]            = {0.35, 0.35, 0.35, 1};
		colorShadow[]             = {0, 0, 0, 0.1};
		colorBorder[]             = {1, 1, 1, 0.1};
		offsetX                   = 0;
		offsetY                   = 0;
		offsetPressedX            = 0;
		offsetPressedY            = 0;
		borderSize                = 0;
		soundEnter[]              = {"", 0.15, 1};
	};
	class RscDummy : RscButton
	{
		x   = -1.0;
		y   = -1.0;
		idc = -1;
		w   = 0.01;
		h   = 0.01;
		default = 0;
	};
	class RscEdit
	{
		type = CT_EDIT;
		idc = -1;
		style = ST_LEFT;
		font = FontHTML;
		sizeEx = 0.02;
		colorBackground[] = {0.9215, 0.9215, 0.9215, 1};
		colorText[] = {0.9215, 0.9215, 0.9215, 1};
		colorSelection[] = {0.5, 0.5, 0.5, 1};
		autocomplete = false;
		text = "";
	};
	class RscLB_C
	{
		style                   = ST_LEFT;
		idc                     = -1;
		colorSelect[]           = {1, 1, 1, 1};
		colorSelectBackground[] = {0.5, 0.5, 0.5, 0.88};
		colorText[]             = {1, 1, 1, 1};
		colorBackground[]       = {0.5, 0.5, 0.5, 0.88};
		colorScrollbar[] 	    = {1, 1, 1, 0.88};
		font                    = FontHTML;
		sizeEx                  = 0.025;
		rowHeight               = 0.04;
		period 			        = 1.200000;
		maxHistoryDelay 	    = 1.000000;
		autoScrollSpeed 	    = -1;
		autoScrollDelay 	    = 5;
		autoScrollRewind 	    = 0;
		class ScrollBar {};
	};
	class RscListNBox  {
		access = 0;
		type = 102;
		style = 0;
        x = 0;
        y = 0;
		w = 0.400000;
		h = 0.400000;
		font = "TahomaB";
		sizeEx = 0.040000;
		rowHeight = 0;
		colorText[] = {1,1,1,1 };
		colorScrollbar[] = {1,1,1,1 };
		colorSelect[] = {0,0,0,1 };
		colorSelect2[] = {1,0.500000,0,1 };
		colorSelectBackground[] = {0.600000,0.600000,0.600000,1 };
		colorSelectBackground2[] = {0.200000,0.200000,0.200000,1 };
		colorBackground[] = {0,0,0,1 };
		maxHistoryDelay = 1.000000;
		soundSelect[] = {"",0.100000,1 };
		period = 1;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		drawSideArrows = 0;
		columns[] = {0.300000,0.600000,0.700000 };
		idcLeft = -1;
		idcRight = -1;
		class ScrollBar  {
			color[] = {1,1,1,0.600000 };
			colorActive[] = {1,1,1,1 };
			colorDisabled[] = {1,1,1,0.300000 };
			thumb = "#(argb,8,8,3)color(1,1,1,1)";
			arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
			arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
			border = "#(argb,8,8,3)color(1,1,1,1)";
		};
	};
	class RscListBox: RscLB_C {
		type                    = CT_LISTBOX;
		soundSelect[]           = {"", 0.1, 1};
	};
	class RscCombo: RscLB_C
	{
		type                    = CT_COMBO;
		wholeHeight             = 0.3;
		soundSelect[]           = {"", 0.15, 1};
		soundExpand[]           = {"", 0.15, 1};
		soundCollapse[]         = {"", 0.15, 1};
		arrowEmpty              = "\ca\ui\data\ui_arrow_combo_ca.paa";
		arrowFull               = "\ca\ui\data\ui_arrow_combo_active_ca.paa"; 
	};
	class RscSliderH
	{
		access  = ReadandWrite;
		type    = CT_SLIDER;
		idc     = -1;
		sizeEx  = 0.025;
		style   = 1024;
		color[] = {0.2, 0.2, 0.2, 1};
		colorActive[] = {1, 1, 1, 1};
	};
	class RscXSliderH {
		idc = -1;
		type = 43;
		style = 0x400  + 0x10;
		x = 0;
		y = 0;
		h = 0.029412;
		w = 0.4;
		color[] = {1, 1, 1, 0.4};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.2};
		arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
		border = "\ca\ui\data\ui_border_frame_ca.paa";
		thumb = "\ca\ui\data\ui_slider_bar_ca.paa";
	};
	class RscSliderV
	{
		access  = ReadandWrite;
		type    = CT_SLIDER;
		idc     = -1;
		sizeEx  = 0.025;
		style   = 0;
		color[] = {0.2, 0.2, 0.2, 1};
		colorActive[] = {1, 1, 1, 1};
	};
};
