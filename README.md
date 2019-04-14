# TealinuxATU
Adalah sebuah tools yang dikembangkan oleh team developer tealinuxOS dengan tujuan mempermudah saat debugging tealinuxOS.

## Fitur utama
Pada saat ini terdapat 3 fitur utama dari tealinuxATU yaitu
1. check installed apps
fitur ini berguna untuk menentukan apakah suatu aplikasi telah terinstall dalam `iso` yang dibuat. jika belum maka akan tampil `summary` aplikasi mana saja yang perlu di install.
2. check removed apps
berkebalikan dengan fitur 1, fitur ini berguna untuk menentukan apakah suatu apliasi telah dihapus dari core atau belum. seperti fitur 1 juga akan tampil `summary` mana saja yang perlu di remove.
3. check if default apps is set correctly
fitur ini berbeda dari kedua fitur diatas. fitur ini berguna untuk menentukan apakah suatu aplikasi yang di install telah menjadi aplikasi default untuk `tipe file` terterntu

## Known limitations
1. pada fitur satu menggunakan `dpkg-query` sehingga aplikasi yang tak di install menggunakan `apt` atau `dpkg -i` mungkin tak terdeteksi
2. pada fitur dua, karena menggunakan `ls /usr/share/applications` maka filename belum tentu sama dengan nama file pada start menu
