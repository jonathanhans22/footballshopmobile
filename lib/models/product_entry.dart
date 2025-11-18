// lib/models/product_entry.dart
// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';
import 'package:uuid/uuid.dart';

// Ganti ProductEntry dengan nama kelas yang sesuai jika Anda ingin lebih jelas, tapi 
// saya akan mempertahankan ProductEntry agar konsisten dengan output sebelumnya
// dan model Django Anda.

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    int? userId;
    String name;
    int price; // Ditambahkan
    String description;
    String? thumbnail;
    String category;
    bool isFeatured;
    String brand; // Ditambahkan

    ProductEntry({
        required this.id,
        this.userId,
        required this.name,
        required this.price, // Ditambahkan
        required this.description,
        this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.brand, // Ditambahkan
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"] is String ? json["id"] : Uuid().v4(),
        userId: json["user_id"] , 
        name: json["name"] ?? "",
        price: json["price"] ?? 0, // Ditambahkan
        description: json["description"] ?? "",
        thumbnail: json["thumbnail"] ?? "", 
        category: json["category"] ?? "",
        isFeatured: json["is_featured"] ?? false,
        brand: json["brand"] ?? "", // Ditambahkan
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "price": price, // Ditambahkan
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "brand": brand, // Ditambahkan
    };
}