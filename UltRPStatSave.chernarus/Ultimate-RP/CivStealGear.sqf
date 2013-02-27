// By Ultimate-RP Dev Team: http://ultimate-rp.com

_vcl = nearestObject [player, "LandVehicle"];
_PatrolCars = ["UltRP_CrownVic_GCPD_Liberty","UltRP_CrownVic_GCPD_Slick"];
_UCCars = ["A2L_Tahoe_Blackuc","A2L_Tahoe_Whiteuc","suburban_pd_black","bcpd_unmarked_black","bcpd_unmarked_white","bcpd_unmarked_grey","bcpd_unmarked_blue","bcpd_unmarked_sandstone","bcpd_unmarked_maroon"];
_CopCars = _PatrolCars + _UCCars + ["suburban_pd_k9"];

WaitUntil {!IsNull (FindDisplay 106)};
if (vehicle player == player) then {
	if ((player distance _vcl <= 5) and (typeOf _vcl in _CopCars)) then {
		closeDialog 0;
		player commandChat "You are not allowed to take gear from PD Cars";
	};

	if ((player distance _vcl <= 5) and (locked _vcl)) then {
		closeDialog 0;
		player commandChat "You are not allowed to take gear from locked vehicles!";
	};
};