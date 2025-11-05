// football_shop/lib/widgets/left_drawer.dart
import 'package:flutter/material.dart';
import 'package:football_shop/screens/list_item.dart'; // Import halaman list item
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF1A237E), // Dark Indigo
            ),
            child: Column(
              children: [
                Text(
                  'Football Shop', // Judul diubah
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catat semua kebutuhan bolamu di sini!", // Deskripsi diubah
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopFormPage(),
                ),
              );
            },
          ),
          ListTile( // Link untuk "Lihat Item"
            leading: const Icon(Icons.checklist),
            title: const Text('Lihat Item'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemListPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}