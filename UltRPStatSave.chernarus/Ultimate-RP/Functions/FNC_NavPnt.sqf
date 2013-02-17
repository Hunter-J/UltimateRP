fnc_NavTask = {

private ["_grpLog","_unit","_pos","_curTsk","_navTsk","_HQctrlog"];

_unit = _this select 0;           
_pos = _this select 1;
_curTsk = currentTask _unit;

if ({side _x == sideLogic} count (allMissionObjects 'Logic') == 0) then 
 {
    _HQctrLog = createCenter sideLogic;
 };

if (isNil "navTaskLogic1") then 
  {
    _grpLog = createGroup sideLogic;
    navTaskLogic1 = (_grpLog) createunit ["Logic",[0,0,0],[],0,"NONE"];
  };

navTaskLogic1 setPos _pos;

_navTsk = _unit createSimpleTask ["Move"];
_navTsk setSimpleTaskDescription ["Move to HUD marker", "Navigation Task", "Move"];
_navTsk setSimpleTaskTarget [navTaskLogic1, true];
_unit setCurrentTask _navTsk;
_navTsk setTaskState "Assigned";

waitUntil {_unit distance navTaskLogic1 <= 10};
  _unit removeSimpleTask _navTsk;

    if (!(isNil "_curTsk")) then 
   {
    _unit setCurrentTask _curTsk;
   };
};