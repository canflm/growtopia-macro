#NoEnv

Gui, Add, Button, gStartMacro, Start Macro
Gui, Add, Button, gStopMacro, Stop Macro
Gui, Show, X200 Y200 W200 H100
Gui, Add, Text,, roblox macro
Return

global isRunning := false

MacroLoop:
  if (isRunning) {
    SendMode Input
    Loop {
      Send, {d down}{Space down}
      Random, ranSleep, 250, 300 ; Random delay between 2.5 and 5 seconds
      Sleep, ranSleep
      Send, {d up}{Space up}
      Random, ranSleep, 50, 350 ; Random break between 25 and 50 seconds
      Sleep, ranSleep
    }
  }
Return

StartMacro:
    isRunning := True
    MsgBox, Macro Started, 10
Return

StopMacro:
    isRunning := False
    MsgBox, Macro Paused (Pressing OK will unpause the macro.)
    Send, {a Down}{Space down}
    Send, {a up}{Space Up}
    SetTimer, MacroLoop, 20
Return

F9::
  Gosub StartMacro
  Gosub MacroLoop
Return

F8::
  Gosub StopMacro
  
Return

GuiClose:
    ExitApp
Return
