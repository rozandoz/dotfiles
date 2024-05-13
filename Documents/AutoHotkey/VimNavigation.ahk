GroupAdd AltTabWindow, ahk_class MultitaskingViewFrame  ; Windows 10
GroupAdd AltTabWindow, ahk_class TaskSwitcherWnd  ; Windows Vista, 7, 8.1
GroupAdd AltTabWindow, ahk_class #32771  ; Older, or with classic alt-tab enabled

#IfWinExist ahk_group AltTabWindow
h::Left
l::Right
k::Up
j::Down
#IfWinExist

#IfWinNotExist ahk_group AltTabWindow
!h::Send {Left}
!j::Send {Down}
!k::Send {Up}
!l::Send {Right}
#IfWinNotExist

!^u::Send {PgUp}
!^d::Send {PgDn}

!u::Send ^z
!^r::Send ^y

!y::Send ^c
!p::Send ^v

![::Send ^{Left}
!]::Send ^{Right}

