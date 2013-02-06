_PatrolCars = ["fs_pd_cvpi","ilpd_slick_b40_pb","ilpd_Traffic_black","ilpd_Traffic_grey","fs_tahoe_pd"];
_K9Cars = ["k9_suburban"]; 
_UCCars = ["A2L_Tahoe_Blackuc","k9_suburban","ilpd_slick_f220_npb_black","tahoe_uc_white","tahoe_uc_black"];
_PDCars = _PatrolCars + _K9Cars + _UCCars;

//PD
{

	_x setvariable ["Tuned", "True", true];
	
} forEach _PDCars;
