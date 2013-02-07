if (player distance (getmarkerpos "PDGate1") > 100) exitwith {
	player groupchat "You Are Too Far Away";
};
if (player distance (getmarkerpos "PDGate1") < 100) exitwith {

	player commandChat format ["Opening PD [OUT] Gate"];
	PDGate1 animate ["Bottom_Bar_single_anim",1]; PDGate1 animate ["Top_Bar_single_anim",1];
	player commandChat format ["Gate Closing In 20 Seconds"];
	sleep 20;
	[West,"HQ"] sideChat format ["PD [OUT] GATE CLOSING"];
	PDGate1 animate ["Bottom_Bar_single_anim",0]; PDGate1 animate ["Top_Bar_single_anim",0];
};