@echo off
:: ============================================================
::  ReduceMemory Atmeg - Setup Script (Jalankan SEKALI sebagai Admin)
:: ============================================================

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Harus dijalankan sebagai Administrator!
    echo Klik kanan lalu pilih "Run as administrator"
    pause & exit /b 1
)

echo ============================================================
echo  ReduceMemory Atmeg - Setup
echo ============================================================
echo.

set "SCRIPT_DIR=%~dp0"
if "%SCRIPT_DIR:~-1%"=="\" set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

set "BAT_FILE=%SCRIPT_DIR%\reduce_memory_atmeg.bat"
set "RUN_VBS=%SCRIPT_DIR%\run_hidden.vbs"
set "TRIGGER_VBS=%SCRIPT_DIR%\trigger.vbs"
set "ESL_DEST=%SystemRoot%\System32\EmptyStandbyList.exe"
set "TASK_NAME=ReduceMemoryAtmeg"
set "PS1_TEMP=%SCRIPT_DIR%\register_task.ps1"

:: --- Auto-detect EmptyStandbyList.exe ---
set "ESL_SRC="
if exist "%SCRIPT_DIR%\EmptyStandbyList-master\EmptyStandbyList.exe" (
    set "ESL_SRC=%SCRIPT_DIR%\EmptyStandbyList-master\EmptyStandbyList.exe"
)
if not defined ESL_SRC (
    if exist "%SCRIPT_DIR%\EmptyStandbyList.exe" (
        set "ESL_SRC=%SCRIPT_DIR%\EmptyStandbyList.exe"
    )
)

:: ── [1/5] Copy EmptyStandbyList.exe ─────────────────────────
echo [1/5] Menyalin EmptyStandbyList.exe ke System32...
if not defined ESL_SRC (
    echo [ERROR] EmptyStandbyList.exe tidak ditemukan!
    pause & exit /b 1
)
copy /y "%ESL_SRC%" "%ESL_DEST%" >nul
if errorlevel 1 ( echo [ERROR] Gagal copy! & pause & exit /b 1 )
echo        OK
echo.

:: ── [2/5] Buat run_hidden.vbs ────────────────────────────────
echo [2/5] Membuat run_hidden.vbs...
(
echo Set oShell = CreateObject("WScript.Shell"^)
echo oShell.Run "cmd.exe /c """ ^& WScript.Arguments(0^) ^& """", 0, True
echo Set oShell = Nothing
) > "%RUN_VBS%"
echo        OK
echo.

:: ── [3/5] Tulis & jalankan PS1 untuk daftarkan Task ─────────
:: Tulis baris per baris pakai >> (append) bukan () > block
:: Ini menghindari | dan karakter spesial lain yang merusak redirect
echo [3/5] Mendaftarkan Scheduled Task...

del "%PS1_TEMP%" >nul 2>&1

>> "%PS1_TEMP%" echo Unregister-ScheduledTask -TaskName '%TASK_NAME%' -Confirm:$false -ErrorAction SilentlyContinue
>> "%PS1_TEMP%" echo $act = New-ScheduledTaskAction -Execute 'wscript.exe' -Argument ('"%RUN_VBS%" "%BAT_FILE%"')
>> "%PS1_TEMP%" echo $pri = New-ScheduledTaskPrincipal -UserId '%USERNAME%' -LogonType Interactive -RunLevel Highest
>> "%PS1_TEMP%" echo $set = New-ScheduledTaskSettingsSet -Hidden -MultipleInstances IgnoreNew -ExecutionTimeLimit (New-TimeSpan -Minutes 2)
>> "%PS1_TEMP%" echo Register-ScheduledTask -TaskName '%TASK_NAME%' -Action $act -Principal $pri -Settings $set -Force

powershell -NoProfile -NonInteractive -ExecutionPolicy Bypass -File "%PS1_TEMP%"
del "%PS1_TEMP%" >nul 2>&1

schtasks /query /tn "%TASK_NAME%" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Task gagal terdaftar!
    pause & exit /b 1
)
echo        OK - Task terdaftar untuk user: %USERNAME%
echo.

:: ── [4/5] Buat trigger.vbs ───────────────────────────────────
echo [4/5] Membuat trigger.vbs...
(
echo Set oShell = CreateObject("WScript.Shell"^)
echo oShell.Run "schtasks /run /tn ""%TASK_NAME%""", 0, False
echo Set oShell = Nothing
) > "%TRIGGER_VBS%"
echo        OK
echo.

:: ── [5/5] Context Menu ───────────────────────────────────────
echo [5/5] Menambahkan ke Context Menu desktop...
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\ReduceMemory" /f /ve /d "ReduceMemory Atmeg" >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\ReduceMemory" /f /v "Icon" /d "shell32.dll,46" >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\ReduceMemory\command" /f /ve /d "wscript.exe \"%TRIGGER_VBS%\"" >nul
echo        OK
echo.

echo ============================================================
echo  SETUP SELESAI!
echo  Win10 : Klik kanan Desktop ^> ReduceMemory Atmeg
echo  Win11 : Klik kanan Desktop ^> Show More Options ^> ReduceMemory Atmeg
echo ============================================================
echo.
pause
exit /b 0
