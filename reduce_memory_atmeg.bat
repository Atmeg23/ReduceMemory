@echo off
:: ============================================================
::  ReduceMemory Atmeg v4 - Main Script
:: ============================================================

:: Fase 1 - Trim working sets semua proses (lepas RAM idle dari proses)
start /b "" "%SystemRoot%\System32\EmptyStandbyList.exe" workingsets
ping -n 3 127.0.0.1 >nul

:: Fase 2 - Bersihkan modified page list
start /b "" "%SystemRoot%\System32\EmptyStandbyList.exe" modifiedpagelist
ping -n 2 127.0.0.1 >nul

:: Fase 3 - Kosongkan standby list (ini yang bikin angka RAM turun)
start /b "" "%SystemRoot%\System32\EmptyStandbyList.exe" standbylist
ping -n 2 127.0.0.1 >nul

:: Cleanup ringan
for /f "delims=" %%i in ('dir /b /a-d "%temp%\*" 2^>nul') do del /f /q "%temp%\%%i" >nul 2>&1
ipconfig /flushdns >nul 2>&1

exit /b 0
