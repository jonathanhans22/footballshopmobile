// football_shop/lib/screens/item_detail_page.dart
import 'package:flutter/material.dart';
import 'package:football_shop/screens/list_item.dart'; // Untuk mengakses class Item

class ItemDetailPage extends StatelessWidget {
  final Item item;

  // Constructor untuk menerima data item yang di-klik
  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Judul AppBar adalah nama item
        title: Text(item.name),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan thumbnail jika ada
            if (item.thumbnail.isNotEmpty)
              Image.network(
                item.thumbnail,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image, color: Colors.grey, size: 60),
                  );
                },
              ),
            
            // Padding untuk semua konten teks
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Item
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Badge "Featured"
                  if (item.isFeatured)
                    Chip(
                      label: const Text('Featured Item'),
                      backgroundColor: Colors.amber[700],
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  const SizedBox(height: 12),

                  // Harga
                  Text(
                    'Rp ${item.price}',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Kategori
                  Text(
                    'Kategori: ${item.category}',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[700],
                    ),
                  ),
                  
                  // Garis pemisah
                  const Divider(height: 32),

                  // Deskripsi
                  const Text(
                    'Deskripsi:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}