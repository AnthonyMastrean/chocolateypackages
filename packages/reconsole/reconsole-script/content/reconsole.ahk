#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

FileInstall, reconsole.ico, reconsole.ico

Menu, Tray, Tip, Reconsole
Menu, Tray, Icon, reconsole.ico,

#IfWinActive ahk_class ConsoleWindowClass

    %::Send `%`%{Left}
    (::Send (){Left}
    "::Send ""{Left}
    '::Send ''{Left}
    {::Send {{}{}}{Left}
    [::Send []{Left}

#IfWinActive