Events["IntelEvent_EliminateEnemy"] = {
	{
		{ "Universe_EnableSkip(1)", "" },
		HW2_LocationCardEvent("$40520", 4) -- WIELKIE PUSTKOWIA
	},
	{
		{ "Sound_SetMuteActor('Fleet')", "" }, -- wycisz g�osy floty
		{ "Sound_EnableAllSpeech(1)", "" }, -- w��cz dubbing
		{ "Sound_EnterIntelEvent()", "" }, -- d�wi�k zdarzenia wywiadu
		HW2_Wait(1) -- zaczekaj
	},
	{
		{ "Camera_Interpolate('here', 'Camera_FocusOnBattle', 3)", "" }, -- interpoluj kamer� na obraz bitwy
		HW2_SubTitleEvent(Actor_FleetIntel, "Nasze statki handlowe zosta�y zaatakowane bez ostrze�enia. 40530", 5) -- wywiad floty: Nasze statki handlowe zosta�y zaatakowane bez ostrze�enia.
	},
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "Taiida�skie si�y w tym rejonie sk�adaj� si� z oddzia�u kilkunastu Fregat i 3 eskadr Bombowc�w. 40531", 5) -- wywiad floty: Taiida�skie si�y w tym rejonie sk�adaj� si� z oddzia�u kilkunastu Fregat i 3 eskadr Bombowc�w.
	},
	{
		HW2_SubTitleEvent(Actor_FleetCommand, "Transportowce s� w ci�kim stanie. Musimy pom�c za�ogom floty handlowej. 40532", 5) -- dow�dztwo floty: Transportowce s� w ci�kim stanie. Musimy pom�c za�ogom floty handlowej.
	},
	{
		HW2_SubTitleEvent(Actor_FleetCommand, "Natychmiast wy�lij Niszczyciele, by rozprawi�y si� z Fregatami wroga. 40533", 5) -- dow�dztwo floty: Natychmiast wy�lij Niszczyciele, by rozprawi�y si� z Fregatami wroga.
	}
};