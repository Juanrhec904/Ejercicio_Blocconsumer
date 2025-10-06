import 'package:flutter/material.dart';
import 'presentation/inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login con Bloc & Cubit',
      home: Inicial(),
    );
  }
}
