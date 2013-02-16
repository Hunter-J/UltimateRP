// By Ultimate-RP Dev Team: http://ultimate-rp.com

UltRP_CopCount = {
_Sel = _this select 0;
	switch (_Sel) do {
		case "Add": {
			if (copcount == 2) then {
				copcount = copcount + 1;
				server globalchat "3 Cops are online, the Bank can now be robbed!";
			};
			copcount = copcount + 1; 
			publicvariable "copcount";
		};
		case "Sub": {
			if (copcount == 2) then {
				copcount = copcount - 1; 
				server globalchat "A Cop has gone offline, the Bank can no longer be robbed!";
			};
			copcount = copcount - 1; 
			publicvariable "copcount";
		};
	};
};