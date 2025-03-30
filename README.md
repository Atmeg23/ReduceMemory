# ReduceMemory - Windows
The function of this utility is to reduce “Ram Usage” on Windows devices, without damaging running files/programs! (same as ReduceMemory Ghost Spectre).
Fungsi dari utility ini adalah untuk mengurangi "Ram Usage" pada device windows, tanpa merusak file/program yang sedang berjalan! (sama seperti ReduceMemory Ghost Spectre).

//ReduceMemory By Atmeg

I. ReduceMemory Atmeg

Fungsi dari utility ini adalah untuk mengurangi "Ram Usage" pada device windows, tanpa merusak file/program yang sedang berjalan! (sama seperti ReduceMemory Ghost Spectre).

II. CARA INSTALL | BAHASA

1. buka folder "EmptyStandbyList-master" lalu copy/cut file "EmptyStandbyList.exe" ke C:\Windows\System32
2. Windows Logo + R (Win+R/Windows Run/Search) ketik "regedit" lalu enter.
3. pergi ke "HKEY_CLASSES_ROOT\Directory\Background\shell"
4. klik kanan di bagian di key shell, lalu "New" > "Key", beri nama "ReduceMemory"
5. di dalam key ReduceMemory, klik kanan lalu "New" > "String Value".
6. 2x klik di bagian String Value yang baru dibuat, lalu ubah isi di Value Name menjadi "Icon". di bagian isi Value Data isi dengan "C:\Windows\System32\shell32.dll,46" (tanpa tanda kutip/kurung)
7. di dalam Key ReduceMemory, klik kanan lalu "New" > "Key" ketik/beri nama "Command".
8. 2x klik di bagian (Default) pada key Command yang barusan di buat, lalu isi value data dengan file direktori di mana kamu menyimpan "reduce memory atmeg.bat". (contoh: "C:\Users\User\Downloads\reduce memory atmeg.bat"
9. done, enjoy!

III. HOW TO INSTALL | ENGLISH

1. Open the "EmptyStandbyList-master" folder, then copy or cut the "EmptyStandbyList.exe" file to C:\Windows\System32.
2. Press Windows Logo + R (Win+R / Windows Run / Search), type "regedit", then press Enter.
3. Navigate to "HKEY_CLASSES_ROOT\Directory\Background\shell".
4. Right-click on the "shell" key, then select "New" > "Key", and name it "ReduceMemory".
5. Inside the "ReduceMemory" key, right-click and select "New" > "String Value".
6. Double-click the newly created String Value, change the Value Name to "Icon", and set the Value Data to "C:\Windows\System32\shell32.dll,46" (without quotation mark or brackets).
7. Inside the "ReduceMemory" key, right-click and select "New" > "Key", then name it "Command".
8. Double-click "(Default)" inside the newly created "Command" key, then set the Value Data to the directory where you saved "reduce memory atmeg.bat".
- Example: "C:\Users\User\Downloads\reduce memory atmeg.bat"
9. Done! Enjoy

IV. CARA PAKE | BAHASA

1. Pada Windows 10 kebawah, klik kanan pada desktop lalu pilih ReduceMemory dan jalankan sebagai Administrator. Atau jika muncul pop up "UAC" maka pilih Yes.
2. Pada Windows 11, klik kanan pada desktop lalu pilih "Show More Option", pilih ReduceMemory dan jalankan sebagai Administrator. Jika muncul pop up "UAC" maka pilih Yes.
3. Tunggu dan lihat hasilnya di Task Manager.

V. HOW TO USE? | ENGLISH

1. On Windows 10 and earlier, right-click on the desktop, then select ReduceMemory and run it as Administrator. If a "UAC" pop-up appears, select Yes.
2. On Windows 11, right-click on the desktop, then select "Show More Options", choose ReduceMemory, and run it as Administrator. If a "UAC" pop-up appears, select Yes.
3. Wait and check the results in Task Manager.

https://github.com/user-attachments/assets/564456e3-04e5-4e38-b57a-73445ae69529

VI. Credits

EmptyStandbyList - Github @stefanpejcic
https://github.com/stefanpejcic/EmptyStandbyList

VII. Note

|Program Tested On Windows 11 23H2|

Contact Me:
instagram: @atmeg_
