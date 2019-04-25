# TealinuxATU
Adalah sebuah tools yang dikembangkan oleh team developer tealinuxOS dengan tujuan mempermudah saat debugging tealinuxOS.

## Fitur utama
Pada saat ini terdapat 4 fitur utama dari tealinuxATU yaitu
1. check installed apps
fitur ini berguna untuk menentukan apakah suatu aplikasi telah terinstall dalam `iso` yang dibuat. jika belum maka akan tampil `summary` aplikasi mana saja yang perlu di install.
2. check removed apps
berkebalikan dengan fitur 1, fitur ini berguna untuk menentukan apakah suatu apliasi telah dihapus dari core atau belum. seperti fitur 1 juga akan tampil `summary` mana saja yang perlu di remove.
3. check if default apps is set correctly
fitur ini berbeda dari kedua fitur diatas. fitur ini berguna untuk menentukan apakah suatu aplikasi yang di install telah menjadi aplikasi default untuk `tipe file` terterntu
4. automatic update
jika ada update dari repo maka secara otomatis atu akan download. baik berupa core update maupun listapps update

## Known limitations
1. ~~pada fitur satu menggunakan `dpkg-query` sehingga aplikasi yang tak di install menggunakan `apt` atau `dpkg -i` mungkin tak terdeteksi~~ syudah di overcome!
2. ~~pada fitur dua, karena menggunakan `ls /usr/share/applications` maka filename belum tentu sama dengan nama file pada start menu~~ syudah di overcome! fitur satu dan dua menggunakan 2 metode yaitu pencarian menggunakan `dpkg-query` dan pencarian keyword pada `/usr/share/applications/*.desktop`
3. ~~atu belum dapat menemukan binary yang di install bukan lewat `apt/dpkg` seperti `npm`. semoga dapat dikembangkan menggunakan `whereis`~~
4. atu tidak dapat mendeteksi app yang di install untuk satu user tertentu (misal install npm langsung dari repo)

## Cara installasi
1. download inxi (jika tidak ada) `sudo apt install inxi`
2. buat folder kosong pada `/usr/share/tealinux/TealinuxATU/`
3. download `atu.sh`
4. tambahkan permission ke atu `chmod +x atu.sh`

## Cara Menggunakan atu
1. pastikan koneksi internet aktif karena atu akan otomatis fetch data terbaru dari repository
2. cd ke directory dimana atu berada (pada tealinuxOS alpha-beta terdapat pada root `cd /`)
3. jalankan atu dengan root akses atau `sudo ./atu.sh`
4. untuk menjalankan atu dengan fitur satu, gunakan `sudo ./atu.sh -t1`, untuk fitur dua `sudo ./atu.sh -t2` dan seterusnya
5. atu hanya dapat mengeksekusi satu fitur pada satu waktu. misal `sudo ./atu.sh -t1 -t2` atu hanya akan mengeksekusi fitur satu
