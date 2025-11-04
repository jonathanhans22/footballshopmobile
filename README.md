# football_shop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

                                TUGAS 7
------------------------------------------------------------------------

1. Widget tree (pohon widget) adalah struktur inti dari semua tampilan (UI) di Flutter. Bayangkan aplikasi Anda sebagai pohon keluarga:
-Ada satu widget paling atas (disebut root), biasanya MaterialApp atau CupertinoApp.
-Widget root ini memiliki "anak" (child). Misalnya, MaterialApp punya anak Scaffold.
-Scaffold kemudian punya anak-anak lagi, seperti AppBar dan Column.
-Column punya anak-anak lagi, seperti Text dan Button.
Struktur bersarang (nested) inilah yang disebut widget tree.
Hubungan parent-child (induk-anak) menentukan bagaimana UI diatur. Widget parent (induk) bertugas mengendalikan dan memberi batasan (seperti ukuran atau posisi) kepada widget child (anak) di dalamnya. Widget child kemudian akan "menggambar" dirinya sendiri sesuai dengan batasan yang diberikan oleh parent-nya.

2. - MyApp (Widget Kustom): Ini adalah StatelessWidget buatan Anda di main.dart yang berfungsi sebagai widget root (paling atas) untuk seluruh aplikasi.

-MaterialApp: Digunakan di dalam MyApp sebagai pembungkus utama. Fungsinya menyediakan tema (via ThemeData), judul aplikasi ('Football Shop'), dan menentukan halaman awal (home: MyHomePage()).

-MyHomePage (Widget Kustom): Ini adalah StatelessWidget buatan Anda di menu.dart yang berisi seluruh tampilan halaman utama.

-Scaffold: Kerangka utama halaman Anda. Fungsinya menyediakan AppBar (bilah atas) dan body (konten utama halaman).

-AppBar: Bilah judul di bagian atas layar. Anda menggunakannya untuk menampilkan Text 'Football Shop'.

-SingleChildScrollView: Widget penting yang membungkus konten body Anda. Fungsinya agar seluruh halaman bisa di-scroll (digulir) jika kontennya (terutama GridView) melebihi tinggi layar.

-Padding: Widget tata letak yang memberi jarak (padding) di sekeliling anaknya. Anda menggunakannya untuk memberi jarak 10.0 di sekeliling Column utama dan juga untuk memberi jarak di dalam Card.

-Column: Widget tata letak yang menyusun anak-anaknya secara vertikal (dari atas ke bawah). Anda menggunakannya untuk menyusun Text judul dan GridView di body, serta menyusun Icon dan Text di dalam Card.

-Text: Widget dasar untuk menampilkan tulisan. Anda menggunakannya untuk judul di AppBar, judul 'Welcome to Football Shop', dan label di dalam tombol Card (spt 'View Items').

-GridView.count: Widget tata letak utama untuk menu Anda. Fungsinya menampilkan widget anak-anaknya (tiga Card) dalam format grid (kotak-kotak). crossAxisCount: 3 berarti Anda ingin ada 3 kolom.

-Card: Widget yang berfungsi sebagai tombol menu Anda. Ini adalah container (wadah) yang memberi latar belakang warna (biru, hijau, merah), bayangan (shadow), dan sudut yang sedikit membulat.

-InkWell: Widget tak terlihat yang membungkus Column di dalam Card. Fungsinya adalah membuat Card tersebut bisa diklik dan merespons onTap (ketukan).

-Icon: Menampilkan ikon grafis. Anda menggunakannya untuk Icons.shopping_bag, Icons.add_shopping_cart, dan Icons.logout di dalam Card.

