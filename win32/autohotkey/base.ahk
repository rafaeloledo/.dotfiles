; ^: ctrl, !: alt, +: shift, #: super/windows
^+/::Send "{/}"
!/::Send "{?}"
!PgDn::Send "{End}"
+!PgDn::Send "+{End}"
!PgUp::Send "{Home}"
+!PgUp::Send "+{Home}"
CapsLock::LCtrl

!`::{
	SendEvent "{Alt down}{Esc down}{Esc up}{Alt up}"
}

#k:: {
	; switch kbds
	SendEvent "{LWin down}{Space down}{Space up}{LWin up}"
}

#=::{
	SendEvent "{Volume_Up}"
}

#-::{
	SendEvent "{Volume_Down}"
}

!R:: {
	; power toys run
	SendEvent "{Alt down}{Space down}{Space up}{Alt up}"
}

#c:: {
	RunWait "C:\dev\scoop\apps\scrcpy\current\scrcpy-noconsole.vbs --disable-screensaver --turn-screen-off"
}

#q:: {
	; kill process
	RunWait "wscript C:\dev\.dotfiles\win32\kill-process.vbs " WinGetPID("A")
}

#HotIf WinActive("ahk_exe explorer.exe")
	#q:: {
		SendEvent "{Ctrl down}{w down}{w up}{Ctrl down}"
	}
#HotIf

!e:: {
	; restart explorer
	RunWait "taskkill /F /IM explorer.exe"
	Run "explorer.exe"
}

#Enter:: {
	Run "C:\dev\scoop\apps\wezterm\current\wezterm-gui.exe"
}

#o:: {
	Run "C:\dev\scoop\apps\obsidian\current\Obsidian.exe"
}

#n:: {
	Run "C:\dev\scoop\apps\neovide\current\neovide.exe"
}

#b:: {
	Run "chrome.exe"
}

#p:: {
	Send "{PrintScreen}"
}

#m:: {
	Run "soundvolumeview.exe /Switch 2- Fifine Microphone"
}

#HotIf not (WinActive("ahk_exe League of Legends.exe") or
WinActive("ahk_exe LeagueClientUx.exe"))
	!h::SendEvent "{Left}"
	!j::SendEvent "{Down}"
	!k::SendEvent "{Up}"
	!l::SendEvent "{Right}"
#HotIf

#HotIf not WinActive("ahk_exe League of Legends.exe")
	#1::SendEvent "{LWin down}{LCtrl down}{Left down}{LWin up}{LCtrl up}{Left up}"
	#2::SendEvent "{LWin down}{LCtrl down}{Right down}{LWin up}{LCtrl up}{Right up}"
#HotIf

#HotIf WinActive("ahk_exe League of Legends.exe")
	!1::F1
	!2::F2
	!3::F3
	!4::F4
#HotIf

#HotIf WinActive("ahk_exe devenv.exe") or
WinActive("ahk_exe Code.exe")
	!+R::SendEvent "{F5}"
	!R::SendEvent "{Ctrl down}{F5}{Ctrl up}"
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

#HotIf WinActive("ahk_exe ELEMENTCLIENT.exe")
	!3:: {
		Loop {
			SendEvent "{F3}"
			Sleep 100
			if GetKeyState("Esc", "P")
				Break
		}
	}

	`:: {
		SendEvent "{Alt down}{Esc down}{Alt up}{Esc up}"
		Click "Right"
	}

	+LButton:: {
		Click "Left"
		Click "Left"
	}

	!D::{
		SendEvent "{l}{l}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{l}"
		Sleep 30
		SendEvent "{``}{``}{7}{8}{9}{``}"
	}

	!A::{
		SendEvent "{l}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{l}{l}"
		Sleep 30
		SendEvent "{``}{7}{8}{9}{``}{``}"
	}

	!I:: {
		Loop 10 {
			SendEvent "{Alt down}{Esc down}{Alt up}{Esc up}"
			Click "Right"
			Sleep 130
			SendEvent "{1}"
		}
	}

	!R:: {
		Loop 10 {
			SendEvent "{Alt down}{Esc down}{Alt up}{Esc up}"
			Click "Right"
			Sleep 130
			SendEvent "{F12}"
		}
	}

	!1:: {
		SendEvent "{F1}"
	}

	!2:: {
		SendEvent "{F2}"
	}

	!4:: {
		SendEvent "{F4}"
	}

	!C:: {
		SendEvent "{F12}"
	}
#HotIf

#HotIf WinActive("ahk_exe chrome.exe")
	!o:: {
		SendEvent "{Ctrl down}{l down}{l up}{Ctrl up}"
		SendEvent "{Ctrl down}{c down}{c up}{Ctrl up}"
		RepoURL := A_Clipboard
		RegExMatch(RepoURL, "/([^/]+)(?:\.git)?$", &repoName)
		RunWait "C:\dev\.dotfiles\win32\clone_repo.vbs " RepoURL
		RunWait "C:\dev\.dotfiles\win32\open_repo.vbs " "C:\dev\repos\github\" repoName[1] 
	}
#HotIf
