import 'package:flutter/material.dart';

class failure extends StatelessWidget {
  final String mensaje;

  const failure({super.key, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        mensaje,
        style: const TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }
}
