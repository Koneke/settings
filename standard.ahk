#SingleInstance

+[::Send, [
+]::Send, ]
[::{
]::}

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
!x::Send, {Escape}

!d::Send, ^{Delete}
!+d::Send, ^{Backspace}
; ^d::Send, {Backspace}
^+d::Send, {Delete}

; Convenience shit
^!r::Reload
^!t::Suspend



; ahk scripting test stuff

; ahahah how banger aint this??
^!q::
FileEncoding, UTF-8
FileRead, FileContents, C:/Users/Lukas.Hagman/.misc/tasks
ToolTip, %FileContents%, 9920, 540
return
^!x::ToolTip

Mode := "Normal"

^!s::MsgBox % "Hello World? " . Mode
^!n::Mode := "Normal"
^!i::Mode := "Insert"

; make this modal?
; <!a::Send, å
; >!a::Send, Å
; <!e::Send, ä
; >!e::Send, Ä
; <!o::Send, ö
; >!o::Send, Ö
