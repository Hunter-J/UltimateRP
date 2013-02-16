//By OneShot.J
CellPhoneSelect = lbCurSel 2119;

switch (CellPhoneSelect) do {
    case 0: { //Call Taxi
		["Send"] call UltRP_Taxi;
		closeDialog 0;
	};
};