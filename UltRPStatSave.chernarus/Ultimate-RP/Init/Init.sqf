// By Ultimate-RP Dev Team: http://ultimate-rp.com

if (!(local server and !local player)) then {
	execVM "Ultimate-RP\Init\InitClient.sqf",
};

if (isServer) then {
	execVM "Ultimate-RP\Init\InitServer.sqf",
};