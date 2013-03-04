class RscTitles: RscGroup
{
    titles[] = {UltRP_Dlg_UI,UltRP_Dlg_UI2};

    class UltRP_Dlg_UI
    {   
        idd = 100;
        movingEnable = true;
        controlsBackground[] = {moneyText};
        duration = 100000000;
        fadein = 0;
        name = "UltRP_Dlg_UI";    
        objects[] = { };
        controls[] = { };
        onLoad = "UltRP_display_ui = _this;";
        
       
        class moneyText : RscStructuredText
        {
            idc = 1;
            x = 0.470 * safezoneW + safezoneX;
            y = 0.88625 * safezoneH + safezoneY;
            w = 0.75 * safezoneW;
            h = 0.3 * safezoneH;
            size = 0.025;
            text = "";
        };
    };
	class UltRP_Dlg_UI2
    {   
        idd = 101;
        movingEnable = true;
        controlsBackground[] = {moneyText};
        duration = 100000000;
        fadein = 0;
        name = "UltRP_Dlg_UI2";    
        objects[] = { };
        controls[] = { };
        onLoad = "UltRP_display_ui2 = _this;";
        
       
        class moneyText : RscStructuredText
        {
            idc = 1;
			x = 0.00146923 * safezoneW + safezoneX;
			y = 0.92625 * safezoneH + safezoneY;
			w = 0.277916 * safezoneW;
			h = 0.14125 * safezoneH;
            size = 0.025;
            text = "";
        };
    };  	
};
