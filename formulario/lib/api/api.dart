import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelo/modelo.dart';

class UsuarioApi {
  final String baseUrl =
      "https://mocki.io/v1/fe1d41aa-6036-4079-8821-e889a6f90f12";

  Future<List<Usuario>> fetchUsuarios() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception("Error al cargar usuarios: ${response.statusCode}");
    }
  }
}

