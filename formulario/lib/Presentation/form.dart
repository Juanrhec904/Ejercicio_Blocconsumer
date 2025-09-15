import 'package:flutter/material.dart';

class form extends StatelessWidget {
  const form({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Bienvenido"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 113, 167, 236),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "https://media.istockphoto.com/id/1186972461/es/foto/coche-blanco-gen%C3%A9rico-aislado-sobre-fondo-blanco.jpg?s=612x612&w=0&k=20&c=hQgzsapAkGEo8gAmoTci9Ce6My3zsQQD8lST6C23yEY=",
            height: 240,
            fit: BoxFit.cover,
          ),
          Text("Buen dia"),
          Text("Espero y esten bien"),
          Text("Mucha suerte"),
        ],
      ),
    );
  }
}
