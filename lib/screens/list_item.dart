// football_shop/lib/screens/list_item.dart
import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';
// 1. Import halaman detail yang baru
import 'package:football_shop/screens/item_detail_page.dart'; 

// --- Definisi Class Item dan List Item ---
class Item {
  final String name;
  final int price;
  final String description;
  final String category;
  final String thumbnail;
  final bool isFeatured;

  Item({
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.isFeatured,
  });
}

// Variabel global untuk menyimpan daftar item
List<Item> itemList = [];
// ----------------------------------------

class ItemListPage extends StatelessWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          final item = itemList[index];
          
          // 2. Bungkus Card dengan InkWell
          return InkWell(
            // 3. Tambahkan aksi onTap untuk navigasi
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // Kirim data 'item' ke halaman detail
                  builder: (context) => ItemDetailPage(item: item),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.thumbnail.isNotEmpty)
                    Image.network(
                      item.thumbnail,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: const Icon(Icons.broken_image, color: Colors.grey, size: 50),
                        );
                      },
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (item.isFeatured)
                              Chip(
                                label: const Text('Featured'),
                                backgroundColor: Colors.amber[700],
                                labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Harga: Rp ${item.price}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green[800],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Kategori: ${item.category}',
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Tampilkan deskripsi (dipotong pendek)
                        Text(
                          item.description,
                          maxLines: 2, // Batasi deskripsi jadi 2 baris
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}