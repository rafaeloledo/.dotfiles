; ^: ctrl, !: alt, +: shift
^+/::Send "{/}"
!/::Send "{?}"
!PgDn::Send "{End}"
+!PgDn::Send "+{End}"
!PgUp::Send "{Home}"
+!PgUp::Send "+{Home}"
; CapsLock::LCtrl
!q::!F4

#HotIf not (WinActive("ahk_exe League of Legends.exe") or
WinActive("ahk_exe LeagueClientUx.exe"))
	!h::SendEvent "{Left}"
	!j::SendEvent "{Down}"
	!k::SendEvent "{Up}"
	!l::SendEvent "{Right}"
#HotIf

#HotIf not (WinActive("ahk_exe WindowsTerminal.exe") or 
WinActive("ahk_exe firefox.exe") or
WinActive("ahk_exe msedge.exe") or
WinActive("ahk_exe chrome.exe") or
WinActive("ahk_exe League of Legends.exe") or 
WinActive("ahk_exe LeagueClientUx.exe") or
WinActive("ahk_exe Obsidian.exe"))
	^d::Send "{PgDn}"
	^u::Send "{PgUp}"
	^w::^Backspace
	^p::SendEvent "{Up down}{Up up}"
	^n::SendEvent "{Down down}{Down up}"
#HotIf

#HotIf not (WinActive("ahk_exe League of Legends.exe") or
WinActive("ahk_exe WindowsTerminal.exe"))
	!1::SendEvent "{LWin down}{LCtrl down}{Left down}{LWin up}{LCtrl up}{Left up}"
	!2::SendEvent "{LWin down}{LCtrl down}{Right down}{LWin up}{LCtrl up}{Right up}"
#HotIf

#HotIf WinActive("ahk_exe League of Legends.exe")
	!1::F2
	!2::F3
	!3::F4
	!4::F5
#HotIf

#HotIf WinActive("ahk_exe devenv.exe") or
WinActive("ahk_exe Code.exe")
	#!5::F5
	!5::^F5
#HotIf

#HotIf WinActive("ahk_exe chrome.exe") or
WinActive("ahk_exe firefox.exe") or
WinActive("ahk_exe msedge.exe") or
WinActive("ahk_exe brave.exe")
	^w::^Backspace
	^q::^w
	;^p::SendEvent "{Up down}{Up up}"
	;^n::SendEvent "{Down down}{Down up}"
  ^d::PgDn
  ^u::PgUp
#HotIf

#HotIf WinActive("ahk_exe msedge.exe")
  ^p::^p
#HotIf
