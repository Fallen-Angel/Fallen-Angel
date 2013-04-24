Events["SpeechEvent_PlayerLoses"] = {
	{
		{
			"Sound_EnableAllSpeech(0)",
			""
		},
		{
			"Universe_AllowPlayerOrders( 0 )",
			""
		},
		HW2_Pause(1),
		HW2_Letterbox(1),
		HW2_Fade(1),
		HW2_Wait(2)
	},
	{
		HW2_LocationCardEvent("$40522", 4)
	},
	{
		{
			"Universe_AllowPlayerOrders( 1 )",
			""
		},
		{
			"Sound_EnableAllSpeech(1)",
			""
		},
		{
			"setMissionComplete( 0 )",
		""
		}
	}
};