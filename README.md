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

IV. Credits

EmptyStandbyList - Github @stefanpejcic
https://github.com/stefanpejcic/EmptyStandbyList

V. Note

|Program Tested On Windows 11 23H2|

Contact Me:
instagram: @atmeg_

Support Atmeg:
BTC : 1K2JuYZASYx1bTJhDpyb57m9i5bQ67iFez
ETH : 0x35723F7EcB6c6a4757E82a7100789e674fcE6A21
SOL : DdFq6E3AU3JxzddsMo2q6pckjPhsjG7RaWBnyP4CKc4s
