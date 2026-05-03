================================================================
  ReduceMemory Atmeg v2
  by Atmeg  |  improved by Claude (Anthropic)
================================================================

  Utility untuk mengurangi RAM usage di Windows 10 & 11
  secara instan — tanpa popup UAC, tanpa jendela CMD,
  tanpa Disk Usage tinggi, dan tanpa merusak file/program
  yang sedang berjalan.

================================================================
  STRUKTUR FILE
================================================================

  ReduceMemoryAtmeg\
  ├── setup_install.bat          ← Jalankan SEKALI sebagai Admin
  ├── reduce_memory_atmeg.bat    ← Script utama (jangan run manual)
  ├── uninstall.bat              ← Hapus semua perubahan
  ├── readme.txt                 ← File ini
  └── EmptyStandbyList-master\
      └── EmptyStandbyList.exe   ← Diperlukan sebelum setup

  File berikut dibuat OTOMATIS saat setup:
  ├── run_hidden.vbs             ← Menjalankan bat secara silent
  └── trigger.vbs                ← Dipanggil dari context menu

================================================================
  CARA INSTALL  |  BAHASA INDONESIA
================================================================

  [ SYARAT ]
  - Pastikan folder "EmptyStandbyList-master" sudah ada
    di dalam folder yang sama dengan setup_install.bat
  - User harus memiliki hak Administrator

  [ LANGKAH ]
  1. Klik kanan "setup_install.bat"
     → pilih "Run as administrator"

  2. Klik "Yes" pada popup UAC
     (Ini SATU-SATUNYA kali UAC akan muncul)

  3. Tunggu hingga semua step [1/5] sampai [5/5] selesai
     dan muncul tulisan "SETUP SELESAI!"

  4. Selesai. Tidak perlu restart.

================================================================
  HOW TO INSTALL  |  ENGLISH
================================================================

  [ REQUIREMENTS ]
  - The "EmptyStandbyList-master" folder must exist
    in the same directory as setup_install.bat
  - User must have Administrator privileges

  [ STEPS ]
  1. Right-click "setup_install.bat"
     → select "Run as administrator"

  2. Click "Yes" on the UAC prompt
     (This is the ONLY time UAC will appear)

  3. Wait until all steps [1/5] through [5/5] complete
     and "SETUP SELESAI!" message appears

  4. Done. No restart required.

================================================================
  CARA PAKAI  |  BAHASA INDONESIA
================================================================

  Windows 10:
    Klik kanan di Desktop → pilih "ReduceMemory Atmeg"

  Windows 11:
    Klik kanan di Desktop → "Show More Options"
    → pilih "ReduceMemory Atmeg"

  Tidak ada popup. Tidak ada jendela. Script berjalan di
  background. Cek hasilnya di Task Manager → Performance
  → Memory (tab "In Use" akan turun).

================================================================
  HOW TO USE  |  ENGLISH
================================================================

  Windows 10:
    Right-click on Desktop → select "ReduceMemory Atmeg"

  Windows 11:
    Right-click on Desktop → "Show More Options"
    → select "ReduceMemory Atmeg"

  No popup. No window. The script runs silently in the
  background. Check results in Task Manager → Performance
  → Memory (the "In Use" value will decrease).

================================================================
  CARA UNINSTALL
================================================================

  1. Klik kanan "uninstall.bat" → "Run as administrator"
  2. Selesai. Semua perubahan dihapus bersih:
     - Scheduled Task dihapus
     - Registry context menu dihapus
     - EmptyStandbyList.exe dihapus dari System32

================================================================
  PENJELASAN TEKNIS
================================================================

  CARA KERJA (ALUR EKSEKUSI):

    Klik kanan desktop
         ↓
    trigger.vbs
    (panggil schtasks /run secara silent)
         ↓
    Task Scheduler
    (user session, hak admin, tanpa UAC)
         ↓
    run_hidden.vbs
    (jalankan CMD dengan window = 0 / hidden)
         ↓
    reduce_memory_atmeg.bat
         ↓
    EmptyStandbyList workingsets
    → EmptyStandbyList modifiedpagelist
    → EmptyStandbyList standbylist
    → Hapus file temp user
    → Flush DNS cache

  ----------------------------------------------------------------

  KENAPA TIDAK ADA UAC:
    Task Scheduler mendaftarkan task dengan LogonType
    "InteractiveToken" dan RunLevel "HighestAvailable".
    Artinya task sudah pre-authorized saat setup — tidak
    perlu konfirmasi ulang setiap dijalankan.

  KENAPA TIDAK ADA JENDELA CMD:
    Context menu memanggil wscript.exe (bukan cmd.exe).
    wscript tidak memiliki jendela sendiri. Dari situ,
    run_hidden.vbs menjalankan cmd.exe dengan parameter
    window "0" (hidden).

  KENAPA DISK USAGE RENDAH:
    Versi lama melakukan reset Pagefile (tulis ulang
    ratusan MB ke disk) dan hapus Prefetch (Windows
    harus rebuild cache dari nol). Keduanya dihilangkan.
    Sekarang hanya RAM yang disentuh, bukan disk.

  URUTAN ESL YANG BENAR:
    1. workingsets   → paksa proses lepas RAM idle
    2. modifiedpagelist → bersihkan data yang belum
                          ditulis ke disk
    3. standbylist   → kosongkan cache RAM
    Urutan ini penting — workingsets harus duluan supaya
    data yang dilepas bisa langsung diklaim ulang oleh OS.

  ----------------------------------------------------------------

  PERBEDAAN DARI VERSI 1:

    DIHAPUS:
    - Reset Pagefile  (penyebab Disk Usage 100%)
    - Hapus Prefetch  (memperlambat buka aplikasi)
    - sc stop SysMain / WSearch / DiagTrack
      (merusak sistem jangka panjang)
    - PowerShell MinWorkingSet loop  (penyebab freeze)

    DITAMBAHKAN:
    - setup_install.bat  (one-time setup otomatis)
    - run_hidden.vbs  (silent execution)
    - trigger.vbs  (pemanggil dari context menu)
    - uninstall.bat  (hapus bersih semua perubahan)
    - Jeda antar operasi ESL  (hasil lebih optimal)
    - Auto-detect path EmptyStandbyList.exe
    - Flush DNS cache

================================================================
  KOMPATIBILITAS
================================================================

  OS       : Windows 10 (semua versi) & Windows 11
  Dependensi: EmptyStandbyList.exe (by @stefanpejcic)
  Tested on: Windows 11 23H2

================================================================
  CREDITS
================================================================

  EmptyStandbyList
  GitHub  : github.com/stefanpejcic/EmptyStandbyList
  Author  : @stefanpejcic

  Original script  : ChatGPT
  v2 improvements  : Claude — Anthropic

================================================================
