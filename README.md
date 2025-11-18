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


                                TUGAS 8
------------------------------------------------------------------------

1. Perbedaan utama antara Navigator.push() dan Navigator.pushReplacement() terletak pada cara mereka mengelola tumpukan (stack) halaman.
        - Navigator.push() "mendorong" (push) halaman baru ke atas tumpukan navigasi. Halaman sebelumnya masih ada di bawahnya, dan pengguna bisa kembali ke halaman tersebut (misalnya dengan menekan tombol kembali).
        - Navigator.pushReplacement() "mengganti" (replace) halaman yang ada saat ini dengan halaman baru. Halaman yang lama akan dihapus (disposed) dari tumpukan. Ini berarti pengguna tidak bisa kembali ke halaman sebelumnya.

    Di aplikasi Football Shop:  
    - Saya menggunakan Navigator.push() untuk navigasi di mana pengguna diharapkan bisa kembali. Contohnya:
    - Saat menekan card "Tambah Item" (shop_card.dart) untuk membuka ShopFormPage.
    - Saat menekan card "Lihat Item" (shop_card.dart) untuk membuka ItemListPage.
    - Saat menekan item di ItemListPage untuk membuka halaman detail (ItemDetailPage).

    Saya menggunakan Navigator.pushReplacement() untuk navigasi di mana pengguna tidak seharusnya kembali, atau untuk menghindari penumpukan halaman yang sama. Contohnya:
        - Saat menekan menu "Halaman Utama" di drawer (left_drawer.dart). Ini akan mengganti halaman apa pun yang sedang aktif dengan MyHomePage dan mencegah tumpukan MyHomePage yang tidak perlu.
2. Saya memanfaatkan hierarchy widget Scaffold, AppBar, dan Drawer untuk menciptakan struktur UI yang konsisten di seluruh aplikasi.
    - Scaffold saya gunakan sebagai widget dasar atau "kerangka" untuk setiap halaman utama (menu.dart, list_item.dart, shoplist_form.dart, dan item_detail_page.dart). Ini memberi saya slot standar untuk appBar, body, dan drawer.

     - AppBar saya tempatkan di slot appBar milik Scaffold di setiap halaman. Saya mengatur backgroundColor dan foregroundColor-nya agar seragam (Indigo gelap dengan teks putih), sehingga memberikan tampilan header yang konsisten.

    - Drawer saya implementasikan dalam satu file terpisah (left_drawer.dart). Widget kustom LeftDrawer ini kemudian saya panggil di properti drawer milik Scaffold di setiap halaman. Dengan cara ini, saya memastikan bahwa menu navigasi samping selalu identik dan dapat diakses dari halaman mana pun, yang membuat pengalaman pengguna menjadi sangat prediktabel.

3. Dalam mendesain form (shoplist_form.dart), layout widget sangat penting untuk fungsionalitas dan kenyamanan pengguna:

    - Padding: Kelebihannya adalah memberikan "ruang napas" visual. Tanpa Padding, widget form seperti TextFormField akan menempel satu sama lain dan menempel di tepi layar, membuatnya terlihat sempit dan sulit dibaca.
        -Contoh: Saya membungkus setiap TextFormField (Nama Item, Harga, Deskripsi, dll.) di dalam Padding(padding: const EdgeInsets.all(8.0), ...). Ini menciptakan jarak yang rapi antar field input.

    - SingleChildScrollView: Kelebihannya adalah krusial untuk aksesibilitas. Saat keyboard virtual muncul di layar HP, layout yang statis akan tertutup keyboard. SingleChildScrollView membungkus seluruh form dan memungkinkan pengguna untuk men-scroll konten form tersebut.
        - Contoh: Seluruh widget Form di shoplist_form.dart saya bungkus dengan SingleChildScrollView agar semua field (terutama yang di bawah seperti "Is Featured" dan tombol "Save") tetap dapat diakses meskipun keyboard muncul.

    - ListView: (Meskipun tidak dipakai di form, tapi di list_item.dart). Kelebihannya adalah efisiensi memori. ListView.builder hanya me-render item yang terlihat di layar (lazy loading).
        - Contoh: Di list_item.dart, saya menggunakan ListView.builder untuk menampilkan daftar item. Jika ada ribuan item, aplikasi tidak akan lag karena tidak perlu me-render semuanya sekaligus.

