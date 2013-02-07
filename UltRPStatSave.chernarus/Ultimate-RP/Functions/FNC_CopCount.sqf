// By Ultimate-RP Dev Team: http://ultimate-rp.com

UltRP_CopCount = {
_Sel = _this select 0;
	[] spawn {
		if (_Sel == "Add") then {
			if (copcount == 2) then {
				copcount = copcount + 1;
				server globalchat "3 Cops are online, the Bank can now be robbed!";
			};
			copcount = copcount + 1; 
			publicvariable "copcount";
		};
		if (_Sel == "Sub") then {
			if (copcount == 2) then {
				copcount = copcount - 1; 
				server globalchat "A Cop has gone offline, the Bank can no longer be robbed!";
			};
			copcount = copcount - 1; 
			publicvariable "copcount";
		};
	};
};