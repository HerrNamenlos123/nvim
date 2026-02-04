; ===============================================
; Caps Lock Tiling Workspace Script for Win11
; 9 fixed workspaces, instant switch, no animation
; Portable: auto-locates DLL relative to script
; ===============================================

; Get the folder where this script lives
ScriptDir := A_ScriptDir
DLLPath := ScriptDir "\VirtualDesktopAccessor.dll"

; Use these lines to find out the scancode for Umlaute
; #InstallKeybdHook
; #Persistent
; KeyHistory

; Check if DLL exists
if !FileExist(DLLPath)
{
    MsgBox, 16, Error, DLL not found in %DLLPath%!
    ExitApp
}

; Load the DLL
hModule := DllCall("LoadLibrary", "Str", DLLPath)
if !hModule
{
    MsgBox, 16, Error, Failed to load DLL
    ExitApp
}

LastFocused := {}   ; desktopIndex -> hwnd
SetWinEventHook()

; Disable CapsLock toggle
SetCapsLockState, AlwaysOff
CapsLock::
    return

CapsLock & j::
    EnsureDesktopExists(4)
    if GetKeyState("Shift", "P")
    {
        MoveWindowToDesktop(0)
        GoToDesktop(0) 
    }
    else
    {
        GoToDesktop(0)
    }
return

CapsLock & k::
    EnsureDesktopExists(4)
    if GetKeyState("Shift", "P")
    {
        MoveWindowToDesktop(1)
        GoToDesktop(1) 
    }
    else
    {
        GoToDesktop(1) 
    }
return

CapsLock & l::
    EnsureDesktopExists(4)
    if GetKeyState("Shift", "P")
    {
        MoveWindowToDesktop(2)
        GoToDesktop(2) 
    }
    else
    {
        GoToDesktop(2) 
    }
return

CapsLock & SC027::
    EnsureDesktopExists(4)
    if GetKeyState("Shift", "P")
    {
        MoveWindowToDesktop(3)
        GoToDesktop(3) 
    }
    else
    {
        GoToDesktop(3) 
    }
return


; ===============================================
; Functions
; ===============================================
GoToDesktop(n)
{
    global DLLPath, LastFocused

    DllCall(DLLPath "\GoToDesktopNumber", "UInt", n)

    ; Wait until the desktop switch actually completes
    Loop 30
    {
        current := DllCall(DLLPath "\GetCurrentDesktopNumber", "UInt")
        if (current = n)
            break
        Sleep, 10
    }

    ; Restore last focused window if still valid
    if (LastFocused.HasKey(n))
    {
        hwnd := LastFocused[n]
        if WinExist("ahk_id " hwnd)
            WinActivate, ahk_id %hwnd%
    }
}


MoveWindowToDesktop(n)
{
    global DLLPath
    WinGet, hwnd, ID, A  ; get active window
    if !hwnd
        return
    ; Call the DLL function MoveWindowToDesktopNumber
    DllCall(DLLPath "\MoveWindowToDesktopNumber", "Ptr", hwnd, "UInt", n)
    LastFocused[n] := hwnd
}

EnsureDesktopExists(n)
{
    global DLLPath
    ; Get number of existing desktops
    Count := DllCall(DLLPath . "\GetDesktopCount", "UInt")
    ; Create desktops until n exists
    Loop % (n - Count)
    {
        DllCall(DLLPath . "\CreateDesktop")
    }
}

SetWinEventHook()
{
    static hook := DllCall("SetWinEventHook"
        , "UInt", 0x0003
        , "UInt", 0x0003
        , "Ptr", 0
        , "Ptr", RegisterCallback("OnForegroundChanged")
        , "UInt", 0
        , "UInt", 0
        , "UInt", 0x0000)
}

OnForegroundChanged(hWinEventHook, event, hwnd)
{
    global DLLPath, LastFocused

    if (!hwnd)
        return

    desk := DllCall(DLLPath "\GetCurrentDesktopNumber", "UInt")
    LastFocused[desk] := hwnd
}