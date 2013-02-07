class RscTitles: RscGroup
{
    titles[] = {UltRP_Dlg_UI};

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
			x = 0.750;
            y = 0.999;
            h = (0.11 * SafeZoneH);
			w = (0.4 * SafeZoneW);
			size = 0.025;
            text = "";
        };
    };  
};