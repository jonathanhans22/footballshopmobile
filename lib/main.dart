// football_shop/lib/main.dart
import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop', // Modifikasi title
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo[900],
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(), // Mengarah ke menu
    );
  }
}