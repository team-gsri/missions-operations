// Configuration des batiments
{
	_dam = if(typeOf _x in ["Land_Addon_05_F", "Land_Shop_Town_03_F", "Land_Shop_City_07_F"]) then {0} else {1};
	_x setDamage [_dam, false];
} forEach (nearestTerrainObjects [epicentre, ["BUILDING","HOUSE"], 300, false, true]);

// Démarrage ambiant manager
[] execVM "animLoops.sqf";

{ _x setVariable ["unit_target", trg] } forEach [s11, s12, s13];
{ _x setVariable ["unit_target", trg2] } forEach [s21, s22, s23];
{ _x setVariable ["unit_target", trg3] } forEach [s31, s32, s33];
{ _x setVariable ["unit_target", trg4] } forEach [s41, s42, s43];

[] spawn {
	_boom = ["Bo_Mk82","Bo_Mk82_MI08","R_TBG32V_F","M_Titan_AP","Bomb_04_F","Rocket_04_HE_F","Rocket_04_AP_F","Bomb_03_F","Rocket_03_HE_F","Rocket_03_AP_F"];
	while {true} do {
		{
			if!(_x isKindOf "Man") then {
				if(random 1 > 0.993) then { (selectRandom _boom) createVehicle getPos _x };
			} else {
				if(random 1 > 0.93) then {
					_x doTarget (_x getVariable "unit_target");
					_x addMagazine (primaryWeaponMagazine _x select 0);
					_x suppressFor 2;
					sleep random 5;
				};
			};
		} forEach synchronizedObjects ambiantManager;
	};
};

// Attente de démarrage mission
waitUntil{!alive starter};
{ _x engineOn true } forEach [heli1, heli2];
waitUntil{!alive arsenal};

// Go
[] execVM "insert.sqf";