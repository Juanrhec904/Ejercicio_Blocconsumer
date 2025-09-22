part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSucess extends HomeState {
  final String nombre;
  final String correo;
  final String password;

  const HomeSucess({
    required this.nombre,
    required this.correo,
    required this.password,
});
}

final class HomeLoading extends HomeState {}

final class HomeFailure extends HomeState {
  final String mensaje;
  const HomeFailure({
    required this.mensaje
  });
}

