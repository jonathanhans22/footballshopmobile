// football_shop/lib/screens/menu.dart
import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/widgets/shop_card.dart'; // Ini sudah benar

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // --- BAGIAN INI DIKEMBALIKAN SEPERTI ASLINYA ---
  // (Sama seperti di football_news)
  final String nama = "Jonathan Hans Emanuelle"; // Ganti dengan nama Anda
  final String npm = "2406414025"; // Ganti dengan NPM Anda
  final String kelas = "B"; // Ganti dengan kelas Anda
  // -------------------------------------------

  // Item menu disesuaikan untuk shop (ini sudah benar)
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.red[700]!),      // Merah
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.amber[700]!), // Kuning (Amber lebih cocok untuk background)
    ShopItem("Logout", Icons.logout, Colors.green[700]!),        // Ijo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Shop'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView( // Pakai SingleChildScrollView agar muat
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Samakan padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              // --- ROW INFOCARD DIKEMBALIKAN ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: nama),
                  InfoCard(title: 'Class', content: kelas),
                ],
              ),
              const SizedBox(height: 16.0),
              // ---------------------------------

              // Teks "Selamat Datang"
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Selamat Datang di Football Shop!', // Ubah teksnya
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18, // Samakan style
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // GridView (ini sudah benar)
                    GridView.count(
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ShopItem item) {
                        return ShopCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- CLASS INFOCARD DIKEMBALIKAN ---
// (Copy-paste dari football_news/screens/menu.dart)
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width:
            MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}