class Usuario {
  final String correo;
  final String password;
  final String? nombre;

  const Usuario({
    required this.correo,
    required this.password,
    this.nombre,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      correo: json['email'] ?? '',
      password: json['password'] ?? '',
      nombre: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'correo': correo,
        'password': password,
        'nombre': nombre,
      };
}
