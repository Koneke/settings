#SingleInstance force

Ctrl::
	if (A_PriorHotKey <> "ctrl" or A_TimeSincePriorHotkey > 300)
	{
		return
	}
	send !{Space}
return

shift::
	if (A_PriorHotKey <> "shift" or A_TimeSincePriorHotkey > 300)
	{
		return
	}
	send #{Space}
return

!q::!f4
