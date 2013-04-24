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

	Universe_EnableCmd(0, MUI_ScuttleCommand); -- wy³¹cz komendê wysadzenia jednostki
	SobGroup_AbilityActivate("Player_Ships0", AB_Scuttle, 0); -- wy³¹cz zdolnoœæ wysadzenia jednostki
	SobGroup_AbilityActivate("Player_Ships0", AB_Retire, 0); -- wy³¹cz zdolnoœæ wycofywania jednostki

	-- Sound_SpeechSubtitlePath("speech:missions/m_01/"); -- ³aduj mowê

	Player_SetPlayerName(0, "$40790"); -- ustaw nazwê gracza - Oddzia³ Czerwony Floty Obwodowej
	Player_SetPlayerName(1, "$40791"); -- ustaw nazwê CPU 1  - Hiigarañska Flota Handlowa
	Player_SetPlayerName(2, "$40792"); -- ustaw nazwê CPU 2  - Imperium Taiidañskie
	Player_SetPlayerName(3, "$40792"); -- ustaw nazwê CPU 3  - Imperium Taiidañskie

	SetAlliance(0, 1); -- ustaw sojusz
	SetAlliance(1, 0); -- ustaw sojusz

	Player_SetDefaultShipTactic(1, DefensiveTactics); -- domyœlna taktyka
	Player_SetDefaultShipTactic(2, AggressiveTactics); -- domyœlna taktyka

	-- CPU_Enable(1, 0); -- w³¹cz CPU 1
	CPU_Enable(2, 0); -- w³¹cz CPU 2
	-- CPU_Enable(3, 0); -- w³¹cz CPU 3

	FE_TaskbarIgnoreProfilePhase(1);

	g_NISState = NISGetPlayingHandle("nis/NIS01A"); -- pobierz uchwyt NIS
	NISDisableInterface(1); -- wy³¹cz interfejs podczas NIS

	Rule_Add("Rule_NIS01AComplete"); -- dodaj zasadê ukoñczenia NIS
	Rule_Remove("Rule_Init"); -- usuñ zasadê inicjalizacji
	Rule_Add("Rule_PlayerWins"); -- dodaj zasadê wygranej
	Rule_Add("Rule_PlayerLose"); -- dodaj zasadê przegranej

end


-- function PostNISInit()
	-- HW2_SetResearchLevel(1);

-- end


function Rule_NIS01AComplete()
	if (NISComplete(g_NISState) == 1) then -- jeœli NIS 1 ukoñczony
		print("NIS completed");
		g_NISState = 0; -- status NIS
		-- UI_UnBindKeyEvent(ESCKEY); -- od³¹cz klawisz
		Event_Start("IntelEvent_EliminateEnemy"); -- rozpocznij zdarzenie wywiadu
		Sound_MusicPlayType("data:sound/music/ambient/AMB_01", MUS_Ambient); -- muzyka
		-- PostNISInit(); -- wywo³aj funkcjê po NIS 1
		-- Rule_Add("Rule_OpeningIntelEventComplete"); -- dodaj zasadê po zdarzeniu wywiadu
		Rule_Remove("Rule_NIS01AComplete"); -- usuñ zasadê po NIS 1
	end


end


-- function Rule_OpeningIntelEventComplete()
	-- if (Event_IsDone("IntelEvent_EliminateEnemy") == 1) then -- jeœli zdarzenie wywiadu ukoñczone
		-- print("Event completed");
		-- UI_ClearEventScreen(); -- wyczyœæ ekran zdarzeñ
		-- Camera_SetLetterboxStateNoUI(0, 0); -- wy³¹cz LetterBox, w³¹cz UI
		Rule_Add("EliminateTaiidanForces"); -- dodaj zasadê eliminacji Taiidan
		-- Rule_Remove("Rule_OpeningIntelEventComplete"); -- usuñ zasadê ukoñczenia zdarzenia
		-- Rule_Add("Rule_PlaySaveGameLocationCard"); -- dodaj zasadê wyœwietlenia nazwy lokacji
		-- Rule_AddInterval("Rule_SaveTheGameMissionStart", 1); -- dodaj zasadê zapisania stanu gry
	-- end


-- end


function Rule_SaveTheGameMissionStart() -- zapis stanu gry na pocz¹tku misji
	Rule_Remove("Rule_SaveTheGameMissionStart");
	g_save_id = (g_save_id + 1);
	Campaign_QuickSaveNb(g_save_id, "$6400"); -- zapisz grê

end


function Rule_PlayerWins()


end


function Rule_PlayerLose()
	if (SobGroup_Empty("Tankers") == 1) then
		Event_Start("SpeechEvent_PlayerLoses");
		Rule_Remove("Rule_PlayerLose");
	end


end