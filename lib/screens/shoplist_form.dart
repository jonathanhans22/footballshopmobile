// football_shop/lib/screens/shoplist_form.dart
import 'package:flutter/material.dart';
import 'package:football_shop/screens/list_item.dart'; // Import list_item.dart
import 'package:football_shop/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Variabel untuk 3 field wajib
  String _name = "";
  int _price = 0;
  String _description = "";

  // Variabel untuk 3 field tambahan (dari Django/football_news)
  String _category = "Jersey"; // Default
  String _thumbnail = "";
  bool _isFeatured = false; // Default

  // Daftar kategori untuk dropdown (sesuaikan dengan shop Anda)
  final List<String> _categories = [
    "Jersey",
    "Sepatu",
    "Bola",
    "Aksesoris",
    "Lainnya",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Tambah Item'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Input Wajib ---
              // Input Nama Item
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Item",
                    labelText: "Nama Item",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Input Harga
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              // Input Deskripsi
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  maxLines: 3, // Perbanyak baris untuk deskripsi
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // --- Input Tambahan (dari football_news) ---

              // === Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map(
                        (cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail (opsional)",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                  // Validator opsional, jadi tidak perlu
                ),
              ),

              // === Is Featured ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Item Unggulan"),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                  tileColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.grey[300]!)
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Spasi sebelum tombol

              // Tombol Save
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo[900]),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Tambahkan item baru ke list global
                        itemList.add(Item(
                          name: _name,
                          price: _price,
                          description: _description,
                          // Masukkan data baru
                          category: _category,
                          thumbnail: _thumbnail,
                          isFeatured: _isFeatured,
                        ));
                        
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text("Item berhasil disimpan!"),
                            ),
                          );
                        
                        // Reset form ke nilai awal
                        _formKey.currentState!.reset();
                        setState(() {
                          _category = "Jersey";
                          _isFeatured = false;
                          _thumbnail = ""; // Pastikan thumbnail juga ke-reset
                        });
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}