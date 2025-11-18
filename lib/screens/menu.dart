// lib/screens/menu.dart (DIUBAH)
import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart'; // DIUBAH
import 'package:football_shop/widgets/products_card.dart'; // DIUBAH

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Jonathan Hans Emanuelle";
  final String npm = "2406414025";
  final String kelas = "B";

  final List<ItemHomepage> items = [
    ItemHomepage("See Products", Icons.store),
    ItemHomepage("Add Product", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Football Shop', 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Menggunakan warna dari tema global
      ),
      drawer: LeftDrawer(),
      body: SingleChildScrollView( // Menggunakan SingleChildScrollView agar tidak overflow
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Info Card yang Lebih Menarik (Menggantikan 3 InfoCard terpisah) ---
            Card(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat datang di Football Shop, ${nama}!', // Menggabungkan welcome message
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const Divider(color: Colors.white54),
                    const SizedBox(height: 8.0),
                    _buildInfoRow(title: 'NPM', content: npm, color: Colors.white),
                    _buildInfoRow(title: 'Nama', content: nama, color: Colors.white),
                    _buildInfoRow(title: 'Kelas', content: kelas, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            
            // --- Grid Menu Utama ---
            Text(
              'Main Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12.0),
            GridView.count(
              primary: false, // Diubah menjadi false karena berada dalam SingleChildScrollView
              padding: const EdgeInsets.all(0),
              crossAxisSpacing: 16, // Jarak antar kolom
              mainAxisSpacing: 16, // Jarak antar baris
              crossAxisCount: 2, // Menggunakan 2 kolom untuk tampilan yang lebih besar
              childAspectRatio: 1.5, // Rasio aspek kartu diperbesar
              shrinkWrap: true,
              children: items.map((ItemHomepage item) {
                return ItemCard(item);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function untuk baris info
  Widget _buildInfoRow({required String title, required String content, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: TextStyle(fontWeight: FontWeight.w600, color: color.withOpacity(0.8)),
          ),
          Text(
            content,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}

// Hapus kelas InfoCard karena fungsinya digantikan oleh _buildInfoRow di dalam Card utama.
/*
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) { ... }
}
*/