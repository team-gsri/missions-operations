//by [-GSRI-] Syh

//Création des données de spawn des véhicules
_vhlArray = [
	"O_MRAP_02_F", "O_MRAP_02_hmg_F", "O_Truck_02_covered_F", "O_Truck_03_covered_F", "O_APC_Wheeled_02_rcws_v2_F"
];

_posArray = [
	[8238.533,9955.524,0], [8281.759,9982.665,0], [8287.564,10048.117,0], [8286.789,9999.777,0], [8196.304,9876.961,0]
];

_dirArray = [
	158, 264, 270, 270, 313
];

//Création d'un tableau de stockage des groupes
_grpArray = [];

//Création des groupes avec randomisation
for "_i" from 1 to (1 + floor random 5) do {
	_vhlType = selectRandom _vhlArray;
	_index = random 4;
	_vhl = _vhlType createVehicle (_posArray select _index);
	_vhl setDir (_dirArray select _index);
	_grp = createVehicleCrew _vhl;
	_grpArray pushBack _grp;
};

//Création de l'objectif et de son escorte
_units = [
	[8188,10081,0.5], [8188,10080,0.5]
];
_objGrp = selectRandom _grpArray;
_obj = _objGrp createUnit ["C_journalist_F", [8188.729,10081.058,0.5], [], 0, "NONE"];
_obj assignAsCargo vehicle ((units _objGrp) select 0);
_obj disableAI "PATH";
removeVest _obj;

{
	_unit = _objGrp createUnit ["O_Soldier_F", _x, [], 0, "NONE"];
	_unit assignAsCargo vehicle ((units _objGrp) select 0);
	_unit disableAI "PATH";
} forEach _units;
{
	_x setSpeedMode "LIMITED";
	_x setBehaviour "SAFE";
} forEach _grpArray;

//Échec de la mission 1 : Mort de l'objectif
_obj addEventHandler ["killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	hint format ["%1 a été tué par %2 avec %3", _unit, _instigator, _killer]
}];



//
//
//
//Création des waypoint et génération aléatoire du timing de départ
//!\ = scheduled !!!
_wp = {
	params ["_grpArray", "_objGroup"];
	sleep 1200;
	{
		_pos = [
			[7848.673, 3132.785,0], [7762.660,3163.310,0], [7818.689,3253.613,0], [7686.518,3296.284,0], [7751.48,3372.269,0]
		];
		sleep (60*_forEachIndex*(random 6)+180);
		if (_grpArray select _forEachIndex == _objGroup) then {
			{
				_x enableAI "PATH";
			} forEach units _objGroup;
			_objGroup setSpeedMode "LIMITED";
			_objGroup setBehaviour "SAFE";
			group _obj setFormation "DIAMOND";
			sleep 120;
			units _objGroup orderGetIn true;
			sleep 60;
		};
		_x addWaypoint [[7134.864,8969.125,0], 0];
		_x addWaypoint [[8282.095,3360.586,0], 0];
		_x addWaypoint [selectRandom _pos, 5];
		
	} forEach _grpArray;
	
};

[_grpArray, _objGrp] call _wp;