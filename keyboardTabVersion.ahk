#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Autohotkey Tab Remapping Script
; Danik
; More info at http://danikgames.com/blog/?p=714
; danikgames.com
;
; Functionality:
; - Deactivates Tab for normal (accidental) use.
; - Hold Tab and drag anywhere in a window to move it (not just the title bar).
; - Access the following functions when pressing Tab:
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
; To use Tab as you normally would, you can press WinKey + Tab


; This script is mostly assembled from modified versions of the following awesome scripts:
;
; # Home Row Computing by Gustavo Duarte: http://duartes.org/gustavo/blog/post/home-row-computing for
; Changes:
; - Does not need register remapping of AppsKey using SharpKeys.
; - Uses normal cursor key layout
; - Added more hotkeys for insert, undo, redo etc.
;
; # Get the Linux Alt+Window Drag Functionality in Windows: http://www.howtogeek.com/howto/windows-vista/get-the-linux-altwindow-drag-functionality-in-windows/
; Changes: The only change was using Tab instead of Alt. This
; also removes problems in certain applications.




#Persistent
SetCapslockState, AlwaysOff

*Capslock::SendInput {Blind}{Tab}
;Alt & Capslock::SendInput {Alt Down}{Tab}
;Capslock::SendInput {Blind}{Tab DownTemp}
;Capslock up::SendInput {Blind}{Tab Up}
;Shift & Capslock::SendInput {Shift Down}{Tab}

;volume and stuff
Tab & x::SendInput {Blind}{Volume_Mute}
Tab & c::SendInput {Blind}{Volume_Down}
Tab & v::SendInput {Blind}{Volume_Up}
Tab & f::WinMaximize, A
Tab & s::SendInput {Blind}{WinMinimize}
;change apps key to control for surface
;Appskey::SendInput {Blind}{RControl Down} <- This doesn't work, appskey gets stuck
Appskey::
    SetKeyDelay -1
    Send {Ctrl Down}
return
Appskey up::
    SetKeyDelay -1
    Send {Ctrl Up}
return

;own additions
Tab & \::SendInput {Blind}{PrintScreen DownTemp}
Tab & \ up::SendInput {Blind}{PrintScreen Up}
Tab & Enter::SendInput {Blind}{Esc DownTemp}
Tab & Enter up::SendInput {Blind}{Esc Up}

;command to change desktop in windows
Tab & r::SendInput {LWin Down}{Ctrl Down}{Left}{Ctrl Up}{LWin Up}
Tab & t::SendInput {LWin Down}{Ctrl Down}{Right}{Ctrl Up}{LWin Up}
;Tab & f up::Send {Blind} {<#^Left Up}
;Tab & s:: Send {Blind}{<#^Right DownTemp}
;Calslock & s up:: Send {Blind}{<#^Right Up}

;F-keys
Tab & 1::Send {Blind}{F1 DownTemp}
Tab & 1 up::Send {Blind}{F1 Up}
Tab & 2::Send {Blind}{F2 DownTemp}
Tab & 2 up::Send {Blind}{F2 Up}
Tab & 3::Send {Blind}{F3 DownTemp}
Tab & 3 up::Send {Blind}{F3 Up}
Tab & 4::Send {Blind}{F4 DownTemp}
Tab & 4 up::Send {Blind}{F4 Up}
Tab & 5::Send {Blind}{F5 DownTemp}
Tab & 5 up::Send {Blind}{F5 Up}
Tab & 6::Send {Blind}{F6 DownTemp}
Tab & 6 up::Send {Blind}{F6 Up}
Tab & 7::Send {Blind}{F7 DownTemp}
Tab & 7 up::Send {Blind}{F7 Up}
Tab & 8::Send {Blind}{F8 DownTemp}
Tab & 8 up::Send {Blind}{F8 Up}
Tab & 9::Send {Blind}{F9 DownTemp}
Tab & 9 up::Send {Blind}{F9 Up}
Tab & 0::Send {Blind}{F10 DownTemp}
Tab & 0 up::Send {Blind}{F10 Up}
Tab & -::Send {Blind}{F11 DownTemp}
Tab & - up::Send {Blind}{F11 Up}
Tab & =::Send {Blind}{F12 DownTemp}
Tab & = up::Send {Blind}{F12 Up}




;cloned

; Tab + neui (left, down, up, right)

Tab & n::Send {Blind}{Left DownTemp}
Tab & n up::Send {Blind}{Left Up}

Tab & e::Send {Blind}{Down DownTemp}
Tab & e up::Send {Blind}{Down Up}

Tab & u::Send {Blind}{Up DownTemp}
Tab & u up::Send {Blind}{Up Up}

Tab & i::Send {Blind}{Right DownTemp}
Tab & i up::Send {Blind}{Right Up}


; Tab + 'o[] (pgdown, pgup, home, end)

Tab & [::SendInput {Blind}{Home Down}
Tab & [ up::SendInput {Blind}{Home Up}

Tab & ]::SendInput {Blind}{End Down}
Tab & ] up::SendInput {Blind}{End Up}

Tab & o::SendInput {Blind}{PgUp Down}
Tab & o up::SendInput {Blind}{PgUp Up}

Tab & '::SendInput {Blind}{PgDn Down}
Tab & ' up::SendInput {Blind}{PgDn Up}




; Tab + wer (close tab or window, press esc)

;Tab & w::SendInput {Ctrl down}{F4}{Ctrl up}
;Tab & e::SendInput {Alt down}{F4}{Alt up}
;Tab & r::SendInput {Blind}{Esc Down}


; Tab + nm (insert, backspace, del)

Tab & .::SendInput {Blind}{Insert Down}
Tab & /::SendInput {Blind}{Del Down}
Tab & Space::SendInput {Blind}{BS Down}
Tab & BS::SendInput {Blind}{Del Down}

; Tab + TAB/q (prev/next tab)

;Tab & q::SendInput {Ctrl Down}{Tab Down}
;Tab & q up::SendInput {Ctrl Up}{Tab Up}
;Tab & Tab::SendInput {Ctrl Down}{Shift Down}{Tab Down}
;Tab & Tab up::SendInput {Ctrl Up}{Shift Up}{Tab Up}

; Tab + ,/. (undo/redo)

;Tab & ,::SendInput {Ctrl Down}{z Down}
;Tab & , up::SendInput {Ctrl Up}{z Up}
;Tab & .::SendInput {Ctrl Down}{y Down}
;Tab & . up::SendInput {Ctrl Up}{y Up}


; Make Win Key + Tab work like Tab
;#Tab::
;If GetKeyState("Tab", "T") = 1
;    SetTabState, AlwaysOff
;Else
;    SetTabState, AlwaysOn
;Return
