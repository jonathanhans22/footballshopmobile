// lib/main.dart
import 'package:flutter/material.dart';
import 'package:football_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Football Shop App',
        theme: ThemeData(
          // Menggunakan skema warna yang lebih modern dan berani
          colorScheme: ColorScheme.fromSwatch(
            // Warna utama (AppBar, Button)
            primarySwatch: Colors.indigo, 
          ).copyWith(
            // Warna aksen (Aksen pada button, dll)
            secondary: Colors.amber, 
            primary: Colors.indigo.shade800, // Menetapkan primary color lebih spesifik
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigo.shade800, // AppBar berwarna solid
            foregroundColor: Colors.white,
            elevation: 4, // Memberi sedikit bayangan
          ),
          // Baris cardTheme dihapus untuk mengatasi error kompilasi
        ),
      home: const LoginPage(),
      ),
    );
  }
}