while {true and isServer} do {
	[] execVM "Ultimate-RP\ACRE.sqf";
	if (RPM_Civ) then {
		[] execVM "Ultimate-RP\CivStealVeh.sqf";
		[] execVM "Ultimate-RP\CivStealGear.sqf";
	};
		
	if (!canUseBank) then {
		PDBase say3D "BankAlarm_PD";
		sleep 8;
	};
	
	if (vehicle player == player) then {
		vehicle player switchCamera "INTERNAL";
	};
	if(cameraView == "EXTERNAL" || cameraView == "GROUP") then {
        titleText ["3RD PERSON ON FOOT DISABLED!!!","PLAIN DOWN"]; titleFadeOut 4;
    };
	
	_x = getpos player select 0;
	_y = getpos player select 1;
	_SwimAnims = ["aswmpercmwlksnonwnondf", "aswmpercmsprsnonwnondf", "aswmpercmrunsnonwnondf", "aswmpercmstpsnonwnondnon", "aswmpercmrunsnonwnondf_aswmpercmstpsnonwnondnon", "aswmpercmstpsnonwnondnon_aswmpercmrunsnonwnondf", "aswmpercmstpdnon", "aswmpercmstpdnon_aswmpercmstpdf", "aswmpercmstpdf_aswmpercmstpdnon", "aswmpercmstpsnonwnondf"];
	if (!(surfaceIsWater [_x, _y]) && (animationState player) in _SwimAnims) then {
		isSwimming = true;
	};
		
	sleep .5;
};