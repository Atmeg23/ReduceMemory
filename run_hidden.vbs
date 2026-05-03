Set oShell = CreateObject("WScript.Shell")
oShell.Run "cmd.exe /c """ & WScript.Arguments(0) & """", 0, True
Set oShell = Nothing
