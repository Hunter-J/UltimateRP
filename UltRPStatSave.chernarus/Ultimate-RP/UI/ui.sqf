// By Ultimate-RP Dev Team: http://ultimate-rp.com

[] spawn
{
    disableSerialization;
    100 cutRsc ["UltRP_Dlg_ui", "PLAIN"];
    
    while {true} do
    {
        _money = [([521] call RPM_Cfg_Inv_GetItemAmount), 1, 0, true] call CBA_fnc_formatNumber;
		_bank = [floor(i4), 1, 0, true] call CBA_fnc_formatNumber;
        _weight = [] call RPM_Cfg_Inv_GetOwnWeight;
        _hunger = floor(i9);
        _health = floor(call RPM_Cfg_Inv_GetHealth);
		_id = getPlayerUID player;
        ((UltRP_display_ui select 0) displayCtrl 1) ctrlSetStructuredText parseText format["<t color='#1AE14F'>Cash:</t> <t color='#E2B31A'>$%1</t>  <t color='#1AE14F'>Bank:</t> <t color='#E2B31A'>$%6</t><br/> <t color='#1AE14F'>Weight:</t> <t color='#E2B31A'>%2KG</t>  <t color='#1AE14F'>Health:</t> <t color='#E2B31A'>%3/100</t><br/> <t color='#1AE14F'>Hunger:</t> <t color='#E2B31A'>%5/100</t>  <t color='#1AE14F'>ID: %4</t>", _money, _weight, _health, _id, _hunger, _bank];
        sleep .5;
    };
};