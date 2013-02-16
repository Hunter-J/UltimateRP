UltRP_fnc_monitor = 
{
    if (isNil "UltRP_var_speed") then
    {
        UltRP_var_speed = [];
        UltRP_var_height = 0;
    };
    
    waitUntil {alive player};
    _ticks = 0;
    while {true} do
    {
        UltRP_var_speed = speed vehicle player;
        
        if (_ticks % 2 == 0) then
        {
            _velocity = velocity player;
            _fallingRate = _velocity select 2;
            
            if (_fallingRate <= -1.0) then
            {
            
            }
            else
            {
                UltRP_var_height = (getPosATL player) select 2;
            };
        };
    
        _ticks = _ticks + 1;
        sleep 1;
    };

};

