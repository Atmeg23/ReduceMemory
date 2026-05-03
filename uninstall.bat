@echo off
:: ============================================================
::  ReduceMemory Atmeg - Uninstall Script
:: ============================================================

net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~fnx0' -Verb RunAs"
    exit /b
)

echo [1/3] Menghapus Scheduled Task...
schtasks /delete /tn "ReduceMemoryAtmeg" /f >nul 2>&1
echo        OK

echo [2/3] Menghapus Context Menu...
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\ReduceMemory" /f >nul 2>&1
echo        OK

echo [3/3] Menghapus EmptyStandbyList dari System32...
del /f /q "%SystemRoot%\System32\EmptyStandbyList.exe" >nul 2>&1
echo        OK

echo.
echo Uninstall selesai!
pause
exit /b 0
