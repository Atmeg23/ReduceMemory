@echo off
:: Mengecek apakah skrip berjalan sebagai administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Memerlukan hak Administrator! Menjalankan ulang skrip...
    powershell -Command "Start-Process '%~fnx0' -Verb RunAs -WindowStyle Hidden"
    exit /b
)

:: Menyembunyikan jendela CMD
cd /d "%~dp0"
title Reduce Memory (Silent Mode)

:: Bersihkan Standby List di RAM
start /b "" EmptyStandbyList.exe workingsets
start /b "" EmptyStandbyList.exe modifiedpagelist
start /b "" EmptyStandbyList.exe standbylist

:: Hapus file sementara & Prefetch
del /s /q %temp%\* >nul 2>&1
del /s /q C:\Windows\Prefetch\* >nul 2>&1

:: Menonaktifkan layanan tidak perlu (opsional)
sc stop SysMain >nul 2>&1
sc stop DiagTrack >nul 2>&1
sc stop WSearch >nul 2>&1

:: Tutup CMD setelah selesai
exit /b

