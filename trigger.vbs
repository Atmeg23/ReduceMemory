Set oShell = CreateObject("WScript.Shell")
oShell.Run "schtasks /run /tn ""ReduceMemoryAtmeg""", 0, False
Set oShell = Nothing
