if (RPM_Cop) then {
	_speedcam1 = createMarkerLocal["scam1", position speed1];
	_speedcam1 setMarkerShapeLocal "ICON";
	_speedcam1 setMarkerTypeLocal "DOT";
	_speedcam1 setMarkerTextLocal "Speed Cam 1";
	_speedcam1 setMarkerColorLocal "ColorBlack";

	_speedcam2 = createMarkerLocal["scam2", position speed2];
	_speedcam2 setMarkerShapeLocal "ICON";
	_speedcam2 setMarkerTypeLocal "DOT";
	_speedcam2 setMarkerTextLocal "Speed Cam 2";
	_speedcam2 setMarkerColorLocal "ColorBlack";

	_speedcam3 = createMarkerLocal["scam3", position speed3];
	_speedcam3 setMarkerShapeLocal "ICON";
	_speedcam3 setMarkerTypeLocal "DOT";
	_speedcam3 setMarkerTextLocal "Speed Cam 3";
	_speedcam3 setMarkerColorLocal "ColorBlack";

	_speedcam4 = createMarkerLocal["scam4", position speed4];
	_speedcam4 setMarkerShapeLocal "ICON";
	_speedcam4 setMarkerTypeLocal "DOT";
	_speedcam4 setMarkerTextLocal "Speed Cam 4";
	_speedcam4 setMarkerColorLocal "ColorBlack";

	_speedcam5 = createMarkerLocal["scam5", position speed5];
	_speedcam5 setMarkerShapeLocal "ICON";
	_speedcam5 setMarkerTypeLocal "DOT";
	_speedcam5 setMarkerTextLocal "Speed Cam 5";
	_speedcam5 setMarkerColorLocal "ColorBlack";
};


if (RPM_Civ) then {
	//Dealers
	_mdrugdealer = createMarkerLocal["mdrugdealer", position mdrugsell];
	_mdrugdealer setMarkerShapeLocal "ICON";
	_mdrugdealer setMarkerTypeLocal "DOT";
	_mdrugdealer setMarkerTextLocal "Drug Dealer (Marijuana)";
	_mdrugdealer setMarkerColorLocal "ColorRed";

	_cdrugdealer = createMarkerLocal["cdrugdealer", position cdrugsell];
	_cdrugdealer setMarkerShapeLocal "ICON";
	_cdrugdealer setMarkerTypeLocal "DOT";
	_cdrugdealer setMarkerTextLocal "Drug Dealer (Cocaine)";
	_cdrugdealer setMarkerColorLocal "ColorRed";
	
	_methdrugdealer = createMarkerLocal["methdrugdealer", position methsell];
	_methdrugdealer setMarkerShapeLocal "ICON";
	_methdrugdealer setMarkerTypeLocal "DOT";
	_methdrugdealer setMarkerTextLocal "Drug Dealer (Meth)";
	_methdrugdealer setMarkerColorLocal "ColorRed";
	
	//Plantations
	_mdrugplant = createMarkerLocal["marker_field_marijuana", getMarkerPos "marijuanafield"];
	_mdrugplant setMarkerShapeLocal "ICON";
	_mdrugplant setMarkerTypeLocal "DOT";
	_mdrugplant setMarkerTextLocal "Marijuana Field";
	_mdrugplant setMarkerColorLocal "ColorRed";

	_cdrugplant = createMarkerLocal["marker_field_cocaine", getMarkerPos "cocainefield"];
	_cdrugplant setMarkerShapeLocal "ICON";
	_cdrugplant setMarkerTypeLocal "DOT";
	_cdrugplant setMarkerTextLocal "Cocaine Field";
	_cdrugplant setMarkerColorLocal "ColorRed";
	
	//Plantations (circles)
	_mdrugplantcircle = createMarkerLocal["field_marijuana", getMarkerPos "marijuanafield"];
	_mdrugplantcircle setMarkerShapeLocal "ELLIPSE";
	_mdrugplantcircle setMarkerSizeLocal [25, 25];
	_mdrugplantcircle setMarkerColorLocal "ColorRed";

	_cdrugplantcircle = createMarkerLocal["field_cocaine", getMarkerPos "cocainefield"];
	_cdrugplantcircle setMarkerShapeLocal "ELLIPSE";
	_cdrugplantcircle setMarkerSizeLocal [25, 25];
	_cdrugplantcircle setMarkerColorLocal "ColorRed";
	
	//Gang Areas
	_mdrugplant = createMarkerLocal["gangarea1", position gangflag1];
	_mdrugplant setMarkerShapeLocal "ICON";
	_mdrugplant setMarkerTypeLocal "DOT";
	_mdrugplant setMarkerTextLocal "Gang Area 1";
	_mdrugplant setMarkerColorLocal "ColorRed";

	_cdrugplant = createMarkerLocal["gangarea2", position gangflag2];
	_cdrugplant setMarkerShapeLocal "ICON";
	_cdrugplant setMarkerTypeLocal "DOT";
	_cdrugplant setMarkerTextLocal "Gang Area 2";
	_cdrugplant setMarkerColorLocal "ColorRed";
};