
params ["_object"];

[
_object,
/* 1 action title */			"Couper le cable",
/* 2 idle icon */			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",
/* 3 progress icon */			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",
/* 4 condition to show */		"true",
/* 5 condition for action */		"true",
/* 6 code executed on start */		{hint "Découpage du cable en cours !"},
/* 7 code executed per tick */		{},
/* 8 code executed on completion */	{hint format["%1 a coupé le cable de la tour radio!", name (_this select 1)];},
/* 9 code executed on interruption */	{hint "Action interrompue !"; player globalchat "Cable coupé"},
/* 10 arguments */			[],
/* 11 action duration */		3,
/* 12 priority */			0,
/* 13 remove on completion */		true,
/* 14 show unconscious */		false
] call bis_fnc_holdActionAdd;