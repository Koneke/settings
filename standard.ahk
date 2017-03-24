#SingleInstance

Mode := "Normal"
TerminalMode := "Normal"

SetMode(m)
{
	global Mode

	Mode := m
	ToolTip, %Mode%, 9999, 1080, 2
	TerminalMode = "Normal"
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
^!t::
	SetMode("Terminal")
	TerminalMode := "Normal"
	return

; ahahah how banger aint this??
^!q::
	FileEncoding, UTF-8
	FileRead, FileContents, C:/Users/Lukas.Hagman/.misc/tasks
	ToolTip, %FileContents%, 9920, 540, 1
	return
^!x::ToolTip,,,,1

; === === === === === ;

; Globals, ish
#If Mode = "Normal"
 || Mode = "Terminal"
	+[::Send, [
	+]::Send, ]
	[::{
	]::}

	!h::Send, !{Left}
	!l::Send, !{Right}
#If

#If Mode = "Normal"
	!x::Send, {Escape}
	^g::Send, {Escape}
	^k::Send, +{End}{Delete}

	^/::Send, ^z

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

	; need to define these with left alt,
	; or the hotkeys for swedish letters get in the way.
	; (somehow)
	<!e::Send, ^{Right}
	<!a::Send, {Ctrl down}{Left}{Ctrl up}

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

#If Mode = "Terminal"
	^m::
	Enter::
		Send, {Enter}
		TerminalMode := "Normal"
		return

	^g::
	Escape::
		Send, ^a^k
		TerminalMode := "Normal"
		return

	#If Mode = "Terminal" && TerminalMode = "Normal"
		u::Send, cd ..{Enter}

		f::
			Send, find . -iname ''{Left}
			TerminalMode = "Insert"
			return
		l::
			Send, ls{Space}
			TerminalMode = "Insert"
			return
		c::
			Send, cd{Space}
			TerminalMode = "Insert"
			return
		v::
			Send, vim{Space}
			TerminalMode = "Insert"
			return
		r::
			Send, rm{Space}
			TerminalMode = "Insert"
			return
		m::
			Send, mv{Space}
			TerminalMode = "Insert"
			return
		p::
			Send, cp{Space}
			TerminalMode = "Insert"
			return
#If

; Convenience shit
^!r::Reload
^!s::Suspend
