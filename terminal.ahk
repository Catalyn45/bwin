#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.l
SetWorkingDir C:\Users\user\Desktop

; Open terminal
^!t::
Run wt
return

; Close window with alt + q
!q::!F4
