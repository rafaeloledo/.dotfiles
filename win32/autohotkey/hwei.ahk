#HotIf WinActive("ahk_exe League of Legends.exe")
	; alt = q, ctrl = w, shift = e
	Tab::Alt	
	
	!q:: {
		Send "{q}{q}"
	}
	!w:: {
		Send "{w}{q}"
	}
	!e:: {
		Send "{e}{q}"
	}

	^q:: {
		Send "{q}{w}"
	}
	^w:: {
		Send "{w}{w}"
	}
	^e:: {
		Send "{e}{w}"
	}

	+q:: {
		Send "{q}{e}"
	}

	+w:: {
		Send "{w}{e}"
	}

	+e:: {
		Send "{e}{e}"
	}

#HotIf
