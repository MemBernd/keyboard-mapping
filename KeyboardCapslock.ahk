#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Autohotkey Capslock Remapping Script
; Danik
; More info at http://danikgames.com/blog/?p=714
; danikgames.com
;
; Functionality:
; - Deactivates capslock for normal (accidental) use.
; - Hold Capslock and drag anywhere in a window to move it (not just the title bar).
; - Access the following functions when pressing Capslock:
;     Cursor keys           - J, K, L, I
;     Enter                 - Space
;     Home, PgDn, PgUp, End - U, O, Y, H
;     Backspace and Del     - N, M
;
;     Insert                - B
;     Select all            - A
;     Cut, copy, paste      - S, D, F
;     Close tab, window     - W, E
;     Esc                   - R
;     Next, previous tab    - Tab, Q
;     Undo, redo            - , and .
;
; To use capslock as you normally would, you can press WinKey + Capslock


; This script is mostly assembled from modified versions of the following awesome scripts:
;
; # Home Row Computing by Gustavo Duarte: http://duartes.org/gustavo/blog/post/home-row-computing for
; Changes:
; - Does not need register remapping of AppsKey using SharpKeys.
; - Uses normal cursor key layout
; - Added more hotkeys for insert, undo, redo etc.
;
; # Get the Linux Alt+Window Drag Functionality in Windows: http://www.howtogeek.com/howto/windows-vista/get-the-linux-altwindow-drag-functionality-in-windows/
; Changes: The only change was using Capslock instead of Alt. This
; also removes problems in certain applications.




#Persistent
SetCapsLockState, AlwaysOff

;volume and stuff
;Capslock & x::SendInput {Blind}{Volume_Mute}
;Capslock & c::SendInput {Blind}{Volume_Down}
;Capslock & v::SendInput {Blind}{Volume_Up}
;Capslock & f::WinMaximize, A
;Capslock & s::SendInput {Blind}{WinMinimize}

;change apps key to control for surface
;Appskey::SendInput {Blind}{RControl Down} <- This doesn't work, appskey gets stuck
Appskey::
    SetKeyDelay -1
    Send {RCtrl Down}
return
Appskey up::
    SetKeyDelay -1
    Send {RCtrl Up}
return

;own additions
Capslock & \::SendInput {Blind}{PrintScreen DownTemp}
Capslock & \ up::SendInput {Blind}{PrintScreen Up}
Capslock & Enter::SendInput {Blind}{Esc Down}
Capslock & Enter up::SendInput {Blind}{Esc Up}

;command to change desktop in windows
Capslock & r::SendInput {LWin Down}{Ctrl Down}{Left}{Ctrl Up}{LWin Up}
Capslock & t::SendInput {LWin Down}{Ctrl Down}{Right}{Ctrl Up}{LWin Up}


;F-keys
Capslock & 1::Send {Blind}{F1 Down}
Capslock & 1 up::Send {Blind}{F1 Up}
Capslock & 2::Send {Blind}{F2 Down}
Capslock & 2 up::Send {Blind}{F2 Up}
Capslock & 3::Send {Blind}{F3 Down}
Capslock & 3 up::Send {Blind}{F3 Up}
Capslock & 4::Send {Blind}{F4 Down}
Capslock & 4 up::Send {Blind}{F4 Up}
Capslock & 5::Send {Blind}{F5 Down}
Capslock & 5 up::Send {Blind}{F5 Up}
Capslock & 6::Send {Blind}{F6 Down}
Capslock & 6 up::Send {Blind}{F6 Up}
Capslock & 7::Send {Blind}{F7 Down}
Capslock & 7 up::Send {Blind}{F7 Up}
Capslock & 8::Send {Blind}{F8 Down}
Capslock & 8 up::Send {Blind}{F8 Up}
Capslock & 9::Send {Blind}{F9 Down}
Capslock & 9 up::Send {Blind}{F9 Up}
Capslock & 0::Send {Blind}{F10 Down}
Capslock & 0 up::Send {Blind}{F10 Up}
Capslock & -::Send {Blind}{F11 Down}
Capslock & - up::Send {Blind}{F11 Up}
Capslock & =::Send {Blind}{F12 Down}
Capslock & = up::Send {Blind}{F12 Up}



;cloned

; Capslock + neui (left, down, up, right)

Capslock & n::Send {Blind}{Left Down}
Capslock & n up::Send {Blind}{Left Up}

Capslock & e::Send {Blind}{Down Down}
Capslock & e up::Send {Blind}{Down Up}

Capslock & u::Send {Blind}{Up Down}
Capslock & u up::Send {Blind}{Up Up}

Capslock & i::Send {Blind}{Right Down}
Capslock & i up::Send {Blind}{Right Up}


; Capslock + 'o[] (pgdown, pgup, home, end)

;Capslock & [::SendInput {Blind}{Home Down}
;Capslock & [ up::SendInput {Blind}{Home Up}

;Capslock & ]::SendInput {Blind}{End Down}
;Capslock & ] up::SendInput {Blind}{End Up}

;Capslock & o::SendInput {Blind}{PgUp Down}
;Capslock & o up::SendInput {Blind}{PgUp Up}

;Capslock & '::SendInput {Blind}{PgDn Down}
;Capslock & ' up::SendInput {Blind}{PgDn Up}



; Capslock + nm (insert, backspace, del)

;Capslock & .::SendInput {Blind}{Insert Down}
;Capslock & /::SendInput {Blind}{Del Down}
;Capslock & Space::SendInput {Blind}{BS Down}
Capslock & BS::SendInput {Blind}{Del Down}
Capslock & BS up::SendInput {Blind}{Del Up}



