dofilepath("data:scripts/SCAR/SCAR_Util.lua");

g_eventisdone = 1;
g_pointer_default = 0;
g_save_id = 0;
g_NISState = 0;


Events = {};

dofilepath("data:leveldata/campaign/ascension/m01_wasteland/events/IntelEvent_EliminateEnemy.lua"); -- IntelEvent_EliminateEnemy
dofilepath("data:leveldata/campaign/ascension/m01_wasteland/events/SpeechEvent_PlayerLoses.lua"); -- SpeechEvent_PlayerLoses

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3);
	Rule_Remove("Rule_PlaySaveGameLocationCard");

end


function OnInit()
	print("oninit issued");
	Rule_Add("Rule_Init");

end


function Rule_Init()
	print("Initialized");
	Sound_SetMuteActor("All_");
	Sound_EnableAllSpeech(0);

	Universe_EnableCmd(0, MUI_ScuttleCommand); -- wy��cz komend� wysadzenia jednostki
	SobGroup_AbilityActivate("Player_Ships0", AB_Scuttle, 0); -- wy��cz zdolno�� wysadzenia jednostki
	SobGroup_AbilityActivate("Player_Ships0", AB_Retire, 0); -- wy��cz zdolno�� wycofywania jednostki

	-- Sound_SpeechSubtitlePath("speech:missions/m_01/"); -- �aduj mow�

	Player_SetPlayerName(0, "$40790"); -- ustaw nazw� gracza - Oddzia� Czerwony Floty Obwodowej
	Player_SetPlayerName(1, "$40791"); -- ustaw nazw� CPU 1  - Hiigara�ska Flota Handlowa
	Player_SetPlayerName(2, "$40792"); -- ustaw nazw� CPU 2  - Imperium Taiida�skie
	Player_SetPlayerName(3, "$40792"); -- ustaw nazw� CPU 3  - Imperium Taiida�skie

	SetAlliance(0, 1); -- ustaw sojusz
	SetAlliance(1, 0); -- ustaw sojusz

	Player_SetDefaultShipTactic(1, DefensiveTactics); -- domy�lna taktyka
	Player_SetDefaultShipTactic(2, AggressiveTactics); -- domy�lna taktyka

	-- CPU_Enable(1, 0); -- w��cz CPU 1
	CPU_Enable(2, 0); -- w��cz CPU 2
	-- CPU_Enable(3, 0); -- w��cz CPU 3

	FE_TaskbarIgnoreProfilePhase(1);

	g_NISState = NISGetPlayingHandle("nis/NIS01A"); -- pobierz uchwyt NIS
	NISDisableInterface(1); -- wy��cz interfejs podczas NIS

	Rule_Add("Rule_NIS01AComplete"); -- dodaj zasad� uko�czenia NIS
	Rule_Remove("Rule_Init"); -- usu� zasad� inicjalizacji
	Rule_Add("Rule_PlayerWins"); -- dodaj zasad� wygranej
	Rule_Add("Rule_PlayerLose"); -- dodaj zasad� przegranej

end


-- function PostNISInit()
	-- HW2_SetResearchLevel(1);

-- end


function Rule_NIS01AComplete()
	if (NISComplete(g_NISState) == 1) then -- je�li NIS 1 uko�czony
		print("NIS completed");
		g_NISState = 0; -- status NIS
		-- UI_UnBindKeyEvent(ESCKEY); -- od��cz klawisz
		Event_Start("IntelEvent_EliminateEnemy"); -- rozpocznij zdarzenie wywiadu
		Sound_MusicPlayType("data:sound/music/ambient/AMB_01", MUS_Ambient); -- muzyka
		-- PostNISInit(); -- wywo�aj funkcj� po NIS 1
		-- Rule_Add("Rule_OpeningIntelEventComplete"); -- dodaj zasad� po zdarzeniu wywiadu
		Rule_Remove("Rule_NIS01AComplete"); -- usu� zasad� po NIS 1
	end


end


-- function Rule_OpeningIntelEventComplete()
	-- if (Event_IsDone("IntelEvent_EliminateEnemy") == 1) then -- je�li zdarzenie wywiadu uko�czone
		-- print("Event completed");
		-- UI_ClearEventScreen(); -- wyczy�� ekran zdarze�
		-- Camera_SetLetterboxStateNoUI(0, 0); -- wy��cz LetterBox, w��cz UI
		Rule_Add("EliminateTaiidanForces"); -- dodaj zasad� eliminacji Taiidan
		-- Rule_Remove("Rule_OpeningIntelEventComplete"); -- usu� zasad� uko�czenia zdarzenia
		-- Rule_Add("Rule_PlaySaveGameLocationCard"); -- dodaj zasad� wy�wietlenia nazwy lokacji
		-- Rule_AddInterval("Rule_SaveTheGameMissionStart", 1); -- dodaj zasad� zapisania stanu gry
	-- end


-- end


function Rule_SaveTheGameMissionStart() -- zapis stanu gry na pocz�tku misji
	Rule_Remove("Rule_SaveTheGameMissionStart");
	g_save_id = (g_save_id + 1);
	Campaign_QuickSaveNb(g_save_id, "$6400"); -- zapisz gr�

end


function Rule_PlayerWins()


end


function Rule_PlayerLose()
	if (SobGroup_Empty("Tankers") == 1) then
		Event_Start("SpeechEvent_PlayerLoses");
		Rule_Remove("Rule_PlayerLose");
	end


end