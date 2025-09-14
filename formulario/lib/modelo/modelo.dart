class Usuario {
  final String? nombre;
  final String correo;
  final String password;

  const Usuario({
    this.nombre,
    required this.correo,
    required this.password,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombre: json["nombre"],
      correo: json["correo"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nombre": nombre,
      "correo": correo,
      "password": password,
    };
  }
}
