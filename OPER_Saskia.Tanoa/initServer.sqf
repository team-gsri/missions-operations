// Civil paniqué
while{!(panique getVariable ["ace_captives_isHandcuffed", false])} do {
	panique playMove (format ["Acts_CivilHiding_%1", (floor random 2)]);
	sleep 9.5; 
};