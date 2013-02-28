// By Ultimate-RP Dev Team: http://ultimate-rp.com

while {true} do {
	waitUntil {alive player};
	
	//Acre
	if (RPM_Cop or RPM_FF) then {
		["Emerg"] call UltRP_ACRE;
	};
	if (RPM_Civ) then {
		["Civ"] call UltRP_ACRE;
	};
	
	
	//Civ Steal Prevention
	if (RPM_Civ) then {
		[] execVM "Ultimate-RP\CivStealVeh.sqf";
	};
		
	
	//Display UI
	call UltRP_UI_HUD;
	
	
	//Bank Alarm
	if (!canUseBank) then {
		[PDBase, "BankAlarm_PD"] call CBA_fnc_globalSay3d;
		sleep 8;
	};
	
	
	//Force First Person On Foot
	if ((vehicle player == player) && (cameraView == "EXTERNAL" || cameraView == "GROUP")) then {
		vehicle player switchCamera "INTERNAL";
		titleText ["3RD PERSON ON FOOT DISABLED!!!","PLAIN DOWN"]; 
		titleFadeOut 4;
	};
	
	sleep .5;
};