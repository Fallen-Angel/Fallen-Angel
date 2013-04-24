Events["IntelEvent_EliminateEnemy"] = {
	{
		{ "Universe_EnableSkip(1)", "" },
		HW2_LocationCardEvent("$40520", 4) -- WIELKIE PUSTKOWIA
	},
	{
		{ "Sound_SetMuteActor('Fleet')", "" }, -- wycisz g³osy floty
		{ "Sound_EnableAllSpeech(1)", "" }, -- w³¹cz dubbing
		{ "Sound_EnterIntelEvent()", "" }, -- dŸwiêk zdarzenia wywiadu
		HW2_Wait(1) -- zaczekaj
	},
	{
		{ "Camera_Interpolate('here', 'Camera_FocusOnBattle', 3)", "" }, -- interpoluj kamerê na obraz bitwy
		HW2_SubTitleEvent(Actor_FleetIntel, "Nasze statki handlowe zosta³y zaatakowane bez ostrze¿enia. 40530", 5) -- wywiad floty: Nasze statki handlowe zosta³y zaatakowane bez ostrze¿enia.
	},
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "Taiidañskie si³y w tym rejonie sk³adaj¹ siê z oddzia³u kilkunastu Fregat i 3 eskadr Bombowców. 40531", 5) -- wywiad floty: Taiidañskie si³y w tym rejonie sk³adaj¹ siê z oddzia³u kilkunastu Fregat i 3 eskadr Bombowców.
	},
	{
		HW2_SubTitleEvent(Actor_FleetCommand, "Transportowce s¹ w ciê¿kim stanie. Musimy pomóc za³ogom floty handlowej. 40532", 5) -- dowództwo floty: Transportowce s¹ w ciê¿kim stanie. Musimy pomóc za³ogom floty handlowej.
	},
	{
		HW2_SubTitleEvent(Actor_FleetCommand, "Natychmiast wyœlij Niszczyciele, by rozprawi³y siê z Fregatami wroga. 40533", 5) -- dowództwo floty: Natychmiast wyœlij Niszczyciele, by rozprawi³y siê z Fregatami wroga.
	}
};