if (RPM_Cop) then {
	player addMPEventHandler ["MPRespawn",{["Add"] call UltRP_CopCount}];  
	player addMPEventHandler ["MPKilled",{["Sub"] call UltRP_CopCount}];

	"Dispatch" addPublicVariableEventHandler {
		[player, getMarkerPos _Marker] spawn fnc_NavTask;
		execVM "Scripts\DispatchSound.sqf";
		cutText [_this select 1, "PLAIN"];
	};
};

if (RPM_FF) then {
	player addEventHandler ["hit", {player setDammage -4000}]; 
	player addEventHandler ["dammaged", {player setDammage -4000}];
};

if (RPM_Civ) then {
	"DispatchTaxi" addPublicVariableEventHandler {
		if ((typeOf _vcl == "tcg_taurus_taxi") and (_vcl emptyPositions "Cargo" == 5)) then {
			hint (_this select 1);
		};
	};
};

"AdminTele" addPublicVariableEventHandler {
	player commandChat (_this select 1);
};