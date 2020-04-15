//Création de l'avion de livraison
_TopRDV = {
	_plane = createVehicle ["I_C_Plane_Civil_01_F", [21075.39,7083.444,0], [], 0, "NONE"];
	_plane setDir 13;
	createVehicleCrew _plane;
};

_VIPgrp = createGroup [civilian, false];
_VIP = _VIPgrp createUnit ["C_Man_UtilityWorker_01_F", [26716,24602,0.595], [], 0, "NONE"];
_VIP setDir 157;
_VIP disableAI "PATH";

comment "Remove existing items";
removeAllWeapons _VIP;
removeAllItems _VIP;
removeAllAssignedItems _VIP;
removeUniform _VIP;
removeVest _VIP;
removeBackpack _VIP;
removeHeadgear _VIP;
removeGoggles _VIP;
comment "Add containers";
_VIP forceAddUniform "U_C_ConstructionCoverall_Blue_F";
_VIP addBackpack "B_LegStrapBag_black_repair_F";
comment "Add items to containers";
_VIP addItemToBackpack "ToolKit";
comment "Set identity";
[_VIP,"WhiteHead_06",""] call BIS_fnc_setIdentity;

_planeStart = {
	_plane = createVehicle ["I_C_Plane_Civil_01_F", [21076,7095,0], [], 0, "NONE"];
	createVehicleCrew _plane;
	(group driver _plane) addWaypoint [[30000,10000], 0];
	(group driver _plane) addWaypoint [[30000,20000], 0];
};

_planeSpawn = ["planeSpawn", "creation et départ de l'avion", "", _planeStart, {true}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _planeSpawn] call ace_interact_menu_fnc_addActionToZeus;

_attackOPFOR = {
	_OPFORposArray = [
		[23196,19941,0], [23173,19959,0], [23150,19978,0], [23135,19995,0], [23125,20007,0], [23116,20025,0]
	];

	_OPFORarray = [
		["I_C_Soldier_Bandit_6_F", "I_C_Soldier_Bandit_8_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Bandit_2_F"],
		["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Bandit_5_F"],
		["I_C_Soldier_Bandit_6_F", "I_C_Soldier_Bandit_8_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Bandit_2_F"],
		["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Bandit_5_F"],
		["I_C_Soldier_Bandit_6_F", "I_C_Soldier_Bandit_8_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Bandit_2_F"],
		["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Bandit_5_F"]
	];

	{
		_vhl = "O_G_Offroad_01_F" createVehicle (_OPFORposArray select _forEachIndex);
		_grp = createGroup [independent, true];
		_unitArray = [];
		_OPFORgrp = createGroup [east, true];
		
		{
			_unit = _grp createUnit [_x, getPos _vhl, [], 0, "NONE"];
			_unit moveInAny _vhl;
			_unitArray pushBack _unit;
		} forEach _x;

		_unitArray joinSilent _OPFORgrp;
		_OPFORgrp addWaypoint [[26731,24565],0];

	} forEach _OPFORarray;
};

_OPFORSpawn = ["OPFORSpawn", "creation et départ de l'attaque OPFOR", "", _attackOPFOR, {true}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _OPFORSpawn] call ace_interact_menu_fnc_addActionToZeus;

