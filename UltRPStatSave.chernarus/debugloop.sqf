while {true} do
{
sleep 5;
_vcl = vehicle player;

player commandChat format ["%1", _vcl getVariable "Tuned"];

};