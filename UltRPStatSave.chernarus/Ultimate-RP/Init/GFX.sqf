/*
	Text That Apears On Spawn Of Player [DO NOT TOUCH]
*/

RPM_Intro =
{
waitUntil{!(isNil "BIS_fnc_init")};
sleep 3;
	[name player, "Welcome To Ultimate-RP"] call BIS_fnc_infoText;
	sleep 1;
	["Ultimate-RP Beta Version 1.1"] call BIS_fnc_infoText;
	sleep 1;
	["Special Thanks To:", "Hunter.J & OneShot.J", "And The Community"] call BIS_fnc_infoText;
	sleep 3;
	["All You Stats Are Saved", "Money|Keys|Vehicles|Items"] call BIS_fnc_infoText;
};