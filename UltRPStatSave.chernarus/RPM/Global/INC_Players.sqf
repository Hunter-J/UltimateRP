// This source is licensed under the 3-clause BSD license (See README)
// (c) 2012 ARMA-RP Project
// http://www.arma-rp.com/

private ["_i"];
RPM_Role = player;
RPM_POBJArrCiv = [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, civ21, civ22, civ23, civ24, civ25, civ26, civ27, civ28, civ29, civ30, civ31, civ32, civ33, civ34, civ35, civ36, civ37, civ38, civ39, civ40];
RPM_POBJArrCop = [cop1, cop2, cop3, cop4, cop5, cop6, cop7, cop8, cop9, cop10, cop11, cop12, cop13, cop14, cop15, cop16, cop17, cop18, cop19, cop20];
RPM_POBJArr = [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, civ21, civ22, civ23, civ24, civ25, civ26, civ27, civ28, civ29, civ30, civ31, civ32, civ33, civ34, civ35, civ36, civ37, civ38, civ39, civ40, cop1, cop2, cop3, cop4, cop5, cop6, cop7, cop8, cop9, cop10, cop11, cop12, cop13, cop14, cop15, cop16, cop17, cop18, cop19, cop20];
RPM_PSTRArr = ["Civ 1", "Civ 2", "Civ 3", "Civ 4", "Civ 5", "Civ 6", "Civ 7", "Civ 8", "Civ 9", "Civ 10", "Civ 11", "Civ 12", "Civ 13", "Civ 14", "Civ 15", "Civ 16", "Civ 17", "Civ 18", "Civ 19", "Civ 20", "Civ 21", "Civ 22", "Civ 23", "Civ 24", "Civ 25", "Civ 26", "Civ 27", "Civ 28", "Civ 29", "Civ 30", "Civ 31", "Civ 32", "Civ 33", "Civ 34", "Civ 35", "Civ 36", "Civ 37", "Civ 38", "Civ 39", "Civ 40", "Cop 1", "Cop 2", "Cop 3", "Cop 4", "Cop 5", "Cop 6", "Cop 7", "Cop 8", "Cop 9", "Cop 10", "Cop 11", "Cop 12", "Cop 13", "Cop 14", "Cop 15", "Cop 16", "Cop 17", "Cop 18", "Cop 19", "Cop 20"];
FF_Arr = [civ36, civ37, civ38, civ39, civ40];
K9Dog_Arr = [k9dog1, k9dog2];

RPM_Civ = false;
RPM_Cop = false;
RPM_FF = false;
RPM_K9Dog = false;

for [{_i = 0},{_i < (count RPM_POBJArrCop)},{_i = _i + 1}] do {
    if (!(isNull(RPM_POBJArrCop select _i))) then {
        if ((RPM_POBJArrCop select _i) == RPM_Role) then {
            RPM_RoleNumber = (_i + 1);
            RPM_Cop = true;
            RPM_RoleCop = 1;
            RPM_SideNumber = _i + 1;
            RPM_LongRoleNumber = 1100 + RPM_SideNumber;
            RPM_RoleString = format["Cop %1", RPM_SideNumber];
			if (RPM_Role in K9Dog_Arr) then
			{
				RPM_K9Dog = true;
			};
        };
    };
};
for [{_i = 0},{_i < (count RPM_POBJArrCiv)},{_i = _i + 1}] do {
    if (!(isNull(RPM_POBJArrCiv select _i))) then {
        if ((RPM_POBJArrCiv select _i) == RPM_Role) then {
            RPM_RoleNumber = (_i + 1);
            RPM_Civ = true;
            RPM_RoleCop = 0;
            RPM_SideNumber = RPM_RoleNumber;
            RPM_LongRoleNumber = 1000 + RPM_SideNumber;
            RPM_RoleString = format["Civ %1", RPM_SideNumber];
			if (RPM_Role in FF_Arr) then
			{
				RPM_FF = true;
			};
        };
    };
};

b45 = true;
