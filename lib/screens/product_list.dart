// lib/screens/product_list.dart
import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart'; // DIUBAH
import 'package:football_shop/widgets/left_drawer.dart'; // DIUBAH
import 'package:football_shop/screens/product_detail.dart'; // DIUBAH
import 'package:football_shop/widgets/products_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// Ganti nama kelas
class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // Ganti nama fungsi dan tipe kembalian
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    // Ganti URL API
    final response = await request.get('http://localhost:8000/product-json/');
    
    var data = response;
    
    // Ganti nama list dan model
    List<ProductEntry> listProducts = [];
    for (var d in data) {
      if (d != null) {
        listProducts.add(ProductEntry.fromJson(d));
      }
    }
    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'), // Diubah
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request), // Ganti nama fungsi
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no products in the shop yet.', // Diubah
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard( // Ganti nama widget
                  product: snapshot.data![index], // Ganti nama variabel
                  onTap: () {
                    // Navigate to product detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // Ganti nama detail page dan variabel
                        builder: (context) => ProductDetailPage(product: snapshot.data![index]),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}