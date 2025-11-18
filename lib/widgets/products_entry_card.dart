import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
          clipBehavior: Clip.antiAlias, // Menambahkan clip agar gambar tidak tumpah
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              if (product.thumbnail != null && product.thumbnail!.isNotEmpty) // Cek null juga
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                  child: Image.network(
                    // Anda bisa tetap menggunakan proxy jika diperlukan
                    'https://jonathan-hans41-footballshop.pbp.cs.ui.ac.id/proxy-image/?url=${Uri.encodeComponent(product.thumbnail!)}',
                    height: 180, // Sedikit lebih tinggi
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 180,
                      color: Colors.grey[300],
                      child: const Center(
                          child: Icon(Icons.broken_image,
                              color: Colors.white, size: 50)),
                    ),
                  ),
                ),

              // Konten Teks di dalam Padding
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title (Menggunakan product.name)
                    Text(
                      product.name, //
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),

                    // Harga
                    Text(
                      'Rp ${product.price}', // Menampilkan harga
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Brand
                    Text(
                      'Brand: ${product.brand}', // Menampilkan brand
                      style: const TextStyle(
                          fontSize: 14.0, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 6),

                    // Kategori
                    Text('Kategori: ${product.category}'),
                    const SizedBox(height: 10),

                    // Deskripsi (Menggunakan product.description)
                    Text(
                      product.description,
                      maxLines: 3, // Izinkan 3 baris
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 12),

                    // Baris untuk info tambahan (Hanya menyisakan Featured)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Featured indicator
                        if (product.isFeatured)
                          Chip(
                            label: const Text('Unggulan', style: TextStyle(fontSize: 12)),
                            backgroundColor: Colors.amber[100],
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            visualDensity: VisualDensity.compact,
                          ),
                      ],
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