3. MaterialApp adalah widget bawaan Flutter yang membungkus banyak fitur yang diperlukan untuk aplikasi bergaya Material Design (standar desain Google).
Fungsi utamanya adalah:
-Menyediakan Tema : Seperti yang Anda lakukan, ia mengatur ThemeData (skema warna, font, dll) untuk seluruh widget di bawahnya.
--Mengelola Navigasi : Menyediakan sistem untuk berpindah antar halaman. Saat ini Anda baru menggunakan properti home untuk halaman awal.
Menyediakan Lokalisasi: Mengatur dukungan untuk berbagai bahasa.
Ia digunakan sebagai widget root karena semua fitur di atas (seperti tema dan navigator) perlu "tersedia" dan bisa diakses oleh semua widget dan halaman lain di dalam aplikasi. Dengan meletakkannya di MyApp (paling atas), MaterialApp memastikan bahwa widget apa pun di bawahnya (seperti Scaffold atau Card di MyHomePage) bisa "mencari" dan menggunakan data tema tersebut.

4. Perbedaan utamanya terletak pada "State" (Keadaan).

StatelessWidget (Widget Statis)
- Ini adalah widget yang tidak bisa berubah setelah dibuat. Tampilannya murni bergantung pada data yang diterimanya.
- Saat ini, kedua widget kustom Anda (MyApp dan MyHomePage) adalah StatelessWidget. Ini cocok karena aplikasi Anda hanya menampilkan menu yang statis.
-Kapan digunakan? Gunakan ini untuk tampilan yang tidak perlu berubah datanya, seperti ikon, label teks, atau halaman "Tentang Kami".

StatefulWidget (Widget Dinamis)
- Ini adalah widget yang bisa berubah seiring waktu. Ia memiliki objek "State" internal untuk menyimpan data yang bisa berubah.
- Ketika data di dalam State berubah (menggunakan fungsi setState()), widget ini akan membangun ulang (rebuild) tampilannya untuk mencerminkan data baru.
- Kapan digunakan? Jika nanti Anda ingin aplikasi ini bisa menambah item atau login, Anda perlu menggunakan StatefulWidget. Contoh: Untuk menyimpan daftar item di keranjang belanja, status login pengguna, atau teks yang sedang diketik di TextField.

5. BuildContext adalah "alamat" atau "lokasi" unik dari sebuah widget di dalam widget tree. Ia memberi tahu widget di mana posisinya dan siapa saja "leluhur" (ancestor) atau parent-nya.
Ini sangat penting karena BuildContext adalah kunci bagi sebuah widget untuk "naik" ke widget tree dan menemukan layanan atau data dari widget leluhurnya.
Penggunaannya di metode build: Anda bisa lihat di kode Anda, metode build di MyApp dan MyHomePage selalu menerima parameter (BuildContext context).
context inilah "alamat" dari MyApp atau MyHomePage saat sedang dibangun. Jika nanti Anda perlu mengambil data tema (yang disediakan MaterialApp) di dalam MyHomePage, Anda akan menggunakan context tersebut.
Contoh: Theme.of(context).primaryColor Artinya: "Hai context (alamatku), tolong cari widget Theme terdekat di atasku, dan berikan saya data primaryColor-nya."

6. Keduanya adalah fitur yang mempercepat proses development di Flutter, tapi cara kerjanya beda:

Hot Reload
-yang terjadi: Flutter menyuntikkan kode baru Anda ke dalam aplikasi yang sedang berjalan tanpa mematikan aplikasi.
-Keadaan: Tetap terjaga. Jika Anda mengubah MyHomePage menjadi StatefulWidget dan punya counter di angka 10, lalu Anda mengubah warna Card, setelah hot reload, angka counter akan tetap 10.
-Kecepatan: Sangat cepat (biasanya < 1 detik).
-Kapan digunakan: Paling sering digunakan. Cocok saat Anda mengubah UI (misalnya mengubah warna Card atau mengganti Icon).

Hot Restart
-yang terjadi: Flutter mematikan aplikasi Anda dan memulainya lagi dari awal.
-Keadaan: Hilang/Reset. Aplikasi dimulai dari keadaan awal (kembali ke main()). Jika Anda punya counter di angka 10, setelah hot restart, angka counter akan kembali ke 0.
-Kecepatan: Cukup cepat (beberapa detik), tapi lebih lambat dari hot reload.
-Kapan digunakan: Digunakan jika perubahan kode Anda terlalu besar (misalnya, mengubah konstruktor StatelessWidget atau mengubah data state awal) yang tidak bisa ditangani oleh hot reload.

