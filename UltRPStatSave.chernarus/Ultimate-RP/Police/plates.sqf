//Vehicle Plates By: Hunter - Oneshot.J
_type = _this select 0;
_type2 = typeOf _type;

hintSilent parseText format["<t valign='middle' underline='1' color='#ff0000'>VEHICLE-REGISTRATION</t><br/><br/><t valign='middle' color='#15c73b'>Plate Number: %2<br/>Type: %1",_type2,_type getVariable "Plate",_businfo];

