part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class CorreoNuevo extends HomeEvent {
  final String correo;
  const CorreoNuevo(this.correo);
  @override
  List<Object?> get props => [correo];
}

class PasswordChanged extends HomeEvent {
  final String password;
  const PasswordChanged(this.password);
  @override
  List<Object?> get props => [password];
}

class InicioSession extends HomeEvent {
  final String nombre;
  final String correo;
  final String password;

  const InicioSession({
    required this.nombre,
    required this.correo,
    required this.password,
  });

  @override
  List<Object?> get props => [nombre, correo, password];
}
