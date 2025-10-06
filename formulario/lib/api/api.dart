import 'package:dio/dio.dart';
import '../modelo/modelo.dart';

class DioApi {
  final Dio _dio = Dio();

  Future<List<Usuario>> fetchUsuarios() async {
    try {
      final response = await _dio.get(
        "https://mocki.io/v1/3f6f8977-a93b-48c1-b50a-1abe8e337e52",
      );

      final data = response.data as List<dynamic>;
      return data.map((json) => Usuario.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception("Error en GET: ${e.message}");
    }
  }

  Future<Usuario> createUsuario(Usuario usuario) async {
    try {
      final response = await _dio.post(
        "https://jsonplaceholder.typicode.com/posts",
        data: usuario.toJson(),
      );

      return Usuario.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Error en POST: ${e.message}");
    }
  }
}
