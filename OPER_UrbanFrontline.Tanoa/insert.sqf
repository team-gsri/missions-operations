[] spawn {
	_aller = parseSimpleArray preprocessFile "aller.sqf";
	_retour = parseSimpleArray preprocessFile "retour.sqf";
	[heli1, _aller, [heli1, "gsri_insert"]] spawn BIS_fnc_UnitPlay;
	waitUntil{ heli1 getVariable ["gsri_insert", false] };
	[heli1, _retour] spawn BIS_fnc_UnitPlay;
};

sleep 4;

[] spawn {
	_aller2 = parseSimpleArray preprocessFile "aller2.sqf";
	_retour2 = parseSimpleArray preprocessFile "retour2.sqf";
	[heli2, _aller2, [heli2, "gsri_insert"]] spawn BIS_fnc_UnitPlay;
	waitUntil{ heli2 getVariable ["gsri_insert", false] };
	[heli2, _retour2] spawn BIS_fnc_UnitPlay;
};