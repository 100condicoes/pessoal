#SingleInstance, force
#NoEnv
SetCapsLockState, Off
SetBatchLines, -1
SetMouseDelay, -1
CoordMode, Pixel, Window
CoordMode, Mouse, Window

Files:
IfNotExist, %A_ScriptDir%\images
{
	(msgbox,, "Get da images bruh", 3)
	ExitApp
}

MsgBox, 0,Tutorial, Watch the youtube video if you're unsure why it works, 5
MsgBox, 0,Remember, F1 to activate macro & F2 to Stop., 5

F2::ExitApp

F1::
macro_on := !macro_on
if (macro_on)
(fishing = false)

Loop, 3
{	
    ToolTip
    if WinExist("Ahk_exe RobloxPlayerBeta.exe")
    {
        WinActivate
        WinGetPos,,,W,H,A
        If ((W >= A_ScreenWidth ) & (H >= A_ScreenHeight))
        {
            Send {F11}
            Sleep 100
        }
        WinMove, Ahk_exe RobloxPlayerBeta.exe,,,, 800, 599
    }
}



Equipfishing:
{
	SendInput, 1
	Sleep, 200
	SendInput, 9
	Sleep, 200
	(fishing = true)
	Sleep, 200
	Click
	Sleep, 200
	Goto, Waiting
}
Return


Waiting:
{
	start_time := A_TickCount
	run_time := 5*60*1000
	end_time := start_time + run_time

	while (A_TickCount < end_time)
	  {
		ImageSearch, x, y, 334, 203, 472, 311, *100 %A_ScriptDir%\images\exclamation.png
		If (ErrorLevel = 0)
			{
			Goto, Fishing
			}
}
Goto, Equipfishing
}
Return

Fishing:
{
	Loop, 200
		{
		Sleep, 50
		Click
		}
		;Can modify this part for food
		Sleep, 100
		  SendInput, 0
		  Sleep, 100
		  Click
		  Sleep, 100
	Goto, Equipfishing
}
Return
