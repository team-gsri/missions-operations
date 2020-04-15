fnc_anim_watch1 = {
	params["_trg"];
	_trg switchMove "Acts_CrouchingIdleRifle01";
	while{true} do {
		sleep 3.9;
		_trg switchMove selectRandom ["Acts_CrouchingIdleRifle01", "Acts_CrouchingWatchingRifle01", "Acts_CrouchingFiringLeftRifle01"];
	};
};

fnc_prison = {
	params["_trg"];
	while{true} do {
		_trg switchMove selectRandom ["Acts_AidlPsitMstpSsurWnonDnon01", "Acts_AidlPsitMstpSsurWnonDnon02", "Acts_AidlPsitMstpSsurWnonDnon03", "Acts_AidlPsitMstpSsurWnonDnon04", "Acts_AidlPsitMstpSsurWnonDnon05"];
		sleep 20;
	};
};

{
	[_x] spawn fnc_anim_watch1;
} forEach [watch1, trap1];

{
	[_x] spawn fnc_prison;
} forEach [prison1, prison2];