_attackBLUFOR = {
	_vhlArray = [
	["B_GEN_Offroad_01_covered_F", [13790,16150,0]],
	["B_GEN_Van_02_transport_F", [13757,16160,0]],
	["B_GEN_Van_02_vehicle_F", [13737,16139,0]],
	["B_GEN_Offroad_01_comms_F", [13730,16103]]
	];

	{
		_vhl = (_x select 0) createVehicle (_x select 1);
		_grp = createGroup [west, true];
		if (_forEachIndex == 0) then {
			_grp createUnit ["B_GEN_Commander_F", _x select 1, [], 0, "NONE"];
			for "_i" from 1 to 5 do {
				_grp createUnit ["B_GEN_Soldier_F", _x select 1, [], 0, "NONE"];
				_BLUUnitArray pushBack _unit;
			};
			{	
				_x moveInAny _vhl;
				
			} forEach units _grp;
			_grp addWaypoint [[26794,24508],0];
		};

		if (_forEachIndex == 1) then {
			_vhl setDir 90;
			_grp createUnit ["B_GEN_Commander_F", _x select 1, [], 0, "NONE"];
			for "_i" from 1 to 7 do {
				_grp createUnit ["B_GEN_Soldier_F", _x select 1, [], 0, "NONE"];
			};
			{
				_x moveInAny _vhl;
				
			} forEach units _grp;
			_grp addWaypoint [[26794,24508],0];
		};

		if (_forEachIndex == 2) then {
			_vhl setDir 90;
			for "_i" from 1 to 2 do {
				_grp createUnit ["B_GEN_Soldier_F", _x select 1, [], 0, "NONE"];
			};
		{
				_x moveInAny _vhl;
				
			} forEach units _grp;
			_grp addWaypoint [[26794,24508],0];
		};

		if (_forEachIndex == 3) then {
			_grp createUnit ["B_GEN_Commander_F", _x select 1, [], 0, "NONE"];
			for "_i" from 1 to 4 do {
				_grp createUnit ["B_GEN_Soldier_F", _x select 1, [], 0, "NONE"];
			};
			{
				_x moveInAny _vhl;
				
			} forEach units _grp;
			_grp addWaypoint [[26794,24508],0];
		};

	} forEach _vhlArray;

	_vhl = "QIN_Titus_arx20_DES" createVehicle [13714,16124,0];
	_vhl setDir 110;
	_grp = createVehicleCrew _vhl;
	_grp addWaypoint [[26794,24508], 0];

	_animArray = [
		"comp_police",
		"comp_police_stripes",
		"police_lights_l",
		"police_lights_r"
	];

	{
		_vhl animate [_x, 1];
		
	} forEach _animArray;

	_textureArray = [
		"qin_titus\data\skins\black\karoserie1_black.paa",
		"qin_titus\data\skins\black\karoserie2_black.paa",
		"qin_titus\data\skins\black\karoserie3_black.paa",
		"qin_titus\data\skins\black\arx20_black.paa",
		"qin_titus\data\skins\black\interier1_black.paa",
		"qin_titus\data\skins\black\interier2_black.paa",
		"qin_titus\data\camonet_black_co.paa",
		"qin_titus\data\gps\altis.paa",
		"#(argb,8,8,3)color(0.86,0.14,0.02,0.35,ca)",
		"qin_titus\data\police_logo.paa"
	];

	{
		_vhl setObjectTexture [_forEachIndex, _x];
		
	} forEach _textureArray;
};

_BLUFORSpawn = ["BLUFORSpawn", "creation et départ de l'attaque de la gendarmerie", "", _attackBLUFOR, {true}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _BLUFORSpawn] call ace_interact_menu_fnc_addActionToZeus;


_vhlArray = [
	["I_C_Van_02_vehicle_F", [26763,24617,0], 180],
	["C_Van_01_box_F", [26787.184,24635,0], 64],
	["C_Offroad_F", [26785,24648,0], 216]
];

{
	_vhl = (_x select 0) createVehicle (_x select 1);
	_vhl setDir (_x select 2);
	
} forEach _vhlArray;

_unitArray = [
	["I_C_Soldier_Bandit_8_F", [26732.5,24595,0], 167],
	["I_C_Soldier_Bandit_1_F", [26734,24595,0], 228],
	["I_C_Soldier_Bandit_7_F", [26760.7,24623.2,0], 207.7],
	["I_C_Soldier_Bandit_1_F", [26764.4,24621.2,0], 153],
	["I_C_Soldier_Bandit_7_F", [26765.637,24634.35,0.185], 108],
	["I_C_Soldier_Bandit_5_F", [26773.9,24645.4,0.348], 122.4],
	["I_C_Soldier_Bandit_6_F", [26774.8,24648.27,0.357], 148],
	["I_C_Soldier_Bandit_8_F", [26786.2,24629.6,0], 118.1],
	["I_C_Soldier_Bandit_4_F", [26786.5,24637.6,0], 130.6],
	["I_C_Soldier_Bandit_2_F", [26786,24645.1,0], 147.6],
	["I_C_Soldier_Bandit_5_F", [26728.1,24657.7,0], 284.5],
	["I_C_Soldier_Bandit_6_F", [26746.5,24680,0], 0]
];

{
	_grp = createGroup [independent, true];
	_unit = _grp createUnit [_x select 0, _x select 1, [], 0, "NONE"];
	_unit setDir (_x select 2);
	
} forEach _unitArray;

_unitArray = [
	"I_C_Soldier_Bandit_6_F",
	"I_C_Soldier_Bandit_7_F",
	"I_C_Soldier_Bandit_2_F",
	"I_C_Soldier_Bandit_1_F"
];

_grp = createGroup [independent, true];
{
	_grp createUnit [_x, [26760,24594,0], [], 0, "NONE"];
	
} forEach _unitArray;
_grp setFormation "FILE";
_grp setBehaviour "SAFE";

_grp addWaypoint [[26860,24488,0], 0];
_grp addWaypoint [[27234,24929,0], 0];
_grp addWaypoint [[27136,25035,0], 0];
_grp addWaypoint [[26739,24743,0], 0];
_grp addWaypoint [[26631,24647,0], 0];
_grp addWaypoint [[26743,24554,0], 0];
_wp = _grp addWaypoint [[26760,24537,0], 0];
_wp setWaypointType "CYCLE";
