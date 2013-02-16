"UltRP_net_publicExecVar" addPublicVariableEventHandler
{
    (_this select 1) call UltRP_fnet_execCommand;	
};

UltRP_fnet_execPublic =
{
    UltRP_net_publicExecVar = _this;
    publicVariable "UltRP_net_publicExecVar";
    _this call UltRP_fnet_execCommand;
};

UltRP_fnet_execCommand =
{
    private ["_function", "_params"];

    _function = _this select 0;

    if ((count _this) == 2) then
    {
        _params = _this select 1;
    }
    else
    {
        _params = [];
    };

    if ((typeName _function) == "STRING") then
    {
        _function = call compile (_this select 0);
    };

    _params call _function;
};

UltRP_fnc_serverDetach =
{
    private ["_unit"];
    _unit = _this select 0;
    
    //if (player != _unit) exitWith {};
    
    detach _unit;
};

UltRP_fnc_serverAttachTo = 
{
    private ["_unit", "_to", "_params"];
    _unit = _this select 0;
    _to = _this select 1;
    _params = _this select 2;
    
    //if (player != _unit) exitWith {};
    
    _unit attachTo [_to, _params];
};

UltRP_fnc_serverSwitchAnimation =
{
    private ["_obj", "_anim"];
    _obj = _this select 0;
    _anim = _this select 1;
    
    _obj switchMove _anim;
};

UltRP_fnc_serverPlayMove = 
{
    private ["_obj", "_anim"];
    _obj = _this select 0;
    _anim = _this select 1;
    
    _obj playMove _anim;

};