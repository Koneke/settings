#SingleInstance

Mode := "Normal"

SetMode(m)
{
	global Mode
	Mode := m
	ToolTip, %Mode%, 9999, 1080, 2
}

NextMode(m)
{
	; I'd prefer doing this with an array or something, but...
	If IsLabel("Case-" . m)
	Loop 1
	{
		Goto Case-%m%
	Case-Normal:
		SetMode("Insert")
		break
	Case-Insert:
		SetMode("Passthrough")
		break
	Case-Passthrough:
		SetMode("Normal")
		break
	}
}

SetMode("Normal")

^!p::SetMode("Passthrough")
^!n::SetMode("Normal")
^!i::SetMode("Insert")

; ahahah how banger aint this??
^!q::
FileEncoding, UTF-8
FileRead, FileContents, C:/Users/Lukas.Hagman/.misc/tasks
ToolTip, %FileContents%, 9920, 540, 1
return
^!x::ToolTip,,,,1

; === === === === === ;

#If Mode = "Normal"
	+[::Send, [
	+]::Send, ]
	[::{
	]::}

	!x::Send, {Escape}
	^g::Send, {Escape}
	^k::Send, +{End}{Delete}

	!h::Send, !{Left}
	!l::Send, !{Right}

	^+l::Send, {F6}

	!^h::Send, {Left}
	!^l::Send, {Right}
	!^j::Send, {Down}
	!^k::Send, {Up}

	^!e::Send, {Enter}
	^m::Send, {Enter}

	^p::Send, {Up}
	^n::Send, {Down}
	^e::Send, {End}
	^a::Send, {Home}
	!e::Send, ^{Right}
	!a::Send, ^{Left}

	!d::Send, ^{Delete}
	!+d::Send, ^{Backspace}
	^d::Send, {Backspace}
	^+d::Send, {Delete}
#If

#If Mode = "Insert"
	<!a::Send, å
	>!a::Send, Å
	<!e::Send, ä
	>!e::Send, Ä
	<!o::Send, ö
	>!o::Send, Ö
#If

; Convenience shit
^!r::Reload
^!t::Suspend
