while {true} do {
	//Acre
	[] execVM "Ultimate-RP\ACRE.sqf";
	
	//Civ Steal Prevention
	if (RPM_Civ) then {
		[] execVM "Ultimate-RP\CivStealVeh.sqf";
		[] execVM "Ultimate-RP\CivStealGear.sqf";
	};
		
	//Display UI
	[] execVM "Ultimate-RP\UI\ui.sqf";
	
	//PD Base Bank Alarm
	if (!canUseBank) then {
		PDBase say3D "BankAlarm_PD";
		sleep 8;
	};
	
	//Force First Person on foot
	if ((vehicle player == player) && (cameraView == "EXTERNAL" || cameraView == "GROUP")) then {
		vehicle player switchCamera "INTERNAL";
		titleText ["3RD PERSON ON FOOT DISABLED!!!","PLAIN DOWN"]; 
		titleFadeOut 4;
	};
	
	//Swimming (can be used for anti exploit)
	_x = getpos player select 0;
	_y = getpos player select 1;
	_SwimAnims = ["aswmpercmwlksnonwnondf", "aswmpercmsprsnonwnondf", "aswmpercmrunsnonwnondf", "aswmpercmstpsnonwnondnon", "aswmpercmrunsnonwnondf_aswmpercmstpsnonwnondnon", "aswmpercmstpsnonwnondnon_aswmpercmrunsnonwnondf", "aswmpercmstpdnon", "aswmpercmstpdnon_aswmpercmstpdf", "aswmpercmstpdf_aswmpercmstpdnon", "aswmpercmstpsnonwnondf"];
	if (!(surfaceIsWater [_x, _y]) && (animationState player) in _SwimAnims) then {
		isSwimming = true;
	};
		
	sleep .5;
};