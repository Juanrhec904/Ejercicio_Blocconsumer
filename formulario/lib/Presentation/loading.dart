import 'package:flutter/material.dart';

class loading extends StatelessWidget {
  const loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Cargando...",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 12),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