4. Saya menyesuaikan warna tema agar konsisten dengan brand "Football Shop" (yang saya putuskan bertema Indigo) langsung di file main.dart.
Di dalam widget MaterialApp, saya mengatur properti theme menggunakan ThemeData().
    -Saya mengatur primarySwatch: Colors.indigo sebagai dasar palet warna.
    -Lebih spesifik lagi (menggunakan Material 3), saya mengatur colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, primary: Colors.indigo[900]).
    -Dengan mengatur seedColor ke Colors.indigo dan secara spesifik mengatur primary ke Colors.indigo[900] (warna indigo yang sangat gelap), Flutter secara otomatis menghasilkan palet warna yang serasi.
    -Hasilnya, semua widget bawaan Flutter yang menggunakan warna tema, seperti AppBar dan ElevatedButton, secara otomatis mengadopsi skema warna indigo ini tanpa saya harus mengaturnya satu per satu di setiap halaman.

                                TUGAS 9
------------------------------------------------------------------------

1. Membuat Dart Model, seperti ProductEntry, adalah langkah krusial dalam pertukaran data JSON antara Flutter dan Django. Tanpa model, kita hanya akan memetakan data ke tipe generik Map<String, dynamic>, yang memiliki konsekuensi serius. Konsekuensi utama adalah hilangnya Type Safety dan Null-Safety. Ketika mengakses data langsung dari Map, kita harus selalu melakukan pemeriksaan tipe dan null secara manual pada setiap kunci (key) (misalnya, memastikan 'price' adalah int), yang sangat rentan terhadap runtime error (aplikasi crash saat berjalan) jika backend mengirim tipe yang berbeda dari yang diharapkan. Selain itu, Maintainability kode menurun drastis karena setiap perubahan nama field JSON di Django harus diperbaiki secara manual di seluruh file Flutter yang mengakses data, tanpa bantuan dari Dart Analyzer yang seharusnya mendeteksi kesalahan tersebut. Dengan model, kita bisa mengakses properti dengan sintaks dot (product.name) dan mendapatkan autocompletion, yang meningkatkan kecepatan dan keamanan pengembangan.

2. Dalam tugas ini, package http berfungsi sebagai fondasi komunikasi jaringan, menangani tugas dasar seperti mengirim permintaan (request) HTTP (GET, POST) dan menerima respons (response) dari server. Sementara itu, CookieRequest (dari package pbp_django_auth) adalah wrapper cerdas yang dibangun di atas package http (atau yang setara) untuk menyediakan manajemen sesi dan cookie otomatis yang spesifik untuk Django. Perbedaan peran mendasar adalah: http hanya melakukan transfer data, sedangkan CookieRequest secara otomatis menyimpan cookie sesi (seperti sessionid) yang diterima dari endpoint login Django dan kemudian melampirkan cookie tersebut ke setiap permintaan berikutnya (GET data, POST form, logout). Mekanisme ini memastikan sesi pengguna tetap aktif dan terautentikasi tanpa perlu penanganan cookie manual.

3.Instance tunggal dari CookieRequest harus dibagikan ke seluruh komponen aplikasi Flutter (melalui Provider di lib/main.dart) karena instance ini bertindak sebagai penyimpanan status sesi terpusat. Setelah pengguna berhasil login, instance tersebut menyimpan cookie sesi yang menandakan bahwa pengguna terautentikasi. Semua widget yang perlu berinteraksi dengan backend yang dilindungi (misalnya ProductListPage untuk mengambil data produk atau ProductFormPage untuk membuat produk baru) harus menggunakan instance yang sama ini agar cookie sesi otomatis terlampir pada header permintaan. Dengan menggunakan Provider dan mengaksesnya melalui context.watch<CookieRequest>(), kita memastikan semua bagian aplikasi memiliki akses konsisten ke sesi yang sama tanpa perlu meneruskan objek secara manual (prop drilling). 

