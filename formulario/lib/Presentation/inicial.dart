import 'package:flutter/material.dart';

class inicial extends StatelessWidget {
  const inicial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          Text("Hola")
        ],
      ),
    ),
    );
  }
}
