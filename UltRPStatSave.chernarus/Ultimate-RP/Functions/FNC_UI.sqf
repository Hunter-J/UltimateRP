// By Ultimate-RP Dev Team: http://ultimate-rp.com

UltRP_UI_HUD = {
_money = [([521] call RPM_Cfg_Inv_GetItemAmount), 1, 0, true] call CBA_fnc_formatNumber;
_bank = [floor(i4), 1, 0, true] call CBA_fnc_formatNumber;
_weight = [] call RPM_Cfg_Inv_GetOwnWeight;
_hunger = floor(i9);
_health = floor(call RPM_Cfg_Inv_GetHealth);
_id = getPlayerUID player;
//_Towns = nearestLocations [vehicle player, ["NameVillage","NameCity","NameCityCapital"], 20000]; 
//_Town = text (_Towns select 0);
//_Street = player getVariable "Street";
	
	disableSerialization;
	100 cutRsc ["UltRP_Dlg_ui", "PLAIN"];
	if (RPM_Cop or RPM_FF) then {
		((UltRP_display_ui select 0) displayCtrl 1) ctrlSetStructuredText parseText format["<t color='#1AE14F'>City/Town:</t> <t color='#E2B31A'>	%1</t><br/>  <t color='#1AE14F'align='left'>Street:</t> <t color='#E2B31A'align='left'>	%2</t><br/><br/><t color='#1AE14F'>Cash:</t> <t color='#E2B31A'>$%3</t>  <t color='#1AE14F'>Bank:</t> <t color='#E2B31A'>$%8</t><br/> <t color='#1AE14F'>Weight:</t> <t color='#E2B31A'>%4KG</t>  <t color='#1AE14F'>Health:</t> <t color='#E2B31A'>%5/100</t><br/> <t color='#1AE14F'>Hunger:</t> <t color='#E2B31A'>%7/100</t>  <t color='#1AE14F'>ID: %6</t>", _Town, _Street, _money, _weight, _health, _id, _hunger, _bank];
	} else {
		((UltRP_display_ui select 0) displayCtrl 1) ctrlSetStructuredText parseText format["<t color='#1AE14F'>Cash:</t> <t color='#E2B31A'>$%1</t>  <t color='#1AE14F'>Bank:</t> <t color='#E2B31A'>$%6</t><br/> <t color='#1AE14F'>Weight:</t> <t color='#E2B31A'>%2KG</t>  <t color='#1AE14F'>Health:</t> <t color='#E2B31A'>%3/100</t><br/> <t color='#1AE14F'>Hunger:</t> <t color='#E2B31A'>%5/100</t>  <t color='#1AE14F'>ID: %4</t>", _money, _weight, _health, _id, _hunger, _bank];
	};
};	
UltRP_UI_Intro = {
	[] spawn {
		waitUntil{!(isNil "BIS_fnc_init")};
		sleep 3;
		[name player, "Welcome To Ultimate-RP"] call BIS_fnc_infoText;
		sleep 3;
		["Ultimate-RP Version 1.1"] call BIS_fnc_infoText;
		sleep 3;
		["Special Thanks To: Hunter.J, OneShot.J, And The Community"] call BIS_fnc_infoText;
		sleep 3;
		server globalChat format ["Welcome %1 To Ulimate-RP", name player];
	};
};