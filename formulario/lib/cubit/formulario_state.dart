part of 'formulario_cubit.dart';

sealed class FormularioState extends Equatable {
  const FormularioState();

  @override
  List<Object> get props => [];
}

final class FormularioInitial extends FormularioState {}

final class FormularioSucess extends FormularioState {
  final String nombre;
  final String correo;
  final String password;

  const FormularioSucess({
    required this.nombre,
    required this.correo,
    required this.password,
  });

  @override
  List<Object> get props => [nombre, correo, password];
}

final class FormularioLoading extends FormularioState {}

final class FormularioFailure extends FormularioState {
  final String mensaje;

  const FormularioFailure({required this.mensaje});

  @override
  List<Object> get props => [mensaje];
}
