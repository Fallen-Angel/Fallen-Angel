dofilepath("data:scripts/SCAR/SCAR_Util.lua");

g_eventisdone = 1;
g_pointer_default = 0;
g_save_id = 0;
g_NISState = 0;


Events = {};

dofilepath("data:leveldata/campaign/ascension/m01_wasteland/events/SpeechEvent_PlayerLoses.lua"); -- SpeechEvent_PlayerLoses


function OnInit()
	print("oninit issued");

end