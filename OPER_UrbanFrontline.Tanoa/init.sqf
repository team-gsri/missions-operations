if!(vehicleVarName player in ["zeus1", "zeus2"]) then {
	cutText ["","BLACK FADED"];
	sleep 2;
	["USS Freedom, Pacifique sud", "H-10mn"] spawn BIS_fnc_infoText;
	sleep 5;
	cutText ["","BLACK IN"];

	waitUntil{!alive arsenal};
	enableEnvironment false;

	cutText ["","BLACK FADED"];
	sleep 2;
	["Tanoa, Pacifique sud", "LZ -1mn"] spawn BIS_fnc_infoText;
	sleep 5;
	cutText ["","BLACK IN"];
};