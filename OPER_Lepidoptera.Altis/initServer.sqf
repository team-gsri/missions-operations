//Création de l'environnement
_objArray = [
	["Land_RepairDepot_01_civ_F", [26739.963,24655.232,0.454], 41.766],
	["Land_CanisterPlastic_F", [26740.803,24649.947,0.433], 304.857],
	["Land_CanisterPlastic_F", [26741.4,24649.62,0.424], 0],
	["Land_FireExtinguisher_F", [26743.545,24656.598,0.548], 0],
	["Land_EngineCrane_01_F", [26739.787,24661.55,0.570], 311.793],
	["Land_WeldingTrolley_01_F", [26740,24662.514,0.606], 221.968],
	["Land_ToolTrolley_01_F", [26754.354,24668.545,0.770], 0],
	["Land_MultiMeter_F", [26754.512,24668.79,1.281], 0],
	["Land_File_F", [26754.277,24668.395,1.270], 217.314],
	["Land_DuctTape_F", [26754.23,24668.803,1.278], 0],
	["Land_Wrench_F", [24668.313,24668.313,1.627], 41.743],
	["Land_Screwdriver_V1_F", [26754.365,24668.295,1.624], 0],
	["Land_Screwdriver_V2_F", [26754.37,24668.44,1.624], 253.761],
	["Land_Pliers_F", [26754.2,24668.264,1.621], 308.320],
	["Land_CanisterOil_F", [26754.223,24668.764,1.627], 0],
	["Land_ToolTrolley_02_F", [26756.33,24669.248,0.775], 270.952],
	["Land_DrillAku_F", [26756.098,24669.24,1.738], 0],
	["Land_Grinder_F", [26756.588,24669.28,1.726], 0],
	["Land_CanisterFuel_F", [26758.365,24668.643,0.776], 309.207],
	["Land_MobileLandingPlatform_01_F", [26762.254,24657.967,0.653], 222.471],
	["C_Heli_Light_01_civil_F", [26760.35,24659.81,1.065], 132.066],
	["C_Offroad_01_repair_F", [26766.72,24653.684,0.567], 131],

	["Land_TableDesk_F", [26715.594,24599.146,0.552], 221.634],
	["Land_OfficeChair_01_F", [26714.994,24598.297,0.536], 215.465],
	["Land_PCSet_01_screen_F", [26715.68,24599.34,1.378], 35.875],
	["Land_PCSet_01_case_F", [26716.127,24598.68,1.369], 40.850],
	["Land_PCSet_01_keyboard_F", [26715.406,24599.04,1.372], 30.368],
	["Land_PCSet_01_mouse_F", [26715.795,24598.727,1.369], 0],
	["Land_WoodenBed_01_F", [26712.203,24603.66,0.755], 40],
	["Land_RattanTable_01_F", [26713.69,24603.307,0.681], 40],
	["Land_OfficeCabinet_02_F", [26711.688,24600.697,0.672], 130]
];

{
	_obj = createVehicle [_x select 0, _x select 1, [], 0, "CAN_COLLIDE"];
	_obj setDir (_x select 2);
	_obj enableSimulation false;

} forEach _objArray;

_planeArray = [
	["C_Plane_Civil_01_F", [26747.945,24651.146,0.543], 133.5],
	["C_Plane_Civil_01_racing_F", [26750.188,24667.186,0.768], 133.496],
	["C_Plane_Civil_01_F", [26761.348,24639.465,0.543], 87.597]
];

{
	_obj = createVehicle [_x select 0, _x select 1, [], 0, "CAN_COLLIDE"];
	_obj setDir (_x select 2);
	createVehicleCrew _obj;
	sleep 1.5;
	{_obj deleteVehicleCrew _x} forEach crew _obj;
	_obj engineOn false;
	_obj lock 2;
	
} forEach _planeArray;


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

_wallet = createVehicle ["Land_Wallet_01_F", [26713.693,24603.297,1.680], [], 0, "CAN_COLLIDE"];
_getWallet = {
	params ["_t", "_p", "_wallet"];
	deleteVehicle _wallet;
	hint "Vous avez pris le porte-feuilles.";
};

_walletAction = ["GetWallet", "Prendre le porte-feuilles", "", _getWallet, {true}, {}, _wallet] call ace_interact_menu_fnc_createAction;
[_wallet, 0, ["ACE_MainActions"], _walletAction] call ace_interact_menu_fnc_addActionToObject;


_phone = createVehicle ["Land_MobilePhone_smart_F", [26713.82,24603.154,1.680], [], 0, "CAN_COLLIDE"];
_getPhone = {
	params ["_t", "_p", "_phone"];
	deleteVehicle _phone;
	hint "Vous avez pris le téléphone.";
};

_phoneAction = ["GetPhone", "Prendre le téléphone", "", _getPhone, {true}, {}, _phone] call ace_interact_menu_fnc_createAction;
[_phone, 0, ["ACE_MainActions"], _phoneAction] call ace_interact_menu_fnc_addActionToObject;