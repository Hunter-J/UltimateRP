//15934726 = OneShot.J
//36111430 = S2h2h
//2314432 = Turoczi
//929600 = tawo
//78491014 = cline
//8766086 = Brittner
//92028422 = gunmanprice
//4283968 = LaLa
//87740038 = kratzer
//2355072 = Smith.J
//14941318 = Domo
//32388422 = Scott.E
//192129 = MCLean
//42753670 = Vitaly
//2167745 = Potter.J
//4950854 = Jensen.G
//10631238 = watermelon
//10451590 = milosz
//10602374 = shouri
//9488902 = T.Gleason
//243265 = Murdock
//9771590 = Troop101
//9218566 = Cigala.Z
//9216582 = B.Crockett
//77825286 = serre milette
//8280070 = winters
//1807558 = woods
//4483877 = boring
//61877894 = Anderson
	
_AdminList = ["15934726","32388422"];

_copList = [];
_FDList = [];

_id = getPlayerUID player;

if (_id in _AdminList) then {
	isAdmin = true;
};

if (!(_id in _AdminList)) then {
	if (!(_id == "2355072") and player == cop3) then {
		titletext ["YOU ARE NOT ALLOWED TO PLAY IN THIS SLOT!", "BLACK", 1];
		player enableSimulation false;
	};
	if (!(_id == "32388422") and player == cop4) then {
		titletext ["YOU ARE NOT ALLOWED TO PLAY IN THIS SLOT!", "BLACK", 1];
		player enableSimulation false;
	};
	if (!(_id == "2314432") and player == cop5) then {
		titletext ["YOU ARE NOT ALLOWED TO PLAY IN THIS SLOT!", "BLACK", 1];
		player enableSimulation false;
	};

	if (!(_id == "78491014") and player == ff1) then {
		titletext ["YOU ARE NOT ALLOWED TO PLAY IN THIS SLOT!", "BLACK", 1];
		player enableSimulation false;
	};
	if (!(_id == "192129") and player == ff2) then {
		titletext ["YOU ARE NOT ALLOWED TO PLAY IN THIS SLOT!", "BLACK", 1];
		player enableSimulation false;
	};
			
		
	if (!(_id in _copList) and RPM_Cop) then {
		titletext ["YOU ARE NOT ALLOWED TO PLAY IN THIS SLOT!", "BLACK", 1];
		player enableSimulation false;
	};
	if (!(_id in _FDList) and RPM_FF) then {
		titletext ["YOU ARE NOT ALLOWED TO PLAY IN THIS SLOT!", "BLACK", 1];
		player enableSimulation false;
	};
};