4. Agar aplikasi Flutter dapat berkomunikasi dengan backend Django pada lingkungan lokal, beberapa konfigurasi konektivitas sangat diperlukan. Pertama, dalam konfigurasi Django, ALLOWED_HOSTS harus mencakup 10.0.2.2 agar Android Emulator dapat mengakses host pengembangan lokal (yang dilihat emulator sebagai IP khusus ini), selain localhost untuk Flutter Web. Kedua, CORS (Cross-Origin Resource Sharing) harus diaktifkan di Django untuk mengizinkan permintaan dari domain dan port Flutter yang berbeda. Jika CORS tidak diaktifkan, permintaan akan diblokir oleh kebijakan Same-Origin Policy. Ketiga, pengaturan SameSite/cookie perlu disesuaikan (biasanya diatur ke SameSite=Lax atau None) untuk memastikan cookie sesi dikirim kembali oleh browser atau WebView di Flutter pada permintaan berikutnya. Terakhir, pada sisi Android, izin akses internet (android.permission.INTERNET) harus ditambahkan ke Android Manifest. Jika konfigurasi ini tidak dilakukan dengan benar, konsekuensinya adalah: permintaan jaringan akan gagal total (jika izin internet hilang), pengguna akan gagal login karena permintaan diblokir (jika CORS/ALLOWED_HOSTS salah), atau pengguna akan berhasil login tetapi langsung dianggap logout kembali pada permintaan berikutnya karena cookie sesi tidak terlampir (jika pengaturan SameSite salah).

5.Mekanisme pengiriman data (misalnya, membuat produk baru) dimulai di ProductFormPage, di mana data form diambil, divalidasi, dan kemudian dikonversi menjadi string JSON menggunakan jsonEncode. Data ini dikirim melalui CookieRequest.postJson() ke endpoint Django. Django menerima JSON tersebut, memvalidasi sesi pengguna, mengubah data menjadi model Django, dan menyimpannya di database. Respons sukses dikirim kembali ke Flutter, yang kemudian menampilkan SnackBar dan menavigasi ke MyHomePage. Sebaliknya, mekanisme pengambilan data (misalnya, menampilkan daftar produk) dimulai di ProductListPage di dalam widget FutureBuilder. Fungsi fetchProducts memanggil CookieRequest.get() ke endpoint JSON Django. Django merespons dengan array JSON berisi data produk. Di Flutter, data JSON tersebut diiterasi, dan untuk setiap objek, factory constructor ProductEntry.fromJson() digunakan untuk mengubahnya menjadi objek Dart yang aman tipe. Hasilnya, sebuah List<ProductEntry> diserahkan ke ListView.builder yang kemudian menampilkan data tersebut menggunakan widget ProductEntryCard.

6.Mekanisme autentikasi dimulai dari RegisterPage, di mana username dan dua password dikirim sebagai JSON melalui request.postJson() ke endpoint register Django. Django memproses pendaftaran, dan setelah sukses, Flutter menavigasi ke LoginPage. Di LoginPage, kredensial dikirim melalui request.login() ke endpoint login Django. Jika kredensial valid, Django menciptakan sesi dan mengirimkan cookie sesi dalam respons. CookieRequest secara otomatis menyimpan cookie sesi ini. Flutter memeriksa request.loggedIn dan jika berhasil, akan menavigasi pengguna ke MyHomePage, yang menandai selesainya proses autentikasi. Seluruh interaksi berikutnya akan menyertakan cookie sesi ini. Untuk Logout, pengguna menekan tombol Logout di MyHomePage (melalui ItemCard), yang memicu request.logout() ke endpoint logout Django. Django menghancurkan sesi di server, CookieRequest menghapus cookie yang disimpan, dan Flutter menavigasi kembali ke LoginPage.

7. Implementasi dimulai dengan konfigurasi dasar di lib/main.dart dengan menanamkan (injecting) instance tunggal CookieRequest menggunakan Provider, menjadikannya tersedia secara global. Langkah selanjutnya adalah pemodelan data dengan membuat Dart Model ProductEntry (lib/models/product_entry.dart) lengkap dengan factory constructor fromJson untuk Type Safety. Setelah model siap, implementasi otentikasi dilakukan: lib/screens/register.dart dan lib/screens/login.dart dibuat untuk menangani pengiriman kredensial melalui postJson dan login dari CookieRequest. Setelah login berhasil, navigasi ke lib/screens/menu.dart terjadi. Untuk fungsi data, lib/screens/product_form.dart dibuat, menggunakan request.postJson untuk mengirim data produk baru ke Django. Di sisi read, lib/screens/product_list.dart menggunakan FutureBuilder untuk memanggil request.get melalui fetchProducts, melakukan deserialisasi massal ke List<ProductEntry>, dan menampilkan hasilnya dengan widget ProductEntryCard. Terakhir, fungsi logout diimplementasikan dalam lib/widgets/products_card.dart menggunakan request.logout() dan kemudian menavigasi kembali ke LoginPage.
