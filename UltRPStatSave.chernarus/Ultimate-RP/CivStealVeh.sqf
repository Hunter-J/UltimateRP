// By Ultimate-RP Dev Team: http://ultimate-rp.com
_vcl = vehicle player;
_Restricted = ["laddertruck","a2l_f350ambo","a2l_suburban_FD","a2l_squad"];

if ((_vcl in _Restricted) and (driver _vcl == player)) then {
	player action ["getOut", _vcl];
	player commandChat "You are NOT allowed to steal this vehicle. Go read the rules again.";
	server globalchat format ["%1 Tried to steal an FD vehicle. Remind them that this is against the rules!", name player];
};