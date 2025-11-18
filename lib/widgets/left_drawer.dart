// lib/widgets/left_drawer.dart (DIUBAH)
import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart'; // DIUBAH
import 'package:football_shop/screens/product_form.dart'; // DIUBAH
import 'package:football_shop/screens/product_list.dart'; // DIUBAH

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Hapus padding default
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary, // Menggunakan warna Primary
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FOOTBALL SHOP', // Diubah
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                Text(
                  "Kelola dan Lihat Produk Terbaik!", // Diubah
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          // --- Menu Home ---
          ListTile(
            leading: const Icon(Icons.dashboard_outlined), // Ganti ikon
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          // --- Menu Tambah Produk ---
          ListTile(
            leading: const Icon(Icons.add_shopping_cart), // Ganti ikon dan teks
            title: const Text('Add Product'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductFormPage(),
                  ));
            },
          ),
          // --- Menu Daftar Produk ---
          ListTile(
              leading: const Icon(Icons.list_alt), // Ganti ikon dan teks
              title: const Text('Product List'),
              onTap: () {
                  Navigator.pushReplacement( // Menggunakan pushReplacement untuk navigasi drawer yang lebih bersih
                      context,
                      MaterialPageRoute(builder: (context) => const ProductListPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}